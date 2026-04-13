Return-Path: <linux-arm-msm+bounces-102899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM5/Crus3GlfVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:43:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 915B83E93C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35CBA300B3C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FC13ACA48;
	Mon, 13 Apr 2026 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXJCjxWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkDCWbgC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D923AC0DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069815; cv=none; b=sgzJb905ZVsoI/2cbTIp2pHYXdqS0qEEkh9iXU6vyHteVEt600P732bFTr6Ii+sY1VZLedmVUoAOcZATeif7iyMpSq5qFSCJM3SNuVcBXOyhs1pLjuHy5DShBC8e7rrhcFJsCBVob0e+eSfRCervNV2qz0iKRn07B32yQ9hdRbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069815; c=relaxed/simple;
	bh=/09mLxPNgZ3t+kRVx4P1lYeG/ZzRkMVJ49N98lujChw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loFj02g7PBigy+89tmJXiJsVUHK4rQs+kfUW8QNeawXzNLScP7ZbmbqT/a6xaCcCQTL017U7Y9a3eqLpKmzrMZo6vHuE3sVoFfWqRSkXTBKu9H37EiPSJZYwK1AnMHg9BqX/BRYZ6t2Kzmemqg/PrV41HDBB6mgnbC12q/7BK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXJCjxWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkDCWbgC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5caOp532656
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVagbjQzTDdTG4JtWTUXt0fj5Q1gDFdhJLwrU3xepQg=; b=mXJCjxWPkF0v5RPX
	AkAmE3J2ePZGIx+bIw7orpbpD/SIb2FSGKIBpMPOGN40NBqNPkyv9p+vtbYnCH/4
	KJ7qiP1Y7xpK9yN8g0hqvQJdKKMjAMBcifWRBQBCHOWk2gbYt67TQc5jb4OJWuL5
	107Em8f/0k7IC3UuPMfOb9sdo9HgN1DbNUwxl/Bdke75vAjyulDURsPAiakyW2Bk
	PXW8MC8xHdU1vUeV/QCUiQ0a2BlVRXIhPlaBoHpbZEvCfvDpodqGIeOHyorLC8Ls
	CytaIAuj162DjSR9xZFHMuOqx8ehbgaD9ule6k9KbZrw9TyqC2/C6UwedXTL7bFr
	iJVRpQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2bcg4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:43:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-895375da74bso10813886d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069813; x=1776674613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVagbjQzTDdTG4JtWTUXt0fj5Q1gDFdhJLwrU3xepQg=;
        b=BkDCWbgCsFc8lfj5a70VZdxY5EvI2v2ePCWLTDzNaO1z+HWDHluY3exUXfY9UgtAzQ
         ShcCTKYp9ZtbNaLD1uIasY4DlmkAz7ee1JybGT3oM1rs5RnOp8NtglC5k6VtZk1tXMkV
         RrSaTp6rp09Ftix7PG3uXQ/YWeBx8inxR2z2OClx4XB4weXRM8kUx6tYlpN9PzPA59gt
         fksJYwedhhTVu5J+6vD1TlMoGUgMB7cJvL8KssvQ0iWF192AAhDDkktrykenQAEZhIjV
         8h8sYc7VnDMOUIS148HQMtLaYQXb2nlBJMU6T54QG1QkjZxuJfOI6g0S7m+KoKD48dvo
         iSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069813; x=1776674613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVagbjQzTDdTG4JtWTUXt0fj5Q1gDFdhJLwrU3xepQg=;
        b=rAHeixzxFknJ76/hwtuqG9yu3Qt9Yct6w7+9wiDOmKItnGGlxtPUXUBHM111T9cLh8
         cZHeWznp7KQS+ems+mRJ38BRQzYWVRbpPOo1VxK9WiFGgtyDN1p1OUHKSe74U6DpH6nk
         q/qLwLR0+owN3QY6WTcc+PbHQL0B74zSojM3MATkWRcosUHBCkCnB6WQIq0bS/BcKYxw
         6gla17Mioof5lNyExvg14Xnb2mmrwYRPH8YCmf0D8LsyWyU5jPlIhu/DWsYt9BFcnAas
         HObrBkYVH6w9NvgUicA2zKwnsAGuEV2gzK6VFYNTx+H+1gD5FnLp1RzSAiOTI4BmIcyU
         2OPg==
X-Gm-Message-State: AOJu0YwTb32C4i1kBzYaErXvuk1tif6n93m1fHYXON+7Upw6nx1OHyrp
	b6uEkhv9Yl1dex+MeWHVjkUJyOJ7D2B5SPNgkoDZwC/fixqRgY3i1Nwk29npfaDGYwqyvbFsj8i
	yv6DeaEglCiNsMgbMEYySWx2HStJYLTNKnLuV7npsVBuJC5CUAmfk6salYa9vTPJc19/heV4wHm
	lF
X-Gm-Gg: AeBDieuyFqsJUZYMNkaPpUhcLWTgTfCyRpkwPfWKhWv78E33vJfJ4TARIJ71gWAQDGo
	cv9SdW9DiROutoqNbMLJA0MENtP7EH1JTR+vF10xWEHVdChsqUV6GzRkcV0ADJBT+nUJL02bh8i
	e20R1es4KwqHNPuFOnke9Vo3rqhnxltXFjtHRRO8jphCDItsIPIfplmx5I5QZPDM/nOnGWS/6VO
	SY8z4S6JiYbFRVQUqgK5aOHIa8BL66h2K74DBxavv8LmMJWS+DNpvuhx3OfRKfPQnwqNzDvpgDQ
	wjiXdqTY5hBCOXkMletwcuQhneIPcO2OrdwSoPW6zlLRoVKhzBJqPVwwYCIkEa1ee/8EDB8i1ty
	zD4XWAgXmZN5/cp6gM4rAnYSaMRTKjAGVH3GTgEI8qC050R/xcPgkH9INi+5LB8U1Ctu5pse0au
	NP4oA=
X-Received: by 2002:a05:6214:ac6:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8ac8629bcfemr144332936d6.5.1776069812703;
        Mon, 13 Apr 2026 01:43:32 -0700 (PDT)
X-Received: by 2002:a05:6214:ac6:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8ac8629bcfemr144332776d6.5.1776069812215;
        Mon, 13 Apr 2026 01:43:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c886asm292211666b.46.2026.04.13.01.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:43:31 -0700 (PDT)
Message-ID: <138dc88d-61b9-446d-a2cd-ca7083c382cf@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:43:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix reserved memory addresses &
 sizes
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260412-eliza-reserved-memory-fix-v1-1-05cb3e33a9fe@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260412-eliza-reserved-memory-fix-v1-1-05cb3e33a9fe@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4NCBTYWx0ZWRfXzUM0VY5S8sQ0
 MYa5LPGBaWzYxeJGtwLM96rhjaIdMbQ+lS+lOr0ouAq8C5fmbUV5v3E4rZIJ68d1gDMqC6xWq/l
 O+5j6iSivzu1TLdluys734a0+LuF2DNXsXChb7ShDmwupu9UfKT/H/mtrH6sEyHOcxTD3wXxrC7
 ir6h7Q2NLY42w6mFBkthtmth62WHqsXiMMTWVEZkbxD35wr2b25zpbj0U1KlAN+etbCrCkGzy7O
 3OUrTkLm5KgWHJ1sBBtx750EkiSN4TMsemzjG6w12Rr0eI7W1AVVT/BkxPX5HX4fUq1p330DJ0E
 b/7gDoAnEf+GaAQRIztL2fmi0Fg3TRBfA0LeO6gXxxEdlU8qbUxqNu+9RrW6nyiuBnRnGZjyaPB
 yn/wynIOcE62CuZMaWJFuTAmWzT0lZkp6zCyL2AmCWoRLdIwaSf3ONGyAz79zKlpfT1MrbeiiAJ
 ZntAHt/NF6i4FfnDM0A==
X-Proofpoint-GUID: 1cABisROoqn8Ydv_TQaLnpgKDqNr-VxF
X-Proofpoint-ORIG-GUID: 1cABisROoqn8Ydv_TQaLnpgKDqNr-VxF
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dcacb5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rm3q1tRxOzQDkYEpzY8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102899-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 915B83E93C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/12/26 5:38 PM, Alexander Koskovich wrote:
> Update cpusys_vm_mem from 256KiB to 4MiB, cpucp_mem from 2MiB to 1MiB
> and fix cpucp_scandump_mem node name to match actual reg address.
> 
> This matches the downstream memmap and kera-reserved-memory.dtsi.

These changes also match the latest memory map release
(for the record: LA.1.0_v4)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

