Return-Path: <linux-arm-msm+bounces-68950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1637B24697
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87F13887817
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 10:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99EF2EFD99;
	Wed, 13 Aug 2025 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npqVpoSu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5C7212559
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078497; cv=none; b=bND5pz4IIW2QRQv30SZTp7vx36BLbTMghsFZpAVJfqBVLeZkfhtgOsmS10sk02bFPrZENfimI9qdPzuBz8pBBw5mDvfnOL6fCgnDup6i4BzotbftE6XzxuMnVI72CMN+suDD7vI92yLUqREHo/HTJZfoysmNRQGHbZRY5sNKASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078497; c=relaxed/simple;
	bh=yprNOnxZZuuTMVw1H12F4Euaupw8Ojw88+nk0jQgJCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1ID0RjEPF4jGmjJsZfdQYTa3TfOf3VQJ1qjtO+I4GT06Lbm73Celrh+mpG9u/cn2kK89AvOqHvsJq2p8PxXtVzVS0QzUvgwyoRdJyqaI50yhSorwdDVe3wwp7rDslIQL9Nx6ifnnK9ZYfcFhV1dcierYNRcUDu2fKtLRDCqwh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npqVpoSu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mY6M030463
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 09:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yprNOnxZZuuTMVw1H12F4Euaupw8Ojw88+nk0jQgJCE=; b=npqVpoSuc3/mcQwb
	NxvamAK6aRMS3QzbpmZYoBmNRHNRfNb1Z6G8NqrtlonqqzVNmIvykXeq8h3i+xpK
	Jyw5RBAXxbRuIiO3SA3LYq6L/kOyC4ogSY19J4EfVozr0oXHIXNYA/6+FVOro0iR
	Fk4cI8dEym49x0nypFWxplNqPTU+kSJOvOQ7PdcPRcZryET53rDbo2KVswKIfw04
	l6XvLQ+BcqEfBhBNGZjnxW0RwpXkmGtkUYdCSpBnm4EOwB8N8fmyCOUPvM+wSHKV
	63inInnlI4AAUa0Bjvlp86v1XorQhAvZua3pEra75Xlc+ScQsxK7D47IVeYVyP8/
	Q+XRvA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9tdjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 09:48:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bb326ad0bso6512734b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 02:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755078494; x=1755683294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yprNOnxZZuuTMVw1H12F4Euaupw8Ojw88+nk0jQgJCE=;
        b=HI5l6UiWVVv58yK6G+B1xj2LTyY53sH18/jtnX70nq9M3ckhDmy6f7l3KeU2voNm0J
         RS+hJK0qXNj3fVfXs0gXCOHL5AyNsS43gkTcisMTupUVi8qEzYFK1NxJfhHz1SkG/LLU
         sYSyPGCqYNCoW3K1D2/647z9wAIZhVDaZlLM4JH3Pe1kOxXDGgCF9ZPa+jAEKp5K8acU
         mBu3JeqNR83hEpuCJncXBFwXPldEgwDWZbVKyLZb2/GAGHAX5CEVvPVB7I4AY1uube9L
         dfGeF59cRTA4FBGakO9DofZF4lDMgtoWOwAlA6U7LdCo5mbmxsRApNiOrVBgo7JxBUSp
         iQLA==
X-Gm-Message-State: AOJu0YzfiBM0X6fQfkQ7zDHkc7ra1SMEHOLS7QJJ1PEvCeB2izuiz6YV
	a5xO4MEP6zXophspWm+EbvgpjemBblO55tpstcX7rhGkKMGuyb96b01yetBLy2rq7Ake5UoxYx1
	m9NRuf3sqRoNgqbeuqhiz8DyiOb+dn13E0tivq8uulF5h1D6aaheyQBp0Z8VIHjOXmMxR
X-Gm-Gg: ASbGnctE/zPk9afmB/RQ94hi0qAFKXMOsYlkB/u5gjVDJvwQPjidNOW84TDo74CvmCM
	MUwB7tUKfQL+JD4tSPeRwQN1Y0EksIPjJ4wvARrNm8iiubIradBbpRQyVrNmLIvJ/8/CtXssZLo
	OuBVbeWHdpglZdLORyev29HHvQlGUT9RWvcqAy/zbzkOSYp03DOgSElOMiQnc5Zd46UgyviQW1l
	8cX7zcCXoA4omNRyuXZn8MrP9OiDTLPBLsq3JtBzXN1HSYS2VAZv1CObhXiwqrxBtlRkgm77Axl
	IF/H7HNLUnByM/dLjBu6lACajS7SyyiNZRqjH7yNnHHVR5CF8HR8CH6IlgZqSWR9O9H9Bl0c/xC
	C9Z93lsVfSoh6y5u4tUA1n+psyrZbsole/nR3V/ygfYCffFZrWiAPOg==
X-Received: by 2002:a05:6a20:5483:b0:23f:ff7a:4d69 with SMTP id adf61e73a8af0-240a8b5e283mr4270073637.40.1755078494465;
        Wed, 13 Aug 2025 02:48:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQi28wBETX/FfzYkh9vYqVOP0sSfPKuwwUYnt2NYefL8rquOBU1sF704aafnQm7XBD0r47EA==
X-Received: by 2002:a05:6a20:5483:b0:23f:ff7a:4d69 with SMTP id adf61e73a8af0-240a8b5e283mr4270038637.40.1755078494038;
        Wed, 13 Aug 2025 02:48:14 -0700 (PDT)
Received: from [10.190.201.48] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bacbb74sm26978433a12.42.2025.08.13.02.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 02:48:13 -0700 (PDT)
Message-ID: <1c27e30d-9d99-4348-a92b-e9fe86d0c339@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 15:18:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
 <17b90fbc-ccce-4eb1-b334-5fdef82c094c@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <17b90fbc-ccce-4eb1-b334-5fdef82c094c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689c5f5f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DNT5GobofFhSdjKMTB0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: imw3UZfj1PALVUBdnvUnf_9Khe7V3eLm
X-Proofpoint-ORIG-GUID: imw3UZfj1PALVUBdnvUnf_9Khe7V3eLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfXzSMaosJkoxcE
 Io32qc5tEfZW6Q1Rf5dooN+k3wUbpFbsN0kOoRcQ2hNNelZya0azQwsMqp2kQrT8hT9x8uqZLmU
 7+T2kp7buZP+pDt+tprZVrg4XWgvfATM2662A4UI8tQAAunBkJu5VR+5sTsR1keHz18ekz9UBMX
 gIhIEU0nNCZTErsQ6msIGlGwDSZf7JvU+cNycC2cz8Vp9tZql5jPSdV2T6sbXYDIN0XhN7vD8yQ
 UOsNuWdOE7CafXM8M9TKbx5zvV43p6XvmfFpDsFnP3D3E5q1FlHAiZwi3xfHfchvlzWPD/YQr3E
 xx7QqPKFsgQC8pFkpkFk1wKJS5B5gzUF8uVYC2zPZufrQa/uyChvS2BtdFAXNucsEM00JF5N9Az
 +jCTcdyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

On 8/13/2025 1:01 PM, Krzysztof Kozlowski wrote:
> On 13/08/2025 08:55, Pankaj Patil wrote:
>> Introduce Top Level Mode Multiplexer dt-binding and driver for
>> Qualcomm's next gen compute SoC - Glymur.
>> Device tree changes aren't part of this series and will be posted separately after the official announcement of the Glymur SoC
>>
>> Changes in v5:
>> Rebased on top of v6.17-rc1
>> RESOUT_GPIO_N changed to lowercase in bindings and driver
>>
>> Changes in v4:
>> Updated bindings to column length of 80 char
>>
>> Changes in v3:
>> Fixed indentation for example tlmm node in bindings file
>> Fixed s-o-b and review comments in the driver
>>
>> Changes in v2:
>> Fixed dt-bindings error from example node's reg propery
>> Fixed gpio-line-name maxItems
>> Driver UFS_RESET macro updated
>> Removed obsolete comment for pingroups
>> Updated ngpio to include ufs_reset pin
> Where are lore links? Why aren't you using b4?
>
> Best regards,
> Krzysztof
Here are the lore links for the old series, I'll setup b4 from the next rev.
Do you want me to share another revision with lore links embedded?

v4:
https://lore.kernel.org/all/20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com/

v3:
https://lore.kernel.org/all/20250721163221.310746-1-pankaj.patil@oss.qualcomm.com/

v2:
https://lore.kernel.org/all/20250721143037.20983-1-pankaj.patil@oss.qualcomm.com/

v1:
https://lore.kernel.org/all/20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com/

Thanks,
Pankaj

