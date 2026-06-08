Return-Path: <linux-arm-msm+bounces-111766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OxwHBgKIJmr6YAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:14:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ACA65478D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:14:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HMKkh2SB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iC7lyTeQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111766-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111766-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95D69304179B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5221DE8BF;
	Mon,  8 Jun 2026 09:04:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F5836DA18
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:04:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909444; cv=none; b=sSibaV98aGbJnu0HhY17oJphTkC2XyFRsHLL8FlIQiEJBkS9A+YDpeBNzAYB6QDdS9a9GjgkIAawgKhpDdjvOEPjsGgVTsLsoVFhZplu9JVQHFr+ns93zyscDZs7Rtv2STaZrknY0o6IJaw+ZUl7gZh2R3mgy6qvNm/Fhl5jbGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909444; c=relaxed/simple;
	bh=6A6btgmpIa3JacfD/8nNjTQ7RogYW6UV3lMsUOlPX5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSKApUGkg1wBS3iASD7MwLmoZ8IWhX3ezc5KtkCQHoQ6gfdsMjZrEEbEze8eOg5ox8Qp9cmtFnGN7QSbgReT1eKfBZLP60R2H3MOrq9oOuRB8o4rqFaa9cC7QWcNMM3JDJcKMME+Xvhhek2ZBtHtQKaiq1oyc5Z4jKlRmnRV+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMKkh2SB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iC7lyTeQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OllI2347183
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zvzlX9W5yikFyCEaTo4XqK1r8wv4Ou9Fa6viAVAc6jo=; b=HMKkh2SB2+h5Sh7L
	8lcvK52V2z6yR4AwrY20SBtGyT0h1Kn5wLpAVBDNIL6+u3crh4QHKysJF6B/6sJD
	E5UCenyqyuR+e2U4Tc1aNgIyOQHT/p0qJTGd/KCY+dPYCBX43brB4ZyAM0vyEtiQ
	q/VURLlyDvnVm86a1Ygp4kN8sdpJ4YqXc11QcW3T94ZmGCIPnu7p35u6l8h8DYs0
	kdTTNNagy4hikFgzOOmQxKF86BWeZTqCpe0aO8AqiT7or/G/+CSQFYHeJB0KsOlS
	Kgk/Xj7Cb9JkXD+h6Bzhi5dWk0yVsAIB9vSMoZQxZzvMyAfKEoH4TDN30f97LjtE
	LH8Nhw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrf804-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:04:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517865e6219so8844211cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780909442; x=1781514242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zvzlX9W5yikFyCEaTo4XqK1r8wv4Ou9Fa6viAVAc6jo=;
        b=iC7lyTeQbgCh9t9U2jhmpVmfHxua0d7KNWZQwgWbG9qOMSht7vPqlNDSUFALRIYV5h
         dVCqw0kyjOXWaaUe99nywFacwPCISlfA6gVcYpYc+kfrgmoy7LMfMtlWWrJWKOn4e8AJ
         laVPgSqBDa7ByRSqFjbef5xFXZ1Bxw1MQ3b6tcXF8bq6WZdOBKDeztvTrba4lmlvH8dn
         hdl3/JKCH2f/QORG7zeZoCJ3dfddsPUkXwNi8gUXVA8wx6vjCVAIC24lVna2VEbK62AJ
         HiZb98o64cY284aOZt7dbOLlG4mKR3V4e/WXJQrEV0g+08zpbfOwYhNrv9FGjAPUpSh/
         K2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909442; x=1781514242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvzlX9W5yikFyCEaTo4XqK1r8wv4Ou9Fa6viAVAc6jo=;
        b=jwk+oTr4HihR6cmwc6wVvd4DFGqvTGm8TT7mP8KKFfHG4JqhzcrEOuMLtc1MA+gKpI
         hOAB7J6AslBZ8qZ2+88A9kZIrnQza7FAtKd3RCO1vE5RyA6PFan01LrOjhEB93DSg8/P
         BsT2d67oXXHiP62SNVohMJmedaYjYEBlBqox8NHAJhaLljifqbPK+DKyqNpOnm7CpgdX
         vRIoJxIlSb9ei+cyU89KELEgwjayna/oOCG8cLiQPaCDZ6okAPXY7TPaZRdFCdo41VRv
         znOG+oqC6SStAJNN2S/ExA0taY4nhH/NAuVL9AWkPj67qNw91SmhZW3Kijw+ND46zdhA
         ef/g==
X-Forwarded-Encrypted: i=1; AFNElJ80fS/m7vvANlb7H4Z36q3YPH6ioztNrRSHB/pKs8HvhOEsdPZNGRZmhT6wyo2dK4J8tZaHiYRwERr4wsnd@vger.kernel.org
X-Gm-Message-State: AOJu0YyflfWcNMkrQDqdgKADcbU9OcCJnghjCpm9yKsULG9icahHTqy6
	8UrOg+AEx8yDpULDBTLS0jwnGtGhAcKpsTSK8YqJE21Es33n4rsY4X0d9wP7LRcWhh5y8TvuOn9
	pU7E/u4598+bpCSqxusjCHbTbK1hEixIY+zSoBOJUZcypa299LifWDZ+IalNHiWYtNNrw
X-Gm-Gg: Acq92OGY4A97jnWKFIG4mf/5j5IBEYqN+pNNg7I5NlKL4qYn6i1AyL+LzNbewB3GUig
	t5QyBAhK9Nd0s8ZYzhLWcJ5PjKFGaqLxh1pUJqrIVAx0p8S+4yAGDgV83SWtZlHlYpXpfAJixuv
	g/+y+q6p9xjfE+k80a+Tj9OhbYd8EYJOux1SYEepcMB/3Vo/iRRWP4dfhTJM2PF84KOTPeYALfZ
	f0d3EOGmEeTRJWM4aPTn/joSNMqYOVrpsdn90DI/n4+Wr/bGNl2aGUAur0QgX2SMlRl64fm1nAA
	1o1yzxawzto9FvdfEO+4ilKEDCc4IbgpoPbKRPo/N6gWNafgHV6Dzm9PN/0H4sEQjZAhBFweo36
	p1UYzF12GzcGURhlleRH0dt33Y1RlvlSMS6Vg29cdyfu4+GzZgsCcikYL
X-Received: by 2002:a05:622a:5c07:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51795aa8c57mr143239791cf.2.1780909442170;
        Mon, 08 Jun 2026 02:04:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51795aa8c57mr143239501cf.2.1780909441801;
        Mon, 08 Jun 2026 02:04:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05177150esm833003166b.5.2026.06.08.02.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:04:01 -0700 (PDT)
Message-ID: <67c404d1-6188-4a8c-8243-6827d4a38d87@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:03:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: merge duplicate
 &pmh0101_gpios node extensions
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NCBTYWx0ZWRfX/i4X6kqt0Xpa
 roSGoIq9dFvd8RyjMQmreNhRViAH21BPlOU8kYwyqVkFOyaekgulKPbaalfy5Rt6iN6A5UqkkRP
 rg5F47l2MNWuU4LSOy47apNY6buxyC1Ew53Ze3EBpakbewfP+1QCc3zBzd+fXXY5Jcjs+ok8J1r
 8ATPd/lQS/kzlJxkY+1LPk7h6K5NKTeAcQUfPpMBV0RgRY3qtkS7noWc6O/aEYIwPQwl2a5ItO+
 VEk6/gaWMff/1AK2fdVP8zh3GmQk6zLFh7rpB/fXmOl8N2iB0Vz05mz6XEKmHaWcOT/S6mKhNSt
 nhNQd2VGDEvOWD4RMF83PDVmIv4GWgC4EzKDyWzrGlM9Vxpm4nW775qtWuuI1QZ41+qxPbYiebQ
 DHewcAYYV2HIQrRRNIhqe4n7Sm/udegsLDfb3GyyyLwDDBBB2eAUvkZSQEWXhKRyf6B+q+05CuH
 zVfzvrw4c88A9vkSRjg==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a268583 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LoXqgms-zDgafVaz8s0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ng5KKmObo3ndUp-cWzXPfq0x4_X8Z9sN
X-Proofpoint-GUID: ng5KKmObo3ndUp-cWzXPfq0x4_X8Z9sN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111766-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gopikrishna.garmidi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81ACA65478D

On 6/2/26 11:48 AM, Gopikrishna Garmidi wrote:
> The &pmh0101_gpios node is extended twice in glymur-crd.dtsi. The first
> extension defines the nvme_reg_en pinctrl state for the NVMe regulator
> enable GPIO (gpio14), and the second adds key_vol_up_default for the
> volume-up key (gpio6).
> 
> Merge both pinctrl states into a single &pmh0101_gpios block to avoid
> the duplicate node extension.
> 
> No functional change intended.
> 
> Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

