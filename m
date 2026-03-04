Return-Path: <linux-arm-msm+bounces-95368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAFsFjpcqGmZtgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:22:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A97C7204210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7522130500CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1549F23D7E6;
	Wed,  4 Mar 2026 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WolelZa6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i96fmTcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D730F34FF41
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639869; cv=pass; b=B+FI/5fKH+qaCuwtVNBVfwEdmvU8xbwOXUlqfQ57bk7uwnAk+rxxNg/hX+NtbTUq+E0id+DrAJztICuwFR7q0jPDyua8w3MQNARkGGS1nGil0R7QjI3kU0+Qp45874PkvJI/WLfPVijTkd25s+CshhsN/oL7gupWdCPxNIRiECg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639869; c=relaxed/simple;
	bh=YRremBhpMDvspXZjbNbK58D5dKHY78bdCYeaXucHyOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDjJynstD7+bb5WZ4xZyrzSW6wlNfIBMYveVdvDA5GepFinalXvRpiFxu6kg5HfWFhsvPR254rHk7BmC3K/ltFsvHAjrYvfXX1CMGKZoNatpOjycQebZ1eRqd9f6lnSLgrqpyA0cIaIEyvfbO4b75rRnQwyLV4e9KlONQ3fkMdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WolelZa6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i96fmTcB; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624DVuAI1203584
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 15:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Kv3iTQKYCHQ+PN2YjozMkKoEokJkDuu8sR+APkn97Tc=; b=Wo
	lelZa6NHmrLWe/wDpEDNupeRnANERRGJDc/H2YoEXAY8R1ORt8z/9dyasJf1rWCA
	VR/xIh0ZVm5el/KDv/ugOuq6cD8iCupthIsnPqpYhbv5OWTGvqYzyJ1pW8XDSNZr
	LgRbJQPFK+6fXQUm2HSk2Y7XPdujash8aHzeF087rc9bkODdrz2J6BLUar0oPfFp
	K3EPO7bZV2YDarbsCVGO7NAnhFg+e9mzV27CryJUwSZUbBBtSniA5hHUfQnQ7hTx
	eWyRc1+2gbJgAqu2T3bbZvUf2fqFVUKE4kxwYe5jcGw2w/ebfKYyDTaPKHiNPKw9
	A1WDOyzw6NzGretySFyQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c1unj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 15:57:47 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-679caf7ec07so125769552eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 07:57:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772639866; cv=none;
        d=google.com; s=arc-20240605;
        b=dGU3v0VqWlNNhHjmpyOGGKyXiYsOHv+Byd5AwkoZoDqCpS2Fq0vC+yO56I8Kt5soyu
         iNDGFf+IloaNLCCMn7E0bSSfKmTs9pUyIM0tPHW/7YuDHVIGVK7V9djh4F+7UEdGAxCM
         rV3bKBnTsFOroZeMnyK7HOkeJ0R/a4hT+cb3jVrg9qHTlFkCkKAdL7e01KHHFAUsc9uE
         hoCphtxLoI4Pv79xLJ5PuhwdM6tF2E8/wWFDpXLPhAkmHd/ceWLV9ulejSGurftV69T3
         TS42Y9ztaoW8ieU8kbHL2s0MlxrQ4uXzyMLWAWvXSPujydq73AAIZE5g4XO+8m6waPO7
         kcng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Kv3iTQKYCHQ+PN2YjozMkKoEokJkDuu8sR+APkn97Tc=;
        fh=TPblhM8bWp6yW0LhDnubHJo47Vtt0/p8+7KUdX/OopU=;
        b=d3zGc3Mj3FrgHBhRFpSsmf8mkaGiBbfhwMR10XOJ2mUzGE36loFrJpPLQ9Z1BRo4Mr
         PXhk8OXEmd1gpjpFZKpi6gOlWP2w2IQI7h+BrwX06VOWYMbX0yEiWVrrjf34CG2w1Yao
         9Aahk2IvOT8SmIOynx/Yc2/jZK9CQpXMuWtd9vlMOn63Ah4vLQLqkxg1J7fU6uM9ZK2L
         /nQfso76G81S96ehch4Kp7B6PqdTn3MhhC4BjMsR9gkF8UNiw3/xnlaSFDrsHAySJU7Y
         iYBEVQ7YzqRJw42TLnBgbenY9lpqEER8r0dLgo/3HxwrVqTPNNEceORAvsXo6bzC0RGw
         dZBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772639866; x=1773244666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kv3iTQKYCHQ+PN2YjozMkKoEokJkDuu8sR+APkn97Tc=;
        b=i96fmTcBJ2AbqyAw6ZF3nbWQrWiI33z5sLqJv/8TPw0ECAFrnEcH+khXqNtK8FQSnh
         wqrPtQV3nmnujYi5eZNcQAqRQwyca5G1T/OlZh1wAmk0mZHCTmOVQyEHW+XAoYkhgVio
         j2GJPw2zT0dyozBNliZu3SHh3txG7K6t0zlqhY310h5tnRHK7oJCk0nTGlr6Xnfm2ypf
         xiaMJoqP8N6GjpXH7hRJfGy6B3dqBoLq5UV1LNkrN10I3Djuvpj4mUyY1mzMaSnKaCAX
         FN8dvvBXLsdyN6KBqn722YBcxw1AbRdF3Z1m4BGLt88S3WXfG0NxJulx2dfvS8OSjHfq
         CDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772639866; x=1773244666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv3iTQKYCHQ+PN2YjozMkKoEokJkDuu8sR+APkn97Tc=;
        b=U/VMNwCTB1AKxehn0lhX8jwVhJkyKF+3yO5zolZUDy6XGBhXNGxDBNYQjv7SUs9w4J
         FDo9EACu6I12oe7DEewJSO3p3+V8MB3WWw/19itMuApurA5IRT62BFbgwSS5Zrm0gnkr
         3YUcKIXxyfd0rsKhTcaHjUOYtjd81l7J8XwpyBgwLC0NvedJwmywxB0YQTEQ+Zs3JiFh
         newpqPN8pPxy3funSHDqbaU8q+3PTyrqtOasylEHmHkN6+3jXQa3W4jGs6yvma+hHCNC
         ogIToHZ4YM1MW7X6TUC6lKzNgIbaI4JZdDIzWj67m0KCMQvNQmJ2wHkRH7l4pLLgE+rp
         aklQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjC4WjZDwT4Mo/HDTkZ8cIRVEYucipukZSWyHBeMjLe8x2A1yMRzQ0WtBGR/EEit2rLN5/etwnWbM9E9UV@vger.kernel.org
X-Gm-Message-State: AOJu0YwCN5obG6GaU3jHKyLsMYzNmSV4gadUa1/Y1FdiINaHgw60l13+
	9yfSYhWep+nUC1u3ZNiBcu1VfdAlSPa8eztfjWMGM/+/hhuvLJ5aABAHTIPmHSo/xRHJ4Wb9DTh
	sqjsteL3vGKS+5+dA3dUAGN49Ha52qyAwOUv0YJ7UhAp+7sTY1VVJjPy0y/WuV2VfjN6BGeRF6p
	2vHy51typo4WO7MhEOEN2K6i3pOi6eK2IjYvQHtE2pLP4=
X-Gm-Gg: ATEYQzyM41NwOTA+mP32dd2SkwBmbifoy7QY8x1IwqiixOSjnkvfAPWLLHJfdm6467R
	65CiazOf39nXVW1TBc8BdhEG2dY/Nwdy7ns2yZfYzDjTJDfkwhoqBCTEK28UZGlPOUoZY4RnyAP
	R43K8qJBWFZdQ4lb9g8aboD9z514IOodiFWfHF9y2JWrud9yP7wsGc6mFHswyxeiUyFT0/S88ol
	IhbP8z64WRLrFebQDyOm5TrqhweBPznJ7kpzQ==
X-Received: by 2002:a05:6820:4dc8:b0:662:f61e:75a8 with SMTP id 006d021491bc7-67b1e900656mr1373730eaf.65.1772639866300;
        Wed, 04 Mar 2026 07:57:46 -0800 (PST)
X-Received: by 2002:a05:6820:4dc8:b0:662:f61e:75a8 with SMTP id
 006d021491bc7-67b1e900656mr1373716eaf.65.1772639865944; Wed, 04 Mar 2026
 07:57:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
In-Reply-To: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 07:57:34 -0800
X-Gm-Features: AaiRm52LqeFp_ZlAVTlgSy7x2OER3B-eQnSoEBsoKCq6ARMGFzZBztG4DTaj6iM
Message-ID: <CACSVV00Z0gDW8aGOvO_YaB6AZ7cOR01mTsCHZvxp0qeO85Mqdg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyOSBTYWx0ZWRfX8DxY4DrbXec2
 Fjm/TM3y0UUZpXVbOpAj6GThovQfBBOusqf6pMOtA4/DR/W/0mwjvPnUbeMQ6cbS5upbB+x7nnF
 stnHLXS8mx7F54Ie/k22ikA1M17cGI5lvXjgQosczOayeD8TwdPDfefGfFON4qm3dYbgpA4eOKC
 5S2Zbj0k0FIfQ2WDEZKvKnoUp1139SRs6m7GE498A9cgOQZ8hwdMe6en+ILCJuiJzIz4O1VHwFT
 FdvOd7z4Xd4IiAeQybbjAsSiYkKjnxVCgh5+mbmlUhEuc0u5C8MtYTRpLCfPVocVoT4Wx1sDV5h
 uPAwb1N4Cp9mmzDiVoANhVem42akBKxuegQvoML4aBClGpha0S/8dY8b91qaT1RLpzOFbVpPUJk
 ZBqxEsZ/LuRAOn2ztU8slaXxC3sB1LmtF7aKNvqjacBFgErsJG4pdrfPDnGUhOFubE8nCLSn60n
 lV9VL638xodGNhemmCA==
X-Proofpoint-GUID: Ew1yK2nfbPUS8g3WCwEGrXIp2F6bMnj9
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a8567b cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Ad23g6fO8UNhwhZctZsA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: Ew1yK2nfbPUS8g3WCwEGrXIp2F6bMnj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040129
X-Rspamd-Queue-Id: A97C7204210
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95368-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 5:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
> KMS driver, imports them into the GPU driver (msm or kgsl) and then
> uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
> the ioctls away from the KMS-only driver") dropped all IOCTLs from the
> MSM KMS devices, pointing out the need to use dumb buffers, however dumb
> buffers should not be used by the GPU for rendering. Restore GEM-related
> IOCTLs for the KMS devices.

We shouldn't be exposing DRIVER_RENDER on KMS-only nodes.  If msm gbm
is allocating from a primary node, that is problematic, since there is
no guarantee that anything but the compositor has access to the
primary node.

BR,
-R

>
> Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only dri=
ver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note, here I assume that dumb buffers generally should not be used for
> rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index ed2a61c66ac9..f82c9a36a166 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -799,6 +799,14 @@ static const struct drm_ioctl_desc msm_ioctls[] =3D =
{
>         DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_R=
ENDER_ALLOW),
>  };
>
> +static const struct drm_ioctl_desc msm_kms_ioctls[] =3D {
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_R=
ENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_R=
ENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_R=
ENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_R=
ENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_R=
ENDER_ALLOW),
> +};
> +
>  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file=
)
>  {
>         struct drm_device *dev =3D file->minor->dev;
> @@ -868,6 +876,8 @@ static const struct drm_driver msm_kms_driver =3D {
>  #endif
>         MSM_FBDEV_DRIVER_OPS,
>         .show_fdinfo        =3D msm_show_fdinfo,
> +       .ioctls             =3D msm_kms_ioctls,
> +       .num_ioctls         =3D ARRAY_SIZE(msm_kms_ioctls),
>         .fops               =3D &fops,
>         .name               =3D "msm-kms",
>         .desc               =3D "MSM Snapdragon DRM",
>
> ---
> base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
> change-id: 20260304-msm-restore-ioctls-2a1792311a09
>
> Best regards,
> --
> With best wishes
> Dmitry
>

