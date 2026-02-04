Return-Path: <linux-arm-msm+bounces-91759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AHkFI20gmnwYgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:53:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D779AE104B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E4A93037ECE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FC329DB88;
	Wed,  4 Feb 2026 02:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMknmBA1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iw2EyR8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D942D7393
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770173557; cv=none; b=jyv90NopGGiAzOHIvq6KLVD/90fT7oc9eZNvK/SrjSj7AnKVcCN0sqaeAnwjrzCbdBJl+siiWeGBoPB4+6lJLwEpqbHqYR66nyXhTkFDV/KS8dqJkK4vgetcs+HY29QWul1qd3/4eKVOU4jGHOVEgq/suMAjpWxEPpbb8/S6hKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770173557; c=relaxed/simple;
	bh=/17zeU/3QFibTzJw8mYNca55uMJgH21nI0Mso52APAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6E34wD2UEVdN/ExsEF5P59sr/Z398qLUHAuwnBffIjYzKz5p2XznA3p9XrMYtEOyQNcQqAM9EuF0IT4X91h8udac/enz9gmS9Drb1TRWFl6+5FFS9j8imEiTsRJaA3eXW36jpmrybpx3E9nqajLqO217XEcec0UP9uQ0qeELfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMknmBA1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw2EyR8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ilw8L3337216
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ee8EaOuEDF7xuiuWnZTbj5fFMCy9idVtet4KPNnHlY=; b=BMknmBA1xc8idPHX
	tsWOftYa7kUiaYrg+aiAtRz8XO8Gy90nFlYAcQ/urt4MTHEgGOUd70c34sf2Absc
	6qqXYZS48PnmKx1NcvgRgHsnDyh9+Q7C+x9jpyGU5+OizQq13CWcGIZuPpGgKraE
	uvaOdAS5DlONppeaet8MXIdzjoG1lkON7dvueNSHWZbV3ghIOYG654g1I+86c12N
	7SVpoDFEkA6/Mi2BK1xRidE9xjawNYqob6ox/7HtahlnkJ2spMATOqnnK+WoldyP
	QV2As5VDNo0XsfBQtSerkg+85dlnfRiIl/Hv6NH32JUx/w+o+5WD8XLvLbaeT5OF
	+U/XOQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gewaqs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:52:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81eef665b49so15019552b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770173554; x=1770778354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ee8EaOuEDF7xuiuWnZTbj5fFMCy9idVtet4KPNnHlY=;
        b=iw2EyR8nqTH8UufVNCRcFdoZgiPOetOTDdk2f6UDVIRswNO9JQqmiu3Ms3OgcfIFqF
         IaTG+jN53yk1nPs6MH51KH1IOBCR3YtTnD60oM9aph7sqRTH8wCtYJgSe9+2YwZsJm+C
         IWY4r5urOtCwmDgv+LGw/9IRpAGWf/AR9KjfN1S34OihPmkRuCFrsDtEQCxsEEEfQY99
         1yEQc852WTVT3sG2GgmWuGHogTM9QgQK10+Eootks9EVxPyiMm5ULPty0s1W9QF2uagN
         AcPlF4OoGgvzo9KAwExrJJGCQo+WKJYizqDfap2AdPwGnPCY2dlIwlCtiBjEbLTTJ2ye
         Ycjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173554; x=1770778354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ee8EaOuEDF7xuiuWnZTbj5fFMCy9idVtet4KPNnHlY=;
        b=C+vo/f/vxYwA4K96UrJJ8uy7GCvhdmfL7NUu6YkeIZmrKyXOu5P+Fj8N2K+TVUPtTi
         BET3YM3zdfvRsPxUTDPBio/+CgYFs9sm1CYIZ5NEG+xa21k5ed/OVb9DFvZV/ho6giTX
         WJgW9ASFjaIeQfH9MomFL6apzUaIbU8rS7NZx7QGGc+jcaTqawIFbg/8tIPEB5HslvcN
         m/9tu1F3YmXEV9hltrba2oaXChDpQZqO8P1kNfeiOOMEpz4AqisK+zd6TUmi2LVp5j8n
         nrkuER8gOw+KOXBk4tqocq2DpkObgAPoFar+Mv22w9spSfGCJv1II4BP3AG3n8i03BV/
         uI7w==
X-Forwarded-Encrypted: i=1; AJvYcCX3d8JXFTmh/vk7pstA6GlUpNuAVfrt64loDI+o+ENl1twJEDp3roc1zyTmXc9xPwSgHe2veXfLvMQ0NRsW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7RzRwbDLaQRaxxyiyrGADQZuhttHplvOV3JCeDHqjKaXWM0dZ
	7w1tj43h7XeoTzW8cFvMBuECeyz1XQb92+bjvIvIWifb6cOc3ZToEJn9gNRhnQURejY9bDOkCP9
	Otq/jX2wCAdKCd4PfJMMTrddpejx4APaN4eAz0AWcF6P7+c5qVgrgnsx76jfyC6Z8e0ah
X-Gm-Gg: AZuq6aKWSIBO8MaJIsFuhOWQEMh4iCtKey/MNaK/mei/C3FiRyT4YEgXGx4eBkVrNlN
	6648QJMVO4EaL3ApVmUpYNMFaYRUioNSXpaGWgOKnSvqZkvApGFArKGgLDSZ4LZBLNDnNfIUXPZ
	6jaWTNNgzar2KlbtIPzLrGz6o4TzqJtOWd2MZP0I/FSDuLeLg5gg+r3rqoG8O9/WN1CDE3xaloF
	EHHO+2S7hgjRaXix25IfkuguHxJZik8sxR4zTRPqVybePuQy28xX06xX3AEgKcQQHlgF/LTh9Xc
	R3uMC/+LIEG1vhzj5dAVRFEFKtN+5asntaqPwWdbyYiL9oBly8/Kd4vElfRgZz13EkiSjA2doRJ
	/yMvVMpg05XeShTFqre3E3zJm96fKuwOzNrewkbqYrwv+nTI9TnsydBurATIHLI69xVJrPSyOc3
	/uJg==
X-Received: by 2002:a05:6a00:c91:b0:81f:9c50:3564 with SMTP id d2e1a72fcca58-8241c649975mr1610451b3a.52.1770173554185;
        Tue, 03 Feb 2026 18:52:34 -0800 (PST)
X-Received: by 2002:a05:6a00:c91:b0:81f:9c50:3564 with SMTP id d2e1a72fcca58-8241c649975mr1610421b3a.52.1770173553601;
        Tue, 03 Feb 2026 18:52:33 -0800 (PST)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d163ce2sm804895b3a.13.2026.02.03.18.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 18:52:33 -0800 (PST)
Message-ID: <1035ed36-8659-4fc9-9a4b-aa6bd2c3a286@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:52:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Initial patch set for PURWA-IOT-EVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        andersson@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, conor+dt@kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
 <177014002716.3173249.7908353000261603377.robh@kernel.org>
 <e577c093-0851-48b8-abdb-0aee0479c1e3@oss.qualcomm.com>
 <d3mvqtyd6dsphkojenpalduty7x2n3yxf6rjazwndisxnktez7@iwb2nnxwvg4d>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <d3mvqtyd6dsphkojenpalduty7x2n3yxf6rjazwndisxnktez7@iwb2nnxwvg4d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: faeoOWT5BkQLLJQu-1hpAy10Dt1s4pcy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxOCBTYWx0ZWRfX0mXf77kNdu8Z
 2oFQo4jhNpGdyDgcIGvO1tNG8/CzRuYrJxcUwinida2Xki+jymgbyaUiSl1zge5fOAclRjYzL1D
 aFZHwZ6TQkifOtVvnPYF6Yw2Ji+kQ1YZg7K3ddSb+eyzWnT6r2ssElvXof4GMTl2iMAY6W3u0/5
 AzSVDDuXaOttJzCWICeXjEw6kYaNdMqRepm4pXffEO2MIwrd1D7yZPZ580FvZVMLc5WFW+fagE+
 GZ22EJHo6WZh9VLvTL4lQwLYeJXzHlteRjndJXexgZl9VZFzP5xrwzt9iHEfF//srW3GnlYudGk
 /5K7eKG1D5+ZM1b+F3PRY4IH0QKvoqs9Qvzk4DDd002cTJGBZYVGg1GxBDEhoHoDNxcybz+e/qS
 GwDgROMTfYmMSBSDvdv8oaHhbe1NU1PLiGwN7plv06LhoXH9L8YtNz1exE4e1s+8Z8v2sV79MAz
 SeybpLerN2Fm9PnSlcQ==
X-Authority-Analysis: v=2.4 cv=XI89iAhE c=1 sm=1 tr=0 ts=6982b473 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8
 a=-INMJSYfKEsmj5OeW-cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: faeoOWT5BkQLLJQu-1hpAy10Dt1s4pcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,1bd4000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91759-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D779AE104B
X-Rspamd-Action: no action



On 2/4/2026 10:38 AM, Dmitry Baryshkov wrote:
> On Wed, Feb 04, 2026 at 09:42:04AM +0800, Yijie Yang wrote:
>>
>>
>> On 2/4/2026 1:37 AM, Rob Herring wrote:
>>>
>>> On Mon, 02 Feb 2026 15:35:44 +0800, YijieYang wrote:
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
>>>>
>>>> Changes in v5:
>>>> - Reorder nodes in purwa-iot-evk.dts.
>>>> - Update base commit.
>>>> - The DT binding change that fixes the DT warning for pcie3_phy is located at: https://lore.kernel.org/linux-arm-msm/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com/T/#u
>>>> - Link to v4: https://lore.kernel.org/r/20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com
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
>>>> base-commit: 6267b2da1b2d04847a1a8f441e138bc4a89435ee
>>>> change-id: 20251113-purwa-907ec75b4959
>>>>
>>>> Best regards,
>>>> --
>>>> Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>>
>>>>
>>>
>>>
>>> My bot found DTB warnings on the .dts/.dtsi files added or changed in
>>> this series.
>>>
>>> Some warnings may be existing warnings. Consider fixing existing
>>> warnings before adding new features.
>>>
>>> Perhaps the warnings are fixed by another series. If that is the case,
>>> please set the base commit and any dependencies for the series using
>>> "b4".
>>>
>>> Ultimately, it is up to the platform maintainer whether these warnings
>>> are acceptable or not.
>>>
>>> If you already ran DT checks and didn't see these error(s), then
>>> make sure dt-schema is up to date:
>>>
>>>     pip3 install dtschema --upgrade
>>>
>>>
>>> This patch series was applied (using b4) to base:
>>>    Base: 6267b2da1b2d04847a1a8f441e138bc4a89435ee (use --merge-base to override)
>>>
>>> If this is not the correct base, please add 'base-commit' tag
>>> (or use b4 which does this automatically)
>>>
>>>
>>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com:
>>>
>>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
>>> 	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>>
>>
>> I have already listed the fix in the cover letter:
>> https://lore.kernel.org/linux-arm-msm/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com/T/#u
>> It is not recommended to list it as a dependency in the latest version.
> 
> You can use `b4 prep --edit-deps` to mark it as a dependency to be
> picked up by the bot.

Krzysztof mentioned in v4 that this is not a dependency and only needs 
to be mentioned in the changelog.


> 
>>
>>
>>>
>>>
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


