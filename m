Return-Path: <linux-arm-msm+bounces-98469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI2RE3+tumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:49:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 058992BC53C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C0A030488E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A24B3D9039;
	Wed, 18 Mar 2026 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBByCaYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dz5TPsJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730103D8917
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841726; cv=none; b=Zg4u7gjllgV2dBK601v6IN10oJqh9TVgwcHBKEZQMLgIUUSOBTrbZ9QGULOiVwIGHLBYc1irLZJ2hRusvj6yzFwWxfYOCGS2Caq/wKkuLZ9V6h3A4aNQzrZCooZKVdFH2OAAKpLXjT52qrlSAaqZTlc2cSlVdUWtVoDQdZh2Fgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841726; c=relaxed/simple;
	bh=yMu4evfh+4WOpCdg8VroW2eFoeg8fQ8uW3UTqffG/Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXSJpN8ZoLhrz8+uqCC9eL5LscWtVEYINfi7lGVYezKBkh2EyLezwSlpUfnMG5gsxOtAQsHOF6dmMPUjMEUkZu3yZWl3JM9INmJuiolH7/n72LS1OhiY9HwZRajKZvhhp0MogqwOHTMzplyU0bV/67Xe/VKhOnLKzVaAm0vIWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBByCaYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dz5TPsJE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8HEQT1050213
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4obHx+u6g9OIVr0W69Wxv02v
	/gbopfLolpa7DVkHWQA=; b=HBByCaYNLq2865gIvru4VJjWIJhjEmPeRFhpRIqZ
	7R2qcqEgpEb1oQOtNQ4jMsGe3jb9cfwJKUCK7CHB53dbsD93l2hIw08dAwbLStMO
	MDwYr8jryl2QxO7B7hVxWPe901xVoXUHQQa5xK1O33STPzxIFW342YRhdl3EIamC
	SwTkko9sdmfVSXfmORfPToOEd1ryQWSXym3MMYKNka7abHVDgydx3prlqTVHjJqD
	AjF40NRWhGPGbTaVczkHqZ/e5r8rjx0cy+FLmOZbZF8A6XDTrHTLkXiSFVsrcNrn
	P32NNuh1WA80mjGO4+HGnN2KFpkjHX7864Zz1MVCD+PJbA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ejr12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:48:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090cc6a7d2so95478711cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841723; x=1774446523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4obHx+u6g9OIVr0W69Wxv02v/gbopfLolpa7DVkHWQA=;
        b=dz5TPsJEUnHw40tFztffLThY2eRJ4JF8R0jJPrFAlnHV7XdMZbdql3uJSnZ7aPcKUU
         YuQsSp7/rewSELfWy+aKTcDeqCBLWzJnVVGXWyIHSGEXkQ9gjvbtf884EZmIwY9SSNzX
         Qgg3pYYJJSydhg1FWdoehzWRU8eB91OmfLKwCQwdn4IQv5V1OHKOPo//mnxqc/4Kf3QD
         O3K1cPRpfKEYiVMZH4EaCrSmFijaNZrdRpJS/7YQ0B8jWpRKYNXh6SrpdvDpjMZCx5DG
         T4rX0l7ecrEVL4L87YeRrotCB9/pxYcPaflYP5UCFIj4KCyOEOGcBx2nbE0bbyNULXcQ
         rIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841723; x=1774446523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4obHx+u6g9OIVr0W69Wxv02v/gbopfLolpa7DVkHWQA=;
        b=cvJC/BYZv7ODb8NdOi0MEW/K1LCveEdCs+htp3hbdDfEVV+d+VNrJOHbmZzxuYTLL2
         q0EkyhPCtPba1Z2w1o/PC/bYtiMWAMFd7/Q/46Wvj+pcZIkAapz4Y012RK7OsSRU3A0O
         qD/VXZ/o2eln7O8SXAtZInRdUf+Rs1A2jlK9BdxBmSFikG85b3hLNGzYMtzFvZoDXw8O
         lE4W86DDgHXG4FcpG795GFzy8FD2wLwKJKZQKZwiALbYH/3VXORGEb/H52tjjVDHeOKP
         W47jdxYLzCSPcXgGiKPTRqkxcGHzVMMYfhbXIUyOtzp0sZ1yO5tpYUDkEF5uxMdHRUFW
         6LJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDvtiNsdT7YGJ6FgfhyLcU52rWeYCSEIowcH7kNlGvmFW1x9o1XaBph5G9dvzUubi2/gejHO2WohtoKphe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5GJ0eixv2wIu6sn0kH3nnp/+y04knS+E54r47Qrp0FmrPktnt
	y6X3SGNB6gdMFpBF2CGtPgQpVPynaKvGzLSOOZhaYGZWpQ9AJRsZTOkna1/XsPqYKC4q7CBVpHr
	bzUcMNNqvSEE+m4XSQadMIgVji46RgmOJOeH9F72A+rvqtDwbxQB9vr89DOtjUiagZ9BkZaI9wj
	XH
X-Gm-Gg: ATEYQzx7Vd2Y7k5rajzabDDBhO9WSLumB7mi6dbRw8SlVzmObIPXcNBdqoXesFt3qqP
	N1Send0++jxp3p9BL6aWJH1Yw6G5yia0pgn3FiE65hzra3HcJOFIILVQBdDMzhwL0EpkF5u95c2
	ltboxveVjc73yc53PU7VLiYu9SF0ip1FrveOOAOSs4tlHVBe7V4MyeRyPGhth/bpUmq8aOJ2/N0
	/z40D4fsvlnO91z86W8EN36Ynv43YVPEKkNOERx43+60P9BlTjiy9Yl8ry/a0zGPSrS1SBZEhNA
	bUWAZiggjiI8zrIFzjBBPJ/Uja5wJlq7Cv7upzQZQIzUvyKIqbx1M4WOoWF/E0/1v8orFAUfjSc
	aryYlNSBOetN9qZSOb6+aej2D7ai10nio9wTLcHNY/hEn/kBNsbAAcsArdv7DE+fIIt6H5A+/wm
	CIT7QiQE/3Rf/XOklgFnbfJndduRdLNafig8A=
X-Received: by 2002:a05:622a:44d:b0:509:20de:4acc with SMTP id d75a77b69052e-50b14880cb0mr44388361cf.47.1773841723371;
        Wed, 18 Mar 2026 06:48:43 -0700 (PDT)
X-Received: by 2002:a05:622a:44d:b0:509:20de:4acc with SMTP id d75a77b69052e-50b14880cb0mr44387921cf.47.1773841722849;
        Wed, 18 Mar 2026 06:48:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5156e74sm6353381fa.7.2026.03.18.06.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:48:41 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:48:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: qcom: Cleanup redundant header includes
Message-ID: <7u2esescnuncs5rvzpjnggxhwizbodwcmhcyw635bgelg6xpsx@n4m5vtwuwuwl>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69baad3c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=aywfhrhUYFgYpfM73PUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfX7QdQBKoP6Iz6
 iTvAMUdMkZ1qKCpB9efSK+ghjP/+yvxcPdGDEMzoSXV/yHvyO3i4RY/aXI8V0mdjCASkWb9eggR
 meOOcXX4HII6koCo1V/nja/1vPV8j4fD1I1hNss6xMfaREJrl8jczrwHQOUZnpCBDFraX97mlVX
 2gwEkEQT8YD2J0F/RDrAdmVgPbOmCm7RwcLhQGzx4Xa+vw7vb8bAMVRAKhSrKMYssiL28ZkTK9V
 xiJhYNPjC8qM1GY37S+O3sejsREEPQ8WbcIiuHvZEkH1pIkdPxsUXdAG+Fcf3Zzau9+xgmjJw+k
 Ij3Nz6F0ttdm1p3cT8eH2EDlWyPDf25xnjzSy0/YhGK6zr/xgVJM/F0vuEFIrSWXKxlNj1Zi4d8
 yqr4cOyeROLj0gCBWYkRwKPruaYo6pR5auFHQ0TikLwXYtFO54DZnec0d135aA2imlG1I9nVCjS
 zO7tJ4lsgjm7BrzX1vg==
X-Proofpoint-GUID: YDjq14SrUo68DiZQ2AF9L-JJb-zOGQpi
X-Proofpoint-ORIG-GUID: YDjq14SrUo68DiZQ2AF9L-JJb-zOGQpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180117
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98469-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 058992BC53C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:08:39PM +0100, Krzysztof Kozlowski wrote:
> Newly introduced drivers keep repeating same patterns from clock
> generation scripts...
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       clk: qcom: kaanapali: Cleanup redundant header includes
>       clk: qcom: glymur: Cleanup redundant header includes
>       clk: qcom: sm8750: Cleanup redundant header includes
>       clk: qcom: milos: Cleanup redundant header includes
>       clk: qcom: eliza: Cleanup redundant header includes
> 

For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

