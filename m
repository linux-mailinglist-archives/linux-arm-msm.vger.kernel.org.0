Return-Path: <linux-arm-msm+bounces-69988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47373B2E14F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 17:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82F7EA20919
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 15:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41571322DCA;
	Wed, 20 Aug 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuIKBIbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8643277A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703119; cv=none; b=TXRMBYjS7nKTDerXt9zdD0+BVuO8SWgbmbpe331ViovxE2b954M/tP8bCZI3ZlAthGbKLdROeGBy4IriLtGTRutousJgUSnvDxxw/TCPb5HfTLBJiTBeuPlHa4JvVFHAkBNa72OmJsJI9mGk3XCVZueqUBb6q4t057/NeQGRNv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703119; c=relaxed/simple;
	bh=DtQjcbMNvcByxf+0zZY1naeHA3tbiB/xArykXaaUpLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeV+wwx5HjbyQk0A2VQggAMrzDA4It+sT+S7iP56ZFWRPYdMZCnrz8XA744/T/+LCPgNxiD7iUFqYn2rzuWobnudrK/RwBpKpIeoHSeVCDoOBpMxmNhclNDl5aYXLxOwhdDP4wkUpHXLGOmcDvn83y2/5jo9NOBgxPxaKLaQ8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuIKBIbS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA2OYH019714
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 15:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlCeQ88Snci0AxZIyBl3l26zn9aHH0uhjgkXgI9gCMA=; b=GuIKBIbSbDq7X2qG
	Tq2AtzWu4ZvKaJ6q476gogBr4bJL8h91UGpYCiYzEf4JVOqla8AyZd58F6fgMgfK
	563T8OSGnqqxMDTcyRcGEgb2UXRSworDMqXlmnS0rlkjZ9vm9cG2v+sgLQXWC69o
	i4nWQ/exP9Ej9kjTN7IwpZQcRFsmPTKu64ws/P4Qxl3j2PffoMfqXmsz6Phm452q
	B+OKWJV9FFfIRTVe+33/Q6NuVd/kYvMIsTc3dfi9qf5HygcxkJlUcvkJ78G2f7O+
	+Lx0W7H7c5oK+5wsEIISXZLi6A5x7eOQ7QXV0A6I9RGa3rq861auU1095NbqsvdA
	VvUoHg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52925v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 15:18:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47174b3427so5581977a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703110; x=1756307910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlCeQ88Snci0AxZIyBl3l26zn9aHH0uhjgkXgI9gCMA=;
        b=QXD6S/mQS5ik44mOnyyweUN20JLL7somGgNKBmdxJyrT4L8aJfmeRF+sePZsck5ik5
         T11uH/vW0z41O6yuE8VPu0pah0mLEWYAiWz70Ixy3i5Qe0a/V0ecSQFrV77NKGSU0Rvh
         YGEEc64l+8xJ9IE9cyUzu7hRDVNP/605S8QIfK3dpLtkRlbLj8ox+qdYC3mrIclOL/hQ
         2ouFHdANZ5pubBNGF1hvITUFKnW01otB8lsMshFfjuJUQ3GR+vGb/P4hh/ScekmECGz3
         LRbwnWWHHXLJ3zHDVhcmwjYNbLc4Yp3lsKwQLijoARtgKoFvwwZEQKwJGfssZmpWmiUP
         Y0aA==
X-Forwarded-Encrypted: i=1; AJvYcCUx2sBdmLGTdOBiFZ4P6AKg9fXnAereYoe8Q702E31ggGCiBvKw5ZrGt7yCKyYQmsD6y8ZwmZhZBm0xA4nz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0SqUTvXIRl/OpSfIbP9F0RWLG3F+8c6zxh1v7D5h+fR9kW5M9
	zTP7sJDc8D/ru91dZfX8OfGFmtfohV8ka5V7jezA02M6GlyZPycnKIXyYP3wvw2k7MDLzWI/r3e
	8dNdb60tm/3dW0ZERW3YBWkB4+I4hrVoMlSqFOgF0quRhNPhLoK5qEdJLyzNTxrW/6u8J
X-Gm-Gg: ASbGnctsET4K3nEifTskMVoZqbTfQQT5f381BSFeAL+sXjuWUzhIo6FVjJz8cT0e0TV
	6OoOyaK76x/wrVmtycTo4DIRlOmnagCQ+C5rAp14ZAh55mwjTSgoUU28VyUYEIRSu5Vh3twCfP5
	QcqRr0d3cMqm01zj/HtTiNJ2qhXHa7nhXaNpvaUyUy2qNoLDJCsIFZZRiz5gbmknmafY4Wzn9M7
	6tuZVx43ZppWKd8mS9VVTREi5SZvHHdPyWQWbBDvP3Uiv7nUMbU7NXYZJ1IuQJ0ocJJdy9aOYF5
	Nr14yE1RYNre4vxxvRkMjxxjYLu/78MMfi2ot79IXW+9SWnzOH1OHzSHWWTtamwZRO4=
X-Received: by 2002:a17:902:e750:b0:234:a139:11fb with SMTP id d9443c01a7336-245ef22704cmr37010765ad.27.1755703110135;
        Wed, 20 Aug 2025 08:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvgrjEM45iEXFzZdFgh90MepofgKG2tYDHkeGY0eIX8zylArW1Zrd7Fk7SrPTDwjAl/RsWbw==
X-Received: by 2002:a17:902:e750:b0:234:a139:11fb with SMTP id d9443c01a7336-245ef22704cmr37010415ad.27.1755703109682;
        Wed, 20 Aug 2025 08:18:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed50352esm29255935ad.128.2025.08.20.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:18:28 -0700 (PDT)
Date: Wed, 20 Aug 2025 20:48:22 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKWDXySSt57tXHVP@linaro.org>
X-Proofpoint-GUID: htvtP8wD0tA50pVGDSkQUTz5ghn3oB4f
X-Proofpoint-ORIG-GUID: htvtP8wD0tA50pVGDSkQUTz5ghn3oB4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXx8YjSpvYA4j/
 CVTTV9TEr0fkuU34+eBfURvUNKAcSaVdUzCaKrpqS3rt4936+34wcggm+5xH+2oP74WS+Gh++tq
 VTjZXKn3baQ3aYoKnJfReG+MTSdQyrTOsDkeqIw4aSZYlFBSjOo2IjW7VpyjbNtVLTAKUEZ/mVq
 kpizMUKkDatn712ktQ9lUP7uwrLCt9U7fevKJMQk1ya/kmdECW5PGpDqPGSa5SCaiYK1pkbQsuY
 bqciUZ5L0/d2GO8iyC6Dd4Uzbd9Ez91grCdssO8jvKkQLPuv12dvqbxTzOvc6WEzNlRzgQzhYYt
 fdDYFBrLBJ0iwc+kuvLe8vLey237ffgNAd+jG/xG9JSw86E9d9mmmQhhnggobKlL+ORnQUmtPx9
 pVMmHR6NRu5LE+T4uaWm1O5uhhVuwQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a5e747 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=r3SgeffVVk19ujrvIvAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 10:12:15AM +0200, Stephan Gerhold wrote:
> On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> > The resource table data structure has traditionally been associated with
> > the remoteproc framework, where the resource table is included as a
> > section within the remote processor firmware binary. However, it is also
> > possible to obtain the resource table through other means—such as from a
> > reserved memory region populated by the boot firmware, statically
> > maintained driver data, or via a secure SMC call—when it is not embedded
> > in the firmware.
> > 
> > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > etc.) in the upstream kernel that do not use the remoteproc framework to
> > manage their lifecycle for various reasons.
> > 
> > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > also want to use the resource table SMC call to retrieve and map
> > resources before they are used by the remote processor.
> > 
> 
> All the examples you give here (Venus/Iris, GPU) have some sort of EL2
> support already for older platforms:

Example was taken from perspective of remote processor life-cycle management.
You are right they have worked before in non-secure way for Chrome.

> 
>  - For GPU, we just skip loading the ZAP shader and access the protected
>    registers directly. I would expect the ZAP shader does effectively
>    the same, perhaps with some additional handling for secure mode. Is
>    this even a real remote processor that has a separate IOMMU domain?
> 

I don't think it is the case and think the same that they can skip
loading and Hence, I have not yet added support for it.

Will check internally before doing anything on GPU.

>  - For Venus/Iris, there is code upstream similar to your PATCH 11/11
>    that maps the firmware with the IOMMU (but invokes reset directly
>    using the registers, without using PAS). There is no resource table
>    used for that either, so at least all Venus/Iris versions so far
>    apparently had no need for any mappings aside from the firmware
>    binary.

You are absolutely right

> 
> I understand that you want to continue using PAS for these, but I'm a
> bit confused what kind of mappings we would expect to have in the
> resource table for video and GPU. Could you give an example?

We have some debug hw tracing available for video for lemans, which is
optional However, I believe infra is good to have incase we need some
required resources to be map for Video to work for a SoC.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

