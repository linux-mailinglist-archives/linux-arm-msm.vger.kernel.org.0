Return-Path: <linux-arm-msm+bounces-55359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD1BA9A9E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 12:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B42037AEF7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 10:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4236F21D584;
	Thu, 24 Apr 2025 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXWNQZKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968A0200B99
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489926; cv=none; b=pC1BJc2vXVCLPvdEeaqI87o1Q5NzoU0+FZV/QeDwM8VTfmaYjHFX/fztSJWAf9ETawbWGC1Yi39DsFXrrTi0NhzTBfSYac05N/xsVkWR5aXpfhNOESrK6NG7vjZUaP/sluLpvechMc7zjD3WZZqwIu7o1f6UA57PS+hw3sCSqRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489926; c=relaxed/simple;
	bh=VwIF9MZwN8skAcnpaYsKQGj6HgJVPjIpATiFvE46JIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1nsAVzwK4AT6oZleEKVAnXCg0oKMWVZT3PbQnMd73gi/oVjwFKVO0oPkegDgzzhyXW18mEaJRKmZKuHr6eFv4xJeAJCUZTV5O7JLkgu885F5l3OcuheUNZHTHyEwMaHqaahsUyy9auxqsDSilNv6C8g4FpwGMQ6LXea156xRXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXWNQZKA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FPWS029147
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+CZ5yvanwkNwsrX8wbr0v7b
	U5gRB/4DWTNm7EwR2xs=; b=fXWNQZKA5tt55ydMaRlEOxI8rt25vsq1M699s9O/
	WjAuarD1DKKd/nTTiQg+ZWmsp6YdMHuDoY1nIznIYRQAZ1fNRQvsM4QKTF+Sndvg
	qhAAMFrcLtQRbVD261Qae/tRoQk+oJsYcg/ja0VbIvdRjFriWLU4a5ltySvZM5sG
	wq7xdqsPuiHYVA1F2VLk90hltCiiWf/MADWXYbhM3kOW5TeXA2hqB8+M+NPcEjR4
	Ab9MBQWGe3HJFKcCEav7V5ksv9JmNneYYkqCTBKvRxjIjC8ITyI9YGGbfd2uEEpa
	O1mRIo/TcenQcgSu6mjx/yu8Ug8uKDxmv7CuPBU0SWJigw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy555y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:18:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c77aff78so247949885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 03:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489922; x=1746094722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+CZ5yvanwkNwsrX8wbr0v7bU5gRB/4DWTNm7EwR2xs=;
        b=JBn7SyMpKm2U4Qs9pMya5581lw8e/BN9rekGwUIA8GKQ83u3MrL5SK8Feh018URlMX
         BuIhrDGLZ0jUjEp33T9n9aiNSSup9uhLDO5tfht57oxSprnKPQMGl17nFu8q9MW0NqF2
         VYa0ScYeYxsR6Wv2i0dfInEnfYZb3a5XMOodav/AMVezLdC40nT69etxcR/ebJCcsZA0
         AEPNCzE4+mj3NI6lLxhIUjrCRkKG++tHBL1mtjlQ3k7tvt/3ukd651PBohGCx0XtjMdx
         ZSri1QNX9LDUDphZeMprUAYiaLKRXFfku/o2UHlL+LtRyvBh4PADqxzI1gpk8flU6npZ
         adsw==
X-Forwarded-Encrypted: i=1; AJvYcCVRHFM8YPaGH+HwZnRrOBIfg7jhOeCyHs3DXmE0SxR5/J14nuTNo352vpUpCnAlfnz5sjrGnus738k4s4mw@vger.kernel.org
X-Gm-Message-State: AOJu0YzMVH3CYFZRsJa+HkO9wTxlSHO4GwdbARaypig1lyOM/ijalRId
	Twu49g8eP+GVRcHs+sfgMt9lnV2lPcU3dPwolYcZu3N2vtPgkvmmqLkAt15WDChRueTbT6Z952Y
	CgwTFMGiidrWBur3eR612zDKshHyegTKKR3CrdagbEigEecZM7Tp4fq20P1jj6GbT
X-Gm-Gg: ASbGncvBz2el5taAltLyOclAxppH22fcTmWb9ZzLS38nARd+iEjLlA0YkMhO2oVb8rR
	QDPJmWa0xj1J4p5JAWh25ogZxdnJpyy3IQs1T8KroH8OkghHmPhiLbqObjdfaVVp/j3CIxyaGWz
	R0amZ009S+aruYVNmd4erfG/T4Qk6wx5h8+EP4UR8cMPy4cwGKqmBS/x6nAkrxkzxzx5iA8SBx/
	Mzl70c8FHCgNO0++Nk3tIFTwDek8OEidF6Xc3trWcRSW92LEEg0deCUq09LtiIUp8VMDO/KFS9b
	KJld3TnxaO79/QMDu4skIVE+mJxaowlf3a8pMGSaAFk21TmXAMj9NZ5AK53DnA/AG34Mqg27HkY
	=
X-Received: by 2002:a05:620a:2453:b0:7c5:4eee:5406 with SMTP id af79cd13be357-7c956f5f787mr334007185a.49.1745489922688;
        Thu, 24 Apr 2025 03:18:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUyasljwk71lheOvieQO8GWyGCHy47iFL98wqeOfteeZQyBP2cQ9ZJ7ujqmqOzXQolEaEspg==
X-Received: by 2002:a05:620a:2453:b0:7c5:4eee:5406 with SMTP id af79cd13be357-7c956f5f787mr334004385a.49.1745489922351;
        Thu, 24 Apr 2025 03:18:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26242sm181296e87.21.2025.04.24.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:18:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:18:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 10/10] arm64: defconfig: Enable QCS615 clock
 controllers
Message-ID: <2gqcoofsvftuvvo7fl7ktkevrhjcsmei423qjdownslucqezib@xpcrhcwnwn3m>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
 <20250424-qcs615-mm-v7-clock-controllers-v8-10-bacad5b3659a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-qcs615-mm-v7-clock-controllers-v8-10-bacad5b3659a@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OCBTYWx0ZWRfXzRG44SZYM3OD gJaHZ7+Oaw8x+f253CV8M9i8NK2Fo3XUqZnM6fDm/7kCzWCsMBHJByhBs61uzTALiHYWVpj+KPE PeaGAWqEP0GzC6dcfOjmeZD/u8rSQmZ2usz4vb6ZXliw1TbFaUUgKudQruFELg5f6EcEzdzZ/+W
 sVjWKzxtXczdgO74djl7hOfz6HbdAynHFTdlhwGmqQG2z6Zewaa0OzWb68rXuu3U4VgRF4/vMV+ KYjcijtKPraN0PrnnXaN1EfQ4+chRVdGSlKRYjP6arwVZ4xDaF63aZSf/qcQb4a6FHEkZ7JxuL5 XSUTB0phRorKGlvVG6bTHGRTPwSgHzYJjCGGR0SxEJJm+782Z9b+o2IQY40tPeL/NZLgdHu1Ckl
 fzSSb3yJHo7w1g4Ro3RIM+E+iZWSpMTrR97VeQYS0BavbMKSBJWDFjbiUFpY2kQdJGArofXd
X-Proofpoint-GUID: JoldfSyKQxzg4WMOglbUo6veNMc6nZGV
X-Proofpoint-ORIG-GUID: JoldfSyKQxzg4WMOglbUo6veNMc6nZGV
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a1003 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mLCiClLL8ZwIBs7X0_kA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=617 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240068

On Thu, Apr 24, 2025 at 03:03:05PM +0530, Taniya Das wrote:
> Enable the QCS615 display, video, camera and graphics clock controller
> for their respective functionalities on the Qualcomm QCS615 ride
> platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

