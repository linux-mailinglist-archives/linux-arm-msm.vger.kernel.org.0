Return-Path: <linux-arm-msm+bounces-54779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8E2A9405A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 01:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71EAB188E170
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 23:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949962550A4;
	Fri, 18 Apr 2025 23:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mE6nSEC5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1953C254AFC
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745019681; cv=none; b=p8WWny6CLdYsQoxIC19M4R///PK9BoOFEWY3Ple3hQDAO0prbgF5CRuk8GdG+yMl4ZLttTKBhpw9fo0fzqctc4jOAxoh0hZpsYBTaUyfuQTeHXk2F15u4DSXos7dN4AD76j9as08mG5z7w7ru0beiFCii4wE+gP0ayOrduBkeac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745019681; c=relaxed/simple;
	bh=6C0vozgC31EMiPaikNIk3gz1e5iKRvGvdRxBSvzVylA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=df9lOTKxupZm2S3gvgLESYKfjHkb9Fh8yXJj2wcu2tzeYkr+JlApf4L18IyyBHyL4B80IqbkbD/mLOZCSHgVeCiQuiNjlyS46n5CglsLSob/Ey/e935N9PsdyYAahHW1Chhaw8LiJqJuxRITAXgpbaxXnRsfF7LaJJAPvsVVgL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mE6nSEC5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IG064l013691
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGWkrsI6bbJMRZrZKPu35wIq
	Uji9PLOWunitcRgxc4M=; b=mE6nSEC5ujtcc8FOu5n1qH0jOhzQscWdH2jBNdcf
	dBGmsntq4ab3ANwzCQMSw+sJcfj1/Eszp0KMV2XuhNgLtQfspSyTtmL8vnonxxRX
	qcNQyq71t7PaiXw63ryZzQeCZZph6waGNHHBRacOsgXbxbZG4Vh+f4fA9f3ygl7Q
	ipDdffRxIZuAaz+ANEG1ED4+lyRvNsZV0pBidyxT5oftz2SAnRjoL4ABb51op8lX
	qG5GJUa0heBfNELFOdQy6zHIHlA/owE1KqQunjbcZYr7gwZG9mnyOqMBmJFoe58P
	goKIHEHmMKzJr1J1QuRaNfo1oo9eZF0FNJKPQFqePKp4pg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgju18y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:41:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f876bfe0so361933885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 16:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745019676; x=1745624476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGWkrsI6bbJMRZrZKPu35wIqUji9PLOWunitcRgxc4M=;
        b=BvKH8wsC9UJtK/uiLnE48r0iQ8fnvT/NfJyNcmnwzIA3FlgnIVIM0XWFYS5E3uzfXp
         6OB6PEQv9KUvMV1apO2Z1I13bR4B3QNuyTAjOMkXc5yt7pasHxQ7Vvfz5kK4on0hNNv3
         +V4jFIhZ/FJFGIfSu2v0LxD5Nmrk+SvxciudpebUvJttsoZHB5sTzxwDbizMHdLEjUX9
         Xbc0zKp+xXkbs+UAhCnTJfOdFhBIZa7cCIBe+PTRBX6ataJyQUNwhfACe7yMezGQQaxh
         fefh3YqgDHC6bMuQABs/VAc4SANVlmNHHVkAio5WUMaMnk1pwNPHlCBpKttM1/rXY4VS
         FlUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQl5CinGIIAxB5IOY8zPYU7Fz3u+kNPBU7Mqz0Itw027te0AhHPwJeIMbTmt6b/LzngHwCz/JkpXlRllGp@vger.kernel.org
X-Gm-Message-State: AOJu0YwVGt7JgsOqUa8MJYz3Y80bC4G3YUxHG71DFVF8D4zTDEJFd3/7
	ZTyl9UcljioTff2ZLv5OVhbyaD2uWi9NYWM2RQakla1xP5opLatrIr8vQpFm7h2s6dsGzUrq70V
	xni5m+7dP55WJ6XWHuk+WnOiznlXT4TnyJLLcvPkIgcYIMq523Y1gwHRWEbXkWl7C
X-Gm-Gg: ASbGncvcY1qBeRAWr78ipdW9pnlGOtoq4gXsTqlb0DAnuGbZFZOX/I4nK8oluNgu1p+
	DQVR6U6LWET0Je+79hQcgckynXkkl4XiLM33LeqClEjqAPsPRRN1x6LeYDTYXaJmQ9A+lnMGcDh
	1pi06Paus8ktYc88MUH+GkwFjT/er2Xvi3XD0S7ph0AAQ9565/2MkBsYWcRRJAhPwEflVwnMSQ9
	o+giES1Tg7VcKStLVN5ENNx3VvkelwU7kVukQIMa0OWhi4PCoaXug2FysEOq53fLcrpOa+UOkfK
	K4SDht1wFcyqQ8E262q44nb5fuoL3YeVP8Pqrdm9/TEE8P+NgE8SJvrYTXKaxWVLUcykKRnZCwU
	=
X-Received: by 2002:a05:620a:2887:b0:7c5:5d13:f188 with SMTP id af79cd13be357-7c927fb9062mr570341485a.26.1745019675895;
        Fri, 18 Apr 2025 16:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNEOqCTwH7E7vLdne7Oh6e7Mb+h93X+PhMq8Qo+whymIytCNczG+rD7jrHK6N9QiZxVSL+pA==
X-Received: by 2002:a05:620a:2887:b0:7c5:5d13:f188 with SMTP id af79cd13be357-7c927fb9062mr570338685a.26.1745019675504;
        Fri, 18 Apr 2025 16:41:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cf943sm305840e87.137.2025.04.18.16.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:41:14 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:41:12 +0300
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
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
Message-ID: <q6eqlq4ltz6nnnqrja3obpv35qjbuqjqqj25ekcl5wgd4yubeq@gw3n6r44g32d>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-5-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-fp5-dp-sound-v2-5-05d65f084b05@fairphone.com>
X-Proofpoint-GUID: pVFWO-2hzcMs3L6htF_5DHUsT6wJLj2q
X-Proofpoint-ORIG-GUID: pVFWO-2hzcMs3L6htF_5DHUsT6wJLj2q
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=6802e31c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=CXSf308d6hWwThVqTUoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180181

On Fri, Apr 18, 2025 at 03:13:46PM +0200, Luca Weiss wrote:
> Add the required nodes for sound playback via a connected external
> display (DisplayPort over USB-C).
> 
> In user space just the following route needs to be set (e.g. using
> ALSA UCM):
> 
>   amixer -c0 cset name='DISPLAY_PORT_RX Audio Mixer MultiMedia1' 1
> 
> Afterwards one can play audio on the MultiMedia1 sound device, e.g.:
> 
>   aplay -D plughw:0,0 test.wav
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

