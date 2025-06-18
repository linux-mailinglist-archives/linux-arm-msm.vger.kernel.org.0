Return-Path: <linux-arm-msm+bounces-61725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5229ADED86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 15:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8506316A63B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 13:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A472F27F160;
	Wed, 18 Jun 2025 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MG7VsznX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD6288C29
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252389; cv=none; b=Sjhw4yA1pdrQJy6Ca52pyVu3sugwg7mhxYRXYQERxwR/iC4SfKcsFetCKrTfpvX2mwVGHnKnB1heXKrf8n1suEpIY+esPAhGIe+YjTks9TaWI4/C7DnXqHxUtpJAtBN9SgQL1aHA5CksAI0Wq6Cer4DDm90jl+zLulimD2NiC6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252389; c=relaxed/simple;
	bh=xQfxH+J7si2Jx+1rL1OLwZA58hEdu+osP61mQ2g/iyc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQvT84QXtIiWZbQwL1pOaJ9MlIJEaAuubzVuSJAJjYKA79xjiY5arL92fJndILCwCW7ptwnytpc+3YUVNnoVQuGWSC3mjg1ecOZ8kORQLPMncef5N9iNee59+hKo9/ng4kwOBgHo505dxC3h0trN5ZC1g4/pmIXRuTLEmvI4QpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MG7VsznX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IB0ZIO003284
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uOCr5QjdkY5jetSDiwM7myto
	B++DKJWhFOYd4AnCVW4=; b=MG7VsznXxry5HmQKa8E+jEZlOMlU+YvAQTXIg81v
	1M32ivImqWOBWQJUBFoEZMVDrrFjcy7TeDEGtXLD13ejTW0X1DRDZqXVUpqtaClP
	gCz2tcFk4yKihafDhdWx/jkjuEOAXbsnBqbG/FGB0zUidVEvzPtk61OgqOE8lrPk
	ovsiCvshRGC4CAjfzP23Q1Lxowyex8D8HIwFXcUODwVMmqLAfrf0DJslNhtM96y8
	cqmHa8iFZ8vCEkQg+5P4WU0Hu8YR92BaTCx1MZWPFQRJck0BA9uS0BzpzEOX4DPL
	/UY466jhzCrqGof9Zt1stQZZGP+C6cUzPc7q7MvDL/+fUA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag2387w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:13:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f876bfe0so1208374485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 06:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750252386; x=1750857186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOCr5QjdkY5jetSDiwM7mytoB++DKJWhFOYd4AnCVW4=;
        b=s/CThBfsjlrqmPzrgpMgNoyZm7bXuQK8sdV26txlFnpoy37i07Xh+BLzSyrF34C5aw
         3KXWL3yhc7QiVRygSRuq6DIk+EDs6N1s/OVbZMWEiTNpaYcokadOsZ1KgKW6kyRXH1fg
         POOlP/R6H929cbkIGiDr7ybtb8blbzhh0RyhYgN0cL5Xhuur7Gdt9Yfk7kDLY/KwVIJX
         cFFE+LbSa5wFfpbhpIkqnw9GGLycfi8+bb5T1BUKNTzPAfUV1QCv4AWmBPME7aTiy98T
         blRy7HgqgbljG6OL92p14mAHVrJPuNOozUwK8f7o5URZMMsjUTS4+ZsI1Nr0NmYQTcTi
         Qjzg==
X-Forwarded-Encrypted: i=1; AJvYcCV5oLWhdhOzubX1ZSmk+t8UT4DosEZwRewXc5IP46nm6xOkPFoxfYbEcR2DuU84lkCg1ri/H5GfTGZa3ecf@vger.kernel.org
X-Gm-Message-State: AOJu0YxXcE8ufRzCMGdJHRc1R0EhHWhKSN+53AhnRSyommZ4z1P51o3B
	aGLcs6JKrEncOpPObOP2xCiWFPhHy3UyOE164goRyLuU01CbNUIDAdfADfHNmAP13La2n3ymMV7
	c+9f2gqTfNFp4ycHD9ZFDmLhlVXNV9RWMxFpZbRviV5ZVv4DgRUsVmCIpWdcTCMPmDofA
X-Gm-Gg: ASbGnctl0g/fG24u3VWb9qUZtXbRUkRSWj86pYERwlPfFMiybEXpzab2MktFLMON/xh
	YVIwHSOo7IkXX5dv8Wg67WYXzQ+1uAeSnH3rd2fkKAzErSfa8QYK52YWePVIGHsT8/9AjZ7I9O2
	kB8BpPfrcjVghdNsqbum+Y4/7QIhKqGCyI+XtxEDTHjL6Xi1GVp9WwWPwX59sm33brZyCIi5O09
	I6ZdfsZANytbfnMkqIIPo0h9X5LC3Qd+Xr7BYQ7QtI7xHH0lVfq3zjre8vvHCXlXg94cfBHFeU6
	A3Y1T1lX/knS0dMe05kgV0g7yVvP+SxGjktR9J9XAmYx9BpH6cu3WuGbjQ==
X-Received: by 2002:a05:620a:28d1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d3c6b813f9mr2372976685a.0.1750252385817;
        Wed, 18 Jun 2025 06:13:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjJue89Rmli2K6Y2pcfc+hi4K9H56GD3PAu9OTXQAnTMz/vuG4sPfRjvsoylnL7i4Da5na3Q==
X-Received: by 2002:a05:620a:28d1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d3c6b813f9mr2372972985a.0.1750252385360;
        Wed, 18 Jun 2025 06:13:05 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a60f5asm16671499f8f.25.2025.06.18.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:13:04 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 18 Jun 2025 15:13:02 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, quic_dikshita@quicinc.com,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Message-ID: <aFK7Xo9xgQ2gfo6u@trex>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
 <aFAVTvsDc8xvwBme@trex>
 <1bdf289b-5eec-d5de-a08b-6c7a772e15a3@quicinc.com>
 <aFA5FpJPRmJ/ltI9@trex>
 <aFJlqGFPrO9Hw4f1@trex>
 <ec3defcc-f19d-4224-9029-14c1e95399b7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec3defcc-f19d-4224-9029-14c1e95399b7@linaro.org>
X-Proofpoint-ORIG-GUID: mR7IJP0aUm5ZCuFKFTI7p6QTr4fsdyIH
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6852bb62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=8tBtA4GtQrU4Ei1tFs4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExMiBTYWx0ZWRfX57kUnreCMqiK
 6isbZC3CBFH8Az1ZfsvetPxUffiIW25M9sxdHp7Whbdw6KXroN+JxVrMqm3bWyYs7Afh7emaexf
 7OLKdz/ItIm5nWCeeKF/Y7HVt+ioaelVPl8+dTNjHhQZuA8u/7/PJmAx9fJUXDLURBNodIcDv0b
 qt2QBEeT0FOSZX18rJ2DzyJgMtOffLfECvMIigTYeQRZ6pg3co8+w96vXMhRuSFny9QpXRltLqJ
 JGmIFlP45yG6J6pWJPOl+NN0ChbYlELddojSXZ/P3RVYXX7IEXy0YUtvWhxe9A4Yh5Ys3z9wbpG
 HEHsCmx84opHi4NC99xZPqA7Yj4vQh9yCF+pWTNmtLqoBEqcC+f8NVxX7gBu7fZGsolsw5P7ooA
 lH/ZEb5pLtdReepZSCZN+vmOQugHsGFzjBKwFTlF/3GyATi0taf+sH7gx8xItYPyPFqx5Hyo
X-Proofpoint-GUID: mR7IJP0aUm5ZCuFKFTI7p6QTr4fsdyIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180112

On 18/06/25 12:08:28, Bryan O'Donoghue wrote:
> On 18/06/2025 08:07, Jorge Ramirez wrote:
> > On 16/06/25 17:32:38, Jorge Ramirez wrote:
> > > On 16/06/25 20:14:36, Vikash Garodia wrote:
> > > > Hi Jorge,
> > > > 
> > > > On 6/16/2025 6:29 PM, Jorge Ramirez wrote:
> > > > > On 16/06/25 17:26:24, Vikash Garodia wrote:
> > > > > > 
> > > > > > On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
> > > > > > > Ensure the IRQ is released before dismantling the ISR handler and
> > > > > > > clearing related pointers.
> > > > > > > 
> > > > > > > This prevents any possibility of the interrupt triggering after the
> > > > > > > handler context has been invalidated.
> > > > > > > 
> > > > > > > Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> > > > > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> > > > > > >   1 file changed, 1 insertion(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > > > > > > index b5f2ea879950..d9d62d965bcf 100644
> > > > > > > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > > > > > > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > > > > > > @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
> > > > > > >   	venus_interface_queues_release(hdev);
> > > > > > >   	mutex_destroy(&hdev->lock);
> > > > > > >   	kfree(hdev);
> > > > > > > +	devm_free_irq(core->dev, core->irq, core);
> > > > > > Could you please check and add the handling here [1] as well ?
> > > > > > 
> > > > > > [1]
> > > > > > https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427
> > > > > 
> > > > > hi Vikash, sorry I dont get your point - what do you mean?
> > > > IRQ need to be freed even for error cases during venus_probe().
> > > > 
> > > 
> > > but  this is what the current patch does (venus_hfi_destroy is called at
> > > the end of probe error handling as well).
> > > 
> > 
> > for background, this fixes a null derreference in the Venus driver -
> > reproduceable in RB3Gen2 on a particular error condition during probe.
> Shouldn't it be the case that devm removes the handler for us anyway ?
> 
> Why not ->         disable_irq_nosync(core->irq);

I agree, this seems better to me too.

I guess disable_irq() is the safer/more meaningfull choice since we are
calling from non irq context.

will fix - thanks for the suggestion!

> 
> i.e. disable the IRQ until the normal/expected exit path removes it.
> 
> ---
> bod

