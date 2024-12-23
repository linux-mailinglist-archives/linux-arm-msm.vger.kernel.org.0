Return-Path: <linux-arm-msm+bounces-43123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0C19FADD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 12:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AECCE16431F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A9F195FE5;
	Mon, 23 Dec 2024 11:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpHhz/uv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260D418BC19
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954417; cv=none; b=s4GyDTy72NVxQARawFI+58LuGJPcu06LcG37XR1j1T3ev+k24ilhcS25PnYoNv/aYgIqhMC4x7oCr7VJCAjUPDX5h98FGR1EMDYX9V0BbN3+3zRzr1hvUxUFImMbGuC5Qf8pCjkuBB1Sn3XEzt3kijaBWVYx5ZJ95xTE1/iIp50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954417; c=relaxed/simple;
	bh=WoNSE/sE5fC33uSU/9fyxT1jw2V0Oynfwszs7Z6IVwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sx0TGGbNesKJuAG/Uw6WmdvoqzF2WyuQg0m/Ejfods1By7IVR0dTIEaKOXv2IH3FwfPDM0ab3eU96Hgj3eBNIxkHJUOi2ISS6xAjIq9aPwN44pMcegHkxjRj+q2jtdfYtqEZ+bwNv1CPQkmzcwa+egibDBYy/Ui1dvHK1PCUZVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpHhz/uv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBVYOw002763
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3B4oWFzJNbqUipgeIarx9O0ibUhzHvQuYbYMdgwP1o=; b=FpHhz/uvwWgLvlHd
	E+D+I6Je46lMUesJcQdY9+eN9g/8+m995xQQG9SWhvL5CDXHtFeluwF3lL+hBzKx
	PZmGJ+UhGkhQbbjrhKTY8N0bYWgt9hxBkA7efJNmulgvV9xfNE3a5MI+bkLB2EBC
	M6rIBU4YM0ui7uVMS1LJmsaeqIXQpCnxnEshm9oEj66vQDr8PoMGQRPnJj4cnxvh
	Z+pa1RrixzILK6PqI+2Sme+/w/dLsFgD3a6b33S89gXsi+mNYCpWip8QMkg29BFY
	FdZLnj2+37l1D1WlU7UKEXQgJ/uNTmEV26++1DTASH2nRCNeYdYoV1ybfBjY5KCT
	0M+YTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q72mr10y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:46:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6e43ed084so54358985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 03:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734954414; x=1735559214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3B4oWFzJNbqUipgeIarx9O0ibUhzHvQuYbYMdgwP1o=;
        b=veOEi3ZyW5tS/rohOHyVVHMCN2X1t7p6pDLmeJj9T+5EmIGW8cTx0QC8MpVgogByom
         1qTbPaUlZyzvRmghWJtPTcuk03jvE4TFsdHbHUEgMUIXf2J858s6CSkYYOb2K/qUIFct
         VspWLZI71XI3doCO8iaMRW3LnbkuIjrY9nsuYIMh/1mDvBEYlQLVtyplnBr/hrUo1G/X
         Q25SSHhhm5LOUVv0RaP7lFUvqjsnJb1DDjEi6r6RexnT0ZR4sKc91BVrzZFmic/TxwQR
         1olzO/UyhCAs7IUpJEjvwWn/gYpr0cXb7njSSvxERHmJxM9M9oegRieTPZza9CAM1EzL
         C1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUgL4DPcpKqeR0MFoMyCKnma1QEvIfzeVowUQhVQoqS/zI3D1hE7epIeiT8sEHeofMEZV0t5thU5w84mN03@vger.kernel.org
X-Gm-Message-State: AOJu0YykXZFjsrtED7Hg5LnELzDkV3c/WaX7ym9SMtBknNeN9pri1v8z
	K1IRulDVKueF5+ZtkMnHNgFTHUuQDzA/KcpPzbif9QLdmLwIX8GlDRlXHeIGhvxaO4tEcvYqgHf
	VYpBmmTH17Hs/19NxEm44kxypOW+ChRFhqoh/zrmBTruuiFvOBM5SaU7bM411WjnS
X-Gm-Gg: ASbGncu6FG6jJozHsuGVe32+wzvieQ4OIIIdhU10UL9hfOikLXfJWiqloi9HvHxZ5wK
	faiRAgujd31ollCvTx6419dyc4XOotwSy4WMHyTjJn7Sq4fCc7//I7PzQz2QDCV1PXWDVzUiLxy
	k4Vp0H4/x3v4poGK+Ib8n3erFK/Fo8QfaZQVv/8aamsaZw5/BSFJAxON9QMxT0yooSxak8zOTOQ
	cvRqMzVY4yktYWcqBVW5/s2DCCKNhNprPy7tW2FCnDej2XpPIrzQC8Xp5Skax6AcX6OWktoLt3q
	Lny+PPCm9Yw+GteCRxsicJ1gg/IXQD0qcjM=
X-Received: by 2002:a05:620a:2a13:b0:7b6:da92:fcd5 with SMTP id af79cd13be357-7b9ba75c089mr709412085a.9.1734954413913;
        Mon, 23 Dec 2024 03:46:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNZDOc8mF9qHhiFj67lTcN+JTELVHiDCWwHoBDaAnJpVE8Z7J/DHYM1IQnlLkKvZX7HuEaXA==
X-Received: by 2002:a05:620a:2a13:b0:7b6:da92:fcd5 with SMTP id af79cd13be357-7b9ba75c089mr709410985a.9.1734954413501;
        Mon, 23 Dec 2024 03:46:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f192sm4984127a12.35.2024.12.23.03.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 03:46:52 -0800 (PST)
Message-ID: <89d308d4-8565-4e60-bab7-94474dae3b55@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 12:46:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] Bluetooth: qca: Update firmware-name to support
 board specific nvm
To: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com,
        quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
References: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
 <20241212150232.3823088-3-quic_chejiang@quicinc.com>
 <94eae703-ed9e-4f57-9786-99db7aaa07d1@oss.qualcomm.com>
 <db516034-81de-4e41-932d-c1bb26e1c55b@quicinc.com>
 <d5fe224b-7ef5-47ae-840c-7b6df21da816@oss.qualcomm.com>
 <3a8fe16f-aca7-482e-b1cb-e6fa37717843@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3a8fe16f-aca7-482e-b1cb-e6fa37717843@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4Gk9aqLsvef5zhlnqqRzUkDqhiFMK0SB
X-Proofpoint-GUID: 4Gk9aqLsvef5zhlnqqRzUkDqhiFMK0SB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412230106

On 23.12.2024 3:47 AM, Cheng Jiang (IOE) wrote:
> Hi Konrad,
> 
> On 12/20/2024 9:46 PM, Konrad Dybcio wrote:
>> On 13.12.2024 8:05 AM, Cheng Jiang (IOE) wrote:
>>
>> [...]
>>
>>>> /*
>>>>  * If the board-specific file is missing, try loading the default
>>>>  * one, unless that was attempted already
>>>>  */
>>>>
>>>> But, even more importantly:
>>>>
>>>> a) do we want to load the "incorrect" file?
>>> Normally, there is a default NVM file ending with .bin, which is suitable 
>>> for most boards. However, some boards have different configurations that 
>>> require a specific NVM. If a board-specific NVM is not found, a default 
>>> NVM is preferred over not loading any NVM.
>>
>> So, if one is specified, but not found, this should either be a loud error,
>> or a very loud warning & fallback. Otherwise, the device may provide subpar
>> user experience without the user getting a chance to know the reason.
>>
>> I think failing is better here, as that sends a clearer message, and would
>> only happen if the DT has a specific path (meaning the user put some
>> intentions behind that choice)
>>
> In the existing BT driver implementation, even if the rampatch/nvm are not found,
> BT still works with ROM code only. No fails, just a warning in the dmesg. For this
> new approach, we use the similar logic. 
> 
> The fallback to load a default nvm file is due to each board has a unique board
> id, it's not necessary to upstream all the board-specific nvm since most of them 
> may be the same, the default nvm file is suitable for them. But we can't set the 
> default nvm file name in the DT, since the platform can attach different 
> connectivity boards. This is a reasonable way to approach this. 

Okay, let's do it this way then.

>>>> b) why would we want to specify the .bin file if it's the default anyway?
>>> The default NVM directory is the root of qca. The 'firmware-name' property 
>>> can specify an NVM file in another directory. This can be either a default 
>>> NVM like 'QCA6698/hpnv21.bin' or a board-specific NVM like 'QCA6698/hpnv21.b205'.
>>
>> Do we expect QCA6698/hpnv21.bin and QCAabcd/hpnv21.bin to be compatible?
>>
> No. It may be different. 

That's a bit disappointing considering the filename implies it's suitable
for a family of chips.. But I guess there's nothing we can change here.

Konrad

