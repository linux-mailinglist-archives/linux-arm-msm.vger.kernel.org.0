Return-Path: <linux-arm-msm+bounces-96699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FeoNfwusGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:47:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E75C252621
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FFFC324BA99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B57391E75;
	Tue, 10 Mar 2026 14:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppXc3x6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKSlLvXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3111391E62
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151914; cv=none; b=G19oysan+ctYNhlw/h07HE4IEAlPmIdz7bCNJ8/SiY3BpwL5hmCn/cBHNm75GWu8FjqBLg7WKZ6v6q0lzM3FBGckY8UisWt+OsYvnC5r378lO2zo9MY7FVHhu0NeanTj31Sx2wBt9UZGm3XUbLV2LhywjDT+/uYRaw6gcliYWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151914; c=relaxed/simple;
	bh=7muMfh6lcHWoySE4hvw56qjM02VGOSc1W+rxRD6Wf7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEy9Lup6aimiyAQuI97T5aqN+DbPZtNgU8/nF9TbU0NQjUpT/KP3nHpBO/zh+Cv5NBRyHqHPSXhpwAiYMxs9c61nDy3+AmdmAJHZW6gnORWb0zEvJGQHZyUS+McNEl656OQWjnb865F5ZXy3BpywVgbBNxyiQ6blQoou/Y6wkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppXc3x6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKSlLvXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACanL22862598
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvqiKT0wunx5Wn8N1T4C8ObS3BrVloNnACj2VIsFGmo=; b=ppXc3x6It3Uc3En8
	GdZ+fjEhhrvAjzqSqd9UxJcZeAVNJmwXRgoqzS5kZgQQYS34HwdvKJMPBHh+M0Pi
	s8azKCmcWlzLwHn62BtHCH5aVa2ge6SV2g5pmdSFexsMxCqf6NOyzNdghJiJRvsT
	NLFsSb4eSm7TMj23WoUgloheMhP6v/GPkHqo4rqyxjy0kfU6HZzPtAgTGaJ6My2e
	SxgH6PvG5pTwc1lqH6lyBQ3f1HgkSXo5ovGGwen0FHZa4Q1bPCwJZRqGgUMTFrGs
	eEceoVGrmn7+AEALCeHxqtmWakljzbBA8/urdRRDZfHRZPhPgdXEzD9xvSG7tGi0
	XZ0lNg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w9nyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:11:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffaa21ba15so1279457137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773151912; x=1773756712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvqiKT0wunx5Wn8N1T4C8ObS3BrVloNnACj2VIsFGmo=;
        b=eKSlLvXD4InNC1ftENGV1C6iDaZtXonhHljd5mRI4oCm1bMLrd4hXJIrLaf5iI5g/a
         ZiFN6yYEmQORlPWSkje3oHwQ24CX/coDcDyOqMk632ODOQ5AHmkvTe+9o06lGA/W8S27
         sgUUsFYFA8CElbPB9nsHmfRO/OCVFKWYECQ6fqaYvr0mXSDOO3p6q7ZJBE91YTSE9rWB
         lhEmNk/K+lg88ooDWMcZ0KPs5k2H8tTTS/AmR9fQIcEbFtn2UYf1PtLh2GrZNIOUbKXn
         nn3TJBbfyliQLCiD+Isr58V4jiRvzYh327bnsdeg7/MSQBNvoO2Y6hz/dZNQTA5+6wt8
         k7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151912; x=1773756712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvqiKT0wunx5Wn8N1T4C8ObS3BrVloNnACj2VIsFGmo=;
        b=ispDNA0SHU0p/oTBFHK2U/s40ok78dU3nAxf05qX/up71q7uFZZxUueuZYxELkOtVG
         WOvBfd5cCZL3i0MTB+8geBPp4X1A8Yl4DPP/mfb3M6+098CZAiHluy6goix/NvpUOTu5
         aZSM/u+sc2ZDraVxYEo2tYOwJhpQK822RLdig796lva9mGN2pI9LJ32Mkaw/A/p/MKCL
         GIsl2vvWGdZthF0/CKNJIP0Ut4Rx8ePPipW0LyHFGnhHRXe+SHbKql11t4Y+dSFooslT
         51oRj9v2aclkQbiCnKtm3rQus/v8maiSZRl8wVVI8ywOKrFHBJPBrav4QeRCLCkA+Y6X
         tU9g==
X-Gm-Message-State: AOJu0YyREp1ezAAhh/PnklVmlRhk/tF5kBH7+v6zPfKoifrGzT/6NxSy
	8FfTgwlp67/Hi7e2NIHsMSn6In6oyBMAW1goH6u+5uv6Is5Eg3EaORLoWZcr6I7YoKpTPLw3OrK
	F4dEjShAOH6XMyONlbSRtx3Kui1Q4Tx/UgyOUH/2EOX5McfHikLfAOpW55CTNRFhLUzXR
X-Gm-Gg: ATEYQzygoISjDt2Dg/92aFk2MvqMP9oCxpBWa3sMyJJcmw8hp+q7jv1LfxQLQJjWOsZ
	P4SEJaGILsto7PPGxZvB93/iUyuoeJXak5eWZVqPwL+AMrxWtjObmYREB80z8yIL4xCVbq30lw3
	BKs7oYYdL0itYsLeBYhTvVtQMSsI2c32g9NeXCSk19Yz+KegvhgpLshM7qPkqbOMYNVynWxUxUg
	DoXWkhEH+0Oic9Alcp00ttM6/F1YcLxdmxZOiZLg4oOJpdxq++9RJSkKagHodD4xpTcn3aAvP2V
	UcbKKxoM5JMAsyig7MozmV+vw6Jc9GVzba883hUKH/zjCLKBeU93Y+U7a0vDGwUDt199PuUs2E6
	R3/Wwoq/db+v5UFaARZcrWZUtBvft5TpepbToMRUqGWC4fpWvQSVpO5yhvXj3iWpCrEGNMWdIxd
	aGudw=
X-Received: by 2002:a05:6102:5094:b0:5ff:2a5a:30ce with SMTP id ada2fe7eead31-5ffe5a6dbacmr2804824137.0.1773151912059;
        Tue, 10 Mar 2026 07:11:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5094:b0:5ff:2a5a:30ce with SMTP id ada2fe7eead31-5ffe5a6dbacmr2804810137.0.1773151911583;
        Tue, 10 Mar 2026 07:11:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f139e0dsm520650866b.41.2026.03.10.07.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:11:50 -0700 (PDT)
Message-ID: <5186fd6a-45a4-404e-895d-671a88fd0469@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:11:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250: Add inline crypto engine
To: Alexander Koskovich <akoskovich@pm.me>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260309-sm8250-ice-v3-0-418bf5c5c042@pm.me>
 <20260309-sm8250-ice-v3-2-418bf5c5c042@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-sm8250-ice-v3-2-418bf5c5c042@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyMyBTYWx0ZWRfXw9gpSjir/Bvk
 ctMFIAtFiFNhC/QNdgTHBay/Fh+64gVY0/xsJMOTPqA0PMQnqTQ0Mogr3dbD7NmnFyWiMTJNt/+
 4kT5Ifz9gibAvLefMGv9hy32gRF3WzuRRRUu66mWoEAezU2ffn9R0kRR7+CQ83Hx/HCItoKDZVu
 GYlPKVHiq5TPXt4J4AHloHqvKW/NoaQMeO/c9CXvNmA8kO4jiW7xX49jS8lzyY9vWh6wlMXBks3
 wi54UlltZTK4uKCCryBcU6lJlzLk5JaL3NZOs08c39Wql+09YTo5lPbRUqo5/hjWhEuILEAmKqt
 UUUzHN9FbymW6Mh6mBLH950szWKPeXLbEm5ycD5MhCrhRfF3+kMC1lLAsnNSE2lJFLjiXQZDfmb
 t0GMwkoOOElKKvb/CNS/X/cxwCNNWeXpdgQ5ICNieKLodQe7FyiYYzOkpBtVVUBr6baZOyRVCMB
 7rhdUQJmMlRCdS0iq/Q==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b026a9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HrWJjY-GxD1LJqCxqiEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: E26FEISLIGA3UQV-KqvgHUZo3GO6M5B6
X-Proofpoint-GUID: E26FEISLIGA3UQV-KqvgHUZo3GO6M5B6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100123
X-Rspamd-Queue-Id: 3E75C252621
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96699-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,pm.me:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 4:12 AM, Alexander Koskovich wrote:
> Add the ICE found on sm8250 and link it to the UFS node.
> 
> qcom-ice 1d90000.crypto: Found QC Inline Crypto Engine (ICE) v3.1.81
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

