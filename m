Return-Path: <linux-arm-msm+bounces-118190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VunuJeSyUGp13gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:52:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1D738ADF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:52:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A8Beg7rc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Q/pU2uJ0";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118190-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118190-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64EDA3011126
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BF13F20E7;
	Fri, 10 Jul 2026 08:44:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908B23CEB9E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:44:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673068; cv=none; b=QNJ6WICDv5ALLywMpEEbQ0VabQIplAZl1ZspdkiSocFT1SsTMSVw236pGdyre1vBcyKzdkQ7qE8upaa/YnDXj+Y+BMU4AjDJlUGyLDgIRTx0EEAm+XN24F8rYbWMJurjLf9y7Zj7FGh/TDTaMY0zM3YkQ7Q9tXgAgotb5JiGJEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673068; c=relaxed/simple;
	bh=ETTx6erwN3T6vCZ7hUgrR7CmDthuW72cv4YgHfFIpsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs854aPzx5u8c62kGXzuBsEsVeLf2auzHeos27AVGkTZXgpNVf7oz83QQ5QPgSWKy43Rz13x0C/aEP38LEF89mF5eghcThYjJJjDzoTv6S5JW/PBMFBn7/brsBkATrWLRajXdvFgzUYjtHFqkLnm6v1PqZOnzvDJ6BEd1jkgCWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8Beg7rc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/pU2uJ0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7ddAv172577
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1zQXih8SnCdGds/JmDRvepmzcgGZh61T0foqMxPgn4=; b=A8Beg7rcajSpzwuI
	B2GtGnLgslhyReSllSpYpv/4Jaxa+PoMngOHhialNVYOXlDzRseChMeMnrM6S6e9
	fBor8VEPyfpXfYoLCIo/aEOHK1H/8W5usNi6ucrvlwyG/+EQB4Ndo08/OlM10X8k
	52PvSA61xPWcgT6I1LhZmw63InMeSDrwgS6bRHUmpspyhUCj0ILP3CM/z4+E/YAt
	L5IViaNpmAvkxarxPRsxus/QS5W0YrXzaTmMnPFVeT9F7aBTSHQDiqGdkp1Ocrcy
	YtLDSwmb6irZMHavDmu18FWINSDjDgXPZFde812FHtBuBR7lxRoU1qCzk3pSCa05
	3khILQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe9mqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:44:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e68cbeb53so23694585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 01:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783673065; x=1784277865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1zQXih8SnCdGds/JmDRvepmzcgGZh61T0foqMxPgn4=;
        b=Q/pU2uJ0yGnr4qOZZDhEwxBqDUIL6jNK5w4L+LjoCre8zrmfY+pj8+AXxDwArzLxI0
         /sVC5IKfKD/8z7O+CgrSTL+gSHxgSn9Ld+jXOqzHs5PTKx9tgiImFa1RugtmJYKf3zCN
         +ZGHIwxiyBfcOMK1E2B6VMrg1rCyr5hXWTtTLWf1HJjtd1t1HaTdnViFtsxXfG0c89Dm
         valOtnjYOuH+ATJeaPjU/YWQiXaqy7lsCifwyyqX2j/9YtCwNqq0/8bs2k6Aw6fmTHhG
         FYymBm2IkDB88f/kE4KJPF6QvkrwgnqCjpXywRsUeXYplK5C/AS+PPox/8FT7fdiPM8S
         DHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673065; x=1784277865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1zQXih8SnCdGds/JmDRvepmzcgGZh61T0foqMxPgn4=;
        b=dF7NQWBD7yRrMq2pobLDxwq58JCisQmNTMrINJ9A+c9S/r3ZU++KPvAn7+WqNnCdib
         Lk2rhcUudcxxs4whjZv4upg9aStSsefWVdHVBn0uBE9F9q9+IDPvyuJS1UdNTiHJQhYH
         sCItAjTCarigLErZ5eu8AxdRfnXZcHXNLHJoiSBZ+yhJNRxU/LRETSkPSLqLlXAulqv9
         rZhBmOO7AISRrksGVD6Tj96vg+6TOAUWgHQzLqtgLDgJ1ICV+az6mgtxXBLthqZCTVPK
         va9OHa/MvBbKjNP822WcoRMFpweD+nb5HuJqlE72/GS4n/8jkB7jxe7TX9/vVokt1jjx
         0Ccg==
X-Forwarded-Encrypted: i=1; AHgh+RogqWdfJ7mxzYZoMgHRzyvoNaBRHxmY3SOatjpEURQ00sI2NFYOKCWfhuANEAcEiSgz1GNEcAnYMAEic71I@vger.kernel.org
X-Gm-Message-State: AOJu0YwZVwhHx7zYO50qE3ZkAL/Bzx9hog2t3XviSH3Vbqy2Mi9B3bxS
	6ikwcfQVqYIPJzMut02zP6r6wfLUwFPEoSvFDj84UzvqjwZB8lISxE3EgLqE78FdN2zum90CwTA
	ITF0hK6Z7FWXYaEYlXkGqVeSmTSslZqsnq3AEDIITYcMKZOMT8Bs/erGewXKWqRbtAzvY
X-Gm-Gg: AfdE7ckKiyazcsDjuqJV+cjXnH1uSs1DJKdwGqKr6sswng7P8QFlVpe4+B5FmBrar5J
	R80l3ADfev29M2AuKcGDPYNHz1++PxDj2nf3XW/2UZPUc51QI7SQYx4Z5/hTmKK1+qtovS5B8mj
	KvsSFQNebQSebngdqxsRdEDTJVNdZJkdjAigmkAH9YNozljzvLPiuZqQsRPBCj+b/TSP8oI/Qta
	7NEYPyoPYO5JpJ0mp6f+N/gP+4VG3I//wVzskppf1XGknGgmr4T++10/Se075M/MIKzj+EYIx+Z
	M6PIyXLD7KMnFjlI9ho9FIDvEA54WOPYoWtca2cOIYPjXQA05ix/xaa9vG/XFvnAW+9uXoGUrQt
	1zJ+7kQuvNT6W8ViBhbHIJr9tXiufAKmea+0=
X-Received: by 2002:a05:620a:454a:b0:915:7a64:cb68 with SMTP id af79cd13be357-92ed7779c70mr620219485a.2.1783673064720;
        Fri, 10 Jul 2026 01:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:454a:b0:915:7a64:cb68 with SMTP id af79cd13be357-92ed7779c70mr620218085a.2.1783673064268;
        Fri, 10 Jul 2026 01:44:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm583711566b.0.2026.07.10.01.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:44:23 -0700 (PDT)
Message-ID: <6802dc29-d783-40df-bbb8-8b2dbd94be29@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:44:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
 <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
 <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50b0e9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TLRsrNMnCJaxhW4YLJwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NCBTYWx0ZWRfX/JLp6xKySRyJ
 q6OQ2wmNybdu2Dwwjrec4DObpcStLq2K7Xaf4k2//xNRxoy+LtEqFSJBG0TZeXpCGOB1PpZJNU2
 k444WACwbzwS/qtEGc1BjWzE9I7Xs88yDSVpnIJl5VVTibQTCc3BkfuH2fAEAKi+cDiyCBjUj7w
 g07va7B9FmAYS5kxaXczQkKapw3qfB6KbFWXgpN0E7SW/kbyEl3XIUbiBp128mg52cz42M5EIW0
 JJwS8G6J3j3XbO70qKPtBaWbrkWpYrQiUaXrCy6PtmClldlPLfsSGzQ1J67MzxfjBc5eSguHDnc
 HvdmSGmYmmbiyHca+U4Sd4WSJzxVCcSwCZND0yGbeGMY3OmovUZF6bEkzKXjXPKHwYOICGMJD+0
 /N8+8tpkXqyIGokgZnCie68pwe4b4st4AdFX1iI3J+msHWErtyq6Eg13Wj7BcCCN+8OoVjNodyI
 MgQ/Fmr7nYVRkS/SJoQ==
X-Proofpoint-ORIG-GUID: -9zw9x4z81FncE-iiK0ITJUwYSiAOm2q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NCBTYWx0ZWRfXy6jg52PLlzm/
 bVemr/BNZ4+LJbXO7xP3bJhEXQ7lKdFnTPUWdW9yFTa8ATdqH7M2hwuy7dygl1S6p0EK0C6+SXv
 VN8PhXkr5ihn/cgW7L1meRWY3wYA7oU=
X-Proofpoint-GUID: -9zw9x4z81FncE-iiK0ITJUwYSiAOm2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118190-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38B1D738ADF

On 7/10/26 4:19 AM, Qiang Yu wrote:
> On Mon, Jun 29, 2026 at 11:20:07AM +0200, Konrad Dybcio wrote:
>> On 6/29/26 7:05 AM, Qiang Yu wrote:
>>> On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
>>>> On 5/19/26 7:47 AM, Qiang Yu wrote:
>>>>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
>>>>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
>>>>> nodes.
>>>>>
>>>>> Update the DTS wiring to:
>>>>> - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
>>>>> - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
>>>>>   &pcie3_phy using two-cell PHY arguments
>>>>> - configure the shared PHY node with link-mode and dual pipe outputs
>>>>>
>>>>> Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
>>>>>
>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +		pcie3a: pci@1c10000 {
>>>>> +			device_type = "pci";
>>>>> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
>>>>> +			reg = <0x0 0x01c10000 0x0 0x3000>,
>>>>> +			      <0x0 0x70000000 0x0 0xf20>,
>>>>> +			      <0x0 0x70000f40 0x0 0xa8>,
>>>>> +			      <0x0 0x70001000 0x0 0x4000>,
>>>>> +			      <0x0 0x70100000 0x0 0x100000>,
>>>>> +			      <0x0 0x01c13000 0x0 0x1000>;
>>>>> +			reg-names = "parf",
>>>>> +				    "dbi",
>>>>> +				    "elbi",
>>>>> +				    "atu",
>>>>> +				    "config",
>>>>> +				    "mhi";
>>>>> +			#address-cells = <3>;
>>>>> +			#size-cells = <2>;
>>>>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
>>>>> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
>>>>> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
>>>>> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
>>>>> +
>>>>> +			bus-range = <0 0xff>;
>>>>> +
>>>>> +			dma-coherent;
>>>>> +
>>>>> +			linux,pci-domain = <3>;
>>>>> +			num-lanes = <8>;
>>>>
>>>> Is it fine to keep num-lanes 8 here even for configurations with
>>>> bifurcated PHY?
>>>>
>>>> I would assume so, given essentially this is a x8 host, whose 4
>>>> lanes may simply be effectively NC 
>>>>
>>> Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
>>> never enabled at the same time. When PCIe3a is exposed, it is always in an
>>> x8 slot. But if we have a x4+x4 platform in future, we can simply override
>>> num-lanes to 4 in the board.dts.
>>
>> My question is whether that will be necessary - if yes, sure, we
>> can do it, but if not, we can conclude on this early and not have
>> to fight over it in a couple months
>>
> I think we do need to override it in that case. If both PCIe3a and PCIe3b
> are enabled in x4+x4 mode but PCIe3a keeps num-lanes = <8>, userspace
> will see an 8-lane slot. If an x8-capable EP is connected to that slot,
> both ends will advertise x8 support, but the link is up at x4. That looks
> like a genuine bug from the user's point of view.

Do we know what's advertised on x86 PCs with bifurcated lanes?

Konrad

