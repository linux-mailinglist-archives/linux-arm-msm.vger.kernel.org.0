Return-Path: <linux-arm-msm+bounces-75526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2BBAAF72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 04:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B09A189AFF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 02:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6071A0BE0;
	Tue, 30 Sep 2025 02:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XaYFPWr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5AA139D1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759198527; cv=none; b=am7MKKxbuk+IvFhtWp29gCNpzSjQYhloiHeHSLkj3+chONzPLBf9dMrVp5+b/MQ6l6gWyZ1MiKTJxn7FocCqpKoiQawpHxR6Hbq/2ytcPSgRiCTWMfzMsu/eW3nKReF9ZB4zaB63bOPCLBA3bKI4UsDzEphUKYHZYVz+zgewObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759198527; c=relaxed/simple;
	bh=qBkG6ckxOci/hIOZWn6tAh1jWLY0asoIoWhy9QpKN+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFRiFgneQwWQET4q1WX215LFAjw3290aj+LFHLCIC4jSO/GQpJzlN8CVgtm8Ab4eqURB0tSKQPqKbA1tyksjyfFTnZVawL4lV/+WU8josru4X3vk5zRRS7ND3qcn0d1SYX+I5YVk14A6lx/Ig/GZ1GUmaTwifRi9Aet/OTJajCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XaYFPWr9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TIpc2Q010504
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gz7NaVudtMDklwInvi7ETIcP
	dgIB3//c9/yNugVqZ8w=; b=XaYFPWr9M/E5StoOWhqpya47ECY3sWOey70kBhi9
	3jyxSrou/g566aojN76VzfXp1J52LNN0WVTiDfL7K2LvKmaV7rvnPvo1CZHxP8vA
	vBlPh/+wMeK4xN+cC/P3Ne9Esfjc9eW52nYC/4e5HUzWENjUm0Oj3ArZlQZEJh52
	elZk1NTOXPjRVZXEOXGdsB8AJ4u1df/BQA9USqOVxIVZ2+US2WV49a0HALCKZ/HD
	DOL6C+KH9EfsamxF+7qe+4fsWsKEjIj+eHvA//uXLujPNwmHsE2yfubwP3dx1GZH
	ffxLVhK0sNeFr5M/WhKn1o0tl8xWcWyD5IDCiHrC1QzQAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf0vvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:15:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-85dd8633b1bso1215142185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 19:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759198524; x=1759803324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gz7NaVudtMDklwInvi7ETIcPdgIB3//c9/yNugVqZ8w=;
        b=DNPzZ3jjTW5hfwC/cV1ME00EOJAPutAzMoVREFnGH5xptXaiR6kT80uAEOxr10/8QY
         kkUi0I+S68RetjZjdpwKnsUJDEn72zgBWmzWjQ5yZtGgYUgKSHLDdPBwUrxvV5Xqccsp
         YV4mShsjlzKJbBTFOm45k/tETORNF7/z0ezldHNB54k3GN56rPSmgUyXh4T1ibL2eGxZ
         nT5Pmx5MfkiCvpUMAOddlJGfWbeaT+9McaZZZYp27w7poSQBVmjAq7rzlqvoMLonPf1D
         NxlcCkHuYpBHPJbqdlsfAoaNkpfx0MhLRB9ycJ0LXlTR4zsTzhlIH1DpPcv5p8Asx5r3
         yeYA==
X-Forwarded-Encrypted: i=1; AJvYcCXSI0GxBKw2yyFon+aUtZ2+YCjnoQINKZXR5Zm0YU05owz7hhb4RzC3woyJhfhXkQHmzPRBl09+qmtugbj5@vger.kernel.org
X-Gm-Message-State: AOJu0YwHqHNU7iPUYjU53wI6pSHx5usKNwp7zZbKs7dLlKKUEM4+Fb/A
	4tHLeyRx+GqCQQyenoC6R4xXrZ9xwWtBV5ny/U7ebXTD5dVJRwoQqqtcDZQtvii5VFAQOiEg2iz
	jUXShSJkiqIRr6uWg+iHisoOg2BI7IU44wiBkbg636tdxAUI60B0fubt//nSdfSlntl6R
X-Gm-Gg: ASbGncvyn4ujtTU1mUZT9Ae9P/AomZs8ZI7NOGrIKSHt5w7HFQ7drp1LLPN2vHepJhC
	0oUawaE1F379Cpef+quWlFM4VSpcfaoFQXBbuA5ZQq3KKzexaxEsxqEWGE0gRNAvouErsxKhnQp
	xmTK6eyyM3oTSuMmrN645k8AmrIZYQUlwPTNS/r+OsDmmvKpkqWePafTJdxQiP3ha0drGqU4SGL
	HH7EXMPzsJ7jjg01T3Oqs6B4wflDBH46JsIb12hClzLQgJv3T3PmogCumWfu1AoF/bayFSZQHxr
	SlUn2nMzKtPBKBOJuOKId7FwtwTdpCxjdYHL5lnTl3UlrkG3scqx9aCe7wbKrEsTO9w+iN8gkcL
	6ULD4k1V62Qhy+7BRm1a0YPHS2VSdJ0ZUFbCzbqFCDFTJH0r8ia67
X-Received: by 2002:ac8:584a:0:b0:4af:36a:a60f with SMTP id d75a77b69052e-4e27f522f0amr32702891cf.21.1759198524317;
        Mon, 29 Sep 2025 19:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOxwWPpdXhUS0uiS2rRW4eHSCbvpnCIgFb8RnY0ImFf0SIFROCmO1BB7ICBoXC52mxtQW4JQ==
X-Received: by 2002:ac8:584a:0:b0:4af:36a:a60f with SMTP id d75a77b69052e-4e27f522f0amr32702781cf.21.1759198523805;
        Mon, 29 Sep 2025 19:15:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5879e9b81d7sm1369890e87.128.2025.09.29.19.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:15:22 -0700 (PDT)
Date: Tue, 30 Sep 2025 05:15:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: add the missing entries to the
 smem image table
Message-ID: <nx7xossx3d3lz6ybon3nju46ivfjcsc5bpvfkdygtgdjb5qqhl@ygvdtkqjozeu>
References: <20250929-image_crm-v1-0-e06530c42357@oss.qualcomm.com>
 <20250929-image_crm-v1-2-e06530c42357@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929-image_crm-v1-2-e06530c42357@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DRpLNUHptVu-_eBu7JtdCq9JfcDaEArI
X-Proofpoint-GUID: DRpLNUHptVu-_eBu7JtdCq9JfcDaEArI
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68db3d3d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_J3-MF0YoXTFZmabDV0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX1WvWU1D91oMV
 l4gkPf2FODp8xaVjsAc8WaFV2BZrQRyRXdg5v3dHBqdQm+jJGgnzG3s9UyujDDTbTseFh/d3Fa7
 K6P+TgMF2/M9cBeCptQUUuvBV3To/LYN+NiwFe2UbK9VnPkdKcAMqPZ9I+QazcF63fgiccpQ9Tz
 CTxOB58PiOTdxOqG9Ikm8F+ZIPqM7Yi+kqoFfFC2BFCtc5VPv5sQcq4hPil2vk/HQa7A/1qDMtH
 yOptoChl/QIIyTXMTLJMnPE/+wMkLzDyL/9GSnJYQElF9tFyImIElqfLOYlX49SlM9H0dtOcnIk
 HXjBxk0AlqudGJT+uIj/jIuh2peEFhVWKKFssbBB30Q5MedcZAMsYxPkja+OIEnXiyxucGViPB+
 pgidLzCbZrlRwmnQkbv7PM3USCoCcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On Mon, Sep 29, 2025 at 07:47:08PM +0530, Kathiravan Thirumoorthy wrote:
> Add the missing entries to the SMEM image table to ensure completeness,
> rather than adding support for one image at a time.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/socinfo.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

