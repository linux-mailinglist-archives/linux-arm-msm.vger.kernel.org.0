Return-Path: <linux-arm-msm+bounces-96918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEtvJqU7sWkLswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:53:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DBA261590
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2FA733687B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927AF3CBE92;
	Wed, 11 Mar 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ/L22FZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lyh5oLpX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E103CBE9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220618; cv=none; b=NYcEfDVCU2lqaQ+vGl4XbhpzYta1IiPMGok07UgegCB3WOLaggrjssUTjt66tgveK1mOVDiV+BcqfQ7BS023duHr+/ajL1O+a/jj+m/gKikxekan0YDV288PcqvjxXtvekBPTzG+7KxamtpFb6S1CydqyMBln7Wq5AA6pfXtUnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220618; c=relaxed/simple;
	bh=PSlhvIejG9w0bLgCFqKdR2Ygu5XgZVt4JAI6/WVAFn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRQ/6tEJY24TZw25vbm4EOCa/xZBKwGQHSIrrCQoYnjwcC2bn8jEb1GoUCQK6Q/SkKR7JGrWFL6fJefWHAwLZFNxVFN6f1a4vhXuGMC9JeTriQUmJ7LpM9SkGTU2tAaX3CpKYO4B8nx/rEHNDRF4luurnbaEdxLgeVsT2kP0DqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQ/L22FZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lyh5oLpX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4fgYN3417107
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTuRn4LaRnp5cT9qIKY21b1sP4oc3XDbKAcewaqF084=; b=iQ/L22FZrVBZafoJ
	yr1Ycd03pkJ/nMl1l927m0VhYJplEnzl2jl66xMQ6OV2oBO3AnDABgIyGvZ8MooS
	30gocwkPY4dSv3tqMs7DORg5f2YAwNaunZJf/w+U5FIOCJRcknuR2736dgHt2/MD
	ORffIBB3rwp1TYY+8Wf/0Qcad1qfSmCymQC5YUKPnhYofV2e54yFLaeEyJ61tc02
	HWZwVrhN9JtsLErMgSlAuAACrWKxMcW4EEAt21fY2rhYpbgycvT8WkTSzXcxdKvA
	6EvD5XgtAl08BaliEhqUdKpZEl995hHZOsOadq2bVWdaS+bW5KTlcReQvdvdsbbV
	j1KHaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2c9ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:16:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so940220985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773220609; x=1773825409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTuRn4LaRnp5cT9qIKY21b1sP4oc3XDbKAcewaqF084=;
        b=Lyh5oLpX6El2MjO4AfdGM9PKdiRWuye2qEfSOnOYPIyTBZ3gIn83MZYyTf1hdTj3X9
         PWWoRG5t5j/p0GASioAF8EpaOy5H64LYm8MXAIJwlrL8xx3Ie8pdhnEXliGJqCgd2NZp
         ArDjcoe4OHyUAIckoW6+WAvqg/mDURTGop02R9GG7TMJPRsF5JDrlouD3d1ZxUYFG1fd
         T9qmDbOxDaN3gVkgphSv/wvIrCxzIUEb2L6K60UsWXZAFqeuZLWQnx0PDo9y08Eku9ml
         PI2h+lJmecjjRaDtPIhu9/PFEwpKTKAflkyQqMo2RgvaonnjDxdT6KsWufx8306YQ7VS
         YwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773220609; x=1773825409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTuRn4LaRnp5cT9qIKY21b1sP4oc3XDbKAcewaqF084=;
        b=oun61EozPUpkCZgZ91/3aCFr7IyOcFlGWAH7BmCOjhsnpZLq+Rj6SjWOUeSAovGH2K
         7RaKwoxq0I4rAf9WFtEZSmpoT/simMAQreWDcl53KzGHWd9s+TwByJR8nzxequr6Akcc
         /wIEJmFIKtrfgRCk4zW/SCFOvQGZ8rgbRhUhct1rmlToSQNKw4n02hyqwIlKhyt4yS4q
         3dEp7oMB1ZenC/NRmVOaC9OLA2TeLDP9OAeqL9H68NUSS2SVOB6F/a/xRVThJjAiUZuJ
         7WmnGFELQld744BCHW9+vnnmv+2hGGhUx5t6IdkNZACejI3/1x2oIGeNpodSE6fc/Bq+
         Vefg==
X-Gm-Message-State: AOJu0YyiPEo6kRr4g9rwJb47/ST554JkchxyHSoo+gYzpCf98iNINKHU
	ub4RkbX48g30yEhN7WsOzPtHBYYAxQuQpf6SoApk2VoqhVJEpjugG/u1AFsSzzV8T3WFiAnokvb
	f4lBqsOZNqauPL224sPyucofo++SHLBQAyHlHiAZmggMMJGk6qaUWABOekeYYzfHlK8JL
X-Gm-Gg: ATEYQzxUUtIaUAbbPL3cO7SALGhTFmZ/7sPXQ/7Ju289pQAfUseBgyocPF98CUugt7f
	jiuBDIxtl+K5sU3ujl3F7t/KQvtVyvKNYAjNfFCWad+gOHJ1Y/Li7lytleYkvDVlJJ2IBjhzOGP
	zodYTNHeqU4mtJ5gywQhWvHEEnK/gwMPhubc55tgzi8zNeS3bycWq0e9FVg8v2r1xFWUZt9rDTh
	nHZnjdw3oZ8xp7mbEoVjlEpprEv4UDpgfcqjSs7aQJ5hT90GYWC5qhR4Qh3z15RRLk7TnsiuhIY
	rp6gXNdrPEdZkTeQ6df4GClfmFSlfat7BO1zQIlh0lO7NY9s+Ds/RGtmeM37EXxU1wVkqZFOdUa
	QEjZe7pgRdNNYyoewbMG3T0d1APQs7yZWRjTG9Moqf3NuIggufZznrUOENmCZazHMel6kREow/u
	5V7O0=
X-Received: by 2002:a05:620a:1a84:b0:8cd:86fa:36a0 with SMTP id af79cd13be357-8cda1978963mr153147385a.1.1773220609235;
        Wed, 11 Mar 2026 02:16:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a84:b0:8cd:86fa:36a0 with SMTP id af79cd13be357-8cda1978963mr153146185a.1.1773220608849;
        Wed, 11 Mar 2026 02:16:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e14c2basm39789966b.35.2026.03.11.02.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 02:16:47 -0700 (PDT)
Message-ID: <9b6520b3-aa43-4657-aba0-bba89af8a47d@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 10:16:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add Redmi 4A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-6-3bfc23996857@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-riva-common-v2-6-3bfc23996857@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b13301 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OuZLqq7tAAAA:8 a=E33YjpFAXuMWNsGDmJkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: qiMy_TybahXFD3m3GNKcEAAtEUg1iBp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NyBTYWx0ZWRfX4djjbgVNcXwr
 2m56DVJV0FeZChcG01pHimGxFuVKEVFkTlwN6jOikg+v3T+g+deIQQbk6orO5wmaVnG9v6Qrgc1
 PXtDDZplFy1fha5NECwY7hfh1yfknBptTESLEiAjGga+kEWU9Pp4f7Gpxvl2lVrs5wrDsQQU3Q+
 uf4ensYyQXEHC/Ao6BHCX3B5h4nHM6lfLoP1NsKiQuzvfNqaXUuk9DZ0GNnuAKW/C1/0s+BL/Ox
 zSRcvayVsw2kEgRXmEih+yBo0/qG7ZMIaG912vahbt9ODsgxbV1tbynmtG6l+EeGfwH2bWTcbXx
 DXtN3YDHo8f3rdVNVqZS1MBeC+aC5fV5hP63gSmmYAXyphy/tBR8wd4l0VARpgI3RTlQ/I8TH7F
 xEKwdncUxzcj4jXPwfnyto5w/oz3OZaopXucZGpu+f/ZiqRaEPzujXty+Qsu/Bu5fViBnA6KuEV
 5Gi0wqkIvjmGyDYp6lA==
X-Proofpoint-GUID: qiMy_TybahXFD3m3GNKcEAAtEUg1iBp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110077
X-Rspamd-Queue-Id: 05DBA261590
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.10 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96918-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 6:21 PM, Barnabás Czémán wrote:
> Redmi 4A (rolex) is like Redmi 5A with small differences like charging,
> fuel gauge, different speaker codec configuration and display.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

I see the Go has some differences in regulator configuration.

Does the 4A's one match the existing 5A?

Konrad

