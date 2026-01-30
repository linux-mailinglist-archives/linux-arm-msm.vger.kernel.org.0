Return-Path: <linux-arm-msm+bounces-91310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA0lO4KmfGnCOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:39:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7DEBA96C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECE513043BE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B37F37999D;
	Fri, 30 Jan 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3KiP51P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHmWXv+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D458423EAA1
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769776595; cv=none; b=q2J2ZShtn0G/Xy8sTB6KJhvTBVQ7+8cPZkogMzOGgvKgnhqEzAW6REHa0mpe9XK1J6+gf0f+bPEWVLetx8GS1t/G75o7AdT305w+QA3jqfecarG2heFxvFFFadjUQh+BnP6NAcLm8wA8HWJU3Ir07uSoXRl7hZVAws02t8TcFG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769776595; c=relaxed/simple;
	bh=Sj1kVKqqpXnXruJWrfoKTnNdlgIzxO3beFY0/kU35PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHx2muv+V18AxXTqVRF5tDIxUYN8qmMwrvJZP9MNKmSKEUxTx3wtX6ZiAoqtNVq9RAtRCliiB6fb8lCoVWXcAkAaFix3a6ujhKRs84rC0MaOBN0uX7L9el4eYMD6pX2DhB9E17Z7xYzVUugVPjXrvshJnhKLnnP8KRUsKk9fCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3KiP51P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHmWXv+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAOuLV485878
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaiiEKO9cdm8xAQNRhuZC+U4tmxXnvfvkcGu4ewXGew=; b=p3KiP51P00suKPpc
	urLnTH1Nl7cjhS3di/MwCGoM3EtgcclSCefJuHjlz4RDXcS0OYhaPxhHGw7OGAo3
	O8pW31LPRrsQUPcHKSXtBjHFDcKH4iT/F4J9raUF38oXfASVG+5Y13jJi5I6U0PD
	UxL1JY9dhPHTRMNmYWaEiam9MluYxSbckOl3mhj7oYj9yz2g8Iv9PU3LqL5n6tjW
	CNdA5JcK+Nhn74X4T3+QKPTOUr7HozuIoa8iiEh6TTAyWnINjiFfOzKWB8HQWgqM
	HpJDaCmU3BWQL9sOaedgTbvAIixFusrfvv9U8lpSb8ATvReQXGEMfgaHEzkwrQym
	dSOCJw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gtnj3ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:36:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8946c23cf90so6866456d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769776592; x=1770381392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PaiiEKO9cdm8xAQNRhuZC+U4tmxXnvfvkcGu4ewXGew=;
        b=bHmWXv+IopWTeW5XkA60EDolSuD6f0PzNkxrNy6Epccowolhw/cuj+S1N10b5QCy0s
         IARSaN5SO17PoJOE33kP172LlIejo6kUuXKKrrCE6CxwTExDj1aUXOYnXIg7sTpFKGvw
         IdOLrL+DYfCHffzIP6iByfAQJvT5WOg/pV8fS0D+EBXN5TU3scNQ7TBnjMCpK1GVRTyh
         W2GA5tbCXZnndoElkmLuSUwu71mZYI7lwBwuO9SNFEF4Z8Id2c1LSgEzhLMVMdEDog2l
         V9Mnl5sKGkvXzmwBFDQXTZh8KvSr8YbomhLUCh+Z1sFqsmG22tsf3Vx4UbCW+jNPgrOn
         7K0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769776592; x=1770381392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaiiEKO9cdm8xAQNRhuZC+U4tmxXnvfvkcGu4ewXGew=;
        b=bC+z00+h24JH8/CyGSgzes2RdKv7euaPku0mA2bg9Dg4Z/oRZvlrqsQhryv7LC6Y2+
         yhaPARwFQ5H9LPnKfw5cC4aQZCu6+6BM2QVyGOxmIvwK+hTid2urS308ATMW7yc2oFdX
         DMP7Ae++4gS3NRCnMoQr/Cnz7qBrmrt58b9vEZQ6LCyBF2H1dZBNYGxqWBsLX/KcI9Ws
         QxDgrUEeGiw/w+vcQ/M3rGprqhhyd1PPHUzGFedTuful95fS4G9sEPbaMnHPugxdcz5y
         IR9DOWz0X9fBz0RvoyK8WzwYkq3W7X6RvEy+ws75lugAeBVCoAB3CwgQoJ1KmHNdOL29
         DiTA==
X-Forwarded-Encrypted: i=1; AJvYcCXtwwa//oYCcJ5eZSl/Yg1bjgFKgWF+clBKu1Jgd54iCxIOYMWAmf/REqZTk2U6OCrCbcEb9puQ9r17TPC4@vger.kernel.org
X-Gm-Message-State: AOJu0YxXNlQYupIkWDww8Csisdka9wHHTmlLtj2Rq6+jF97gTK3tnwmh
	N2AS6mMur+V7Ykiu4BRVltDslkGjnOUJu41fZXJ/PfrXlRBZKwCTazGBHLUzVjt4rvff8B8J/2P
	llhWVn/dL35juxZ+Te5Huz61275tvHPoab2aw2/7/KdpTzhR1foqLzXkqeKUNzhLPxWH1
X-Gm-Gg: AZuq6aKY260aDMMENN89PE12yrYH+XNJZ6U0tx6P64pg62hzRTmyZsSdK6ioaGDtZAZ
	dBo+7K2IW8DbOGrxx/6naMyjrwJ8f5WsaxR/lC3rH+ZPhSZo/9fmCFi7zPHIps38vqj2IIEV/L4
	CaDCcYfiiM2SiHZKSxILABhX1YkKCHooVbq2JrmHNVNRNFUpmMrUhgNrRvDSDv4fIYv4yRwbOmi
	eWBgmVtSyOIcSNiAOMNHc5mPCcspHfyx45Ewa/nfbOwhl6rSFNacNvL5gmWKNBGg2fCqB7sPHJB
	HsV0BJ9TD0GEFVDqNBGVIXxm0+HXfD41cYaZ3tfbPxV4QRaJI6Vl6aivlpWmsQg6CKQ4yiM3a3G
	wHHaJSrWQ10cU74nVwsFBYKU6Ko8mnFqNY0an2CRsmTe+R+AE94fS8BU80cPKbxW76mc=
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr294381385a.1.1769776592040;
        Fri, 30 Jan 2026 04:36:32 -0800 (PST)
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr294378185a.1.1769776591450;
        Fri, 30 Jan 2026 04:36:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de289bdf4sm258533566b.44.2026.01.30.04.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:36:30 -0800 (PST)
Message-ID: <ef1611c9-4698-45ed-8ccc-fbad42acd8da@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 13:36:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ice: Avoid probe deferring for un-supported
 ICE feature
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        mani@kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260130091118.147379-1-sumit.garg@kernel.org>
 <4ad700f3-da8f-4175-9172-3fc4d87d8152@oss.qualcomm.com>
 <aXx_UDTkdYHY04FR@sumit-xelite>
 <4f629971-94cb-44aa-9502-4f5ebfd63937@oss.qualcomm.com>
 <aXyXtK10_t-OBOxn@sumit-xelite>
 <2697d1e1-8421-46aa-b58f-10608a2bea2c@oss.qualcomm.com>
 <aXykJIuEwbeWuhs5@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aXykJIuEwbeWuhs5@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iEfphqawboTJJb66iROvvVUUl1hIbUJI
X-Authority-Analysis: v=2.4 cv=FPcWBuos c=1 sm=1 tr=0 ts=697ca5d0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HqyMz5OooM2eIubwA4YA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: iEfphqawboTJJb66iROvvVUUl1hIbUJI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMiBTYWx0ZWRfX6xxcGR8LUFgg
 3Z39JSp8B3bjmGG91EezW0jnIkre7scHW4B6VjW7Z20TsNU4OFOTFw+2x85XFJNPFmDTkVVny0L
 pLssX0W19YFtIsJJd3LzrWhvRzpfiNR19dxGGvBW/2qYXZ+N/XSM0mrVVP2eO/Sjlj8w7QxnyIC
 bjR0LXIf9tFDl0ZFkxxSTjz25OIeUMtZcYBsX7Zdfjz2CIYcvX6dJdELX3+9binmu7r++yWhNJj
 f7SMgMwhkGcoqvgAbqhgeHTqcyZYYxyaihDtlDRBfAdecNRq4dx8EvYjlSClpsFBctwWFwrDhCu
 22V5acPYJuTRW+9l8blSiKi+GyCRCWLQ+/zo3Xyfa519bSKlse8WgZ/mkqMw/AfOumNGDqI5iVb
 UDhBYMpoFGp02h/p0baXgKkptDT8s8y6bubxYrbQNIwZhCvJEcaXnk4Lks0lvOGdbODmkmUvIY/
 iR4MyFbyJ260bA81fUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91310-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C7DEBA96C
X-Rspamd-Action: no action

On 1/30/26 1:29 PM, Sumit Garg wrote:
> On Fri, Jan 30, 2026 at 12:55:53PM +0100, Konrad Dybcio wrote:
>> On 1/30/26 12:36 PM, Sumit Garg wrote:
>>> On Fri, Jan 30, 2026 at 10:59:18AM +0100, Konrad Dybcio wrote:
>>>> On 1/30/26 10:52 AM, Sumit Garg wrote:
>>>>> On Fri, Jan 30, 2026 at 10:34:26AM +0100, Konrad Dybcio wrote:
>>>>>> On 1/30/26 10:11 AM, Sumit Garg wrote:
>>>>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>
>> [...]
>>
>>>>> Since qcom,ufs depends on qcom,ice via a phandle, so isn't the probe
>>>>> orderering automatically taken care off? Or that isn't the case here?
>>>>
>>>> No, that's guaranteed by devlink only with certain properties.
>>>
>>> Okay I see. The other alternate solution I can come up is following to
>>> keep the deferred probing intact. Let me know your thoughts on this:
>>>
>>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>>> index ab9586b8caf5..76bf9f94fbaf 100644
>>> --- a/drivers/soc/qcom/ice.c
>>> +++ b/drivers/soc/qcom/ice.c
>>> @@ -559,7 +559,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>>
>>>         if (!qcom_scm_ice_available()) {
>>>                 dev_warn(dev, "ICE SCM interface not found\n");
>>> -               return NULL;
>>> +               return ERR_PTR(-ENODEV);
>>>         }
>>>
>>>         engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
>>> @@ -648,11 +648,14 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>>         }
>>>
>>>         ice = platform_get_drvdata(pdev);
>>> -       if (!ice) {
>>> +       if (IS_ERR_OR_NULL(ice)) {
>>>                 dev_err(dev, "Cannot get ice instance from %s\n",
>>>                         dev_name(&pdev->dev));
>>>                 platform_device_put(pdev);
>>> -               return NULL;
>>> +               if (PTR_ERR(ice) == -ENODEV)
>>> +                       return NULL;
>>> +               else
>>> +                       return ERR_PTR(-EPROBE_DEFER);
>>>         }
>>>
>>>         link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
>>> @@ -726,7 +729,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
>>>         }
>>>
>>>         engine = qcom_ice_create(&pdev->dev, base);
>>> -       if (IS_ERR(engine))
>>> +       if (IS_ERR(engine) && PTR_ERR(engine) != -ENODEV)
>>>                 return PTR_ERR(engine);
>>>
>>>         platform_set_drvdata(pdev, engine);
>>
>> This looks more robust. Although the UFS and MMC drivers today check
>> for EOPNOTSUPP, so perhaps throwing that would be even better
> 
> Sure, I can use that error code instead.
> 
>>
>>>
>>>> In this case though, I think it could make sense to add it to the
>>>> "suppliers" list in drivers/of/property.c.
>>>>
>>>> I don't know if vendors adding their custom properties there is a
>>>> pattern that +Rob will be happy about though..
>>>
>>> Not sure if that's a shorter path as I would like to see fix for this
>>> issue backported as well.
>>>
>>> Aside, not sure how much stable ICE feature itself is as I got following
>>> crash with QLI boot firmware on Kodiak:
>>>
>>> [    5.172970] SError Interrupt on CPU6, code 0x00000000be000000 -- SError
>>> [    5.172986] CPU: 6 UID: 0 PID: 241 Comm: (udev-worker) Tainted: G   M                6.19.0-rc5-next-20260115-gc1a0fee87a05 #9 PREEMPT 
>>> [    5.172996] Tainted: [M]=MACHINE_CHECK
>>> [    5.172999] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
>>> [    5.173003] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [    5.173010] pc : qcom_ice_create.part.0+0x6c/0x24c [qcom_ice]
>>> [    5.173024] lr : qcom_ice_create.part.0+0xe4/0x24c [qcom_ice]
>>
>> Could you please decode the pc value with ./scripts/faddr2line?
>> My compiler produces different output
>>
>> ./scripts/faddr2line vmlinux(or path to .ko) <symbol_name>
>>
> 
> This points at:
> 
> static bool qcom_ice_check_supported(struct qcom_ice *ice)
> {
> -->   u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
> 
> $ ./scripts/faddr2line ./drivers/soc/qcom/qcom_ice.ko qcom_ice_create.part.0+0x6c/0x24c
> qcom_ice_create.part.0+0x6c/0x24c:
> readl at /home/sumit/build/upstream/linux/./include/asm-generic/io.h:232 (discriminator 1)
> (inlined by) qcom_ice_check_supported at /home/sumit/build/upstream/linux/drivers/soc/qcom/ice.c:118 (discriminator 1)
> (inlined by) qcom_ice_create at /home/sumit/build/upstream/linux/drivers/soc/qcom/ice.c:587 (discriminator 1)
> 
> To me it looks like an issue related to access control policy. Note that
> it's the Gunyah based stack only where this issue is seen.

Please first check if that's not just a lack of power, because apparently
we never guaranteed that would be present, see:

https://lore.kernel.org/linux-arm-msm/20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com/

https://lore.kernel.org/linux-arm-msm/20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com/

Konrad

