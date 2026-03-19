Return-Path: <linux-arm-msm+bounces-98725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNk4IjTgu2lXpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:38:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D67882CA68D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EB1C322B172
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCA834F47E;
	Thu, 19 Mar 2026 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQnuvZo+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsudQVHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B5735E920
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773919954; cv=none; b=f8vlETxVAZTJi+TpFgeOyD9AWZrt9o38xRCDVX3sMPWm1+X8m7kfdw94KQfR5iJk1VhN1nnYp4gRS0PxEQ45zQaGTzfzzOjvvXnLFlcBvj/LXWILUv74vki7Xh+X8XVVq6PlU5oY551WTt8b7BYxpU0LPFmhvLPaYB/dJO2bKXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773919954; c=relaxed/simple;
	bh=MYg3uAjpZYWvQafvixW5nyeVNxNSEJmxZUP155E/WyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLWFYV7LFbXeLMkx0rTEo/A8GsN2ZLuF4pAs200KbdMqK+Gc4ZCHqHHPW5nXS/wz6tx8a81OaBuPMxt0F0xlTNSSOYO8vb0XlkGMjsy9Io/zeCIo2eLKzs0celUHWnJdUe2L+oYwsc5c4SrsS4xcpvun4/k0VG2fW+l6YxW1xo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQnuvZo+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsudQVHz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73v2M3771096
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oU/Zlg7aVeW2oacg/0qW1aslWDjB9ZFqZQCV5J5anrE=; b=EQnuvZo+DmxxPbx/
	atBkiqV0Yu8WQZjPZm3jdBLxOzJQTi8U/ykPsaAsUA0uKjus8jtE+zAegsVFD4JW
	VvZ1zPauWvic8s4jgkuIKRQ4qhLGsVPNeWBJMRqHa7W5Q0OFflW5DTdybwxeFaMa
	NYdsEDuGFoT972GeGZNnKhQjhfvvPUgwd/IdN5e5ApW84vOzORSPf0p9/6B6IRlE
	FH+Mam9+iWDpZR4Ll0oMnjtJjwlRNXLttb5Lfh0puQIuCyn75YxYZ8LMFZ0SHOO4
	OrChsbSs2rLTsikCgnHPXn+sRgWfLp/DYBpCmkIYP0RI1JWCTlH3IniATYhkVA5x
	Awo7wQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r9hmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:32:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-602798e00a5so121841137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773919950; x=1774524750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oU/Zlg7aVeW2oacg/0qW1aslWDjB9ZFqZQCV5J5anrE=;
        b=UsudQVHztcs6d3OSMNtM7KlEjf1KqiGiiYiDRE/ZRCluNmOMPxTMFI3c545oJKwz14
         deH+Wa/aALjZagnvCfkRJi5fw70IzhY431MlWmGbcrFPg5+6GVnzpT3BB2W+NUFFEivA
         ZUZD4ZOBO89R/QFewAy21VcyTNtHBWX48UtrL6+zCamOXm1DodjblqQ2oVgzJf/gYri/
         eSDHRKBNEyTrwBhWPVDHKzS/g5zcpb6SCbMpsuSjUoaBw6mzyk/wMyRy6MeeNXGghc0U
         FsomP1Ab3QjkJkPupuef37dd3Py2VFpuGcOWtUNPayppuP8UqRLVQO7QMurdZQGSGqsW
         q1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773919950; x=1774524750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oU/Zlg7aVeW2oacg/0qW1aslWDjB9ZFqZQCV5J5anrE=;
        b=OLnkJxmR6Mt8beh6aDWSVf6dBxQLGwSqgaPtDM5ChbJJuXNtNGu/mLj8PNIb4gw7/O
         mefADmDnhWFAoZ9Tp0twjXcQsy4X12sbY84jOCFFNTMW+ZrnYrVerXVWgjbd477X7zH2
         HGRUuFeGsWAVLccgjkK/AuSiYcH3yqtvZd6URbMXEGEcBAwtB7fyW764ZVTMh3/Mv0QV
         NXsiCiBIpXuDIDDPMgag15NiLALhpCyphnoW4OWeFU0aOZQ8U5dkducxh6SzUoKWKyEq
         vDQw5J0I3tjOya00bJxiEYFN8dfxoahe/j5F1JEFmW6xLCeMl3T5Rjjvs1CIi9Ct0E2J
         AVHQ==
X-Gm-Message-State: AOJu0YxaQDLPxNxUacU6jZgvS2CqwYa8ySnJPGg1kS0QuVmTuLCfwjuk
	V6W0VvNycg66BaG2aOCPr9E69LcTn2IhYdZTdoqXe2tbCdg+xjshhY9PfoGunGjCrkoPMhOfRJd
	CfTwkdZfDLHwsdU1h47TS745QR8jnawgcFQmWL+V4/CiCsp7llAS2aWED6Dm8hRBxCnWE
X-Gm-Gg: ATEYQzyZ71/hfgHwMSaRqMMCiPiiT4divpRfcOYUXuqXUYfeoNWMyE6vQqMntAadYTV
	uyi7xWTQN6a3a+sSBgSP/0Px6CORxl6onJN4/Vv14u9VfL33IC28iboxRYLnWeDfMFUKOL6e0lN
	uVgig+0wHraUxvQQoOAZlN/uE75aAqC4NrjEx/VvTNqdqvKKrg7Mn9UQ9SA0LkUJG17Ylg4++V8
	xoeHQHP+U9ELmkhnrHtk5uamLY3Ubua6BK1Ls3E8M6fJGmpTrc57yTQ7FJfvgMY0iaA6aB2OlUg
	+3JeE3+rPxsu6qeXfy69vpONaSK4MngK349sijgpFCleKR6hIANhmF6TBx6LSjaME7Y8BX9eHvm
	MNOmU2WlIgUiaUpkfsPviIHQSqNaGb2WYmGhfdGlyzkjGOPau2cuGtbIkGL9AO3bbp8uEII66Oz
	qakSM=
X-Received: by 2002:a05:6102:510b:b0:5ff:1cc2:aa9c with SMTP id ada2fe7eead31-6027d3ab5fcmr1592655137.5.1773919950210;
        Thu, 19 Mar 2026 04:32:30 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:5ff:1cc2:aa9c with SMTP id ada2fe7eead31-6027d3ab5fcmr1592647137.5.1773919949772;
        Thu, 19 Mar 2026 04:32:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667afa57131sm3325879a12.12.2026.03.19.04.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:32:28 -0700 (PDT)
Message-ID: <16211bef-2360-4bbd-bd2f-72c1d6993a1b@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:32:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add AYN Thor
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-5-e66986e0f0cb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-ayn-qcs8550-v2-5-e66986e0f0cb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tsDBJIVooQeehoXGPjyJLEZRoKdSzQOz
X-Proofpoint-ORIG-GUID: tsDBJIVooQeehoXGPjyJLEZRoKdSzQOz
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bbdecf cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=xCFUxe80Pqb2lvtIFvQA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5MSBTYWx0ZWRfX+fAmrpj1McHD
 GmohnxwGxJtnpg7mqghQPxi3Mi9fMOgAJZJpSEvizK3mpXDSOBNQVbR3S14Rin4MRMoYq/qL/Yu
 DCHoHc+3I/NDE+rHYB6yb3r7MLwQr0dPLCkZdlWfH0zySGWT1Xj3w1r/UoUuyQZtPqhv1t9CMdd
 VCE+U9x0KXt9SKvmH35fpfgkw+7daYNhi2IBngKX8zlpaa7NqjoJjmwaHIF0gq86nRnjsdbC9n5
 T3BFNOh9s8EgPR0172mbseHoOZs5Acs3SMAFle5gLNJSm7x/VF0vrm1zRIYdlo8owaRfkiQhAlz
 7r3aFabnGi2aiXca9+ajo2+FV2z4MTPWYClfHHvXKj6H+0eqbEvPQY4P3scLNO8fh6Uhf4uSXq0
 0MEiIWzxCYKZHwC81VOWFFDf2dtuol5kz+477yzcZtN/OGqD2SGts3CHtoqeLKz/TwwPNes6lig
 Z1AD7BgG28rYOeFOuAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-98725-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,sobir.in:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D67882CA68D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 6:44 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Thor is a high-performance Android-based handheld gaming console
> powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> AMOLED touchscreens.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

[...]

> +&spk_amp_r {
> +	firmware-name = "qcom/sm8550/ayntec/thor/aw883xx_acf.bin";

That's perhaps a dumb question, but are they actually different between
the devices?

Konrad

