Return-Path: <linux-arm-msm+bounces-99746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIy3MwUHw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:49:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE731D01E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8280231B1280
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71FE36494E;
	Tue, 24 Mar 2026 21:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUc8eKrq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0a61u1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF403659F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388595; cv=pass; b=N1uoWUI55ZEz9WDObxQ2Lx9+UCTGpC21lOlZRPya7UTdXLWb3BFpEequ3ZllJ5ebQtq6ZBZ4ODrFg504fzuU3oKTXzxhYJhbrO0W6wqa8/L6MsuXQ/LPOpDAFICfZ6Oexe/IOXmpjzj9yS7N9t6rPRP//hx7a1uuU/pwCUfpKj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388595; c=relaxed/simple;
	bh=l7Yy0JUK4OJb56mZN8o8/Cqyx2loshCRj8ywtgwQsEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQ6fwSn/EltYoOqmMlQgnkvBv4PpKiGvpTOdzcCUdEAk92W8AMLQn6RMResyGxBKhuFv7+mQ+BU251NsFeaJL+vxids6ZAxKenRe7YvkCYKHX0sYZuGDVME6jl6PHiqSn0WwBAv6qqoLljrprvo4Yy4D9L7UQ4YIwXkUAg5xNLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUc8eKrq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0a61u1N; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD7Tk3731506
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=w58gYwUV1l4ItIeSpmCHgD18qd8dug8WCJaRbNly3eM=; b=aU
	c8eKrqX5fI+LJtfTcZbeSmYmRv90HZMy4gCvGYF0H8VyUAFefeDLzJQaFfD+k1S6
	NbWcTPd6YHTCxysrxQ9IuWh7x2uREqEhD971KSufS28+BHX4x5Xu0yODxaZxzuWq
	m1svJP1zdw6zshfCsdQWX8lA/Sd/0yg/FZQIhjO/hvPC5Y3OkiiFemcA4ia37REV
	Ya7wSO89Fxdfyemgpv4b/Uo1aeSp9pL4+hRXZPqkAklMtktS41wh2gdUUzb7/A2X
	xBC192ScIRBp8GUTu0HObu59MyXj1T7IPe7HbFMh4xLAgshbd/sTMbqFD5GX1Big
	8/b5bnsmEBmz99g/nfgQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qketw9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:43:12 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-45a8cdc7e01so48027113b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 14:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774388591; cv=none;
        d=google.com; s=arc-20240605;
        b=FJdAy3vcXeuZ0+Gx8YY4s7u3e7VDiLzZxJ6qoesGdNx3FyEnhbFJVosJPQY73aSye6
         1NpHztMj/6M+5CEX07vjIJVjEkQnMsMRFsBGU5Q62+OMDopiFyUnBfZ+aU6nLUXs/joC
         wxsi1muwEIlOWrz5v5wCr3AG6MCpZ1bhPBRdlxaJt4D/wGy5QGGE4uuTHMDUfMvU+Mhf
         uLps6PAUtHSNsx8zNubNKQCRkzYTSpaT/6Nt4j9qc0MylBgNJXrQFwaI/t/8EL4AWuLj
         IhbPmKeSHma+ShuQKgfMDk0oce2Q6ca+ZZD0I7HhJhDwGbTfDBbYS3CD3RUYI9cJc5zF
         FzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=w58gYwUV1l4ItIeSpmCHgD18qd8dug8WCJaRbNly3eM=;
        fh=sF3Fxpy4r0qfflQvszWsZOL/ZtIa2ivnu6avzz/V+zQ=;
        b=YFHlxEVHuqSqIlOBs81fajus7RlY9FUhMJ7yJn8TpBl9d8J8q2lyrT/zJB2EqY53pf
         hoPWP1x1/nDNksLa7jbcVWjsx6iHHzmhDlABn25CllVbTaE/SB3rBPsEJHbrgy5fOHnX
         G9OIruzi9VWeIKWXM9/YpRA2A9kLb+V7yylprQBGEcJzplyg/ZMsW5GB9T+Lkp4iLId3
         fene5mFvgX24P6YiAfErTsDtXDC1SGEy10wKqFe/qf6My4NFWxUrbsDQDTq0SPs0Bad6
         QMToZvf1KM6VOap0ODMPuomAnsD5PQ3Qvyq2RJXkED6bjuc7iV8JSu1GkL9aFNoeMjFI
         txdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774388591; x=1774993391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w58gYwUV1l4ItIeSpmCHgD18qd8dug8WCJaRbNly3eM=;
        b=H0a61u1N8yNiQM0/VpmW0mveJ0Z/HG945AEaB93yZKyF8v5g46H39LCj5aRpUJ9pEK
         TQPA/ZNkkMlbktDKPOjwV340HpE1fHdpEVDMfkFXHrcrTYSNhYhNpPZ88TAMINjpLvfN
         mHrPmNUL9uOQT0LxrrkdejwyNx7HXptbI7gKF7jSH+0e4fMzTNqwvLcJd5ecYqxfw9qm
         vXO1OlNgUMMmzmMMC37k6pBKjus6rJ5Yy8BeVVz+fB44/328SDEyHltDBAlqu8eg9NGx
         KAazxybYz59Uq+bSkRGZjrmc9+E73hMPDh/OofUAE2FArEfCfd0xfwI/b2yEI6Vo3B2d
         ttOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388591; x=1774993391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w58gYwUV1l4ItIeSpmCHgD18qd8dug8WCJaRbNly3eM=;
        b=RqM7owjterg6kuo3q0T7On3n8BZ4xsncKF4JUkx8f8FG1wrgAh7kBofbU7dMGypfP8
         OGr3HLvrz3tPWl6HNBdgivMEGRJWhQ4cxMHHwfLa4dt4pXA/AkozKHKyDzXiYAqPZ4rz
         JYHdobV8AUWjnlgaIt4QYHf14pf0sHMl8fRPHoLMwuOyRSuuhT3EYBNZ6vJNlO65H5N0
         nV/KieT5nCSqcLspZ45n54a599bhI8Z40lxYevBbikYhNhUuDXJQmsP1xyzrZpjMtdOR
         bjg0dlUENh8BSC7tLklcn6zMrrxwEPowCO6rYwde/iY9nm1W3sVc4RVEiOfCpoM22d04
         nApw==
X-Gm-Message-State: AOJu0YxHc7PO2XlH0WRTZVrBue+eAXEhiwFOiWjJ49cBN2/vlD6zNvdb
	hTGXZ04+8I+cRNU+D93rPNqJL0Jmp//G7/TIqeknLWIwHGBsGSX9flCSvFFJxZQghEnEyVqxdKg
	eaJw4XZSIOfQB2YT7qkBNvnyBVj/kl8JiAt3RrpAkmUYZebjzkoAm+ad0KopW4dDJdj+Fz5fx2i
	9lwMricwOqRAJt+BZXWhbI/9kSDQSTDtYeNmZ/hpVSwV8=
X-Gm-Gg: ATEYQzzXV6DcPV5J08Ei5Kaw0tx2Ggi5IlKKFFxE+Pbz/K0Z66qrk4+Zdj0BPKoDzhk
	qyBS/ZR3mUVL3ybbmu3Tt41oTfAYYBQuvlejqUAvn4ljdaL26M95CH8exRBa04FNUPnsVna54Ys
	N7aoDJoFvXYIhJkLvMVrFKdeM8J0Cj9KrXU/qb7huVfPIvehVfSMPrXSTyX1Wf3RuNbiZeNqR/b
	pTbTk0DWhw5Kg/0kS+3jyZFuJuNvICHXPGcvA==
X-Received: by 2002:a05:6808:c1e6:b0:466:f57b:2ae5 with SMTP id 5614622812f47-46a5c8146cbmr574915b6e.47.1774388591370;
        Tue, 24 Mar 2026 14:43:11 -0700 (PDT)
X-Received: by 2002:a05:6808:c1e6:b0:466:f57b:2ae5 with SMTP id
 5614622812f47-46a5c8146cbmr574897b6e.47.1774388591000; Tue, 24 Mar 2026
 14:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324214033.1219113-1-robin.clark@oss.qualcomm.com> <20260324214033.1219113-2-robin.clark@oss.qualcomm.com>
In-Reply-To: <20260324214033.1219113-2-robin.clark@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:42:59 -0700
X-Gm-Features: AaiRm53mUOBBEXXTGElWNDWMF71f0GXcbkuUdhmcBkK6174tM9DL4iGnCvJUjh0
Message-ID: <CACSVV01pA9rw94joFxaR+mOO456s+d6CYOsmSZzkcjrqFRrgnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: Fix VM_BIND UNMAP locking
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: XfMUEzs6j9Ac45lpIeUuykeIsSFsOHUB
X-Proofpoint-ORIG-GUID: XfMUEzs6j9Ac45lpIeUuykeIsSFsOHUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NyBTYWx0ZWRfX4ZusVWjXwpGN
 Xra9cgUR1R4x3uojRMx+8t+fsilp6ONe2ryWSDhfSO3+QUuqoSNJ9nmLkUZlUNqlRBxCKGp1D+n
 8CwspU5NQW3isu0w6SWUOpqs1tGqzsy6J5VPfr6BrAgrj0ehrt+xuTDxgifnAwXORa0PcmsZdqQ
 NOLMuOgcvXmKlT3eE5eiasrDnJ+Ulc75OomHdB/se9Atc6YjTGmDX6pVGoYFolU+Yo6jzle5hGg
 IVS1o7sdlDm01igfVdzFA2ykZVSOSXh4X6HPX3mV3NrCxEAYSrBo++A/1Zxzxv4e7RLLSPReKwN
 9ldvjQp4nLXMoMEsImOv7CtmVA0/sK1WpIYBoSEd0urlzyQpwUamlXC0Biz/MGpE/TtvveStxgp
 YLFHxBtkIBkQif7l1K4IJ1abUgik7SvcoQic3FwHYmMdeQKSPBA8hqK7Kem8I8l2xH0lIP4grCQ
 eXgoVGytKLh+4SVATwQ==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c30570 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=-h2ecdokoZO4K1dx4WEA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240167
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-99746-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 1DEE731D01E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 2:40=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> Wrong argument meant that the objs involved in UNMAP ops were not always
> getting locked.
>
> Since _NO_SHARE objs share a common resv with the VM (which is always
> locked) this would only show up with non-_NO_SHARE BOs.
>

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/94
Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")

> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 68a8f8f592fb..40892e206dbd 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1251,7 +1251,7 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *jo=
b, struct drm_exec *exec)
>                         case MSM_VM_BIND_OP_UNMAP:
>                                 ret =3D drm_gpuvm_sm_unmap_exec_lock(job-=
>vm, exec,
>                                                               op->iova,
> -                                                             op->obj_off=
set);
> +                                                             op->range);
>                                 break;
>                         case MSM_VM_BIND_OP_MAP:
>                         case MSM_VM_BIND_OP_MAP_NULL: {
> --
> 2.53.0
>

