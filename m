Return-Path: <linux-arm-msm+bounces-119062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Vv5JDBaVmpk3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:48:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17277756970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:48:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SpmBG1uL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AG1IrD6c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119062-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119062-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 812CF3047036
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14D0494A17;
	Tue, 14 Jul 2026 15:47:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518049552C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:47:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044071; cv=none; b=L+ORrGbCS3JemKH4UmWY9MFx7OXcrsciSw1N9khsJqCcuPL9ZQGuy4/RZhEmsQ3xbprtHUcnZmMtI6S7TRFxu6sjXuaq1ZAfQBwBUz5EXoWumLg7XuGsbe7fLGu4XRUSGUJZjzfKuoLt/iEXK+Aeq4iHPiTt95Oew+n/MAEN7L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044071; c=relaxed/simple;
	bh=UI8L3jXrZB+lzWZFyrflCCgxBDCTbAE23u842wAsS+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C25m0XQ724qDfC3Pz03AAbT8xizWlpXC4cK44aouNpLf9ElvO6H0rUUfCHgUBEYurKUZaNgJSih1UrMt9Ma9NsWUURJPhnPpNDw6nLLpaSTbJfsdiCP1YDLskHZIKy3TG+pLFMwBeOgeo7QnVgH+E2+8WrIGgnZ1JvI/vxkbam8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpmBG1uL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AG1IrD6c; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEdIM3888890
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UI8L3jXrZB+lzWZFyrflCCgxBDCTbAE23u842wAsS+U=; b=SpmBG1uLM3jPrS2Y
	rF5VeXmIvrCcz1zJhsUKFYaokICHjyy2q5iiKCWnhuOLGQkuwSgPJa7UE+q1c9pL
	6eO1+PgmNTsttc8O6RW14lOueTnB1cgSN5HpLSODq9uj6WtE5HD14/he3j7ZJ0AU
	UdbuJzN2nj804VCS3JaFucnmYtaSMLB/rcBTemL1NTNLSg3B/2pncNmMCZJHrOeN
	U56pnf4nOnBkWmwnyhxNQmjgNtZnt2wq36oH+JvJH/5Tgs2Lo+yPuKJV6Ng/HpG9
	011nJBUpTyMMoIdgtfA82ZiT/bQ82kW85F8+0YG1GM39YAQ9CFvXv2dIY3Ynekii
	fWTKFQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudhxq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:47:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2571859a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784044066; x=1784648866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UI8L3jXrZB+lzWZFyrflCCgxBDCTbAE23u842wAsS+U=;
        b=AG1IrD6cw4iZnarjVNKDpmq+cSgI9bK+EPITZPNzKX5ZvNKWwgF/PQyy9utoO4tSZq
         6A4WSKLbkkDd5KM1MDSVmY6LBjWalkUjagvqjCMUov9pWmKwE1bAadavdEb/Aaz55MaR
         k5SKKb7wdy79Z780oT2HX62W0RG6BPMAVAFehQzKR5JS3EqfwST8nLkiYCOs0ZEyGV9E
         3yR7kpLSaxChp3E208N/KjGO511bS4dXCxtlrG/ITmESF0sT3fl9aps/W5dWYmzs5OZf
         bwUE3HCLKs034ckMaY/O6tonyL4UUJXBa0GLA3NiZCFywwz7DDIzo0ezI6hiGBoTKX7W
         IKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784044066; x=1784648866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UI8L3jXrZB+lzWZFyrflCCgxBDCTbAE23u842wAsS+U=;
        b=BAv1SobDyo+E76cVTFVwT8S6aLMphacMMjZgf19i4wV9BGw6cQ4lwBHaQqbaqnTnEz
         01KI8K3LaBVha+526SMv5kAySZHOA+P14rMdK/agYqGsn5UeSgHb+sVIpkJ9HBys9j/C
         AL4RWH0b10VANd0N1aX9cXAfE20L9GqxYWXefHgf7PU5q3XrWNHSFU1EANnKl0j8i/8H
         UWs1ZTipVDKXcoHI3XQRDk4CVqYI3ldMGfAAD0/wtcBo/qcnT2+ol6apnQnD5xFaXbPg
         VwDx5TiSxXY1nfWBJMJHlYerrZYf2VGN5M+A93a1xG2oGLOIcetgQ7QOaFSwUali/1WZ
         XnaA==
X-Forwarded-Encrypted: i=1; AHgh+RosNf2PxjjmbfNvYqNDM+asVqOgLGwDFHlxQvphWxi0V1sViiRYc6dRiqB2sACHM9LcvbiP0RghnDdmu4PG@vger.kernel.org
X-Gm-Message-State: AOJu0YwyTfEIpRob0LFwRZ7RNZEHi4XgriFblZoO9ff5+4Sr2lugFdrn
	oxvkF1Q5D3wjBdhSWUj/pU3ohEqksUotBokXcCOt4a1A2WLOUZw65mCvTEUujsSjGJDxv9Zm7IC
	DLLsE/H8I5yokclPSL72DnYS4mOAuHdVoznCFbDgbgx5VmJ1MoXj89xCJPaz5u1FEzxkh
X-Gm-Gg: AfdE7ckQgTv1ZIwEHDZOegS/no4o4fZd2vLGX/vnm6BB/igUQ7hUV4IQtB6K5C0AfFi
	IeL1eY5EDjd3lgIdn1sBEjIeokvXtq2dkx2Yc2C05mO1pXrTxZRtmuMwThUBQzS0db6036jbteP
	xXwEk3XlSTWm9cR2RsUwpB8mgVBTv/K1cUgiHfhp8BYqNraku1MnJ7y6O9nzG5BPRdCMQkBnfrE
	t2/UxbSg+t2rLtFcNWvo8a8gr/WrqH4d4HfnMiqH9komLlM3Gg+34qvRBzqIEzZqCteGDQcsqCK
	P7oLJiUCQBNC+J/MWRmfmtmwm9vSK14DsdFCWF9Nw6hZ4Uekpterk0l4BFuZHid8mfQ2XiqK5LQ
	zMJkQBQKbPMNas5Vuv8rnRey9TSAu6mlqVcvAU//kZq3HXeQ=
X-Received: by 2002:a17:90b:38c8:b0:38d:dbc7:5178 with SMTP id 98e67ed59e1d1-38ddbc75254mr11115622a91.22.1784044065760;
        Tue, 14 Jul 2026 08:47:45 -0700 (PDT)
X-Received: by 2002:a17:90b:38c8:b0:38d:dbc7:5178 with SMTP id 98e67ed59e1d1-38ddbc75254mr11115587a91.22.1784044065298;
        Tue, 14 Jul 2026 08:47:45 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.151.85])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm84444133eec.30.2026.07.14.08.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 08:47:44 -0700 (PDT)
Message-ID: <582d12f5-bb73-4702-9e10-234d46b3fc93@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 21:17:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a
 single coherent block
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-2-3f29da7cca76@oss.qualcomm.com>
 <alXm0rp3NK62G3-3@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <alXm0rp3NK62G3-3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fZT5zPM27h042DdPaZMCzmWqtfiz4fJT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE2MyBTYWx0ZWRfXxEHcrPUhSssm
 8KzXiy3WpeeYcUKPqIrOv5D4QCjCyd3UuKyvR0VyfkntiMclXyjQ0bb/Vc1d8IyOg8UJ5sW4b2f
 7FqfEg4s1d47Ik4VGLnCkB8lKV3pw4MdWZ6+CPG4fWW0HGcduZaAlKY0VZUR/wsWfkv54QBuahB
 4DrH+qfu3pAgAUUrtz8YyXo4wRe1IsHrneM0idxVeZWtC5hDksehbIStdNKBhZhNnsqnMBSyh0z
 /12HFDUd7ferCtn3KU1QJIdQC2wPXwAdNAzzD38Y3hUPJPwYKpvFI9QH7ixYQvQNrvOccL5mIqN
 9NnDenZnkRRmHj5KmZ1irn+0b316airto2GWlXPjfaVmQIpA56ZG4jkjhvXGcHhA634TIUlv3tF
 qNMnelzlnY0AE0bKQpz0zFC/pmg4EMZRL65eWWKIbdXNp0oUBAUQRxHQJ4lznJlcbQ2yDC2JLW+
 SJoT2HDzQmYuSPbvxIg==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a565a22 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ziBI+Y3eO/H+UwYWWny9Hg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2eDN7aXksB4whfXZn5AA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE2MyBTYWx0ZWRfX0d/7GXYh7l9w
 jQh/sm5GGGfZ7W1/9XHJWUTpm404/UHZiOGKojqpiT+wPMDfe+++eqOHrRv+GkFDJJ2F4OBXoNu
 APYbp9QKo8FKRG6cF+PqNCQycx8IyvQ=
X-Proofpoint-ORIG-GUID: fZT5zPM27h042DdPaZMCzmWqtfiz4fJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140163
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-119062-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:stephan@gerhold.net,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:johannes@sipsolutions.net,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:ryazanovsa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gerhold.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17277756970


On 14-07-2026 01:05 pm, Stephan Gerhold wrote:
> On Tue, Jul 14, 2026 at 11:02:32AM +0530, Vishnu Santhosh wrote:
>> On Qualcomm SoCs where the modem (e.g. the mDSP on Shikra, VMID 43 /
>> NAV) is the AXI master for BAM-DMUX RX transfers and the XPU enforces
>> per-region access control, each individually DMA-mapped RX buffer
>> requires its own XPU resource group (RG). With ~16 RGs available, the
>> 32 per-buffer dma_map_single() calls exhaust the table and the first
>> inbound transfer faults with an XPU violation.
>>
>> BAM-DMUX is a singleton (exactly one instance per SoC), so the
>> destination VMID does not need to be a DT property; it is looked up
>> from the compatible string's match data instead. Add struct
>> bam_dmux_data with a single vmid field, and a shikra_data instance
>> hardcoding QCOM_SCM_VMID_NAV for qcom,shikra-bam-dmux.
>>
>> When match data is present, allocate all BAM_DMUX_NUM_SKB RX buffers as
>> a single contiguous dma_alloc_coherent() block and SCM-assign that
>> block to HLOS plus the VMID once at probe. This reduces RG consumption
>> from 32 to 1. The block is never reclaimed across a modem power cycle
>> (bam_dmux_power_off() does not touch it), so the probe-time assignment
>> covers every subsequent restart without re-assigning or reclaiming. It
>> is reclaimed to HLOS only once, at remove or on a probe error, and if
>> that reclaim fails it is leaked rather than returned to the page
>> allocator.
>>
>> Each rx_skbs[] slot is pre-assigned its virtual and DMA address from
>> the block, so no per-buffer mapping is needed at power-on. Because the
>> coherent block is not page-backed, received payload is copied into a
>> regular netdev skb before handoff to the network stack; this is an
>> unavoidable extra copy on the XPU-enforced RX path.
>>
>> Platforms without match data are unaffected: rx_virt stays NULL, no
>> coherent memory is allocated, and the per-buffer dma_map_single() path
>> is unchanged.
>>
>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> So how do you handle TX buffers? Right now, they are just passed on from
> the net subsystem. There can be up to 32 TX buffers in progress as well.
>
> Overall, I have mixed feelings about this patch. It looks reasonably
> simple, but fundamentally I don't understand why we need to go back to
> the old days of implementing protection using a highly limited MPU (in
> your case: the xPU).
>
> Why does the setup of BAM-DMUX differ e.g. from the setup for the crypto
> engine? Crypto is also using bam-dma, but it avoids this inflexibility
> by making use of the &apps_smmu. Is BAM-DMUX not covered by the SMMU? Or
> did you just decide to bypass the SMMU in this case? (If so: Why?)
>
> If you had BAM-DMUX mapped using the SMMU you would get all of this for
> free. No changes would be needed in the BAM-DMUX driver ...
>
> Thanks,
> Stephan

Thanks for pointing out. We were seeing XPU violations on descriptor
FIFO accesses in the RX path. This series resolves the RX-side faults,
which is why we posted it. It appears that the TX path requires equivalent
handling, and we'll include the necessary TX changes in v2 of this series.

Currently, the SMMU does not cover this A2 BAM instance on Shikra, which
is why we opted for the SCM-assign approach. I'll check with the hardware
team to better understand why BAM-DMUX is not behind the SMMU, gather the
relevant details, and get back.

Thanks,
Vishnu


