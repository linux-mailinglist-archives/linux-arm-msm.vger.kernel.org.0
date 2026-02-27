Return-Path: <linux-arm-msm+bounces-94385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIzKMrc1oWnRrAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:12:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BBA1B30CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E5933032071
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A899B3E8C74;
	Fri, 27 Feb 2026 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IzmZN17z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED72331A73;
	Fri, 27 Feb 2026 06:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772172724; cv=none; b=s6gFmVLAqSC5Ko2q9qVgnftTxvVldJH3Mt2hdFzDBdzioPDIkc1gJ9kVgv0GIl2Xm6Wb7HxoNNHDXIqFIB80oSapVIewMZXql4LRCH4GWyBYfdiwUuMtoFovTb9PBy/GEvaNnX9Es5VpetES03Ehjp/kFGlB9Vg1J1wnhRJfWQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772172724; c=relaxed/simple;
	bh=uY2Z5obQ3i/T+cMUA1leBIGw/n8/ODFYUeDen9+ixns=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=l9+zGpzo8sLtYmyp62QfRiMYBzVCOfCxhTFbKEEO4nHtVKhYIxFAAL6HlFg+ZVGOml0a4wIb/52XxDa+AjYMGnOr24QDBjifJsN85ETk8pOimJoZPZI3+S7g7ctmHBTZEVA3o4bGkuTgeO3IMTlUnEsbRG8WgWrT9MVQuTaD41A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IzmZN17z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K1MJ2353432;
	Fri, 27 Feb 2026 06:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeGtTUR/zot8X5BIsR3y04//aM9O46jC2PmQwV2XpcQ=; b=IzmZN17znusUx7Ir
	lbtWXdMPs1RxZCLoPGwXDcMdLF9GKR3ymMl1Z1Blk5nWGfgMfY3HqxxIdruqia1T
	I3eCgIxIRIFmhUwJyvI6WV0nBaWXBYcJoAIv0TbkyfXnD1wVW5KGoEF4czLd04wC
	u5+mrmvNOthgaV6SJBEX4WnryTfb1gz6kgpVHOXRft7nBICsGXMe4jcltJVWlk9y
	iIbEgPIgtxN9RJqj0/7nuZgT+hmBxi/IMVLNnP3/jp9j3Vk87K1+4QPcdC9Q9hHp
	f4tyxieK5Vns4jbtFMgS7xKSD65tirFISgjF0jakx5kKvTJMKIey3oH+D0BMu8Bb
	cWokVw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u3hvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 06:11:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61R6Bw92019054
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 06:11:58 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 22:11:55 -0800
Message-ID: <b75da34c-1986-cf71-0553-be2073e240c9@quicinc.com>
Date: Fri, 27 Feb 2026 11:41:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5424-rdp466: Remove eMMC
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260223100552.1050303-1-quic_mdalam@quicinc.com>
 <20260223100552.1050303-6-quic_mdalam@quicinc.com>
 <a6b55256-5eb6-4547-9cfc-5492cd93b020@kernel.org>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <a6b55256-5eb6-4547-9cfc-5492cd93b020@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfX8jox+e7vQw2J
 j4ckvhtt3+AylmV0clIapaBfITPsvBWMkYvqDmsCzo0KJrTp+GareaUh2Ub4nvGe7tDvmYBIOHK
 +ds8+KQ35nQBkUoXkwdQMLRUVyTsrFjCenvroHf/3x9WGhMcA1CZaJfHvz3VM4hA9ELHEMDQ8ie
 xbrMhC260i/OknpPOUntRgT4oUS5v4ERPAPD3ipEqcOXE7rZHvaXteJXxezvNcA6Y03qUyvyG2c
 qIPghwN4IS3wdjk435QZ1TFMh6cXr6jmmbS3DyiI6Gv+wA27UMxl9Obq41OQYYxqt003Rm3gVw4
 Txp24GJrhN8zgx7rMb/e9HZ/+dBNTXvOiAB01ksmiWBgaE8Equ6HXw//eWAWktAI4R/0ceyrnDV
 YTixYZ/4E1rSq5siYL+pdQXIuQ8X6ijEsWkZSIenHLHH5b3LYiWq2ciIZEbtMs2TEiCCyhtMfuL
 s++Po6RptswoggzG7Og==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a135af cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=AmzfQV_qY4rmN1R1o4MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9vKMnFft5vWSS1bl7-n0P8S1qo1Jg4oS
X-Proofpoint-GUID: 9vKMnFft5vWSS1bl7-n0P8S1qo1Jg4oS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[quicinc.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-94385-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67BBA1B30CF
X-Rspamd-Action: no action

Hi,

On 2/23/2026 8:29 PM, Krzysztof Kozlowski wrote:
> On 23/02/2026 11:05, Md Sadre Alam wrote:
>> Remove eMMC support from the IPQ5424 RDP466 board configuration to
>> resolve GPIO pin conflicts with SPI NAND interface.
>>
>> The IPQ5424 RDP466 board is designed with NOR + NAND as the default boot
>> mode configuration. The eMMC controller and SPI NAND controller share
>> the same GPIO pins, creating a hardware conflict:
> 
> This *MUST* be squashed. If it conflicts then your previous patch was
> not correct.
I will squash the patches and update this in the next revision

Thanks,
Alam.



