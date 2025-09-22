Return-Path: <linux-arm-msm+bounces-74403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D65B8FCA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 11:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3BC817FB34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 09:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7060528C037;
	Mon, 22 Sep 2025 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXKZRq/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68902882BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534010; cv=none; b=rYQIz+4pK4YlhaBaWSC4/IDaONX75HKwpp0ds5fykRnmXgw7i8Nau0pl/SQxtlv60fVedkNegTg3c5dtx3lcGlOE3YltS3ds9+6/Z9hwQpldgBs+BWrLwYlV8KUWsWMeHwKzdjxBbcXqkBdGp0UdvlChNPc5igWJm0QiY0uvBd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534010; c=relaxed/simple;
	bh=iUm7WYS7P/wtRO0KyVFWy2NmCc/VczuVuNk9FQ+1J0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQ8hT+lRUkrkgnZD+sl2HPhOCXweG8VJTK13Q2/1qCNnLzak7QOdTMRA7HK3Fu4dTWvAG0pmutgCJ3DydJHG3au9Q+sMcxTu6zEmGarmKWkDJfmalmJVNjoqs0MOK3DWj764s09Ks/e96nPdq2dIzaetqX85vp3NqoNTJfr10no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXKZRq/9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8wjNr005249
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YluqLjFkeDBsYKSBhPJwBbp0COj/3zoNrL6kINO3I8=; b=pXKZRq/9CE6rRZBi
	Jky4PBi9rEiRdx/UtJ49BKRg39I3qn6KPqZ7JbDsFC+VZ5u7i96zjwhIbWjnyQJw
	OKsskdpkAPiWwJHqpK9W45VCgi4gIRGtbVgyDRaDxLwxnr5WAq+nRDZGKl8EeASH
	92AWXuxGg6RRhILFrJ1caqk5iyvkZ2PgVam+dVTzcPEsXwVe4bUhInEGxOHLoVdR
	VmGbjCkCkPnH+/ksnlrW22jnvtqDPm+Rfzp89mL3AfjDsEnmYC/5C77WAgu1LmOi
	ASjDpqPWKy7lis9fVDzCdoD0iX+5MrkGNfx8xG9xY2miUqdr4soYidhBHd7YcbBD
	U3pDaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyemhdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:40:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5d58d226cso93459641cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 02:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534007; x=1759138807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7YluqLjFkeDBsYKSBhPJwBbp0COj/3zoNrL6kINO3I8=;
        b=tDxF5SDrZ+O4V61g6rBsXgsQ3YF1uvB7hRVB8YUvOh9ZOayJKEB8ESOzvJLSMzq9NV
         izIl+wuhF2N1KaOFhkRdmgRH3HzAsXbd5QvSIPwiK+KBg9TW2pKqR6PQ6ULic6pYp/gB
         PVbUhPY4TCzML6xwLSw5P4rumrbuJUBEgKGd+1YhAX+OgZb9D/+VErPrVYAIt/bhs9el
         WKQZrweftavbAjErLiqkCgOkzdNiQ3hjESU1N3T5wfSH7Z+4anPAwdAOhVrOzH1TgcK/
         lqsi/O9SfNnlgBxnJVhvwnM7DGoova+ac26buB1q9SZoRRIM+x+mW8d5NZUU3zoHedOD
         DaQA==
X-Forwarded-Encrypted: i=1; AJvYcCVH+jZmOKSDCvHpuuaixAuOafCO9RFpjSE6ehLj0R0onQQpIdS6DQ3OkecSCwltQ2f/UhF8OESjcnTXC5a+@vger.kernel.org
X-Gm-Message-State: AOJu0YzmnzfZe+Q81hOn7wshUq6kZaB5JAYD8P44v+xBI2WjnAAS6q2G
	gH733I2sFTUrnBDWo2Fy+e8tMYpIvP9Llia1PT/So/Y73BT9mt4ztYj3Aa+dvUlu19ZYJUhhKRE
	v/+ZtIty/dD703Q1vfI/T+Srmm2+uiWxBh8lGtuyXmZjEJHxUE6ANtFJeR/TDHj98Zr0F
X-Gm-Gg: ASbGncuCNhCnO5YZZALzOz8mZHtk09Wcs0E2vjse88MUUiX4zqE7X/zaZVS+QGwaVIg
	G8SsKEdzVhcBtSbG0SmImc5N83lL44y2nGuXYi8i85fNvsQJT2brOkOJKcDCnZAc83jEcLitNkv
	j14gPDNOQu7DCAADVZ9x32aiTD10iJRcU3QNgeBXDQwL9DvJbUr+Ug6CX90XPBZPFhLiD9Q8z5m
	xGlWZrXnwy2BEs/QC8ZkZK2fLh87oMmb8ihvy+qa+18PY7DCvRlq6EgwL9d1kKraAt4yHVi4or9
	eK12sxrUv/3KfdGjV/f7GM13qK/sEm03OStT2IgRX6K7B8MEyWQSoBPuzK3p+aI6pMxq3QQj+C3
	ZAlrFjOxoRUJ9RGfb/sgGOJ/QsjsTUEYewizIGH2/cFb3gyUTztzy
X-Received: by 2002:a05:622a:3cb:b0:4bd:8a70:8419 with SMTP id d75a77b69052e-4c0740771efmr132175741cf.49.1758534006503;
        Mon, 22 Sep 2025 02:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHPdl7qbXwWAyMzAb2xrKkqm9pTpnhem1oin/ZkSbUrYmV5Vp09P9ycfD9quaP9yIYnQ94uw==
X-Received: by 2002:a05:622a:3cb:b0:4bd:8a70:8419 with SMTP id d75a77b69052e-4c0740771efmr132175461cf.49.1758534005900;
        Mon, 22 Sep 2025 02:40:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875b8dsm981204e87.2.2025.09.22.02.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:40:05 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:40:03 +0300
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
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Message-ID: <ysxjabaah6rcbsjlreteo32zdljjcd547vgqeoxototwicjj74@rwovxeg6rnli>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
 <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
 <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
X-Proofpoint-GUID: u5NH6gV6yT_xFpdttd9R-FkP8oCsXlOC
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d11978 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zhdrUoIqCuD_tm7jGOwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX8urhaoMd8eXC
 rzV7Ru5VkSVbeuaasFsCRce3WAIcGiNcIEnujnIrqrChlvxYc436pgcIDWO51hkMnfV5nSjO3IF
 mAg3u80s2Uo1Oz8gjhL625gmduKsHA5fXZoM2i9KpM/Eim2SN/rrIzBPRzZD6wxDgytmkdhTvXu
 I07vSGjCfrdlVd5BWXSFAtdK0C1hpWfEri0OqWVgOwrkZdwX8z2QfiIzvTnQsW8bd9yHo9NHQRQ
 axJW+j6wJTVyuZLcVHUAGkGPFqRlQSYibTQYWhb5VNCz06fR69uHzfpsR4t/e5KOEn0QGRiRWaH
 8Wh5XcZmMkaQklutpmhF0984r0y3up27u16txiBD97O9BlCzlq1brAaqCXNGuZdOoiHaFGc5vLy
 fxNl0Oy+
X-Proofpoint-ORIG-GUID: u5NH6gV6yT_xFpdttd9R-FkP8oCsXlOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On Mon, Sep 22, 2025 at 04:04:42PM +0800, Xiangxu Yin wrote:
> 
> On 9/20/2025 12:45 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
> >> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
> >> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
> > Why? Start your commit messages with the description of the issue that
> > you are trying to solve.
> 
> 
> The original reset list only works for USB-only PHYs. USB3DP PHYs need different
> reset names like "dp_phy", so they use a separate list. Moving resets to
> qmp_phy_cfg enables per-PHY config without special-case logic in DT parsing.
> I will update commit msg with issue description.
> 
> Or do you suggest using (offs->dp_serdes != 0) to choose the reset list instead
> using new attributes?

You can't because othe DP PHYs supported by this driver will use 3
resets: phy, phy_phy and dp_phy.

> 
> 
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
> >>  1 file changed, 15 insertions(+), 3 deletions(-)
> >>

-- 
With best wishes
Dmitry

