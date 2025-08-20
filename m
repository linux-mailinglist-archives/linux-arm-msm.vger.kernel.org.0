Return-Path: <linux-arm-msm+bounces-69962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2588DB2DB88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56CCF164D76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E659C2E5414;
	Wed, 20 Aug 2025 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+ArhmI1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5FE2E2EED
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690387; cv=none; b=iz2UBXBBPcpuexRzDcBhoaFje8imvUBS+d+sTFW7WYAodrI0+73xqldC76M3L5qP5bDtJuHCxTGbJqRaMuBkfb5i/7C3H43+7HITQaj/SRVGW7wuquMAv6vEgPEE5R+kUTcQRdEfLQqhRqXleXXgt253ZmdNxhJ+buTxvAQdpPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690387; c=relaxed/simple;
	bh=vGFR3vP8nyO82cAmfCuW+hvuIZljUq1p0jyyI10ddHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2kIbs+eapz41KIefkRBgZ27Tc3auErTHdotMiWUW9tNw2Af7vUPIj+dJGfGx1lMmIGNC0yAzlJAYSW0jny4vXmCM0S+JLTqVAiAFSWUs7jXJWkd+vipqpnJsg+cvEeFTlP5vhupI70h8IArJj15aupSEMCUOCp8w37TKtCfjLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+ArhmI1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA1cau021225
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=75L42tl0MI8KDN3dC/5xm80p
	bNugX+cDtHPbn4TsTaM=; b=f+ArhmI1e80n2E11S0VAGAHBmTj7HCLAeDvtlL56
	+k4LpOIw3P67j6da/lsVzoHX+IUnXFXe1GQ1pdLSdyzZNIWh2S5mDJMJXbxxAGx/
	3HtprMmldnr6sfITJY7LfmQwx838XN2D+yhlDylMSYdOh4mkP0NqzRllWF8rZinS
	Pd+IXCpQKKojyrZDd4waTrWOVWtOPAlVlIPrT1srooK9IcXftGSt+1mrG6RpfH06
	KiNEJgkUWbMeaaUG1VzwKUp5aasgESdXV2uURKnfRWWQLhZlEze7EDRAVXH+EqM8
	NNjCp9eOQY4JHk5n397t3haCiQQsmELZeY4aBmcrgFgfUg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291jny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:46:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d7c7e9732so8594746d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755690384; x=1756295184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75L42tl0MI8KDN3dC/5xm80pbNugX+cDtHPbn4TsTaM=;
        b=UpJy9Q9+jRY8nhwn0zLLYoefJ514MBWUbWptPt3i4FaOmiB2TngpBkEyCy70/Up85X
         +wIWB59LqsrvVo9HubycUydW7svSWQOxYvDUkItmboWoXGubme/Uu5t6RlDV3VNb0n/o
         ymVM8lWC8SD31j5pALz0uSZF2ODUyDHjm1H12GpZRux9dELb7o107iRwG/yB9AXcdEHY
         lngZ8BnTRyG+oAm2y4YWU90c0saYy4HSzc1ZCdAVscCc4a2lG5pvzVAo/VAN6qjLOFjk
         88uQtkU2X+3wYS+QJLjhCoui/pD69aqu4ZVbhihrX7NSgCqMPXPY7rOxEjFEIP1qZ0ce
         F1NA==
X-Forwarded-Encrypted: i=1; AJvYcCVtjPFmKUmk8D9zu/y3eci557eG8JmiKhOAQBrkQT+iBPt1vL910LI+Uc8mbc74vt1z8GgMQT/esbBvWzak@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0aa1su6lQutaKax0BnEsiUtR7QDLR1P0+JNbUMq7SQGNNFEDU
	/wWZyC7oKAS/yQgWiwViKhpsodKCqo+rcIajRuzDD5lccE5MYvwkTK59LW9TPQuftYI5GGh8opP
	8hM8iP28U1zb/ntDafBZAYYRa2wA40FD6TJbbVY2WH58WtKTTAGtAb0Sfu78VAmGMfueH
X-Gm-Gg: ASbGncv92wHigSqnorkkXdBrTPhcjKhOZvNS7oyzG8+40Blm2q80PJMz9F5OudFk7hr
	pqctQroz0aqfzdPVyVUrt7SXSCoOerJpmkAV78fa2w5RrX2I8zXRcozmKrxl1PSgZno219FReUr
	y9yo/WIbdQolsyKdk+KEjClmqiF8XVlWX3GmhZqCAh5yYgLVgVE1lzjAtilWjmg7EIL5wteGqcH
	xbYb7pUbwpOFUwTUdu1y4pTQhtQ/66GoeWA6EBB38YsYAxcoO1WVR2LJJqWNJ7pMCENXbGhaFlG
	GB9y3zZGWN4TzOocm5/y3OKfQ2eRjOZYMqlptudgHieM2CP4wwFg+BbMjOMIw1MjoGKINPgtajv
	/ZASFE9DQ5efu5TClU3ljZj50iuyj3lrhgnv+4DqsDhvFp9Kh/5s2
X-Received: by 2002:a05:6214:5194:b0:709:deb2:3dcd with SMTP id 6a1803df08f44-70d76fd4c15mr24701896d6.25.1755690384313;
        Wed, 20 Aug 2025 04:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH83ZZdKQ60Ug1Lmf0IPGuUmaz4M2F4mxHsaVgPhdq8EvO/IDjNwV6zVABnr6KJ/OabGfXT+Q==
X-Received: by 2002:a05:6214:5194:b0:709:deb2:3dcd with SMTP id 6a1803df08f44-70d76fd4c15mr24701406d6.25.1755690383793;
        Wed, 20 Aug 2025 04:46:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3525sm2531156e87.108.2025.08.20.04.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:46:22 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:46:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 03/14] phy: qcom: qmp-usbc: Rename USB-specific ops to
 prepare for DP support
Message-ID: <ay4ss7cwpiz6zwiwiav4ts5hwhxjpc6ogc2uirwzfcyhi2crln@3azxsu5hvyhy>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-3-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-3-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-GUID: rgIzN4ffMrccbMMB7idGUVISevYaBMEJ
X-Proofpoint-ORIG-GUID: rgIzN4ffMrccbMMB7idGUVISevYaBMEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2yw0uE1WJPG+
 niTtwkj/Nsl1kZpSTQFtJwNx6YnECTeo01yhnyf6EHAb6ADw3/zjtcgixsB3t1AOtKQoLFnLqMO
 iC3CuZOYz0jHOIuG13ZtumnIyd6H+ohIZs4whiZe0RNuFx12Ypl6xFv4ebY0TKAB298HHDAbY30
 uWkrlD1XMotk2FIqqrIMsEmxJzVAB5uVwKZsWmSjQplKkDor+xLfuhs9DM7CHbqa0c2XnNrvIip
 n4oGhBZM+R6TGC1iznHqrhNP6l+CYw3vsAXt8pLw26X80Ytf0UpXqi90VdwHONpVvFeX9MoD3fu
 DCPIxdWJsCHnEfc3pgmZ5PQl12wos7koI6IUjzb/tB4pb6Xdvb8cZZP5u2eEwE59Ne2s5t3QQPV
 VU6sYkDFgNoLY2ZhEXtpHpOq43ApyA==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a5b591 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=H4SNA-w7Ihemelo7scQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:34:45PM +0800, Xiangxu Yin wrote:
> To support following DisplayPort (DP) mode over the Type-C PHY, rename
> USB-specific functions and ops to clearly separate them from common or
> DP-related logic.
> 
> This is a preparatory cleanup to enable USB + DP dual mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 50 ++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

