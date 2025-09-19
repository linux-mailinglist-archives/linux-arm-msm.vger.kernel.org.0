Return-Path: <linux-arm-msm+bounces-74245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760ECB8AF98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2085B3B73E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E5026657B;
	Fri, 19 Sep 2025 18:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ocbb0xK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52523FC4C
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758307747; cv=none; b=DkS24Tyd0teQo+Z6JkeS+vtDf+PNLoPVW1bI1uuI3Bls+9zCk9h02d5ZVbvjU7YSjSg4kzCEXrfQBzlqY2UAWrSDHuYe3ZxvTk+g9WrMVfXbj20ZN7FAQ07sQrSmNkdR0gbKaDeatxpOvjdCphXyfZEemNdJO1kONhMEwhuuo70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758307747; c=relaxed/simple;
	bh=tDpff8O9qf1+POqcMf7/vsOvLzgZ1HmZhTtn5x1unOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNWHjaJPS9+epyTclqGTKH75lhvhL739sGGVGvtRHXeoutuZ3Eov6ouqGIMj+5gKt+ybQdOiP+lqfwqoYC3IBM8ggLDxraUCHk/0H84APyz2+sZ+TVpGWcBJO3vn424mc4wNNMmlnxL5uqi+2LIAvonpj0R/BViyeFOXuw2s6W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ocbb0xK4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JF9PbA029494
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1xZa8NKZpDGoqnGXensXWLoa
	+hUVxbdOY1y1b66zJ+E=; b=Ocbb0xK4Ljujs9Rpfrf+140ehslrxIZaeV5ZsHXA
	sdEMwZoFTfb1Ql+BuaLOuDI/yc//8QfcddWVzrrz6XZzs5l52mLhX6M6HOZMh/dl
	/AoK4LDROWC8q2OdtxEBsFupe2CEPy+PAG6UOj3XCgBK3t8TlA4VIxHHIe4xuPbK
	wyy/EkBWHD1qo++duSE1fcHFjLQHzgsV9sQYLrzRdsnq4W7R+rnHpU9/2mg1muZT
	TzuoUhs8Xc6phG3Ve2179+Kh+lSmOFF2hLYBUmnUEtTIWt3KAygpVBwq43chfh3Y
	XsIAAwZTWzD5NTg8AKs/WIDXuyPAiS9QOzRg2awX+Eg6iA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy13g3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:49:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-829080582b4so449525685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 11:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758307743; x=1758912543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xZa8NKZpDGoqnGXensXWLoa+hUVxbdOY1y1b66zJ+E=;
        b=JpZ+pE4eJaoqvbLw+ITaWlOmBfjg50jbPCoFjIUQ1vPuBmTMkX9EmeI0fzRhJC7CS2
         RonWyB/JKbrXzx9y/pR2IwPXxP8OoCApcSK0JxmifXr7NRXe9XKb4+PisyAz8JI1oV1o
         VG16ObNgpdcEHayx+Mk9Xm7yrwTrzmHaJFvlIDSnmlyYpRZk47/p2zvWJq8a5AH3vqRp
         099FjhW+48lmuV+jRapG3BaJIKcuYEPojgp3cNBtdgMsxBIDT+cySqbhy7VYa191RI3N
         /cAthI9HfmIrE3BJcGcGC/kk5kW8Wt+OTwccZmy50+jgaRrjH1NFtJI4ms6/sZKlcKOb
         85pA==
X-Forwarded-Encrypted: i=1; AJvYcCUdbGO/fFdHbewNfl6dIuYYCUCeLI48W0Pyet22+oY0OZQ1VDaurkMD4skl+eN6OqXjrRrMOvZCDTJZw2yT@vger.kernel.org
X-Gm-Message-State: AOJu0YxzNqmlENZfBK48nsABzNSifeW+aG8cyOSzZSIEnYvKgJuX0gEz
	gGcfgBxDV1K1iNqUkOg2qLjWraMpVhJkpO2uAeZkzfKzroqI/70pHUHagziLXkHd8xohliREH1/
	BPA4GnH1DSg8GyCMZuEXLHXF3LOsp5H+Rg4/3DelKQuxeYZqLlg8NDz1Fd/+ucPu0Omc0
X-Gm-Gg: ASbGncvID9Abjndhp3wJvna4YxyVnbliU4oAX/od3041zBF4MMTLHi1ipDdt+Ug12wS
	UYJkeoxXGKWO07lFXIEYpc1ev9yIgoWBf+XBodULUK7iwpyA8kqCFHn4NgSOuJatuYRo7hgEkOz
	Qd43IBu06tkIGVNjVH/5cAAf7PTV4ma6yrjUogAMWbv9HIPBgBuOGKqIUeNEE3nUY4/7uvi0mIG
	VcABlv3brFr2nNgdG03JRkGFVsSSFMsZqOabVjfks7JiRbGQ0a9rTsDak05PvcoeliPG9/IqeUN
	1ydcaViQuDdO6/bKkXj9iQsC2zfU0P/waNAIbl84E76YU3umKms05pXzzYKetENZeVd4mp1RRDM
	kz9529g/AfkQI6vxSBS1pow4ihRx9fqUfyJa3o8XE+VopB1h6DixL
X-Received: by 2002:a05:622a:551a:b0:4b5:dd8c:1d3 with SMTP id d75a77b69052e-4c073d929f7mr60166611cf.77.1758307743329;
        Fri, 19 Sep 2025 11:49:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd704pWx6mR4liYWHfvStigqH2zSqR9FouEegfxS0MAneRfE6nX5yLKo0d8lSjuQhI5Fty2w==
X-Received: by 2002:a05:622a:551a:b0:4b5:dd8c:1d3 with SMTP id d75a77b69052e-4c073d929f7mr60166031cf.77.1758307742681;
        Fri, 19 Sep 2025 11:49:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9e1d901sm1499917e87.135.2025.09.19.11.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:49:01 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:48:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
Message-ID: <zjegjucwluzzh2x56mn7dpk4ocmbdrhyvubkxprpiuko5cifvv@ygvbal3vpssv>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-7-eae6681f4002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-7-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7M3i0lhJJeFg1BlfYL6R0rg83XaBjS_T
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cda5a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0ERirU_vq5G6WO8xEvsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7M3i0lhJJeFg1BlfYL6R0rg83XaBjS_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXy9d4WqREzUvm
 jaGLhjkULfXZKFrXbaUAvGtqMTeJRZF+Mwza8tQf7zuhF5zizigdDWdvdUvHr7/dqrSfXB1Ho8M
 mjgyAg1fO/w3i90OO6Pq2ONYPRTVaSEYVAqhxCqCgp/pj6cDipfPy46+ITP5OCD4twGADCft7+5
 bUpiMt7FkBkh8rW8dHHB5ypz/5YslkeT98pdEfBrvGaId6DkaWecV4pJY1QD4TQAL7v6L+Y/MjI
 DBoE9s4skxlGKaOZIecWF4rbzIq/cNcJxiVzQo+P5alLOdgBGwBI/EAUT1qDDYIgoeaSY/nv6Tr
 2o93M7v3zfoozNLYZRJLMk6aazVmGOr5iDqThDUf3hhSWPrdYubvfP16ETQMpH+MJKzdabfOKYn
 C97EGqNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On Fri, Sep 19, 2025 at 10:24:24PM +0800, Xiangxu Yin wrote:
> Move USB-only register setup from com_init to qmp_usbc_usb_power_on,
> so it runs only for USB mode.


Please rewrite the commit message to start from the problem description.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry

