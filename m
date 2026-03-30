Return-Path: <linux-arm-msm+bounces-100783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBP2Cu5fymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:35:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B789835A569
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 170F83003608
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C6A3BF68A;
	Mon, 30 Mar 2026 11:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xh4gJrX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnkE8sIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DCF3BD65B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870506; cv=none; b=V36iv25qJlNOKwAydcqGwnxvIhW3u6/2WjbyW7SqWTydvuFZa1tVrV83axgATBL9vfFhlRt0+XBOSgFx8w+K0Pm0povoWm9DwC9S7dxOc5I1w/4D076upAMTx22pmA2mUf31illhUMnMunhEBZ4QU1txIlMQnT0uHywGof8Fufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870506; c=relaxed/simple;
	bh=ycV6YQeXVa5eh8mTB9MAC+9vMFbJHtlkRF2/yOgzqts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6XHwEHqsng1NFQF2FKyQf/Fjfss6RtgRJ7yembBxfyf+pYPBSGPwIUwPwJfuGmOtOiJI+t9O53V0FtosJLjq/cpZXjrgUiqnC7bu4MxIUqAGt+nXpMn5Ht8FG0smVqiD2KmJfmEkGxVbYTiiw9UU1tM7yNtcdr16DY6D82z5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xh4gJrX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnkE8sIW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7Gw32117364
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AD7yhFYem1/46F4xjVAzjcyJmROsEd9YlW0HID3CP4s=; b=Xh4gJrX7unDovN1t
	Hcy1hvQ4Gq9QsLeJrbRnJjY32V2o5ftIJ1Au/UM/hTaV0pp96z+1bRtxxsjLYvex
	p3fPltEsM/a2BVDIh58ydwl0hDIygLKuWicbEMV2vILPGnODSgHuJm8P+XjLBjT8
	DXOsgGY73L0CJejC1Do+u3d2caqecj236nyIm/sjnYNS3m0OIhaKcxGsZ/KQ1vh8
	gUMvUAPPK8KrvD96DqmejVlwQr/kKDgGUuklAf+9NczWiEga8S/zXVZc80VEncdd
	Z7djOQ+gFZv2q0d9D8RZqWYxTkecT/fO9iLm1SYad+1VsgT7CwCPxbU/QXi57wY8
	UapRGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqektsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:35:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50943e69b08so15794961cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774870503; x=1775475303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AD7yhFYem1/46F4xjVAzjcyJmROsEd9YlW0HID3CP4s=;
        b=bnkE8sIWs3mw9k1wnROrX+0+xOXPB1ubsDE97ZlhM7aYEGJ5UG0b6Bxu+Y+jZuBNPN
         5Tmn71aGxAkbHZz5TiQlTikcU9jBHAgRyaN3HLEBG0/A0cJ3VOAPGZ+eFMFNXXVLHkza
         ufXbsDjnIs67xFZQZdSOfSAP80gSwFMCJeVqwV2Ij0TTvBkiw+aTLdgQajPSJJRoHUTX
         +KkOSQ+9tJSm0JWVKnRmt6cObHlOfnTxjeVVDydyRwnUgxiQtdjuaye6eArmB007/Vhx
         PdL292s/KzS6KJhSWmZQqrJCsKD7kyzvgtPGxdGDDxgC8xiya6fXnXRQXuNu3/xxK2er
         C1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870503; x=1775475303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AD7yhFYem1/46F4xjVAzjcyJmROsEd9YlW0HID3CP4s=;
        b=ZpFf5FynBmr6pu68TjvHSuKHN0OOfgpDBaUs84ATp0vMSv3CRFSuHDoN82gOEmiI+K
         Q+7oB9X6u7wQOxy71/jx4343mP3bYjJ67PQwsDcj3tlvOqWFpg0h9dJlVFvMnM3Cy9v5
         QqnPg7z0EZor7X/3UCzpRjiYoba4dMXEkTFvw4hoKd1MSu5DCxjQhK87gqaKbXui7CsG
         F9QnhLgDC5Gz/gQkHppaiuTAwLdG5YdZ6qQFDrDHrtmME/7VycMM9IIE7ws92loIjCc8
         rF65whNqGFIoiZTVgscsYsSsFiU0YJApajgcB/RHQWcpwUtYlY6ZtieyEqiS5fh7TkJ6
         6kxA==
X-Forwarded-Encrypted: i=1; AJvYcCVpMqc/ZoQU22woERJtH/XhVQYSlEYk6kvPdkvJVTSiAa383hKUZS+pZWYcHUVW7qXoI13ltJBS7hbwwOMN@vger.kernel.org
X-Gm-Message-State: AOJu0YxcHNcou9f7Fa+8IpWyYUoRjEb2FeKriDNsD/1ul/UosBc3+Vlj
	niKyQmAWw2R6zwZIXqCu8MI6mGQjBy0QW+uZo2OOVezkB9KhjF3zT1JgnJ47OjjKXiWn4ddBuET
	axWOEycq/p7oG4iJRxVVfH1wnokHLcc+b0/S2+mKJe/UlYn/k9qDuh54iMZnPYE3iXwHn
X-Gm-Gg: ATEYQzyezrs5ZSAIKQDMuU5IiHMLOZbyEhugRfUYr6T8IBlV/LktjQ9O9O/PmOoRllz
	PsUdes/vRmHfcdqDwOtQeUlDG1No35dQ1xwp4X2Q6VQkfYfeqMPj9ndyKsB7jMc6q4FRqz+2N3a
	WcanHPD+PFK9fN5ugG40U6WhKm4ndktXyAgFcfG0Ombqcf//vuWIBEbO9T19fBmG4ndHo6Axneo
	l90GOV1pmI7Ja6EyLfLFwBJZnEqaf+EKR0c+XwRyYdWDJprNebc/hN+8LiBB3ak3RI4VivMxg9Z
	qEhEcT5aEePl+btwhHFTda0OkJ/VsljNgf76oSkLKU5t54BxoObClR3CuNnMJBR1wwyojpnT7JO
	v2WHArmL4Akt0yRlo4Ck7PbuQe4tiDx2359EGqhh0Uq8QMjDufCwgbu0k8eQEi3NLGi7k3KOqmN
	vo0Yk=
X-Received: by 2002:ac8:7d41:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50ba36c2754mr120405671cf.0.1774870503123;
        Mon, 30 Mar 2026 04:35:03 -0700 (PDT)
X-Received: by 2002:ac8:7d41:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50ba36c2754mr120405191cf.0.1774870502547;
        Mon, 30 Mar 2026 04:35:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae51ef5sm275868366b.18.2026.03.30.04.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:35:01 -0700 (PDT)
Message-ID: <6d5ebab6-3c4e-4a1c-9578-6e926cbd96de@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:34:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
 <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
 <RAPaPhpxA39W0ykm-Cr1KaDiJKpRqdQTXUeEmt5mQn4lJBHEGaIS010ejjmhUYEBsHjzrTX41Ek9zLU2bae_YA==@protonmail.internalid>
 <76ea03d0-d41b-4880-a48c-06570eb089ed@linaro.org>
 <0101d8bc-1ae8-475e-bb9e-cc1e16db87ec@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0101d8bc-1ae8-475e-bb9e-cc1e16db87ec@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca5fe8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=mneW2Sup4nk-zTkRaDIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NNWTuUu4ERGSzeQO1xUQhdrMNo-WzEkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MCBTYWx0ZWRfXxeMhIvuuryo6
 ydMaQtQRwNNQkwTh1AaWGXNvkyUsfXN83fyZtN36+Oe4gwxgN/ebwWr/+TlsJ57YscpzlN2Fa0Y
 T41ARbyHIm4TTxZwqsDXreFImdHVYVu8GD/mzOqW6m4OyJXLq5h6WypcLzau+TjrR1IrKGw4x5y
 cOcDUztlKOAk+aoysyU3H8QbB3s7m70n/qE1xuKpvbQPe+m/NCGtWtFnJKgFx1eHGpU0wVlq3Sp
 x82+PB+RIvmCHKket97xdbAby5Ql50qJDHu9o9iCEvLolujVPU1mWfB0Q3mY45BD+bmqhJ4s8A7
 MmTdZWmkO9xskS/ARy1P2PGfs92uXhl0bNc4KnXD9HYKrfbAmY/jfIxHBPuMEve9QOudxXLk4o6
 Kr9bC/6dZbQ1x8BT3f7VkiNtDSbtnsTHZPrSqDR622mvXR6o+zGk2y1GNfx6isc5cNkGtfBXsWG
 wz6lu6uKErq6blHpwVA==
X-Proofpoint-ORIG-GUID: NNWTuUu4ERGSzeQO1xUQhdrMNo-WzEkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100783-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.152.150.128:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.15.66.64:email,0.0.3.232:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B789835A569
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 11:25 AM, Bryan O'Donoghue wrote:
> On 30/03/2026 10:17, Neil Armstrong wrote:
>> On 3/30/26 11:02, Bryan O'Donoghue wrote:
>>> On 30/03/2026 08:49, Neil Armstrong wrote:
>>>> On 3/27/26 18:42, Bryan O'Donoghue wrote:
>>>>> On 27/03/2026 15:28, Neil Armstrong wrote:
>>>>>>> To be frankly honest you can make an argument for it either way. However my honestly held position is analysing other upstream implementations connecting to the PHY means we can't make the PHY device a drivers/phy device - it would have to be a V4L2 device and then for me the question is why is that even required ?
>>>>>>
>>>>>> This is plain wrong, DT definition is different from software implementation, you can do whatever you want if you describe HW accurately.
>>>>>
>>>>> I'm not sure what point it is you are trying to make here. Are you trying to say drivers/phy is OK with you but you want an endpoint ? If so, please just say so.
>>>>
>>>> I'm against using the "phys = <>" property in the CAMSS to reference the PHYs, a "PHY" in the classic terminology is tied to a single consumer, and if it can be shared to multiple consumer you must model a mux or whatever in the middle.
>>>
>>> The CSIPHY-to-CSID routing is runtime-configurable and is already managed by the media controller framework.
>>
>> This is not compatible with the PHY bindings if you don't have a defined MUX device in the middle, it's wrong. You're hiding the muxing details in the CAMSS blob node.
>>
>>>
>>> DT describes static hardware connections. The dynamic mux is a software concern, not a hardware description concern.
>>
>> DT must describe the possible interconnections between the nodes, if a PHY can be used by multiple hardware components, it must be described.
> 
> But right now the CAMSS block is described as a single block. There is no CSID device in the kernel _yet_.
> 
> When we break CSID into its own block then fine, lets have a debate about a mux then but right now the "nodes" are CAMSS[MONOLITH] <=> CSIPHY there is no DT CSID device to model this to.

Let's take a step back - since any CSIPHY can feed into any CSID (at runtime),
the resulting nodes would either look like:

// hardcoded, m may != n
csid_n: csid@1000000 {
	phys = <&csiphy_m>;
};

or

// determined at runtime
csid_n: csid@1000000 {
	phys = <&csiphy_0>,
	       [...]
	       <&csiphy_n-1>;
};

or we could store them once, centrally, in the "CAMSS_TOP" node and
pass handles around as necessary:

// camss "catalog/manager" driver/library provides CSIDn with PHYm
camss: camss@10000000 {
	phys = <&csiphy_0>,
	       [...]
	       <&csiphy_n-1>;

	csid_n: csid@1000 {
		// no PHY references
	};
};

Konrad

