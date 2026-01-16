Return-Path: <linux-arm-msm+bounces-89307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A94E4D2C6E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0D773008E31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 06:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F97534106F;
	Fri, 16 Jan 2026 06:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZzgp05Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ltvb5vCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCAF1E7C34
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544281; cv=none; b=IF4Nik/ea3BMuH65Ky5dwlQ8lowHXrLq/4zV8q9XI8d+viL6utXYzyLu+phNAo6jGvGe0pKU/N8m716sBN+VcPJx68XpzOwlHsNa4y/x6LObk0KsVQgtfIOEGx2ZqxgI3Va0B7WP0o96EHmmOy7l2ENLiB1f2HxxiYNBIEHv8jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544281; c=relaxed/simple;
	bh=vUE3fo5JDWoD+z/fAG6GQuY68IMvuJe1yhOjTrO5IqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGJ7ioDBYdMO0bNzomtS3N6tx5ssQ9YwOpsUdy+N01uD5QIJmTP2QRLJns45BrvvEmMD2UznaCFUgh9XGyBi4pQiYpThsRiDlf0mEXFFcVBfOAMTsd4+xtkFm/f4gIe9ENfki6VUlS1uULQ7KUE8aroRw2JD/vp0qOKJqkYXE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZzgp05Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ltvb5vCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMkngF3892789
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vUE3fo5JDWoD+z/fAG6GQuY6
	8IMvuJe1yhOjTrO5IqU=; b=jZzgp05QdXiFTCb5ra80VIGD6k05VYMm+GjjzX86
	rJ1D0IZoHfjTAjRz1ihFoIXPQx9vEPuZuTXG+tCemTl0vcvovVQicj5CxrU8WMsL
	Vxi83FmYpX24Vcywd+yoW8O5/sCRGntNQNE6SmMVXLiG/++lvK3CH5SYQ21HtKvb
	8HTh8A0BwiRCVSRSSpQRaFd2XT3FYiJFsHa5w7kDepy10Om+teXpJifKlXJ/rirz
	XsnFLD4hhCsLCMMeJTR8KjP3zwKK8vPNHGaJd1Zcdl+F0gLky/FASsgd0U10EzJL
	EqxFakbo0eXfkCRkUv2c1UDv+JI1d7Lk7H4casfUjNcLJA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b090tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:17:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab8aafd24so1922643a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 22:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768544279; x=1769149079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vUE3fo5JDWoD+z/fAG6GQuY68IMvuJe1yhOjTrO5IqU=;
        b=Ltvb5vCSEp2Jpzd4NmH+oWLnvAmCVDv8TiN46wm3RVFiUPyK+veobfkX5CWoZe3PHE
         Ce+GuC/muvOYhbo6fTtaaawg2AAY09uLjt/mFU6FhNQkMjQlgtJWwJP6/fFi77tde8DW
         YKyPkq7PxlHb2LxVxLExlObX1W+6Om/bL2JaptxqRWoPjIpKg/g1VCzCB9lZvRavPS8w
         fLYhh/PXrhZ8ijGH83ArHIWiPNT6gL3Qb+WTcjoykMdaS3NUIN9w9PKSG42M8PhWj/gv
         HAE/5mG5L7W6w7B3gADSrnCOH4ir7hK7y2q87KFeyZfDrQU5s2dyK7OXe86n+q8BXvrB
         QnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768544279; x=1769149079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUE3fo5JDWoD+z/fAG6GQuY68IMvuJe1yhOjTrO5IqU=;
        b=MZoWpko3pfVdL9y+BB73o7iiuIqCqE1CfGRjZbY1oqYcmR3fHLgwSTmHQKP/LlMTTI
         6MHR/zerNMirG/Za1jROMYnw1hNyKLU0lG2eoRF8VhjvNNYxgC5EGFlEqnVHFTh2o2cv
         2vKYc3dWTqOwFtGdhTQDhQFHN3EI+ZfldJ3LUNZ6GQaUJcA4GNjJMQNFOKVK3aLj/eBP
         UjC4XVyaorBYgHnnlu3AZEWkHdALIN3EfqBfmvTgNBwPl/trMst31EF2nGyFloTL4bsv
         mYyJiZDalNiKGTLrMzYXPCGzQeyideUDm5NaIHdUMI+n6I6QFmv3H6hcmgxk3GYq1GEA
         wxlw==
X-Forwarded-Encrypted: i=1; AJvYcCUxWl53QMetpdwZtjNsPyM2m6PtkHYh7Y5yoGj/0ERWDR7edEeK0NDBR2zdvWQUuZ/g6EZpW9xirgR7OlVu@vger.kernel.org
X-Gm-Message-State: AOJu0YxYmSEMhg6lLzJBEwo0RiaySzw6+oyV3rFGI16vvJy0Q6igrvoW
	A9F3LAKFB2Bhbe5DFgFZH7JwGLKs5f8Brl+EbTQRdG4/oKCHIKAGfHSFKuFKOHCdym9KiL7Nlda
	M9ap/xEd0o2Ek77XLG1ALFhpgQtlsUxlTaFKtRtCjJ5qdkiQpcfrnQ4KOQyIeSb4tbUON
X-Gm-Gg: AY/fxX4cFm2PWzcZgadKRsHOSX/wJOX8WRPTpp6l4RiX/K+jTbcjzSisoA4c4nwpoAL
	dKPHt+xvefDWDcdbiHIuoF0iRJHfS4sAKkumryk3iHgOUoT+bNImCtkrr6ib4T9fF7PvNOvI3Q2
	/vlp68VX9KkXt5Zvp5PPLTpfru14hiu1MOraTbdrgaOQj9Hiox7ON/Y6P2y9QQdflo9YDoMkls/
	qlIQgiVL5GAwXm7FUVWIkB0ij9iZDg3P8lb+DIRMskMSWMZzpUoDOiYuGpWKvz0OzX3cfil9pRe
	pOELjktXbEv+90nsVeg9RhH/UJ2pmaf/ZzkX62WCPSkSc6AbH/oXE4fD4MVClrZo0ARwyZVWQBk
	igYQcgFZv1n2DAg4q6DseliPI58zLqi7d6y01UYWdx+GeJ+wwBKxYDOcpe/0lvxF2mqcbOPrmLr
	T9i3y7L6J/7tbJLw+VUysQljzbpy0b0cmfmw4NHRY=
X-Received: by 2002:a17:903:15c3:b0:2a0:d454:5372 with SMTP id d9443c01a7336-2a717809d61mr20317405ad.22.1768544278861;
        Thu, 15 Jan 2026 22:17:58 -0800 (PST)
X-Received: by 2002:a17:903:15c3:b0:2a0:d454:5372 with SMTP id d9443c01a7336-2a717809d61mr20317235ad.22.1768544278278;
        Thu, 15 Jan 2026 22:17:58 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd582sm10446495ad.52.2026.01.15.22.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 22:17:57 -0800 (PST)
Date: Fri, 16 Jan 2026 11:47:52 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <aWnYECCWECAXm1Jr@hu-varada-blr.qualcomm.com>
References: <20260102104638.3802715-1-varadarajan.narayanan@oss.qualcomm.com>
 <e00630b9-56f0-4a30-84ef-8b691ea7af3e@kernel.org>
 <nbmkrvppluonhvs7gjttsyw2nvxq45y44rz6f5w2ytci2mq3sx@m7c5nc5pujll>
 <aVtAYqwmjPPRmWzV@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVtAYqwmjPPRmWzV@sumit-xelite>
X-Proofpoint-GUID: 0t5Ih8YCSQi118KsbSverVwoPxHMBCx_
X-Proofpoint-ORIG-GUID: 0t5Ih8YCSQi118KsbSverVwoPxHMBCx_
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=6969d817 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=zoyPwqoJC1DFbwO7Ze0A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA0OSBTYWx0ZWRfXxESApfdxtZxC
 HsOwBd3EvZ/cUJCbk2QTPrUu0g6y1e9KCLEKkbX7WmXIG0hF86TxwCtxOucOBArSZmy/K79NO/O
 lLo10k2WqnhUw0IJrfhvLLrHbO9R7RAWOrNAlAamDS1+2nwB9KtFMRLmiyeGNHxHf3vb1v2Mb1B
 dbXSMOvFXL1rZu2F9UoQrWaQ5PSJ/YuhznKYE44gbVvNtvM0DSjUQePxWOT/w/91szrerK1dG2m
 dBBL7Y1kBuocy0EpEtUK0SnHfSAG/UpGW4CVP7MEKiHX6vDzlw5JINC74gqLt2L1Xq9sKySDmHP
 Y3DCbzhd4cQUxAGeG8Eze70McFNQwlbnw/uFZ6l3CJV8etJbGG8miSoy9iIMFehZVbYqHwqbDDI
 fN/VE6T5KMkifyRl4sOtzRP+HwPVR75D8eZgPNq0zB/N024mpfv20RjV2nARxmMFBtwfVXIDxoz
 cAu6cq6ThrlxGe4omyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160049

[ . . . ]
> > > > +/*
> > > > + * IPQ9574 RDP433 eMMC board variant device tree source
> > > > + *
> > > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include "ipq9574-rdp433.dts"
> > >
> > > I find it discouraged practice. Although if Bjorn is fine with it, you
> > > still need proper compatibles.
> > >
> >
> > Nah, I don't fancy including .dts files. But I do see that I've let a
> > few of those slip by over the years.
> >
> > The general approach for these cases has been to rename dts->dtsi and
> > create the two dts files.
>
> That sounds better to me.
>
> >
> > I wonder though if this would be better served by an overlay, as it's
> > the same board, but with modifications applied?
>
> I am not sure how overlay is a better fit here. AFAIK, the DT overlay is
> generally used for plug and play hardware mezzanines. But here we are
> dealing with the default boot medium which can either be eMMC or NAND.
> Can a developer easily reverse the board modifications to boot from a
> different medium?
>
> And this DT is not only going to be consumed by the kernel but rather
> the bootloader (U-Boot) in this case where there isn't a concept of DT
> overlays which the prior stage can apply.

Bjorn/Dmitry/Sumit,

Will proceed with separate dts approach. Please let me know if that is
not ok.

Thanks
Varada

