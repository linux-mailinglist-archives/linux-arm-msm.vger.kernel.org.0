Return-Path: <linux-arm-msm+bounces-117883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xu/vJNVQT2ogeQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:42:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2341972DDE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:42:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZB+EWCLb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ew3c2/u5";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117883-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117883-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92F0B3000880
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BEB3CCFD4;
	Thu,  9 Jul 2026 07:42:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285DF3C1F5B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:42:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582931; cv=none; b=f1XS+sXNeq9lL+rU9xMKYuzzI1FQ5sqZnbQscfY0sCWQYE+v0oDbKWnXSoBs1yFPr0LJdghDOphcH5nVi5eN1JTOrCemXScVngPZZm1KQjNBt11l8WJCEl/7h929c8Eh/zMbf4mZjIux1fG/1iRi1iNFCJfb4XETKmJa/LFcWJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582931; c=relaxed/simple;
	bh=bPecE3m2OmnvvsAJ5paIV4IX5QUb0uPCLNDhDlmDFJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKiKO3EqDhTQPncOVtJ7EY/ODzAxgllUdn5E8rRrYDx+Pfp5mh0p1u8qAdoCeUCCEVIS3lmxJzudCb61pT3GcCk+QlENl7Vu1zBugLVrhI7sr+KHCXXFy3NtCuKq74xUUN7JIw63ZZ2ZJQ1lK5dY1O9jDHlkwngb29VmfV31Ql0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB+EWCLb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ew3c2/u5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960G8f749745
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddJ7mGajey7LP3OK141F/vuXmTY3mQQg+XD/eLWAZHQ=; b=ZB+EWCLbVRB6LAVY
	FlMili/eUg16k7aTqUKZRX+ZMpA2U7vuegYR5qNnZW1RwHoEcP0+uKC0mP9Ub0Z4
	JjIJiYLu/dLPBSdlAabzq/UUwSZ7Ti+dguYtNhoyBOVIRnjrY8liV/5w9smn96/X
	nwMvx6RrDF2KbPojgd7h+GLG3TP8G6P6nUrn0wC3PxRH6PgsOEfksA7tJ0G3qppN
	3cUawxbH8Be088noUzN8PduC6dAhZN9szo18STmSgbqrMI6AkpIXCYYDjQT1C21K
	zONAgxjidpJ0xHDxaoOOcroG72xYNNi8Oz7ilJM3/jWVq0T/gxLSneiwT1RGZU5g
	hIkDSQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfsxkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:42:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso11559141cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582928; x=1784187728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddJ7mGajey7LP3OK141F/vuXmTY3mQQg+XD/eLWAZHQ=;
        b=Ew3c2/u5/rIcCDlu2Ao+lMelsIJBb/bph9WEBSD0JbULnfTJx3IVT+CnClr5MLxNbL
         x23jP+ilN8NTw8t2NeDbzbcn+V01iyGXlVMdSoJ5wfgw9a20RXrR6SdpT17ASntEzo9w
         pt1Y9sKBthnHWAQLbAma9kIGU8FZcseb0Duz9zKcZWaJpB894PxwT3TSLBqeUR9ptRFd
         gSDYoy/rLZAVJLe5SA4vbfQhj4vShT4jCxTPdEmk+3JPP0on9SRsuqEXebIquaZxSyBv
         1HaExdiJomY+SvdQQqGIS4kNAxs5LoFKvxWD+cH56DlILyEzE0dJyufvZAHk3GgWm2K8
         DsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582928; x=1784187728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddJ7mGajey7LP3OK141F/vuXmTY3mQQg+XD/eLWAZHQ=;
        b=gMI27DUmQ1YhUnxHN9fcLS3CFy2LsUm/aZ46kG9BuBWX0VC9y1IidyA3RuBQGlgago
         baaVB7fLL/Vs63CCkEo7Pxk1qmFKFvINyWu9RRxiJ8JPchnRxySM2LwwZq/Xt12cyyek
         8CBBdbuVH74rM28FeZeu8Bbsgj6jRdbRQgVGn6i/fXCDCYubeXA8KUIUSBH9T7Uo5oE5
         WgLYYZhjwd9lDf0M48ZsA5OX6ci/p8pQVzGiJWbuWkS5vf/BQfeMzKh8d4VqpI2d/h1e
         d/JmAvTjE2mpXD8ItqD7Z8Vjkd8ug1v4UsEH17RtkIbtjI9tY8PNC9YXHEcIuBweiCQN
         +3WA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1gQy4u8vC5fTAd0Uunw/XmxjV1IuSfjcL0HQ+Ab8WToP+NZvaWj27gDJ6ygQomfvafMDqZPEl0t534anX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzew9DmuoO8+PAer6kq9MOobMg9b1lvHA9u6UM50Y4m1xOQCd0O
	ws+jgEXUWVIrDjlMjp91pgTCXTMSr8IYMlic0gy7tMreYVnA0HNilO7feoxEKzSwcZdlCZDbZoX
	J1+Wu7XSKFdGn5fehhZTZlxf0cSY7hRP9k/ZJ+i5p04WiTb/IYqjQXuVURQqxcMqIpIaY
X-Gm-Gg: AfdE7cn2T441D6OJ4Rr6MrTKHHgDRZDYXxZppWgbFhrIyPLF/GgpWF9J1+zbVKAqdrq
	Oeq+UpmF44PJ8aTIjJZsPJPkxrcsAnP9doclGe/LwqeygaT6LUhsEDGidrHw04LoBZsMsaHVr2Y
	Zn2YeHmhcElr6bZzsFoeqUuD27lVZXCX2jL+pq4+aqiZwVnuHwz9bpvXjlKE49BQu4TLrJoBA3n
	c4mvt4blqmJCqatKr27VX2VMahfO/F0KIxuQyMWbBHIY7r2lgQyrnJLpkwwHR2+OOZHQrh30wtb
	PLQFUYKK9OcthM1/KnEC5NBUnDaGzoalVa8i6SbZ6H6QZZXNjN/LFxIm2zLy2kejHAgZSHdkEbY
	WAJ1PVcDTFDWdPCpNYaDg74SlvyEtXDy7Ue51SqmklU2y
X-Received: by 2002:ac8:5d02:0:b0:51b:f8b3:3d4a with SMTP id d75a77b69052e-51c8b54a8f8mr64315061cf.50.1783582928488;
        Thu, 09 Jul 2026 00:42:08 -0700 (PDT)
X-Received: by 2002:ac8:5d02:0:b0:51b:f8b3:3d4a with SMTP id d75a77b69052e-51c8b54a8f8mr64314671cf.50.1783582927994;
        Thu, 09 Jul 2026 00:42:07 -0700 (PDT)
Received: from [10.111.138.111] ([212.136.9.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d799dfsm10078060a12.17.2026.07.09.00.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 00:42:06 -0700 (PDT)
Message-ID: <54250163-678f-41e7-97d0-6596123367f1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 09:42:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
 <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
 <2tu35aavp7sc2npni33ky5bve57idzy3bzp2pk7eh5lryq3r4v@gmm3dhayu4cf>
 <6f179f96-fdd1-4fa9-b26c-df7372eb6d20@oss.qualcomm.com>
 <tq3g6lpb2go4nen3ferx7kzs5g6sshc45ayfyvhjmc3rv3jv7p@fhixqlwbtooa>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <tq3g6lpb2go4nen3ferx7kzs5g6sshc45ayfyvhjmc3rv3jv7p@fhixqlwbtooa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MSBTYWx0ZWRfXw1Axk4oM3Pz+
 c1qEwiLmPLA8mRKOVMUJr+8FVSzOwtv94o87vfcewAd5BWcIMyW0thXu4JZQZUJfqyoH9FLoqka
 81BNPM2at64ZAXpbg5dR+0i7vVFIaSfT+Ne9+J13qX2w42lKDxx+Zdzn1npJ1sW1VXJQk1/16ML
 +E2JyzC1xaYU2uVDYeJrhi8nQiyfdOqBPGXkKp0o+JivlQf4GFdoWIR/Fv8n0EQxkxP3qeT7TdM
 yMRhonEfT2ZoMtlBT6t2vcaY0jgsoHJFDIaoWVpwt8mug5FHATrT95K76OQQNW/iUMR+dHSF11O
 HLvLtpvR/KEt2LMcENYvh/thNyVv1/BwIPKThWjOEju1e7ubBFWnaFEHOsSsh5eB0Tz08x/Xuhv
 3p3TzBjA0ahoGIH0DFNANNQkl6Yc6MGhG4YNzz9oOZ29ld+WQja+tHH777O4C7pMkZYwVpNEBOv
 sBuK3bOkieupRNfiLvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MSBTYWx0ZWRfX9vX79862zIYR
 CgvZFU+hW9wALYNoVdQRVqQilQ71eGHYBcx+OkmcuNlr1iwsxJK8WYNJhhfINM92rrVBoBf/va2
 K6ooJ+ppoG1OdcF1gr4cIs+KGWHwDbo=
X-Proofpoint-ORIG-GUID: eL-3NdTuFjOm3iYljI7bSECorCO8xn9h
X-Proofpoint-GUID: eL-3NdTuFjOm3iYljI7bSECorCO8xn9h
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f50d1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=fjlDWTYzx9GH-NWLRPsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117883-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2341972DDE1



Le 09/07/2026 à 09:37, Dmitry Baryshkov a écrit :
> On Thu, Jul 09, 2026 at 10:54:26AM +0530, Gaurav Kohli wrote:
>>
>>
>> On 7/8/2026 7:55 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 07, 2026 at 03:55:13PM +0530, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
>>>>>> On 7/6/26 19:47, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
>>>>>>>> On 7/3/26 17:42, Dmitry Baryshkov wrote:
>>>>>>>>> On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
>>>>>>>>>>> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>>>>>>>>>>>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>>>>>>>>>>>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>>>>>>>>>>>
>>>>>>>>>>>> Qualcomm remote processors expose thermal mitigation endpoints
>>>>>>>>>>>> through QMI. These endpoints can be registered with the thermal
>>>>>>>>>>>> framework via the `#cooling-cells` property on the remoteproc node.
>>>>>>>>>>>>
>>>>>>>>>>>> The QMI TMD protocol identifies devices using string names (for example,
>>>>>>>>>>>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>>>>>>>>>>>> `#cooling-cells = <3>` requires numeric device id in the form:
>>>>>>>>>>>>
>>>>>>>>>>>>         <&phandle device_id min_state max_state>
>>>>>>>>>>>>
>>>>>>>>>>>> Define common TMD device index constants shared across currently
>>>>>>>>>>>> supported platforms. If a future target requires a different mapping,
>>>>>>>>>>>> additional target-specific constants can be introduced while preserving
>>>>>>>>>>>> existing DT ABI.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>>>>
>>>>>> [ ... ]
>>>>>>
>>>>>>>>> Why are you using only those TMD devices?
>>>>>>>>>
>>>>>>>>>> More constants can be added as needed.
>>>>>>>>>
>>>>>>>>> Kodiak is one of the supported platforms.
>>>>>>>>
>>>>>>>> What would be the benefit of having more than thirteen cooling devices
>>>>>>>> declared in the thermal framework and having only a couple of them mapped in
>>>>>>>> a thermal zone ?
>>>>>>>>
>>>>>>>> I agree there are more TMDs but if they are unused for the moment, why do we
>>>>>>>> need to add them ? Can we do that incrementally ?
>>>>>>>
>>>>>>> That's what I am trying to understand: why the implementation uses only
>>>>>>> the selected two devices, if the modem on Kodiak supports others. How
>>>>>>> can we find out, which TMDs to use on other devices.
>>>>>>
>>>>>> My understanding is that is an initial thermal setup. Gaurav will add them
>>>>>> step by step while setting up all the thermal zones instead of sending a big
>>>>>> patchset. And TBH, that will be much easier to review.
>>>>>
>>>>> In such a case it should be noted in the commit message and/or cover
>>>>> letter.
>>>>
>>>> Thanks for the review/guidance. Not all TMD endpoints are relevant for
>>>> kernel thermal zone binding — some like BCL and cold temperature are handled
>>>> from userspace when needed. The constants here cover only
>>>
>>> What if there is no userspace? Or the userspace is different from what
>>> you expect? I doubt we have TMD-speaking userspace yet.
>>
>> Thanks for mail, The TMD userspace implementation is available upstream at
>> https://github.com/qualcomm/qmi-framework.
> 
> Is it?
> 
> lumag@rohan:/tmp/qmi-framework$ git grep -i tmd
> lumag@rohan:/tmp/qmi-framework$
> 
> I found no traces of TMD there. Moreover, I don't see why QMI framework
> implementation would react to thermal events.
> 
>>>> what is needed for modem and CDSP thermal zones on the currently posted
>>>> targets.
>>>
>>> Again, SLPI, ADSP?
>>
>> Sorry, I should have said "generic subsystems" rather than listing specific
>> ones. SLPI and ADSP do not require active thermal mitigation on these
>> platforms.
> 
> Could you please provide details, then. What is cpuv_restriction_cold
> TMD?

It warms up the zone when the temperature is too cold


