Return-Path: <linux-arm-msm+bounces-91665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIAgAFzegWkXLgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 12:39:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA55D87E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 12:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F4DB306F94E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 11:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179A81E5205;
	Tue,  3 Feb 2026 11:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzwA2nH/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PG3AScJA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891BE2DFA32
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118642; cv=none; b=WP7hICzOQBHH7q97b7/kY3kQNktz+EF6UoI9W6QcHV9Nksplz/hhwyFFoWY40pmhEMxXjJtCYce7mW6jwNZRcMM5hx5Sx/Lgn2gelWQ3h5lAeirdOTY4+oaDaRLjKBOhoiOR5xa0mdMTd1cOS28bHb5euPHvghhalRxAraZgOhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118642; c=relaxed/simple;
	bh=VTGy+hSixzX/7eAjbyiDKj+Mxpr1yO+yiNB/A8Ec2J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rgowGOrrkHc46Dqc4iPf+cQk8Bjwz9eVoH7nBRj3AMdFpZYmjbnHygcKLAKXemv4UjsDo7FCNLcT0dK7mSKwPbLb0Mh/Y3Pt88s0iStB4bRPaNQTy5VStqSUF4gg6U5oeKQK+g7q4Xbif2K2YuR2/n1ABK8FoL5lrDACB0RM8Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzwA2nH/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PG3AScJA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6135Ug573459099
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 11:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6Q5A4nPQoJIml7jHNWhTTRAmL4NDVJ4SCgRkqslwP0=; b=PzwA2nH/VQnFJdwH
	JR5/U7lt7WwbGT4WqaY/+lWlUUYSLXRFSHudbr/lVXOva9s01ENqDhrBy4Vj5GlK
	0MqNutlJNwLXV34J/78kMox+R9ZyqErUAHPaL7Zd8TmSL8RTlVHdx5J+EyImnCSy
	JbyE6N+vCS+HiAsTj7fsIPvFaNs9flAKQCx4KWHX66/mSJtCF/ZbrGuzLoqBOjZM
	YIs857WNwXtAtKVh6URHJ4bR+yPexgbSL4Nyeazi7aDXFwLqlRDso4Z5JU7dARp1
	kpvz8laivuqvdxQvbfqlmUYYzeRl93sCto5tjFwbuKrtB2hzunl2XDwTOQGgvpLo
	/H5a9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbm39a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 11:37:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7a98ba326so9073085ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 03:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770118638; x=1770723438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/6Q5A4nPQoJIml7jHNWhTTRAmL4NDVJ4SCgRkqslwP0=;
        b=PG3AScJAFFuXOWj47FplJz5vGUtWPzD9KmM0Gad42X+gUGINN0AKEpI7+PdHZmV+eJ
         FxP1nJovOaH6p2ZFttHTf5Uge8Q9iPWL69vQaPFmGHcUEiWq7hj3gySMwWNYPEcISLmU
         eojGafzEUJKtqUBV8wQYSsQqV5086xZRKrnrY1uiHtLZXKSI6rPKMQLz9vHyWz3gTS5c
         Ql8Bm401BvxhAZBXmUa+qHEs4h/Q19O+t02Laiy/j801Y66Xvnb/R1eLiexENF/cL1Ng
         FxN5s3OjFByA8FJnl852T9FB3sBIgPY/YDv3aCpKKTHCEwZCSRc90wJcYNwEcf05ERqI
         rGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118638; x=1770723438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6Q5A4nPQoJIml7jHNWhTTRAmL4NDVJ4SCgRkqslwP0=;
        b=pCDvQHcFuH9UmHZS7UspvqWwwe6kpjKkBPGa9yutyKWIeEaLAE6RkUud3Uqv4IcqLn
         whmlp+02MPyDKM5mLCXSQrww2s5M5R9JFopJzfgK5wd7qG2R/u8+EHtN+B1K8c1Ub/Yy
         JnuQGxI9OCrnSG03aOb6OWx/wsXAEw3uzI6hA/oxQjpAfdLz1jG/jcAxa6cI9HwWOYVx
         cURqtyfsiHUyIJx0wglF3qq/M/HDL7E9dZyAT3IiL2NFqsN2UgT72eaUoQDIYpoSJwkT
         TY1fZT2UAOxH1WcJolRVOBeU26Yvbi9mxwBXqF838RjUEX7JlFPP7Kb6VPCnh1X9GxBc
         79hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDlXK4fH+6b5IzBnOz4i9VNUl7n8ernnGnItp8+Up/HtTUu8hozx0J5lIvV99u8mn7b4rcPJ51NmuisaNv@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjaX3XgXJZY2fNWwKoh9n7MErm7mtjiKuBYtJQ1KOEhT1ojcH
	rzjh2onmAD0jBajE9XMBxy3hOr0m8Kve+2D2tVcw3wQUpzzfx1n5sHBPrSt7qUKccs6uCBdcYiH
	eOvgTFsuK0QwxrRyET/6lbObhdvu8bwVkfwXd0Jly54wxjv3TCmK09aWGwY89Lf0KKN3W
X-Gm-Gg: AZuq6aIA5uYWVdC/86Ftl1gYpcw5f5Qm8OQQu19RfpjktuY78Yqf1MwJIJYzB5yX6eL
	s5yoNjq3/f0r3Usv8U6iVcv5M2QlrjH/YRf/eX+jekW9+C86/C/DdIpSEdcGktyQf9P5eQfjpFH
	0z16VLCyT+ilj6HXvEqGm1uyDrAqjFu+18jt8BTxgR/spD4h1r6tRM10P57/4lbliu3j/qXQtyw
	yUiASrmH2fXZLHNRdjjSh84mlNgHNNOyJCeXm/RWwYhjoe2q4F/AdR9fU/1FVTyVfPEsBsTJIm2
	12A1Tx8fmMo6DeLT9k4QSa+M9g+AvMzAUZ70p3QPpYyEk+EkXxoMAsgVRuLtydKFqFVSXneQOva
	UafGsBd5bnZtIbqUJOCxdRu332N7krEvRot6LNVoo1AU=
X-Received: by 2002:a17:902:c94a:b0:2a7:a87a:423 with SMTP id d9443c01a7336-2a92465cb91mr25890405ad.19.1770118638303;
        Tue, 03 Feb 2026 03:37:18 -0800 (PST)
X-Received: by 2002:a17:902:c94a:b0:2a7:a87a:423 with SMTP id d9443c01a7336-2a92465cb91mr25890315ad.19.1770118637839;
        Tue, 03 Feb 2026 03:37:17 -0800 (PST)
Received: from [192.168.1.2] ([106.222.228.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4153c6sm175587305ad.37.2026.02.03.03.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:37:17 -0800 (PST)
Message-ID: <5486697e-d02e-4b12-9a60-99d0de343515@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:07:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
 <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
 <n6affntgff5wy4xmm255v5h2ejpepicpz2cybcuvsxmry5td6u@jucskv7zrzvv>
 <5cdfe5a5-3c78-45a2-886c-768b224ad776@oss.qualcomm.com>
 <wbx2qrkhpsntggzqkzkpi4sa6qv3buhkjbwmjoa7zgw2oc4b7u@qugyhcxb6qrh>
 <316fa702-6cd8-4842-aecf-c176a5a53e2e@oss.qualcomm.com>
 <qvuokwiqllm6zmlzj3pfvziylrr5krjya5rnf3ojeycdoutlro@fl5qukh4vorm>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <qvuokwiqllm6zmlzj3pfvziylrr5krjya5rnf3ojeycdoutlro@fl5qukh4vorm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i2krzQWdX98NfOiDBoyS8NfL-Rrtyjaq
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981ddef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=MIwPJUb4XD/Z2H5uR64eEw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=aEdQ800eGeG3iW2-5J8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: i2krzQWdX98NfOiDBoyS8NfL-Rrtyjaq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5MiBTYWx0ZWRfX547x849prxRJ
 w8kAxWNQlNs/G/5fz/Ea6Dwi+H9Mz3rY7b7vAWdCzmFbsxhHcT7aO7yr7WHDt8ZXPYC9heevj4p
 44JxNb7ejLeJ5gzBKaDsg1fJp8lkp/FZDwlXrPaKFR04oUMwz7r/pT5Egl7tQbHSfX4LzbPtq7A
 yzf56Kz9Wv5UH26iMy1y2bx3n5+/q/6hPNjVzCfJIJRU15sYVLjYCO7KXLNqabN9YPLncr8IDRQ
 /mVNPbxGZF5MWi6k8MBDtRWCqsV0+wHTz47Rb4aSDH1gFI8/Id9udv83jUmsKxEhcO6FGxGi+zI
 DlG2E+5BZQwjBXr5xtC3Qmtv3Zb5A94o6uW7gibvoLY8H7jgl83RKmEkdWsHKJ4X2PaJt0ExILO
 Qq5YFFvNy2PPQnnLUVQsxfdYARfI4JlkI4/53ya5A9qBOriQcRsmmn5YJucAbt4IxB1HYAmvkoK
 l8ZE/yIfdcmDoAtEasw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91665-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AEA55D87E5
X-Rspamd-Action: no action



On 1/19/2026 11:59 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 10:21:37AM +0530, Viken Dadhaniya wrote:
>>
>>
>> On 1/9/2026 7:35 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 09, 2026 at 06:23:39PM +0530, Viken Dadhaniya wrote:
>>>>
>>>>
>>>> On 1/8/2026 7:33 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Jan 08, 2026 at 06:22:00PM +0530, Viken Dadhaniya wrote:
>>>>>> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
>>>>>> The controller is connected via SPI3 and uses a 40 MHz oscillator.
>>>>>> A GPIO hog for GPIO0 is included to configure the CAN transceiver in
>>>>>> Normal mode during boot.
>>>>>
>>>>> The main question is: what is so different between RB3 Gen2 and previous
>>>>> RB boards which also incorporated this CAN controller? Are there any
>>>>> board differences or is it that nobody tested the CAN beforehand?
>>>>>
>>>>
>>>> The behavior is consistent across platforms, but I do not have details on
>>>> how other platforms were tested.
>>>>
>>>> On the RB3Gen2 board, communication with the PCAN interface requires the
>>>> CAN transceiver to be in normal mode. Since the GPIO-controller support
>>>> was recently integrated into the driver, I configured the transceiver using a
>>>> GPIO hog property. Without this configuration, the transceiver is not set
>>>> to normal mode, and CAN communication does not work.
>>>
>>> How do we verify the mode on a running system? I have the boards, but I
>>> don't have anything connected to them over the CAN bus.
>>>
>>> BTW: can you recommend any simple setup to actually test the CAN bus on
>>> those devices?
>>>
>>
>> I tested the CAN controller using the following commands:
>>
>> 1. Loopback Mode Testing (GPIO hog not required)
>>
>> ip link set can0 down
>> ip link set can0 type can bitrate 500000 loopback on
>> ip link set can0 up
>> cansend can0 12345678#1122334455667788_B
>> candump can0
>>
>> 2. Testing with External CAN FD Adapter (PCAN-USB FD)
> 
> Thanks! It's price doesn't make it esily available, but it answers the
> most imporant question: by the USB CAN adapter.
> 
> Did you add
> 
>> A GPIO hog was required to configure the transceiver in normal mode.
> 
> I'd phrase it differently: to pull the transceiver out of standby mode.
> By using the GPIO pin you make it always stay in the normal mode. It is
> fine, but it is not optimal. Instead a proper solution would be to use
> the MCP251XFD_REG_IOCON_XSTBYEN bit. Could you please instead implement
> support for setting that bit, based on the DT property.

Thanks for the suggestion.

I tested enabling IOCON.XSTBYEN, but on this hardware it doesn’t bring
the transceiver out of standby by itself. With only XSTBYEN set, the bus
remains inactive and no frames reach the CAN adapter. Clearing LAT0
(driving GPIO0 low) is required to put the transceiver into normal mode;
data transfer works only after LAT0 is cleared.

Given this, a practical approach on this board is:

drive LAT0 = 0 when the controller is started to take the transceiver
out of standby, and

restore LAT0 = 1 when the controller is stopped/suspended to return it
to standby.

If you prefer, I can make this conditional on a DT property (e.g. using
an existing standby-gpios or a new property indicating that the
transceiver’s standby is wired to GPIO0).

> 
>>
>> 1. Probed and verified CAN transceiver pins and connected them to the
>>    PCAN-USB FD hardware.
>> 2. Configured the CAN interface:
>> 	
>> 	ip link set can0 down
>> 	ip link set can0 type can bitrate 500000
>> 	ip link set can0 up
>>
>> 3. Configured the PCAN-USB FD software for 500 kbps arbitration bitrate.
>>
>> 4.Sent a CAN FD frame from Linux
>> 	cansend can0 12345678#1122334455667788_B
>> 	
>> 5. Verified reception in the PCAN software.
>>
>> 6. Transmitted frames from the PCAN software and validated them on Linux
>> 	candump can0
>>
> 

