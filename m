Return-Path: <linux-arm-msm+bounces-110303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNd3OLerGWpEyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:07:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C1260442A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75394315DE6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A111A36165E;
	Fri, 29 May 2026 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsnegsD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEl7spis"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED953EC2CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066360; cv=none; b=d413xxfkOtOuS+C5gyuWS1S9uyGe1Fjo8NRvUCs//TcQE/D4X8LV5xIIY2zzus8TJ0XnNGoQD6ZfBuYWQXem9H36yNriVDKgDeTakuyzdp6piGQY7AikrFyxc2/S3OeIhzkuitw7y4EvrfMgZSiJyqy5j4pzsZf4Km7SNhoTPQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066360; c=relaxed/simple;
	bh=MGHfaR8jlzUkkXidIGH4kSnaaY60wAaRTetyKjPVzYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6nepgumJhXJ1BvKEYUIQX2myM2oUiCFNdzfNcj17SWu+qQ9e15xrjrIo0a8aTY219R5+g+VfHy//MX2lK/6FYd1ynlfOm7GFkjKj4USaYMz0JZvAinkCTNegoBe0/HAG84JoFPT+2D9kVlG9OK4KoBLHocVZtrVmd21nVPK3Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WsnegsD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEl7spis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLDuv154455
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=; b=WsnegsD/WRgT7zBp
	KZBLOe3RIyTM21H3gknjzlTo+0dXRAyfiCQQTVtGDsznzUIm6YH5vqc4ByboIQmp
	eMmW18qt9ncuqZ+mPB9WBd0MLqIkVfvWtaQRM8RJciofK8pHhC/ecd6O4NXuEarE
	YCJiL823SF8/MsQIuuzHJGpaERcYn6mDnlZWfQ00wNkyT7IF30sqJemQv2r4j4JA
	WuWWtvHZNOuEh8j5uCSTHmDMMrvF6UxOdtJbYHwPO/eXakd3YZUsU3U4n67m4K8k
	9RCjb6XhNP7JA9zBEKKNBGJ9qQMh+JJGbQVNtkhpnIstTuLfKltjCEsovzMocvtg
	d5yOTA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5c9qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:52:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so11606465a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780066356; x=1780671156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=;
        b=YEl7spisPYwesOS0EoGrlgkN8Pgw2LVSTQCayP0rAGZL3YGqMLlhVZV/epqQMPvoJG
         1yF+S44ww570idno5bpcwDQrComiP/4YO+fjo8ip2nIRmvXPU33aMnft24+BXymPC8Dy
         4F8czcCk2CmEWfU5Ku8WeryM4CE4wAg2xZw7ebXJARRLC+J4QHhNO78POFDChGaOtx9B
         HpFkqqg9B2NtBdhe6a3i988Q79aENewlX7EagjcmR2OuVRStM/D0LaIIgCUl7rbTeHPU
         RnP4Zl2Na4w6w31p4pAKhmtbsmJW1N4KxCq8RwxuUfTnEr8no5iziJ8T6NUB1h580x3a
         bNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066356; x=1780671156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=;
        b=KTUZsYSpmTlGGGDIv+zGCwwZURx7sgk6uYGuYCqxQBj8hXcJr+baash2+giFZ1Uvzg
         BzgyP3opUiETjuRBh4qLNVDiZC2F54UY0GfhrF8mzQIbssjPW9eu6fxog2f2rGHskBxj
         tjidllKYPmZNEsm8bEt9BdSzI/zTx2gSq49jQTj1NDmvkeS/lJDFZjdSHjioKY2TTPn3
         wa4IKZXppSlUHSh7NGWt/R153JUT4htD1g2lFZIarE1SAyQszO/kC8qHPxbANZplsC0l
         bpSKtp4VX8S1gSiI2EX5pYbeDQnHKU439zmYOx4+0+zm14orsmnezwYR4InAqyiNjNza
         5BkA==
X-Forwarded-Encrypted: i=1; AFNElJ84O4r7fbio5k9q1v4sQ85LqWpc3h3vIEzWSZ5ueIGUT4BZ3815lWpr0V/bRAfCDKsd5wU2o8VPdNIRN2kf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5XQyVH3qIjB4YQcOAzBk09A7RF01SMs3+fgWZ+GSYiPjnxu9
	HdKo5WjeagPkJypgfP7qGyW9b/oKVAPtnLxjjh2wttvbWBfhyTo7nLk37KOuY2qNXkCaL9dY/P0
	O+2NJ3tOG2EKE4gDe3a0/EJeqOqkuRwYPjflLNu4L1pTwLrBy2ZC5oKMkZg07yd8h46tF
X-Gm-Gg: Acq92OF2FOSq2FrJnFrgBemRxea6IEwgo3cSjW26BLQSHPV8DPUb8YXAI4MeNMprmEA
	v1Ejr/0DPhYFt5qFAoVuOB3JOZ0/fBn6kzlOZgbR4mE0OrU7JgRulfnyMYlQbKJhs5UmH49lHDz
	BF3GzUMqBC9U9FFAWiRdj5XGX3/uuOts20IdYVsdXXJT4iQkAcFxvdZreEFyed0kevOtMI8iM7N
	5UlCepmJBfqDCoEcVPjs+TKfc2K5KN3axy5ILjn5HvGD5Ib+zq4kF4+8iBWfcrG9aoMI+f9zfzv
	W+rupo/bpSEZ92F3Wecmnzqzw7Vb8/xJyGHGJ3H2ROSE/UxRAwgAXHcF8dcO1Pt+LRRKtdha1Ce
	O/hjrNxqw+cDeHorFWKhw/j/W7u0FI443UvmCpp86k2sdQ4CfDiKNIjS693eW70U=
X-Received: by 2002:a17:90a:d40d:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36bbcad48acmr3569139a91.5.1780066355533;
        Fri, 29 May 2026 07:52:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d40d:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36bbcad48acmr3569081a91.5.1780066354875;
        Fri, 29 May 2026 07:52:34 -0700 (PDT)
Received: from [10.204.67.150] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc9bff159sm845633a91.0.2026.05.29.07.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:52:34 -0700 (PDT)
Message-ID: <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:22:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: bod@kernel.org, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
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
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <178000689150.4557.11759359941436928903.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a19a834 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i0fgkIc6DCDsPB5MfecA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Ub1hUN7MB-sgin9oxu3X1SCzCTeCn9cp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OSBTYWx0ZWRfX77jXNPBfpE1N
 q8tiOlTBUULBkvkJKcXU6tBHn6BHq9aGJmSmfT/NAdcI2Gsby9I8MVTry9PIRYOLXgTKSoBdP5f
 7vpM/bN+tiLU3X5tq70k9P0JFI5xEyx+u1R/sTKiZ96ImaSbaUAwQkbNk4cofI7IV6CPDgI5NG6
 efcjnPGvSW7l9ZByhKO3/yi9WeqgF7OsjIp3+MRYtsyf7dB3KhxmJxfnsk7xC5HD4Q78+/4NjMd
 Bjc67Jh4GV5AdbRl0h/db11iL2qj5tg/nwZtszDylBYj7IfgYEYRXVg7WjAjXZ+YV7PPuX40jY6
 LGXE5j3v2bRboIZbXf7//KpCFO+IAneH3x1waNlvFQL+1r5BxUhrjBvSSmawzmG3kP5L3MbWSq0
 D6MPXtC1dMxDzjLNGbbJRXtFT2yBFI0Qe8S8w0i2T1FrV0qfiFFjFvzIWcm70AKv+ePouFcik4N
 rl0JLB1niZUErxfiNOg==
X-Proofpoint-ORIG-GUID: Ub1hUN7MB-sgin9oxu3X1SCzCTeCn9cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290149
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
	TAGGED_FROM(0.00)[bounces-110303-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54C1260442A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/29/2026 3:51 AM, bod@kernel.org wrote:
>> +			iommus = <&apps_smmu 0x400 0x0>;
> So I'm suspicious of this IOMMU.
>
> We should list the full range of IFE SIDs here not a subset. Since we are
> register compatible with Agatti that implies to me we should also be IOMMU
> compatible.

Shikra and Agatti are not iommu compatible in terms of Stream ID. Only VFE SID is same
for both. Agatti is documenting iommu for VFE, CDM and OPE. OPE is not yet enabled for
Shikra and in my opinion it should be added as a separate yaml similar to Agatti.
"https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-bb1055274603@oss.qualcomm.com/"

Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.

Loic/Bryan, Please share your thoughts on this?

> Please list in your next submission commit log the IOMMU SIDs - comment in
> the DTS is fine too.

Sure.

> Ideally list the IOMMus for Agatti/2290 and then explain why the singleton
> you have enumerated here is the only required one.
>
> Right now my suspicion radar is high that either the Agatti binding is
> wrong or the Shikra binding is.
>
> Possibly both.

Regards,

Vikram


