Return-Path: <linux-arm-msm+bounces-99439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKWcBYzGwWlTWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:02:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 839922FEB94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74EBD303765F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A56372B53;
	Mon, 23 Mar 2026 23:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzCJnhZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtQ4rxMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A328D79CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306951; cv=none; b=KQ8yvaEVe4MUNtP1FxEo79DQG+7dXVCQH+V1pgcZO6TblXcHmU4NkIxhEAv2VQa7+94v3SLMW8PtEMvUuSdLFL22am52ZezgVeyoEVcK1qFGIvdWB1GUBIEtQokw8XTEUnxZEnqq1VyeVEshldEAKL60iRasP7LB9RjkVPyPz2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306951; c=relaxed/simple;
	bh=c2N0SXiYgl1lcnSAIfjD+qfctXbxIQr3Gp2+ex6jG+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ahi6rz4JR84ECPJcwbymi/ladr9v3Va0rRJFtDQ6WG17zWJ8KIxJDo6Yy1hwW3Ge+wnUGw8Hdhs+C0HzPrBxbteoNrt9MHRHRIm+x2gyn+JG/qvvtCdwuMdQT4C17idW8gXjNoZmiTeet5tqHI2zv6reJwscUfmjMEJQ/RG6fjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzCJnhZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtQ4rxMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWER3817386
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AKw/GZGnGLvR2au2Agr8LJDh
	HXHe4rMehEHcvP7RKQs=; b=NzCJnhZ7Cbm+5nXeNUtMMCRdrZW52Ka+Z6HVJZHx
	s/E48s3ttJlzM23KftFNtPcCy/0FlxU0t0qSRaekVPzfhWjB4RDzHB0mcCEQgoVX
	SNQL42l2klTaweMzcwZ2P4ebsj+79Q6hIYEXT6VXdPlukn38o3hpooQRthdhIXKu
	PqMNjIGNofFhhDhdkHwVpSuSpF9Ts+ECyU6D0Rpbt9IUzkWaOzQKQjhs3luy9GDL
	S91qpxQgdOPCY9nhYG5i5VxBn9oiifPZtUlwWwkVGuzkGvbEPxVch+1oNSC5l/7/
	pgXILvVr7AHiP452GMLWiotgz+Eo+lvP85bVFMwTFJGJpQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w252b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:02:29 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94e9d49f7c7so33232770241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774306949; x=1774911749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AKw/GZGnGLvR2au2Agr8LJDhHXHe4rMehEHcvP7RKQs=;
        b=WtQ4rxMDryXLg+yA1FCbEdukKvItvYPhA9e4SmnjZ6/Tr30WHJoJc5NErBSc/DSplD
         3Gbt8W0/HvsOTMOvXIT8/sOs75h0uigPiCSirXG9rCyZPhsbD84+L+xgenBcqhiPDUgu
         fi3RwnURsfhyBjOYT+hiQaqdYkzVp+TrrKhTSv1418UJ6HKsIvm1s9X3hqTveh1jTxd5
         rVxq35zRiobFERQf4xUOHFDTsSlzqb16ifxk7QyfPy+Nf1+5EnDiSQWGfiBI21Oz6uWO
         BANkODKOpYQAe43X+QkR3UzUbBeljcsPIKDt1kFqoyWrSfgjY5ksPKl33D7D4BSKIsUZ
         0DOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306949; x=1774911749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKw/GZGnGLvR2au2Agr8LJDhHXHe4rMehEHcvP7RKQs=;
        b=YQcWFbOK3/G/5he2dHE4MqwmehZV+4jwbVZYqhkA1bl7v96Y2Q2Lum/1BjxdXA6Aca
         xpaFEXFKK937ziGChx0fLxYwkyh2D8ftLrXa+N6TVWGjeG1qos4ivr6/RzzuQrJZ84OX
         XbR3nlLX8qIqHjvC9ZZm9S9LAkRwgsb16qSFoQkL6PqbDGmVriXFQ0bEEAEzD79Ar1u4
         SFv3LkLjxffNsNh/vVwL14D+ritCIkAP37VCEgc2edOOsICVop7vNsfKAuG1OaZ3+hO9
         5G892CkzeOl0HIcfxb9QFUsEKINTIi/IgtiJ8CXs7C/Nj5NtsMpLNsn+CJb6x5a9ZYtS
         r34Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjXdg9fAd2wU5ajdewrtuN6+8tqwfzrAMJMN70Ab39Z4WsvlqstVVEphz70QdXSQ/0EsPsId9ZdKmn0bst@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3cJFsOj13y/NhZyInf5CzGCN6b8rv7zsLb2cy9sz5U+Rcm/Bk
	0ydikAYSAxQdwwU/da8nvqplYnNDD6wfcH5bLknck24M+YK8HWeccO+pteYNqk9DBVbTba05Pww
	imLggW0wpn/3E0kOhFi8Dvmhq0rFKr1dssYh4LP9exWSbR7V600qGd0XeA/5/Teh5eOqL
X-Gm-Gg: ATEYQzzeGyRPl5EA5n+tuDgH8C2rHSjcrbvNr5rt1Xzp2Yonixr4S3eGNCC8IYh+cfj
	SQnbAjEW/3kUGiE9il+AQnxc0IEkJzkqHrXPecHcKqR61R97uZVRkClCJSFclODPMgYjUWZ+Wb6
	M+3L/d4fRmC/CzAzofo4ODH17SoZBKfMydp3rr/JCVkN1o3lQA2Vm+NK7ysVp7ZweRXiPoZM4j0
	1SX620N122zeE50dbC3seUUGuF6McuJbuEBakFPmxlz/jfiXsyrYz6v3FjBScDDO1SLcktQZmAo
	8XPrAf2UGyX1grCuIrsWdsQkQbJ6skZJ4HdB9GTRmemHVG2zY1oEpbahw6reo02crrJNCY0yLml
	+1yNZmQFQvVgll05lmNkHtxv+b6xwC0YhyfpHBlGUICurK5VqIJZ9JIHyqV/Wby87emxWwBuQyV
	eZdNBbEeNq9BQB0NztP028x0/nK9C9fzzl+IM=
X-Received: by 2002:a05:6122:3a02:b0:56b:943f:44a2 with SMTP id 71dfb90a1353d-56cde31db30mr7674382e0c.3.1774306948721;
        Mon, 23 Mar 2026 16:02:28 -0700 (PDT)
X-Received: by 2002:a05:6122:3a02:b0:56b:943f:44a2 with SMTP id 71dfb90a1353d-56cde31db30mr7674309e0c.3.1774306948108;
        Mon, 23 Mar 2026 16:02:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99821c4sm31915271fa.27.2026.03.23.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:02:26 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:02:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: ocmem: register reasons for probe
 deferrals
Message-ID: <zmhswcc36in7msewf3a6e6n5x4omq2too6uc7sflgauu22535d@d3tbbgay4bmx>
References: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
 <20260323-ocmem-v1-2-ad9bcae44763@oss.qualcomm.com>
 <1654931f-630d-490e-9b37-cd953befb131@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654931f-630d-490e-9b37-cd953befb131@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1c685 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wV-IHFDicfKI5wJPFX0A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: je5yIz6R2UYPPap1_0AWMr9oUtLDE-Bv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MCBTYWx0ZWRfX8HlIqgTK2pKt
 cI8Jmwj1VE2i70X8HhgZzbO5T+vuQ1TxCzGfOWAVeEcHHZRvX1vIdOtN6CoMOs5dUMYADmvGZp3
 zXQygQ8r3i5pLA1MKe41EyDjssQUCsvd386JHmDC+TmjkKDSSE2QDvNkCLa9pSZ0ywNaFpLHnUS
 WMqM8gr9e7745O+IMnTeaW7NQ007OEd062w3dgAH9sDK+jf4LP3KllI8lfbd3l89hiMQDMWt0I+
 AWhEh2K8VQbR0AeUlJdKptgn3rMxGRPQuY3ndpFjn6HyITd5nGPcTfvI4V/asq93VlYtTY0I0bI
 BHs27DjQHmuBg3Iwv6y3dIJPY48jBU6TYC8MdKea7g1FM2hZVNMYqaYBZG3oGsctGLfKjg2HwQU
 PHxzZJq5KMQp7EZBvpyoEWjMmy/xmOVAWHKJkDfgEWcQ1GR5P18wGhEB7O9nv2+Ek5MjDGulLXc
 QrvrrpaQD/Y/pG9m1Eg==
X-Proofpoint-GUID: je5yIz6R2UYPPap1_0AWMr9oUtLDE-Bv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230170
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99439-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 839922FEB94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:16:54AM +0100, Konrad Dybcio wrote:
> On 3/23/26 2:20 AM, Dmitry Baryshkov wrote:
> > Instead of printing messages to the dmesg, let the message be recorded
> > as a reason for the OCMEM client deferral.
> > 
> > Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/ocmem.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> > index dd46bb14b7be..d57baa9cfa03 100644
> > --- a/drivers/soc/qcom/ocmem.c
> > +++ b/drivers/soc/qcom/ocmem.c
> > @@ -196,10 +196,10 @@ struct ocmem *of_get_ocmem(struct device *dev)
> >  	}
> >  
> >  	pdev = of_find_device_by_node(devnode->parent);
> > -	if (!pdev) {
> > -		dev_err(dev, "Cannot find device node %s\n", devnode->name);
> > -		return ERR_PTR(-EPROBE_DEFER);
> > -	}
> > +	if (!pdev)
> > +		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER,
> > +					     "Cannot find device node %s\n",
> > +					     devnode->name));
> 
> dev_err_ptr_probe()

Cool!

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry

