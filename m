Return-Path: <linux-arm-msm+bounces-59208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BCAC214F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72569E8478
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2393F229B0F;
	Fri, 23 May 2025 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blRBdVfd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A78A222596
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997014; cv=none; b=cRwHOjc/Yl0uYRsZkdReN2nNWhu4nZ1D3xEe86R8ftTeNLxdYOXAcloCcUKXYuhQcXB9IF4fRPTnQOiORG3TEDp6LRyeE7Dm5BHYPw8cOuyl7rIjRk7ipkdyPg+H9xXcnaeWWXxgYCciqOJrVRqbWHUw4Lmrs9CdykHj/pTh2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997014; c=relaxed/simple;
	bh=ZiDp3mO3sMfo9g1+QqK7V6IccxK5oqxhhCjDFpYu+yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joAOaCQARI47gtgs6PwXCzyjxBn+ppXdKU6NPDgIVZtYGf65TX3FB2mbuTB7QPV44Vao2cSzWIdTGTKrrOKiN+KwndhDfZj1jkHYITgU24/xxb+ziBCo1K8KsMOLPhPmRC5q642NoeomKZsPsqeBWLZR/b4qASV28QYQyJlomuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blRBdVfd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N9cMnq021878
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iEMzP+5FE+zKvD/hVaBar5L9
	380xOk0G1VKx9PKO9B8=; b=blRBdVfdPhndERA5iEFRLF2aB2HeRYBY1FGHpQfb
	ADrRlAB2Cuh7xp+n1SUczNsMGbLv6t/tw/w0+Tk62cJxKt9ijqbn8mXjuL/tCG3n
	3t384YoMBXTticbN4rB06KsqLmx4DY40AwFocC5PuGpP3EwvMiZV4g0BnLh8OZsq
	ti462CQ04oBvuJoWsgF0qwwaAAJ3rGlQA5WOWB46kEmV88ypZ8tlwtYZip9PukIQ
	rGw6EordPJdHU3y1kwzYoEeLaONJaH5RtEBBwrKOP5LC/p+k37Wdhl3U12J+9aYv
	UncboCN281sd4qH/YhfqlmqpH2RSfOP+XClEkOCDYstEaQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb9kbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:43:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e703so1520785785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 03:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997011; x=1748601811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEMzP+5FE+zKvD/hVaBar5L9380xOk0G1VKx9PKO9B8=;
        b=tA0RomZSjcKouUVYDWKLynH0q7SjsOpB+bQhwWsPF6OTs8Hbu7Vt3lQ02Q3KLQsNuA
         Anql0T6+8F2pIX3fMQFsEwfZphDQubP08IIWzZi2MFRjNbEGZQoK3YIW8EmlrNl7ZXR6
         0LSkObMe2iifYRSPDK8sNf7d79I7NiRfg0kRx4294kUadhl/PAz/zeUV0OTMQxNvfeg4
         abwoUuttrD9tjc8Bafh5eZ+FuIMPm2LNr6Hf1i7DhhRUmTJOS1uMjex99KSvVRrGnK+s
         nwQi05hhLfB3EIqJFgY9UdaXHR9Yf8CB2TEfN8CrOu2DlrNrA7/W2B6R4Hk5odQdc1my
         YAUg==
X-Forwarded-Encrypted: i=1; AJvYcCWh1nbtKfy4LCWQMowTw+WszxLrnsl1w2wrrRgFDFFEdLdgA9PCOIC8E9diVIW9zZNpBv/cV8PUONU/BUHo@vger.kernel.org
X-Gm-Message-State: AOJu0YwhMvdP8DI9QqD7W96hwD+sxZlWLLIJ15aaavmUWygLIfIzm0Mm
	t0J3nFLp0fUaHQhy+d2UcOEkZyzuk6b97aCAbriFSlLgVPNqRZ7JoD4FhxKv734YjRlawLWLH//
	VlRLNimeCd4WCax7+xewRaZQazJvx3RVt38PiNyLmT2wLlyIA9VbMgMqyTdAu6di+Cdtc
X-Gm-Gg: ASbGncveWTESI95rGM7m7+ONNLB5pTU8GA4pWlSzGo56LIGX8lD385tpm5FjaQbN9Cc
	HJvjjGgvyZvKPPJogUd7gdAYYvMIgLEBvnEy4vvl2PuC2OaOiaHGSQXjyMC8uc27p8ee+v1HdF9
	JhMS4e0EBd4ATqORvCtS64CFq7U8jCnBbhyKrbZ5+KXscow6ZWl8N8vgcLQDzXZ8u7a3SDvFvRE
	w6sVwQCZhcmXGf0XWERyCtpgmaRhLIp9HlMhMu/ym7cdPXph6KXEVk3HIcvAJCC5klQ92vGCbve
	5hsvZOg6NMjezlWk8JL7TULx9JIIBbONJbirX9exXlVQMdn2CaqHXq8mbwZNHMTRLbTl6lhsi2o
	=
X-Received: by 2002:a05:6214:ca2:b0:6e8:f464:c9a9 with SMTP id 6a1803df08f44-6f8b2cc7d70mr442359076d6.2.1747997010825;
        Fri, 23 May 2025 03:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwxUzBuSM7MlJkdoDJAusHv/lJtCwWU0NIU+aqlho6PFa3OqprXhTnIwm14NKC4PymbSBonw==
X-Received: by 2002:a05:6214:ca2:b0:6e8:f464:c9a9 with SMTP id 6a1803df08f44-6f8b2cc7d70mr442358656d6.2.1747997010497;
        Fri, 23 May 2025 03:43:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f1624esm3802842e87.17.2025.05.23.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:43:29 -0700 (PDT)
Date: Fri, 23 May 2025 13:43:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add missing pins
Message-ID: <et7we4wunzwj2c5zg6mynpgetd5vr57elujsczbsjwkviaqrlo@op7z42vpsaq6>
References: <20250523101437.59092-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523101437.59092-1-wojciech.slenska@gmail.com>
X-Proofpoint-ORIG-GUID: nJQ6i68MF9IiQKyv7ad2j_Jfot5gn5y2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NSBTYWx0ZWRfXzGanYP+ElBoS
 bYPJ+WT2gGotBSxRENGHI5NyIyMMKb8ulfgRtaaNYCDmVjmFl4nBt2/xZkxlPDbXg8i3DWlsbRc
 6jeLy5Zt0t36QXm0AV3VGBEHDHzvaBbV+FqtYeeC+WYzoH6Qd2kbHx8kjcqEECX7SSLsdNejKsh
 8PC0gJ2vPqELAWklS4XnRlr3w/m0V5vBTuRswunZlND/VruOdN36+TyGZsWCpL/nVuoSsB+4WqG
 gBiCnJl2D0KvJ/nM3+6bLpLizrL+3cM08UEFtZ3Uw58MOT/dTjN529xGzghVRE4HxgDgqSrzpdi
 h5he/Nxw7benhlPjlG86xYWsmM4xkjhNEauCNFVeHb6+8s7UlRVvo1xdHn/b4LwPn5qfQxAyc9M
 Pa68s5Tmwxe+XzbOLBTl/gbSpVTROrfg+h8tGKBwa9EttLxz7TMujXw6bVML8d+AvUROddJA
X-Proofpoint-GUID: nJQ6i68MF9IiQKyv7ad2j_Jfot5gn5y2
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=68305153 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3Wf6-wXKAYLzd_tvBgsA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=866 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230095

On Fri, May 23, 2025 at 12:14:37PM +0200, Wojciech Slenska wrote:
> Added the missing pins to the qcm2290_pins table.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-qcm2290.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Fixes: 48e049ef1238 ("pinctrl: qcom: Add QCM2290 pinctrl driver")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

