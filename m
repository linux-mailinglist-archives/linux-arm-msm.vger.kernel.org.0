Return-Path: <linux-arm-msm+bounces-73707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8135B59620
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 14:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0568B3A41B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4114430E85F;
	Tue, 16 Sep 2025 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTr63tg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8621D5BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025521; cv=none; b=L/Y8Gxv6hE3oHDqO8mJbomP3D5o1bktAFSY/ZMtqD0m2esEwWTWleHh4Q+5VfeIu4y1OS+T3QUeby3v8nd7AQ7y+y6EEVrJGOd4+1C9e39cmxwuMPBBl3fRq+DrIQCwkmDPDl6p10w0QXH3F6txRbtN2orYztcYrIn/bqU6xoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025521; c=relaxed/simple;
	bh=pYVRyG3Ofnpb0L1Y2+cXoG7kxZMxzvU+i1cFXSKD3ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtSUHg2rnTCYgf7QdWE2A9XfHthdBSfLIvoKgCDaQZNOAJtzR2e6/UHK4ZDGYY2uQjb1n8D5bWmYXQkMEBCLHmk2OwCZRDgQynKJtdgRGbzAcFYskJj/e9VqX/97xIdDzUR9NfDPKfYdf5jr2DFOcGdM/bAEEIn2K3um3YS9te0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTr63tg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAlqE8019431
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rUHJ99Nhm6wc+crxDOeKRLBG
	ZdaCl2Lm6idkXPgbi40=; b=iTr63tg6bMh/8ofkmItHfBDoTgbgkxSsxeqAobW8
	RqPWU8Y+xuPemF9vlVaLLIJ480fs1yz1skKfhGckN0oN2LwYZXNizIaGotZJeLXM
	GV6E/+zuLBGKqjalpqqNanWrZDMWqz6pcjwzQVZpCIyvPyTWree1pcH8gPVrnbTL
	zspHCchPYTwaX/N/8OC9gfZGJXbhELE8htESKG1DEDJBWYNEyxcp+WgEirNU8N71
	ogIHxk9eHPC4QwDPhslpzqhBY914vcrJYiCuLjlLn83DnZsArXtkpS5D6nwZ0E4I
	whX++uOYCNM0LpldlBfCXLHAWrJXwzjuhT2tCt4tc4y0cw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9d6sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 12:25:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244582bc5e4so66335595ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 05:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758025512; x=1758630312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUHJ99Nhm6wc+crxDOeKRLBGZdaCl2Lm6idkXPgbi40=;
        b=T17A4J+247Gy6Qpj51/G5vGfRH1qwlphA+B+pxEIJ377DFC07y6+CGaCDZVXD6JaTn
         OaN932h3hXQmkVKmmqclLXmWFi/qqYh5S+m1WcHCQ/zv677MRUy8LwpkOsyc1RIqcL3X
         38oh+3Bi4/nPdQSbSyO/idYjdx/bMe7wPT3JoDaRx/0wRdGE9e2IGX2vAkWfIIq3CdWB
         CShb7cjSf55yV8EKovJ2ZH0ycWNyEBUj87Mypu91b9Iu4usgwbwOWhD27pEv8VU7scpT
         hym5/nC0cek+0A3pIopvEjAzEG3T8VpR/iMgaIOYPUDYUkOPef3pP2mG/hkhEsna5psb
         F9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXBaM0fhoEQE65fJU1tetmQkZ5zz0WVCALF4RXp8YcDvMM3gOkFKKzW6XdkQ5Ph7/YieaHLqsD2XQ/QeB4Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyqoG2Xqs5ZyZ/EK5M1LiM8Ggtm5kF98paJ69u2iKa7pKnccoNj
	RdvfUacAMXduVklumte9S7LQc9OoOVKB5biYW3ht1F8F//LBYU/HSPAjgOGhR4flniANoSOZcFc
	IajLu1QD1gd+UsYyLMSqBm5EYbt6l6DTvdbJpnM4s1LG2Ls2IKwekEJ4qie0ksXvzn3rR
X-Gm-Gg: ASbGncsVTqJwHtkEWRe4eqfd7EqIiQ2NUtrCSD2Je/ZNdsbXcnj7z4hTBj6HvqqVHY5
	1bUenLMnJ/J7WYAa3Sz6YOgY//C1Iha0u6pwRaAKZwqHcn8sw31lar/hNIxN5loUr19w5zESrQy
	IA5OY0VGpQMmt/33IGanezq2oUBXYHPY5mPr6hiohC2IAtuyxmsSKYJjdnXrPnEcDE3NeM2Ijg3
	KrEgem7kGXBRSz5Bho+eMFeQma3dzw0e2KRijbLOU71M55X3M+hZlEiGpZvs9QdPWz0+fqsaxca
	RiM2IddSjcsORs8Vrdfkzyj472aR84PqOUseVQpRyFgChoM/XRdXCn12jg/5YJjk5t8e
X-Received: by 2002:a17:903:b0b:b0:249:1156:31f3 with SMTP id d9443c01a7336-25d243e7fd8mr146599155ad.8.1758025512287;
        Tue, 16 Sep 2025 05:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfC+HYU/Gm0Yu1cZZREqssXTo+RveyP0dKwPWuRl4HJg2G55Yk2LtJ6nUVxaGFtw1OspyhKw==
X-Received: by 2002:a17:903:b0b:b0:249:1156:31f3 with SMTP id d9443c01a7336-25d243e7fd8mr146598795ad.8.1758025511851;
        Tue, 16 Sep 2025 05:25:11 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2676a14c514sm51154825ad.103.2025.09.16.05.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 05:25:11 -0700 (PDT)
Date: Tue, 16 Sep 2025 17:55:05 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: Re: [PATCH v5 02/10] arm64: dts: qcom: lemans-evk: Enable GPI DMA
 and QUPv3 controllers
Message-ID: <aMlXIdgavXT6Ndt9@hu-wasimn-hyd.qualcomm.com>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-2-53d7d206669d@oss.qualcomm.com>
 <n4p4www37qz4hw75l6z2opeqks4g3u26brceyxi6golam7f5aw@raandspcihi6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n4p4www37qz4hw75l6z2opeqks4g3u26brceyxi6golam7f5aw@raandspcihi6>
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c9572e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jsWzJFLPBp6GKZhRWDUA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Ct-1qik4F_zikjrbxcz4DqRYMgi4aopB
X-Proofpoint-ORIG-GUID: Ct-1qik4F_zikjrbxcz4DqRYMgi4aopB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX0CORxAw3r0ZF
 DW7a6UZMaRoj/4IjHNBzAY/3gfipz6tXHdLL0EIdjbpugj3c57NkKJ/pX6s0U46FxeaucEPJuZz
 F3Huk5Pm9xBViR8ryW6BmwXS6zohJJbP7w1mDyhAOG9aWOT0RfO/YSLMI0Sn6s2YxNMYfNqDfVu
 1z181TZQD0V8bOY5K+2nrjmTiRFoxv92LBEZGXqczi3ocjSY8o3memFpcpvTCMJZkt4ebUv7zwD
 B0XzrguZVYo4u1TMUVjT+jvCP+lvG/6QRYKVUVftDU8arA3akQCv1cISpKAuLVnEG806ZdMt7wi
 uTv6s1JICWXa4ho9O6kA0VNGN4aNYamo42rhjwbxfUgTGTSLhc7VKGQnP6Ks+KUe5tmRAHifekd
 KAMf9yTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056

On Tue, Sep 16, 2025 at 01:59:20PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 04:16:50PM +0530, Wasim Nazir wrote:
> > From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > 
> > Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
> > interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
> > DMA and peripheral communication on the Lemans EVK platform.
> > 
> > qupv3_id_0 provides access to I2C/SPI/UART instances 0-5.
> 
> Nit: used for foo, bar, baz and slot ZYX.

Ack.

I will change it to:

qupv3_id_0 is used for I2C, SPI, UART, and slots 0 to 5.

> 
> > qupv3_id_2 provides access to I2C/SPI/UART instances 14-20.
> 
> Ditto

qupv3_id_2 is used for I2C, SPI, UART, and slots 14 to 20.


-- 
Regards,
Wasim

