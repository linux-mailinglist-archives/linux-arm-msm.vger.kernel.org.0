Return-Path: <linux-arm-msm+bounces-82150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B21FC658E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84F254EBF6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF173090E4;
	Mon, 17 Nov 2025 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7Z75D88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9R89chR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22287306B11
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400867; cv=none; b=GkHj9y/fGo421QNHWS1wvOj1Ofw8Co5gdSw5Rqmy/DSzbBZnr3sgXXKSUtFeZ6aaesN2mrYgtftjV1lZkjHWHYhxoV2g9GnYTEu8z+85BEpJJnMPDyrSbiu9WgPALGOHbAmo8PmYkyw65JgzjoEN7XpQVgaV8V98YzMqjExUbJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400867; c=relaxed/simple;
	bh=gVUY0Xv5dUtiyWTE8tWxGtpdbyrjF4RoiY4TGiauS94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFvVMRmkAejd3Q4YeZbCnGZz7RGC9vtBMO4cbE6bsAl/jdaSj4X3WjA7OFES0ctUzlpJZXD83ttfaf7/ib0SzykLwR+E+5ZKIv9qoPhTnR0sckm1wR+f7excJEu9I/v5DBClYr68CgeO3FR9x+P7FatDZCjz7OD5hN9pGusHqc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7Z75D88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9R89chR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2qBe3671289
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqq0dUy1JpIIId8WEAccK+hBBemZQgH7944I/ceozwY=; b=J7Z75D88vwh/HyRS
	KWUZucf4RTTE5dLMZx/EOtLcA33NngwYnWdc7DOBNx82g2hrBYgnDUFuc1g4AIDs
	JYsNP50yUkxNugiibEn6UZ0ropVLNv7TZztocRTI/FRJgYNsBZjP/wC81lUYuB6z
	qkkH7S7p0Tm8EO+XANL0XKGgaCsNlmwcw8A9pepdWO7P1lOg3aoQqQVhwztzLLFs
	XtBZshgogkylIt5+xQY4hIgk6s2FeUrQxijDRH7nKxgFSqbjzgVUJIfQmK0n0eAO
	yl8mt1VXlkH/gVlDnzX84WK/pRKpihk9A9Z0lTxi8VbRSc0eZz08qb/rVuqaZ5Nb
	Ifq2lQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g594ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:34:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede679393aso147987911cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763400864; x=1764005664; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sqq0dUy1JpIIId8WEAccK+hBBemZQgH7944I/ceozwY=;
        b=G9R89chRycPekry/lOFIRaOARg91mXbVzi6tMwHSpz9e4BEC7KLhayHGZEKdtT7aH5
         hQ9ovcbnsiB4EyTjsBbfZUxTssxudG4rmUCsv70UACP8fG9RB8v+OgdgFpvzHnb8fjPz
         FUPpyS8O8hK3dWsckWrGwBiFLvfuutnN0lV/cpTM+jICLfgufqZXukR3/0uQkAil2vNj
         MC2ppaAYpaSyu41hy95MMN4ciYDlgWTlwyoew9v/VQSSira72hRSpxIKlyOlQO1jqjC3
         U9qLnF4HPQxCKFlS3fWeKv9o/Okha+37tSOy2aQihHjIcaLS7idAMeW2oiHHHItHl+F7
         Fdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400864; x=1764005664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqq0dUy1JpIIId8WEAccK+hBBemZQgH7944I/ceozwY=;
        b=njM/mbvkqkbzV8m13zZYd2OCvY7bU2w9sw9SXN3V9Yut9BMWKzr03tYnfDqR5UmBgi
         JrhUebM/SyEAUB5SOJBWMzJGI7UmJbhow95O5MV/bgMrfqK9JX0fRDpuA0kRRGI00ybp
         sBCvtbXpwVk2BEu2o+yTKG74MMLfS3AEgtXvzDVlxO/xnk1mmQwsWOMnbzNoA8MG1XvF
         FvvPNqp3ddR4U6iRB4EZnWCtGaQnTOwPj4umvbIyfxXv3UFyi1O/UbMPV+kQYXte2J/o
         biZfW2dzyHu7QDqqnH/W4xMDyApJluAOKoSt9dDkengGwaDrAWmCPNMeZexC3Nvu8H8u
         ac9w==
X-Forwarded-Encrypted: i=1; AJvYcCWSbu23h18W3mNldU+O5nzj+a8n/Co/YT5HlkWFVGTsULvFYrSuQ+44t3Q1vYS9acnue2ikH2lWovLYhHZe@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDpu+BrmypQYdtdwQVPen26fePc4ZCMgv/boWDArL/b9Jh3Gc
	uNcBmM5DhCzgi1z5yefaeuBAJzOgygaSWPHQ2fzOib2Ow20lXziOEYNJwPL+JJiTJtDQDFBnfz8
	EN2IG1AeGL3HnjoHFfx17I5XWyZimT+Vx/KrjXkzvCsMDQ3SlcycOJCopp4+KbogbeZ7K
X-Gm-Gg: ASbGncvacxExVmVNOnvC1qklBSZqd86HxwWxzBcsnKcMPG7yBa+SyPy46DSr2vrcaWb
	/C3DqaHLcc4mtK9B8sK3FRRF1seV8cPY3ZRy2w37lMksY04dkrRX/aY6lAKd370v6nfC3knZbQv
	p568K0CKoypiXDrR8pOG1b/9jQy4wYXHAhDUhqGmjsybydc4Em5wzxsjCNLyCtVnSwKbqcRUE4x
	uBKJv2cDhn4Ppwtesd/SY/5hlY9ueRm8R7dzKpBw/NXtiOOjeb/WZIJgidGnTzwnB3VYdepfcm7
	EADujKwtYc5Hb7AfJa5gSqIlQPwmdrrP+hiJfwuCSwZc1S9rHJWn31+kyrnd73JUfpw+hl0ZuFS
	QvNhXIAIC4qjSH++/k2BBi2iLmPMVFR7adkrAMDqwmykEQUyow6wVMQm+oGu/H4/Y13y1L88L2A
	OZ7xmJPuopINSi
X-Received: by 2002:a05:622a:20d:b0:4ed:b1fe:f885 with SMTP id d75a77b69052e-4edf2054e17mr193400981cf.19.1763400864423;
        Mon, 17 Nov 2025 09:34:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDsGNXgDrM+YQjWMr3KW+uuwO7XHJLec9fyQW08isuv8jIzJNYLVDJ0mX7QQZbf6ZlUCdYaw==
X-Received: by 2002:a05:622a:20d:b0:4ed:b1fe:f885 with SMTP id d75a77b69052e-4edf2054e17mr193400371cf.19.1763400863952;
        Mon, 17 Nov 2025 09:34:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b7a67sm3257940e87.43.2025.11.17.09.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:34:23 -0800 (PST)
Date: Mon, 17 Nov 2025 19:34:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8937: add reset for display
 subsystem
Message-ID: <whgt46es3c7ceceoknpqlqmxvkplzlcxyksqf4do7lpcco2fbr@3o6apg4czkpm>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
 <20251117-mdss-resets-msm8917-msm8937-v2-4-a7e9bbdaac96@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-4-a7e9bbdaac96@mainlining.org>
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b5ca1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=4nVcwanjD9Et_E7zVfYA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: SDqJF4PFCtdbUR_htPsuMwXREH0iXXVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0OSBTYWx0ZWRfX1PVP86i1eDMU
 lEOrfM/n/obU3pkRN8OD4ZEIQTpwtoCMnYrqeVO+Thj837/AixysE9tn96vhzWy8HPmmPbdT86S
 28zmm9A1NpTvKy3wm9Nry5knZNC3FM+aNUB0NLvVwxH46lutGUhknsr+efmuiVVXyn5p/VZbI2x
 wA8qr6iYZbwX4R/INORFDoL5/0zR93GSNBKmRgOSUJHarox9ZO2j/zzkmrROGZ0mJuF6J0bIwJj
 SaEM0oRO+OPRUTs9FDakE/gnKgYpwAcbbydOAL6S6PmDHsYLPNZtl6db4ecJ1yfsr3WZ2naNn4J
 zMVepMR1nw5eyfNkOZ0RW6s/P33BMGhMG72Jvhu2rws7BBrrI5BjD8+5f845/8HRSKW97nKK6Ko
 AGtxm2CBln/jM1j+vk+Tt22ZEANbUw==
X-Proofpoint-ORIG-GUID: SDqJF4PFCtdbUR_htPsuMwXREH0iXXVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170149

On Mon, Nov 17, 2025 at 06:17:55PM +0100, Barnabás Czémán wrote:
> Add reset for display subsystem.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

