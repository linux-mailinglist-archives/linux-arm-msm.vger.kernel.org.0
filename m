Return-Path: <linux-arm-msm+bounces-76387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B594BC4AAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F3AAE4F1DE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7B72F656B;
	Wed,  8 Oct 2025 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D17arv5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1B92F5A3E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924823; cv=none; b=lIlmeSqYFtKnrWtJHNf8VyHBRMgXxvzCwxlmuHi3NnIxIJSsgp1Vo2Sd351NG8uyRfyamzupEmaQHQoJKtHqU+NLaftrlpl7ZLuhfHAcizMrP7/TtjZTimTppkz/nGq+NuvVQXzt2HLh4dnTTQaTZK3HA4gBiBRv6Y9J0+FbcRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924823; c=relaxed/simple;
	bh=4vMQxz8vJDFJ7PyFDHhD7SxqVaewjjy4uYlnHVW2M4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoTEIU4UHnLElkCNXcWQ4QLwgK6MaSJkiJEekTY3FXy2dI2SLaaA7KnYer6c6BlesqjYd97AZuhP2oJEc/7jpg5z8ddj6NBa08AhuEyVYczDfQzS/BIfg6c7V56MPedJcnUkwZ/1QCGHZ0Q64H72hJKHQZ5WST2ywOmtDExRknk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D17arv5Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890eua002274
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uLhdPwh176J3u3H4+MR9RBj7
	7/mlh5xjbvtuKbEqChI=; b=D17arv5ZdJZ6Qh4h4YtBT5rktlFlwB5RSg50OzLx
	bo/10mGSmD5ZOMtheohUoQA+x0+u/sV0Yi6R/oOBu2F+2C3jyC3foYN58xopGVJU
	L+Cx87wWk36FxetmlWo+ZAvoR12AxPWfEzaGoxBzCihmbJeqLRrFV48ru0Hv89yW
	yN9PiOdTRkKUKvIEz9vAR7yeZc3K1jo2sh++w1hMu7YH7Y3r0q1KPr5LMoz6fl4Z
	tOI40Cg6mSnqXD9AQId5wYlO9y1Gfv4FPgeeuTbliNQwrDmdDSnIeRx3cI7XEEQS
	cDZg4kmbMKp3w2FMkKXNEI3pz9Xjn/8ocd5lb7oZ5Clv2w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy729wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:00:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f914b5a4so6872563b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924819; x=1760529619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLhdPwh176J3u3H4+MR9RBj77/mlh5xjbvtuKbEqChI=;
        b=LSEfDw2yxgHnXfinM54dkzn0yP56khFyxDI0Kr508MUWZGK/IyfmKgD397Lk0SkNWx
         bqJQJXcjSoqjQIqsKPDDA74lsIAsnRK6Anb3pNiLjCfFB6uFwyta2exk0bCELK8ag0Vd
         bsTVLPqxLrkE3GYQ00OXCzpkgS4ExDvtEXeoprjy1APWMtWQpv9HIzJycIr+ZZaFaORh
         9FkqJ1Phdo2qq7iySDNaWxxtsr23sTNlP4ie3pisCBxsvj0I67E4vqpfthsz9HzA2WTi
         vV0irduztm1Ao04t6Ne1XRx9kQtzYsfAZ0I+dPtwLRCvTNgAYskRAWtPiMXN803IYoxv
         s/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWwUIcOdTNOF5shiSP19JE5jm+tSUk5TIQ+Q4laaBdq5kEpxAkSN09iUsKsSZajHpvAdZimVryc0KRtatCh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/55XVBl/CivUGCgIGdxWy7Af39HiZqJ6aiqmvz+1k9rHGgO1B
	vnbQwoqukkVDCjWW7wPY4al8I/U+jh2qvxSfREpAFQUOZ7HSB4qHxopKcXAvuLcr/FJmsgWe8+t
	uK1dDSZgAfxumMBaW15x4jtBHNs3fnIiEQMARRrkvta4p/TWQeJMUslkkHIBvDDmrr9rO
X-Gm-Gg: ASbGncsvmsy/MdJY/Laz0V9Aq+GiI8ywcWs3ArwU+Uwejo9yj+3b3BoxLxRQt2IGoaQ
	xXyryRX0ZCqTGi1w08UclKJp221cbvysDbSH4xyLj+MufTQPdyKOUNoCI4EkyPHGXai6m50Fe9m
	eo8Vx/zOtiXd4dN6xz3WjrxXlyS6ySSjHbK+ItYW/K1HoL+KdXGbjzoF0NY6Lc2Xt52Earrjf6r
	Q1NSBECMXAGXJ/4coKZ2Dt66IVKyiezOfalq1I19BhI2v1q0o70W7Vp/mh0KYjTU5uYw4XxDPqh
	W4y4rzMKb94yO5v4DqGbMmgvjnlSYYOGieWZIxK6A7UYoNHN1LhIBFiCtHKiH9lpMH1bCB6A
X-Received: by 2002:a05:6a21:e083:b0:2fa:52a0:e838 with SMTP id adf61e73a8af0-32da83e39ddmr4358394637.36.1759924818347;
        Wed, 08 Oct 2025 05:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKO7wqlSvx59P2vS6UzWzJ//dvnD3o/iZtvddrv03NuT9ONGsnUOVru90lpyPYje4cnIJpKA==
X-Received: by 2002:a05:6a21:e083:b0:2fa:52a0:e838 with SMTP id adf61e73a8af0-32da83e39ddmr4358306637.36.1759924817502;
        Wed, 08 Oct 2025 05:00:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01faf086sm18623699b3a.23.2025.10.08.05.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:00:16 -0700 (PDT)
Date: Wed, 8 Oct 2025 17:30:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/12] remoteproc: qcom: pas: Enable Secure PAS
 support with IOMMU managed by Linux
Message-ID: <20251008120010.kygbso4vw2ouwlzu@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>
 <65e6d61a-7648-4125-8550-8a8c6d476b0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65e6d61a-7648-4125-8550-8a8c6d476b0a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e65254 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=qxcRfBPHBTAMjdSr2WsA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: fBaZ45qv-fB68FDv0fdfqcKLwdtgTb6R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX4dd6dJOc934+
 O13P1XWRbZCknUv70HPskWI8XYgLKvCqGgvyOOTSZ8lIZ78+4UGdtTlHuKcphKpidqnKk7cZTzL
 JIrgJ52RhnRLWyb7X6XdRQnI/HukMl/RGp0c6G9OBzjNDH/EToVIRyzqo6AyAK83lJwS6riVUTy
 xsGijgoBgtJKx5BAXqOyHnzPl7r6F1Tj/n8SQXFcAx18HfHNttEbdI4ICEArPmlxTlDsoZojZNp
 gBBNJX1D2pHQPGAcdeO99QwMoGZQEDaGziuKKEPJT75zhsa86BioyLjZBVViQadPJpp3WN6QyQP
 WNNcTGupoNdhF5+hvIzDgKvOIyHr6iqe6f0PHpeemSVte7lI7h2ypf027cWmukUPBiBrwYU1ku1
 Kqv52rEC/oyXsIhbrboLPUfcpGWX1A==
X-Proofpoint-ORIG-GUID: fBaZ45qv-fB68FDv0fdfqcKLwdtgTb6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On Wed, Oct 08, 2025 at 11:19:32AM +0200, Konrad Dybcio wrote:
> On 10/7/25 6:48 PM, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > handles IOMMU configuration. This includes mapping memory regions and
> > device memory resources for remote processors by intercepting
> > qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> > during teardown. Additionally, SHM bridge setup is required to enable
> > memory protection for both remoteproc metadata and its memory regions.
> > When the aforementioned hypervisor is absent, the operating system must
> > perform these configurations instead.
> > 
> > When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> > own device tree overlay file that specifies the firmware stream ID now
> > managed by Linux for a particular remote processor. If the iommus
> > property is specified in the remoteproc device tree node, it indicates
> > that IOMMU configuration must be handled by Linux. In this case, the
> > has_iommu flag is set for the remote processor, which ensures that the
> > resource table, carveouts, and SHM bridge are properly configured before
> > memory is passed to TrustZone for authentication. Otherwise, the
> > has_iommu flag remains unset, which indicates default behavior.
> > 
> > Enables Secure PAS support for remote processors when IOMMU configuration
> > is managed by Linux.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> > +		struct of_phandle_args args;
> > +
> > +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
> > +						 "#iommu-cells", 0, &args);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		rproc->has_iommu = true;
> > +		of_node_put(args.np);
> > +	} else {
> > +		rproc->has_iommu = false;
> > +	}
> 
> I think the above is a little heavy-handed..
> 
> rproc->has_iommu = of_property_present(...)
> 
> should suffice.. if the developer puts something that isn't a #xxx-cells
> -marked provider in xxx = <>, that's on them

Sure.

> 
> Konrad

-- 
-Mukesh Ojha

