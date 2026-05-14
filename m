Return-Path: <linux-arm-msm+bounces-107525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAWMAzZhBWrsVgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 07:44:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F3253E107
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 07:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A0CA3019809
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825563BF696;
	Thu, 14 May 2026 05:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hajFHIZx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJaoluFI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1C13BED71
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737458; cv=none; b=rzIEELLGK8biENF+3YPPwBkKFb96tMQFjwd9ManPJ3mQkT+XbsUgyLA24gjBAjmfBfe03ThCQmYh9weE/VPUDPCvjbEETK679HLNZzLDF5ruG5Z2enu6R6yrmLk0+Q+zPOLx/awKrDSjOcbJs3oytEApswzOqpmEWrDXF3y+A3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737458; c=relaxed/simple;
	bh=3f+KPY37idSfDnhLbcJafSxCfzWSg63rXo2ZFL0tJXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ns1319WP+jaOwkPql+wNX9QqKulxlQooXiMNaT13AlxP4RxlGmLwQ3J47pH1w9i2GVPimYIpqWyZtMGEmLZ34hUELH/xmJynyb/q3EmY6eTwi1Qx+gKbCg1Pv3mlb5p+pryWM3PvXxm57pcICleeVi6yNefl/y7RqU3dSVPisto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hajFHIZx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJaoluFI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E5SUfL2004433
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1B+Yfa5hp78uken1T4na0rArE8/5QXPftFj5P+2sOo=; b=hajFHIZxlEQOvFnF
	QSKyLU1Vv8qJDYyO72klQB5Mw0yI8sPYJLLJZnrNnVcd6xX8GTNan72ZQxdgo51b
	I5dtfnneji9L+GhGvUtq2wYn2wcPawsnYsNvZP5AP250sew1s5GfwrKU87hKHgo6
	76sRzmV0CV4FfI5BZnTHdVUToKbKJr4KsvHEuyn7OKbwz4MdWgzB86ofh7z5Gu3r
	NL5Dm8eyriIBj74QHEbnbYkVp137kXweQMkOOfSzacNaYmhaMzC5AiDHhae6zoOO
	ZJZBtFG4zCegb9env4zONzv66XBDz/uCJWcTigTOymwfXOFpUL56tIzC+hqvntcx
	OXzAMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899r1e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:44:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso63599911cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 22:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778737455; x=1779342255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W1B+Yfa5hp78uken1T4na0rArE8/5QXPftFj5P+2sOo=;
        b=WJaoluFIVDA98cp71vzCD3amqtXT/kRo7GvA6r1Xn8HD3Ys+z3U15hS4jercqEiiMO
         r5xofRKaD6j+K4MYEJMfnsyAXapI7/vVUqSvh6O1HyoNQtbqJlasPMwMELR8Az87gvZD
         5FC5BgGpgMMDJCVBft0Y3rtAq/mzueAZF2RfOEWbb9l144Xsxr06TICU4afB2YahIXPW
         UqW/Up3uQ3d3NSwjZ8MnGROHma6Ly3g+tShMECFsjuAqZ98npivNSdrlJLRpujF92cWM
         0Cb4YeGZLxLaIGZtpsKxjuMDRTXccXJae4ygv1sK25jdCk/qm0pCamgozXp9rzeKXcSK
         WlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778737455; x=1779342255;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1B+Yfa5hp78uken1T4na0rArE8/5QXPftFj5P+2sOo=;
        b=jqx2r1kK4oHnNHfuxXRcN/0Ut0KknFANTKNo9u2nDF++IROb1uHParWjFOfrf6jlMW
         I6r4YjXU8FIou79wu+2MziPjD+al9i8DaWzq2SMNGxecrLZGDgZorweyqfpt1Fho+0Rw
         u++uO6e7ucGOFA+FLlL/gM6Ffqz3W8K/G40E7u7FCntPQYbMFSMVL5BeGjvyy+ePsNZp
         WgYnSYnTpWrtamAZ4Naxxl7SdYIkHQ20JyxxyulKB0a3uXoqU6d8Rc1e/RCOscob7DWR
         pI4EoV7mbv857angHhVvfl1nAmZqutpblScRPyMidvN6S68gJaGD+NWZg+oOMHrX3YgJ
         ef1Q==
X-Gm-Message-State: AOJu0YzLsxujV1TFQNH9JQQ/4gbsvLM1/N55yRhQMVvu4/7Sz3p7IFyy
	8i/eSMyWAXoOOH+/NMmVREjyVaWBLBF93JF0xjsdkeWpw+fHBjOd5U9B+aR6QVC47BvmMazqx/I
	5OCW2Vb0KepvnKBjbyWmXG2SlQYrdmrT1L0sFv6SHK1eERAlZHksLxdOhClYwUHjAFJkY
X-Gm-Gg: Acq92OFEJVyUcyWxxig7fTGC3e4uI0hHOXrKRKUe3CusEw1FU7FqLmPuRDd6OP4hg3k
	0F7fShI5f2dRz3Uyh3ccgN0HUEtL0dvOPnWkqUhlhEGqtPiNYSuwoOysXIFijr00dV4dZwwaXEb
	5zYRDd7PizEpsdetqM/7GaYHA3sjEDK5sBDyQafOfJtGZFnJI1p1BO6ZR/fXhkewVNXkElHZI30
	azS/Tfh5IeWSjN2TbY9RoOYaENW4vcCBFkCRnhJg6wCPhMjlYQUl31NHGrbQDHzf8G+tZIdHdZz
	CemM0c4aS048RBjSWjV8uDq+z43ggdtpkYBaAZe54BgiGw2+w8cD0XNtzKdfyqoULI2L/EMOy1U
	dToMJplzwKB0hzbD9Q5Fgfg0SFPtTas4QMkn4CXbGIgtcx9KP
X-Received: by 2002:a05:622a:a915:b0:50e:635b:5564 with SMTP id d75a77b69052e-5163bdb1880mr44383831cf.48.1778737455513;
        Wed, 13 May 2026 22:44:15 -0700 (PDT)
X-Received: by 2002:a05:622a:a915:b0:50e:635b:5564 with SMTP id d75a77b69052e-5163bdb1880mr44383571cf.48.1778737454965;
        Wed, 13 May 2026 22:44:14 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd64a0e38sm39838065e9.7.2026.05.13.22.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 22:44:14 -0700 (PDT)
Message-ID: <5c615bdc-3a19-4f07-a38d-16d45f318411@oss.qualcomm.com>
Date: Thu, 14 May 2026 07:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom,eliza-rpmh: Add SDCC1
 slave
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Georgi Djakov
 <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA1NCBTYWx0ZWRfXzvQ99z+n2ykt
 hBliY2gJoPQVDR5pEMckSg5Gmg886BiMFOMxsIiD7Bb2GUlajEImfs+f1L8o/prwxdbJJOTM/cF
 c12PV68FonhZi5MJh1TOuAWQ8ivKqeiA/soyp2tPMnSKG8QE0X6toYx5+qMuMXYE+IDd7ExcUP1
 X5Gy3mqekEy+okfffs3dMmgYSTk0zKOPY8RsTkXMwbhEceFnRkyL4uuV1RL6bpDsJE8xvkds2rd
 n2u1BvTYjwjSEgxIB3eR3JiipRd0War42lFo28SHfLzW7m7N4qdnpdlmcUn/mAzceCxDHqanY/A
 DL1j5rrC+3S+R/gT9P034CxrXDGwLrbQoxWzvnCntya3/O0lf6Q2Xz9Fg/VefhbLJ9UsKKJU/LR
 A9wgdz0LnNhCUXWuf3MIzWZX/sL/KykOU8Ni+p8ezf1NGlK1/pwufh4bbXWCSRLM0C1uYN9nf9x
 FjinGnFIR+mV6hpRLSA==
X-Proofpoint-ORIG-GUID: V2b3igMSKzrUXRmTadlLm5IW7qxq_t7t
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a056130 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7hnulnQiEmFAxUmVZrYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: V2b3igMSKzrUXRmTadlLm5IW7qxq_t7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140054
X-Rspamd-Queue-Id: 76F3253E107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107525-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 12/05/2026 14:18, Abel Vesa wrote:
> The Eliza RPMh interconnect binding is missing the SDCC1 CNOC CFG
> slave ID. Add it so SDCC1 consumer can describe the corresponding
> interconnect path.
> 
> Append the new ID to preserve the existing ABI values.
> 
> Fixes: 8300438dc424 ("dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC")

No bug here to be fixed. Incomplete first posting is not buggy just
because it is incomplete. Otherwise please provide more details about
the bug in commit msg - why initial posting could not even work
(although it did work...).

Same for second commit.


Best regards,
Krzysztof

