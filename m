Return-Path: <linux-arm-msm+bounces-110317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH2UHjfPGWrgzAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:39:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFC0606A6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07C773171DCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBC9386C2C;
	Fri, 29 May 2026 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4esPTDH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nrufv9zF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F72386C3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780075868; cv=none; b=XATmFCfnzjb8iGmx5hd9jOfVU3TNT4E1kUZEy5PV8+wZjwuQm5WxFkDTCG3im4YcC4AovDXXhTHKdyscWpZUbLIJ4fInS8KSFQ9E6k9kilH3LOV254QLHR+Qwz+0NZ5Bjbu2jNoGdUo4dJB/perh+2ysP6WvU3CdcunDO8EpmK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780075868; c=relaxed/simple;
	bh=6XtuzAYEfFRw+HYYz42AkI11W9apPm76m7J6y3guol0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvscEGXJZVED+mhKdDCjsVWYHq1fg9me1QJpdFO13hljAoB6m642ux4ec9MarA4Bsxn60aLuTJbYzxWDg+gTjOdoO5JDiRJDkTcrJAKRLEouIEqu7hAsOYZqJ0ULAhpsdA+4QO4Z73EiEDYpfq4/z+Oy2KcS8navB7723fBO3u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4esPTDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nrufv9zF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8YI0375709
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=; b=X4esPTDHlq+Rsv8C
	XbAcFT9hcaGFg+2OcBQjIPdDp0LQGn9CtGtOcrfjUnQuB0OsJ4FLm5a7uqYd2R/A
	vviQZtUGLD1Zww5tRizwiuO+5O9eny4ME6bhlPQoEsnHbs2mGGhv9yOd3K/MkUyt
	no1dFEHBlc21336KaM8+mWwh3RoF7mhff+nlFlO18jFuFoHAmAMvogt9wso9ZZ7V
	J3rdS3i2lzRxvNslmAh26ZCFT+Pa150ebYXyp79xHtxLIgzZzKz01woDGCwutUIu
	DJTF0TgnuC5gcTBNHbSy0NE+L4zZAlMM2vOAcW6aXypzOx+S9KnYiKqunG1anTNy
	5J33Vg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efechgcyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:31:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf30576aa3so3286705ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780075866; x=1780680666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=;
        b=Nrufv9zF1QfK5xsRcVoSjI33YXOAosHHvXl4KuQXm7x4pUdsF81Xxma2cAjQKapoN4
         0yigDKkDm08nIJts/kJyBCcQc57MrEIXrQGy14AnRY3MjhWkUJxnVvYdrYE3KV2mZMwB
         RUJNhHzJJb5ERltg1WpgekVtqcqb48klwOIrcdt5Lxjmnxyswa3abBMdzg4vty9PcWaD
         mc6ySFj/K4/4Z6gQE5tuil01IhgjnzK6y7nPkZMdc3+ww0Frv4YMjdMdv2cFRWRW6gy9
         5J5/tX2BNuqfFHJ13wAikO7I0NclVcTStKKA6gXDmR/Bj+MM8plecWpIPFQRIWzLcm17
         vwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780075866; x=1780680666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=;
        b=obcyVXKgJmC/hPBsRccDR+EIuv61bx7a/PtamHFtEBVP44Cv/9M+ADdil8+Krjg9t4
         ohtMhrVr4JXHT6yGN8Er522VUAdbVAGUx5Wbt5/dUfNmeMfHAwVIiOieI8LIitOj1WkO
         J9vSfP5hQM3nUpEEnDmBuViKsTY214fKUrRleWTh5CPY8hfcKP1+YukJgXac6BRuw0Y1
         IMtDDX5l/zFEHSouhRDFMK2/Pcbk5ZtRnK2EE+Q+bBvWa81EGf0vPVVJrK3CLiteKYNj
         pJx9ghcCFAn23rVpG+/qPi4IxLj0etKNIV1lr4b9WjGvvQBpVIGJy21JTZmoxH3oA86R
         fUAg==
X-Forwarded-Encrypted: i=1; AFNElJ8NAgg2N78Cod/IxKfy1aCVv9EWWrfr22fu5DxSPWZf4vB4Xs3JqGWlyc+Sy3DcJwQ79f5VtmOJXkjY/zPa@vger.kernel.org
X-Gm-Message-State: AOJu0YzcEFnRPxXqu+RZWbStWt5kzwUUS8eVc7RWjRjA6+TzShGwhRb7
	JdtCPDHNnTLAcqZo4EmZbfWQPP7FelCPUk3pTESGIWfNM5ATAYekd5kgouTh51ToDLOkEOOJ9jC
	Bkva+M8UQypwdpb0OYPG+mTSwzaxhItT1LVxhLJaaQOARw17Gqx98KgT3hcyus+tHgy0S
X-Gm-Gg: Acq92OGtSwJ35qicIwQv9O5t8hVoJ4MRavt5BfxcmcRLiliZAaPdMvARiDXg9fJwLYm
	CCYAgo4Mdd6BVVZbSIqFYa3ezkm7u2i0cXUTMd1rwD8fE6BQ1uHW9/4KOZfDJglnB3Dr1EW9Gri
	AHsddPAWIp/GkB1xNTN2RFEHGE2AGVlA6SbBWAVll1S9Kz9VDEJ9cvNTuf4JXCoiz02E7zbipRR
	8euvO89vkddxQ+odk8H/Yb2m0xYPv+8qTEbMpTlKJldFhR9NK4bry0kDmTsonkbeQ7cUDaXEqZZ
	0IiEOFi9oyrzyFlbN8jLHE8kvh+u9CIamchkSW+8ScqeX/yc3IfyqnFgTVLUdwz8Z3RAXqjuq4c
	LOjCsoQbtOhb1NGkWk2SQxs95DvDXzrxC7dTZ1euuBvi528bb2M5AoBw7GTr4G4U=
X-Received: by 2002:a17:902:d50f:b0:2bf:2015:5ba4 with SMTP id d9443c01a7336-2bf3682a24bmr9445285ad.24.1780075865566;
        Fri, 29 May 2026 10:31:05 -0700 (PDT)
X-Received: by 2002:a17:902:d50f:b0:2bf:2015:5ba4 with SMTP id d9443c01a7336-2bf3682a24bmr9444745ad.24.1780075865095;
        Fri, 29 May 2026 10:31:05 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.224.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm25476575ad.15.2026.05.29.10.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 10:31:04 -0700 (PDT)
Message-ID: <bc2aecf3-fedd-4b15-8e69-33ca928831d6@oss.qualcomm.com>
Date: Fri, 29 May 2026 23:00:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add
 DT overlay
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
 <178000731452.4557.8537369407478321842.b4-reply@b4>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <178000731452.4557.8537369407478321842.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zIUVsqi8eAIcqpd-YpvE16WiscdxKC2O
X-Proofpoint-GUID: zIUVsqi8eAIcqpd-YpvE16WiscdxKC2O
X-Authority-Analysis: v=2.4 cv=U6Siy+ru c=1 sm=1 tr=0 ts=6a19cd5a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=tDSAgCU/rryVExTQDfsVjg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=iShi-8OPmrKBgnXoZJYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3NSBTYWx0ZWRfX6pJvq8Me4up1
 eYfrSG+q38ttJX+5deg+j/A58jvj6LuKKAJRsbzdU3H47y1dfoNA4ZU1WdqShpcEa5osIhq7J9D
 PZVm8GDzkZWXqLpf9j7fKy+keL/CDhqiNrD0DEU+9HlPeP1ScMC5ZI1ktcRSBLmSrExoEMiMxW0
 ZgYkQ2WpXLXVigk2PAUs60Ul3Vb4lHeWyT+K5PdmdCd/Qq0uMdy0C6UX3fQVtVe/8lWnRUS7Gcb
 teImIVB76nBztZbxpQ4q/a7cOqSxpIWbk77Xw/TXCF6ghbrkgtcr1Pl+0K6rJEx2lrtlt+1Y6+7
 EcwseVw7m86FZjJkzZ3+wrbcETzaqQjfZRToTC/a+/ssik+Sq4bJXO2pyi9ntIiLnHP2wB+1YPg
 4kSOyczhHSGccDhTMYDq0Ve5nt6bpl5Eu1hsuEhPD1kU0t/H+Me5rJvJOjxyTEwn/JfJC7zNQZZ
 4DcfqvM6HH07qXWxsdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290175
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-110317-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EBFC0606A6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29-05-2026 03:58, bod@kernel.org wrote:
> If the overlay is not specific to board then the overlay should have some
> kind of base name shikra-evk-imx577-camera.dtb
> 
> This seems like a minor nit-pick and, it is 🙂
Thanks for the review!

The overlay is named after CQM because it's shared between CQM and CQS
both use PM4125 PMIC with identical camera supply rails. The only
difference between them is the integrated modem on CQM, which does not
affect camera hardware at all.

IQS uses PM8150 with different supply rails, so it needs its own overlay
and can't share with CQM/CQS. A generic shikra-evk-imx577-camera name 
would be misleading since IQS is not compatible with this overlay. 

Happy to rename to shikra-cqm-cqs-evk-imx577-camera if that makes the
shared scope clearer - open to suggestions.

------
Regards,
Nihal

