Return-Path: <linux-arm-msm+bounces-72897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD82B50C6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 05:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C19534670D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 03:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D667426C393;
	Wed, 10 Sep 2025 03:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvutWUmn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FA32690F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 03:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757476172; cv=none; b=JqjsPMs4mTU/KZNHNGrKgMa7/3gDE4/akbc9S4o7xP4lGSl5UTtWLa543SN1OwcYimq/7DOgMqqq5evvJKyaxkzHPRK//34nzBGn1bhPIhM2ygOVhzfKP7v86J/9F5ulNycQkk1x55mOE/TK4Nxkd61iOacvRuXI8OrDQSRbKLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757476172; c=relaxed/simple;
	bh=YBv0CW4QbT5Ix1E4QULXQ9Bl3KYGoXwI2sr7c1YlKVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClRkoNbb3Gja+AYw4WymVjze2ez+qVEKIlbAu4WFTLES13pnUO+AiXRyNnm+PHH8WxLTWlcem5CM6WmhNJ3EUizD4bRbw8wg5SwyiUSwlSiMKSGxob9C48ANHkHPw+p4IkreHnOKFMRaqCHNhL5NlzK02seYWUVo3EXZx0rSPUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvutWUmn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HQtgB020099
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 03:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jc+OrgV18zTR9+MeCEMWVPIQ
	oOTOsoNv5lyc0iyheDY=; b=RvutWUmnXniH9YLZ3AMy+wjZNJeA5TybiCsnfyqO
	utT5tGiXxakyy4B0AftdGXKCZ+cXNRIq4VnMaS1uDCvAv8gfP6F8ao05NhFVyR5W
	cMixFSnKAsgrEj+4bbi/d1Uf5OnBI5gQWdyDwJf7p1mcStBjTgyaKRfRFhklpAJ9
	iOTNusScYYLpaEYchbjyNXKqU91e57IuaI+yxZa6WAtRy51Rq+zO7BB7u83arObu
	63/ZljKeu+fcXJxX3RTVE6akCl2Wlc5G04VUKFcqNwgcIQW0gcvLgB9T/M0ljCI2
	pw0cBUoIKh6YTfpeaLFjJ7QQNoN/NlpQ27uFozQjsXHjfA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc26h6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 03:49:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-726aec6cf9fso208495336d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 20:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757476168; x=1758080968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jc+OrgV18zTR9+MeCEMWVPIQoOTOsoNv5lyc0iyheDY=;
        b=lmCHQmGe8IqiX0YmMgmECFJnkUTZTlpPaUaDkt4P4ucjHSyBgdAwuhuX5Dbw2rtbXn
         ZBDXz/NA9DzTnNjTh0W3Nk2V23sRe1j4LlHN7xtUofpM+8eJGFrypWAgKPypM3y7A8EP
         WErcSVwdQ9WmEXvfl/m4MdUkUscqV2PTbThoF6CsfuUX9MEabCy8r7p1QTn7+hSPeQvV
         ZolDqqxQfvfqrejAz7k5x8enerC3Arwx4aQlvHAUq00gcw0CQ4PdSOfaGWgGEfk9/NgQ
         vVIQylfApS+f4rb515Fehi1jLR8A1ku064VG4VO9BaunziCm7egffPE03jKmmrhwiGpD
         IlCw==
X-Gm-Message-State: AOJu0YxD17ziB4DeviiwvSeSWpMeLCXMckEfD2Hd5XIBMOrrfADWWKaJ
	gHpNtqVoiVIynwpbHLOmns8FKTO8J+vkqniCAUqOuLQMKSm7T1veaOjLSQXtuV3MsRTC68xtS0R
	W3aAyWh+ShHAIrNK+i09rlSR2oywML7jPYgqLV3Z9IWhWMovkPsNYh/t5n1boPAYQTl+m
X-Gm-Gg: ASbGnctaP/chX9rNIOXuu3vB/zcWeMvQI2LuET8zA0EmGeMt2AyDZV0bcvikXu1oGPH
	uyU3IdOICWpocDx2n3FylPzL1BQXQEbiAI2DbxNACHhiZAw/C8yebcKCPH9aLW5MkJlHhawgufb
	7perpKMFYSmw5zpPVgbsZzUkRDpPBFZ+fReMYwOxBz6NpavzM18z12SorSurVfbw3QE+sr/Vsgz
	xsbATFOWCcz0UzxjhOpHts7G0s2AUPKI1FDZlPQRlqIXaCNapBfcuGBxeLIygi2JEJioUkSxYZB
	W80LaqFbL0Zy4SvTUvahi6jf6cq7AgALkQqRNAbGaZEN6azjpSbdw8eC+fE2g6IDvseS66f33RJ
	QZDUW5IFOs1WpxBXFnZu7YLbHh91s4m2FJ6h176AZCROlaNFhNXVl
X-Received: by 2002:a05:6214:cc4:b0:715:94ad:6acb with SMTP id 6a1803df08f44-7393ca9ac9emr142266036d6.42.1757476168192;
        Tue, 09 Sep 2025 20:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE41GdM3QXQSMAuSTL1V5Hrzte1YNWgWub/X0ZUvpjvQT3VvLXj5jdJKN9BtiAgDBHFRBXV+A==
X-Received: by 2002:a05:6214:cc4:b0:715:94ad:6acb with SMTP id 6a1803df08f44-7393ca9ac9emr142265846d6.42.1757476167740;
        Tue, 09 Sep 2025 20:49:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5032caasm44137561fa.35.2025.09.09.20.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 20:49:25 -0700 (PDT)
Date: Wed, 10 Sep 2025 06:49:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] remoteproc: qcom_q6v5_mss: support loading MBN file
 on msm8974
Message-ID: <ksnxdmxdxe2o3yffvpsxoyzqbqqsstiwkzudwxxv5nrd7ezkyp@7t67vswmkxu4>
References: <20250706-msm8974-fix-mss-v4-1-630907dbd898@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706-msm8974-fix-mss-v4-1-630907dbd898@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c0f549 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=OCLVXrEKwRfTRf4533IA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: teVf356W-MqjazCeo2xWwJyXFDUdxESY
X-Proofpoint-GUID: teVf356W-MqjazCeo2xWwJyXFDUdxESY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX5vI3CgZDAOT1
 mPv/1GxpDuQ+P6TPuRdp+33mg1DDeCq0gtcedN0zjV2Mmn6lGj7DluRsfDL5qkt15MnnyMoxqNA
 ACps1SsHd/JJZWxAknV+1ziJu+LtyAoi1XpygFpg7RR893yHDtOi4D50yRPJQZCUvT0NheDNfXn
 QkgFTlCFBoSdYLNovgtNun4u+4rMBGzK2pT77ul/B2YM7IAQbmXQvq6wj2GB7GsArx3BBREBWjs
 kSmdIhBI0NLf5/2Dlq4/Q2UZOrgqGDJVOCjEBnuo9+ESOHH2cbOR9ABaNDZ4XQTrNsyq/PGvmu2
 eTyYmsCa8K+XqCNtMcYmSCJyKYUR3Ameh/h/3ZimQfvlfewB8IeN/3b8LLFlLKT3xYO2woDFRCK
 fh84MO6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On Sun, Jul 06, 2025 at 05:47:08PM +0300, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> On MSM8974 / APQ8074, MSM8226 and MSM8926 the MSS requires loading raw
> MBA image instead of the ELF file. Skip the ELF headers if mba.mbn was
> specified as the firmware image.
> 
> Fixes: a5a4e02d083d ("remoteproc: qcom: Add support for parsing fw dt bindings")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v4:
> - Expanded to cover MSM8226 and MSM8926.
> - Link to v3: https://lore.kernel.org/r/20250706-msm8974-fix-mss-v3-1-8b5ae61c86a9@oss.qualcomm.com
> 
> Changes in v3:
> - Reverted back to the simple patch from v1
> - Added define for 0x1000 (Konrad)
> - Added MBA firmware size check
> - Corrected the Fixes tag to point to the commit adding firmware-name
>   support
> - Link to v2: https://lore.kernel.org/r/20230508153524.2371795-1-dmitry.baryshkov@linaro.org
> 
> Changes in v2:
> - Replace fixed offset 0x1000 with the value obtained from ELF headers
> - Implement ELF validity checks
> - Link to v1: https://lore.kernel.org/r/20230507172041.2320279-1-dmitry.baryshkov@linaro.org
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
And gracious ping...

-- 
With best wishes
Dmitry

