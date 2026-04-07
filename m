Return-Path: <linux-arm-msm+bounces-102119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD9FJEPc1GnzyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:28:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A463ACD87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FBDD301091F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E993A6B84;
	Tue,  7 Apr 2026 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KADg3fNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBXZmVLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3C439C01E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557687; cv=none; b=FIqjiEj7JzHkmue78jkfmI8KaLfmuFJL9n3Wg7WZ1LDJl2TkaSjCPpOJk5HCyp5XKY8izehab9I/DZtoeq4iZ/Tgg8ZiEVtOS2zhkqnSLmBFScOPOX4NDIBLrexIulWgSDfpItW2IPgP2NXhFtrjwOv8zqAJZx8DTSNnCzrDBOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557687; c=relaxed/simple;
	bh=42+BNKoCO0tKLWfV3tOfxG8ZldR7cHwM3gtUTR9cU3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+2QeWzxViGz/wOmsGtJGnTrhsRsXBZlUGdrAqSeyRTBJjf4Og6xY70rSxNIj+D8Xws/ta74dLvfGyDXMUGxb+FoJ3K4NhO8cRcssgKMn46U4Oz5ckLEibwn5VYZWeW6a8KEUfCsn68Tk9XejShZRB/C6ty6abp7C0XrmTh/XOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KADg3fNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBXZmVLM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376wG531405882
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdxD3dXHf9v7B1spgG0Hozv6M7VLoe1/5naDNyB9xr8=; b=KADg3fNvYPYMbE+r
	1ZeLX9q29d8XSNFBedzbzdBmONEcR5M4PmwblQVNs36BQ4uMEbB/JLKWbBQesEwb
	u6NvwsAKtxMr1eN468WpqZ/Vi81LNwO3iLwPf8snpz3dfR9BeyPQAdyJEWS3p+tT
	ZTz0t6qsqegeQeT66dUixfujqU1Dzvwsskkc8EuN8QgeGLWtK194pNnN+DoXc04n
	FgYCmPtyzG/mAGv3otxPB7qta5zusy8freIErrQN+TIJhigYgfyc8jXEZdswFZ3j
	MspNR+W2QgRTe+sf/+T3V7/JgoP2BDdAUUeb5sg3WkGj122gxKpkdGFFsK0h7mjG
	j81HBA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrat90m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:28:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so20079686d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557684; x=1776162484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdxD3dXHf9v7B1spgG0Hozv6M7VLoe1/5naDNyB9xr8=;
        b=YBXZmVLMxslBkOPjH/qTKLySLpamyERH0LeD3leWs5G/4LxoQtzdxNch7aDShwoG6s
         mOaffIezmTWOdayXmTqJpGN0xiVFzVTb1wEOBBqlCWO8EzL2JwEn3b5IGESEqKbokpyB
         vCExflbuhARdRqfTA1CBgjRvjWC4nEMgNhDpfFHeT7UW3mEJCrQjKobmkTgMW+mu3fnQ
         XGXDX8KQHdqueOK0lCcPeJ8czJ2ZhSBRCGnO6p31XG9Q9DJgZYU0KQZCFXmFUywOd4Wa
         2SpGZawZBoqIvCyJNqdvevMeOpPu5aOp4pY5ezp4j9coWeuu3eEz/Evoxa7/spUC9s5k
         1hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557684; x=1776162484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdxD3dXHf9v7B1spgG0Hozv6M7VLoe1/5naDNyB9xr8=;
        b=swSLzReDA/wNfUiJtpKOgQuE+9mW4gzQ6yzHWLtr5Vw4HYWn7GJa6fpvmY6VorBcDG
         RdSwWXUorr2pTxXgbzGveghTEcNml5T8J/rZ/GC6NNC3x12u5Wrq/67TTNpp9L4qv9lQ
         ovQGN40gKfysMINnymUv/0RXRjXoaizuqtocGxuW7Z2mbRGxJZ+wfzqkxwFes15nvs48
         51XB9wygLUYV988ZM6x1uP5oAkOdqIcxAI3gdMZclv4m/jXSuB4jUcc66UNPCnDnQcMm
         fjSNBwz+xmKPIpt9LWlh8CKCPU78x0r9Bl6eo8WoH3ybDyizqRB7LA+dIdvPmjPDiBN0
         Q9Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUjpzkgSgwL0SogoyjG8w6VkftTL/mqPwklHd6r3RKByiNnH0tqhrfnFfVDt81Se8UU/Rewigwa6goXnC6X@vger.kernel.org
X-Gm-Message-State: AOJu0YxlbBSmfif5t2n6ieTgnMgzBHvb3w8u3lGlN+1XfugXPYaGUYTN
	fN72n8f//JOw4v+0RJuzW2xAtEQx0se/QMQqogCFSuA0akYhHDBSd/GB4Bxkhi9nLnsuciFJkwo
	RGdNkY1Y61TuUiEKaJIRqOiEpmhLYuZXY3Ggce78amhPl0PB7uMLGnDjdSX2AIEIRWpVA
X-Gm-Gg: AeBDiesRZtUehFybTDZgD/UfDA6GVDDCNQoAr7ZHNb4A/7XUvaD1AT6lE3CiqYTP0dn
	1quLmmHUIIH0h8a4KwaNftLz09v21398PxD7/9WHOMb6wMtK0nlrTLBPkOJ3h0m9a8d4BgGjVgt
	/4dGVXw+WgTBNu5ySh7ceBuTIKGsWd8/klFLA8kyxzsVL+k1IiJvEVTVxRQLVg5+sUXGdyC6++S
	2ohgHg5Q8h0qsphP55ecXaaQtprTT6nSL92vRXfH8UM6Q9UY5msAHhH07U1JztvONsTCDwDM9j5
	MIsvwseKEJBKTHxTU4KkLMF1s61MgabSHXsuANk4dwza/LDHkLBaEHJu/9sjarrNa35ZnDrMoCw
	VLUTFWGhvg7wAYguZqjCmHH/PDvsVNiI2lMdIBNU3oGX/ml/JcddzSTzn1Q4I0We8Yna0qYeXf4
	AqO1E=
X-Received: by 2002:a05:6214:29c5:b0:89a:595c:b805 with SMTP id 6a1803df08f44-8a7055842b9mr189699736d6.6.1775557684054;
        Tue, 07 Apr 2026 03:28:04 -0700 (PDT)
X-Received: by 2002:a05:6214:29c5:b0:89a:595c:b805 with SMTP id 6a1803df08f44-8a7055842b9mr189699476d6.6.1775557683589;
        Tue, 07 Apr 2026 03:28:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972293sm542256466b.11.2026.04.07.03.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:28:02 -0700 (PDT)
Message-ID: <97abbb44-6259-45c6-8b75-99a646d22427@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:28:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-4-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-4-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aA1a8RUNu3rMuqqkk-8zU1ZMSgowFcsR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfXz3q/I8rGfrlf
 N0huJrEsz/na43gm35FenueznH5hdnk4mpDqqgkR/qSmNBpKWGfgbiBuSIlUaQaIiJ3XfZUHae5
 hn/P3qbhOZ3XFc83zRErKLAhGCLD1JLB+N6hsFMUNcFe09+Ktj2WATBzrVnCSj1Y+GjEwkWXqX3
 fQizamHcxzg4wZIkDRslgvuNPIciBDhVC/ndGnv2ESZbbz+NXgPXfKKnTLCMdhDJgEmKurrn5TR
 cMLAeTzSzb0jnkUpK95RtlR6yufMJw1sGgTBKkF9zMX4BkDF3mIWbg3/nXoZCGshSSzIswht0rZ
 F/k95AV2zdTsD2Bo9BekdQm6Q7sJoAW3Bmt42HHsxZEvTrLFPMhlXfsfu1tsziCPAH2n4Uz7Cyd
 UKmRMznO/g7JKU/yP7lXyPLdo6EYJPvHVQJP4xsS9b4Xp3IVqpvPLy7MYLPhJzsJmIXrQHOjwXT
 xgNKmilyClTgxSew5Bg==
X-Proofpoint-GUID: aA1a8RUNu3rMuqqkk-8zU1ZMSgowFcsR
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4dc34 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8poMKPHdAAAA:8 a=EUspDBNiAAAA:8 a=h-iMAVde12pwD0qB9LkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102119-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,ssier.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73A463ACD87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 7:17 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the touchscreen device node for the HTC One (M8).
> 
> The downstream vendor kernel used an I2C frequency of 384 kHz
> for this bus. Use the same value as the vendor.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

