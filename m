Return-Path: <linux-arm-msm+bounces-108364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FrLLsQNDGqJVAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:14:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA2578CA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF58F3005778
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D713B3C15;
	Tue, 19 May 2026 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8TnIJgz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KAueQnj/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7C3AEF59
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174578; cv=none; b=XVcSPKa42UUmsfWDaMNBj8ZLd0SXLNRNefWIEnxcmb+aCU7fxplEmY4oRpZ/sbs0lxljNF6P1+EXiNzA5ayUgwVoMhmKWLc7+gW4zheZ+n2BF9UyD8akNyaRnpuiWP3X1lIZiZ1BdFEp/WuSGej/lJvyn04EXO2b/hvCxAXQBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174578; c=relaxed/simple;
	bh=HwXDOwJ/n8kwN5m65KMuiRC57ObOd4uZu5RS7F3aRHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDRGz2IO9yccsCSODi+39ERJlbdiqsPRBwPBTYSP13pHLzACIYKs5SC7ZyxWLVSTjzxnN7/ZP1a9V7DvRnn75aHjawBCYuXS/RGazT4KkNHLJvECk21GMCumt3Hqz/+2Yi+M1/XC6uUiovULjokkm2vmOM3xZT/VOWDiAufzIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8TnIJgz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KAueQnj/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5WGdj4130974
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	flpjn8w2XFi3HDGFXRZoiV0RXVmGTmh3woS4zlIQX2s=; b=k8TnIJgzFnzTAcNk
	Xznrj3F6dsjV/bSW5iDpbg8odUQ1Ym0tIJhj7zRmnUu8YclwkG506SS5Mv4S1e/d
	oOpn6g4mKRqAL4PQSa0k2Uu+B2Lb0CQK30evFwtOxxX12iFnz9c4V7vbosXDVTEo
	kWgnCIwPsmLT48erBtYQnli4qUhxsNQiy0tnQojDVBst2f6p4zoMnd4R0VDmWsCL
	W1R7QJWgDTEj1kzjOja1pA7c4CYtNCKJ6N1/sh/a98aX3wTNM+1eehcrvrzHJOig
	hvN0U8L9wQlO3sYbzOcy1y3vpFJIxwAExe/KvB4h6dJnDqppoYt59kTUNGSw4l+n
	IaK/cA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1gcsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:09:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82726f7b0bso1586417a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779174576; x=1779779376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flpjn8w2XFi3HDGFXRZoiV0RXVmGTmh3woS4zlIQX2s=;
        b=KAueQnj/Sk42xz+DEI30livgaBIsFHXbtVokiCm25E1hwRFUn7KDAQcvwcBxzCD5OQ
         o5WOihfokimBXC3uhkz+Go8Aa+wY+vDj8yd8HRwh8yuX07Q4xqvYGGA/GfQ1vBznlJv9
         wO4Dh/DXKgk6s4BsdjiqkOYRACaZnYv44QPRVcz/CB15Hq0VYiWrG802+E9txRrHrDyd
         0VmXl9e4cO/HxtNZ83KXlIVwfI20POZjOk4k9T9YeInHDVcQA82l2n/VTNPD1XcftrWd
         9NDc+aM+2zDJiMnvsBQykusZv0rZgR0Inpv/pWt07W9xYkpZiD+Yqn5i1ifKEsNN8TEv
         fpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174576; x=1779779376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flpjn8w2XFi3HDGFXRZoiV0RXVmGTmh3woS4zlIQX2s=;
        b=QnohNHY7lCYRxcHnAX+JkBbox+PLix0jXGurH1ts2/TXrdWTo6AGBkcn/JoqgsPllb
         DnGD7vK4CsJj45DXn6i5F9YetEImmYBlFsx4gFDDGNoFR9mZEn5L6R3Aw/QiEXQqKg1D
         QVTp8uVKiOhQbq0rc4Iaiadlk7asMPzVkL8cpvnOhLAonxT3cKdJsW57JtvvI0r4SRW+
         V69x5sy8zEbPnMrRCDGr6OVe57AZLw2rw4I7Eq3pdhYvPb8hq+QDhas13o0G0bu9byJZ
         t0pYPi6bR32sa7U8YElQikXPAnzbZc2V9421/jeN+a/yZPSG5lhu2jDdaACr09f8JJvX
         jUPQ==
X-Gm-Message-State: AOJu0Yy+vgqSGwIS+wXYD/m49hlqf/+wLjLwu3xafpl6jVLa774ssgtP
	HsjSxHhsyhBLRfHObZgsrI0T55wdM/J8MwF+uu+YTfFTqYnpS3DNXjwsURRy8MVxkepvnR+3cUl
	noUvLqOFvt0iJ7gennNgGxEqBMtx6lVizQPQCAXFZetwyZbI7xWkcmRHDa2Ppx/p25RGR
X-Gm-Gg: Acq92OFZn/TQ6Tu5q+XNoy4RBSPf5X8wwV9q9vWj29w9B/H+QQAWVR82oglY1B/dZ2k
	ace6Iq8qMj3TJUtzxknXvt40tc/vM3U2dUYkTLA8tk8usnjy22zSWoiQQ72Re7iD+L/YbMIDV0G
	ORh3tZN+D0tIuk/TaBw+nW8HP33ofQHpxUMascWViggLMhvSHxRbpDi7kGwk71mfnsWZOFmwSxB
	0pG5zoV0SymZ85CwxqPt35qA+sn3H2K4ODaCelUSrFT8pWysjgFSy/62MSMKqY6fuu3vldT6/P8
	RDNpQhsFkZQ4PazBlvbbZeTXTIRWNUL5X2LO5Nffyknsiqpzu2YMhWRKhCtOSF1+WWpc8W8WN4F
	AHHl/MDI1cjGkx2rJXSW7/6GHgzndGDvNg6G2p3xY2y+bO5tGb7Wt
X-Received: by 2002:a05:6a00:4fc8:b0:82f:48e:241c with SMTP id d2e1a72fcca58-83f33d8ba87mr18630233b3a.23.1779174575625;
        Tue, 19 May 2026 00:09:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fc8:b0:82f:48e:241c with SMTP id d2e1a72fcca58-83f33d8ba87mr18630188b3a.23.1779174575082;
        Tue, 19 May 2026 00:09:35 -0700 (PDT)
Received: from [10.92.176.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm16288753b3a.43.2026.05.19.00.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:09:34 -0700 (PDT)
Message-ID: <f40798ef-e066-4814-a26c-729dcdb9f5b1@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:39:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: crypto: qcom-qce: Document the Shikra
 crypto engine
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260515-shikra_qcrypto-v1-1-80f07b345c29@oss.qualcomm.com>
 <181abfec-a6f9-49d3-9428-21a169a94246@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <181abfec-a6f9-49d3-9428-21a169a94246@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c0cb0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nVgdB394IWv0AcZ3mQQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ivZ0ew6Rug6AdZQ-SWdsZwpuvjXX3JMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2OCBTYWx0ZWRfXyWZLlW6luzts
 kI13lEViKgYEVtvo+ONoNPaMzeUNuK+4G/X/51v66A3mdoOit8/d0q3yVdtmTxOohiPb1mQkA2L
 MgSinsBJJe8m0TpwZY15XuLlmry5F9MqbxGG3RuPUh04R8NjA8zHJXAEKIu7nTghSXFi0gRw9L1
 wHuyU32Cf3Y+PC/rkMUcEsbm3KMGbtP/1M7D2+DvYeWQdr6WMQbih6ZiQxnrVkCgnsJno78R/T7
 e3wrznooffOoZcI+Vg/Nq3EgHs9c+ymD1iCtsKH0YX9TJC2Bz+KGbGnoTcBZ5O81UYHGTV0cH1L
 BdYyk2BCVG9oUZc1IcxrBuhZ4nntx7ebRR1Z+lz+giAMLdxC+zod/t35ccY3jNk4dYo+0qQtbzY
 aeZ70h/ve+1pniSn7bbUOPNOy8Jyyvix+6OjuVfl0+3s8gUNl5Uyz1L7qin4V3bpJBQl9FqvpSj
 e2Smm8zoG5AaQwLeaPw==
X-Proofpoint-ORIG-GUID: ivZ0ew6Rug6AdZQ-SWdsZwpuvjXX3JMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108364-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gondor.apana.org.au,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DCA2578CA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15-05-2026 16:30, Krzysztof Kozlowski wrote:
> On 14/05/2026 21:23, Kuldeep Singh wrote:
>> Document the crypto engine on the Shikra platform.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> ---
> 
> Same comments as for IPQ, Nord. I gave the same feedback internally more
> than once.

If i understand you correctly, you are looking for more descriptive
commit message?

-- 
Regards
Kuldeep


