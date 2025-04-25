Return-Path: <linux-arm-msm+bounces-55720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9740A9D0C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F4319E3F12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED14219A8B;
	Fri, 25 Apr 2025 18:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouUzIaty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F62B219315
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607005; cv=none; b=gfUnYNX/VwNZBxkombCYiB/1FxG0sv11e09ULc3IFo2ND0u+Ku6w+apuKJOJdUW6K+MARv/SPFTi6gqyScGyVKwXGgfdqXIA/o4++vvOiDNjlPyeD4FLUkNaDM0UC7vfLLlpvi65hSWjaukAIu6zPRY7UjdVRnKPp3nlbuVQodY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607005; c=relaxed/simple;
	bh=XoX+wEa5HhC3hR5v5Q5gpL5U4kgU7elVA8+JOzu30iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvnLIkk24lDN1A8zanMoBO1CEO+6lTuQ6Nf0HEirWU6YFARfH0VxqMlq1Tjlphs9jDEQ/wKIyU9Lq+e5BLGxTXfpdwOmUOuhlU/hW3kqnfkif6YArouEv/0YcB1GKEgRPv5fcqOC3WZ1ba8Wt8Cde8DVxBB/hqIJ4uar+lLAeX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouUzIaty; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqi7003979
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5UZacNDBLmuE/Heewz5Xsv2C
	HRXYOHYVhtQqphnjYro=; b=ouUzIatypmp0mRtlrGmCYrQ8qyI9f6n75zu2bnPr
	khZraYBacLCAhE6QCJM0u74MEGkz0jO0Q7an2a0sbYb1DaP39NVU0ppg7FjUGx+J
	m5yOxqlhja3PzeQkM1cS/00MdWVZBLFE3M8Y4mXLRSVQB36c1alTfeUvFrsw9IX9
	Zv5+ndF7FNIyqJAcbzh6iH9iNFYDtB6a3BHlBeAHCneYUpGZp2i1yezrp61UlMFB
	w/0G5XLcAGMd1wh08/951vOSYDOZfK1poXmnMD+e/XVd5bWLEQLklqgfg3UIRPwL
	RVUmc2meY4NxYoHM9dnTf3vld6NBLKFljAqy60BIxEXwZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2a3dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:50:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so424299385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607002; x=1746211802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UZacNDBLmuE/Heewz5Xsv2CHRXYOHYVhtQqphnjYro=;
        b=fUWPETFXJ59N92Lssg6YFU6HKl0UCcujEhhZnZdGTgviAz7jr98/XT42NXXYIDPbn9
         G+rarzRZ6fNLp3Sbsh/sUrBwacz20V4o6aGGBPyJAWnrc1pOJwnbBCubnusHSyzNbjX9
         QIWFSk8IbAUudlGBtT2XfuOQrwCk+4y0OxuLGjOnB9ufm+1W5Y4zeAnJUyqfilBmkcL7
         3RWIKmb4y6GpDaFFt5QvXmX2Vf/bgytN0ghZzlbBAJ2wA3r7abTfOevFbaBOajMtGUDQ
         /Ki4oaJVzRJYZAqFbxYA+qjf/bM2q8UAZ5kqHzhu1xuU48DHXXjdGfFqORq3P7Ubg1sO
         UL5A==
X-Forwarded-Encrypted: i=1; AJvYcCV/fZPnGYK3+Cl+LITNG1yNBgFT9Eg+9tLRigeYfRoos6hFiYtVO6XIdX3vdZP5hD3+llHNyX0Qult41MQo@vger.kernel.org
X-Gm-Message-State: AOJu0YxpNCF4ZMmHaYJO7u9tkC621vwjja0sGq+N12yc6C5DGojxGMVJ
	kCYwJF6iPkEfZKXV9QEQLd7HT5nND5Z+jTlXk9uVjYv5/8/g6cMPRtuaZ/HWMnKVZZwKVta9LED
	RL8TY6g0eNDucxKFNDRt3gnD9FDNKaz8B+/9vmYI8VijNQ+0y50cHjHMpvHvT0SEX
X-Gm-Gg: ASbGnculRBmf7M16Cv+qwLdMOfB1vxjmGyKqbssf6jo4uEO7KK3sBoOhPyhVjL6GT39
	TgO/XX/d6p9PeNohsDsepNFEwesUZ7H7Yt0m/sfpZE1J3YXIQOL2NuWiR69Y0vu4+3UQxGZ05JB
	rYlhkBtNfnGSURIgMUI5wYkipNC8Z25A8w8X/YqcIVo5AAewuayFeAN6waM6XKmsyqZAUmzZ/+Q
	aMMdm1E2IqeeMqJI9htD5lGKzlogvTmYoo9unT331LPswPJwXeW2fu9yWQI9N9CzbNwXHB5Y5tP
	cbKJ1pcy3vmYgiD6krhtimXtUwdIMxxY4Wp/iS+V7CcE7BKxqn6QBlIlcsI77wM76Q85EaGZ6FI
	=
X-Received: by 2002:a05:620a:1722:b0:7c5:a435:7867 with SMTP id af79cd13be357-7c96079406cmr478380185a.45.1745607002358;
        Fri, 25 Apr 2025 11:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKGFKhgTNVIChoyaUoWx/RSIrv5FxjCevn0K+xqfxGKoAvvW3lf0EQM4tiPmcCVL9Ey+Vj2A==
X-Received: by 2002:a05:620a:1722:b0:7c5:a435:7867 with SMTP id af79cd13be357-7c96079406cmr478376285a.45.1745607002037;
        Fri, 25 Apr 2025 11:50:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d0019716sm8540161fa.48.2025.04.25.11.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:50:01 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:49:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sc7280: Use q6asm defines for reg
Message-ID: <c6brmbdqfp4kr4unp2vici4klzocwnpawxdl2m6g3farzgdlvf@2w6kd43oa7sh>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-7-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-7-28308e2ce7d4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bd95b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 0N583WPhD8TdIZUGVIkojYExSXIDOwQG
X-Proofpoint-ORIG-GUID: 0N583WPhD8TdIZUGVIkojYExSXIDOwQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX0wpuzC0NdttR Wixg0GMEUmZWkQEPR8sLQLdCWBkt9e1QK/zErtvFVqwzLQbb17ufTV/aWE1xO/fRp3OicxkzqCY gobiMA+jxDg3EaqK6j+gH169ZccCFuXPDVVnho+RsvS5UC7QT6SiyM38PUT1kC77jev5q0/cGOD
 zfCiHi855hZLx0jJsNSEXgTsH8hPeK+LR/mL955qLPYajmvLtqTNrmJofWUU+Sqdxpl8VT4fBM1 q92n1htHo5tXyaiPOPmAj9oCZYyojrlgjWr6f6/mGJcV4ugvGAYbrnRwNzayaOMlC0bVH3ACm6+ 4GMZF1SepAxLtuXJYtn2ZhOvzTsZQbsyuV8Y58gM+No3k8yfERiV17AZV5/h+ftdGKVAkd9fc7d
 TXcuT7/JxG78Nt1hJTvuG2CK8o46d0PR3TQuiEyvGYe5HXvcrLi7/9FxOrwyVgYZs38qKh6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=621
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:46PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

