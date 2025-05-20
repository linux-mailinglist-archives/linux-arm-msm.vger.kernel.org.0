Return-Path: <linux-arm-msm+bounces-58794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F3DABE4C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 22:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5579217A728
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 20:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CC22820C2;
	Tue, 20 May 2025 20:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gq35RemC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C844C7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773348; cv=none; b=GcgTKqJyF7T+5AaeQqte3qv07+pwKBZwni3Zc6gZfAxHmekN0mvqYyuqlf6FCuDROE4RqI7DIgj5tyJitC2NQevjk3Bm2hlRjkzlu+xX8LfVl4cl85fIsWDodmfyyuWYUjER850zKtqr8nYrGRx2GCdbus6d3LwmmVbCm08tFpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773348; c=relaxed/simple;
	bh=8YtDnrfQwAauwiWArmVD3Eb572CsqEFcBXMUIHo3eZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5pl2s0qy6MIq5umVZpf/F7BsbI8HKB9p4VJpfXBFWo1mISJDLk85Lv1Wh2JduJGtJn/mO2LVrjY9q9GbSVOIr6r8UaRB8NmcOWsJq3Mv8Pf9pY1y7EKL4jyDQQpfJWG+EgCQ/lvXnlxGY07gALF/3j3mr/BxNXHMsgIWAhLuRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gq35RemC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGl19f012755
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BOzaeAjRPbR4Ral+ZicyhMnS
	y0Qc/MtOAgofjjWMqDA=; b=gq35RemC3vbS1CnqU+i4Bu3TqP5cBB7gJD1VAHpH
	Dp27FBrBJm4gDlJ/3SUBWy9ApWneiysjQvdg2emjPLoy7UVk6pZeSPrw6yeSUKrn
	VZ9TgqcWpLVy3jxsPipVuAz2M5qbazT4F3vVkSAe+SMAnvUzmpPY8SiIWUxMBcwP
	xJfVdNQqiI16rg9MPDXu0J0U8vCM48X6Gz5CF7NvU4VAKfQeIVWJUm6vx/U+bM3x
	OHsxWRKwAvwhChoPrrgfF0QgOIrMUbKGPg1pHM5Am7LbeBJfudBmoLel4qcSEfM/
	HEDxBctVa2MJaxjOaLpyrunxqCPWPnHlmGWEZjJ9bar1YA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6rjqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:35:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e23d6657so32560066d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747773344; x=1748378144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOzaeAjRPbR4Ral+ZicyhMnSy0Qc/MtOAgofjjWMqDA=;
        b=qERSpksMG8dChMXHYouRtX2qOG9cDKtyZyNIioDDXDsN3EjAVDIUjRk1LJsx5LeC5c
         PMeSm5mZ3ZLszqjAT4AgW8AH5z0mm+INkwoVd8B4Gwe/X9ttvPUSJ8pYWw16xE9gVrpC
         KEVOAh46vDD2AAMuVmyv/Mi1wfGYr0MOP0kNl76UZcVkRsoI0pK6k6/EjYY08blCAuBz
         8p89jQse6TECrmPFkfcEMBnV4/em4FReNbqUwzpdL/9YSc5Y8LjPwU5az856ac3M3/Rr
         7bf3Lfj9W5j1e9RaQ+CAR0p5gi0Jt1UwSnuyWtsFed6Jmb/zYYdOGL75D3hvvW89x20Q
         1sgQ==
X-Forwarded-Encrypted: i=1; AJvYcCULqa4PQWeScnYUZ630hM3wsjkHaMii5qUecmecHYeP3mcmjafrvnlAcnaZEuBMZecFbLyEA8eEXQuUxff4@vger.kernel.org
X-Gm-Message-State: AOJu0YzSD1XPIwexnQqRroBxFUecM1ZEgFPPNUZJKr3ENpFDMrPHDyg2
	uhYpMtc8IdpaqIli+bVMrBnW6xDs3ECdBQfZZ9hpk8QcosKCGYmKOEH50BEAqiS4ZpIeV2vKe7O
	NjmFx6K1dmPd4FqPdhfxXs7WdrOuWCulxybt2EBnbTdQouLSPSZ7mfmt6pE8csQKS525W
X-Gm-Gg: ASbGncuGsTmyfE/pwMxDlw4WfTCZkVzguKxtPvwMQhWxjIGT++ZKS1rzKvoZWFjmXCF
	xHG7hrwiHqpDPrxU74QPbouE8NUwd2xIqn58QJyk/bLd9H9rMZt3jbzecKa6sW5hDVV6bI3FIU+
	3OrYQlgyVyO4RLWcG7KHTn3qgb5kf/T89T6LFRI83DPbTQP1wxSeHLp/7lNTpKVADJcLOk3Bs/i
	EOYtQcFBoexllDuvOOFP4ENM7UM/wej8BE+h8MLCJqpnACthymvwoJBHGKCqbLv0l1XhWDYWtjz
	8wtiZcw2jyHEhAYoEorDnzm/zJThpO+rqGgsFa/LD5kH3k+rWlAvJeNqjTxG1dxGbuXA7HKdYys
	=
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr289469306d6.10.1747773344292;
        Tue, 20 May 2025 13:35:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAkP639HcUZ1nSxa6ug5u6UZLcMp1VanGG+n7IG1RTAVz+h/i7VJ8/XTm9hA+dno+sXsN6mw==
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr289469086d6.10.1747773343935;
        Tue, 20 May 2025 13:35:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e704026esm2482834e87.241.2025.05.20.13.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:35:43 -0700 (PDT)
Date: Tue, 20 May 2025 23:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jens.glathe@oldschoolsolutions.biz,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1p42100: Fix thermal sensor
 configuration
Message-ID: <46jqmeaozwvpcnfxxctyeslcouzhpqshztdl6l6uex37ybtyt4@ghwxqs32dqzs>
References: <20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com>
X-Proofpoint-GUID: 0qCYXBoaDgu1ngarwTNo1q-OmGcgomxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2NyBTYWx0ZWRfX6Fqt/u+D4ZeD
 Kb+OL197CGm9XstbSjZVWsFOuiSuswB4tHTGN40tZqVpme/LZuy7X2F+ZYGKYGnaY6l+yQXI80r
 5CHPnVWtOEhjNyp7HUHPld3nMnkx1afUrCqmMjmUiR/LRSwxfXIsk0HhUPCTh2Bu+Bt6gWsti4r
 qVROPNaVZuZRpicsn4zJcAbXT1LZ8AwCcc2IoLKrUiaYQ1fl1W1omSX5nqhmZlzNf4oxmCqg6hi
 /KGhAPbY1RhweewAmNSt6anIQKZRls6+27ypekuz/8+UrwJs2GjksAiNd2GN3BQoHRPmxTTU6z3
 DautlpapFH3JQOWU/myGka9xtxIfQgPAU4dj6qdaJmlO8s1j/qzzwJgs1zQlblpcBRzw8n0MIQH
 cxywturenO/IMm+uAEVLGFpvOv7NJqiHvoGCnX5hSnLiCtoj1/JGts86vZJkdcUjSQSubwse
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682ce7a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8
 a=wngnwIPPOuKcIasdbY4A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: 0qCYXBoaDgu1ngarwTNo1q-OmGcgomxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200167

On Tue, May 20, 2025 at 10:14:46PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The 8-core SKUs of the X1 family have a different sensor configuration.
> Override it to expose what the sensors really measure.
> 
> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Compile-tested only
> ---
> Changes in v2:
> - Rename trip-point1 to trip-point0 under zones where there's only one
>   of them
> - Pick up t-b
> - Link to v1: https://lore.kernel.org/r/20250520-topic-x1p4_tsens-v1-1-bdadd91b7024@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi |   2 +-
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi | 556 +++++++++++++++++++++++++++++++++
>  2 files changed, 557 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

