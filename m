Return-Path: <linux-arm-msm+bounces-100972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPz9H7CKy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:49:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 821003666BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E713305CB43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10C33E024D;
	Tue, 31 Mar 2026 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ks9Qe/OJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0Uns+OY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A953E8C5F
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946204; cv=none; b=Hn5AYZ0N1oksd/R2VDgPhWVsX/3zByMiTWZirNsKAIZOZ7yvYTDaUpfDCDfY4gbRhPDW4LVGpnJdSfA9t7sT9Lw/7Gu2VWHD92btNqJHpAvbahpxzmuNScqss+mvAptOL8U8qEulIyal7YrNrG+MZ4RTu1v3UixFUQU18Ycqv34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946204; c=relaxed/simple;
	bh=Tzn4VRzopSuLY/eoYIvxEYoK41fJhGH5jqXnCYCd0tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GkwRzvHEjxJsrXOho6oF0U0G1jG5pIUzb+Qvmu+tKcrhQrLrh3T1Q7Ut/5tAIKAI/FmXx6WPYP11LXTAYGAxZ0lsFzorQbC9+M2+HJ50f+wvx5WhEiuUB9+x/gwhRDGBoINhJvLj9ejisCD/J7m2r2yGW4grKvKK6Zxzb6OHcNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ks9Qe/OJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0Uns+OY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V32Srv4013490
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vrL01xaUSIzKPS4c2wYmNeCwMrSWzd4P6qDbCr3mOA=; b=ks9Qe/OJZxwN/Emq
	9qKc2m/vR+CHrq79vY91fTo7HNIJMljI2VywFUTRNqpNJJNXDb74JLHugWu5HbIE
	yxZQN+JvCVBaPG6AeTqnJT07nij6DPC9ZK2TAL2Azzk+s3OUr+28Gl+xsf9vf6iv
	lTd1btQUvRM5abk0FVAM8h+k51X7qRt7JmpnisGGOcvMyrp9szQbUOuwQQrBE5lr
	P3CzXIan2ip43wwIB126DgayardGmtzYc9uS3gLBXuBR4dZbaWh7n++aTotd8rjO
	1qJ6V0sDDy8k7vM/mCso9XJ679xaA0O1kNjGh9A54XK8vlubiuumyUcUkFPU7qXL
	VLTW3A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regvc9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:36:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2955cc1eso11822991cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774946202; x=1775551002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6vrL01xaUSIzKPS4c2wYmNeCwMrSWzd4P6qDbCr3mOA=;
        b=M0Uns+OYhmW0swu8YvguAEYd4ns6Kfe5pRwp1dAQyLcm5MXMi3ITiG+vbDwJFDX2JR
         anb0knzxqlGEAdCP5qv5GY4CiMdbkBHDqeGorZjzigP2u1w0Dzsxv0nt6kS+9gYPf6Bl
         ns55vrh+YG5TUkEsmE6GRP9FX1GUgTLWQEFt5oZJWaYrvqEWjXschisr8+byzZL5x0pR
         B9zOArI57dcwnzyJQQ4Boj0sA5pHv2aH1cdFEiE6cphstQbCl7cppaKQzAcYGQaaE0dV
         6IY9kIESDZEQcTBlgnrAK8ZCyCqts/0CkOb8kOeCQrEFSjfVP5AZ4MqA0NqJZXY5XIcc
         tQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946202; x=1775551002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vrL01xaUSIzKPS4c2wYmNeCwMrSWzd4P6qDbCr3mOA=;
        b=Mm6U6rKoCuoVMj4+/nTYlS7e48axNL0jEI/hdxQbjCrrUmKIY7opt+QelBrnrr3weu
         LvSogs6kUADJYsXSjnxFsP1BvhVIXprXxn21RrCdGepXNzCP2YOm4ZQrjZMj23PG+9b5
         FysLiVdFsjOzhlYj7F18xEeyLT23LgFg5e+C+dBhkV4gfhnoRxbHbsswEnowpZzuSvnb
         KypPbA0wsB9JaP8gjV2V6i2siSnmfRSK6/ujrL0iSYuHV5XF3aE8rMrYaOoWhTkltyU/
         lq4w57qwzv/FXeW6b1K6b4E19a1FfGFmsdsRNDrAJ/L5FcAsfB7PDlEeUqyo87+noyN1
         LqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlZYHw02DvQfDu9hud24ZTcmsn2tyKKHlt7ji7g2UzUHZKpLUIYMoEV9SUOBFDG0mRbd0EmBACWEj/cxOK@vger.kernel.org
X-Gm-Message-State: AOJu0YwLJ6ku2+XtpGa+6MVmIM3CawqzbjdKmzktgr559VM5rcb/GXhA
	fI6JkNgEbD3Mjctz9/HVHAuSDnq3SL5VSuDxv0j84ubJwB3ghkr8WRF7ZWzu9r6Blhej1EHjuPB
	irWppGeZSqv10WggTLe4ErvlSdkzE4dxW2ku+dyhYSdPEfb21rUxGNzxBa9JsWRMPUJuA
X-Gm-Gg: ATEYQzxQRPG3c6wEJWO8ZyFk2J6e3dw6kvOTJ9aOwSfQyAvGQpvONfE+Bf4ky1krhMP
	7s8qcatbLeqz6jXFWQmsywfLDeLs7+ooeYh68L8/YXJa8DSFbz9chIPWIYIwXMiG6//SK8P82xe
	W0N+DOmEedZ/TI0xhB7urbVeBwRhvQhQMoFR+aS5RD03htR/QwOLhNt3tTlglVHycw5J2fj2Wc3
	w9Bi0LveGYLc56bkTbfhzXHru0jm7BEaFEOCX5s56nXiZJI8Ani1q5T52ys5Niz+WRpZaoXTaLj
	PkpdOls3LsWBmtKGwz3GtAMcGJfxCxsDVxURj801XgxGRRTRxCnHUAQOF91UI1F/7HBEJGVUkGH
	0aoB889YsHpvaSzOZOaIgmmJfgw9rxJsbdz3f0A7Ov+K611s4ltq2EE14KNOjXKjimfDlok6Rn1
	s4wAw=
X-Received: by 2002:a05:622a:82:b0:509:38b0:c44b with SMTP id d75a77b69052e-50ba392edd2mr168451161cf.5.1774946201872;
        Tue, 31 Mar 2026 01:36:41 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:509:38b0:c44b with SMTP id d75a77b69052e-50ba392edd2mr168450861cf.5.1774946201344;
        Tue, 31 Mar 2026 01:36:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66beb39e725sm2053416a12.0.2026.03.31.01.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:36:39 -0700 (PDT)
Message-ID: <532f6709-601e-4aa6-aa5a-e4b294c979a1@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:36:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sdm670: add thermal zones and
 thermal devices
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260330165237.101045-1-mailingradian@gmail.com>
 <20260330165237.101045-3-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330165237.101045-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69cb879a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=z4lLRvgsToTmZGyYO8MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4MSBTYWx0ZWRfX2xj7ez+9yFKc
 OhumyXr1JPiw/G9gA6IBp2Sc4gOo8UFI064MgrUfEWDOJ85/J4kG+3PPMIQSDoj67NYYZ50eY+V
 JLwQDi5CWq32RJQD/Nu2ARdj2WYaQrYe5p9nNkLhQRDMmGp5wLgdd/hvEAB+dp122kSOXOZ0lfI
 efiV4TRV7laJ/hrauUcO4BAday8O2yOX+pDFHj4zfN9ea5mDxZYFVkp66EHVDaIAUVItL9poiBR
 ERSaa2pf7b8GMOv/JejcpJhBZzjgOH2Ed/6jfh+fPTCeM/6N0R840lbjCId6gJE+wXOjT4haPMF
 QKvZYPA73sPpMn3TJ93oF3s4vrIWx3GR5FryFsE4aL//NUGsijrCiUHP3S3uB/RfgvndOMi0R7x
 zoyvbXM8yzsbierIEz67UYaaL22cBzmJp6UeeCLU8snDG/DtLac7IX7sWJee8rib6WkgZQt6ZD5
 9DnBul7KbpPbczmLdLA==
X-Proofpoint-ORIG-GUID: qfVk86WyU-66g6tOcHJmMiAqyZPCA00o
X-Proofpoint-GUID: qfVk86WyU-66g6tOcHJmMiAqyZPCA00o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100972-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,arm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 821003666BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 6:52 PM, Richard Acayan wrote:
> Add thermal zones to safeguard from overheating to high temperatures,
> along with the thermal sensors (TSENS) and CPU frequency limits (LMh).
> The temperatures are very high, but should still be safeguard for
> devices that do not specify their own thermal zones.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +	thermal-zones {
> +		aoss0-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;

You can drop all polling on TSENS thermal zones - we get interrupts
for when thresholds are crossed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

