Return-Path: <linux-arm-msm+bounces-75212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF142BA1B25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B260D7B513E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480F626CE11;
	Thu, 25 Sep 2025 21:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBGGbHfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DE91E531
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837289; cv=none; b=ivZKYAsE0QjWhbVhG0QMltAHwpCC2ypmOLWmDSCVsSIeD+Ciw5YWS/NN7kmmjphKayquZLzIXihDd7fEvAOS0K0wRFRQ7ARuQohFRduUwnWwItLse6VJQhEERg88Hr+sQQpAO2FCJN4GSy1AkcO70+/RSc4JHCShBR+DOhm2NUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837289; c=relaxed/simple;
	bh=PtTkvFAxmzVKWuyPXiOlHFi3dHU6l4N8I+W0hW8tJao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A023HTrZSs5M0HLH/Ofhufo0waPKs5rVkGraRIiB5WmeNcHzabZ7+zBapYGkCML3sxYn66/rTl2dncHXBQQQpCRIJq6qKgeg1jSE3zpxq4sZi80VpDQesXZg8D/4RGUtaxt1dAJgo14DbjaNmrap5zUv8PoOFSU7DeRjoBoTYNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBGGbHfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPvnA004174
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WK8fdvESA/OTliyL4dPj+6x8
	FLgnKUZvKWjsZ9ztQ+M=; b=CBGGbHfO5GieknXvJF57m5MG499qdch7gyJUxhyb
	g3jbSoSR02NbwiuFNxMLf5vGv/cD/MCt/137RrgBTFeOzk7h7up3903PMNdBT8CD
	SsgSMsRHjCADg2+8xHMXpzHACtm/vVWrgnzKPkXTHjk3wrrkochuAkr1TclpQhoI
	/xhZWJrkdG2oQqHjnIlXzQ4nr33rf12853oHOOKnqeZbXbbtWC/1rdVzFMBika/K
	msY/i/pQEEafSDhvpN2D2ZjquiboQqH63dqGJ5heFR+P8NAkX3uQBWHiJrrWzJCz
	Sy+l575LGFGEh2laL7WHJYS8qwFSo5eXchAhuGnkazU4oA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u0gv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:54:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d8b8c3591fso41285371cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758837286; x=1759442086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WK8fdvESA/OTliyL4dPj+6x8FLgnKUZvKWjsZ9ztQ+M=;
        b=NiukgUEnAHShZMkIcrrBQ9AoFrmH5+E7/370aBJRaZqd8eGQq6TTAFGrO0Cd8sjr7B
         CrkeH4qUFCKHRKK62J3fq7QlS00pxtvhjq8QkpIvkGsVxcHIP6IYFylnfc5P7h3t7Mfl
         DjDe73XcihEMtGiAZAzB+H45CA+2aU0mu+eMFYTr29+fR/06K8GwUiMfi+O5pVNkEYGT
         a9TPIp1bB5uZ8pC5h1QKIs3l95ApudGuc26BNF9nAel3ir6eSwnjCeYWxTBxOasQW6jj
         9E3CCKxtylSnrzM1RrGAhaDxHaKkrw2zHedHMsP49NsxAi1pMDghimuQkZsukFP12Iwf
         2/EA==
X-Forwarded-Encrypted: i=1; AJvYcCV6bBnlLm9nav9e3ykOO1Gr4MoUajJ81my1CM2NrlSbWifFBtBjQd5CXCON4/5r3rndzDEw6WMK44HYcgay@vger.kernel.org
X-Gm-Message-State: AOJu0YyR6KmQmLseWb0gdAY+YAyoSxnLH3OKnbXlHD8swQzHYZ0C02XF
	4UDlSCG8z8bDcSB92YDcO9dg1HJGjmJqRBGl1Q4n5UnFUgvoJuchmkXVk/m0UNSoa7+/NZ5lE86
	nYKYNXghhKhi5qxj/HPWaP6KjhVLRCyZL1OluuAij6uCNRJFKecvhwuJqbENmRPqwKePC
X-Gm-Gg: ASbGncsOL3UYATzzQ56W/iV5qwxYrMSZ/nY63b+gfGVCGKM1Q5J8PAuVr+di2Hv4obD
	0eJlALnTVPFm+GNjYXOz56rF+oQ2CrAeSUU6lUHhcmkxskvapWk1gMnYJb02h9iBHcPMIrzuVo2
	KqH80t5WsymodOjDIoPJEJhSJFGXDxvKMKM0jYW2rZEL8YgY4EotY+etg7LTSsfd180cQjSAOUt
	p4NLYFBHfxeNty16RYZhuwbh5hLkN6ZdNzdQAfvR0iFITMCVGoeD7SLol57S6UmDPWYBCZDRBG+
	whozg/9t/ineSk3UYkZ/ml5oY5XHzZRfVvBCF87T2KO4u7xvT5EiQXtr66rHnLM3t2CC9GRiW4c
	bXNDdUif6x1Gs9AOT1g5LcPcFX33ynj7TOFjXXlCR1h/2rN6H8Mnj
X-Received: by 2002:ac8:5d02:0:b0:4c9:a975:de57 with SMTP id d75a77b69052e-4da4b8095fdmr62826131cf.40.1758837286033;
        Thu, 25 Sep 2025 14:54:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIHqvgghJCvaOUOze81nukdnXAC7zdagDIbBSgvwres3Q7gPK8kP6rfKMTox4SKyvbSZXPWQ==
X-Received: by 2002:ac8:5d02:0:b0:4c9:a975:de57 with SMTP id d75a77b69052e-4da4b8095fdmr62825681cf.40.1758837285529;
        Thu, 25 Sep 2025 14:54:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm1117472e87.35.2025.09.25.14.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:54:43 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:54:40 +0300
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
Subject: Re: [PATCH v6 06/14] phy: qcom: qmp-usbc: add DP link and vco_div
 clocks for DP PHY
Message-ID: <soor7srlw3hoqh2onmn4ki6d6mp6psmrbz4simwvvemcy4s5hr@pzabx7comvc2>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-6-419fe5963819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-6-419fe5963819@oss.qualcomm.com>
X-Proofpoint-GUID: A2mY6Z-tZyIir0NaeL1nISVwE5QjVdPM
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d5ba26 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ig_1WL0MwRJ8oiofZPAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXza1yH6WlzWYy
 LK4lZ00Nsgodxa51jycH55b2JEsSgDxXdukZoRn6cWuYyi+OpJDsDcEcvwOs+FA6LSrD16v/AU7
 tjWtFchdy7DsSEKUEhDTpqzF4mBVjRfAZN7XD6I40IAGtM7gufrlRI2IWOLCL1ofVtCfc8DZqgT
 LnejVLYk8AcBK5JYujbHI1HQewM6AZPkEa4Yqn0DV8NOTxavqeyB9WQ3yCd5TVVU/X5NKyaaV/d
 Dvp1LiANtdlSZXxRBnZx6O2AldicuRBOGeICN27r6GTNeHW/dhaPUX8SaXfiHVrcS4vFEZoZO9r
 6gDF4FK0ytqlFQg3tmOZBF/ERxL3Lat0xJLO0uq9pRMIMpzeJYR0Cmm0MusJVODNJGwD5kHW/2Y
 kC6kMpg8AjoifyCymIGfX/uryTS9Qw==
X-Proofpoint-ORIG-GUID: A2mY6Z-tZyIir0NaeL1nISVwE5QjVdPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 03:04:52PM +0800, Xiangxu Yin wrote:
> USB3DP PHY requires link and vco_div clocks when operating in DP mode.
> Extend qmp_usbc_register_clocks and the clock provider logic to register
> these clocks along with the existing pipe clock, to support both USB and
> DP configurations.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
>  1 file changed, 204 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

