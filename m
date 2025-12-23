Return-Path: <linux-arm-msm+bounces-86274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6118CD7CD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 03:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E97733021E53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 02:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A35220C490;
	Tue, 23 Dec 2025 02:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkzidvQv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ho3NzSF2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22772773DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766455385; cv=none; b=BgjFC0dCerROYTOsjeSeJ9rePMbGt53d7e0jIuwG3TmqX/8TuYLHoM6gYlPxbA4W9pqJMnSeuUj9TZa9T9wUEUX2dWieB4uOVLPdaHdGnhUmtvQU6hIbZ58dpCSQvWruLjmBtdXmGvG9e0hJo2hvdDEVcB8ZXBe1PB0PwFuafB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766455385; c=relaxed/simple;
	bh=47/JnFTCiwDNXYBWNe5FkoElWzlRXCMdo/PcpDdBQ8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1XoDZOP9Wf9atR9QqpLOTZCpPikV39UQ2R9Dqi620g00+ncCRD21aV8bRR/EF+l3jXAKlEaoXwD/G/I93M0DJ5QuM6Q+/IYgijPCzfh/XxPlaB3prftNNKIECHJZ8bPL1uBaZMBQhdC6C0PhdnxeYNUIXtaIbRkYKJAyA3BzRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkzidvQv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ho3NzSF2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMFlJp11358161
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLGTbju/I3Be/uZM4yL8HA+FJ9kzh1+DUFESVKNu0VA=; b=KkzidvQvNMhxHbUj
	hMDWWc4VsvHC8Wj543YeKFTmtQRTeBFEQD1waffaB3dA/91h57Lgq6lraxxeveJr
	kqcCmof6Q/lFYefN4EJGBK1deBcW86rqKpzssb2w7ByzeyU0ZmhpeN7Ly1/qNSin
	e9Z94swe1kLkb6IvaEfP3GA2IkZYmtpYz57XtRGXr25eV3VGQ0TgNRWJbRqTtAH2
	u9H9bac1Q3hPfOIpDOO7JlyRT8qCtYCW7f2ZpyTClQ1dynSPS74yhRp3v6N4qgk4
	ojYWjYMC170IRAp1HcqxKyMJTVuDyCRBLh1X1Cr2JEBmQhTqN85X/OmyGEBEHb3t
	XlT0LQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc1au1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:03:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so5336038b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 18:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766455380; x=1767060180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLGTbju/I3Be/uZM4yL8HA+FJ9kzh1+DUFESVKNu0VA=;
        b=ho3NzSF253KLDLS/UHusYP4R+3GyyuL6FA3ra1AvWFttoRSqR/lsfjOAGUf1aS+g9t
         Zppeo/woeGnPOgRoAih62BnNKzP0H9q3HnVfJUROLczWjAn2wtJW10fsHdI8HpjEqMEg
         8jLfeDgv5oB006ys3JcBR4TQHgxoG78yiWx4sNxSBDOvYIe0RZ9ZLOk6V5AdZYB8x6R5
         YbPsZ9lVyFPScJc4f54MOH2wDnGbR74C8scUVqFq9Vm1mJzIk+2KaWJM+9FD8lbpIN8n
         Qd2CaeR02L4Bt1zg5w62p2GE5jqYlcY1U8yEUwjZFLKx7MX6PSQ0sx4LyuimLt4yttop
         Qn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766455380; x=1767060180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLGTbju/I3Be/uZM4yL8HA+FJ9kzh1+DUFESVKNu0VA=;
        b=Bgky6N6v7wv6Aipdc+x6aRgFTp4uOg+pk/ilsdKDNaDTjnqbklbHNV317v8opSqEMw
         aEYVUafLBqQVFXuV9ATyt8UULEGtAhAGArnEmz4XAHbpc2E5fY8FI+BlZmpOb3p0y0aL
         LSyQERux1wKWPp490hB0lWCs8e1rDSK8ywPNQIWD8QMDpKkTWP21g4DibAQoH1LDPI35
         FyCVqmDbGoWC2FXPUwgHj8mUTRmAPjKTYF9vzzio5wQGeTqm8OSn96IqnEJvT/McuTiG
         SgGLOP1L7OllpFOIOZm535TM51eBL5Ph9VPeq/q+XaiVcbE7xB+Kyu1SJu0bm9FP56k9
         SaLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPZCz5R7KlIn4YKUfDJmAL+pV08HBpuc7geM8PB2n4en46EAtlE/Yicp+s7XBY8Hky3G6O1OWYFBeELkBF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4kCTxkT06YX5o/0RLszBYleqmLnZ6PBbVRc9memu5PC1xD5ku
	VwpDxu0DIodSMFBQeVeDPiu6hWOSnCeJRNryM5IF09VYGtZxb5KZ+PvRwh0JXiL/W1FCDazzFl+
	SAGo/ndHOFBHQXSv1xykuBaOIQh69VlPg6dMWsfioB4KpxFIHGbSvsfLCL+iHFzYrlcbyY7d9JL
	EWZGE=
X-Gm-Gg: AY/fxX5/WRERRatI7gM+7rDAuqZKgnE1qWRRRJM7+LnkS3whxXzY8otsd4zYLHDShgC
	bSnxqPo0LEPeFNwW5Ot9ZlcM3zXMHLvgpFZOQRbOVucUMoGce/Iz5WRJoBfmy2t7Q0pyIddzVHi
	ygkGjIT4kaCuZqIavg/rx6AYT/K+dtI7C9MpTwCAA8TG0/InS0XE7YmtnNszub71lsEsqwKVLDo
	Wzvcl+wv1F0TeEnNnN1UIw6+HOXQKNM+wNnbCVd37l5ypME799p4H2V2uIODREujio7PfrW2mUq
	P/3m5MTXQYJvOsKAeiBfRmdki4FxOhrCqsxuacfY5BuffTFpmFFswySZ5vs3uOdgKdzGHKxkdvl
	w3w97ZfXkpQ9rdkYmNQqrVMHLW6Av01j0WdYGo8Y3ESPWHsGVVUcVbUPtPpJW7uET7e2DyMv+Ad
	ew
X-Received: by 2002:a05:6a00:1f06:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7ff64ed14d4mr11816032b3a.14.1766455380317;
        Mon, 22 Dec 2025 18:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG15Z5e4t885EWscWGXOKEri0C5iCsPF42tQF/6qZhBodxtM+7dENBgFDjxGVYO9BPhfKjYnQ==
X-Received: by 2002:a05:6a00:1f06:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7ff64ed14d4mr11816014b3a.14.1766455379835;
        Mon, 22 Dec 2025 18:02:59 -0800 (PST)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7ae354easm11742480b3a.16.2025.12.22.18.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 18:02:59 -0800 (PST)
Message-ID: <a8784c60-6551-4312-881c-c36523731862@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 10:02:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-4-yijie.yang@oss.qualcomm.com>
 <woqdn6gvlkgux6nuixpcwmcqkl7siqajgwrvd4x5cuuw3nlrpp@vmq63mgudnoa>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <woqdn6gvlkgux6nuixpcwmcqkl7siqajgwrvd4x5cuuw3nlrpp@vmq63mgudnoa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NiSjo4rwYcaaY2dkppjrwFJPRS7Gt1TI
X-Proofpoint-ORIG-GUID: NiSjo4rwYcaaY2dkppjrwFJPRS7Gt1TI
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=6949f855 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iRwjNNOZtbvqg3Z-UTUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAxNSBTYWx0ZWRfX4BDjVNYi4HUd
 VndOImYXc6kvQvVPRJhqdgGIGXb6FBU4KG5Vb89C55olPr/3h9rzAGCi2eqEK1jigVerKnMm7aF
 vDyZUICxp6vuyWGRFNNVUkrTgJrekvmGyX30sbEfVm9PQEPP1Y6Ese/dgtVkD+k/mBsmUhMhXmc
 pybUG6vQNcpJGfZYDENysIim6/oBeF1/l2kimve/TSYP3CINmm+o3AVXGO/tnSDTOsu4OquPsH5
 R0EgRp2K1K8N8kFEcRZCU6dhrshtuTDG4zp6qCpxB3bZRiCRbwUkwtyXXJZ0qcdnOsyO5xjodvZ
 Q+WHSvsbNjvzWnD3/JVgjFP8h3B+69OGPZBgzeZPpSOQEcPWn2ngrfXiuYoW6TIBwdv5BXRAXxV
 dYn8+kbGYiHMKPodxSrlMvHT1+r/MYwrlVqIP1trmaZxcRY10DoAFiBYV2cAV1Xh4yCxol06azb
 tCaUlcp70MYn/K9EZIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230015



On 12/22/2025 5:22 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 22, 2025 at 02:03:29PM +0800, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
>> Meanwhile, USB0 bypasses the SBU selector FSUSB42. As a result, the glink
>> topology differs from that of HAMOA-IOT-EVK.
>>
>> Make the following peripherals on the carrier board enabled:
>> - UART
>> - On-board regulators
>> - Regulators on the SOM
>> - PMIC GLINK
>> - USB0 through USB6 and their PHYs
>> - Embedded USB (EUSB) repeaters
>> - USB Type-C mux
>> - PCIe6a and its PHY
>> - PCIe4 and its PHY
>> - Reserved memory regions
>> - Pinctrl
>> - NVMe
>> - ADSP, CDSP
>> - WLAN, Bluetooth (M.2 interface)
>> - USB DisplayPorts
>> - Graphic
>> - Audio
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts  | 100 ++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi |  11 +++
>>   3 files changed, 112 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>   create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>>
> 
>> +
>> +&gpu_zap_shader {
>> +	firmware-name = "qcom/x1e80100/gen71500_zap.mbn";
> 
> This wasn't tested.

It should be qcom/x1p42100/gen71500_zap.mbn. This has been tested locally.

> 
>> +};
>> -- 
>> 2.34.1
>>
> 

-- 
Best Regards,
Yijie


