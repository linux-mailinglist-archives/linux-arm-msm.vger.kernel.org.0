Return-Path: <linux-arm-msm+bounces-109747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFBlKyJTFWqmUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:00:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B635D22C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E01093011F16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4ED3CC30F;
	Tue, 26 May 2026 07:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XY+lPHoI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VW0Jr/Mh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF23B2FC8
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779782245; cv=none; b=oZs601TlzpFtfEk+/XX3cVoRZrsnWaHseZlJtEyYc/6yHtuiYoCBD++mOJZpnF0oa+qenRzvBb9+xw+vqvVM/7PMJU2axEEDoRkFULaz6+ikl3x/iE/Yg5XO4ujsNSgMezsjHd4BvqKpJaJQr1o7CBuEHECAJ8jRzG9kVPMZFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779782245; c=relaxed/simple;
	bh=taI92lZX94r2aiRpHUjaq9t477WefzxpTE2yDGbdTWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgLVtfDPb9BDzWwwnyCq3gzXbrSvi7XYg69r1jo+93KrkmrLRiKZ3Wvna0iWOq763yK5Coj6NFzQYN+vp9aMiKIHyYNw5+XKpg0beptvota2Xwid5qB/49bbEqo4uf2Dx4V7ST57wyi3cK4uPNswNY7BJofir3I0WrzZXoEOQlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XY+lPHoI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VW0Jr/Mh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2omHI2823055
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fq7M7jSV3ibv9kCZCo9XSqfI/a3Xnorju71AEARJQ0g=; b=XY+lPHoIh7v1gE3Y
	ZV+5s0dylNrNLlwoGblYVefuJlqxN5CjvhuVxhJKb23sGgs1IQrER8EWkv/utw+v
	BH548I7+Ht5bYKmAmktQo76REhadu7TS1Tm5s3dwDecwcEqzTJIE51ndjQYcvRfL
	RLxqklTjduTXGxN3+47WAZWetIBtxlXiunEl4lN9iItXF9WhFI1alAmZDazbuGKF
	Adl/XYmqxV/QAT3hwU+p89y1Pjt0hOwYwfFrb9Y/A1Nr2CWktqMJUSHkn+8ssOf9
	uWxvJLs4cKS077f3gaZ6fw2aP1vMYzpIhoMNEKAZhBnTHPLwj7tLxqiq6a9ntRRn
	ewz5Vw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwtpqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:57:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so112219225ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779782242; x=1780387042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fq7M7jSV3ibv9kCZCo9XSqfI/a3Xnorju71AEARJQ0g=;
        b=VW0Jr/MhQcdBhZVVAhfNj3IGGDB08oc3N9Heu6egiHNp+iQ0+Sk+OvBDZYrQ87O9Tp
         qdD0RN7IOxRzyXRMD746J3Fiyj42Is38mdOi1N2fyXSIVOZ3RkBr5fU3tfSsyuDTlIMP
         jKfJV5XH6B/x6Gs12ovXlp1U6GZZ6WJBUaP690Yh2x3IB6jLac65WgHqWyw7SuyPAQFY
         vj4h6Ym8wVB1iNgBLIY3E7iN/Qb9rBp5Fl/p0Y9ddMBgsTq4teH8/kFm6DIOXE9tTGws
         ssM9/x0LShde0jhKIyq7Ai2nyMuzwSsmu6TJ9+yO7hnZDp14u9rMvfxsauGDXH4YV0MM
         gpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779782242; x=1780387042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fq7M7jSV3ibv9kCZCo9XSqfI/a3Xnorju71AEARJQ0g=;
        b=UH7pGm78OrxkjGG+/v2n8rJuzmYUeqgfIDln6Rv939DpbxVpTGhbW+eeaW8+o99Exq
         FSAYUL/ssrX/OWjiCeznxVyYX7Rl8fllS/lYR4zjDiAxBeFhbKjmfPp9+bOicgq7GZa+
         VQFhhTu/EyUFa6VxXBfio9HGlY56o71nmW+KvFkrKvL2S/bpt1/EKCKIWLqMIBWOw+RJ
         d56c2vsI3B6aw1xaCQgUTvPP1qKhShxjMz3VIo/c6cU+4vgegIC1XLWYAs3DfJmrOGa/
         5Z9MHdHCrFvMxD7r1UncSc/TZOVdYRR4yMIslC+y+LQ6QD+rGD842l7UgW0vsxx/lWXP
         ua6w==
X-Forwarded-Encrypted: i=1; AFNElJ/LOPDiV8Fdpt8aL4rP2fn73+KhPTu9qDDdWTt/Uxhs2VMfP2KP326VPQx9oY+IyNmSrWFrlTnPOfQ1UUm8@vger.kernel.org
X-Gm-Message-State: AOJu0YwxjQTAoi8xygnxPWxFwiY0mobX8ggYngUPDxfMyWWC+hUonBNC
	BiW2QBI8umK7BmfQDYKdxhI38kMv7suKR+kefxvZGy1OXMX0icD32agD93zBLo+68WnBFPSmhYT
	mcaQ5RguLHg/E5qdGxmH+7MpSTFLogUUrzFuGicqhSaLyw9/me98uEoltvjN0u1AtzJEw
X-Gm-Gg: Acq92OFEVE88Hat2cLsbxHJrB/aBPMiToD64cz7HnVttS+b+NK/kZ5eMtD1Dsh/8Ev/
	Vv1T2Vned1W8XwSAu+qHEHYo987P+K8YpyhdMQaDBlABI6Y4bNrhDDcz9ef1vBw5GNRraa2e0oH
	Dj+VMaThk4TiiiNiwd8SAAK1D92qWdV8RaJpQZk27y+WNc6+GyzveAvxeuLgBewG3hz1B7PHAY6
	nnvX0oQzeOCyvo0uUAuoexb39MiEd75I19mGeUOWhIUszaqVXYrUzlnd1j0O6ESBlcFGQXGc/87
	99XouVkQzXxi1ix5OWsc25i9tCBTItSYyIvF9eDbRRRe4P1OnJsLEc78wBIUv3tTMzG4Ldw4CTV
	WgB3zgtzKGrmjUJ1PaRm1c/ax5o3PNrk/JqGbssfcm+hlpAqK0tb8ftGsPOM=
X-Received: by 2002:a17:903:2bcc:b0:2b2:5099:2f3e with SMTP id d9443c01a7336-2beb06ea859mr185518405ad.4.1779782242032;
        Tue, 26 May 2026 00:57:22 -0700 (PDT)
X-Received: by 2002:a17:903:2bcc:b0:2b2:5099:2f3e with SMTP id d9443c01a7336-2beb06ea859mr185517995ad.4.1779782241417;
        Tue, 26 May 2026 00:57:21 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c31a3sm117564955ad.55.2026.05.26.00.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:57:20 -0700 (PDT)
Message-ID: <3cbcffee-a2d1-494d-b4d4-378c2ae395e6@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:27:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
 <ag-Tk8xE4OkZpvIZ@baldur>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <ag-Tk8xE4OkZpvIZ@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qPGiJdgME17PQEcdhX75g8Y3SMMOoFnZ
X-Proofpoint-GUID: qPGiJdgME17PQEcdhX75g8Y3SMMOoFnZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2OCBTYWx0ZWRfX2/XIXR9Y5YtQ
 jPz3AsuZy1wK90waqpLVjv399PVJpOfDNeL8cNpDPzXkyXrjNS7Mb7RfrcBUNOELVIndqh5jvgs
 19s6wFFfrcWBakviL0YNGWYSciNBptl6TCGXJHviI2iTXfHgp4iOF4/EHYNSJIbdjSWegQ9e2ZB
 SNF66Ui6F/HxYILe30mSXWsYWuGxnB9SY01LUSnYmBgkxK4xOg+U4AvoP9F0GC7tuQhX7UUsz34
 f1QklUxo+gZun2A2BSuEGW3uHP6xIxuYWVArSVUsOK1ksccOB68a78m6l/cgZMcmeK1vaYAMXVT
 /zXSsixGlt3jztZ6BHQ1qoKlyfq6jT9cgxXfv5vMLNneymIrQ00BCkhuJgTIEgM+5MVbzPukEWH
 Z9/tZdIiD2WT9maywBeITds3Of+DoHJewzoNzZbcaucgPoycKXNObxAMgTax5cQtJpCyv+EiQNV
 HqOIMUJnRrVhEeirR/A==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a155262 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UWntCAtc-LHixlmDmXQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4ae000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109747-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40B635D22C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/2026 4:59 AM, Bjorn Andersson wrote:
> On Wed, May 20, 2026 at 12:35:09AM +0530, Vignesh Viswanathan wrote:
>> Add documentation for the CDSP Power Management driver, which handles
> 
> Your commit message should not describe an action, it should describe
> the problem you're solving.
> 
>> Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
>> Power Mode (LPM) transitions via MPM handshake, and provides virtual
>> regulators for the remoteproc driver to control CDSP power rails.
>>
> 
> You have a node describing the CDSP (remoteproc) already, but it doesn't
> contain all the properties, so you're going to add this sibling node.
> 
> Why don't you describe the remoteproc properly instead?

Sure, will address in next version.

> 
>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> ---
>>  .../bindings/soc/qcom/qcom,cdsp-power.yaml         | 138 +++++++++++++++++++++
>>  1 file changed, 138 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
>> new file mode 100644
>> index 000000000000..f0f89fdeba4e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
>> @@ -0,0 +1,138 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/qcom/qcom,cdsp-power.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm CDSP Power Management
>> +
>> +maintainers:
>> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> +
>> +description:
>> +  The CDSP Power Management driver provides power management services for the
>> +  Qualcomm Compute DSP (CDSP) subsystem. It handles Dynamic Clock and Voltage
>> +  Scaling (DCVS) requests via SMEM, manages Low Power Mode (LPM) transitions
>> +  via MPM handshake, and provides virtual regulators that are consumed by the
>> +  CDSP remoteproc driver.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,cdsp-power
>> +
>> +  reg:
>> +    items:
>> +      - description: MPM (Modem Power Manager) register region
>> +      - description: RSCC (RSC Configuration) register region
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mpm
>> +      - const: rscc
>> +
>> +  interrupts-extended:
>> +    items:
>> +      - description: LPM (Low Power Mode) interrupt from MPM
>> +      - description: DCVS (Dynamic Clock and Voltage Scaling) interrupt from IPCC
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: lpm
>> +      - const: dcvs
>> +
>> +  mboxes:
>> +    maxItems: 1
>> +    description: IPCC mailbox channel for sending DCVS responses to CDSP
>> +
>> +  qcom,smem-item:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      SMEM item ID used for DCVS communication channel between APSS and CDSP.
>> +      This is a platform-specific value that identifies the shared memory region.
>> +
>> +  vdd-cx-supply:
>> +    description:
>> +      Phandle to the CX voltage regulator. This is the actual hardware regulator
>> +      (e.g., from MP8899 PMIC) that supplies power to the CDSP CX rail.
> 
> This isn't the CX supply of the power management block, this is the CX
> supply of the remoteproc - so put it there.

Ack.

> 
>> +
>> +  vdd-mx-supply:
>> +    description:
>> +      Phandle to the MX voltage regulator. This is the actual hardware regulator
>> +      (e.g., from MP8899 PMIC) that supplies power to the CDSP MX rail. Optional
>> +      on boards where MX rail is always-on or not present.
>> +
>> +  regulators:
>> +    type: object
>> +    description:
>> +      Virtual regulators provided by this driver for consumption by the CDSP
>> +      remoteproc driver. These virtual regulators pass through enable/disable
>> +      requests to the actual hardware regulators (vdd-cx-supply, vdd-mx-supply).
> 
> These regulators doesn't exist in reality, they are only here because
> you choose to split the description of your remoteproc implementation in
> two.

Yes, this is because the actual regulator can be controlled by two independent entities,
the standard PAS driver and this CDSP driver when CDSP requests via the SMEM channel.

This entire design is implemented because IPQ9650 does not have AOSS and CDSP cannot control
the regulator supplies, or the MPM power sequences. So CDSP has a channel over SMEM to request
the APSS to control the regulators or the power sequences, and remoteproc driver
also does regulator enable/disable.

As you suggested in the driver's review, will try to squash these into a new remoteproc
driver and post the next version.

> 
>> +
>> +    properties:
>> +      cdsp-vdd-cx:
>> +        type: object
>> +        $ref: /schemas/regulator/regulator.yaml#
>> +        description: Virtual CX regulator for CDSP
>> +        unevaluatedProperties: false
>> +
>> +      cdsp-vdd-mx:
>> +        type: object
>> +        $ref: /schemas/regulator/regulator.yaml#
>> +        description: Virtual MX regulator for CDSP
>> +        unevaluatedProperties: false
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts-extended
>> +  - interrupt-names
>> +  - mboxes
>> +  - qcom,smem-item
>> +  - vdd-cx-supply
>> +  - regulators
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
> 
> It's just an example, when you write bindings drop the 0x0 from base and
> size in your reg and this need goes away.

Ack.

> 
>> +
>> +        cdsp_power: cdsp-power@4ae000 {
>> +            compatible = "qcom,cdsp-power";
>> +            reg = <0x0 0x004ae000 0x0 0x1000>,
> 
> For when you do this properly, please confirm that this is a dedicated
> MPM register region and does not alias with any other nodes.

Yes, this region is dedicated to CDSP MPM.

> 
>> +                  <0x0 0x26018018 0x0 0x4>;
> 
> No, we don't point reg = <> at a single register.

Ack, will address this.
> 
>> +            reg-names = "mpm", "rscc";
>> +
>> +            interrupts-extended = <&intc GIC_SPI 65 IRQ_TYPE_EDGE_RISING 0>,
> 
> 0?

GIC interrupt-controller node has interrupt-cells as 4 in IPQ9650.

> 
>> +                                  <&ipcc IPCC_CLIENT_CDSP
>> +                                         IPCC_MPROC_SIGNAL_PING
>> +                                         IRQ_TYPE_EDGE_RISING>;
>> +            interrupt-names = "lpm", "dcvs";
>> +
>> +            mboxes = <&ipcc IPCC_CLIENT_CDSP IPCC_MPROC_SIGNAL_PING>;
>> +
>> +            qcom,smem-item = <503>;
> 
> Isn't this static for the given remoteproc?

Yes, it is static, will move this within the driver.

Thanks,
Vignesh

> 
> Regards,
> Bjorn
> 
>> +
>> +            vdd-cx-supply = <&ipq9650_s2>;
>> +            vdd-mx-supply = <&ipq9650_s4>;
>> +
>> +            regulators {
>> +                cdsp_vdd_cx: cdsp-vdd-cx {
>> +                    regulator-name = "cdsp-vdd-cx";
>> +                };
>> +
>> +                cdsp_vdd_mx: cdsp-vdd-mx {
>> +                    regulator-name = "cdsp-vdd-mx";
>> +                };
>> +            };
>> +        };
>> +    };
>>
>> -- 
>> 2.43.0
>>


