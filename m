Return-Path: <linux-arm-msm+bounces-102931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GItIMmXF3GmcWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:28:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 447723EAA4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 255193016817
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49263B52EF;
	Mon, 13 Apr 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPTLfc6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWDOJVv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739473750A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076100; cv=none; b=GYGLEnMe7VR7iW2AgO7QKMuQFzXyDlNJjGEHtvnYEdf1zkVHWerbM7vo7u/kgfT85l7JYDT7Jqzli38Y0vVaTgEaKPdcLC+D40oAo4ZbfgtfuR24tgy8bIHvYZjstSYSK0xbyjDlPJLuI5zXvw8aMwwg2uYR7b4jgqf/5XpWUAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076100; c=relaxed/simple;
	bh=520HCNzNl1sWOG6nBPlnTcUG1Z5hSl2ONS7atA+WwXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awH51oAVmsgegdmVzYS0rKAh7d2F89Th/cdUJ0gjXLXvfaeJGopitdFbFv9cHNhI4s0g5T/8hLutMyjiN+4NIZPvLQPQ6aL3YFZFp+z3I816dzbRLe4CSk6z61mp5MnqVHkqDSeggiTPuIPO4LX35UgHLJSkcLd8oNsp5eHUlus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPTLfc6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWDOJVv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D65Axp3315159
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 10:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POTznDhCFEZb5zSxtLI3VxuWht6Xmf6BEG55kx/hiMo=; b=JPTLfc6ihCvUXklV
	zPsQByhevPPGW8pbJThF21oDNzBTXVf0tTaUAmT5EDIr3ax/BKyTKOVOMk2HP/pe
	Awi3MU84hjIPqg1ioEkOIFOzMUnt8PhK00wDXQjqjiSXDResir15DCzbUteae/l4
	/VCbMjoJr8B55X3NL21uZNXIqE00vBGThzuXvh95g/OQuqynQWENXV60EZ0zrMqJ
	nEEtBx8uJ8exF3zW9wsq/uoat1CyvptM9FWj5vY3hcSkGHgNUEb/TrGu9qoFcKgt
	wzgUKbd9jcgKqnHfnlPcSLBKLsnki7VxM0OFQprO6jGG1wdQQLU+Jprn23GFvfG6
	F6ilXg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkvxkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 10:28:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d7128e038so10373681cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 03:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776076098; x=1776680898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POTznDhCFEZb5zSxtLI3VxuWht6Xmf6BEG55kx/hiMo=;
        b=WWDOJVv4CgWY3L4toCFM3LKlaZQ5V0+pJpClckX/6Qu/Oex/O0eLYqD3BPqRXX4r31
         +8w5wzfaTfHseZWwdzrbMAZwYkaVGe3lKv2t1KavQfJvkjVccPXINUvt8QDFEdV+F4+m
         EvimDLj+gcflKj7orZywrdgsG5zMGACW6O3W/2QVdGbcQrk11ODA4EWzITu37UVCfw8G
         pW16IerHdj6ZatNCwj6naP7aa3Z1jhpEqBdXEkaP5eYBHYdFSF+cqw/PGIvUqE/HCk8F
         RIxbBcqmXwRnzrFFkEbNoFEc/fN8mBAqymQS8HbJ0rCH1DPoAdhMiUETX0YM6s5+G8R9
         6rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776076098; x=1776680898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POTznDhCFEZb5zSxtLI3VxuWht6Xmf6BEG55kx/hiMo=;
        b=YGZYyCTV8u1UPAkoDDt0R7yN7mWcN/jSGrcphi27Lv1gwGKEtWqD4MGLmKzaUUzNhb
         MJOQxhi/HeDX3ucHEHj1J7nlYdh31ix4+D4G4uX+N3Wrl/J20MFna/JaYcMNhCR4QLyF
         WEuGPl+Zpfc0v8V+N4NONYc3ahJTFPAi8SzhhvzTXT/gGvwcOo9IF7DaJY4Q6g3jWXUB
         PbiGtk50BsxyvRK9xagbPrKzNbyjPRiVjNtR3CU9pp8mujolyL0hfMrnBQD1MC2LItLT
         zYs3w5RXqLSyKpmn+LcEzUVlKmsWARfe6jbmwEk0dGL+w1zuYWJfYMvBwEkoV7gnscEC
         48ng==
X-Gm-Message-State: AOJu0Ywy53Ta99It/2CLygG/h00O5kDVmQkvano1iBBaD8bWr2E5Ab8z
	PzgmmrsQ3sroWzvqoHY9KHsa4ELjFJcJ8EjhtdlsWtgVkD8OBYcrRYTuhe/PGUi9PurRGeE/tj7
	wVb3+8zguqjmSRevbaAwkGYFffvA9IL+W0/eNfrtp5BxoON0OzP4cy6HxiPT1gCVsBurf
X-Gm-Gg: AeBDievBazzeGPlG3I30htDScesHEPHHMmpEZuLxnMY7bl/lv8XXOPc2tod921+jWO/
	MdhTaWZ0hkVFbX+wu3BcRKhxGYwoByehxIhrq/ClI4HsvqJRVtxKbnOni5CJtWzEuHU/s6lJRee
	jDlmEyAX0hA5yAjYZMEktlGlEwr5z1JJ542oE2VhY7iRFV2HYExywcszIaW/GBc4TDg8kHt2YrR
	8Zi4XZcgn2qtl7su3VGNvCWp7t31tphm0mOFxUXcI3VwwEjVFvmoeHi+oJjiayspQlz7sYdDTyP
	zy0gMYF9g8Y8TyK3NqYP8DdhEe92OcZvc4qUv+WwzRntcvykDQJcFLss/JLUS7Q97hl0ePSS8Oc
	3MkMtROa5uYu+hv5vydLriLHLWly482ieAerYxuygWCvg0MyGgEP38XHQ+471pX4EUKVY6zkP6T
	T3/W0=
X-Received: by 2002:a05:622a:13c9:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50dd5c80b59mr136426431cf.7.1776076097869;
        Mon, 13 Apr 2026 03:28:17 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50dd5c80b59mr136426291cf.7.1776076097418;
        Mon, 13 Apr 2026 03:28:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1765sm288699266b.56.2026.04.13.03.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 03:28:16 -0700 (PDT)
Message-ID: <17466128-d838-4621-ad23-21b0975d85c1@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 12:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 USB 3.0 and HDMI ports
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-3-14aca49dde3d@radxa.com>
 <eb745e3f-4bc6-4713-97aa-1a1a584c9a9d@oss.qualcomm.com>
 <63630053AE2A689C+fc86c1c4-8daa-4af8-bf64-b432fc8dc1c0@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <63630053AE2A689C+fc86c1c4-8daa-4af8-bf64-b432fc8dc1c0@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dcc542 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Asw1XGY1sTAMn24vslgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEwMyBTYWx0ZWRfX5y6+JJFcQTfS
 u5Gzxhx4x4ICyHITerNr4j4XBnwN6MTUCC96g1Domo5Wrhy9XYpTnKGHlni8fa5pymc1Lt/3o2p
 lY57aPsGSTu7jlUSZXUM03JW1SzIKl+S0HTtqEiG9dCigJKv/gFaB0qUPgWfEaOyE/9d0HrYEeG
 7TW1vRw+PpewvjtCVbhd8QcZPeCKJ2l7IuGA5rPNEmWDYLO8mFsDgRXOQXQ+Hqh+cWVtGtVixQz
 ltasmTLWw8A4W6u3B0X1/At4bdhrpS61HpjHdR1tDrMsikQ5r6+tu46gojJ+UrNIgj4LnP99NDu
 MKvKnt7SWzHpKIZzbPDA8KrI0dEG2t5zVAap9k16wbInwKwuNvgAp5Lbc4oGgfu21HLyMjW6I0L
 CW9u7XWE9gSWKTnvjws9WiYTPiAdCRe3envmkyyWL0L0+DqvpyMORa4xCOXveUtRRLvm07+T+LU
 HC97E63lqr5PLP05eRg==
X-Proofpoint-ORIG-GUID: RC2NQVvHI8bpOGsLE7Rs7VdAAC8oQMO0
X-Proofpoint-GUID: RC2NQVvHI8bpOGsLE7Rs7VdAAC8oQMO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102931-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 447723EAA4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/12/26 5:14 AM, Xilin Wu wrote:
> On 4/8/2026 5:03 PM, Konrad Dybcio wrote:
>> On 4/7/26 5:19 PM, Xilin Wu wrote:
>>> This board doesn't feature a regular Type-C port. The usb_1_qmpphy's
>>
>> I guess the receptacle on board is power-only?
> 
> Yes. The Type-C port is power only.

[...]

>>> +&mdss_dp {
>>> +    sound-name-prefix = "Display Port0";
>>
>> Hmmmmm.. other platforms call it "DisplayPort0" (without a space)..
>> But I suppose this name needs to match UCM..
>>
>> We'd also normally push this property to the SoC DTSI
> 
> Actually I don't think the name is used in UCM. I can rename it and push the property to SoC DTSI if necessary.

Let's do that

Konrad

