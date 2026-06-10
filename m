Return-Path: <linux-arm-msm+bounces-112464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y6R0FJJgKWrlVwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:03:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F22666698C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:03:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=G1bJQ2Lq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="eWHkNcB/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112464-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112464-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B34503046704
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65493F7AAD;
	Wed, 10 Jun 2026 12:58:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CC4403AF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:58:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096306; cv=none; b=HPU01JsV0MKt1Ii516OYmNXXmGErogvyx7MQ5qL8YA6tRDxEJX4qIcgqCTJo65s7jcegVN7heFd4iSmM3kQiNwcUffrQHN6V3eD1MYJTd1+zeTV+KbRny5oyK/T69G2rHZCYXqYmJm/E5D/k8rPhGPdL8XzHnOqQC3YVMelWrR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096306; c=relaxed/simple;
	bh=BQcj21xyV8tXkcWtKqOgke5puur6EQll+RwlpA0DWuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHz0+lAAzQCXEMaBNdfFNhfe9cUywCGrlTYrjD5IFzmQR0AH57W3ih6MopeQMs6+nF86weIsMbHml49OxpwPQYqLF8vABo5p/yM3LxVWtU8pJpdJBm9gEvUaf3olP99I6YNCTECvga1JyZpxt/htNwrQw2UcmFGVFcQc7FZPFMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1bJQ2Lq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWHkNcB/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBsSv3763976
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+VeEg9PrVmbu7EYdfim8Ahk5oC4j4do75SLwlniDx0=; b=G1bJQ2Lq1jHSs5Xf
	v1wmvcV3mS9FercPz/W0ppGk5HQLWVfpUuPRCgBJEajolDnCNFIWX+WErCc7vo1e
	9RFux9bjtrJKWanG4AFImSXVh3erUrhLG4xbTbX4hcNjAXM8ADCcJ4M13cLuowEN
	NhGyfehLcu1ntefdrgZ3AJqbObjwoPeKS1NvIs4aeMoPo9aYzMrnqkJJQX/zGa6j
	+olwv8SEmLT6yZ59V+96uh53IKbif4h014uFzPY0S50GaW9mJMcvIq8jGUcHaQCS
	9o00jmMRIMo7TvnMB+xi3jNGuMoXgAVdTmQtkdCM75ORiIl+o8PML4lX+c7WLhVo
	7HNXcg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwneth6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:58:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178ac43d27so18605361cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096304; x=1781701104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+VeEg9PrVmbu7EYdfim8Ahk5oC4j4do75SLwlniDx0=;
        b=eWHkNcB/KjtGFV4CisfwV5Y0TtpQeMMu5n75mCwV1UFzakFePWWhkLy3jm/ovfAEke
         LqBgZ7jfaqgEy6icKOl5g1fkM7LNPOO6obxpeNNT1AgRTFboMpN6hEehYAH93uLNKlAD
         6HijytmFCcWnNGQ1ZQkIHaDJr+DCEJkmfMEBdYPnuwrrEN44if2jkTn/dBztzIlDAAOQ
         xE6mFSQ6lG1abYpubi1xuGQaVQ2YHkqV1LFGt12pQUWKv0y0seTO7ip0Eg6C7LlO4esp
         Hy72TfYpI/awr3tZJRvVrpKjkV86QkfJ3apch3eFVGjyVpZ/RI24RoLO5I/PIO/UZ444
         Xouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096304; x=1781701104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+VeEg9PrVmbu7EYdfim8Ahk5oC4j4do75SLwlniDx0=;
        b=rwXYRKCqJ75SpIjiQQIMqlQobCebnc1HoWMAVk7shxpfbUvJihjXjN4txs5FkR7VT6
         ku0unjyUu89zY/4CoSptQlW8zEDmNfRpID4V/b3e5c3V+vNslO9b5tH0vsSwGeOrJX9r
         3yXmlw/t2yr5HEGHEy8UNMqftXxTuQwlKmawuuUVeNNGJT9d2JRhmU8uIZifJKaP1pgb
         EXnGsKG42eZZCNMfEAvHcv3c++8wPnlIP9baxujvRJOI/NPShQUgDhI/LhPSp8fm10LQ
         /Dy3XXNp7JIvN52scHR63XUqq9yRX/6gYOyFSkzPICJ6+Uq6951dagb2N3g17omR7Rnn
         yvkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VS+jMYFkd1e+DPqDvtNCB6BZid4iW3YxFcTBxUTX5e0dd/TOmc92vdtnuOFD6EuRdaUc45zCMS2Zw67d7@vger.kernel.org
X-Gm-Message-State: AOJu0YweSNc1f9jShjGPN+ooRsx40l7lPQbH8Guw2qv2Ywx84IqAzD+W
	adQw4UVaKAAx6CA/gq8/TyGb4Jo+7S5ZodnwljiQfjFS7clqAKVyv03qsO3fupRbQCRIJRlUQzf
	Er1/q93RZJz1TnDSHF6ZgeudyVUVM11BDoTSHF7qO65RY5DTMdVZA3jZodEOUTL9S/iiF
X-Gm-Gg: Acq92OG04wmKpKy3sb5waGQbgwhTT/QDOGmzIoxUb6/m/dptA8p7ADXarLzCfCzQ2W0
	nG1bzvguiAHdwymMbRBvtOULAEjve3skq1fqq2vnlC7mRj+0qT/cmDbUEA6Z/vZvhQae0gn2vXc
	/iCkfpNq33ebXsXFUnbsAmA51v1hbBeNGcOKTaiAcir/ecpTvaQmHuiUx25se7IDRNZXEg7CPVe
	fLzFcpOS814EHgzIOTq0SBLXqf94FwZ6TA1/tE/QM6nmD3pnWRtpudyV6exBuiluJb/esh8V0Uq
	1dN4CFKAgqX1bGa4Z79BAlzauF//GLq0zwreCs3nekTBS6Krjtbr1fVbkALaXLwxsN+SC/jU+nT
	7hWaCbSRcVNA64u9fQsG/sSbFKmxtVytxSNFWIZu7QgpdsBrtUORBoi6r
X-Received: by 2002:ac8:7dcd:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ca4855a0mr69196071cf.8.1781096303908;
        Wed, 10 Jun 2026 05:58:23 -0700 (PDT)
X-Received: by 2002:ac8:7dcd:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ca4855a0mr69195761cf.8.1781096303478;
        Wed, 10 Jun 2026 05:58:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm9878704a12.21.2026.06.10.05.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:58:21 -0700 (PDT)
Message-ID: <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:58:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607113658.25117-4-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KfvSHHoJEhWERe-IDgEyE8pjvw44FAw1
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a295f70 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=gE6viRo3Ne1LwXgZ6bcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: KfvSHHoJEhWERe-IDgEyE8pjvw44FAw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfXxDWATBRzVn+A
 JTuqsgLZp8X6gfwqBLZmdjAXt1zp5yiQ89+SdaK3Mgm9kRfXLly0EFnGOI/BqO0NxoPwp5VzvAM
 YfXct5MrAqcjj8xt2kWIjg6ZycBYGpMMX4qe9eJO+CeCvEs0stgTB4mBP8+TsOzcuPUEg6i0EzS
 h0uhXe9b6ln3z4DUvHUW2D0tFP2uGtphsmZcPW0Hb/XFblgsPmEE2v6jaBJFqMlzJnsiyPSN8t3
 YBmOyX0FlBfNrsOk5V7jJdV8lw3yNTDdjpgH+99DDzhVjFjRt/LuPrgJH3MB0aggWS9Ett0eGt2
 gzKAgQ/3G7pHqxDLYf51ckiKqeKNHJ9DxmZnsdP5wzW7/mIVRs/UUIiJvzh6wE7uO+6zR05Pn7C
 fM7L5kS8NKSGvuXJdv3Azj1NR57KS8c7dJ1KUQPvauqu4LGJh3EohK2M4Xln8G9tRoPkb/kyG2u
 NLPyoAcHJaKVsH0rSDw==
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112464-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:blfizzyy@gmail.com,m:andersson@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F22666698C3

On 6/7/26 1:36 PM, Ajit Singh wrote:
> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> QCS6490 SoC.
> 
> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> support along with regulators.
> 
> The UFS ICE block is kept disabled because enabling it currently causes
> an SError during qcom_ice_create() on this board. UFS works without ICE.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

[...]

> +		vreg_l12c_1p8: ldo12 {
> +			regulator-name = "vreg_l12c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +
> +			/*
> +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
> +			 * VDDIO and the external 32.768 kHz oscillator.
> +			 */

Sorry for the long review timelines on the previous patch, many of us
were out for conferences..

Is the oscillator used for that WLAN module? Would you ideally like to
be able to turn it on/off?

Perhaps you could get that with a simple pwrseq driver (+Bartosz)

Konrad

