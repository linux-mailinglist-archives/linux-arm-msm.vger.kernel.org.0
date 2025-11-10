Return-Path: <linux-arm-msm+bounces-81060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7268EC47D88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C852D189470A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E6D26FA77;
	Mon, 10 Nov 2025 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFJ1lc2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwEtHXdr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E12749E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762790923; cv=none; b=iYciioF0Qj2kYu9skVEsARG2a8/MoI5u+oEFgASZy0/C0QUmCZ8JvPxkEY5hORUprasM9PXCb9fct243gs3bgAkKMRFytvHvPlJ5gAEao3CfXPT3dfHBkwf/W0YWcqC0qkJksguRyTopDVpsv5VQyHrsEdO+fCsl4TcGoK7dyEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762790923; c=relaxed/simple;
	bh=tPy5FwvJbQCoIpidnLoxpz6S1F3GlO8FzytxOrtPRUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+WbGXbtHCWEQuV7QQQB3fmfFEG0zcp99slQokcOJXj1jtDP+WrtelBUM4YlauFtkZ3qu6AYXEvKB1dEsOfNiL9LiIYz7sc4u15SshfdYUtP3WyIQ+HFm4F25iKkb3ze7H3BNRo3Da5v27Hj/2xjRfRfYyYyJuwuz4oiAr2qIt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFJ1lc2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwEtHXdr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFkd9V2867907
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3FpMNZu3Cz/i/gtRUzS3IU2S
	7zzqm7oC4KvJHeoPfLU=; b=BFJ1lc2XHNG+0LM5ble1t1dK52FEyS9F0XI9O4tu
	wioUk95WQClFCtoj0YlfuU0yzQK8zfNSKxdoBPG2zNhOr/ch4MGk10wrf+ilpULB
	rnplI5O6FAa4Evd2CvRTC/vD4llnPG8an++R9MbDS8CcT7sY2StxUFMqbl52s0Px
	jjoF13eZpiZdJArh9CnMWTbj+jFH6IAboiHsUhmK07gi6pm3c6mNdFol6WVpei34
	Hugq3F5e7ZKF8fSv0aih8ZufAbsfK4jZJZ3Y5ZjG1iMO6GMiqyVoTjbgx7Wbc+KK
	h0nUxxM3aEF3Gutf5muXrHvJ+XLAMfaDcHk2aGIoPcm4hg==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd7618bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:08:41 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-433692f7479so37784075ab.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762790921; x=1763395721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FpMNZu3Cz/i/gtRUzS3IU2S7zzqm7oC4KvJHeoPfLU=;
        b=VwEtHXdr4U8FDpJ4wbtRtybb2Uu4LlApUdM1fA07Jwdi1Fq3RWa3bpoBLlY/Jr/IEd
         vQ5mp3o4XrR0jfPsvtdX/IoQ4BAb3K/fxv6a7Ng3N+QkZkAY3BjmjPdlTX/wXs926kkg
         JFIvKuyms9TMJH7cSFonBgAR6b9Gjuu+pbmiaS7jGj4dY1dXt/rXuFKGdFij1Aleyuer
         u42ly4P1I0CXI/82KeYjuAW1chFlh+PYbgLVN0s0G+Qqhk82v6ZxEPksv9sOVikVVw04
         S9WvMw2tNPY5KD4Eu0aVL6ekuWTI8LKr+sd+nIY/hX0bBsxCfFN8jRD061hG3HUeq6on
         mP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790921; x=1763395721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FpMNZu3Cz/i/gtRUzS3IU2S7zzqm7oC4KvJHeoPfLU=;
        b=r12BmOtpEc9IoBOy84cKdiIiSM0Fypp59yqOPHdh7WtnUvx/5vbBNPFC6avsr0gcMM
         UT00uJoPIn22pYkvhIR0gEvJMoWwBzq5nOf7wCl/iLx3XmBN0+KY1X40q7sBHeaNlhxH
         5VQFQ7xXc5tNVl2O7SFUTb5YJI00HiA5jIdI9srqQVYz5gCYEWqnoBKJ/dkSIUZanIPq
         sXofJjBCtmbrxLnaE3OWaHQSc+1gDYVLUzR3RA5v3qkdZv7QZ+E0Kbgbx2v8XqurBL8z
         PumHVbtjIeFp2ysGKWWtdgBO0wsmqICvaqknWyv0PE2+NH6xZ7PZGXGa5CnWxF3zl1W8
         u5zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJn+ZUV2B8zHCEPbB/dF58Z373pQuJtDVciMOuwLffSymd4e97InEpzZrUF/XeUvcloIaAWl9HrAtJB5st@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2uOQrL92/s5Z5nAvcrYf4loq9B/+6l274siz3PmpH3+MtM/6d
	UEoaE7ByPEwQIM29ILSFMBh0RXCeDSd0ZsKvwCgtB+OnJYHuWXi8ZjsBmCCIVyzR0EMdFNE0ht9
	c5Jt/lcTab8xpym9rBJD5BUCmE7XG9yV57wpQA4WkaDJw6m3lFOr2PBrhnNhy/eqCG+ML
X-Gm-Gg: ASbGncsEmuQv52p+Z+oaUL+L9QeHZYbrklLBOojXoFt462bUxOuQR5r3K1bn1LgvtqO
	CcSvIbcKCl5XacYFKMLcHPaz30iGPzR+3nCraiPO1DPo1Ng9HI4cVw6a56V9xeVUbaov8MrpjdJ
	zQScHLuO8SGFd67/2U9KKktzQGMbw4Pj5nTnqiaWUUy3vKaZfFWraCf+o4WCkWkG4fNuc+c+cI2
	YTIlPyATeZKzyOwGN0rJkgYmUSoQGWX9VRN0X8xa3aeKtxxUOw6jbprENNMzpxK0EeIdhWnmjsE
	bF0cHoKEoUQTiGl9qE4V7aM4CHMTZQOhtKF7XYImEDvv5I5jRcuP+6wH1FAThNaM45EIgrOWhUG
	qKsnhT33MBJTutZ/W7M6Bp/O2cOFFDjzwujGZaDRe62VzmzCeNvon9ElW+FKrSGWvoeSORy5SlH
	E2tAM4owyDtZTx
X-Received: by 2002:a05:622a:2c3:b0:4ed:b75d:31e0 with SMTP id d75a77b69052e-4edb75d360bmr59124851cf.6.1762790313402;
        Mon, 10 Nov 2025 07:58:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdPbMW+KH/OaINk3tcMozx8h+ra/8Uj6lYcYx5kCxoxFDoZTefGVQa7IEjxe/FgWViePPf/w==
X-Received: by 2002:a05:622a:2c3:b0:4ed:b75d:31e0 with SMTP id d75a77b69052e-4edb75d360bmr59124641cf.6.1762790312957;
        Mon, 10 Nov 2025 07:58:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0ee99csm38202821fa.45.2025.11.10.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:58:32 -0800 (PST)
Date: Mon, 10 Nov 2025 17:58:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dylan Van Assche <me@dylanvanassche.be>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-oneplus: add ath10k
 calibration variant
Message-ID: <wqjil4hhrbsozvhwdf355dqpwu736z4x2nwnurug2bpx23ed3g@c4shkwfyohky>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
 <20251110-sdm845-calibration-variants-v1-1-2c536ada77c2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-sdm845-calibration-variants-v1-1-2c536ada77c2@ixit.cz>
X-Proofpoint-ORIG-GUID: no6Ldx-Ts4gaTN6N8qM28bkheRW_JVQ7
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=69120e09 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ahC5f1j6PEOMoUp-Vd4A:9 a=CjuIK1q_8ugA:10 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzNiBTYWx0ZWRfX5vCYVUk2GxC8
 Tbs7V8UTw1svliqmMoZ3lOuNc7NjgIDEm9qk8fped7rjkauyt1a2Q1SCljzj0m6RDydP/2TwdPc
 jBe0q+JiZKiXV4LgjyhdN+34t5+EvyicNAIUp4QLt6quvA4mIN1+OLNlKudH2NIPFdn54DQaPv9
 p/mFysuMxpmJ+G3f0vJrgk0knW9xdkvfWgccYg/etzV819+nlRZhwUbjErh2gV9HV7PtSupwQ/K
 TZoNFqLRNANsaOhr+MDBG9BLwIzI70mOVIgPNAG5FyNW8pq+CzVvTPRKszRButpwD8B2zbigaUm
 cwriTVrHnOft6bZJ74q73nTk5GI3p68jzp0NY9CObEExWNXg4MMo94pMCKJUw5gpni5chtxIr6a
 1tPD4gIpp3dM5sbWZUdiABK2AQ1g5g==
X-Proofpoint-GUID: no6Ldx-Ts4gaTN6N8qM28bkheRW_JVQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100136

On Mon, Nov 10, 2025 at 04:37:46PM +0100, David Heidelberg via B4 Relay wrote:
> From: Dylan Van Assche <me@dylanvanassche.be>
> 
> SDM845-based Oneplus 6 and 6T have their own calibration files
> for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
> Add the calibration variant name to the DTS to reflect this to
> allow using the calibration files from linux-firmware.
> 
> [David] Adjust the compatible as ath10k-calibration-variant is deprecated
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index db6dd04c51bb5..a0c2f6efec59d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -929,5 +929,6 @@ &wifi {
>  	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>  	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
>  
> +	qcom,calibration-variant = "oneplus_sdm845";

oneplus_sdm845_6? or oneplus_6_6t? SDM845 is too broad.

BTW: Were those board files sent to the ath10k ML for inclusion?

>  	qcom,snoc-host-cap-8bit-quirk;
>  };
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

