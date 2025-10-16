Return-Path: <linux-arm-msm+bounces-77502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3FCBE111E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 02:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 493264E391A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 00:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40F73207;
	Thu, 16 Oct 2025 00:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVbD4ji1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B77D366
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 00:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760573123; cv=none; b=Q8pE3zASL2oXwuN47N/1MU2gmOV+E+YLAIT2WkmfLzqFXYlVsmD9FA3fsPw6wyKRotZdWCOmSuSUoiOahbbhpZUyixW1c37ql3zkfvb7USy+RkVaX2RbPgxlH5RvfEFWB7jzIh1ldwFOu/56uoJ2cDQLQYIMc25mcFpOyJh9Le4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760573123; c=relaxed/simple;
	bh=Fax6VecnDWG9WfiWu3rGm/yJBg16kMyhvyosAjZ8fYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qd1oZzXQWn1x8sBNS1Vf2PxfWH0rHRWcxV5QEkSnRIJURI104ZIwxqyCeI/ztpqdjs7ytr50i7TsKrt4iVT22HSWZgDvLDoOjawqsmtCibw0iamv7eI7zYL+zOLu0AKlediA1Q/bwTJJNEeSj5zjIYwA9l2YntaipQeW7opO8xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVbD4ji1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FI759n024859
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 00:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ttH9o+JKFt12U4z1bUTlIexU
	G6jcvhEibO1N+cM/DzM=; b=mVbD4ji1HvPHj0I8MTQbn2quhJKosorfDjRHqDmi
	vz7qiYp3yhclG7K3UIUh4Jw4sDqUokOwqsDjDWcDCeDD4YhEAT73v8Zq5orGwd8g
	nvUyuhS2+KgTbIlQvVPGQYw2goRA42L+yqGvFAx2GsHcvqcMuqpXpHgPWKcfEsvK
	nv1VgxufuYnUf0ZT9RzQdR8R93HsRcEzWNSoUdg/I/cfoINn9Cl7ZaEWXYsHvLcb
	UrJCahJKXyz5H2SfvcsZycMe7f/HNu4MtEt9Cw8fpLRPrrZotGb2Fq3t120/f3X9
	MmTkszG2aaxB9kSeU4VwnaZyXoGCa6YvhlOvOOxfURpYhw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0xak8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 00:05:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c1115d604so6683926d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 17:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760573120; x=1761177920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttH9o+JKFt12U4z1bUTlIexUG6jcvhEibO1N+cM/DzM=;
        b=fZtYC6RllJrOwxWTzky2GsMJZvvjvswuuJgnulV/xM6X+ymR96LrMmqQ/gxOV8pVz1
         DcaOlGTAB4fEC0RD9GOLT0Y00b7Xtg4G3TmS3dBsraldddXBVfKXsRtE4mk/PMf+7DOD
         xgdMxnCd0pEmON0SzUF8RRTr+Jy0E1KfD5FkMy2emHhNh1ggTQTK/EpY12J7wFkTiCaG
         N+UQSNSQiQ1b6MDjhpJCvwvSErJ/mQ3ndlp/MGJ4d7Cl0ukbFg4N3jSWD0wNnCccaJmH
         Iw68K9qq5jVp8Yp4zt+ZuwfFYBAQZC0NbH1kP3Axw5OsGb6dVVwvxqyWYc+qiX5nPPFh
         xNUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrdIklupl4/PHs+1/OQpGG/59CFyKr9s32U1Wi3fcQ6fQLM3HiewtlfKghYVFQ5l0uR9wenO+F21PkAuRK@vger.kernel.org
X-Gm-Message-State: AOJu0YzrK6Bnbf8PeDL3WTaXuTdmUtcL8fMqJM3Nyj1wMQo3HNnHNKiL
	edgC66SSqpCMEMt7AxPEVH8MWFrRJukFM1Sd8vY3T36egn4JRQ3sKHenXAye/rO4WvQs9E9CWa6
	gwZa8EftGp0LPdftY3vO2IC8oiPHkLi6l0rR/2jZJXtmwi78IR/wveZwjNnzjCRediVTL
X-Gm-Gg: ASbGnctn3PONynzq3JZLC4nl448QcStqFWUHf5VOORlsIWoY6jkJ00bpJdhUOzc32q2
	1gu4/XVPLXdLKXbn3j3uiXyAVuzvJACFRba8iqqPQj6UEGNVJ2kzvuQp5PVqwMnhszNAwI3V0wt
	cR6wFDoHuQlPSvo4t+36HIfYJvUBwPssfK+O8QhNXD5Enu3wtK44RT/1PQLM7eBwhEpDpEid3eB
	HnivKxRFihqDNaI7TEWMZrARu+hzukPND6qN6hWFv2yqIxOlCBpd4ooUw/gOBtUAVrOa7UFix6R
	kwo5I8L/8OZ+QpGBfi0t7gjj+Hfcaf4QQc8Q3p3uQdm2A5ReJ87pYC7JL6jkMnnbK9B+QnloBSa
	VOsxWnch7Jct+fbCnxGoExQNZ9S4wBqFN34GQBtHl0XnC9pJOXqnUVOxEJ+O/zWiFpoWUihxEyi
	NzJZnzh3m4uVA=
X-Received: by 2002:a05:622a:4890:b0:4b5:dada:9132 with SMTP id d75a77b69052e-4e6ead709f2mr460284831cf.75.1760573120301;
        Wed, 15 Oct 2025 17:05:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPHSdX8RqUU8RAtgjSgrc5QwEf9TAs3cpNtbgxxS9fE9uOnZFE46JhxPCkQd6l+F9bJayOlQ==
X-Received: by 2002:a05:622a:4890:b0:4b5:dada:9132 with SMTP id d75a77b69052e-4e6ead709f2mr460284401cf.75.1760573119860;
        Wed, 15 Oct 2025 17:05:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f8c79sm6592635e87.34.2025.10.15.17.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 17:05:17 -0700 (PDT)
Date: Thu, 16 Oct 2025 03:05:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/6] phy: qcom: qmp-pcie: add QMP PCIe PHY tables for
 Kaanapali
Message-ID: <k7xjihanbqelhm6pytrugv73pc6bmspn75vy5a2thcqnxkzwhd@bsyp2nqkl5rf>
References: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
 <20251015-kaanapali-pcie-upstream-v2-6-84fa7ea638a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-kaanapali-pcie-upstream-v2-6-84fa7ea638a1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzxXR9hqepqZc
 sia1mVxGGbaJMRHXRpXBkm/5lX57z0lz5lU0K1ZKe/mxotD3za3j5HkdHYBox6yvbddnkCALlI3
 CTQUptekKyQwi5547cJCLw0d7zzFkKNwdcgFYnY0LwNXlkSksHQJYuaHQBQv1cMQHgu88VbB+Yt
 vEUV7t2B93dEnCvT2aPWN8YLib65n4oblbI2jTyFpR8LoWyFimXdZqN+jlP8HjRdQIuEEE6xU9T
 k9XgJUH0XyPufBc31RViTZvO0AmeCj9zIlae1MLoSncKSBnICw5KABZKCh6xn5uGQp7DDztM4A0
 16hGtw/UHBTywMLX9lGvPTaLbRZFyiqhBFmFQSqnw==
X-Proofpoint-GUID: nDJ0wWRhuXy15OwCFtjPQv-6OULmUb_d
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f036c1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=tdoatHydnEAQPWUjzvIA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: nDJ0wWRhuXy15OwCFtjPQv-6OULmUb_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Wed, Oct 15, 2025 at 03:27:36AM -0700, Qiang Yu wrote:
> Add QMP PCIe PHY support for the Kaanapali platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Who is the actual author of the patch? Do you miss the Co-developed-by
tag?

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 194 +++++++++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
> 

-- 
With best wishes
Dmitry

