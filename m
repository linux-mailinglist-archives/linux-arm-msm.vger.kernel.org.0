Return-Path: <linux-arm-msm+bounces-99776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J3PAFpZw2mdqQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:41:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7031F2C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E8823045006
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FCC2BE655;
	Wed, 25 Mar 2026 03:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLbgCKNs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIUI1m2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77F919E98D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410068; cv=none; b=bpZDN31bSQy9nEXH1wwqTgh2eh+Rb9qMmq6eR1EgkMlnTKs1+81W+POlOr52ggEpZyTwNxMR1oy0uLsL5CPeExRo81/xoHDCvuG3wTjuNDQ52Yw30hPuJguTbutijNkgee1zS3XHPXXcT7m4Z77zd5Ce+ABCy5vJ89RpR9Pq0QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410068; c=relaxed/simple;
	bh=mP1o5Nzm9Gjxg2DoEW9IEmm/ssAILnZZYIYnyv8OzFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fX0S4HDUQ5NsSUZ3SglT4gGQbT3NDQRCs/eSF9JujlZSnycHoR4w5FXrl94cuWzgShYz/1EbuYCEJ4DjGCLzILk53VNuyMnxQrxDNpmo6pTSlckjsKgqxad8f/z4P074igUSDMsIrv0iY8MsxBQw/YZ2VdPtlQuk/NFioyPJiS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLbgCKNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIUI1m2k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCefS989005
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9aazANHaBXt4CN5A5tp2vWEIh7wezA0kRqEWMsyYNk=; b=HLbgCKNsVKRRUux0
	38Z+1TCwfr3GvamCcqjtc/lJiAr8V9h2jGYinLcmcNEcCaAi9743trRuXNfi4B/F
	U4wYGFhnooF6DU9oemeBC/a6ZNbvEGhl2nkVPDreLBF9Xv9AsaRi+p0OKGU9RyL9
	OLxZIqA845xEnV3IEdu0o2t3AyeSsLFuiEoK9dyba92dvyQ+u8D3R5E1S2CpbpSc
	OlNdmViyyly8PY8qXuKHnuyU11+1QbPNgJnpKhgfWVx4aIV/dOyIw6AUu2QisKRw
	TMB3lv4GxI0Ekurkj3Dci8+k99vexMTAXcQ37ULLyzBTo3p2cpYdipxdAwim+F9W
	ndX9mQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m2wvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:41:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdd327d970so321563eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410066; x=1775014866; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9aazANHaBXt4CN5A5tp2vWEIh7wezA0kRqEWMsyYNk=;
        b=YIUI1m2kDuCPXAuwYAP9P0NYPT/fSJkWVIycFqU8I4W/eqNW+TLvH4E/C6tOz8RX8I
         CFQpmbuHqlLF/yJcRUi3+0Lrp2BgUR5saN4Q6rEka+1q1UYip0VFrp43prSnE6/iU06z
         VNwhvPck9xTCfCJ5j273Eq1qCR869MnsyusYEu/xPtzTjQp4nPtDfaOG+/MXu6bDhn8j
         RYifuB3G4bPCa2ozZQ6wQPJz8HoBilbjox/M/IhGUpMSXIgIiPgn3c2GSff9CgpdqQ1q
         DyJHDDTP6aWPSjzMbMxfiNcGXJi61mCNVHQ9EckYyPQ2aZUvanjwFW9tqm/wUpVOCsRk
         bxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410066; x=1775014866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9aazANHaBXt4CN5A5tp2vWEIh7wezA0kRqEWMsyYNk=;
        b=ZUPO9SuBQOmGEc+Vway4N/9eKbCNHarPiKWYmd6i680KuV9YI5M2hIyYdM1TO6aVPf
         5/32GdgZzYcDFHiOCnqRwu1a/vf7o6i/dlQj141yoBGHZzEibMZgnSJJcz6eiisYyTme
         RFk09mPb1MIxuF/s5mTi9gGaNlLVrDMJXcQ1eHfVsDCtgtF8OeUdOcEGEzs9bnLeUFOW
         PCJRHwt7HmfTbA/GY9wvxzdLy/Ft0W5B6Z2ydFsOFnMg4EYO0kEYjgIWPaigSxpUnNV0
         J1YfVY8Lrr0cmSvYyQagmDPGogl3J7uRqKsPNl6MMYNQ4wH1/Tj5yeYlG30yWl5iPRfh
         CgEw==
X-Forwarded-Encrypted: i=1; AJvYcCX5xLTjbz4nuf4k/KTvNxkG/Ml/guOGLlrfNxJgLiYvOYM4lvP2E+9Yyrfeq4MAZO5BTroVESGRqVNKkI6T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy38eqdeqLB8mwvh2qhMqjkGANI4Hcqdqw9tWqDjshl8cdYzyuK
	ezYs+vUFmEBTtCAvu2iZ2Qiu/W1DJJwyv36tfPt871fkZFfyGz7NmgQ6/tNH1P+jBxB99zuOZbQ
	Zl4jvjpMl0GyFTPoW4qFK2zjCMLawzkkXXtR1mxIztV63WIGmajGQAQJ8M2QBQ9/y33TZ
X-Gm-Gg: ATEYQzxOo3gcw9s0jl/c2nS6/bybYn64UQPor/K9vwCYC6ivSKS++LZ1co0d7v7h5Bf
	KiquJqo3bCT/MXyJTdU+mx0qEBKECR+p2NAcEZZ4Ir1w9k2J2J3ZPVxNmbP7bZoCYI0gp3rqIJy
	VEhDu1brXQZYsmc3nb92D0RmWwP0TV1/JDM3NakgZcT5xHXKj0bIPHDuLQnCkAo03W8QW+Mthdr
	zsI3VnfOmCiSjiDPreZDDk5Sr/Ty4Xhvax6ZJbK1esclTCFBFu3eIpAolGWdM0rsxMAcGGY/Gug
	ZPRaEkuey1MT2j+FgeCY9NOjTPIpgFvJtJlWq4xhS4FK+yGEnk1EFcmRb4qX9n31pNigHB5pKCJ
	xTzZG28IU4ys1gOqHpwp/Yo3Qdzxbh2weDQYgfHgcwww+QYdkDCC/UvOh/9xhle1f
X-Received: by 2002:a05:7300:724f:b0:2be:88f2:3c98 with SMTP id 5a478bee46e88-2c15bbc6f6fmr1117003eec.1.1774410065845;
        Tue, 24 Mar 2026 20:41:05 -0700 (PDT)
X-Received: by 2002:a05:7300:724f:b0:2be:88f2:3c98 with SMTP id 5a478bee46e88-2c15bbc6f6fmr1116990eec.1.1774410065256;
        Tue, 24 Mar 2026 20:41:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cde3bsm16982228eec.20.2026.03.24.20.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:41:04 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:40:59 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Introduce sa8255p SoC
Message-ID: <acNZSyygP64Z774H@QCOM-aGQu4IUr3Y>
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
 <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c35952 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TRUxsesqeu6M_UsrYMsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5bI1IF9DVNYUVGPHmq0horpbwUCZnauu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX/CeZPhsMGM/B
 b0If5xaiKvbI5rKLbcxGFaqyBAnzLK6esLN78kumNIa5qUPynQO/2RWamHqr38o1YzaC0RzxO/N
 z4KhVMPmRgZvUaTxJDBxfPWd++nbyEJIPbtTrb3G4fA5qMdofoSs3tKJNtgspNTo2Bj6YfM1fw9
 jZvi972QV4sIBmZKL+3ORfAL6jXf0OpEzAv8oRV5vREMzZEiqVS4MgLcO0Y1n6AdZ6khwzLqCBn
 RuD87iYpZVjDjQHWvnVgtYaNgpeiweRqp2cUKOdzNM2HxZhvWkoU8/MLFxnnZc7U/zHyIABDvTR
 2Ywy0eI4inwyo0a5oHBd/ApQBkN2khbnHzoJqQd9rPpY9tB84F4WTf/W3cX1Mszt14SZ4IR1t/+
 xWy/5Z94aH1p3XVHH8RQWAxN3CA5kkHUwINUsR3fk3FSlZy0073Zdgt+5uSVwuwrEXyZESp0CWa
 COtdxBz5KN4JTySTbMw==
X-Proofpoint-GUID: 5bI1IF9DVNYUVGPHmq0horpbwUCZnauu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250023
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99776-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56C7031F2C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 04, 2026 at 08:28:29PM -0800, Deepti Jaggi wrote:
> From: Nikunj Kela <quic_nkela@quicinc.com>
> 
> Introduce base device tree support for sa8255p Qualcomm's automotive
> infotainment SoC. The base dt file describes core SoC components- CPUs,
> CPU map, ipcc, QUP,  geni UART, interrupt controller, TLMM, reserved
> memory, SMMU, firmware scm, scmi, watchdog, SRAM, PSCI, ufs, pcie, pmu
> nodes and enable booting to shell with ramdisk.
> 
> The Qualcomm automotive sa8255p SoC utilizes firmware to configure
> platform resources such as clocks, interconnects, and TLMM. Device drivers
> request these resources through the SCMI power,reset and performance
> protocols. Assign each device driver a dedicated SCMI channel and Tx/Rx
> doorbells to support parallel resource requests and aggregation in the
> SCMI platform server. Operate the SCMI server stack in an SMP-enabled VM,
> using the Qualcomm SMC/HVC transport driver for communication.
> 
> Group resource operations to improve abstraction and reduce the number of
> SCMI requests. Follow the SCMI-based resource management approach
> demonstrated by Qualcomm at LinaroConnect 2024.[1]
> 
> Limit initial support to basic platform resources, serial console, ufs
> and pcie.Defer enabling USB, and Ethernet to subsequent updates.
> 
> [1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8255p.dtsi | 4861 +++++++++++++++++++++++++++++++++
>  1 file changed, 4861 insertions(+)

Is my understanding correct that the following SoCs are all members of Lemans family?

 - QCS9075/9100 (IQ9)
 - SA8255P
 - SA8775P

If so, does it make sense to apply DTS structure like below?

  lemans.dtsi
    |
    |― lemans-iq9.dtsi
    |    |
    |    |― lemans-evk.dts (qcs9100-evk.dts ideally)
    |    |
    |    |― qcs9100-ride-r3.dts
    |    |
    |    |― qcs9100-ride.dts
    |
    |― lemans-sa8255p.dtsi
    |    |
    |    |― sa8255p-ride.dts
    |
    |― lemans-sa8775p.dtsi
         |
         |― sa8775p-ride-r3.dts
         |
         |― sa8775p-ride.dts


Shawn

