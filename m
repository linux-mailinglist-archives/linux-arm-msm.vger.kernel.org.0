Return-Path: <linux-arm-msm+bounces-107081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIJkLjIWA2p10QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:59:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E37D51FA64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4163B3022072
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5F64B8DC7;
	Tue, 12 May 2026 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzUrG/pA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUpgDA/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC35F395AC9
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587117; cv=none; b=WKkyRRf5AkJHG/nO0t4fVkkeAXrR9pCATBX913h1XgdVNV4pOLGnqwnLbzmZaLoul8UjjPcxEGKe0LBWG5xBwKIVY7l0HzkU+4fOF77kM/JMHO+01evHGuykc570BgUFzQiv/4uEWeQ7XAy6bN6c/bQ79s63AWekVU3Mw6e3MN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587117; c=relaxed/simple;
	bh=O8I8PBtwX4vjv5Y40d4VRtCG4MLQQ9bKzHSjhphOnrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fi67YHq7tkNSPPswmw+jSFwJajB9O3BFBL1qS2Afenqz/AWU191FzBOIOB0b4xCZC5qjwCFOoI4ouJdMEPXwCx/4TyEsTVCom7Amu1WONCcTTgxFZmQNGxU1OhSwFxuhdf04Skj5iypEfL9V5FnYDzbkNHD0egkE/PCoTucCQBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzUrG/pA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUpgDA/S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CADxPv2187915
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBdHXtfJBgnvple6m0Pzy1ZnAVL2Twf9LHk7w7qltd4=; b=HzUrG/pADxJ9P5BS
	agKPS7c8ZmTDst7mSowg88msOYC6OQMVRT4GHt+vPrggbmljY7g4lsNoA/dWKANN
	T4GgsYZLOd8GdR/ZWnpQCjhP6/atONGtRe9KQCEdSzkPt0xb0d866oSVwM0/v5cd
	XzBwrVGtXVd/WqQor3lSfHHy6mzZBSQckixwetmlKAsGhrqXCv6AoZc6jUZKKvEQ
	LSeRS1bgm8H3QMcekMgmJVkMB9xBmRBCa9iIv7otQ0Zdo6Q6ceQDNYbWnQReoz/J
	LExveIyZO+0BZgBPl/ioPfAUv97WkBiCTsl+qrKh70EeQ9CVbGgyYbvrS3DYYiqw
	mpgIZA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2b8pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:58:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-835423c69ffso3342123b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587114; x=1779191914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBdHXtfJBgnvple6m0Pzy1ZnAVL2Twf9LHk7w7qltd4=;
        b=YUpgDA/SqP/dbPmuaSBrVBGftNHelHAGrFqmy7SZI3MFbkacmj2HwZNn3YAQFIdx6T
         qJbGfHEDWxT0yaqoXc7mTY3okPLpR4sxgm90K0CA/FlRgq3t4f1IJMWv3lGxvp9inlhe
         Ekh4gWUXmsKNhUhZ6qpWSF74kPdu2rYjRs7eIqYk+d2zJhNWoh6/lFNY4t/qUgKxLD2o
         CRge36kiAXw/Jb3AGfWsR1x5EejDjz55DzWNa1+kcrwT3B9/lhac5s7jbBbg4H0Om9cV
         W9iK9rnCrQr3InBDMe/Nt9fZ1JwogQkf6hBnZSrOQs2IFyICFyeRiNiJIFYoLjI/9hMg
         9UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587114; x=1779191914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBdHXtfJBgnvple6m0Pzy1ZnAVL2Twf9LHk7w7qltd4=;
        b=CS/zRDy0r8EquA5qV5RK7bnvy9BV+Le3RmuU7BdUSo7oGSldWnaHi2E5WpzIZqnkEa
         OueleWFqwzViDaSfwMWMXxEMOvCAKYV3yG0ViMWC/qEa28PuM1clJ/+UEHQ0vLR1HkNh
         W+CCCvlNCKXHlanALtqHx58Y0r2R1WGAKglkWju3XpwrkEczBzppaqilPRBkUndCZgno
         1oEmaJ4sHZ+gBCBcElQs2/vr4SQrFz9sGmHtaQHRWVIR8yaBHjNJbbqLRzngMcLKIKVh
         6ZevqEM9L1fnit4rXG90XV6WU0G7busUBR3vjbfnHOxMlc/HmG2n0nDuY9tZSbwrgmJi
         QUnA==
X-Forwarded-Encrypted: i=1; AFNElJ83fmmOcQZKV5fXOZSXU/sssxWsSyNIzHJnfV9NjHsdjeXI4FjJKBR+Ec+ZXKL5ShHXdsfmIgCKgODWt/va@vger.kernel.org
X-Gm-Message-State: AOJu0YxzfQGxO/GmUSFV2L2Gq1H8zYMPWEKzpy4YOh13HF5R8PspxJzk
	8kt27Z/65ErVreUgVloZiCZHpxn7nfjTKAX4bHuT29jfrQnAxWl2fGwDcCbmCWspeNaeIWPkhOM
	iGePrbrC2ZMR71ifZLI1RpTov/0379PgRoBA4UHQm2ffLv19XXJrCdiJOi6441seYw20m
X-Gm-Gg: Acq92OFYwVqk1j7hv4W9aZie+3HT/u6TjQsYShAGJZ6wlYO+sAlJJtbJCW8t4PkJibT
	TVHXZM27aTZAJFeWRv7ZtaAu35vZlUwYS3YNA+PyrNPET16ezJV0UILSHt/8/7Op7rdlWI4wy6u
	K+d0HFtw0XyUPsSXb9AWBASp3+9UT0peaDs5qe8/nmzv6yL8aYqfUSvkBwhRVeE8G3FQHsAfoix
	PY3+kunp2CcqMsVcp2ioaCU5M6C4oxLbc4OzIlVjdQjdxoWAjUMHtrpCHal2oSJqyslb3lgQtLJ
	DkLzsdqDZKRU8/+sRNppi++pof4wbcnZke4DkCYpUfQ3uV8fCDyn47hRC5i7xMc7r8eQzAoV2lF
	CVJIcO8HUNuJL0gGfG5MygpJLcNgpFLlpqElpb7dkQ3nOdlO+KGGxdsYcAcvoLEEdC6zdu5EEP7
	pqCExVPzQqJOpPYtgEsg7/e0RxkzHkoUhW
X-Received: by 2002:a05:6a00:e07:b0:83a:78ac:edb7 with SMTP id d2e1a72fcca58-83eeb9b0fccmr2830003b3a.5.1778587113629;
        Tue, 12 May 2026 04:58:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:e07:b0:83a:78ac:edb7 with SMTP id d2e1a72fcca58-83eeb9b0fccmr2829975b3a.5.1778587113150;
        Tue, 12 May 2026 04:58:33 -0700 (PDT)
Received: from [10.79.193.65] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c00sm21885057b3a.32.2026.05.12.04.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:58:32 -0700 (PDT)
Message-ID: <58b7b983-b717-49c7-9019-8862fd47695a@oss.qualcomm.com>
Date: Tue, 12 May 2026 17:28:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-2-e5437c39b7f8@oss.qualcomm.com>
 <84949728-7d0a-4ce9-f37c-8200ef792baf@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <84949728-7d0a-4ce9-f37c-8200ef792baf@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2jUNQHlYHwEjWMT4OmXO6t85nuB1473S
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a0315ea cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VOWR3M7HpeV8rc-S3HoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX4S6aJQIn6vjZ
 zlM7P9V7Y85v4TyiW+LCHxPTIa635C5JBRZM7m49O3jjfoYoVfyCdLTQ2ww2aMBhQ1rk49KfejR
 pb8sJAX9zi+CuqVGLMmZM2Nh1tyfOG/FPqzt2ZZxSfctAB5FTWVmiLgZ8asfEX4eEAPQZNbp1BG
 Uz64Y3pw3MVfY9GSgJt1AolWJ1FKX+jDuMa5x2wRF8eOy1cM2mso5CenT7cjdr8NOFcNJacuION
 YN6475gaD0M2qLcshPlGxb9APdYaZqLt2IXMI1PnSLm3eZ//xyDBRDarjEXRpQtvRzAfYu2+xC/
 osvhg278OQlryfV+GVhi/qccMVv3IVf52HeEDLi+zITx9B4pJAxLAhvmMmn/OfUCfk527C8+N+l
 Ua+p0w2Kvsmc+fD6eJZE8+ja6AAhKK1v4SY1w4Y8pcHR+PbAWlyERL0Z6RQuxlCLWyVjiko4O95
 MXVzVxNJYUjtc+TteqQ==
X-Proofpoint-GUID: 2jUNQHlYHwEjWMT4OmXO6t85nuB1473S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120124
X-Rspamd-Queue-Id: 5E37D51FA64
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-107081-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/11/2026 7:40 PM, Ilpo Järvinen wrote:
> On Mon, 11 May 2026, Anvesh Jain P wrote:
> 
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the
>> EC.
>>
>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> Thanks for the update.
> 
> Patch 2 applied to the review-ilpo-next branch.
>

Thank you!

Will you be taking care of merging the bindings changes (patch 1/6) as well?

-- 
Best Regards,
Anvesh

