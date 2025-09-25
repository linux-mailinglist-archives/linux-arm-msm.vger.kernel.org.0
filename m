Return-Path: <linux-arm-msm+bounces-75214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79403BA1B5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340C3625F28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2132C032C;
	Thu, 25 Sep 2025 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XK1uqDAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB2E26CE11
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837451; cv=none; b=D7iEaiuzkdnKDr1qSqBY1dgoyjo9H+AX9AOVs6jopBSTsn/L4p7C9jk6/ys+GEh67i9X5xOBmXrUlWDBtQpQWoB6LW59uhr0nMuqOGOMEWmjEf98gzSHI9Mao6EeVXXLNHxhWshXqgth29/6SfuMSLE8YK/VBVCZvMeemwu6i6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837451; c=relaxed/simple;
	bh=XRDf8tTXsDigygdSdMxdsM1FC7hg2Y/Qis9SJR8B9Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ha6CP4UHal4bNCDTtTLptOZMPjdptgN5Eh9U6jhRgatBn+07AwGGFJVT25RloZr9wkphZ6KMHFaGT5E60200PWIv0nJB5vFjyqKel3sG65VGohiB0ahN21/iIY0P4G+QTiP3o0vJZLsf8zbt0SAYC72afHjCzK15SU1DwMjtk48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XK1uqDAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPpsk014864
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0PwCuPQqx8Z6h5Uvt2HeerM1
	J/nGXO3zl9oVlZVDBoc=; b=XK1uqDAPXweKnTZKlUOckWMutVJlu5JD471YAHDp
	y/fSOf6S0JmkK4x28Vq0wnoZtIin7w3eltmeEw8V79yPXj0zZ7b0UMyR7J0/xPIs
	fQjpuaoc3xwBf7QH1OIbxDaVe4bz9Sb81IKVnoUsi0dLTuzD9g45JhRt8AZaloXM
	ys3kUasTUNUcFLMX2bg64XPKLt1MJjzgVbLqX5ak555SHo5h2kjRu5YzKbiNBzKn
	HOIPcrWZB10fLBBJ72iQo1I0BHrtYLsGW/rIfjHpWwxJsJ2xt6GeJkXB3tTZHqMJ
	4qEkIZXCRRNlH7ZZQ/lLUbdAUoaKEDz24C7JoM/ISZYfVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0t8had-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:57:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b31bea5896so18742971cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758837446; x=1759442246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PwCuPQqx8Z6h5Uvt2HeerM1J/nGXO3zl9oVlZVDBoc=;
        b=DeHBTdoY/w0iHC733vTOcpxibQnG3b31+GLR+6QvsuTQfxx4uKoZRpwy6wPDbdsffv
         PkJQCPgiJ4jBOrxkXcIdR3pZBL4AsQ6XqxL2lyQdBEdTtKgsl4ONzlSQFpKuWEqxmxEq
         4GKPYft1163+qJ33w58H/ljzox9tVmGTvaQPpoqBWmrtxv4CBaivgd4TSicgtxO7wn2S
         xjg907SSkDtaXA4rFv6g9UedWHa3YVPEuWboaBX9dWiuxSGEBOBBlD0TtCnTNWbVwoSG
         hkeUG276I6Xp2r1kCVvF+65LUCZ/JkAmmYCRDsptNV6SZJma6EA7e4bKdt38EOqa5Hs5
         EQSA==
X-Forwarded-Encrypted: i=1; AJvYcCV5tqpoHvE1vAoMnGmma+pklxKJRWmEJnKSdP04XBrb/D4MVh7FX3pexImlKGagEUf8kiA48BUgmYlO/3BU@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ+EJ2J3qZB20I9XIdDO0v/mOu/cfX7gfw8T8OcQlBaZ0mJ5Bi
	qgssXPrxRkaFbuCiVB8ZsJ1qz42XraUXa30l5T+fOg65y3b+DNDuTIlcCNpzHa+KQXPRmM6t/x3
	YCCj790+woAa7ftOcxRBvDzXgE9aw9fJOdKs6wbQkfgYoHIuPN89Y2miIhvU7WBCbUW9o
X-Gm-Gg: ASbGncu4BI+aveQKJqsP0Ehj5Pn5hG7quS97JgneQLNF89e360b7gO3BJlAbJgONNx2
	wRiBced2KcKmHI8wQBsCLZI0FMvrPKvgf+ZvvZxxT7xZKJGuNnlP8dbXuWgVCcqkyCCwcjY+WLB
	Qm7Q0b5/J/9UjoqsKkeK3op3+yRU6pTeXqIijq2gdBNxchJfF/IQP9eOHWh7RWqOkcvq4YWdCNL
	56pP4ayMmZfWs0nW3xkWoNKLtxmKnvcynPt0MkbuFMAX5g9i2g18/TSVn/xXx/jkBfDFytDMFh+
	0muTKUUrHX11cfAdw6PVhmrGmpThbAcGPfF96DRURwAaR+aNP/hv4+Lm26ocEvE2x3zgzispAYA
	IxZps1xAWxhuhoT/VdbKQYwmjlCKmMRVDv3mfZxrXWSI9uGGtClwn
X-Received: by 2002:ac8:58cb:0:b0:4d6:222:dd8b with SMTP id d75a77b69052e-4da4d31543emr60280961cf.83.1758837446399;
        Thu, 25 Sep 2025 14:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUvHFm/VIoqIQAQiQZ6FSqSB9YMAic3boTm5yCXZXNdcpV35T3IBACEQOCvNWiglROD/o5RA==
X-Received: by 2002:ac8:58cb:0:b0:4d6:222:dd8b with SMTP id d75a77b69052e-4da4d31543emr60280581cf.83.1758837445940;
        Thu, 25 Sep 2025 14:57:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a316d6sm1156263e87.98.2025.09.25.14.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:57:23 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:57:20 +0300
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
Subject: Re: [PATCH v6 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <5dtlqq7x36gb7cmiunoreoe2vftq46pusb75sbol47ceazefpf@lxrx3hhcwhju>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-12-419fe5963819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-12-419fe5963819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dc1NxzY1jsig3TIPIE5lG0mlkY_sjJJr
X-Proofpoint-GUID: dc1NxzY1jsig3TIPIE5lG0mlkY_sjJJr
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d5bac7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cNq2fIDUiLOJNmzcDXoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7F8UGScYP0xU
 72oqA3HXsZQjJtjSdO0lTjaZtiMQhPYYW/fpxk7ZpSAXjrEJ1Dy8D8vSactIloGKeTjryh/KqE1
 k+ny9yAVPIV/OZuvIL5nzYDcZzjeDjKm0fmd23HUCigBzcz/nNPmlurm9bSUW/bMBZrGmyjR2CN
 QQcZnXSlTVRoasy5R+a+pApiazDG1qfsTnUCnHxzTrrOWw/tDE8UC+RRh/MRAW9clGGV0OWAZYZ
 ErVZPI5p0XGDP51oHfIBW1px5DfqYybVaWLEvbeg2+5HSl3uuALiXh1EKSN5pyBBs1AQBxU9laa
 qWeQyFnkNKAbt2gbYgyLWNdKv+3Ejl2ZXezKEGh3RUbEsl75oMKAjuzGi1FBPJ2IrVyqmvOvE7u
 rtKYCJ9DtWLOyDsCXpXB6zQA+NLXqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 03:04:58PM +0800, Xiangxu Yin wrote:
> Add QCS615-specific configuration for USB/DP PHY, including DP init
> routines, voltage swing tables, and platform data. Add compatible
> "qcs615-qmp-usb3-dp-phy".
> 
> Note: SW_PORTSELECT handling for orientation flip is not implemented
> due to QCS615 fixed-orientation design and non-standard lane mapping.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 407 +++++++++++++++++++++++++++++++
>  1 file changed, 407 insertions(+)
> +
> +static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_rbr[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE_1, 0xc6),

Hmm, I just noticed. This register belongs to a _different_ space. As
such you can't have it in the COM table.

> +};
> +

-- 
With best wishes
Dmitry

