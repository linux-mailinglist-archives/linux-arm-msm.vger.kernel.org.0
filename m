Return-Path: <linux-arm-msm+bounces-59698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12623AC6979
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29FD3188EE33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E53C28641E;
	Wed, 28 May 2025 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rk8R8F3L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28726ACB
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435815; cv=none; b=gFF7ASoVI9zw+NucL2ZI840dV9MeVFAXx3CvZo82JvY1k4A9GA9FrjWOkEqpVouI12G5Va3AdsML7osLhTOyh0xCNVLqfKRo0IbO9YeT2glFtOuwFk/U916DbhGDGtY5+TG+DSq0EBMT4hFUlLBgw8lB61+iKTe6vM6LjaTVyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435815; c=relaxed/simple;
	bh=+d+Dgx6T33vD0cozNs7bK5fSBnBdozXp1xhwM5wUbEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZcxSL6lmZBw417zj7jIaUcK5Jy+KJv3JPufz7Jp34WIjaVm0jJzmiL2kmf6z0n78jUpzDK8NnLJl2jLqEjj4qfk/TNBV3fyYUCGrHEveFv/zJxo4im10E3Ramqn1UNbe7v548tftnkGvMeZ3dr3jEvG9pZovP1Z+DzTd+rfUnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rk8R8F3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S5xXrm002206
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7iqoOFkOMxkEavyQAIIyueEL
	JpmJHfQksJO2ArqPxus=; b=Rk8R8F3Lq2mtJAmhJRQBtrdU0JLCp4axi2aLgC+I
	pYOVcYfwRVTlgWlBmsVE14GqMqLi0QPjXuurSztCbJ8l+MU6AqDkuLtyWceH1aFM
	4v/e2HuVvv4KybkMOpREmsRksz9mc8M40fqpjmEk95KGSu6nPmkWYzs6Vf3jsZp5
	bwlERrY3LH0hsfewE2KQ0azk3M2PEzQkRdAu2wgUeMTAPyG9dE9FcXToOIVsC+sn
	216W9qqxk2OzUEYTsVmHujXf5TYZRBhyLnj2+e3S8NDA2shMiTms1nPMF8/9bLcq
	tvMRIQL781CG387gzCGkiPh5jmi3OfRCa2GhvJoK7R1z1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkuyym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:36:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so398105285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 05:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435810; x=1749040610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iqoOFkOMxkEavyQAIIyueELJpmJHfQksJO2ArqPxus=;
        b=vW5068Iq/npw5ZfhtzS1FqWu3ow0EKnw+Hxk+3dpVJy4cjLLe6yEYAtdFtt37pcYD5
         3aicm9C323XkNFrbRU2FF7b2jQi9qQ89zFDKEizBeWX+UyZlVVcZOAZM0p98l8jX45RG
         RBGopvPoETl9UDVnw3aTq8eucaFrQvTSwIuTza9V2fgeaoZn6birGWUAVbQS/DyHXfrP
         YDr2TuKR7whCs7KLqoYRVYEdLm/IGNgUhugqTIXM19AsFubdmcWtpgJOPHOsQl721mbN
         xjWiF9VxdFSlHZPYBXqj3AKP/MHuAeUOcCYsCsLrUWgy5D7SmLTeXELlFpqlkajEvZCK
         PwFg==
X-Forwarded-Encrypted: i=1; AJvYcCW3VFWpa4PGWyDf1WPO07kZ7HlJ4C+gW3S2ulNn+sTjEXn6aieZu1KAWruiFjTpKQDTnECNcz8AVar0h2xa@vger.kernel.org
X-Gm-Message-State: AOJu0YxBhodajNTFSG9GKYhcYnT7AcvuhAIF4auKtroCeoEH8CH6F9FA
	1iAP/ewOnSL0HiKRZp/Coohfd0TNvdNsQWS+QcTqc8bLsbna8Oe9RJuya4J20WkZB/1cXBaFhB5
	yYVrgo2lXVwOn/J07p5auy0u1/cbUYYv83dSFdLXbOqOm/ODwWtsT1TqRzVAB6e3atCFX
X-Gm-Gg: ASbGncv6xi7EXTLIn2D3qyyjOgDxcQqTwjatFU7gU6VlhnzC6kyQZ8yGF40OWnP/fNt
	bjo/BOoXcgswugpCCGYCasU724QfoKZ4aXC0gTRVs9yXWuOQVHlxeoxdy0ddEmOA1E+8e/VQYNP
	mUoiBbwcySL/wg6xqLsKa+urk7CxpFMicApv4CrIb/fXMK0I5juruUg1fKl/ANwY4qYzuKMQrnK
	B5NiCZqRsC0gPMX+8HrwklAcPyiDWJg4o1Q0HlCv0ZV9YqqbdO96uLSUZnjkP8W68qF/8dOP9Tv
	/955e2XkWmm2ZfDUYt/e0f8qf/dUjhjJxiWHl5bRCjcWpt3BFt054+nBUWJZl1xANd/L40bM2I0
	=
X-Received: by 2002:a05:620a:3194:b0:7c5:9c12:fc8 with SMTP id af79cd13be357-7ceecbe06b6mr2326086385a.38.1748435810290;
        Wed, 28 May 2025 05:36:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmzZ3O9RWYNfqsDI1F+HWtAjiLwMglKlUfuv0dBseFqNB1H4SfpNa0Y/qcbFGi1IyFZlepfA==
X-Received: by 2002:a05:620a:3194:b0:7c5:9c12:fc8 with SMTP id af79cd13be357-7ceecbe06b6mr2326082685a.38.1748435809851;
        Wed, 28 May 2025 05:36:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb954dsm2287631fa.42.2025.05.28.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:36:48 -0700 (PDT)
Date: Wed, 28 May 2025 15:36:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/10] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <dnvjpirgqahdlt3kxcpyhooaovpqnoobetnt3b6q6fzsrsnewr@p4smaofzf4qp>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-4-d58de3b41d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-4-d58de3b41d34@oss.qualcomm.com>
X-Proofpoint-GUID: qeLtEItYiAlyhV-_-XZpjTDqesdSyj8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDExMCBTYWx0ZWRfX8taVBt19XrMh
 12sG2TG//Uh2AftRBEkmWT+hdb497x3vPuixCH8b3yX68ActhNoytYkwvwe6xQeLUOvMMOq+JAO
 VT5E4oMYcgw/xgnnYqV4hRi1INEbojLkBIhRYIQ8ZxLdOd7fOYxGoLHlP72iebMoioO+OtRXUUl
 PXp1qXlOw4rKV4T4a7NHvOlMQjJM0ADCQstRtTkMgk2Y0aUzBuG/lB2dsjh2/vUug2V+GY3RD2T
 /Jjj+wGe9lq+ZVDAvSrfwJBVNjLd0tTVc8HUWSbeyiPiGt4M1Ffte3v5NlZjrPPnqvNDpET+SG8
 X+hDNFPYVDQWfJn2Zqgfz9NAOg/K/Rehh8EzG89PQ/COMvMiv2dq9GiIYmaIdH+aqCa/jjPl5sB
 U3DiwXJ34ktb39UfmXRaVW+ifJD8otyhon3czzlR6C2cNRKzj0n42jv/3ytw4+XvN06D883o
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68370363 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9yGODh8E-QI5J-fucZYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qeLtEItYiAlyhV-_-XZpjTDqesdSyj8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=831 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280110

On Tue, May 27, 2025 at 02:04:40PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also adds the required PHY sequence that
> is recommended after running hardware characterization.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 428 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

