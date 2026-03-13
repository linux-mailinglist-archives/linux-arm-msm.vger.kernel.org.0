Return-Path: <linux-arm-msm+bounces-97312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHwyIk2ns2nOZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 06:57:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B1127D839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 06:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9B673015B4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 05:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0586132692B;
	Fri, 13 Mar 2026 05:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wf1d9nnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgE5LBTV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB1530E0DC
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773381448; cv=none; b=p7bemiGxsH+Zx5XucSOIrcCFuDTYk7m0yHMDaDhTLX2t7hMHk0uTKnqInM9ypnnTPRAFfA80bQhYmHEG1wOZWrSSjOk/FOjJ+yrxeltuesMrzHdlWuZfVHc/SWTrYxJKmQkTjPfnCNFo4OxDqOEbAjTj91/gBofQqkC1bhnPIok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773381448; c=relaxed/simple;
	bh=zwT6xDusC6j5T/vrwWHmVMovFMdOS8MfKQEkest5f0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDCKxklWty+ugW6rTJRExXUyckMfIE4VJkKbiXn0wrbGN0kNIAF8YaQY7U3ZD7Xy4XGAhrtM25x12B0TohM0tSe2oAMiU7CbI/Yo5RfLzqXZvkp6i24Q4BCp1W0pNtQ8nwnKUUDugWIphNQayYGhp+wwvebtcsbiUzEbBIijX/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wf1d9nnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgE5LBTV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tdQ9668691
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zJrnE0PGCzj+u4RuLR8bcNal
	PPmbYduIhnoKk3Zb+sM=; b=Wf1d9nnGXf2+t7b42v6U0846GBfFy6ZN9wMTSu3f
	m1yfvFoNYE7f718t3rZc+PpAit5Eo+Ko43PONxpN1jE3XDCWgAU8fMxHbQ9JGaXn
	oPgJ4jT7Zhs5fU6vPyilVUJrK516Aoa04iw62zvUYyYURKA9TmfyphYqN9IR9PU+
	Nh2ymxtdWjnoKBKnG/QIE31uEq9tdIv3nxxghoEIItt0VIltmHx8oudG5QBGb7O6
	FGyFfuSrDOpmKQ55+JhfewwUZdqt0mjrSN9zjWT6pOl/ioGvOuCAwo5cbbPMj6G3
	Hne3yIX/sWbLhenXQa4epfApvvsB/uyWKlVxC1t1+Qpx3w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q4qu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:57:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aecfe69196so2167685ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 22:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773381445; x=1773986245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zJrnE0PGCzj+u4RuLR8bcNalPPmbYduIhnoKk3Zb+sM=;
        b=BgE5LBTVgUrnISZoGYBVhjsbJwQj/wiFPJXtzWxrxS8dQzLqa/uo5qmL3nTDOINQcK
         4qtBs9+hBjY14keyiOsY18LmQZHiuP/YTKU88mHD1TzlA3VdkKMgPMlr5fpHRC47YPpA
         noNlqP+oyWgNi7n9yap3KMfVwjzBklx3JbO75NWSTckJWwnVUx1GLGos/2bZ4tki7CDK
         lG0cXEWagqmm0NpVkxkGkIRDdxXGxG+D6e3D9Ktj8JHf+TdJKXfLnSbFE5Ihp1aanl0h
         UFdq0cDVUiLf0CnSoogdz1eJaiyIntOxTNBPosJWZ1F6SkDFVFvP+WzEMaCmqVOT/QCt
         wFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773381445; x=1773986245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJrnE0PGCzj+u4RuLR8bcNalPPmbYduIhnoKk3Zb+sM=;
        b=UDgmjG7KXBDRdcSCANDEFvtqjz6jwLKr0/w6y8EuNgRO5IbHkVNcEsPlab/N7ep6B4
         xoktZESQxRzKCWHXwTGlo6OWToHgf4DkaG5pD7qwEJqMggBC0H/1zFEC/HkZdqTQ7oaF
         LxfoykHyiTEauKWWVtW8J1djkNYJ5gjyzFEgM3CfJBjfjI0nuhgXIFFAHWgGIH3zefGy
         QGQgJCcUn/zN2RCQcSvpWkohqu49cnlLoNLJ+TfUwgYLIYkSG0EnGgByQUuC57O0dya7
         KFk1JTUszNOYQ9Y8eepw/4R6Mlh6xzKPbwgmO0Dlc8aXRMweymS6Sk9qRNooTFwigmi7
         /qtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+hE7R2fH9TxsoTENWqxmYZ9eKP93TuPckPqHXq5nqmx95C7CQ2F/NVW6NmQugO2u+XSw5j+LzVD1KQ9Ep@vger.kernel.org
X-Gm-Message-State: AOJu0YzziDWYawPLxlkFqoSH1o4kZ+aQ16ylNb5UjXJhpZuv1zmCHwOs
	tmf12ZSbRpCCCmp66/azPuyZXDMdEcvDW6qNbhbUp/+TixSHwzTKpNHKsEvEAqeC/l3TkZXBb+t
	zozfmojd/Iu0GMewoB4jU9XkkIWPqOMVETbhU6avlTqBbnQXwM4MzzsYzm7dgvhv+xi//
X-Gm-Gg: ATEYQzwH96nQhz5rBOsKfSisqvYEJZQFM8oXHPq9M+qTt6W1jFDoNCi+1aVkxCt8tU6
	E8s4vmCm6PCaU2umT6GSX9QROu+j6MbA5i/XxkzkVA8bOLVNPJPNAJ/pbE4NdDj8nfB/hO01RwO
	obvGm6U4cJSaMoDMmHcUzVz246z+5oQMszum4/RS8S+l8Q60TabQcnwtu2G56+M9YGj/Xi+Xc91
	9XWv/bKZzJh+hUKwYkq96Gcei7w4UArd9E8w+PNnu+jAd3BJPMPft5R1l3M3NjyXPnf7mgI5LyS
	qxn2hTRYOcgNu8+NCQue0vf3N5YCApnrg6992COiATHyXiH/vz4awBFB+STEW4sstVDjuaCG4VD
	WIxmo6a6rOgCjUsRmkgJtfFtqsKH8BCkWDqN3EMM/AticEa0R
X-Received: by 2002:a17:903:98d:b0:2ae:803b:d3cf with SMTP id d9443c01a7336-2aeca96057bmr20103805ad.18.1773381445267;
        Thu, 12 Mar 2026 22:57:25 -0700 (PDT)
X-Received: by 2002:a17:903:98d:b0:2ae:803b:d3cf with SMTP id d9443c01a7336-2aeca96057bmr20103595ad.18.1773381444731;
        Thu, 12 Mar 2026 22:57:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece6198dfsm10158405ad.29.2026.03.12.22.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:57:24 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:27:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <20260313055718.yyb5ohjdql6resdv@hu-mojha-hyd.qualcomm.com>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
 <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
 <uwqpxa4jqf3k3pbcf7mkszzuhrqulich4iujiejtuey4vrtg5d@umlik2vhdkvi>
 <20260311084918.q4vonsudasta7dll@hu-mojha-hyd.qualcomm.com>
 <55oglwp3ejolkjyksn4am2dnx43k7axf5zl6tevkuuuww3n33u@jcffxhtaxxaq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55oglwp3ejolkjyksn4am2dnx43k7axf5zl6tevkuuuww3n33u@jcffxhtaxxaq>
X-Proofpoint-ORIG-GUID: BkwSS3rKZy6CV7LZtXC33_gORcxJlWtQ
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b3a746 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Lsr5OTPFVPdoxJcc1pYA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: BkwSS3rKZy6CV7LZtXC33_gORcxJlWtQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0NSBTYWx0ZWRfX0unZpo5VDO3z
 5Otc8ApkyBwJlp3Ia065AMMlVDk2H6njp6W01clSHgTGGs1v8M14m3QP30CUInn+JfX/lz71AOF
 HRzmZCB9FTf18qbG0/jYlCay+DqodSJ3apkU7Q66Ls+NUEzGZWOsfWzjUFjRNWVnAcZWTtoybqX
 wa4rWDJ7f96BBB0xx6B+NnXP6qZs4E72nc8gXnImfJLkhnXd/jpMvpcEP/XGJ5GBJlQ22jVLn21
 czstXnAanpYG48S5L+oxD7zdFrPH/l+wNfS0jGkJwqjlPCN0DLzZEelDqTvyxE3qHY03GZMpT+8
 5OwsauHeY4n/lVMRvtU5AB86kheXbsDbPAw5Ld1Hhah/1hDahmuLqI7mq1m6I/W06nX1OCaXJck
 MkmrWAUlbH2fIwNpvb7w8AGRgwuHvHczKs5qoLdtueay98WxtsXSeRf/8NzPoQSgZ/8XyWYxkun
 zfUnzU0ENrgmgAyN/SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130045
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97312-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70B1127D839
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 05:40:22AM +0200, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 02:19:18PM +0530, Mukesh Ojha wrote:
> > On Wed, Mar 11, 2026 at 04:34:53AM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Mar 10, 2026 at 07:22:05PM +0530, Mukesh Ojha wrote:
> > > > Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> > > > Peripheral Authentication Service (PAS), always map the MBA region before
> > > > use and unmap it once the usage is complete. This behavior was introduced
> > > > to avoid issues seen in the past where speculative accesses from the
> > > > application processor to the MBA region after it was assigned to the remote
> > > > Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> > > > before handing control to the remote Q6.
> > > > 
> > > > Currently, most Qualcomm SoCs using the PAS driver run either with a
> > > > standalone QHEE or the Gunyah hypervisor. In these environments, the
> > > > hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> > > > Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> > > > reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> > > > violations cannot occur.
> > > > 
> > > > However, when the same SoC runs Linux at EL2, Linux itself must perform the
> > > > unmapping to avoid such issues. It is still correct to apply this mapping/
> > > > unmapping sequence even for SoCs that run under Gunyah, so this behavior
> > > > should not be conditional.
> > > > 
> > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > > ---
> > > >  drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++-------
> > > >  1 file changed, 38 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > index 3bde37ac510c..033d618ccba9 100644
> > > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > @@ -138,6 +138,13 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
> > > >  		return;
> > > >  	}
> > > >  
> > > > +	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
> > > 
> > > Which will be called once per segment. Move this to qcom_pas_minidump()
> > > and call iounmap() afterwards.
> > 
> > Good eyes!, Ah!! my bad.
> > 
> > And moving it to qcom_pas_minidump() will cover minidump cases and
> > fallback cases to full dumps if minidump_id is mentioned for a
> > subsystem. However, we may miss mapping for pure rproc_coredump() case
> > when the framework assigned .coredump = rproc_coredump when vendor
> > coredump callback is not provided when subsystem does not have minidump_id
> > mentioned. Do you think writing qcom_pas_coredump() wrapper over
> > rproc_coredump() will be fine ?
> > 
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -141,6 +141,11 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
> >         memcpy_fromio(dest, pas->mem_region + total_offset, size);
> >  }
> > 
> > +static void qcom_pas_coredump(struct rproc *rproc)
> > +{
> > +       rproc_coredump(rproc);
> 
> It won't be that simple, most likely. You'd need to call ioremap_wc()
> before and iounmap() afterwards. Then it would make sense.

I meant the same with the help of wrapper..

> 
> And alternative option would be to use
> rproc_coredump_add_custom_segment() and add a custom function which
> would perform ioremap() / memcpy() / iounmap().

This will involve map, unmap called for each segment.
However, I feel, it will be inefficient compared to qcom_pas_coredump()
where, we can map only once.

Thanks,
Mukesh

> 
> > +}
> > +
> >  static void qcom_pas_minidump(struct rproc *rproc)
> >  {
> >         struct qcom_pas *pas = rproc->priv;
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha

