Return-Path: <linux-arm-msm+bounces-115931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t5hOKZdARmpWMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:42:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2111A6F612B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:42:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JO1hYAua;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h8JnW3jx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115931-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115931-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D17EC317C5E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60933A9861;
	Thu,  2 Jul 2026 10:24:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A183938E8B7
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:24:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987864; cv=none; b=F2f0NrIOh75lsFBSN0syiD3SWz6CWc2OB7vie0f3giYsUgqbYs35liNs3gDQMH7e7+ATYIL4ZRzH4jqf1A8MFWu0DwgV2etibuyRiyutmVPQ1/ytHkVsPaMzcn4F01FHoYU/eekUVr6kfaMwmdh+8xix1yqz4GCP4rG8bShbJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987864; c=relaxed/simple;
	bh=8FvsG4IP+ZYFXJKUl9xizFaMbKMaF9FBriZ0pEc5syM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IafoIwLHuKbPA+CjF8dbC460BqVVMhCR5GKjep+8JB9mIsAHCihtmhqsC1zlo2veIhokefDZrGZvMaGayEKzFqthpQ2TS+iLxMwb7XwZG9HiG58P/kqiGDAvv7aex7EXrCct1JBnbCid6rgW93lhmKb2aqVBVilB7w8KNZXAd2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JO1hYAua; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8JnW3jx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624loXB3486171
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/LGd+deXo+AcbKHvGE+6aMgA
	Th3G/dnLkor2I0aRJ1Y=; b=JO1hYAua9eSjymWn9Ww41jFZIiMmM4MlIq5vpac7
	iDtcLd944RZtPhMa2nHu3ZxBQFGiwvBzi7PxmWO2bxAg6eWf5nck9Ds+vvv9feU2
	QdIAv9p6dq47CVf7bSpcS/Yz5T3aauaAaCl443GTzRQ/Kys+MfEM+BX6USc1uW3t
	7KnHv2m7TYjHpdZgCqpSsh0qF+WnHgdXlao3PaMrWNt0kUFO+eFRy5C51BU0M6Vo
	glMCCvh4ZvUeHDKWO9+tijOj7+8Oo3teTpkOZQ+CxcgPE8jeZsZA9BztkN0wdcpJ
	TEadVQE/lTgSC+hWLIgyZX1VAeY+u4Jcq2Z+UI3ZwBPtyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98h6qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:24:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38010ab3c0bso1998035a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782987861; x=1783592661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/LGd+deXo+AcbKHvGE+6aMgATh3G/dnLkor2I0aRJ1Y=;
        b=h8JnW3jxK2TotqROV18xVXzUrGVutFjdthMvcNSf501aRprR20uWRegiSmQIrN+f2U
         7oZo2L3q4xGKS6IXdDPCuZmopo48utcv+uIKsZxlFaurJqK22PyycJEy5FRvPZHCxTKn
         hchecN8J7oO0yfTK5apeIn0F8e+BDwdN5cOkigB/aKYNOgHOaNye3mzzfAmTSK8bz4Vc
         8QFpKMxspgn6zMbRqgr8aawmrx6V/dzhIv0ny5kpWPGQe9pBVxraS2s4oziBcJAsGOfS
         hzJ3RgLOMmwlc23x/yo0MrZgqnkClNcLGpGyetinMGUkeRN9C6q23qnVH3llsrDL/e0q
         j/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987861; x=1783592661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LGd+deXo+AcbKHvGE+6aMgATh3G/dnLkor2I0aRJ1Y=;
        b=NK/xnzka4HPJynSJi7IlgBZDF0XsAEpZMZ94053SnrP2bwR4lYeYIE3cuvJNWTC+Pl
         eokIMYReEK/6jdC83AypYyMhHOTFjBjaKddWqHrRkbvHmnA/T4TcA7ODIzsZxo1dP25Q
         Uw/jt2Kvz7J7JET9tzp16IdSLdKOnZQFvjNvtxQhGH8YWua8ETr6PHfImL7SnyKiWLwf
         Hnkx6gVVyfYzTVqFT0YBBEgIBBu6BGf6fEIuqvVz25L3jg0pdkTrBTxqpiStT5/24aU/
         eb1O9qeLaXNPT1MCkbj/dPxZ/wNXmsYhKALYIngRUV9IPMqBFlwzJPVmMXwAc+o8J1wZ
         3xiw==
X-Forwarded-Encrypted: i=1; AHgh+RpJXxOxwAYWP8J2lQnnqmMrOIGMGiPmbiuoHTIpCqPIUCkhQh8PPa/SCf+6u/JO+inN+lis42u0bMT53Lg+@vger.kernel.org
X-Gm-Message-State: AOJu0YwnlxHnldlDG7jB/Gh53XDDC+IGUSAOvsMTj8ZhSVNdWZ/BQ/4j
	cDbMHm6aOPdsXyFnOABBixxH5N/r5hjYeeAosA7bmy5vWn3C6AgIPcVLdYD3NGLIR7ZPrRdXFuX
	iMd3E0Zrbj7dnWsNe3yqjDp9VvtSkhLroCO8L/ODUaDWaOmxRVRRSWcMcvgEzPeLTewD3
X-Gm-Gg: AfdE7cli3gcuzt9AGYrm+lSrbg6Z7P7R8WOP+1wSgPjKAdj9K9yWWUXdkiBCKwhEOWX
	DgRvHWsctYyb4FoDnaO4GEiMyhsPtT3QRwquw/QPuS/NlT/KA5DzqUaMaN/yOQU/V78nKpF8XR8
	zxU+j3AT7Y1X2VOOLmRzSXM4l07vHqTd9wPea+EPCFOvZAGi98RXAW+d4ZHyPrRLRns2rKQtSfD
	BpeSGejJ0q9kdT4+P9UbV0Hfu1wFI8J/5gFT9VxzwxThtwM53tzFNNHW+V15eNkynW0rvg2QcO5
	RUtBNyEbxF4s9dTOaczYEIzIWbQ0DYaUqZpJmHC7bilEyLKZx/tOUs+GuK0X7gjQGSTEFnO1nFI
	ypW8labQYE/yKmVb+ECB/aoWZA0+DcGknI3jH8Q==
X-Received: by 2002:a17:90b:48cf:b0:37f:caf3:171a with SMTP id 98e67ed59e1d1-380ba87bbc5mr4767118a91.4.1782987861349;
        Thu, 02 Jul 2026 03:24:21 -0700 (PDT)
X-Received: by 2002:a17:90b:48cf:b0:37f:caf3:171a with SMTP id 98e67ed59e1d1-380ba87bbc5mr4767078a91.4.1782987860780;
        Thu, 02 Jul 2026 03:24:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb84405sm11112882eec.17.2026.07.02.03.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:24:20 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:54:15 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] firmware: qcom: tzmem: guard against IS_ERR() in the
 cleanup handler
Message-ID: <20260702102415.twpp4faazh2hlhbh@hu-mojha-hyd.qualcomm.com>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-1-02f5ce02c95a@oss.qualcomm.com>
 <20260702081026.c7rzopcn7vypggjq@hu-mojha-hyd.qualcomm.com>
 <CAMRc=McyjCSZjDax_67vStkZsKKVhLD-=BRwL9XmSHnV38TU4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McyjCSZjDax_67vStkZsKKVhLD-=BRwL9XmSHnV38TU4g@mail.gmail.com>
X-Proofpoint-ORIG-GUID: GlxznnghS3f2Cbzi0SSTD9YZnuMFpoz3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNyBTYWx0ZWRfX4ErG/fKH3or0
 nMgoIePNSCYAry9iwpau1lpRXT/FipUtTKWd1ZJACMkemhP1zGVVp1A+CBHrubvEdOAMdZwvvXj
 ME6v5r2bNWcXppbnJIMkmmRmlDkabDaa2UoYMfpxgx7FKQeJOWGGIg9Y5IZiaJs+b66FuwT5sJy
 xzH+xMe7s/x7ObiSdGRXrI/rDNSsTa2hurzcn89L7wzCl7okvZiDDdr+lDrKAIvxNT9yxszbC+F
 HCsOs70hKpNHqaBNJYsMkzowSCDuH71yktBT55U0C5/cL1yPLiQFiAM68SOFu8wckY0ciabtEOO
 +ctswIitx92M6JS75sILzMvmNHgKGPHAHFsrKVSTZakea+/WLumvRjgSulG/2zg38mVZausIzLr
 /4c5gGdM8m3aV+9seTnLmQbIuNTkKiXmHTS2Lf9811zyAbyION/FIsYBYKVD87fZHZrOYdWC4j8
 DFAmNWHoV7TXW2694qg==
X-Proofpoint-GUID: GlxznnghS3f2Cbzi0SSTD9YZnuMFpoz3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNyBTYWx0ZWRfX8L7QsMCdYT9l
 pk88SogrHmoGg0J0tyEMVn7WAFIPzgKJP1OpEOkegGgQHB7rUj++MehQC1+viVM242SLVrtWzBv
 RFFO46FKG9j/3kVQeIuiZKGcrZoX3So=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a463c56 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fe1aOaPDv-_CdQ598bMA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115931-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2111A6F612B

On Thu, Jul 02, 2026 at 04:47:51AM -0500, Bartosz Golaszewski wrote:
> On Thu, 2 Jul 2026 10:10:26 +0200, Mukesh Ojha
> <mukesh.ojha@oss.qualcomm.com> said:
> > On Wed, Jul 01, 2026 at 03:38:55PM +0200, Bartosz Golaszewski wrote:
> >> We currently only silently skip NULL-pointers in the cleanup handler for
> >> tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
> >> value so skip it too.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> ---
> >>  include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
> >> index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
> >> --- a/include/linux/firmware/qcom/qcom_tzmem.h
> >> +++ b/include/linux/firmware/qcom/qcom_tzmem.h
> >> @@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
> >>  void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
> >>  void qcom_tzmem_free(void *ptr);
> >>
> >> -DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
> >> +DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))
> >
> > Is this really required? Are we trying to address an issue which
> > does not exist today?
> >
> 
> It becomes needed in patch 2/4 where in qcom_scm_pas_get_rsc_table() the
> pointer returned by _qcom_scm_pas_get_rsc_table() can contain ERR_PTR() so
> this patch preempts a possible problem.
> 

Yes, I see now. It was easy to get ignored in this cleanup.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

