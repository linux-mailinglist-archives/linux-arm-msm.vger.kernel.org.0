Return-Path: <linux-arm-msm+bounces-100230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKDiFrVLxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:19:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E463419CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 742213012806
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEC43DB622;
	Fri, 27 Mar 2026 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6HT+idO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kP844j74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFB93DB644
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603154; cv=none; b=Qg1/iaeciQpikVh2kj/6cDIcXmxC4U4dnwSdF/tk+5EQhq60e85fB4Ab4Fr+InDYcV2muqSPQsS+AlDiUwuKD0RIDf7NA/QgyEWW4/J9X4DZDfUQVHIj5AAvvhLkO42fdd0VtzZ8BDhF/R5pmaxo02WGgGgVlR2D+kaFaUKgWEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603154; c=relaxed/simple;
	bh=xXX6viTTK4rT+ZYOh0YjJH5pssE8usT9kMlI3qREXKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTpEtndql2oH8ONyQZdPDGryIKC0KVqZlA2Zcfb3yPSZjFua/GmCZ65+2lgt3M6dYKFEbn91HY0ZHKODxB28FpZLdGvL+NC4RPbF++12KzGsDgj81YMOQGhgi/hjGmw3uHOQaVH+wLKZ9obPOnlDOsj0qHyoRaixnpetJG8eviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6HT+idO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kP844j74; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vsfO1226369
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=; b=M6HT+idORQ04IMt3
	269W5hBiYbrTuYY6bJkV7cXYBNGp4ZiLvnf1zPQ6vxmqz5MLoN2HWEw5EsbnbxqT
	oNYMPjD7dDx6+dPX0nivQixL9AMn73OvvfqE5+KvnrP1FgxRqh6LHTSGNNo5afAk
	Qth5n6YDaHTS4rwZCd+ulTL9624A45lClb0fNtSrBvLEEVgA99g4JMx/hVbBGZyR
	uof+ENbHxetLIBn/vYpI6Kdr+U/W3tnqQK1YPZg/I2Y7NzW7iHwTRXpi/PaoRZBx
	n+TqFiszV/+4BW/cJtwGZ7DTf36bG0vQoiQn4LznKcJi0/w5hH+YN5+HWHEEPcoG
	t+Ai4g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1aw01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:19:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-895375da74bso6176926d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774603147; x=1775207947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=;
        b=kP844j74KQst6iVXFiTsD06A4p4+C597LHqHrHGajNC1bEJkPXBenypqsG65+Zx5KS
         p4bXxfR0S/iBC27N+IoC7E2Gfv+0pvZciatRGZSEbmz53uyOBiAaw7ba/4s7v61KnO7x
         ABkD884ZVPKE+zLV9TC6ikM/RO0+qHbvu+xTRMq6XT9tTJYKzFVZd2d4FyVNx/iW1JFN
         6HvHs2jmLalv5brt1C7LiKaI2vcKoUPrc9hvz0pRYH4PtQXpAdU6Ibf6WTT45mxLxCfO
         S1QMtxoaMBmfC4mXcCJEt5QK61McpjU7lwBATgyWkW6BkyRgkP23jN8rVViAgV2NfyGP
         w+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603147; x=1775207947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=;
        b=eq+ZWDSSL1Yc4UZr+xB1S5FjKLA7ZeMK9D7wFCVNvF0k8BNajh7W9QvUQI+BAi8X2o
         7kS6iE/gbchHZIIM/zFQaeFRtbfMlteF05KJ+Tk57qPl4pbgMKZFWc6f52GkOFfTyRue
         f+J/upgBYz8+AhbsrhiRp8t5gZTplyl5THqQWB+O7+rJaDBc1pcZWGCkMIL7QAzp4cMG
         FIdHNo3hq9gyDQvWltV7T6hN3RTEV0bHV3TYxlg7+Ni0zEbVuLBUOV+q9udOdcVl7c2/
         qnIPoT4zacnR3B/3hXRueRMMbEKB8qsdS0maIrxYoLkWxhfd3+W1tDEItO3YEsOHJ+qr
         XlMw==
X-Forwarded-Encrypted: i=1; AJvYcCXB4E2vUtitZBW5GkES1uDq9eRJ0ZPqTi0g+GNJu8kWdRMJaPESa53D+2oI/yHfpArTVVIyJTaEcavhbQ6F@vger.kernel.org
X-Gm-Message-State: AOJu0YzE8fvIFI6oOEUCOPyuxLijc2Jvgz8/ydTpRJyyUJ0YfVa0BKtH
	xGXlrcYQI6a821gdoWCe9UpvrvMEarnnX56jgz0dXfK/F81noPnl3LzGCP6mWW8vWKTPea1UOHT
	q384vX3qsnqQZWRw4Msub+10ndmq47dd5e4l7g9hQXR6MiLPwUw0+u+fFF1G4sQo95mF4
X-Gm-Gg: ATEYQzxyxL+oELJ29ZePVgrUsW6iNltaQuADdy/WAui4GA2ZQ9OSGKGDhhgvyzJd2zn
	nnDxFnv15/TbYg4XST4IOJBHohBN6R6EmmITAugjPeEtT3DXLyZ2wfIlmKP/oln+WwuekYw+Lqk
	3e6LVoqsAaVJ8tcjEKc6zM4fkS65VkANjQ2Ia9qfEF90jVOpAi9ZR67TwcMOnMLOB7G3kA6WHNV
	aol3hMKLOClLtugzqDqmlH9vGfBOeaXObjl9Kl5rCRDv7FT0CVNhRQPOrHrpoFMl2wGcy9rv983
	DPERPrV07VJc/bWaYdAeXyMoAhEKxgKUrq5rTYE8/OEe0lTLA+fuXZCqqFyicyRrLhJgPAmqGTG
	N/MxKzXYfL1IV/0Tp9rr5jh2wD+LP3CGQwp7ATgxKojAD5xYa1/nlYOIB659V/nfvdxknNIm78R
	QNn6Q=
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr15161856d6.5.1774603146753;
        Fri, 27 Mar 2026 02:19:06 -0700 (PDT)
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr15161476d6.5.1774603146205;
        Fri, 27 Mar 2026 02:19:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b202663a3sm217738266b.25.2026.03.27.02.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:19:04 -0700 (PDT)
Message-ID: <5f054c57-edec-4847-84d8-f0c769f917cf@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:19:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260326184126.9280-1-nathbappai@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326184126.9280-1-nathbappai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2OCBTYWx0ZWRfX0zkUjpqkXG5e
 B1XMePNUiXze+pwLLmsACOTb/sigtLp5xY5MA3gf9fOeMYowfBqML6L9R7xZFUTqKNrOzpbrOFz
 NURZ/mUfU+h+pJkW8F8K2bUxoJJEDU7U2WCSNIFBiWR3m5NSlyWQeT+Pjkw4gkqmr/NN/5ogyVU
 bUt8wDCLvw38bjqIKDJhSOBMOwCYny4PklC5dVMOOEtwf/xguQSRLeCyYlQXH7uJDykSvFdY9Ir
 TehBD16Ewog1AXheuAFiEXAvzGD5a2qL5rFzZjjHL+RMJjWLExu4Ael+moRf8Xpc0XAhIfdQZ8P
 U2XfRg/dJQqqs24LHUVcG2c4/FxhsMgBQ1/zZsZU8rqm0S+FkYu5FOxlnF1H002+im4lyqnpKpu
 JPcFX66k+3ChPTM0u48fDUqUOt9YqcBkKMAwsHtW5x1MCKKYPO/ugm5KaKb6F6FHuUewVWgqXF7
 f0Ou2C9NnO4nuIq5TQA==
X-Proofpoint-GUID: d8CVTNSDjbdizikAV4QfPYkr-ohW04aI
X-Proofpoint-ORIG-GUID: d8CVTNSDjbdizikAV4QfPYkr-ohW04aI
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c64b8b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PhFLAuRYng8QIqNMAF0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100230-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 61E463419CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 7:41 PM, Biswapriyo Nath wrote:
> On Thu, 26 Mar 2026 10:29:49 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>>> The IR transmitting LED is connected to SPI8 controller.
>>>
>>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&spi8 {
>>> +	status = "okay";
>>> +
>>> +	irled@1 {
>>> +		compatible = "ir-spi-led";
>>> +		reg = <1>;
>>> +
>>> +		duty-cycle = /bits/ 8 <30>;
>>> +		spi-max-frequency = <1000000>;
>>
>> I see the binding allows a power-supply handle - do you need one?
>>
>> Konrad
>>
> 
> I have tested the IR transmitter with my TV and set-top box both.
> power-supply is not required and not mentioned in Android devicetree.

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

