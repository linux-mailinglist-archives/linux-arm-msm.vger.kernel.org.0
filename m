Return-Path: <linux-arm-msm+bounces-91284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI8FOvuRfGk4NwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:11:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA5B9E6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A76530075F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338AB378D6A;
	Fri, 30 Jan 2026 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpiRUsVo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMcDLjCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAA9378829
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769771145; cv=none; b=s0lnatNeLeJu5MYxV24RsOSOBBrQ+wzAOS0Hik67MzDofbiGHn93b6RH+kB6/zkXHClVrOE4B9jJF1CeH/IL5+xMxZxXK0BcNj7rzNzN70pGEdcfIX/13KfqHe+Owyv8NcQpjt1GJcwUk74YW3OUSz7arMN+GtFS9HRvcZVcPB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769771145; c=relaxed/simple;
	bh=K8VhzxAfr0A61EqhSA5WibM0ky6xXemKC6hC0md/jUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESTgd2AgY3t6wdGy0oHJt0CfhOawufC+q2ltyljmnN50va9QANYKPB55EMHYSEQ+L9v8NTknilIjm85oxp1L6JWZxhYdqs8UACw3VqIY6/Y2gBK2NoErrNz6aq4M4dmJe/z3F7tvrh92nZhp36aTzOZD6yYoLSE3IY+hIdSz9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpiRUsVo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMcDLjCf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VhYf1022278
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGB/w1lyy+vSbSFq1bkZp/CB2/chuF0F33pAHHTG0Bg=; b=fpiRUsVon82NQgUr
	MDo0EColAK5PFcgU+mqzYOtMsxnOCd7TaT6WZ0pydtQBeXb4vuT12AwhUXfYcwX5
	sUay6SMwiDVEB50cWw8+KnSnulWqQPouXQ8G2QB6GBe/PtUlCZc58WVCAOTFCiAq
	RYYV5RKN4yfxTwEq0jKgGyPw/XEEWWkEP6dZftDhZT6Il2buUK242tYiEJ34Ki1W
	p58viX8wW0Up9K68gAeDgMDwbTnAe9etIsPqH5CXKYPWuJjnX5jSRiXZOf/l92pJ
	UJZQblOpesqV8CWHZ4Vhdpb0qj0IDv34JGyFI3sYfLCJqBtQnZYm1hc0oeKKirrG
	ScFJrw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3kaaqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:05:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946586903dso1771946d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769771142; x=1770375942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGB/w1lyy+vSbSFq1bkZp/CB2/chuF0F33pAHHTG0Bg=;
        b=DMcDLjCfCxuhqbjv3YPNCdXqlTN8jK+xH8lWa37rRPeUWv9ccBUzJvVp6cGjUpGSFB
         m53DXcHycDiX0yUvpPI89Syn1fjXFEcKPMYzIY3Lsi4my1xpDbI5jmbcoCm6hr0zzwIW
         1CTNm3DTSFpQeQGVJcee0mdA443mQqoYhWi1U2Vn9e7os1/BDZ501IdlpYy6GQcv0+5Y
         l+dbaeooUOKp/4Ae4mtmTkY/u+jgtIdMdqnaq9Xy4p3Ztgg9PVsLJrPNOWJbCxN82SMM
         nPewDjG2mSF8pkRXx40smSC2YJbhIYPObMpHZdJBFZdzp7gEZI1MuQfKwC+mgwlOitP1
         jNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769771142; x=1770375942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGB/w1lyy+vSbSFq1bkZp/CB2/chuF0F33pAHHTG0Bg=;
        b=osY5/YenC9ALXe13ypGVVdJGpjd7uXM/2Sjw9VfpxdVhGQIYQj7Ymecb5ElchhGmMj
         +8WQPeNeu1Fz36Qv0yqaLSJLiX5iILp35GhJkLqEk+z6BhmOhXVmmsdekT3G30BW4TM/
         MbF/cL63BVndEBIATd6r4XyLQ+n6Y+Z2X4MByj20y3xIg2qWvCxGDwnhCN9nQjs95lR4
         kOSaicyQJvOBSIqphc8pf68+1bYcupx3vaHELtMpGsPGuC/vYpupQPJIJMjGS3qhod34
         3/A36V6AKX8Zqa1jaHdOFwc8VPaM8XkA/aBR6WFVoLDWEPKw6jpiDawr9P8LBQ9nZm7J
         Tjqw==
X-Forwarded-Encrypted: i=1; AJvYcCUWFwc47G8FX1ijSmrEF1ptHP6h7z1cp0Elw2OKcBBMVo86eZsR37Lj5sVMjFxHptyTqjRLYboYhJKoxEEJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyOt9J4iiljM/RRj9d0MoXus1pCzbCrHuOpxYL9XbRZf3gSyPd1
	+8eeWcc/dkpfruusUJeWznx9aGf3IcaeoSwrptKfoEFYGPWketTTHf3G7RuKtQItD3Dvl/fYeBV
	erBoQKqECUlYBVFOBdCkuakA/WGF6ecsXPWRHVrZ8BqcLVaDLBcBL4J6ygt/A1fMhrIgI
X-Gm-Gg: AZuq6aIW7oVfO/IyR2jo2aHX2nOxBzSswiQNQuTJQFofLsD9A5Clp2AXcrKXTstnSzj
	0vPKCoAJtj/YXFsk/j+37N2EKBTZF9Rd9wxWuvfSGJ/OGOKDBhyaI/aASD3syA3y9v+fxM1hTu+
	tRCS8EZrnNaj2U2NfoWzFTUG4iw1B7w10UB7RNkj8MRHdevSMfD05zExbGKNgJoFyHeGBahzwyZ
	ZNGwrFZsHNFj7EqInnQgkxwJie7b0MzMANra7T0tceiAVophu3FexkCIHhamFg3Us41TaqPd58j
	yQba5ylCqxI2qTUC38BP5bxqrinnXG/3YQOVpsyIU5e+hI/Z48H3buhpllF76bh9ujXZx61/1Em
	tM0fdEWvcQVBIUMBnRaewtoqIK5TL2mgwxQioB5UzkH46rxVZY79L9si23DUfuzvF49U=
X-Received: by 2002:ae9:e710:0:b0:8c9:eb7f:b6d with SMTP id af79cd13be357-8c9eb7f16d1mr195902785a.4.1769771142170;
        Fri, 30 Jan 2026 03:05:42 -0800 (PST)
X-Received: by 2002:ae9:e710:0:b0:8c9:eb7f:b6d with SMTP id af79cd13be357-8c9eb7f16d1mr195899985a.4.1769771141715;
        Fri, 30 Jan 2026 03:05:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef87254sm397985666b.12.2026.01.30.03.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:05:40 -0800 (PST)
Message-ID: <fa760b2f-4b8c-46d5-90b9-2ad9e69ebf04@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:05:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Allow
 regulator-off-on-delay-us
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Saikiran <bjsaikiran@gmail.com>, lgirdwood@gmail.com, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260127190211.14312-2-bjsaikiran@gmail.com>
 <20260129174829.GA1324020-robh@kernel.org>
 <355213ef-106c-4383-88e7-9b40f5b1c1ef@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <355213ef-106c-4383-88e7-9b40f5b1c1ef@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697c9086 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GEzcQQvqF8elpVRPfI0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: _cJoA83EYxT3ASSvMf10mhU6I979WZyn
X-Proofpoint-ORIG-GUID: _cJoA83EYxT3ASSvMf10mhU6I979WZyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4OSBTYWx0ZWRfX3TOp/6qXbI/g
 R1UZw7oWmhogYwo83PlRBbyvswzq4hmesMLiHJZa8Hs1JqOhjqncv2OH+webfGye0Wu2rcuLanA
 6WdBtoQ9C0EyGN3WkQeuCitnVaGkJrqXlB3yOfTLDCN3d9wMsnFkJKYZSdOzJGXkMy+PGnpGVP7
 b1p/mWfZKbz3QkXR5XIuPtt7n+mmPsu7/TDkxn0KF5dCDB+6tFMYwOhUTvjBSW0pHd3XjSjCu0J
 5XSjIvVtv5eKBBjw/urcOe+XmewgfxHu8hZtmL0u136iwxykQkNfS4ZeOgyYVhA076N6K5NkM41
 RZg+CLwNSaUN9jnrn4cf5EWOcf8NTT3lT41NM2AgHznv6MgOIEOBuaavCjx8mvGyAjprnG7gd9T
 ETaXRhR2q0UOphjO0ocO4CbZW2wa5vEp1vZ7GamK0LobEV/1a3Ai+IaRykqPraPyoQ2gKxEpE1I
 KcJcxW/b4uFCSnHGhCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91284-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48DA5B9E6C
X-Rspamd-Action: no action

On 1/29/26 7:15 PM, Mark Brown wrote:
> On Thu, Jan 29, 2026 at 11:49:42AM -0600, Rob Herring wrote:
>> On Wed, Jan 28, 2026 at 12:32:10AM +0530, Saikiran wrote:
> 
>>> This property is required for platforms where specific rails (like camera
>>> LDOs) rely on passive discharge and need a mandatory off-time constraint
>>> enforced by the regulator core.
> 
>> Does enforcing some off time on all your regulators cause some negative 
>> impact on the ones that don't need it? If turning them back on is 
>> performance critical maybe don't turn them off in the first place.
> 
> You might see something like unexpectedly long delays resuming a runtime
> suspended device.  Generally I'd say that if the delays needed for
> something like this are long enough for anyone to notice they're long
> enough to be disruptive.
> 
> Having said that I believe an active discharge feature in the hardware
> has been identified and is being investigated, that's generally a vastly
> better solution all round so hopefully this change isn't needed at all.

+Jishnu, Kamal

Could you please confirm whether our hw can do that?

Konrad

