Return-Path: <linux-arm-msm+bounces-84305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CED1CA2AEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 08:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A91D30596BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 07:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774492FFF95;
	Thu,  4 Dec 2025 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOkRpIlr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gno2PiyE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0675D17A2E8
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834386; cv=none; b=mL10IQhiOmIjxD7LlQlMUDPg5x2HKZmcBzgIOD34lwKmi+Cj/5zt6uNYV0KGNOEgVH/ElvQb+hW7EcH4Zqs/yNTlPQCvBi/9O6eg74oXKrOcu9hz+czq1E9Tz5Se6HM/tT5prDPhEhT9jXuWK7AqJ62mezxqrIZYSPIBXuRUya8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834386; c=relaxed/simple;
	bh=Qer+gIPSs6FQC1KhKRvzjuBr8hRWeSbpjtBpHeduses=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5pWl1qM7Pg1B4/MnMTaZv4+YZnD2DKl3fn8RKtfY3hbH0kQiB/5KCs9/GWtiqa7cmUf/pL0uKVpcsxOP1T9rRMQjgxrikjysWJgZHOYAVTItoGeycHlbxWSRqo6oax+P+FqyBFae8u/eQFdbU/rZ46/yMNE7SGpdislI0qP0/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOkRpIlr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gno2PiyE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B47U2mR996607
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 07:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a7F09mTWoxvR+9Fl+ErNNQ2nWjH6IqylwKSw9guSy7U=; b=hOkRpIlr17nrpW2d
	K19RuZNiYMbVvUM1T34hTWhUoANxwyEZov3RmfGa5keRuksLx4HcHuQDVcrod0Xd
	OJEAO9jGCClJIPKSqylxnkDay8WVEVxBRkEiYwKT7zEYoW8wSAWdP6FWeyC1/OvU
	UY4fu0ZlR65c7OhGjJh6hluWwiSSLoIYwOiufdalm0nTQJDV97ILxYxkk2BzTsWi
	ik5Dy1UmUsNQgHEKkcXqkR2ENzFxdLtLhq71haVa/ka8/lFf1HLB7H1XjkKBAI8N
	WHGg8jsL3GgQhABhsCrhAhlqbvTHiGYAPsZW8b8+waBUA3veBTRN4oMW6yN5EKni
	Wavhxg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5yc01dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 07:46:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bf222e5b54dso454869a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 23:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764834383; x=1765439183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7F09mTWoxvR+9Fl+ErNNQ2nWjH6IqylwKSw9guSy7U=;
        b=Gno2PiyEFzV8Dexk4gJwa+gs2KrQXOTYCJk4XBg9B7pKZTKd6ObF0woCdjszVWzY8+
         g40lB363AN500Rgtl6iUPiVcdCFflC8Kj6jaGFkzxZ921s9LpDA09gQBD2BBsvcBVSGK
         CNmnVLcouUucBIXibIn8DKEvFpP5UM/t14k5TteOoPyENEHvA0bCh6ZHu3HZ1ctWsePN
         tcQDfTyHFH6v50dOFOEKsHoCzoBh1W4AwsAij3qVRdFdAMXUeHYH39096KZop/uIXcN+
         MpzdbwJWmNK/UhQXrhupkbfWsZYzgsrUg9TUNdvyxxMPtvQbC8dcuzIu3LmocwWfbhBR
         4tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834383; x=1765439183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7F09mTWoxvR+9Fl+ErNNQ2nWjH6IqylwKSw9guSy7U=;
        b=HcZhVTrMgGmFqXhHUw1xJi2SH7c4k34G6UEjU2qrCKrhf5mm93L9q218zAHkz57L/t
         UdP20djoyBkLPnnQOSzmgE/HH3grpR6rbhOpXx5LFrO8eeRnCTEJh9q320L49QUv1FYb
         vkAnb910OUCkaL+0STVXMegMp/uPq4lKpf/BhT/srJy3F7e5gTjyF9Ng+30RsXVDExZA
         TeeMrnqhdb/OwdOMLstuUnRGtWSt09CtCfyfqoPycZiv2Wy7BFm7hKNM2wuGKrtSMkRB
         zRFf1CCMFf+rGIuBi8KFZszD1mOXR/Y8lgw7dNRc61It74Kmpo4+1YuvJH2n59g3oLGp
         x4Lw==
X-Gm-Message-State: AOJu0YwSUCNgoq5k3bPyfNSuLSAR0pYbbF6DZnmPcR6+PQ2Dgi+Q75A+
	34/qcTozRAAcGdy7P9iUrvG/wrn8UJVHF1BvmLE8mcaZ1jLcf/B88tucFx76zlBJ3ZWnGKEP4Jm
	0IU/yuSYQKORRRsDwxBHAYM3fEX6KexmxxsGtQAK1pLpHUcv/A0N8wYYyT5MpX53wY9no
X-Gm-Gg: ASbGncsNX+Y9cZ9sMPAB+rXH/tyC209zd7HR8qekzc7RKEvSBuo24Xen2W558v3Buax
	h2p1qx6uMKdifCI1TMmWNDHGzpg0B7znnBC7IlLo3JOBnf8dSjgqS64sVlDtJjXOwyzUF4hPNLf
	A7q1PtYDBmaQyiRuRLlk7BeI7Oog3Bvdq+l10y3kmrmmonktmKCbT3P1RFut0PRwjDZlQKFAmAC
	m2axmgr834roJZ2CYb7mAAqUHx+zaNxkbxIfvleSn7qRL//O8pQ2WjTkVE1lS4KtgRqPEFfrUeq
	bFmEyotHQL7LHqk2aA5shL0i2fj/6gndH0F0OCQ86hDnf0+CYoRHTiC78YroCzmxG7uybpwUOi4
	WiKxJ9oMm1D2x/C3h73citZCXvpXgUXVwe9+2olPhDj+ptG65HykPSj6WhHDgUBQj1YTOjmX1Xu
	E=
X-Received: by 2002:a05:6a21:3292:b0:334:91ab:f189 with SMTP id adf61e73a8af0-3640331d03fmr2440168637.22.1764834382747;
        Wed, 03 Dec 2025 23:46:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLXw3U7N5fRCVdaSxUE8GIZXmjfVkoiPFbWI4GM/4q8x/U2tPcFEDwyiRC//+d0LCEEgKRUQ==
X-Received: by 2002:a05:6a21:3292:b0:334:91ab:f189 with SMTP id adf61e73a8af0-3640331d03fmr2440128637.22.1764834382239;
        Wed, 03 Dec 2025 23:46:22 -0800 (PST)
Received: from [10.133.33.164] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fa818sm1198938b3a.48.2025.12.03.23.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 23:46:21 -0800 (PST)
Message-ID: <5095de61-69e8-4ef9-9604-702db46caee5@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 15:46:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: ipq5332: Add CMN PLL node for networking
 hardware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-4-55127ba85613@oss.qualcomm.com>
 <11056c3c-452c-444e-84f2-318f9dec6831@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <11056c3c-452c-444e-84f2-318f9dec6831@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=69313c4f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LfW1Yye3B56vg2I2hCUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: tAOzOXqkoFTAKcnkCvlX27ZKPdI3luF9
X-Proofpoint-GUID: tAOzOXqkoFTAKcnkCvlX27ZKPdI3luF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2MiBTYWx0ZWRfX0XUahec1vL+F
 Zg2dj6bw/BOgLsZs6Fh+DEKUZVlWWs3bNGjsK8Zv6PvVFRbDTHpsmsObRlXLaIo5wVY/oRpOQi2
 2X2dsLEWJkWrxRMdpT0xdU/nD9rjRWNzn2Jyp3dQBwkCR8QlU6X/xj7gl2qyPLmxyD+JPtPZT8b
 GNTOU6AA+tJjA3gQyBGr09g+j8EvYY1V/fNStTreC+W8jEbdjYW8P6dDYTBLmSqIHakK38Z0Rei
 KijoWc1AbMec5N1Da8MNATsUAb/keQ8M4XdLCxuZhbV/JKd/4IWUqYVhDFnuEDJefO7Z0n34ROM
 jSsWFz4/qWIw/S4mU/wQ4FOUeHB8emR1QBo4DuyW90dQ4rWS1NKgDHAkMyJPucHn8DEUbjhQuHe
 3tOpoIp0JX6kXouMfS+CKh11SbtZyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040062



On 12/1/2025 9:52 PM, Konrad Dybcio wrote:
> On 11/28/25 9:40 AM, Luo Jie wrote:
>> Add the CMN PLL node required for networking hardware operation on IPQ5332.
>> The CMN PLL core runs at 6 GHz on this platform, differing from others like
>> IPQ9574.
>>
>> Configure the reference clock path where XO (48 MHz or 96 MHz) routes
>> through the WiFi block's multiplier/divider to provide a stable 48 MHz
>> reference to the CMN PLL.
>> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)--> 48 MHZ to CMN PLL.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		cmn_pll: clock-controller@9b000 {
>> +			compatible = "qcom,ipq5332-cmn-pll";
>> +			reg = <0x0009b000 0x800>;
>> +			clocks = <&ref_48mhz_clk>,
>> +				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
>> +				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
>> +			clock-names = "ref", "ahb", "sys";
> 
> 1 a line, please

OK, Will update, thanks.>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


