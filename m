Return-Path: <linux-arm-msm+bounces-96892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OZKD3kTsWkZqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:02:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6CD25D226
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C1CC301CFF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7D426C3BD;
	Wed, 11 Mar 2026 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esCZWqvc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irUjrfaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FFF376BFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212499; cv=none; b=f30uPB9zizlCSKxjXdWMOqmBtOnROep4wH5ZI/ZoBT7WF/0AyQWPSqwh+SiutzcV6/p0/98d+AaddiQSp7qo338iTs+MlI2GTUC1fy1f4OGugNFPmfr7suzzemaTBXQg9GmdKuJll9V5XWjWYG2vcJNCJR74ybnOPF/aks1jzEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212499; c=relaxed/simple;
	bh=0Vj7zH36XIQypijx8q4I2MAZcr980iZvzVhpEO7WfWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEPmrIDIywnNQG76WU/Lr/MdLjhttVH/87zQIYaonpVqyRUm4TKemk/Nkwh/EH7ekD1W21y09z7y2nq+1K5TsdD7tFO8WAkrXcmYrfprjjqQpZ9isMWSQHrbuUNomJoHKB2uXg8zBnUIQyg2v7I+GK1KPZVl5z3rq3RFTdfXEHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esCZWqvc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irUjrfaR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4Jonb3892938
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o/4xJz0Yvc4sIeR/ABqd8DDy
	fxVky4n3+HLCCDgiebQ=; b=esCZWqvcBhUDea7cQbKvHWALmSTNGgXc1h/CP8wx
	i9/b+LXQGNca84kscEs/ZFLqbyZwppP4+qDZWYqZoPD4bRDzeI7+2SCqbuyXAG/i
	ZbgiG5yFOZDxdDL59AspR7v7DfHoAaNP0KTMI9/9aFAfieqS+4rkqYSxRoI4ZL3G
	UtMdn/aYkik7RH5Sm/Q9mRnkUjDXYqIQnP9J/QtD3KyDQ010VcC1wB2gHSepKmaU
	4QPeDI2TkwuTVqk5JetAR5faKsm3ibdV961HkYb5zIGSzHZlCtixCfyN7Q3XYSQa
	eGN7gdiDLru5XnqQl62mZ5ZeljrfRYBpcKres/hYn7YQYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyuh7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:01:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae42659a39so617337875ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773212496; x=1773817296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o/4xJz0Yvc4sIeR/ABqd8DDyfxVky4n3+HLCCDgiebQ=;
        b=irUjrfaRHs6R0UUdCYeOtBoyDWLNo7tCpow+5ooTivDrK4068CHIV7r40aenlSlQFN
         y/rRPsyGqZW1uxjMbvYHTHwyl70BCkA+RehiIQq/8KoMITbH+ZKBjwitpuCUlDq+i/EC
         jSE3ua47gE4De7FEYSNtgqwejEPDOpUOCYdN0aaFK+i3oV3EFHRr+KYxDNKLQIWHWx/d
         fD76TkTU0RCk3FAmv/u3xGlBVr3GXOjwFm/haBqHszpCDITJ/BwmgYhuB8KnmZnH4x0W
         j1P11wnIAVnD3BZqdIVvkIW4C5vJlLpoP4BVXhFoCv0TTaK81Z/5wAOFJj1FHJK2ceGM
         rcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773212496; x=1773817296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/4xJz0Yvc4sIeR/ABqd8DDyfxVky4n3+HLCCDgiebQ=;
        b=ammjb0R/NzZ8CtQ3s9zDYqWMTdJD6tI8W17XQeWVCI+RQFzRjh5sitdygqDrH+w7/c
         B/Qwm79qX+g3Pyq+3XLjKjFMqiFNZPzlcKXZ7G4SDBYW4yVLXp1fB/4arNN6N7syxyLJ
         aYT70/CE61jJx4AG+RpgrVbxM7i7YP9nHjZd6QfFmR2uvmhxWNxdwLw2wM7gX6r11bbc
         XCwlwiz8nzvQO2HwhInFrz1FzSjcpZPwFMeOaFrgvjGntG8GN4MYbTRUEBbZ3LvmXL2H
         u/O2cuRKgdcHvAkQfc95MaWH7yRBziCd3uzeIXq+CXo6nML8lrj5S7b39/zGJg2QcHhg
         2eqg==
X-Forwarded-Encrypted: i=1; AJvYcCWg3iPEVhBiScgwf5kgR6AKXP+RiHQ1OyUxcPEEzdkzkDQFoZCLE8n3YM0DnjM9rUeho+0Qj4EcTnNvraU2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc6oWk5f7YdQnmuVbATGsedsgkxvhTfwH/ffNmKpQP9NSATzJ7
	EnAGVpeDGKB4F5GIDgWT7fQmtwrDcTj9ks7T0PdBsTARl5Hql2ZzKRnjDfCw5ijZ0hTU+aRCxKj
	W3jBkCGh31+kYwQ/CAue3N+41jmOVxYnQJ2ayAvB2UUttaDiJkvLDYnYWHmbFnEXlCFSf
X-Gm-Gg: ATEYQzwUFJ3j6cwUZSnnM7SX6ypnHCOX8dS+T7Zd0cFBQzfwq65M1spdCfXxvXnoY69
	F/lPqxT2mp6CfmWMmqsa5P14hp4GJJr800gokrwY1n6bQ/MhqLPAD1r3baCySRKVQ+SC3+bkV5q
	MuOCdsrfhFIwHQRJfJ0A68X7rKpNkRepLcdcL0m28g+rYYjDA26jl2IEFtxnL6xhHl5pBgxTjO6
	hQMrILlRnu86sna1kKe3KPZo7zQhffWrwtaTkn1KcUYU0tRuWUPpQHXSdo+IkxKvwAJmabe2dAj
	IRss2Id8cu8etnn4TC6jJkpaEWc3I+mRZ9kmBsT+sDdPlw7AOU36YzpbaRp6j8doEforxdptgrB
	u1J+bJch4GzcSa/BQK4Jnn2z+5cko1wY3uLK9tPu3TVvNE2gp
X-Received: by 2002:a17:903:19ce:b0:2ae:7ed6:46e3 with SMTP id d9443c01a7336-2aeae85af5amr16466105ad.27.1773212495471;
        Wed, 11 Mar 2026 00:01:35 -0700 (PDT)
X-Received: by 2002:a17:903:19ce:b0:2ae:7ed6:46e3 with SMTP id d9443c01a7336-2aeae85af5amr16465765ad.27.1773212494866;
        Wed, 11 Mar 2026 00:01:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae22287dsm12756085ad.12.2026.03.11.00.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:01:34 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:31:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom: pas: Fix the dtb PAS context
 creation
Message-ID: <20260311070129.7ywkj7pqrgzdrb6p@hu-mojha-hyd.qualcomm.com>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
 <sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl>
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b11350 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VHHHmejo1rfs0cIaTnAA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: EdP7HSe6RfmtqJs8nbTU-9_NkiKYLarT
X-Proofpoint-ORIG-GUID: EdP7HSe6RfmtqJs8nbTU-9_NkiKYLarT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA1OCBTYWx0ZWRfX93GwmJzHvJYe
 b1KJOyatiHCqHQKOKhr0xXhFdOWw323oKsr19s2izB1Am6X6NsVTOwe4JadEWNxDnS6fParFz32
 l5qRyUECZLRqcSjmuVXwIIEcsjOPmcU+HrwTPFlRQyABJNKBng2dOzsoXYFVvP/RNX9sP2kNwfN
 kscswxPWzkyLhCDLjc+6Eg6X4sif2YoJO1vofI8LFFEcd7uaFMtVYUutTFhkNUGHJnwNpFI9yTI
 qCF6n17QPAhXjGihYY/NPyTmegX3jdMkbu+kp2Jsg2MkYrdUnq7t/6g/gSZ4T1EUfdhnSi11D11
 ZxuQ/a/isjRwAoozIX2kbwgg/dZoPPv+d5TQ0DGft/GUiPAXm2SCPVV32l+pHcwjOshKSR2VH2n
 /MR80fVQL9DJumqrKnQSC/TDmqVzDphtMZYLHF9Mn/j16D0ufwubxW16DFsP9u+T/omKiOotuOO
 roBtuO/UFVx9oufvgwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110058
X-Rspamd-Queue-Id: AC6CD25D226
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96892-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 04:28:12AM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 07:22:04PM +0530, Mukesh Ojha wrote:
> > DTB PAS context creation should be done only for subsystems that support
> > a DTB firmware binary; otherwise, memory is wasted. Move the context
> > creation to the appropriate location and, while at it, fix the place
> > where the DTB PAS context was being released unconditionally.
> 
> I think here you have too much for this description. Judging by the
> text, I'd have assumed only the if(pas->dtb_pas_id) around the DTB
> context creation.

Yes, you are right!

> 
> > 
> > Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 36 +++++++++++++++---------------
> >  1 file changed, 18 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 46204da046fa..3bde37ac510c 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >  	return 0;
> >  
> >  release_dtb_metadata:
> > -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > +	if (pas->dtb_pas_id)
> > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> 
> Unrelated question, but why is this not handled by devres action?

dtb_pas_ctx is still managed by devres but here, we are releasing memory
hold by ctx->ptr.

-Mukesh
> 
> > +
> >  	release_firmware(pas->dtb_firmware);
> >  
> >  	return ret;
> > @@ -623,6 +625,7 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
> >  
> >  static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
> >  {
> > +	struct rproc *rproc = pas->rproc;
> >  	struct resource res;
> >  	int ret;
> >  
> > @@ -640,6 +643,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
> >  		return PTR_ERR(pas->mem_region);
> >  	}
> >  
> > +	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
> > +						       pas->mem_phys, pas->mem_size);
> > +	if (IS_ERR(pas->pas_ctx))
> > +		return PTR_ERR(pas->pas_ctx);
> > +
> > +	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> >  	if (!pas->dtb_pas_id)
> >  		return 0;
> >  
> > @@ -657,6 +666,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
> >  		return PTR_ERR(pas->dtb_mem_region);
> >  	}
> >  
> > +	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
> > +							   pas->dtb_mem_phys,
> > +							   pas->dtb_mem_size);
> > +	if (IS_ERR(pas->dtb_pas_ctx))
> > +		return PTR_ERR(pas->dtb_pas_ctx);
> > +
> > +	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> > +
> >  	return 0;
> >  }
> >  
> > @@ -838,23 +855,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
> >  
> >  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
> >  
> > -	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
> > -						       pas->mem_phys, pas->mem_size);
> > -	if (IS_ERR(pas->pas_ctx)) {
> > -		ret = PTR_ERR(pas->pas_ctx);
> > -		goto remove_ssr_sysmon;
> > -	}
> > -
> > -	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
> > -							   pas->dtb_mem_phys,
> > -							   pas->dtb_mem_size);
> > -	if (IS_ERR(pas->dtb_pas_ctx)) {
> > -		ret = PTR_ERR(pas->dtb_pas_ctx);
> > -		goto remove_ssr_sysmon;
> > -	}
> > -
> > -	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> > -	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> >  	ret = rproc_add(rproc);
> >  	if (ret)
> >  		goto remove_ssr_sysmon;
> > -- 
> > 2.50.1
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha

