Return-Path: <linux-arm-msm+bounces-55573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E28A9C0EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ECF91BA6E60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A898230BCE;
	Fri, 25 Apr 2025 08:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Out+PDcz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401E32343CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569590; cv=none; b=HDpd3v2WnyrW7H4L1HnYRQFoHl2K2iofXi6OGwp4PakzqODfUq5leH5D9S/wgQhUqHetIx/b6EcxNItgSUSTJvDHaSznG3JeaPTv9f62tPqhjwCZOk1GwYO09YW9nIgNya+btFFP8nFknwQPQos0BiPkyRku91C2f4UiSmaq0ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569590; c=relaxed/simple;
	bh=aBVvT3LdMnSNKKS95nXyx/2Wgt4vHzSWboqRRCTYYzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fypSE8gxl49NaYJLykNeeZVnVZOoIRQrMg9yp8FSZUC8IlpLI6Oz5E3E+hF5f/BaGsw1td0CrTWkc1icynKbwbGq4ej1gRR1Q2gEE+xgmq+mkenr1Vbtpi8QNhkeHmVtTlJodokkVXPl7d3v+vlk7awcvzghhzzAA4/GWPf3E5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Out+PDcz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17D6O004455
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5GhjiZ6SmVr+1yf43/s7AZnE
	KUCWcw2NJ8cW+4voUf4=; b=Out+PDczEhZ3wrjv/Zw4MEVJkoxvqWm3J7dXqNuC
	r9KRGaFwPTKcKtShryF7CJ9Ijz4nDBx/LwLH/YSU3kRNJFARzbUeHcxdZ3OOyeJh
	ceHgS5MO8TcUWkkgyd1dn3uJ5WRzkCiIKg5mNc1vxyoxa/bgTslNa5rBCvjEW9hH
	a8JlqlT7E7bZaQRvOqnhNLNlLAqhpSzan9Q8Jj7pUAhxXLeKq5aZ3RoyEGKHbTF+
	hnzM5ZbEnMWzfYdelLxMCZx1Is3kZgkt+lUvlqygyQtik6nVLqQJTOrLgJK2x1lA
	wQoEmeSpcJlaLDPvvfR6m4ws6AT9Rd2Ao7jQi8LKlxKiVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1856u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:26:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c95556f824so214449385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 01:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569586; x=1746174386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GhjiZ6SmVr+1yf43/s7AZnEKUCWcw2NJ8cW+4voUf4=;
        b=hwLQMydXCj1YXzplWjg1sPSySLaGvToR72R2A2qxOBMQmvPlGyYP59Cl3m1QKzWsXd
         /CbiobZgkQPAu7HDPvCAcr/5mQRVlnuzNau6BftjZFgDvQnmMEYBjZjDzwFj5yV6c5kl
         RnBJOYBtqKGw/euyqe+DbA8qeqKy/8+/H0W2W/SsBr1OQs88w4cPoeVzAvPbLUdL9Epa
         vv8px21SaeYmjsviCB/kAPbn4ctTgW0HAWeoRZcTexMidMFYzzB3rPBudFtxUQsf/mZK
         cmOTwUgIVXUlepx3d/lhWgyeeAAuXyn2Ay7FcfK9Qkk4Q+a49FnQEOykrbM0nNOrDooP
         Pq+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUypT7akvO3E5REnNlwWwrbD42aEUWpN51mxFmoTbhtzhUYsy0K0t2cCx0vAOPYd+DaKLKYYuC3QjGTg8sK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm4PlDkA+ySJBQNG6hzcqxu2IkZ0yAjWF8GAy51s5UXYf5lkJ5
	9++ajqufAA6u8bx2dJCQKysvMiesnuMSfuqDCt/BUxKCpNcVFWor0bScJKID5lfQOxusDn1ZZcx
	D4/+ksUFxws+ypWKCqBBpMaMdj3zqp+y4i0nw1ENzuXg1SYIuEp2q0nCmykeYH8jn
X-Gm-Gg: ASbGncuCyLmkCcl7Lui1Zux8NyEuGb3+6k2I/bq+BTmlgTXyp3JjgQ3G6HVQM2Xjzqa
	T8vGdcX2C7YtvvvU6Mv7jd+lpbOrS6MXLW2rR1wJhmfe0rlueV89NhR3KNe1G6rkjPHlWUWy7m6
	3OICRrVqWsPWFgKJooPOdAsgPYYvOC9knmUfG4AVUWSQwsBM5m7nD3rXbt2s8weawDnvx+uHT/V
	Ump45wkmfDuzG1FkDeAuaoBxN/lAbX1miby1tPNsrvSaAOxtoDxGwlUEXu3rVEtfk92/kQRbm58
	Som63hZrucxQqacW2d2GAkIVG1WMNY6cETbqeKrGbhnf3rtujkAV9k4OiOmskbhFcFjBKM3tJ1g
	=
X-Received: by 2002:a05:620a:170f:b0:7c5:42c8:ac89 with SMTP id af79cd13be357-7c96072019amr205522285a.33.1745569586075;
        Fri, 25 Apr 2025 01:26:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhkTqNaE2ZpZTXAIFDdmsRFjOhc20VJdlsjzXMKpiPe6YXZLDPrC+Vxjm2BsPdc1TC/8L4Jw==
X-Received: by 2002:a05:620a:170f:b0:7c5:42c8:ac89 with SMTP id af79cd13be357-7c96072019amr205519385a.33.1745569585576;
        Fri, 25 Apr 2025 01:26:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258c2sm524680e87.32.2025.04.25.01.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:26:24 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:26:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Message-ID: <3kprgpvzffupnjbh2aodsowwklliywpemzwpsftd2cng562yuw@37tpwmpemr2c>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
 <f05cba73-6d8b-4b7b-9ebe-366fcd92a079@linaro.org>
 <lwv5pk3dtyyxgtrwxss43dyecesv7pvrzvgwacwrnztkiowfkp@jqosvhrs3jk5>
 <42b56d7d-26cc-4c10-aca2-a0a5a16b09f6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42b56d7d-26cc-4c10-aca2-a0a5a16b09f6@linaro.org>
X-Proofpoint-GUID: r-CDrgXWLWPUK1SuYX-XqRdpCsAHla3j
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680b4733 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=mjvOFFmTwYZxuSbJlPoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: r-CDrgXWLWPUK1SuYX-XqRdpCsAHla3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2MCBTYWx0ZWRfX/tQpFawWtcRc 3dpM3xp0NCsYXnevUVVagMd/k46bxIpWnI2KyOckDx+FCtfyL0b3e+AgSq2Mug4VgX6d98OEW71 eLlKxeM/qO7isG94/ky1EixXNOw+36uSmL3BxQxlD6tXGmaEJXUMZj+/iMPfMvqMmD6RiyI9II7
 vefPg05gqxoC9j0BRUtHrY0tLOj5Nygk9UWKWQ0JQEBqD7EEA0ITYVHV86U+1nrGqJAJONYBWr6 M8acBb9KkzmcncCe1lKqtODocYBnVAnQ0n8OyFsWcdMpIWUPDxlPY2f8hg3qgG8x4xWvLJYUsVK BbHScqMLVzUDGFHBLahASvWEhP+aCmgWzPA9iOpX5hQjLgnr8+wztTOC7KfgIZPv5CMVUIVJVdc
 94d2nyJoS2Jz33F0xxl5/i2shEh3ZP4NzdaVe8djx7myyui04YrRdcV6PUizKvCYqSf3lviD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=814 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250060

On Thu, Apr 24, 2025 at 12:51:31PM +0100, Bryan O'Donoghue wrote:
> On 24/04/2025 12:32, Dmitry Baryshkov wrote:
> > On Thu, Apr 24, 2025 at 12:29:39PM +0100, Bryan O'Donoghue wrote:
> > > On 24/04/2025 11:45, Dmitry Baryshkov wrote:
> > > > > Which would then be consistent across SoCs for as long as 0p9 and 1p2 are
> > > > > the power-domains used by these PHYs.
> > > > This won't be consistent with other cases where we have a shared power
> > > > pin. For example, for PMICs we provide supply names which match pin
> > > > names rather than one-supply-per-LDO.
> > > 
> > > Yes but taking a random example from a PMIC vdd-l2-l13-l14-supply is
> > > specific to a given PMIC, so you need to name it specifically wrt its PMIC
> > > pin-name whereas csiphyX-1p2 is there for every CSIPHY we have.
> > 
> > This is fine from my POV.
> > 
> > > For example on qcom2290 there's a shared power-pin for VDD_A_CAMSS_PLL_1P8
> > > but then individual power-pins for VDD_A_CSI_0_1P2 and VDD_A_CSI_1_1P2.
> > 
> > So far so good.
> > 
> > > 
> > > If we follow the general proposal of
> > > 
> > > vdd-csiphyX-1p2-supply
> > > vdd-csiphyX-0p9-supply
> > > 
> > > in the yaml, then whether SoCs like qcm2290 share 1p8 or SoCs like sm8650,
> > > sm8450, x1e have individual 1p8 pins is up to the dtsi to decide.
> > 
> > So, what should be the behaviour if the DT defines different supplies
> > for csiphy0 and csiphy1? Would you express that constraint in DT?
> > 
> 
> You'd have that for qcm2290
> 
> yaml:
> 
> vdd-csiphy0-1p2-supply
> vdd-csiphy1-1p2-supply
> 
> vdd-csiphy0-0p8-supply
> vdd-csiphy1-0p8-supply
> 
> qcm2290-example0.dtsi
> 
> vdd-csiphy0-1p2-supply = <&vreg_1p2_ex0>; <- individual supply in PCB
> vdd-csiphy1-1p2-supply = <&vreg_1p2_ex1>; <- individual supply in PCB
> 
> vdd-csiphy0-0p8-supply = <&vreg_0p9_ex0>; <- shared pin in the SoC
> vdd-csiphy1-0p8-supply = <&vreg_0p9_ex0>; <- shared pin in the SoC

What should driver do if:

vdd-csiphy0-1p2-supply = <&vreg_1p2_ex0>; <- individual supply in PCB
vdd-csiphy1-1p2-supply = <&vreg_1p2_ex1>; <- individual supply in PCB

vdd-csiphy0-0p8-supply = <&vreg_0p9_ex0>; <- shared pin in the SoC
vdd-csiphy1-0p8-supply = <&vreg_0p9_ex1>; <- should be shared pin

I don't want to allow DT authors to make this kind of mistake.

-- 
With best wishes
Dmitry

