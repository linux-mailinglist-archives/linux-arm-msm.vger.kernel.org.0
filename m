Return-Path: <linux-arm-msm+bounces-87042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B63CEB275
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 04:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D6153030902
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C65223DD4;
	Wed, 31 Dec 2025 03:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOm5oJKd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3eyQWth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B322BAF4
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 03:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767150013; cv=none; b=ZwsTLjMOvXr1PqlqC6PNtCB5Q2CXPsBHOhskY0neRgDY0R8w5O/hULwM1tUmSGTlJR2p6j2OvDO+0taa46CGg8KnKGMrjuNXmnlB8SRVJGsm9oAAq5CzO5HiOUYYjFk0hWBKoMad8wOEyqfpkg5sVXjw+oyb8Pf18uBrCtJuiMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767150013; c=relaxed/simple;
	bh=Zrpymwlu5vSnpifBof3YhVrqHea3W/exe8RR4NQJpZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdAOj+ikS7XdyMlKcFHqvGwAreED3d+qC6NhydzWrfb2hOXSlrKHpKUUPNDxyP0+cY5gI2zcHTzg/LbXynvJ6Qx9+Ipi1qRY1pVrUghtpX3B59k91VhFRYq8Cte2GgA0NU2yrmFD1BoFzQYSljq6B+f+RKItUUUVqwKPU7a+JVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOm5oJKd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3eyQWth; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BULqaKp2916852
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 03:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tQUiJnvUNoZ9gspf7AOHFVgE9cHO0xDE9qliirWO4c=; b=BOm5oJKdfSnsSMC1
	lmuofWa1m6vD3aLnHldK7oUqlPG5jxSMg/2UTPnxd0seU/sAM8O6LZRp/lnGkO58
	5itIP6FD1lwRr01Ez10Ww5dhVUJk3/AwhFHXqUegaayJltKSviKMd3nVNYVf/0xq
	3ur0P9Q+A/6RpNyKYqb76BbmyOeVpwA8HDHXtZvFH3YfDTIQIUrootxEqSB/3yas
	t/f+wIkO5Xkuw4YiptpEZMNVzzdYYYuS3mCItb/CfuQLK80ewhST+HXMiXuqu3DU
	qaEeXZMG5RzBcftuoZSumZYl1Ihc3FNuiR8J+l1zzbD0lB7PgeYAPRTrty1KsxFj
	/ilA2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky2gxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 03:00:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f25e494c2so114737505ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 19:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767150010; x=1767754810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tQUiJnvUNoZ9gspf7AOHFVgE9cHO0xDE9qliirWO4c=;
        b=j3eyQWth/1RwpvL4tzjw3+e6xpUaO4SwsZQj1k6c9H7VP3PhYEwDEz7oqcx4d00tfk
         aOuvmqzm4XD2himWjQM230GpxztLuQwOUFMvvXp06w9LDP8HBtgu/mcmxEtpdXlX3n60
         bL/cq/uyGw6SQaqPxlfBj7L0O4t2vAVaL599ycDCPQoocdUhRtQv3L8B7hrii+36EKG7
         rBg50BvpxHsAQ20GKruVsMDgovtl4OTH55vg0WNGTpW9vX+U0VeV7CASkMnCXVIbJbeg
         np0Y8xmbqsWfURxrOYTE+xRKCUjiYojyTADdytZF+w3KPysnUQq4N0uxstveIstdeWmV
         5D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767150010; x=1767754810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tQUiJnvUNoZ9gspf7AOHFVgE9cHO0xDE9qliirWO4c=;
        b=ccAOZ5PVRdiWqBAq8UYmR50gYUGZPIhGENF8d2YGeZxaYiRh58zIn+YMKo9q9siYqD
         UFznx7EXHvfVxwjrb9Hk8g0ODCNZ/PojgEJoX8HJOI/i8fKc/JVx8dkcaFlqfVzdLmvF
         qTV8oef1dMMByn2b++55n6iJhblu+Dewl8+jenU51R0NNCj6enVME3tAVvAuHYH/yXvP
         LxfEHv5WrphChKEw64lQUcpmPq/+brcPhvNIja/XdzKb2XQ7LJxscEdKuaO0XlLreiO+
         CBO/pxYmGAcAkVlkz81wreAetC+Xz4rCG3jG9EiRRyHZt7v6/cDG3KpL61mnFIitexQL
         k0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQny84QWKV2ovERPl+WOhZVzUdI1yrgmGqUi154S1+H8/316J5xK2VhQEMTx/bd+P2GCXxO5rSGG6R4kli@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyru6hIqMmbF6sxwd6WSo7RfupWreD57MjpWhbWefEAzRaI928
	PudoMkh6i09Sm0o6+VkaqLLw+KJXTSRy2x0KR84kvVqoCNNFiqwtnrkTNBKzpY8xy+m4l0ewHoa
	E2mBwTztU0Y4aXKIhdd9yg3c/U/tmgteeVydvUgu8Z8W3Q0BwYFXm7hXo8XHygeQZTVYG
X-Gm-Gg: AY/fxX6WBn6MN//uWaypD1TY/LxLyO4J6/d8ca5gvyTK928hYfCkb2QilHqwLfhUU/t
	wVWqDNQ0PPj17BjFF1m5JAIa8z15dZ2q5ZM6QuGAxDOTJj9MDnWePJAEUvFSPHedmV2rUwuFEc4
	q/4QFVKuN+oF1MQsYJ+6vRdsDjNAu/C1+VYjnY9AiNE1nZzTuCVhVnCCC9KNJLMqQ9XwNQebpey
	AVDvzOJFd1tf7L5FjK78tE27ufiZhgLRR4WVHqEAQdepC+73l/ChuYuQOQRnnviiRs9Jmnz8SNi
	CESLhojvE3B5/TePOuyKtizlt95jIHwX3WgHE7Eh6kvpiVutE5BHmtoxvhE6eYZQuQsHCS828vH
	5wJVkjdCYqaiC0+vOMblgKPigcCVlLkHDkLMlaiXa
X-Received: by 2002:a17:902:d50f:b0:29f:175b:1ec7 with SMTP id d9443c01a7336-2a2f0d2dbd0mr389194115ad.16.1767150009826;
        Tue, 30 Dec 2025 19:00:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG59LNYbEhGwFeuMz6KqzUc7FOCbUiyY9wCboyTDRqxu/Kl78UuRXDXsfbsCfDEkLgjYH7hNQ==
X-Received: by 2002:a17:902:d50f:b0:29f:175b:1ec7 with SMTP id d9443c01a7336-2a2f0d2dbd0mr389193655ad.16.1767150009196;
        Tue, 30 Dec 2025 19:00:09 -0800 (PST)
Received: from [192.168.1.9] ([49.204.109.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbb7sm315765755ad.59.2025.12.30.19.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 19:00:08 -0800 (PST)
Message-ID: <8c734f2d-59db-4815-bfc6-3823cf3ef37a@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 08:30:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
 <2zeqt3tu36qcxs6xrzqqmn3ssmyzetl6tq6lxrjdvt5dhxrtv4@g5q4zhk4sebs>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2zeqt3tu36qcxs6xrzqqmn3ssmyzetl6tq6lxrjdvt5dhxrtv4@g5q4zhk4sebs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAyNCBTYWx0ZWRfXyzrSL/mEaf4V
 zxqkOFFE8zXSZ8TFnOYEavG0erV9thttS+M7I79/mihofrxy8rp893JQ9Gh5bkrP8RgxcjjvBix
 ZqJs6WytgApwgDxdQisxzcz9RsRHc22dQ1U1/UGbChSd7OtmlvIdY5M8MNU0k4qsLbOYSnEWi0F
 3BZmMZZPpIi6OP3rNX1dGy/lHAsv5XdSCUdxcx9BTpKfFLv2fUzBIl1oAgHfErTZtO8z2Eu1SRB
 sGDDM7MqPRDt7MXlTPCfgiLkabCsnucI4t+PhccNitH+bhW7sFb2o1ag7iCY9JYZMdJYl2z/0tA
 r6nADviiZYQ15Ec5xgrqfk7E0ku882SBGgStl7ztwKmw4gC4Zg5Q6jlw4SWGvubpgBiQow+GYAw
 YJuPznJ767WQQoBMfcTwt3ZgSZyWedkGm/JKtMplRHjBTPmpb6qaECLloVUlw+vS/00DTXwd7Fz
 OG9LZoEfsMPzyCS7qog==
X-Proofpoint-ORIG-GUID: iRay59xM2L1UMJoNNXbawuo_Ocq6NQsL
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=695491ba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JcPDDAWpA9Ur2UU+zoP9YA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MTHtA7U6dzGJEomdHCcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: iRay59xM2L1UMJoNNXbawuo_Ocq6NQsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310024

Hi Dmitry,

On 12/30/2025 11:53 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 10, 2025 at 03:40:42PM +0530, Praveen Talari wrote:
>> The GENI serial driver currently handles power resource management
>> through calls to the statically defined geni_serial_resources_on() and
>> geni_serial_resources_off() functions. This approach reduces modularity
>> and limits support for platforms with diverse power management
>> mechanisms, including resource managed by firmware.
>>
>> Improve modularity and enable better integration with platform-specific
>> power management, introduce support for runtime PM. Use
>> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
>> qcom_geni_serial_pm() callback to control resource power state
>> transitions based on UART power state changes.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
> 
> This breaks BT support on the Qualcomm RB2 platform. With this patch
> applied, I'm getting the following:
> 
> root@qcom-armv8a:~# dmesg | grep tty\\\|hci0
> [    0.000000] Kernel command line:  ignore_loglevel console=ttyMSM0,115200n8 earlycon root=PARTLABEL=rootfs rootwait systemd.mask=pd-mapper.service --   androidboot.bootdevice=4744000.sdhci androidboot.serialno=2b89b520 androidboot.baseband=apq msm_drm.dsi_display0=qcom,mdss_dsi_ext_bridge_1080p:
> [    4.074354] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, base_baud = 0) is a MSM
> [    4.099410] serial serial0: tty port ttyHS1 registered
> [    4.131200] Bluetooth: hci0: setting up wcn399x
> [    4.149847] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, base_baud = 0) is a MSM
> [    4.229099] printk: legacy console [ttyMSM0] enabled
> [    6.499519] Bluetooth: hci0: command 0xfc00 tx timeout
> [    6.514347] Bluetooth: hci0: Reading QCA version information failed (-110)
> [    6.559933] Bluetooth: hci0: Retry BT power ON:0
> [    8.016330] systemd[1]: Created slice Slice /system/getty.
> [    8.066194] systemd[1]: Created slice Slice /system/serial-getty.
> [    8.148389] systemd[1]: Expecting device /dev/ttyMSM0...
> [    8.956804] Bluetooth: hci0: command 0xfc00 tx timeout
> [    8.962447] Bluetooth: hci0: Reading QCA version information failed (-110)
> [    8.976917] Bluetooth: hci0: Retry BT power ON:1
> [   11.296715] Bluetooth: hci0: command 0xfc00 tx timeout
> [   11.302340] Bluetooth: hci0: Reading QCA version information failed (-110)
> [   11.309534] Bluetooth: hci0: Retry BT power ON:2
> [   13.660078] Bluetooth: hci0: command 0xfc00 tx timeout
> [   13.665814] Bluetooth: hci0: Reading QCA version information failed (-110)

Sure, will check and update.

If possible, can you share what is DT filename for RB2.

Earlier I had validated on RB1 and Kodiak.

Thanks,
Praveen

> 
> After reverting the next and this patches, BT is back to normal:
> 
> [    4.067201] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, base_baud = 0) is a MSM
> [    4.082426] serial serial0: tty port ttyHS1 registered
> [    4.106122] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, base_baud = 0) is a MSM
> [    4.108647] Bluetooth: hci0: setting up wcn399x
> [    4.125371] printk: legacy console [ttyMSM0] enabled
> [    4.445205] Bluetooth: hci0: QCA Product ID   :0x0000000a
> [    4.450927] Bluetooth: hci0: QCA SOC Version  :0x40020150
> [    4.456470] Bluetooth: hci0: QCA ROM Version  :0x00000201
> [    4.462006] Bluetooth: hci0: QCA Patch Version:0x00000001
> [    4.509408] Bluetooth: hci0: QCA controller version 0x01500201
> [    4.515656] Bluetooth: hci0: QCA Downloading qca/apbtfw11.tlv
> [    5.488739] Bluetooth: hci0: QCA Downloading qca/apnv11.bin
> [    5.671740] Bluetooth: hci0: QCA setup on UART is completed
> [    7.993368] systemd[1]: Created slice Slice /system/getty.
> [    8.045612] systemd[1]: Created slice Slice /system/serial-getty.
> [    8.125418] systemd[1]: Expecting device /dev/ttyMSM0...
> 
> 

