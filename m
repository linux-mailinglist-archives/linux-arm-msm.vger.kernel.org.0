Return-Path: <linux-arm-msm+bounces-73458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA7B56D4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F25F3A2966
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC9019F40A;
	Mon, 15 Sep 2025 00:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/VdOuRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD841A295
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757895952; cv=none; b=RYp60Ii/XPxf5OYzBJq4q0Pjbk9YBi3byW/TwmZYMEzOkwaaU2zjjKUPp/AC6ovwB6j+R4+K0pz3nNkvb6+clGxps3/8IPJ3o87FZfG0SDOPHkeRLghYo+PSv+zv53gtxbrmkXFenITCvGWc9uUXvpYwX60OXsVFJQKUUI7fo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757895952; c=relaxed/simple;
	bh=9JOf/x8+vDjy49a7WWpdGMIbreT3j1CYdjT28WFGevQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbHbQa8MdxLIngLRtVeLxzza652GYoxmJ1V6Jakn/zpzSSvpGjrh2FDq+vdGi3D5GMNX6iVFWHeS8slA54FWousVmK/02hTv748CMq8Meyei53dUoG4uBWpe/nZBgik7CzRldyDD3eYqeQhNNoXtr5h/I0YHV1/I/jv0f3nkK2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/VdOuRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EISIOa017487
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=umfpL2GBjS9X6IOBDeqr9RDX
	8YX0yJCkvFLrjCSzMrU=; b=Q/VdOuRPJ02gOPVvbn9xqZ0rGNTbRnAuiX3RPCqG
	+gpYA/5bpaKpE5nJsUax2nxXhbQo1EVnq8aLw1H7Ssxi2OpBc3gmCJhbdzJwFKjo
	Kn6u5gp17nbfSUEaVHS/KQVkngVoLLiYkTJliLTg+EY1s6l19cFtmKHjhlN7GffA
	6RR/h9V+83nmb/aypwZLVrEt7IYRpB4CU5+Sio987VbSL3/4f91fucW+8rl+fQIU
	VHwPxLHxWAT3xxJ0DS4t5dcBIpNsAgFVWLHe6evlHClcV+tqsN4zisnekU2Mbywq
	xklXEPw8U+SE213h3VcjZNzX0A2PbNVR6qom4bnvDLjKGg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49510aaxp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:25:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b7a2999d38so9632161cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757895949; x=1758500749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umfpL2GBjS9X6IOBDeqr9RDX8YX0yJCkvFLrjCSzMrU=;
        b=AbrhTZ21ylQgEwpqzClkiUoP5cj3MjFWxqSLM+PD/8fHvVTwvA+Qcc7M6lVzbNOaPk
         NLpKel0bmXlID1m55LM303o41+4cF5jqs9QuL+/EJq3jw8z2tvZvT7XCP9KdN5mFeKKf
         QFW08DnQFFiV5ry2Po/7F+78+8pvOpmbEV4U+jsSf0BPCJZWS40oNwFcRmZrP+N409DC
         d6bQvCKrMWbVr40B6c4wBs29wz7D0OL/MdFR8X51TpZPmsIpu/fN42to9RVoo/OzB9BX
         GJeydniRAStKslzRhZpbgWxFxKpmfGxeuVc+swuiF48wLoEnLnj6fQ94OHHTuF5mXn7f
         Kv1g==
X-Forwarded-Encrypted: i=1; AJvYcCXtE0wp6muKuDRUYwwf9tuKpgjtapTOuoFZnyApEWCzgLZjxOnZ6b4FacwJorzMkM0ybIL/C8ihhSs7ANOG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi83g/gG+Ha3YLejlDpOgHOORVm//0gB9eMtER3mW2tWVdCNP+
	o3uBgIwWZQHM0CuHDQzkjDBxIiXSZ7MfLZeKUUmrEg+SLkQJEg7SwRBgbv4lhaet6Y3Cn0Nu5rO
	6fkud28R6OhxOx1vLY4Z0o1kxDSAajxFawU2yMGQd/S0EYyeFjCsmDkrc8ufptKgO8Jcy
X-Gm-Gg: ASbGnctb4RC93wC+Atb0aWLtaYWq/YRCalhKmEajgO16R/byQUuVod0zsNjwCgqQ2VB
	w0PDKMMT+ALcVDHC+xPKxYC/LUaZdI5PiO4j73siIcSUihNR3K7E8BoHpdswoENhl92FDe63uZW
	sdiNKBuzYCOGHibUi8mKE1QN9m7Weo6FaJTcUnrMeEl+R9eAcGRSYoFpPPg8IFbj3/YGFal1C6i
	Kqc2v68/bO0GzZ3K9K95DxZ0uRZEzxNIp3GVlo/Vvw7Ag8STNzV+q0wVl9xGKTyoYluUG6RuOrc
	PwTX8diRP5SS1c0Iml1ATIX8hQmdAtSCZlkOzhgicMjgc7qhgo+UOmhSJfW8jMJ3tb9x5efRl7X
	ex8U6D22AsZ31lzOMyP5XBB07O0FW6aW6wL9aj4uo60qLXern8ebV
X-Received: by 2002:ac8:7d92:0:b0:4b7:a709:fd37 with SMTP id d75a77b69052e-4b7a70a011dmr16759411cf.2.1757895949589;
        Sun, 14 Sep 2025 17:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSFctYddLyvI4rFUAowjI9dGidDYhUfC2/597iRwVg8EfqOz4vn10TnEsSVnUIZT+CZiziHQ==
X-Received: by 2002:ac8:7d92:0:b0:4b7:a709:fd37 with SMTP id d75a77b69052e-4b7a70a011dmr16759161cf.2.1757895949113;
        Sun, 14 Sep 2025 17:25:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e661dbc29sm3255796e87.147.2025.09.14.17.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:25:48 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:25:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Message-ID: <hzqsdhqvgw2cp4xnxocyddhz246ovicwaml2n3qqdooohscyis@3uo2qjlrapr7>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
 <20250913-judyln-dts-v1-4-23b4b7790dce@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913-judyln-dts-v1-4-23b4b7790dce@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=I/plRMgg c=1 sm=1 tr=0 ts=68c75d0e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sfOm8-O8AAAA:8 a=Gbw9aFdXAAAA:8 a=INp5xvtxXxILuIktMPQA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMiBTYWx0ZWRfXykJMAzgslih6
 fNobpUUWNL2P4XbUU2W33nAw8BWblskXfccSvjCTBgG74/vWJW7sX/hA3LQkaoXvs04Rlz58qvJ
 Ql+X8zGLPo0t1aEuJxkVyVlZ6yDYQJ1qFSFj0j13ULGXpIuseuG4KT83gXLTnqaj6pWAwoCH120
 tYVBj3G+8rw4WLU8rE6dNpOPAx/k8Ocm/AmahMRTjgGWob3k7V4CUuTbtPu//6FKRKa8VJX+psx
 1JueoT1LYQoUW8f1ENPYxu49tCsiSosdgRgp7MRBqTxx/YGnuN/86t1KJD3fAxFxSgq66gVWSu3
 pQkirX+jpn+LXhuf753SR868V3qNaXQEZbp2rRLTUNAaJzcblLPy9b47G0KokK8EgiycFXUeRq1
 qMOYViUv
X-Proofpoint-ORIG-GUID: CjQhvbOirvoxXDnhX2DYbW7heldkiaY6
X-Proofpoint-GUID: CjQhvbOirvoxXDnhX2DYbW7heldkiaY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130032

On Sat, Sep 13, 2025 at 04:56:37PM -0700, Paul Sajna wrote:
> Add the camera flash so it can be used as a flashlight
> 
> Co-authored-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index d6129ce03f537f0c8c78c2ae5f39be6146cab7dc..df826bca2bef5e3f85cf49708020a47b8d6bd8bb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -604,6 +604,20 @@ vol_up_pin_a: vol-up-active-state {
>  	};
>  };
>  
> +&pmi8998_flash {
> +	status = "okay";
> +
> +	led-0 {
> +		label = "flash";

Not allowed, please drop.

> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_WHITE>;
> +		led-sources = <1>;
> +		led-max-microamp = <850000>;
> +		flash-max-microamp = <850000>;
> +		flash-max-timeout-us = <500000>;
> +	};
> +};
> +
>  &pmi8998_lpg {
>  	status = "okay";
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

