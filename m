Return-Path: <linux-arm-msm+bounces-112752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wyj0HyKlKmovuQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:08:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB8671AAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:08:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b349vkCa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pzv9IFWW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112752-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112752-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B25FC310BF06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9CD3EC2DB;
	Thu, 11 Jun 2026 12:01:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0833EDE7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:01:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179284; cv=none; b=RCDKywsbdrUUWXEDKDzVePHw39AGxHsLnVgBK9HY8uGxNlFRzFbhu+YmKk87N7sbNPHe5/BBwLG/ZaTWjRqwkdYsSxEYfoaHCXhX8S+DhSF2pvmRLZj9SW+PvO/gQwiNBEUivKbXrA8EXLxMXuXGo+jGN89b4bv38vvum7XgGnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179284; c=relaxed/simple;
	bh=ZuORJUwObW4xsJ3tOALrr+k1fWB6IrmjHQghqBGQaX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQsPHiIJDTFirmWLRLTamT8O2sH7eoyRGp0Fpf4CA/JagWqdqZVqpHj5r8BUBvfFMqexp/6xeF1AsdMcZ03U3acaLZ5GkgxP7eF7Tz+Gt5ETDsn6Ys4Ehj89M+F9D6NGRYSTLFeu4albcEdDcYYw5/U2VNc4FizmOTg6fnjdHlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b349vkCa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pzv9IFWW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9x8hf267623
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWw+kISfaCKMJ00gi3+UDgnwGcjsx6JkuhheMmrnEHk=; b=b349vkCaQ+T69C61
	fvku+6kjZGg/6X9mbesNYd8zfW38uL3MsDYDemvVotM312CgJwCcdbj/A4+jHsZ3
	q9jjz5VQSkwZMF13AURYw74XiixJZNp98iIJk63k0eZ0o9ofJD7iGTHDvNcja52V
	XbK9+WUC6nhFZAxObntrVTQZ1Ym/Qr3HKT+5xeYRbOOaDFROc0C7PMvrsiWYfsKo
	QLa9akGSpD8F1YmJeOHwi7uX4w/8O63TApqJQAewuUnSxjmXQ5g0uPZx/QdWKx3O
	/X1rpWeDJ0cBbZTpKcRSGhfOiQa5CvDkHA7ZtMsRMxdlSpc/No0wS7gkzbwrD7gx
	xrN57w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u38gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:01:22 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6f0539a88so3113213a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179282; x=1781784082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWw+kISfaCKMJ00gi3+UDgnwGcjsx6JkuhheMmrnEHk=;
        b=Pzv9IFWWrPmtEdPfzMdeNTT8ayjtUGkJivODD4leOHGMMcsRKTMz70BmITjmZTseHF
         dEqaX/JeV1xcABMB2ecy//GrjGkYivVosXxFaK92ew3sgbqtXnzg2qBYbAL6eU0N6+hH
         /ykd4gJ6Qr8zrswGmlm0Trd0Nj2f9FbFlE6nVG0/Dupoou5c+asq4qHCWK8j2s/AgpSU
         S+/zQwEwrgK+7Xr7a0W6uH8UqxJdylr+BIWbIIKfNJCh8QDboo0KYeD+beaDve8DB+fd
         yyP8ZPrwSDpNWAfbLLDfyBfaUdsmrUkMAfr0zb8ETwVmXtMPwx9PbbwYglTIv1ThenpY
         ArgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179282; x=1781784082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWw+kISfaCKMJ00gi3+UDgnwGcjsx6JkuhheMmrnEHk=;
        b=P7spPTX5XqKqt9zzGvXOKBxMM+drUJ6IRJgnu1PJ1I//amQ8XJClDRS85azQvOprAY
         lbjQKwFLExrhtf6K/ATE1StkQdTvagDaLID9EZAc056M2LUlop35GLD3DgXMTxMJHMqU
         e4jRzXl+LtHebZJ0D2F0WPpOclnwxjpQzr94YOMC20iW0h0Kbm80QBMGSwPs5OsRADiu
         T2i2+uPjkBJWDpU8M/5RD6sqVuziT9FAx9giKf87hYIh9n5XbY4WNQ0LH9+4J2OgW7Zn
         8q3hsMVcPKFehKe7AyPTXoohEL9NnsWnTfv9aL1OLAvOjUVrf5RJSrfo3PHrP8AaXZp+
         yobA==
X-Forwarded-Encrypted: i=1; AFNElJ+AIOXj+sU6+IBGxXxdQAeKIWLF6l7pkKvEH3mQe6lN5g9Yd32Bx0g4/wGxFHVv55tXb8Bw5eCDliRiEp9O@vger.kernel.org
X-Gm-Message-State: AOJu0YwtmPc+4P7oJOz35kTLnL8/2VRN6sEtRN4/4aTVR8bNlG0AxjJj
	tgZ2QdzsetoIUZX0/7ML5rhQb9xcw4KU5xaDyGWAmv3Sj276HOM4KJfcAVrqpev9eMX/2Xll370
	zX7wyOr2BBiaXzoUsWD/4pGsb/OkndRYbXd124bzikPWv3VxQVidBmjiXIVbPr8+8Uukg
X-Gm-Gg: Acq92OHJwRq6dz6cpF7uJ+sEgqUCTxPA7WDT2UcHpAh3XAaIegiVzb2B7KMiItFDNUF
	hLT8KqumLBTuDEEIQhECLFhZy4QyRRTCoL0TWeGEfVSX2e0eEu+cDp1zL4ZGVcpG4nuKsX+V/+0
	H6sT9krY/2bgalTccRpKbHwWRVTjfYpLix6bkvhzIA+CsgjeQ/g5n3gsGe28BQTDeJhoS2IDRVJ
	YkZ62iXdtEzji4BmXKaQ6XOB7S69FfBZRG9AXGwSyphL344smyswuLATGRxCA//Rh3AlmO+1tgG
	RvfsuYz44qIq8gpc6UdSX+T+46K8CgbMuPSc1filQHgxJrRF0BMp4q0SPRTclDEEaYqQH4jPh19
	JcOgo3/plQSmpshVdZhjqOKTgJWfuBVsxiLXbxBSV9jYrotfE5O6wuK9I
X-Received: by 2002:a05:6830:4117:b0:7e6:e0ab:4169 with SMTP id 46e09a7af769-7e77353cef2mr1044328a34.5.1781179281807;
        Thu, 11 Jun 2026 05:01:21 -0700 (PDT)
X-Received: by 2002:a05:6830:4117:b0:7e6:e0ab:4169 with SMTP id 46e09a7af769-7e77353cef2mr1044259a34.5.1781179280316;
        Thu, 11 Jun 2026 05:01:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb1607efcsm56772166b.17.2026.06.11.05.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:01:19 -0700 (PDT)
Message-ID: <5d3cb141-bd88-440a-adc1-e4d722bbc3cd@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:01:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
 <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
 <61353034-51a8-4be9-8f7f-b15f5d60fcb3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <61353034-51a8-4be9-8f7f-b15f5d60fcb3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Kjat2h6ITofbiWvYLie7tsjZ8aWvKns
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX5/edVoRhvYCd
 TRXQRqRgjzvF6LExd5o6s1/gzYLMylcpiq+HAt8+KQYZqPnqzWN0HEQeJM3CSWFiA8wLiRwCl95
 BLFjIrnUTEoObLyfJfeFZTmRR6cfchg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX5rR/pT0r683c
 jTfXUpAFqVvE2HCDTfsqY/IFrAqm4GMccMmT00H5l3dLWhvAuoK8X8gRKFhoi7lPnY9KiFKXeue
 yi5mIbvcaDddRXlWBDmGYtgExosmJGAwVs+juMSBSKWQjUKbZB7OYRGurXjutQWLzzLUmuk0Bdf
 GmB4VbPcWGp8tjn39Wqb1A293nhu+bXaFjlIjdf4V9RX7BIAWnwLH2ImU226PKiCvP3T2axfbRg
 bX1DHLiirDInAPj1IaE3sX87yYdeaRacrUnTTn9fWddSSsgmjbQNSfTzMKDD6VxHxSXKXmK73Qb
 40AEJqR/kIUtZd0njbxq7BfeRutuRg4Cj7wYphIWKtnwIfL0YAANnhVhNYP2TNl8knIWdGgWcQX
 iQjRaFs/7EL2iqW03aZSmfl7UUwkjaIIyxe8O82KogZwTVyePyRqC/4OdlUcnDMlCRmAlRI1d1Q
 ugmoL0RhGj/BuyoKdng==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2aa392 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=jX1pNWf4xwB8ecKES8UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: 5Kjat2h6ITofbiWvYLie7tsjZ8aWvKns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112752-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: E3CB8671AAF

On 5/26/26 9:12 AM, Dmitry Baryshkov wrote:
> On 26/05/2026 09:07, Taniya Das wrote:
>>
>>
>> On 5/26/2026 11:16 AM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
>>>> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
>>>> registered as standalone GCC branch clocks.
>>>
>>> , otherwise .... what?
>>
>> If registered as normal branch clocks, they may be gated, which
>> breaks access to the EVA clock controller during clock controller probe.
> 
> At least for the gcc_eva_ahb_clk I'd expect platforms actually reference that clock (as well as they do for GCC_VIDEO_AHB_CLK). For the XO clk it's fine as it follows other XO clocks, but please add it to the commit message.

+1

Konrad

