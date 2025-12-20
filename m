Return-Path: <linux-arm-msm+bounces-86054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D705CD35CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 19:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEE18300EE4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A568D2367BA;
	Sat, 20 Dec 2025 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWWnc0F2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmgVrfH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7905530F93C
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766257105; cv=none; b=RcxlIa9Q+wCfSNz4FgE3SgiHEd0t2CmHv8jlGdES7/Qus/puvHnNwHtaJWdHtyGek4OPmgpErjGLkHCxCS7Tm5EusEFW7+XCFk39JtEoP0aSOWVr1Q2FzbbemnDhw38HI3fPAgzp3upDLVzOcFZRns7q5UJQ4dfb+vg3fnyHDlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766257105; c=relaxed/simple;
	bh=VimJvaVqV0OpZkRn7JBEzHNUNExfFab1UXxkgrUmSw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBb+LdzbkUVBEp0giaoj47JcpWo0s6DcESUHvkvAjZSq62jrDNq43fX2TuvOdPf6LIS6ybtaUL3XN1myc/25O7VbmD1VvpH25UoLVzelqZTrNFB9Sn8hZQWjhoH+REFNI9DMUH/peCzHBo8O5FNoczhoPjPZmlqBpqQA8efi1Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWWnc0F2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmgVrfH+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKIebhh261327
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yPSPJr528GYZqS/w8DWqqkwY
	ATTphriuR4ox+wQELJo=; b=SWWnc0F2A52KFAf3pF6AijvSmI2ZwacTQHFDvJdm
	UfKBPvsD8kvz4zno+nNdPYji1XhhQ+zlRg+GB4LTUOh0v7uT83CAP6nPJNrt+BGJ
	jjlwsmSvzizyuNJkDy4NVV1LWpZUzaqmed6l+oUk3QowgwXPFrM5wcEa+HA2MEp/
	O/48ZtPSLQW3yvTKecqnSOQ6ufxePIoI+FzKa1GnBbW4oMKPQU8da9uh7kgyxdoy
	xzRO+T1kpLX3LaMCDEN9Styk1uk0psiej6dGlJiKpH4v05HFZjc1rr93JpQT1pE7
	Kzpf4vYW3E4sAhCvENE5rMKCzSXR+FwFPBQTIetvE1tE7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtb1512-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:58:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee416413a8so30374921cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 10:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766257100; x=1766861900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPSPJr528GYZqS/w8DWqqkwYATTphriuR4ox+wQELJo=;
        b=fmgVrfH+zxmddfvvLJM5GB+HzBxvJdLMwShDvzjQrWZeRHsk+YP8UjIOQPgnvf+nf7
         kl5nUJKqv+DGB3eDYb9c4XldWVH5htV5/zzL1gE/HHW98iakIOfn4V7ovbRE77eAK5No
         CyDrZk4mbP6Xszu5eB8lrJ+wGYbIysovNZVvcUiC2elvKxpt0x6bF/OE4ifMsLq6tTTn
         cqky0cEfnowMCmhpWSnEzTbf6bQrRgks0Al808j7y+CGVBVrtfB8Bq5zUTyjVK/SbrIY
         coN9P0PdwH3PJI7SgIa1mhqlt6/zRPChpJI4dZZxYpumKGMUuJ3GFp4Mn5G2DGHgEamn
         jfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766257100; x=1766861900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPSPJr528GYZqS/w8DWqqkwYATTphriuR4ox+wQELJo=;
        b=rCs7G2ZBoqRO/W3chZkXEE6nK8nSTjzOv7NDmsDyhUQ45tDyQGQ+M9qRN6VEVSTlmj
         SnWJN0O9O3CBVKx4IqFiEOcvrUx3UvA75e4kqvXY1vpfcGUjVwT+Wpm/mNRaeFmLnOAU
         P8lcRyBTBZOsrf/+1FxdokAN6DwCSx+DgSHZ3TsWK+WKYWbz2lReWbAAUbFut3j/IX3X
         u5SyvlFZYDO/cDKFEXqaa8As9oKQaVWV/08hfVkdNb3xZX1DpKOmbL7NJ0pIJeTu0rio
         ZkhlAxQBDPAJ2VSvCW14b4KdnV6QnT89yD+kpdp508M3KW710WiMVAf+XhT8Mg4YZ3wV
         pruw==
X-Forwarded-Encrypted: i=1; AJvYcCX7y1wJD849gvbEUlBzIw3/4WyoMlYazyVYA1nIZaQ0kDTPwFnAnhJ7SG97uQQSYZ9fMx4jatqEz6dpHG8x@vger.kernel.org
X-Gm-Message-State: AOJu0YwHr/GimlX3h0e/FJFQFC90yvzIaSfi29oh665DGxksRirLuEG/
	MN8cwhq/qceIYZcUho8HJABFEjk+zjLSe0tcu8dvlsYZ2LOR8+UsqlSXd0XbN16hdj7w4wY/aCU
	DueNnFRzVcObimoIJibaDtRphhaoCQlrPeerto0B+WDpBZBf8ToUh/3LHzdQm5U2jagJ2
X-Gm-Gg: AY/fxX5DtAn1N3IMRMGxfclTjJj5FZgLnV5ZWKvaEWYS89cxa9pUhJfVFFTX4kHaEuz
	8arnKOnDtBeisCvx/DHYlmFmHkeB84E5672UkppbgWUceOfOOH+e5CATe66Feayl/uaB+LWjqDu
	5UejYbTJi3Hke4mjTsd2k+k2hYAhXSKGn6mJwVnk1VeziWXZHs+BGaus+iUZWOuRIgrqZBExs75
	Bb5QxiWbDcoOHlPXw6yNTGZmnMZKSdMlpzD2zrognUEgcF5JSn2vJtv0mJUVN+UD7V+PFvkg5Nd
	iuM13swORC5Usq3HOAPzj/SbqX0+lK7+wK6y/NAKuylnqtjg3fTnVeqvKOuRrz25V3FoD1QzyRh
	sXtFqaztnjYlx7qbpPTlbgycIo5VtIJTKJaRi9HclhkiOSiOV36UyomGUGuFE/I1fT/USjmfm95
	7iPAOfPqev6BaEKIvHtdwTa9k=
X-Received: by 2002:a05:622a:259b:b0:4ed:e595:bc85 with SMTP id d75a77b69052e-4f4abd621b7mr115510161cf.46.1766257099724;
        Sat, 20 Dec 2025 10:58:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG71tkmZOaEXRVDTFkxQxTteoL/5u6WPcPmvcI5BdbEGhUXZpVrRz4Ui56FFiPshPAmtjf9xw==
X-Received: by 2002:a05:622a:259b:b0:4ed:e595:bc85 with SMTP id d75a77b69052e-4f4abd621b7mr115509871cf.46.1766257099183;
        Sat, 20 Dec 2025 10:58:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812267a438sm13985661fa.41.2025.12.20.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 10:58:18 -0800 (PST)
Date: Sat, 20 Dec 2025 20:58:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ma Ke <make24@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: pm4125: clean up bind() device reference
 handling
Message-ID: <o2ow7tizpgueqhulpubdjftasn7u5iugdkvdwnawbiewsaihyw@n4escb7hcnzx>
References: <20251219142412.19043-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219142412.19043-1-johan@kernel.org>
X-Authority-Analysis: v=2.4 cv=E/HAZKdl c=1 sm=1 tr=0 ts=6946f1cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qZ3YKT8rVdHzq0eVhogA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE2NyBTYWx0ZWRfX0PWcw/OORjsb
 RnIY6Q64Fe0wpmWYv9aJ7G9C5MQgp9cGjUQ3B6bWbujh+SCOwVrdgWL5SBxEE8EBSfbO0UUUu/H
 pp2G/5a8405Bh/AiCP0/0wW2OZv3Tl6iX/z4bK8KDTHyx8ojrurbRDm5mDpKYx3P9W+GkB4MuJe
 tFmlfH2e19NPLyadHNnpaMrtimAop9ASEjyebPQii4aXJkprzGLDL6vxd1ln7VQDTcIFstoXUX7
 buI7EWl1ZXmMO4/cG3g8g5caqo9mfJOCK2mX5oiR4Q1awdMxjkw+wR4xYCVuoL3NViqSc8dv5qC
 gzJzsCV1k+i+zn8mbfIcA7rmi87P1UCszwCfgpLI+PrJJT0tgXq4HkJ1e/xdQWekOCJC+5NQmkP
 8RKz4MT77+xExyBwSOH75VyDSMVNDs5Q8g4t3xfBK/r8iHXkH+nW2uBbUcOeRnDzrgYGTz+h+iu
 T0KdIYhFiKUOKrbVCQw==
X-Proofpoint-GUID: 8x4VPxsP-gUUED4UAZp9cdAeKh6V-KtB
X-Proofpoint-ORIG-GUID: 8x4VPxsP-gUUED4UAZp9cdAeKh6V-KtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200167

On Fri, Dec 19, 2025 at 03:24:12PM +0100, Johan Hovold wrote:
> A recent change fixed a couple of device leaks on component bind failure
> and on unbind but did so in a confusing way by adding misleading
> initialisations at bind() and bogus NULL checks at unbind().
> 
> Cc: Ma Ke <make24@iscas.ac.cn>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  sound/soc/codecs/pm4125.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

