Return-Path: <linux-arm-msm+bounces-99600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAZWJophwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:03:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1462D306243
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8703315B400
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2683DEFE6;
	Tue, 24 Mar 2026 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2hle9oH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9yoR5wL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D453DDDCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346155; cv=none; b=mTsHfK+5jqVcbJuQIe+Qj20P510RqkhTBhCO+T/UbZUaymjutc+jQBNZQjAZgB4D+3kZnBgrRHKaOPmUDY50gbadDnyrzN1dftAKKuMYQT0wqmKg6QvcHWb/uOoSbSywJ5yx/ciPdRVbjlEthrxvF15pwCW336ENcSU/cyoefSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346155; c=relaxed/simple;
	bh=oVgkaVtz91mE/xiVmVh0hQLbCceBPd9+07em93yhzqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ap44MYAGeyPjJdNHmdnMslqADXd2fuBqf9/PDJhv2e/+xSxqIwDNcK+s264V0XrxGwVVCgxxG2x9O1jgo6km/JOgid2XcGt4cNhKctENnZBW6bMFqsYRyMM6j7GwMJSbERMKNdhTHIey7p+LOsb96gVWQny1A1B8mvB2CEDsCTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2hle9oH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9yoR5wL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4ko1G1908879
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5iYBqMNKJHnassGYoZORWdJcd9t1QyKBPk8wMftn6M=; b=E2hle9oHSOsLdty3
	1bu7QFMAWOiSpmhAA8OK8BxRgb7INovQpp9q7D35wdDtabolb2feI/g1nAOLlk9u
	AP2WNGUZaqP/OIOidCROvlPKJIrYSGxgTwQsT9zydg4Ny1XmFUe9wI34FG6zSRJj
	DEePFqd+V954xmabIuvwmjRr0tAj/OZ1UzVAJ9qVzB3/W+5nIhN6qB+l0JDx5Hg7
	NLn9vMmTNQeTmudewGE5R5qQv2jtnvz+BQ1hwlwKQ7/uJIY81Q2QMarDjkxVQHBk
	67t42Yz8in0xLnneC4PjHf8zUc15VCfRO7Ogn1jv+mndbWZESQgCbj4gflftEhtb
	BfekrQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awytus7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:55:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0ec884bffso3675241eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774346153; x=1774950953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5iYBqMNKJHnassGYoZORWdJcd9t1QyKBPk8wMftn6M=;
        b=i9yoR5wLdufRBi8iVHdsvK7QZOC6hma4x6uFPsd0k1zi0dGx4lnQv1nhWxLiL8E9Jo
         8ur8+mfMdSNDb4gLcGREdi8d4rTnHwi461lZo4A75LLLx/bw7aKb1y7fKVRmrHB3fM2f
         DY/GwcGu8a3nWbWucM5Nt2Ba5yP7qFqy2ol/yVmzhj9SFRbO+AHySkXe5yk5RWfLSQYu
         3kb7bx0u248XDTBuEsiGFG0xuT9e3GqfQ0UehYSZl3MeTBSZQrsOkTTOSpZRgGcQr6X+
         eSoIMkW3FP/24HRBxkplfpXwRzmJstLCo53DjsTIKYzXi+KK3eEMys7l5GSDJQuOPTFY
         TpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346153; x=1774950953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5iYBqMNKJHnassGYoZORWdJcd9t1QyKBPk8wMftn6M=;
        b=GYPbe8Cgsl+ctXOu1m6XqbKe0anhwzk8DmXWE/o2vXb2YboYgEbVUFSRfrUv1OPmB3
         vtfn++gzYpjzSJUvH9AerP1x/b2TU3OnsBgQIpfnkxsI3OtgkFnWbH5IBwqPkSayYIJ7
         Io2Ugf98WG2BqKlklGpgp6DcWflFpEEaVzEZjFVpI/lKvTpNw9e2d0JUkhFdypeZ2eK3
         Z56Y65yhbCrIxLfq6f0VG4W8oFeb6xeX6j82zEBT4Q5gBCCcxdOby1iw2M3FL2WUQnKx
         el/kzQnLRSjENCmKLyTb67hv1qb3OHrPPx53b1+TIhWryuPkSW+/LdyykYjiykJXrVP0
         XX6A==
X-Gm-Message-State: AOJu0Yz3IdVBAh4zrIuAZY+FgzqTwDEVgjIy9aVtFpaWhAa1vLXBSDee
	M9poDVunT1BxFGz563vnGgnakFikaL382ty/x/I6EaaAxNoXbJW1aeJYIHT3emoJDjp00oj25s2
	FDLTgX3YsrZN4vk/tGqq+QLaEa4YJixe1Q9RQurfZ6moDIDcbHFDasAtxKK63o+LhzPr9
X-Gm-Gg: ATEYQzxkIcPwibe+W3/chPO2uqNcFa9bD9gJ2e0BsxP9aawDx52p/kPyrqJiZDhqnKD
	URuOLek8a17NSudwyVOhtOvb4Qr/WqXX5TD9jmMG4SIwemMHzjOZx30SZWcHhHQPSMJ//GZ81lD
	j4QjglZ1HML8vAq907Hr4cSBD/jvcVRGwK1+61ij26+aklEQRo09yzJDfxcnlRnR/UXCbTfoZgf
	2HnxpQORwu9pj2DSyUwr1YRRC3IKDQWDtRnuYAzcb62/FQ5Qb/1z19zlzCOiUicYHyMx4aoqpPr
	TPl25sKQ8Oq5z9b32ezAklQIPSaehYAaN2Tj3W41nEtkzDLDM4jrLy0+u5FgZPi8SqrOLAqAgQP
	C1pyXygztDMq4TkfTY/EluHNhlBLCTJM4NHG42VaYRjRv2vwQ1kEWZ3k=
X-Received: by 2002:a05:7022:2224:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12a726caecemr7430232c88.28.1774346152582;
        Tue, 24 Mar 2026 02:55:52 -0700 (PDT)
X-Received: by 2002:a05:7022:2224:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12a726caecemr7430217c88.28.1774346151966;
        Tue, 24 Mar 2026 02:55:51 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733dd8c0sm10952644c88.5.2026.03.24.02.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:55:51 -0700 (PDT)
Message-ID: <0af07be1-ec91-4c18-a7b2-ee1ba5dc9e78@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 15:25:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, krishna.chundru@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
 <774ef0b6-e3c9-4613-967f-617ff03adb7c@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <774ef0b6-e3c9-4613-967f-617ff03adb7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3OSBTYWx0ZWRfX/a79HVXW76KL
 IZ4LAHxGxLf794bULC1gjj5T5Mwo88oQE2JYNHHTpAWVYQ5+75zBo7t9CZgWiSi9/2wU9jvgV7t
 yNZm4QmrLkoKRwPAB1qQT5kDXmDANBYqMK7Cq6YGp0gBxkl42Mbkfv4Gq1i1SZQYaxiOGUnDvVl
 Jz71g3laVxYgdDr1lx1bzljfBCPBoEMd/RRWggLrvSvquwbR8wWvkO/GIusMy43Nx5rV8Ez6ZOM
 lvgQIb6tzwjWcp2KRocIg1rflH4J3k2OWEgLqKbehu04ere5UCs/au1NhOEUir89GNL7D4OQw0P
 Am6omcZNSjVdS6fbxY7v5uYHOyNXGSudYQcYyoVoOvugEjteuN7QjUVH+RJ85CKHMJaHS5lePOm
 PZ8eXPXepefDw9b/t/PsELTkdVbc8mbMFKZEIIluOBm5u1Pa8xYiPiku1RWtIyTyX1H3Ow6emNd
 ZeURsQzsRow3dyg67Pg==
X-Proofpoint-ORIG-GUID: F-woAe5DCm28BkCRN7h7ygU3WBbnZWwN
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c25fa9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mkSd36kOS-caLY2HFoEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: F-woAe5DCm28BkCRN7h7ygU3WBbnZWwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99600-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1462D306243
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 3:07 PM, Konrad Dybcio wrote:
> On 3/24/26 3:32 AM, Bjorn Andersson wrote:
>> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
>> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
>> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
>> interface.
>>
>> The Renesas chip is powered by two regulators controlled through PM7250B
>> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
>> The Genesys chip power is always-on, but the reset pin is controlled
>> through TLMM GPIO 162.
>>
>> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
>> allow it to be brought out of reset and discovered. Then describe the
>> two peers of the USB hub, with its reset GPIO, to allow this to be
>> brought out of reset.
>>
>> The USB Type-A connectors are not described, as they are in no regard
>> controlled by the operating system.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>> ---
>> Dependencies has now landed, so this provides USB Type-A and Ethernet
>> support (when renesas_usb_fw.mem) is present.
>>
>> Missing from the RFC/v1 description was the mentioning that unless I
>> pass "pcie_aspm=off" to the kernel, the Renesas controller fails with:
>>
>>    xhci-pci-renesas 0001:04:00.0: Abort failed to stop command ring: -110
> 
> +Mani another quirky piece of hw, perhaps?
> Maybe +Krishna has the datasheet. does the it talk about ASPM?
> 

For PCIe adding, Krishna Chaitanya to thread.

