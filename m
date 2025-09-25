Return-Path: <linux-arm-msm+bounces-74883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5029B9D31B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DCC216C9F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3581A18E1F;
	Thu, 25 Sep 2025 02:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE5kPspM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6982367D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767422; cv=none; b=qnOyDH7yWJjlbxtGMJyIDbUW0apiroluYc2c/o7F6dPcQooEZ+x510NPzmYlIBDlyEofd2n0IAilFqstn4N4V0ReZ6v/N69e53roVZ343JiSU0QomAMQ5XCUaRzTQaO1nf6m/GRhD/AuSXTxTjxJwJMyr11Mr1IjBaIsMz5f1oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767422; c=relaxed/simple;
	bh=plWV8FVZhzKc5SEDmUQW15CvTrIhFuB2nHQE60yUcgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpQ271RC7jqDbsSZG/trjScuo8Q5VWoIYHr5gUuEeluxfMsxKBI549YNRUO/jCSvc/dZxxRKDgmH24TeUZoawPTVJA8XiB7eJGxf95hiFs68uTRjd7c/SNqjW+R591TkyNeSEysYRxP7ECbBNrqgBlw9yolmzKNCaF6yJO26ZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE5kPspM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0t4DY029720
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hEXHJ+SjOGDYSQB3Fj+ilyow
	IaPOlrIE4x+LCn5HbjA=; b=aE5kPspMgFYexH79wxX5NzYAOWU/cwsECdTvxoQI
	0dg1NE4znLh1q/o4Q1y/MNbnZUj7yR8fW6vBTkVTOLTG3cosBmar6/BOK6X0PHiJ
	KMIQQv0USvLsPqEzNgsMCdGZBXJtGyuR2cHPSzHFilm4hssAU1OR6Qp5cKOIzMHL
	ZBUMSwCi/W37IvS3wzkwTd6mzfAkJhHqc/a70hnQ3hs2EA89NeZplgAzOj0FegR6
	hIoMzmTzM/ssgNtKeqedEG9yAdaCG3sSAPN12g6bx+lObVwTbexH4laB4MYJIHTY
	lkDzOBACtnfArZ+Z0Pe6r1TjNDcIPyUuEXzf0GcbXyy9ow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fpaxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:30:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5d58d226cso12303481cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767409; x=1759372209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEXHJ+SjOGDYSQB3Fj+ilyowIaPOlrIE4x+LCn5HbjA=;
        b=XCOGhBJbeChnoS4dYHGqnaITdAY7kKryKfY7Us2L2AJhXZ/GhldSEFpo1u10IMUL2W
         IZFBCpdvYiYaSrtL9j5pciNrqwFXBTNQtBZVY1qDXhinSxikLhb58rUS7t26AbgxY8Xu
         tuQrDv7t8Of4QLI3F57srOs4w4eBD6mdXvIl++7DPtm8fDntSd2fvDeNJLdodaFXjN9B
         03K0mTY/OtJVjPjqLiEjfOG1ypwaEFSOstx678TWhL9hq49KmtozkugzS9LnxiJRuJ63
         ZW7olKGfRuqZPGEtIjUYGnflstWWXf3iradRPv2jx1wSmnvHvnd56CFLcH2mZDW0XYVx
         d/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCW8E1r/YcCm14woJjYq/39noa6l8pgRNEs61bQ7izG+oTRG05qMjhBlMk1oIOi26MtKH1Bqhl08oTN24Q9J@vger.kernel.org
X-Gm-Message-State: AOJu0YxwlvObUuQts9G0e5Fyc5ceobb1mXgZfcaEvgtwJJmY4Hkl3VTZ
	rvr4MMENVjo67VnQxNE/PTfl+yyzhdYjSogECYFh0PdayoA36ZyuXyaISbb1osQQVT95u4bPvJx
	W3iHrWY/J7VVAfqkXbBiP1zrFv8p57Y/7KwU/Gn+7L7OoBJK4mwVNSYQyuQ4C8BVY6JZA
X-Gm-Gg: ASbGncvR8acdgAjIT+yJRC/WQOHbZNVtt3Ln8jEc8XFc8N9hFL7uBazXO2NTwumbWkA
	tKMbW9lqfvWP7D9m6KbdPp6aLrucjBSSGiR3g8iWMOL1kHKbMjZLdc+GVJ75HnJX7oPUESZxgZf
	v8gp3MpN65b9xQqwYeZ+ZHR04P3PBKChHIws4uwzCra5m0+gkbiBNV+VNCsPcgdLEemSQnfep03
	HKy/3O+kstKOEG6x1HSegjcxlKHgaTGOzWUs7GgR4gWvsdzJu3GGZILUGcdTXHqmZFpIq/n9NJt
	+WUBNo+3ngjjh3GU1NTiWLzoI2AqDIRmQZJBodv5zAa/uN6Wg4vg1OTh8dB1fmo763D8luZAf0c
	QFqOkd936ZIZw7zbAzbRmXCmWM6FUbN2NGFblb6hSUzyNliKt1bse
X-Received: by 2002:ac8:5f82:0:b0:4d1:7f1f:af5f with SMTP id d75a77b69052e-4da48d78e03mr23750751cf.34.1758767409359;
        Wed, 24 Sep 2025 19:30:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYRodSYOZIlp9dQwajaJU2RST1eRjakBYxnpjkIG7EzbAunG1wg2V/xO1WNTRFimAPmbNJEg==
X-Received: by 2002:ac8:5f82:0:b0:4d1:7f1f:af5f with SMTP id d75a77b69052e-4da48d78e03mr23750381cf.34.1758767408636;
        Wed, 24 Sep 2025 19:30:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430c1esm253515e87.7.2025.09.24.19.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:30:07 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:30:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] phy: qcom-qmp: qserdes-com: Add some more v8
 register offsets
Message-ID: <gaazbca7xrai7nubxgyk6gbm2aznqbli57psvzquvwhdfamupd@g64zbtyy3hnt>
References: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
 <20250924-knp-pcie-v1-5-5fb59e398b83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-pcie-v1-5-5fb59e398b83@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4tn8d4Mb7ZtdQFo9468yArVVSAYQ4dwZ
X-Proofpoint-GUID: 4tn8d4Mb7ZtdQFo9468yArVVSAYQ4dwZ
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4a93b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lBzdhH75gVJACzjABzkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX+8mU5sD6O+A6
 +b25OK+QnM9Vr8WUxdb7p3fFeJSkvqFHXNKaoUM0bnS1ed2vxZvKCgN96FT8viZ33vBWcGOZBLk
 Y5bxMrAVirXJTrZ4J4IYCQddkV00kHMuDyF2CW4ugYjIZw9ZjO00cHJ8hDuUyshoFmruGv++5Vl
 n5SYeAeuP0aqTyJe3xgEMIds5lnak2N39TfjX5Abh/vAhwpnKQyUsWmFbPj+2zugg3n5UPkeFxK
 xQidqGMsoaA2kzFROZOMxTg5g4C6zpACQA8K4YJYI+qZjDn3cbtYX/h9j+Fjr8o9rFlHx2Mwb/4
 d4gJyX9KoXc6oJK7WP8alZ5kHPPaHHDHewO1rPtyYEKVshRiiveInygm9CfzLomw0n2RTAYnaIj
 eQK8WrNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Wed, Sep 24, 2025 at 04:33:21PM -0700, Jingyi Wang wrote:
> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Some qserdes-com register offsets for the v8 PHY were previously omitted,
> as they were not needed by earlier v8 PHY initialization sequences. Add
> these missing v8 register offsets now required to support PCIe QMP PHY on
> Kaanapali platform.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

