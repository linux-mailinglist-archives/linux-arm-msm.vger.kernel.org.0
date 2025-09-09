Return-Path: <linux-arm-msm+bounces-72802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E7CB4FF5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6B5B366C4B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2066A31B82D;
	Tue,  9 Sep 2025 14:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prmUN5Zf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B212FF679
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757428028; cv=none; b=VOEwXEMQBFBZJjemPsFJZdF7wVvyDCn7zG6Xg/nfF3evTlZkJGW0BVj+cbpff6Ui8Oo1eE2OCkoazbziIs2doiRcH5ghg8ZKFLDY0WSw+O6uoAbqi/gjEVTxBJl9PEiuf3QqTK2cT72jKGCac/LiRGabrRXhGdXq59SPDiZio70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757428028; c=relaxed/simple;
	bh=oTaKC1uCyo1lYnQ7uFQQm9lWFtm/uPvEC7t5hzGGpb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2utJMfM38m87Fn6gv7OnpnKg31rX9csQcPUHNAacOVT7xkYxaPRpDuNtLHtADyrPl68Woktq1mNLx76IfeE1wcfYnsNvmjyktuEsoU9eJR2scLZkZmCBUuOSHi9gBOG0izghc3A8E5AkBll0QE9nVTCV72QM4jz7aKTnoiKRwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prmUN5Zf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899Lp65030195
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yw7Fk6HJCJShlv2t9i0lzWI2
	sWKEgdH07td1ipZYTIs=; b=prmUN5ZfV2hLIGaofH/Lo4W1DdveSATzHd0W0IGY
	+iGzvRjaBZOviw0JVBOne0VMAa+xYjaJQiz9CduoXpnnMFj8myq2+RoJJwkIZAhV
	h8O5fVMVFTMO9/Z4xQZYjxyatQhApvQuM9mcX6EnlzOCQE2RjLGjogxOdG6jS3NP
	l05BHSwOiOV+FnYoz8oU0Ae9nK0DM80ZrlCHd2ufB6rkDVUabBYAJ/wSquyw6+jL
	5sQFL8g1g4VpunkQnD5YzaXkVu+xK5+CIKr3OeCm916HqufXxQTKUYcIUSiZIZvp
	JAzoncmj6INosJaksQzgooREOCMWW2wTD+y7Q4VS2pmuIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8gh2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:27:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72048b6e865so117001706d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757428021; x=1758032821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yw7Fk6HJCJShlv2t9i0lzWI2sWKEgdH07td1ipZYTIs=;
        b=vxVB4FO6Pl/qP1fmymBSxA80snv7kSm+GlUAnjXucupMva9FJkxzrXJqYOyAuEx1BL
         Mv3YlvRPF+rwh0O20n7l24UKzzBZ9wXbi5umm4BpS65qJd1RJWNwDSSgtC4HC4SuJQj6
         E03B3LZvalmdTvA8gNrVDdIMpDgz7n9nufQgd60SvuUmGR5cZYybkV+jLOXe34ZYnQop
         p5lNsgZ3yA5YPWx32IQ4GbZ2WFv1FV9KoNDgKsZFiedBG3RUJbRouI7MlP8sVZH/bnqY
         hG8yPFvx3MT1kgUXsLjHVNLbVUbXEUo2yOcxDgG7NAV359zP2bVGiL5TN88izc8xJUaq
         QoRA==
X-Forwarded-Encrypted: i=1; AJvYcCWClZd++5hefPcbSygfbf6J3/rwb9gIKUCn8g7DaPJTBao7NVI99X8k9lzmhURB+D3WAUa0om//vQgU0bEv@vger.kernel.org
X-Gm-Message-State: AOJu0YyBmb8n8lUlpxSo7IQhhf+wppZvkjNyA5meakI4kSUzkhOrf4OF
	hb0Yv+JzBAkN1NXuX5YtrV6tSzwnBeThfCEochHN6bJUsTIySJyeDOMRQ48qFfqw+5w2+9ywl4f
	ce+zcZFpAvh1ArEJKBGQpJ8ZJhBMHzAON17KemLSZmIrJlRaIbXTZsNgMz9/+DBN0TJfu
X-Gm-Gg: ASbGncvy75mTyhyZ7REW37/yVMy8Jx8Bue105310KQOP7YnQiOzLANBgNluFNunbhfi
	QxLxRQRSfvWBI7j8C2mi41ph7vJ6IsLYAoey+YeQHNsqlxuuOA3BYPGOj0za556IzCO/wl6fbTq
	ArZ8f3DXln/8pVy/5DZjyAlyjRywQHhCtG+zREO1dYGrwCQo+Sion/uaEaqs7NFVLFZxVJxG6L+
	QEx2zQiGvN1ot3VbcDFE9AqIjHvsCf5qMw16CHelvWUWchIClg7z8Xy7Cn7UabRsj9i4IXHy34l
	TVk1pmn05dKC1JhewGsXFAgMUJqdHYxUxfdsMUbFGQwXojhSj3r3SMLLz5QJjnCOxV39vbeoXUM
	yydnQ7HavKqhYPfwvZIKL3BzxxJuQT5nVX1fFQ0ZchmoPH7C8Sgr7
X-Received: by 2002:a05:6214:1c82:b0:725:1035:1dc6 with SMTP id 6a1803df08f44-73941de2c95mr112157376d6.64.1757428021171;
        Tue, 09 Sep 2025 07:27:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj+Rvfz7tyFBU8l4QDVUaGg1lYtPx2BNUi8Rc06dcrMp5ZpK2kuCy0o8urhbMPnh2qES05Fw==
X-Received: by 2002:a05:6214:1c82:b0:725:1035:1dc6 with SMTP id 6a1803df08f44-73941de2c95mr112156786d6.64.1757428020517;
        Tue, 09 Sep 2025 07:27:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680d0d8435sm560419e87.63.2025.09.09.07.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:26:59 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:26:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix incorrect type for ret
Message-ID: <6g7kftcagecmbal2oclxtmjjbi7wc365nb5wv7jhvyzbttcjz6@kxr6oojsvg6k>
References: <20250826092047.224341-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826092047.224341-1-rongqianfeng@vivo.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXxdQlbq3UY9Ga
 +Qgvx6cISWWQVap17Xpl2bTkJS8LATSAA0X1i0Lm6TNbZxMwNkZai7edj3+3DIxA/YsekiApidR
 CFzYhZrA3TIpa6d3GzUApddzjsW8umezex6E/v+Ftx1+5gZeOee5CyQIWsIGqACGW2DKBmWRnzd
 cRaOxzj7+a8erTbWF+A/GP4Fo3t/2x3NRwfo407deJ6NWOdj91alhwACxgGbbSVLvOF2PXPRR8W
 oxiysKKwQ+srqwWBw35uI+GWIT3KIGfs1CRWBGrbJi9C9Zrkx1jdEe7UfPsWv2zOCqOaUzOoImy
 bhEmLBVPP8f79897ZJiToycoJaNBlXD78aJUPk9ogrgquX3ruUDnKBBDn+W0RAaBY51J2FHBmmS
 YvV6AVPr
X-Proofpoint-ORIG-GUID: hLhFPsteqp9v3hl1_dZjflXn9Cc-jJlg
X-Proofpoint-GUID: hLhFPsteqp9v3hl1_dZjflXn9Cc-jJlg
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c03936 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=b381tfKDLOYfEgrzl5gA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Tue, Aug 26, 2025 at 05:20:45PM +0800, Qianfeng Rong wrote:
> Change 'ret' from unsigned long to int, as storing negative error codes
> in an unsigned long makes it never equal to -ETIMEDOUT, causing logical
> errors.
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

