Return-Path: <linux-arm-msm+bounces-97976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNCeEpgUuGl/YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:32:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1EB29B70E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B8EB3005D1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0072D29DB6C;
	Mon, 16 Mar 2026 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arScxS3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYdeE5pA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEE3285041
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671524; cv=pass; b=D0nM1hlr4gs2Zh+iUGjZiXtTtYWoJK4E+cN4W88q8cdysTKheruZCVvQMrRGWK7kjKFKUHk89YR4rHK9UxeM5Ct2uIzkxzrHXt1XgGxdnAbCoZg1JOC/NKfMzeSx55Htvq53rbFCo0Gsj8xrUlsIKTYiQSy/Lqp3GTY/QYd8eYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671524; c=relaxed/simple;
	bh=7HzTfIzXwqx3SZRN+XeoVFwd75g5DPe88HAltWbqkI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1ViDifkt/1ayMWR7X51li4XV5KiV/G8eWjDKsWDqJhfq2vlgNSt8pFqAkLXOmrgruDixBDt6YmUgVIgwx61VFKov/vYdoYwGOz3xuAZuVTGFO14dienWmg68piypxM/BgU/7WPuACfuEciK9RbRDx4Fky8qX90JXz+eeZ/MdIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arScxS3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYdeE5pA; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBpBUg3777629
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=nPjoJxU6spHa5+lTcvGzrMEEtAKQiTdlw1paS2lURbA=; b=ar
	ScxS3IVvm0Kxuicjj7HLo3E/T3Pg/Y4QAvUMTtwkx/k85npO9oc3KL+NdeHiKHLf
	cUcgBYJNC7yNrNBM+J//3ZR+skr3vlBmlmT5NWRcIN01L3t8XYuuxTUDP0aGju31
	OvqmPDzV28KysmrqR+6P2LjxilQiMMsPZ25FV77MzFP2+hE399B8l1fs7T9YpFeW
	RQD96nVrdULnddeSxMxVE9IPMVYCrw4jsMfQk0SUchW+XPqZfMX0P8y0a8vcHsRL
	aF+jlgQJknlysdSH9fxGo05y+L+RPyW4Tn03ZL9L9RvNAxBea8jyyww/SbJ3Y5sE
	s/3ds6mUEm6Q3ju0T1/w==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7x0x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:32:02 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-67bb7ed941fso81507671eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773671522; cv=none;
        d=google.com; s=arc-20240605;
        b=aiQruCEorFEzrWsLK4xV8QQFvK/VWw/AFyjyZRyFVJp/lm+7qUSlJCgs5T+wadZ5O5
         o/Eyz300rIWwe5XLuSYIqVuu3g9eumMdCf7KzMRiZI/5U3XKrV2DLowU6FVQOXGLHpsg
         +iMW3I1syPvrA8LuO+PnUUwhaxdtjL1GBCeTRNwf0EIFrx/qdhU0L2QhpD22AaNU1yWo
         uxGZMzfEYAqk/6l4t4/qoguyGUdFV7E6GnKuar5EFU9IcxKMOW3l9AJBP/hWnZB9X9+Y
         dsray1pZ8Td4JuxLtABRDd8VOCY7qWpM/m9LSz91i5jjcFDY5fRFUTwQ1b+8jzo+1OMS
         6UXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=nPjoJxU6spHa5+lTcvGzrMEEtAKQiTdlw1paS2lURbA=;
        fh=+F7ep075bzkxcmou9/LKJzEuSLAwg+b719/FGES67vU=;
        b=UcdCSIb6JwenIZlc2IrsgXZ3gjVnI+TvP2sTa+vlqDsi2NPPclRZAduZChRE0gRlCI
         /JcjgIQJtvF75p9dWyhuv8/tm2Yz6vNUPwv4we3uY3Keb3C3BaiDL2nznEKzgCUAncBB
         Iyi7tFkTGtCpuw3YduPXUP/gxwu8jTCLfE74N6y8AZ+LQAQrJEfoIwSFewznptLQ/ohC
         HJHwuc8GkwlsR9NIzy8xTgri4UTw7oWjUnVU5DR+52jAIUmzI/8qxDrC5nV3khGx4ecp
         RllRM9H9qFVoVyVl+DtNATeYppyHz+wVHXm43KuVC+T91ZmiADAb+Ipld4jjNjQyPTqQ
         TmYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773671522; x=1774276322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nPjoJxU6spHa5+lTcvGzrMEEtAKQiTdlw1paS2lURbA=;
        b=PYdeE5pAAzUeXfZwZzb0XAagDXt+gJzo7mnlZaYuFigyQNhtMsLyrGkGRbFCsSmbNA
         3GlbmZ10ftMMq8p/cqj/UDaN+i1EUPg5uxNtXwH3uDfqoS+jcx6skU0L4wS8OCbw8dQg
         YYfF4PgV8Z+gC3EALpvcvCWZ/VYqnCYMlJPOHMAQGbhGcQlEvwSHS9rMkTsJYja0KkzR
         MJPFSbUdxk4ZHQPHWQpRDJt/CPnJJawanQqwbl0WENE1GtLGLRgBLBSI60M2DFwsFhgZ
         lrqimqZvjsbISZO6Y5fk0dvRArjS2Tme78wMn+7jIq04WfOnkPbDdqNlml/yLeEZ5eYD
         7QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671522; x=1774276322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPjoJxU6spHa5+lTcvGzrMEEtAKQiTdlw1paS2lURbA=;
        b=YKXNwKD+9hjDVoESD/3Xcv/B4hyifwLlpMSGxgtd+UiFIMTK0tu44hqwJfsPULOc88
         00dhFPAy5ri9qhDrr2wMOyDJWLIhdunvykAn/2KMCwHRN1KJR2POsJQdH9C8Vw0UhTK9
         s1TyVa3z0NsvMLMlPswXU+S29UOymbN4tfQTAel0nKnQvlB/76SzM9Zhdk40bDC/6mbJ
         y8hFqYZS3yIqQjwFJ5BLNmI39aziR0QrA3ZlWu9jYyg5HsjIzkba7xraoeCIDrnbdtJ1
         B0Q6UMG4i/wda7bf7Sz98XHhYbHzto4VNSGkBaqbl2Wre14jUPF1OJwBoEY+R7FY+yLj
         7RFg==
X-Forwarded-Encrypted: i=1; AJvYcCUrg3KoCxX2Ct+7ddcp2IIR0VDaHK4PmV7otbdRHGQL0zWgT2fb8K7aNZwcoW5HYRHZp5aORaJ5ivlV3izk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjx5gopUSXerne14jkfkUZ3kfdD1F2uSlL12j9e8plorD4QOy5
	h1SGVccN+LC2/mQUIeVPPqy6hMk+dh8zS4Plat80lbGwDW5U5dBPgB5v+gzfA/BxoAePVg5vtrk
	cd3xytVD3ISNIOfJ9J6MNAMVE8CrW82V/U0AWxeE5z3e6xfQjif7W/ytGuZICd2ze9RD6kKSrJS
	qenkG7XXnQuzhjMpQVGNYrEtcu9XK1BvlPkSH8736pAI0=
X-Gm-Gg: ATEYQzyyMTliA64a5IrSrfWU3EAI4WVh2p9jIrcfVC3DWy3WFiiTMYfull9qTL/CfH4
	6g+OcMw7E8PAzgCMsgCBL3NFqq+t55/eeqR4PTN39j4/FOGi7Tj2ZoJwD1Yo4xP5VC7tELuRJYT
	6D4GhWxlqUOZw/m5sst6L4fzBWFPCEiYYNtLHthlRq3XU7al1qE4QIcQdE1RspeWiu8AaR3+K/2
	zk9C0FB2R1S//i9c3p61iJUddOFfZLw/K15cA==
X-Received: by 2002:a05:6820:460c:b0:67b:a4fa:7a0 with SMTP id 006d021491bc7-67bdaa2ef02mr7072520eaf.44.1773671522015;
        Mon, 16 Mar 2026 07:32:02 -0700 (PDT)
X-Received: by 2002:a05:6820:460c:b0:67b:a4fa:7a0 with SMTP id
 006d021491bc7-67bdaa2ef02mr7072506eaf.44.1773671521640; Mon, 16 Mar 2026
 07:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me> <2938aa01-cc1b-4dd8-a4af-45ff8354a061@oss.qualcomm.com>
In-Reply-To: <2938aa01-cc1b-4dd8-a4af-45ff8354a061@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 07:31:50 -0700
X-Gm-Features: AaiRm53KsSumyAMa122GPvfxaOMRHHLZur1wBvUHnn-OvvsV8SAklqaudVZG-u8
Message-ID: <CACSVV00HQY6OfWRSWDcv4KnpwhTO+aLpTXLoQuGutvTTmgJFnw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix GMEM_BASE for A650
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: yNGXXK7EfD_aCKAAn7lihe84fDPU_tun
X-Proofpoint-ORIG-GUID: yNGXXK7EfD_aCKAAn7lihe84fDPU_tun
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b81462 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=QvdgE7p1BmYn3sne2WYA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwOCBTYWx0ZWRfXzx8ypi0f0vW7
 xQm813E+f8FTLJY4ifl/zE+W5TrB2oA5WZ+/v39wsjTV4j+zgbszBhBqtqfgi/CGzzauPQbMfgI
 LIKaTtVL0S4SO2NemyyEKt5CytIISVXBICiwE18xTSmc8XBpdv/R3MkkxTgBh8i9PRcaPamZp/p
 PCiwwO4LfhAQ1NHSK7BtEhohg7EvzfMn+tnd+XzhaVDKorOVZrt4TA5MDkWL3a14/P+bzziXMkE
 dqccIfCClwyTbKr8JumB9z/+o1YQL4qRw/eLZOuvKKduRsqGi9ZRSIbRNtmtBJTjAml9KKaG+sz
 VlTrhxy1dbaGo2FYwz7TbLLSDgeyl/kewPYnJyApZ7ELdUFlsqyLaD2UjZYI8fEfzHHs6qiUuI+
 w6zdzaVNCPXW7zEtH5xpXnzCs4e77FMOMXNjWXxrCO4Kv5Z9gBRLg/mKqvs0CUrmPqAKMq0v56U
 BR0QrWLfWuHnzXCWDxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97976-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[pm.me,poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 9E1EB29B70E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 2:22=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/14/26 5:14 AM, Alexander Koskovich wrote:
> > Commit dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8") changed the
> > GMEM_BASE check from adreno_is_a650_family() & adreno_is_a740_family()
> > to family >=3D ADRENO_6XX_GEN4.
> >
> > This inadvertently excluded A650 (ADRENO_6XX_GEN3), causing it to repor=
t
> > an incorrect GMEM_BASE which results in severe rendering corruption.
> >
> > Update check to also include ADRENO_6XX_GEN3 to fix A650.
> >
> > Fixes: dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8")
>
> Hm, that commit also changed the value for A730 - Akhil/Rob, should
> that be changed back?

No, it was incorrect before my patch.  The only problem was the change
happened in a6xx_gen3, not a6xx_gen4.  So this patch is correct.

BR,
-R

> Konrad
>
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index d5fe6f6f0dec..0ac3fba5c277 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -376,7 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct ms=
m_context *ctx,
> >               *value =3D adreno_gpu->info->gmem;
> >               return 0;
> >       case MSM_PARAM_GMEM_BASE:
> > -             if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN4)
> > +             if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN3)
> >                       *value =3D 0;
> >               else
> >                       *value =3D 0x100000;
> >
> > ---
> > base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> > change-id: 20260314-fix-gmem-base-a650-cfd9bfcea425
> >
> > Best regards,

