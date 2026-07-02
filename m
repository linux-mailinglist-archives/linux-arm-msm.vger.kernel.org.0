Return-Path: <linux-arm-msm+bounces-115896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id htcrD3k3RmrCLwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:03:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 954326F59BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:03:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kjhkZZba;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EWOIh3tZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115896-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115896-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2194931BD755
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2094C77BD;
	Thu,  2 Jul 2026 09:42:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A2E4C6F10
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:42:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985341; cv=none; b=jga6webzjSFx3zi4xcX3GdxKZYtYp5zPW6Nk2a/yxLvAl9FKjD/cFbvoZN04yEUBokOIsusVnnFqTYOccH0E6m04AO454BdAYPrG5PplVW0GKxJuVXyvrpJmu3ZUfQkcE3KgNxzVWKoQ7g4EI628nOXt+QAsPwSmbCPoj8ToVwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985341; c=relaxed/simple;
	bh=SAnoNgk+nST+SPcfQje9T8ufskN92qCUkOP7FwGriDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UIeDxCLit2EC7DWnracQh/6tK5KWSuMGlBe13s4RlvfdXhmO7nHeIConV3xn2Mas1LzCGwajHYPcmIyXBQco7xXwvVA2tg7ikkg/FQphmCZzTQQluSO64ruBP/q3iZiD7GxOXOda5LA4IRQ06CKrEY7nK31yq5NQ9O2h8GNeMBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjhkZZba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWOIh3tZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662430Bu3460496
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fR0s+M/tWw+Di7Ypu7seoP6nVnfihF0HUAjt6FvNy4E=; b=kjhkZZbaZYveYXYy
	SEYIjSnpaz2aI1z0A9TQ57KsNGZ+JJU8mUE9LHLFR4I3iHiBf5UowxT/SkqHOid0
	HX7pvNeIN4hCCO1w0J/7iu5VyCqM3Y3ac+/TnuKDzaoyL4RDN5wdgw8GqmKHR7pX
	0+Wu+RJsL6HKqE5qTLJMeCBpI2dJmWyFAK+oHQqN+Q0xFn9s7B+2e1xyeZhYaLZX
	eu9HKsR18qCgPKyYMjj+IakpO3/D+BLIYHyvcTZ54Mv6L36DopJfa3NmL4iRcaBF
	2Zjga4+myp3lVIcfx7pgVliMdTsE4zumP538rtpzTvo1RuamQRBVJlSdzgbJUZte
	fK7LkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb16sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:42:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e59d97df1so25607485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985339; x=1783590139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fR0s+M/tWw+Di7Ypu7seoP6nVnfihF0HUAjt6FvNy4E=;
        b=EWOIh3tZhqQbzhRzxAbXlZzVUnnOL1Vhd91wWQ+BarTGcjlpK48u0YYBEwunkWK9bO
         IOBN/n3ezA+u73cmeW6XKcFbwN/DpN4AsGksas6Zh46hJQb/5MTJ/O5rQLEUd2px8dBc
         5BxQzYSK5EGByxHKjRcRidsUAcZvaLL78Q3baSiwNayTIUWCgQu189dI0KREO0RqYqg7
         Cz6tkd5MTNToh3u8EEJZhSZIjxiRqap9jdL/3p5xTMhXaLKCr+rZhdaX2kEzFU8fUO4C
         1tXJHAWoX5MmZXVvCMROE8DWPOfXv3W/+Vrzwoa9/pt7urTNuS1ie3XMp1U2TF11G9LC
         fguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985339; x=1783590139;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fR0s+M/tWw+Di7Ypu7seoP6nVnfihF0HUAjt6FvNy4E=;
        b=Hcqg3JEiKFoP2mUOCjjgwDHsbxp6yhmdX5pVMhBwlIaIhzQnX9Ue6I39fBZIYvwt8c
         3tDHhu7Pv7MJCameuFjTPdR+gtHiYXi8x22ETxgzWJZfx4I4Jt2P9yZN54DLakrPBXP0
         0yEaYpjRsmpAgtrseSXvw+ysKzHRdv3QYbpn30yN4DIjCSipQ+XUW9eBf9nilFs8nT0n
         T0UMWFGPQgBCFnYWZs0iQK9uULETLqCE7voLYWLMvpoSWKtIaxoGFJoKYxwjsofCWa3t
         xbwYph/ZkwW4ROnfr1p0F/YVjWVRihDPp5oBbeuOvXNUifC/mqFBhlkSNDCtrY5ijV2N
         EgMQ==
X-Gm-Message-State: AOJu0YxokMOSqt6Jl32lBYkITLBz62Lvnj8B+NWwnUwIOpX1HNqGGRWr
	gGixY+kJh8/Z+mcU8aY5kxXhO3WFUJFcQkRyE0Q7XSDl+XuH4AkYr8ftzcMmf765cYto9K6fX9C
	Y3jnhySCGdZyqTd+QI71RGMm84nBvvFsth8GMnJcSsF5SklJqEB4v/PWc0kBZ/6DIjStN
X-Gm-Gg: AfdE7ckdhCKtjZCX5/lrassPaLhumYGQDsYwuziX9Q7a2JBvq4trq8sjjjHhgDARLq/
	Tj6moQwWJuLFS52vanOcp/Go3bVRVeCA0gzl41G+kx8eMRVWPN5xuvdJ6aC1pC0FmJiTLKKZIF1
	UEPTv42Vs1U1c4qw1BuajHpnp/H9I8ZU25wOaxIGU/QjOOPqckmdjbDYZm40tZDQBdGHIrgMa/Z
	3FEjmEw8UCCnmihmYbv7Ngh6E/a5fMSxJd97aJrTqrrWmQTbfEXE5nhV2fBZUq6zG7SlgShwRiW
	yp1MHpjdCtLWXX30TjSkydglzxWEAoE/Jkfu+QVp7a1jCLF1cXid8dfE8zR7HC/9z4NaOwyrY1H
	7H05E3/whz4enZY/oy2LjEs8nLOefM+n/Wv8=
X-Received: by 2002:a05:620a:4609:b0:916:1a60:ee05 with SMTP id af79cd13be357-92e7809d204mr439347285a.0.1782985338880;
        Thu, 02 Jul 2026 02:42:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:916:1a60:ee05 with SMTP id af79cd13be357-92e7809d204mr439344485a.0.1782985338475;
        Thu, 02 Jul 2026 02:42:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091ba1sm99077566b.17.2026.07.02.02.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:42:17 -0700 (PDT)
Message-ID: <22bc584f-7b00-448b-94f7-347ce346b589@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:42:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Describe the ADSP GPR node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260701-dts-qcom-eliza-add-gpr-v1-1-9cce16219dc4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-dts-qcom-eliza-add-gpr-v1-1-9cce16219dc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZALMJtIzU9BoTLElEdKcowPzFz3506pG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OSBTYWx0ZWRfX3lfpdt0oiApK
 NwyQXIyGRFuo73WosacEy/IEqcpVSkRIvr6I9oi5au5u/cFTktFtTfNvOg3dXGO9Vv5JMGt3/8l
 /XMEPQ2XNkJURKnACLYUhfXQE98Wmy8=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a46327b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tZpzCwSzTtfYxpM6NqYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OSBTYWx0ZWRfX6zUV+MHJGj5G
 biXyTOOycgXTNkdb22zTgpu4n7LFTBTkeCGYb4qdrJ7dqFq0ziakyoK/lBzX6rClGCC6xN53JkU
 xrOcDG07s0TqWOhyWLqTREEKkpq643UpUDIgr3TF1jiFFqglJUt0nMSjkqLZQWcdDsN0ksIMtFw
 fzfHrCxKdy/+1DS7kgLKqE2FdTx6dZjmMQVY7mQWuyCu0uk2A0qGmQtD/L+R13BPNFncXWtgbfg
 2ovGR6m3JP95xGIP5H7Bq+BihXDoOhbrdXdV1rrq9qNzUTkSQr16ADAcxrHm1rDhuyKoFVR5u7v
 WkcTOXL+Vnf3jRb0Omht51gxZkszjpXEaZNtkjrumbM+ZNUfSc6O5LXtJunYxStuFJ48552BcAQ
 bG5n9l2Wh8aWLlohUsARWS+dBkqYPROtjvrk3y40M0V9dVAILDCOYZr41Cxmo/t0fBvF4lM+p/k
 aFWLICm+4UgpZ/hrAYw==
X-Proofpoint-ORIG-GUID: ZALMJtIzU9BoTLElEdKcowPzFz3506pG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115896-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 954326F59BC

On 7/1/26 2:05 PM, Abel Vesa wrote:
> Describe the ADSP Generic Packet Router (GPR) devicetree node as
> part of audio subsystem on Qualcomm Eliza SoC.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

