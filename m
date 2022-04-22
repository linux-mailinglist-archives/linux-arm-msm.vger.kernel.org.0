Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5BBB50BDDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 19:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346624AbiDVRI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 13:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377782AbiDVRIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 13:08:25 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F6978FC4
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 10:05:30 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id h12so8495582plf.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w5Fh61tvMI9u3EP1h/xxxSiqzyNcEuilOSuCPwJLpv4=;
        b=L7NN759twCDLbvEjspSxjhn+bTpAGvk9JbCNA6/+w/LOL4u9oYeRR1Cj1oEmqIVwBX
         +wMeWY/CJ39NQBHuSDF0KY1rVyYBnG5EQg8grBxD5LRqSLkrCDoqrAqOrMFzfarbMOKB
         efcDKjChCO/J0dlaLxVRSQzzTJgVjkwZkI4mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w5Fh61tvMI9u3EP1h/xxxSiqzyNcEuilOSuCPwJLpv4=;
        b=hspsLyJffsWmdUWp2ADykim3p7uWrxx6ZeUflG21THtiUVEApJJ0Lr56iEF8YQ4Kq8
         B8r9MSeF8J24heDgFFZSDZpGstMfF0eyPpuLZgzN4C/rz620S4AyTK/BJCPFikTBJqgG
         EqQ36rGgFbju6mNZtJwBMYs3ojhTMX5XLeDifkPojApxDYJKasXz44roFiPuUCMNtJ2H
         sw8GDYmlkvJvtDfauXxJAC9YkVkGC5s/qEbp/uhNvUyJ72aXVbevpG8H3AFFyEOUcH1e
         m4H9Z+GDRn0PrWZol3lby3GEACd0Z9DwBe57cmlrbGh3CAEiDSU+fWseWs8PSnwzwjKe
         OsUw==
X-Gm-Message-State: AOAM532mBHovhFVkXWTmjUKjVqdf6BC7/4tCgLd2mnSRfQQxue6+1oMb
        CkwBsK8w0xMB8oj3czyem0IKlA==
X-Google-Smtp-Source: ABdhPJwCztp9V8GVGJ09fmOY5Z3kg5VnisfuUiFpB1LNNzVLwAB6pP5WRtsauFK2kDh8h5gT9UJHFA==
X-Received: by 2002:a17:902:ccd0:b0:156:7ac2:5600 with SMTP id z16-20020a170902ccd000b001567ac25600mr5678780ple.156.1650647129217;
        Fri, 22 Apr 2022 10:05:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:404c:8721:29:87a4])
        by smtp.gmail.com with UTF8SMTPSA id m2-20020a62a202000000b0050ce7925e1esm3146631pff.35.2022.04.22.10.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 10:05:28 -0700 (PDT)
Date:   Fri, 22 Apr 2022 10:05:25 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v10 12/12] arm64: dts: qcom: sc7280: Add sound node for
 CRD 3.0/3.1
Message-ID: <YmLgVVYwJx9nBj8l@google.com>
References: <1650636521-18442-1-git-send-email-quic_srivasam@quicinc.com>
 <1650636521-18442-13-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1650636521-18442-13-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 22, 2022 at 07:38:41PM +0530, Srinivasa Rao Mandadapu wrote:
> Add dt nodes for sound card support on rev5+ (aka CRD 3.0/3.1) boards,
> which is using WCD9385 headset playback, capture, I2S speaker playback
> and DMICs via VA macro.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
