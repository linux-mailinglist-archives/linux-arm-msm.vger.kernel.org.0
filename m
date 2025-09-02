Return-Path: <linux-arm-msm+bounces-71596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF090B4008A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6F8C7ADB0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0EE2F5303;
	Tue,  2 Sep 2025 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKf5YVfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFEC2C0284
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816191; cv=none; b=UYeNvMrnTvmaaIYNrPUo7qSgq8tCj65JNnZoot8BmK13E2HwKsUAKRQxhGEbQ2zyP7UOidCPSPW+Ypmthlu0CWK0dTNd6gIWhJIbyE7ECSxIsQPv4ZUDRQr4TlOlOAejUsImOA8SEZ7/77g4lExSIhypHqKsA4axgMRzBiWPYz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816191; c=relaxed/simple;
	bh=Y5gJjrjPgghuE/HK+ibdSNMVPZt6wqhIiJyeSFBfbx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdIEr69PyxBm3hq9aCehOtosiWbCcguCpXTPjdtPe8/sdkyVrDgX5P86DKY+5axWiONrg9H4a140nNxUAJPtJLJnTs2v1+Q7Sq3s2s+oIDN9QfN79SO4zHZaWRuiTSOWrDsDixY+ncpxMMcZV24Gt7Td377vEfab8Jb8PlwCY5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKf5YVfk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AKfET025153
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8P2Gir3O8jPJB6+GGpkTLBfJkGgJFjfvAetbhb186M=; b=ZKf5YVfkfYkeFnga
	BgoXxP+n0VH/aFnIhKWmQnNxY7elH/2xUjNU4YLC8rxpyQxEnZxBvxXbFLi0rWOu
	f3Jkk4jUtFYN+ZIR5dKtAliVyU8CEILJJukAq/hURosDjzlO1adjYKlrZO+MyR83
	oRvR+XRvYshx1AbrnVeBw4o3ux7xxNzr8t3pm+PuzdEtNyHUW4CbffZvDy0XEX0M
	a96OkNufbp/gGHaap9eJNVEWdoQbTSsboWgUqdIe0GMa29delGaXcDSnoxbO2ECV
	x2CbWtokibQKqaXuc6f4xve3+ieUOCtwAhxQXKJJVOs0Ym0H/3C69BhvQ+hJbAdd
	9n/THg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuyt0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:29:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b33d08f681so4125631cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816188; x=1757420988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8P2Gir3O8jPJB6+GGpkTLBfJkGgJFjfvAetbhb186M=;
        b=g0KMLsdLSv/EHsNUT3U6iwRlk9ORYVB2cvehBBWqi3jMP1wMThWcumKco5pe1P6Fxx
         9O4eQyV2Q2f5B+H+paNKppobGkUn3zfMdsN9Yqhy9sD7Kuto3VJmaOOH5G4TiZIAhXbh
         nlLATcpVnc+q9Og9Nsf56VAbTI6JuCAb8+c26PGSGSHCPqd5VZwe7cTI0NfSNc9o5qDE
         MLc00xjGkj0T763z4gP9/f2lJjyRQ7jL9XO3zPDTbQgZSSz93w0kq4TnVuMAoaJy3dQ+
         zYV2QEUzdLXiiS2lrpkxfF+EmGokXoVS/xXneMDnAdCjeIqVrHVmI+hYS/2iw2vHcaE8
         PCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Zaaz7utuHFxKNew0q1VxLjqUxyHHdsk10vjQmC9/m5F6Nq3qeZ9isDfaJU3suPtelldZwS1ZnCkwQDKA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vyz1XKqWKUMoXIHKGFF/BMc8yxJduChUQROQS+Xs3pnY3mNh
	TpKMLYqaUf3M7e1Sh3FALp/Zz6fupbWZ0wL0Q6VVktEd0vJpS8WV5bbxHuxe0VBnRaT6B6wSG52
	OmwG/qCi+e5MetTtRRxVIIsKOPPlM6cDsOZuta0ab9Pqw5OjKyYS1CfKjhuGVUakUoAEj
X-Gm-Gg: ASbGnctQzF2tpA7HjHdnsmgy0XYlXzg3EME/sEIygFkjlgpON9URdX3NOIo77eQz/JX
	bEHE8haXpkxEvV1llTiWvd74vzztsmPEAATvL6ub1OND83AtAuBtnan3J5+bcYqyYIniLoeakeQ
	/LBmuP/OM05OgMa4f2dL471b4QqzEuHlml85C+4DSilwhRLmvPPSSvoWoiaKZMiYHgRxR6FATy8
	HdGqUyIl4KnDAd8t4zBSf/xwXc7tCPvZiCe1bNUc/mB94T3/u3hzm2w8y1z3FGLvgxlQJQ8I+dZ
	QWTqlKrTypO1VylVrNBFJ32E5xsMHjeTuS2H4Rzxt7v0nyzYxIVBk7RUuMZ+dffCWo2LXEeNfnT
	I+163x0+slZQiAxuxRLHkng==
X-Received: by 2002:a05:622a:144b:b0:4b0:8cfa:a507 with SMTP id d75a77b69052e-4b313f44a5cmr108395611cf.10.1756816187727;
        Tue, 02 Sep 2025 05:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsvBp4S9s9oRswfDvkLrbWzaHDxtJFSJQVPWxI8jySZ8itlnPJLwhXxGi8T2KTMsnZUjXbSA==
X-Received: by 2002:a05:622a:144b:b0:4b0:8cfa:a507 with SMTP id d75a77b69052e-4b313f44a5cmr108395361cf.10.1756816187173;
        Tue, 02 Sep 2025 05:29:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7edcsm9627002a12.6.2025.09.02.05.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:29:46 -0700 (PDT)
Message-ID: <9df42327-b417-454d-9f4a-608979498f79@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:29:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/a6xx: Fix GMU firmware parser
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-2-f3ec9baed513@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-2-f3ec9baed513@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX8q6tHbCos+vy
 4zdvQhSb+k5huukti+IDzkCr+zvo6ddC7ZJhWK2zbWdeSTFE1I8Bwof8wuqocUbpLnvxM3/M7w4
 Bj6EKI/cG+aSvbL/oZ7xe5j55Vr2d778tr5qTHGF2fUEYXjG/4At4ZWvHZ/dE24AEhCGSbs6Zgp
 WySQ57HtEnyP8EHm5PCYUadFVBODVvYIfjXd+VgM8bbOaIZ7kli/We8aV1u010RXMpX3bIdqPUb
 1O+kam7bjBtMDlbX/uiFLTqOctXqrKAzOh94mUu31kRnTjT6cYXzcBcMNZGLdRpd1H8Uj1Vp0bd
 TxnFVTu4jNZQbsO0hs5z+Jgb8qA4rV3gVc1lgibSE7D7plQDcsy4xVzUvQc03N4o+BnN5hQj124
 TyXez+DQ
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6e33c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B4Uh0k_u2pjkwks94HoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: YF4xX9ZDJMITm19fAlqzoLDOu8kXG0Qe
X-Proofpoint-GUID: YF4xX9ZDJMITm19fAlqzoLDOu8kXG0Qe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> Current parser logic for GMU firmware assumes a dword aligned payload
> size for every block. This is not true for all GMU firmwares. So, fix
> this by using correct 'size' value in the calculation for the offset
> for the next block's header.

Hm, I haven't seen this in the wild - do you have any specific examples?

> 
> Fixes: c6ed04f856a4 ("drm/msm/a6xx: A640/A650 GMU firmware path")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 28e6705c6da682c7b41c748e375dda59a6551898..ea52374c9fcd481d816ed9608e9f6eb1c2e3005a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -758,6 +758,8 @@ static bool fw_block_mem(struct a6xx_gmu_bo *bo, const struct block_header *blk)
>  	return true;
>  }
>  
> +#define NEXT_BLK(blk) ((const struct block_header *)((const char *)blk + sizeof(*blk) + blk->size))

CHECK: Macro argument 'blk' may be better as '(blk)' to avoid precedence issues
#146: FILE: drivers/gpu/drm/msm/adreno/a6xx_gmu.c:761:
+#define NEXT_BLK(blk) ((const struct block_header *)((const char *)blk + sizeof(*blk) + blk->size))

Konrad

