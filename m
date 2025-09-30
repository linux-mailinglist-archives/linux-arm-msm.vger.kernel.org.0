Return-Path: <linux-arm-msm+bounces-75622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C024BAE6BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 21:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6A194A2392
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 19:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8AE285CA7;
	Tue, 30 Sep 2025 19:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HeCoswil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E53286D6B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259824; cv=none; b=CqoMUGSqkGhNTZKjyJBZPVag+NXcHxwaLLZzsVe2LP2w3IzfdeNgkCfD1CLanASLGcR7K4+6p/nUosQ8FZvf7NvIkqTGuaB9UHyLBEK/w7viKi4CYYuINL+00CSnc2x0NedPwUMWRH5ITr/MEFSyDrX2IfI/9R1eDAqX5SjAsF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259824; c=relaxed/simple;
	bh=44UG9dRy9/fwmbXTFNYj/VESWJLHlVWNqviEeWagbFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNdWQRp6V5yUZ+OmrRl3mStDerbQ/JpqHWSSGLaz5D6yKV0ngFZanl1YGODDAxpbTbBF9oifVZnhwn+V2sgA94FKiDKIaOfsV9NWc0LQsmJFJ/plmMMzmCS5FWDibjYz5PVDyCZBaX4KQ44WZvhf5JivFmqqfAdGj/Xu4wyKkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HeCoswil; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCBMhL030546
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fIoZL4IX42meIGYJZYMC2O1w
	w+tUNy4ioZpD/pNofyA=; b=HeCoswil0oy1BaLEp8q1C2pWmz6i9r+lSHqgt1dT
	Qkx0d7Z7hD5sp4Wrx0iw4Mm8E4c6fMaB+zTCM761UN+kV3XUGcx/KZBsMgio/Kip
	zFtAdzbBAyPBkc0+nyjtRYbd8RhTS3KQuiDnljECzyVt7wuCYE9jGabdPZr3ObYk
	v81OcjQhpJ/9Du9FQN9tzl7XvywEzTn4qHHwx7oq2feYHNPI4jlVaNs3rF+ZmJGN
	KrgGMxiWXjjKbxm7cz6DS9/U/AgZ3Hsu3lofjw0c23td9txPNLj41JQURqenDRD/
	22yu8cegpvj94L9y1IXSdcyYXnoeoj2BPPVk6ZhSInTDJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdhxpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 19:17:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ddc5a484c9so121225111cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259821; x=1759864621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIoZL4IX42meIGYJZYMC2O1ww+tUNy4ioZpD/pNofyA=;
        b=m4yXPlwKuctO8KAiEFIbdRSRkxUgXL8SmzKFglXVsD5RykdQtoXpUygZibtFqfObkc
         gPmJ6cSOPLJHu+TmPuO9kXo/xMlRZ/fWx7PAYWaOeYXjY34A0wcosd+ihzhOcCjbak9G
         jN8hmECAE2up+x0IOpHbBF7Hogc4h43wFaVBO0Svg3oqV5WNSpc/B+wFNDjUaI5lEXTq
         G4x1Pyi/od2yk2Pz6XtXGcxAcYHiY/uqYFLykgeweeWHZXJ9sj3qkLWBBFUuY87XCnRi
         HC/uHl4MQpC/VHsgLW4AZG/tCYTzID2K8ITDzFtyRRBbwns72g8xogzUZFI+qAgeP8jr
         oEmA==
X-Forwarded-Encrypted: i=1; AJvYcCWIZL+qEBxXSrbDo2ypXXL1kC50QyiLLfiIm2Ld8uZOUK370kJ7BjNC3kOC4tU5quPCZdi2qdL4LAaeyuuJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxvMpx2ygwI2v81aA3JJIJY30aNcwwmgi5dZYrKo2FPSxqIYh5/
	XYgli65q6QDWO1JNyLVGauZ2DOtLeHuFeMjeqiE4qbYtxxXpEvhm8C9EoEhRZ+S8P7BQWbL6tkI
	cuIThGIEZ+sNesn0/DfkxDTmJhTJzLh3uGX9cXLVBfQjWHahofVdnm/qADCYUqlR5fPpU/h9xWP
	V4M30=
X-Gm-Gg: ASbGnctRGG0Jf9YBtHNew4vgd+hEuk1+OI3DrkKN9WSDqwiN0S+CVMktILxmv8R0D/p
	o765Q8whR6klxzCPZhBGpaFuicd+5L3NEOMbdlLx8ocNiJlBAi427pKNW3unQSjVSrCUIn2dbKL
	1wctZgrMaIHYEdL4RhLkBUwQ47yyZ8ifVpA9O/R9nbHd0E23v6ghmhhkph32mQyZ+q+guK7/SXE
	FqQHyHFA9x98JMPnv0OgxeIXHs1WSt4Xt5ig0xybRMMc9HDnXsW7mQlFkqoabL+4x4Vdg4f4VNz
	qfCg7xZN6OKPC2I7MWNYoRjkyTKCYRwz71Hatm49+1xMAS5fxqNo466ULQ44Vr475fzhVnBI1RC
	6ujTW5it4LIBmPAdy6x4cg+RBauw2FVdqRwyKy3cCeuReFeHgdZDTshRXSA==
X-Received: by 2002:a05:622a:4acc:b0:4c7:e39a:388b with SMTP id d75a77b69052e-4e41e15df77mr10119721cf.47.1759259821082;
        Tue, 30 Sep 2025 12:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOjGw/13ibdEaq67tmXZnXJFrkmO3DlfDDREr0t+56wazs2jNMn8OyuMT31Gg9i7tKZgg2lQ==
X-Received: by 2002:a05:622a:4acc:b0:4c7:e39a:388b with SMTP id d75a77b69052e-4e41e15df77mr10119381cf.47.1759259820658;
        Tue, 30 Sep 2025 12:17:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166560d1sm5130604e87.71.2025.09.30.12.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:16:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:16:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: TangBin <tangbin@cmss.chinamobile.com>
Cc: srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: Fix the error of excessive semicolons
Message-ID: <dxuyn3sa55f7k7ecwhxi4v3y6n3kw7nyftkrbmwt2ufobya4bd@ipdy5bz4yrzu>
References: <20250930094103.2038-1-tangbin@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930094103.2038-1-tangbin@cmss.chinamobile.com>
X-Proofpoint-GUID: knaRhY2YwSv2BryF41X8JfgtxEA9WBVQ
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dc2cae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=R5C9hjxsAAAA:8 a=EUspDBNiAAAA:8 a=foHylL8Yi6giCiIZhfYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: knaRhY2YwSv2BryF41X8JfgtxEA9WBVQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX02eylH/pXbE/
 330ir04Im7KalVXBPEYUpB36GyXi9bZv9V5wAH6CbBL0vOot8YuPCcP2hn1Jla9yP+3NQf4LcGn
 zMnZaZnzYoOdIKqpZyTyhbPW7flKK+WDZVKDNn/ewqfoc3BsMdJp4e7ZuNXoDwo6eiB6Qf7mCJZ
 +ShF2W9K7IRBNSorKMCrdJsKJkF/vXbSQbF/GCKyoCDPhLworAM2i3rDyOBce9DjCCmbhYoWthN
 +cCGbpukAarf29o0tHiDjJ+e3xahVssCjTEcepm6qw4J/OR5397UXkctJGJEQQx5OmYavKQFmp+
 jvFI7+JfsvPrFmniN/wrCGxJe/KF1gy7VvqVf+QD9ufmjdo2wtH329kAGeFzzdwWLEa6HLS3rzJ
 Kk0MTpPMw0CGu4ixQ0V/j11ynRzuew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On Tue, Sep 30, 2025 at 05:41:03PM +0800, TangBin wrote:
> From: Tang Bin <tangbin@cmss.chinamobile.com>
> 
> Remove unnecessary semicolons in the function
> pm4125_codec_enable_adc and pm4125_micbias_control.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/codecs/pm4125.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

