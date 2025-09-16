Return-Path: <linux-arm-msm+bounces-73669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9595EB59340
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128CA188C5DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531B21BD9CE;
	Tue, 16 Sep 2025 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtLbXwhP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD40303A13
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017966; cv=none; b=T2dTBT2YCFPT6votUlES19R9MpEr8lYnJytMM2XZnK1dTETYctSgHECjZw26sA2mAVnC7+A9H362tTbkiNW/iUB96+cVGhewg2wTImLYkocTLH9m39EyR5DQ9n0x+szeciTy7sojvHGJXaND9Z0U9BnJrifWzJVxZlK8MSRKTPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017966; c=relaxed/simple;
	bh=0FM9OkE2a0680o9LMFE/4uvss6jn9QpaCDiB+I50lPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPC72qL8H6PwFbHLwRaXRMtAQsPi3gPdP7hT4cLiKTPx6OPHvaj266E7AvMxDY0fInQpPvVD/nXtUMnFZMUOpFyJk/jK1ZMaZAr1rzGLS270drQMY+FQiH6wc6o1kGSLJ6IKD7gsJgaxIB9RTwM/+ZRkOzfJfjypnWOUk6TE9e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtLbXwhP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA13ed003890
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sl2TOog3kB9QFbelgSf5eIFg
	UTi8GDmmk/d1oNtHYxc=; b=EtLbXwhPk6zfkjc8UtKVO/aB+5tuueVqBzcWHv/n
	ywQeLa/Pz9TBq8bpIjMlt9FItt2kfsEzIMDS0pXE8GkgJfeeE//5uZWeABCDzAGG
	blL5pJ7zTQf0GFenVwvXXVNmPSLeXxlTvmIkN0GlyUrcvZo2LYfCgmGpqAmfx0Nu
	9FZJhfo4DV0KuUB3Ywk/dPRsPUTWhz9yDTtBv6ui9JrZzIr1GhCSopEC8eDaxsQd
	snmSLLHSqP+2xAdIQUoByYSOjNgrGJvfTI8jO6d2VPtvrV44b8XXafnFYq2UIjQO
	6F1nwo34SrUK0SdhfWniNH4sIyQMunJ4S+jtXcHN+Cilgw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr8ryh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:19:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b345aff439so136365381cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017962; x=1758622762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sl2TOog3kB9QFbelgSf5eIFgUTi8GDmmk/d1oNtHYxc=;
        b=j7E2wDY+3A65GP1+GjpUQP36VXSIFfe0uIt+yjfDu1RyfqWEu8JT+91afcIlSOYFSi
         sXFC6vf+SPZ/X1Iq/sugbN9beYVkMzA2A+JS1r3pSAJGEKVpJsYZdr72xZjn9cHq/rF+
         Os9sM2mcvhjIf/FbVUbsKVqqLrz1parzLc8KkfjDzxPU1dygIYkOH17q0q+mL6iOFlhy
         wRjwQR2dTGJ0ZaLPIcNxegLMe/GoZP4JpBcAV101yf3F1NL2hSLk7egvdc9Uym9Ev0re
         QnNNxs5Tx0e+LU/MRYaHcHZ2QrHww7X8dwk4PpZkAIeAUkr1wGAj34VSiWdxs1qYPsjP
         zTww==
X-Forwarded-Encrypted: i=1; AJvYcCXdUrNqhkcP3e/7CkeFQtg+ybNF1+QA3c0UBShz55zTTcQ6QSI+rYjij+f9MKo1wh2yMXu5GBFKdUA/MOv2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0p9t6qG2A+DunXXJ8aeUzCCCD6+UiUwMBxEJ1mpJsFbWUSRM7
	F+Sb/WF+ZGzdJHWG7L6UsNTgZC8FDZbGG2n5eohybRF0KnvyWogzXup4C7m4Ss11NjROEwzoyCL
	+cW1OHMwCdk//gGzEeN7bH6Fd3Fbxveb8+eR3Mmf6ooPhmtQx8pkJ9Bh3eywMhEeAFIAv
X-Gm-Gg: ASbGncuyzKKNnKFS42PG7NkdHteU7lGkp+0gfIGJo+J6ew4Bu3t069LVeFQYyflU5wq
	iuYbP3dEv1+wZQ/wQiL46/+AzRWENLjFDbH3VtjFpQYfYGCCVII4zUI6rgjvCFj4pbcH4s8cXRr
	OLRR9gdQsTGFbMgppvyzB++YknXTTZT3gq6ooBokJCI7+qyFQ3Jx90d8Q1Gra6KJfOKZQeT3tuq
	S4fBgaPCPTn371YUt9I5yxVnelgD+2ax1WHSPCVlr4xIf6k95tf4JR4IQwXe5CxeYvt2/rHd0jM
	3FxQREF4bfQqSiBUh5/rLsjJjeR9msIhgF9le49kmg/FoTowhLT++Tn80MRXzyFrTSQ/TCOSME0
	PRJEJdwQHq9gGkPEJnmdRjUGV/Semy3C5NXay95SslGkQEu/aWhY+
X-Received: by 2002:a05:622a:5e18:b0:4b7:8cf8:21a1 with SMTP id d75a77b69052e-4b78cf8257dmr87539311cf.82.1758017962610;
        Tue, 16 Sep 2025 03:19:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRX7VgG6Mvq4kDoTzOqcrX9aymRenqpozVFQTu+puYSIYn8Xg/8lhSfWflWu0YJbAs1S+Zjg==
X-Received: by 2002:a05:622a:5e18:b0:4b7:8cf8:21a1 with SMTP id d75a77b69052e-4b78cf8257dmr87539111cf.82.1758017962162;
        Tue, 16 Sep 2025 03:19:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65754ab0sm4211645e87.132.2025.09.16.03.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:19:21 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:19:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] regulator: rpmh-regulator: Add support for new
 resource name format
Message-ID: <yjal62st6dx3x7jv7lz42xfkw6xyzc6b4sfcvdzigcf6ivkyp7@xmwy647h3ohm>
References: <20250916-glymur-rpmh-regulator-driver-v1-0-bb9b00e93a61@oss.qualcomm.com>
 <20250916-glymur-rpmh-regulator-driver-v1-3-bb9b00e93a61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-glymur-rpmh-regulator-driver-v1-3-bb9b00e93a61@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GtdsMRRgKbXWIREIQ0loNlil8fNheDqX
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c939ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9nMCXy-jIdBvRpzB-YEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX7btzrXLyej3q
 ePLkSCSw+1g0l+5TLGhFeVjENSG16X7SgrD6dFU35DBD/A7mIC8KYuPBVxYKyjaojFyqudWLxBL
 uRk7fVVYXb8xLg3/oucKg2m2uSsL18rgJxUFyXuuMBnF08Z3xL3DhNiU9D1b17gnj23eSUBbYHK
 qEB+i1ur9SdHyY/E9UACoS4qzHotORKQVjYGqUf96Zm7uEzbkasoFfWXQjqtgxRGHS84wfz3G0c
 afmg758QAku/7pVaIDEMsE7oUmNVCLpPDJhuqTw78MnkxqL0yPgVlJzUFQfPQ10lN+Se+oxA0nJ
 BzdJKqpmUZCQJVZv9y7Ca0IN+0QajxHUd4fX6/0fgFi3fqcadex+oYAW+yArtffxVACbc3m7fei
 eHgojSlJ
X-Proofpoint-GUID: GtdsMRRgKbXWIREIQ0loNlil8fNheDqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

On Tue, Sep 16, 2025 at 01:28:17PM +0530, Kamal Wadhwa wrote:
> Currently rpmh-regulator resource name follows this format:

Mention that it's a resource name inside cmd-db.

With that fixed


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> `^(ldo|smp|bob|vs)[a-n][1-9][0-9]?$`
> 
> (eg - ldob11, smpa2, bobc1 etc)
> 
> Here `[a-n]` in the resource name signifies the `pmic-id`.
> However, newer firmware follows a different format that also
> includes the `bus_id` as well in the resource name.
> 
> New format:
> `^(L|S|B)[1-9][0-9]?[A-N]_E[0-3]$`
> 
> (eg - L11B_E1, S2A_E0, B1C_E0 etc)
> 
> Here `_E[0-3]` at the end is the `bus_id`, and upper case `[A-N]`
> is used to denote `pmic-id`, while the regulator `(ldo|smp|bob)`
> is replaced with their initials in upper case `(L|S|B|VA)`.
> 
> To handle this properly, do the following:
> 
> - Remove the `resource_name` member from vreg init data
> 
> - Add `index` and `regulator_hw_type` new members, which will
> contain the index number and the regulator hardware type
> (SMPS/LDO/BOB/VS) which can be combined with the pmic-id read
> from the devicetree to generate the resource_name.
> 
> - Choose new resource name format if `pmic-id` contains `_E`
> in it, else fallback to old format.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 1134 ++++++++++++++++---------------
>  1 file changed, 586 insertions(+), 548 deletions(-)
> 

-- 
With best wishes
Dmitry

