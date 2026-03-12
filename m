Return-Path: <linux-arm-msm+bounces-97211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLv4Ic25smmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:04:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9578F27237C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF813300B28A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F833C1978;
	Thu, 12 Mar 2026 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIEQb/ya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQnNJ4fb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8092552F8B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320624; cv=none; b=FDb+rVhLifGJFwZWDal6Bst6GDCbgYdkJl3UClPqcgs6+MUZ4nxtBDM1smfrZtIMowAI70vZL70IMeUdew0/orMTO0ckRHj/6H5rFQnSWfjgcR/vXZKEHsI6+gwh1tcPSBNZ5Kdsf4w0/mRAcetrU2UIJPjuBuMWU+2b1JBaKiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320624; c=relaxed/simple;
	bh=VyqX92BFgskPLHgQdLTd5IwboS33BuQxpusg3mRO0uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUjuQt3mt4HZcpEXMbRqB6vTfk7RhadZasnesj1TUFKU9IHDWhMxBv9fhPNHo1vS14geToHjFGlgVw4SX4YA0YEwW1sU3rD31e4g4L2tdopWE2YgD6V7gqz/DoUr6xjwjD0IGvUZAjL2MHaVhj+pUiNCw1MaYYxCnplJ4dCY08A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIEQb/ya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQnNJ4fb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9eOv94025765
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IgeIXP6SCvHw6KGTgfYyG3P2
	zJRE1Ej7HIYXBJvoRd8=; b=aIEQb/yaGD2MFyVROughZIPzaxNPC5yfpOKuDqB0
	qMB7sRGhlyaqkrGhfkXzPUOLcn+TKXHb9yqQJRpqGpmwEzIDSddQvs5bm+PcBjq4
	+j1lB3pS3SywmFxnVNPe5lImavSjS3aYybBl01zvP+KPaBgw5NUxCyqdaJQgbgNV
	A5IE6aUwAHlzfUtXHquH5apA0Lizy5nwscrhy7NFytWG1nZ80gNn2fpaKz1tNpte
	e3uTC30L3UuUsuZ01q6quOSnOR3j1RYLID2Rvu0QOw5up+QRLeL3k21Bo3J+lHjG
	BU1jZlhAWsVoW05OJ8C/2CM7jnGqws55nul4EWZrrgo7lg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50t43n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:03:42 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67bbf529d09so17903257eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773320622; x=1773925422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IgeIXP6SCvHw6KGTgfYyG3P2zJRE1Ej7HIYXBJvoRd8=;
        b=UQnNJ4fbs3ZupB7I1Sg+Y6NayCvOCyaLqLip9mvVsvSMWjjQi823Po4Y51xJDF++lf
         +Cx1yku2L7tjeBWHki4QrU4H/x1h0wEFZyFKXdSE4cghkbTVAbgDsJvanYjfHLZ/QzO4
         0CMvvgKkzIKXRWL6KZj6HhGM8rX0BLg3NQ1dnhTiLf8k2UdDriLpqV3UqYnQh+iaq/HV
         HXMMHQPrKuYUndYHZ7mIjN8arQl2ObsCkazzi1skmqcQaNPi5Nfr6Tp3m4tS6ws5DCwB
         KnDIDCKQ3CgTNEnHAmB+/ETrwe4v2o7upVTDY6/bXnExWqv+UfVamN5XVDyhlTqZsPlD
         18eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320622; x=1773925422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgeIXP6SCvHw6KGTgfYyG3P2zJRE1Ej7HIYXBJvoRd8=;
        b=mzK06kp9R5vbly6Hm7UK8r1ktoxPn8KuFdTVrQf4qD5tyMXIqgb0T3hV62IJ7B2vBq
         xkvES9Al2CHxYwwdjCZ1w55x+BWO/pNehpoFK8/77BTzOdES92CBUSvhXNG2VCrc6Yfn
         ee85gIP4qEJ5QLCjiQOllgm7zL61d+wUqUwmC7Vp11jaahOmiPvWmcgDekdrfoOZeNbc
         CoOzHCE2FEKmeXgareOp5R9Gmu8j9d8sya8T3723MBV/k3qcpK04Sp8SsB6GhaueH/GL
         VQ6SEBTYENBVw1e21cUvbRVhSyJeTtbKeI3tYzYrkxuafwoj3mnLLn5afSdh1jumazUD
         7iNg==
X-Forwarded-Encrypted: i=1; AJvYcCXwiR7zfDt1yA0KY4OQzs4gb5lJKFeVLBjuxkYpksJvf3i0cendMm6Dk9kl/fAy9mjtxyZF+4jiTquxSAfz@vger.kernel.org
X-Gm-Message-State: AOJu0YykhUUQnTSVU/oiuNokxpPnbJXjD8S4zKwJDMhPRpPUYYdySgPy
	iJVcq2Ara6CZ3D22YZuyxGZBRX2VrbH2bEhx5j67lL4uxuWzlL6XEv5nnyxrBl7sQmybbGWodPY
	Ora/xaqBSXzyjBmmBOl73CXyf9nxCosYB1PQXDKp0d8U0zvdSjADuoXs2Fo/fBzNE+G1J
X-Gm-Gg: ATEYQzzLAEP6YVu0/DtVRj9pSGoHc9xSQho6YAbpWg4BAqcsNTdU45uU9qOGoQoWJuF
	28225Z26BSyZswBPLjblZQDPz/fHl7oRtwBnXT0aBeJAnD9UP++L3f7U31J7JmngqELJVbpP3IT
	kLXUdT+neimE2FXtpEFt8UmdHjOkgL2ewO4RERfNbQDiwf7JR7EKthbB98tsPvA8dvfBbqPukNS
	SFX7DWmCW+n6tjwkkLv4RW95pn3x81WGd+3eAXNtnNAz+2nkhDHateyK7yI2pfemPamzACu7CRM
	f5/Vu+9HNsKebCRzi2lMmedBlW4eG8DZgCtkzI5lJ1Im/06lJ9enwsC8U1UsTHw1TWSbxo7dkfu
	ap6vWdI/JZZNnQ96dcrN5zVyOA+Fwny7bICF2i0kYONZk/2zcCJ+7Gz4fS88DS2PJJ/CTrwG180
	J17fXNiKrK8w6oSJhehJggQ5y6iGfcjqiuy/w=
X-Received: by 2002:a4a:da53:0:b0:67b:d301:8638 with SMTP id 006d021491bc7-67bd3018a9dmr1000452eaf.30.1773320621474;
        Thu, 12 Mar 2026 06:03:41 -0700 (PDT)
X-Received: by 2002:a4a:da53:0:b0:67b:d301:8638 with SMTP id 006d021491bc7-67bd3018a9dmr1000416eaf.30.1773320620859;
        Thu, 12 Mar 2026 06:03:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162baesm983898e87.42.2026.03.12.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:03:39 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:03:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] clk: qcom: gcc-sc8180x: Refactor to use
 qcom_cc_driver_data
Message-ID: <hufolkwj7kpniqzfukpncwsfn27fyeqrkdgpa3xjpzo5ln4dcv@2itadbcoottp>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-7-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-7-val@packett.cool>
X-Proofpoint-GUID: wfbHd0LSCzr6wDy1hsSHtVNFIguRq8MY
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b2b9ae cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yOvLjl7QKCNJE-DQ6PQA:9 a=CjuIK1q_8ugA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: wfbHd0LSCzr6wDy1hsSHtVNFIguRq8MY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNCBTYWx0ZWRfX/5YkvICiXPM3
 REnNZQwmfUUHXGnM3I0cje6iaRTbrnuFf4jil3Xl0Bzc+76uypt83vTQH9zlzy/Pd6lbPZGjlzC
 MjRegjaYVF+eyAfZOJyDY50LYtMKE+anILfySZ7rMHG3mKLNZZOZD99LN5yINrxjNd4qKGxHCPD
 UvzUK13QIBAvXmiH6DndyDjBU8sBkII5Fu5xj1CGrtwbMK2WJ28GY+px2LU5rFtZukVhnWK5aWE
 a+rfH2q41PZGulZs95HxiGhuSYk16rvoKrAMOFT7ruey3rGxgUTvx0KpT+ZfSsi2Ezr1Pdm3pHs
 XhdI0xBAwScNLeq2BDLkNg2bDF7al/GipwHAvWe09+YuNYhcXPL+4wIT+kJFbfdkxBGYNZegrMw
 ukHZ+xJ3+gOdM93WW0CoVcfe4hKPOTSEetxSApL3dwLV67b+OcsbMSO8m1iV4aNyWN1KNmgN9PJ
 RGy6c0L3O3zkB9mxXPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120104
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97211-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,packett.cool:email,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9578F27237C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 08:12:11AM -0300, Val Packett wrote:
> Use a qcom_cc_driver_data struct instead of a long custom probe
> callback to align with modern qcom/gcc-*.c style.
> 
> No functional change intended.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 61 +++++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

