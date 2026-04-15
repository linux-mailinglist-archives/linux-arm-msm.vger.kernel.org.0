Return-Path: <linux-arm-msm+bounces-103270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHgeM9Zh32lhSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:00:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 177344030BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B463303ABEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD2D262FC1;
	Wed, 15 Apr 2026 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tnamk2gw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5sUyzeQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1492F2C21D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246616; cv=none; b=px8s9uUGEqNsuRrR6UNQWoNdsC/DeHoH4Vwu/sB0d0E6KxM55WPfpXKWlYAvMD+22fwU3DC+SBdNSCR3svT+ze2SbGQvrEiZDn8klMjbsqhrawhdO3U6IcwyrTdghebgDQvKXKRaO378pqCaPuddnene8YqvkRP7sR1Ekaqkd0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246616; c=relaxed/simple;
	bh=5i2y3GXDyHPHWiKAGjURj4RugODet/PRdhcJE+zWkmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhXQh3nyGu9PbMC8q6vX52o/HKY1byVxlJxXfr5mH92AlAga7YItAHT5Glf3ltssjk8NQIqmN75XP5KOUA3VXbHtedwbJByQFQfZBdakp5ho7t8ktcHxtbO88gxSJ2mcN36R1KhFCTVAkJi7w6S7jLpnvMs7rCZk2KzRN52p9Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tnamk2gw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5sUyzeQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F5xKN22772748
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fg7Xik3cuCHkFBDijQ2pzu3/5t4YHyhp1BJEICZMYVA=; b=Tnamk2gwcR+Gc0vY
	UTdkeSkr2+wxWwsrSD2m00vmDEpCvXwjpdZrEoINHfgSziUpHT0kdOxqlJVfI9Gh
	/DVszf7s+5oOx53uMCACAIhCrwcOSh3CHCdbuGGsT6qbil1u7akQ0yclAi59k7U2
	XpsoDm8fpbqwfaB1HKlo+Bf8ZXW44ufBZf+5uHTsqjhtGX0AyY64QZFzk5GmvgQZ
	cM6Vsgh2xvM3pXfR8plupscBncTjaaVlvvIrnUFqCx9tCRLSfce+QQEGSLNIVXPh
	WGa79+H7g1aRmJIZREH2vGEG9+1IzLGpSQZPJWg6dm1jg7fJ+R5IBdsNrrHKtSU2
	8fgN0A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj50v0udd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:50:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89f59c9bd28so14717386d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246613; x=1776851413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fg7Xik3cuCHkFBDijQ2pzu3/5t4YHyhp1BJEICZMYVA=;
        b=L5sUyzeQJlOAfcH0ZGU1tgacYDZsvkeZTVhtyNy4sm62Zvm1qWtQcXWbQ53f2+B8Xg
         nCPnT9NRcLtIcRXBYkvSa/GY8dR25p7wl3w0gozrjPlC1EmQHXt2BvicAQZvqPPnl7YN
         bu5ik7X3W6CpWUEYHLIFT8wgFgJjq/aHTbIAMYLoOIVVxUfaiYHyacln6NDGDB2BGIYG
         W70DVM9EoVrJhJj6W7r9EBZXiaFoKCy7hrl7xbRzYwfodaLX3oW6GuNQh2IyDbBKRUh4
         2zPXZAhyII41LU2c5BMvXLnje5LrXUxJ7faEfNBSiRwMTtI70Ww+N1YWFxweeUFAqFyI
         rBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246613; x=1776851413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fg7Xik3cuCHkFBDijQ2pzu3/5t4YHyhp1BJEICZMYVA=;
        b=ejVP0sm9dYvtBUaZcjiPSjkGT4isSBJ9+3okL+AfXAAxuADr36uGjq/gcLjD6DmiCn
         RDE8wZNikJMsBrVEkaNKdo/N1JCjK1+cWSN7g6vOl+LbmZZWxhqp17Ch6RuKdjCEv5ti
         XV16MPe0rQOYgN/kTqcrZiugu/LysyhLKY5bGN7jmPz1jA65NmNqIhItCY4svismbWtw
         getNyuz+VBUngpeVoxQ+ELciCg7uxh2/YmuXdld8/tch83EDI/TvuC7G9SzldbGiON+n
         AOSfZAtANGUcpR1Yk7tyYqh9US4tR8zu6zkQubVKYVMl6kASLJtV4A06GoC5oEdfeGIL
         fJlQ==
X-Gm-Message-State: AOJu0YyzVBBwEnJ7jBhf62F/ozCoyWGckRkEqSKFkXKwpc/HtnLo1Nwy
	0jAAiesESmGnc9PAIZO/srCo9vgsZjygjeHbTx/elH4W4xGAWhdeFlXRIuPQWIdAsBfUr6JYNGM
	ph1TUYdJQ3gdhS1QN+CHjGHtcsMW0HZvJPd7WfTTM2/mpFExtbSSQoTACtZs5XK6rr2Xt
X-Gm-Gg: AeBDieuu5lvkOi2JSnQ222Ng3aY4SJTXjsmM+dTeo1qXdRgVyXRU1vaiQCe9knO2XYO
	omaCHlKECYPPnZ0SAc74KHHa68ygMMs2VLG5zBoNVzcGHRrrTd87poTQjQIcbNoVlQ7pyDlndwn
	pwadMQFC2SfPqaTzCZmdOcdQbToIGsXZfcj8lGU7Is+ICzWlAfQSfhS3G7yTeapjtEX7/pJH5ZR
	Kcj4Ui2Ns4sHmP3HDpK2D15EZzcaNWM5Bp8NN+Ck9LfBnhT6P2H5CKZRhEQ5J+YQTdGoKrME/3c
	8aQPWKZIyWZTeDcPgLbIlzWWR1p3GhlNwlnvIef7XfMujO2uE4PvDW1QTvA1uVzfUH7GtpwhUjM
	bwjsTbRxor917NtxHG1wE75gnKzQ8Y5pJ1r4wx3VKr06DoLFunvvqzbK8kvXntLuMZgotxTRNkR
	yTx3SG8qd0iH4HFg==
X-Received: by 2002:a05:6214:4111:b0:8ac:b4d5:50f0 with SMTP id 6a1803df08f44-8ae6a94537emr18051516d6.7.1776246613542;
        Wed, 15 Apr 2026 02:50:13 -0700 (PDT)
X-Received: by 2002:a05:6214:4111:b0:8ac:b4d5:50f0 with SMTP id 6a1803df08f44-8ae6a94537emr18051336d6.7.1776246613036;
        Wed, 15 Apr 2026 02:50:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173d5d698sm40176566b.25.2026.04.15.02.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:50:12 -0700 (PDT)
Message-ID: <455942ab-a55e-48cd-a37b-6ab9efde84f4@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:50:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sdm630: set adsp compute-cbs' regs
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-2-03b475b29554@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-2-03b475b29554@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5aF14LRyeh61j1kDVqBPMU5JHay_nfYT
X-Authority-Analysis: v=2.4 cv=eLMjSnp1 c=1 sm=1 tr=0 ts=69df5f56 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=G6eyCl79rmFccwun_h4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OSBTYWx0ZWRfX1emw2efma5kh
 uR8cn5k8O7tdnDmo2KZF7fIpntSQnkj21RtlVWofX88EhbKWrwkL3haIMLZ2gCJMlhQY9fqLhqn
 f9xPEfaHcitYglc2wY3KhGMvLRGArdaZg93E8YwHzAABv+QAagioku72sj9bv44WFg/kogjuXZF
 aeAM6/IjfazvirAEHbNmGWqFTL1Hx2YbRmafFziLC52G+hHvnVJ0ZoHyVDsDtzG0RXmHWAjvZxJ
 4ZCF/wPqvWW3dE3Rv/qrHEb82qrZesSKgYapOTh4nJw3fZYIjwN04645iyyaoxGB2mwI7QjXkuh
 m5YXKdVKza132oqvKUWvK+RbWDhwkTz8dQxQDjg9t0BkMAcj4P9bP1r+s84cLohxsaWG8kaAj1p
 mIuIj6q/ULKpZ8ZTYAHYmjTSr1p7ITDnzHqH5uMDMp2icAjt9mBMHq8XU+8ATTvrzCyl+IBHmqq
 vkyxaA9tQyBDLLPtr1g==
X-Proofpoint-ORIG-GUID: 5aF14LRyeh61j1kDVqBPMU5JHay_nfYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[mainlining.org:query timed out];
	TAGGED_FROM(0.00)[bounces-103270-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,mainlining.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 177344030BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> Changing FastRPC compute-cbs' reg values to matching iommu streams
> solves SMMU translation errors when trying to use FastRPC on ADSP
> so change FastRPC compute-cbs' reg values that way
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

Fixes: af2ce7296643 ("arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

