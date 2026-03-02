Return-Path: <linux-arm-msm+bounces-94955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eASOO+WbpWmfEwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:17:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE6A1DA874
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FD15308A53C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3EA3FD13B;
	Mon,  2 Mar 2026 14:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJv6jhto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FaGXiNXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824D3FD132
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460669; cv=none; b=c4jiv4BaBbs/OSRKFmetPBoHvZHdU+bx+rVpfBVtiuRvurJgfQBAHqz+nWAVG2bk4QGkm+VWCkjEhUJONBKPWp9n9LLaaEq6ulihJNEcmfvqY34HLv/KQzlAwmqdRdSXe6pWGMNdOe4/lj/pvkof+ZO08o3JIivEiDL7xLbQriI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460669; c=relaxed/simple;
	bh=bxV+F/zGqkcxvFQ1Zai0L5atM/NN7lL2m3Xfaqfosk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4uA86E8dvDXgU+4mWQrFeGctJwPB7u6EE85/NyBWWRCPGnhePDTKtJSHPGkacBS3rKPJ6lEHSMdFeEX6i+qYfF47pUrMp+QwZoZmlfJG9YXNmIz9V2CalI+MdDl0mG5AMvkQD5U2ssnO/LxB4HoZB1JidjPbvKye2aj/3v4agg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJv6jhto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FaGXiNXI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B3n2X3863284
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1SdIm1s2LkjLOru11jbZTK3zSn2Kz9/1xMqlK354RM=; b=iJv6jhtoI5mOfkOU
	u4q6vYxrLBXia8rQ7XbDMYn3XhZJl7GRlI+0omWv5D0MoZZtZrf1SmDPJryAe62z
	+CR2xV+KSIW948M/Zlu1+TEC/IyqW4ghebcudvSU4aSbFEEL3YGyh6wh2cXsVbg/
	fg+9ldp+njCRgpZ8da0inTwcl5MZqXBzUbfIOWjWXNCchjxJT0zXNPDyYSv0xfet
	tifaUiafiW3YdvFJOGCVYsKhM3KG6tuKnI3x9FtCyCwPa7XQZIRXoTGq1MeUUR73
	NvBeWgNjizATycKZu42feXpVpF+U3v4mu8zK8OHP6G79KLnts/Tbi5CU06EnYpYc
	tZd/qQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjghf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:11:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff133dba56so772672137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772460667; x=1773065467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1SdIm1s2LkjLOru11jbZTK3zSn2Kz9/1xMqlK354RM=;
        b=FaGXiNXIG3WtA6NhUlnF0LIQaLWq7nbUwbFAvcUPHNSkfCeguyaOr/62oW9JiqZE3H
         dkaJkpOploS02ShPhqlxhq4GgSF+GBWHqs9AjnsLXLJYoELPdA5rQg/pcwpcWnPnpYrt
         Ow7VkdS4qsFbpirm+o1w4KBBCU2a7KZrjDxFo8TzB/7hK6BqW2QrjLqpXx5nPc1QCoDd
         5EEfU3rnjkLmPUde4ZyyBtk8nVpaxnk6hYga2XEPjTiIEOoB7dx9/y94oFkSpvg8sOFC
         X6oxgjZt2ofOL7SkZykHwDvePK/SgwmGEIC0rkVYYlxeMa77P81pZllbkOkpdSm9xlYG
         eFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772460667; x=1773065467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1SdIm1s2LkjLOru11jbZTK3zSn2Kz9/1xMqlK354RM=;
        b=j1Eo60x7pf1vuFK0kzPKMUM9nF5JZ15yBJzgslGsAkgMEie7qcYo0jvrnW/pGq7Qg3
         cRS3KoWBqKUNNrloOvEgU+128Bjv7iorvh3QS5SLSWmHHotBJdEuLy9FPebMR9RWAPzE
         J1Kc4xk2sha9HS37S1ncOdfQSsudLpf+qaf0Z2Z7ot5iAkf3X/npka/fLdoDnN7F6HKw
         FRu2Zyq+GCbI1HDYIXjhTUO/L823s7eJOhM5cw+sIB+HL6WmdHX20jSBvqMkM2evZBaw
         Oojty+/Qm2b19EckuSBdxmH4OwSJu1QWcaBeX2vn3HebBtI3fVD1GlLSBobD/DJC+l8C
         zFyw==
X-Forwarded-Encrypted: i=1; AJvYcCUzHh5kgeWLJn6JCVOZ2nUcZVyPaEA3Xh+emdhSQwe3zjgiQZ5FmsXeegwRXRBalZHxhFDVEMKheTJRs9xZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzoW+4cAEP0q8SGZFzbehqw5IUar5cGJyAzDfPCZsYoK99qzfaX
	a+AYkqoIZQlAt5IOrvfJfNsKP+fN2EnkvHmApRUrR5boNJBKKP8p44lkiqVf8eTAQdMoostbo1F
	IHj/VLsGZVivVX5z2BNbsv0tuHm3lum5CjR6eGjMwd0mpBQSOJxmbUFl1gKsdnlb/qdZZ
X-Gm-Gg: ATEYQzxPA6KbNxuT3jWgYMnvvhro4wuYcrImW43byqM6jDTu0HGAbhZEDrVQz+2q9v1
	YO9zf7+Un9aZwHTn67e7I+5ICalYque+Tnu2nNTiNto+uJlh100f8sNYoCIVeC9XbgEs+wgg9aL
	YEqNOL28Rzq9oTGP4UlJo/Gi8wzMyYb1jPAVPDpobVoEuYzwQP0+lRXAAnHp3rhby+w0Novq15S
	g8vRr4gpchQC8vmuJiymcjMAJz0vTzX1cuGZr97ubK1V9oUTRHNefPmFKpkzo+woZqq5HYx8qYo
	K6wuyU0B0PDL7KgauzQCvErNmIzIMro/5rQ3Iy5GFhwv4mBsglj8EXduJ2Ql0dxqw/RWytSlXNu
	hAJH5UPTWaWQ8Vfa+ZuB/FDS+HWZ4n+3aVKLwCtL415I82LCUmNjqfRPTEyCAvF0tT6ORSXnJIU
	Rzq0U=
X-Received: by 2002:a05:6102:d86:b0:5f5:3a57:1e88 with SMTP id ada2fe7eead31-5ff32536282mr2476557137.6.1772460665235;
        Mon, 02 Mar 2026 06:11:05 -0800 (PST)
X-Received: by 2002:a05:6102:d86:b0:5f5:3a57:1e88 with SMTP id ada2fe7eead31-5ff32536282mr2476544137.6.1772460664727;
        Mon, 02 Mar 2026 06:11:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b48bsm26771231fa.9.2026.03.02.06.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:11:03 -0800 (PST)
Message-ID: <d3de0b25-861a-4261-8d9b-a3785187bfdb@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:10:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: sram: Describe the IMEM present in
 Qualcomm IPQ SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
 <20260228-imem-v3-1-20fbcc1a9404@oss.qualcomm.com>
 <20260301-secret-exotic-nightingale-80f55c@quoll>
 <4cf9c98e-767c-44d3-9e71-bcc790e83997@oss.qualcomm.com>
 <edffecfc-ea3a-4c1e-9e72-58c7c134248e@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <edffecfc-ea3a-4c1e-9e72-58c7c134248e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a59a7b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=AMyczQPEon3cgf3ZdCQA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: xaBvFCdLhxegwpT7eX4bJweexVefEvJh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExOSBTYWx0ZWRfX4wXWMs0TiaX6
 RAUJb8sPqFgPklwYwgvhYq9+f10CIoeBphLQxKF2ZrM/kTQ5DHBNydLNkuTKto0SknyQaVfUw3V
 fqzx0Pi0EterTPU95vA6poCkOETOCJ/K0IP8QfRRdq4BAq7i01RTSRlXxER09snpbmvkUiFJJcG
 Xlsx+4O22g4/YR7bA0iXgrZucmTjtS5HboIbHmExqPABtyYNH3IwV82EA5X2ovpTgh3lWoswbPP
 v+biRR+QA887q3h7SKMHvfSRC8PVONSzAD+CwZvE8BMfItlkTnBbkjHBz18dknEoo+EcEDqKGfs
 x8K/IrieRNbbK/Pfyg2qF10Oal6YvQiy6N0I31YswHyGdbCixd9KtHwKTD50W0uo+1fRoCuv8cZ
 vzFD5TnqxkiW5SG31BEkYjcQnLr/H3CZldjY6saviKxzZvzHSpIS6TzRb7T/+NUQKkv14LCDfPX
 a8uyFyP45U9Zj9kY+oQ==
X-Proofpoint-GUID: xaBvFCdLhxegwpT7eX4bJweexVefEvJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94955-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CE6A1DA874
X-Rspamd-Action: no action

On 3/2/26 2:56 PM, Krzysztof Kozlowski wrote:
> On 02/03/2026 14:52, Konrad Dybcio wrote:
>> On 3/1/26 12:27 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Feb 28, 2026 at 06:38:00PM +0530, Kathiravan Thirumoorthy wrote:
>>>> Qualcomm IPQ SoCs also have the IMEM(On-chip SRAM) region and used for
>>>> the various debugging purposes like storing system restart reason and
>>>
>>> This binding does not allow restart reason. pil-reloc-info was kind of
>>> allowed, but now I think this might have been a mistake because that
>>> bindings were posted incomplete.
>>
>> The sram.yaml binding allows any arbitrrary subnode (sort of like nvmem),
> 
> Not, true, look at the compatible. It requires a specific type of nodes.

Right, I didn't scroll far enough!

>> so long as the name includes 'smem'
> 
> Also not accurate - "sram" is not the reboot reason, which has node name
> called "reboot-mode".

What I was referring to is:

patternProperties:
  "^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$":

where the 'sram' (not 'smem' as I typo'd above) is obligatory

Konrad

