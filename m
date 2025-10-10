Return-Path: <linux-arm-msm+bounces-76764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A302DBCBE2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 09:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C257C3B1C77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 07:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBEE245020;
	Fri, 10 Oct 2025 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SABTPONg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3958124466D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760080411; cv=none; b=T91Zg06Zr8TIffLvvFih+kRJxon23hWYz7lR/IjL1aePAGkqiIWAnmWnm8DoqctFwvtMYtu64OD/rFIwMN3gjxDCBf/Xwy0gJnYTPlCptaG51vub+ePrWsUzTIJ2qLIPKN97GdlNjIdlqIF2s0JB+MxLmlNRsCy54t8yY8vS8Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760080411; c=relaxed/simple;
	bh=ts9kOQV52xX2ipkuJDjIaYy4QbG40eTx4UG+9BV7Wxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCRAeUxrtHqk0b3uAIVDFG0DncyuL59ACIAWITkoHUaTfDUhtfbTP8iPuObo/JPWfi+qIl+0aCZUGLycUm6q/hXh3etsjXNMA87iWJ/ZUVPy/ze4bNZXK/uRB99mgrq9ASy+yCh3vgG1hGXeF8zZfSbhuHbE7s7XT/rG8KTAXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SABTPONg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6WmAp024510
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KR/Ios316oNkK2GJ5MYH0w1E
	L7QWbrsGiZOp+JqAuJE=; b=SABTPONg6XJeCij2J5BfYfXwx+rYlvoIyOjXwfay
	h2M6Y5GAmx8to10ygS2uH9EzQhp2qsbWU3wf2EF9++qhsNaAEc7hLto+3FgQPEti
	v3IyZK4QKThOmgKLq0zDuf42DO4xBKc5Tr4BVbuMBcNyaKFdzP6eSegBxspSnJYW
	s+hhBHWb43B6O4Krdf8XaLuwywdkMr6yGwAR7Odn9OKyUbER10lycwq8aORZetV7
	YyibFS+AubM9r/EqqymE8UNtxrqU1VrqzCmMnLT/WHxs3/valwN0BaiGW/x2/zLQ
	P6l4jDoZSW+uLZmJVM8DG2cMxyC84JFZMwzEvEH1k7zt3Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kwes6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:13:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28eb14e3cafso55757275ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 00:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760080408; x=1760685208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KR/Ios316oNkK2GJ5MYH0w1EL7QWbrsGiZOp+JqAuJE=;
        b=f9XQz/upWbCNwQp/6r9KITrhaEUg/1qYZ/fSRrTtN4N0VIDaV4uhOY2+r1RmOi5Xan
         Oi3kxYmQOuLO5IJAyPRh//1GMVFqAMFX80gPn5779/0pQ5a5l/9tEZxhFz0mhwsK2NjM
         G/YRBR3dWS3Rfd2OzBPlSojpiMDcUcrwKGpqCc/IZI9nDLXJQuOlKCR8QMuvK3VIlYld
         J+LLHbds4QcCGDDKy4Ca+E/pb93YLSZj42JnCgCOTmvbYPwtu5rWNZiyPByScQNVMi0M
         nYJqy1wZw8q1WbCF0VUvWkqEr4vbRMTWAKqhFzN//3x+aFDekZqySArExd8RQDrSuAAv
         Xzig==
X-Forwarded-Encrypted: i=1; AJvYcCWt2IjVihVN8Koqh9zRYKMrn1Vgo50EzEZouAxoaNjZaHWfOanGfMDru7NiBD5BHg1aZVfZUl5FVtuF65SK@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIv/JBDMuIeCKf3gUTZUxLetKaCT5T+DEf3oGnbq1s7lu1I3H
	IiiOEvPOzZFr79ykAh9ndjdsFWswAWvazRPzQSvc2zdWAQYOp6uQIMRopwZLisYP5OwxTnCnJvr
	hbrj435VY8AujL4fZ/UrE0vNiHNMPawOEteIgScpSGbPMOJPaTSpGIDZ5Ap/Pyg+rkgi+
X-Gm-Gg: ASbGnctMpMWTWTRSYH2i1ETmEdv1JHephbqPNlJVNrklYwLUxGudNmOt+LTrDZiezA2
	b+B6sORKedAqnU1H306qU0EEYEAPhNcbhKUEAeWG3Uj5Fs5h/CtQuwlyqnAoXrbeBRgdBVgq5CX
	6zpQWsuwR/ayuGRLsf5eT+JWZsJfR/Ov2RHB1yNCC5StSQEqZqnZJZZ8KVjjt59ggqgK+0slZRt
	q3I15RIBPAbBAhnZcIqf6EKL8K+c3G4SwyTYkWIMt8yFnG/Nr2cLHRvlwJBRmxr/VGKBfc4OJbO
	YcoObNUqb5OmPAG2MRodbHwJCM7O1uXG0E7MprMQkyA3zuEpfro3qFjkzKj8V5tz6Ad0WcBpKP1
	WhjwnIORIvIg=
X-Received: by 2002:a17:902:e94e:b0:26f:7db2:3e1e with SMTP id d9443c01a7336-290273ffbe6mr131256165ad.47.1760080407494;
        Fri, 10 Oct 2025 00:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZomklByII8D+XieFuJ2V77oyKee3Dzlu5Ztu8yLBuVQK2BdzUtqGP5w8pf/EdEOpW5U1eww==
X-Received: by 2002:a17:902:e94e:b0:26f:7db2:3e1e with SMTP id d9443c01a7336-290273ffbe6mr131255795ad.47.1760080407019;
        Fri, 10 Oct 2025 00:13:27 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e45568sm48077925ad.55.2025.10.10.00.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 00:13:26 -0700 (PDT)
Date: Fri, 10 Oct 2025 00:13:24 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/24] arm64: dts: qcom: glymur-crd: Add power supply and
 sideband signal for pcie5
Message-ID: <aOiyFI0gBDh8YwLL@hu-qianyu-lv.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-20-24b601bbecc0@oss.qualcomm.com>
 <qudnwwle62rekkuaeriqhvkvk5xukl4fmkhkzjse5zud37vlxl@gek6nmscgvgs>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qudnwwle62rekkuaeriqhvkvk5xukl4fmkhkzjse5zud37vlxl@gek6nmscgvgs>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX1abYqUoFkzcZ
 H2tPxzAUff3GqVr3IUgMEQy+e04BjBg2zBZCtG5TM0rWtaMVx76cIQo4M6LK0f69fPbQk81nbH/
 /+Yi9Cq3b0qYaSIS2tJHfbVfwT70zO3v/aiPcu3QfO8g9FkVtzzQ/FYYIRY4ekVIpY37u7BhFSH
 Jh17AY72aS80R8+KTgS11iLk0fy9NCOTtnNZiwCQJ1BgHmXBGDaXUM6ZxMbYSGPMXMwrXXYb/fC
 6BfH242/KLvhZEmrhpI8MjhlmtpolDArOQ2V2BU9pxBilfUbomUzljq/daytOW7nml43NFp0HzC
 60G1DQ1+w5VsVnp7hOmLpM9/L3ybUT4tLrZ9ccSy0MGRrEKIMPP3BeGisTxEVyR7Zt5T3NPYVwf
 LTmlEjo0stGrbioyG99+B8aZ4mPsVg==
X-Proofpoint-GUID: 7OF7Zpcpw_sCNcA3UivBgdPiar2MkO8U
X-Proofpoint-ORIG-GUID: 7OF7Zpcpw_sCNcA3UivBgdPiar2MkO8U
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e8b218 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=CFs5gaHkoshYMbNuCBMA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 12:53:24PM +0300, Abel Vesa wrote:
> On 25-09-25 12:02:28, Pankaj Patil wrote:
> > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > Add perst, wake and clkreq sideband signals and required regulators in
> > PCIe5 controller and PHY device tree node.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 68 +++++++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index 3f94bdf8b3ccfdff182005d67b8b3f84f956a430..03aacdb1dd7e2354fe31e63183519e53fa022829 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -107,6 +107,20 @@ port@1 {
> >  			};
> >  		};
> >  	};
> > +
> > +	vreg_nvme: regulator-nvme {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_NVME_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&nvme_reg_en>;
> > +		pinctrl-names = "default";
> > +	};
> >  };
> >  
> >  &tlmm {
> 
> so tlmm already exists in here, but ...
> 
> > @@ -461,3 +475,57 @@ vreg_l4h_e0_1p2: ldo4 {
> >  &pmk8850_rtc {
> >  	no-alarm;
> >  };
> > +
> > +&pmh0101_gpios {
> > +	nvme_reg_en: nvme-reg-en-state {
> > +		pins = "gpio14";
> > +		function = "normal";
> > +		bias-disable;
> > +	};
> > +};
> > +
> > +&tlmm {
> 
> you add it here again.

Will move this part to above tlmm node.

- Qiang Yu
> 
> > +	pcie5_default: pcie5-default-state {
> > +		clkreq-n-pins {
> > +			pins = "gpio153";
> > +			function = "pcie5_clk_req_n";
> > +			drive-strength = <2>;
> > +			bias-pull-up;
> > +		};
> > +

