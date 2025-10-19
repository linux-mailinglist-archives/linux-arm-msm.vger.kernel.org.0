Return-Path: <linux-arm-msm+bounces-77913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9227BEE4A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 14:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D31074E8EEA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 12:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F182E6CA2;
	Sun, 19 Oct 2025 12:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="En65Ngbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29AF223DED
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 12:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760876071; cv=none; b=TXdxmzvlQ0zOO9KaIIIjjqcYVcMqtTbYOYwIZ8/aS2HOnQWna4JS3DodWQaHJ72m+wocSjp2SRU/bsSV+yI8yCp7TGd/h37Pyva/IJEPOTQXJ1fprgKZ6yjQylyC6NEd4MzEDqnDh9mLxQmH55aRnrMd69IVkwgV/TeRGLi5PLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760876071; c=relaxed/simple;
	bh=ukqOXoH0B8Rm/K0oOmFS3+X11r1F7wE1V9gnidNhdI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULj422a/1BhKPtEjuP8U7ZKuZP1B5xAgtvkckcrwKAlkh1xGGdGP9kYnoCzXmfEeVkDnqjZDVNLMTWmDJ6tXkl4xWECjzAkMZJUFBvC21bKs2+3RHltUExaDp6lq/wuyvoOtEcVwmRgToBiAD97pYi8kuDZxBhe8Es5rf9LOg5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=En65Ngbl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J6RI2H014394
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 12:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puNPrhTEXrfqnZblxaqGqUil1ruzTr+zCkgmrxJ5Bek=; b=En65NgblGY8NIrNy
	BjKP5KUK4ujMB3MNse92ose8la5TWB9nGsRowsVSqd47vWUpN1okqFrwbLRbe/Pe
	FNXx2CSQ1X00JbGgoIsnH6KHLWY1Qolrujvn/NYfSUhBI4uBbBj3taB/vAEKIjMg
	G+LNq+UP+2K3EqrMaLSzL+a9/fwmXBc2Vc95pgWrtnRnurCCfm6AZnlgQNC/gZv1
	RIiZAK7ux1qSlEfc63GcdYqlW9InQamQsiC4mUnRhK9etJjKT0GL+cHeJx6Kjb/s
	cRb/ARXhJ2FMsgtGx0SoulEaH3RtZW1rxb22UtmhV6SMakH6axSzxO6MljqW6bs8
	EtMyZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v0kfakt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 12:14:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-891504015e5so299247885a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 05:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760876068; x=1761480868;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puNPrhTEXrfqnZblxaqGqUil1ruzTr+zCkgmrxJ5Bek=;
        b=TTBZAuEPgiPrZkunNoV3yW/+asZ01kAtSW0Euy0GQ/y1muCbbqZJ/G/6FLb90CR900
         v7UxYNKH8EsUlqLFcluwXyBZAcp/45xfHda0ItKoeDqBrjZjBppqrd7FgQcpvre4IHXk
         4E/qWMVZqqbPY1HqaXfh84WkWWHCDzvjE/GfDVLp1MaJRk5pFQsd1F8c2jXhDxq2GQ+r
         gK05BH9xf8+fQNOZf+15T2fiA5hfJbHjEpgDgdEFc7iDC5RTz8WIyviJIDZRyQ08W8bJ
         dbPShjVj5cbtOHCmo48Ga8vZ8U6yGdiYvoKictSGQZmZDjTeOSBoIR4wKGm8hJHp9I+T
         gTaA==
X-Forwarded-Encrypted: i=1; AJvYcCV00jv5LK3xg2wyR9MPN+Rs7mrBZC5vI10LGYHESs6EAcXy2RjkjFXsCt747EgIzQneoOHIFH7J97oKMB5s@vger.kernel.org
X-Gm-Message-State: AOJu0YxM4Nq+VhPjGRjmYa6cwylrgUF4/TSWNSDb/z/X/P37pDFEn5yc
	CWVHiNeZDqokVz3QJKaaFTv6+upfpTyVru1CWZxqJQjUXItW1j2q/6xz/WYOzUDdA+uOQXZxY+4
	qpDrehk2YxnCYG9+soTFHTQeCyEJQ0kJIJsHzLSbo0tus9/0NIIM6S4lxo1r4d7YkiFS8
X-Gm-Gg: ASbGncsaZV2id3DU1sUaIPT0k5k8rAKAu5ij7gjDw7lLUpWprqC5TtQaUGvr6wht3/1
	DLpaoavMKG6o5IqVWfWBeEE+w4gTAAO0ShChlKIDueyEPNbwA2Wdvl+BYvkyj+5/LKaGJqN2Jzt
	CSQ2ijyzTSfGZPJ5jRKKD5QDLcTxdLmI1QH4SosGa/FmbSv9mKiGPkbOk2AdyGx0PatXww0G7Li
	1yYNJqx+cr1Gn1PoquVPKDGblZQqHOw8CUSWhsdv5F5deRy59T4dDv5UikmIlCYbzzZV0nvU0jw
	IA7VHF3QCdil6SPFqka5I7rU6heWX7q6krWwBO6Wh+B2HmLKZKJgeq74YeDJmHuFOjOThXNK6pC
	vgrxj5+KsW3RylijVbX6v0NHo/c5Yv7kfCGJvO7TVdIjRzkNJwniWyL4+D4QyfYgRnmEJ2g6K3W
	nDbq1ZasuSqtc=
X-Received: by 2002:ac8:5985:0:b0:4e8:911a:2af1 with SMTP id d75a77b69052e-4e89d3625e2mr152707101cf.46.1760876067809;
        Sun, 19 Oct 2025 05:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8+CZ0NJ9bBoZZ1GZiXuCbYiL/YP/qmggrLH+uJV7bA2b9ganhGBoaFnRrleOl3gY/Yk+zFA==
X-Received: by 2002:ac8:5985:0:b0:4e8:911a:2af1 with SMTP id d75a77b69052e-4e89d3625e2mr152706601cf.46.1760876067319;
        Sun, 19 Oct 2025 05:14:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deec0b98sm1528227e87.40.2025.10.19.05.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 05:14:26 -0700 (PDT)
Date: Sun, 19 Oct 2025 15:14:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, mani@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        vkoul@kernel.org, kishon@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 0/3] Add edp reference clock for lemans
Message-ID: <ql5ps7cv7x6hz3otzz45uv6pbr64x2hdapa66vq2jtnt6l536h@kbktvupxpf4y>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <7jmk3txdrnit6zn7ufra7davmomggd3graizdu6wqonp3lljza@mfnxt2owpknq>
 <4bd619e7-e9ca-44a8-9d36-10c18d7a8157@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd619e7-e9ca-44a8-9d36-10c18d7a8157@quicinc.com>
X-Authority-Analysis: v=2.4 cv=E6LAZKdl c=1 sm=1 tr=0 ts=68f4d625 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=FYAu2dUYg65mSESSDlUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 31WzH6oQ-9_TYH15Oo9fJ3cRrMPOPVEk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMiBTYWx0ZWRfXxw9ITKEMD6M2
 YCdqONRtzAnl144B/k6UwhXPmh68Q6m7mlVDvDiiFlNNtfAcB5LPSP0NLoCDCFhgunZjzqt/RK2
 IBVleF2gR3yZZv+eLNvFmHbBtPlPnUiThzPiKoAxVlGtT8UOAGAJREGFoKLqJyOR6NelyZjFg4I
 XYGj0+8XtAVdneraTk7IHYZyb3Qn8xX8neHLqJu4Nf5E6LZPcMAXSddhS3mkebrKqaX8n0xj6Qo
 WIoBEF4UDB/pW0leYtna0DwaQN8gMNgqqyRGBDSGURGrtxP8HEBWcy5fC1OZS80t8z5824QULI5
 N6Ae6LXU/ZWNEwnUtr67+fcCpiHUBkuCBCVcAqPZ8J0Q8G2i1y07DsiEKTVYFxIx0PnZeoadj3x
 NxxmQAAJFNRPiBB5MHUpm1dcUdoDvQ==
X-Proofpoint-GUID: 31WzH6oQ-9_TYH15Oo9fJ3cRrMPOPVEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180002

On Wed, Oct 15, 2025 at 02:49:08PM +0530, Ritesh Kumar wrote:
> 
> On 10/13/2025 6:04 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 13, 2025 at 04:18:03PM +0530, Ritesh Kumar wrote:
> > > On lemans chipset, edp reference clock is being voted by ufs mem phy
> > > (ufs_mem_phy: phy@1d87000). But after commit 77d2fa54a9457
> > > ("scsi: ufs: qcom : Refactor phy_power_on/off calls") edp reference
> > > clock is getting turned off, leading to below phy poweron failure on
> > > lemans edp phy.
> > 
> > How does UFS turn on eDP reference clock?
> 
> In lemans, GCC_EDP_REF_CLKREF_EN is voted as qref clock in ufs_mem_phy.
> 

Ack, please fix other comments.

> 
> ufs_mem_phy: phy@1d87000 {
>     compatible = "qcom,sa8775p-qmp-ufs-phy";
>     reg = <0x0 0x01d87000 0x0 0xe10>;
>     /*
>      * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
>      * enables the CXO clock to eDP *and* UFS PHY.
>      */
>     clocks = <&rpmhcc RPMH_CXO_CLK>,
>              <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>              <&gcc GCC_EDP_REF_CLKREF_EN>;
>     clock-names = "ref", "ref_aux", "qref";
> 
> > 
> > 

-- 
With best wishes
Dmitry

