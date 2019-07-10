Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80E5C64414
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2019 11:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfGJJDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jul 2019 05:03:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37618 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727516AbfGJJDH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jul 2019 05:03:07 -0400
Received: by mail-pg1-f195.google.com with SMTP id g15so930665pgi.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2019 02:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6NZ04dqkp5PZfb0iXau7OgJEqRReEfjejYdtenD28ag=;
        b=t23I+rpKmwsx6L9Q4vUWFIrJBxJxq3TYfSJJPSu/DjOD1DCo6AlHTwiZJlR7EcNGLO
         GcQlUTbk8YYTWXMsTz7Ef3BZFWCqFrJHdwQJnu1FY5awvwwGJ0c2XwZ8QwIsysig7Ih3
         tY04e41XUxPfvyCqSBO3x1irGqEIENikMgzQBi4MZ4IdKu0Zx0koI4Yp/RMuYBu0enit
         0Lsxto60XXj2SyuYhy6rrP8meO/YIeFPeGY5iNej4rSHjrjV86VWSjpA/QCxHNdTt5I6
         qHBx7HRK6cDVRQ7y+2ZpeyJApVKKrYbHzVzKOl0ckKy1KNxZuK/6Z3vXfmAAzmEvpGUs
         uLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6NZ04dqkp5PZfb0iXau7OgJEqRReEfjejYdtenD28ag=;
        b=izkeakWMYm4Nb+BTHIDnPzCTCGkWPalnoRIl1/VdKSLg0NOBJ2hAFl1xCAlHlrV3Yf
         xs6qMnV2aN5RF/C9XdVZzPlyk3ZLnJosHUdrvy6xkTnjWBhiDwxhZHlm6qYdWr/hECFN
         J8SFBeIEVsL7VJGlwktFYA949jVd3otiLccFIrdtpVD1f8lip+AnOZfVWWP4tCSg+z6v
         twcSJT2Th4kGRZ0VaOnf3WO3cvbVNaUCuXeQsYhxlvKx7OcjJgvFY41hcNjtx2lE6UPc
         6F9ibBvMW9p8CgiYuNYMJ0akySf4+oDQwQWenGbPE8j1vRryj/o1jsCXx9X1eMnWDNAs
         HPJQ==
X-Gm-Message-State: APjAAAXHzXjJscIZrsLy0bq4z8AJFTKs6TQRtMKNIR475i002FPrdr8H
        FaAJKDGxYYEuHiPmrp7XEjSXQA==
X-Google-Smtp-Source: APXvYqxK+S0LBckyQx94QVniKkTJ+/+6VuQvBLPkooC8SUohB+Wy0vvz/pDDQjQLOEljUV6HT7fR5w==
X-Received: by 2002:a63:ad07:: with SMTP id g7mr33649130pgf.405.1562749386689;
        Wed, 10 Jul 2019 02:03:06 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id x65sm1633917pfd.139.2019.07.10.02.03.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 02:03:06 -0700 (PDT)
Date:   Wed, 10 Jul 2019 14:33:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] arm64: dts: qcom: qcs404: Add CPR and populate OPP
 table
Message-ID: <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705095726.21433-12-niklas.cassel@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-07-19, 11:57, Niklas Cassel wrote:
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
>  	cpu_opp_table: cpu-opp-table {
> -		compatible = "operating-points-v2";
> +		compatible = "operating-points-v2-kryo-cpu";
>  		opp-shared;
>  
>  		opp-1094400000 {
>  			opp-hz = /bits/ 64 <1094400000>;
> -			opp-microvolt = <1224000 1224000 1224000>;
> +			required-opps = <&cpr_opp1>;
>  		};
>  		opp-1248000000 {
>  			opp-hz = /bits/ 64 <1248000000>;
> -			opp-microvolt = <1288000 1288000 1288000>;
> +			required-opps = <&cpr_opp2>;
>  		};
>  		opp-1401600000 {
>  			opp-hz = /bits/ 64 <1401600000>;
> -			opp-microvolt = <1384000 1384000 1384000>;
> +			required-opps = <&cpr_opp3>;
> +		};
> +	};
> +
> +	cpr_opp_table: cpr-opp-table {
> +		compatible = "operating-points-v2-qcom-level";
> +
> +		cpr_opp1: opp1 {
> +			opp-level = <1>;
> +			qcom,opp-fuse-level = <1>;
> +			opp-hz = /bits/ 64 <1094400000>;
> +		};
> +		cpr_opp2: opp2 {
> +			opp-level = <2>;
> +			qcom,opp-fuse-level = <2>;
> +			opp-hz = /bits/ 64 <1248000000>;
> +		};
> +		cpr_opp3: opp3 {
> +			opp-level = <3>;
> +			qcom,opp-fuse-level = <3>;
> +			opp-hz = /bits/ 64 <1401600000>;
>  		};
>  	};

- Do we ever have cases more complex than this for this version of CPR ?

- What about multiple devices with same CPR table, not big LITTLE
  CPUs, but other devices like two different type of IO devices ? What
  will we do with opp-hz in those cases ?

- If there are no such cases, can we live without opp-hz being used
  here and reverse-engineer the highest frequency by looking directly
  at CPUs OPP table ? i.e. by looking at required-opps field.

-- 
viresh
