Return-Path: <linux-arm-msm+bounces-81707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7DAC59EE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 21:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B56AC4E77F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 20:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320F9314D01;
	Thu, 13 Nov 2025 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0l1U0QR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2jgeUOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072C30F7F1
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763064882; cv=none; b=h8wSKjwJNvu790Bsz/em1734XmG2da8AIdjJMObZvEbkjvFVrBPNW3quEBIWoUYOBMyofHJEZg9Cu/SKODFFGExZjOlZF2J5dsDOLBvi4p5QqvkZC6IZa6PSyiPzuzGorZMW/bMPYt/cC1/tkjI4Lr9pZmzt2d0dEUBHMywTjxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763064882; c=relaxed/simple;
	bh=AI/sQdV27pRuG1UG93jWy8O0cfI7jlAIBk7rWDkB574=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=in86c8Nffvjj/cS1Ww/sdnBC7pdXgiyaFpNw5i7G48UbxvqLGmkh9NH4nVPnwfZB3RNwcEDRlarAFNeW3ka32nNuU5EKIEsP4G8jv+hMlO3tzw6SH+N+o3p32w46rNi2IHG2VkiLUXy4Osy9z9xTw8mylNpt6fBftc/fDhMCPsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0l1U0QR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2jgeUOu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADH2R7g1008129
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PN5o3JxT68gD62VcfZEL3Ebk
	8On0PDZMV5SQeeSv2nc=; b=Z0l1U0QRe+5Z3laKQk1X/sUI81ErD6j4oCHnvbat
	E3mmXqEajKCbno1nfP7Eek/UB98l/bE+64k1CtCWqgXRNeVpmbvWqzZ9Pr1zj2AV
	2CHps/Q+AJmhZLjNSvj6IIM83Uq2Qm8Hfnc2clhwTRyBeSCMitcukgdCiyxGPaMR
	YQjeTePPiHkgQj0y5+iSm0+qr63Sym6mOjeIJJ414YjlSTiF9NetQYUSF/FJlnhS
	b5ONlBoCNYi/Sn7hwbsiwaQQ2Ms1blJs3/nJ88qV2MM7tP8MDIKcJh2gjTpXG/2t
	cudmqU59lKmNFi2JTzeEZ4+qAib7ekQVUT7r7n75lB7OLQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adkcnrk38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:14:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804b991a54so53376246d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763064877; x=1763669677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PN5o3JxT68gD62VcfZEL3Ebk8On0PDZMV5SQeeSv2nc=;
        b=S2jgeUOuVxAol1EHKO6OSYgST0siriSlRxuI8bb+QeTWMGAaUySq3bZ1CTum30QcNn
         lUjSg5b9Liyoa4roizOhtDpby9juJ1+0wpLcivPyykwUecKxi7BsMlNxhQTOwC5Fq6/Y
         kMZfG87XnlzBFg3L5u+5aL6DS1wiyC+k6P4P0BwWfQgY7eazrouJnSrEm9bKIJ+EPvjf
         hafP7B97dZ2h17CFlNMs3QutfBEvoXZJ+M7GE2pKsph8yST8mvkbFjOW+9SWVNIA8JLO
         IEfZMuDF2QFTYQUY0ZbnklFtErR+4D0fpOKcAw+6vt+VZrFCbYhjBw9BPZno3Y+2tV9T
         ubhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064877; x=1763669677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN5o3JxT68gD62VcfZEL3Ebk8On0PDZMV5SQeeSv2nc=;
        b=oyzHPkGN49r6TPZg+JYVg73go+W9Ia14cwCUi148EjS62ofHF4/J1rfCe+8jqy0QON
         nKLhV29Crk029ngPwWthSirZVTqWg5EIp7pXWNVxdtWqOKuzIi5hsqopNssG/vIhp4oY
         4GluM7hDL0dKYkINnXGYO16ebfUHrTgye6H6aKnC6G3S2DM2tizDIc4sApAjGKNUPMAl
         +n+VbLVaWZNQbaN+ycVTf1xV7ueom6oaXYukR9QjYYFaFAF5IHFDeTE2U2nVkHo50JFJ
         Mmdr/j8lZP/28PoWYz27dfJ6v+E5399PdDxghu5Xtf9fzF4Zfb+tBdOjKLymZLU5jNk2
         t7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrlFHYx4rfVTSjadaJ4A0eO+WjoDeZPXHuJ5uk8fcvR7LrIgY2pB+3IimYVHNXQgL3x+wIRlrJB0WZ4Xib@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4WobkFEX2/NQrr/hO0xQstsniIeMCsU+fip8z5hTK7rhut2M1
	pRFhIeV5N/YcWm/+M0BxxKGYPOro6iaPlygW4ITO+elTcnFdKyVU2YXYW0hEfJneNtwvzBhc6Wk
	C2OH6UeITdv43knAGAZoACKoQ06KxXE3ugKysWhTiu6mTQVXm8LUU6Kj/UQjNd8f0OcWf
X-Gm-Gg: ASbGncv/ApQcKHUmOEEQz1tC3G3Z6xRtXnguiyNjcGVGx9BK2WBOFACBTWTymIXXL0j
	m0C7ZKYxl1vtnCsue/mrUYPJbSjequU1LYiNQy0pXZFVw1jAU9azFZkvxul9UFNyuNHaCDGMt4l
	53Kj9FyTBZLruJFfUFu4BvmiaYHXKKuAgHoYXauj4GS3D1w+BqHWS42pWmhfQT0XIEXuWCdzoQR
	glT6rn8OsjAyJNH6flx+3weipwNs973nqnX5+SYZe7JQ/4EGEW8DL8jEFhPqD512yRkedDsU9gc
	8/Q3Ea3yFOxY91Ra0ihngSSpxXqcN6Af9E5Qu2zYrnUwy1h/ns+xey+qSRwD4YeSXOHtHKb5PCl
	WVgJ3Y5oBNUu5rXK+Xi1AllT7XtO65RAaic1HmL35SNgFiOMrUT6eZwjzGZW+aa4B4w66N/Km1a
	AKbwYH0mXn6JYX
X-Received: by 2002:a05:6214:628:b0:880:4dd6:20c4 with SMTP id 6a1803df08f44-882925b634emr6722156d6.25.1763064877423;
        Thu, 13 Nov 2025 12:14:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7gf2nNHl2mDJHcdRunnsr1cDxkVTsv5LoLojLfO7ZxN24jktHyKPFTPyMsxGUSBzT78TNdw==
X-Received: by 2002:a05:6214:628:b0:880:4dd6:20c4 with SMTP id 6a1803df08f44-882925b634emr6721736d6.25.1763064876942;
        Thu, 13 Nov 2025 12:14:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce2798asm6298391fa.23.2025.11.13.12.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:14:36 -0800 (PST)
Date: Thu, 13 Nov 2025 22:14:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        quic_shuaz@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support
Message-ID: <nh6rlcyamnm2spm54oitckujnxp7wna26vomxvlrik3mlhh3no@22skfvcsrfhj>
References: <20251113130942.2661069-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113130942.2661069-1-wei.deng@oss.qualcomm.com>
X-Proofpoint-GUID: dDvEEJvCEQLtkvhlWB6nL5TjCwttXPcO
X-Authority-Analysis: v=2.4 cv=F6lat6hN c=1 sm=1 tr=0 ts=69163c2e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5bVZ9rrVUiTTcsr0HSkA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE1OCBTYWx0ZWRfX1RJYyCGtVbhf
 2+tpdJAlSeWlHCpPFiIxximY+mSxeX9rgwakc0N6hv46tGUm3RxCIB7tojN7cF2v5OEvlHvbh2N
 61XGLWQLHCSGQKur+rAp7w2qc6EZmfc1WgSBNFmSPs3Yl5cP/HFLmHQvw40MU0hBu+TfyKzCHOU
 6qSRcpISEDR09vNOs8pPnDhuCA2UpTAyDTcMGDfBw0eVod8hbt0omlNAHQiEiLhNdqQ3KgLcMR5
 9pT2w4NCajh4+bUyVEwVQTVdgiPZrrfBnyRZOTDBwkHN0JXM7pgTxQFgdspAIVsPY+IyUXcG3un
 fivyTq8jYkx7ojEKAN+2wldPXpfBkeQv1CkSQEq+ACP9uVCR9m0a1dq2ZVVDVBq42aDcVIoqN2T
 /NMFBYKxdt1XW+1r6SIgyXv6v/sRmg==
X-Proofpoint-ORIG-GUID: dDvEEJvCEQLtkvhlWB6nL5TjCwttXPcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130158

On Thu, Nov 13, 2025 at 06:39:42PM +0530, Wei Deng wrote:
> Enable BT on qcs8300-ride by adding a device tree node for BT.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
> This patch depends on:
> - WLAN
> https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 28 +++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> @@ -571,6 +580,25 @@ wlan_en_state: wlan-en-state {
>  	};
>  };
>  
> +&uart2 {
> +	status = "okay";
> +
> +	bluetooth: bluetooth {
> +		compatible = "qcom,wcn6855-bt";
> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";

The reason for these firmware-names should be added to the commit
message.

> +		max-speed = <3200000>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +	};
> +};
> +
>  &uart7 {
>  	status = "okay";
>  };
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

