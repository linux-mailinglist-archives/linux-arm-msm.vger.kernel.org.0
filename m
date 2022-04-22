Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81A4050BD71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 18:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357337AbiDVQuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 12:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449800AbiDVQuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 12:50:13 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9646F5F265
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:47:19 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id q1so10878382plx.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OYEVFrlT/k9t0ahx3pena+htPCecBG4OD2WL+8PH4vA=;
        b=LGzlNTNvx2OwBFcfWsdMXpYEtZv90514y0GasQqmRZ3mXfMz1+bfPZ5zLO4DjoGyL6
         LlCdQ3hYHaiILDtEUv5wyPzSGUNqRlS/PFprHxPhE4OSG7hTqu0yAhQdxjDDgL6aWQ9I
         ND22tc3QD5NMiKENNAYCIMDJ08aQgOATUSs/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OYEVFrlT/k9t0ahx3pena+htPCecBG4OD2WL+8PH4vA=;
        b=m8yHDuRThKhT8ck+MzMKZQttJSrgb/6dly58RoEQrE2cnngtYVDHEdZOXP0A8nSWUH
         DbhXCwlPVv3ldV6tG7RXhyQoXSKXNSSe8wj+RmLf3QZiCGjIOJ8wBsnBfUcC/JxhAfJc
         dNHVxlViiBHhWK0WuxGyFH4jc5JcvtaG8yR2t1k/OtxTnK0ZYOlLAFgej/ZWBTJ0DloC
         hAyRYBb7QL4xzQDWD7kI5mZAFj3BxakD4ZEGGY8wztwY/4Fbodxcs+G18kcjL8NLB5h/
         NRFYyYSBnqNDiFtCOE76F5W3mOYjPxF6eciu2/LoHrjabNlOp//nKzO6y/U0bLRJYEAl
         TkjQ==
X-Gm-Message-State: AOAM532b7pIpFWt5y9rz0eTH/Nq09B5oPMbn5tapftOMQXE9usFYKe2O
        /zjUnYp+CrphbMHiWDGhpr0JWg==
X-Google-Smtp-Source: ABdhPJzRNRQZ7AWqKiPmhr447C6OtgV5HnUzkmC/YxkjgiU/XFAEZz/Pfwt/uG2lMkTqkJSfYo8rGQ==
X-Received: by 2002:a17:902:f612:b0:14c:e978:f99e with SMTP id n18-20020a170902f61200b0014ce978f99emr5486406plg.23.1650646039080;
        Fri, 22 Apr 2022 09:47:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:404c:8721:29:87a4])
        by smtp.gmail.com with UTF8SMTPSA id w7-20020a636207000000b003aad7948f0dsm1120770pgb.0.2022.04.22.09.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 09:47:18 -0700 (PDT)
Date:   Fri, 22 Apr 2022 09:47:16 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v10 03/12] arm64: dts: qcom: sc7280: Enable digital
 codecs and soundwire for CRD 3.0/3.1
Message-ID: <YmLcFH5DllqQ5aZ7@google.com>
References: <1650636521-18442-1-git-send-email-quic_srivasam@quicinc.com>
 <1650636521-18442-4-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1650636521-18442-4-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 22, 2022 at 07:38:32PM +0530, Srinivasa Rao Mandadapu wrote:
> Enable rx, tx and va macro codecs and soundwire nodes for
> CRD rev5+ (aka CRD 3.0/3.1) boards.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
