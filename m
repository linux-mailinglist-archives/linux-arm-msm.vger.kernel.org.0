Return-Path: <linux-arm-msm+bounces-81242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7872AC4DA79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E83F188943E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5DF357A4F;
	Tue, 11 Nov 2025 12:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMXc5TrC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8KERs7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2081E223DD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762863890; cv=none; b=TAms2R9JPWYZ/2auSG964jNWVvw0TH76b2iNCK7itpW0544mBAH0JagUd4fy0+4ZR9zjPcpHt3IX++O1U4RRC7KZ8rR/6A2HqKrQFDp1aPQEBzbEIPap6bQhMxfdTeRe2dtNVrS+0TPHiazuBtK85xvqcmvnIl7rVDPWr0x7SyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762863890; c=relaxed/simple;
	bh=Avw7X3qTk5ackyNEfBq4lhvArrupOq2YpJ4TzkN/XII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QX7PgQQeEqI2SxlFhu5QDmFl+PaoadE4KRAHfe11s9YFRPiuGs08QPr+A7Ev3ZigQkeBYH5yFawGpLIXzdz7Mm6REqYI57aglZxb5RADjw1SZsYzhf8n8L6IgTN+rsjd65NXK4DkeMcSevgwqvWajn6DfvDEYJTkqIX2vYpqXHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMXc5TrC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8KERs7Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGVcC2129962
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mHNhND58kME9CBxtrtGEGN3WM9sabE8JAt1u7C/HVV0=; b=gMXc5TrC2lD9urT+
	du95VzmXIYitWe+U2x9j71zg+PZrv/TDApG1hbwYGp4wjiZB2SBAAlHLvJOEZPP1
	89idFJglIo32nVBjzTo4hV58QRxb0DVmgLcAaXfzdDywk6u4MY6nOZE1+cf+PKvf
	VUBvn85+s//3vRaPnEAWxpcGj0D++0TfAn7tLQZKRvU+SLQwbQX5oCL11geYuOro
	4hiRL4PGH4CVNGfXS9J80DE1ik+33+kZNtQ/AVs4jx4aK1uHR4sbHYwo3GF/j2sz
	p2omw10nWpPsmvGbYN9BukhQ/ResGxdhc8dj7Nag8N0undIXtERwtruQI/39ZFqT
	LPFzjQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abvhthk4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:24:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297ea27c814so6628205ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762863888; x=1763468688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHNhND58kME9CBxtrtGEGN3WM9sabE8JAt1u7C/HVV0=;
        b=P8KERs7Q6XNewMuS0JksUXft1WSRoJPfhRlSM821wht/LI1UeD9bUrXwOUrjA7Ex9a
         de9eFbQ+w94pF5rmpbTcvN8m5VST5fuKoPxcuQZFVuFkGMqBqVGt9kVIkqPL0bS69rZ5
         tAGwksq4JJ4jkfxx9NV5WMdlZhlMtHebO/iv+MGI/5nBnVfgmJ7Dvc0+k++yhGrDRyVe
         aFgcli+qs0RQSj1S7+5a4/Ll6l6jmRXhxCRuX3o6FWB7mKEzneOuIjkTtQ3sXYjbqvrR
         2ebZ/uG8tME3Idm0b/l7TL2i0PcBkptA96N/jZyZjfTjyr5iZ6FYzm19bjDU6/QwQYNo
         /7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762863888; x=1763468688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHNhND58kME9CBxtrtGEGN3WM9sabE8JAt1u7C/HVV0=;
        b=BAVTlsLHV2XoLYxe83Xu1xDdR07TnXYXTdJRiHh5v0L32wcRQ5PlAhtQLNupf3ss64
         qP74MKR1XcrwsucZRi0STMGo+H6/FvsP639riy4E3B6H+GGPiLM0OcYZNTTrBeXZwlGd
         Z9IPMszb3D9uXoMD0ArghEy9ck3LGzVlqaeyQloTZVb751EeFgTR5/Uy2rgn5DijLGV/
         lc4Uz+leLKBsel8xK5Tz3yAbJ56TmsBgVQHpkdMrQPAXi+idYfG+QiwSX518ayYT4L4P
         ds5LIf4j5Fyxl7dClC7RiL42YyfbGasxMCrZqsGVgNIvXYEHKkmD6miVCsOIIHmOv8G/
         kAjA==
X-Gm-Message-State: AOJu0Yzr0uYzUeWN28ZoHHX2Xwipl2EorfbxeedxiSc2P2F55rMwIhiT
	lPdFR9gzRl+MXTh5Oz+l7xUq5s/VqKfJmMotM0QrQgCJssgdmyfgaKUmPnigTFnqeb2WwZfcmAY
	6Qr/Bw/Jw1N4KNX8uPNvsbpFOHWVYSenTWsn1LMdHApFDsh7t3i7qyNpPigNA2Rq4IgEU
X-Gm-Gg: ASbGncvNHeGFkLJWINppp2ivP8dXymYMfDgtjri2I4NqzHYiYWyaK3B4/cQ/QLrilGb
	im+BfOnmCE7XrWe9XaHPT2HP57nPF21RTjsjLmBnltZO5oZH0QZA2AugSEi2H1hO+2TxyCKDHmD
	BKjprXaEWiTbflk4W3wmrxmIP7m5jt6WvUMS1ynfOLW8Uh3LNuSP3Nmi6AvX8rdauBODbPzF9qA
	+POn9T/aZ3/jqvT38KCLPCdxq2WB5yGjOIbddhp5CKjUedfSusLuozXFIYJlxmvmpffP5qB2QWH
	OwL7aSvqcxxwi2ayoP4vwnGzZu8YcMWZiZpQU+vSbsADzEXzGcUdS9iPGNoONC89Pwo5/THM7l5
	VtEqwz9x8R2TPZ2Vhx7CJ
X-Received: by 2002:a17:902:d490:b0:25a:4437:dbb7 with SMTP id d9443c01a7336-29840fee954mr19500155ad.4.1762863887594;
        Tue, 11 Nov 2025 04:24:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbcdL5X0IACg3A7zoRnqyk+K7b6Xue5ht0hWBXVIM5JAERQTpeICLLunHnEUY591aWR1Lc6w==
X-Received: by 2002:a17:902:d490:b0:25a:4437:dbb7 with SMTP id d9443c01a7336-29840fee954mr19499845ad.4.1762863887025;
        Tue, 11 Nov 2025 04:24:47 -0800 (PST)
Received: from [10.233.17.95] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b801sm183895025ad.7.2025.11.11.04.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 04:24:46 -0800 (PST)
Message-ID: <ee04e03a-ffd0-43c0-ba77-c7ee20aaac43@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 20:24:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable Bluetooth support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        stable@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        quic_shuaz@quicinc.com
References: <20251110055709.319587-1-wei.deng@oss.qualcomm.com>
 <28ffece5-29b7-4d6f-a6cf-5fdf3b8259ef@oss.qualcomm.com>
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <28ffece5-29b7-4d6f-a6cf-5fdf3b8259ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WeqoLY7nWbRc_p2BdTnVXWkUk3k2suZ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5OCBTYWx0ZWRfX0NKZ71kaARyM
 MCgL+IZ8aRd+U37OHvJOXCjwfxxgvvLurr9fT/BT9k5U+9wMIDDJisMtZ6DxuZ4XBgCWep8NZhx
 yvHJrn1sm4rT5Rf46EXwFfQM/rCJVB3HhSwnNkhVl53UJYUSHlb+IUh3Ypiw+JhQHewyNyV9dyo
 aeeXtu1VhraJUrdnFkslmeuU0ca81iFKtHkkFB9UD37VfH1+Yl5Fyr8BeGOw/R3cKa/Q2tX9M0c
 ygYAOLrLYXpUQA6cf/caX8RXCNWKmocyM+lU75qJyxSAqZLY53JQFt/TR5AEJp/MZ90b5Guagyf
 VAQQLqdeEWxP7686F/7X9uUj4STnozQP43NOzwTdomFypnyYxh+JZ0SnD7jPHsL9HG+GXhqs/4n
 nw7kaGW06i9Fod0Wu0iEZ+a6Silzsw==
X-Proofpoint-ORIG-GUID: WeqoLY7nWbRc_p2BdTnVXWkUk3k2suZ1
X-Authority-Analysis: v=2.4 cv=d4b4CBjE c=1 sm=1 tr=0 ts=69132b10 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=F864Gg6nNBeLBzAGB4AA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110098

Hi Konrad,

Thanks for your comments.

On 11/10/2025 7:49 PM, Konrad Dybcio wrote:
> On 11/10/25 6:57 AM, Wei Deng wrote:
>> There's a WCN6855 WiFi/Bluetooth module on an M.2 card. To make
>> Bluetooth work, we need to define the necessary device tree nodes,
>> including UART configuration and power supplies.
>>
>> Since there is no standard M.2 binding in the device tree at present,
>> the PMU is described using dedicated PMU nodes to represent the
>> internal regulators required by the module.
>>
>> The 3.3V supply for the module is assumed to come directly from the
>> main board supply, which is 12V. To model this in the device tree, we
>> add a fixed 12V regulator node as the DC-IN source and connect it to
>> the 3.3V regulator node.
>>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  &apps_rsc {
>> @@ -627,6 +708,22 @@ &qupv3_id_2 {
>>  	status = "okay";
>>  };
>>  
>> +&qup_uart17_cts {
>> +	bias-disable;
>> +};
>> +
>> +&qup_uart17_rts {
>> +	bias-pull-down;
>> +};
>> +
>> +&qup_uart17_tx {
>> +	bias-pull-up;
>> +};
>> +
>> +&qup_uart17_rx {
>> +	bias-pull-down;
>> +};
> 
> This is notably different than all other platforms' bluetooth pin
> settings - for example pulling down RX sounds odd, since UART signal
> is supposed to be high at idle
> 
> see hamoa.dtsi : qup_uart14_default as an example
> 

I followed the qup_uart17 settings from lemans-ride-common.dtsi. Since these configurations are not required for Bluetooth functionality. I will remove this configuration in the next patch.

> Konrad

-- 
Best Regards,
Wei Deng


