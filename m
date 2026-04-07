Return-Path: <linux-arm-msm+bounces-102134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ64BFPj1Gn0yQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:58:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 763263AD62B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C051930305DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CCC394798;
	Tue,  7 Apr 2026 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5e8x0wC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JfsQHdkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2E3A75B5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559247; cv=none; b=r/ft+mQjylMR9DnNrEwe3sjDi7/5OScnf+zpUif/csHmxDKwHqRF4dx1lv32archSDPoyqv8KaZSkiOuEV/2tFgl24Ili70Fwf5EZD8YI10CkQ1AIHKZ5+bnu/eisazswgvvXOXo6QofS+jguujFUCGc2KWpaZQ0Ke8WeYKmXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559247; c=relaxed/simple;
	bh=cDtysJFCTVlhLCi8K7fMRs2yFDSXsxiLpHPhAa2G8wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7O1ZY6fRpvzb+5VHV2zBJpPX59JXkk3hiVazsK4qILAWTSDkD1R5zXZV8DYeixDvZZW1BTCLhjtgbABwX7owZYWmuiszFmkJLxcnekAlHg76phNr+qh27KdNUnO8xNcnYj9te15IffPyQARKjJWRubhLOAwLx7MzRx6HwxGFmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5e8x0wC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JfsQHdkE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376X4fq2327732
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPhQgmTX2jRBkQjnSifEgvXH19lDzdJqEWxJWe2dowA=; b=C5e8x0wCsE7pASpX
	EX9J1nM/LxbA5gFqR9nk5PRPJXjgcOw3Wss0fKWlDDKAdI+qE695J36Vtl4ZR76n
	Ha21Hgp3G7o4jC4UieYwjkhP4rvdTaNgQPmTYmAPYIEh3dmE53AIitFJZTZo4B4J
	wQdYiGWARC3/ug7A63SVWc1n7e8unPgvw6ggUZ1GgNKjUsysE4BRmM8l21Fscwc9
	XSylcDGPl+fksafYsfex4+SEOZXyjrN0LL4qtRto9hW6Qy/UnHvfRK7tHQoBu/H2
	dvyXu2kQ5FqfJSQtMz1yHCPIrTOnkiftIDqBvb2b53CYUcErVmQ1vw6xWNNu0rAe
	pZ9J7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tbye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:54:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d7128e038so10401381cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559244; x=1776164044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPhQgmTX2jRBkQjnSifEgvXH19lDzdJqEWxJWe2dowA=;
        b=JfsQHdkEgobnULVkreiVrAUAmM3SJIwefzeBr32iORMBQSipa2Z9dD2qGHBcOGVXGY
         VWRL0U/69FgtmIlDylONR+ELPSpbw9dH7VtseINS5BCvvt1xChjc+H7xXsdS1DG4shnk
         iHI8zcIeFA+slBMHEgZnFcD8xyQzWYMOkMjHaKQpBiQ/34UasAqn9F2jkEck1to2oDm2
         7wID0n4swhY0zyeymDhkUa0xAhabbS7UdGXvGTPptopCZeCZ1nNp7ARDWIv9vrcSLlfv
         ftx/CdKDy1qeRu41gLLIT+L3ulMBAYQNcaVhm4xYxOkbvFTw01Fh6EMWBD7Dsuz9BRQO
         KH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559244; x=1776164044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPhQgmTX2jRBkQjnSifEgvXH19lDzdJqEWxJWe2dowA=;
        b=W/iccHqEvhTLGnNvmd5XHWb77CJagea59xkredr+z+Fsh+IG0nX3CfRWQ7CjxeBIKc
         xfHuRF6nqWGQw3Vf2qwe+fbDd4iO2q8fw/CqYCd2MpJ3IRCJTpVLB15t7ktT0sGBj5On
         0G3xbgxwXqKPWK0YD7RyYmrgJ6/jybQoPAGe3KDhYGgj8EeBuA5S7cSDS6GU6fmPNOpa
         6+Foj7K2HHW58Jtk2aZ6pjjcslv27hZSZWyzMipNWbeXpYqPu+rCFwgvYL/8EahKoZWE
         L50O9ADeHSXVhQ1HiB0xAL43QK7gBPALYrbabhsU2D6/udxpUQW9HgSgikztE0L9ojVz
         bMtw==
X-Gm-Message-State: AOJu0YzYvZkMgA5V/M4gWrAIYoILyMX5nd0gIXS2qMAuKz50gpgGAbCW
	/qkOv/nh86qb7H0BfX/CdQBNRZ12LVNcK/4qjxycN479wUEL6ZwrMq6c7O4r8Xs36TAUzGpWMcI
	9qASPysVhzxV5OH4DMhU8nt/HY3V7HMBxlMWCReY06DaVfDHYJEicC/gjVdm9GIpSkj4M
X-Gm-Gg: AeBDievztdNvZncI5qPivsiHlalEhupbFk5N8FGy21IK26LYjgIR764A0bwAHZumteR
	oiIOBEPYKFP7yXrfJftYScsVcvhRzic7ET8Put/ZJIbMVG5z0aEPzqwfBARLnIyVcQjxOs5hQqY
	0wRLTW8CAftGSXFOiN9lKKNrIVtaoycQzKiLCr1RfGeJmTg1V0+m6y38VPbIrQFU6EymwlVILLQ
	lQsZ0Y2TBp8CI80W3PD9A2iNcGefQpFG8e595GURKQe52OXO7kHBJFwLSlmEgW8dJmMbbrJbjTX
	kDnYkSL+CRoLlOAcOOKCLHxWi875rDOMfWY3HMzX4phSWiHtwr6BduddgYzgoWT79dMs5Ob/3S+
	pSKffHqMnAXto/xR9ugUzovlZg1EHM71pm3ybfpD6nxjn2NPCKV+WHvJgqXItuw0UyNI+OQyHd1
	WntvI=
X-Received: by 2002:a05:622a:2b44:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50d62d201b3mr165487871cf.7.1775559244426;
        Tue, 07 Apr 2026 03:54:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2b44:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50d62d201b3mr165487681cf.7.1775559244047;
        Tue, 07 Apr 2026 03:54:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec58f1sm551798566b.33.2026.04.07.03.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:54:03 -0700 (PDT)
Message-ID: <03f8cfc9-4e62-4181-8108-7cca4d48445f@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:54:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Hawi interconnect provider
 driver
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
 <20260406-icc-hawi-v2-2-6cfee87a1d25@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-icc-hawi-v2-2-6cfee87a1d25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMSBTYWx0ZWRfX5Jt1RiQGtJC2
 FfMi4I3leyqx3IAmMlroeDnDw7CIjBlUR6mYQCgcFMi2oyAM9ohoC+7M3VJCI3WdLGRVNVZgZ1T
 lshHW11ijEqFhWbNxVq0PbctIXUn6fD4Po1S2jCOpAEtDg59x/QpOjVeNUWMmvtds1A2DpWpPUp
 8vs6falgJ1DkBE53kv9DJEhlONg4a0lgktw5lA89J9RRXOYZMpnWVZlVvP6dF+VGu+sPolKhtLx
 w6DSDSZ2jeyhcjcNLC07myypqfrHVbLTIf4rq7UaGdtslFFZKeiE6fPMaNzqoDhgQAqXy/ei9Sk
 O1b14jTfY03NtLjm/9ZPgjTSXOAfVPzHzrLlTlnfMQXTLv/p6/fGpxZI6weFwIgXxdsG6MU8OHV
 RSiWJnuNBmmgqSmRmfgyrOn05euMQHE61aw8lBfQWgtJa/g6NcZMeUIbWZgQOkulG5JY6ElsKuP
 Zlf30IycqoewiLMJCOw==
X-Proofpoint-ORIG-GUID: FGF3WF_epSRai55ShlcHDkzoUwK5j1i2
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4e24d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=X2bA-DTC1ecWuKQBpGMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: FGF3WF_epSRai55ShlcHDkzoUwK5j1i2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070101
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102134-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 763263AD62B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 1:04 AM, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pair.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

You lost my and Dmitry's r-bs from v1

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

