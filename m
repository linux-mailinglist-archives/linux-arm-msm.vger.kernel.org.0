Return-Path: <linux-arm-msm+bounces-76382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A3BC49C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77E163C5E6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEE42F7AB6;
	Wed,  8 Oct 2025 11:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UProDiaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B71DE3C7
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924020; cv=none; b=hjOb8+HDOY4CwdQ0YsUvOuCWu03TeND6cu5QamFgd+HBWMxslcMoaWppgLXYB1jmteZ47jmvEgSYDb539nz9aMpB5AeL88n2KYXM4pdNttJG5PJrT2H9F4/0XePtNN6Seyz/kPBO/RNvzjTlvGw6TQl1ZLz36T/SxdSfzTnDwAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924020; c=relaxed/simple;
	bh=pOLsyu91bA7BFOduTPfXQwDrZ2/gTjYFrA2eBRm3r78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OeO6l8Tt60j6lzxtad7Pa3xpLTGKsajS+6f26F5rH30BQBtSfmQyfwpn+x3czTt3n766kEkLxNf7ZIS9ynVBcCrX7POT4+JXmazz+SKI1HEcoGeTzLHdkR6tEvg15M0UIzSBQWg3IIRfnxPUucnLXajoGnOqkXcKH8dG3Bq1Tsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UProDiaF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890UUL014253
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmZqI/hK2QIPAuDXDoC713x1X6hbDw/7hyjWJFFNTE0=; b=UProDiaFd3+bNfr/
	JAMFmeTOf8+SkbvblGKTR06dC1qYCi72cCccPdz1X84A0oBNXWSbJ8NXXh02KB72
	WfE0bPkXgRm49IMMYEmrxBpBP+nVx6z3K2iO45mzz7Wwx+HukjK2twkuu8CIxbxw
	WTBE+B2H7tc839FrzveOhRa4zPiTRyyUbGlBqud1+orHif/6xN8ni/W5G0lZm5KT
	iPJ3GfxERsvCOkLRpg+Sp9XfAasDi0khKs3qMt1RI5Ihf6Oz+xK089HZffFb3er6
	qVOeaokX/617+OZxzQQ4C/tq7XTxpDaE/NiX0t7D/T5oLvwppVw3wlEzzeVVFp/N
	/D25Wg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0p0cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:46:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e56b12ea56so14282431cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924017; x=1760528817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmZqI/hK2QIPAuDXDoC713x1X6hbDw/7hyjWJFFNTE0=;
        b=D18sFe3sHbV9RaKPaokgk7j0vAFqr+qP1QII66HsCrKJMFZA2kf2+ss3mCyztKBoJW
         cgrKRFk7I22u56XRp/AizLEfGQ5MSk2jfMF69vCoZnyu4KyeSOhQ6NHiRBDujkZ+i+XM
         QOOLYC/BePqxRE86MPz7I/NgqNUdKxPaigcSZ+1bJFddCHyUqhalQ+kmQVRzSGjoDaSm
         1B/wZQJUpe8YjQgvHfHmn3PiOwe1ujBqBlDmYvOVA19O6S5jwlMJbBOa2GN8n1FMC/Ld
         5W9OVd+aYKQzdGxVUC0dlTJB4JWqnLApw7EMctfY/bwZpCStcRN4Lp1D5ne718kyhGs+
         z8yA==
X-Gm-Message-State: AOJu0YwZ7VCMHR4LLA0HiT5kGL6qHxQ6btdMrM2gJRz4l+11Tg5CogV4
	1lr7sSYeTkI3YgybmeGSr8oJ3Gyx2ptTESv3XS8ud4OsV/CStHDemHrtmZI/7X2qHZYVbsOWGMp
	WZBFT0NRnN0PtefmL+xCs854ZTJEE6lnIwjKhjot+2wo0LqqtCR/HfjV/Dq1y7BqXUExI
X-Gm-Gg: ASbGncv2tYgJWFoHMtkUMQ8nU3KdYKAYzytzzH/ORRj0htrcwCxLtdi16qHp+FmGz5t
	adXRqJ3iVDeVQp8znrAgDlOVdR9Vvjj+g54Zg1hQNlvisSOAOcdWSzjJsSYPP0NxsqxuYJ/vcWd
	46lveLUMjajA5bkLYyKcGf4tDj8o8qF9K3nY8VRGjAYHptnDrOQMTDCjxr/uuMLrcRMKjgKXWHr
	XjTBxveJonGPJoI0IlgChiNf9kMPUjKebqZgAqGur4Ymn3gyO+4ADZI2otF/huOUYzLh8nRnIWw
	1OBgwlcrqfoP08Z8baIlsT7LEigmP+239RA/SvoGP1F/EtqzPtBXT9UXw485Lqf9onk0BEbgL9o
	68xm3eCAAlZ8/fqoNLYk/7fQMGUA=
X-Received: by 2002:a05:622a:4c6:b0:4db:1bd:c21c with SMTP id d75a77b69052e-4e6ead390dcmr28341901cf.12.1759924016822;
        Wed, 08 Oct 2025 04:46:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhzBijvONPiblMY5efLfCzWLUGbZqk/BjrQ0UR7ejEdPzLuUFe2mN6EtMi9WvZDTQu1j0KPg==
X-Received: by 2002:a05:622a:4c6:b0:4db:1bd:c21c with SMTP id d75a77b69052e-4e6ead390dcmr28341691cf.12.1759924016308;
        Wed, 08 Oct 2025 04:46:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83f5fsm1649154166b.32.2025.10.08.04.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:46:55 -0700 (PDT)
Message-ID: <fd49f3db-560d-4633-ab59-fa80f9baf698@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:46:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] soc: qcom: ubwc: Add config for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cFr-EqV3tfsGAJ27Nxp73OSARB0mzEYW
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e64f31 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=WkYBtKvuumTgCfpkg3wA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: cFr-EqV3tfsGAJ27Nxp73OSARB0mzEYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX5yhwuWz9DgDS
 nsPVWQXKHMHFy8UStI8R5z8q1Hxy+gAjsEieSkGVdWxNcL9Xpmx4G8sJPW6FBw7kWXmK4H8MW6E
 hr3kwvZdUKyuvA37Tsjj+ZcV70R/NbpheIa8DPxTDg4DgE03lA4x12HhlxPIGAwpIYDlLUy3Ba4
 Z2SfcXlxNd6d4itIRpVUlkKVAiJt7q/x4IugRcurRFOCgAcrbpRByBFkzuvWCgePlTOjxxT2GZ7
 QyCPvHmvCPgEFvzHQbIJ1enP/mPy4HFJz4XqSKRgjKu4J1l4+ijC+Ux3QeIl63gfMuZaxGBoDgB
 HkPTMtPeN8EP1JhG19MNT/6po6UuPk8XUcJGFf5dXE9ZUjmBfDuztuSB5y5iwLWlUDtPLaPwo9x
 5J523fM/KryoAWWNoC5sykAi8ZxgnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 9/30/25 7:48 AM, Akhil P Oommen wrote:
> Add the ubwc configuration for Kaanapali chipset. This chipset brings
> support for UBWC v6 version. The rest of the configurations remains
> as usual.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

