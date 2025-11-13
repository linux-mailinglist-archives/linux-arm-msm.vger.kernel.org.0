Return-Path: <linux-arm-msm+bounces-81624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE3C57FD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 15:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E4B3635122E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 14:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8612C326F;
	Thu, 13 Nov 2025 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvYaWbd4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iB+v7nJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097FD21B191
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044831; cv=none; b=FEBT1WwOvBizel50GKu+m9p6FsUaHzZpwIwtpHJRjJaaZAaM9Eu0Eaqp6Nk902fYstZ2thMWVbxoZPVpMfwVhHi1Zm1ArN6OQvBNxTGV5I2ytXJJRemMxREUie/xAcJ9A4iNGNB1T9zRSk7kN2OKSzYXLlAmfl0C3V3EYAmZY9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044831; c=relaxed/simple;
	bh=pQt7i1zxCG2MMHiBqwtEcHfJzOYHmddaQz+bFvRNyX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H15i/AJjv+SS5gMV0Tr0EO7SYCRMseiC0MVlPAcyx+SUriuhM+GJ3EIHIkY1e13QsWWoQrZFVeCWTFkn6sfuAufdI7i68/tuSucgH5YFd+RHwawkqaZOGyvTBBNpK6E29S3RPfHof1/v4go6ryivpFfEnZ3kw2pd7CpIQhxoYu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvYaWbd4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iB+v7nJ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD9Z8HD3120612
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 14:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=htMvB6epT7CandmvQdcrRa9C
	oFrR7oVivEH+Uiq/FbU=; b=mvYaWbd4HfxizQBq7vsQrJ9bt3owChxPMpWpYzvw
	uxa1pDw7OBEMl4QQAVFmQoZJabVakHwh7rCYkh1CW7qEwhgRY4YM88YK/Tt1mDIu
	UfQgQ47ImDT7akgRsM3/gvKsiAseCrZLSyGXCB0DUHaeVv9ACeKyJ2o8l8GP8BG2
	MTRAAznEDvNomcXPLolshuvKYQ70E/x2xp4lXmyW/75sGqdUvRQlnvzi8gLe7hCy
	tygCLrRcHiIeMxmTzgGJQcSqfF8WqvCXUJ/pPuDK9+ZZQWr5w78oxec6vxldM7Iw
	GM4bSyCiMNtO5GoCLWK5kALNB/VKaoa7dDziJ/IyKa5lpw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad5put7s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 14:40:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297d50cd8c4so25399235ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 06:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763044828; x=1763649628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=htMvB6epT7CandmvQdcrRa9CoFrR7oVivEH+Uiq/FbU=;
        b=iB+v7nJ9q/c9vdsC0nwClErUfSOptK5CF1Jvk76napWoiKm3REm+Cg3rIzm2cp1Uvj
         pOT4OWm5SW2OugOM/sWipFc/KVs2yKgeVP3NJpy8rdF1AcAJrVXGHnuszHdDyixI+09Q
         QPsYgdyfanNEUv/T7MY6MaSnFt+K1HTDUmoww6SCTr/HsFwBM+jwrPye+IBl5UoaaeFR
         Ke/YsOqErhhL8HZ24uO8x/O2Q1mcPbgED0/D//HpseW6pEHmrpZe5HjCueXqwgR4qGY5
         l3om/1YYPC/m1f5qPu22lC38LLGcrpq7Swr/BJcxUnOSbsP3N+DMPgxuwd7e1vytA5D7
         EO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044828; x=1763649628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htMvB6epT7CandmvQdcrRa9CoFrR7oVivEH+Uiq/FbU=;
        b=GRw+QpN9457XVqfcD7M7QYMLIRPagTUwZz6jWgfU8WheobKJjmkCL4aWDSIUnJ6sTX
         zZLW3a0Qez+v1livFllhmhKDhVqXDgU0DRXuz663zMcgx6X2AN7WlliY/HNJsY7sHiO0
         +l8mstzVPZKHmoKdzJbN3mOrj4z2KMr5XACanussD3jmkrxxHb3ZlrPlf5BvHtv+w9tu
         WxKIc5f/4E5rjC/ZpV9XL3qfCpWEHILDxqmMT9JTwSy3HzbAtsEms3laYsTvunvUXV3E
         XDSiJ7ukMtGehujvvC7UberTOPnsxwJjcVJ3ESxDNbpPJvGdOUSLRZcqbbH2WzWN0hVo
         xfGA==
X-Forwarded-Encrypted: i=1; AJvYcCV66CIEJhUuhJOd/4kyjsliXkIzUjR1Uro3vru7cjcQPXzaa9l0b1Vzq0fjr3YVg2SjCZVQ79LY8+PyjXDK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7m8SkzNT25qmypCQ1f+z59CDQZ7GxHyaIxs81XyQZkGw1tlS
	5co+k9w3d0YE68haMPgWtETlT9DdHw8T9aCHlkktWfbx2fXVg63HHelvMxbYi97urrka7thmofz
	IMrMNUBY5qMvxvFD2VyDr+oVMpoLreiW43ZeF/Jo7UgijX8mCHyFgd16XQRuOH/kHZcI2
X-Gm-Gg: ASbGncuWUqz6eKdJJLd2P0gMt5s9LuLUwYnRbtjpkOf/O9cMflh5MLJo0SsBvSrkdWr
	35PRh9KtsdtYYX2zGHdTA/mt/fkdOoHNY6OiPqZVRhelCWptAa27iY+PslqQURTwkuhknkkf47l
	OV+mBGfLlJOJhrKNxv0A+VAW4yS97o4KHZI/CV64/fEehfxlJc1+oBCc1+vpP/w9Md5gRoHg2iP
	nJMw69Rre/Bs25EIUE/uaXgp4vWOZs+dCvUsGcghH4CtXRyQNavWsUeqKLqz+4m7LymB/oye8Zy
	2gdPIfUeQCf1SjcUI4ocS21F1kb1UDg7pnl5uDgmS9DmMUvOON+7b59Wv7yP7bNYVPEu7BuBtKX
	b2xx6t3Y8/OI4H8MhbFjoUMzloQ==
X-Received: by 2002:a17:902:edcd:b0:298:450d:6926 with SMTP id d9443c01a7336-2984edcaeb6mr63064565ad.34.1763044828113;
        Thu, 13 Nov 2025 06:40:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEl/so1JQRVBOLKbUPyOHe07j4BmKuiu0l/OLlCQkBBbzsEx8dQUW6L5li1Y+4nYA+fpaHq/w==
X-Received: by 2002:a17:902:edcd:b0:298:450d:6926 with SMTP id d9443c01a7336-2984edcaeb6mr63064125ad.34.1763044827378;
        Thu, 13 Nov 2025 06:40:27 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2cca71sm27808595ad.112.2025.11.13.06.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:40:27 -0800 (PST)
Date: Thu, 13 Nov 2025 20:10:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Message-ID: <20251113144020.hvfxwf2gw7acg37r@hu-mojha-hyd.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-12-df4910b7c20a@oss.qualcomm.com>
 <aRXM5OfxYTt2a8yj@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRXM5OfxYTt2a8yj@linaro.org>
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=6915eddd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CAvRy0lHR5TJh9SEaKoA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExMiBTYWx0ZWRfX3Wb4idnRKslo
 l2QasCzVHlshUprymTxB5FnNzQcTEtAUih1kEnbaLi9y+sPZ5WCL8zbCIcpjYW/lh6bPb5Xzi9n
 MfjqufJtf11nhFHd1u2JSGR+rpgi1+IMmsWrVuRAVTa5pBl3l+t6hLcf6KA8p+o6PfHpXWMly9A
 +oVuv6EAuR88HKiHFTUaXMEGsAPxu8Sh0yXZ/HevaozZ4f/FzeouQ9yR5IkP9a3cJLS7KBPv7pb
 uAWPzZtOITGe/aF5fKdgX8GIhwBuZ6+QouihltlUvBWR08fheE5nFKmv75j4V4j+lGw+j7MfGA5
 YVbJINrbf+5XhgxZpNYYXkbUxxUpHpiAiw2nQTKlhKpeuETvnFykTSqn/vDRe87hDS0b24kdzqs
 XGgOpAlMDzJmiCbkOOgwPzP0Gcvl7Q==
X-Proofpoint-GUID: t1gKOG6xK3DBscGED9INlKOdB882H5Ps
X-Proofpoint-ORIG-GUID: t1gKOG6xK3DBscGED9INlKOdB882H5Ps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130112

On Thu, Nov 13, 2025 at 01:19:48PM +0100, Stephan Gerhold wrote:
> On Thu, Nov 13, 2025 at 04:06:02PM +0530, Mukesh Ojha wrote:
> > Qualcomm remote processor may rely on static and dynamic resources for
> > it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> > or older QHEE hypervisor, all the resources whether it is static or
> > dynamic, is managed by the hypervisor. Dynamic resources if it is
> > present for a remote processor will always be coming from secure world
> > via SMC call while static resources may be present in remote processor
> > firmware binary or it may be coming from SMC call along with dynamic
> > resources.
> > 
> > Remoteproc already has method like rproc_elf_load_rsc_table() to check
> > firmware binary has resources or not and if it is not having then we
> > pass NULL and zero as input resource table and its size argument
> > respectively to qcom_scm_pas_get_rsc_table() and while it has resource
> > present then it should pass the present resources to Trustzone(TZ) so that
> > it could authenticate the present resources and append dynamic resource
> > to return in output_rt argument along with authenticated resources.
> > 
> > Extend parse_fw callback to include SMC call to get resources from
> > Trustzone and to leverage resource table parsing and mapping and
> > unmapping code from the remoteproc framework.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 60 ++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 58 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 9feee2cb1883..4d00837db58d 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > [...]
> > @@ -413,6 +414,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
> >  	return pas->mem_region + offset;
> >  }
> >  
> > +static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
> > +{
> > +	size_t output_rt_size = MAX_RSCTABLE_SIZE;
> > +	struct qcom_pas *pas = rproc->priv;
> > +	struct resource_table *table = NULL;
> > +	void *output_rt;
> > +	size_t table_sz;
> > +	int ret;
> > +
> > +	ret = qcom_register_dump_segments(rproc, fw);
> > +	if (ret) {
> > +		dev_err(pas->dev, "Error in registering dump segments\n");
> > +		return ret;
> > +	}
> > +
> > +	if (!rproc->has_iommu)
> > +		return ret;
> 
> Just do "return 0;" please, you know already that it is 0.

Ack.

> 
> > +
> > +	ret = rproc_elf_load_rsc_table(rproc, fw);
> > +	if (ret)
> > +		dev_info(&rproc->dev, "Error in loading resource table from firmware\n");
> 
> This is odd, you log an "error" as dev_info(), so is it an error or not?
> If it is expected that firmware images may not have the resource table
> in the ELF, you should probably just silently ignore this error (or use
> dev_dbg()).

I initially thought of adding this as information about where the
resources are coming from, but now I feel that printing this in the
kernel log for all PAS-supported devices would be irritating and could
mislead the purpose.  I will convert this to dev_dbg()

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

