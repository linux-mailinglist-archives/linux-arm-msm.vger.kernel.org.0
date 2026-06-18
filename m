Return-Path: <linux-arm-msm+bounces-113776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lDltOaruM2qYJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:12:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1156A05DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:12:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L45ruMnf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Os5cPV6P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113776-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113776-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22A613073A2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6CA3F825F;
	Thu, 18 Jun 2026 13:05:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D413F65EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:05:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787906; cv=none; b=n17/ztn3U8GfZGfpi08fN5rUWUy4S0govXCg+PTjb2DRHfiG8lV6N4AMqr3NhkcBmvXCL5sBW9UI+s9vDp55XSU5ssbUhW01fK1JXGW1FT/l1SVOqxkw731MH4EeXJ/iHsOdAiMXzfavQrxyy/ZitKv4s+ZZF6J89Wqy+luJ/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787906; c=relaxed/simple;
	bh=iJFpoj0Y+KkhOxJkO9jtgeUe8Nz64iXqGZjDvXZnyJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgdHHBZ1/hnxF2NJPzUoge1CiSUYPdoMlg2Gb4FIPEuW+HBDNMZgc8FuYP/XEiclW4YfKZbtCCz8u5TBsBoEL3QCowzOzehu0Wi68TpDuxz1qBkRCgaKtz9IxIBZwxsZQUPWadluiAboJuUHws4FSn+DQDELN3YeKZJcu6oYf8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L45ruMnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Os5cPV6P; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICrnxZ1199618
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdpWPnfspT0O4IPRrN2sCrHLTuOAQdpa0+3S2ykbaYU=; b=L45ruMnfSUOYwG3/
	WLCojx3MdHdc9oEGKewXflXk0OQM/XLe+iQRLiQDvF80xn7b6eSUx6chpBMCuqar
	wlR2bPrVrEZT0EQFBgLiL21bN7Rx7Buuy8V2QKp74zc2U84PETEwY6CbFyCaVDJq
	x5T4HMk2HInVVSp+/9O4966VIup78INEziGHIQPpAMwrl3RlFB/VQWeptpzViFSi
	fN1m2bsript97o8HTU1hEaeej1ebxDwPZGMMpWGKMeg8iYSO5S24ytx8oTt8TJSZ
	lX/JxKF3+MxPHPgeIkFZGPI+MUb0XiEq9V4AMqumJliRieyWMzlsD2CBX7PfPR8T
	G8gcWQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt54a3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:05:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8dc31c51e92so2595286d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787904; x=1782392704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdpWPnfspT0O4IPRrN2sCrHLTuOAQdpa0+3S2ykbaYU=;
        b=Os5cPV6P9KKADMWgih/gwCU/2yspj4T11Ksxhrn87DDJzapp4CrdYSPo65DzAjaOg4
         7mOImf+qD9O6rmIhmzXm5zrlD39EN+s0DVkJT5392J3GuEy/1vsX2U0m5fpEU68pf8VB
         2lMHSvJLfECelZJRkmTGUg2Z9XEYDDsIDmQZa0hMqK8fYtDX16VdmqZyrbjBFE76hYX5
         VmLMKoeU/xvCKfOr5o3vQVWCLS3t4MltI09sHet7dAsJvn9v2n/JLCr5mduAQ9NTvs+w
         jVw+Pe6N+K86LhXIE++hPVI7iGh/V37mX0PpndU61+pKu7o60Q06dXEGwNgiD+6MELnc
         xuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787904; x=1782392704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdpWPnfspT0O4IPRrN2sCrHLTuOAQdpa0+3S2ykbaYU=;
        b=EuCjvnfwZpXtHipyHdWX8WbNzqC151Bobkncj4hFtCCjPQnjsDIQjZc8IwqUHrZtaW
         6EQm5PqObLiuutav4q4KRQiQYMhlW+J1eEktKy7WlS3Va8z7f0jGqbWPUI5mIwvgEcB8
         Tz/njk0lA0LeMAOlNwbtj/iVSSe/w9Dl3638Q3PNAEhq3R5Rz+eUDiKu34fFbpSXRr6i
         PdOufCSy906HQkw4Bk9FpldJUbIE44eEbHiG5NnImYm2z0jK4DpvGNYsCRkrAVSKFJwu
         +Yu6VsQMFxs86prDjSY9nJtkk6unZAop/rH+0Y4fYt2Nel/GfyCYbyMGmSuFh8SJ71l0
         X3hA==
X-Gm-Message-State: AOJu0YzDbv8aHoolcx9I7yslm48fIjmSrH8WDY0y1yppBkkGK1tqoo+z
	P1jE1+4fMnNXhZylfheh0uK9co8qN2q8x2F/JxOAflbSenGJ9ZhF6+2MvO9v6/clLKvZRSKMrpZ
	c/xxBjDu9mQkg2ymMWPbk7fH802qsRZM7i5I7dON9FBl9tV5aHXGppkKyy5VwbKv/EzOI
X-Gm-Gg: AfdE7clTCmxqQiSEYRFrGo6loQbXoyDu/N1Jl9Io8dwhOFbgnv20LIH+Y7LafJqKnkR
	y9RI3p5wqVLVoW8Yi6JZBNDpD7yV0/sqif+Xw+vIia0dGzrbjQ710MR6sNiZps+zYJvVNe+esUw
	wNzQtgpvV+hedNSQHIe49693vJzloq08HtDZjZ3U3MLKlAZECLhvdac+mqIwOJm5K/mhhL6eW4L
	2pTfHEwGORW713I9TKZaMg0l/vV1eCqmVgV4N1ExWrQGTIkr9GKT+vqELgE2+j5NfWjSoTnXlzn
	nXiO1aqz28mMoLQZmCNUAL/y/rpeX5UjdFdlLtCHFVNmHE2K2n8lbCqRWS/KSFv2syGlyn/X8wf
	So+C5JmgC7QV7uVIOBL40NL8JH5kbUSE73SM=
X-Received: by 2002:a05:620a:d95:b0:915:769d:56e with SMTP id af79cd13be357-91f27bdf21amr330333885a.1.1781787903796;
        Thu, 18 Jun 2026 06:05:03 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:915:769d:56e with SMTP id af79cd13be357-91f27bdf21amr330324285a.1.1781787902760;
        Thu, 18 Jun 2026 06:05:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6954c2a4450sm2231829a12.16.2026.06.18.06.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:05:01 -0700 (PDT)
Message-ID: <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:04:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AYVfw0DNZ5OnUeTIk4f08GxRXiYG2bev
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX6+UjYuwhpstr
 au4v70CMcQl8KCiha2Lsgbh4d52+eqnKrmnYFvvTcZdhIJ8K1CnS0EeDLfuTx+vnYvrrTT/geyX
 LReTBGz4xippE0KY/idPba3xcJdP8M8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfXzfgM9sxYNLo4
 uFQt71EhFGvZmzLubkQ0FA7DXhyrXIUkyLpqVCtEs9fPJNOTo4kE6frnc5RT4SY/K62NBByaOuK
 YyHXwYn+ul8afV3crzz/i0VVB7emBu9wMV8tIy5nw8DnKI5BsAQzD2X3tN+gE1V82GVlJlOK1Am
 UT8+lsx+7ipfCn3enoKCal0q8QldZlSOe0BY8jlAbYuWl2QtXdQCMvnDh1JE+azc0EMJDkHCbtc
 Df7qYT0nezXCIhIBGZcvaV7C4txGLYxlz4f6JN+ojl6dWm8PCebZ+jeTDnqZRPKBwldHE+tUIVO
 tJsmmgCszJMp+hYRag8zdT4vVPCyPLLmKuYNlm7q3BuTWEHKNx95W2bHbbJoKMTxxzJygBzHWRS
 e1XezAISuqpFAzSqvyMUjGel+hDaOX23TceHhWV+IN71W9Jji6GJaHIsz2zZSnGaaNyQ802T1ym
 AoN1reji1p4O8ZyeT0w==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a33ed01 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QRdWpJMrku1fmPn5X40A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: AYVfw0DNZ5OnUeTIk4f08GxRXiYG2bev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113776-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B1156A05DB

On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			operating-points-v2 = <&ice_opp_table>;
> +
> +			ice_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-75000000 {
> +					opp-hz = /bits/ 64 <75000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-201600000 {
> +					opp-hz = /bits/ 64 <201600000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};

Since 75 MHz and 201.6 Mhz require the same power level, is the former
OPP any useful?

Konrad

