Return-Path: <linux-arm-msm+bounces-100262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCctJD1bxmm+JAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:26:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 056B83427E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E262130D7F9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0223AE190;
	Fri, 27 Mar 2026 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5jsLVqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYI6MmLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBA63ACA70
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606749; cv=none; b=Lm3X5XjUNP0YDFG2zUE98EJxt6aXWtdSuOhujiQ2Pyu+FVQWWYXE3lp8as1FqzWT2u1HAnZQ/2wCyDCL8Gbo6h9Ojc/veXdDYxBqBKuPQe7c/zNKf3UHjFvexWm85mCimS2GXtmliOgWg1wctEh2aRSLRq/3AMnV/dVoCPYemh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606749; c=relaxed/simple;
	bh=BxXytpMfEmrIbD5wV+hAXDK6EqgtegCeGSB1w+jf/NE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOCktJ5c9nXKADA6ciXuAIvYn8zkSEiuc2FcKEnNuse2gl8d6vu+FZKT4OCJf2o/C8d2Nwn7LhrR0aSgl7ZqsWGL3Gu7EIXzNKyixED4CjZwKpJd1knmxuHzE45bJFyy4v4VzJVQvbDOhSK4yfIF7q+rNL3Iy9xXazTiUyWEE6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5jsLVqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYI6MmLy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w7Zt3132226
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rQYr3AYKQwuRgXI9rkkXjVvvYljG41TZ7dhq0zRFpaQ=; b=F5jsLVqjeA8iQBfQ
	ADJGtH6UsyVMYJ056GyPDw2sGvOdbEpFgSSk+wqbAsCPV4qBzpWz5lliwQPPl7Ht
	crZU2SAi5T+uZbHyECEEuZ3algyGBN4GhoTEmMZvJV6OBHPwokpukVV+BNQi0D3R
	c66l7H6JQGzysN/xJIx9I9PupopDFK3JCvW+blt2yjTaSdngOZeRnyNVFflLf5Zp
	4XO+va5jR0FjOuRCjTr/U0eDeeYMpG4YjM+WDS893GygArnneiA2AGpjlX6WavXk
	SdmDgAXmVfyJS738mbqIZDB2WDhVtfKOGE7OSF8UpXCvHD+hH4SFyNUN0k9fGtOz
	BHmLig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s431e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:19:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50947db2e97so5941721cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606746; x=1775211546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQYr3AYKQwuRgXI9rkkXjVvvYljG41TZ7dhq0zRFpaQ=;
        b=LYI6MmLyFWs1QxnTJSBPsfkFIPGj9+l6p11Tcx+gytW7BUbCIybIHo5+krFzAirmWD
         pzjA9qSKSmJak8zxzBfqm6ALNIfcVk13TkYMqJaiAzaV02SjH6yGZdIZunnTBMTV7FHu
         fmIp5AU9SXqpkBqyc8WlBj6rvKkD4B4Wk5Y4HVBmH9Cnc5OyJKd57H7lYqXmZZsPvMLI
         kTIHF7dcAw5AvBbiMI65ElZH1Vs89ATVTjWW+Bh7Bds2evJ3mbANy4q2O3T/p3o5ANcZ
         yY4LSPQOVZV7+BhiBrKBiWGig0y9X0jZAWwLjOkAYZZ06C+yddop+LvKn1oY9gb//5E/
         9PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606746; x=1775211546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQYr3AYKQwuRgXI9rkkXjVvvYljG41TZ7dhq0zRFpaQ=;
        b=M+LpszGG5O2PRrkLycI8h2yDsqBI+3hDVnk2iTqwgDIgCs7oEF2EOa+2qtl1rGqy9Z
         nPPZxpDaGzb+wSr4cgejRomJmwdd+csc1me5SnqkTPFooh1I2cZmxi0Huvcvy3uV+XfF
         OthF4nnzct6Gn+u9m43Ok4T5KqLQjUK8jjOE2ujKvIyU1U4coLZ9iLXwsOw8FcAgfNoN
         HkQpfkdmfhnuRpTL8LgMD/F8FUFlFU6EjDm2D9qRyTET1lRQg5e50feqCNlGgf3A59Hg
         zLwfKlhxdRFKAr1Sm3g9fyRD4w833awoFnpAu4FttohXw0IlqqmU45/O9bFa8tsZSJ7y
         o8bg==
X-Forwarded-Encrypted: i=1; AJvYcCUq72rMjJStjLYE/oMQo8KAR1D6dz9fqlAIb6C27wjm51aXRO8E3ZWLjPVkmaLZufIgxKvDbc9kVw75OX2s@vger.kernel.org
X-Gm-Message-State: AOJu0YyKFa9a1n0lvc0dMAfI+iYNEBdjf0fJbBAQAgSDIVyv6ZpaVzvh
	YS0aAi02TA41dTm6ZEVn6TLuuaWpMQ7jTF5EdGZ1gJ6XSUyOhLCceghx9b/AiMHZBAXM40G+S/2
	bqd1EtZsofphXLcz5izx1hm2nbfsyBSoO2LT8j4FX9utj/DY9QgElbgvNBLBeQcfuoseU
X-Gm-Gg: ATEYQzzJY0l1rUIwDp5tCYoodIZxNoldhaQJfAFhHZwqiMI9c6tdA3e1GV1UkJvDLQi
	fG+FqJ35wFkYXjip2YosQAmlLAod0FtqqNiuoZAeRaxJOZDQhm6vrr1MCb3V+HQycguvigMUpBz
	Y61ZpsoVuHuYMioSIFnB5c4kCq6k5Q5PMEm57pWumboUuf4aYgkq4Y/fCBMDnX3etm00TQ7IjNk
	tHTpiqWN89/xoQjQP8bt0PyTVxOknUEwS+hpcAb08GQsk/MHc70BAZsRhwu4q+yJ3n/E4RRLBgz
	DfLj5IyE30CXIqv3ZMBYWerUhU4XgEEjJ64U1Q4ZTg6j0HAHldDTik3ZMKaOUGrAqXC4HZIcBza
	rxnKKTPaN3VwiljJDcNUt1lNBACeMDnP8X4Az9FFwVom5PUa57cWvjwMkFPD2z4Cx6VKWULMnU/
	wAhDw=
X-Received: by 2002:ac8:5fd3:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50ba381931bmr18863011cf.2.1774606746246;
        Fri, 27 Mar 2026 03:19:06 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50ba381931bmr18862791cf.2.1774606745759;
        Fri, 27 Mar 2026 03:19:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2043add3sm234305966b.58.2026.03.27.03.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:19:04 -0700 (PDT)
Message-ID: <75f32587-b1e0-4a12-ba99-d2702a299142@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:19:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
 <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
 <26XTdUyQTB41Oc4D5HnMtSm_QpZRjlkljQRJVw-u1Zp3Ltn9s4LVU-LQkP6drdl3Z3GGssLCCbsVYPFEqssHcQ==@protonmail.internalid>
 <65e06b2e-eeb9-45af-97ac-4ae60f652361@linaro.org>
 <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
 <d6616fc0-75fb-47e2-96cd-ae81fa1a8e82@linaro.org>
 <f3c62284-ac78-42c6-a4f0-cd984b7124cd@linaro.org>
 <7eda931a-f30e-4e01-a130-996ec7f450d1@linaro.org>
 <a42f837c-4b90-4e0f-a98f-793fbd20a140@kernel.org>
 <117d9294-87ce-4060-9c8b-71190b649e64@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <117d9294-87ce-4060-9c8b-71190b649e64@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2z5bS_vi3s_MQvYzYw4a9MvxvnAwnxh4
X-Proofpoint-GUID: 2z5bS_vi3s_MQvYzYw4a9MvxvnAwnxh4
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c6599b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=tOyMFtvu8Owbn7gLMVQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX1qrmDlFF+iRN
 4hQ45IKIpUZenG+Cgsr6mg+0QZsAZo+heb18nllEbRyFO9gwhtJ09ANL/VJxLDb3io1fRsmD0uv
 SSkiYZm0K7gaVuEGDww1+mrtnmYCpU1HRqj0ThcSg8E8n3A40xdXy5/heLrbqUikkRKrlxPhDeM
 R3BnEzORWD1sklrK1Nwms3hl11ncwelU8NMQpdaVyLSZTdtKLLnH+Nyq94LjHSoG+ifm/XFwc02
 MHQK/SFo//Rs/lt/FSYxD5SU+N38+ZktpSTzhBfMD1Gv8X/A/WCjArljdJRjPIEcFWSCpsKKkNM
 s4izVBsS/ii9D3s8ocj5nTO5ycVVMOB7PUzfxHJOdgwdxjWWKNc2ic/HmDa+gTgVuBKL0cKCNrB
 pf3bhIssYyvCK5GIKEVKCVAPT3pczuB7uoIWYeuMDFbFSYT6YJbZY7kH7bUfJIKtWuGstV1r10Y
 vrQJdu/Rvw9UTs9/iXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100262-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 056B83427E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 6:39 PM, Neil Armstrong wrote:
> On 3/19/26 17:56, Bryan O'Donoghue wrote:
>> On 19/03/2026 16:08, Neil Armstrong wrote:
>>> On 3/19/26 16:18, Bryan O'Donoghue wrote:
>>>> On 19/03/2026 14:56, Vladimir Zapolskiy wrote:
>>>>>> There's no reason to remove that from CAMSS - it would be an ABI break
>>>>>> in user-space anyway.
>>>>>
>>>>> If technically CAMSS CSIPHY could be excluded from the list of CAMSS media
>>>>> subdevices, then for the sake of simplification it should be done for all
>>>>> supported platforms in advance, such a change will be independent from this
>>>>> particular phy series, and vice versa, this CAMSS only driver change will
>>>>> prepare a ground for media-less CAMSS CSIPHY device drivers, hence it shall
>>>>> precede this particular CAMSS CSIPHY series.
>>>>>
>>>>> For backward compatibility with userspace a noop stub will be good enough,
>>>>> it's not an issue at all.
>>>>
>>>> The standalone PHY driver doesn't require removing the CSIPHY media
>>>> entity from CAMSS. They serve different purposes and coexist - its important to have a NOP from user-space perspective for legacy and indeed for new implementations.
>>>>
>>>> How the PHY gets represented in the kernel is of zero interest to user-sapce.
>>>>
>>>> That said, stubbing out the media entity is independent work that can happen in any order and IMO is a separate debate. Whether or not CSIPHY init sequences live inside of a monolithic CAMSS driver or live inside off a discrete csiphy driver is not related to the media graph.
>>>>
>>>> Happy to have that debate - and if indicated, carefully apply patches separately.
>>>
>>> So what does this actually solves ?
>>>
>>> Neil
>> Per-PHY voltage rails, per-PHY power domains and per-PHY OPP scaling.
>>
>> Using the PHY API instead of rolling our own, as well as separate nodes in the DT.
>>
>> We've been getting away with power-domains, opp scaling etc by sheer luck. The feedback from the list alone now addressed in this driver makes the conversion worthwhile.
> 
> The PHY API doesn't solve that, having proper nodes solves that, you could add a separate csiphy node, add a port/endpoint between camss and the csiphy and attach a camss aux driver to the node, and it would have the same effect with little code change.
> And this could be done for all the CAMSS hardware elements incrementally, and if you wish the move the electrical phy part under the phy API then you just spin a PHY aux driver controlled by the csiphy media element.
> 
> I understand you find it simpler to use the phys property in camss, but it has plenty of drawbacks like not be able to describe data link properties specific to the CSIPHY properties or easily describe new hardware layouts without having a fixed association table between phy-names and whatever CAMSS media elements interconnections.
> 
> My question would be that if we were to completely split out the CAMSS into several separate nodes linked with port/endpoint graph, to which hardware element the phys would be associated to ? is there a fixed connection between a CSID and a CSIPHY ? is seems the CSID gen2 & gen3 can actually connect to different CSIPHY meaning a CSIPHY is a not simple electrical PHY but can be dynamically connected to different consumers.
> There's no way we can handle that with the PHY API.

Because almost all CAMSS components may be muxed around (at runtime), I
believe the endgame is to have a central place storing references to all
of them (which would end up as "the camss driver") and managing the
actual connections (turning on the respective PHYs, programming routing registers
etc.), based on incoming v4l2 requests

For older targets without that configurability, the same logic could be used,
except with predefined boundaries

Konrad

