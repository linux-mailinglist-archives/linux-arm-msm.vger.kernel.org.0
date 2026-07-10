Return-Path: <linux-arm-msm+bounces-118313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TzwJFrH9UGqt9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:12:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE64573BA73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:12:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dZKh6dLF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TZXqCANU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118313-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118313-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C25A6301AD01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986482F7EFE;
	Fri, 10 Jul 2026 14:02:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532462D7DC8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:02:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692166; cv=none; b=pJaL7yri8ysCW6ByFFVpIAS6Vz88U9gcBIk6sX9yh85FIKufDp/v774uA4uhkb0WS+/PFbmUDk+Yho79Hvjuf4pdlpdrdcWGcVSjq9g6su5+Hg0En/pYySEwWbICj3WFHpCELqWdqm9JPFyT9gdKQHMUHdLWSUnHG+4dlzzQla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692166; c=relaxed/simple;
	bh=hr3pBawVbAwf5wvAAi3Q2A6W7S2tjhBPGqeAR4FmgDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEGQGqG1MEpucRBR4RS48bRTbf4DHBnR7DDJ+HOLZ4zxOTnwaOL7aZZ6nBcZcJ1wdvc7m69T8BY6lOVDia9AZ2aRZiA0JoZK3LG3q26QmISUm155vR//VPHn9Vf+U05ErDlm8zeoRCzWvsft8IyilcAil9bDWqfuJdKIyr4AqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZKh6dLF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZXqCANU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6Z4r700705
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1X1J8ZyXkRHKdEq2wBt4VP7r5zv/sVg/7OA6+cgIoDw=; b=dZKh6dLFqeWo0jIk
	PRhEfsXansJ/wg9bcxXj3Qvlz56hSSKAQ5IWq1SgXs2v4iFayIOCLwTPRWzOHeQ5
	Ro0BxumPoC34ZZ298FNcmGYhasjQaCh82zljw5zPRiINSVzQMC9vub2HSC72f99U
	ymd65SOyJ8TATtxM+CKpkD+XLhsZd8Az1sUzc0WXqTLGMwx2JTHI1zWhkgo7MKOo
	+Wop0VNZVZAUs0f0rAZ+cR/LjcmktPcU8vQZC2bzNb1RU4m/Du9cFUSgCegvmjjG
	7TKOvnMk2QmLm1BIsUMlsPuLmba7Brtpp2JYlcM4mCXZ5vlKxDze1qQ+em6tV6b/
	W0NFzA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8kmun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:02:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88d7a75507so1468120a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783692164; x=1784296964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1X1J8ZyXkRHKdEq2wBt4VP7r5zv/sVg/7OA6+cgIoDw=;
        b=TZXqCANUnte+W4zmaOzwIL3fiWLWtQhM/GRCj0GccWZU5FvURPuVgKN0pLWvYtRIAY
         MnK0bxFdiET+nfm0zIKNr8raYoMK7l21ojDLq2g/L5P9CH2NoJ8I4mUohBQd6ojaV1MB
         11xjcOOvoTQP2/mJJyJhwRdFA5GD0Ek5XjPgPDXhjK11vF5/2dTB2vJ4101VSqFMyXvq
         lS9TziwFZ+CnqPqfE1veBlqix/uM+RoFAR+4KkF9x5QLMUFQGvbly2rUuEBnotsFXu9j
         rzAx8ovY9xmW/Ad36L0eF4pXYtJ8vIauDpdK2u78WkCEL6hIZ+AEnPx/8HZm8rVTezZo
         4znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692164; x=1784296964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1X1J8ZyXkRHKdEq2wBt4VP7r5zv/sVg/7OA6+cgIoDw=;
        b=WVVI5rUYSTBzO43aReytHs7ARkJXAnIcGbyvICD3yh6AvYLzrgoIJ2ePKsFv+ZqoUd
         9ij2re+LEDEtDOLNwloMhnKawngh94RkBEI8Rp8oi2VIYLsIvDLGh5DNcohQQfW6FaPc
         CP66yxWqsxMAOgWisgNo6vsKS70WLbkU/nnSTJrTgP8VhBiu3yklBd1GVx+Cy+b96fGG
         TMSZEwvPZib9QdUUy9noXexGCAxoBVUVWT+RCuidzbT3jh72XPKZ9Ee8iR/p70tFUNam
         SvXDtoEtGhO6ygA9yNpsGBHFBGQKmb3z3HLRgxVZrry/dHR2VFKyFLQKJv1clnM088BY
         rfVw==
X-Forwarded-Encrypted: i=1; AHgh+RpvFK1NToR8ZZ+W7e57pwX0UMDrS1p75x37rx5yZ0hUZfbHl5webkRCS/gIxMD04Sfgzwy8Wb47HuC/xBDP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+64alNCJ9AdsGbxcw5M0Aqe1WYP7ttZhs4hakXtFfbQOqxqGe
	bES2nPMjp9QgJrLquAAIwYADcC+zQ+lLdN/q2DSI6Kb1nuCbsdww7TYTgeVtGIod7G+RWCqjhsO
	A0JhSQ+D1MEbGb5WzUqGAJF11Z0fVHNBORKsyd0SX53rYgNS4ZJEh0biKNHfMgYDGJGMu
X-Gm-Gg: AfdE7cndSlyYqb0IFI8U1f6uB5t9JwJETRv8VsKztKvJuVasKfIKDG18NpkB0v21tAZ
	Shu55yol4KgQXrB9k5Tmxqq1r/HfMKVyER6VWtdUDsvxvWQ7oe6IqFAVQD0wSf13m6lwP6Xymax
	osMEkWKDGiQheD8fQzP3hSp0xTTejyfJtU1Nm3TtCUaWv/SfDdaIdbamLqqId311tZV70X21OMv
	AUCLiyrbnUMQcvBz64kTCvXl/ekSqzfzrxOO2pv/eZFeTcJ4weuc5jEDAX0FPLmKP8e+mQkjQEO
	mBtZqrmDImdLyziNvX1IjerzYJpNNjOXmqFfToFg0Nt9Zu5li1q7FgCwSwtcBXStKphOcEVaXCJ
	KRfJqCfR04wqpnSUOpKnWLig4MlfSsXf3UsCVGZKIuoq3
X-Received: by 2002:a05:6a21:a95:b0:3bf:6c08:fb9d with SMTP id adf61e73a8af0-3c0bcead1b1mr14744758637.49.1783692163390;
        Fri, 10 Jul 2026 07:02:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:a95:b0:3bf:6c08:fb9d with SMTP id adf61e73a8af0-3c0bcead1b1mr14744716637.49.1783692162913;
        Fri, 10 Jul 2026 07:02:42 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm74944468c88.14.2026.07.10.07.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:02:41 -0700 (PDT)
Message-ID: <95a091d8-1b6b-4510-838f-2cd26ad54eff@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 19:32:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <7GAZnP6jPoRrcDnaVzeaB98cONLhtvbiEXV1yD5MJJrA9pCnC9lmlSiCGA8vlDezSXADjmFiqo3ZdClO5SxCFA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
 <JSezSF-U8ovzmiyYmssD6k5kLWpRmD9rhrVrKPD1NLY5xKvjkGwoNBtuKpc8t8LhkFj4TSb9T8-gUiOXny-VWw==@protonmail.internalid>
 <f0fa6acb-2d70-4154-96e0-09e88af129e3@oss.qualcomm.com>
 <1c652464-32b7-4411-8ed2-2885234513cc@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <1c652464-32b7-4411-8ed2-2885234513cc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DbzCBjYhT92BDf6KWc2XlZCWzqDcfkEY
X-Proofpoint-ORIG-GUID: DbzCBjYhT92BDf6KWc2XlZCWzqDcfkEY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzOSBTYWx0ZWRfX5qyhN6syMfc8
 xSbeMk2l3eUHEXgHCHRctdiQWH0TCD+BZTnDGQmctm3j8mBOIrsR31wtTXI3Mebu5JdVN4nngTW
 HD/6CsdswP0IXSDLSeHky1mtSHGrwlo=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50fb84 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=BWZkUK8neK37NLIOuVAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzOSBTYWx0ZWRfX2lWXmY2LdbKn
 OBfnV4pWPe8u0D0+PFvpD4BoFHr432b2iIAVCAvcvmpWPWwOnVHfGi+NG8jxN4CTpijT1x4v6x0
 z2LDQx0VdC12tH/rI13N1XJIel6WQ0n4V0hc70Gr2FHaLNW3Ds1HUGQgOVFAu+ptQ7VBCsdoZQw
 IsLrjoB1bPeXT0gvUchc4e85g1DAg6KyXMO8/ptA1DqwTf37U/OsfIDw6MqiM4ADcg/y86DA9Q6
 ph70y61UwSvFl4d8s+iJTg4GAAHOX0P+TonlL6cVoIuEzgtU4DP5WXOI3Xm+LphVgGlhtrc5Dj9
 nq0XhJ9adQVukdvUAaNoDHC0GF8Zcrx12KYBNJrZkTzSb/PGw4TcViXsvstY4aXJ0EGMDBwbtWL
 KNuOf8AOU4xasO49Tyz+srfSshIz4CXZt25Ic46271FKGbGCyCkBXzCIJTXAzoO6iXL4v9y2QXE
 G0XJUGkGLXTQy7520+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118313-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE64573BA73


On 7/10/2026 7:08 PM, Bryan O'Donoghue wrote:
> On 10/07/2026 14:36, Vikash Garodia wrote:
>>> What's the addressable range with sub-nodes ?
>>>
>>> The original problem you were trying to solve was the total addressable
>>> size - this other problem here segmenting the linear allocation space is
>>> adjacent but not the same thing.
>>>
>>> Without digging through all of the patches here - my question is does
>>> the original sub-node addressable space problem get resolved in your
>>> proposal here ?
>> The proposal solves both the problem we have so far - total addressable
>> size as well as which segment (or range) in that is_not_ addressable.
> 
> So if I can distill this.
> 
> You're proposing two objects in the DT one for each relevant IOMMU SID 
> and then the driver will register two different devices to get the full 
> range addresses ?

yes, alongwith the _non_ addressable range specific to that object, to 
avoid the device crash.
> 
> ---
> bod


