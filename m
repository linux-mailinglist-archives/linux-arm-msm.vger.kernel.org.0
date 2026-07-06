Return-Path: <linux-arm-msm+bounces-117000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z+ILBBIETGpLewEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:37:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E7E715104
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:37:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jbzRgBZ9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AYb4OPuK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117000-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117000-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4697732857DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6C83F88AA;
	Mon,  6 Jul 2026 18:10:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798DE414A09
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:10:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361435; cv=none; b=HqDP/0hqOlo+KLfqynT6D8MPLcD6EjHFSpqnFARjb7yZq26KhbQ9UTg86Iw5wxW2invG63NODeyhY7pWtuOIX2uXHPfzPZkpq4P6eyE5UIPzOfJAGCsl5oAIRxMfywsa9rbwNAH6Ee6EOSg4JaKQFdUkCSYZkaOV2uCpuKrEgaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361435; c=relaxed/simple;
	bh=+wb9VoFzS0G95lmqtUaHYRTjw6dW96UvyaOPI8DWML4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjykgPKKIzDdCZUgKINSokdD8xcdjny56F2xPBtSpdwzfUeicZHmcsnIlKhc/Csxg2kLG1lAgd9eE0axhJdb12CGfTKckIqfQeC2NaPtRa6c0J80uysxNu7ipurAS+cnXUExp8BqR86ME3W6FGjNHO6YO0d0cs4sPHzSWimxLUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbzRgBZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYb4OPuK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7aj982450
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Xk/b4HzWXEdWqMLmjiSukHN
	p9G6v/npFf6Co8X4+FA=; b=jbzRgBZ9W8vuUwVvkZyC1+KTByRbaaoWsxHF/dwi
	CMN0kxfiZlPLk25g9HHsU8P+ouGLOVocZK+U26E3tOT+hiFQB+kCsjw8eOs7NjFA
	MaCRuEq0ZSdlQS5yn9sC2RdTmqcOHJcQNuZpw6zO9tl+kFDdkVjWk9MOdQfrZmeq
	wDyQMmQ5kBjfsexLhvV/0sjpoMdMmp2nCbSWfSeDBgUV7Y6FxUKTO1Q0fmlIRIUn
	QHoW7FABrF9OuvuZDHnYxRipGlCBpbckSbLvi/l6fnoYhwC6e85KrXQE2xs9C/t8
	7hmzzdDA+1cN9wnMZF/q68ACrpEw6nc8+CaDOvu2QExcfw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjbk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:10:32 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bdc8169a8dso3789353e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361432; x=1783966232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Xk/b4HzWXEdWqMLmjiSukHNp9G6v/npFf6Co8X4+FA=;
        b=AYb4OPuKAQNykIP7K0NEWtnlA5kh8Cji23QbSHm6sXfuoNB2dZMuMuQh+nJN9SA9LA
         MD8c9Z0d7NMEoCqFUUhZNDHKzJPG+qylZ2gkKEJX/5S7F5Cx7m1jxbipIQcbLk/0NIdh
         SGVlfO0I5vg3fF0Z2vX4IgaRV3mxn9gN85TqTgl1//luqa83qfb8N/ixQOmjULyxq6VU
         J1cfdFJAw3V/ivjWls3pwqFx58J5MSyTR/p115+u5HmSJngJG/aNmbb7ZIc4/rRlXpaw
         TUpRb5m3OCKYPrWNUbY1yk66g5Uzmzc8x/iCtd0WptGDjd7mR5MuBpsUQHQJZcMoxP8B
         GjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361432; x=1783966232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Xk/b4HzWXEdWqMLmjiSukHNp9G6v/npFf6Co8X4+FA=;
        b=ExLgc6+AoL2CBgKJU9s5/Mh0lWmiZByF5Jkr5MwDDokZKWdcUGjyUU9bcCE34WNuH9
         BLEQPeAZwM5JO8GH5p9nzbH1d93x/aBOfNBuzoKkjkFVCaY865SxRZNkdTGN9jOxkfh8
         W2vofOGTnze+MgmFA1UKfMn2rU9qxTOWBqZK7e7f0pOHnVhbGr2yJl3leYs7IF768G5H
         Vo/Mi0Kl/5QdUULSO+EKaj6H/j7O4RmO2/ewAjxkQK701ruaCQXELc01HfuPvR7OQRNB
         HfYHacI1EN8YCeT/AbbHqg07aWfIuqTgY+zgNo3Hqf6xbuFH9mEAwIrGV/ApjaTsbRcT
         6ryA==
X-Forwarded-Encrypted: i=1; AHgh+RqqEdi+0Cukk/rH8n3MeZwKvidLXCbEF7RcrijOB5CTBbqn29LR0yDIpxXU3SBCUH9l8qMkcBRVFaM+mMUU@vger.kernel.org
X-Gm-Message-State: AOJu0YyQnKL7WHVaPxq/DoWPHVGRvAoPSfDg0vlNS8WG8SojGijiaRSo
	f15NDNfRnYDpUaxTVjkkKphlJTE6pRcahel+oGgBj2FZCGHKz8yk/8PEJKqdNeG0ui7Q0sKF/DY
	AJkZ+ErM813P1zzRHTA3/IDfP02ZACLD1PBblBoxt7ClATo2PLcUYsvYv1x5DeZPKs8RP
X-Gm-Gg: AfdE7cn9qm0/M9NBNs+B1MN6B6e4Fsav9gs+X5pd5dBKfYHNqnkHFX5qAgJ/GcqPsgm
	Yd5eSq2VMbDSAjksrYA7spFDOSqkMBcIKf62WX85EmzUyOor2X7zaW6qRznW63/NAaj/0cA7iNg
	hPXJ0+w2jZ6B5VOzg3GyduVO70iNwrr0eTRknCmcLTb0DJDISkdLTLqoecW5b4N52DbS2LSrOwd
	98wxGBubJYWe6lOFws1xq2iIdIfC+g0++/ASB89FSNrjO57dyTtLRQEaEM6Dw4geozL2zBRuBmR
	az7mrRZ7OeQOByPu0H7978raID421Ywi5wHOElmjHvBkltUo4VOQq5Vk1nb9DXOpV4FpAODiXS4
	aSL/SpJogGs2ZWeQ2DAyf0qZdD9LfftJYb/Cf9pg54jv+YXriK3n2+pXBjPHj0lxPh+iL98/oIi
	71Ibv81JjiVvzS2sQAQcl7aOWd
X-Received: by 2002:a05:6122:3d4b:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5be8974163emr1068024e0c.2.1783361431935;
        Mon, 06 Jul 2026 11:10:31 -0700 (PDT)
X-Received: by 2002:a05:6122:3d4b:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5be8974163emr1068009e0c.2.1783361431511;
        Mon, 06 Jul 2026 11:10:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701a7sm3044686e87.12.2026.07.06.11.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:10:29 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:10:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 5/6] remoteproc: qcom: pas: Drop unused dtb_mem_region
 field
Message-ID: <lvncryhxiubp5h2jhuozonhsdcz5ylkseyujmnfezemy2fucy6@hf53qymlogh5>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-6-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430191253.4052025-6-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bef98 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PVo76MSw2fuN9WKo6WgA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: t8P5zJz5dZtC6wIoo4qGUEFgpGie0t7r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MyBTYWx0ZWRfX/RAXpvpAv4PT
 OLbkeDUlvQ9tvSWkbJe2fZ5lXsp1i1zGKG3dFV5ape7YwB6t5uuEZxU+ytnYk93WiHN92YElFyX
 0KMoh3Sg7qjQeLlqEO4MZbdffpAwaF4ks+1soNpX3KZ+3p01GBAUu6XpMLJhrGWRvXU10QySE1v
 jludK5MmCcwOVlbSMUROpALv1sCNIWr2r8CyKgkwtEfkGQc4ic7bPx4wpsE+vlBNWnpMlma16kF
 +hPfw87HdrdcnXlt6gXUeifMNDuMXMc/mz5bZ+BBBHCe9/PqaeFgJYVZRemHuYp4dQYr63p3/8U
 qK1tBXsiTsehIm2yI2+I25SOub5jtBmyAlYF0NB1zAEG9QKiKCtRW/OYUl9A2iKiS/sChRkt8rv
 y72zjVHf42oxCHexX2UIbvLvNdYQIpomft6uqQunYFIrC3PF0rtaoWnvFSE4lULiaC3HnSEyled
 TMtB2k/nDK8+KTuTkdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MyBTYWx0ZWRfX9ej1c0RQQ68n
 +tbzj50WJP/ALAJEcJQoUHyjNmRKf8tfprPRzQuzjxtZaWNCYGcNe0WJuPJsoOUroFVzRgZxybu
 wBSUV4A7VtYvSJD/HvbYbbREoX4bzJs=
X-Proofpoint-GUID: t8P5zJz5dZtC6wIoo4qGUEFgpGie0t7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117000-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,hf53qymlogh5:mid];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53E7E715104

On Fri, May 01, 2026 at 12:42:52AM +0530, Mukesh Ojha wrote:
> dtb_mem_region is no longer referenced after the ioremap was moved
> to respective places where mapping is required. Remove it from
> struct qcom_pas.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

