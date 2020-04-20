Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116E71B17E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 23:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgDTVC7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 17:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726294AbgDTVC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 17:02:59 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EFCC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 14:02:59 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id q18so2152488pgm.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 14:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MOuCbWR1ZWCZKNK9Z9cuP5OsJt0ycCa4mjaiaGRp1ds=;
        b=XO2jZ2VT1mYJcCpprgqnN2/aKGlnLJAaEMC1BzzXRrDXDknkVMNnk9QIn6iivzSh5t
         4Ym0060obXASln2/RhBFMQ2I3guoKiBdRF0sqjD6ooziL7Sbq5qc/PAFLJRGo6//Fq7Y
         pZxwIMIb8uLP0htVwRIP1jdfl9RV/qPmgKS6/pxFVV2h9Dixv4jI9g3yMeeoIgCbsjZQ
         BwlEE04CuMvT46g6kBoWgy+UzwcAHCH8fQ2z8TbbjzxBJPvdQz0nbBCTbUhhTascCrCR
         SKUbIJXfRNYs6DG6RJDPXUWw7nIEXmAbW/L0u2sCdne9K5hLpvuZC3Ad9EP1HDPLyqiR
         cziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MOuCbWR1ZWCZKNK9Z9cuP5OsJt0ycCa4mjaiaGRp1ds=;
        b=tLWJ7jLDsMjq7P8c8KbSS1z4GBDkUWdZkbPbAYbfzFHFcg4LQVUNohEVvXnP21FhBA
         +BxcrjNxTpaNpIU7IypCJE81f3fXZR9+aLooH+GE/jVARDbAa/teAJRxN+mp3ftZX0Ex
         u6XARP3BLtN3kD3Fskk6ummUCVwZ5e+ebwAsWKa6N9N7pqrt+QEv8Iddr7wcoDBdrDhP
         1D1J1RnpTXo+md5jS/Ow4BD9J9q9VqT6IUPfXyDDiUUBnwA4tQhb9hkgpdhbmswtlNR1
         8sQKV1p9NfNEpoomnss3z7ol0d5peqgAshyd20fbwSbw0kE7wLjDOGeER83xEosPy+GB
         2Okw==
X-Gm-Message-State: AGi0PuYuTGjJE4lDb1Fw0uwZhp8ZvhXU5qigGs2x0IIT9hyY1N4O8U1D
        u5iLHtoNgTdpKsjtjHZS8YM4eg==
X-Google-Smtp-Source: APiQypIMgHVUTUPobvnHOwG6fc15iKYQJP3A5rr+TWvSPKW9ADHthNBFWDrAQm0AsKYENQdckoy22g==
X-Received: by 2002:a63:e10f:: with SMTP id z15mr18430054pgh.88.1587416578521;
        Mon, 20 Apr 2020 14:02:58 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q200sm249475pgq.68.2020.04.20.14.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:02:57 -0700 (PDT)
Date:   Mon, 20 Apr 2020 14:03:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add cpufreq hw node
Message-ID: <20200420210322.GS576963@builder.lan>
References: <20200415061806.740965-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415061806.740965-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 14 Apr 23:18 PDT 2020, Bjorn Andersson wrote:

> Add cpufreq HW device node to scale 4-Silver/3-Gold/1-Gold+ cores
> on SM8250 SoCs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index d7b2049f339c..e62e77ff48c2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -41,6 +41,7 @@ CPU0: cpu@0 {
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_0>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			L2_0: l2-cache {
>  			      compatible = "cache";
>  			      next-level-cache = <&L3_0>;
> @@ -56,6 +57,7 @@ CPU1: cpu@100 {
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_100>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			L2_100: l2-cache {
>  			      compatible = "cache";
>  			      next-level-cache = <&L3_0>;
> @@ -68,6 +70,7 @@ CPU2: cpu@200 {
>  			reg = <0x0 0x200>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_200>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			L2_200: l2-cache {
>  			      compatible = "cache";
>  			      next-level-cache = <&L3_0>;
> @@ -80,6 +83,7 @@ CPU3: cpu@300 {
>  			reg = <0x0 0x300>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_300>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			L2_300: l2-cache {
>  			      compatible = "cache";
>  			      next-level-cache = <&L3_0>;
> @@ -92,6 +96,7 @@ CPU4: cpu@400 {
>  			reg = <0x0 0x400>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_400>;
> +			qcom,freq-domain = <&cpufreq_hw 1>;
>  			L2_400: l2-cache {
>  			      compatible = "cache";
>  			      next-level-cache = <&L3_0>;
> @@ -104,6 +109,7 @@ CPU5: cpu@500 {
>  			reg = <0x0 0x500>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_500>;
> +			qcom,freq-domain = <&cpufreq_hw 1>;
>  			L2_500: l2-cache {
>  			      compatible = "cache";
>  			      next-level-cache = <&L3_0>;
> @@ -117,6 +123,7 @@ CPU6: cpu@600 {
>  			reg = <0x0 0x600>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_600>;
> +			qcom,freq-domain = <&cpufreq_hw 1>;
>  			L2_600: l2-cache {
>  			      compatible = "cache";
>  			      next-level-cache = <&L3_0>;
> @@ -129,6 +136,7 @@ CPU7: cpu@700 {
>  			reg = <0x0 0x700>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_700>;
> +			qcom,freq-domain = <&cpufreq_hw 2>;
>  			L2_700: l2-cache {
>  			      compatible = "cache";
>  			      next-level-cache = <&L3_0>;
> @@ -499,6 +507,19 @@ frame@17c2d000 {
>  			};
>  		};
>  
> +		cpufreq_hw: cpufreq@18591000 {
> +			compatible = "qcom,cpufreq-hw";

As pointed out by Sibi, SM8250 comes with the new EPSS block for
frequency and voltage scaling, so this is wrong.

Regards,
Bjorn

> +			reg = <0 0x18591000 0 0x1000>,
> +			      <0 0x18592000 0 0x1000>,
> +			      <0 0x18593000 0 0x1000>;
> +			reg-names = "freq-domain0", "freq-domain1",
> +				    "freq-domain2";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> +			clock-names = "xo", "alternate";
> +
> +			#freq-domain-cells = <1>;
> +		};
>  	};
>  
>  	timer {
> -- 
> 2.24.0
> 
