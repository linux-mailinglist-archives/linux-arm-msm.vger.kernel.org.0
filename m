Return-Path: <linux-arm-msm+bounces-112456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nPC3LFhgKWrVVwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:02:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 724B0669895
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:02:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LZpP40qY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MmFvxP0w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112456-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112456-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A079931740FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663E7408628;
	Wed, 10 Jun 2026 12:49:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8903408606
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:49:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095780; cv=none; b=YSzBmJn7DExniudZhjvSySpeRvD8pYPHyTprWqiVVZQ5UVZewSHZYp+sRjBUmNqK0kfWUl/tk//SCXdVxYezbMH65rBQINkKXjqaj3jYkYZZ1EHnl701mm9vWV4mhhtbwTez3Cc2Bs8MKXUfoqjI/vqtlwFTRYh7mUAMu3L6Ff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095780; c=relaxed/simple;
	bh=a+AEROdaFgH/T1gt+1uIDSNRnw90/byoO8KO4nxU/cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPBf2Oyi4nd+T1rx0F6N25rfKNqtjvZGDnIxvIRq2VPi4caPpASeMeE1AaPQ3JwvbKWdEbLlrpfSkl7IiBIpfB7sP1bfZg4qJhML2JHbBuajbZx4jt5susuhfJoYbzUobuv98rUVTnSFQJ+ZhRd/ZmswfzQKCEe1m0QD03A8nNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZpP40qY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmFvxP0w; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBo8b3763597
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1DsMjLPGi4p99htuKXTxVfQyL/yIaoNbHde0W9TmnY=; b=LZpP40qYBLukOTD5
	1zkmcTtFp8On8607NukZ9ayEIAeXdJz45vf3ZfrPxAa/ccKtSwEocqCAULHySr5P
	TeJgzQxTuok3Xi2+wiC/lIFYa4Y3AaX4tNNhJirPcDpvDPKYdCJmbuGWWk3e3pg+
	0zM/s/YzX5F1TkpX3zZTc5cclB0U5mPsNd8yj5WKxNX86uc4ZVreRzKC/iWJDMZU
	2qfm2crJ6rvGPLe4DSFhWmD08Os52+PSW+skVZaUzo+O9KET4sQfwIyAwMYeV9LI
	/PqG1hZMOM0+PcVN0QP57MeKorBRMijHI4evP26Mop/bgn8eLIWi1JeDU1hQZ4gs
	kx44mg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnetg6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:49:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175bf22b2bso12587841cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781095776; x=1781700576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D1DsMjLPGi4p99htuKXTxVfQyL/yIaoNbHde0W9TmnY=;
        b=MmFvxP0wx92AYKEjCWHurkpPbO0Cy03BRUunafSQYHoTzU8VSTFkUkoFfNAyhNqLam
         VedBRzf8/Wdl+zqFc78JU6d+/bU7k/nLNzhvStFQghoDuY8AlVAcOEQqQ/R/4TpHX4kp
         Vsk6KrrNQy5MezHeE5LYbGCuaCo5L5SrE5hGnIB6Kmr2qyeQrcjef+Vp2eDRo2uEUIdJ
         Ef1N3GTocUFPGlBUiC+AkC38rvVeQSixTYU3Do+PKBfYvxAvs1W1XCrnR/GxBv6ZHHZA
         6ymJvZvATkHL4yhTZSQUN1wbLghNm3TRJAVhoK+lOmTzBfojpgctt6/dBSAjuYrfXuo4
         Cf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781095776; x=1781700576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1DsMjLPGi4p99htuKXTxVfQyL/yIaoNbHde0W9TmnY=;
        b=AS5SDU3TRagbWEK5/EeNLtSKdo+WhG5et4pGWDTG0KXz4T/O4t/vXiaNgFSgQCxXqx
         S7AMxooSFpU4qEjX3HAPh7XngGwul6P16a/jTJWaUYXh8VKVBLwqWpS0ol2LpORFpsbQ
         zHkCOawRXPwdnS09+HuYoaeAEoKtzJ/BcqlPKOml1KZS8c/K68BTNH0ylH2rrNm9YU4L
         3bcPWVSuWOwI81nzVFG8pL9HHDHVyoEh/bqTjtEwDkfLE0eG/11pSXzK4Tgy4ybWv7WJ
         L/YJfbsy+s5d4aHs6MskGW5Tj/UPlgUD2ZNNLz0FgDKao7VjXpFlHkB5te1SAUnBVvEt
         U8nQ==
X-Gm-Message-State: AOJu0Yw8VZSOVZtGlngRo1eh6RlMbJDTs52VFjxwP+tfOHOGHJ4RCLHr
	TVqfJpfiGrrAD1JO4inv7AYSoUotsP7SQn5kifj0k/IAw+nOeZ6fs4T8ZQmUZ8J8ZRhIZw+hkLW
	ZOQHcUMkm1tO8q6Ieewf6mbgl4EAHcw79vFB+bupH8aecsEQbVOAsKej33gR4qlROYCmm
X-Gm-Gg: Acq92OGVs7RzrFDU2Fr9T9+qTyaHmeOOiXCIYSiLOh0VI6h94IfCwtlz747VyB9zwGI
	mbUAt92GT3HffMhMxCwOJ2nNcUu/ax3mk88jL6lBwW3OH0nQCmLivpeIavloQyJFG4zpC7WmVXb
	QAu2E2NOo/m3JYdA82tOzSsWDivjk4zPpElUfLcgcBofPBTKVEgcdVa/3lyR7HfAk9Nfq5njbg9
	VKUAiAiw0guOpg6T1VNHpudLuYlX0w7fSM13dwZBReY2t8X4qZzkQ990Ccdb8cSdW0kdN/iYEh2
	uikTP9XoBlpO8P/kv8BASCTnGQyGlidbL3y62b7ozZCBuFSs9izFSjVq9T7z0aiAbvS5J8+x4kd
	5pmjrsufWKnTQyZ3b6PZ71GjWYFPfDVLn4izYGUSCTI05nYhDYx8dtOge
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr199147811cf.6.1781095776023;
        Wed, 10 Jun 2026 05:49:36 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr199147631cf.6.1781095775607;
        Wed, 10 Jun 2026 05:49:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d86f75sm1183745666b.21.2026.06.10.05.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:49:34 -0700 (PDT)
Message-ID: <b05e860e-ace5-4399-bbd9-493f7bbfe74d@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:49:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix up QUSB2 PHY description for MSM8996/SM61[12]5
To: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PjFnMg0hOTpQjDDcCFE7Zj9SQ6fiqB6l
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a295d61 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HQjsNgoee9ZgyPM3yRUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: PjFnMg0hOTpQjDDcCFE7Zj9SQ6fiqB6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfXzsZvTO2gwu4g
 e8Ms9apCMvXShcSR2Thbz57qZUxHgXzWRedfXShjamlC75+PH6eE89g2nkfoeNMmt5xdwbIRG58
 ucqO+bNVon8IcchbxwnlaVDNoGTllYFlZw+coLzJARaX/iVqNxS9YsDJTuoccY/oHPSLIUQ6W8q
 nhKzpk70HWMHUCnDVECoZzBeHhaoNZtUn9NFibTAbUtYQCM0dwFOp6mcvN+MbBlaqqdUpZ6WcFc
 us0unnAG7x/GqvIfmvvXFcToqVFbOj0p98bCK9VEnKjJfRwlYvbfLsqFfKt3x+nQyyLDNfpopRI
 oGYkl9ti/Y8pxxUjkB3giR9Q5XxLLySASD9PxCzbU+FyYhU7k5SuR+bbF92ySimSRVXhQCGU2uo
 xe2VFacE2G7y1UOjocZN+1oadOQxzCyVCXDLm/mrd/aCZkTWyPzB9qbRDAeZhZ8NTiDp1Oy0uOV
 sn6pq0QkVR5WJ7BhG1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100123
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
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	TAGGED_FROM(0.00)[bounces-112456-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RSPAMD_EMAILBL_FAIL(0.00)[konrad.dybcio@oss.qualcomm.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 724B0669895

On 6/10/26 2:04 PM, Konrad Dybcio wrote:
> The MSM8996 QUSB2PHY was not being guaranteed a power source.
> The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
> wasn't. This series tackles that, freeing us of some dt checker
> errors about vdd-supply not found on MSM8996 boards.
> 
> Compile-tested only, but docs confirm my findings..
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (4):
>       dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996
>       phy: qcom-qusb2: Fix SM6115 init sequence
>       arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
>       arm64: dts: qcom: sm6125: Fix QUSB2 compatible
> 
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 10 +++++++
>  arch/arm64/boot/dts/qcom/sm6125.dtsi               |  3 ++-
>  drivers/phy/qualcomm/phy-qcom-qusb2.c              |  4 +--
>  4 files changed, 43 insertions(+), 5 deletions(-)
> ---

Note that msm8996pro may need even more looking into, but that's a
story for another day

Konrad

