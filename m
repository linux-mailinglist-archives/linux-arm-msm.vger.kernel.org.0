Return-Path: <linux-arm-msm+bounces-95192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HKBEBMqp2nSfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:36:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 968D11F55EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 492AE302A6FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 18:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7923D564C;
	Tue,  3 Mar 2026 18:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3+zq8+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxAIq6c+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5936B3A8745
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772562960; cv=pass; b=JGVRwl/pjd0g5JiqGm1hw0xWQzr4pLAWQNeVIJlfVVU3aNCbgCJJM05n2x8LfxWkLdxlxO9QnPb7GFzo3qMFDHXXJS2xqBmFJ9gxqe/7zkvXcb386j6YlCdG2585eG0eUUhcbSalPIs0/Kthj9OYwR2NPbK4Xo4bXNjDxyel7yM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772562960; c=relaxed/simple;
	bh=vqlV5+XxTQ1xKdFQIQMDK/sPljgWz30DRGYZ+udjsyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eik3rcdh8XsG/hMz6ruyba1lS3ThbfOQXQegN1jKmerrn3RNZJ4sTPIz8iIuylwY2XghIrsitsRdzBEvMSeAOd451TUqyc+E2kS7SlxwN3QBF7kxK618YvfbAHjSlDmKNPyhquS1rqbiGj1jZoEuml2d2P9lXsEg4IBD6wLOjz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3+zq8+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxAIq6c+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H12fX3560040
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 18:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=; b=o3
	+zq8+Pvz6Rs4uhse1bEPp2oWJBdcbNObJ6eom0YUDf8rRxo5sq2IWfz+82Pht0Kf
	T3ckTc8YDB4N//t642TC3Z63LmD4RCTl+8Zi4/T0qGhhVJzv7ApYfDfxNWazU8SK
	h/mMlBXHXdVqV/1ifU6Y1Qlky3Ku0D2C72Ccta6QTesB2qknEE9lSb66EgnoVEQw
	MiPmjcp0xLz45hDAEl7CPeZbMh40uRcUPIafIJWA75L512OI47W+VzHiIx+NQXJw
	FSI+oCu2gOex3q+fpijtauzczihunVLnEoshO05xJTnxkmng9OqvNcT0rkBb/RXm
	fo95gklPY8RUfwLLCnRQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5c0xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 18:35:58 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-679c69b46c6so53464638eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772562958; cv=none;
        d=google.com; s=arc-20240605;
        b=Oa9m3UmKL9r+oX0ity43bK9LHb4XzkLFZNXzAqTACdVOz8aJdYNJ/cd1JW43f+cy/a
         iC8++Av5PZPzIBrzw5HlRb/H568eUXEYpp1GwR0z0dStp75S6FspRY2evcc63sGFo+qq
         AkJjyKv2R3ZZJkzufW9s9UPMaHJvn0DmO+Sm2bzvyer+a2R+aPV4dMYyirocT5q4JXHX
         YEWl6YGMCsAjbI9bo+62x12rNKb0GZuI/T4bTLbpssN6yAQ73n7LxlSTKXRAfqsA5rF3
         qNhal1Mx3NxtkWVz128rngXltE54vOxDtAN14JOQiZ4o26gg7PMhmbYsmXcu3SKKe+P7
         L8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=;
        fh=w0azW4Iwj5r0fXW5oGoA/jajRWQar0lxjd8YxLJaxjc=;
        b=H/1qZbj4dWbarcP2iiLHN7myXKXOnKRscXraO682a0tv+nUrKPZMxe2V38dguCbNFr
         2I/N2pKA2YD1uEefhNhCnIaYqC69oWdHWQIWyNlwktCTlSF8A+YpFmrpOBYhFKa6m9fd
         0te8oaHGhfCzyOmIrXmYIIOVyBv3HMtG8j7dvfkvqVlyZJKhs//cswTcMXuq2XZ674M0
         lsqal/Bg1XUs+ie7imHyt1shjlScx8Jtdhj4dYTq/bJx6k0Wg5UBT/2Wjrx0LdIiLqMi
         f6Xjn2YXN6PPQcKjqB8uPcN9jYW8UxiUws8HlOeMPssh2bHzseZ7jBgkFijgluJfSRxO
         2n+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772562958; x=1773167758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=;
        b=kxAIq6c+SEGowBxJ2dAsb1YCZEpGySk1uTVppLUmvhdvUq8fh2dzwB6ICSrf9MIcd+
         73R1/DIRTOvk+M2ZGXB4azEWBFpv1jl7zM7qZ1wpSJX7YFrKQ2Y/VDfDAXyHjC5vbN22
         iE4sDs7szsXtDyXOnDmdslf3GlUzSr2S4VvMFGzE8F/pxRkf3BB2ZMnmIK4LIOZ91ZcA
         amJ4b/172RxUWywXmdqQg5+5pFCNe01BcyiNtOTUZzCpi0cPjabHlG9Cc/telaJMKOZa
         KRcEjfoAZsyE6u/mQAk0FYrGCJ1iHpdWSyH1bWywbQmqdhOX+P6GedjCsofa4GC1YdvW
         pDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772562958; x=1773167758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=;
        b=gSaeHvBPmY7+sZsmIuVO1qFprV77HaK903Ulm4AUUn/a7TPTdzrsDw7vv4Z/+LEGEI
         lzap0NgbxewtP/my8IWiQwfB3t8BJY4tTBN5XGUs+pS4oO17tMlSgKlopZe8atUO3gNp
         I1oS8LMS2SdtpMiwh0VEm74OgtPXc9mPcSN8fNzoXjc86gpcX+C7gNB3bkoeGa2jgIGI
         fic4M48R5QFiBvjv8b47z+/BGcTmnWGA7u+JAtxEriHtcPYi/EqWwAAb//Uj7QynIOEH
         +XHzg2hc0n6adtYbYFknpWkCQbDbjAg7JB+PMCZYlopGS13byiYcCEldegiFM1VhERU9
         dvuw==
X-Forwarded-Encrypted: i=1; AJvYcCXqU+YlrX3YwZLXN32ZnFejhvmM7pZIqdAySOhTwA+jcaw65/MYcANGIS383UW85DX+Ak4m/5rep+1a/4I1@vger.kernel.org
X-Gm-Message-State: AOJu0YxOl/CnIDQ/mzn6MjZlZ4aAZdgs5DonG2MqxtzhxJB/5KwqVzFv
	JgMeh4Bo6EXjdjiA9ikl+OCijk7cCLWvJXuESBi4syHXMlomJGLR67mqmKiMWt/AdrxR9tA74l5
	xnIelz+WxzyHFOMbuY1LhhlhPD+nvM/bwbeUX3dwgHBkq0hm6VMR72kWmxw3FnoPyesfT0ltbTm
	BlcQwZ2aNVfsilCAkBD7Kvccfo3vlXhk5eFIzAdehSi2g=
X-Gm-Gg: ATEYQzz6Nm323/UOot3sh44kI6EaqaBI9rcChdUMyvZbfE2JXr+ppbP1N8Jts2ZuJ+b
	jHN+2gfoCsq10+RkeLa3sJCK58UY13cUlod63uG0vg+GIcYplTrTuzstsPMBxBJaT4SSRFWOjNQ
	Tn6PdEDiGXWn/O8fGe8nV7mqo9gsoV7ZsuVmCCuLqTLZDfT6vyudT68QwWm7Z5N0bqsGX4Jox44
	bV7vqdHXrMSkcoDwpWAhXW/cb/y3g3y98/oCw==
X-Received: by 2002:a4a:db49:0:b0:67a:6db:2330 with SMTP id 006d021491bc7-67a06db25f7mr5039360eaf.14.1772562957648;
        Tue, 03 Mar 2026 10:35:57 -0800 (PST)
X-Received: by 2002:a4a:db49:0:b0:67a:6db:2330 with SMTP id
 006d021491bc7-67a06db25f7mr5039319eaf.14.1772562957137; Tue, 03 Mar 2026
 10:35:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com> <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
In-Reply-To: <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 10:35:46 -0800
X-Gm-Features: AaiRm51LGMLCAU88Ei_EydE8BOitRPr20YiRYude_pQJj4IRN1sA3qdNhQLo5i4
Message-ID: <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1MCBTYWx0ZWRfX67mlmUzOQmPk
 AWTAX4dGERDcP/Wg1Q13GSofa7uCcx3gQkmo6/9z1laz1xoe1fwmXaDlHGZ4Xz7gzqO+LWG1DNI
 jTtdct4co27RGQ+gUDyn2GP8ORmz/K0g1pLqBS9cvrjUqAHanfLINwCeLJOylzpAozRqMftvTHB
 obDpcTd9WT6v/TTx397xu8IlS3zj34IFSNarraMJtJd7xqNxmwWngSHCbCSr5Srgmb+zaOStnC2
 Wq6S8AHWE62+39g/wWolXuS3a6QZfpXwYQwJR21iyJg3fEfA18iYBaFZGTHY4FGZ4jRTgSFkbE0
 s0rmMRJCWkXVKNIaja9/Wt+ULxiNkd3LYrvlLb3rJ+5JrIoqNSqlyC0qI87rZvS1a7ticjeuzgX
 dUCBlIJGeTlOzSCQVQ6RfBYSFVcio2FyOuCRG8a9Lx16zKC9/tgdIT6X32ordZf4QRCxtV39Zmo
 LRnij4uwE9M4cHAqQXQ==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a72a0e cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f9mbHagqO0joi95MoiEA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: W4JLr3PoxUDB8btfxWv4WdpK9oXC_1R1
X-Proofpoint-ORIG-GUID: W4JLr3PoxUDB8btfxWv4WdpK9oXC_1R1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030150
X-Rspamd-Queue-Id: 968D11F55EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95192-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 12:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > On targets with multiple display subsystems, such as SA8775P, the GPU
> > binds to the first display subsystem that probes. This implicit binding
> > prevents subsequent display subsystems from probing successfully,
> > breaking multi-display support.
> >
> > Enable separate_gpu_kms by default to decouple GPU and display subsyste=
m
> > probing. This allows each display subsystem to initialize independently=
,
> > ensuring that all display subsystems are probed.
> >
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > ---
> > Depends on:
> >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c=
2dbb2638b4@oss.qualcomm.com/
> >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti=
.qualcomm.com/
>
> What exactly depends on this patchset?
>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index ed2a61c66ac9..65119fb3dfa2 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -54,7 +54,7 @@ static bool modeset =3D true;
> >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don (defau=
lt), 0=3Ddisable)");
> >  module_param(modeset, bool, 0600);
> >
> > -static bool separate_gpu_kms;
> > +static bool separate_gpu_kms =3D true;
> >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GP=
U (0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DRM de=
vices)");
> >  module_param(separate_gpu_kms, bool, 0400);
>
> The patch LGTM, but I'd prefer to get confirmation from Rob.

I prefer to be a bit more paranoid.. perhaps switch this to a tri-state:

 -1: separate drm devices if there is more than one dpu or gpu,
     otherwise, single combined drm device [default]
  0: single drm device (matching up pairs of dpu and gpu if needed)
  1: separate drm devices

This way we aren't changing (or breaking) things for existing users.

BR,
-R

> BTW: have you tested it with X11? Are you still getting accelerated GPU?
>
> --
> With best wishes
> Dmitry

