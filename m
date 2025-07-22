Return-Path: <linux-arm-msm+bounces-66053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9DEB0D7EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 930A7AA12A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 11:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756F7288C39;
	Tue, 22 Jul 2025 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AR+9BUjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D390138FA6
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753182592; cv=none; b=aN3+bX5KR2YSZkrNy2scoVpPnxiBgNs2eP0SRQ5hoOVX40CHYtYYywi0zF5jMEzo2MmFAFDKujsV7wR7n+7e5mlWUkILpIokjVr1tc5XtJ+PpSJ5gjb7Wsy9U0KWPw9oZryTGOXMioQtLzfSB6MNrH4zhb/b31/ZHtWnSK5JgVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753182592; c=relaxed/simple;
	bh=k9gFtccRyZr3PS8hCFyCod0WF7T3hNE9whlMC9ZlnIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cw71GUbT2QDS0wpWr75ZxpeZbdQbAymErhr0ksfFUgnPYwY9v6emXTpqf/4HWMGxN4ZrcF0FwVLMZwvfPCNrBJti9Al4F4Cd3FEWKSU3TvXyWgoHcb+pglg/QB0S+evjfO4qrAyhsbikDFChcUvd8oglxBtnk4Vqyun2FPviKdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AR+9BUjt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7LsDq012850
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAEx0UL7M6QTs1enGqcTXToDd6xrcRNncYT7Y34n7eA=; b=AR+9BUjtkbv3ZCZc
	D4X4weVbG8gewbUA7B2lFORSbsXjiU5mjtrvvZY7A7y7v9dA9Oe7tRqzH8Np2B2b
	ByAt4+DGxsxWGmKUaUOJv0y30aDx2KLpqf/DcpgPz5T9FxUDeUVMKv9E/vqRXwTA
	LldA7ygu1awZRnxFRZ3A4Ehx5xzNX3W99H1z7DIa1CH6nuJXCkImvHlQldeKissI
	TDwdw+PoIk2mGKvQJogJ3Y2jVRF4LNn7CsPfV+Wm7M7GC7pWZgJkVxvZabvBpCmz
	PeM5MykFblvC3k5TzDnSTD0TA/qeJ55KFDSA8sDZ8k8ztCB7C/vWzyMDSnZK00BQ
	uaHI9A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3em0c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:09:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74b185fba41so4610298b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 04:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753182589; x=1753787389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAEx0UL7M6QTs1enGqcTXToDd6xrcRNncYT7Y34n7eA=;
        b=Hb6axHVZ69Dpe5xY0iSDxQPa0jQ578tXxbc5V+gtsCchWFf21S62y5uo4TvkKEmV5L
         OD2lOFmfhVql4eUR9x16b7lpJie9p1boj+c+qF1ii7Z4qBF+euXUs+RbZAOojD0eODlO
         wEiB647umiXGdhgY9j7iFSUfNYZC47apZ0ucwO3I2v9cbx8KhkLjZAgrSD6JgVM/VpVt
         8APCmGqKurb7XzDIxTH2+xMETEvX9361B5kpeDMbiDiOc0fWKlCbZXn0f7xgXL6tEEVE
         z7aCQp4um7zoTVBWYie4tbhxrS0MIL8YDIDU4vbvgWuQbaThJsK6bCynvwymrESHvuJq
         Iwmw==
X-Forwarded-Encrypted: i=1; AJvYcCVB+ZNB5D2H8qUj+PFaiS/7KCCowxZUAranYb7RkSEmNNm0JLgP5FMcskHV7UZ7g9QvVPH3NU0Lt4NptvxL@vger.kernel.org
X-Gm-Message-State: AOJu0YwLkIrRaSUhoOocc5j+hEd1YWrl5VHJ3STXYhBP4Nxldg+yG2u6
	+JGzO90buwEZKLhRjwnjhaLU1zDGvVVxJlYK4G7CP2dfzdsgzI+4REjp0J8LrIWZPSwXkks8e6i
	SG6fMSFhEmyVKL0LJOoh94GBDPg3Dve2CP+Gq9hbJpeKeQE4XoXTRbKCToOf1ASZBLasY
X-Gm-Gg: ASbGncs3Jey8VDpRynhejco78Pdoz8/8bKoKfQiVvTvyMl+Uvv7zXUE1361bzVqRxIL
	b23YYXcLPYxR53gYEFkr4s4M03ulQyLuYP9aKSelo6TniEMKfJ7exXCH7cd3qQWn1iAQZczASxn
	jtjE5vfUryF9cLvfgHG727m9r9scagP/ZltjVKRGWH4ShQewDx7PBEHzewoypH6SLZMGX/w5KXs
	NdOG1EdIUz0vnMHcn35WXIBSZnx395iyf2txsfAL4zw3ppPpSSWkuZfQeHsZFabQIujRo6/Bz+E
	aycZgmNqQ8VuxwLRV4jrwqVa90xl5D511i/zEbnZ/GropxADEQypvpI5NdSs6GCgD+e+5btHIJm
	MFYFB4XT6B02zWmWRzjw8JxQdq9s=
X-Received: by 2002:a05:6a00:22d0:b0:748:e1e4:71ec with SMTP id d2e1a72fcca58-756ea1dd768mr33061673b3a.12.1753182588971;
        Tue, 22 Jul 2025 04:09:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGPE5z6+2o8KZBtdCBcTaB+oemBzNsmBRfF42GZlFz41/nEi+spOtCS0/0Ga4FlVQ6AZctyg==
X-Received: by 2002:a05:6a00:22d0:b0:748:e1e4:71ec with SMTP id d2e1a72fcca58-756ea1dd768mr33061629b3a.12.1753182588421;
        Tue, 22 Jul 2025 04:09:48 -0700 (PDT)
Received: from [10.133.33.46] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e27a8sm7486514b3a.21.2025.07.22.04.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 04:09:48 -0700 (PDT)
Message-ID: <ef0a9869-0688-43e7-b2d6-95286a590075@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 19:09:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
 <b4nxjsx4fu4xmookpxukumw36wlcpzelh6axjucqe4lyswptm4@kczsldalq53n>
 <822af9fe-5db0-4620-8f08-9232c608d443@oss.qualcomm.com>
 <rsybfhs6bb46putaytvp4tikauvhynhsam6aufxaflo6vkvzwh@qrh7sm3g7i73>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <rsybfhs6bb46putaytvp4tikauvhynhsam6aufxaflo6vkvzwh@qrh7sm3g7i73>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pL56JnkBri1z1zXi74eQBCsDMpWi7AtC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5MSBTYWx0ZWRfX0HALIE57m52G
 7BfkaJ9syxakhjGJGPdtuX4xYbhV+CWkC06Vf5AccGvj7+Ld/Zs3f9Jx/9Dp4InB+cy6PVCwHAL
 xbWAJiag2KUJENfs8rK4wdimKsLpTnLIaZJH0kQinEvbn5YvY7g6Ddi23nMzeP5nI0/mrBdJsiz
 3F5b470ucX9BqFCJbSSkN43+pN+S//IsWMLm6oVjUeYfhrDUL9oQYW4f8AMh2HTfkDlh//8OPyH
 TItM0GvYB16AkG2fW9di/ZIIeMps+wH90hN0y8EDCdQjU2ZdzmTZIrwh3/kK1s9ZyX2lp7sWfU7
 j0fjUMj85FFAJ2J+bH9Mr53jcPN2+4cEl0KMCEDyFdiTAeoWWqYanVqRvTimo3tw1zSeeuBl8sb
 lCPd+SKcI6GI9KmM8x7q1QoAHnwkrGFE55qXgRVk/tbl4eitHMwgXtxN+wbAM77WzYGtK0a1
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687f717e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=udvmD9vXOxOWEHquDVAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: pL56JnkBri1z1zXi74eQBCsDMpWi7AtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220091



On 2025-07-18 17:26, Dmitry Baryshkov wrote:
> On Fri, Jul 18, 2025 at 02:33:50PM +0800, Yijie Yang wrote:
>>
>>
>> On 2025-07-18 02:52, Dmitry Baryshkov wrote:
>>> On Wed, Jul 16, 2025 at 05:08:41PM +0800, Yijie Yang wrote:
>>>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>>>> on Chip (SoC) — specifically the x1e80100 — along with essential
>>>> components optimized for IoT applications. It is designed to be mounted on
>>>> carrier boards, enabling the development of complete embedded systems.
>>>>
>>>> This change enables and overlays the following components:
>>>> - Regulators on the SOM
>>>> - Reserved memory regions
>>>> - PCIe6a and its PHY
>>>> - PCIe4 and its PHY
>>>> - USB0 through USB6 and their PHYs
>>>> - ADSP, CDSP
>>>> - WLAN, Bluetooth (M.2 interface)
>>>>
>>>> Written with contributions from Yingying Tang (added PCIe4 and its PHY to
>>>> enable WLAN).
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 607 ++++++++++++++++++++++++++++
>>>>    1 file changed, 607 insertions(+)
>>>>
>>>
>>>> +&remoteproc_adsp {
>>>> +	firmware-name = "qcom/hamoa-iot/adsp.mbn",
>>>> +			"qcom/hamoa-iot/adsp_dtb.mbn";
>>>
>>> Is there a significant difference qcom/x1e80100/adsp.mbn ? If not, can
>>> we use that firmware?
>>
>> I believe there are differences in firmware between it and the EVK, even if
>> they’re minor. Therefore, it's better to maintain a dedicated folder for
>> each board and move the code to the carrier board.
> 
> Then it's not a 'hamoa-iot'. It should be 'qcom/hamoa/iot-board-name'.
> Please submit the firmware to linux-firmware and also move existing
> x1e80100 firmware to the 'hamoa' subdir, maintaining the compatibility
> x1e80100 -> hamoa symlink.

After looking into the firmware, it appears this board can use the same 
one as the others. I’ll keep the path consistent and avoid making major 
changes in this patch set.

> 
>>
>>>
>>>> +
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&remoteproc_cdsp {
>>>> +	firmware-name = "qcom/hamoa-iot/cdsp.mbn",
>>>> +			"qcom/hamoa-iot/cdsp_dtb.mbn";
>>>> +
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>
>>
>> -- 
>> Best Regards,
>> Yijie
>>
> 

-- 
Best Regards,
Yijie


