Return-Path: <linux-arm-msm+bounces-72133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C25B44719
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 22:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B025CA41E9D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 20:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253B727FD76;
	Thu,  4 Sep 2025 20:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GStfmUu1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9407327FB26
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757016993; cv=none; b=K6S1kozXemXJtwfSPNUROnzRCL3IxRCQ/6JxAlFml6/mtqJr8Ja6lJgaO8/oDD/nf5E5FZOcXA55FI7WWH1waJPUytjlvNcWlKfNnxyvAyMhy/QDUNTEu51IWFt8D5R1EFqhn6j1r+g3JU0i2ZshwXBTDVz4GurlCpzN42By5ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757016993; c=relaxed/simple;
	bh=wsHd20AsJfMa6Wx3AXg6obGKYV4i2kU1t40Rvld7cXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPmXARvcF1/pYqfOYfG5q6SpCBwMYw4O0Ssm84i3XfjVpyFseMBieqZRN5d003oqsOqf68sej/r3cw+IWqojO7XkLqrWLG17GpzhpVxb96hL/C49l5WWZlftlXsM96BwSTyQ/fIGm1ksw8UanW3Yb/8wphrCKVgvRiYH4UIAtB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GStfmUu1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584ISJLV005051
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 20:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xOnQOwS+L47eJqdD2xfoBQRC
	L3cjvg9aVuPwvzZvFpc=; b=GStfmUu1CrqwzWdKY7Agp7+Uzmd0qtGHDw4NUVYC
	MVcWrDzMS6HJONHQZEbkOc1UB5oXYafzqviDkUY7K5m+wkbOElxM/kxi/zUvBlRn
	CKQl57xbcP5wYydUNyv2JJjp+T7DtL07vAMQV4mmghTYfz/avXx2loISPf8hxJwx
	cJcu5dbQpKUP/yyFVILniN/BfFTywgX2tTwajQ6pdWL8GOcyPqti5EPyvlqgxtOt
	4nnx4XncqRZF27YeNlD4816PWjUHS8MVkYAhhCJk+KvOth6nGuGHLP0mRztd0xk+
	+RXZ4T2R8xy2eyxaniRNefn3uvYgkzSGBVPALAcurDFXDQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s8u8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 20:16:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7296c012e7dso16380346d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 13:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757016989; x=1757621789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOnQOwS+L47eJqdD2xfoBQRCL3cjvg9aVuPwvzZvFpc=;
        b=v1uPCvPPRYrRnKjHa7YyB1TXcEMGxxlbR1SJlLZaxJ4sTJ3rO+KY5Vh7u8PzH9AQeb
         1l+SJWofUe61Tzw5DoTITyvJeDXbMQMQM7HH5eCECzO/qxh9dEDmSJVrvzbSxp0JrF77
         G/r7ygkhs0Potxv1f9XuDOWt358rNMTbCHCIyt7d4GsD5HelkiGPvw/wNJhrJh4e9bC1
         wDs2Fy3K6twBZODQWuf9rkGejKXRg5C+jz5TDQQk4lEEKLDJgh9HbAg4v5F/3/HK0gdJ
         IhgT2TlSK8hjhqMg5zrPio2BIJ7Pjl5Cc/6VFU97ESHYhbKJorIDeNmIPE5G8PQcVoBK
         ae2A==
X-Forwarded-Encrypted: i=1; AJvYcCUYUd7zLM35etVv/6eq+hKHE+insgcL/eM/rZM6qVa2VXSwzvy3x9Ou1tvMFXNPH9zp4CYmQkdf7+m3u7Np@vger.kernel.org
X-Gm-Message-State: AOJu0YxvF2fRQy1jE0I/Zyzx2xg2unvwnzj7grZ0S+RZ6sWKw7aZjTwG
	2OTf1t4R5DkVsmEvUwIRubcWJtmQLAIIYWR2YenutfkrBLtmGTuUeK49hFCVnfuiQzAz/bPvuH9
	+eAugG7v9vrQqK2hnAgZB4qqppjUT02RXbbiqlc2yRAMCnb1094ELb1Mu23BwOybtN4jY
X-Gm-Gg: ASbGnctx6u++riBjQm3313dkmK/k35bIcrs+1nbEDxO/TMSS1/tIW/Zxn4T7EkSSmnP
	agGrwXwwgPSC5YUVqM9RQdTOl4GN/J11akKSK9wr+gyoObGUpsxRupmL5AQ8Uw1KFz9ozYaO0Yt
	35fJQBBg5sMHrfepPKdHXnwB4XQhHfAZcADAKuAaZbTnPbaw0tDt1zELGXEs/V95HOVwU3B5fl5
	LkLkGrPZ0QH5B2gyRZf+Dqo9cOudpGu12AA1PW6UYxUpFrpbvQJ7rxPaSSVRtXSDNuw9BMBsKpi
	TaX9fl2rudObhBZ1z7fm/JNynnSPrv0F85oO5Qca1krznk2OXdsyWUuyCslX0kY3psVesN0AwiS
	EulvHOP7i81+dAuYL1afj/MuT9w09L9BgRsupqxdHT2EaC9iyqKnI
X-Received: by 2002:ad4:5f06:0:b0:729:d2cc:9443 with SMTP id 6a1803df08f44-729d2cc947cmr38070646d6.39.1757016988750;
        Thu, 04 Sep 2025 13:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6ZBkThlXqQk+QXlZrohvU7MoDDoi4EYRmpkHcRkJ3x4qqQmgMU68HV5l9Kryo0ZsRp4157A==
X-Received: by 2002:ad4:5f06:0:b0:729:d2cc:9443 with SMTP id 6a1803df08f44-729d2cc947cmr38070086d6.39.1757016988093;
        Thu, 04 Sep 2025 13:16:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad4e2e3sm1393356e87.147.2025.09.04.13.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:16:27 -0700 (PDT)
Date: Thu, 4 Sep 2025 23:16:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 05/14] dt-bindings: eeprom: at24: Add compatible for
 Giantec GT24C256C
Message-ID: <zedyu77se67b3s4zmuqcx2zslaasemllmtr6ua3k2p53cdspcc@ikpf7np6ugfy>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-5-8bbaac1f25e8@oss.qualcomm.com>
 <qya226icirpzue4k2nh6rwcdoalipdtvrxw6esdz4wdyzwhcur@c2bmdwnekmlv>
 <aLnqZktduc/aT05R@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLnqZktduc/aT05R@hu-wasimn-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXx+zG/po12QUX
 ZSjHHvwv848DfQ3f6n5rdobqGkvqiHtFBuTcN+6c+ic71cS8rQDL86yEmB9Dx6LtSRu1fW9YkDv
 tIgh+ivkxXsaMTCvPQhtFO0tkjWEzdfKrq2kuLDBv+ftxBqY2b+mgwDcl8WvI7ObNEcNOPdbg13
 mPF2GLyw2M6cw/xQJXQFAZFyND+sl+37J7mDezlfwHb6vtTwCBF5YhGkZkoIabi1ieQKcGdRtoj
 VtQJOv3zn6ZFnJbl7BOdjvuRzrE6UjsknUIrxfgZ5z9y2HeHP/bw5CUTdylKjnIxVjyFrdnDv/U
 4tc/V03Gdw9V736em+RyFLTIa7MckHLm8uLcqWTUZtTsQmgw1MF4yeAE5OLVE8sZVCvhADMNp/G
 eU6WwBrZ
X-Proofpoint-GUID: WDMotoFZ8jB_MyCMYftfDnp6rQi_gMef
X-Proofpoint-ORIG-GUID: WDMotoFZ8jB_MyCMYftfDnp6rQi_gMef
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b9f39e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=q5DPIbX8LfODaG0eNlsA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Fri, Sep 05, 2025 at 01:07:10AM +0530, Wasim Nazir wrote:
> On Thu, Sep 04, 2025 at 07:43:27PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Sep 04, 2025 at 10:09:01PM +0530, Wasim Nazir wrote:
> > > Add the compatible for 256Kb EEPROM from Giantec.
> > 
> > Why? Don't describe the change, describe the reason for the change.
> > 
> 
> Let me know if this properly describe the reason:
> 
> ---
> dt-bindings: eeprom: at24: Add compatible for Giantec GT24C256C
> 
> The gt24c256c is another 24c256 compatible EEPROM, and does not
> follow the generic name matching, so add a separate compatible for it.
> This ensures accurate device-tree representation and enables proper
> kernel support for systems using this part.

LGTM

> ---
> 
> > > 
> > > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > > ---
> > >  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > index 0ac68646c077..50af7ccf6e21 100644
> > > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > @@ -143,6 +143,7 @@ properties:
> > >            - const: atmel,24c128
> > >        - items:
> > >            - enum:
> > > +              - giantec,gt24c256c
> > >                - puya,p24c256c
> > >            - const: atmel,24c256
> > >        - items:
> > > 
> > > -- 
> > > 2.51.0
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> -- 
> Regards,
> Wasim

-- 
With best wishes
Dmitry

