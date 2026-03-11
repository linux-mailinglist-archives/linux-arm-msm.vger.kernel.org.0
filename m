Return-Path: <linux-arm-msm+bounces-97005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJkgNoxxsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:43:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E989264BFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06D7430649E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D073D329395;
	Wed, 11 Mar 2026 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wa9Sx61B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrRL7osn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AF9324716
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236322; cv=none; b=biWS8TZ/k3QGCCtJ1Dn/xuTk70/hD08JnuutXMNh3KhkSJFCTKOia0QTX/2O89EGIQDXvCyzmfIHdaAbF1SsoJrQJbE4mC9yx2a7N0OAgVadhEJ5f2IJ0nZwXwO9tT0eRouDdP/1U5sfvIMUR6gAX9Qkw/rAIrSZuI3xZflA/bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236322; c=relaxed/simple;
	bh=e+oVFlQidjUShB8VLapFDhc604EtMyJ7pK0KAypuqx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfAEHqvL9zL+m+WJsSQCwRUK/t7QKopTXWsI2302d7QDxmKtg0PD8XumzCrAB9Inckm3Y8AXAqi2n+hYYOQpFlYJKkzu0LdTElJGmSM33o2zrNXqnyUhlxjd5PpRBXoFSQeJyr2gMz81/r0oc9AAQRDtU8QYpu6hxUXTA9AjTM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wa9Sx61B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrRL7osn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBhikQ2677054
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TirY6eh2ZP0RoPYvgHG3610zhEOa/tUuPjax27g6Tzw=; b=Wa9Sx61BbmxXnihE
	FRaNpV4V+FOCzZkHFGespdxrvzEOTg0X7Lgcwg1DVfIUUthvlHe9r3mkBXameS1d
	oSrYWAQ7XgA2aDpb46/lSJSIHaiMJbDor+gz8WvK+wTOpg6k2TFwR0tCiiJiPYNS
	IzTFv1FpOXDRt9FGl00hMJwLK9zhRq7KGhDBhx9v+ReP2Dk8rC0ik/HfqsJi11RR
	o6ULhKHyHWfrJBlslhdCmIDU7Rhhm0o1A7xHMuC0BOaZLaYmP+IiVEe1mOLyu4LE
	Hyosj8V0UVuGccZLTXVlBDviS0LMRmzKbxi+1rr13OpKf7hi/Wcx65eh8cKKog4E
	RJ8X7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd1hmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:38:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8198fe16so275994485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773236320; x=1773841120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TirY6eh2ZP0RoPYvgHG3610zhEOa/tUuPjax27g6Tzw=;
        b=KrRL7osnsFuetk4IlkzGNlu8CVg4YKbubSb9e8piuxAbcTNE+L+jghQFye9jGO+2hy
         CcTdoqgSv1ZgnDywNj2xNnH9L9rgI0QqC3JvldtVJkvjOlVa8YgQod2CSKkPSZrob2l8
         jmPmnbr7bXIbhdTFK1cqOQMUlRO00iDh+WjWhQ3wSsuN4pSMLsbt1WibGCvDMQVNgZNt
         B7+85WIW9DXL4TWeSKqwsnGE7AUVXW/0RIcgMHodJ9UaOfS047ULOum5Jj1WkO/9JTck
         pHxHRlsxypFBRc6aK7kv4Q6W4Kyy3Gf9Z0SXBjCIauVi6mxUWY0pgVynHnce23mYsD4S
         guag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236320; x=1773841120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TirY6eh2ZP0RoPYvgHG3610zhEOa/tUuPjax27g6Tzw=;
        b=Yjd8lTqAsXAg4SM5ACMrnUFHA0/OWaaBXIZXNDjvLnFYVfAz9OdUT78TkAtSK545QB
         Fk1A+Mp7/75Kl9Yqqdwcjda5jnuZkgBKQ6g0le2cvlY/hloYDn5pDCfww5le+zJHeIup
         pWZukp1nlaND/ZaPV5HF+ZzXXR1pkC0ylrP/s47G2zpUxj+3rzfwa6qgL0wI2nBI5NwN
         1/VdB335yRiJ5xmtFe8buebaypfViSZ0JyvGGu0Rt7nD0YVNkY80zpqr3POyqWHkcTe3
         7nLMztE0N2Uc01sNGOzdb+ooVPd35Xfew1JJsiwPg7lnhMdO4FvNKg9TqpmZmhdJvGpB
         32BA==
X-Forwarded-Encrypted: i=1; AJvYcCWmwhT4n2xGIhtydVCHztzalq1pidcwNcvb0Dbhu3Ba7x+4zSOqn0oWNEfYG/X8M9FQDjg1EcUTNJ9vnXQp@vger.kernel.org
X-Gm-Message-State: AOJu0YwHYQaCFDEqBsjzr4DISXVXslCt4k1HG+zSiDrULSAx4EPc1838
	T7m0iXusDWVrCKdc7SgMI6mPrLnetRhmuYsgKNyx4SWZ8GXnXNVYPf6ycP/BrMi60C96BoQ9K7r
	HeBB1vj8q10Ymb4b/X0QQsr+NYn7Ivx4FqGIEroa1ZoZ/8kPhrxwQ62IdD+TLSIGMXhX0
X-Gm-Gg: ATEYQzyAIzRwBYPDEDvFlbSGmMUVi9PqdMQBVz1gGdQU58HSzhIGSigvG4JT6OnFciW
	Ripo3nSV6pFQaexRKOI6GTAzapZUGDjv0vyiYLblP7ouLr6vwunjhh3bg7HFtZTlwM/Mffa5Rq6
	PaB63fvoh6OwfRjOuBJtZS/4sg8gb6rC1YCr5Yx9JhO/42njPJXQFiE3a0Xnhd2ONCskX8Dl+qP
	DS2hDMd8umym7dTWm3SJS6uDcxtgDxBOKkLyLZfrhp3a186gvyzNWlMl3xp+kqa9Hfkdf93Wgfb
	wV/9/tcJsswAnLhCDus1ZyeTSIFABf7/itUsdGzQpyR4GeQeJUGIc6MDBpBrCL+1KJELmabvmWn
	mL8iFd2K8/0oBA8L4u9f4DVDaZr5QmruCYESItN/J0OC1I1ASHonwIbrJNb9fdETrAv/vylpAmH
	VgvkQ=
X-Received: by 2002:a05:620a:28cc:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cda19cc111mr244082285a.3.1773236319874;
        Wed, 11 Mar 2026 06:38:39 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cda19cc111mr244078785a.3.1773236319446;
        Wed, 11 Mar 2026 06:38:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6631503c5b2sm560878a12.16.2026.03.11.06.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:38:38 -0700 (PDT)
Message-ID: <62f0af5c-e647-40a6-a174-3cb5d51e4232@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:38:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
 <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
 <6ddgxby2wzaa7mfbc64a4ld2rdbo6427csw6blzg5alstvkfv3@usfqftgctnzs>
 <c58b9a2a-8de4-4831-be69-33b158052f54@oss.qualcomm.com>
 <cddnaabou6vdcdt5pt642wbf3w6e7vwisrnczc3b5wsqtliwql@sqvdkq47tibj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cddnaabou6vdcdt5pt642wbf3w6e7vwisrnczc3b5wsqtliwql@sqvdkq47tibj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNSBTYWx0ZWRfX27MjuQiyV6yQ
 Kfa9FQ9N4qvne+qIb5+/5aZxWyJe/3BN8AZO6OrXtdRxcRFr3vHoREUPM1Yd/6RRbtWOPrCBH0i
 vssPK3fK/B4I5gBuBZAGgLZAUdJ3fHDoGe8TMsCeID9xgvAcZmSk1RfXu8syQFn9w+iwYpN0jWy
 J/aSr9o35ZQSbMVKKnM5T3zic8vz5fmjZVDcg3yli3QuTwIaocwF2jssjkWQWvYxdKDUNN2M8vX
 dpJDMJESNyf+US/pEbwklEmsSCFgYzIJGiIdg5XqJrkoP/dRr96zHAFHFKpPyTfo6mmnWIqjGCC
 RnPmFUUEwcOfq+gMyyIWUCJh6Kq1A+9huRTNAR9+w1cDMIHi/rMOBYl+juYKUBtT8jxd916ZE6S
 3rByAcdyNQO1ZkzbhG2aqTS/cnCLBSfQGGmIryOv8xR4idpd4cx5OwTnsVJZww5jiWc/j+57pr7
 8aPDA2LcnIRaB8mAumw==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b17060 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=sfOm8-O8AAAA:8 a=tI4-1GpOe9AOYUiOV_AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: PIJBJoU5PSAAPgCbxg6tSHQ-_WmUP-4y
X-Proofpoint-ORIG-GUID: PIJBJoU5PSAAPgCbxg6tSHQ-_WmUP-4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110115
X-Rspamd-Queue-Id: 3E989264BFE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	TAGGED_FROM(0.00)[bounces-97005-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,protonmail.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Action: no action

On 3/11/26 2:16 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 01:47:48PM +0100, Konrad Dybcio wrote:
>> On 3/10/26 11:49 PM, Dmitry Baryshkov wrote:
>>> On Tue, Mar 10, 2026 at 02:08:40PM +0100, Konrad Dybcio wrote:
>>>> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
>>>>> From: Cristian Cozzolino <cristian_ci@protonmail.com>
>>>>>
>>>>> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
>>>>> Add it to the device tree.
>>>>>
>>>>> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
>>>>> ---
>>>>>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
>>>>>  1 file changed, 32 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>>>> index 7b2849405462..709ea6fc9fbb 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>>>> @@ -94,6 +94,31 @@ &hsusb_phy {
>>>>>  	status = "okay";
>>>>>  };
>>>>>  
>>>>> +&i2c_3 {
>>>>> +	status = "okay";
>>>>> +
>>>>> +	touchscreen@5d {
>>>>> +		compatible = "goodix,gt5688";
>>>>> +		reg = <0x5d>;
>>>>> +
>>>>> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
>>>>
>>>> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
>>>> even consume the former. Trying to read through some of that, I think
>>>
>>> I think you need both, take a look, there are enough users of
>>> ts->gpiod_int.
>>
>> I said irq-gpios was necessary, interrupts is not. The only retrieval
>> happens through:
>>
>> if (soc_intel_is_cht() && ts->gpio_count == 2 && ts->gpio_int_idx != -1) {
>> 	irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
>> 	if (irq > 0 && irq != ts->client->irq) {
>> 		dev_warn(dev, "Overriding IRQ %d -> %d\n", ts->client->irq, irq);
>> 		ts->client->irq = irq;
>> 	}
>> }
> 
> static int goodix_request_irq(struct goodix_ts_data *ts)
> {
>         if (!ts->client->irq)
>                 return 0;
> 
>         return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
>                                          NULL, goodix_ts_irq_handler,
>                                          ts->irq_flags, ts->client->name, ts);
> }
> 
> I thought that i2c_client->irq is handled by the core.

Ohhhh that explains things

Cristian, please ignore my request to remove it then

Konrad

