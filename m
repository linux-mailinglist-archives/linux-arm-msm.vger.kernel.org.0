Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327BA3BE006
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 02:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhGGAGq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 20:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbhGGAGp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 20:06:45 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049B1C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 17:04:04 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id r29so1292935oiw.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 17:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1QTMHZDG9z+9+a8d5/AfP7uPs1EiMiVpp8sGhsHTNoY=;
        b=m1pcqVwB/6zxB35/St9BKzT/p8IRKleGxIAPt6tceii537fbNK0DndNrcKAK0HqHge
         /UbpBwExHiQ4Ly+Nma++Dc4agFiIw8s13awncdLFTf9ZSQs3Ilh+HDL0N4e1syHN9g+A
         TBqbojRFBqNNmYYgtx/UEiOtTev36GG6ytX/ZuehLMOybuD3XyO7KPbfDaKOHxvWGcYF
         YnZFMe3lgb6Dq+nAP1dfXhdSUC1eQxHQ0j0wBFbFiupxfSlJL6ftRCv6jvVk7i0IofbV
         nJ8ioftdZenOZTE0odKmBIJsvH0JJhts5j+o/wz43Inbrwu57pT6n/+oroP7BYJKcnjY
         QD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1QTMHZDG9z+9+a8d5/AfP7uPs1EiMiVpp8sGhsHTNoY=;
        b=trV6mjZ9MJPWUlkFEIkSypMI8JMVfbveCfOQK0b3kS6EKrzZFIx1aXyynGb5rQiJMp
         WLmgngU8u1Zqb/5qWppDte/zUN8l4WhdCh08Trmenyp4ply79DXJkSu8dfmA85Q3DRA9
         dhPSdRKYHCnV8VvMSiaf3SBXiPaeY7ue6p6cFehnyJzeTRuSU9ObhwmMVArllvZ4WBYy
         v3VrFc20mc6/6TS7ebJjjV0kOMlhSb8QG60IC03e27dYd8sdBQQmRouA3j6jiDFRx4sb
         CcYSCgUEoMWVd9o4ury/SscH3WfXfdnNAGiEuYkoWi4h30wGm8XrwzIjRw9QSQsjL2aO
         k/gQ==
X-Gm-Message-State: AOAM532y9x2Jf6w4/0HagnHzM0He6ABhCNLTGJtQgeyKdsS1WsHu3RUg
        jNgw2uUwZrpbOfnPLXDAXh6Xaw==
X-Google-Smtp-Source: ABdhPJz5BCFxlQfyRd5TUhJNKqRc1UObZwT13vLp0PKy1hkPOwACX8uJmd6kqFepUGFgm5pYH7UQWg==
X-Received: by 2002:aca:b906:: with SMTP id j6mr2635239oif.40.1625616244024;
        Tue, 06 Jul 2021 17:04:04 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v203sm3809295oib.37.2021.07.06.17.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 17:04:03 -0700 (PDT)
Date:   Tue, 6 Jul 2021 19:04:01 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     vkoul@kernel.org, kishon@ti.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        robh+dt@kernel.org, jonathan@marek.ca,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: fix usb2 qmp phy node
Message-ID: <YOTvcWnHFkbMHg6K@yoga>
References: <20210706230702.299047-1-bryan.odonoghue@linaro.org>
 <20210706230702.299047-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706230702.299047-2-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 06 Jul 18:07 CDT 2021, Bryan O'Donoghue wrote:

> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Use 'lanes' as SuperSpeed lanes device node instead of just 'lane' to
> fix issues with TypeC support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: be0624b99042 ("arm64: dts: qcom: sm8250: Add USB and PHY device nodes")
> Cc: robh+dt@kernel.org
> Cc: devicetree@vger.kernel.org
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 4c0de12aaba6..270d7ff59ec1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2123,7 +2123,7 @@ usb_2_qmpphy: phy@88eb000 {
>  				 <&gcc GCC_USB3_PHY_SEC_BCR>;
>  			reset-names = "phy", "common";
>  
> -			usb_2_ssphy: lane@88eb200 {
> +			usb_2_ssphy: lanes@88eb200 {

The uni-phy binding says that this should be named "^phy@[0-9a-f]+$"

So while Dmitry is right about the logic in the driver, it would be nice
if you would spin this patch to make us pass the dt-binding check -
which can be sent independently from the driver patch.

Regards,
Bjorn

>  				reg = <0 0x088eb200 0 0x200>,
>  				      <0 0x088eb400 0 0x200>,
>  				      <0 0x088eb800 0 0x800>;
> -- 
> 2.30.1
> 
