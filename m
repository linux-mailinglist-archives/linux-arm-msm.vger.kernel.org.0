Return-Path: <linux-arm-msm+bounces-76313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EDEBC3B67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 09:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3EF984F94BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 07:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527192F25F4;
	Wed,  8 Oct 2025 07:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnxfQovD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ED52F2915
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908963; cv=none; b=RPmFHHB+OMhwMuXSl+LbpO2qF5Ny2VqKEnVvpDZSFeXeSjDyIX/shbjzkd3cBKpniUk4Q79rywlipSj8FWuiY72gfMLltK+WPI8XxrDNZR/1nNMrRUwYUbZSrrG7aEjx2cg6xmdsThJF+lTndcVrSq0MyDd23dhRJ1fTO950tG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908963; c=relaxed/simple;
	bh=ovPhlT67EBW8wa69dniODvAyxrycxNseuMkV8IOqDZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f94VemNbLyCs2dFAylv+eiWc4+j0lQThq4yt/8O95QJMm4XYt9OhQjcNKa7Q9xMWJcNrqAG5L5ZyRCAoO0PZRGB8u65sdqOL5k0JHKjbELwOnT4TjpD2yc1/fdYEJPyn0PcmwA2dolS1YCnDEtF72tFv3UMf6vRy5eSrd9VYxFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnxfQovD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803TDh028270
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 07:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44EHVLBf9lEv9QfcJCGopHnLha1JTNsWJh+6EDiLAuc=; b=CnxfQovDpDSuCKsq
	mJiJluf7prd/H3TimnWlOsRvD9e+xz/Ed2K9GGsh2kOiSo5dY2ttM54m978OP6bO
	+SCp5SjeGOMH3U8HVbIi2LvWbMRuCto2+COyE7TdHjmuXSgHBcJoeRsChEe5c9ar
	F+8XrIwNcEqbMnqVkemS5qm2FVz2fCRQ+Jlqi1L61TsqGO7TFNaOsACAwA51ZtPr
	axa8eeaM89KDXbrxQEQqednWqoY2i4xCiutUr+C1UF9gFt4I4snR7fb+4BMBx/6a
	PEGMccJaEeaqm0CpxinijBAnyVvoR11Qc8wuxegIUbUGUegvqhNJD844OmjUxrns
	/gQyTg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hhdw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 07:36:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26983c4d708so63406155ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 00:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908960; x=1760513760;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44EHVLBf9lEv9QfcJCGopHnLha1JTNsWJh+6EDiLAuc=;
        b=qNv08/o/y2IutsEL906xTwk07+Qzh913HiXDJoXOAaakC3XSerqHZR4pz79OYk1kGT
         I2aN7MiBqgAyriB8juVCoO/xcZd9kMV14LsSn5t8ki0hqlT1MWJbJHjOTSXR0pk4qUA6
         DMjCMk/4HEGhYS0Q0QMpisdULPdY/DWMHnWvmo+gLwpHYnbgDmNojaM31FoK6QkYtz5n
         TvgrIupxC9F1E/8h6HRIowYB4ucHL1aTVkW9tCfp1Og290PgVAtAbEukkLBwhnry2dH0
         QP1sBgUC54uTNK9ac/rFJvpa1kS8kkJz5Mme2gABPWk/9Q0BUzx/rOLXbQLru76V7zce
         9XBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe3eXBIz3pBqhOV2w1+0FAmBdj5jogx2udCcyAchy3B4a3bHy2SJ0WIFQ24Wpctop8NmD6iksRB6Kibdy4@vger.kernel.org
X-Gm-Message-State: AOJu0YzpAtTwub31HX8kP4qn0GgIFjlpdxZpGycKEUVKvynBPLPcS9No
	lYvbKQiE57qBkEVaCIrj1R15sGiY5eY9NgKZsvfOEp7HnE+QtZFBPpyC0j6uOBerGfbQOXsml3g
	jm8uTwUIbY8CjHm1QJ8MhIZHJz7kP7/QwMcnvoyNsLVwPpeqJt7YVKsdK/043vOXbc2m+O4NoR9
	PA
X-Gm-Gg: ASbGncuA1h+RkPTJp9FvjYbPPbufuz3IrYtHdYeohAUD759eoTMSdzLmEH8p9co4kJp
	cebTUkUKE6HM3GfpF0LbAARB7wpw1WttDHTyUT4sSB2aUAhT7H9iEqxQB1uHp8FezZVChA2CvoI
	aHPBKtglqcIvctyAOobxMetbS5001m1oSrM57pmFFrp6wOQmnsa9VvjQsgq4wfZPA1a7CAfh2AT
	X6OMwAfKsP4ECxZx0o93ofmIOCQ57UBYHjjhQ+U8z9vU4Vw/1QdunKg7VXcyAL/UVK6/FaSikvJ
	8QY5IenRLY23msOQbSiqewJ40HrjPrXWl62xQY4JByZ4QnZi9a67ArfHYh8RnmIgHWBIWJwk
X-Received: by 2002:a17:902:f546:b0:269:b2e5:ee48 with SMTP id d9443c01a7336-29027391bdcmr36922105ad.52.1759908959633;
        Wed, 08 Oct 2025 00:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA0HIpa1eYGM2/2CWP/TMlSB1Ie2IF9ksZjRnCg+UoYWsRxcudmptOHTzrOTYahOydcSCUPA==
X-Received: by 2002:a17:902:f546:b0:269:b2e5:ee48 with SMTP id d9443c01a7336-29027391bdcmr36921745ad.52.1759908959015;
        Wed, 08 Oct 2025 00:35:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d134859sm188696395ad.57.2025.10.08.00.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:35:58 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:05:53 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/12] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Message-ID: <20251008073553.qnjvb76ygkd6rybj@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-4-de841623af3c@oss.qualcomm.com>
 <jlpxaewyitfnms7qmesrsghkwkowabgzo4i4n25kiyp4n5ccvb@cs6txshdju4b>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jlpxaewyitfnms7qmesrsghkwkowabgzo4i4n25kiyp4n5ccvb@cs6txshdju4b>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfX0yBQWnADrRRZ
 KP5LM8ojzyGT69z/6pudbBf0MzRkO1YvRcoeURRdGuAk1oTqkqfiW9AL9A/+kQ4+oZrRCjcXgr2
 H/5Kzpj6jEr47bgR8SLC5fntHx4AAm92tcQjlfJIRMivg7n7jJs4yL5zsO45X/PHQCaTcRAuCvk
 eaCKp0jYsYO64KozL7uQTGE/agQmnFwn1urK5r3U9NzyBbVwdUnpV1ASQ0RfHYcBU/2RgjNbDHA
 bcgCPPXKWqTCiZEJMAeaPFzLEP6LiYsklV//h6WoI38eZAY1UGosssE44dm215Pc+f2daMCd/sD
 aoorUoFZZmzXLpgDT0vv3SqtzMDD5kuoSC6yR5osVg0I5OQTA4lGSkOObCTi4YKufIqm1EwdxCI
 TOEas2HuO/FJ3zZriE2nIbQxVY6oiQ==
X-Proofpoint-ORIG-GUID: bWCNMK50bKzXGuVDPCMEGb80DBlEqymC
X-Proofpoint-GUID: bWCNMK50bKzXGuVDPCMEGb80DBlEqymC
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e61461 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=hN60wAwBI9Lfv06IXC4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146

On Tue, Oct 07, 2025 at 02:29:20PM -0700, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 10:18:49PM +0530, Mukesh Ojha wrote:
> > Add a PAS context-aware qcom_mdt_pas_load() function for remote
> > processor drivers, which can use the context pointer returned from
> > qcom_scm_pas_ctx_init() to perform metadata verification and memory
> > setup via SMC calls.
> > 
> > The qcom_mdt_pas_load() and qcom_mdt_load() functions are almost
> > similar. Clients using the PAS context-based data structure can adopt
> > qcom_mdt_pas_load(), and in the future, all users of qcom_mdt_load()
> > could be migrated to use qcom_mdt_pas_load() instead.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/mdt_loader.c       | 29 +++++++++++++++++++++++++++++
> >  include/linux/soc/qcom/mdt_loader.h | 11 +++++++++++
> >  2 files changed, 40 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > index a5c80d4fcc36..31855836b251 100644
> > --- a/drivers/soc/qcom/mdt_loader.c
> > +++ b/drivers/soc/qcom/mdt_loader.c
> > @@ -486,5 +486,34 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
> >  
> > +/**
> > + * qcom_mdt_pas_load() - load the firmware which header is loaded as fw
> > + *
> 
> Could you please reword it to make it clear?

Sure.

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha

