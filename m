Return-Path: <linux-arm-msm+bounces-75946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F55BB8304
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 23:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0115D1893E06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 21:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038DA26A1AC;
	Fri,  3 Oct 2025 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQvBvPjc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3512013B5AE
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759527064; cv=none; b=fS5tmIuj8qlqo9RU+lbOCQimiTGsC9aHT0T/fcGFbCAoeIsyAE21G8DMgvUn+noVucL6Np0ceYUkJ7r0EVDAFAL2sEtwAGAP8oCXLONxI5/gIILxDhhCIcgousBH2CCvvtAAx7+UhhXjK7FeH/aXl4A6mL/kESfa5hHHdesMTb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759527064; c=relaxed/simple;
	bh=fq/fY6JqxN6dNqCJ5P8kQFzhneXSbn5maPTRGVNN67o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbkKk8m2bzyhgP9pmwNwuVWXMv//TRfhtzXezTcVgzmSbmOOeEm1d1gjOl+5heJWJFUrA11uoekYQAUCpih+OgzWvTcfIpBP+dydZ3z3GQ0If3Ov82B9kvEXsjPUoGTiBiGBslZ3aV1Zto7oVPQtnNR0VLpla/DTwYgbEivScy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQvBvPjc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BVUg1017995
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 21:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=53GD0wKdX2v1xIpZL/WLa0QS
	fyyHKKezHxL8P/DVLl0=; b=BQvBvPjcO2pKigMd5bMO6BPzrdB4vVM4zW7/pVs4
	eEOVd45pngf6L5dByrIbvmnYYDqXDHHbob1Ea2lfz4gjF08X+bgd+xDEpc8aQxvW
	G5iKWvR8BrUOqPeEoj3hF4OT1Ep9DIhAaIcOx3lPBtwg8t0QsYm2X0yWlwgDEAel
	uHCHq8Nn5SdQupzYVcbwm8RT0JGepSPj4W0VD/Vu2jJ2C+bSpAfchbcPTiSlTTds
	GztC5pmQ1N3A7ZEHI2NjHNse4/5NiAqZ1tCH6q4FtOb0ugjplakhftzV12GjhNne
	McRK0vfLoS3l9i4yG6CPH9/IHNPL6hmv4PPWIE5+3Jc4VA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrfdhb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 21:31:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de35879e7dso15265661cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 14:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527060; x=1760131860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53GD0wKdX2v1xIpZL/WLa0QSfyyHKKezHxL8P/DVLl0=;
        b=Eem0ynDzmltUJW+9eNNkXaJdxMlk8L+i83LjSw2fYeUNW4uDOtkbnS5VTKzdEvNTyV
         ImXI5fhn1rXFwhA1+Z/jNgbQhDNy5XVm+GWZ7R9SNAp0UUyLOMoQiIdxazqSlbbT1Cxl
         QGFjxtHrit9bmS2/IZDfQELc9weJVD5QsL/QzZ0PgjUx/5JWgyOox3gS4ZBDwOwa3csF
         Gb6yKBnzW1WcfT+ms7L2cvv6vJdimWJqM4rIbhYoHx3JP+d70Ko+pT+ZcUHCK5I57UTa
         fw9SY4v7gGtZtoVTr2Ybw63h2njXMoX3ubMCUkr2KPvjYrH8INmK5NDffpK8Nv2WQKbT
         WW5w==
X-Forwarded-Encrypted: i=1; AJvYcCUeNmTa9ACPmRK/E1sKXwE49/v4FTmCDIcxup65ICeVBtq63dTAHFib7LPxz6H8sMf09MNryu2+lSGF9N0Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8E0JeqWowFUY8GAe1RleEPwP1FtDxptzslboZdijcd0Ha1hO
	84Zmu3VJ6CuMp4TK8/6J8DJ2FqJtsizutZZ4bT69yImGKoPDRqaXTDzV+BF4B+Mu0JRhIjYhznT
	eH5NnOnNnZ/EuNo8iRAsCw3OQJDoIK2xtjTfJkCPdvpK0qpA6cBVfnlFaYOo3oTfJRHC4
X-Gm-Gg: ASbGncvokxyJV7nllkog9PEK7c1uKnC1/AR5ahsIwDmLlMHxYLkzdhbV6Lf/33hf3H5
	zAJ3qA5cLa7M5tgGtkCcrA1JSxn5ZAJN1n/hKmHqrPaRx3+Pxzx+SFVj+3NBVirNwSsbMWg2+Oy
	BXso0tKlhvyCOkcPM1W7YV/dNE4wtURsWe6ZA6UxSDz8iH/Ngqn2iyD+QGRgLWwss2JCzEh8M6w
	fNZet74ck+KQsrNDi4dUuE8eo9PpmMKx4aVhKUZJqIHLVr/mj6dcdIEX2oEEz2Hz2JbUG43aPdu
	M/c6T1I/WQsV3/qSjsOWzko30HgBxYik5Ozwo/nQZBu5B1R04ueaMQ5NBOVjsU316GPuaDwreOO
	etKu6ksf+Wh/hDv7gmvnmeeXe4U3ZuJHPVdMleFnbQcLfNw8GrUQznRr/SQ==
X-Received: by 2002:a05:622a:5c99:b0:4b7:9ce0:43c4 with SMTP id d75a77b69052e-4e576a453eemr60116031cf.5.1759527060008;
        Fri, 03 Oct 2025 14:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbWgg1m6ArZd6deTxtHGQP9AEmpq7RXsHx30Vj5OcL3B8xyMb602ba9wWnqn1h9OZ2s/kPsw==
X-Received: by 2002:a05:622a:5c99:b0:4b7:9ce0:43c4 with SMTP id d75a77b69052e-4e576a453eemr60115521cf.5.1759527059351;
        Fri, 03 Oct 2025 14:30:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d6e6sm2175292e87.78.2025.10.03.14.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:30:56 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 02/11] arm64: dts: qcom: sdm845-lg-common: Add uarts
 and Bluetooth
Message-ID: <qg4rlyl3gqlkih7sssixi6sfvdrkreoaz247ckmbja4zkybxt5@vkfvvhmce4kj>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-2-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-2-b14cf9e9a928@postmarketos.org>
X-Proofpoint-ORIG-GUID: 9CKh0-DOQYn9GlMLl0ArHAnf81p_Mupf
X-Proofpoint-GUID: 9CKh0-DOQYn9GlMLl0ArHAnf81p_Mupf
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68e04095 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Mq719mGqAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=8yVOI8cEZPrke_ejmRoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=gOTWM5O2Sh7P_NUuVqe5:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX5MB/nx2WZ8v3
 OFVZa5v/3qMebXXli+pl6TB+ZWOw9OsP5FdxN/K5BjaZvoMQ20N189zp6MYl+9QnMobIedhJmRn
 aQ/XbK2g+pvj7syldXPhV3fe5PncirzTHXad/ePtUHrmyyJCvyJxBqLgrwMk/TxDqHi318ZIUlI
 LU07PkL/HHUkbnti5SHZo4pP07GHsTP/2uuhuJKbZfnBuMYZiVf5w1B/NrpvQPWSbvSxnGHKf1S
 lXw83LPL+iH/M4+yxe/p5xedyoksGb6Bl+P2v9PAkgQxxO84+T4m4jG2uG33YAJCZACgvFCwT9d
 9siK7wI+ky5kzU1je+b1DyCGoE9Qra2FNS2p7Z6JReaWBTiIiO1Ajexx81SAOESsK2Q+0e2n2Zp
 kWylLKp8Zc6X+GDKx2xrn6g1wMqOHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On Sun, Sep 28, 2025 at 10:05:25PM -0700, Paul Sajna wrote:
> uart9 is debug serial on USB SBU1/2
> 
> UART RX is SBU1 and UART TX is SBU2 of the USB-C port).
> 1.8V Logic Level
> Tested using pololu usb07a https://www.pololu.com/product/2585
> and CH340 USB-UART
> 
> uart6 is bluetooth
> 
> Add bluetooth firmware path
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

If the series get resent, could you please add the boot messages from
the bluetooth (hci0)?

The patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 45 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  8 +++++
>  2 files changed, 53 insertions(+)
> 
-- 
With best wishes
Dmitry

