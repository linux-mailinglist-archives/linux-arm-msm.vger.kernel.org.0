Return-Path: <linux-arm-msm+bounces-111565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /faqDohTJWoGHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:18:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89F65061B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:18:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DuLaRoS9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XRxlUVVm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111565-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111565-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 621A7300F15C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 11:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EEC3A16AC;
	Sun,  7 Jun 2026 11:18:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7FE38C2B8
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 11:18:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831109; cv=none; b=okwhA1eG9nygAxGHFio4XBVrvt7EttLr1WQI3WuzdNWArMgUQ1hAtwxrcE44NmRIjk6jtWBMDqYD7+WYHzmB+fNHKLYpW1vm5Tzn4mguAOKi3FSctofF0It5/YdjqX3lfqc/QbN2fO385VNx5zc9hpPSmFFg5XwmDsyjnbFQH6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831109; c=relaxed/simple;
	bh=J6wD/DCzsNOn/MApc0FLDSV2u8AloBttXgf4EW9uKXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjbbSMR9Ts7N/k07xHQMt02rYEQbKenugxoJdBSBmQSbqmekVBjUZ8ssf7QgGRXva75qxY7VXd0Xz9Qo2jR4MEeNmczOJ7jaLyX9XXFw8GygGdntPuOvGlgIaGC1RelgcQZL5kJuDtiCfVWjdCPLXFNnzLEdhL+v80zZDLH9z3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuLaRoS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRxlUVVm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B1Ylj435742
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 11:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gBysykimN/2LqYupOxQBdOlc
	nPYWCJPwXQfmX0+Z4dY=; b=DuLaRoS9hSDvVVpLLqpW7DwbmXJNfkSSTakC1Pjf
	fAOtMG2ZWoEA0f9bbumFIyiH9JczqDbSUiACqA3QHZpothxCuS1A01r5MEeDHQ7q
	5uFvfXLVnVyR5R6S0pn2vu2/NrUOOPpfOyIQcbEh9gHPtp0ucEcp41DeKXU1M4cQ
	LUr7BK6Ts+V9KpRMYyy4UPYs7xqZ3q1045eIcHQW387viOeEgxmIqc56MJhYLL2l
	DbkAvaWlxLeldh2va6/sTAGWlKFg4koDhYkFbCd26Oz2IVr9SczaOocwyTVE185P
	RxyyAISm0lG6rrDf2gbDcLl191l+ja4lAB+gjD2HPnL4Fw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrbq41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 11:18:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cf37fe12faso1444129137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780831106; x=1781435906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBysykimN/2LqYupOxQBdOlcnPYWCJPwXQfmX0+Z4dY=;
        b=XRxlUVVmI1YqS3vXAvGe90YJHRkBPLNNuau68I0lmplBunfnqSd/wGCHnLQaJx8J5a
         soUVTkrqP05C4Xl8B0zBSL+8otX00u8ZBvo7VLgcPSERKCRadGaoKfLkJQm1gwqGm7sX
         OUMn2cpraVvbjXViQdNaSzThB/bgguP0B5BBjg96y6BaJmX6Zoca3IEPakrcncfmVpHQ
         pwidmaP7SVjBmjQnXvuT4FvruDEHrKb4P6vmoWNIqvufOcJs6ep8ezlyqOZT6P3yUo8g
         tCpGH6eFw3Hr6zRm6wUOLb9vTULePSOISVPhtwBQUklIKmxRL5Zz8cBDX/IZhgixIRyY
         mbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780831106; x=1781435906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBysykimN/2LqYupOxQBdOlcnPYWCJPwXQfmX0+Z4dY=;
        b=jkNQS9LZIZUwtAU8f/wVrHs93nLJHnliYynrVMPnP4kIdVqZZ05cQl2feAxZl8LoRr
         zYL8uGVXvJt00/ikJpZYBvIiFWB7yIs+/oUv6taPxId6bZBxc8sVxM2HZb5BebGCTVkS
         ZEwvVbA1uv1nz7UsQOnqAnwECgidQjSKxh20nWulHoPuIQ3B5NlnjmgYVvgwSi9FtHP+
         fdBVTo4jZBmcwHQru9QRVhxPKe/P8EF8XVBEpp0m4MC2f4aozyXIfEF4thvC7j76x5dT
         4ycKzdTCLfzwIl2ooybRzPNvQK7A85cXhCnJQzNWTQxxnXCpA0i4/PqQRJb1HyxOG+xM
         Vvbw==
X-Forwarded-Encrypted: i=1; AFNElJ9TvK6O1uTb+qz4JnqAEXn90LPgQyuGYzRiroDNZ/E3f3ullGbfATzcVCinYo4d91IFc4Y9tkgdZiYEsg06@vger.kernel.org
X-Gm-Message-State: AOJu0YybxSyOlQyYG6SHD6rscvcCA7p4aZ33ckHQxgnZSauUxxxcY8DI
	YEHQ7dnUa5J4XChzf8VnCYhrs3dQaURIRUe3jK6qJKnmOCY/5rjGEnKq9Xd7bPmftelcQU2Sufq
	SCMJmgonWMzyDpDYYcrK4f5iq/xB7UPT9Fxt6zzlFnVGbNBOJZQqjSLnvL2Jod5nuobp2
X-Gm-Gg: Acq92OGBy/VnNzjrr9oqZjxxL0a5gMgsz5J7JrPviNqhv2rXmXmsoIBM4mwx9Z1DQn3
	60zw5QOug7OshoZecjL4nqX2zCCFHSl5GzqOfVLPnvpo/uKT+Dns+rp0fV80A8qFRy+BX7tYT+g
	d7U+k1R2nQWtiloWp5Ef3RoGGdEFf28HVZm8HwoPptZgRz/yGoH/XgVcW5K2n/8Aru4jxytjCMp
	VSn+98LD7TeBVsHcpkqQ8fOXSROKY8Sxzo7+JT5EW/AbniVD8nEyctjUpKvYXlwrOk/ZPg7k8L7
	HhEG6T3Q0l/a/nYzzOngbizXj4Y7jsb3b2mhkog89HldaW7XZ3MA2wfQ+DSeE1U9JXKjR6Vb72o
	gukFPndO+P1GaeeG3FUjRdxRSNmsRW/9tu6il1AKftmxLroF83xZMBDPHib5dRpTUrOzBJ/slEl
	d+jsGeP8ddI6cTK36KkXlTu3iRITXpOZ5edjgLgvfehnQBDQ==
X-Received: by 2002:a05:6102:32c8:b0:631:4cda:3e86 with SMTP id ada2fe7eead31-6ff0610ccffmr5411918137.24.1780831106396;
        Sun, 07 Jun 2026 04:18:26 -0700 (PDT)
X-Received: by 2002:a05:6102:32c8:b0:631:4cda:3e86 with SMTP id ada2fe7eead31-6ff0610ccffmr5411905137.24.1780831105936;
        Sun, 07 Jun 2026 04:18:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990486sm2971499e87.68.2026.06.07.04.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:18:23 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
Message-ID: <foutgm5vhldz3verik2mje22nrnu3r3z72mxah5wmmuoro4l2q@ud3nbdgctpjl>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDExMCBTYWx0ZWRfXzr3rIChFDvVF
 HS3KzXwrk0GCFOC8beS084iky/sAaWx9o5TDknzPLvhfoasA0fWWO1SFuoSintD8m+dVgEWF3KC
 hvaofICAY5fW39V8o7l6wv83VKOUZX+jVsAYsD0x1lN6v6+rvLwCT60yVS53lu/VEiQ6+l7d7c/
 cBdOr2bRwbpkAiM2sOYr+cRHOUOR8Mmx05o+EpWcuFBCbDgYUW4ZmTd2/Pp3MQ409j53zYqX7nS
 J1Myr8sJmxCvA27KHA9TiV+shntcWhuxUP4avJ+Xm1fLvvM5QFmMlqCA+gBK4SHn28HY8zdmaSu
 IrX4XIoHyTGq9YrZfOHWiAa6w/jUdgDFCyVXOAjsdao8MiXP/FY8/w8Tp9riKUs237eRxh7jNrB
 UvHlC0czctUyoZOrf1d9DtbiuM2I9ZONipeTvMFfdBdu7ID4WNisXl4MUTUJuJBTy9XBdjlpiPy
 aTyc2A0go/iwp0GIFeQ==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a255383 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3S_noIeE2reKQbcw9xYA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: _BkUYcEs3HZYTrsnHfU3QpE2OZ-Jqs6E
X-Proofpoint-ORIG-GUID: _BkUYcEs3HZYTrsnHfU3QpE2OZ-Jqs6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111565-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C89F65061B

On Fri, Jun 05, 2026 at 04:56:31PM +0530, Imran Shaik wrote:
> Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
> on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
> across variants based on Audio subsystem enablement as follows:
> 
> CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
> CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem

What does it mean? How does CQS play audio? What does 'audio on APPS'
mean?

> IQS: no clocks/resets needed; no SoundWire codecs
> 
> To handle these requirements, variant-specific compatibles are introduced.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 62 ++++++++++++++++++++++
>  .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++
>  2 files changed, 111 insertions(+)
> 

-- 
With best wishes
Dmitry

