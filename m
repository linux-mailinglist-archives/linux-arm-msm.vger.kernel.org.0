Return-Path: <linux-arm-msm+bounces-74241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF70B8AF17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6A31C87796
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D45B258EF5;
	Fri, 19 Sep 2025 18:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4cKC4Zj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D89F239E7F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758307033; cv=none; b=lmKxOXBOgiNelj8d6YhRYj3gXdIFalpGbxFkrLW+JjiwUC30XM/tGap4OgiXeQ3Qxh5FoQuD21ZGS74XF1janVLu428pe4PPrnjWvTZ+v+W0K1zZrQV583tUNTGwDgtIXmgqgm5GzL3Qo/iuFaLtBxI4/cEbTnA4GiM2Fqop5Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758307033; c=relaxed/simple;
	bh=vdenTXxoa8s2/12E2g0fiU/TBtdx/sD6bwTfn5HWPVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4LXoYikBjMq7EX2zeFhEzQKLEhD14BHPXasgkBSm+8a92uvTzo25wVWaMRaMyxxvpM4N1/Ufzr4dXwYVJmGpAKAexPzzold1QHY/OjUmWGOO8n2VIxXF1/T1aPbiDSbskTR1WNZDziCP6T6Um+0KLNIZNXSIhbQoThgbw7Vwfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4cKC4Zj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEVZ1F010342
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FCNiC3U0gjck3y+8a/2C32b3
	PjUa1PZpZ1J6Sqj7/lk=; b=c4cKC4ZjpxpEehz8rM25Z6+zDsDH97ppXyJqz2V1
	xBVmy9Hutf2Yc4Ikh7BVP5KDqn2qvml6tsa73rR8fb0LxQfv+lLutURaaVO2lLyh
	LjgEtmBPzmWsmIuEmXKO6S7eju7HS2flu/DlHMqMpcTO9a3cC74szWIJqZesgSIM
	Zoy/X9DCeCKTAPe+16HIAYUTgkm9v2tKzahSkif4L5GDR3oPNr3OGfX6LTX0swUm
	+u2GNIdlh/AudyvM8aYXd21Ob09Uy/VszamPJ2gXJgQ6GMoSlVk+bPCXI+vt9LgV
	Qh5Jtv1GhKj3GPmc0/C79Ul1Z2wg0VK65LBTAlPjqtZWKA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498q9dby79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:37:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-726a649957dso42886556d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 11:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758307030; x=1758911830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCNiC3U0gjck3y+8a/2C32b3PjUa1PZpZ1J6Sqj7/lk=;
        b=Wq0XuMxnUlSndMzvuVa+RhiMWedBBCbfx0vRBy4YPhALjfCkULQA1/EqnQhks+nsyU
         1inpD6r/Y6de6XPJvbEgWecepo/2emaSblDH6+y+pBV+6KKHNQAQqHK6mN6716Sp/LJS
         MdqzVxz19jdVv0EZ9T7RV9opl3XknSVKGSGrmH9PLWSf1792cJgL//GABjCXx2rQ+rIi
         QaQ3sl0kqORdQN0PE4pj2dLNBlMoCXv4kT9BY2nho8kYx4RlOzceHD62cK5w5aHyZDkz
         jWSF4tf2Y6LCMqh/GAgHcYtJOX8A3CdoYnmOSVb/yd4HcsooARbVe0jNUXiR7v3ndAXR
         ePNA==
X-Forwarded-Encrypted: i=1; AJvYcCVCXAaz3Kdn+1Q7IOvpOB70o6fdyqWxyK5ywJLI78eVLpah0y9jlr2oZUfzEtHTZKQejuIwem3NSLOWiuAf@vger.kernel.org
X-Gm-Message-State: AOJu0YyA4/8TD+2G/UuBhlVruuxjkzXgJHPXx0KOsQrGp+S5wFNOwiJy
	gTAycRNnhi4cLYZTisTQ2GN/NMnuvRLaKLNAEOE2An8UsHnPVLEj4z7GGmldIOvl6JUeBsvhZUq
	+2N391c4NQ5lfJBJiWczsinVedNKbrIfB0xrQA5hTAGhwMMF5QHeaMuciIzKY/MnPA/XT
X-Gm-Gg: ASbGncvFotyr9h+R07r+1njCjBy8oY8U770e+0j1dPfKVibM6DzM8zI1+tf9lByn1sq
	1uoU4fcw6TFFzBeUGxp9ioPNzBMgGS+WJ90BSMvJKtj1zl4/oaSqMavsoTz1yCap37jWDG/PUrx
	fcAGvfnjq7KpJeODIgSuLvzG6zaxahkC+9qba90w1YyfpM8zdyCitYpaTmD9M95GSUM5SF5UETn
	z7cTnB7NE1ecNmWV9EH5zLTvK+CRlt+t7dXbxSOVuBik5sMWMzbEmA8CngTNuYm8sv5geTb2f0Y
	rAmogsBP+0c3fp6M1HiPjknpAX+U4cD0/I9m0faK7IZBJHQXrPHolDMk/b7yKn3tpnNXmkpyN6B
	PsfWCtRaaN0rfJIfNLHy1zs9OSnyMu4XowWUmGpz4zfeOwhMpijMN
X-Received: by 2002:a05:6214:c28:b0:78e:eeba:10a with SMTP id 6a1803df08f44-7990fe399b8mr54957636d6.14.1758307030080;
        Fri, 19 Sep 2025 11:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMDbCf+deoeMJmP3lrIeWhukQxGShr+KoYFlK2yJcNPGn6VaN9/A5Rars19o2mlw+8QizXag==
X-Received: by 2002:a05:6214:c28:b0:78e:eeba:10a with SMTP id 6a1803df08f44-7990fe399b8mr54957106d6.14.1758307029417;
        Fri, 19 Sep 2025 11:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a90a2040sm1536496e87.95.2025.09.19.11.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:37:08 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:37:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: glymur: Drop unnecessary platform
 data from match table
Message-ID: <4o3t43wu4vvza3suzzinzhjc2beign73bbqjq7rq5yoicsdtng@mte5isu7mpja>
References: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
 <20250919-pinctrl-qcom-glymur-fixes-v1-1-426ea410aa94@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-pinctrl-qcom-glymur-fixes-v1-1-426ea410aa94@linaro.org>
X-Authority-Analysis: v=2.4 cv=YsAPR5YX c=1 sm=1 tr=0 ts=68cda2d6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=nufiSqZimcgdgvCWlIsA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _DR5WFLN5SZcd940m3YUG_0v7QmK8-ql
X-Proofpoint-ORIG-GUID: _DR5WFLN5SZcd940m3YUG_0v7QmK8-ql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDE2MyBTYWx0ZWRfXzKePt7N4CAlS
 u9UCDdcJAfbKiIQuig83InEQtMmS0CNsdjXYu+bqlD20EhIZQ4FImk8g093haQF8SyAGHe0sg1H
 4Ti210b7kxA4UU7FqtLFbe8kVDu7Qztod6GeXrDcVujMrFHv40kTGVB/4jAmzYfjFlXHhPGkuiI
 IuovEhApNJwLClJBvJPlueizV6+7a8rKzONI1vesuomvIRCuYAY/Q129T98Zt8wi6CTMTfpbKmw
 D5Ns6BlrGjhV6qS3FDvZtOkI9Kj26oHqZjX1Zy6wp/ERrC011b6Pog9+4B+DDoYYE5vah2RMTn0
 oaw8TFduMRqh9Mg4ZsaKguOmmeebns6kTwINckcPSWCbjmxL7Js5K/gVDqdNSD42kzP+viyzy4N
 swrfT3qX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180163

On Fri, Sep 19, 2025 at 03:17:11PM +0300, Abel Vesa wrote:
> The platform specific configuration is already passed on to the generic
> msm probe. So it's useless to exist in the match table next to the
> compatible. So drop it from match table.
> 
> Fixes: 87ebcd8baebf ("pinctrl: qcom: Add glymur pinctrl driver")

No need for this tag.

Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-glymur.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
> index 9913f98e953110d32e804c8d210220857583ba46..9781e7fcb3a11c85dbd5497170188e2da051215b 100644
> --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
> +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
> @@ -1743,7 +1743,7 @@ static const struct msm_pinctrl_soc_data glymur_tlmm = {
>  };
>  
>  static const struct of_device_id glymur_tlmm_of_match[] = {
> -	{ .compatible = "qcom,glymur-tlmm", .data = &glymur_tlmm },
> +	{ .compatible = "qcom,glymur-tlmm", },
>  	{ }
>  };
>  
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

