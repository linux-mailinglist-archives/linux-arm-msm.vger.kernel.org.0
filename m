Return-Path: <linux-arm-msm+bounces-100949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HBOOblty2npHgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:46:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7F364962
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEE8A3038513
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 06:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2989D382F39;
	Tue, 31 Mar 2026 06:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXloRZLb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzCE5sHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E091ADC97
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939538; cv=none; b=cWQweq+crrCBHeFPL18iut+HAIXlWpCKHsARDOqGKaP02BHjTf5qo4jWCAvwArmPXgRyPE4rew8sLIRxMzY/gOhtaiyQCbHyirDO7fvAH38OUaNChSHGqrhmG3mz4WC6XtENG8urPN1vpECjdBRomAH+LAy4zbp/xHSUfnG5VZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939538; c=relaxed/simple;
	bh=AAYpfUYmdTX3UTjTYSt9G/mxz7kuZvKipqoN5YlKOZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LF94O/kEAE2OfAKipLajSY1L8JK422GMWMkzjCMks5PlVm6TMVt23l4iqXYlNRi4Fggl3cfoiXzIDTH5jI6RxPT1TddMYSdzDznK/nE2nReU6xdMPE0ruywnXQR+1ZDAkedcoxX04y+K/fYwfFkQ07lthWC9uM3F83ZApqY4j+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXloRZLb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzCE5sHF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V2BNaq4014022
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7jaa0+Nk54b7c/p08jJcjBJvqBXf72h9gReh5wVjVY=; b=WXloRZLbD35kciMG
	tdq0m3CR61bZQyntpZgknAmIpi9avqS7uK4+IjZbRIO5+yJCWSCS37PBqxXHZzIv
	+sCF6JRl/L/5uWFWfUt5PP2WI0rL34tapGkdmi5f17qfhJlDhXc+vWewsA+wFh89
	M70afv3gxUN9T7nn1RQOsvwYeiaf7eXMsrPOi4gq9XthH36H9OkK6jdYty5yzBhN
	/BwYfq5x/i7MzAj6DFwqTqhcVvRO6aHnAn9VBuPKueD2iF7tCC/kZDKsFTCjZ2/Y
	KmnMkQiAYOCXPf9pw/toUsnwCDRYd8opPQ+m0YeB0anCqpRXgCdxaYT6NN1RhBL5
	gcVqQw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7reguva3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:45:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35842aa350fso15994634a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 23:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774939534; x=1775544334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7jaa0+Nk54b7c/p08jJcjBJvqBXf72h9gReh5wVjVY=;
        b=RzCE5sHFSNeEDxAOFraXHqkSWIhDzEBYvAQtt+yvBjTl0iI50nERoBjJN80FgoqJsA
         oFWm1kMscy3P5e43G5XD9LR65BH5MrxqShi9usqSWRErpxppMENjw5kHxoOTCsJLjma9
         Afz/QKbaNNxC33BjxtgkbsT4F/bRVry7w70ySbkVVFigQO8GlqptpadMMqXzgvYuo/Qe
         DOGPodSoQn9JNhsnL9N26ODDZChesdU0i0U/+rwGXziWbdC0PLZP8Fj926x4A+HT1bp2
         rzfG86rIWcHvO2q9nNfWvmn3Q7nx7RQCMLOIshwKSMgyPposj7Cyr+Wlksw0g2AziL6P
         gVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774939534; x=1775544334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7jaa0+Nk54b7c/p08jJcjBJvqBXf72h9gReh5wVjVY=;
        b=dTEglsAKS9qIsjeR5LNMtgYYD3w+onNFr8OcNm78BdSfRITtOHrk4rE8uNO7ma1Rlq
         LRhLg+C6Yt+ydIkMJsvIE13lnZEXEI5g1UPUXYtl0z095rxKS1ERBcqRg5ERxzl5pe5B
         g6KZ4Ib1S7GjWWQtbkeom12aVPFatNjB1qhfEgZFXClDreKSaIDkYKzwcNX3XN8sVWNr
         It9u6Gte1+/A8Jgsl03ng2snnCuyCxYIlPMwDcKthq8+URLCTUCMYOprMv7egWt82480
         IkGUvXZgGiMbiNSPAQ8MoYKGDXButZJMUsiXnPTqQ0W7vZ6fltsnC9ALLpbwSq9OCH0a
         3kMw==
X-Forwarded-Encrypted: i=1; AJvYcCUQAcZ1ATmTysX3gGVh5HMpwWKpcLT8g3ikPGwTAn6eHlqI4XKesz30KjHnMQjVie+1H2Wgj/VNvmXymaRc@vger.kernel.org
X-Gm-Message-State: AOJu0YzXtTDdDNehUMhX8v/7NmJlYezIJQREkNsX00QK3GIe0zaEAM5J
	8SRjRWH1PSjGsHV3iGzK162zDJbYu/yI2I5ybKgsVcuq5Z2+fupnD41oKMeEW6qTK+g61KtqBuI
	wxz3ZEzvfmi4nWTSoBAjCbozzqhEK2Jz5lfncJQr7GTGyVBCj6ujYzV1SaO8pQjXTANRN
X-Gm-Gg: ATEYQzw+97CF2SACGJfL/ukjCZQa6gN4ih0TojndKiTtmgYQ89HOPwf5APbK9hMF+Cl
	TmVc3K8zEeKpFz4gpyMvjsICJFIuuEbvAPDmOFYcscgBKCVTu1qF7TKM1QRHv7nHrxAfUf2oyBE
	pUwrPZwI2DbdCQ/N0MJKLXcFyEBKrW3FmLvgdR3INNi+HchnUvYUCuAr7y3ALChjLic3X8syrvs
	AcgC9jCb8CO+fd1GFXNwTpIplwYMRv4ZgjqAPq7kuvK9UMg6tfzCh/bwtwjlPLGUlh1x7uL22IP
	ZJ9NX+8S3KxzfGvjJeghhzbDky9YYZPIzIggaikp+SNg0ALikWXErMXXuxjEP38mkwE/qaWs5Vw
	4vBUw8hq5iLWn3xG1ld7wF9/WFNY6fgb3t00TZaOQDoT/DashGeRd3g==
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr14593886a91.4.1774939534157;
        Mon, 30 Mar 2026 23:45:34 -0700 (PDT)
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr14593862a91.4.1774939533671;
        Mon, 30 Mar 2026 23:45:33 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe959358sm505729a91.13.2026.03.30.23.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 23:45:33 -0700 (PDT)
Message-ID: <d4e092d6-5d9e-49a4-88d0-c02e2f17f36b@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:15:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: can: mcp251xfd: add microchip,xstbyen
 property
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mani@kernel.org, thomas.kopp@microchip.com, mailhol@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, linusw@kernel.org,
        brgl@kernel.org, linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com,
        anup.kulkarni@oss.qualcomm.com, Conor Dooley <conor@kernel.org>
References: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
 <20260321135031.3107408-2-viken.dadhaniya@oss.qualcomm.com>
 <20260323-bonded-ranging-c9f9c4d0aacf@spud>
 <20260323-artificial-ecstatic-collie-047169-mkl@pengutronix.de>
 <20260323-surname-osmosis-3cceca19c824@spud>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260323-surname-osmosis-3cceca19c824@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69cb6d8e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=XYAwZIGsAAAA:8 a=CaXaFvdgtWsuPFoOWtQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA2MyBTYWx0ZWRfXycu/1vWY63Zm
 4rPWvWfpgDtcrLNBp8CLzedjoK4dy74cgR7UtJ5sVE/AnC1tJNeD+MQusbzoGPZoyIMYhyPzudq
 oB4GSIBDx+RyWfdB5Q/LfYu/JLR3VuW+6BQxafA4d1cU8vkGw5vb9Y1SfyP/+MYwBS2FWhjMxF6
 /jhKd437CQqP8GhwyQ/PD64tar0zDUv3MzTFCW3PwhvX87h4JILX0F8EOMFSmR/WAh103nPKBRw
 t9msGueTjeh/yZ+8L2niWRVd2PbXt5ORQfP6axCG7W4oLOdQF1IRabKHID3JJlaCqYOTjNsRMIV
 7Ly7HMAUGlXXz/qj5hV+pK/0B7aXJ9HJcIv3A44wHYEqNz41U/nwj/Ui9RyntSJ+iaIdzAvyVqo
 dtq50aoeAC5GaE4mtkjhkp/w8TlmqrvOyd9ZuMMKnnmGyBIIEHxjFygqniiObhJMiT2LlpLEwQ7
 irMNijA0z0aOu+V5jgw==
X-Proofpoint-ORIG-GUID: ebBdWTBzq1gSXk7OhLGIPRk_b7TKBntM
X-Proofpoint-GUID: ebBdWTBzq1gSXk7OhLGIPRk_b7TKBntM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310063
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100949-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,microchip.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60F7F364962
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marc,

Could you please let me know if the driver change looks acceptable to be merged?
Once merged, I will proceed with posting the device-tree change.

Thanks
Viken 

On 3/24/2026 3:00 AM, Conor Dooley wrote:
> On Mon, Mar 23, 2026 at 09:37:24PM +0100, Marc Kleine-Budde wrote:
>> On 23.03.2026 19:30:00, Conor Dooley wrote:
>>>> diff --git a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
>>>> index 2d13638ebc6a..28e494262cd9 100644
>>>> --- a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
>>>> @@ -44,6 +44,14 @@ properties:
>>>>        signals a pending RX interrupt.
>>>>      maxItems: 1
>>>>
>>>> +  microchip,xstbyen:
>>>> +    type: boolean
>>>> +    description:
>>>> +      If present, configure the INT0/GPIO0/XSTBY pin as transceiver standby
>>>> +      control. The pin is driven low when the controller is active and high
>>>> +      when it enters Sleep mode, allowing automatic standby control of an
>>>> +      external CAN transceiver connected to this pin.
>>>
>>> What I don't understand from this patch is why a property for this is
>>> required.
>>> Why can't this mode be implied from the lack of rx-int-gpios or
>>> interrupts?
>>
>> The mcp251xfd has 2 GPIO pins. "rx-int-gpios" is for the other pin:
>> INT1/GPIO1. Also by default I don't want the controller to drive a pin
>> in a certain direction.
> 
> Oke.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>



