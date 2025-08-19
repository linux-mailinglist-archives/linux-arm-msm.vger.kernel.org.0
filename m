Return-Path: <linux-arm-msm+bounces-69622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88FB2B5B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4462519606D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 01:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17D21A2C25;
	Tue, 19 Aug 2025 01:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xbqwl8/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F6EEDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755565747; cv=none; b=Y4wflgGYNOHCGVYooQQ/WAuilpAYKpXhXhoocJwhT9DP+TnzIA5LDxj/SUhKCj+QtwNlzrhKmPfk+6tqE1ixPmfptlKJQX5WUoYPfAYE0whzya2LoIeMCv+9Oiwsy6KHX4mkimuFMuA01oKT8q9lXj7gYbQu3OKX71OSZzAvR5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755565747; c=relaxed/simple;
	bh=HQvdz+F6b8ps3r7vtMLmJnFLYEDv6X9uQjzmeReMVPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnEHGyKBV9o4C/GdCPrPAS2x9JGmKsbwGcM8TOTn3AuCsK+9lZn/vnf+SMv2KAjXOjy4prn3ipOrnZ6x9tbRVK96sL/nQm+zRP8Z2ZKK38J5Wam2Ad9rtao4gckr5f2uSo+EzI12I9gYeULaOrj6rmAbobaUz54o1iR19zizJZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xbqwl8/R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J0bOvd019369
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=87bz/AgIYMKBHYgawH0dr8QB
	TFnm3fjEc4qUv35xKB8=; b=Xbqwl8/RXQ7eBUMbc25/MoF2A8F8B1PuSgzi+2HB
	Z1uF4BpGhSqqf3WjSx5mjAu7v5B5U13d+jV8TxAjbfSNY+xNxuPy/MdO8m2AAhNc
	qJBVpLzmiio1M60Q+++DVbUkUlqpZtBXhaTOK3ihC5amke7rBjlMr9JkSkQB0n2G
	f1GtCE+CyezyFHfvIw9iDzSy1iwqwZIy/Vzgcsnv0cXK/6MEWqjECi2JIwFhXqhE
	t5hoqLQ+w+6CftzVKwYnkLszl1/V5oOxhRRCzbAe0Ixjin+TgK/uR/W2hT5P5rRA
	8AAx0opnJx/P0pheMvddhM2ygsaTfHuFaG/iwIzXM538sQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj746pr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:09:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9f636685so161932996d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755565744; x=1756170544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87bz/AgIYMKBHYgawH0dr8QBTFnm3fjEc4qUv35xKB8=;
        b=k4jtdqEOwrXC3dN/N4+0Gb1mXx1yOQexW68tgaaSL4FrjeanSQ/7D4Xta57/41tQCm
         be9bEWNhpoN5HzL+L44qgP6YEdmYtHxH1suJqB01/s+ZPBeczMXu3T4OubaO39S+pMEK
         Ena+colyVMrojg/KS7fRCLGKR8yGlIh4SZ+tJLxAv5NZ6w6mTtV0OlstZ0bQ7HM4FJ2y
         N8hLrSdYH6Qi9jl5GQ6AnKQOIxtWDza2ehUNe5JZlLV9CVj1cGh6Y2Y6fjgGmq6SSJ44
         36VuSk0rXj1E9W1eQAEyEqEJKVcBZLYdkh4THbtfdfYXtsSXDuXX0fQKvTS9TJ4JKW6N
         wI6w==
X-Forwarded-Encrypted: i=1; AJvYcCXuzTo7zT2E8NU0MXpl5Fw83vUuuka5H+3vBPFxT4kml7B/b2YOewEncWRF5PxOKJqj9cCpWpuLXnd3bs4B@vger.kernel.org
X-Gm-Message-State: AOJu0YzHTrNIIql1xeB1Prq9uJxI60lNaIqt3m8SupEU2Vqgu0X+tDc/
	HlOGbKkRd74mfHLKY/n62I0aOmygtpSYmc7bV2OopwQ1EUHB6z6woVnPZjpkjBqhGzCh9GYaMUU
	0qkK8eZQ7hac3/eHMZmMlSmEVgAbbbMYRq+3qKoYDPDxyiXikKHh6wcgCtn9c1o9d7HLo
X-Gm-Gg: ASbGnct7gRMOX23gmwNu7d6k/WZRuqfZVbqMOzET+SsJIDAZdEdNTz/SJRYu9kf2G8D
	xRGGH4ia0egJVMGLMQWRTYyrH8fTkNvF5xkBiBCugAojHhONu5HpzGmmeurkJVaGOhes6b9u406
	EtzvayeAABBBzbmVQACBZpNGEJnVhkCMA6tqPwst3q0WLq6EiOw58PM8MwDGPqO/7pugVI9H5Gq
	gYs5toFyZMcD8IwNie7H9QNuYnu5Ib+ipJHXgCd2KuQbMZdh8VYXdrnPktf0kDVCYdgogKBw5e8
	aQrGjwM0YOXIU14F/A4tp2FKWscLrXtlaPjJoK5IiA+IvfCCcU/IYNf1QQxoLbC2qow/ju3QQz1
	8QOlHHpF88dzKafOXFynn8goFiymg8XP1+OK5jQ4G+L76UDFfjQTS
X-Received: by 2002:a05:6214:401a:b0:70b:7058:4746 with SMTP id 6a1803df08f44-70c35b97b10mr8798326d6.37.1755565744257;
        Mon, 18 Aug 2025 18:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv/N8J/mVexsq1ZJ/e0y+5mZX1Fu7Ts9DPlzNXVDUWt38KoUJYNHr7JL9c4R2j7BbQWMfSsw==
X-Received: by 2002:a05:6214:401a:b0:70b:7058:4746 with SMTP id 6a1803df08f44-70c35b97b10mr8797786d6.37.1755565743266;
        Mon, 18 Aug 2025 18:09:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a604c44sm19206371fa.37.2025.08.18.18.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:09:01 -0700 (PDT)
Date: Tue, 19 Aug 2025 04:08:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] phy: qcom-qmp-ufs: Add regulator load voting for
 UFS QMP Phy
Message-ID: <jpuesvbjupjp3hmdiwwpx6c3yblf5e6nqm3tdp7vnjehkuyort@7u7c5lw622dz>
References: <20250818124110.8136-1-quic_nitirawa@quicinc.com>
 <20250818124110.8136-2-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818124110.8136-2-quic_nitirawa@quicinc.com>
X-Proofpoint-GUID: SB7lDTBjAwkTmb8Qy7WQ4TLEjIEQBIR1
X-Proofpoint-ORIG-GUID: SB7lDTBjAwkTmb8Qy7WQ4TLEjIEQBIR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfXw9KWSXWwsQup
 tzIGlkMvZME02bJa/0XLEq4UsWoWarCpYsbqBGFjRryamgFLO+5DEG1/bQzv3xn2041Q867LaqK
 aK1+PJprRN2Bp/LBkJhGBswJzHA4zrF0Rqv1DkTDSeTQsTJUF25l2ki427fbk0rm8ZJZ2Iotu3o
 YAp+ex1bk60WftxEfYRfLrE6nhlmsW3nj8MJ5qo0BhVIj8nRTFbzAjju3eZidH3bkXHjQg9itoZ
 KWyCWFbRIy+zvt2jTM3MRD001GKek0UUTwaOke/Me8c1ZWSzfheB1yGegBOuntTlGJWVysONodu
 lM46JW3Q2XGS6ChBjtd32LCX51VzmOuy4oaVWE4ptyOyRcxsyI7kNeuecyAj8gAy0Z00MAh+u+k
 Oa9JrGXl
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a3ceb1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Ape6mJY-HOZ_ZTKTdakA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

On Mon, Aug 18, 2025 at 06:11:09PM +0530, Nitin Rawat wrote:
> On some SoCs, regulators are shared between the QMP UFS PHY and other
> IP blocks. Hence convey maximum load requirement for UFS PHY to the

s/maximum//

> regulator framework as supply's capabilities or mode(Low Power Mode
> or High Power Mode) change depending on the maximum potential load
> at any given time, which the regulator driver must be aware of.
> This helps to ensure stable operation and proper power management,
> set the regulator load before enabling the regulators.
> 
> This patch adds:
> 

Documentation/process/submitting-patches.rst, "[This patch] makes xyzzy
do frotz".

> - vreg_load_uA field to qmp_phy_cfg structure for load value arrays.
> - Enhanced qmp_ufs_vreg_init() to set init_load_uA when loads are
>   specified.
> 
> Configurations without specific load requirements will continue
> to work unchanged, as init_load_uA remains zero-initialized when
> vreg_load_uA is not provided.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 9c69c77d10c8..f7a4a8334026 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1110,6 +1110,9 @@ struct qmp_phy_cfg {
>  	const char * const *vreg_list;
>  	int num_vregs;
> 
> +	/* regulator load values in same order as vreg_list */
> +	const int *vreg_load_ua;
> +
>  	/* array of registers with different offsets */
>  	const unsigned int *regs;
> 
> @@ -1901,8 +1904,11 @@ static int qmp_ufs_vreg_init(struct qmp_ufs *qmp)
>  	if (!qmp->vregs)
>  		return -ENOMEM;
> 
> -	for (i = 0; i < num; i++)
> +	for (i = 0; i < num; i++) {
>  		qmp->vregs[i].supply = cfg->vreg_list[i];
> +		if (cfg->vreg_load_ua)
> +			qmp->vregs[i].init_load_uA = cfg->vreg_load_ua[i];

Please rewrite the driver to use devm_regulator_bulk_get_const().

> +	}
> 
>  	return devm_regulator_bulk_get(dev, num, qmp->vregs);
>  }
> --
> 2.48.1
> 

-- 
With best wishes
Dmitry

