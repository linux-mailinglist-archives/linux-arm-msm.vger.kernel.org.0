Return-Path: <linux-arm-msm+bounces-63580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F223AF82C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7523485AF9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 21:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83802BEFEF;
	Thu,  3 Jul 2025 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lS+/7q34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF62BEC20
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 21:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751578984; cv=none; b=sfl827J/TpVnevNPpuguf0Tu/8p76fCb2WgUC1I9nshJEaAvm9UWqzOFHv4BJsT/rNkm/y+y7HXZO0/6MWxvZiIfVAJPeyPlFznenuwaWgedidCk+6wYpi7wDxdEhOcJwTf/tqDgUDSnq8C5DSsxUoTj5UJY4vu60LJ+6LXb1Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751578984; c=relaxed/simple;
	bh=NQ0Qk+TMUANYCWV5dlSD/i/jLVaSorn/SnDHk88J94A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSTZ2SaJFlQLxwLqRmApgYAyTiGB0wfZgxVXZ75rl/AfM6ULelE9r2x21+6ss1q01rQ+qf2moT4bhDN0RFGboPl6OO+gkD5jUQoheg6/LVZVN4I+ZOIYfvM3nhuS9OL5eGmPgfVkn2SGbAk26trAbGwiqWFy1ZQrUOXsB0ofZ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lS+/7q34; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563G6YEN028664
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 21:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0qdR+SCx3OWhYnC0S9E4S9JM
	ShEJeWi1WMEl049av6o=; b=lS+/7q342bAzqp8ZFDO3iMZYuA0uOQdrrbO5kIU4
	eNcRDPpVD1Fwlis6JVo5p1uWlqg4uE925T6cSSTEkuFP9aA3NJQ2rtmWc9lMT7np
	M5NiLPv+nPe6kza5mHV6+NdcIVFLfBWLkcitV7V2hAXl4EBH+9wOcYKz4C1KSZ7D
	fbk7subCH+Dn1+WAbFTeqF4kXOnqdJOPq3Jf+wZXdmdz7mHGr5xeV1Sdgf/XhY+3
	28MZ/e8Ma/XO3jR7NNJqYICGm8n5UnpbuLgJ250qBoy/RRvA7kEnQX1CrrAFS87H
	rQ2TDkNvBhZiyWl27FzoOu81XrLGcd5WAISRUMOO3h9rUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw1wby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 21:43:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7ceb5b5140eso38892085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 14:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751578981; x=1752183781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qdR+SCx3OWhYnC0S9E4S9JMShEJeWi1WMEl049av6o=;
        b=ADCsaD8HkHds51wcnO5SoDZ8yoql9ZCQri+L8tqh68F6JY3UCVO4mqObHzWsUlEPOF
         gqrDetRjf/jbAN3v7Npvh76Txvu82ketQqqeoI0kUfC3V7+ajZviSkI4Z2kuOTuwl/WT
         BNv1fdgVpEIhXiJMJv2hCGAvcwhZJFvBDrMikZw6GSrT1DerkioPvh0Mr3k8l3dVBWSm
         J1Tv9PsFeu0tPR/SxVPAsNEH03KuFAmIwr2lrEI7fR2+d6iHjnysZt0aW3obDyj4FRVs
         q/wmNyGFmszH5ul2qsQCMDtoZ3IgkPoS/JCp1O3M6wDX3oAfBTFB0Qw3rFMnvYvikZ76
         RgWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgzzVWUYBI7vWiabcjVij8jC/r0QpamSvQf0U6FsqlSAPuD9boi7WvSJ1Chplx8Xr9KkAh16gacRFTSXAz@vger.kernel.org
X-Gm-Message-State: AOJu0YxB3LIe5y1EODGi3sMze512+szJ92hgb6XMC3UILka8wpY4f3ow
	O9HC96xK47odG5WDIsNDZr43Dns2LSbSnzGJMPniqntP+TTSDGJnhCtBQXriu+mP9FaJ0ZoacHn
	t4TXZ5VMDe6UwQhSN2GgXWdvBAJjWmJJeZZh8RiP0LGrNC4HP4NdnH82IFJMIG2MPKDLl6TI7uB
	Iq3/OXlg==
X-Gm-Gg: ASbGnct1hgpbHjS4gn04vdMl5HA7tzzMQxoydZO+HBZ4EIQxLkrpZ+MF+XLfwywrl8x
	f5Dxb8jKCZQRzWqkXJo7ihAtoa0h8UOgvI9+xEYzb1C1+XkJ3KUMytaxVTb+SkoDJEd8c33amtu
	RzThY0u0Yby8esqjyon4vxUL0Y8qe2r4SDuwg4pvhtV5tJzCtu3lD2046gI0Cx5oGbSV2ddaNeU
	Tekal9LBMvPgaC6N0WPK52oe3tMP/E8wC/DW7opwL67A03qMJR/pc+TAk+Nle5TdEyWmV9NGB0Y
	2YxJMKVh/8Pt4RaeAPlwEjT17oW4sdL2+FEZKdoOhRwkh4SlwCUxx2/XL7eQfMwY+eSYKN+4b6q
	LSGCjdgt29JzdWBfXd8T35x0BCwpyxInjLJo=
X-Received: by 2002:a05:620a:7187:b0:7d5:cbfb:8844 with SMTP id af79cd13be357-7d5ddb1d9d6mr7417985a.4.1751578980949;
        Thu, 03 Jul 2025 14:43:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0r+yYXY87tfD9NzSKu2cGD8cQwmepM7gyxeU11O6CFVmLIqXER+CNuV5QEvR6O0qoT+qaMA==
X-Received: by 2002:a05:620a:7187:b0:7d5:cbfb:8844 with SMTP id af79cd13be357-7d5ddb1d9d6mr7415685a.4.1751578980482;
        Thu, 03 Jul 2025 14:43:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384cea54sm74195e87.247.2025.07.03.14.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:42:59 -0700 (PDT)
Date: Fri, 4 Jul 2025 00:42:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pushpendra Singh <quic_pussin@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add support for two
 additional DDR frequencies
Message-ID: <waxxtkaqatisuvdhejahcion3i62d5ojljtgkmhw7acckjpxzq@qbe2pb3jg45b>
References: <20250702000120.2902158-1-quic_pussin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702000120.2902158-1-quic_pussin@quicinc.com>
X-Proofpoint-GUID: ccZ4kd2ZgO1mNm2ZdZ7eaHmu4QfUuV3X
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6866f966 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=C_4s4C4ZoqFTuNAt9h8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ccZ4kd2ZgO1mNm2ZdZ7eaHmu4QfUuV3X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3OSBTYWx0ZWRfX5Z4R0+mYMWR7
 29Rz+3EPvEEum+064S3Rx5gpt4Fd5aXMnLGy7QpR3wLDtGl4q6kpryR/bN0bgo7TnxpRL8XpZVG
 uD/8+P4Z/BGtjzjDb8UrMo+WcEoCMTU8Q62p2Vgf11t7gmoZiLfAwDY9gzF9U1jRDJ1vmvGBeFn
 NYjAJSBFmJh3JW96xX46uDWbFrdZMIjUEuLdDjQje4Z8rC3Q1FkmjLRnCP78yAQ5MBxy+8DMVS8
 C9eH87q+NX5EqXqTbWtOb3i9hOZjytOWte/3BfZaZhXPn6cS/nZclZQFWm3lhLNEJvG4UD/VkC1
 yocZv4dEHbauVOD5lHvw4JhjF1lfkZ5PX6ainkt1wvmh3L0YbT8duJr3E6M6/q6E+U2V3QfEksF
 f/jlGoa7vPfQtqWaAV3BlRlBsnZjetgO4njCx5ioBFwV3dyvpuYMO8iWLCH5eacXYmmgpd3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030179

On Wed, Jul 02, 2025 at 05:31:20AM +0530, Pushpendra Singh wrote:
> The SC7280 SoC now supports two additional frequencies. This patch
> add those frequencies to the BWMON OPP table and updates the frequency
> mapping table accordingly.
> 
> These changes do not impact existing platforms, as the updated mapping
> only affects the highest OPP. On any given platform, this will continue
> to vote for the maximum available OPP.
> 
> Signed-off-by: Pushpendra Singh <quic_pussin@quicinc.com>
> ---
> 
> 	changes in v2:
> 	Fixed the commit message [removed cc and change id]
> 	Link to v1: https://lore.kernel.org/all/20250701074334.1782967-1-quic_pussin@quicinc.com/
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
-- 
With best wishes
Dmitry

