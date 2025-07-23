Return-Path: <linux-arm-msm+bounces-66170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE1B0E840
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 03:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEEB51635A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 01:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A162017A2FA;
	Wed, 23 Jul 2025 01:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8reSJPu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AFF1A256B
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 01:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753235104; cv=none; b=e2uQVc7gVOfh2HcKZvSAQJhCTi3LPlgkiyXSiscIst5A8VSRGMjikMsgtUzciOOTmHjDCLzWFGq/z88tNRMNWPkJL8GYy3GLTzjCEjpNswUWjRba/a0bARFBX5PWKhaZ8wQ0OyUf2yRn9HW+hilpl3LhCOqP+BP8/61G6MxngEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753235104; c=relaxed/simple;
	bh=3ztNa+nnZDU9kypJZTOpJDy40wJdJViL+3PibACBSRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0nhEtTlnXsumJFsG5JX1yjimI1hsuqaT1HjO61doEa+HAFWbfBv6DkCqxhNjzE7D0GgVv+xmd4JUmD949PCV5O2aG1MpwUO8eyQ+IFmXPJnCIcUzet8u3yyOACOuD6t7ZYyPwy5mEw43/NHEXh3bkBnzDSuaM/nJ6S6nTuswHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8reSJPu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMNraU001761
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 01:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p3rO97HBhCdBQ6/aphwKARQR
	J+eX+b09ZhEfv7a22fg=; b=U8reSJPu9fdS+diAroUyYqmwZflsJqvWnZ58aHdp
	3hSZBqJmhEOcIohUhoBBhPdf0RNHmDegeRsoF9zTO88ay+zNWPsg+q0smheQOX0Y
	n/JIBrZGoDC2dvSUrFbrOICSJorggV+fQa41JlW/QenR2X8YWCCGIFopbQnZke4A
	t8DpgsAT4KM6c02U91RPPvOkoeYpGBER8ZjfbwjqEtU79R6OjEGrXuJxO4/nxiHJ
	4Nqp4fd9H6FoHhJjV1zJDs3p/42+zBj+JiCCq+l/q30NN6GVmICqUbJfsVM4L8cz
	CfPkrQpNOQCAJFijClkjq9ju8KDyV9ezivYHNBMp09c39A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w4j6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 01:45:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74b185fba41so5231337b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 18:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753235101; x=1753839901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3rO97HBhCdBQ6/aphwKARQRJ+eX+b09ZhEfv7a22fg=;
        b=Ht+FTSQbr6MpHDXNa3T/QNVXyd/X811mH+07keOk4LTfl8cub/WQGjLP2RqBBwv5NG
         nUawP0/K5dzVS2KC1n2KS4bglMrqF7csmzLk/1QRqzy09CjC7FRoqHqqee+dffkN5LUQ
         MttKkccPdyV/nruz6NaYhgV4kQmfkfwxxZipUMaobgySTXnqc8hHCvB3gjBPRT2HaQTS
         3QKTKe3sUrHkRqiKg3OtTIgO0PyD7rZpb0epsJ366wuZhYig7psBSpmqEzlC3jEWmIBJ
         GPp1gyckX/E7Mv1sRxNuTPvafG+3aADcTPJ3jC9qHkPLEaNMItAGTTVZe0YJjem3s7FU
         0lYA==
X-Forwarded-Encrypted: i=1; AJvYcCXc2I09J05As65BHml403Q/FMftplOnjuyjtfetmuo3SUJ1y53bHXlqHKH6bRM+rcIAGp9Zigiu2wJ4DQzS@vger.kernel.org
X-Gm-Message-State: AOJu0YyBAIHKOyvjmfj82N7ADvS1iR9jfXbpuNarvuwVzv3/5fHD5Geg
	iRUZ45heiZwPjBptIN+N0NgJ0o5bSlasteSPBuoc1DUThvzhtFkMh3r3y0O8vEkNEFGY979KCOk
	O6JFHA+JBFJJI3oE1mZ8hPdmcmDLF8zgeUPQg3oByTP2bgEFBIsV7cL+KjzasyRxh3FNG
X-Gm-Gg: ASbGnctwKLaq6TFb3d4mI2oBqIaHxKusm3m2gCnxLARAhQzDOMZSJYsI4J/ooOxopwP
	dN5nHIuWuXZf65c/q9HnsTpOsfru1YJvbqZq8MlNJuvNMBQ52ppmoEPBrBuNlYaZ3KgXY/SSfM4
	TpepYwl1I0qB1r3tQ6Hqmm0fSPcqgvGfQlBijd57r/wcvTHsSGQec/6DKZVu8HBGovEDlloiC/y
	13cmo8JlD9PUjx28zTQ0pvMT2NSgNtSXzMJ7c4KHpQdwew2/u4LeqkYSJNxzUwUrGyRyx9YsJYl
	rqke0uOuXeAlZnWaRnQPG8KSEoIy+RR5MG1K5SdZ3E1WLhRXCf4tmiMGM3JAr10f21QoDmLKB0h
	jFN7ZkxMXe4zLY7QBOtE=
X-Received: by 2002:a05:6a00:2d26:b0:73e:2d7a:8fc0 with SMTP id d2e1a72fcca58-76034c0539amr1838060b3a.1.1753235100945;
        Tue, 22 Jul 2025 18:45:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYQ1opZLOzPDGCAqEFY0P6TdbH57aOMcPK7+KLJXkJPeeEaYYghA2ozga4amB/i8nGEl0oEQ==
X-Received: by 2002:a05:6a00:2d26:b0:73e:2d7a:8fc0 with SMTP id d2e1a72fcca58-76034c0539amr1838035b3a.1.1753235100444;
        Tue, 22 Jul 2025 18:45:00 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d3190sm8382145b3a.39.2025.07.22.18.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 18:45:00 -0700 (PDT)
Date: Wed, 23 Jul 2025 09:44:54 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: Re: [PATCH] pinctrl: qcom: Fix logic error when TLMM reg-names
 property is missing
Message-ID: <aIA+lmqOMRtXTvsl@yuanjiey.ap.qualcomm.com>
References: <20250722054446.3432-1-yuanjie.yang@oss.qualcomm.com>
 <ximweq3tsedvocc2k2agl7gmckcvttsyiwcer4wjfenni7t62b@7bkvchfxm6a2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ximweq3tsedvocc2k2agl7gmckcvttsyiwcer4wjfenni7t62b@7bkvchfxm6a2>
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=68803e9e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=FHDt430NQJi3ZYAAoaoA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAxMyBTYWx0ZWRfXwDL2A36erDOR
 GpBbvtkYqXbkT8kxTG7VkNRDzPk4S7fbcWoyH9ApNTVJZskmJoXM1uj8ssUJQKgGJlrryck4rQu
 1YMUTDQw1z6I4BA99d1uNv3a/vlDkkmm2yud6A+Qmun6vHfIw2NFjgplt7YB2zc8dkeShAnvi39
 sIZ1nR3trqvMbtJmByYxfj1ZIHAlI0wlHT3UVIrMx0AKKtxpx1Ab8PZUKzUpnht+cwpXpTi2PsE
 6gFEbElwMfDV46cj0lqrOGN6poGHGuwgVGtk7KMk3CChkrJcH1hiKruA9Hg8dHpCuHTc6h6Q6/X
 ChL1bk0nq7rof0j7CJKnKnn6Itz2VY7RFS7DxJ2oc0omR4quf8ZqEB8T0FyEo+zIJF7+LkD2KIw
 vOq+d1B2ObckmVuoaKETH59Vx5Xhfc+xi8U23gFhP9495/fEV0N+P4b9iJGh986ooAR5VDcS
X-Proofpoint-ORIG-GUID: Xjaz6JwZwp7EZyS4-4qQiioT9yGhU_b9
X-Proofpoint-GUID: Xjaz6JwZwp7EZyS4-4qQiioT9yGhU_b9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230013

On Tue, Jul 22, 2025 at 09:38:51AM +0300, Dmitry Baryshkov wrote:
> On Tue, Jul 22, 2025 at 01:44:46PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Some Qualcomm platforms, such as sm8750.dtsi, define a single TLMM
> > region without the reg-names property. This is a valid and expected
> > configuration. However, the current code incorrectly treats the absence
> > of reg-names as an error, resulting in unintended behavior.
> > 
> > Refactoring the logic to handle both cases correctly:
> 
> s/Refactoring/Refactor/g

will update.
 
> > If only the gpio parameter is provided, default to TLMM region 0.
> > If both gpio and name are provided, compare the reg-names entries in the
> > TLMM node with the given name to select the appropriate region.
> > 
> > This ensures proper handling of platforms with either single or multiple
> > TLMM regions.
> 
> Drop this sentence.
will update.

> > 
> > Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")
> > 
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> No empty lines between the tags.
will update.

> > ---
> >  drivers/pinctrl/qcom/tlmm-test.c | 32 ++++++++++++++++----------------
> >  1 file changed, 16 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
> > index 7d7fff538755..6de8cf23f9f0 100644
> > --- a/drivers/pinctrl/qcom/tlmm-test.c
> > +++ b/drivers/pinctrl/qcom/tlmm-test.c
> > @@ -581,25 +581,25 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
> >  	int ret;
> >  	int i;
> >  
> > -	count = of_property_count_strings(tlmm, "reg-names");
> > -	if (count <= 0) {
> > -		pr_err("failed to find tlmm reg name\n");
> > -		return count;
> > -	}
> > -
> > -	reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
> > -	if (!reg_names)
> > -		return -ENOMEM;
> > -
> > -	ret = of_property_read_string_array(tlmm, "reg-names", reg_names, count);
> > -	if (ret != count) {
> > -		kfree(reg_names);
> > -		return -EINVAL;
> > -	}
> > -
> >  	if (!strcmp(tlmm_reg_name, "default_region")) {
> >  		ret = of_address_to_resource(tlmm, 0, res);
> 
> return here and remove braces around the else clause. It's strange that
> you didn't get the warning about calling kfree on the uninitialized
> variable.
Thanks, will remove braces and fix kfree issue.

> >  	} else {
> > +		count = of_property_count_strings(tlmm, "reg-names");
> > +		if (count <= 0) {
> > +			pr_err("failed to find tlmm reg name\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
> > +		if (!reg_names)
> > +			return -ENOMEM;
> > +
> > +		ret = of_property_read_string_array(tlmm, "reg-names", reg_names, count);
> > +		if (ret != count) {
> > +			kfree(reg_names);
> > +			return -EINVAL;
> > +		}
> > +
> >  		for (i = 0; i < count; i++) {
> >  			if (!strcmp(reg_names[i], tlmm_reg_name)) {
> >  				ret = of_address_to_resource(tlmm, i, res);
> > 
> > base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie


