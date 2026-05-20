Return-Path: <linux-arm-msm+bounces-108677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBdjLo+IDWpdygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:10:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F7058B694
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F3F5304D7ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344F33D3CEE;
	Wed, 20 May 2026 10:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5Avz6rq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9s2dgtj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3293D0932
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271572; cv=none; b=pZ8SUgeFWOPr7puf28X+sX8l5zDDp65cJlzuIRmbGYp9bFeuINSM9J6SAqm7UAbhqHEdZraENiUwR9eF5wrqmeIOetBOrIx1eaRHUR/S/6pyMP5j4NMxXSSU5fgBopHIt//jYPZgfroEZjuxaQUArhZ4zyXG4cXQ1efSgiSyhik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271572; c=relaxed/simple;
	bh=xfMKL3ZvNmS2lDaPseQ+L/awE2GSBaHnumoj9DXHwsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxToJnQmAvM3DqPipM5i9jKz1zbWVlVb7B41MSWXJ0XOZYr6P1dsJdh+dVTIJluVOznITrjG6VwGe+a0d5sDr0NXhh3FNC5mI8Xl93M9SRA+v07Rbp5V8xAlfwJGJsJFr/V5YF7eKIWer1Sbhtqmd/PPW8OPYkV1UAgZooLcBkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5Avz6rq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9s2dgtj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8ugih4115217
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xfMKL3ZvNmS2lDaPseQ+L/awE2GSBaHnumoj9DXHwsw=; b=Q5Avz6rqxR5pnRtQ
	9IQVDFhq4gVLETl038+PbBqvocCWMW7w3IQXowNqi6u4BAr/ADYIQXXIM+xqWW3j
	QmVZH2OuRXT1JAIQiAmjtEJSirqEG5dDnOfJTZreXBQ5mbxa8Q1oybNE1cEtFTmB
	9lge/Y6jqcs5Jez2oae3Lbr8zA5dgcpieVs4QeluSkD5ShPhTJq+08Py69M+WGJD
	GnKygHTgMDDua6Zk9PxJ6Qi0Dk6sLXEAdQomsHutua2HVbEsFWwBoEQHcNbXbPmg
	Mek7+ybieyDLaipJm7ksx/DJnsBgW7BoVeU8hjGvUkH2NIqVEs3j9gHR42JIgOjm
	7R8xYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0g95f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:06:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90d102884f5so115029885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271569; x=1779876369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfMKL3ZvNmS2lDaPseQ+L/awE2GSBaHnumoj9DXHwsw=;
        b=N9s2dgtjQK2JKJiEMNVfhLpmHpXmiOOZVuoW3HoSd/FUQNKnaTA1Y+ipwtQ3I17yrS
         57Brj92CIpeLcRlYt0dx7VXfKi6vJeWukqMXtCpZNIYo6aXY4HQiqU5PwaSgy+w5Pqh4
         SzHXgGITds6c7QIbwGxS5KhVkMULfNMTMk4RB8GOGt8ZM7+N6bIbzFOucQgZwlh9USMs
         Jx768eHwE2/ckiscEH4JiqKNs0s3rWXaDNMPPZsrYEPnL/sQ98pSzVTIZUtqNJvJ+wQA
         b/q9S0BL9p88tn28F48O57lkxh3XkyVQiFF+Hys9qap+u+C4YL+2oWQD+4/DxHnIIWTi
         s1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271569; x=1779876369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfMKL3ZvNmS2lDaPseQ+L/awE2GSBaHnumoj9DXHwsw=;
        b=i3AkbxibKQlyhof4tb9XqIhCc5ndJKOAgYE/p4Q5WuWYbT2uyeIIposHK3bojad5/i
         nlTDZbdBR8wCn2bsirup8IC04ub7UZm3cHWx2cFwo0/ruEw+B6hcJLtWtsC7naHrb0e0
         R+Mt7Jg6xkafRrL57qCD2HfujwYlPKvvHgqDZX/VPZwqdAalJcFhwzmg4i9nfhjJv4hz
         Dg70RR4+HccAXVryAAja67lg3oRc/8zblHgQD0C3/NgVRnS/u9bBiobdPz5dMVUv6HCI
         tv4UpJP7gDj4uDt3ufvFoTsdEO4rnz+UP7HpG1iSe6zOxwttNSYQf0f8iO2lOJN7yw11
         8pfw==
X-Gm-Message-State: AOJu0YyLIj5I/n6bl/VkmK+jz7Fs6I8aN9KvF4F3waGk4bgnQBiMszBp
	rDofBQ7/KeZdzg1RdXTGZMshD73P8b0SjkVvaIT+KKoWNJ8EveY/+3OBmCLhqAqoiMpwCnohEPU
	SF6f7StYZYd87q8WCR/U/NTZl6TQ2zFeVcRuOT/qa4y6A9AvsLZdj2bJ9T0Xx5P+qH6Rg
X-Gm-Gg: Acq92OEdkeiy1dko88iIplyv+Prexe2Muac12lGckD6BjI2D5ZBRBZhgHi65Nr3FnIW
	Kg69uUqWaAbSFIedXBd57tgeHkY1ntREqp6GHXf4JLx0dgObW+xLH+dcvq30W3Q1DRGNjmZlrg/
	xZKEVUZWvKmt2wOXOqHVF0cZmv0QOraGpQvMJNYBsRyGktjK5XixQVVzENkDW/39jn6T1zQ1FAG
	SDhdM9E1wu//bpBWrZFbgqtpsSseQQGMYTBpds7hbem3++LL8s3xJjYoDEjjfPtETkxfHQw7clu
	9KfXNzxZi9o8p8sonRuvlusbhTFMQwvYsbsH3MY05m49JK/EYopzvQBwv7BC51xrfY9H8Td+Vau
	u9kgwhkkd94mxNhttjRdp/+4Ei9LeK2s0mTJdxAVPwZFumqF/t80ZoRrkGS3+Tpmomrs+Ns2z7W
	N6S0mXWcYGoLIK7g==
X-Received: by 2002:a05:620a:31a8:b0:912:bd42:b478 with SMTP id af79cd13be357-912bd42b714mr1955368985a.1.1779271569015;
        Wed, 20 May 2026 03:06:09 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:912:bd42:b478 with SMTP id af79cd13be357-912bd42b714mr1955364485a.1.1779271568497;
        Wed, 20 May 2026 03:06:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b50a34sm7741312a12.7.2026.05.20.03.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:06:06 -0700 (PDT)
Message-ID: <f214d60d-a0a5-4f5b-bb65-8ea9d0bc858c@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:06:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Document IPQ9650 Compute DSP
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
 <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hDqF34RI7ORPrA0O3hDwyE7npTDlAgZs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX06tIQDmT0oPH
 ek4ilDeGMiulOGTgveb1MooQjlTcmNSQN4wkGzpDv79OOsfTsZtz97ZNB/46swtsOrmraV36eUF
 shj/lO0gh65QuC9bnlRMNiXAOfTSiAvoWrV9vufQOo4o0RGIuEtzGftucPB2AFJ0TCl81ffgTn1
 755cVe9w+Ae76XM/LMucoF4CitO2iDBQPNVaQQS0Mpq5bKerk2Mzn0PmOOazVmHJ0GNKAvM6VBF
 Q6dNjc6DB5g8M2G+gZe9JXkFPXnfHswLJbW0Wql8tNwml4u/XtdYdpCkzXVvrF36XNPKsO75p/h
 VRhehQXfKI3cxR94l4rPDk65CxNZ9NELLrdTaaCCjoH9uTzk9kfFDINkgUFtN3t5Jmbmeu79eYB
 0C7xf3JsiaemHwYl6LhkIWSHgJ02/TudkPFeI0drKUvGhHzVz7M3tti1AD+UWry+irlphAe7zvo
 541u29fbstGVW2a8JeQ==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0d8791 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Hw3EFhnQ2gplOow3SDcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hDqF34RI7ORPrA0O3hDwyE7npTDlAgZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108677-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 13F7058B694
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 9:26 PM, Vignesh Viswanathan wrote:
> Add device tree binding documentation for the Qualcomm IPQ9650 CDSP
> Peripheral Authentication Service (PAS). Unlike existing PAS
> implementations, the IPQ9650 CDSP does not require power domains or an XO
> clock, requiring a separate binding.

Your other patchset made me believe there should be a pair of required
supplies instead

Konrad

