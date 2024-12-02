Return-Path: <linux-arm-msm+bounces-39905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147BC9E09DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 18:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E62DB2ABEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CAA1FECA2;
	Mon,  2 Dec 2024 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzDX8qmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F053205AA2
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152197; cv=none; b=dEuw1FJVQqDp7fghq+neiwjWkKyUGtwPLD8UrrU/b5uyZcHLAqcaaPFRvO0mTBRhwO10poEDa8xakwQLYy5vr/bND7IH3oYTsnm/QjV+KS2KL27dYuoKZ3/BwXvRN8lJHoiNj2zFg9LY6LqZyADoimv+rOQ1QgCjLpFQc46kpas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152197; c=relaxed/simple;
	bh=ae8PwlwQUZdOmIPnzmhe75h7esJR91bhpoYw7EgyW20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EX5sxMbxmokKaS/fRzTMfJNYBRZ6TV1bgOITfIFk/w5I+SY4v15uy7Kq75MpAdh39H8DACl6+qwMnECMnaxrCOijn0ApArJeRWnV7OFZTY9Zu62VzV/KbpggD6VyAJ3jNu3+2GwlGVd87CIm3z4/d+x+eeI9l76oha5m9wrOnqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzDX8qmW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B29aQZ3011526
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Dec 2024 15:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8rtkoC7IoWsX5kh1U40YLnQo/GZ7NNXDue2xrV8R5M=; b=mzDX8qmWZUfhY/E7
	MK4rTcUuGk1zKqpIhpKQLvN6Ts4YoZsSLQjVhH4ilhi3voZA5UOzl2T7SUFJ2fgS
	D13qN3kJnGQSePXXP2Ul4J6V2acDsGYcVCQh7Vtk/Xd7OFiFw37boyRK59j78/S0
	lpJcd6zivPQ0wUR0jIcBYJ+Is0yx16f0GmtnuigyfPFC8a5wX4zM5nV+gKnTyvw8
	EYfCtpq4cnj+zNl8Rz2x0KvW6CluioT7Eobv8GOXm/x3FFTObwAjl/C9nI5gxF7F
	7OoDvtUXRQNkbWfjPGGZ/gifAN9UxJiHmhWoYEai/yuJs+ctK/TTkE1hBzS5XyEC
	dExG9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mpa375-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 15:09:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4668c9aa8c7so6809391cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 07:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733152189; x=1733756989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8rtkoC7IoWsX5kh1U40YLnQo/GZ7NNXDue2xrV8R5M=;
        b=fO8hywsjgllUtrJDzAfxqRl3RBtWX2V0jqyl1BHIa6os6SYIf0Nc8/1wLvtFpP2I1O
         9hM9+tEuEtJXyeeOCJwjPIt8qprazYYnWeAPHyZmlOWuYiEHmfKEOsdb2XiO7kWOpb9v
         rDo7e9JvMICNrS5qhWL1soDa2P9a2H6UYXqr3Z8x/U5wyIQUpyN5S7riNgoqc6C/sYLs
         rXo4dFELF4+fMwJ10Vj6M7MchpdD5Bdwn5UGHTC8aKsXi9z5jWKL7oWPPH3jm6sTbrNf
         gdrku/H6cyvO+/rcpyppV7s1vwgXFjQ72cE7sKlCy4DZyaKrqgMqX0+pfTGikUKAckBD
         bDRw==
X-Forwarded-Encrypted: i=1; AJvYcCUDoJlZTx5/DU8yLSNpgWmhri7UkFuFb7Zfw4RKnOouhLHFwRG9tZI/dNIR6VqPHniQJN7zSTrElzDZNFH8@vger.kernel.org
X-Gm-Message-State: AOJu0YzyTPwl6qmwNQ3tvL2inBfHdhDQV+2/eA0i0TP0/G/w/vG+oR4c
	bVD26bJO9+X+svk5xUgrGAEMvyKADYV43ZPMcsRF2gS4XWOmFZ2WEQHd5nMaOMsF6nOzOza/14T
	pUnHk8SuJ4C/5tX1S3YQ2NT/O8E+raliikIxY9U16V7zT1T9YbaTQ+FvTAkgVPh32
X-Gm-Gg: ASbGncuxeXfiUo8FkdIOobUPCeqBYlRwaTgpySOmvBfYI3EwCwQ4pFIoKfL4rnq3zTq
	yLkJTaiZVDy487MRHpcG8E+DAxz5goCohRuWNtRjl3V9blkayGs+f3/anwApT0SliuX76SjM3Pb
	5V9ddzaBvU4iTY6xZp+pRTPH9WqWtJlY6kIbu3JgwN2ccKx7GAPExV3YIwti9Qyg4gx0fUdBiA6
	OiZDVslaXKxQXGcw1FvpeVndhd6EKC558vl9XXBo6Qo2fAu9Na0LT4V4f+A3G3T49rADveLWDXX
	0qm0CCojJM1jv7M4BW9bA9Dm3lvTgro=
X-Received: by 2002:ac8:59cc:0:b0:461:7457:d802 with SMTP id d75a77b69052e-466b365413fmr151241981cf.11.1733152189206;
        Mon, 02 Dec 2024 07:09:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/UefXnRbY7jKsFl43YZSHx7rlg9ciKbQkw2agZYp6ql3NLaAm9aMmD6grY9kIrV7OucIpIA==
X-Received: by 2002:ac8:59cc:0:b0:461:7457:d802 with SMTP id d75a77b69052e-466b365413fmr151241651cf.11.1733152188674;
        Mon, 02 Dec 2024 07:09:48 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0b931128asm3777116a12.50.2024.12.02.07.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:09:48 -0800 (PST)
Message-ID: <df3e3989-f588-4e53-b6f3-bf8c36330911@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 16:09:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/12] arm64: dts: qcom: sdm845-starqltechn: fix usb
 regulator mistake
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-3-5445365d3052@gmail.com>
 <33e14868-e6ee-45ca-b36c-c553e0dcfbef@oss.qualcomm.com>
 <CABTCjFCTggnU7UvqcKYq53iRLACBxWE7C1TKRi7dr42o-=0Mqg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABTCjFCTggnU7UvqcKYq53iRLACBxWE7C1TKRi7dr42o-=0Mqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GYqcKI93eF0DVlWIdoPkvm5TJgTBYOJ-
X-Proofpoint-GUID: GYqcKI93eF0DVlWIdoPkvm5TJgTBYOJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=768
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020130

On 2.12.2024 2:41 PM, Dzmitry Sankouski wrote:
> сб, 26 окт. 2024 г. в 13:41, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>>
>> On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
>>> Usb regulator was wrongly pointed to vreg_l1a_0p875.
>>> However, on starqltechn it's powered from vreg_l5a_0p8.
>>>
>>> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
>>> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
>>>
>>> ---
>>
>> I really really doubt that the supplies for on-SoC PHYs were altered,
>> given these regulators are assigned based on their specific characteristics
>>
> 
> From rooted android system from klabit87 on starqltechn:
> 
> ```
> starqltechn:/ # cat /proc/cpuinfo | grep Hardware
> Hardware        : Qualcomm Technologies, Inc SDM845
> starqltechn:/ # uname -a
> Linux localhost 4.9.186-klabitV6.5 #1 SMP PREEMPT Thu Dec 10 19:42:53
> CST 2020 aarch64
> starqltechn:/ # cat
> /sys/kernel/debug/regulator/soc:rpmh-regulator-ldoa1-pm8998_l1/consumers
> Device-Supply                    EN    Min_uV   Max_uV  load_uA
> ae90000.qcom,dp_display-vdda-0p9 N     880000   880000        0
> 1d87000.ufsphy_mem-vdda-phy      Y     880000   880000    62900
> ae96400.qcom,mdss_dsi_phy0-vdda-0p9 N          0        0        0
> ae94400.qcom,mdss_dsi_phy0-vdda-0p9 Y     880000   880000    36000
> 1c00000.qcom,pcie-vreg-0.9       Y     880000   880000    24000
> pm8998_l1                        N          0        0        0
> starqltechn:/ # cat
> /sys/kernel/debug/regulator/soc:rpmh-regulator-ldoa5-pm8998_l5/consumers
> Device-Supply                    EN    Min_uV   Max_uV  load_uA
> ae90000.qcom,dp_display-vdda-usb1-ss-core N          0        0        0
> 88e2000.qusb-vdd                 Y     800000   800000        0
> 88e8000.ssphy-vdd                Y     800000   800000        0
> pm8998_l5                        N          0        0        0
> ```
> 
> I also downloaded kernel source from Samsung, to check its dts,
> and it also powers qusb@88e2000 and ssphy@88e8000 from 'pm8998_l5' regulator.

Interesting.. could you try to forcefully shut down L5A (I doubt you'll
be able to do so with L1A given it powers so much digital logic), or
set its regulator-min&max-microvolt to a way-too-low voltage (vmin
seems to be 312000)?

You should then be able to tell fairly easily, depending on whether usb2
still works after a replug

Konrad

