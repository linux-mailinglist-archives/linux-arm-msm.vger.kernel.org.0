Return-Path: <linux-arm-msm+bounces-58899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8026BABF5A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D673D8C5CC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1864226B958;
	Wed, 21 May 2025 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYAarRUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0812D613
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833048; cv=none; b=qjZweqG7SLKWG0dOTKbyLWwcTItjgV5pJpDQBqIW6iV5tnmDdgLZFVTxgRPRLvtkdHI+VDCo96esdFjWj8qYYCmI3ztJ0XAwINNBbLJ8rpeZZ2/7wqWSJYZN1Ym3kQ1mf+U0psnzTsnn7dh0tsCcFfD27o6Vzp11xus84py8/AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833048; c=relaxed/simple;
	bh=Pou7Zf1nWdBAa81MsiRtS+CcK5ufoZZj5UNXInbNfnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5p7TvbkgKTqpGauwXxO2P89pLAXrkexEBFr1Sb0WpBOyBCwjgv1tvC7gAe9Bgtck81Kq3C4+GD8TVEumuv1K7LBkXFhqkQGhkZfBSlVi7Q6F1NziiwAb/6EVzTrXPHAlwTlia7pnYjmqXvVSaXznDXGCd7rN5hXVVqzoV2Jz/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYAarRUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XPBN016624
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Ny/4RwhOxpOmW4rwp1crSoL
	yoLz1hawgITXEILYp1I=; b=CYAarRUY8eShDDQQXm6E0pYbgAweu46zPiHfIjrr
	usOr/DM0N7EwsWUIg+Iymx3dX0gXNBrol+ymBwYrGpiLPnIVx0hA+R4Jl5iDLrp4
	Bx/c1KspxwplPilU/4XCnFD90aACtX+6zm9BJyYAy/enjoj3EYHAZZYaaiaIYrDU
	qPjrxd0/MnV+XBdeTP17ZvgNtPfIMhdCWb9d1BQ6d1RGi/XKlnxopDNUZm54ck6t
	vjlIcVswgbpWbheZGedHegPoHyVyx/JsBYWOijQMmz6uuFJEHccmvUeX/Q5IS9ce
	F/si2F38Uj9qtChmHpPlXOLWxjMk7WIVwro/6NYo4/G5kA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9u214-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:10:45 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dc88ab5cd6so6382495ab.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833044; x=1748437844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ny/4RwhOxpOmW4rwp1crSoLyoLz1hawgITXEILYp1I=;
        b=BVR9xKXyIl8MYbSAc6L2kfytMwnd0qCheBYyR8AVDzr2p3oCQ7Jve3eMiDXpQAuEa+
         PXIBoDZsWiBGlJZBAK5JBltpfhv11Y/cgntWdFXOo0uOaGJ4/LXvSDNK/fTqzlNOOZmb
         5WD4YPFF7oqPYmYCuVrT4qWKZZGsC7gKtQ/GOUR9pRrFdNWB83lzKbH2Eia9rDQUMHas
         7yr42x99QNI0oJWB+nOjeMUgsu/WMEyd69bpLUbeb7yDHMayhtVSuyk/Mdt0tTuOX3u+
         uNMzojEgnYxcp65D4Vjz/aoaL6qYvzX3CtxB6bYPx6K7Out30PMLYfF8J3XBPKOiS+Rl
         R84A==
X-Forwarded-Encrypted: i=1; AJvYcCXnaQqW5N7idJVErXvawHSKLJjRfMr9e6nfht1mzJ7GNto/qwB2XNfOHxEOG220BkIhv93ZCjs+Z4hLTzvG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz6gXGidEL8NKgfzO0toDMQIK+YZpMhcw8Y0YBtSc7gHdYBuHv
	tTOAragfxXzk4RqVszRYeF8enO0KTtXjOMWvuCWH3iYL36wOcJ67mMW2HNd7WfdLRzUMauF6VXL
	2QoKaxqUbDtpGuCqgMYvMYyhYpDX6TiMbe6QS1FVKYX1JDU493IX35ElZOaPvautdJnC5
X-Gm-Gg: ASbGnct6ZELtw4ZcBIVbUWlQoA/WsAj/XQ2Z4zo4E1mZkBubzmSaGit2tM/j/fz1F92
	m6EOyMANtbiT/E2nBQcSeurz21SELKIq1NOQcvsVeuooE5Qy2ZprjlaXcyrp2rPEIoiCY0Aea4B
	2uL+3zl4QRal/B7F3967IUM8dg22l9sAEKmIy/OSnFy/8p4Q+IO5VuPejKuYVqjqfd99iWnuCS+
	09otY6tImZxgLXrTzagNjYkYe/SS6GTXh0yNRc7bus2tWsDMV0p46Q5lSFxiaxXISgfCzwYrMJZ
	sKgijVxMynwSteaTao9L1iE6LvjgoecLRT9VM+yyNjjJQWCi/q0it/4/+h0+2Mc69BAkbP/nCno
	=
X-Received: by 2002:a05:6e02:5e07:b0:3dc:757b:3fb2 with SMTP id e9e14a558f8ab-3dc757b446fmr75183485ab.7.1747833044288;
        Wed, 21 May 2025 06:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKoNhtb+5owKr4FzQyiElr9BMC7t8S+TkjVWacZxR6aDGOYdAfaPB2hP5Fm4Afpv3YSeiSkw==
X-Received: by 2002:a05:6e02:5e07:b0:3dc:757b:3fb2 with SMTP id e9e14a558f8ab-3dc757b446fmr75183255ab.7.1747833043939;
        Wed, 21 May 2025 06:10:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e79sm2826647e87.154.2025.05.21.06.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:10:43 -0700 (PDT)
Date: Wed, 21 May 2025 16:10:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, bvanassche@acm.org,
        andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 00/11] Refactor ufs phy powerup sequence
Message-ID: <ni7kedpcz7vchztb5qrs5msdt37mfdoabtt4gdqsaiwmbxlb2a@im4wurr77z43>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <yq1msb6lowo.fsf@ca-mkp.ca.oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq1msb6lowo.fsf@ca-mkp.ca.oracle.com>
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682dd0d5 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=66i0CxVaxzDmHRmSCfsA:9 a=CjuIK1q_8ugA:10
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-ORIG-GUID: r7sG_v8voI4qvNOHyPmXRIEPr5itb_yv
X-Proofpoint-GUID: r7sG_v8voI4qvNOHyPmXRIEPr5itb_yv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNyBTYWx0ZWRfX3kz2Yzoo29C3
 1+3cJRipJa89DaAm7daHWWp8d75Y6OSi4iT6dWcTSMzoTTrNsfejDwUkl5PUUscmavZnMwq8Iun
 ObvWoKX1ohdPK6aureUgE8/uaBZk0E578mVlsGmIfbQkW68TZVkOL45LSoARZLU/weuQKnWFG6F
 C6JJ04i8UtqqNZv3C7zC89YVtP1qvlc/EnN0DeUSe8PQa9bs5rsSo52W/5RBYZiNUcE1byB6HfL
 PjaNpEp9VZ5nBE1HWz9bqI0lA9Bn4n2IxNU1bWG4llQc+V53U9u9Bs8f6ZCOQj5Yy4CGd9e2ij/
 WuvQiwBEVXTJHun3Dw9LhKbyO36L16TqJG59vyzzDJlV7SGg6H63XKmO8rZsU6HXAWFM6Xxc6IN
 n4vFAQyKF4/huFiNzS6sk6ICiBOe1NjZIUkmZEKvfe7ZcgtDfr3XgeSaNGdup5CHFWkm9vlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=849 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210127

On Tue, May 20, 2025 at 09:45:40PM -0400, Martin K. Petersen wrote:
> 
> Hi Nitin!
> 
> > Nitin Rawat (11):
> >   scsi: ufs: qcom: add a new phy calibrate API call
> >   phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
> >   phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
> >   phy: qcom-qmp-ufs: Refactor UFS PHY reset
> >   phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
> >   phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
> >   phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
> >   phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
> >   scsi: ufs: qcom : Refactor phy_power_on/off calls
> >   scsi: ufs: qcom : Introduce phy_power_on/off wrapper function
> >   scsi: ufs: qcom: Prevent calling phy_exit before phy_init
> 
> What is your intent wrt. getting this series merged? Can the phy: and
> scsi: patches be merged independently?

Unfortunately PHY patches depend on the first scsi patch.

-- 
With best wishes
Dmitry

