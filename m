Return-Path: <linux-arm-msm+bounces-84386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D7CCA400C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 15:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F892300A8E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 14:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F45334B414;
	Thu,  4 Dec 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCEGbSFv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKGjHTXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C34734B195
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764857964; cv=none; b=S5R8XM+SrOduflsnQBKihOi+tdz+2LxMCP4BRoMHrztCl6uLgW64LoS1nXeWlAFsjT+TmG+Zsna6P5fQOc8zqRrnCD3eLDCJ6IpWnEi2hYhOhmhem1viA/P4cIeJ7ckaCYFMalJrP/p4TIVbVLUEPwykVVEzG92jzC68B9KSDA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764857964; c=relaxed/simple;
	bh=9NGOiGgKQa/KDGOvvjC+eE73/jRynpYOOqfFL+r7lbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UudIc0TljXc7j/VZ7bHHbTLr/1ahp/mVP6owAwl4tDvWStCM8y3JWpKPiejL7Xo/F85R+nRBpWS4T/v0yoho9Xqt8DWvD9cNecTlMHHftzFc98tZP93VHvxQp6KCRTQYCjxmiVml/iIl7ggmmeJqNsNMmPIDhaFOVSQhnG7Pq00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCEGbSFv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKGjHTXW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4B0tS0614186
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 14:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mqkwYOUmyjupzirFYCxiZXeG
	rlAicEzgr6b6eb9AWv8=; b=HCEGbSFvYa0sLYysDUcgB9uuxQEeLSuSdpnYs5P8
	rR9vvSlSDap99mqTIweB8oejsLdx943GsX7638oAwSAyJKLMH8zvzHJqJ18e+Qn6
	fmwA+Mx3HRBh7aiRJq1arz14AuxR/StWKilHp4UIMBxeWtEl9qv6OQLfZSCBi23t
	eqvmXiiK67Ssbus9YwOM/Isfcs+psU+rVMWbdzBGZXrrnoZO7wzBCti/fZIdUKhE
	Qu0PLv2e1B3iqkkPFnVwAZX5o6gTOG3naXYE/vYDYFNvoUhgT6eZBpW4xgVtpY17
	URP97X8dSu8rhcSTeTS/+s4+NFfBGn9156a+y00tcItKmA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au9298gu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 14:19:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-559597352f9so597451e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764857954; x=1765462754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqkwYOUmyjupzirFYCxiZXeGrlAicEzgr6b6eb9AWv8=;
        b=CKGjHTXWptycNKVio2gmFp8EaMBAog52MHjvLweyY5o59UjYQvacFoQCaUHoyG6ksH
         ruvODsXQoMZXNvf5PK1jbKW1Lvf0H0kZ+0Wdvr0T8ZmynlxxffH+sSFcqCaL6eSICU8N
         PhOoAIsi9oXWl1SedOTS8mNRPZKZF05xvA9CcJAfnyq8ea8HqG/N4ewXMWukuTOl7ZYc
         HIDMP+AAHO6nFhmIjwcY5fCg/XxxjRBDaBbVrI/JWDSLa0OPv1ZzIow/oZYXd7DkWDuF
         0TgA2ITPg5riUEk8zRGJG2Z5/kB6Wo7qdkg/ZzixQ1Lujnr9LfwNQHXBrQIu4LzSVleq
         uRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764857954; x=1765462754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqkwYOUmyjupzirFYCxiZXeGrlAicEzgr6b6eb9AWv8=;
        b=JoBAn+ZrOSK2hNsth5aJdRq2DPFwO+nCPDbHS2VI3cdtvquXoxSrvmEHpBXefqoZdQ
         TEjOmePmv/GbGz30NZhTdUioGpPhehAE5qAQT3GCnr0xpaOd2dtk3eyE+vGRfE1BDqZ3
         as/jOkkmEV/lKOiAQQ/7mUSrQw99LCfthqayIzdeFbBAiSGI5kGCuci4eUa0tYmm7f56
         BjfvQtQ4MntAXsL+PuVLb1YkbqhPxPkF1wuDZZ8bP2pBxtq64tFjdpPoi75od6i94s4d
         HkOkEoTom3nPdbF3zKLUaoPtPI3yyaFaBN92AtRSsvzesmWjN0KbjvazIZpyfmm5mLde
         c2YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqv+ofsoFiWUxlcQQeUcBZp11vbhiiVg4AnJv+cXCJxoT6WhKzhQLpCZSBzTQ2frA8rBWctgBM2mKspQLY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy503pwZJEChtV+/+WxOCZeZ3NOtuKENk8ZFg1hMYUeJ0Ly18cn
	a1wYDdu7RccwNttw1giJJA5kO44UIZsjzqonDBlaAwR7wKD5EMjFVw3YMwJSm8nwzhxgrE+gvLd
	+NN7eSjxZyyN28Gy15uci4dto0h2Czt3Vy6ZnW6doUnoHnOs156Zy/UCTh8par0kL7gO4
X-Gm-Gg: ASbGnctdV8J7yDMIan5kyrAH6hFrRIaet0Sa/juS32iM6WvW4o2zQJALA69RD9iA1rx
	QHfIUsXwRaqDd1BXKU97faERNRiItQMyQQJoduSX4VAFHbIuwYrRuNEpofFCvQxUoon6dP4PZtf
	JtucUTsrU9HbD0pAm1UjKnkEs03GixreiX6HPV20Q504JxOeIOtw7XNmQDB41pieIdUYgIWUX72
	mjW0Z4aSA8pn+O/RAnWRg4D0WD5RsVF7GIWsvodblINT/wBtb/JgmWwU95R1mgIZLpy5s4PEJvB
	6+BFEaDdp22YK6tiI00U9Jc2Wki95ScowKct8mMB3m5vCU8lfjQfhQlg8sM8co07c9I0Dw0sNeA
	soSoXAY6MIRxj5a66dodN1QGOPQdhaBsjgDvz/tf/E7Sk+GwX0eARziwkQDypThCxLn72iYYr16
	lXVQY1bzO2ebSw0X8EIP8kiKI=
X-Received: by 2002:a05:6122:8b1c:b0:55b:305b:4e3e with SMTP id 71dfb90a1353d-55e5c069222mr2089150e0c.20.1764857954260;
        Thu, 04 Dec 2025 06:19:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+C9sPLLhanFRiDS0Uhb5SqXmagHH84fKENQBceI675Xl3lju6FqtHCMLOcYbmnIYg1z1JPA==
X-Received: by 2002:a05:6122:8b1c:b0:55b:305b:4e3e with SMTP id 71dfb90a1353d-55e5c069222mr2089112e0c.20.1764857953644;
        Thu, 04 Dec 2025 06:19:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a550sm565511e87.6.2025.12.04.06.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 06:19:12 -0800 (PST)
Date: Thu, 4 Dec 2025 16:19:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: s-yNsmIovlbCJJbSlLMQmETlpQN0V9JK
X-Proofpoint-GUID: s-yNsmIovlbCJJbSlLMQmETlpQN0V9JK
X-Authority-Analysis: v=2.4 cv=UddciaSN c=1 sm=1 tr=0 ts=69319863 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=sIfkXvtQUm5KZGAQGskA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExNiBTYWx0ZWRfX+1H0yPY7jGTO
 Dv7e3cPvHpPbgSUmNIkEhctMFQWpNoyiVYR4k/Kwsrpn5vhy6+cYkZYZdQFNQQTLtRfdCp2xnq7
 /V/3BuqT6xNiQZizd84WQ38J4uPBi/EPO64dIoR2XEzucw/qNtNIB8FCcFcSFGjfG0iJqL0R+Zh
 3Uf5T7xdXj7BSDxD293dkMdKMPBd8ky4ONqxW6R1PzMJPCrEpQDeilGDLU1erojg24DwduTIjdz
 IvjQhlGEGQdy4n5jN09FlqFUdtaEbTelvdtWv3Tt8MFsdNMrIf0SEXkNYECxUEAdGAUBdeD1AdN
 rFp57ZGUWjJMcOk0IAopezF1IAvTYHHoCOy8EUVHArmvKgJEcNyrRiXed+EtVj14fJnIY5WuYxD
 jDbCX48vaW9qZQZRAjJ1XsR0fO4b+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040116

On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> > On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>
> >>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>
> >>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +			gpu_opp_table: opp-table {
> >>> +				compatible = "operating-points-v2";
> >>> +
> >>> +				opp-845000000 {
> >>> +					opp-hz = /bits/ 64 <845000000>;
> >>> +					required-opps = <&rpmhpd_opp_turbo>;
> >>> +					opp-peak-kBps = <7050000>;
> >>> +				};
> >>
> >> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >> or mobile parts specifically?
> > 
> > msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> > here.
> 
> The IoT/Auto variants have a different frequency plan compared to the
> mobile variant. I reviewed the downstream code and this aligns with that
> except the 290Mhz corner. We can remove that one.
> 
> Here we are describing the IoT variant of Talos. So we can ignore the
> speedbins from the mobile variant until that is supported.

No, we are describing just Talos, which hopefully covers both mobile and
non-mobile platforms.


-- 
With best wishes
Dmitry

