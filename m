Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB7843F36B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 01:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhJ1X1l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 19:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbhJ1X1k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 19:27:40 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE790C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 16:25:12 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w193so10715455oie.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 16:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EDe6iwcvK4P5hlBt+qwjDx1hQlBIPuFbPW/BOYvPeKw=;
        b=pvWUBJxKggXKZRJmAHjUNCjWEEfpZK8JUSaaafZP78H7+1A+5NYmpfk+cVtbeGUHar
         Lf0swKVnEKe+9LUm4TIwhMdurYC2eo5C25JQGG/bZ+GX8qeliN6NF7Ha24In6fUQYdJd
         jaw4sT52NEvwLGvHvTPcUczr8jE1eIgFQQx8rl9li3h48UbCIg3aZZiA5Wt3eZRqAqSx
         Wu+UB80HIjkcvu84rQ1ZFASW0OtcGEPGTgXWp2MCLoMvAQQcjZgh8dPyq3QEdUdsDk4G
         pLLVNDgEjcNeBH07jWz2/0x8HP3wPSle7hu6UhljuOV3ZGiyVzIRH3mP7mjFK6RXxUlp
         GL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EDe6iwcvK4P5hlBt+qwjDx1hQlBIPuFbPW/BOYvPeKw=;
        b=aX9t/z5xzrlp8q+8HPY7kxj8ojyBJU4nBulEM1KFQt/UhaMgy5R3jEdiQDgCUbxZHq
         ZORmduySqX3fow/cM1iFqtyeIDKXNrjmNRJDBVKmcFQFJzNpHjkoLyj54x2+Mu647JZT
         kGKIEdIUxGDdroqtHhON9nn3c/omKqWbXifwPX18rs1FeynlxLuX0FmuDQXhRS+sT4eW
         W4VNFjbU+EA33j1x/Vs1PgB79dd/7Y0FntlIXjmS9GKDACwQ2wQ0N6Ly8t3HDF4Xig1V
         aeX33Xr5EhfIz/hj3bJpiPSIZmSFI5Ol7NiOZ8ZnOb9GCvLWhLkLbRZK9QD7aMMZ6kk2
         ABrA==
X-Gm-Message-State: AOAM533i6caPBq+QpBMJqMLlQ3ZMn1jc58VmgL3BlLYFn2RGTQapCXM8
        2HXJs3N8LsS1Up5CgberUy/0vw==
X-Google-Smtp-Source: ABdhPJw76jtgAGonUXDGNel+tZMapRW9u1aPMw5KM4t4dLEqHc/UEMWzrWlue86K1xN32pjE5r2ntQ==
X-Received: by 2002:a05:6808:138d:: with SMTP id c13mr11300022oiw.60.1635463512310;
        Thu, 28 Oct 2021 16:25:12 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i13sm1500650oig.35.2021.10.28.16.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 16:25:11 -0700 (PDT)
Date:   Thu, 28 Oct 2021 16:27:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Odelu Kukatla <okukatla@codeaurora.org>
Cc:     georgi.djakov@linaro.org, evgreen@google.com,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        mdtipton@codeaurora.org, sibis@codeaurora.org,
        saravanak@google.com, seansw@qti.qualcomm.com, elder@linaro.org,
        linux-pm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [v8 3/3] arm64: dts: qcom: sc7280: Add EPSS L3 interconnect
 provider
Message-ID: <YXsxxd7f/FaDJEMa@ripper>
References: <1634812857-10676-1-git-send-email-okukatla@codeaurora.org>
 <1634812857-10676-4-git-send-email-okukatla@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634812857-10676-4-git-send-email-okukatla@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Oct 03:40 PDT 2021, Odelu Kukatla wrote:

> Add Epoch Subsystem (EPSS) L3 interconnect provider node on SC7280
> SoCs.
> 
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index d74a4c8..0b55742 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3687,6 +3687,14 @@
>  			};
>  		};
>  
> +		epss_l3: interconnect@18590000 {
> +			compatible = "qcom,sc7280-epss-l3";
> +			reg = <0 0x18590000 0 0x1000>;

This series looks like I would expect, with and without per-core dcvs.
But can you please explain why this contradict what Sibi says here:
https://lore.kernel.org/all/1627581885-32165-3-git-send-email-sibis@codeaurora.org/

Regards,
Bjorn

> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
> +			clock-names = "xo", "alternate";
> +			#interconnect-cells = <1>;
> +		};
> +
>  		cpufreq_hw: cpufreq@18591000 {
>  			compatible = "qcom,cpufreq-epss";
>  			reg = <0 0x18591000 0 0x1000>,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
