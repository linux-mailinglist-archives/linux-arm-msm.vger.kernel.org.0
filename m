Return-Path: <linux-arm-msm+bounces-96246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O8GC1K2rmkSHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:00:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEEF23854F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5097A30229B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8681D39C65B;
	Mon,  9 Mar 2026 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAWZUL5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8Ir8nFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A0C3A7853
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057587; cv=none; b=C0ABO2kfFxKHl56cUhsT5/rOoYY7Hix4yV7z2whSOBw4MKBuZigOrYL4Rdhc+/DEExN5IH/0tLUdhGUsFCCX83iMBIr/b7v3+J4d1cjw7R8QqNvyup550J/+LYHee9cOAqe3ZJwstBC9krbYIzne8Ukv0SnUWDORLNB9zoz+g7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057587; c=relaxed/simple;
	bh=F7mbc8jx1k//IBI08Up4qfho24mFsNsH5IucY27FyRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZxWsJsvOePdd6KPqaKHHf0kwa5MZDfZPtj0uHnbQBxEm510z3qkDjqQ34ioNV4jxd3jPRtEEmGeiXTtJRWH9E/tSxs7cuFwLtL3eY1DWrvr2zh88jcW3v7qAvLFZCkSMc5u31mcR5H/bjAPuxp2ppba8JkFnj17Wi1CKTfIvyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAWZUL5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8Ir8nFA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WAug3773176
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ct+JOW0U7zgweeondUjCYiRFut8xAJES8GcNUAQtRb0=; b=SAWZUL5oP2s2HCn2
	/7ZZB5Oc5ImMnhRbhXlBEXS559YlA99R+ujepq/TvDGtuiqLUygjHcji4TaqlSFC
	Emg4oZMrZpy09Cpxw9geVfaYE9hqqstraDZjcKR3cZgLZv5hhEXjFdbwXYtlvI3M
	sWxDXdiai7vkgnEa2E9kgkhavreBDMzzfnPLcRogoDPkvoumIEPzRIrxn1RfqPJ7
	FJsDqADK91p25YFcnORazX43dejfqlrBWcMUaJvhi+1T+VwyepzCats7dMXIOWPo
	2KT7rk3wz1lVEzAHuwX9RxvzkfgeBVeY+UqwgzxPMkDy+QxSO4pHPCNOeFp1wS3f
	PcOKBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8pxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:59:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae49080364so66311475ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773057582; x=1773662382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ct+JOW0U7zgweeondUjCYiRFut8xAJES8GcNUAQtRb0=;
        b=S8Ir8nFAdXV33qnB+BceN9VcKIBmimXRdP8dSeSmHcXBuMnPnmgNLkizlrSTa6Sgp8
         wVzCnR31WMH+4H6iZf+YrnAQAxOp2+XmptOWg4F3RHswnBNPN7s+KQeMPBL8LT5megJJ
         sQc0DoX1uzBzKE1LsM3/B/+32xKanY/sF/k/3u8uRksx9L/88KVJCROJVF9lc4dVdg+5
         auRU4B2FgI3Md8Hwmuj4A7c7Bg19f34ST1ac2nmGwlgeR0zEfpVSWLZ/DqoIxDGp1Jwu
         NaJsqaU/K/wXNXYCULq3Oz9mHdosN/2NQIjNlkm69wS+DjXt/JxB/nMjGE2+8wtoXs4+
         8Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057582; x=1773662382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ct+JOW0U7zgweeondUjCYiRFut8xAJES8GcNUAQtRb0=;
        b=S1QGCiHjrUKaS2EcN2kvh7TQcIaXT9sVxhuYqy9Av+UFLe+TKbF0iQtGUIsVSoLHlf
         JK2s8Bf7fbScfwlkIUP4VzZKJ+EVEMWmXBgqeayhZ+Qz4HAHF3LFGlnUQfR0onwvaoF9
         oLnYzBPC6L6vltpVTLe4AJY+J4SFIFUN9hNT5y9esyAUgZ4j+RRyRxwTAjMZR1WGq+uS
         ITroXWnsYtH48E3eYq3ShdjzGoXsYp208bHdd3uDo5FznxOF74Qm85kR6H5dHuXZkkNC
         zB2ozI/MJ9RwwWDYpFWbMnv4mpbPI+W0Z7VEPDtTQzEzNNpvl5b5+9w6j/h9+dKypQ0s
         Au4w==
X-Forwarded-Encrypted: i=1; AJvYcCU9EJd1GhMCj45TmUT11hkx2iPUsCBbYFlzTGt3kDvT/OyjsaxAc2FVzGCNd3AIllHt0SJck/4j1OCxBwL4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9pscmepeNJYpturOfcGwqa4qvmI2Fuv6A6ycGiuPfanQRUnKT
	4ffzcL4FKBTuEJnjdI9GbSh+w0B3g5c8nlb8NL+RQI+BRqYEUUb7marNY5IkSQkvCbemhH6GQmV
	+CRTr8xRXUk7Ps8+K6G0ObhL11Iuh0FiqSTzjW5u5zbmaJAimVnZsTdKi35fFcSdMi1Lq
X-Gm-Gg: ATEYQzwD3r1aTUQMx9K4rcDKF8FkDdtCwFhKQ3e6aoVYzCuWEa9c2lLRO3Y/WEogTgx
	zCrqb4IjFAObNtbQNwTe6Ioh7WTI3umU2/aEydYJzUUtcKYT/F3vunex/pI5qUaiBZgweRfNoI1
	It7KjTMV3uG3tjyETglai0H2wcmTw9xOJeE7aeXIDk39klSCzZAEuMQRhURSXA7DFsa3xJLNr8Q
	pN2O4IOojxXIga+ns9GufPKZ8GbHPL9rCxw/yCKNn69JNiNqA/XP6zdQZFmuYuh4TVKMHvLTTx3
	+rCyaoNKzZ2WzwPZVYSwZY7xBtJejnwExIglt9OXaVun32sfutziAtPhYl8j5auuz4w0pJDCM5z
	mtDwMtfxgde5GV4a6Ylh7TpU9iyXwS3EdNFc3NaYpJnhqzpX3i8BKM3uD3i3vlvoY9gzY1N6WIC
	AJicHncxUTnQ==
X-Received: by 2002:a17:902:c406:b0:2a9:484c:ff2f with SMTP id d9443c01a7336-2ae823a1df5mr108954095ad.23.1773057582302;
        Mon, 09 Mar 2026 04:59:42 -0700 (PDT)
X-Received: by 2002:a17:902:c406:b0:2a9:484c:ff2f with SMTP id d9443c01a7336-2ae823a1df5mr108953825ad.23.1773057581756;
        Mon, 09 Mar 2026 04:59:41 -0700 (PDT)
Received: from ?IPV6:2405:201:c009:3829:7df8:e92f:daa5:e6d1? ([2405:201:c009:3829:7df8:e92f:daa5:e6d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae8852e638sm146193095ad.2.2026.03.09.04.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:59:41 -0700 (PDT)
Message-ID: <320ff1c6-34ed-4b6f-b0f8-db79a14b7101@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 17:29:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] soc: qcom: ice: Add explicit power-domain and clock
 voting calls for ICE
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, Brian Masney <bmasney@redhat.com>,
        Neeraj Soni
 <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
 <vimd3tbnu4mr2uqporj7d4fv23aq2cb6e5een43yz5spe4u2xx@ufyzb2lzlc6j>
 <b32c7091-b2c4-443d-b58e-759b471f67db@oss.qualcomm.com>
 <4a76fuanyf45d56p64qmc7c3qcovbzt7jc27uern4lr4bchl6n@l6buzvakrrcg>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <4a76fuanyf45d56p64qmc7c3qcovbzt7jc27uern4lr4bchl6n@l6buzvakrrcg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s8XoOcf0kACEa6v7wtUFDb2oNp9EmFx1
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aeb62f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=zUsFzlfcqSlsMlHV8JIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMCBTYWx0ZWRfX/pj5fsaoF2sG
 4mLzO0hstRi13K01rXCNVjKkz7DSZF/C0mKOOmzEXNxUvou0cFZiYv90lgPbcJ9dXBHKW3L8xqQ
 75WyuS/XqQ9Ft7oToddTPTg8NajY2W6GZygSqkLRiWT6DWibBZShnQqt9vtGUXsoVYNwqyw9eag
 /rz5mzOvndjBOuIXEebjPT1OkJkQu1IFyKyRfqiLiVX33+9b8xmyrBppOqHHzP+9bFyucBy5YRg
 DrGb80gnl1SfYvh+x1TO2nkEYeZBYHFgT+bRC0xPn47yc3+eIQZjO+U4Ovc2HuwbYOkzI3XEF8x
 VG97JKs7d6bWgFEQUCgjKN+N82yksIa+jz8vsj6ZgE4KulTa0n9+1k25iVZvuoImmQU1tfWx6vl
 c5ItFtsCGlcE5OHMxkk3/VwU5WeGUqdlHE5n9htt9Ix9j3a9Hkn4iVvY9yLa0A9eeYC3g5SQMRx
 9iRK3rOqR4hTk1yew5w==
X-Proofpoint-ORIG-GUID: s8XoOcf0kACEa6v7wtUFDb2oNp9EmFx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090110
X-Rspamd-Queue-Id: DFEEF23854F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96246-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Manivannan,

On 3/3/2026 10:38 PM, Manivannan Sadhasivam wrote:
> On Tue, Mar 03, 2026 at 02:11:06PM +0530, Harshal Dev wrote:
>> Hi Manivannan,
>>
>> On 2/20/2026 8:14 PM, Manivannan Sadhasivam wrote:
>>> On Fri, Jan 23, 2026 at 12:41:35PM +0530, Harshal Dev wrote:
>>>> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
>>>> de-coupled from the QCOM UFS driver, it should explicitly vote for it's
>>>> needed resources during probe, specifically the UFS_PHY_GDSC power-domain
>>>> and the 'core' and 'iface' clocks.
>>>
>>> You don't need to vote for a single power domain since genpd will do that for
>>> you before the driver probes.
>>>
>>
>> Unfortunately, without enabling the power domain during probe, I am seeing occasional
>> clock stuck messages on LeMans RB8. Am I missing something? Could you point me to any
>> docs with more information on the the genpd framework?
>>
> 
> genpd_dev_pm_attach() called before a platform driver probe(), powers ON the
> domain.

You are correct. I just double confirmed this. I am going to remove all pm_runtime_* API
calls from this commit as they aren't needed. Ack.

> 
>> Logs for reference:
>>
>> [    6.195019] gcc_ufs_phy_ice_core_clk status stuck at 'off'
>> [    6.195031] WARNING: CPU: 5 PID: 208 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x174/0x18c
>>
>> [...]
>>
>> [    6.248412] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    6.248415] pc : clk_branch_toggle+0x174/0x18c
>> [    6.248417] lr : clk_branch_toggle+0x174/0x18c
>> [    6.248418] sp : ffff80008217b770
>> [    6.248419] x29: ffff80008217b780 x28: ffff80008217bbb0 x27: ffffadf880a5f07c
>> [    6.248422] x26: ffffadf880a5c1d8 x25: 0000000000000001 x24: 0000000000000001
>> [    6.248424] x23: ffffadf8a0d1e740 x22: 0000000000000001 x21: ffffadf8a1d06160
>> [    6.248426] x20: ffffadf89f86e5a8 x19: 0000000000000000 x18: fffffffffffe9050
>> [    6.248429] x17: 000000000404006d x16: ffffadf89f8166c4 x15: ffffadf8a1ab6c70
>> [    6.347820] x14: 0000000000000000 x13: ffffadf8a1ab6cf8 x12: 000000000000060f
>> [    6.355145] x11: 0000000000000205 x10: ffffadf8a1b11d70 x9 : ffffadf8a1ab6cf8
>> [    6.362470] x8 : 00000000ffffefff x7 : ffffadf8a1b0ecf8 x6 : 0000000000000205
>> [    6.369795] x5 : ffff000ef1ceb408 x4 : 40000000fffff205 x3 : ffff521650ba3000
>> [    6.377120] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000928dd780
>> [    6.384444] Call trace:
>> [    6.386962]  clk_branch_toggle+0x174/0x18c (P)
>> [    6.391530]  clk_branch2_enable+0x1c/0x28
>> [    6.395644]  clk_core_enable+0x6c/0xac
>> [    6.399502]  clk_enable+0x2c/0x4c
>> [    6.402913]  devm_clk_get_optional_enabled+0xac/0x108
>> [    6.408096]  qcom_ice_create.part.0+0x50/0x2fc [qcom_ice]
>> [    6.413646]  qcom_ice_probe+0x58/0xa8 [qcom_ice]
>> [    6.418384]  platform_probe+0x5c/0x98
>> [    6.422153]  really_probe+0xbc/0x29c
>> [    6.425826]  __driver_probe_device+0x78/0x12c
>> [    6.430307]  driver_probe_device+0x3c/0x15c
>> [    6.434605]  __driver_attach+0x90/0x19c
>> [    6.438547]  bus_for_each_dev+0x7c/0xe0
>> [    6.442486]  driver_attach+0x24/0x30
>> [    6.446158]  bus_add_driver+0xe4/0x208
>> [    6.450013]  driver_register+0x5c/0x124
>> [    6.453954]  __platform_driver_register+0x24/0x30
>> [    6.458780]  qcom_ice_driver_init+0x24/0x1000 [qcom_ice]
>> [    6.464229]  do_one_initcall+0x80/0x1c8
>> [    6.468173]  do_init_module+0x58/0x234
>> [    6.472028]  load_module+0x1a84/0x1c84
>> [    6.475881]  init_module_from_file+0x88/0xcc
>> [    6.480262]  __arm64_sys_finit_module+0x144/0x330
>> [    6.485097]  invoke_syscall+0x48/0x10c
>> [    6.488954]  el0_svc_common.constprop.0+0xc0/0xe0
>> [    6.493790]  do_el0_svc+0x1c/0x28
>> [    6.497203]  el0_svc+0x34/0xec
>> [    6.500348]  el0t_64_sync_handler+0xa0/0xe4
>> [    6.504645]  el0t_64_sync+0x198/0x19c
>> [    6.508414] ---[ end trace 0000000000000000 ]---
>> [    6.514544] qcom-ice 1d88000.crypto: probe with driver qcom-ice failed
>>  
>>>> Also updated the suspend and resume callbacks to handle votes on these
>>>> resources.
>>>>
>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>
>>> Where is the Fixes tag?
>>
>> Ack, I will add it in v2 of this patch.
>>
>>>
>>>> ---
>>>>  drivers/soc/qcom/ice.c | 20 ++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>>>> index b203bc685cad..4b50d05ca02a 100644
>>>> --- a/drivers/soc/qcom/ice.c
>>>> +++ b/drivers/soc/qcom/ice.c
>>>> @@ -16,6 +16,8 @@
>>>>  #include <linux/of.h>
>>>>  #include <linux/of_platform.h>
>>>>  #include <linux/platform_device.h>
>>>> +#include <linux/pm.h>
>>>> +#include <linux/pm_runtime.h>
>>>>  
>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>  
>>>> @@ -108,6 +110,7 @@ struct qcom_ice {
>>>>  	void __iomem *base;
>>>>  
>>>>  	struct clk *core_clk;
>>>> +	struct clk *iface_clk;
>>>>  	bool use_hwkm;
>>>>  	bool hwkm_init_complete;
>>>>  	u8 hwkm_version;
>>>> @@ -310,12 +313,20 @@ int qcom_ice_resume(struct qcom_ice *ice)
>>>>  	struct device *dev = ice->dev;
>>>>  	int err;
>>>>  
>>>> +	pm_runtime_get_sync(dev);
>>>
>>> This is not needed as the power domain would be enabled at this point.
>>
>> Would this be enabled due to the genpd framework? I am not observing that
>> during probe. Because this call is made by the UFS/EMMC driver, perhaps you
>> mean the situation at this point is different?
>>
> 
> If you pass 'power-domains' property in DT, genpd will power it ON at this
> point.

Ack.

> 
>>>
>>>>  	err = clk_prepare_enable(ice->core_clk);
>>>>  	if (err) {
>>>>  		dev_err(dev, "failed to enable core clock (%d)\n",
>>>>  			err);
>>>>  		return err;
>>>>  	}
>>>> +
>>>> +	err = clk_prepare_enable(ice->iface_clk);
>>>> +	if (err) {
>>>> +		dev_err(dev, "failed to enable iface clock (%d)\n",
>>>> +			err);
>>>> +		return err;
>>>> +	}
>>>
>>> Use clk_bulk API to enable all clocks in one go.
>>
>> Ack, I'll use clk_bulk_prepare_enable().
>>
>>>
>>>>  	qcom_ice_hwkm_init(ice);
>>>>  	return qcom_ice_wait_bist_status(ice);
>>>>  }
>>>> @@ -323,7 +334,9 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
>>>>  
>>>>  int qcom_ice_suspend(struct qcom_ice *ice)
>>>>  {
>>>> +	clk_disable_unprepare(ice->iface_clk);
>>>
>>> Same here.
>>
>> Ack, clk_bulk_disable_unprepare() would look good.
>> As Konrad pointed out, if iface clock is not present in DT, thse APIs are
>> fine with NULL pointers here.
>>
>>>
>>>>  	clk_disable_unprepare(ice->core_clk);
>>>> +	pm_runtime_put_sync(ice->dev);
>>>
>>> Not needed.
>>>
>>>>  	ice->hwkm_init_complete = false;
>>>>  
>>>>  	return 0;
>>>> @@ -584,6 +597,10 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>>>  	if (IS_ERR(engine->core_clk))
>>>>  		return ERR_CAST(engine->core_clk);
>>>>  
>>>> +	engine->iface_clk = devm_clk_get_enabled(dev, "iface_clk");
>>>> +	if (IS_ERR(engine->iface_clk))
>>>> +		return ERR_CAST(engine->iface_clk);
>>>> +
>>>
>>> Same here. Use devm_clk_bulk_get_all_enabled().
>>
>> As per discussion on the DT binding patch, I can do this once we decide to break the
>> DT backward compatibility with a subsequent patch which makes both clocks mandatory.
>> For v2, I am planning to continue to treat the 'iface' clock as optional via
>> devm_clk_get_optional() API.
>>
> 
> Even if you do not mark 'iface' as 'required', this API will work just fine. It
> will get and enable whatever clocks defined in the DT node. It is upto the
> binding to define, what all should be present.

Agreed Manivannan, however, I realize that for legacy DT bindings, where ICE instance is
specified as part of the UFS/EMMC driver node, qcom_ice_create() receives the storage
device, if we call devm_clk_bulk_get_all_enabled() then all clocks specified in the
storage node would be returned and enabled. However, qcom_ice_create() should only enable
clocks relevant for ICE operation, i.e., core and iface clocks. iface being optional
for the time being as discussed.

And so, for suspend() and resume() as well, it seems I will have to continue with preparing
and enabling/disabling both the clocks individually.

> 
>>>
>>>>  	if (!qcom_ice_check_supported(engine))
>>>>  		return ERR_PTR(-EOPNOTSUPP);
>>>>  
>>>> @@ -725,6 +742,9 @@ static int qcom_ice_probe(struct platform_device *pdev)
>>>>  		return PTR_ERR(base);
>>>>  	}
>>>>  
>>>> +	devm_pm_runtime_enable(&pdev->dev);
>>>> +	pm_runtime_get_sync(&pdev->dev);
>>>
>>> If you want to mark & enable the runtime PM status, you should just do:
>>>
>>> 	devm_pm_runtime_set_active_enabled();	
>>>
>>> But this is not really needed in this patch. You can add it in a separate patch
>>> for the sake of correctness.
>>
>> If my understanding is correct, I need to call pm_runtime_get_sync() to enable
>> the power domain after enabling the PM runtime to ensure further calls to enable
>> the iface clock do not encounter failure. Just calling devm_pm_runtime_set_active_enabled()
>> will only enable the PM runtime and set it's status to 'active'. It will not enable
>> the power domain.
>>
> 
> Again, you DO NOT need to handle a single power domain in the driver, genpd will
> do it for you. If that is not helping, then something else is going wrong.
> 

Ack.

Regards,
Harshal

> - Mani
> 


