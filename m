Return-Path: <linux-arm-msm+bounces-72298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E78F7B45996
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 986C7A637CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEDD28C866;
	Fri,  5 Sep 2025 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXEp56+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B6928C869
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080244; cv=none; b=rbQI0Zuc5+M7lIjBhCrvhstft4RACN8onlVN0w/lwZvouMOOdasIKwl1uh81MDu86NiaSKeAFd/MIMXAOAM7teE0npZ/lu4zDd6YioJiO137MA/h0YDxTxz1Ap8nfrZdBLzNOzQ6XCCiHL361AiXpxGhclHC3tmgdNnLCoAqcXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080244; c=relaxed/simple;
	bh=4XGnut1KQ5kuNGnU7q5t4kWQ8e03NglGs0Fl6o2RhkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X43VvjPeNYnaSTk0Q7xPfubJKSrccV/zt1XcUA3lyOE99Hozq0R6Xnjom++rdzjEvetnknKbvhUTuHKDFqD8+8gVtWXbTxmtA3LeLipJIrCAkjLUnAvIMxonfRRVWrWI6unx2mD0sdVikOQUcSO3RK9xfUOJgFgrejUbAnjR9Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXEp56+k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856XfPM004215
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 13:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gEQXFpfF2RLL/Hgz4KyNGpY0
	IZf9BMj2+2h8HwgD2BY=; b=MXEp56+kNC0f0+Vd/QsFAwauK0Ede9zrelhvaL19
	ysQXCRYbW6pWYu7qYVcWq+qAKbZUJO7lr/FHbCEv2+ktYku8QYWufBVv4uFg/qhq
	YonFxqrkHGSaTU+TRrkJ+Vh2FYEGJ2ONex/EOWstxez3VLrzVS8PkTj6dhjWGBYu
	K1e4mrWPZRZSJ8tq4HE9L8G8gY4/WabljOc3sau0AgjnLe/fpwfG9cO8Rstd6SC2
	RspuvTdRgkyEDLLhGaNWdJLQrLNkCETyXyLrR3C5HG63mBDVIymnTm83kJc8g01u
	Tjeo9USBVsIGpR+gjoVwE4Z0bph0IWCN5abnnQgH/TCxjw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8sbdmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 13:50:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5e5f80723so29328011cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757080241; x=1757685041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEQXFpfF2RLL/Hgz4KyNGpY0IZf9BMj2+2h8HwgD2BY=;
        b=L73X7OT5Pw8NnQvPyHiUqRRsNGti97a0AT+s0qqwEOhypdECVJ0o3Ye4Njp9zTla1D
         eNrK296XfoQFYrV8KH81hxPtqIqLf79ndwipCu40lV7gHROEy29p83TntbxAF13QVbtK
         KS/73jVpvgkGIyKO0YGzU2wnnlA0o6WeMIcXcn0r2KUKJnbFMEGgp2jQ342eralkZ+yw
         y4eSqquhaaYSLIvzo3j6NdY7fvfi0XxEJY2OGg3DeQGjaIdo6SPE/es/0Mt01wCI8rYf
         yyUzRUensjg4Xjfp18H7s94dkMeWGUjMDyDgGt7M8ez9V6YVm/HabNzJPWHP8xLxivm0
         L+VA==
X-Forwarded-Encrypted: i=1; AJvYcCVWMdyUd1bRQnwo/cr13FSigu8+3fhxU/BM0AG6YNXBRzGfTRtV0JsoKUp8KHVCYsqCyWs5635yjRrE/Rcb@vger.kernel.org
X-Gm-Message-State: AOJu0YySn5xnYIhLg3XIybVHB4bPdoHhtHCUdZ4T4VHGCAinJbEXiq/m
	C6nypEqeRM7K4KvuTx7Hxq+PW8z973+KiS9AezYyNdN2hmVCFxNVgmNmBskdxeNKOXRohkX8Rhv
	yjL8VvI2NztT4O6EnLDCa9EUaRiNbl8q/Tife/9VCFW52Ol3rhUB/vn12VPZ2sYQ+ItP4
X-Gm-Gg: ASbGncu0rllmCxMDbz5esXM5ESejV16nhHgwsVA6SOvv3GDbEZJETLFDpdGc2JviYjO
	qF6LD52UCErXU0g7va/ntxfnMzsX6Vtb+4U9WbNgdFNjNo1Zl2LJgxZRIAD/Cd1BGE/4gSAooKk
	CGtgHCbsEMjdUv+E9H+wdC4L1YbEfXVMBUG0fBrdM/6RcVqDa1FwV+C5Z+vOiKieqq9C2BHOWn2
	CzMludgTETsg10bXuRlWxnQbTmxN/5wbzkBEATGkMGjvEhfiGnNowzmkH32DNXXP8VaVH1G4B+q
	9DqhUcH2NU5d5LUnvCFp59Z2pYiYQzY+CLDqRQrzVNxqkFta1eqORt8FoE/2FsaICZITHAkofEF
	MEzOfkzOR3xlhZogm+fFoYvi6hlZXdtoyYIPG1oZGlJPxVd987+D6
X-Received: by 2002:ac8:7f88:0:b0:4b5:eea8:3658 with SMTP id d75a77b69052e-4b5eea83886mr16446611cf.63.1757080240721;
        Fri, 05 Sep 2025 06:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9MeUrOkje/yhcJw0U3KyLgE4LLXgaLmVOt6iaIs6F82Zo+mL6i2IiNuAwDQlzVrfywNScMA==
X-Received: by 2002:ac8:7f88:0:b0:4b5:eea8:3658 with SMTP id d75a77b69052e-4b5eea83886mr16446201cf.63.1757080239973;
        Fri, 05 Sep 2025 06:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm1789340e87.85.2025.09.05.06.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:50:39 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:50:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/8] ASoC: codecs: wcd: add common helper for wcd
 codecs
Message-ID: <6igcrtfra6h75v5g3wucokxw3ncj3k66ui3jnhfpdf2lmxc3tm@3hzihrpgjaz3>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-3-srinivas.kandagatla@oss.qualcomm.com>
 <kmm4e5bg7uehmlsgrfhzo4agr6ga6d5gxtpxq5sg4t3wql5p6m@llwyz4kzsj7y>
 <f6a631bb-d17d-4eba-adfc-4db08540f5a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6a631bb-d17d-4eba-adfc-4db08540f5a0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX0Ze2eI7wIo0g
 nc0775nzrUrwPxjqTt+RwBXdo5u3UKr5o7BzeThLvFYV9tza3/PJFtV9kL5BIOYRwyc5NzN5Ctr
 vbo4dAf6S2/AXb/JBZ9ph3sc3sydfHaRFzN7IcjfYIdU57LJKV+v4nnIjDHQfUkXDIsF55Os8HP
 ggW7EdvGIbnuDvvPGglTAjZ/6wWTYrhtktP7oR8z/kHbFXtWVygWfSKt9L8W9cYue2k3Zm3bPrn
 MzpepA+VbMq8oqyCvjQBLgz/nMEUWLrLssSUmjX9EmtL7ewIRYUGwfz6RkMu6NIUa2B+57OQpXf
 t9Jzv4y7NckeBgRWn7JTd/bro+SRDsmu2qN5B4EAoqx16CPz71tGAR38D6tF4s+dLMxGOSJllT+
 5W4B8OIF
X-Proofpoint-GUID: M37oYATlcn3fpgzWoeDSijYD5bhnGaBi
X-Proofpoint-ORIG-GUID: M37oYATlcn3fpgzWoeDSijYD5bhnGaBi
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68baeab2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=vlklIGvXIyMSkDzfuDYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Fri, Sep 05, 2025 at 08:03:49AM +0100, Srinivas Kandagatla wrote:
> Sorry for some reason I did not notice this email!.
> 
> On 8/22/25 12:18 PM, Dmitry Baryshkov wrote:
> >> + */
> >> +
> >> +#ifndef __WCD_COMMON_H__
> >> +#define __WCD_COMMON_H___
> >> +
> >> +#define WCD_MIN_MICBIAS_MV	1000
> >> +#define WCD_DEF_MICBIAS_MV	1800
> >> +#define WCD_MAX_MICBIAS_MV	2850
> > These do not belong to a public header.
> 
> 
> All the wcd codecs have same MICBIAS circuitry, this is the internal
> micbias circuit we are talking about here.
> 
> Actual micbias value comes from device tree, but these are min/max
> ranges that are supported by all WCD codecs.
> 
> Why do you think it should not be part of common header?

Because they are not used by any of the users of the header.

> 
> --srini
> > 
> >> +#define WCD_MAX_MICBIAS		4
> >> +
> >> +struct wcd_common {
> >> +	struct device *dev;
> >> +	int max_bias;
> >> +	u32 micb_mv[WCD_MAX_MICBIAS];
> >> +	u32 micb_vout[WCD_MAX_MICBIAS];
> >> +};
> >> +
> >> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
> >> +int wcd_dt_parse_micbias_info(struct wcd_common *common);
> >> +
> >> +#endif /* __WCD_COMMON_H___  */
> 

-- 
With best wishes
Dmitry

