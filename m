Return-Path: <linux-arm-msm+bounces-89566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CEBD39F1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 07:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1DC2303ADD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 06:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A12287502;
	Mon, 19 Jan 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jq+f7eTH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izGCIgx4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FDC287505
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805654; cv=none; b=lie9gO+5EkaWeHk+AwIN29TB6vbhCpix8p1sSATQ0G+Urs1Ehko9i7te1o8w8+61sqMHmoZE7/loDpCcKRrnDDrE6iDbsxuanjxPbThYdaw5TZ34SvTS4YD0EnHyFI3Mk7LjFA9b7xtqFz8eQtt/9KASM6AuOe0vRzwukQS+Ehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805654; c=relaxed/simple;
	bh=dB34Q/7ovZ0Uovcmu+jTPM3hWWSXCnht6Lw0tVCnuEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zls3er5NfdxtynYPX7f58iSEFy30RncpL+Vqf7ATuLLWp+Zoy049hQeWIkkka6dfjpFcr4YAjWafJOkz9FTNO6V7fNa9ibuN9zv06lO4Gi3AVww4D0Qs6MdatRRkGKz7OCANUOH6WY0pTE8mokNg5nKNUv8J7/egyt8HHfCsKz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jq+f7eTH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izGCIgx4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IMU2xO3080147
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iF15pdOmlV9OjqMsRWy8S8UjqNMKUQm32GQpSrRGMa0=; b=Jq+f7eTH17FH1eYs
	hDfPjNzFMGPC/0H1iwN66oPkiJ9cacZvJ7xGzUXPmPM6VDD2ZI19LUcOigM6qCnR
	Tiv2igXvG8GuiThhHoWvGTr5WqByB4BN3jRh+GqKKYURLTvecamaqlscmRJWOR6R
	D5QthHmUBWpwsjcOi4XDfhhq0wWBnvZY/rDUDwwXqnNFc0KC5KS73sC5gI8igign
	ccQo6qp8ZpEYmYqSeb/aTCCuvWFj0ZWfhCtYW1Udi4q0jeoQQt0subohIVMJ8ib0
	FNOv1mALcIp4pozXb0TCUM9DBeoyki0Ia/CfJv5e1lf3c0hKq9Wde+IcjY+FeVei
	thKskw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br20x43s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:54:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c6e05af6fso3872842a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 22:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768805651; x=1769410451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iF15pdOmlV9OjqMsRWy8S8UjqNMKUQm32GQpSrRGMa0=;
        b=izGCIgx4NWt6Q2DTAaXlEhg96T5mL0z2m/BfR5xSmSKDu3JEz7KPUIpjFs3+kwSGwE
         LpCb5nVh2S9tXdn3n1lj39RckCxBFTtxYhzBg7rXgRj77yFkhUg4q6itxuaPicN7ckWg
         jhM/cAr8FA3H1FpvQNe7IHRMszaWdPRSOaiEI1WapjCu7WKHzeJRt4RTBOWzEOjld36r
         FpUcR1pJWjKUzlVBGUOrzctpd0lJLWYHpHQgYVTrUiYJc2uT0ot5BmhbKDcCCIHzwx03
         VsQ7NKq3z8vMBmulzBIg5jytIKwVhX4IzzJioMqe7RuGHgzxt8UBU32QMgB0LcNJApI7
         dv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805651; x=1769410451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iF15pdOmlV9OjqMsRWy8S8UjqNMKUQm32GQpSrRGMa0=;
        b=tAJeEQrP4VS5404+2NDMTl7Xz4uMrMbBnLT01ESgAUv7usVM13E54KgBk9OFvtAUfK
         LRuoCt0tJfn4Wj0/eAY3J1kPjMUkfJDVWblAioSFnjat0DIb1FX3VXHg0uDlQeed6QY+
         3JNkshfGveYcBA3iflSCo2W+xb7+RWAvz72OwnPDZQA6ypFDe9GIRqw3PFITzc+RAGd1
         eUkRV9IWG7pi1CyQNhXLqPF6gML4pj7zYApxjpGRD7UofZIAZCIgIGtcbMUFlQMIxq9w
         NK0ppe9uO04JQQiMWI0/WSTHsZVURlIZqHO5vHzv6V9z6GST8FbuesUL+7Xo9OcyZLBI
         aidA==
X-Forwarded-Encrypted: i=1; AJvYcCXln8oimbJ1PPACaPl73diF1pnaMbLseLKAeL+2EOpN39oxHKEQij6NDmuKu0BP+5fmg3WRCs49sgcAmyt6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Ozne8ZWA7Eb5XBRTSkwPrkMjUx/7B5hIsHFbdPzl5W+1RLGq
	XHyCab52OIyudZjwXo9w1bxHxy6sHgEqLG66i8JETF9ap/AgJ5gV6TPm93lHQFMbwCMjH1eww4l
	MWk99ou5av/tQCniRZ39v/nImZDv2UZuLaAf6hlhx+amzJkKLCO38Wxcx9YmIS7P+SbrN
X-Gm-Gg: AZuq6aLmyFTJDfIwfHXyrWRkrU+2qcZQA9KrIVAk7PxThXQZHJF/CYGU2KDYO0Csmes
	5eQbCMZtW8yfZeMiaoSwIywTrwX2GbSh3jni9ILJzDcaOmFVm5OSifVhXfsvbuYBjZn3xmi53gX
	OBtonWZX1/JOLKUiLbOeWAaY1rmQzZKLXdGdj3KT6XH2U0I/wVLs+9ygTqCG9yM6rhbcQ3V/zOl
	bU81eOmaF++ju20peNAp6OgT91fpYKsa5IKr5HpU75rh4kONVjkqxgBe5dLyH8DDhHq8Mrvnt7B
	UXyLhNvpKf6OggEYJVv69W00XWzJz/84Rp208rWbsEb+CKUm2qUCepn5XSoCeIA8YzVRh4VnHbV
	N3SWIz4KtBXf6K8v5sZw98t4sSZxXo1yXDN8Apu4U8EUv8FBLLrWPO4iqvrfeaEtepN2As2QEn/
	oxPgc=
X-Received: by 2002:a17:90b:3e4b:b0:340:bc27:97b8 with SMTP id 98e67ed59e1d1-3527317961dmr8168602a91.10.1768805650795;
        Sun, 18 Jan 2026 22:54:10 -0800 (PST)
X-Received: by 2002:a17:90b:3e4b:b0:340:bc27:97b8 with SMTP id 98e67ed59e1d1-3527317961dmr8168576a91.10.1768805650199;
        Sun, 18 Jan 2026 22:54:10 -0800 (PST)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352678af465sm10498378a91.11.2026.01.18.22.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 22:54:09 -0800 (PST)
Message-ID: <e2dfb857-1fd1-4d29-b04b-6dec0b7563d5@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:54:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Initial patch set for PURWA-IOT-EVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <jeyj5wqu4uw7tnm4h5ryatoqupdrqpkjcynnydgbum6oj2d4jj@qvvbbifrvud3>
 <ed49abf0-c2b6-4496-a3b0-ef040fd94615@oss.qualcomm.com>
 <b3p5yhstng6nbrrdavx67vlv62hqqlnms7742txbimpeswqklv@eomkmkkearwp>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <b3p5yhstng6nbrrdavx67vlv62hqqlnms7742txbimpeswqklv@eomkmkkearwp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1NSBTYWx0ZWRfXyPWCKYVl8dp3
 nvNgSV/g55qTNQmnbRgjofA0zRG+1n9WMKDhypBsTuZwMIN3CnRR9FggCK2UonpQ3dxh+EWPi2S
 QDv2vSLz6p8d9E9VkTfg0+IV78kPU0CnQgKohnZepLOBSspppnttjBf5x4Qi2Qp6OylrhA8PiqD
 hrnniUJBvIySeXNB8lciJV6Dgqa9UPDSwvS5aE4BblHkWv19BSMFpsHtPzESunwFPxD1rRmey9e
 xvol6dTHX0bmHJT4x6t3urKlBzr4hdzdSJ18VQNlcjgK9oxiG1XCpNa7SNS67BB7wMkkWIluYN0
 g3SUfC/s73UzOTuszRY1jQUjjb2azDyTDc7diahyW4kd1+SykE7yDOJGd2x61LzRvBLoTYNY9Pu
 xopuPEO5pgd5KH5TE+yvhmdJ13x8bSSnyqq8RZkjl5XmPTpN42W793fIazI9qJvpGV1qTEzwvfm
 dwy5Lav/ukXmHQfaqXQ==
X-Proofpoint-ORIG-GUID: RAohxicfswE6r21aNcMO3gyVMAavbcaT
X-Proofpoint-GUID: RAohxicfswE6r21aNcMO3gyVMAavbcaT
X-Authority-Analysis: v=2.4 cv=abRsXBot c=1 sm=1 tr=0 ts=696dd513 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=R7vQKasIsJkg2XgAIocA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190055



On 1/19/2026 2:34 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 10:39:04AM +0800, Yijie Yang wrote:
>>
>>
>> On 1/16/2026 7:31 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 16, 2026 at 06:41:26PM +0800, YijieYang wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> Introduce the device tree, DT bindings, and driver updates required to enable
>>>> the bring-up of the PURWA-IOT-EVK evaluation board. Focus is on two key
>>>> hardware components:
>>>>
>>>> PURWA-IOT-SOM — A compact System-on-Module integrating the SoC, GPIOs, and
>>>> PMICs. Designed for modularity, it can pair with various carrier boards to
>>>> support diverse use cases.
>>>>
>>>> PURWA-IOT-EVK — A carrier board tailored for IoT scenarios, providing
>>>> essential peripherals such as UART, on-board PMICs, and USB components.
>>>>
>>>> Together, these components form a flexible and scalable platform. Initial
>>>> functionality is achieved through proper device tree configuration and driver
>>>> support.
>>>>
>>>> The PURWA-IOT-EVK/SOM shares most of its hardware design with
>>>> HAMOA-IOT-EVK/SOM, differing primarily in the BOM. Consequently, the DTS files
>>>> are largely similar. Both platforms belong to Qualcomm’s IQ-X family. For more
>>>> details on the IQ-X series, see:
>>>> https://www.qualcomm.com/internet-of-things/products/iq-x-series
>>>>
>>>> Hardware differences between HAMOA-IOT and PURWA-IOT:
>>>> - Display — PURWA uses a different number of clocks and frequency compared to
>>>>     HAMOA.
>>>> - GPU — PURWA integrates a different GPU.
>>>> - USB0 — PURWA uses a PS8833 retimer, while HAMOA employs an FSUSB42 as the
>>>>     SBU switch.
>>>>
>>>> Features added and enabled:
>>>> - UART
>>>> - On-board regulators
>>>> - Regulators on the SOM
>>>> - PMIC GLINK
>>>> - USB0 through USB6 and their PHYs
>>>> - Embedded USB (eUSB) repeaters
>>>> - USB Type-C mux
>>>> - PCIe3, PCIe4, PCIe5, PCIe6a
>>>> - Reserved memory regions
>>>> - Pinctrl
>>>> - NVMe
>>>> - ADSP, CDSP
>>>> - WLAN, Bluetooth (M.2 interface)
>>>> - USB DisplayPort and eDP
>>>> - Graphics
>>>> - Audio
>>>> - TPM
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>> Changes in v4:
>>>> - EDITME: describe what is new in this series revision.
>>>> - EDITME: use bulletpoints and terse descriptions.
>>>
>>> Oh no. B4 probably even warned you about not sending it out.
>>>
>>>   From this changelog I can assume that nothing has changed. Is it
>>> correct?
>>
>> This section was generated automatically by b4 and was not reviewed
>> carefully. The actual list of changes is in the section below.
> 
> But why????? Why do you ignore what was done for you and write it on
> your own, reversing the order, etc? And even if you decided to ignore it
> for any reason, why didn't you delete it?

The confusion was caused by mixing b4 and git format-patch to handle 
fine‑grained patch formatting. The Git configuration Konrad suggested 
did not work for me. I ran b4 prep --manual-reroll <msg-id> to allow b4 
to track the upstream thread, which caused this section to be generated 
automatically. I did not notice this and mistakenly re‑wrote it myself.

> 
>>
>>>
>>>> - Link to v3: https://lore.kernel.org/r/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com
>>>>
>>>> Changes in v2:
>>>> - Update the GPU firmware path.
>>>> - Update the description in the cover letter.
>>>> - Reorder the patches.
>>>> - Use separate DTS files for Purwa and Hamoa.
>>>> - Update base commit.
>>>> - Link to v1: https://lore.kernel.org/all/20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com/
>>>>
>>>> Changes in v3:
>>>> - Delete unused PMIC and thermal nodes.
>>>> - Add WiFi node.
>>>> - Add display backlight node.
>>>> - Add connectors and VBUS regulators for USB3 and USB6.
>>>> - Enable PCIe3 and PCIe5; add PCIe ports along with reset and wake-up GPIOs.
>>>> - Link to v2: https://lore.kernel.org/r/20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com
>>>>
>>>> Changes in v4:
>>>> - Enable TPM.
>>>> - Update the descriptions for video and the USB OF graph.
>>>> - Link to v3: https://lore.kernel.org/all/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com/
>>
>> Here.
>>
>>>>
>>>> ---
>>>> Yijie Yang (4):
>>>>         dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
>>>>         firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
>>>>         arm64: dts: qcom: Add PURWA-IOT-SOM platform
>>>>         arm64: dts: qcom: Add base PURWA-IOT-EVK board
>>>>
>>>>    Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
>>>>    arch/arm64/boot/dts/qcom/Makefile               |    1 +
>>>>    arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1549 +++++++++++++++++++++++
>>>>    arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
>>>>    drivers/firmware/qcom/qcom_scm.c                |    1 +
>>>>    5 files changed, 2242 insertions(+)
>>>> ---
>>>> base-commit: 377054868ffa544991cc491ecc4016589fc58565
>>>> change-id: 20251113-purwa-907ec75b4959
>>>>
>>>> Best regards,
>>>> --
>>>> Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
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


