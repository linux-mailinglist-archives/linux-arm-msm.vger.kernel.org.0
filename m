Return-Path: <linux-arm-msm+bounces-115382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QoR3HxiuQ2rUewoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:52:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5D6E3D68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:52:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ov4UA8+0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M24rmP8t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115382-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115382-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE1CD33D6A55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1313FBEC6;
	Tue, 30 Jun 2026 11:15:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB2E3F9A1A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:15:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818108; cv=none; b=iKm/F12BI9PEQsHWZlEZZUO+My+MoZVRAIAQqtMXJp99vwYOLGBR9robFDAlWz9bo02vuHkV18hqsyPH1RYBf8TWLB28S74XjbKjHDAwfsN1qkgoMcoQPZZZIuOXU+OxnlD/8vT95allbiAvTKIIM781euWVF7aS+HK0SX/8c1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818108; c=relaxed/simple;
	bh=7NL/V1SsEEcWKSm+JySMjBwNLAfTuRvaVXdqxtgovWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fnoorb66biC/U+Ca/9YZArpHBlb9knCKjyfAlnAiNT2mJPwIn+AfocNk281CdUCF2L30J3cKvqS/JoQLW9FECSCAIzBbm9nsVlBcmkR7+4IdUJHyvqqzLc6ILGyEeh9vNRddIhYAN/PS/Fr8gR/STb9+l5gHjUFoAuOVclKIpfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ov4UA8+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M24rmP8t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mpgC1611512
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2niZoUyL87/GipTAKtDhFFkWKTWM1CnEJqXzl+Bo9k=; b=Ov4UA8+0az/3k522
	DWPGh4nVrJ8pg0FI7rRtes2sGZuM7rSAk6sdUEBWtgwBCjdbAKI+aKBVUxGeOrvN
	rBC+Ak2yfmhutJZt2vXhme3s3XwrZgWEZbk+KhqGIFag1DoMDzRo243F89wUSIGZ
	ewCBiWz/X72JgaaaRZvgJFhaKBSiP50ndSnaoLGNtuLFExEmMKlZeMg6zKWJ1Jmn
	qYT1d9QLZ7/9VLoC8avHcholf9rWqxRhfohczxfu7uP83Ot9yC27c0AFq7i5nn21
	4PilovXly75h4+XgzdXtWSGBmjhzvebhRn8Or/5ZaOu2u/g1jRVYfcPP3LQ1iVjt
	q2USNg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gt9yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:15:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30eec544cc2so661915eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782818106; x=1783422906; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2niZoUyL87/GipTAKtDhFFkWKTWM1CnEJqXzl+Bo9k=;
        b=M24rmP8t1mUXxDmUbSIAurKEWBPDF0pVVsluBLGpRNm4/b9C6Vrd/YfO1cfSKgktyk
         L+c8vRV+cPeuPRAdrgDb+Mu0/Bm4pmLGoHpS3kt/b9WpucVSPtHl8Pu+X5sZr7M/fG/2
         9B0KlgCMuPC0T214lr8DPhkiWBvzoLN1izdqKVoXOKgFwrfQSnC7JrQ4HOQ2WsAE5Ng3
         JxbUv3qGFvntrY6HuHh7FyWpxPD57DTnweKdNewXi2KiBzlYemn9iu9ODGq7qWcAIwUR
         N/sSmsQdVeJPgz4hHnN8LsV14bkwaZ+Vdpg1AIySushNogzpZbOy3YMvjW5kVqbnq9vp
         Y8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818106; x=1783422906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2niZoUyL87/GipTAKtDhFFkWKTWM1CnEJqXzl+Bo9k=;
        b=rt/4DyfHil/RXg6EJXzsUY01KpX/KwwDbJvuwacMDSSZRfNZJ4WwN+EehicP16fXzx
         yacIEt6u+4WF7tLyJlU1pv46jRPQoUv/jgATH8gy5Gzzjm0spoBxX4I6DL9ZkW8Uk1ji
         ZTtEfT1dEU3kdTHGCT0AuWPQW1VEiPIeFJFRtmkEXfGDkfQ5niPkoSfdN17aYIyK0pJB
         u5jNhJH51ygrrMjHsX6cEYhrc60MANEGShhoxxE56ehJvEpzyARcStcZGgPFggmCJvRH
         pTlq4p2x6gDAWCsaYbaqW2Gcx1uA5bQv/l4KLFrhYDHgF+npCqz582VLKLpHxcy9qbnd
         gJpg==
X-Forwarded-Encrypted: i=1; AHgh+RrRxFCNtBbHwHgJ4JJ2FuRT17QRCIuzV519vx9J/yQYssdHYp3XIlqetpmTQA4TuWPlk7VOL6d9T7DZjpfC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Tkhwy77vRt8SABV/2egAkcKexPoaIhztBR45PG995MNdlhCU
	uwXs0LMuDcVUDLMfKmYguYLBjWwz0semn7YGnsYlrozgoKaL+Hfg+xA7I5vn6RlG0+TFmB8gh0r
	epHlqoxebv7wUWa64iYvaPOgeS2wY9PSbIYX1CNZENUI5KlAwnH6oF+stwbjzNMamP+uR
X-Gm-Gg: AfdE7cmyw2X+7tXApulRk3lPtow2lKAgvpWDl6YSja79XNw5spdKDftVOFDuqdu8QRI
	t0b534xbg92y3wpw+USUBE0+iz8DE/YEcHe/Bsc6QdVRglJQrVPDQLcPIesuh0yWWzm2p1KoUuM
	GE/rOGykzWnDV2z/wsvUYXPEfDOBofuWv6LFxjtBYNrowOnRD7MEz42YVkR6NKFiKLjSBPQ1E1w
	alAE84kdjWH9eLxKT+DGwl/3or+LwHqjhGULc/XChBzIXN9neH8JfHwCAHy8JnLzginSUFAbgrk
	b1nQhVCSks8Vltgrnc2K0eroPIgfn+cMZhAEB/R4PNJuAWKjGVEWQjyftUHdGsgD4UxhACo3rAj
	wxy9jjlFRak6To2FUd8g84GSyxyJqmsyncQV8dg==
X-Received: by 2002:a05:7301:1010:b0:30c:536e:3a95 with SMTP id 5a478bee46e88-30ef080049amr146022eec.2.1782818105670;
        Tue, 30 Jun 2026 04:15:05 -0700 (PDT)
X-Received: by 2002:a05:7301:1010:b0:30c:536e:3a95 with SMTP id 5a478bee46e88-30ef080049amr145988eec.2.1782818105008;
        Tue, 30 Jun 2026 04:15:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5ed29sm8004479eec.1.2026.06.30.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:15:04 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:44:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
Message-ID: <20260630111459.x65njyw2bgx2tihn@hu-mojha-hyd.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
 <1c5c6399-e4cb-4d33-8fb7-fdfde0b33e19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c5c6399-e4cb-4d33-8fb7-fdfde0b33e19@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMyBTYWx0ZWRfXxmrGCbx0yopg
 RlCbFJa70U09Qg4czVbPPkZaT6jWLwqU5CvJLd5aK8YN1cXcpekJgxHQLyfC3avgs0XmsfiokPQ
 1rQUqcx79HJlfu/KRZyaB6gkKBKzfks=
X-Proofpoint-ORIG-GUID: W9OETp_AEHHWQX9DvcNzlAHlvrz3noBg
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43a53a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bRAfPhM_wZvex4AwAJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMyBTYWx0ZWRfX1zXVhb3Z3Vpq
 63/hIzmGY4SzMzD0+rDxO2rVJ82KRVlGLyjFHEi8737K1Hy79XCPwY6mEGM/HesdmvBewtTREyJ
 G7Tva/4EAgQhO8msbF6K1DRagiPFONh9XR9Ac4/UrSim2PjMj9TWggUhrldkslWz8GB6QbBTIAH
 f9EsS7GSnWFf71W2Kuc7JSadyNiW0puhQ90FuCZMnG8+qvIw7InyDwgwCQ2h3rW1CGGXRyZ8W1Y
 Lpy/jTGZdF3Dfc8dML1BH4Y+O/zVrgadIXoUL19T78S3pKmPKNP7UtT/S5oQsQe7xZYp/2LxKZR
 NG9+1AHWJUuF7+k8k0wqSs8Iq7UdKGNIi0hE0TiiWjvaRZNLdguV1xhh0kCiqUZOCyMyfPF69ku
 WGqOiV3mJBGGJ3oFC/Wjv9vvrr1UyQ7vGNpq7pC9gnSPIV2wfeSAfLzQnnb6Am0xRuvalwO7pp1
 qZhDH/pdLjizHSrrtWg==
X-Proofpoint-GUID: W9OETp_AEHHWQX9DvcNzlAHlvrz3noBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-115382-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: CAD5D6E3D68

On Tue, Jun 30, 2026 at 12:39:12PM +0200, Konrad Dybcio wrote:
> On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> > The PAS image initialization path always retains the metadata buffer
> > when a valid qcom_scm_pas_context is provided, even if the caller does
> > not require it. This implicit behavior leads to unclear buffer ownership
> > and forces new users of qcom_mdt_pas_load() to manually release
> > metadata, which is error‑ prone and incorrect.
> > 
> > Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> > retention explicit.  Metadata buffers are now freed by default and are
> > only preserved when this flag is set. qcom_q6v5_pas enables this during
> > probe for contexts that require retained metadata for subsequent PAS
> > operations, while existing callers continue to work unchanged.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
> > -	if (ret < 0 || !ctx) {
> > +
> > +	/*
> > +	 * Some clients still pass the PAS context as NULL. Until all clients
> > +	 * switch to qcom_mdt_pas_load() and provide a valid PAS context, check
> > +	 * for NULL before dereferencing it.
> > +	 *
> > +	 * When a valid context is provided, metadata handling differs across
> > +	 * clients. For example, modem clients pass metadata to TrustZone that
> > +	 * must not be freed until the authentication and reset SMCs are
> > +	 * invoked, as the buffers remain locked until then.
> > +	 *
> > +	 * Other clients free their metadata immediately after the PAS_INIT
> > +	 * SMC call. Therefore, keep_mdt_buf should be set to true for modem
> > +	 * clients and false for others.
> 
> You say this...
> 
> [...]
> 
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -669,6 +669,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
> >  		return PTR_ERR(pas->pas_ctx);
> >  
> >  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> > +	pas->pas_ctx->keep_mdt_buf = true;
> >  	if (!pas->dtb_pas_id)
> >  		return 0;
> >  
> > @@ -688,6 +689,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
> >  		return PTR_ERR(pas->dtb_pas_ctx);
> >  
> >  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> > +	pas->dtb_pas_ctx->keep_mdt_buf = true;
> 
> And you set it globally for all PAS rprocs

You are right, but in the upstream Qualcomm PAS driver as of
today, we do not differentiate the freeing of the metadata region
among various subsystems — ADSP, CDSP, MPSS — and it is true for
all: release metadata only once auth and reset is successful. And
I see no side effect even if you delay the metadata release from
PAS init to after auth and reset(). But all the non-remoteproc
subsystems like IRIS, IPA, etc., have their metadata released
right after a successful or failed PAS init call.

I could refine the above comment to reflect what is there today
in upstream.

-- 
-Mukesh Ojha

