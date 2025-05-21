Return-Path: <linux-arm-msm+bounces-58894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 683B1ABF503
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A16F41BC3191
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C6684A2B;
	Wed, 21 May 2025 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxWJOdko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B7E208A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832444; cv=none; b=m0ZV2zIUiNq7BEcvsW0n8Y5Lmm7l8dug4iwfBI9oAwIudrX1yOOzFBt9PNW20zMoTxZCHw3Lrf7L+hEqi7DOFN+hubKBu6FmOgefUza7r+UXYWSF4e/xwW9P9bHfcdSdcP5MAdOyQBuFq72ElfO6X99i3PKUMXS/rzfLGp2qwyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832444; c=relaxed/simple;
	bh=lYzq7FnKukIi50yWRCJdbpDI7oekzUVqld5ufIZMPro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlph6FCMW8eAVYk5TJOMT+uENvt8InoReCbLygnENI6bq+BAFH/QECggvNbbaHCkmCgLAfmmN7ItvZQ2cqjcaRfPdBeHdgaQ75I2rIDSsu5kSeGjraVIPacBCu80G856VgezAS4kUusjOgbE7VltG2QndjZp9+rLdYJeVp+NPYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxWJOdko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XIDQ024757
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yns8J8yDIbLcf0BsCQyO2F82
	y37jhFFOk2oNKiqIfAc=; b=bxWJOdkoC1gAaaHmK+d9NwpVqkp4DDu7jdw+LyEq
	lWXmq49tw8TF9IZsk2bS5abm8AClZa5zbNH9H82tOOC0deLKxyg+zhKvHeNDaIGs
	sWLhW4XIBCv/KcnoHt4OP2wt3ltV8cmHoxFyPqhrJJLv8hlPJ7lVEz0vst/y8uA0
	wV9JiZ2hWxyY2XjFPxEG1bSCNiGhpA1GAfXCI9OFp+FhyWBPwo4ciI5O9nwTcT6h
	1zQmqTwq/oIvGAzhm7iaH0WihntDXhYbznHKZLyBee3+yhXrRFhDJPOHAPqf1nrM
	38ZCUhrSe3vAV4uEnAeUAZMVUh+977njzitVyOlX9cGNHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4ty78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:00:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4766e03b92bso124768901cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832439; x=1748437239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yns8J8yDIbLcf0BsCQyO2F82y37jhFFOk2oNKiqIfAc=;
        b=ILSKtiL+crF3vK1tHcfjo7ha0efXGgxgNjvnlNFbs25+5wvjEuxqduZ4IK5aTaZ7hb
         iDgCC8cvfK6D+CzcMx3MzfYgpVvdvAjlzWKJHcZjN90xJQ9qy+vSVIEnvSRogmz/G364
         S68pNtRV17D1ihXiJ5IdeQujSi0mMUFrsoA1qqHbZhf9sjRF3N40EAlHNAiLKE3z+wZ5
         SUxTEetZNQC3oN1iux0bwiss47FIXhx5Zzz739lMM5WQI1ScpFqrvo69U9Igm4O37hXy
         iMZDDMCnj3BsqJF8BJJOkylLAzRnjI92pABKnhR2LoOL7hZlWdK+Z5Uz+gFhIl43gx1Z
         GrfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgrHn2kH9ENcSIjjCClsv0BxH4GlN4DwyEm74Y6v8YNBUf2bzQdfdIkVFk4zS7cshQMH3rKnrTIdUXRVaT@vger.kernel.org
X-Gm-Message-State: AOJu0YysLg0JrcwBPcjZezzAQj9uvxbb14scL+qTPFGqr++qix0o2KVS
	HSOr0xmJp/LKg1pwA2AoO8aGipA0BEGOoGePIC9ZF7jEwgZz3oNrCAcQn88jYAU7IsAOYQOgZLL
	N21l+KYT0Sp/iZ8p9+pcLKw1HImHy+nRVI32lt9Dq6/arInkb79RSsA749c8qAETguUlCYDE+Ov
	FRCQM=
X-Gm-Gg: ASbGnctPY0pj60MGBJW2QIr6/r0eQbQvgyD9ViBvl2PfV7b9Z2ZJf4c7in43JJpWHry
	/PjBQQCYFnsPJsYVeqi89BWJ6vglWxtgOR2KB486UP9NPSgJBckyIX4s4rWAz0sUKH/5qpuY/DQ
	0wW5XtMZVnmL6aQWzdYGqripc8Q+2ugRZnp3WqS6oAoa7IktWadXSKfpbFQk589chtipLni1A3Y
	3vhrwb8rs3EkB9HP5stfRV7KZmgoFKC5y4fqY6kOCcn4yPBqNJqKK+1+3UN5ZW15zMxi3MdJ6/q
	svarY0tVRI6xHKRt4Oxw2RQVnjcK1Voexu3YbSsgWfpnJD4iGt0eYSLgcXNe5EeLvxfbEXW+fpo
	=
X-Received: by 2002:a05:622a:2447:b0:494:acf1:bd0f with SMTP id d75a77b69052e-494ae42deefmr353471761cf.42.1747832439348;
        Wed, 21 May 2025 06:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYl5pptmjhlEarjw0/xJJoxQp/LNVGwVPm9hkPN2JKLgqOynQ02b10fOufgyOCowuR//KNMQ==
X-Received: by 2002:a05:620a:390e:b0:7cd:1f0f:f61d with SMTP id af79cd13be357-7cd467aada1mr3619274285a.54.1747832427545;
        Wed, 21 May 2025 06:00:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550ed3e3b84sm2577007e87.192.2025.05.21.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:00:26 -0700 (PDT)
Date: Wed, 21 May 2025 16:00:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Message-ID: <6mlnju3b5ecynlmlsmqot2i2y5fkeg7zl7nbzklmq3gcbp24dy@74sht2d4w2uo>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
 <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
 <76052af9-96c2-46d6-85c6-65998c389554@linaro.org>
 <9babbddc-5c45-4ef4-8fbc-0da64ce99a42@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9babbddc-5c45-4ef4-8fbc-0da64ce99a42@kernel.org>
X-Proofpoint-GUID: bYWpJK96neSdq9mFkltG8_zVIzTbOWuD
X-Proofpoint-ORIG-GUID: bYWpJK96neSdq9mFkltG8_zVIzTbOWuD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNiBTYWx0ZWRfXwUivMl2p/yuu
 EHgNvAEsQry5WZheuwYqBP1SyqJzklDXiW+zdpZPFgmttX+lNMPyZREWNZzEV9TfZIWyjVL753B
 F5WfEWCXpNxN4b0B6Ofm7QESDzbxoRD5QBdv17w2gYnGFJKKlLVdHxGXJZcuc8TydgOol7ob0Wf
 ldTfkTMLO1tDviwlDP3S4dVd8AzM/Zt05SwwJbu/KC8LE8Th/Ca1tvPLabeAbD9wxgp47+S29BN
 hirI/HjPHe39rMzcWn7u4c8GFvx97hdZj/xxLc0GWfO3KeF6Uk6DX24it7VRQorOdRKucGnKyXa
 p0VMifVxj5ZN44olYDqcILuPJo1Xx+uaJ5aTLTP3oFlQie6DZd4sj9uB8HSAVU+EkopgOsMI214
 HiThhq9Slb/SylT5Kuf7OH7CJQXfAITE4/m647a4p/fiRR7yjDnjzrunbvIuUmmuDQJYGZQf
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682dce78 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gFR2S-RVxxBBcq25oecA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=765 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210126

On Wed, May 21, 2025 at 08:04:10AM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2025 07:52, Vladimir Zapolskiy wrote:
> >> We can perform validation through the CSID TPG(Test Pattern Generator),
> >> so I enabled CAMSS.
> >>
> > 
> > Since this is just a test of CAMSS without any sensors/CSIPHY, then
> > 
> > 1. camss-csiphy-3ph-1-0.c changes from the series have never been tested
> >     and added as dead code, it shall be removed from the series,
> > 2. adding voltage regulators to the board dts is void and shall be removed.
> > 
> > Not to substitute but in addition to the above it's still doubtful, if just
> > a hardware/driver test configuration deserves to be added into the dts.
> No, it does not deserve to be added. It's useless code in upstream. They
> just want to push whatever they had downstream and drop their patch count.

I doubt that they had camss downstream.

-- 
With best wishes
Dmitry

