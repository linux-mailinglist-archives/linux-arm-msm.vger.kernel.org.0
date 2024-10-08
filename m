Return-Path: <linux-arm-msm+bounces-33500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A19942E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 10:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2D921C20E60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 08:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B91019409C;
	Tue,  8 Oct 2024 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="poReAUAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1813A878;
	Tue,  8 Oct 2024 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728376780; cv=none; b=iDKHg0+KyJ1l8ffvEqsrcKa63wAh5wIQ+Kq6zKjBz+rPDHkioiu0h5y6zznvIVNOan9vwgAoqCES9iCCxh77eXyBQxhTO1D+3RQuUSu2NbzTraBpiwIy1k60p1qY3AI0yn5U84IQ0AxiLgX3tiSYDfH4vV7I85kWf9tvYl6iT/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728376780; c=relaxed/simple;
	bh=el3Jfgqz5Ee0Ohga0gVxAjhG/jUzXJrFO3FZgDnM5pU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYul3Rn+fR6dGvR++ztmH1jonthyt6a/nCOjHWRXc9m5R9iPwUWSDKjhdm5Ax947n/Dwvr3jnlDNt1Jg0K6IAVYAbxXdZSELkNIQLsdFS2/TrVh5MLlchDueul5n0/CLnkSUZ6g592p+xlbFtbeUFh4rjbWmx1Upebi5i/+/JDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=poReAUAt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4986Vem7029351;
	Tue, 8 Oct 2024 08:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ktV+oEgEk735fqGUJ3HV9Nf1
	LzbdyGYvTS0Bz1S4KqQ=; b=poReAUAt74JB0s4vI/jPCAAMTNgCQo7Pnn2Ej2vy
	DqPQNaP5NdOGEKwJGxIO3I2UbLqIjTSXI8VqE6gXIbsoULHaTHwJS0hw2AcgM6XD
	d2reYVhYUlGbVBOJLt2qIpY+90TQI7kG/ZYg31lxXRMZuf5TfoIRuGO815JNowgk
	LzP6CgMKYAk2vADgTyIBq8fyKgy++EU3kAQBZ50MmqTmtDWEOSjMyaqGQrNQ9K7V
	kuGlg0Gc3OrC416DhjzmyuloZZck1OwRnmZj3Fkj1Mp3vLR+JiOdWX/mf01SktJa
	CqvnJ5shfpTqwOmmWyOTH+UamHMgm6PwadZCsI3HnXWB7w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424yj00b4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 08:39:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4988dSBm023339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 08:39:28 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Oct 2024 01:39:25 -0700
Date: Tue, 8 Oct 2024 14:09:15 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] firmware: qcom: scm: Add check for NULL-pointer
 dereference
Message-ID: <ZwTvsyUv+ajI5suH@hu-wasimn-hyd.qualcomm.com>
References: <20240920181317.391918-1-quic_wasimn@quicinc.com>
 <zxzjrnmoun6fm2tzrx6eaxbvy5kddvld7hezknt7k7mvfcqw5a@u3fgfo5yqw4q>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <zxzjrnmoun6fm2tzrx6eaxbvy5kddvld7hezknt7k7mvfcqw5a@u3fgfo5yqw4q>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rZhXaqflI_Xz-DHvjxtk5dEe8yOnuJSU
X-Proofpoint-ORIG-GUID: rZhXaqflI_Xz-DHvjxtk5dEe8yOnuJSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080056

On Sat, Oct 05, 2024 at 09:46:26PM -0500, Bjorn Andersson wrote:
> On Fri, Sep 20, 2024 at 11:43:17PM GMT, Wasim Nazir wrote:
> > Avoid NULL pointer dereference while using any qcom SCM calls.
> > Add macro to easy the check at each SCM calls.
> > 
> 
> We already have a way to deal with this in the general case. Client
> drivers should call qcom_scm_is_available() before calling the scm
> interface.
My intention is to check all corner cases and provide proper error logs
wherever the check fails.

There is no active case/example where it is failing but irrespective of
client (using qcom_scm_is_available()) or driver using any SCM calls,
want to add this check so that we don't need to fall into case
where we need debugging of NULL check and error logs are enough
to detect the problem.
> 
> Unfortunately your commit message makes it impossible to know if you're
> referring to a case where this wasn't done, or isn't possible, or if
> you've hit a bug.
> 
> > Changes in v2:
> > - Cleanup in commit-message
> 
> This goes below the '---', by the diffstat. I don't know why you don't
> have a diffstat, please figure out how to make your patches looks like
> everyone else's.

Will make this correction in next patch.
> 
> > 
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm-legacy.c b/drivers/firmware/qcom/qcom_scm-legacy.c
> > index 029e6d117cb8..3247145a6583 100644
> > --- a/drivers/firmware/qcom/qcom_scm-legacy.c
> > +++ b/drivers/firmware/qcom/qcom_scm-legacy.c
> > @@ -148,6 +148,9 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
> >  	__le32 *arg_buf;
> >  	const __le32 *res_buf;
> > 
> > +	if (!dev)
> > +		return -EPROBE_DEFER;
> 
> -EPROBE_DEFER only makes sense to the caller during probe. In all other
> cases this is an invalid error value.

I am returning EPROBE_DEFER so that any probe can use the return value
to retry while at non-probe place it can be treated as normal failure
(-ve value return).
Please let me know if anything better can be used at this place.
> 
> > +
> >  	cmd = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
> >  	if (!cmd)
> >  		return -ENOMEM;
> [..]
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> [..]
> > @@ -387,7 +397,7 @@ static int qcom_scm_set_boot_addr(void *entry, const u8 *cpu_bits)
> >  	desc.args[0] = flags;
> >  	desc.args[1] = virt_to_phys(entry);
> > 
> > -	return qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
> > +	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
> 
> I don't think you understand why this is written the way it is.
Here I am removing this check as before reaching here __scm variable is
already checked for validity.
> 
> >  }
> > 
> [..]
> > @@ -1986,6 +2113,13 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  	/* Let all above stores be available after this */
> >  	smp_store_release(&__scm, scm);
> > 
> > +	__scm->reset.ops = &qcom_scm_pas_reset_ops;
> > +	__scm->reset.nr_resets = 1;
> > +	__scm->reset.of_node = pdev->dev.of_node;
> > +	ret = devm_reset_controller_register(&pdev->dev, &__scm->reset);
> > +	if (ret)
> > +		return ret;
> > +
> 
> Why did this move?
&qcom_scm_pas_reset_ops is the first ops which might use __scm, so moving its
registration below smp_store_release(&__scm, scm) so that __scm is set
before utilizing in reset-ops.
> 
> Regards,
> Bjorn
> 
> >  	irq = platform_get_irq_optional(pdev, 0);
> >  	if (irq < 0) {
> >  		if (irq != -ENXIO)
> > --
> > 2.46.1
> >

Regards,
Wasim

