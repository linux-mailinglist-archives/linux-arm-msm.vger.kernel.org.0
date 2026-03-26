Return-Path: <linux-arm-msm+bounces-100017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDY+IG6zxGnB2gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:17:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D203732EF96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F77B302DA00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6527F378812;
	Thu, 26 Mar 2026 04:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ib6fOR7+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYxFcP2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D99250BEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774498663; cv=none; b=DAyd72dAozOrMcPc/oTQp7uWGHzdnahAU29Ar9U7v0KHxFdHvaDp7OebXvMb2s0BCIaE3aUFQWUTsa1YjsnLT6TDRRRGKpkSn95/GWvGhGgLQFMK/1CHKIDIVJoQFTAsogr8vfSS2gUjbasPTg25EGaeyYQWLpkt0yWzv7SvK4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774498663; c=relaxed/simple;
	bh=SSrijDJZQrMEHpHlcqtSXR4uEMivECN6lihm4kR/agM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnCGaHwpLq5m3phgmcNO2P+7yzpQlQe8JHo327RL+AGWH6Is34M5qVUUXupL6GQv75/2EgJSx4ZgfEVHhP7+02rABCszUhhm8BuGAWtpvvdUaboUsf/PSv25FYzXv5TdKG1ZhvVO1f343vG/3ZK4tfBB+4qjbn1GT01TPNuUYII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ib6fOR7+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYxFcP2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKhI7U141354
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0awsM6CQ3Kbvgw26IBK+9xxFZhIHIbGmFMEYXBKqV58=; b=ib6fOR7+6yxSn+3g
	4pDn4dq/tJH+tBHoFh1eC5C8+wqsu75/svhH1zFHN7/7sAIUNvq0osUZru2/PruD
	KC4L73Cnk5ZWohYRkNnIvFJpmzS30g9NILyJQW6hoVEiX0y9EKuqaXyo+ywTVJ2z
	g2xEB6kVbwZXcGZpijpxAk1FSe9sqBKRJVnEahxRA3aEPsy6hbxkYPvRMmtV/ZeU
	o9l18l7pFH1eJqXB1uGUJS7Rg2U58+ATbjB92bIXsoyGuUIu5gu2pj0/5Gc6UCN6
	Wi1ZuKvNPUhBCGnc0uaR1v0k4gu/zUWTKcBYdCNb/sdCD9bFtiaOrwuN6EQW0HnQ
	RpLw8w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q09165h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:17:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c83bd48afso93576b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774498661; x=1775103461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0awsM6CQ3Kbvgw26IBK+9xxFZhIHIbGmFMEYXBKqV58=;
        b=AYxFcP2bBhdNh/xO5Szp9VyxTYsY2YL7iUMt/BEo8LS9vj/4dg/2pdkxOU/XUcZWwr
         xiJI42xbZmmvC13pS8YXrw1+RQ2UhEQdG34ft+TXdgciBI1Nh9DaR7+bhg+x0gnLbBLV
         foNK882CTRi70c4haf6PI5RBFt8j5zwnx7g+Y0g08BE4AytU6CGSGRkM0iibvUcKOClE
         vlvPBY+54AhRsy9vhECmcfwC0Q5Ro/wpY09CZU/lv2vLuM1jYhi3ieePrGSFXQhTzLUB
         BpOue3L3DDAdatnKxzNr5OQ6Po2HNgjyf2FlnadvbAKnkaMz1cA96/bSFTbDz/7S6FKP
         i28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774498661; x=1775103461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0awsM6CQ3Kbvgw26IBK+9xxFZhIHIbGmFMEYXBKqV58=;
        b=NZistX1pxNnf06qEeAimH2C5RBSnzk8F0QJO0FzUluBn6VJBpRSRZHFCG9EPE+IKCS
         k68QM1j4rS6ruDFpdmEyOAKflg1ODOqUVxC87VPhzgAMI27WalDH1dsvTXg6y+3ZWH1/
         oxoMv9ILdhOtl9q/pZAvXmbDemgVCtPKm2jDMbmBAHhDnOMnl7xKQwjuieqxJtfhrr++
         JOriCNVI5JJP/DDA3Se2Z1ljEfBGzCPUMjqo4+3+C/I4UiKWC7OZ3lnbVU/HhvBZNshy
         gBS+nL82nii2PnZZG13aDW/e6T9SNbVQdNprS/1vRTy7qzD+8IqcPTaZ9aGKgJhI6h1u
         zXUA==
X-Forwarded-Encrypted: i=1; AJvYcCU1KwXi9lBSVWbVV9YaGI6Lf0a+QPhAk3LpFjg66IN+AKH67OyD6Tkr4ZOtl5GCJ+Yy+EZv757WrmiLLoEC@vger.kernel.org
X-Gm-Message-State: AOJu0YyCiCwZp4192Q1uYds33F+1tEaGXgusW/NolCKR599MwCVxjB/3
	I9+lDr+WROZdONa8FGIiwf+ba11XPmIOzNxnoJvIRQ+fTneEsIjp/qZv2uuJ4qeW/tdlaUgaJYK
	gg+PbjU3p4GwUs1vqUkoU5WvHO0KZSl89xITSQFC8gV/aJPVt23nUyjmosItQjv0Rvxeo
X-Gm-Gg: ATEYQzzLmjtr6NbyQoSZ/qMsO8KF+IB9w30p9i1ISRII8L4OEGQiLRjmrRwHr6tHMJP
	a9tWIHdQli6g6EiEURETI906j0xgWvIDOsGoCDVq8toFe5fB1a9QuRoIByGzDL3SGGUfuyaUUMv
	pJoD0vT+dkXslcY+2oQ3mXMLlZAokUg9bTovelhL6X8Hqs7r/9lR0/PXLa74O27CDPgsLaPRvtC
	WJ1Ys/oTfBBEeVV2u4JW2pyk8ODf0JEXs4dvyicNx9x6Vjv5XPYgMwXri0z2Blv2DPcXCAKdEZT
	43c65bj8hJgY/ohhenSnF7cQbiwfvzWpNmiRkn8QBCHXnc6Odr4msbZYLqmADmR2PJE69vM7/tP
	LKQ+WpSCoC9fN3xONalcbpPaiVEq6r6mzUY3jfzBREOXRCB/T2JseZNk=
X-Received: by 2002:a05:6a00:2314:b0:82c:6cf7:5b69 with SMTP id d2e1a72fcca58-82c6dfb1f7bmr5961799b3a.35.1774498660737;
        Wed, 25 Mar 2026 21:17:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2314:b0:82c:6cf7:5b69 with SMTP id d2e1a72fcca58-82c6dfb1f7bmr5961774b3a.35.1774498660267;
        Wed, 25 Mar 2026 21:17:40 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.254.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3c7d24sm1244291b3a.46.2026.03.25.21.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 21:17:39 -0700 (PDT)
Message-ID: <20b15ac6-f4b3-4460-9c2e-6b56b16621b3@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 09:47:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: iris: add FPS calculation and VPP FW overhead
 in frequency formula
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-update_fps_calculation-v4-1-13728c0065ff@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260325-update_fps_calculation-v4-1-13728c0065ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c4b365 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=toKe0Rh1QRvTBUOtTMPtsw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kFDTxuPyl3r0weC5jlwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: hhpNOL4vF30X1XivD9rCU_CXIVI29umu
X-Proofpoint-ORIG-GUID: hhpNOL4vF30X1XivD9rCU_CXIVI29umu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMCBTYWx0ZWRfX2F2rKz2LNUvx
 4MlpKbLa2C0XNXNDdySIQcdBPbQrpVDYfTf29lGADRqWCzIhSDbbT8+q5ClciEFVcll4Bc9HPbS
 poFSIOEPqRCvq+pK+4hioOs/tsjOQwbBLy7m2TPt+9npAkAqRR/mPA5VKuB9925VjfnQNZGNaWd
 zAc63M/cnUVJdW3idZBv2ilm6OE/EnalbfYZxBYtSlTPBd4eL8alikj37MLTqC18xZHIc0/exEi
 TRz2iasEqnZxTJoFDcclX7KH4iTz12y4R1rlgEgJsKTpqarsq3KmuuiqE7kONcUfNP21fAjOQUK
 winawlaBs542/jgaBu6/qKuODQ7eMX34qg9ZGBjosZnkxytE2Eu3LoLU2G37vbmTA4n3b59d9Xx
 S/IwWs3035qCBrd7VaLLw3BIAlRXJMctRwKLrt83Mpx19C34/5FE6HucR7K+4x3PL585mk8iU9L
 57iXtaREtplJmeKU3WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260030
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100017-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D203732EF96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/25/2026 10:05 PM, Vishnu Reddy wrote:
> The driver was using a fixed default FPS value when calculating the VPU
> frequency. This caused wrong frequency requests for high‑frame‑rate
> streams, for example 4K at 240 FPS. Because of this, the hardware was
> running at a lower frequency than needed.
> 
> Add the FPS measurement based on the decoder input buffer arrival rate.
> The measured FPS is stored per instance and used in frequency calculation
> instead of the fixed default FPS. The value is clamped so that it does
> not exceed platform limits. Add a VPP firmware overhead when running in
> STAGE_2.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


