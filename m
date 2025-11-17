Return-Path: <linux-arm-msm+bounces-82131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 13031C64E73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 16:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C2C724E83EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF7C2727ED;
	Mon, 17 Nov 2025 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMsuetOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BfzWaEfy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBFB26F29C
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763393763; cv=none; b=mojmLVD8WKwsCXaV1UOy4JpOyt1Y2/dm6QpRgRXEsQR/1BRJpHhVeIdGD7yzTV4IDm6p3hWDyfTRWSg/LFhPv29oQH+yp/ois4hWmozW2B61sX1kfAr162gx0Gmrhn5roJVu2WKRXi4toyNKlRbxqxg14ST4IQ6nrWZUdb5XHC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763393763; c=relaxed/simple;
	bh=F6BC7+PlCHzGuw2QFl5PT46BvsRC/SRL7UqvRjg1HQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xo6PtL0iyMgBElGVRxbssdLmZOFGwnt37KAHSDMx3DU4oAYd3k9Ft5tlUUlYFzwc13+RtC4AusO6ScZOF/sDf+SQeBJoDngZ5JztIz5uU8UxXSyJJZPnxX3NCsMQxx6k6ibPGQMIKxQvSqIYBTXDw/PyaE0cqBdq7DyaUjeARqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMsuetOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfzWaEfy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB3XE33517207
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 15:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IiXEW40QqYRYcgzUMb0Yc8i15orcZ89ClJbAmcNe1m0=; b=XMsuetOBcy0GkSkF
	USdYVFjgV2aWR/VSe6T+FMjJFDFePXY+h0uHQEsPMxb1fEJpetywHwvDDYEFCO8t
	k2iQZZT+riSZSvURJhpS2j7H0vnfI6dA2kN9pCS1MIX6nkbfWIYAEjB+wSko09wh
	cShAGwIwRS/3rmmcqyTgxoYBvBHnvbTuIS0Syzo/aQZwD7bP99zTNlo0BrAeS4VR
	m0T+zsBWUy7avGsQ+VE+vaW0JN8F1JH3LkTKtgsKDHXamIyOntYl+HSyYqw421aM
	9Lvb75bInj25NvQ1wkqZkyUYnxRoeEJ+2FzKIAuiZAQAHwssq1aG1EXARSjbZ+EF
	I//dmA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2gg8ru8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 15:35:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed9122dce9so4820231cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763393759; x=1763998559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiXEW40QqYRYcgzUMb0Yc8i15orcZ89ClJbAmcNe1m0=;
        b=BfzWaEfypM7dCQzl7sAR9DHe53VzkY6ZCiOsPNVqD2ewQPQHq4R3D3FoV4jrDj6TGi
         QLZTMXNuzd03F87y4CcRhPPPoNj832PxqaSEo0LzWgMmimymcGesyW4coVhvUKyn9Atw
         DUhetq6aVZq5IKsknCztohZ+DvLW3lPeHd2FZjOePvccvxl2MmkbXVKY9wCRCqv+ZTVL
         kiVVnqb+wb7IWQdjww7bpdMOrassY9Nt9HAVjYTwRt2ws0ijnTHolay9qpVzrF3c6CeX
         1g3+k4MJS1IzW/3w4XGtLpSHbFSQCSrC2mvYI6DpDk+d3xVS/3WvoYhMBcnzStPE6jdR
         uA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763393759; x=1763998559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiXEW40QqYRYcgzUMb0Yc8i15orcZ89ClJbAmcNe1m0=;
        b=pwsVovJOXIchOZnurNxuUx6r+Pyj/Mhe1M+9J+S0S5//+v+FXwYCfyNXbxbpA1lZ8Y
         H+cIvJC8Z3yz4qmaQKhK9DIKjT/u0aVcZknB5GIPU2odFWTaCoB3zaC2YrkErA2C3+9B
         y0ADFJX6VDLVX09thMkhzpkHe9fp+qkg/+Y7rh9MH1wXKKPBaY/j4+d90du4IHptPEus
         E7pIZGjjx4N3j157pUhEcGVCo2m4XmrfwVam+wRaa1wcJQ4HqKoYx9ZmKCyBe8ntHVEW
         S49mqIWgD6xpwpmTJAjacZELZ+qM5a6BW0GlHaw19lMpG5csE8mJPdMZn/CXxpNU1EIU
         RPAg==
X-Forwarded-Encrypted: i=1; AJvYcCUCII0dI591dD1SkrF5S9mo+IIf8CsjtAT3hZJ8bg+fB44RBQgiuZv+nTyFETOieOniO/ouUplkz4IxpAIC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk7VuzNBheAImJZ/67/YHOzX6sI/O217zAx72nvYDFT4EP9FLX
	CAvW0bjnsxa8gJPGrzjDhsDsbLvE6BbPeitlXld/4jDpC8h2r+nxn6aETgj72UhTehhVwUTPBSY
	vYFs4NaiGK9eqEebPOnNBdmfMyT9E1vpiTjmUZ5sIfnUnm4Vsehn+616DvRWbAyYTImCw
X-Gm-Gg: ASbGncuJkgF/h1fdZ5VX5Yzt1FYWIwnjucL8H48sPHGrsvzf8x5yg+x0YAbuq425QG9
	11mcXbj5qFG++c6Hn/VhczEB6hV6t3lax6vt5g4hzuZKJH+kLE8xsuOs/13mcliqEGnqjGQcwVG
	cI2KVmvBANT7uoDs4MZfIO57RTmvY4NkI51nBUElb9r3d5aTlw7f0uqRtwo4eQQas5tAeFC8VBj
	/W9kIs46sk71xsVRNc8aYTQUYkfdenc9mw4fX988u7HzCsOmHDtfzo86J16qhgI/8GpQMp9if7q
	4MtRj9bqBvkiq5b9QTNkFvd0Ypl/G+uq8fLgQbfQDRqUtnJVmT3ivIBOsi8mm+AXy5snxTlTQl2
	9Y/eNY/b82Mo8XBYeUgm5vrV4LM7cghTP1tucfa/J5pkT803JPeCp9r+G
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dee0 with SMTP id d75a77b69052e-4ee087ee233mr57007391cf.9.1763393758612;
        Mon, 17 Nov 2025 07:35:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCN8jMJkEs+s0FLri2omua4ZtiwgB/8YL6gNFMA7kDIuSsbIEkAvPGPFWPcHppT1bdBnJwIA==
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dee0 with SMTP id d75a77b69052e-4ee087ee233mr57006931cf.9.1763393757939;
        Mon, 17 Nov 2025 07:35:57 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80a5dsm1091952966b.36.2025.11.17.07.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 07:35:56 -0800 (PST)
Message-ID: <ff773af3-d843-42ff-b4dc-e5a9d85c2285@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 16:35:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add
 charge limit nvmem
To: Maud Spierings <maud_spierings@hotmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
 <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
 <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sXY4YJaiTfVS7dwmsVUgyU2YdP6r_9B4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEzMiBTYWx0ZWRfXxylRCxXeBbF/
 iR50vGtL75y2S5/ssEvTGe5/V7EuJgaJg1AyC6Pn/Ae+T4sccexV5UIIvidKWWZUit04WXTAEz5
 8uygyoE4ueVv71BCOxEDqcKedKs/q2EXFkIwdp8Ec3hcQoagjLiP4GJU2Q0Mp344MADEvqXmn8D
 bklP7hGtdG5IiIK2oXWRTVZ2u7mnMgbotcHTPc2yiEfknQfK5MakcS2/iw2qJuF7Fw8bGvQBiBF
 hOz2pHXTA61TJdFdsgT9HwonYbixpGbqu/t0KvwBnzBwUWGyjrrWQWGyYMz9nPqaR8t35w9KAGz
 t3Uav2oQWVrTafPmUGKWZ9Ww8SmfS25jyE2nGH3GHVZlXkk2/B1/6mP7T3/3utFrCDanLilGdee
 DpTKJ5xPR5KnM0eaDaGImtJDEnIsWw==
X-Authority-Analysis: v=2.4 cv=Cryys34D c=1 sm=1 tr=0 ts=691b40df cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=NI52xOD4TGehLKbkATUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sXY4YJaiTfVS7dwmsVUgyU2YdP6r_9B4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170132

On 11/17/25 3:13 PM, Maud Spierings wrote:
> Hi Konrad,
> 
> On 11/17/25 13:59, Konrad Dybcio wrote:
>> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>>> From: Maud Spierings <maud_spierings@hotmail.com>
>>>
>>> Add nvmem cells for getting charge control thresholds if they have
>>> been set previously.
>>>
>>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>>> ---
>>
>> Have you verified that e.g.
>>
>> connecting the charger
>> setting the charge threshold
>> rebooting to windows
>> rebooting to windows once more for good measure
>> rebooting to linux
>>
>> still has the settings persist?
> 
> Hmm I have tried several things but I can't seem to get the values to stick. I the spmi-sdam driver is compiled in, I am not quite sure if I might be missing something.

Hm, I wonder if Windows/UEFI overwrites these values or whether they're
used by something else..

Can you set a threshold in windows and see if Linux can read back that
data?

Konrad

