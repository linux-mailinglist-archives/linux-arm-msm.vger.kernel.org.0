Return-Path: <linux-arm-msm+bounces-43007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C499F990C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 19:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DC921963300
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2260B21D5A0;
	Fri, 20 Dec 2024 17:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QgO/cGjL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4272F2210D1
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 17:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715829; cv=none; b=Xg2mRtNLKYFQCnfUF/QIJb8ZQ3M5HWRbPAQJ2Ng80Rvhtc0DFqQi8Vgo4384/9TpXz3ud187twroy0qRokEAsZgseLXycfSlnpfg+t96NloyKq6tWGfPpWKbulBDXbQRMlyaPzRhInD6sExdlryUfB1rWJ3i6VjCiSUYwRT9Qgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715829; c=relaxed/simple;
	bh=bAysmXT1ApL4MZsbGXlIGLiZFW3xoeOXskBVjon1K5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKW3b8eeGW/TpAAsNlALgtvRV8hfUL71pEyDjghO6oHxC/j7Q/3SpQPU6wOq29AcD3Apn3N34xvF/j8rIRbs+dLiZOeSQHtf17vVIVki8x2Otck0o3JrhO1lLArqPlAZS9n6z+dGstwZfucQ5JthPPUkMfQUjV6I6PxOPB8AXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QgO/cGjL; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso3448727a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734715826; x=1735320626; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TJaoXje8uHao+uzoShrvm+9AXWvGP52yQ1oIubMZeDc=;
        b=QgO/cGjLeuezReiaDsOfrAXDQaswh/E8gJyQB6hR9srONxmY/+vwetrEi3BmAABXJ/
         o7ydwh9Qs+jVtNk59GnX0wNhdztbj6a7LTMxQwsd8uyEJHKz49vMQCHQH7j+ZWyfRv7i
         XwAxXGgGeGpTdPgpMUUH/Tqbv7mYQfEYyqIijJW0ysqqQhoMlQbA6haqXspPNMO6wfDA
         3pJ0fqmDOPMeNxFYuW+9q7MZ/pqPbaE7IBp7e3zyg2+kPHhbvpxxe2sk/jYov/GmeaoQ
         BSAY/aFu+zxJLsrevCvbZ5Kqa8Qu/8Q7eBtjy3kBXLDCMxfkTkcQNjlKWNTKIaEkIi/M
         Zgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715826; x=1735320626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJaoXje8uHao+uzoShrvm+9AXWvGP52yQ1oIubMZeDc=;
        b=FKLsVFWHumZTT9XyKPhz5S4+myBLd5kwtPGU38R/DYG7WkIPPpWZV0tJ8AvvkHDgfE
         eT1ynDwL2MSwmoLE7S7x8I5kdyGrGNVBtLQMDN6Bv6pYBv8Bf101OAVpCzQZPZVz+lHf
         NPtWoFz84B938Z+tserNftM+i2t+05SbP+z3vuUsv3TqJ30r5G4WKgt48WQ4adBqjp/A
         gCQn7JFWS3FpYJ1COCcVvL7kPSbgtfBUc3DmRXNfjX6V0y4MZ1hEQUpPNyOCOR9Uspg8
         +0A4GD2reWNLGC5W+weGoN8J7XJSBXJDTfVVyKRuvurm1PIoM0w1jNVQnQM0QpOAkD3F
         0MhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd2qvy3AiYHgihsoYl93C21RUqZYwILHpO6ipxzUdWGqSsz/1XdRmdqoP0FdRMz+MII7QFRfivaaNscccC@vger.kernel.org
X-Gm-Message-State: AOJu0Yww0UB8YJkzJgnYG2tVjJH/JnDvS8h/QLJlFaHSoPpr8EQKJkCk
	YvEJRRkBV3xkU+JGXgcTfK/EBVZYphBbiBhltNN+3WxATaygY2UlRysGGXN8PQo=
X-Gm-Gg: ASbGncttRuew1z9lZK7Q7ZEmg6VCI2BrT47hfNeKpjDFFYSFPbaVKB3p3+TXgeU+a5+
	MmK7nwF5EN6Zcol7fIUll4J7Lzafh+CGp4OpIHsjayRCPfePYHcBf7eYtu9gMSj209LrnH4IZ9H
	IBsgxAinJM6XiUUyEJwQxuID6LRhetdh9b5W5hueRd38nAmZyQAeKuHDbtGzg1y0nOUlyh9icrX
	Xz/IgHAuRDIUGPDagb/N59TrH4F0xwfewkaoNiq1W4l9OApofOzvR8xuqzvVWfNw2in
X-Google-Smtp-Source: AGHT+IH7+XcVUt5iV5cF3xg1wrooGDBJq1k5sc95u227IWRCzMGea6RcPb0ttVzenGGImX0jMdU8ww==
X-Received: by 2002:a05:6402:35c7:b0:5d4:34a5:e317 with SMTP id 4fb4d7f45d1cf-5d81de1611dmr3897302a12.22.1734715825516;
        Fri, 20 Dec 2024 09:30:25 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:6d2c:6f87:64ef:2237])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a3d2sm1928475a12.16.2024.12.20.09.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:30:25 -0800 (PST)
Date: Fri, 20 Dec 2024 18:30:22 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v10 3/5] arm64: dts: qcom: Add initial support for MSM8917
Message-ID: <Z2WprlxV4wop0jxB@linaro.org>
References: <20241220-msm8917-v10-0-3d5734e8c3a6@mainlining.org>
 <20241220-msm8917-v10-3-3d5734e8c3a6@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220-msm8917-v10-3-3d5734e8c3a6@mainlining.org>

On Fri, Dec 20, 2024 at 12:26:55PM +0100, Barnabás Czémán wrote:
> From: Otto Pflüger <otto.pflueger@abscue.de>
> 
> Add initial support for MSM8917 SoC.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> [reword commit, rebase, fix schema errors]
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8917.dtsi | 1954 +++++++++++++++++++++++++++++++++
>  1 file changed, 1954 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..7bd6925029eeb9d6d49a99f8686181e926258cab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
> @@ -0,0 +1,1954 @@
> [...]
> +		a53pll: clock@b016000 {
> +			compatible = "qcom,msm8939-a53pll";
> +			reg = <0x0b016000 0x40>;
> +			clocks = <&xo_board>;
> +			clock-names = "xo";
> +			#clock-cells = <0>;
> +			operating-points-v2 = <&pll_opp_table>;
> +
> +			pll_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-960000000 {
> +					opp-hz = /bits/ 64 <960000000>;
> +				};
> +
> +				opp-1094400000 {
> +					opp-hz = /bits/ 64 <1094400000>;
> +				};
> +
> +				opp-1248000000 {
> +					opp-hz = /bits/ 64 <1248000000>;
> +				};
> +
> +				opp-1401600000 {
> +				      opp-hz = /bits/ 64 <1401600000>;

Nitpick: indentation is off here.

Anyway, this looks really nice overall now. Thanks for doing all the
cleanup! FWIW:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks,
Stephan

