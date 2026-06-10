Return-Path: <linux-arm-msm+bounces-112317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dl3CELgLKWpcPQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:01:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3966670A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:01:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UTdBrrFy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b+BlfoET;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112317-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112317-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AC3C312BC48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3CB38236D;
	Wed, 10 Jun 2026 06:57:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCBE379990
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:57:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074679; cv=none; b=PMp2GZixtp/ORUnW00ZOAEBVwcoJ9Lv5j+mBZQzagXJq3j9bGJFOOwZPSJ+TsDrPKg2sUyLlzur5J+esRJsr8M16wQ+BuGWbNsA4YZjBr0pXT8Wb3vltdBQW8BqqMwUMhBhCfvky+2hWT3v0E212Mpp1IExU0vCwD0kK8LMcC28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074679; c=relaxed/simple;
	bh=rOfm6lPkU1YKozEVN/3dPmg68gLbBqXTCiwIkH4LjvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTrF3DC5ecQ81/xn2rGBi2WCN8rox7VAluC4G1OF7APj5I1NHS97GUO1h4ivOSD9PJ9MkROBRwiKTzJq5FGy02EziZ7a9p/e15aY2dBVTtK53rP/S69PSmbTpPjGgHway6WMshr4xhBr+7d2dP0j4e4rSHDC9Q0oXw9RAAztTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTdBrrFy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+BlfoET; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2efQ34061446
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOfm6lPkU1YKozEVN/3dPmg68gLbBqXTCiwIkH4LjvU=; b=UTdBrrFy49ApKAOV
	vPw/GBatGZzCWf/OPkwBMAFm/lDmmC09KUaLfeKinb8C/SDeT374j8VmpIfy1WcQ
	uD+u8qiM3xAAMunaBoPcb+2oRiMk2Rxqmqk5yP5yvjSKyZvaya4UY92OzcTkGNwo
	SDrnje3PhCtf30brYQsj5QFAhdrRaMd2FOXmUPqnzusacqZiCzQE42dYJfTcRfpp
	KdXldO7/hRkYoP7NaVlFK50bUONL3nv2mm1aARu/TB90/W9nIRUZviOCjueRxJJD
	DDtMbXG4QolXE2UfQaoYQdVoWwGf+eSl91WmK1gTYyD5UCnWZ46irTGkbeim9oL8
	9sZG1A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2h4s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:57:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423ed642b5so1508959b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781074677; x=1781679477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOfm6lPkU1YKozEVN/3dPmg68gLbBqXTCiwIkH4LjvU=;
        b=b+BlfoETeE0yYcRF9FlNOjp+37MHuEvjZO/b6eA4ZLJxQr4oO9Bngbp1Gl0zdAnqJM
         t2zm56RW+58Q+s+J5Nt72FQo8s8t72CgBIwATRFDDiwP6pVA2/rlvJCgSybLligOMQ+x
         y1fkDE06vuWbI2kiTFU6AiY7FnMjv6KwQbTxslpwyCZdE6umxJcAubXJI1gSOueiAbzq
         km+EGaueyim+JUu4SEQ9yWTtnXcSOah+p0gFV0xk9sQ5FaSLyITLApHuFc+tTacKsHsy
         yiEGsIr6gvSTU13nLnr5Pz7bDzzOMs3VrlcXzsAq92oD8Xv2AkAAqCP+iLA0Frkk3s13
         hrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781074677; x=1781679477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOfm6lPkU1YKozEVN/3dPmg68gLbBqXTCiwIkH4LjvU=;
        b=nK2bjksn27meHpaxnM/SrC7EtoXkqcmRz8SuTl09hj+0wfdmBTDaJOSrwGV7YzgKaO
         Qv0pa52ZXgo/64SDFPHCWkLe0qEF6s5WOMetPeJYBytOVK46YxXKV7B9aM/D2VHMvBbC
         SALyEtPiBapC2R6xsBaUraVgh6jcOdyI9uLPeMxusLlQRRDTOMb/wKmqaWgvEil0h/LD
         fpuJyGkhwRZ/79Sh/UlVwFFmwNu+0pMK8EqdkiCW1CVLERAv0eDeVQDy/J5LhGd8yR6a
         TzekfDjNoWCq475f9iRvlSQ3Ln5c+uPqYmU8t3QUa4eAKwNAwY1vxbyFBkDBFmJnCz3B
         KYfg==
X-Forwarded-Encrypted: i=1; AFNElJ+/LobLBQbEl5KITISvgU37wRQOEgSe33Hal55/csXDV/LN0DwiDQO+D+PZ9TpOHxw5+rpcUJyomtsSQszs@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkTXYaESf/tm27nEluJzke/VAvsPrtWdr6E+OEWKyJ8ROUdxV
	SQ7s8zVR3Mhwae2vffNI85KaZCNxZn0Bx1II4lvIM3le/alm/KGPqPQ5PfvGaUcaHk/Jr70wxEm
	5Jy2jHKjxv9ecXH/zT73XTPzQd2uRfFwptOJsyxAWZqs/XdHTGcNizGGr+eROQL0OeFRm
X-Gm-Gg: Acq92OGQff7+rkJwcLPnqAZPXB/JHHNj3rVvuMFRwqpgiSxLpugJjb537C7qe1CT0nr
	n3jQylQd0w0pvey9uoktBKGk/9uFleDqfgLiM0eMX2vefBkPhefXF656HTs4FfX5e7qy7vlg8Uu
	XWIHRvtBfnrfDjP6QNJdUzISlr3lFgeIKZ/bW+XMX+P/zuC3CBFSNmUVBwe45p+oAFIherLR96J
	1tuL0ylqjt4I716cERli3pRUcuSP+s53QkcDsdIeVmhtaxuRlm09t8P2xyBzSLXb/Sbp7+H3qnS
	YR+OspvoiVa5BYZzNi3xt4HiNtZhhbO3aVnWblYAd7tmQWlF95xatOmCCesMwGtFPNA5NUOHkF9
	vGiWJVCOr23yIX/k7s78iNt5yBXJsdo+AeKbUZYHx1tpRpNpLPUcslp6R2OuJuA==
X-Received: by 2002:a05:6a21:46c9:b0:3a3:18d4:2590 with SMTP id adf61e73a8af0-3b53b9eb2e1mr4251866637.3.1781074677013;
        Tue, 09 Jun 2026 23:57:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:46c9:b0:3a3:18d4:2590 with SMTP id adf61e73a8af0-3b53b9eb2e1mr4251856637.3.1781074676606;
        Tue, 09 Jun 2026 23:57:56 -0700 (PDT)
Received: from [10.92.214.149] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a63b3sm19996385a12.21.2026.06.09.23.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 23:57:56 -0700 (PDT)
Message-ID: <751d1fd2-4f34-40bb-9175-bff749feef6c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 12:27:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
 <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
 <uxklfc663dzdjxd5e7gd6mftddty2nxqypoandbwakydgrjhaa@s5mskp2tlfch>
 <7461207d-aa05-4272-a9c0-360e6abfb0a6@oss.qualcomm.com>
 <vnax3dacoobn3hsx3xf7dnfloxv7qbjxqjwkwnxc3ux6jbqo2w@3zroc5uxgfg5>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <vnax3dacoobn3hsx3xf7dnfloxv7qbjxqjwkwnxc3ux6jbqo2w@3zroc5uxgfg5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a290af5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=vaLkkUhX-MW6LBW3rbgA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2MyBTYWx0ZWRfX60fI/Kk/Eswq
 8z88u7Qw434udEwx6Tlug217gGZh3cUKcLlmkP+xmGh/aSd3N1Pa4LRhCFYLnSnhSuubQhyCbKb
 0tBhqsAoJAZkRJvMLAsNXS3H3VWlezh58quPWcXrmI3xBw9+FUAosCosDZI8w/aMkupQNbQbPL7
 rdDzpuXyuSBIoxjyO6TDxkXnAysXx+c0IwH1T/z8XkGP9+3JnNpBphymumS4GB2fBJJDum1+3PS
 ebMa+GFVeHwMPamOSTBP1zdIvYXsuJA9YB+TWePE9G/YD04xDY0pF1klVbMpzKxeCB4E1S1h69F
 nBdfFBpHqtDYjbNwH1QG6Gk4iEQo2u++a8N/4ULEY2WbMAeQGL3+UdSUfJkIuxGkaYXgfGaxmxJ
 q8ggEUPQr6+pjHdsVLs2ODbCYqJmcsUGKfKtxnlu2nJv1nB/xyo5kRZyOcsR0kPoTnLV1dhQPHO
 HuAZODMGbnoTy8H0hvw==
X-Proofpoint-ORIG-GUID: uL9thJvtGBKOf3S3jJ0_D8XV4TmBW1ns
X-Proofpoint-GUID: uL9thJvtGBKOf3S3jJ0_D8XV4TmBW1ns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100063
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112317-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CA3966670A

Hi Dmitry,

On 5/13/2026 8:03 PM, Dmitry Baryshkov wrote:
> Judged on the previous suggestions by DT maintainers, there should be
> separate DTS files.

Ack, I will post the next version of series with seperate DT for this
board similar to v2.

Thanks,
Umang


