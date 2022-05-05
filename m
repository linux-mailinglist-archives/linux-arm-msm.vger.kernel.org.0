Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1885151CB78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 23:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245689AbiEEVnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 17:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377954AbiEEVnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 17:43:22 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E17918355
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 14:39:41 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q76so4583689pgq.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dmqI2ALgZ3kvDiEew8IgLAO4SlOTFjh2EiR4gGFw+iA=;
        b=PXHGbjdmVPvJFYthUJPH6VeHG2X/Y6BayuqvbTguvZzT0ZcujtcEWgaNwowbnJFL+0
         5/PDg32n9aK0mkVWM8uokjy4pCAshHkPVj07rbL4Rj0xwUSX9zTZtSRQvJkb6xzSumnN
         ciIHRzbIy/vvRfc10460Ruq/xqHqdtEBnrmIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dmqI2ALgZ3kvDiEew8IgLAO4SlOTFjh2EiR4gGFw+iA=;
        b=Te9aR21V7nrVozmcSZYlgCDIlRGX76GcR7U2R5+Io55Oe7YCXRDqFIWolQw9Qp3OT0
         kxumZlcCdq78GIvxLWqfGbl8PuckxPzEsDNys3NDnPb/XVeOAFlA0lzr7B0Vm6V66x0B
         lGVSx2nzXCEhpFi5/pZhaKKEyN/8XNHdF8GrDluhN/p0AB/Hlc3QO1MZ2EBji93lkwNS
         PW/LXLVmCMIgFl06twkk+NFhnOyF3Oq+jvdzDzLYcWtbQ6WfTgmOXLE/BhNfb7iCSWnw
         vRRHnoAuNdvv+b7DVsnDD+owST+hBEsEN/Z/5v95L6OG2idFnq9jZbPg0YEQ3oyqRTMJ
         0AwA==
X-Gm-Message-State: AOAM530s81yjPqDj/Cy7bkbK9p4h2GAWjS1MhJLSVBKfokTqcSaQ5ask
        ATuPBDb5JaIBe7CnMKvEfJqMUg==
X-Google-Smtp-Source: ABdhPJy1heYv21j6+zVS1d13Syq3/PhlTZCCTT4PeYPM7I/zvpaeGDy0W2UiLAMntKXMYYEGUDHFHg==
X-Received: by 2002:a63:a512:0:b0:3c6:d89:1021 with SMTP id n18-20020a63a512000000b003c60d891021mr123296pgf.126.1651786781128;
        Thu, 05 May 2022 14:39:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:827b:7f14:bb7e:2898])
        by smtp.gmail.com with UTF8SMTPSA id q13-20020a170902dacd00b0015e8d4eb214sm107873plx.94.2022.05.05.14.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 14:39:40 -0700 (PDT)
Date:   Thu, 5 May 2022 14:39:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v14 4/4] arm64: dts: qcom: sc7280-herobrine: Add lpi
 pinmux properties for CRD 3.0/3.1
Message-ID: <YnREG4Ej1SNnj757@google.com>
References: <1651763004-32533-1-git-send-email-quic_srivasam@quicinc.com>
 <1651763004-32533-5-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1651763004-32533-5-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 05, 2022 at 08:33:24PM +0530, Srinivasa Rao Mandadapu wrote:
> Add LPASS LPI pinctrl properties, which are required for Audio
> functionality on herobrine based platforms of rev5+
> (aka CRD 3.0/3.1) boards.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
