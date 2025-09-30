Return-Path: <linux-arm-msm+bounces-75558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D5ABABB8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30BF3189C980
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7872B22172D;
	Tue, 30 Sep 2025 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOut8Vw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E85222586
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759215782; cv=none; b=ZGt5KxfRG7deEk0G3sc3Cvu3sR/LX/evenGtxD6L9XO4TlL/c7O0dvDyim9f3erX77nqFEyYZ4NE69WJFp42EG0Y0uYHHusa1983hOjaZJeN4nC6FnOJXu+661eqcnac9xUh4sBL66ZuuvC/TWvQozJNIbQzbhZ7B0358+uOK8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759215782; c=relaxed/simple;
	bh=F1FiYxViKywIbSE573kHTnjfzX7LXToBGFkMvAHPD3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED6ZXbJYgReGk2EO4RDHy6GKnxUOEz8bLLIEyqjz89pD7DH80rNHo4P4OZq0Bj/KgtSvVBU3gGU5HcVPgcAXuwSY8BMlCnCi+6lD5lyru3H6UrNegknYaOjYvdoPCjbdvF6fAEBjh94WB1H4x5heE6N2iInRnY4TyExc7SJNOQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOut8Vw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4I0Pg013362
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZILBarotSZWQdM56LLJz3+w/
	7JscPhGYyLjRbrYgdnY=; b=OOut8Vw5yYRY4OGq48yBkocOurdwvVdz2F1lCt6o
	k2gP3wjxwc5Aysiuye2xQK2pZM1ndn2A08UC2m1ielc6IQUggOShqqOGyiZXadlm
	vhpKm7dbSBDU+VPSb/YE0XhgUHTUEqZLq+3yacne2pSC//8fyBfWbXLFqhlG7/p+
	3BuJ7W3TU6nEUBTYIdkpFLp77cyYQwCxCvZnvHAQTNtd97eHYTD9YylFAH8sBFA8
	lje4KKku7gcJcPdVJwW/6MMd9qL14cPT+Q0IGW5rpts3lhEI4sz1qEwVj0bYYlKV
	RKee9WgC1CRvh3/JcmNlaoeiMIOrdP0vRyclmTH5YulaFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5yysa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:02:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df7cdf22cbso73255681cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 00:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759215779; x=1759820579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZILBarotSZWQdM56LLJz3+w/7JscPhGYyLjRbrYgdnY=;
        b=TlsNyHX2DPl/Mtv0wepapwcJhokbgfgVaMFOiKKi8UhG2jPC8KqIsHMaPkht0jfk38
         +xAEfTFZoQLSX/ilQBLAym0QHocHEmH3pBOh6pIjP5TpZdRLHrL616qw24FW1dXfLSno
         CByDV38LA+WRBJKQwz6WYfNH9YPxa8fxKvUmiGZbN1tUL8DrH/+X47sNoUMr4bT3J804
         Mq0n5moW8FVwx6pNt8+dq0ujChwSw726HhTNuSBafZB9Vsly3JtaxLAbJLqb/d/Kt1AZ
         WpdHuvQJNEt4BTyX3jNSMQQVQd6XQvWSCfdO0tMXxBiZ0PAMOkXdaIUV+Tej3+i1G/Av
         HDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLlk63AoICfsicqoYUMUu6mlvd4ut4ql6ztq3ydbKdG/2YJ8vglFIEQWC8AbHxlYFE3Yovv77j4qc75B56@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv/3sdPlMkpEfb38n71GOrGgHqDvSMGsDu5KkWGx03ZuPiqAk7
	5JlEh4l/+x5BNZiRqjtLzr0THbIE4KYieuXFhDuzc6VysqLHXh784MTOG34oU7bpnhHOBlZYSUc
	kNFnwVZ1FEbt/SHjrTJlo75D1YbWl/Glw1cWfcGI23Bpn1ex4P6OgsjfthMELRqCPZiUf
X-Gm-Gg: ASbGncvDaoO8O8rt8Y3FnJemVfVkbJikbKYSE+dw8JiJL5eu+24aXTALL97XJBXoIVx
	bKES94n/C/S43IpLIxSrhl+CEhrcxGWYOgRskXXFSH8kW5GqOrvD2MJjhOE7lfVVDbHD/+dk4Ho
	vKzdc4XPJYUU6CaP+NJ5lfDM3p/3gilWk01TnMAJawMt+1akFpnosFzoPDhnnhrgK/I+wZMuj1A
	91C0A9dWOqKunWpzpyIKSuHLzomtdqG5vsQf7bFyiica4DB/FnZRVf2NqF0uZTE8vrxVzD0qUJL
	lH5jutjIxGFJhI3vXYy/RmRL5qGOA2HTcN9u8W6uoYATSuAjYlfo4lMsr4j0WXnlLnu5bq9b5Po
	pfhDc8KKrthk5eU3qucmxSmmuFbXfe0imHtUA6D/KjCpKqoqTt417vP8yWQ==
X-Received: by 2002:a05:622a:255:b0:4ab:6e3d:49b4 with SMTP id d75a77b69052e-4e27d7c1b65mr43578381cf.7.1759215778767;
        Tue, 30 Sep 2025 00:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA6lGjRTL6r8mC989qOKGIofS9wz03iYOMq+60qPx/pT9WrIKYNjXkEHiEux+C3IniYKpKBg==
X-Received: by 2002:a05:622a:255:b0:4ab:6e3d:49b4 with SMTP id d75a77b69052e-4e27d7c1b65mr43577931cf.7.1759215778195;
        Tue, 30 Sep 2025 00:02:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5839329881dsm4325236e87.87.2025.09.30.00.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:02:57 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:02:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/17] soc: qcom: ubwc: Add config for Kaanapali
Message-ID: <yhcqj3beliary34msn6zbaig7j4krn32st37g4n3ey7oipswea@ckio3yjuwswo>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68db80a3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_QbXVIGTKPyQLETMuiAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fWw8L5hh2WMWNKIy7MgCAdSoS3xIfnl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX3HU4J/RWgAgn
 GE8sprsAESwTZIR0CqOGcKy8Yd6vOfY3TKQ+NfbeWOhG67vhkgpWTH/X68cJ7GIywt/ObrldrxA
 HaS0wdAFHOvPfLH6X34+a8IuC6t+AgDg3RGb39dfhCun5e9B2geP3g6gz4LlVMOG74iw3znP1ev
 kNKplEveCU4weNZozXQqKYUSpv6Zc7/LH3b/M0mIitAQXm2XBfqgcdMUQdvF5qr3JAv8JPqokFN
 CTfFmTthkNrfGxChPozwqnP+uXvzV8Byu5p5HJlVLM+z6BWfdHbT42gD8ThhR7xLbqvcT0rFnXy
 AsPtlCix5dyF5f7sWAMq5ahwQECkxU47eFUzYTZ3MgNuInV+ViteZRzry0/+5aL/ZEYeIPTCOxA
 vr57WzC46xx0+c4TiWADoxGhXGrKvg==
X-Proofpoint-ORIG-GUID: fWw8L5hh2WMWNKIy7MgCAdSoS3xIfnl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On Tue, Sep 30, 2025 at 11:18:06AM +0530, Akhil P Oommen wrote:
> Add the ubwc configuration for Kaanapali chipset. This chipset brings
> support for UBWC v6 version. The rest of the configurations remains
> as usual.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  include/linux/soc/qcom/ubwc.h  |  1 +
>  2 files changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

