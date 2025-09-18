Return-Path: <linux-arm-msm+bounces-73998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19696B82663
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 02:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C304D464D81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 00:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DB61DF748;
	Thu, 18 Sep 2025 00:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+X0HKaU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3781922FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 00:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758156142; cv=none; b=Ch66Sz3OeJaI1VfPyZLRgKUUTH9387VA256Up0dBAGnVKDiDlSEgSG+VNvuhxZkD0DVh1G7nOJ6RqdByzv0Pe0rL3F2A/kChtgwqVZccm0JQ6tMFC3jOoMc1fU8J1rPBeeGXUfBgNwIwOxoqzt9scucnNaoouVbqyTjVILbjgiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758156142; c=relaxed/simple;
	bh=YdV7COGGOMPVhecWOYestYtdTpREWML0WlMUyB0sjho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maJjp065/qpewZN1KTkls6d3HFA4JZJEZ4RQF1BR/pzGCDwfZDlhuaOI2O23z2g88LVnGI2lcq/QSMrnWHggY+lHly30BT2qJFs7kYJeomKbRd/YS1oOw59HWYp9yHLzcm7BprAeEV2ajUv8zvk52f1olnIzanLwz/rO1S+lX+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+X0HKaU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HMaBjR011018
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 00:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dCK4ulC9j0Q9Hz2Zw/kTODjQ
	UCKzpgh5o1LvEZMTkgM=; b=H+X0HKaUZ0fry8T8Xiovzg9wDeElpLs9GOcBLV5t
	qxOooFAVASn+EPabz15cRnma6uRbsPXMXmiy7/d6gUNnumgILO5hXQ2DSkDWLS6f
	Yj4eEC+n87tTCkkuyoffC0MTsbBsUgi++qSi/gUv4AV5/Akd27HaO7CvwrPpgyt1
	rs+Sm15iaVwxhn8FpluQjPIoQVbEz7gFHaIAhuyOTDfz1oXQJrLcVRF1zOs3uK4e
	IoD0YZCt7mmUFkhqTvaKPTDh99I8Btm1mQM6qZ8lFN9Dag0SQNdOD28dnPvhkmB2
	n6lsLeCtc3vprB9IPTXtfhsKtpTXrp2eJhxR0CBjGpt2HA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4985wx07gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 00:42:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5e9b60ce6so18021671cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 17:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758156137; x=1758760937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCK4ulC9j0Q9Hz2Zw/kTODjQUCKzpgh5o1LvEZMTkgM=;
        b=RlEBAHDXINe1HaPlmwa/mYmGW/YYRVipL9K7CpPXKlqXNiJklKg8v4riKLzjDkiRhg
         7pYrKtZR6eeh+oWWL6LRtshfLphshviAA/jrAbIHRQ3Yykb0e+z8msOCOEDnIC6YDRKz
         v83iY/Rh5QDWsNpuG9bXici9swRBtjzWPGjhkZyh3GDt9c6jlUgySNl/r0wA+wwFw9mY
         OaV0kQVTFSgx0W+0BzQOmalRkE/CoTnJXyZ4N5ZdgAj2oe9LeZbL0P5tjyM9uZDiAV1d
         wfQb1Whw9Gh9J7W86NIONbEoZHwBJJfGUZhp4iIgUMNa2g5QSAsAef6uBOJjbkfUvCbn
         If3g==
X-Forwarded-Encrypted: i=1; AJvYcCUVni3Vn9yeYfVA4Vb7Vd86Z3CuKm8NHlXISIJVktLUWnUDqYy5Q1jnfdpPgBxP0GynMmQT0pRlMVSiJRWf@vger.kernel.org
X-Gm-Message-State: AOJu0YwbEZxtYvNR8Lg3br0PvxLq7UalVv8c4MhscLOymUXXLwyJQ0YU
	efmBac46AkgkQGPxWWVPKZQ1v+VJ3nAUtFJaoZET0GX5s7ByNDn2qWJ/euumvWBGkkHE/m/WI87
	0NWlcm0EkOxNUhGwQPQWObiRvn/pN6rG0atXYjUuRJzWyF77PmUy+UJ5Zr1VqGhSoCNy26M5xRS
	md
X-Gm-Gg: ASbGncusHyDD041ucQSTlNBSPssVNw51yPSo8qThJoPzEr1IdLOCJOZ/XocUBbhycvB
	07E2WsgeXgCi26dWL8C8O4IvkoLbj1TM0F5oHseK5+/PVK5meW+OqF0UtB7xnxgg4KTalhDbgSu
	kc0uMcJO7tXxA0OWl5uGAMeRhCHmV06+N7gDzB30RKv70+guI9ARQH4hHq0FU/zolecsovWPy2W
	t9iOtknyw2ZagrsXG214EEM/FBsmLpxOmBo3I7NrolKDA2mlFV6du4gEsS/tOgprlfxhX0oFg/G
	RBetsrRsaRzAQmuhygWh43JDL4HWXAfeeXFjyqMC79k+P+gKPImbRoo14xrunxZNRFAnMYeVMsn
	mk3wOACo+K2wK+j7AJGx2kNpIsdbv1HlxeBFdLNhqbgWyCtotdJXB
X-Received: by 2002:a05:622a:94:b0:4b5:e8c2:78d2 with SMTP id d75a77b69052e-4ba6c1e5f1bmr49561301cf.62.1758156136879;
        Wed, 17 Sep 2025 17:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmnlrSOZ+/9rFvAyw/YJlavLLxbcgRskATJaNJjDC/kpN3Zr+Z1o9qxPxwvKeazhC76AmPFw==
X-Received: by 2002:a05:622a:94:b0:4b5:e8c2:78d2 with SMTP id d75a77b69052e-4ba6c1e5f1bmr49561171cf.62.1758156136473;
        Wed, 17 Sep 2025 17:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a65072c9sm251143e87.41.2025.09.17.17.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 17:42:15 -0700 (PDT)
Date: Thu, 18 Sep 2025 03:42:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
Message-ID: <a3fkaue7vbh36gtvofkuucop23spupytjwtsuh4yq6k2rznf4o@fyfw6mi6lqol>
References: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JY2MTt2voThzJjgo_dQOirBLjtT0YXXM
X-Proofpoint-GUID: JY2MTt2voThzJjgo_dQOirBLjtT0YXXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDIxOSBTYWx0ZWRfX0y+PH+1F1kKq
 VKKJd//dv1jPSzn6ckp7o1npKxwOK96DD/g1T/LO1VN2FpQ+X8F4sPJB3ZT0Of/o0gzHZq6dkwE
 FaISa9LSDNILPQnv+nIjFLsyFI8P4JlEu7r9/fIV4ZK/U0eTEan0ncbBcknf7K/hqoYPciFI/Pn
 mvuZN5TZ8LoAaCK8FJjYXbBevz9C/rXEHuRA0wGJaHeMKfc6Vs/I93rUKdQQu/lyhMBP0fX6RjT
 sN3TJhC0dzzwkC6g3PZJ+TqYJ4YJ2X0YuF3rhrL5J9Up9wFyQv3q/ii87H0cZQ9YgZL0xdusglJ
 gatNhR+dlxW7eadB44/18QWZ9Z6uYMZN1H+mRv0gS7rWFEWm/mO5Ynq96BqlbX/Q6ZMJ7mIAOy8
 yJzg+0kJ
X-Authority-Analysis: v=2.4 cv=Fq8F/3rq c=1 sm=1 tr=0 ts=68cb556a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170219

On Wed, Sep 17, 2025 at 06:35:33PM +0200, Loic Poulain wrote:
> The PM8008 device is a dedicated camera PMIC integrating all the necessary
> camera power management features.


According to qcom_socinfo it's not present on my RB1 board. Are you sure
that it's a part of the main board and not of the mezzanine?

> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 81 ++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 

-- 
With best wishes
Dmitry

