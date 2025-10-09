Return-Path: <linux-arm-msm+bounces-76663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED9ABC953D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B2573B4B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D8734BA39;
	Thu,  9 Oct 2025 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1uNZLL8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F02E6CA5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016995; cv=none; b=gmh/s9A97f6Yfpy5pDXfwqWZOAOzQ38VTpGGR/OPsXBdTIksTlwJgoCr9PwqAeZujUPhNbjWzZbuI+fEFWcjmGrUnlu+e18K/lZS7squpinADSV4ns1hhxJg2cviGo6KTdbo0AP302XQMW3SkIYXy2hEmPIsv1xeemy3+8cvxRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016995; c=relaxed/simple;
	bh=dzVbdWVRpdCQwe44yn0+dLpxIzypbEGpFZhHd/JbGpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7O5ERM8N+MMLB3aq67zmq0cGCk9UEj0Pqse9vnSb0btd6PpbVu4bfRHTtTRt9Ohbf/59GfM2YqjHvxzGPxkEEBVHoRndqh65xysOxW3QXZ1d9ktVV9CPI1pISusDXG4Znjyl5xlGh5iLjf75nI8kx787nLtFR7CirtukGlWLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1uNZLL8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996ERfh023406
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 13:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yKk62FEzjFLvqKcTvlSOs87O
	G55ubXymcmIf9wF5OeU=; b=D1uNZLL8jMqNYdJNm8C62LqtYaqi902RqEIc5Thf
	wNQhMaXckERXRtoxlVNKSdDPfLPHWSWvxpjxPGW9cDVEyP7+rbKg5je3BnbmF0DD
	9Zf23kLkFxTMEBkmGQzDWcrjyi2ujaEgWtnT44zfQpllLKS27klBpIiRwI3Fxihh
	IF9ce1iVZ4wASNjWPVfAIulmMO6Xwjr0KkF7pyAHyq5eZU+KyKq3fnzyb5a+ez7v
	iMh98GUOrtyWJkuQJWqX8dFx3glwmDhI2Tn8+Ju6TT7aVE7u4ZLd7vj7tPTJ44e3
	NbMmECT7TkziSAcZbwDvm2Y984/lK6g86S2g4lFwUEcxrQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m3089-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 13:36:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d6a82099cfso35070691cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016991; x=1760621791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKk62FEzjFLvqKcTvlSOs87OG55ubXymcmIf9wF5OeU=;
        b=nNGyjy4M8pRZrtg77GqcRb7h7f4NLD+KTMeFelO/PTNuE+LXRgKty/2PWl+fe/3/5H
         p57nCchcs1pboekT50h5nlVcURxAUMhvfGmkLbuMKz1fzr1xn28er68o6ZA3doj0LdJi
         leDDS1s7kJqJEqr/CjGtmyVA+xROWQNEQt5+fqN2qo5uRWVIU6z5AShgeY5Vv+xp5BE+
         Ypr2hNRAcFlmrAb7lwnleD5pW+O5pLxVKvwJAFKFHqwnskgmrRT+EZ3lcRMwvXILoGK5
         /nmBwHp3FQ0VCoWJOvdZMoyixqEg3QKrwoQi2B8yvcwR4A7Lgl+SiOx8G4RfJSnKzSu1
         VTzA==
X-Forwarded-Encrypted: i=1; AJvYcCWyI2NcySttp3oA5sXrrHEqQ0DwxX7vi/diB1ByuxRRtRdseBfbG9q0Mi2YqbTKIMvkkeFIkpdCjyWIArDE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzho6Y1T9n6Nj1PXC7EYoGu6LI8dUFqI2iuz1aARy6Inr071xlu
	Cqk0dlN5rBhMFffNfqnYQ9UR+PR/0VNMkKmoDntUEwP+qtuW7lNx31Fh2NxcuV+zAkF51Ye3tkK
	vNPzB+up8xSQYgu/nyYIaoB9QB0fDZ95e3fAMit367CGkSntIOJNm53aY/D9X+vjLq5v/S12cFM
	No
X-Gm-Gg: ASbGncuOQik7nq9q2bLiKHK38I6l8q6LugCy9qq3j9PeC8o7WJRrwvDi3wn0lbAjYg2
	EboQcoz4s5TGMeuV8Z0OpvMTNyiZ1co+CukCBc+m64U8/nZV+2/6IZs++ixokEQh6+gqCUs36dY
	FnUFc256AJgUvvl0lW32xX6WYbbrw62Nuyf/HxWwy1xLfB0mDJXnjBFg+Ekw3OHKTRoY9Anctdr
	ureNU/Qe+sPJChUD8jtgHn8RC1avcwXt6n6rVQIl+Ue0E5cJa+FZTOGEHugECcvyEcrZbYcCVXb
	RSiRcafybmzGWfsEXVBVPnVYgvMrEgL3guS0QtqrRftIUOFGtsh8460+Rlka+SvME55TyWcIVqJ
	VKn8ZEZfbEtaSO56SMwn080ixxUIvq8wxhSicAz8TRyAK7gSOq2E7UON6CQ==
X-Received: by 2002:ac8:538d:0:b0:4e6:ee34:2f0d with SMTP id d75a77b69052e-4e6ee342fccmr75785381cf.76.1760016990714;
        Thu, 09 Oct 2025 06:36:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBayiHdte1PqGG8y5/gMAcwfyHqEEg07Q+fYuVHDzjQ3vhgHJi9sxsB+yLdRrcMItaI5qh3Q==
X-Received: by 2002:ac8:538d:0:b0:4e6:ee34:2f0d with SMTP id d75a77b69052e-4e6ee342fccmr75784741cf.76.1760016990084;
        Thu, 09 Oct 2025 06:36:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac02026sm1060639e87.20.2025.10.09.06.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:36:28 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:36:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: leqi <le.qi@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add QCS615 compatible for
Message-ID: <6g6axenrh3bqli4epwmckzuhxrbji7c7kl3deedag2ur6ojubb@6cxo3nvtfuo5>
References: <20251009023341.27277-1-le.qi@oss.qualcomm.com>
 <20251009023341.27277-3-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009023341.27277-3-le.qi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0v2MlxLPoA6F
 YMR1aMT+eCsrQ2aFcYzT4XSdMjqkvr5pyi55gZdg+KafH/FILgLajAMAs8vdo3Ku+CCyKravgB0
 7wju2jK+9F0AUAZyUXpFeuizwHPHDIS+rvP2UCojYe9Oqvz/LJHisukgCtFywlkWIRGujLzrAFR
 dYP4WX2gzMNrdimy+1KFYrX10nMTQisZiaL0p93gFqUuVBg2Q4w7J07EtN1V4daQvkgJpvTH40l
 TT3WmkhiAVd34tGhYJBHyHZY3OFFRa3tH8YZEFIv0W3ns9lEanByJsVY1VbN3z3w6URGX/9yW36
 DQp5XYa9w+1abpuYur/rxNWhsYCFeycA1/gvX5hfMe4uHm6vkLrvI1KqUJg5BGWX6koHQu05EPv
 zjibCdMYbIsdGPmNPUFToSvD9bPB+w==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e7ba60 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=ZMBecpqfj0tL_UAVglwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ozoWvVV1aMSxkgcPRkd5OpflH_svUXkl
X-Proofpoint-ORIG-GUID: ozoWvVV1aMSxkgcPRkd5OpflH_svUXkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 10:33:41AM +0800, leqi wrote:
> Add QCS615 compatible string to the sc8280xp sound card driver
> to enable sound card support on QCS615-based boards.
> 
> Signed-off-by: leqi <le.qi@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 3cf71cb1766e..1780397e68d4 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -192,6 +192,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
> +	{.compatible = "qcom,qcs615-sndcard", "qcs615"},

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
>  	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
>  	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

