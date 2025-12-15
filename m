Return-Path: <linux-arm-msm+bounces-85277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BFCCBFA08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E2303001638
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 19:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2AB328625;
	Mon, 15 Dec 2025 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5HhAvWl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhQ/BHFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB08326D5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765828780; cv=none; b=l0qdNdV74CcKxMlgOczNkvJvhB4w4ytL0znmq7zwHcUzPYH+0YXyLfJgpdOgKue0+r688CbI1zfmDahZ6aIZpA4Hnpg9PJaSmJ8MIfxW//LPCECa7w0kdwKZ9PFkesRt+H2XJc/fmN7URl9/0/R1n7pEEd44JoFfdWY9sHKYEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765828780; c=relaxed/simple;
	bh=UXC9w+i4rTgvKRCDOkIB37o5l7A0DfGO5pn0jwIutEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYYE3PW02fnHyGAlcy2XFtdNeBLDBA0jmugiTnwTbrpVX+2ciFdOMop/4V/z9pQQkYFdrFz6K3l5h2HNkxMKttdu0lJSHn8KelJbfyHCOVFhtkdG/XZjEcs2VO66Vp5npiHVte1OgcIP/RmYnK/kVRrSxdG3IUA2vZFdPK+k/l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5HhAvWl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhQ/BHFT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFH6jV61756184
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xUvRut4LPhcQJt6yy5jfSYri
	t1yQjmZhCtes6R+h94w=; b=N5HhAvWly81DWc1ywucHiaiDbJNdbpU4q9DwOJEZ
	D7v7QfCtRtHEB9D2lNlKd2ghF1lmxEQ1BHxuBtqPK9nrPuTKNKNpUVzSVO2z/Vay
	VeZiIQa3D4o4w8w395LsQ16cED9Qv92XHMIfzmmZ2NgK4lkTq73QtjA/iBAPghts
	Q70EFbGGa2q9nhuuF7B/ovMfPFrSymyh0RHZRUDdNh8DwH/nOc0m0yxQwEzbMp4q
	PTfN9gbU60WXYxA4edpAuCfttLD4HKbu+IJVmuYgC11VN5unja+ZkL9EJHGZLH9b
	mQgbjJYEdP5K9HbUAJsCpwz9EqoYrrIxKGlm9N56Tqc1Dg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2per8ekd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:59:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09693109so74770261cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765828778; x=1766433578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUvRut4LPhcQJt6yy5jfSYrit1yQjmZhCtes6R+h94w=;
        b=EhQ/BHFTsQv3lk7EHxHaBiF5IF7xYvhGgbQmcHrhC/NtuRoZ9BOgqO2CZX44l5Tw8t
         PNafEgfOnPlkyFaxoMELFfeR4eQc0O+9DK41HK32sfAMkCJL8U849PkU083+MyQTkcRB
         2ZVl6MxAePqjCcYby7W1bnXGH8jY2FoVtodyQF89/AA9b0bx/UhzbQfyUYrHH6itzGzt
         xLXzoo1AsK5K/y62eRnR9nSXPCZFooO62vxWp+x16ccInL8Yy1nDaw7AtmVbnY8/0edC
         XLT8h6jSQpEoaN91R4sYqTsmQI9g4RJZ55ppxt++qG36K5h/l6Su61c5dMSkwe4SWjtf
         M6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765828778; x=1766433578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUvRut4LPhcQJt6yy5jfSYrit1yQjmZhCtes6R+h94w=;
        b=dexetNDjV8S2czL1OO7WND5RexRu/P011AOalYvqRByZAaMX/eIDiiEIZz4kj64PUF
         FWcLlJA44G6mR5OCn/dxJvALYdS6t4EVyiKpgeieGchVUH7mEQ9U3AUOxWc+oF+HUDhc
         +otDJK6hkFbC2gvymcIbVT8U1BJ4JqVMzrqKk0Dj9ukEUfTqY8n5yQTUPkn2dkPwaSzn
         cswFUMNVN0encRisLyrnc+Ejc4KyEtTS4/SM92oxGHVp3vl7AFKe+YiPKQpaQcyiguS3
         i3L8sZkFjlurJyf0dRdMlN8vJjkqHSRqrGe3BfJxhHda6lSWnUuJSVvJb/KUjCMOoz5r
         k6EA==
X-Forwarded-Encrypted: i=1; AJvYcCW1LYo7XwxdmjUa+spOLZOigVHZB3UAL3E1WK1iRS/4JT2WCwcvjIDqcPpdSrEbVEOxFTPmibgF34R3KcNQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwUM+8E4/zWvbOXHC4WIz6vc7GfmX3RWa/REsRjhdPqxb1lAhl7
	x7b9kXXptq+o7P69NuABwh5yUrTu4yVVBlTE1K17O7v3hG2Km4dpqwaLiSFWd6o9GlbZUwRIX+3
	v1xcMoQthxNMWISPhKM24FKUCNflsOkywji8qgp6iwP4qmn6qnvOL1pqYfpYcbzlbjScM
X-Gm-Gg: AY/fxX6oA0/4pi4LOxZCIxdGC7HOAojFd/aVnEmcMNSeMEd8RNjAMCrvBP68uKsk14D
	Yh+LCNINR+SPdj3I5x1dgYHIqMLpz05/FSwwsFBqRQo53QBH+GId53f/z5hVRKk3y228SbX9Nnu
	lL1DrhiumUAGCwmuHDigUrz7HwZ4WNTmPBOEIGqIzXhv1wyIFUwoC7L+a2F3kM7bEwRmvkzm9Dq
	4erJVkAuitYzw1DXs7WnjZhmX+O0Wzmf3gk2RXJwW0fReUXudmKDq7CKiwWLpXc5fi6vM7d3ltK
	wL8hJ0KDuAMb9qJCqupxcoZanS0S4TNfGUP8Nl1Fc/NxShZ7VZkULy8/wANCX+YdgQsZTR7QMgL
	uRu9cvi184x3MOBrP9lYkf4g8Ik8/wb+QJdqT4WXrEKl9XNDZ/m2ZzO9wYdGfseKZmuIJq7NnHb
	UPeFToD9n0hpjqFA+WpHaHjaY=
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-4f1d06121ccmr170372231cf.70.1765828777603;
        Mon, 15 Dec 2025 11:59:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqqZpdpk/LAjsUwO/CuKVnRywZ44iVAnPHYSr7pn0xdNytnHiFeJJWTaxDzbgkXOhzHtHKLQ==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-4f1d06121ccmr170371811cf.70.1765828777171;
        Mon, 15 Dec 2025 11:59:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdebe61e2sm31399611fa.7.2025.12.15.11.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:59:36 -0800 (PST)
Date: Mon, 15 Dec 2025 21:59:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 08/11] drm/msm/dpu: Add interrupt registers for DPU
 13.0.0
Message-ID: <rs6cvhftyxh6apvofabt3jgpbguqmfgaq55jue6jaddlfjpbga@sxhofz6qhw3s>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-9-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215083854.577-9-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: O3Hhc0EGHdgS2o-oUYuuqoqUCX3-qA5N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MSBTYWx0ZWRfXyNDUB35kJFx0
 uqtO7utCDnq8W6sOuJN2x+5znXl639ZWj+j4Zt+QgYiuBX7nvQ9zO/Y0LYymNwivTNZs1Ld8EzU
 SethnhXUrcOqanNcsGsKoy4zIMsOVaZgl/wA8Vl2rO63ywmelos94/ep4WxgLBfwqq70tzMIFSd
 UdzF/yZsASsYqgTDZ6PMXPrF9VKNzLu8SkCzuj8TrY2jhF5Xa81eEovvDhITY4TQRAlU2iLllR6
 A5YhVwgxW0/MGpJPqA0eJyJvIqIyQvYdRPw+S+9xObXOvvMG2dyILKevs20ciQAlaiptJR+s1On
 nGZPfSe1gaX17Swbn1MCwD6Wj7uht9AdxyqwGnEJFm2i7LoNK/qqghq9kmY9UOKoU17AMQ9WcDR
 73zErkOC5vDE9tHg2wBlDoYLLRHhfQ==
X-Proofpoint-GUID: O3Hhc0EGHdgS2o-oUYuuqoqUCX3-qA5N
X-Authority-Analysis: v=2.4 cv=PYHyRyhd c=1 sm=1 tr=0 ts=694068aa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CTRSWpIYyOKnzFSy8hkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150171

On Mon, Dec 15, 2025 at 04:38:51PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> DPU version 13.0.0 introduces changes to the interrupt register
> layout. Update the driver to support these modifications for
> proper interrupt handling.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

