Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2ED313186A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 20:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgAFTNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 14:13:25 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45839 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgAFTNZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 14:13:25 -0500
Received: by mail-pg1-f194.google.com with SMTP id b9so27278385pgk.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 11:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CWeF+qEiMx35B55O581zGPkQBg4u6jbLRdkEV6WWjg8=;
        b=ebxUl9dh1FKnFxAkXnwnaZCuaaW7Za3VZTOLf6eUWfhcIgGX1Xz4QDGju8SuP5ORKP
         +du3pSdkH3bQlfRjCN85Ni0pP7LTiGwkCL4usBBoPhMGs/VMDbPuDOhZXAs4jIC7YSpo
         YUZgh/lxWqemlC2IiMVH7ZifwWjV3hC1ot50I8x0NIKEM7/T7oUPFcio0crZXbwyMGRK
         USHhjFnz5ZPdh1xzGPh3VrEq2zf2esPa9ytQvLFI3zghZ9o+qrEICzfoLrWXxWgCeCUe
         84RIcJbbsECIWTdE/mUg9cmjkk21JgRELcVxW66bZElpCAa+SGdAUEXOu2hpLWdnhP+u
         hOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CWeF+qEiMx35B55O581zGPkQBg4u6jbLRdkEV6WWjg8=;
        b=FUwTbMCcba6WmVlcrkLcZMmneAfJ2aqkdpXLhZe2lO4Zur25BuktxmqoQ0l7CKZ4Ft
         dUSQmoZ+DesgChX5CLPgnyhQzuavkJnFVSqYpcNsPaDmR26KlBn4mS1SGWcXSz62BJcN
         o/AJrY29IF65leuhK0kU5IYVZEtTn/4zVS205de7ggOmcy8V/uKEaqRuu7pBemSMeQ05
         H+zDCe93LNl+lZT/edRw6a+Mrm9NR7lzIA9l0k1q/3aElrRk4EJF5SXVwWjoq2x/Py3x
         HjxGsA/GiR3crJ/vtP7LwVqi8vCt1K7oUb0UgTz4g9z2dxkmeq5iqSswxfnVFOb39jul
         f8bg==
X-Gm-Message-State: APjAAAWU2z9pEu+4yFh036D6YisVdf1F1DNF/KqC7TCY3C1yEj/MJqFs
        KlE9UngAnPhki5g0YTLkn0R8rw==
X-Google-Smtp-Source: APXvYqwVRgLXSzVPKren8Gq/VjMYYjdAkXhimprfkvlgbJfFMBCuRAYFriDOjImyXhnvrMbBQoyGsQ==
X-Received: by 2002:a63:eb02:: with SMTP id t2mr112827707pgh.289.1578338004229;
        Mon, 06 Jan 2020 11:13:24 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r66sm80457803pfc.74.2020.01.06.11.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 11:13:23 -0800 (PST)
Date:   Mon, 6 Jan 2020 11:13:21 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Fix venus iommu nodename error
Message-ID: <20200106191321.GU3755841@builder>
References: <20200106102305.27059-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106102305.27059-1-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 06 Jan 02:23 PST 2020, Stanimir Varbanov wrote:

> Fix the following error/warn seen with make dtbs_check
> 
> arm,smmu-venus@d40000: $nodename:0: 'arm,smmu-venus@d40000' does not match '^iommu@[0-9a-f]*'
> arm,smmu-venus@d40000: clock-names:0: 'bus' was expected
> arm,smmu-venus@d40000: clock-names:1: 'iface' was expected
> 
> by rename nodename to "iommu".
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Thanks Stan, applied.

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 4ca2e7b44559..9bbcee31f28b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2267,7 +2267,7 @@
>  			};
>  		};
>  
> -		venus_smmu: arm,smmu-venus@d40000 {
> +		venus_smmu: iommu@d40000 {
>  			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>  			reg = <0xd40000 0x20000>;
>  			#global-interrupts = <1>;
> -- 
> 2.17.1
> 
