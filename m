Return-Path: <linux-arm-msm+bounces-69683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C44B2BB1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B4433AEEE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 07:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB4426F443;
	Tue, 19 Aug 2025 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeZQJEFk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517A265CC0
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755589901; cv=none; b=dUC5/q5k2yQeChEGKbRARTAj+K5uTOnGcsWpnxEGTzchuUxmEMH5IRF5VNOBRw5BN7YDiB88OLaL89FfRjH0Lpvub/iDLjBGjkulLqBLW5MkVxMAu6i+otE7A+wpTEr3gLsFMCd2sLtENOmdwHf4tLAp/bro+EvCj1l8A48MLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755589901; c=relaxed/simple;
	bh=hwDV3OUoJA0rQhhzEfToTTZ3S31BRQrNzPCNDLh47/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOWUQr/smdoHa2+wrigQb+hs+ma/CtHmwVWxUWkrcg33rFtMC+w/8imJFAr0USLz+fxitbTiC9H8nPoV2hZWRy+Amf2B+zlvsb8rmn95zTcizXl/SE0WNAsMErxTEgNj3+ZJGgfKgky+zV1HKjS7whze5HLpxxZBwwAuMeLFQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeZQJEFk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INOUD9026395
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C2elg3Tw3CQ12V4g6n5Sj2D/
	PhBEsxUy6PtoreBc6vE=; b=WeZQJEFkDYZ0bj5FrUoybYyK5zpBmRLluvgaK8dt
	2UD/WEiOuHHhZmnCG1F+yfssh019F7gnWoIFVa0Co0gxrV4e3B8iqpXXmcXzIU2b
	NbBg49kKsUydaXSczMzxwHq+EQTwZ7RYHngb1YvDYARqfmEUIvPm4K99Yb6yVSa0
	XM0x6IpPOcf8pbQ/EfuehQVPidg0f3IEgyAFH25qs8bNOl9z2jReONa91R3x3eOc
	QDpbf0XMIb+8Yh+WnNNMjIdiyXweT0ES9HWWMTUpEMgYtRkvJFq6QWDHATt92X58
	gUUYX4FQmoapNHLgin273lFKC7EVLwAu+U9fbiZX75FMPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunuwrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:51:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88dd1408so112145476d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 00:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589897; x=1756194697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2elg3Tw3CQ12V4g6n5Sj2D/PhBEsxUy6PtoreBc6vE=;
        b=HaUct4jbiH1MgT9EI6eAX5QP/85abE0gd8X9w++NADja1UOjEQDnh8CG96Rb7xpHnD
         PhLUNePgTPXmf4nN+Ob/S1jrPyObCbpG9vs+Rc/TF0UXvNf80YAYdXKse7l4RTWR3TjG
         /pm4ps08WWkWEg0IUzczE87/Z1YAkHYBqPFzuhU9mF6OylT1WlTTsAN6ImxeAEiVQTE5
         1MfUXB0UWRi/j6FB2EPAvsknCTk0AbG6Q+BPb7ee3mDU0EHzdQYlGgH8/7OgzhPSQz5Z
         vba9TUGkC6L3zb+Ogj5j17n3pJ+Frv1JsHgbz7Pzy53ukIXpEDY62l+l3/IrMLMgZZof
         whgA==
X-Forwarded-Encrypted: i=1; AJvYcCXf9+Q/oqzCrUoq/jwZsUtXGcoTUmKJZWUouzohR7v9ATEdyjfAigDVkBzbBEvq5FwnXuXMYyA6enNlueV2@vger.kernel.org
X-Gm-Message-State: AOJu0YwiMqwj3L/voQ420EUERS33KEnpBQ3tGjX6MJ3wQpN+No5WMX+k
	IGWhycjXTZzgKEgThqe9d+b4wVVXdw1W+5qPEq1aIWt2p51vcDuhtQBsZfioGMW+6lYk8fxrVXB
	FnfVDkNwfDLxQ3qMeFcyKukwLy0HdlXX3YmqOuZWDmOoV1Ok+Tf9i9WlcbGsdv+0yIEcP
X-Gm-Gg: ASbGncsdbIrvbCZ7Tw5FAIvQTgFLvI8rNZ8Zxp8SZmA8xs6rMWnSwnwXMHYUa8sAB4l
	d6Mrx2FgCn04iYcfgDRkeKNZImlRFc9cd+1iD+3C9+pSK1AMqRdeBKYsR16lZoXI27WkWWJ7krg
	HrJqGxR5H/DEVWzDa0XDqVSHXhwh/m+OWkTPZRPEEDsMRT3S3qM0zty9gMlNhF3dCs2BKfnqbqP
	Bhsuol8zHTP/+1j/qtIYfwSr4b1t1OYutw+loPYMFOvBjClQ5IDf7tbmFyIWthqwzcTaxMNkmS0
	Cm1+4Xsd5l8XYZiprENgrJvn+DVE/BuK0CtNEs6UsghZpFIn4yGX+KVNHLcb1JBrGkjI+KPgwOe
	BqCvqzvlG6FGN6ZfZhdSYyWQvVoJZd2fKqCjB1vgVsh34vWAINlLj
X-Received: by 2002:a05:6214:230c:b0:70d:6df4:1b22 with SMTP id 6a1803df08f44-70d6df41d6fmr3058976d6.63.1755589897476;
        Tue, 19 Aug 2025 00:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd7TfthtwS1n6N94DNqFy91G0YwJUeyAGW3ScRdrSu7GyBio7wRiaGd38hIQfnp+eeCRK1xw==
X-Received: by 2002:a05:6214:230c:b0:70d:6df4:1b22 with SMTP id 6a1803df08f44-70d6df41d6fmr3058816d6.63.1755589896805;
        Tue, 19 Aug 2025 00:51:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41e251sm23188641fa.11.2025.08.19.00.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 00:51:34 -0700 (PDT)
Date: Tue, 19 Aug 2025 10:51:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_bt@quicinc.com
Subject: Re: [PATCH v4 2/4] driver: bluetooth: hci_qca: fix host IBS state
 after SSR
Message-ID: <npmyohftd37zpnvwgzet4vasji7m2nfygyofrrxehmisrygyou@3cz6yanqqcmm>
References: <20250814124704.2531811-1-quic_shuaz@quicinc.com>
 <20250814124704.2531811-3-quic_shuaz@quicinc.com>
 <ndgufkvb7gkqeco45xlru2x5ai335s3vhx6wso7pksqcyfdjll@azfjjboa7bc4>
 <11d06cd6-60d3-44fa-94d1-7917adaa0230@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11d06cd6-60d3-44fa-94d1-7917adaa0230@quicinc.com>
X-Proofpoint-GUID: ZoVUnXB9ryPMZrEBCwxys3g5Hd0H5fbT
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a42d0a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=3nUCoSrt7Jy0hBid_xIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX61/PllS4cNvu
 IU+oEW0EigZB6I1LzrlKFHOD9FgRsrGBAQ/tq2ZeYCaIXwtOBbakc3R1uW07ewpEuQYhvT50cQI
 YmE/f+RhZIZbImUgwr3hB4OGc7qIAAwyknxEptHVIlBhCd/QohO9umzJ2Welghz8Jf6p1+pg2fI
 5Ia3jSkDqJZGGTjEBGvjbsOV+wenneFWSmd5r+nfxke2jb7z8oIzLGKwhaA5D2KxPKAqxrmqBld
 9FEpQB0R9/8eUHEHmEACM5JYa7elhJBYQk5RAdvmx3c+h80XQAdAOA/PuVY2wvDgx8vGGgEwRkT
 MwUVmYWDFX4uMXARemzqNeo4a+IFbfpegJAK27wRPPyDS7Y0yk4HBKwpue5pKca4Hq8ryH0a/ep
 9FWdlXB2
X-Proofpoint-ORIG-GUID: ZoVUnXB9ryPMZrEBCwxys3g5Hd0H5fbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

On Tue, Aug 19, 2025 at 11:38:01AM +0800, Shuai Zhang wrote:
> Hi Dmitry 
> 
> On 8/16/2025 5:50 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 14, 2025 at 08:47:02PM +0800, Shuai Zhang wrote:
> >> After SSR, host will not download the firmware, causing
> >> controller to remain in the IBS_WAKE state. Host needs
> >> to synchronize with the controller to maintain proper operation.
> > 
> > It totally feels like all these patches fix the same issue and should be
> > squashed together. Please also add a sensible Fixes: tag. Possibly
> > add cc:stable too.
> 
> Although these issues are all related to SSR, the underlying causes of the
> errors are different. Would it be appropriate to merge them into one patch?
> 

I think so.

-- 
With best wishes
Dmitry

