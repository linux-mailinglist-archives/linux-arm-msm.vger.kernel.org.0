Return-Path: <linux-arm-msm+bounces-100032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DK4MP3ExGmu3QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:32:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6E32F6B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A591302FA99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3CE33A9FC;
	Thu, 26 Mar 2026 05:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ih9+RDyB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEYf6lkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A007D262FD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774503059; cv=none; b=E5W01BKOmfzZ9DJa/ZoSlS0IAu+sJ3g772FwxHOOS4xoIFj2xRDz/FX0/MTx4fSa8N7FsQt3NBdeWxXosaUstDD6bVui9yBdlJbWqrQiVyiicxRJlygtD1TORT1eVetqN+/h9hjkdne0KRVDw/UJclytT7HnN4L6MssFiisY5I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774503059; c=relaxed/simple;
	bh=Dq7SR7mf0Ly7LwIQCtz2LyQdIOgoABM6QUbDgADI9yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K26VWr5JEaucYT7CXvXYdt4/qAf4eJKnqZoefcz5TZwXcGb6hOjf+fNUGhv+V+P4VruQs8hlWUL0EPBx5j2/LOhtx52VO1L3mfPXRxRmQp7FlzXOBbYijhFO77nK8ZjOHMpPWbAjgIFuwBZxg/4Rrlj5cg4qt9+BfuCqhIzI+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ih9+RDyB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEYf6lkd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKkucj051545
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gMXKWgO455kPcPMgxpEMZpFQL6OheNgUeaCwfhrzN3Y=; b=ih9+RDyBz0zclr9/
	BO4Oktg+F80XpIqcJQz9vmeFNVhig373WCPVNLXmpCkmIhB78HaQJuMx9d3pRG+k
	oQOy2oKgYhCQLNO3fA2aR/QpQXEZdNri/3WG/rVyh0D6lfxAnGm+Rk0pkSIDDWyL
	bVwAX2WSN22PJA4sq0W8CXkx1ltJCeJxfogIATbZH0F26AvuFNRIxFu1EUoVWJiu
	zuTlo0OATSVxDY1zrcdi+fsdffqkJXhotEHkjm4zYqSvXMuCjGIwi5U0QbhU9033
	WnUdhlFjy4vJOBE2jqkNhq8WwUpbE+mPVPsPL+2IQHEw/T9iPJyJhUTXoQ7kbsyZ
	axOj5w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t1b6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:30:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829b7ed8964so590981b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774503056; x=1775107856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMXKWgO455kPcPMgxpEMZpFQL6OheNgUeaCwfhrzN3Y=;
        b=OEYf6lkdpnDKgDPiW8pok3NIf87K4cIcyTJDkBox59nekIhKLVRt70MVXV8ZJiWlcE
         CnYvcxWuKkYfJ/jXHwNulzo2pwR41vg4I/xxvlInTcwVdJYzF16g3weK6f1/JjDSu1zY
         YDkoDMGN2e+ghA5c1pbW59hy8OxbqgNOLDEm6hxu20E03hSf8jirK+I0Tq1MLJZArxtn
         0Er9sSbAaEjZsRpSuJ4MmHHkkAW7EH4fREIsHEhDXvLVbyjxKrJ0Pp/2ls0TqmD8sVvV
         af6SsHVgHjyqL9VdQ2fsuxNONd0oU5NQHSWDYMzMgVrfOUAYG0ifUF8IbmC5QKTiKzUe
         Edqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503056; x=1775107856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMXKWgO455kPcPMgxpEMZpFQL6OheNgUeaCwfhrzN3Y=;
        b=nNfaqJmAdJo3BQ9hTtvsFBCZhYlIsgOb+/bi9T5oWT5RZz9LV5PCIw/xdaXpwyZrQO
         Gqyt1gtYxB+cjh3ctFk3ro1tlwVca4LRsMoOvuuGtsOaJ0ZwHpkxPtPZXBSpntV8p2wn
         +qjBjcF1+zdhpuTYTi+Dpr7tAftk4fB8S9h7oh8TjFrvmwvTNPcOEcUyM/+es3z5EsDX
         BPG6OTkmfkjcZpQEFBWNC4poVIJz9n2oafwEq5Fpoq1G8zboOxp+zUXZZxuKFQhEVk6n
         +li5MRs5PAlE/gqSmCHYqL+ojv3BNDyeaokIFNCZsBAAv3w+jeyD9sgWMkO8p9aa4lOp
         KW9g==
X-Gm-Message-State: AOJu0YwzvVWvkDRLb5FqJbkpPjAAqfX790oljbQNVnP350SJ0j6Utg1a
	QN9Pw8gSEob191wHPprYFJxp65+k5RBP3RnLE9Wg7bfCa/RztXr7y7REby9nlRLp/aSPSEwjgWP
	U+n7CxuJGSUu4vmWDzpZLhN92WFAUUf13nuuQRPJBMwkHMuBmRSSrdB11fhisVOIeKL+6
X-Gm-Gg: ATEYQzzOi9ekndMTx66xI63BXNEabvAXd3lhJH1+tAGVfcvEO6uUqwyeYg5vOo+mTHT
	T2zYrDIUI8kjFLJQ98uHo3TQJGq65MzSOi29UxXH5+0JLGW+8XPQjegk6+kx1gGQEw2AObK0D2H
	uLwbuDnCsNW+aHxy/Fe5JRPQ6K5iV0Jl4RuRlHszTWfE641HWsJ8xVy3J0DwrT9blHS9eilGvPM
	fkOR1SoJLG+KzOgwKOV6CmII2bZv1wkMyeXYls6v8S7sE93BnIwp2DiMRVKWAaH1DP2a6Kj4t65
	V/mpzT28G4jF1lAdMZuXL0MVcloKU007h2ODdbpYgvdAoZZNzfN6MikFuhyg/PSY7/MipezTfRj
	e8trON7uHHRzr/3DM2KyK6AaavUBSKJEjJm4HEH1pqKfUnkumDgGqeTv+iFb3hJDPszKB0UXZ4y
	IHaZ7sh3d1RvDa7y2ACoRvDgMvb7/qWH3bhw==
X-Received: by 2002:a05:6a00:1c81:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82c6ded3a6bmr6338208b3a.13.1774503055589;
        Wed, 25 Mar 2026 22:30:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c81:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82c6ded3a6bmr6338176b3a.13.1774503055118;
        Wed, 25 Mar 2026 22:30:55 -0700 (PDT)
Received: from [10.79.196.200] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3bf324sm1637749b3a.40.2026.03.25.22.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:30:54 -0700 (PDT)
Message-ID: <35a6600d-c2bc-46af-bf18-07f13038ee8e@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:00:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
 <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
 <95d9636a-63cd-4691-8d72-c1bb59c605f6@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <95d9636a-63cd-4691-8d72-c1bb59c605f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c4c490 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HFQO31-wg_kNNkEnh5UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: TSihJ5K5juqT6ceikBYQcP1VEOs6Sjvl
X-Proofpoint-ORIG-GUID: TSihJ5K5juqT6ceikBYQcP1VEOs6Sjvl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA0MCBTYWx0ZWRfX0nbmAUzCuulw
 pn3NMfqw3szxIAZK7Ko/14hP2pcmD0s9kpsnv6wFEOdLP/DGtSg9y/HQNSktbIf5iCJxPCXX6Oq
 GEGpIl/JHxNKf3+EZVeCj0kI4Z9IdOR5r+1dPM2YGjtwbCr9p5XADZeMHZSPAkqMyCiiPDT+zTF
 SbtHZcnUTjSwrxcCyP1iTJFMJ4sYT7Z/reGv44z1k90aWnVX1w5wZm3xcWIHr4QIPONnsm7te8X
 X6bTJCvsZhfRUfJ1KxE65iPNRa0jAbI2ZLgQdCx4rhRCdNJUXl+rudnlsDB0EImcp++Syhp6KE+
 lXlPqUiJOtzhSxxx0maA9vTMUTrepKfPPa5xLbYAb7h+YmellrpSwUYo0CYy2Vu0PM2+Yq9WZDY
 ZFVUjF1JYtgScZlESB2Q0Ol+mP3jJ+Kwdm6dU5zkB8EM5qpyQDqDaC+hwX9rlABsJd3A4tJ0Vag
 VMA3l2J+tU6UpqPMoJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260040
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100032-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.76:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4f:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26A6E32F6B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 5:50 PM, Gaurav Kohli wrote:
> 
> 
> On 3/25/2026 5:09 PM, Anvesh Jain P wrote:
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add embedded controller node for Hamoa IOT EVK boards which adds fan
>> control, temperature sensors, access to EC internal state changes and
>> suspend entry/exit notifications to the EC.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/
>> boot/dts/qcom/hamoa-iot-evk.dts
>> index 460f27dcd6f6..a0d2ccf931ec 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
>>           pinctrl-0 = <&eusb6_reset_n>;
>>           pinctrl-names = "default";
>>       };
>> +
>> +    embedded-controller@76 {
>> +        compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
>> +        reg = <0x76>;
>> +
>> +        interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +        pinctrl-0 = <&ec_int_n_default>;
>> +        pinctrl-names = "default";
>> +    };
>>   };
>>   
> For Hamoa iot evk board, i have also tried and cooling nodes are
> reflecting fine.
> Please feel free to add:
> Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>

Thanks for testing. Will add the tags in next re-spin.

-- 
Best Regards,
Anvesh


