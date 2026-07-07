Return-Path: <linux-arm-msm+bounces-117121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UunKKymNTGp5mAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:22:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5257176F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:22:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jVak5XrJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eexlgcwb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117121-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117121-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24B9B3016B8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50921384258;
	Tue,  7 Jul 2026 05:22:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC55346E70
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:22:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401765; cv=none; b=mAMbqUUe7CeCpIcOjiECOi2f1LBzJqfTdAll8eHq48wOzQ5VJ3OMU8wrGkOlFViO1mR7HnL5wt0t8AqvVCkeyhWPV2YTA+gLpGq1JgQ/dtPZhqdgLn3T8lOotEFVXWxUtyBv3H1s30BynUQX+s+SBNAGPisZvq+2YmUIgty65f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401765; c=relaxed/simple;
	bh=ApKlw4zdM1kqaFRJB1TkfiMNzc9jbXcEnTAG9K+OdVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSr7141bzTaPd78Xv5c/rL18gsNoeu36KowduLfmLaxdHYP5xpiSwCG5BTwoPeImIyRO0GDIOFJl1hMhmjW+JsC3tzZxfWB4KOx8UHm5fjLVLVb9iPBo4uEMljM6rLVoPXwpFQAtAod4NKXJv8gZpzE2GDgqE7TvBmhX4/EJ4Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVak5XrJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eexlgcwb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748m2h2450302
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uz7oXNCfrlOoGMhAm5/uW2kJhx4TLmOTtca8THmwAXs=; b=jVak5XrJF8UTqII2
	2wV4zicP7nMHMmWN8O9uOWpCPLgbM30BMFwSfOef1wXQnOqZXGyACOlQUW34CBqj
	NX21SMPjKCD59TblcAUkFlAYvMiXvOAl7nsyM31fG86Tz37GN/n+XneQ/bjvWQ9m
	XAq6qH+dzIwY04IPJR2Umwqn4bTjKJ6kVe2UHnVrFbNlt3OVt2un8GoGJ7+Or37S
	1hBZ+Jjr4z6ITWHl/N67P5SCy0XDbbZyaiFHw7tztDAqbvlgJC/PwnerAuuTvfSw
	86Q4qwPJt3AnFKyHa49hs0k3wC/BWSwBz+FY06L4rbkPamtD5c7OONivXulLJ0vm
	tj+0og==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su708fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:22:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8895156101so5943477a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783401763; x=1784006563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uz7oXNCfrlOoGMhAm5/uW2kJhx4TLmOTtca8THmwAXs=;
        b=eexlgcwbUAm3Szu4zLBKzXdjV7cKSHUJiC9g7nX558kHPLM5Wzo4BPWiMLv6BiUISW
         f5UFM5IhqubwXMqM33w6O61QVn8GY0+F84pdFpQuYqWv4bLBT7LY+y7HzRu6wSYedQan
         lnT5z/pLcV3IwcSV45hwWw3ZLVzVAwehw67AKqfOX0aMuE0/d32prK0LOAgYpDHkis4B
         auevPfXXT6DvItXz70sHH4RBKmk/PiVhM8s9JKyYkl3RD1UhJqVJ2tbtQwThfwuWF18m
         6BE+WwYyvzaZNkGrfuDfl750oCF5NkjHY3RGb+forIWvDZLiYIcCsnj8b31iWTNJmqlv
         nCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401763; x=1784006563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uz7oXNCfrlOoGMhAm5/uW2kJhx4TLmOTtca8THmwAXs=;
        b=rO77jCHPPpYSMxbYzUUdydv364DcsRrLAJehYzRmVBmeUJUiyc1z9a2PXfM4AEMPMB
         hB3oEK8kCLisAyK+9sgGaEqleL6TEKefY/pugAj0d6vl06ba9XD8YuXwyRBbDDbrW5Vp
         UvnXcakB/VOlNQ7M61VdNhKYBZU4uVOoRnwfVXY4Td+7DxubxH+0C38BbU/jGNT5O0Ne
         mdMvWP/otrZy74Gn9hBDLT42orFrsvyYcVlF4SbFGbtmpAZDArKbtMnS60pTrMyOi5jN
         3020DrBufAq4LIBeBiv/HylxbmDUOOS0jHlMVlNJYVAxlvcnw1AjZQ+OqTs4RtslPnOh
         +TWg==
X-Gm-Message-State: AOJu0YwCLxIJwmLBHdY4tciyAFa5OdY3KiP9sd2dArKcfULGnR61769U
	YG/auWMy5hkD/KkhBxp+dnqZEMZopZjh8XTj+f02Y5bsx2butxdR5G3mhe1tIhVjBSPWQSHxjIA
	88G4p0ZesBaNGacTIeaO0wFxaCyNSf6uie8eKAUQhhywg8rRBTnTWefVtz/0D7Tek+BiG
X-Gm-Gg: AfdE7ckN387fWcLiGBTKyoFvXVw1GcG0Jw0OhD3VUJhXGpSwoRr3IL0lPixc7xDXkrp
	g1V81IvTYKkW7kZH5QFwolFKADWDTgnHaq/RA1lWLY/lM7n81AFn6h5lMkd/7FLO9p/onhqO4vh
	5QHHrcZyfniyruRcvG28HllGHjiz4f0/lqtKHjG/JOabpFXPtd5yGv8EvXZcjCjWJo4kAKZmS0D
	tTUdKOBbUqBp0rrGNDvQ3KxH9YdIvmvlg+iFxzYuTUZcEJ58pSRRd7Sd5KKnepCAZjXvSZzOYxR
	Ab3kfNHSsxJ1yBeC/3LV2RYheBYAwiJyNaIy0GQ/lb3hpW2wK1/MebuH6GxrGe3fSNXvhvA1VlN
	xwbB5u2Qv7MWNqYf9sv7oAiCPkERz4/Kj7Cyo1CvHu86Y2Ms4Ol1iWX47G3jrBYjJvNdpOGnkoH
	l2b4F7
X-Received: by 2002:a05:6a00:234c:b0:847:8107:1bd7 with SMTP id d2e1a72fcca58-84826decac2mr3441049b3a.53.1783401762570;
        Mon, 06 Jul 2026 22:22:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:234c:b0:847:8107:1bd7 with SMTP id d2e1a72fcca58-84826decac2mr3441022b3a.53.1783401762139;
        Mon, 06 Jul 2026 22:22:42 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a915sm4707164b3a.44.2026.07.06.22.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:22:41 -0700 (PDT)
Message-ID: <27b3c359-d8f6-40f8-8da6-48fa6decbf36@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:52:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch
 node for PCIe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-8-e1a721eb8943@oss.qualcomm.com>
 <2efcd4b6-0a99-4bb2-b428-4cb4805c20d1@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <2efcd4b6-0a99-4bb2-b428-4cb4805c20d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfX0dM9u1K2OA7c
 mepO2rhibaEIBTiVuzl/DfNKfGaayJmN5iABQoLInd2QJpfcknpxSycqXIiA2a9Io1B1eM/yl8r
 +BVRHht11/Zt2aXPd8hi+THMu24AIvWkBdSZJeXijb7RZVzExO7STwSa0QEcEbwfNLhi6252w68
 K0Bda9aA2j2JMBBvjgHrZFrez93LIlFjjF/Q4uwYbjqNTDdCUko/00v76KtTJoFMS04twn3eo3I
 7o3Q/NSVM2+bTA2PuBkUMS266uIQ9HF8p6L2YNnfZwPtAeF15dmSx2JVdmlrRyenrzWqTN+5ShT
 L4f71mX1VRY3vzeR9oKWBwIIkfh4ZPsT9QzIG2uy1qXrj3A4dqCA50YT+mJLPmM/Pap7VBygwzd
 F6Dg6ULVT6BTtnaRCaQjF1g59EEUqO/ft3UDPTZkVa1USXCIqVvTGrl7cvcyqryUHNH12LKtYH6
 5SKcyIXZv+0R/JoTsvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfXwQuB1SEvxutl
 VKqM5szRDGVGoXPQatP2BsOuThvKFKt3VI0VneRVZzoVHZ+h1gfaZ6WwwvpbsYp9o7Jg/TrVM1s
 CETw6gj3t4hpZZ6zPgfOc1f1089/dGw=
X-Proofpoint-GUID: rTo_g7qXUZQmphahoNwxK-FJVm4UZQVY
X-Proofpoint-ORIG-GUID: rTo_g7qXUZQmphahoNwxK-FJVm4UZQVY
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4c8d23 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=S2spThItiBpve86ZF9EA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117121-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B5257176F8


On 7/1/2026 4:05 PM, Konrad Dybcio wrote:
> On 6/30/26 9:02 PM, Sushrut Shree Trivedi wrote:
>> Add a node for the TC9563 PCIe switch connected to PCIe. The switch
>> has three downstream ports.Two embedded Ethernet devices are present
>> on one of the downstream ports. All the ports present in the
>> node represent the downstream ports and embedded endpoints.
>>
>> Power to the TC9563 is supplied through two LDO regulators, which
>> are on by default and are added as fixed regulators. TC9563 can be
>> configured through I2C.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
> [...]
>
>> +&pcie {
>> +	wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
> This property belongs to the port node
>
> Please also mention in the commit message the reason for the
> PERST# pin remaining undescribed
>
> Konrad

ACK'd.

Sushrut


