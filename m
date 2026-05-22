Return-Path: <linux-arm-msm+bounces-109233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDbjEDArEGo1UgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:08:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E55B5B1B6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E7FF30090B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783AC3C585E;
	Fri, 22 May 2026 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UtYl94lR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyAEAWug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CC23B8955
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444523; cv=none; b=BvvPLNe/LOfH2331H2bPSgcEzr1gbpzlk5LMZEMyQMdQ6qJe5unU+mnKiHB9BJVaBd7BG7DyN9BUWcc0/qaz7px9e/+u5DONHGB9yvZrPz4LMe8EeAgXUefCegKS7v/4mDZmZdTG57TXtOo6GFFoHpOO3N7isZhbZUI51TAZSgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444523; c=relaxed/simple;
	bh=P2kyltBA6J8KNAYonTDpKbPDO6R6nJqsHFS+b9EzjAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4Sn2YgDtQWsbynu7j/JsPHllAjttI/dQCvJ/uw+wiaiuTSDoa3miowpbSYn2GXB3DZN9gIu3LtoRtr0zDZkNj6REnEzUKTrtEm2D1HR/m4/DjMM28g0tVZ33E5MRu3xAmN3eiKOWGBeIL4+hCD/UHvbVd3bisEp3f+fh+Hdvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UtYl94lR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyAEAWug; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8cIYK3532125
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZpZL/fGUYGfNeJBmp7s5qe+N7ItZ1tD9P6J+MaXyXGI=; b=UtYl94lRmWbIWvrJ
	KuwubPhRfQJd5vs08UAgWGKRMEQ0f3aVjZRiC8ZusYYqoxHibAFDGVhXhtGuTKjE
	HDfbeiArHRpXi9dTRkNGDs1vIpOdjh+6sR3yQjqUxBiY9vphcE1rgpuKrlMBoFZi
	+PBCRBrLBkDEGbEZxoBCrwZLwqmz5s7P/Qihwz/9eB4MDqaQo8HvLLP2pqjDdc0Y
	GZnfamDBuM/ZL7rgXE+asF8DnQ5pj6xpzzIfJuDOrSWF/Wb9pjx+2UI6yM/R3ktR
	6OzyMSNZREggBQi4qB/PBJqFF0eDJ8/ay3FudKwhym1WiWUZZ7IHZM3p0PCHGXkS
	e87VJw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvj3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:08:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b5cc5cd2so22306951cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444520; x=1780049320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpZL/fGUYGfNeJBmp7s5qe+N7ItZ1tD9P6J+MaXyXGI=;
        b=AyAEAWugc6evpsEVb5LJ7dufhmwGWcGDy1ZDi+5fnDR+7KuIPnMAu2Y1IttG5ftaDc
         GS0EUSjQIkMEHwb0Mf9n9UrezZTj+oPhBYNGUv/rCLrp21UM5bSDM9QGkGgP+JJ1JUpp
         HoTF1z5Bs8tLpTA3ejnBSD0cjB92tILr6swBkXsgQz5guh9aN6cWihMgrKcsq0aGjjDr
         f5nSTAxn5p1UQz0Ij2r89yBPoCWtt2CxZJ6vvzlmgU23OLgmMUgG51krHmq1wqS2t3VU
         P15AivmxPnc1OX2vpvkgQblPcsiBi8Q1Yrxs7fm9mYWRPj2ijd0SD8D5OT8ZGXa7ZsHK
         A3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444520; x=1780049320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpZL/fGUYGfNeJBmp7s5qe+N7ItZ1tD9P6J+MaXyXGI=;
        b=TbPgj5mPshgotJ+diLCs+N6NkaZeajt4eTLrNtW3q8bhX0h6riQ0N9pfnyBl5sVkp4
         SE3py7nJ+q2LiUIK6oC8q5WgGYGLEKW2kYVE/hripjlkVhr6prXJ4ECO3iKG0LJ7FbJi
         eGM5zrL8rnu3gg5pWASxmipkFk2kFzJ8MQHENW9oHEZv1AUGW6O3G85HEBuQdVQbHCtO
         ULgG0snXmSSCrHfH2sB9ZKU8tsGcwbDMs/kRqmBw0/vlKzyChHT//XHt0qo2UqEjB43n
         ESrrJVf5WO9KTnWjJyj0Ru5Q6rLaOtJZMQc7aibgcWPWdrP06B79E4B8PlQK8e2Cp7F6
         czDA==
X-Gm-Message-State: AOJu0Yzg/JB2zBnctrgo26R9zdgiwPYxqOF0xSSiqsvxo22hIf4aBRN0
	8wkqn7T0jpLuEEmzOUr6u9op6jIGzfhhbg6ochoOsknsRYMVK3ox5uITvn0TGm1TfFNDI2DBac5
	m5gAKZo/Kz2BZAy8i+h/Zi7O3GaDBk0UZ8fO2AoGlKcfjgqRZqM/QRzI4yAC8niUaudJ0
X-Gm-Gg: Acq92OFMJ9/t25G3ld48QbejUGXx6Xr6It5F9Q/PdKn8BOU4j/6j9YOOJopjCy1JR7v
	sR/j7JgxC4RoQaF7knqsAzr1saiCjH7RYgw2ZAOwHGLbYemO4P2a++PP/n+KcFiIVIzhN3z8K2y
	ZobP/PXskEyJJRiyUJbMymqqvKiFySZO1AkHtrDL8tenUE/j7ya7DBmAcLlTKe5pzEmOWWCOmLD
	EsaiIvEQt8xO/tvE3TqFcNiXFv9uPdZnXQccY0u4wkBbp7jydxtJpMNJZ98fn1KqqFYeYKOTNJH
	OsZQLDslH3bDki3ycIN57n0Dh0nouGnSaHNNWoU6hWX677U9/F4z9SZdNMgQA0BMtyc9XbLrLwv
	PkodBvCu7YG5iHenZb9m5kXvnNTvJm9Sp8Zqdivyu8u3y4w==
X-Received: by 2002:a05:620a:2a08:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914b49c2f28mr295793185a.7.1779444520348;
        Fri, 22 May 2026 03:08:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914b49c2f28mr295789985a.7.1779444519940;
        Fri, 22 May 2026 03:08:39 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ed2d38sm37794866b.34.2026.05.22.03.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:08:39 -0700 (PDT)
Message-ID: <6d117343-ead6-4f91-ab07-d315356d0ccc@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:08:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260503-expressatt-touchkey-v1-1-f7dd5db64e0d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503-expressatt-touchkey-v1-1-f7dd5db64e0d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a102b29 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=W2_YLVZPviVWVX_7ETMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: RP7jvdVKrmjIaLJlJMRnQqhTwa-TERf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMCBTYWx0ZWRfXy7UN4tBW6ZYJ
 f85UyfxALf5JJANi/c0mxYGq+zMGyfM1vi3ZIuOapLVS4U92iW6orUH9wmUHhy6glfSQ+whr9Pn
 SXO3r84UNKB31ZRZNb6OoqGXuWeJG62wEEUVsOnPwn7TCMkpTjKhHecKD18ZMO/D7h9qOKJ/3Pq
 rSay6Tzh3ly36uho2wIrMKoTY/ftN1mMuPGMZ8OYAzpIcFVFwlC7ugXhhfYwD8FGESHoQ+xfcE/
 Ny2kzzfhyhI5EbViuyvPqN3rA+c/uI6Bbg0NdUqpluDdwmstiPnmK0lZXRw4EJ+oBSzkUuELUQF
 Cs2LM97srbFd3IS1uM2Gu3dc7HcCPa1JwuRUjDRfgPk1+UI2nOcqorGjeYa4dTHNVtA40mdhnGa
 WTtF2F9aWQQofK/7V2E1bN//Ef1bJNR3hOqcgLRnHzwtkxt9i+w9XnSVfk9mWjMd1m8D8JtOvrj
 /cPAdamln8tUuvuX6eA==
X-Proofpoint-GUID: RP7jvdVKrmjIaLJlJMRnQqhTwa-TERf8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109233-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E55B5B1B6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/3/26 11:24 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the tc360 touchkey. It's unknown if this is the actual model of the
> touchkey, as downstream doesn't mention a variant, but this works.
> 
> Link:
> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

[...]

> +	i2c-gpio-touchkey {
> +		compatible = "i2c-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		sda-gpios = <&tlmm 71 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 72 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touchkey_i2c_pins>;

property-n
property-names

in this order, please, everywhere

> +		status = "okay";

Drop this line, it's "okay" by default if nothing else explicitly disables
the node

Konrad

