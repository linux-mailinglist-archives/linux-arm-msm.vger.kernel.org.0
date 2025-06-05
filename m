Return-Path: <linux-arm-msm+bounces-60304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18CACEF3C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 14:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E9303AD00E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 12:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D941826AFB;
	Thu,  5 Jun 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LiDtUYWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE716419
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126658; cv=none; b=d3fW1y93ZPPgib4LhQGIlOqzJVI5COtxRhrR8+/v7ocORIdAWRHRLjrNMcWessPQWm5wLbVhYoHXeW+g6fg+bCzofqyia7YQlAal9iXgAL6mcYA2wwVCu6tQ/ZVrFhDJxmEtjvxwIxWnPmFC+7ELbw3Qk2wWl2vOc2F4xVFr1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126658; c=relaxed/simple;
	bh=TZWnThcbnTjWRdFMqMCAUjB+YrFrDzfgiH5dW0zatfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIrYkAE5+pE4bnwezoXUuUslhasRHQUQKyTYTXOZDilLKxeCxS+cKrZMmtTyJXVAFC0hnBeCAJuA3/ZcfRtb2ROUFKGm0kPbyKNRuz9TP3XmBi7zCEUGe7AdKWeFythjcKqegSG2VCCVA7BN5scVL6zuqQvDu5GVl4nbhPC38v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LiDtUYWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5557mtgE010362
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 12:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8zoylx1QuLi0pZwoA6HZK4hy
	+63LtfiIZwBR+DzOGNQ=; b=LiDtUYWj/wzhy50SS2P6OKcl/msD9X9Ubi3i+OQP
	AOxAHVNp1me+zbUvD3+LocuizFESHC7TqjZgfxHSEYPtfjv7KN3f/8TLBgdPevuB
	JGSmIshnDWUpc+yocLmAtFA4DuTkWIBtWce3FyAmuXjw0/Owz7vHqx7x3M10F8LR
	W7Vtg7Uxm2oVt+X+0pdAxD1RLvv9OUsWTmdCnBcl3NLcF9hs/3zBIKlePMNnAcIh
	pzXKYdmLzqtrNuOsBZdYZADhf/UVxSrtadTp8dkiIGT08VQ/iVbn+xpdPXl3ELbh
	iZgtNjQs7Z0sMvBBPe4BYorH3qaJsvC8+ZQzuXHbpFxuqQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ys9dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 12:30:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e7550f7bso9886975ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 05:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749126654; x=1749731454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zoylx1QuLi0pZwoA6HZK4hy+63LtfiIZwBR+DzOGNQ=;
        b=R9JkBAICrOnDDtbv18Vc6UdQXIHdEgUFY2CzIPgDZ7VHFt0E0oTOgQGEW/JoMdkT/J
         PA/ePIMzDVfXjQa3YDgY8hUF8/bHQRrdol/jtdQ3uz9f1ZVmifZC5tUxuZ2YrfeZ7NEv
         22CBpQZTZ8EWOQlmw72X6wBhpyatVqMY+uWbphsnHO73nBQZnxiXF+Ms845INutROJY2
         7dQSi+d7ZQxWLwiNrQsYabmp+lUBRsUBQ5Ha2NvYZwelSVfKZvDOiyCsmjMlufh1IY58
         nJkM0u9EQaeQ1vQfmU1sbNE3A66+rRypIVAw3mhzLpex4t7vKJ17N34t3pssMC5mL8tr
         cuXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEhcJZLKyDur/THW+21dDuZgZlB6ubhw857DN/p/x1NV48Nf6VnaeMv78FqPgkdPuMrPpwx5LIhUl5wg+G@vger.kernel.org
X-Gm-Message-State: AOJu0YxQMuK8L5kZhDplDhnqjzhFSuh+32HMjnuh355uCKL1bjVTfrO9
	F2J5q2O7MzQwZjW0wOdHnypDbQ6sfKWBH7cOWe4fQNkSyaUCgmGU48/DZ+E7+hHubz2edIfNSLZ
	E6RgmcBwsVNnSsPh1RtMjaTSC9WhZIh+PGryaAobEBWC66SqQB88iCDBUOL5sxpIU1T+tMwOeqZ
	TuotsNfa1xBWA7+PQSrqyFXn2u/2/m2JM0oQ+lCnMPVjE=
X-Gm-Gg: ASbGncuNIxU2/YVkY1wX+OnkOpsXWKLgIjCnZk/mX0civsXkFB+OHGLYvCGrqtIOr0t
	EFgovMDKbn4Ayk982Db6ij4ASkvsmWe7tAtxDD0dyc3TWkGsvs/FDrV38fyRYGX4zrJVe
X-Received: by 2002:a17:903:2305:b0:235:91a:31 with SMTP id d9443c01a7336-235e110ddd2mr77356155ad.8.1749126654158;
        Thu, 05 Jun 2025 05:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/NaZFI6I8Q3iARrRK1yLX6Hwez8SAK/Pvn5ED6d5mV5zGH3OfKI9Oe4s7eSFk9px/R7JbYs2D+oCJQiXoxLU=
X-Received: by 2002:a17:903:2305:b0:235:91a:31 with SMTP id
 d9443c01a7336-235e110ddd2mr77355695ad.8.1749126653761; Thu, 05 Jun 2025
 05:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com> <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
In-Reply-To: <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 13:30:42 +0100
X-Gm-Features: AX0GCFvjBbRAMAXejejAvGq6nX_oZcZYy7MLtFcpvOHrihpW2Eqenm74lbaZ_iY
Message-ID: <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDEwNiBTYWx0ZWRfXx8tXxzl7Yn4K
 /kuby+H8wXGIppeYbHU1yFepCICayiPEnixaTRHYdmQFasm/SGw+1dOh8bBH+5MskiV1gC33Jm8
 nRC92MpQ12qrgisNVeM74HBUpRTkDC3HNalLX7Fz9lkS9oidmkE+KhJDgg+O+ltNLc2WENuVUE3
 12Agfyb/5o0sTMa22m2WjDi8fG/9csayFoMSJVS0Fn+GYl8FkSqAo+64bxla2C5E+1HHeZS1535
 5v+Xyzj2vRQkOMJRgM9+o3LsvEGj+ksKJoPFwlgL1EkAeHo35bb9dH4GsBnJSRBkKjc/917hhVi
 1I6Qneee27ET2L62qUkSqVs42ynxoGEgQ+BbewMK5xY413YcYGLEze64GxbcDfyC6mn3e6s7xMj
 PqMileLkqMXIgyhAN4A84mGZi8FrEkAYMSbS2N/KTnBP9QXAOOo/iklHHwXDzqavYe/xdtB1
X-Proofpoint-ORIG-GUID: YkUQjSO_xt1nGf4gxlD6GepyylZpbLFZ
X-Proofpoint-GUID: YkUQjSO_xt1nGf4gxlD6GepyylZpbLFZ
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=68418dff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=0G5chWBQ-Mji-mtY-ZkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=464 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050106

On Thu, 5 Jun 2025 at 13:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 02/06/2025 08:16, Dmitry Baryshkov wrote:
> > On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
> >>
> >> On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
> >>> On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
> >>>> QCS615 uses the same video core as SC7180, so reuse the same resource
> >>>> data of SC7180 for QCS615 to enable video functionality.
> >>>>
> >>>> There are no resources for the video-decoder and video-encoder nodes
> >>>> in the device tree, so remove these two nodes from the device tree. In
> >>>> addition, to ensure that the video codec functions properly, use [3]
> >>>> to add encoder and decoder node entries in the venus driver.
> >>>>
> >>>> Validated this series on QCS615 and SC7180.
> >>>>
> >>>> Note:
> >>>> This series consist of DT patches and a venus driver patch. The patch
> >>>> 1/3, which is venus driver patch, can be picked independently without
> >>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
> >>>> DT patches, still depend on [1].
> >>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
> >>> on QCS615 over(?)clocked.
> >> Agree, so we need to make sure that the driver patch is not picked after the
> >> DT patch.
> >
> > Worse: we need to make sure that the driver patch is present in the
> > branch which picks up DT patches. Otherwise building & testing that
>
>
> Well, that's a NAK then (although depends what you mean by DT).

I mean qcs615.dtsi. I'd suggest an immutable branch for the driver
patch. Or just merging the patches in two consequent releases.

-- 
With best wishes
Dmitry

