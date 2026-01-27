Return-Path: <linux-arm-msm+bounces-90780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN40NPi+eGn6sgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:34:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BA994F47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C113D3030127
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FBA21D3F0;
	Tue, 27 Jan 2026 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtXIs5uw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HGuRbSls"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3122259A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769520710; cv=none; b=JrOF9tKGbKVmgKbH2xG0XhsHZlJQLlcG0xiD7rsBKlX+WZN0CGOzIoAWSnUVpnzpM3F2VepdWY1UYBV8unY4L7WZrFmkeGQ8aKTw/ogRcFh+nfxQtsMgChzSDJREUAJMEOfFs2apr4Vqjk/mUIKPF3eFUeqTAGAMnoLZtWu7gaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769520710; c=relaxed/simple;
	bh=XQcAqs8hsoVi4a8LJeZBgh8kC+d3rnvYY4ZHWhmPL4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9tlOnh2tFDQFdp1SZsnawstYZ7pmaOSsf9q9HVv9rJB5QPX9t4/vm6+OZkTrQhgIVeBFBDvRbZ8dLvJQ7Ut80YW48zzc3lqbxXyg6dfL3Kgf5C39D+oGl71LXheCZYuOvtSpo9jo2Tg3Png6doamfKHCEt2uGtpMb5aWVO9dmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtXIs5uw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGuRbSls; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA02dh184765
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQrXPsx2Q5RC6LTlRCVXVFHjoj93pICbdA43O1s5rBM=; b=CtXIs5uwLayJp84U
	sCveGKqi/6+2m9giezzFJfFpcDqxWaR49dFNiFhx8IO1DLw3RqR3OC2p4EZAAnP0
	EGNdfp0HfvwCEICE+zkYr4EGJ6GKjixc867y8NN9XMaY4503hTIEDjASfoHRNgN9
	WEk1lZeduGFIH02aciWDmACCUXh4PpledJyDg37ch2EgtuQBLUqa/3I+zWpzJrbN
	SVotvAZ+/1Z3QwqbvvZ42ftw8W7AgVOL+yLm51Xvi1mS53dMPJJnG3bvwDcsszDD
	ua+L7XNUddSkIamgIAGM/WMtVkUssh5m8HxNHqYwF94dSFZNaDy2VeFHnb1C0i3n
	9co1Ig==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9k6gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:31:47 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56647137197so102842e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769520707; x=1770125507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQrXPsx2Q5RC6LTlRCVXVFHjoj93pICbdA43O1s5rBM=;
        b=HGuRbSls0ANgi6YZEowG1z/Z6a16uotht65Uydv6wewN2fNSuoxHyg7RpwFDJhAnYf
         v0SC5bjrsL4+C0+2fKVdvL5hNFbuPeq5u9AjtDfCopYt0rj7hzXrvEqzGg7Qe79zTTHt
         kLzQsgJ+Hk5vR2xkDzLR2KAiU2T7DpragK3bjFIsD6mgfbquTRhKVn63R3fBqT4bYcZA
         /7JE74bMcgd1FUUQDwIOZ5i1RFhQPZDLQtZ1jwsobzL4DDVHn3gbJYzP8PgBXtSyc8uJ
         jSamUpO2YhR9jxevrXvraVt2V04RLdfsV1n0ttRYyAciAirkazbkaeQ5ogvKLiULsbxi
         WmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769520707; x=1770125507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQrXPsx2Q5RC6LTlRCVXVFHjoj93pICbdA43O1s5rBM=;
        b=Lb9135Iy5E/TFgaF/EjU/kSuUK4kLKz5F3RbkP21JPnd6qHYWJk1pGDp/fcU29bUtR
         9jC7/Fb4h+hiG1GPBjy3a7THn3OZn4hLAx/6kIDzk4qcdEK/rEgmjrSlXXhyRWt5y5+b
         C93CO0+enrwig+VGc4UkLCKVHAslUSFgpl0+Skts6yhVpSblbgTT10sgGTGhLdgikK4p
         cZ1pEETI5ZWHBfkfqwBtpxNnGvietPLVxwCSd5gRemqLL4segzo21ZBTuQa2PzKfsRuR
         3O7Qa1w1hSnS9icXGGlqKIABPg4OvIDg9Y+hkyHAilgEqt/uhdGyYIP5SndXewYGg3MR
         orfg==
X-Gm-Message-State: AOJu0YwAlakDqb4vm2tCa5QU0YAv2px+rkjOHiLJVEhghyCHNSJIteNi
	jBWsC+da3nadDENiE6+vLXcZoq8RNrCtaIJ8pvBMeHqkAHY6ku5MXLgfyUhkoDQ7Pca8pDt1Fx5
	7RkT0bb/g0SXCQ4HBxN5uD+wNtXCK1AG+5bnLvgpEPpl+42PKcCHtRYZ6qg5l5ngXE5L7
X-Gm-Gg: AZuq6aIQIzk/bkeTXFoVW8yFA04s/OZAmwocAVi2/BfgIfRDrqO/NtAHIvbNdQgYIEy
	6OGcXaV8LP7NYB4Zg5TVhgeCxlqkc7EsFutjG/tfkonB9vF8IVSmFZE/N6ICdvyE6eJ5Sh1NnLR
	q1td7AgXHbZKgTxWn6nKNeTZLxdwvX0cEohz/OlnXcBpRlzkk9P1+PgU2RTQTL56b0ymR++Ei88
	z3LfS2vI3DhIWc8gL3NLwhekZ/QMTmcKDmpTfmTYjx1+n24K49OY1emDQ+/F0/DTI54n+7DI2gO
	EpLAxYhd9XhLFZ9oCSKV3/8UMD6e8aztv8vUinFcQvh0oPhnxm0usqmuyhg4NXCWH2imT0pQhPo
	Q9cKXOWtfDUnNSqS/3a/GxeoTzFV4HTmFMUrPA1NCGUu4lPcXoIeJeahHP17ih1/TC3A=
X-Received: by 2002:a05:6122:e01a:10b0:559:ef6d:b3fa with SMTP id 71dfb90a1353d-566796017d5mr185131e0c.3.1769520706767;
        Tue, 27 Jan 2026 05:31:46 -0800 (PST)
X-Received: by 2002:a05:6122:e01a:10b0:559:ef6d:b3fa with SMTP id 71dfb90a1353d-566796017d5mr185116e0c.3.1769520706276;
        Tue, 27 Jan 2026 05:31:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b77806esm782777666b.56.2026.01.27.05.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:31:45 -0800 (PST)
Message-ID: <bfb4c798-1520-4cee-b597-440791ac6372@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:31:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] usb: misc: qcom_eud: add sysfs attribute for port
 selection
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-3-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126233830.2193816-3-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=6978be43 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Mi7szx8wPLqchxB2UhAA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: r2bA8lDPCin2j-i7hxXgs4XH_Q68_TxH
X-Proofpoint-ORIG-GUID: r2bA8lDPCin2j-i7hxXgs4XH_Q68_TxH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOSBTYWx0ZWRfX1VFByBRJaRcT
 sS8B9Jut/pfq0vq5/bybhwuMQanDkLq2IusF1wXM9U1iIkDSCeRm6ilUy9Pg1YmM+R7WoPMlyaj
 fMO6IUG+72XR/D2Yr4qYY+5uBhKt2PK/BinbbcOxHKV4zcPYJD50Wbeq83reNYEDXZ6db6KjNmH
 34S8bo2zK18xvp5P6MObyYZeu4K74/P+hb9J15nbQqLuVAKyL+vnhbaGAqUpnk1QjqxgX6yz2ky
 Mnebz7a1eemuKOWuJyYeREOMp/MfiIc8GzPmAZtMNT3bWsXcI1PUexIbChvdDQamgwTX1eAPU4Y
 c2cQx9eL2EKu2tyMVA/BAHVcGLE9mHId1LglG7HDRfOe7a+ekE+yxIMfrr0VXkqwjj5pM5UUfC2
 4zatU1H7oDggbcItRZYeQOK4HaeeflX+k9XtU8HcdjeCG/ob6EhncE/F+udNyhvC/g/aB8uZB4c
 Cg167HlLtrnY6+V3i/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90780-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34BA994F47
X-Rspamd-Action: no action

On 1/27/26 12:38 AM, Elson Serrao wrote:
> EUD can be mapped to either the primary USB port or the secondary USB port
> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
> attribute to allow userspace to select which port EUD should operate on
> and update the ABI documentation. This is needed for systems with dual
> USB ports where EUD needs to be accessible on either port depending on the
> system configuration and use case.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

