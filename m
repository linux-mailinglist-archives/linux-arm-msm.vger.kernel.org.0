Return-Path: <linux-arm-msm+bounces-97903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIa/OfLbt2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:31:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B0297EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48A29303CEFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563C038F647;
	Mon, 16 Mar 2026 10:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6aV0x6a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzasGIe0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B5025DB12
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656969; cv=none; b=bXaHsPcbHYg2qOb4+sAy2JDjZ6cJyZ1xGQmNBj4HsZ1J7pDNx6ix0Rw5mn1uh5iLDTjT8VRMW4XiQ8Mju3vtFyNPtYxcyV4Pqaw0vKyT7gcCOIQCmqv84iOmYE7r5tGSBpgjuBmFKBiHdPhjFBZxZrbDt63nATKo0sBe94rgDpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656969; c=relaxed/simple;
	bh=sinyi7GmNx1mY7QcKno1ufbgfnuVSamjAas3mDig7QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpz1DmoF7yx1UdAuOXJZ1kW1LVtjXW/nGNySshYt4dC3lq2dIRqSG7wqsUKYkvviqWTX4hOdgdjlr/sgxsrjDyGTYT0sUziBqTN6k7QZsm7vfacrdpDuK3OyFId5W6OWKheTlmLdweHibSh+CaIsafgcUayRl9R6Jimt1712jvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6aV0x6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzasGIe0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64ajg3777541
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SyIK5mrij/+PqCxigjEeQmg92ExBxvCySG5xA439Ek=; b=G6aV0x6axHC7xP9b
	tEyrqajS9VD7TDEDv43Rb0nvkVZGF8pUrIlc4Zk6ieV+slRyBvyxyW9pWgEk5HUm
	vCbGDH0NTBcDvKXudHf5Cg2+qWymTirlODrBtKKqikT3pI8ASzdydwrzUzTLpNk8
	4QGWWtaZFtoOPK7jTW+jiv5RhLj8uXLvf0B1Y7GnJtzuktWv6869gvsk1/M1fc8z
	vEVplgikeDQ3sdkPrj0ntKHV6itEgXQC6C3tmDW/bMDULWJSPbEXrZi8ywSn8hvL
	BTjHNcXixfDQWcF7RkUpQcX/6m+D/0rf2rogXTnUNZzyk9AfYhzhG1ASe/nvA9M2
	sRe7rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7w46n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:29:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb39de5c54so286515585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773656966; x=1774261766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1SyIK5mrij/+PqCxigjEeQmg92ExBxvCySG5xA439Ek=;
        b=DzasGIe0+6QtrCv+Qe2vJjiDYVo1WoWyHkAl1hsNzC+jrIYJgC6tary3Auro7vpYG3
         NaqTqBJoiSyPacIBtYDKjtBLV7zDwxY7271ZHOZ2q6+dtbmGyebM+a5KfugzLIv9JS57
         lhNg77AQC9T+jdVB+3rZk+NdDItj9yJqsPdgJ7itItO6Qve0BLhLxLOxlZdDn0ZPxpTI
         jnGSHt/2ueo4sP1jJ8PTV+Ox98b+HA8WU0aILOgNBuXwKMrV0IuYj0HRW8g5+oerycjf
         pv0dFaYqpiWkhG+/xz6/Xgh0dleu4sTAc+UR/oo2xrOPpba9WcJjjQAKixuvZ8FAkJhf
         p+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656966; x=1774261766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SyIK5mrij/+PqCxigjEeQmg92ExBxvCySG5xA439Ek=;
        b=UKr+LgwVcTdpr2EFHlDIrr2cvdjoz61rByqtHsukWYsSolMTAhjIE0V1OcRwYDwWWw
         Pqe5f0n1rSZt3Ja3DmxUgPr6anL5CDxmF/NzSbCSahjhbMgVOJBdsSh9qio2glZN5im0
         SjAMIidbjptdsQYj4SpPYNjQXfAX5enNhuyjdRZ37Bm6T8sNY/ClDTPM8LASTnb41Ub+
         jTx8rfJOmdJ8FgVqQ+oaJlTzdhOEgGy4S2i+4BEnC/TJ6Ts1aGr5MbRyMv5EtxmPzslr
         +UtO/Un9CBkZRcFtfHz9ZXkDil7q2rdZnifrLxUTTjBg60vcDOiVweog1ar13kE9aEBI
         9OYA==
X-Gm-Message-State: AOJu0Yx2+mAZ0/W5Ut5hQpohGA0OF9Iw5MDcvi24Fp6zBNrJyuCELMXd
	gnp2kRFwpEFLLgMEoJhQZO+2CyuCDhoYviyNP8F6qsopjvotzokM0CMR9PHHbz9K+/5rK9afZdE
	PhkrD0C00rqPehwkx/iv5ze/QTmDlu4SCSbixChBU9Plo2CciAF7iuLVRGnlKYNW6eUuA
X-Gm-Gg: ATEYQzw0kHO6Ql+0IaZqwFlVd2YE1gqFTT7th0nFYewA41VL9n89bZou0IiT0MzvS02
	/+K5527Czq933Whz3diFJpon2okNtDYCkl9u3Il+BEgM8hZQWx7zyW2UKqLiRekYiKkwGAaGvYR
	u6YE1WvWwFSFMqw6r/18Dg8tx7DyM4UHuHFbJmnYSL1eE8fJ5pWaO6XuRru9FrQ9Uy+qDvMr68P
	sLUps3+GdU/IKYXTMN/8tYLEH1ovc3K2lUfv1jBRPYMhjt/3+Qcko9Uvc50LKqXnRrnaHtEVIQl
	1DcOjfFsXhtPf0YDpdQzyG+NszLk3LurDnqS7kdr2febfl+VLoH5XtQxqLK49gDYfWDuDJmJgBK
	jg3GFkGtWJhqIpG1IHGxnJh2E5emKdRtpjv3wG+wZXUFW7dFVJHSDNRKPcYK9JsQVaYMxdejDqM
	kQwgg=
X-Received: by 2002:a05:620a:4113:b0:8cd:9828:a7b4 with SMTP id af79cd13be357-8cdb5baac4amr1112215985a.9.1773656966466;
        Mon, 16 Mar 2026 03:29:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4113:b0:8cd:9828:a7b4 with SMTP id af79cd13be357-8cdb5baac4amr1112213485a.9.1773656965884;
        Mon, 16 Mar 2026 03:29:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350d80a90sm4876205a12.32.2026.03.16.03.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:29:24 -0700 (PDT)
Message-ID: <aaf2c23c-2c6b-45e1-a2a0-096249ea0d44@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:29:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RpWHXxs1m88zvjG3fYi0Ny2fAbESywOT
X-Proofpoint-ORIG-GUID: RpWHXxs1m88zvjG3fYi0Ny2fAbESywOT
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7db87 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=sGNizEhdnyv83XcJ-SoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MCBTYWx0ZWRfX5ynHmNS+Vblc
 ATNb0SbAMQaN6fPo/1OiJjmLx9jSRNrpTkKphTbg9zsU4cNp0xhI64reZdFqZiNUvX5+c5wxp7B
 49YI9bJmaLmun7GxTGhGhFpyYXc5lb7PonHKp/eCgIGWepugsbSqwkbveafKZEG/NQb1W/wRoAO
 7RdKwoGPfEKAbsgPb3cFGbRoLa5kKMBbp75MBEsGPHQccXChpsI8kOMgbQwYO3lgyZiZrWLzvVi
 gRZnHu3Ez4s8lnN7kGJJgYdTdknzrSv1txEZfmtUaJt8pWQaR0X/VYr0xNAi2jQ8WvJmudA76QR
 c5pfCGQQJRIs15q2UHYMYi0a+5mKKyMMYHCnOOOnxQKR7i7X6EoR1QckJsVxXdjYNsIa/J3hyx6
 X2bnBD3qI0ojHVsNkz63Csa17wmUqVDBHBO5f/oRI7SjnQa7xnphO96p0tolWqqiaZ4T93/H/8f
 DxW9o9x8m/f5nPTCzNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97903-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E8B0297EF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:29 AM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.
> 
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

[...]

> + * ------------------------------------------------------------------------------
> + * | Offset		| Name		| Description				|
> + * ------------------------------------------------------------------------------
> + * | 0x00		| Byte count	| Number of bytes in response		|
> + * |			|		| (exluding byte count)			|
> + * ------------------------------------------------------------------------------
> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|

qcom_ec_fan_debug_mode_off() documentation only mentions values 1/2
to be correct - is that the case?

> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|

What types are there? CPU/AUX or similar?

Konrad

