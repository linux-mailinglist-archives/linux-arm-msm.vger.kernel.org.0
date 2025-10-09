Return-Path: <linux-arm-msm+bounces-76725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9E0BCA366
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 18:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6650B3E44B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 16:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3141D2264DC;
	Thu,  9 Oct 2025 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SES6ftUS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6EF2253FC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760028103; cv=none; b=d0ZfGtVWL+W1BtbwqUgB9Oa0N7YOdPjVMWgLmCAjYta0r/F2csgYVH1+imnG9g8vlDmxiwWd4mpEFmnv++AvMP4R6/41dQSWPDvaOJY5cjtHSquqmzHtfUoRfs7POfc7knxJ4LjAkHDbm8bqmiZlW/QtupbynWwAbZ5praFcJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760028103; c=relaxed/simple;
	bh=nzppNACxKDmFbDUZaZy58p+ZQlSwVTMP3w08jfJr890=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eK7bX9pvtge2dHocQA+SwfU0H5XUOr/24IvStZczATS3vhMajUjQqOL1wFq6Ze9JVo+179+t4fw/ybjq8Jnp3nrrb/i9Zc9M8tIZatq3U2b9LSQ0NzXJp3E9CiAbiRDeUurOQLIwwb7HNlUypr7WrbOAp1qg2UVcZGgPkJmdBrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SES6ftUS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599F55sb022284
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 16:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jVIjAUCQHFumxYlbLBQFJgYn
	ACBUPAyS6FDjWwEKeyw=; b=SES6ftUS2cpNn/RLEQZ8oSpChoXMgwIR20TPlyyg
	j2F6SbMWlr8w3uvwrhSTene8nsS7VbS5ACRmg4xc3TPn1p/qILgq1OOMoxg7pv6I
	e0Yp9Kt52MUiwceCEp9ZXVo99B39atezPtLJrhP6g4bbae0MgT9+we5Fm8BKeNP1
	KVmZSrY8JnaW2mhM+rRXXq+56l/R55swSNbvGiAKxoZXlC5YlpJKViu2SmPr6cCH
	KPkYROGi+b1acBoZ/FWnsWmEnT2w9VQ21JlSbDJNfyJqtUcWT01qsqIQgCKQW6RD
	QyUIcKcXyUMoLaQd5p98ZC0Nq0S/pfleOM3AZ2DyoRIiZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4skmcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 16:41:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e576157d54so44067211cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760028099; x=1760632899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVIjAUCQHFumxYlbLBQFJgYnACBUPAyS6FDjWwEKeyw=;
        b=Tm7vnqVAgThzsYZKq+12p3yKxKKo8NwGHNcwGgvqsabSvEhz4igTmiLucgvFgPjLDk
         v5s0EMztscwAiH18rctUtrRfpjNFsQzw7cjdJlsBZHOexaE0KTfpTB+81E3hLzMkP78Z
         HUJ8Ifk6M9NRzQ6IBCfQaV9Q+UY1ux1uazSKl0qvSvr6bQqjBnu3VDlLm3AIeTw7cput
         7xFZ+oiTnxfJFySzmnHMQHnUtgh1AGp8qnTlHhU9NDYL65DeXv3wM197gHGvfSsXL6ol
         6km8dpGWesQ25yc0Vy9BfYXc7g1y0IUTDzP53Lvf/6J0bqSBg935gguKluogO/RZ9PPz
         vI1w==
X-Forwarded-Encrypted: i=1; AJvYcCWfQs0HHyTpam/0U48UInp2mflGigJ4zisp4V6Qx6G6MCJrwft4kPNmEdSs3SMzYnfCgPczKIjwk0m95Ue7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe3RIBtLb9Q23EzPyes+Aj/CmKjCnpOFsUJX8KhouDSExyimxI
	XQwxesgsurULQfr9MPyBMvLYoEAhkatKWpbdD5ZrKfQrRROUNIuokgkH7bfseJxFxjlGcUatR1V
	hZSU+chRLDnsVRojGhoyo26nfisosSDGX88r/kyPX5sQApmdOIpOI2yRknN3+4/Na86EsIIzCYj
	Mb
X-Gm-Gg: ASbGncu0Bu21AHOgelZJmxSG+JFIQI6MXQ4fhZ9VTAZXndEAtNsObGUJdc2oAqX15r8
	egAB64fiqhaEAJ2w6eQLllaIEQrRyDszdyoj4ej5iARDLny9xZb++787AHqFfEyqV1giHHxGcHK
	WYLP7UrcvLW+epKw9ArAp5WoTnO69lilrjLt5agHrehUODXI7tC1Z0FgJiDXfFChsESznGWnVAp
	QIdu3gsBBmdKIYyRhizRfW6J76FNXL5EXtpW0ms4VUdXJAMoVocyz8ngbeFW46fsq5QN2ThPVI0
	Qih6qwXKo3erW3GMSVkI6WQ8S3auLAj8C3AzoesvB58y0JNq74u6eu/T1kpAFX4Ku0YN4/TfW2f
	zNKIhi6vpVPK/ijsZp3ig8dwiH6arVqfEG6/enwoNgClLO3F4OeXnzB/RJw==
X-Received: by 2002:ac8:5e0c:0:b0:4cc:48c0:adfb with SMTP id d75a77b69052e-4e6eacb414cmr111994381cf.9.1760028099301;
        Thu, 09 Oct 2025 09:41:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoXKMV291WSm9uUShb9Y84qPGluLOJeWKWrLLXfJieCpTOfOgB5kBVupedt2mzmmaaiI0w4A==
X-Received: by 2002:ac8:5e0c:0:b0:4cc:48c0:adfb with SMTP id d75a77b69052e-4e6eacb414cmr111993991cf.9.1760028098856;
        Thu, 09 Oct 2025 09:41:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3a1a4ccsm29241261fa.27.2025.10.09.09.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:41:38 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:41:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Add uart1 and uart5 nodes
Message-ID: <icm4q5hsalaknszjhtlgii4xf7z2xa5ygjifdhsbu7neid3gth@ow7bflgphver>
References: <20251009090858.32911-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009090858.32911-1-wojciech.slenska@gmail.com>
X-Proofpoint-GUID: 3ok8cMa5GZsjZW6o2EUn7yWtZ6NOfAJr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxHXmPENszId6
 nQWgyeDD79+3p+2JZkigp0abUe6AOlQX8ULn7TBfMlD7yDboGEwM452bZL8INuLveeLBzWVJD6w
 Re2L/+Jlyu94yQ4EbapJa+D3iWrYvq3pzpZZIMA0sXoe4NTMycV1M1+1277SsYwCDx3nYjSYUFU
 0xKNDI5ffrKi89Elj8KVgv/I6gF/53trjfnG9Le4nZSS2OSXNnn7OWPhFeHZQGG3UYnqsDMZc8w
 Z8lwBZ1WCO+76eB36G9+j7cpxfIFcxKo3YHIVRqA+MFNYzs+o28pf+Av3uZIZv+ZcNq+MEmIs/n
 YAPYDBw4VueYi5pLEy4tfGR6cy/LCX/UNXNbYYbQRlsfmsqi6yPD6odYMfTuD3JcrY09nEOGUZA
 B3orYiFrkGQ/FOfYcorT00VQ6oM90A==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7e5c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=biNn-n-MkuPdZtkuIrsA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3ok8cMa5GZsjZW6o2EUn7yWtZ6NOfAJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:08:58AM +0200, Wojciech Slenska wrote:
> Add nodes to support uart1 and uart5.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 48 +++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

