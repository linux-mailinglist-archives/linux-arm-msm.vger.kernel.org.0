Return-Path: <linux-arm-msm+bounces-91399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAZMKMyHf2lutAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 18:05:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 410C7C6979
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 18:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B49F3007C8C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Feb 2026 17:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FE7272E61;
	Sun,  1 Feb 2026 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knziZfSb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FD64iqyU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6178A126C02
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Feb 2026 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769965506; cv=pass; b=hKIe/EfeHJ9TB9aY0pQyU4tBKXEFSrpuTeKP2KqLUFMdKfVu18dMqZBBLV32DAZUN1F5p3c2Zxm/Alp48yd1jjljjWRJkC4IpqCHoni5zkyP5Cn1Net05k9UKfeHdqCr7MsFS5P+KOLC87vOl/snsa51LCMt5cUrwVMCoj7Yofg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769965506; c=relaxed/simple;
	bh=1ZoaZq7tZHRjGjo2vp49s767yozEwWCD557gLu2O5Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HywHdTkgdVQik7EenrsX5Hn5we77CbSVOAAzvVGQ/MkHoxIHo3SfnYgUgodn5oAhnwY4r0ZPTg0z/+DfTqbH49YWW2s4O5raAsfDmclNneP+dEodgKsuKHf4GNOX33a0q0DbQrSg2VOzbMFnpBukD/6hlhRsvOHbh0UWaVV7f/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knziZfSb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FD64iqyU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6117RvoJ897462
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Feb 2026 17:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=SkQapyydoC0VxEibl3NMUCJT8sClEX4Owo4NznNEdY4=; b=kn
	ziZfSbS+DECA4+DxajVAGMjWymXOX1zM9ClStQQtcsPnvFCkUmoXeNritwf63AD1
	I61t/cCQikGJwKMdOfSizED2f8CElGPt0jrH/uxQSzI7pQnpCTq9VFyNS0veHwcI
	A4rdJ0eHk2pZlV6LkNDDp23Jgwaxl8mYwY8OAPcCwa+RCt8wd3AXGwgCdBGML7ES
	HrwaPZIVv6Oasz0h2/NzbANxi2xLkr/cihPPo5Vmc8VJtosUP1CPPAhQVynAKsYW
	+R3pcm1brUstI8v5ThNlbOb4EjF1KTkOoo8dc9BEgPxfios+24P9HcMFvDprC4bP
	sJDhqN9a5jpaoHq0njiQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdawre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 17:05:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b713fa927dso2955461eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 09:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769965502; cv=none;
        d=google.com; s=arc-20240605;
        b=fN4L5IICM8o7YusG2uSVaNIUDaf9FTqdhAJAsh5GlIZ737YAARnCbrnYP7nIzIcMld
         Lsxa5CNoKqkzIMCJx5HeBWZQzpQg1xtwJjdUxK81adR1/lfWgNrVo3xxsOQJPLYYd3jz
         VRi5VwtfpcNAPE/wl4tggXmkrAAj7lmVKZfR0sCOhzUVMcWlEcpGJcAEnljrpVqHaOe4
         9d0XhuTFKgRotTbOX5eIxtCcOgRZUjHRyP7TuJVeDxp41+zpFWd0XG8Y76QyLiycfyaa
         LeUQKH/yjXAwtaGZpoZ4M01jbMNcRDXeGpw1M/YxnntEilpcU5X76CngoEFBcDoZMOoR
         24pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=SkQapyydoC0VxEibl3NMUCJT8sClEX4Owo4NznNEdY4=;
        fh=SN58MEiWKDAQW0xBUnmYq7jl9RXrFwOxBylyUeQpwEU=;
        b=AJqsUVJKBy1QnViIMQ127/RwEF2AFpsGOt2S5A1abr0LLwwacqBM4IFssgwCflHudA
         RuzyaaYgHI/HVo6fGHtUrf7mkaPOc4MS+mQ5OZPfADc8jwq24ZODQtnfIPeqU9bK5rIO
         KgyE0k/gxpMVmn/5zEkwzv1/0t7kDkX7j25nXDOVGuqPAOeAT/MAQU3KsGMjrWDYRrg0
         8gaZM6ttmNm5c1SSsaEJsDYAipUK6K8gUniwKHqy+bVCG24DIXmOlZd8QhtxVEGM8D8I
         h2Z3kOySj+XZZSVUUHDOUmvy9yXvVi3qRefsIiXQPyb2ZXpm3ZwjtNKNIgKCET+pcR8D
         TSuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769965502; x=1770570302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SkQapyydoC0VxEibl3NMUCJT8sClEX4Owo4NznNEdY4=;
        b=FD64iqyUsRrSEWQ6bfgT1uov3nysaytuxKuimrrk+XzMbtIkZb9ffxqsgcQcy3YOTy
         +LtvlJm123DEvlIEXqpQzhZd3VizEDHQcwY5mf5nOr8n1J/150JH2ti1eW6tUWHaPFGP
         spU4K3o86IslbM85btBWFzikdsbCp2ac9WMevpTIuVNfsDo2ewEH6TwQlZeGclVZPS4o
         fEVkLJRNwoB2R7M6Z0hj/FbWLqnTmRmhXwwWsWFBe3/2DgX0um5+i8dtoVSK1S6XFVEd
         2EEd/fIW18bf+98CzrICO3pMVWhOQ8OPnPzyvbp1N7fTSQf4uZJwmOt8gW1MX5CyaJPo
         15YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769965502; x=1770570302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkQapyydoC0VxEibl3NMUCJT8sClEX4Owo4NznNEdY4=;
        b=L2y9vQN6fVctzlbMN22w1TfjOzC2d/REF4N+m9MlQVB6/O7OcGaITwKM9yOrbaEc04
         siU/oQK2mTEDe/wzL1+MHAF4FlUDc7PmxPN2Fj+ES73fah05MqHRrw4vh35LyI3or1lW
         JxU/Nfec8HB55VuOOj7c4wn5pfvUEWCFHThCtZDcA2buGKgkg9sLVaIvsKUDeogqo37r
         iMvv0IXuMgKDVyH7IpFfvbhdahX2Mji08R4O0nmyjH+x3Qalf3Reywq/eHDzLdGymGGR
         88wWfWW782pSMfZgdUeMdnsWWHs4pN5otB5oVXEfC+r4BoHBBktvGxy6rwewqkCZCozy
         ITFg==
X-Forwarded-Encrypted: i=1; AJvYcCVFf4BqWomza9PCVFs1sOICZRGmnNbGXKUUizdNNMRLId1yC+sq3vDjeGUQ3SPt923KTUKhS2HydmQ20/4M@vger.kernel.org
X-Gm-Message-State: AOJu0YxZnHJ/Q9XRtJ9iIW32r7E2QeCz2iRyFNqg741l9+/SvQsph7S3
	Vkbo5nPayJ0h1dKHaXtQYTrknz2xXBFGPZkNhBjxmxHqUKUzpGdMFgIZLWre8QArqxYRCwZGjzt
	GREiJb09Ss7B91eYrnubJ5oIRlZQQMDpnuIH+dx+ZjZo9cW3zxsTEhNDMO1L4cqYNp3sQfRfgbw
	XDwZjObVB6wcsiul/zCiGJP7ocJwR6uZrHygi7VazCRKM=
X-Gm-Gg: AZuq6aJDlZUbqysEVeKWjBvlMT/P6E/j1f+/S8mWQkJy13XfyqhjLYLJc3hS24i5XvI
	JVx1J7wgJRdRzwmkd5zkplraW7lbpSDQCZgKpzy9MzxXU5Ner2kK5G3jn9JTOrMZ1EWoMIFT8YN
	fKZBy14IhReMrNlbJ4Q4R6pZOu4gaa+2mJ655PqZGKAjcRAVFf4Oh6FeV9TRkw11AvGoFoNvjXk
	G06HuvFAJClRfaJbker/ZdETQ==
X-Received: by 2002:a05:7300:80cd:b0:2b7:b4f7:27de with SMTP id 5a478bee46e88-2b7c925284bmr4461720eec.6.1769965501446;
        Sun, 01 Feb 2026 09:05:01 -0800 (PST)
X-Received: by 2002:a05:7300:80cd:b0:2b7:b4f7:27de with SMTP id
 5a478bee46e88-2b7c925284bmr4461679eec.6.1769965499371; Sun, 01 Feb 2026
 09:04:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129024919.30449-1-sunliming@linux.dev>
In-Reply-To: <20260129024919.30449-1-sunliming@linux.dev>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 1 Feb 2026 09:04:47 -0800
X-Gm-Features: AZwV_QhaG6j-mnqKY8tq2A7j9WPveVOu600Gi_uLKB_kZmvodRseoGK1TkggHyo
Message-ID: <CACSVV03E23z8M7-RETaeyx04f8sHGZf4gcdUONnwMute1bfqBg@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
To: sunliming@linux.dev
Cc: lumag@kernel.org, airlied@gmail.com, simona@ffwll.ch, sean@poorly.run,
        marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, sunliming <sunliming@kylinos.cn>,
        kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: AoNEFDaUCPmCTaznnfweXnUCHSKGA9wg
X-Proofpoint-ORIG-GUID: AoNEFDaUCPmCTaznnfweXnUCHSKGA9wg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDE0NyBTYWx0ZWRfXwKoe4CoOnKi/
 wyaDipmc+Ay2+y9YdodqxhRjgf1zbdMcaA7z00jgzUj3aRhbp5irLSg4yJY3t1bWyXoC3QVnK/1
 f40n5hUF+IOxaTfXHuUqtVrk0WM5XHSVR2AOEfcHCMWK3dy2a/5tDVj77LJV+EPdRaJHz96IrHy
 DLK9WRD6fRKzX9wM1cCLtMRJf6a5uzzLDqe1LHerbJGTldP9cs4apqFKRDp1EzxcU6wE6Tl6WoT
 W6kEprexcZkUxJ4VeOcaSzVBxMQALQ12/Diez8w67gCaua/xOaz4mEeKVIEAD78soJp1eKSXDgt
 E5Jt1dg6C3bZhRJX9W9gqvyPidr9WYchr86CYJO2rWGCQuT8M5tAzJXDAfP++B8+8V6iM8zeZoR
 ig9+YDcBoxKzDq+eS7F8JR1SaeeVsmHSSHJY1e0AQInEDMm6LdjtS4iTA3gGW3DhBNq5oYT2wgW
 eYfq/UZxws8BiOO/tCA==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=697f87be cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=zk_b8o_FbLgx-YkRIm4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_06,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602010147
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
	TAGGED_FROM(0.00)[bounces-91399-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,mail.gmail.com:mid,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 410C7C6979
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 6:50=E2=80=AFPM <sunliming@linux.dev> wrote:
>
> From: sunliming <sunliming@kylinos.cn>
>
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_=
config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> index e65f1fc026fd..312ee6597ab1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> @@ -156,11 +156,13 @@ static void dpu_hw_sspp_setup_pe_config_v13(struct =
dpu_hw_sspp *ctx,
>         u8 color;
>         u32 lr_pe[4], tb_pe[4];
>         const u32 bytemask =3D 0xff;
> -       u32 offset =3D ctx->cap->sblk->sspp_rec0_blk.base;
> +       u32 offset;
>
>         if (!ctx || !pe_ext)
>                 return;
>
> +       offset =3D ctx->cap->sblk->sspp_rec0_blk.base;
> +

btw, in this case (and probably most/all such cases in dpu code that
I've looked at) we should probably just remove the impossible null
checks.  (Although the extra indirections in the dpu code make it
harder to see that they are impossible..)

BR,
-R

>         c =3D &ctx->hw;
>         /* program SW pixel extension override for all pipes*/
>         for (color =3D 0; color < DPU_MAX_PLANES; color++) {
> --
> 2.25.1
>

