Return-Path: <linux-arm-msm+bounces-86217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D77CD59CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BA19303750F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C9A311966;
	Mon, 22 Dec 2025 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TqPv7ecc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B8miErjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D553309EEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399659; cv=none; b=Y6K+eXSci0WbAg2jary9tlFoSa9AaQS9irFb5WJ7jmFJiQeCcg08eRQjjsVas4qMKMRtdmUlPJKBDH2E/sE+vKuc46PC7Yf0orhOOajQROQxolfXnuncWL2Nm2nVC0DXC+E6rCAfUJvbN1vXHI9stG63mzobS3mZuJFFa1gYTvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399659; c=relaxed/simple;
	bh=DueunpP+LPzYpuMq5+8ZyXotVYWfMtuVEMFhlKWnYl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTZwbC4pgpnxeFP2+ftn5zahSPoNUeQOScNeJ8WkmRBQaEqtCRFdXjUe1eogaCw0hNv9mY8MI74Q2y5YOvF90cT4WvH2b4rCh1ue951QwrgonYqh4VZjDMZwrl1NZoFykjxwos5/jee4aMhZw07G8StydnF/p3TWl2VRVBTnC7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TqPv7ecc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B8miErjP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM86N8v3729732
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upEeL4ZQ3ZDkVenwbkJ58Fhp97VcHoFeYpXcUTrSdys=; b=TqPv7eccvR/5OPG2
	pviQVvFH5/+rsxZJLseokIhnrNz/MUeYnMi76VG+1sQ/xX6TBPKZhCApb+UVeYMo
	umVUh/zj0MhC7HJ91pqSvIOyoUjlpO04ASpqvMMeKAHrIprxyyz+eWsdsQzuqU6h
	p5ue3jdN8F3MarfwwNNJ4Kh+C4L1kI5Ami0OzY7gKqXQarehGbLxVmF+wpwfHWWU
	aLz5JyQ/s92GySiBXCUilAIwcRjioXSnNuA7y1XmoTr84o5vRv7lxZRCd2lZM6d9
	diYPr5OxFhYvPMDLyODWvVAE0RZjO+CHro8u4Dcx/CAtD4kxZlJd0LbRXJ/z74mh
	42yYRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4p75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:34:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f29ae883bso55646255ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399657; x=1767004457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upEeL4ZQ3ZDkVenwbkJ58Fhp97VcHoFeYpXcUTrSdys=;
        b=B8miErjP9vFcOm9w5sZnj0E1Fw12nRyUwjWBu0CMtlct5N5HmXLRb+QOiOfdl7rtu7
         6BH1YAYCyS7hpMOpbAbBhDpf/tHYAznxUDRsnj4XpPeKheMcYWtDMZGnpqweeLUzTlBR
         zr38KGpYIbVYBWU6jTY9tkVI/aqkY6kLAjLc7eBK5xjiCiEwPi/ZbnsZ7z5GE3s8lOlq
         OD+tjOqe9PoG5C9VXxweh3JeqZyLg7YuQrLiQ7tZTvUGQzW/wd3t12WulPDIdmoGsGBM
         gfZyXhFloCbfdpdSEqi4vCM7y3Mdo2rGAb6v5Ql1dfAk7uhC9Zb9RvumUSYscawQQaa1
         WhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399657; x=1767004457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upEeL4ZQ3ZDkVenwbkJ58Fhp97VcHoFeYpXcUTrSdys=;
        b=o0wDEQIcr9TwaFtMaCtybdyzQuDrKBkrIcQMTR+mjg+kuYfshQ1sSxCOM7oiZeGwZD
         W3C1vJrtSuzfz6J6ukWI0fTn4Y4aUL1K9d/07JGp51H1ry7orutjys463W4lTaAe9O0a
         zo6irGgrDVmM6SD/lVoOIBip5w2z7/7mi1ek/Sob8elwvVqbB56O985wzmyo0mojVfac
         H0/nV0I6YFpWimS5cmAC1el0e5R4Wz7n0It4L7tsXSdp1rjAD7izroqBZZgA88Sfk91d
         uPoesgAM3cfLQpgu1/YzEhwF1lbalqdzPEOqiwywFXwsFF2VqVuXoimxwOii+41xBZv8
         AHtg==
X-Forwarded-Encrypted: i=1; AJvYcCW5/B/Sf02hggz8tza+AC3VbXUl+enNuu7xQoPkaqJxP3hMlSkBxkTGjmICXDMnkCoLdtXOxKyK0OOKFs0+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzco8R4jWPIJ5gGiI0S2JoAU1HFxTwd9jzKGVSTmxBhKCXE2diJ
	/CpxVapNMjPbHW0hySunGmgJ4s1kmbuGn9doMs7Yrdcd1FUnHt8IbrFXejTqaCejgS2Og3ePPp4
	N7iPefhBCpUxO57RFPzDEBjog1Q9Ny5h2QAB6CdJIUMuGTlP5p5hxr9oFYz3eA5jAbeHBOuflWo
	qe
X-Gm-Gg: AY/fxX6l/E39noAN2Xq2/qEI2wOzfljYUpZYfQR4Dm/Uiz2pzqisSHZnRTtYNykjkdH
	8AWy3swouJ3z5WCQUKzYIhEQU0/LR+MGQr/TTtIjaujHU0goMmTqvGe0J/81ckvfXCeqY3H9Pkn
	zhUv+s9f/wsH8rHnLlFTPx+tLNGgsuXYCnQbY2i+18/VGLan0NhAI7A7T2USW7vFv+hhLXfsZ4z
	XGo1gcBcsixWhlsg6WcbdAfRXN3MmJWj3t4J6Uttxn3rlUD7VgW/5MLaY/YApBmNN+37VKA9V7f
	osUxWyPazFqh+9rR5OTwnCF0h2oPmoOuCxofCC7gI6KGOXfngtelkOrMpEffCsTM7ylU8XHW9nX
	OTWXnSzGXH6NKKR3tE5xq8+1XjEbsA/dKnDkbz5t7Drf2
X-Received: by 2002:a17:902:f54f:b0:29d:584e:6349 with SMTP id d9443c01a7336-2a2f2231accmr113770935ad.13.1766399656540;
        Mon, 22 Dec 2025 02:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPXS5mUMbO5Xq6d0cLw60JERMVaiiop78hKINewCgC3Co+qqGwI3ZMrNDWQAXh3RXNXany5A==
X-Received: by 2002:a17:902:f54f:b0:29d:584e:6349 with SMTP id d9443c01a7336-2a2f2231accmr113770685ad.13.1766399656052;
        Mon, 22 Dec 2025 02:34:16 -0800 (PST)
Received: from [10.217.219.25] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c820b8sm92614475ad.23.2025.12.22.02.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:34:15 -0800 (PST)
Message-ID: <94b7e446-f96c-43dc-8e19-856c927a6cb4@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:04:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and
 IP_ETH1 channels for QDU100
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <20251209-vdev_next-20251208_eth_v6-v6-2-80898204f5d8@quicinc.com>
 <20251210183946.3740a3b3@kernel.org>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <20251210183946.3740a3b3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NSBTYWx0ZWRfXyIOh5T0McYo7
 YUzhUjsZFjS75s7pExK+KXAkqJbF5/oh/pYgFvvvjEgzwC9LQ0F4QMFYSajE1jByTSowpUcweDO
 SvxGLNyb71n8+nVElSoG2IRxngJ/sfCFXN7XEJ/vdQCU/GTkUUk0fOVuyEBENJlUn0hVkitgQwl
 pB0U3VN+xHZ1h+bWqH2oonu5T2aMfZ81AN0JBuULxkEKFSbwbrwkPVJEGePsHGCX9mVQaa99JnK
 oSABGSEYe9bWd86pdrpoZtXH8nWvz1C05vw5vvTZV02XQRT/PzoH1S9iPuVwXM8HUruyW5rjRVo
 thXb74uEm1QFrnAeTiMRXA4iLK6sk5s6RQb/HEFhklG01TmFVFGjEQwubduyexuESX8N7XHalgL
 cZgGKww5mCXPnxXBSSG9yqmcap4mmYuTEozYwFqN42EIzGl2RU21vS+sVm8s39KJeAjDCg8CJUL
 2wadcRBzDE4zxAcBzcg==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69491ea9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=t_Bvvv5v3GB4GvIpbm0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: gk1BvzEuGULQtXIdRfiWwR62FcRAH2fh
X-Proofpoint-GUID: gk1BvzEuGULQtXIdRfiWwR62FcRAH2fh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220095



On 12/10/2025 3:09 PM, Jakub Kicinski wrote:
> On Tue, 09 Dec 2025 16:55:39 +0530 Vivek Pernamitta wrote:
>> Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for M-plane, NETCONF and
>> S-plane interface for QDU100.
>>
>> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/pci_generic.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index e3bc737313a2f0658bc9b9c4f7d85258aec2474c..b64b155e4bd70326fed0aa86f32d8502da2f49d0 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -269,6 +269,13 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
>>   	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
>>   	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
>>   	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
>> +	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
>> +	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
>> +	MHI_CHANNEL_CONFIG_UL(50, "IP_ETH0", 256, 7),
>> +	MHI_CHANNEL_CONFIG_DL(51, "IP_ETH0", 256, 7),
>> +	MHI_CHANNEL_CONFIG_UL(52, "IP_ETH1", 256, 8),
>> +	MHI_CHANNEL_CONFIG_DL(53, "IP_ETH1", 256, 8),
> 
> What is this CHANNEL_CONFIG thing and why is it part of the bus code
> and not driver code? Having to modify the bus for driver changes
> indicates the abstractions aren't used properly here..

MHI_CHANNEL_CONFIG defines channel attributes for the host controller to
set up channel rings. These entries are part of the MHI controller’s
configuration so that client drivers, such as the MHI network driver,
can attach to them. Each interface is mapped to an MHI channel (for
example, eth0 → IP_ETH0 channels 50/51), which is why this configuration
resides in the bus code.

-Vivek

