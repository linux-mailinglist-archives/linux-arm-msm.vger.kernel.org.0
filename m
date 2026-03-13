Return-Path: <linux-arm-msm+bounces-97601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPlXNTFItGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:24:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D5128811D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ECF8316E651
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB0C3CC9F8;
	Fri, 13 Mar 2026 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9qoLK+G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANFXl5vc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293953CBE92
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422451; cv=none; b=bA0yBFJl6rC3PSafaVI4OwT+MOB1mJvT4VC8yIL4Lfdtq8HzKCWDEbLI4P3f5COYfChbBPZj7NCK751M6S01syMeu9IApkVprJMFcmCvEytnNwtzQT+tjIfCBUEZ5TkwARvSNHHhXC5PBMcXTDbjzOzxjVYZIZ6a6UpVJ6IUwv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422451; c=relaxed/simple;
	bh=D4TMMmmTFOOKh5r/I379J2oZ1r54N5E5okpEDVmLmSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYzPuejzLjq74RyBxmYAKlOFDoFnn6/BHOUsRlVy0APfZmcADuWsygRu2KXMRzn9PpIIjRWQ3HiiuCwc5uyY/MgVmhXacQHE2425Mh3fijCFojL+xiliMD26DNwEu4tIvyRYtXXJ4QvESUsK33GIMtuaQsbPB0xXtUnfcu68fBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9qoLK+G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANFXl5vc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAsKEm526847
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pq2eKLqqkSS0N1cDySQHlqRn
	woOKv4S8kOtOzs0RTbU=; b=L9qoLK+GqQkmY9/AGoOtiyhR/65YmjRWqpCEi6Mn
	W2pFJO/D7UqDAb4qOHu4DVrt2MLFpSvnpNgN1NWdx35E+nXmjB06AfcEtAJ7pveK
	iomu1+JZlXzy6roU7jAlailZKya2ME4IKMlkd2m9x/NWNKU1e+i0PIzZsgsoDZye
	LxtARwjLnIpl6ImM4MBOSN5s9ERs52db5/32VS6nHcyHquPs2iyWTtXPRjq3lnrZ
	xI/wkW03hz7TwallTvNPFobfwPMFXedEyAQgAxGkVBhNeliYi/RBcVqr9cecTR9V
	Da/N3HqaDwzF8x1ZUwMOdJ6Bd8mFZe9xCxYc7NH6k/chog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84s9tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:20:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd91c0262fso1574777885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773422447; x=1774027247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pq2eKLqqkSS0N1cDySQHlqRnwoOKv4S8kOtOzs0RTbU=;
        b=ANFXl5vc8S2zoEVBa22L7uBuYlg5uGJw58WccaegTkUM98DE2c8/3ekdPZ5lPYpi1i
         OqyOStRhv1t6yjCd7knKZahahoeL75KnH1FwJbfIKpHyqzmQccpS7NJGu+5f+/fF2L0O
         8oXgxZdi4JsTOhd63F9K3RRE63EZ1E1OXZA++YLUwbDLC62bDJ24YVZ17M/0mVvpdx46
         O8jn4s8/2gnruPoRP8Vq7HJCGNOacdSnIuGVis67OXazLTIj04aBlC0jCd5v/DNXP0nZ
         H0oMAhzsZo0omWtMlkPWzJ2esG53ZtVGHYaIWcgjoAG+59RFKoQmUlbcbfraVvfC+pL8
         g+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422447; x=1774027247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pq2eKLqqkSS0N1cDySQHlqRnwoOKv4S8kOtOzs0RTbU=;
        b=KYdWcraOhuOPoCLfjI5JJrbMpqPgucqBbyCT6dPS24HGypdQ6qW44Tl6Jsi98QpXBU
         GiFahftRyDDdIh1+C3VFcJpC4fGs4262tqPAI7WFNFPhEbati+0MwReA/W60PEPE+rFP
         Xjd8cjDuXt55xz85XtymXJugLP/7ig1g9GwVKSpckk884YWP2tEWOtmJRQy1ZxYmGL3P
         LzfeZ5pcoYmH4FvIQ8u4zXsVDiU3aObqbbtIBdASdV8MDK5AXqAdDRU+rDIbcvUYy2L0
         8+uF4FZW7EMIIvlJ8Le5OgkwqAakkwG+7o90CCEdKJ69Q21fz7AyE/Z2lOhGmHZ7Tz2y
         0TbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGjD36nL53z6oFC1TARvT00sDPU2gc8bIJlPs9ilHcgnILNFMrm/AYJDlefyU/DQvkjO9dd22XDxqTM6Si@vger.kernel.org
X-Gm-Message-State: AOJu0YwORXbdvcgBFmwKGzFeFa5XuaxuPs5ChePb6BAUyiS/8J5vtjrP
	fnRUeUhfWbJuINRedFhT7RMgwV/8QLeW1iJ2PNM7MDKzOtPliqnCG59ELdvQYxzZudfQG0DWEUH
	vqb2fScyN5KcThh5hj8sH1LbxT9qwOMjmIyqee/OKQtV3paDztK+59MgSiyOUiVTVfATq
X-Gm-Gg: ATEYQzw2NlvdCU8hqHweIjxRJQr99ekd466C78ApY5Deol1ysxPwZ+yTr5DyMteJ3bO
	MOO6Kfyy7YaGVJks+B1G3QJj5V19+rReaUxrz4SMjBZWdgXteQT6aS4YquunlWLuXcwESZ9+TUS
	gO+G8MhIhOqPTfdNKI6BSHSGEOTA5GEkxUje9gpgS4wTW1Ikc5JNQHsYeJBPUFNNw9+BuRLC0rM
	e1oGkImG33i0GH6EJDEM87QX9f58amCoA0aU5liJCpm3kP2X9zHrmX1Ap9fDDlwR6EsRKo7mdbo
	mR+n4r2+QbRbi9m0UTKy9i1He+Q5kJzrMOJ5/FR1d0+dzsgDvPJkcKZMQ3E0QtfCITCDN1SZCxX
	jNpwDaXYu4BzLSvhu7OPMyC5/IKc+0/k25mS+19Cz95R189kNWx0SyFoMXGIztH4an3gm+SSWHK
	WzlIG+DnmSWPyHRFtmfhDc5hFa+Pk4L2dGZok=
X-Received: by 2002:a05:620a:40d3:b0:8cd:96e5:f7ca with SMTP id af79cd13be357-8cdb5b1ae9dmr555025985a.51.1773422447266;
        Fri, 13 Mar 2026 10:20:47 -0700 (PDT)
X-Received: by 2002:a05:620a:40d3:b0:8cd:96e5:f7ca with SMTP id af79cd13be357-8cdb5b1ae9dmr555021585a.51.1773422446687;
        Fri, 13 Mar 2026 10:20:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162ba3sm1653685e87.47.2026.03.13.10.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:20:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:20:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <3o4qzyy46wyw3rxxx72t5uy6ww37vtbbywmaig2zplmsklevbi@k3n5jalqjqqp>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
 <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
 <uwqpxa4jqf3k3pbcf7mkszzuhrqulich4iujiejtuey4vrtg5d@umlik2vhdkvi>
 <20260311084918.q4vonsudasta7dll@hu-mojha-hyd.qualcomm.com>
 <55oglwp3ejolkjyksn4am2dnx43k7axf5zl6tevkuuuww3n33u@jcffxhtaxxaq>
 <20260313055718.yyb5ohjdql6resdv@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313055718.yyb5ohjdql6resdv@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b44770 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=k1DDLxQpEMSJglwgNqIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzOCBTYWx0ZWRfX0g7q8AURMZiM
 KDcKrPrvhW9Xig517z3GwnbT8lDJMYo44kSa5sVCe6AzKcniNJWe/oXCl1m+XCDawnMlbvSl97d
 aKUfAurMYj1fZ78n1EQSOn5pOpxw/POV4gY0tahqJylae+NiXgEBgqz66lMwl9tPlV1qMoYr5ED
 7jOIzq2jtjHeOuvuHchfM+6TuE4QStsRqTXRDHWhWQzVE95fhWJI723EZIpHtzgg//9BoF5zqSj
 oqj9aFs48l9mDFLUrh56BiyR+aoUeoGk++96mkpy/URgG09w7K+o3lgWRz56i6c+gJMY6NsYE0i
 kbM708EQoZnqS5ltPO0oVpxGCMI5t85wmQcrYfkOToOQd7d1SMkF89F5F667ieSaK71jHKS3vja
 v7KOfC56AwathuJIIMzou5Jmr3gPLCkn03nOvcL8sqMCWIlsMcaox0n36f+W2F9MVDD5yEV0+AY
 usFmUZO0JuWYSUNtXZA==
X-Proofpoint-ORIG-GUID: SZvB45Xu9rvRXAXDTAjxR_qz95Ee3aTc
X-Proofpoint-GUID: SZvB45Xu9rvRXAXDTAjxR_qz95Ee3aTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97601-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55D5128811D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:27:18AM +0530, Mukesh Ojha wrote:
> On Fri, Mar 13, 2026 at 05:40:22AM +0200, Dmitry Baryshkov wrote:
> > On Wed, Mar 11, 2026 at 02:19:18PM +0530, Mukesh Ojha wrote:
> > > On Wed, Mar 11, 2026 at 04:34:53AM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, Mar 10, 2026 at 07:22:05PM +0530, Mukesh Ojha wrote:
> > > > > Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> > > > > Peripheral Authentication Service (PAS), always map the MBA region before
> > > > > use and unmap it once the usage is complete. This behavior was introduced
> > > > > to avoid issues seen in the past where speculative accesses from the
> > > > > application processor to the MBA region after it was assigned to the remote
> > > > > Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> > > > > before handing control to the remote Q6.
> > > > > 
> > > > > Currently, most Qualcomm SoCs using the PAS driver run either with a
> > > > > standalone QHEE or the Gunyah hypervisor. In these environments, the
> > > > > hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> > > > > Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> > > > > reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> > > > > violations cannot occur.
> > > > > 
> > > > > However, when the same SoC runs Linux at EL2, Linux itself must perform the
> > > > > unmapping to avoid such issues. It is still correct to apply this mapping/
> > > > > unmapping sequence even for SoCs that run under Gunyah, so this behavior
> > > > > should not be conditional.
> > > > > 
> > > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++-------
> > > > >  1 file changed, 38 insertions(+), 10 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > index 3bde37ac510c..033d618ccba9 100644
> > > > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > @@ -138,6 +138,13 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
> > > > >  		return;
> > > > >  	}
> > > > >  
> > > > > +	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
> > > > 
> > > > Which will be called once per segment. Move this to qcom_pas_minidump()
> > > > and call iounmap() afterwards.
> > > 
> > > Good eyes!, Ah!! my bad.
> > > 
> > > And moving it to qcom_pas_minidump() will cover minidump cases and
> > > fallback cases to full dumps if minidump_id is mentioned for a
> > > subsystem. However, we may miss mapping for pure rproc_coredump() case
> > > when the framework assigned .coredump = rproc_coredump when vendor
> > > coredump callback is not provided when subsystem does not have minidump_id
> > > mentioned. Do you think writing qcom_pas_coredump() wrapper over
> > > rproc_coredump() will be fine ?
> > > 
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -141,6 +141,11 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
> > >         memcpy_fromio(dest, pas->mem_region + total_offset, size);
> > >  }
> > > 
> > > +static void qcom_pas_coredump(struct rproc *rproc)
> > > +{
> > > +       rproc_coredump(rproc);
> > 
> > It won't be that simple, most likely. You'd need to call ioremap_wc()
> > before and iounmap() afterwards. Then it would make sense.
> 
> I meant the same with the help of wrapper..
> 
> > 
> > And alternative option would be to use
> > rproc_coredump_add_custom_segment() and add a custom function which
> > would perform ioremap() / memcpy() / iounmap().
> 
> This will involve map, unmap called for each segment.
> However, I feel, it will be inefficient compared to qcom_pas_coredump()
> where, we can map only once.

So, let's have the wrapper.

> 
> Thanks,
> Mukesh
> 
> > 
> > > +}
> > > +
> > >  static void qcom_pas_minidump(struct rproc *rproc)
> > >  {
> > >         struct qcom_pas *pas = rproc->priv;
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> -- 
> -Mukesh Ojha

-- 
With best wishes
Dmitry

