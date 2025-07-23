Return-Path: <linux-arm-msm+bounces-66394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F039EB0FD09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFB1C3B58D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB63622F152;
	Wed, 23 Jul 2025 22:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpAuJ1Gp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93162E36FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753310656; cv=none; b=Y6Kg+ueT/WgouiAITIfCqSYu4smyds1mLzqTEAh7eLiWGxObZagK9tJuomfXs5FqrOeIUyYjbRNpewbd0eddYRHFl087YGrSc6d43QwfaTkT/ZbgFpA0xV8ga+AoSqcuxvsn8bl4sNqLZqMmcKPzNlTOE3OPorU15B+RNVb7NjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753310656; c=relaxed/simple;
	bh=zmsK5kpPaxMffdyHZKMJno3wCYeNPInTtvSgROuzmZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTW024VryAAjVEMXrmnV1fmGKT8BJRNm4Er+e8F004TuBBzSQ0UZMklB7h5f18JW1HCm8+m+DRzYH5L9fzqRvGfs1N/X7wfvbR4rSs8ZJz2Z8UIAAVV7Wi2BP3mh/3+/DDzFXZrQ9RVZZcd1cqvfEvMPL5/cXB1MA/V/ahXOi+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpAuJ1Gp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXH3Y023402
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=84AQR62nTeFa8YjzQigcwqA2
	N7YfGm34XDdirzJG4Ko=; b=fpAuJ1GproCBUYRis08OH/hsw7l+lEtiC15tjw8b
	D+Mx+mLrZLHrVQcb68fmsLB8cK2gikOXiLkE3PmFbdINnJuqImNDvP+i4ZlMvFhj
	/KqZzZHtc3FIdJWWuQha9aqKQfB5O+fOZPXt7aK6LT5UnhHCLtT3HKoh7a1BoIJw
	LBCZK9OZvp5bnD5M/cRCOuhT1CCO57QGGLjZUK35kvCGsLlDpYkAVaxTvaj5j+tx
	KI7tgWorR/RFg5oGWFZZxEXdfDQEkp+VAEv4x3AxlQSmwtMuXfGCJ5LOYOr7IrHt
	AzmDbGGIoq3bu8e1Pjcap00TBjGQ7+Lz5mLF/oaZJw7oLg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na567n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:44:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7070a9d1fd0so3827256d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753310652; x=1753915452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84AQR62nTeFa8YjzQigcwqA2N7YfGm34XDdirzJG4Ko=;
        b=R2lCzvsbm6vtAhHjV6iKC6FGzo1Zo3ZpfDd5ptR1TgO/ckM8oV+eoVe7jM3r/x18/C
         jmWBLmpOcux5cXDhe9Qi3oXe2KuKfsxgmYIsCrWK9WrhWvgAakjbkjAHHR2QBSV9gM91
         8jvs9f+cjB27v+uwtdJY9sN2mRceICqZenPFofLM9c3WQJeGZSknvOT2LJmx3Aiks0v1
         Uzasd6IJfkth1K+VnSygGEApRc/bSd3oCNoDGPigwBm8SzsyN7e9mnApb0XK1nA+AaVp
         N0aBOfhZKvdhfR1kAze0d6Et0E/dVx8nTN7NSRugstC40jQVt9RlFwL4S0N9gg+AflPc
         4ifQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWvKTOShxOLZRa5kWyCw/a2HW1DyMtakpzcjoz5QKJQfGrHsQ46LIrW7WCDte20JtbonwBMKEWAkjtByVO@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvELt4PVczdPmafq1lVbtWRybSHs16vn1b7BNoTV3QQ7Sw6S0
	/6x01uLGKTYVlxRDERKfpgaY1ooXJpwYvMcpPvNLhhzxygt865JIUo721tyUm0Dl+XcpqVZ4rCE
	F6QndgrkZKR8eeESKcauRwcBcSCPBZ27cx2r54pNlfpsG8FpIitqJgbAVT0h5Nfzzc9Fq
X-Gm-Gg: ASbGncvilH8sHVqEF2gbrvhFER/OkqDlZjYPo9b0QXL3UE65W0jSetw5DGRNVrk9UqB
	bqJ1kK3vJpztU+PLpeAt/kielRyzvnpdbEGUJ0hUAtJ9yija5dxrLev6HB+qy6++YvoI9YEJmqh
	mwWJZJBlpyCKINAaXQA1qspr7DFqhYTZSjVXdnhnHc3qsAWonUQBln7lsAkjbv+OxS3pIZbcrFg
	7cEC8eqp2z6UONEPqHLmlC4Qb7UTRHgFbUZap6+sjBK3slwx0E6UKGaeegy/Vc4JUdlySvebvL9
	BHcG0PDO4AVs/r+zCIGuRlYNyi464sFH5+vLXudjFtL2ADB0RBlFhcRAvrFwHJA7LmMP83yFyzs
	lXUVxR/RjSbqK9KG2Z8T8nP+oGB/xxdTSysHVPADywdwqBjvik6Uk
X-Received: by 2002:ad4:574e:0:b0:6fa:c66b:8928 with SMTP id 6a1803df08f44-707004a78c7mr69538746d6.2.1753310652353;
        Wed, 23 Jul 2025 15:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERPIXpYCZpF8ZaV7kckO2jIC8ZV04Td0+dZn4eAXpRrER9MWSYR8+t0Ie7ycHDFa+L8/O3wA==
X-Received: by 2002:ad4:574e:0:b0:6fa:c66b:8928 with SMTP id 6a1803df08f44-707004a78c7mr69538346d6.2.1753310651662;
        Wed, 23 Jul 2025 15:44:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c97d8csm49612e87.178.2025.07.23.15.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:44:10 -0700 (PDT)
Date: Thu, 24 Jul 2025 01:44:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/23] arm64: dts: qcom: sm8450: add sound prefix for wsa2
Message-ID: <g5ymyqh5soso5fj5mzdssz4ovqovecmvja4lvcgnfncnsvep3l@qsip7x3l5err>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-21-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723222737.35561-21-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: 7cyolITRhmu5fAXZa7Svi2B125VEjCse
X-Proofpoint-ORIG-GUID: 7cyolITRhmu5fAXZa7Svi2B125VEjCse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5NSBTYWx0ZWRfX6IJj+ZbljgVQ
 0xSfBT34z5nibSifq/ag0a6BRlT/0ZPW3kruFsnBkKw9Al1YcN3UghDUgU/LeRs/2bw3FZXEGkd
 KbNqjZIEhD7CyYwrWDQLH+0qpUgsJlH/kZD2Piocnw3Yq/uU+TCuVGqjsUn0RZqwBjtEQvwcLUe
 W3qYN59XIl3Rc328qFkhV3ZYdWpV693jTxyVRVI+EqKjDhAtiFrBP2Ts7AtxGN7xYz2DlKJjUay
 XQKoXXkNub7GVaBabUEllpvgPcDJ8GJANwio90BT6Zo+JibvQV0eyrDTFs4ZBXK16vK0c1S5oCq
 09yazRp7IqeGBmsUwHI5wXg6TAnw9fypCHO+f6gplPH3W5rWm/2ZEhMrI2Dh40oFkAtgcLS7Sp/
 RgJby9bQbDJ145Uifs7vpFD6npjXgIUUBq/n+VTDGDNxIk6mV8dNPtr22n3S46U+HjmBbYVs
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=688165bd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lQ6Wg9WPtxumBDeFL7EA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=807
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230195

On Wed, Jul 23, 2025 at 11:27:34PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> WSA and WSA2 are two instances of WSA codec macro, this can lead
> dupicate dapm widgets and mixers resulting in failing to probe
> soundcard if both of these instances are part of the dai-link.
> 
> Correct way to address this is to add sound-name-prefix to WSA2
> instances to avoid such confilcting mixers and dapm widgets.

This looks like a fix for an issue. Please mark it accordinggly and move
towards the start of the series.

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index fa0822c37854..d8fd01997395 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2827,6 +2827,7 @@ wsa2macro: codec@31e0000 {
>  			#clock-cells = <0>;
>  			clock-output-names = "wsa2-mclk";
>  			#sound-dai-cells = <1>;
> +			sound-name-prefix = "WSA2";
>  		};
>  
>  		swr4: soundwire@31f0000 {
> -- 
> 2.50.0
> 

-- 
With best wishes
Dmitry

