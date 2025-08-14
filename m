Return-Path: <linux-arm-msm+bounces-69112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5DB25C61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E32A6189E724
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 06:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140EC25C81C;
	Thu, 14 Aug 2025 06:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFwL5LfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4013233711
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154665; cv=none; b=kqUJUU3b92WOQzYQ8Rg2Q7V/fGqP6W0PX4f/tmTHTWwCxmaZV1XRJ1T52uO9SC5XonWPKFuQxNaINI/LWTrql9HQGgbBNnv6i5G9YVlca+cJxUa7gO1eWt+gd6wRRETo+29ipPoVPqHkDOnzBDyKPaLQBVszdTDCCkPX3rPO+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154665; c=relaxed/simple;
	bh=2TlK50ADSnugtMeEFZsEk1xa7yMDhRG+pO5OGKlwYtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUDlA4MlfzE1HBcJMMTQwmAtHAe5qBFELuyQ3EiUiZdPS7UexA7TqeVxjaxUrXCW+OkadXGyhb8Cn60NpLqOPB5kZhpE2UVFjHJVs+72Mx4hBWhHal7oCUCx5d4PU2pSDdMY9GjmYo6By5/z7vPmHjjn+MCoXmElCCYKRMlw9Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFwL5LfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMbBlx012998
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WH6pheIOBCLhktt4o4IaE6vb
	Qet790mOAdYrq4OwLrA=; b=JFwL5LfJqGhhhv/hky0HR6Ild24Yz2XcjSC/F2Pd
	l/y9dNif1VXOMtJ6jtXx5rUwADOwQ6jsCgYGzoWmVQHYhK+2UCzNA6W5P5tBlEAq
	S03NXM1SShFXLTgr8m3YUKGVlQnUO/tWglYkqgM7Vd/XH8GaZA0AjrlNF7PDUHl2
	GoPb3FmLK5tvFXydN1otaGC4OtOiLUpZ/U6k9ZkVXoXVlQefKx5XnVC92htw8Rr5
	mIYK6XyLNzoV+/SS6UxmZjkBbbkYLuGbV/SPTqU61bwXztnJGN7punGrWrsb8RdC
	dcgvtdDhv1wd92kvz8v7i0rpE3xpo7pS7+jJIwWgitR7+A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxcu43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:57:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9f57f950so14597346d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755154661; x=1755759461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WH6pheIOBCLhktt4o4IaE6vbQet790mOAdYrq4OwLrA=;
        b=O71YmypXr8bLL0Rye8KyOBod9slAjnebppQnehBh/eg+PJVexB3ETh1q39BKyZW1jV
         9BaUBA326hmTgdkUmQ0E/uJd61U/HMVQK6J9bU0vNY6aQTOGAWvWJHcdQO9CkDU2SmKr
         uFdEiJ0Mdr5Gy4OvKqAkDITFxWfx/OsfZzL0aqbTYsK/rOl5mE/ygd7X2zY5WgWdXB01
         dvl2M504ui5EOecrhjGdwZQ9k/48MMx5ryb2H+V1Nevc0hSwukbuda93BTsf8Szgi5Bk
         FZ171YlapJfh0Ivf+lJG6idhy1xkrOyOvL8vA8rfqeCv1Q4CNCIqT9UKX8XJ52CAC4ae
         Yjwg==
X-Forwarded-Encrypted: i=1; AJvYcCU7DqIIWdY6jZ9brIBmSwsWmsVRGeuCdf+KmPMKk36XePaE95Z9B/F4qBnPk3Wncm1rVGwkseF+Nk/dKjx5@vger.kernel.org
X-Gm-Message-State: AOJu0YxbA/Z1vsxXddxmEWHk2rSVkF5dKMLXg1bPOD7D2Y6dBUjIy2Pg
	j6yVC6fYkqomEpz5UfJUJ91egj9v2xBVgkMH5CX3RWt0DWJNSlZYsfIGTmhiNMuHu3vYuFgKYGp
	LhpVJ5xRKUPw7lBstxjLo+uQyHvOpBH4/WLzCiEyrS/3TWz4lSsQJylMVD7hFDVTD4Qb0
X-Gm-Gg: ASbGncsZ8Kh+cl05O9OyuQv3iBinWmhX9Ucpie0sayhxS02Q+TZMqjr1Iv4LVxCNAyl
	KJVvzapefaz5KysmvvyJWNmatzN3QV3NXHnT08piYuG9EoqnesFcFHkF6w4WG1Q0Tz84dTQo4RJ
	/ZZDKrpWVDGl6ACzEhD24i3pVMd179ZCh8c1t7n38iej9wJDofQN+VCgPtEByyPwnqpNh2IKcgw
	ISKeYjrdFkzRm7ZA4BgMK5N5qOB/+YhibH/RGHciOmGjqMwASjoCldN4F/t8aYXRf8+jaMxXCrI
	jcn3QBZZ/r22avB+Y7oatiZfMR9TVtcJptwNwANWS+oEGLzfXHwDHkY1LdKYZC5D8dXSbiOFK9Z
	CnHEtgGYW3Y6uicoYTGQ81x0nm8eewog4r6JvnRsfJaUx77SP34Ve
X-Received: by 2002:ad4:5fc5:0:b0:707:39f7:c607 with SMTP id 6a1803df08f44-70af5b4a03fmr31187046d6.7.1755154661109;
        Wed, 13 Aug 2025 23:57:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBZQ5FEsnMbOmX8KkrKa9+kBE6Os+GRoekHbqN1j+i/35W5BLwx3DVldiMtvDJKOME7rzkJw==
X-Received: by 2002:ad4:5fc5:0:b0:707:39f7:c607 with SMTP id 6a1803df08f44-70af5b4a03fmr31186696d6.7.1755154660637;
        Wed, 13 Aug 2025 23:57:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc8d64512sm2420634e87.11.2025.08.13.23.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 23:57:39 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:57:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: marcus@nazgul.ch, kirill@korins.ky, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, andersson@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH 2/3] ufs: ufs-qcom: describe x1e80100 quirks
Message-ID: <lj7qsbtk5xlmji6eknfv4ffrqypcsfkq5m7icrz4mvplncflpi@5j2opxwb5lft>
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
 <20250814005904.39173-3-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814005904.39173-3-harrison.vanderbyl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX8U5tEc2sWuwO
 Y3hev2wkSELf7hoSgz8xj7h/IsGcRs/O3nrqOUNolAXb6uu4SQCR4kFu5odnpBniu7loxgGzkD4
 CDASR/sMQGd5cMczGOkr75GE/sxPLR+NK9suNQ9RkYkdHI2kcnf6qyzRv17mbbF4CcIvpkgQ31V
 BBjGjoDzhGVicGVn58Bs85YgLJ/gFI3CY5Z/vnfY2FSi/JgSouuD0Vu9g1xnKBXElcq2GNlXjeE
 Lg8H5g2GXS6642R4ykM5drSZGqTaZLRYjLVY7CEh225r+AYXQuslCeBsQFf7dXFaaJ/BvK8bepo
 rRGbZlEcC0OaaSiT2Dkhlhrz2w4kou6SXwThbhQgaTbfmBEKoaQW1wurpCpeAmbp5r38QMuCN/C
 C3pk6y1l
X-Proofpoint-GUID: ZwfX3k6K1JEqWet533f37wQErs-j1DWB
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689d88e6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=D3Jz6Z15PsX1N0F7-5EA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: ZwfX3k6K1JEqWet533f37wQErs-j1DWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On Thu, Aug 14, 2025 at 10:59:03AM +1000, Harrison Vanderbyl wrote:
> Describe describe driver quirks for x1e80100 ufs device
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>

Again, missing empty line

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 3 +++
>  drivers/ufs/host/ufs-qcom.c             | 1 +
>  2 files changed, 4 insertions(+)

And this also needs to be split into two patches.


-- 
With best wishes
Dmitry

