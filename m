Return-Path: <linux-arm-msm+bounces-74006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13E8B82990
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 04:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4FA27B4244
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 02:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533D317B506;
	Thu, 18 Sep 2025 02:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brPPoXq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68B810957
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758160896; cv=none; b=qjwAqcHBastcTRhyHMR/S8G8hfDLuGhuw98pXhUdps9/jcijfKr5zDWPW/SSKgzCLEWTZaBhrS7PMTLaClaJbxej0u673Coo0U8E/3UdgvqnBwYkxvu0uGbytWWZMT+N2qMrYzjr7eCRsChN/Ha5AzSqB5lr2p4pnfofGy6Gicw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758160896; c=relaxed/simple;
	bh=SBfy2aw9l6QAYSPL+WFnY56ROXf3Voafn/xHOw0URfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCHKMPdSmNYfq+PTWUSOSDBAr5mYcgGmY669n07fMaYx/leaz421DoE1YVrNjsdPViyVNKjq453Zi8GSyJcWuZD9b//h/GKZkdFpyh9VGB9GrHomjWnMvFYjUtrTBFRtS33n93SNIsqH0xZQDvsrvbCYkgQcw8dpCGjHmnjoeJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brPPoXq0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HH0gLf010746
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eb6fb+UFN97UGMhPu3oieNOs4MieyvfsC2uXdQt5UHU=; b=brPPoXq011Xz7v0W
	Z7MEOuMLXKxd7tIuEU8x7Hsy2PVC9+ToyER8DPumFqmbYCl8hIAcPPJczRWb6+90
	6lXn9cnrIOwhPFsUpXkRwiR8oJ1gYki1NnqrYekjCeeDeNkrfrKcwrXdTlGpzgVn
	ABb46/ZaHVbrCEsPDE+PhmWGjdtuKr7zv080lBNLS6X/3/x6SiwtLop5reKOXmQM
	4TEhevZWhLy0rGfwm/ZH/FUWrZbRvR1lSSi+vXKRgtp71RgFmyUNUDyZPTM9Vggi
	L9ZofDgB8tXTCBIJknApxw2HnFnuciLYF2hbP14yTvyOmYNxnDcfTNz9wr7Dtpz4
	SmPJXA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxvh1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:01:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77b73bddbdcso478499b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 19:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758160893; x=1758765693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eb6fb+UFN97UGMhPu3oieNOs4MieyvfsC2uXdQt5UHU=;
        b=sjGPyHxhwCYKc1VsTiAmB9nlYvjXxmaXU8ageVvXD4pE05Tek/sxFFm6WTdVPwwMIa
         quhtkuAmPxAaTmNKmO0aza3PrBiFSKDP0hVZ28N6RMk+u14WAx6maS3fnQwe5z3E8CLe
         FEPCvEvYjc50eApyVnODNfJqzcUCNKAufVEAwr+zNHbTImGaKUGksJzgA/zIx6b5fRGn
         XiqF8vrJAGHYFmWLM1QQfbdHbg50d0Ax4sdxqHnf5frmc7/92bm9vG3Of9u++5U6dV6a
         6jjC4i9rfQVTJciyeBJiaPMIVOcKkvgsUqhaRlWXqj6V7MkRkiqlTR9muLElzXG22wol
         ZLog==
X-Forwarded-Encrypted: i=1; AJvYcCUsRODzk3i4R7teS04kLlt2CgeEuqcnjeeeau6O0c2LNIY9DLuM0pQjbiENbtRCqckJuoXueuq62tdrWGN7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Lav/A3ORbTGHa+4CGOEO+tpYDeH7t7QtBdkPbpCK6VkYektr
	XZz9SMYujIn+xPHtJS4nTukM68rfNc5P5jS1Z5mCJsmTgxf/qQALTWY3jHdi17yyP3bW7etl2ZX
	K15qCWFVwvRdhvJZuzHblOCFfJe8HFeanNph4UF10uPplXmSEN8qXbm26NfktANNkF4jF
X-Gm-Gg: ASbGncuhvHFj2C+FeEpIStcxJlvVH6zETocEz+o9YFKyLiuMvs4jbNIjw6wXY7M/fOj
	iDJYKOnEHE+h/QpLoSN+adfb4axT7ECW+oEJLPSuqSc8SWWJBVUTU6ShaKGILuEvoWaUjBHsZi9
	HwYgoEVvsXOfIEOTwOUdw2fTzVZerYyB3XvdEDnw2HQ7ewAPocnpnpFY00ZBRph8uL9A+1ztpwU
	w+VcNLEmbgBpEeGRmywn3JnNbHfhl3Uh+nGsvTQPlJaYGVji/LgPuEKnzjkXil9c934LqsFE3D/
	lutwWEHxlE9mVMJUl0psTaimdkQ956V/ZwfS+1uSjcQrwuTqLXkl2X0jD0o8J3VAxA==
X-Received: by 2002:a05:6a00:3a1d:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-77ce08f3559mr2056195b3a.6.1758160892867;
        Wed, 17 Sep 2025 19:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzPSMD+5HGPO/cxrBCgCsxRrR2tgIDSepWt3elrwuhXweOPyoaFCCEh+2YZA14TET9o4YWpg==
X-Received: by 2002:a05:6a00:3a1d:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-77ce08f3559mr2056145b3a.6.1758160892313;
        Wed, 17 Sep 2025 19:01:32 -0700 (PDT)
Received: from [10.239.30.180] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc24b4f6sm703065b3a.37.2025.09.17.19.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 19:01:31 -0700 (PDT)
Message-ID: <d9db8b82-9000-478b-a7b5-93792f1e1bea@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 10:01:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] power: supply: qcom_battmgr: handle charging state
 change notifications
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250917-qcom_battmgr_update-v5-0-270ade9ffe13@oss.qualcomm.com>
 <20250917-qcom_battmgr_update-v5-9-270ade9ffe13@oss.qualcomm.com>
 <fa258ad4-1efa-4fe8-9636-d70c5ea9c8e1@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <fa258ad4-1efa-4fe8-9636-d70c5ea9c8e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX6R5c0EH3H9jh
 udUfBnLz0Z+4nvrPoaYR0H14DuWvjd4IHFK0DghWiihPoW4jeLKUjfmswhf72PBIkra4qqfYvJ+
 Kf7V9fev+2st82/9++FrjECCEq3D7+WUQyNdy3Jq0WCLQZRi3AqAtRmWFfcz9SIRjDH7DzaFCEJ
 vMMzjafgwO31HOzBi6reD6B/QJp0l9HLRHJjwulrkMJmNQ1mczuMO6AD8Fa8FwNXtbkl7Ud4G8m
 ld8EkazM4cCnJBTVnaWg2jxs5Vs+jXvZNazyNXUu54ACQWUskx36Sxk7fiKl8h+h24WszagyVRQ
 GmZIrqXLDwrTaQK5UHrr7xokKrYl8GmubK1yiZSWfT3FnDDu+xG1EyRYa27rz8hUC3Jcca61qXA
 gft967kJ
X-Proofpoint-ORIG-GUID: 9M-MmrQdlsvk71jgR8MU_7e5_QR6P7mu
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cb67fd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8
 a=0T6ucZLnF1w6DCYMrR4A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 9M-MmrQdlsvk71jgR8MU_7e5_QR6P7mu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202


On 9/17/2025 7:14 PM, Konrad Dybcio wrote:
> On 9/17/25 12:15 PM, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> The X1E80100 battery management firmware sends a notification with
>> code 0x83 when the battery charging state changes, such as switching
>> between fast charge, taper charge, end of charge, or any other error
>> charging states. The same notification code is used with bit[16] set
>> if charging stops due to reaching the charge control end threshold.
>> Additionally, a 2-bit value is added in bit[18:17] with the same code
>> and used to indicate the charging source capability: a value of 2
>> represents a strong charger, 1 is a weak charger, and 0 is no charging
>> source. The 3-MSB [18:16] in the notification code is not much useful
>> for now, hence just ignore them and trigger a power supply change event
>> whenever 0x83 notification code is received. This helps to eliminate the
>> unknown notification error messages.
> Thank you for explaining the technical background.
>
> Please hit enter somewhere in your commit message, this is a very
> long paragraph, making it difficult to read.
I just realized I made a mistake on the bit position, it should be 
bit[8] for reaching to the charge control threshold, bit[10:9] for 
charging source capability. I don't know what I was thinking when 
writing the commit text :(. I will correct them in the next patch.
>
> I believe this maps to:
>
> 0 -> POWER_SUPPLY_CHARGE_TYPE_NONE
> 1 -> POWER_SUPPLY_CHARGE_TYPE_TRICKLE
> 2 -> POWER_SUPPLY_CHARGE_TYPE_FAST (or _STANDARD, I see battmgr code
> reports them both as 2)
>
> However, we already set it to none/trickle/standard(taper) based on
> the usual notifications, so I'm not sure if these are more common or
> arrive outside the normal state changes - if so, perhaps we can take
> them into account as well?

This is not related with the real charging status. I double checked in 
the battery management firmware, it is checking the charging source 
power capability by multiplying maximum voltage and current reading from 
the PDOs. Any charger adapter with a maximum power below 60W is 
identified as a slow/weak charger.

>
> I think it also warrants a:
>
> Reported-by: Sebastian Reichel <sebastian.reichel@collabora.com>
ACK
> Konrad

