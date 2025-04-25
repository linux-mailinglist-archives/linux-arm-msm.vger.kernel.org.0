Return-Path: <linux-arm-msm+bounces-55575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6EEA9C21F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD73A1BA1E24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A2123370F;
	Fri, 25 Apr 2025 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAfs3N16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21851232386
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571101; cv=none; b=Og49wzD0kb+MfGZ/0Ue2p+4EVOfiiPU99cM5OvQOW+eN9sPrSEbMyzeHrXu1QhXyg8IRHfXNZiynym0m6LcLRMa+wd3GgiRyH7zStaZnLyxq8qKdiNLGD7aFxol6nmoDud7JMthhU+N6423/8IXd0o1ylKuiWjnolXnPv7BwGP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571101; c=relaxed/simple;
	bh=bMSjABCClWfJSC4Hjs5jAPDO2W6FqdDcosI1jaZyaiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkFZncaDRUI136Iwy88EfHnV/D4DoZrHniluLyccMyy1Qomv+fspKKq9EjWrQ8QTnBwd6wPJ8t0NniJYiC4qX+GHhOpzMp8Ujb++7rmdkEjCYLFKfECzRar/Ok0aPD4zRPvGryqsgtjEiC/PCN9oUQHojMWaAAbDwN3a/lrZPbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAfs3N16; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T7f2016018
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zgto+NXLTWjeGis4250S7ueD
	MaHv1HkfoBr/1cOtW7s=; b=gAfs3N16r3PEPHWUpj8lv3m9YE1gPmW86gv6hSp/
	xNzifIfwOfnfjqcy4eLoaIRNL+B7qtMoctcqbVk8C0ukxff9zfgryTujT9BWtyhN
	lMU0fD/GaeSE6DkzCrFa4xGyG9wLXXn5irhyZe6zFJs6de0eAnIqIBNfH17OxKXa
	u+b/9aIF3AiwLVpSgrUkqvjqMvxu/BdAb4WEGpE9+TfmmZPzyLqwhb3uWXAHiD9z
	m5c2igUsMvaEzNAjlBWiTCp3cn0O6yIooKBkKOPYeR+dOCKFcqbAD9Vizsxg/af7
	+37KEbMvABs5mV4dDyul9+BiBkiNnyCDKcF5Le0VxJctqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh08css-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:51:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so363647085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 01:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571098; x=1746175898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgto+NXLTWjeGis4250S7ueDMaHv1HkfoBr/1cOtW7s=;
        b=luOw/FweXo5ER4b9Na+MaDkJ1V1YVYVGLHzuhWhldHw0Szi/z/FbRtawkvuEXiYVLZ
         fZAvYlgL9xsFaaX2cDJeW0mIqP++1m2dSwpOgWyST1VC+OKtFHu23esyH5jm/eXZpTrV
         Kbw2L+l2FMByFUWnwADKMQwY0rNpEG9d3WungT3viDKviyOA86ThCVVdYX57ntfEV51/
         Hgyg3XxwJZY8ddzB1YEYjoOrbNpIcXhLmkYpI4NK2bdIhDXgK9E7hTABjyz/j0gGxsw3
         K+LOzngoCR1T3uT6dzo35zXD9ot6gvMDPoGf+0dF9xxN1QSZo3fHT2aQq2ztIJh0Tg/L
         qvIw==
X-Forwarded-Encrypted: i=1; AJvYcCWZoi6rjNfU9mt0F4/+34bWDmSYJNv3zWHNxQJjM76PUzV00+0U9Xak4p85Wlooopg+1JW50w0oXTMRDiTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwFsmaNXlz6BADwFrqRuPYstS17n9KRt9tKQ8VvRaAI7pkgxq6W
	D+FXwW7lxOTSEbUsO9Bh8VscD7QKQo8lOp+X1c0GjyF5t4LtMmZ9SEBdlw9hXNm1aNNES2sa1X4
	tfEfLE51kzB/MmXaeShDL5QYJgTtS+pY2sC9R9HWUySc1mBvEG8KUvbbbmC55pyOu
X-Gm-Gg: ASbGnctBp+cbR1hpFFWMM6/laXegcYoowVG8xs3TX+sBwxuQi5naBx1tHCjPcgLs5gg
	fLzS4wvMZOYJ2jkIL4RrWOk+gnZBFIFNOJNShGSrMIiEeLUnvTaIK/X36Onh7b8QIqiFdCmI4Kp
	x90WYi/NCf9V93qrvps/rKEb7IkQozpELtrRnoggmyYbHrk7cS9hhjcLdeH4z6/eEym2mDkE1aJ
	7BsEr3vuknC+HPUVbgkwKYI+t4E/eZ4tiunq2KV6g3nNgKLzfxxSZuAYIYBIDP1U1WDE9vDJgPD
	DkYfCApgFW9nHvsxtYZccnVwtEOLK/uX4HwUCcs/04oBo0R6dOY7mmr40iAARKhgRHzStDvREaM
	=
X-Received: by 2002:a05:620a:440d:b0:7c9:2e02:7dbe with SMTP id af79cd13be357-7c95863f8f6mr846010585a.22.1745571098222;
        Fri, 25 Apr 2025 01:51:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqb+tfOsOT8jkUVnW74s9Wh1PyfJrzNtha5bWxQ7ns3s35ArAoiI4qP7ixfE831NFw1jsQJA==
X-Received: by 2002:a05:620a:440d:b0:7c9:2e02:7dbe with SMTP id af79cd13be357-7c95863f8f6mr846006585a.22.1745571097864;
        Fri, 25 Apr 2025 01:51:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d0019e18sm6269141fa.62.2025.04.25.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:51:37 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:51:35 +0300
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
Message-ID: <luamtq6xhvmxat4ywhrawc5q5fjfhjnz3ku3c3k7aitjdbjacr@hmhf6ip76z7z>
References: <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
 <f05cba73-6d8b-4b7b-9ebe-366fcd92a079@linaro.org>
 <lwv5pk3dtyyxgtrwxss43dyecesv7pvrzvgwacwrnztkiowfkp@jqosvhrs3jk5>
 <42b56d7d-26cc-4c10-aca2-a0a5a16b09f6@linaro.org>
 <3kprgpvzffupnjbh2aodsowwklliywpemzwpsftd2cng562yuw@37tpwmpemr2c>
 <2dd28ebe-f69c-49c3-90c2-aedc0484a00e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dd28ebe-f69c-49c3-90c2-aedc0484a00e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2MyBTYWx0ZWRfXwWMLHESoCzJL x5oFrgKSCMaU2A2513KMdAlvfyvrTKizr3dsLgn+fvhvNC48Kso8iksMrqXsJYgCTcP+yiPrx9S 2MXgdTH8WlM7X45dhGCJ5b/m1iGxrDWj8z7/dZ2eEZijBmN3XM21DbY7lbphJvnZMWDJTVEN4OB
 PM+OQMcn7yuOaEkB1tUFDWh5n2Bk1aaCZbj4m/LSugGmHGbZvwjyP9e95G3B8CM+V4gpSA4aEEp R0XPWVo8Ljf1T3VoSxpcN/kQtm+6vFKaSjg+TwdgBybLQIbS6f8AGYT469yV369UKqenzboGJBH M5MXNaMEVeB5ht3YMt3pMAUJ43ajxrQrxOhZIaWTVgwrUhMUpPp+8Zun2zlC7Iop3evw0zd8A3f
 OZoGDP2ly3sc2ghBBZ4452geJ3ezUnSJKW9BGojbT1atYeplun4nRtS0vTpv59xu1XX0t8BN
X-Proofpoint-GUID: C8lCvuE5KaocY8rBecz26_ch06jTPUbb
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680b4d1a cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=RRyVOxHS6r0Lc4ymnekA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: C8lCvuE5KaocY8rBecz26_ch06jTPUbb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=747 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250063

On Fri, Apr 25, 2025 at 09:35:05AM +0100, Bryan O'Donoghue wrote:
> On 25/04/2025 09:26, Dmitry Baryshkov wrote:
> > What should driver do if:
> > 
> > vdd-csiphy0-1p2-supply = <&vreg_1p2_ex0>; <- individual supply in PCB
> > vdd-csiphy1-1p2-supply = <&vreg_1p2_ex1>; <- individual supply in PCB
> > 
> > vdd-csiphy0-0p8-supply = <&vreg_0p9_ex0>; <- shared pin in the SoC
> > vdd-csiphy1-0p8-supply = <&vreg_0p9_ex1>; <- should be shared pin
> > 
> > I don't want to allow DT authors to make this kind of mistake.
> 
> I require anybody submitting patches to show how they tested this.
> 
> So you'd have to lie about testing it for a mistake like that to get
> through.

It's easy to miss it.

I think, the supplies should be reflecting actual pins on the SoC.

-- 
With best wishes
Dmitry

