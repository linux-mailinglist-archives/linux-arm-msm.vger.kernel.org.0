Return-Path: <linux-arm-msm+bounces-66293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3F9B0F296
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F56D54252A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507BD2E6D2F;
	Wed, 23 Jul 2025 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kw4t9Y1Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB59D2E6D15
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275239; cv=none; b=S6K54Nb5kurNLD+UomneqgnRFFjys5WAVi6WN7r5TbQ19jCkcIFR3/sEztTn/rXaIHolRh248iVL4D55L2m+LrXM/biUo/d+hQMtbyPvi5g5GroRbRD6wUoordzjx1gqCOdHLXlTVpIlUqEhR32AAlkT81/neP4fVCQVDn2mCbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275239; c=relaxed/simple;
	bh=VTRcp1VTMiV6i3CbMwMf2kaNceHz2Q4ylRByMSISBVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SsTyAO/o42rrzRmHN3fIAJf9t5NE/ejaQMgMdPTyreBiZLJ7YMnNk0C4lVLZJs6CUFDKp0Om1spD4HzEuue1AR6m03DqjUanvD8ctPhAVZFLOHUR1oyXVyccqx3E/Kj/Bl8MJZjYH7qEWsiirkPhG7swQMzfXhMQy/PCp/CmTbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kw4t9Y1Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9l7Lg032272
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bhC1bOzq5nu+lwkwUdFJYYpeK+prCKxj+G/ecxWHB/w=; b=kw4t9Y1ZyqDsQQgl
	T07NJA89Jk+gt5SSXUCiJMyJSGkFZhZhUTGaC9elpiixOvEHWXzD5KSof8jiUkSC
	Z004/YIPKb3ujNC0fc+/GeIpp0wDuV867ZOxtQO5yulQRFM9ykz+aLO57XHBDtkz
	FYoJ2TZ1oCYwDPOtwbu3tabl7O/jmaSub6OGb8ETUTiTZB6m6YvZ2W8olYGArnDO
	VItycuaTToPoyg58RUse7lWx82SnaHtEmUx+zYUiS/SuUntKiMyfJRQMI1t90yMd
	DKNfayA29oO9BQj+WG65BRPkpcW+gS+eEbiIpnmDm30NKJ2wBdeYfzIAkpNeNixr
	WaDY1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1cg3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:53:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4abc1e8bd11so15892831cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 05:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753275236; x=1753880036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhC1bOzq5nu+lwkwUdFJYYpeK+prCKxj+G/ecxWHB/w=;
        b=tPsR9pI26yVr+NgrRTdQ6Cj/clHzvCAeUDa9Iwq54x36eLPYS9mj0McVJcfwA8rlEE
         B3EgkuPkWYE7GwgPbfrMJW4xhPMtrYXD0fILWPJ7xmvNJc5097Ocq/wX2NPR6LUuvEoN
         3b7jCu05Yvye5P29aUTaOdty2hayWxWkXyMBuZR0IAFDEIi3CsJoGKfR4+pl2+xqw8e7
         ZBf2sDb6ti/BOtB9oYuU2Fh+I5RD/0lcjTYGfJWgQuxcktt9HDwhekNoZSfdlia/o7b9
         inSUAGSG0pfY+AZrCdk7gZN/kzG2aQAw3xf7aUoLI2/zzswxV13+QoQssl1G1M3saGFC
         VbHg==
X-Gm-Message-State: AOJu0YwUZWUW3lQAsq0XusOk7k7ZztFWY5AnmOBw6sbfaRtTAypyshst
	SrYqAPSlx6D8YxJeVL/42mHKhTq2uRJ3EmDyynZYq5yCHmMkuopJh+wbn2w1tCyiPVy6Mo60ABQ
	SqnrgL2vEPKW8oZWvf3/B1ilg/llek7AKejpxlcTW8atgZFwJ/F8XRCRnVetxU3SSOYiM
X-Gm-Gg: ASbGncuFehtbf1lzaX9KFOpGaItuzI03yLfU88rPttRlYuYW19R/6ZfkHjOe0mghCR6
	ZTNlN/lyVnDnhiN4D6FBRYa7aABUjv6/mtznIfwZQo8T0MVxSL7CSZYxvRQaKfvX+z9C2hRZHMu
	Y3N8jk/Fz++TSWBHogAIqsZeb264JI3Hl9hNPw37HWClZgXkwW9xxlryBFZBocaiH22fcYuq1Wo
	ENBkb9beVxLrNwCNA8mdFuE1W9RNO/THe4iHFBVy+KPbYKuKBWSzX41sDtHBEdVpxHbNGqON4Ma
	4YnJoWHwHqIZa47JODX2bJj/UlFoM49l3YB3jvUFxm5tElkqxpbU8hgTV8XfsMoCRq+k0y/MeN+
	zFozEGqeC9kWiZHcrtQ==
X-Received: by 2002:a05:622a:114:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4ae73dc3db0mr8536881cf.12.1753275235819;
        Wed, 23 Jul 2025 05:53:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9FrftIZNFuA1VlRipYEhLNm+KiYop+21UNaYOB74muRIK+E29vDEU8fci4NUSLMV7Rtc9LQ==
X-Received: by 2002:a05:622a:114:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4ae73dc3db0mr8536721cf.12.1753275235284;
        Wed, 23 Jul 2025 05:53:55 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca315d5sm1049478266b.98.2025.07.23.05.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:53:54 -0700 (PDT)
Message-ID: <0aa2b07d-8c66-456d-aacd-c554bfa7664f@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 14:53:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
 <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
 <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
 <790fd85b-fb24-4d44-bdb1-706c534d1da5@oss.qualcomm.com>
 <d37879af-a1fc-41d4-8e31-2abba6fd6d57@oss.qualcomm.com>
 <d31c5e0f-dc50-4e7b-bd81-256269c82ec3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d31c5e0f-dc50-4e7b-bd81-256269c82ec3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cVPWLnTVy8UhngM4wtQq-QSELPlQmlul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExMCBTYWx0ZWRfX6de93rxlbIiI
 Axvelb5kkmTSFKgR4pKvopWnxae4bMj+8Qxwek8U57zlAgS21lqpHdxmE7NcROgcNGZU+ysyn5E
 TZfl5LisaP9QVmkaOPEwACgF/ukofXxigrODmpx8h3uKB4i1l2cYBEfGODip1nURAm7/BplbKpC
 ND06uuqlyw1QFsgSelMQ/Ry0dUu6T98Y4d4h1Q5Uf8NkDP9O0iUPUSfX45GNtwY/R1mdMFt/1iq
 NXk1p3Jp+Hn4hAn/Ofh170DLKfb4Tu8Hd23EP7LFQmTyGbuFdeiFwQVlvJ0ihuCReV/WETOCrce
 +a4V2+E36CBZ+xaIdbb1uWphLOmvx+oRCI7mOEjcxeHaZX6r0KwudltjztZJJZPYp7oe+Hrq6SW
 T5e3LVB39BPHGWicLQKB1yGDouLfSOx42Ab9jIvAyF+4OXn0A0BIdux203d7i2o9mcqZVm5F
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6880db64 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=t1YaTaKddZwQxTEmLl4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cVPWLnTVy8UhngM4wtQq-QSELPlQmlul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=897 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230110

On 7/23/25 2:07 PM, Pankaj Patil wrote:
> On 7/23/2025 5:25 PM, Konrad Dybcio wrote:
>> On 7/23/25 1:48 PM, Pankaj Patil wrote:
>>> On 7/23/2025 5:10 PM, Konrad Dybcio wrote:
>>>> On 7/23/25 12:36 PM, Pankaj Patil wrote:
>>>>> Add DeviceTree binding for Glymur SoC TLMM block
>>>>>
>>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>>> ---
>>>> [...]
>>>>
>>>>> +      function:
>>>>> +        description:
>>>>> +          Specify the alternative function to be configured for the specified
>>>>> +          pins.
>>>>> +        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb,
>>>> Any reason for           /\ to be uppercase?
>>>>
>>>> Konrad
>>>>
>>> glymur_functions enum members fetched from ipcat,
>>> this does not exist for sm8750.
>> I'll repeat my question
>>
>> Konrad
> It's in uppercase because of the way it's in the driver,
> I'll update only the bindings to lowercase and repost.

No, the driver must obey to bindings. That's what they're for.

This value is only used between the OS and DT, so it doesn't matter if
the docs refer to it in uppercase, so long as you keep both in sync.

Konrad

