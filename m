Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D0A2C315C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 20:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgKXTtJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 14:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgKXTtI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 14:49:08 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECCCC0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 11:49:08 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id n12so17010976otk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 11:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TXr8f8KOoI62ZBAydM3E3l/NgJex/Hfj9ohTottMWUE=;
        b=RMgHV+/3+RvR2X+FQ9eY0QVuyCd0SZFtcmLoT61HRvOKcvx2GyQNn7aFeGe3D4lzHm
         Tjpn1qJEcr4Zb4hWR9xbZgn33DgzHBqZrP7fMEeu49Hw3ErYmQk79Yz5dqFqCVZkiNLM
         69DiHFhCeOwTDjGDzVoWrIf9kMcdXRugVjOI54CL3TRfEF3HccG2Bzn1DJD6qVdqXir8
         syy5Ae4BaEJfJz2asOlxFR6F7A5H89LVqNy0hKStOscU8bBFVzRMioQj4iKrc/91jJ4M
         HsQnjP0erBfRWPXRw86dFVO0+HHaA/LlYuibgJoRaqhBq5jeBVnwFpGX6w8Jc1e+Q74I
         hO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TXr8f8KOoI62ZBAydM3E3l/NgJex/Hfj9ohTottMWUE=;
        b=DrOoFPx9twE0ZIvuLpA+n2J8gS67nzj/rEs88l426miptxD/ixgRoTKyDKEbI9nKoW
         r2gNODmk96l0YcwBsLyEDsyvYjeI5+N0rGRrVMagkErw2cFVlFJYnQAKMfS7AOaY9rcD
         4SquGAW5fsrXTJBCKYOWMbt4IDsg4AjL+Hlugzz1mHHD0RhSw6C0UTJTMxKyS8Wb4lhw
         99GeufkHzZk+q5DiNtzKz21d2K4VnIdb4zH3cxcNsn6SXJjvU1ZMarnejYE0zh1ZRbBM
         Ap1FhennSmfAggnbfF85dCgAqTcCsg5QaMBjw4umgMMce/5hiOjGOtMU0l1QXK15u7aM
         dI6A==
X-Gm-Message-State: AOAM532ZO+iFDQ2+8V9GYQjs+wWlt0CB/258EuhBNXwY1edFEFaE+5zh
        kmoyFVmX7v0mD9o0lVlPnJ9O6Iky41KvdA==
X-Google-Smtp-Source: ABdhPJyusGtfRjGJ4lcgyE01H/iy94nD3Y2WEPej9FMsoX7HL5KvNUPdRwY0jP1hVYoc4m3+kyf26Q==
X-Received: by 2002:a9d:171a:: with SMTP id i26mr113338ota.313.1606247346186;
        Tue, 24 Nov 2020 11:49:06 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t199sm40519oif.25.2020.11.24.11.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:49:05 -0800 (PST)
Date:   Tue, 24 Nov 2020 13:49:03 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@ieee.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Alex Elder <elder@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Limit ipa iommu streams
Message-ID: <20201124194903.GH185852@builder.lan>
References: <20201123052305.157686-1-bjorn.andersson@linaro.org>
 <ecf7f5b6-a5ba-e370-d716-89272ad3c67b@ieee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecf7f5b6-a5ba-e370-d716-89272ad3c67b@ieee.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 24 Nov 13:18 CST 2020, Alex Elder wrote:

> On 11/22/20 11:23 PM, Bjorn Andersson wrote:
> > The Android and Windows firmware does not accept the use of 3 as a mask
> > to cover the IPA streams. But with 0x721 being related to WiFi and 0x723
> > being unsed the mapping can be reduced to just cover 0x720 and 0x722,
> > which is accepted.
> 
> Do you want to update sc7180.dtsi too?
> 

We probably want that too, but currently we don't have any sc7180
devices that shows this problem...

> I tried your change on my SDM845 machine and observed no
> problem.   I tried the comparable change in "sc7180.dtsi"
> (using 440 and 442) and that seemed to work as before also.
> 
> If you think that's sufficient, you can add:
> 
> Tested-by: Alex Elder <elder@linaro.org>
> 
> Otherwise:
> 
> Acked-by: Alex Elder <elder@linaro.org>
> 

Thank you,
Bjorn

> 
> > Fixes: e9e89c45bfeb ("arm64: dts: sdm845: add IPA iommus property")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 0da27b065761..a6147bd54cdf 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -2136,7 +2136,8 @@ ufs_mem_phy_lanes: lanes@1d87400 {
> >   		ipa: ipa@1e40000 {
> >   			compatible = "qcom,sdm845-ipa";
> > -			iommus = <&apps_smmu 0x720 0x3>;
> > +			iommus = <&apps_smmu 0x720 0x0>,
> > +				 <&apps_smmu 0x722 0x0>;
> >   			reg = <0 0x1e40000 0 0x7000>,
> >   			      <0 0x1e47000 0 0x2000>,
> >   			      <0 0x1e04000 0 0x2c000>;
> > 
> 
