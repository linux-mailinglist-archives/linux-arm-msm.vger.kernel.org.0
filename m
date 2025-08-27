Return-Path: <linux-arm-msm+bounces-70969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D0B37759
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 03:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 025607A3EFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 01:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495A618C011;
	Wed, 27 Aug 2025 01:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCN82tVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE33C85260
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756259183; cv=none; b=bcpqO3khRvOdVw3TaFjtt0khgLTA3klNy1sGMIrXhCK1gWtoPxjkPWL+uK+CMfvbM6K35t+JBUBxsKlaXlwT2X7qIjXT+NwrfysPQ/fWI3cfLgXwSTB2bjw1HX8M65aOiqmnZf4IC/PcsQagjC5qluPGiAASvsWfiHEXZPNLZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756259183; c=relaxed/simple;
	bh=uHzyck+siLD+tOu/TdoRD1xQ1q3Iueco2prBlfJYitU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZF+0KlAXqBXv/l4MS87V+V7blr+jmqd30gOvkXMUvOSgzhZGZYOAjEYy/Xelluf/tPx2Axrqx3ess8tT2x84wthPRpepa8e4bfO0sZsjjcPcQJWR8GJ4LIUBQNCv4NAknIwAuv+EKeX+uYuhSF084jk/uznmPRDw3C4YjLttc8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCN82tVp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFs1U8019757
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Oz3En/JYTYFCxC2EmpZCft1U
	VWMM+pon7GAYlfebkqQ=; b=kCN82tVpnjlVlG+5GA8hsW14OHO79lBv+sxnNDcK
	8hTYBY6cdapB8qYp5TbEjSPS8Y13xllvVGp5st+bYKxEMf3tFQT4EuYLbPwm/Eat
	RLTvV6HGesV/WEc76RCg/jl2IRDvCS4AkTUDxuvXQ5dSoWCtflXcQdVvnSfMAGMj
	jujoIx8y/+3JMMSmYXj6KGH8na3rTbK8poD4vtiYVeR8fSHtbyYccmezELC9086X
	Q9jcX0IO+8+oLfgbo6pnNK0aIN7taEiZ36xoKXKpuHW24XgKOMa8kdTKoZYWkKv3
	61Cpe+ACYsqKLu4KLTw0PMp1n8AmH9y1xuVvBd4wmGbu8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unttvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:46:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109ad4998so237231611cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756259180; x=1756863980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz3En/JYTYFCxC2EmpZCft1UVWMM+pon7GAYlfebkqQ=;
        b=M4lmlSLUktc4ba6FFgkLJflwMvXT3NshzPDU+zgzkVeAe8ihqF+4NhXCmD6X/M8Dr+
         N1Au92+AzRUL9q+C/dN+OuddBGfEVfB/PvaQxVGP51O2IThzuce9/9JI9rpyHCkbgGlE
         ocbfcz4Y7U1X189kH87OJVzrCgmjFZxktfIg8VR29y43gmDTquZRIiHmCqeqQF0gZcLO
         wq9jSo21a9P0c1rV30HrSBYVeEyvbP/AENgkog5gv2B7h18R+FaW5Ryl0pjfrpf6h19I
         JT2S/uNW5i/v2FqAFfshH7zPm5K7H0eW8408QNQtc/H7JLOGshTyyGRvzIlPmwMqLJtx
         WW3A==
X-Forwarded-Encrypted: i=1; AJvYcCXdu//eFFn5+XFImp0Z6PI5MrfqIrluyuUTzZx5T4HXpcg0hL50mmNUFHv429NITZz13NShZPbNm3hkcB0c@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk/sAy2dT4ypWRGvJyPOkszZzuRiiUhVq2yFwEtT7uwzytvZc9
	CA7NWKFENrm+0NeSVdxdbAkhZ3ya1jyyHbLaIpSkFNJ5Vy677ExqOCICB29CJOt3LMb6uTYeoBi
	XoD3hRUpmbWhi5zWlSVeb03qZmPbO5VmbYk02NN8yHAS0I4KLjqdjJrit8C8uo280CCXx
X-Gm-Gg: ASbGncsi4Ac/+lKp9gUDPkB2UzUiytW6p3pdWvhB+xo8x44BAdIZ3Z9N1iSCWSnFOxS
	rokGzWRGVhzvTpO2oPm50W03watvEnKJN8fpDwNC+fjCkTafSZDtKHkMgOj/OqzFvhqJGmMp/2e
	LlG4fL6//GhD8rPD2Qmq1DdqG6i1x5JiNtIoAKfzqKFFiLizAg4mAhvGQF3QrNBs2bnd7WNquaN
	JbbfvENZ+4wd+up3cNgzuQ5zWZzOk2HlDOk0Ki8N3TzliYB/mN7/9jJuwKghCSom6Fqnp9Y2dwl
	GYzfcl+Pch/a7FQEUAy+MWVcUPQXM0W2LYh1Lw8SWoU8vMjXGHNU1+M1IegNnILJDWJD3+MrYYl
	GjMBKWUeeUUhCpTBS1s8pUI9/TGEl+3Cadr7aEMNgE8EOlXnoHcLK
X-Received: by 2002:a05:622a:11c8:b0:4b2:8ac5:27c0 with SMTP id d75a77b69052e-4b2aab513cdmr197290051cf.75.1756259179953;
        Tue, 26 Aug 2025 18:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1nVQaEjGAMalegWCB9er9TFUBVM0KcU+1uQdurKxeqheISmPpprI81hhufUBXLp81Ki2Q8Q==
X-Received: by 2002:a05:622a:11c8:b0:4b2:8ac5:27c0 with SMTP id d75a77b69052e-4b2aab513cdmr197289811cf.75.1756259179417;
        Tue, 26 Aug 2025 18:46:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5d1e5fsm26038931fa.52.2025.08.26.18.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:46:18 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:46:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: setotau@yandex.ru
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/3] pinctrl: qcom: lpass-lpi: Introduce pin_offset
 callback
Message-ID: <o2vsj7rfovoo6adwx7nhhi5g6vwowquux72m7do75g6sw3fkwf@jw5hxi4v6e3o>
References: <20250825-sdm660-lpass-lpi-v3-0-65d4a4db298e@yandex.ru>
 <20250825-sdm660-lpass-lpi-v3-1-65d4a4db298e@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-sdm660-lpass-lpi-v3-1-65d4a4db298e@yandex.ru>
X-Proofpoint-GUID: kB9xNQ-vKnv-b3rD9f2VWRtO6nx-KaNS
X-Proofpoint-ORIG-GUID: kB9xNQ-vKnv-b3rD9f2VWRtO6nx-KaNS
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ae636c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=vaJtXVxTAAAA:8 a=EUspDBNiAAAA:8
 a=Hv2uq9k-kH7IJJ9oAfsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXxkHFslU7/D20
 Jbs323Fst5p+ZZdpkVm9yERPckYgcjeTCN1UZONoCklFkfX+SQu6bcIhJeCB5y8i/aZtR/3xvTs
 fxuCF1XznPZIQoroRgcrrXweYsl+/7DOvYgkDFOvIHlVMGXNirL3C/rLVSUkwuj77gSQEky0TC9
 H9fM5eWQvPawGC+fxVLan7Ov5lVYH7uicBRHDfpQxxrHE6EdULyVdGbUXRJBT6eMA4/kQlk5DDW
 KCPPpe0eGItia5iLqQkKW0YLJLygPHrmRnDGdXX/lunTrR8XB8l2ZTEtworQQw5xmMXajYJReQZ
 jTBAEnwJVnh4eviUDlTelZfEmdTsUtwPnq+WtEzva0sJaDDPS2t3ZmVPXcxQAuSOi0/5BB9JUVK
 s+avfahe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

On Mon, Aug 25, 2025 at 03:32:28PM +0300, Nickolay Goppen via B4 Relay wrote:
> From: Nickolay Goppen <setotau@yandex.ru>
> 
> By default pin_offset is calculated by formula: LPI_TLMM_REG_OFFSET * pin_id.
> However not all platforms are using this pin_offset formula (e.g. SDM660 LPASS
> LPI uses a predefined array of offsets [1]), so add a callback to the default
> pin_offset function to add an ability for some platforms to use their own quirky
> pin_offset functions and add callbacks to pin_offset_default function for other
> platforms.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
> 
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 18 ++++++++++++++++--
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.h |  7 +++++++
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

