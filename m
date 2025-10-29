Return-Path: <linux-arm-msm+bounces-79403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACDC19706
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF87A19C20CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F18F2C1586;
	Wed, 29 Oct 2025 09:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQuycoPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/bIjhWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A2C322740
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730960; cv=none; b=LidEqQQxpSJnNlW8rUIJ2T/TmYDnY+b4wOgO7TD5sqmVCGBaanlo7ckb7uOqkuAVXVmN73ksyZxneL5HNjKm64S9TKfvHhAdnsTpBT9YYtQbse8C99jcw05WaHHjwf3qUDp8bF0Lw7E3bQFi6tbomKd13RV3XTgmB9vSo3lUaOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730960; c=relaxed/simple;
	bh=vmf/MrbknHuVsF27rfCFzAlFUkFErIcL1v2QhdthjFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sk6nVdJ0X5hVLHms60UScfsZ+sKMG/d1wbckxZnamKkLXfsfZ2aWZiZVAei1JtjuPigIb4TPU7wqn2FOq0KJt8eUJIcTHrl+FJIJwQ5c/VjlBPE3bCSZm+LNQMw84eN/7Y4UuDSCs6zFlexgvT408uTmMY9W+dcIHvqioknNkRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQuycoPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/bIjhWJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T933kd4155201
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmgRKySPBYPzkhHOeDW0BeEkxDUdUPpQf5CBxkBMstI=; b=QQuycoPs+C/VeFQM
	etXGcA454gTXTyTo+Z0pkOabIRfNOIDe5qcGphTys7OTdaXoZ6lCv6fhWR8TdhIp
	QKhZAvzohOpCHrveLE883tDiUVxPXIftlLBEIGuz18V9BjEzPu/SwVnZqfyr8HRL
	N2jAhAN8wCSosm1UvKGweyNQY8NIYfQ8sfFlrUAytVkQro0hWt3NfHiHvoCGGC0F
	CRylK4rV+9q5mXlHJScqWfiOThdJaDUiSZMUB6KdBWiuwcadmmQtadRwBBZX4Jmm
	R9mWcHxphDVBhc1fI3VSIMaaQUFmsDYKPbUyVMfLT9V3bs03igtoxmx3Q1ST37O9
	xkkFPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3fy0r49y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:42:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8a223d563a3so123768485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761730957; x=1762335757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmgRKySPBYPzkhHOeDW0BeEkxDUdUPpQf5CBxkBMstI=;
        b=U/bIjhWJ6zik+tJfGrW8yfCZOlCcFiWwmNSIDp8pUiAHcEY8ZhIXZeJJel/nVcxLf8
         +dbEB0NF/4uo5O7pHhkFBNVt79vRNmim4YEf1czXELpaYLbc2U0yNvy3quo8gE3zcMNr
         jckyNg/CO/JCl/nxEqxiiSSoBCm9jRIiwinZYDgKfRiTN2SipuJ048qs4WGgoytfHVdd
         GwRtS3Hl4g+LGWvGNJbYjvoVC7QvL91P5F+Iie6MlagdlYjq+wDzUQeUdL5oYEDMh/TV
         N3+0amxZ8kscUxtnDcNK71o/b29Lsx/s5HP6K2gWrSfcTaYKpVSwPsWGR0S0pNmr5cMK
         qKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730957; x=1762335757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmgRKySPBYPzkhHOeDW0BeEkxDUdUPpQf5CBxkBMstI=;
        b=j+ieIYFVaaBIx0PGuXCNyA+W8WKZwn675F+puFQ7+NeZBRw/NHhTPfnDRqOJg6MosU
         Zo/8MPCpIMqnIhbvsiaVfsh8hSfJKx0kRpKE7rntZ0v6hkJd5XccDYjF+5qkwAdH5Pnu
         qUh5p6ZEEWj4ajnrxr4kZiiJwtezC/1dSE9vswmxlpB4vp4Ul4qM/1oXIn5w0ZkOd/jj
         smi2uVw9cFUl7fEe/4sK/W52oUMXXEgAqD1rgX92+9M/w4XFeOcNm4Gqs/4uj4rlvi8V
         4L/L1NDz6UEhrbpjlYLdCxp7UDvi6tMhMgcEOECR45/moJtIm3c87vvjCoajvdapVHFb
         rkSA==
X-Forwarded-Encrypted: i=1; AJvYcCVvL0VzF/0ptPsafs68dMRM1BSFx4P9BQACpMHcaZPy2AD+JLZwb8KkiYfo9yN3EAxByJcsJJfkmtwJZsuv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrlt4RF/8clllH6p1C7bW0Chk/uiZrU0oBHjx87+aQgU79kllT
	gn2L6So0AfQVJATg30WJouEZaP3DkXWxr7a+67jwwc1r+ypv5/a5GpAzUR6mny27Bj9vaqBzIit
	DvxBqqbUA4H6APfitHsVpIP1lz2J96/j+338KdV/nS3ObZ4EwFBjZKq79qICFd7zOAKoB
X-Gm-Gg: ASbGncvTzs3R3GOUnBjjp1/secCc/xzviTDumGWYrhoklZtseLXZ0UD5SjHl1DN3JnO
	Xscx4afRoAfXbRZO9x+Cd0nV/lTu9zY77mJjiq+/CbH+0CfFWyWJLrPLXdw28lYtJYIUfwXkRIU
	y0TeJJm257JLXbDpmPb6Aa/TrQpykoSXT5TLHHaJn5Zxdtvttkeah2naYP4CylygwRjDQcoaifI
	DtiOdK+j1U+Q1oeZFa2jX2QoCQ8LCGXb2iocHqdHNvv1yhUfa426L4SMTFGMS1VBV+bokcNEISo
	6WMMqYW0mwf4hKgBf6ys6nwK0l7hyfPWxRCf8E2qHe59AeF6/wVhQoUBvmoiqZTV1kwHJ2ARCQ/
	uYrSC4LKzZDkdI7r9ULwjYJ5Wu86XPLODvz9ar7ZFncRWJA/Mo4WHdXfo
X-Received: by 2002:a05:620a:bce:b0:878:408d:c09a with SMTP id af79cd13be357-8a8e34d22c9mr206432585a.4.1761730956912;
        Wed, 29 Oct 2025 02:42:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyzw2uooaE3FP8gd0prarw9B+NMvunoxzP7rKqKh5OTI7VSeSeyuZJuSI/cuTYOFoNrAsYcA==
X-Received: by 2002:a05:620a:bce:b0:878:408d:c09a with SMTP id af79cd13be357-8a8e34d22c9mr206430585a.4.1761730956406;
        Wed, 29 Oct 2025 02:42:36 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8541e99fsm1389534266b.61.2025.10.29.02.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:42:35 -0700 (PDT)
Message-ID: <78679e08-2a38-477b-a080-be0442465fbe@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:42:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
To: Khaled Almahallawy <khaled.almahallawy@intel.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        Jani Nikula <jani.nikula@intel.com>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VJLQXtPX c=1 sm=1 tr=0 ts=6901e18d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=DweoPDKG-9ER2baVzYcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tpiOJSRmymf6vSLYzksaCpbkgdJKTnri
X-Proofpoint-ORIG-GUID: tpiOJSRmymf6vSLYzksaCpbkgdJKTnri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MiBTYWx0ZWRfX14cuJgxLNgHo
 FHHhPWTY7hVCLvvsha+Efn1x1K1E6LKzpuSuOHTUicW028yAbzZQC8940dKwiZpSTvgCh8tKVxO
 Cq15jDVpv9kW+chCoGUk7OCfv1J6RFXT92p74eVTBk2Ogc47hsB+8cpTmrtTHDWeQtKOdWMsTfB
 xK1PXMPoMmXeYxsCXsqmzqxRf+dIpS3NNbjwCs28wf9JvIjWU6V/j6Pxl5yPXg8tUkQLlNpbUeJ
 6zLO8Mtgt5qvYeZIc9KlDG5nbu2tZBAh8hM+vMWK+qHyXVlPXjeVuOz5oyOQId3kC1lHeWlUEG1
 5F1EhzWZjqJ3kwiEmf1WZI1e2jeEa+gxxhtemF9njWaGEcKSLQqOU5O3fR/XqS7CoGfqG73j+Uu
 Tn9xPJf1HJsjeW6VDtRfawlT2lKEjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290072

On 10/28/25 11:28 PM, Khaled Almahallawy wrote:
> The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3 spec.
> Update its name to align with the DP 2.1 definition and reflect its
> actual use in the code. No functional changes.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
>  include/drm/display/drm_dp.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 66e1bbd80db3..5d465cf4dbc2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -665,7 +665,7 @@ static int msm_dp_link_parse_request(struct msm_dp_link_private *link)
>  		return rlen;
>  	}
>  
> -	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
> +	if (!data || (data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {
>  		drm_dbg_dp(link->drm_dev, "link 0x%x not supported\n", data);
>  		goto end;
>  	}
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index e4eebabab975..610b8cbf1125 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -849,7 +849,7 @@
>  # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
>  # define DP_TEST_LINK_EDID_READ		    (1 << 2)
>  # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >= 1.1 */
> -# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >= 1.2 */
> +# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4)

I think it'd be useful to keep a comment of what it was before the
deprecation and rename

Konrad

