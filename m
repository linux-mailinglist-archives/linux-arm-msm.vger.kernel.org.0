Return-Path: <linux-arm-msm+bounces-90017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAmfBkvOcGkOaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:02:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDA65745E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D81F9EA36D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD103481AA2;
	Wed, 21 Jan 2026 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhTDJAQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KaqPsMg5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24134EEEE
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999603; cv=none; b=P8axm5y5rhnEObhZk/S1MCb6H0iT+lqNcM1wqKkrS8uetpTong2Mwp/D+vvJlZA774K/DVqNg5Vv4+qkSvffwYzm/9eQuqQN2Snh0meZPqobXYmf4FDdxxge/r4sYj+v2ykeju2pDQ+49tG9Q3V95FC1drl2ulCnGR8fvXOVIgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999603; c=relaxed/simple;
	bh=kcWVg8RyE5oaA4SLks1HrECuEVk3YXF8f0EC75DLLAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VOSSmX4Pf07yfYDcXXWwgtFbdlRexbDqCPe8HDUFS7rcLe8JNgVOHULQOCmSoHtoyFyiQNp/OCM4xD5l1mfbC4X5/ixFdYWKA0JXRlfRkI5sIRD5TZ58AgfZVn+kkeHD74NYIxS6X0UYDXO/esFfDZeM5WW6hK4tOW+0oGifqSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhTDJAQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KaqPsMg5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9j1K42840557
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CuuE63FU7lC5Rz3dqZ/OCsZHThjFOq/fH50DC8Jq1ps=; b=BhTDJAQTCyVn/CuP
	0reyujoIRLNZ9c3K/8tACGFP2/kvpxlxlRQh0ug6r48dhlFLzzWn8O6A3TVnA72W
	oaQm+Z2vKQcpZIoMevMEqbGglRD+n4ZYt+Rk73/e/IHlbs0ojRVFOUSfUNJUfO2i
	cTloYxpkMoj9/KpJJLumLVXCb4HJaLwA8GEVtHOhhmIkWAwPJzrS3OsGkwDRcQkI
	VKBYH9BSF1oY1PtfTHBA2shob/Jv/Tm1DGP8ilng7pfgIEjVATJgO8/lQ/xhmD/W
	rZ4olGAGBPR0for2E3VffHTm7VvIgZYLv9vyBa6WBAC3eRys1s3croE1PDLAGHQU
	fW3jcQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqm1t0ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:46:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6d6b0f193so10703585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 04:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768999600; x=1769604400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CuuE63FU7lC5Rz3dqZ/OCsZHThjFOq/fH50DC8Jq1ps=;
        b=KaqPsMg5N0Tb7V6crdBUPPGZBUGR8SyA8w8Au3E0kGM3BhLS4pB/1o4aXLv4mUqX4e
         YlipTQ11Z77EqiSbxmKS7mUoKIpbDttwJCfpVIk805/dCVoVZBI/Qy69gn9Su6aLbLrQ
         N9WP4KC+BwoUO0/vtsKWYDBbYuOolkO7rn5jERBV/XULy/k9iC2IQ0kwGNzpvnNUNH/4
         gw5WE1jUSBOBbXUhE0puOlXYst/7Aqb6IiUf+jZ3jHKn/62vCRIwaPRwoJ3qJ/Ijw2xH
         vYZFDDwsEjXpybUaU+gr3f//Ws2QsdnRJGdojVjltA2zE/Ugi0eKNgpWIegUrmKsp6LM
         FntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768999600; x=1769604400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuuE63FU7lC5Rz3dqZ/OCsZHThjFOq/fH50DC8Jq1ps=;
        b=OxUBBVya48wvleUWA9jIYmxEBm4BhLkSbHrx6cK0V1S8Kh5qXdw0Rf6nn1Z/ve3zpI
         CmGDeB0MmA0CLW0FJAIGkVcB90Depyk666X1irX8ulOl6960T+CEEwuhd7QHBr/MOMod
         3GUh41QY2xzlbr0fo1arZdSIECRNhnzEDXzBdsrv2jv/LvD6Vz9WIHZs7DM0bGHau3Io
         5judaOw5r9BsWws1308s5LraZ4J4a6e+//7M5oAiCkTekrCj7bNxk0+/lXM0mfhFiNdd
         ZHJbcVh91m/UTCCv6YdlPdo9lfrPfX/jYxmq41C5TDd/Lp8Ml4C1FS95zwSVeCcsY9d4
         A/7w==
X-Gm-Message-State: AOJu0Yyz+YoOuiKHPxWFwjCLccga1JbMPEeJ8iBYASjff2t2j20TuyAI
	Ag1hACZ34YaZGwY0TC1pjbn82f8UTfShNMcgfgyUNtcWzvQnCUsVXp34aJ8jBTvXJbZW7aWoNqR
	iJcY5LUUDnRRP8JOBTqYvcQ/hzYoSSdWkukANEerVaFkRUJrTUMKBy3hMEVisFdGDiFXc
X-Gm-Gg: AZuq6aK6bHo203DH1Ezg7UEJjIu1/J36t7WV19A4PMMLLlgaE5WjksPZ8KBoUeOkBIW
	TNfJyHFeeMRVVvHXDaD3NbRzW+aTTLBcIIHW03VoA6gMqCZ5P83MWoUp9bCne9U/j/y+2dQgxf6
	R5aYHay0JIqIdgPOlukNC1IJ95tv9k7TTZ4om6J2uPWaf9VmBy6IlYBkiXf3pUCyEq7c5ev60WF
	gHjG5yyHlSTpoxQDrxDHVkTZjflxdJdCJa5EXe6GId54KDitU7qunyk0qVuHTYakBHztryJMnNN
	yVwhBRXKhM0oFCNjQogTc47UkGCkaTd+X+wKWwsT/zw/f0PBbAeZbHpDVyMIBA7WohEbroeWZc3
	wODB5l2rf2wQz6RGVfB8eXSt/3VxgVM0FEiakMZ26ISqXOQWFM11rT1idX4rXZmt9aXc=
X-Received: by 2002:a05:620a:4492:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c6a6606fcamr1768447385a.0.1768999599955;
        Wed, 21 Jan 2026 04:46:39 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c6a6606fcamr1768444485a.0.1768999599575;
        Wed, 21 Jan 2026 04:46:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9f98sm1639061466b.42.2026.01.21.04.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 04:46:39 -0800 (PST)
Message-ID: <4d3db091-ac43-439a-b065-c6b32da65f80@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 13:46:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix
 reserved gpio ranges
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
 <20260116-xiaomi-willow-v2-5-4694feb70cdb@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-xiaomi-willow-v2-5-4694feb70cdb@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNyBTYWx0ZWRfX4MShXjg63OsH
 G/6mU9ae7u0NhFoujFtK+RAGlCyW9Kmo85IsKv4q8xdE29IFK7P+mgHNk+3z61/qQexup+GmzVy
 l8NBqHv3zC02edBmK3LKsflvwg5bs3FJ+7Nf6T4HAdAKNE/BCGLWi1fl1kCvH7Ti/ryuB2sD5Vw
 rgqWYLPlXFt3fVUKVp5dz1C3rED7E/pgZ+BOs8tOuqR66wAx3LH3SZrLtPX5d4TW6Z+btSAyfLI
 WFB75gUJ3WhsxQasPvyF+LnC9z0EWs68jPPaR0gGRE8IW/5/IPcMrx7fM1uEyPudjsjh0mGhxRC
 MNagPmp0a9TW7G44Wc44ofmtLxqyUvNdWYoqmUD/mhbrPtVKb231TSHqBI1E56y/AYy14dFd221
 PVfLJLwcjJ51BUDpTAEV+sEAAjN+KBKEFCV7CfTr0nyylYByiHW274BpL/bStr4Uc0lytU0qP4D
 JpqSo17LxFHVRrNkEWg==
X-Proofpoint-ORIG-GUID: nx8RzETaYHyESCdpHovTuPo4tIcn8wPm
X-Authority-Analysis: v=2.4 cv=dtnWylg4 c=1 sm=1 tr=0 ts=6970cab0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=76ccbOfYyMFIcZEcX7gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: nx8RzETaYHyESCdpHovTuPo4tIcn8wPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210107
X-Spamd-Result: default: False [0.08 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.54)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90017-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[mainlining.org,kernel.org,disroot.org,intel.com,igalia.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DDA65745E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/16/26 4:54 PM, Barnabás Czémán wrote:
> The device was crashing on boot because the reserved gpio ranges
> was wrongly defined. Correct the ranges for avoid pinctrl crashing.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Tested-by: Biswapriyo Nath <nathbappai@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


