Return-Path: <linux-arm-msm+bounces-54778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE1EA94054
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 01:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 270667B25C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 23:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9995D25484C;
	Fri, 18 Apr 2025 23:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8sCLnCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131920C037
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745019620; cv=none; b=GUAdzYFOvS/7izK7Q0kQO9WJG3wBajGO1U2pgtm0R1F1cNHZQbmL5QW7eQwk4KVOtBxX8c+W/feg0XDDod2u/Mjqiuj/IBJ0YFNBadIi9/GYVoksu7h7/k/dur3/VCekWkOLp6LcRFdAOTPt5Nn3SsMxvFjFQzPRI7HL+Z2LuCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745019620; c=relaxed/simple;
	bh=EuDY1IpPR1LcKu27fqwYJuFiqjEqc68Epq/PRA/md3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4BrNqk3V9wW4BQBlSvWfEx1yL2VxJETn0ow8p8qArtu1ch0dFhc7NuciSNB7QqsIwaGOibwMabfkixmLI+YLx3J+WdU8FUYJCMa0SEivBH+54qmGBN+7DehTME2rqUEDQ9Qf4QGJETRuWfiSF8tTqLJp+wrJ53JXH/gLKleIPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8sCLnCk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ILlqK5018274
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lm6rnQ0Vk4Y1vVeAc7d7uyLp
	55ebBlbOTcShD4fBUPo=; b=R8sCLnCkhQrZcGRr7Slvj81KwFNn5EHOJoUlC6yd
	r1fTQCqEeK7KeAbx+jGqVBcp3ISVJ6CmpVnrhTubg+ViPbytNtFLt4RF79CtMX38
	1lF6EQv9dp8k57Z+hXK8LkMdn1rCswzdwkB1goqG7+AtDCU8NxKWNVAuBQOMIRVY
	iaYyYUKSg3tlrxfvU4G3ZtKPlJdfb86G3DjMiAsjXH5Q7pxLmkAONHdtc5mYkEvm
	A9BES1iUaAc1lKVgO5kA586GiGGmZUDvJxdte9m/vwdE5430ub6yGl5oYrlEAGrv
	XHTEtVInF4mHy522VkF4h7MM8l/G0gj96D6IX+e1V2S6tw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjkd7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:40:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2c9e1f207so10963006d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 16:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745019617; x=1745624417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm6rnQ0Vk4Y1vVeAc7d7uyLp55ebBlbOTcShD4fBUPo=;
        b=ANxBg7odkWUrbnHBZ1IOPAJtGDhkKT+z24bq4w9ZYVaoNUPqfJWJG7YQRizx/lhFG8
         By2siqAupvZtjKDNQgzHP9pE6XOyIhplsswbHPvturQeUqItNbgrivAGmTu/1IQezeNK
         WLGq0QSMGZbEFIyPEjNJne1P3tZzFq4iaVRM12bj9QoGu84ulJJj6YXWob10ovE1QElY
         zoGjIiSETZuEnYv85ugn94ZJLMF1IBk7ZMpWS3ZE++VC/ndwPBY/JpIIG6rNXnd38e1h
         N+SJxRbniVWqUgO7bWoQ0RhXoiImMX8d7tfJbGE282vwSr4vfFMkwQAgYKS+1ubc59xz
         3A7A==
X-Forwarded-Encrypted: i=1; AJvYcCVboKkPLFG1NTt6iW/uHeu7mOM7Vkf11u8isOM4uCRXGr+g1GV+rxOEvAi/OF8oo1YMUPhrfgToqo/GhbZq@vger.kernel.org
X-Gm-Message-State: AOJu0YzBFCt4JuhBnCjRWwt5qDNODa4s3X1jSN8ciq7ds6hSNe/3KGr+
	0Jk/OXZTAHtuxh5eW0cU/98Q+e58OWnKNsRFov7PLH86R4c9OEeVRBBOfnSbfU3hKOma/Lo1NWe
	AO2c1/Hh70WOZeEmnqGb5LcPPmvF/5mNm3g5NfzHD1W8vNRUwrL5OHAes75sJ5MEK
X-Gm-Gg: ASbGnctBAQQJ+xKMaZENWZXh+YLAlCYFAUugF7z2v8/bx5bDmeH4lxNnkdWjbFV2JUa
	PcFoAZjKV9TnHRwBEpvvpwfMN2K4tz9Yya7km8D7GGJ9mKq0EExjy+nCkrEipnnXntR8aaCO5wE
	u02zUm3y6e9KJuHCYsWIxZocoheS7R0SPhNsD6oc7wQYCwDV2xMjUzQ+DoNrOQl3WNn9x8jcHaX
	ttpSUCs4iIrmcsyExVXGPB5AQcUJ/2T6yDKOpK6FE2FCeY/bzU3aWzd/VwsFUm8a1zJrMuZndk9
	8J8sKJDSRF93lEqhQ+QwULjsLgpTy2+9ZH9dGy3VAGq72WImOaG9Dy0R3pSQpi9Xhl3W6Ylo21g
	=
X-Received: by 2002:a05:6214:21ef:b0:6e4:3ddc:5d33 with SMTP id 6a1803df08f44-6f2c453833cmr70675886d6.13.1745019617304;
        Fri, 18 Apr 2025 16:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEptrizXDpGIInsxXlsRaw2C67eYnfSjGJd5jrhvlihf9BInUzyR1taScSxhCfM1bAd3UKK7A==
X-Received: by 2002:a05:6214:21ef:b0:6e4:3ddc:5d33 with SMTP id 6a1803df08f44-6f2c453833cmr70675676d6.13.1745019616973;
        Fri, 18 Apr 2025 16:40:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075e3d8sm3500411fa.15.2025.04.18.16.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:40:16 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:40:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
Message-ID: <thq45vas3rbbwvnwijlhn3bbi4e3wbdoixybwoyactm5yqkwnh@qgpxuj5xytr4>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6802e2e2 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=UbG2kAVU3ctyu_xrxRgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: iCDWr1b0rc5Gra3Tqaqdn2rhEQ5wK33x
X-Proofpoint-ORIG-GUID: iCDWr1b0rc5Gra3Tqaqdn2rhEQ5wK33x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=880
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180180

On Fri, Apr 18, 2025 at 03:13:45PM +0200, Luca Weiss wrote:
> Add a compatible for the QCM6490-based Fairphone 5 which can use this
> machine driver.
> 
> As a note, QCM6490 RB3 board is using audioreach architecture while
> Fairphone 5 uses pre-audioreach.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

