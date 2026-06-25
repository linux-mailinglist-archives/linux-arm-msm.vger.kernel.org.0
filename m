Return-Path: <linux-arm-msm+bounces-114513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z5jkBOIQPWo2wggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:28:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 106516C517F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:28:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I9+IRu13;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z0i5akc+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114513-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114513-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD90D301C4B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBFD3D9DBE;
	Thu, 25 Jun 2026 11:28:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D193D9DD1
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:28:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386883; cv=none; b=Q+ZYdzllWf+9w2gRwLYq+MlaqKlg0GH5uSsfJN4JUyY6llrF2EUQKS+WoGZkQIr7BiA2j0jyZDlB0fMAG4+j4VPG2CWXpwP8XLYW9FQ7gthaETIE1wHouJKnGPDJMwa1DTgnWx4T+UOn26QTyQJCzI+NSgSbptGjhbEzA5+g/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386883; c=relaxed/simple;
	bh=Bxba/5pbhuxm6jHCTFXH4+Ef2EL7sTB3dS8WdSnxmUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzH41A2OCNuZGAq5SI6LJyuRDr9p4yGjQQtvVmfXXc/PTLEDF+PbHJd3DOJhBtMhZJ0xVMITSFCAXhLZRljkbMusUhkApowqFgsiU6jtVdQO9vx6owky7X+ay6pPE6LvKYXEgAtYT6+hGqBnwdsCfXacyq4SAkUBtGhcIDKao14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9+IRu13; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0i5akc+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9kAIc1921421
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gr0Qvdmx/yvPUGdt2AW+ppJO
	cLCEf5HIVR/FIamUh6c=; b=I9+IRu13mmE+YY6Zi6ImhXA7l765oV2PAksUBKWO
	UwV1tW7vmAhdrML7xtui4GNKkUCcscUKAU9V8H84Qm0gOiCtsF34S4UlsxA67wWw
	rW0cAKjjcwUFYO61puK2NJQEF2V/VmVkO7Fbsiz3aNeABU7M3+JqL+OQDnuaVxYa
	fui2MFPHmIALQbnb853+mZlGYJ+f3SYFCWhuM8srmlKV1CvdXWyiJuseNiV4Oqh0
	NI9XaoiFm8RHgRoUwx6ILvB7iEc8h7oHUbwj5hXUkssANQ6/pZSCWyjJXQ5S9BlC
	ofqMLm54D8wE7LEohbsl+FekZ/Tp1lfIXtf8zvFRPQY/KA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9xsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:27:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c84dc3574so775580eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782386878; x=1782991678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr0Qvdmx/yvPUGdt2AW+ppJOcLCEf5HIVR/FIamUh6c=;
        b=Z0i5akc+9Qoz1lLnBX4TGbOTiTYNPhy3f5cY1xv+aLpzrY2bzTm8pfEhzFwRCLDA+S
         FvGIm5K0eS/AGf3FbdL4//Si5kxZt9jU6a+1Wm5HbmguSs8y+8wBwLBTVBlJlxp4xw4j
         ZlI4QAadb9F5hegoIfGoYpmKuRRbfv7cwCbOdT4wUw6ootEGBq6ka4BtDeXWDaDD0m8Y
         8dSZqXPGlmm84BcWDYWpgNv6TUNK9oyFg6jdmZn3UQ/UY5SvK4UjH2lS4/d2YwNje9c4
         7muMCS4unLy6s5GwzMhrc91T6q8w1ckQmTR7f6vgN6b4zC1dPM+vyBFYj1th6cbdIpfi
         9wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386878; x=1782991678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr0Qvdmx/yvPUGdt2AW+ppJOcLCEf5HIVR/FIamUh6c=;
        b=LivGKjYZH+/8quo6H7PuOVUxU8ZWViUi6u6jDw5rjkOo+VKYiuehmx2kyfgbNYPp5k
         KyDy+UMyLUGkBfXuj/VA4P6OiYK2rJwPPQTTJ9z6YPG+QOBqqQ2G4HK/kEI9cHjZQhbt
         PaE/izB5nQFjrVaf4HfnypZ0JuWhi27+F+jNrKzIz/18detesi3ucxnL6Sn61KFPhZDq
         rSCokhxiGLPo/n4T6MU8HJtADctCRwkenDYq48UB6PJq8ctjKLpnzk4MOcS5OQBguMPk
         ullPv2RS1iIrukV84LVFfF3xV8adNbRcLFkPGotO7IyPXx1VPJ5apF3gLA8A4ARef6eg
         uf6g==
X-Gm-Message-State: AOJu0YwrNaDvBI3qFfJSAO5IQGzABzvzDmFmrL9O7yYjES5N7zGQkKOp
	Lg+WhXNDQt27vYrlx8nONADFhm5egoxNSFweHDQS4Dub7sX1hQ+kjq/5CP5JkbY+fnVLW0Xq83k
	239uCzkOBclJbcD9UI+uDmw7afCDsRr/g4ldCYQOMxbbHkOlEVvyj2yuhNvwEmxoCnnHo
X-Gm-Gg: AfdE7cmJSLXmA0UmmVKRS9tmgFYzB1vAf6NRPpYIRRRMpIbGjiVLRXptq5un/VsoUKp
	ZOFfrdo+BwTA8wZnRrbh2pKeiCMebEPcJLg9RsWwQcTRaZ/jgQjI525O5vRwWsLAsldldsXgsA2
	9a0L8gKYchUTRo02+GYx9Pkrb6O6TpN5KZkWE8H1opZctBqcMBfvGbgNyBLW9mARObYctFIKhaZ
	MK5AZFdal/LspHk/YFUCVcULc9xKLIkFnAcRfdCzdecSwuLXRnuDSiepdGyzNfvDTiMeReKuOO9
	z7yU8o+94ilWWXdMOobIXUd1lo7uy9tDdpLfRuLx5RvEALlRjMntbMolvS1mdCmiG8JacfmBPkz
	1ZFaA3kfTW/O4uoyPo6p158D90L9fnuAkv4bLLQ==
X-Received: by 2002:a05:7301:eac:b0:30c:ea:ade0 with SMTP id 5a478bee46e88-30c84d7404emr2368609eec.9.1782386877911;
        Thu, 25 Jun 2026 04:27:57 -0700 (PDT)
X-Received: by 2002:a05:7301:eac:b0:30c:ea:ade0 with SMTP id 5a478bee46e88-30c84d7404emr2368569eec.9.1782386877078;
        Thu, 25 Jun 2026 04:27:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8afca8sm7589254eec.17.2026.06.25.04.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:27:56 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:57:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [PATCH] firmware: qcom: scm: Fix resource cleanup on probe
 failure
Message-ID: <20260625112750.t5pbesjfftvslu4r@hu-mojha-hyd.qualcomm.com>
References: <20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com>
 <CAMRc=MeBi1osB24xTLOjuBYKfrb3a+OCcW5XSkcDkUavU+x63g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeBi1osB24xTLOjuBYKfrb3a+OCcW5XSkcDkUavU+x63g@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 0vWiH6kGE16VbuHJCWvJZWaS2P4AuBn_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5OCBTYWx0ZWRfXzxfmvgCVxUtm
 oETQtA8lNeiSB+ySU5BBjZAKTpuJ6I94EWLHZ04sS/SdLi22VyTig0QoPaJF0Y4imA/QzDBHtIC
 tp3YzwhvJyUdx4EIDcQqSVFAfiOYl2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5OCBTYWx0ZWRfX5aniODcCOyL6
 lSccPGd45WXFH+ZJ6TSaFNh4b4yrYqYxaL6QYF93eefNWVzGqwgLvVgeEEPRJwp/mMcY+0jweUj
 Db5amakUc8BVHtK1vjY6CMMRiULDn+mYVWehW2TmKi5eMqiqFDS9dYCBJhB/Wg/swy6XODlL9tR
 M8snSN7hgsz+VWt1t3BeK66Wy4nwj/59rN+TgP+7FiYOtxBMnCm50csSnULHohLGl98sY5pVVIF
 iQFahxxZCVJI+bgzVF56vkl//Hq2veaNPmwpk0zGcMVmiqf8WuqePyqJwpnyW6BUo+7Y8Qt+LZj
 UTUxciZIZvLKhwCXnn7GyDEVawm/3t/6lLJc15vVhRC4XnSnNVWghmPh4gM0y3pnuLv5AHi2A6Q
 8p1pdv3wfXzYWUfX+HmM56/VfASrjiz/OVHWz7272dMMZXdEFQVaDLP2R0AhXhog4oGLMsKYSAL
 r/iH+yPVmbIOEXmhYhg==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3d10bf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=dDHIklOVqpKwSO8nkokA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0vWiH6kGE16VbuHJCWvJZWaS2P4AuBn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-114513-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 106516C517F

On Thu, Jun 25, 2026 at 03:06:07AM -0700, Bartosz Golaszewski wrote:
> On Thu, 25 Jun 2026 11:36:44 +0200, Mukesh Ojha
> <mukesh.ojha@oss.qualcomm.com> said:
> > qcom_scm_probe() acquires two non-devres resources that are never
> > released if probe fails or defers after them. of_reserved_mem_device_init()
> > adds an entry to a global list with no devres counterpart, so a retry
> > would add a duplicate entry and leak the original. qcom_tzmem_enable()
> > sets a static qcom_tzmem_dev pointer and may set qcom_tzmem_using_shm_bridge;
> > without cleanup a probe retry finds qcom_tzmem_dev already set and
> > returns -EBUSY, permanently preventing the driver from probing.
> >
> > Introduce err_tzmem and err_rmem goto labels at the end of probe to
> > call qcom_tzmem_disable() and of_reserved_mem_device_release() in the
> > right order, route all subsequent error paths through them, and add
> > qcom_tzmem_disable() to qcom_tzmem.c to clear the static state.
> >
> > Fixes: a33b2579c8d3 ("firmware: qcom: scm: add support for SHM bridge memory carveout")
> > Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> Hi!
> 
> These are two separate issues, I think you should split the change into two
> patches.

Initially, thought of doing this but modifying the same goto
level again added in the previous patch was not looking nice.

> 
> > This is reported on sasiko review as existing issue here
> >  https://lore.kernel.org/all/20260624192213.C82691F000E9@smtp.kernel.org/
> > and it can go independently.
> >
> >  drivers/firmware/qcom/qcom_scm.c   | 42 +++++++++++++++++++++---------
> >  drivers/firmware/qcom/qcom_tzmem.c |  7 +++++
> >  drivers/firmware/qcom/qcom_tzmem.h |  1 +
> >  3 files changed, 37 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index ba5cdeed8a04..cb3d776fa645 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -2883,9 +2883,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  				     "Failed to setup the reserved memory region for TZ mem\n");
> >
> >  	ret = qcom_tzmem_enable(scm->dev);
> > -	if (ret)
> > -		return dev_err_probe(scm->dev, ret,
> > -				     "Failed to enable the TrustZone memory allocator\n");
> > +	if (ret) {
> > +		ret = dev_err_probe(scm->dev, ret,
> > +				    "Failed to enable the TrustZone memory allocator\n");
> > +		goto err_rmem;
> > +	}
> >
> >  	memset(&pool_config, 0, sizeof(pool_config));
> >  	pool_config.initial_size = 0;
> > @@ -2893,16 +2895,20 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  	pool_config.max_size = SZ_256K;
> >
> >  	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
> > -	if (IS_ERR(scm->mempool))
> > -		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
> > -				     "Failed to create the SCM memory pool\n");
> > +	if (IS_ERR(scm->mempool)) {
> > +		ret = dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
> > +				    "Failed to create the SCM memory pool\n");
> > +		goto err_tzmem;
> > +	}
> >
> >  	ret = qcom_scm_query_waitq_count(scm);
> >  	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
> >  	scm->waitq_comps = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq_comps),
> >  					GFP_KERNEL);
> > -	if (!scm->waitq_comps)
> > -		return -ENOMEM;
> > +	if (!scm->waitq_comps) {
> > +		ret = -ENOMEM;
> > +		goto err_tzmem;
> > +	}
> >
> >  	for (i = 0; i < scm->wq_cnt; i++)
> >  		init_completion(&scm->waitq_comps[i]);
> > @@ -2912,14 +2918,18 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  		irq = platform_get_irq_optional(pdev, 0);
> >
> >  	if (irq < 0) {
> > -		if (irq != -ENXIO)
> > -			return irq;
> > +		if (irq != -ENXIO) {
> > +			ret = irq;
> > +			goto err_tzmem;
> > +		}
> >  	} else {
> >  		ret = devm_request_threaded_irq(scm->dev, irq, NULL, qcom_scm_irq_handler,
> >  						IRQF_ONESHOT, "qcom-scm", scm);
> > -		if (ret < 0)
> > -			return dev_err_probe(scm->dev, ret,
> > -					     "Failed to request qcom-scm irq\n");
> > +		if (ret < 0) {
> > +			ret = dev_err_probe(scm->dev, ret,
> > +					    "Failed to request qcom-scm irq\n");
> > +			goto err_tzmem;
> > +		}
> >  	}
> >
> >  	/*
> > @@ -2966,6 +2976,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  	qcom_scm_gunyah_wdt_init(scm);
> >
> >  	return 0;
> > +
> > +err_tzmem:
> > +	qcom_tzmem_disable(scm->dev);
> > +err_rmem:
> > +	of_reserved_mem_device_release(scm->dev);
> > +	return ret;
> >  }
> >
> >  static void qcom_scm_shutdown(struct platform_device *pdev)
> > diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> > index 0635cbeacfc8..3f2b782f4a94 100644
> > --- a/drivers/firmware/qcom/qcom_tzmem.c
> > +++ b/drivers/firmware/qcom/qcom_tzmem.c
> > @@ -518,6 +518,13 @@ int qcom_tzmem_enable(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
> >
> > +void qcom_tzmem_disable(struct device *dev)
> > +{
> > +	qcom_tzmem_using_shm_bridge = false;
> > +	qcom_tzmem_dev = NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_tzmem_disable);
> 
> That being said, I think we should just modify qcom_tzmem_enable() to silently
> ignore subsequent calls. It's meant to be called once and stay enabled so I
> suggest just removing the check returning -EBUSY.

So, you meant to let it call twice..even if it is doing.

> 
> Bart
> 
> > +
> >  MODULE_DESCRIPTION("TrustZone memory allocator for Qualcomm firmware drivers");
> >  MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
> >  MODULE_LICENSE("GPL");
> > diff --git a/drivers/firmware/qcom/qcom_tzmem.h b/drivers/firmware/qcom/qcom_tzmem.h
> > index 8fa8a3eb940e..0b0f26d4e22e 100644
> > --- a/drivers/firmware/qcom/qcom_tzmem.h
> > +++ b/drivers/firmware/qcom/qcom_tzmem.h
> > @@ -9,5 +9,6 @@
> >  struct device;
> >
> >  int qcom_tzmem_enable(struct device *dev);
> > +void qcom_tzmem_disable(struct device *dev);
> >
> >  #endif /* __QCOM_TZMEM_PRIV_H */
> > --
> > 2.53.0
> >
> >

-- 
-Mukesh Ojha

