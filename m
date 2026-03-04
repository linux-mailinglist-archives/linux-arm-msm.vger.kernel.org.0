Return-Path: <linux-arm-msm+bounces-95355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMniJqVMqGnUswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:15:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 127BC20262B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 631E030B3766
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D853B3BD64D;
	Wed,  4 Mar 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WY/BEjO4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlQtZ1pF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880EA3BD653
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636290; cv=pass; b=IkwAQFIC+nsdXh+R6c6Vn8ydg4Q2nx1XKVSJT+j+cw5nMwrKLyXHdzgQ8+wMdHX/CltWFGkbxeW09j+6fO19KLpKouPRrro71bvnowvlDCFoHpOdRq0fH5wgvcDhp20Dnlb+WGmhnSCKJORhjlmO5zNMQTtcjqe1QQxczegx/PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636290; c=relaxed/simple;
	bh=r/OY/SJ52XmQNj48zMKVO3oYTLFCb8xc+me9l5lFzEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8zi1X3fhgoh0j0M3Fotax6zDnuJyEvr4mUA2WbfH8mYMldpT3wm3cAl+tRmXfxu4wIyqUOMm4AnbNmqQITS+LEnnU68zOdX7Rc8HLz4316XiTW465RLHm4N0O3vP4T3ecY/GiltyLGGW5SpBgg0cKZpeo1mWcXBcSde7Zx7bk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WY/BEjO4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlQtZ1pF; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624C6oeT2275085
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 14:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=omBgwrHvKXE+P9pB2FhWZ96E1Q6381vjXW/UYlEF0Io=; b=WY
	/BEjO4LZdaAF9glir3xPU/z9xBx44gUq6lbFe9vjdv3np9WIRbLfPpFi00BplV15
	xeOgKyftxk90UPRM4pw/Ej+L1NM2JpEPw2hsSobLFCyrlffgdU4Q4Lcwah/GRsMZ
	RRI0VCbjkqx6EvkJaAFFS4hlX2jeUYq0CfNA6CZwW6kdB8c8rpqo9b+J2lum9r7E
	edS0gQdEso0kgGv72Emmzgv56atqOrpcbOoRevPOozVzcuffy5g0b/YtS7mbA+zQ
	XpYbo+C+XhcHLhd50zf64OW1t3hhxZrjeckLUkRnTVFKDeLNHtiTIkz0vGIbv8aY
	xux2mT/b8HAFjbR5u1ng==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4mt792-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:58:08 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-45f1665f706so65920028b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:58:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772636288; cv=none;
        d=google.com; s=arc-20240605;
        b=PtM7Dm8DgnYIARHMl0xl90XGE1hM5iRk2HP8t8yqyevgvAU65iMT4sZ7i5B5CRbc30
         MH23maZBoFU0JoibqgXlUxBU+SoQ72aZaJj1gFH5zQh1ZpsccLLXItl+KNcInVsSPl9f
         1jsd9jH3D3PAiJU1Dsnnm6fvqWonwa9SyGa8t7eHAd98M/zrq/w1C49PCXRZSdC5Ln8A
         EfLt8c4lrww4m/3cbL7C9MFjF0CUqxkU/lgfj/TF1OJHwWTZQVJLXds04kcSi7BRI9UP
         TyCyzc13h4+3kmtxXXJGLwpseUuxXSzR7PTaaFS9+QizTaqordxRK6rMgxMwuvRtdH+J
         NHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=omBgwrHvKXE+P9pB2FhWZ96E1Q6381vjXW/UYlEF0Io=;
        fh=K76x32908RTDnrNhHY3I2qpp5jdVfhqVzO3EgkJg2lc=;
        b=boPwaYBvUHHxr4zycJSbAO18PDqnMRo2HTBfKheQ+r6KlGxuQaA7x/FHXL5GR6MlHW
         mUI8wKnkwtGY+tNBTWv1MlgyTR9YIF1d8D1Des/6ZNdlSC0mZLwwne28WobRviclcx/5
         0nGPhwXOOfX7QFbQV1JxP7lQiHeEWcAG+SjUEJ584BNQbKscgRRcg49TrwZNc7qdTGUM
         x47Obfn1hOFjuoaoiPX8dsL+uxe6tKqC4D2uypM+Jpuux6RjRVsvAiRxlLEbwrw9H+c9
         FTxWajhpgCLRCP2ss+1blTs68f7x9xFpm1pox2z8zfqvSpowD4OQAbFvZeLeeAxD9brM
         CGdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772636288; x=1773241088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=omBgwrHvKXE+P9pB2FhWZ96E1Q6381vjXW/UYlEF0Io=;
        b=VlQtZ1pFFL9l3XURmJwXowuTQExC+mJAWdL2UXesqPlVs9afqYdLtlAnK6ZMV5AM/8
         Fg5O9O/XBY6oPmaRk7ac2NxYWB4tF1wdcFW/bqyUEKfq/PEOQXqqjZg5UD79mTairjTD
         NSV61m37x2cpr05ndeQ+HbYEnVTE7ncUhif4ivY1hx40AsKQcoTkiONqWYoxXiAkqy1Z
         nQ57UxKHgfKchpXV9VCz6sbQ59iom7Y1D0c7IILqHXEonQI6mO8v/e8IN7UZ8CdpHIpj
         pRFeQAxWCV1JQ6JiZhatmfZ7XYGEzSLwza3jPNSsJeRFirN0YFrkgzQzRzUdcTGld0n/
         nRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636288; x=1773241088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omBgwrHvKXE+P9pB2FhWZ96E1Q6381vjXW/UYlEF0Io=;
        b=fgJoebSPHGDkpjBmwsikKlMS6X+dFv86kXfkkbeX/w9gopukNqvH+vPEtgi36PN6H1
         xn8DcEu4ow7ts+zmpo9mde6Js2wuCI660T939tI6WbnmTDgpwk7kwpwOGDLQRdNfZOyt
         a5d1xPzVFVuyot+/3imvuD/xAKuVeBSX1D/xfxm/gr7b5WjH5yAhXthbnf+dZO/HOcql
         jkwTZMiW0kaXxarvUWceY9wwP4c8lCiPZd91v8FEIKOjWRIDgq1Z/Y055QILHi7cj6Y3
         Ot2hVChL+8tdpoxx4dC+K46XzZ2kFQeGU8MJ5OtrEV4dkxcz5+SjJx0C19HdRuG3HAKw
         RZJg==
X-Forwarded-Encrypted: i=1; AJvYcCX0L6jSztXkhvWSvOaGwd9GwREgQfVA3zatLS/k4HcBFqI8KHJpVkfu9lMEx0VegIosSFXfhUTf0xoMMPO4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaocjyw64BncE5njR6p+KoAfLcifyQ7jsuvDY2KlaIV7nhi2jX
	Dsv0cLruRGgJAYxDGkqNIKUh2BJf/hrO/suxtjvnLQERlt49uFf8w8u8egJayCQpgFTMINBnJ3k
	EHfBU7uNRLlfyJyaUsrsjpHmEauLMwHGQLC9X3zL8FJrqZAK6FcVfWQEPhWpqf8VN0NSblP1acl
	yj4pffS85RAhZaTleNV0rNScpeEXO/tTvqekN89tJlPgA=
X-Gm-Gg: ATEYQzwYs4G6Kp805F+Xi4+6TLtYkoMGFKtQiDXUCvT1Y6gaBqTOd07ZI9xjhshBCWS
	yVyMkzGgLSr0We/gnT5CxVjvEzCFZviJQX5FUMYMl+JJ1D2hnKpR+0QtzJ9craPoVYhWtxTsK+j
	r1sPYT0YgGEnlxE7WzHT0nqLu5I/5YsuUUV79ZWaRuhxNEzY6QcqOn7qq62tJEAJQyFyEODu4is
	Qc7RZu4I58w+2Im1PS+4OkJ6MPc7xDADKRx0w==
X-Received: by 2002:a05:6808:1a15:b0:45e:dbc8:4ba6 with SMTP id 5614622812f47-4651abf594dmr1137094b6e.28.1772636287759;
        Wed, 04 Mar 2026 06:58:07 -0800 (PST)
X-Received: by 2002:a05:6808:1a15:b0:45e:dbc8:4ba6 with SMTP id
 5614622812f47-4651abf594dmr1137091b6e.28.1772636287437; Wed, 04 Mar 2026
 06:58:07 -0800 (PST)
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
Date: Wed, 4 Mar 2026 06:57:55 -0800
X-Gm-Features: AaiRm510BWQOzcaRQJu5XH1Rs4Emomfz4BHH1U5plIfKV_kPq-LoPPkImEc72bk
Message-ID: <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: I_DmlE0wwglhlXr_eWTqz56fgL2auwkz
X-Proofpoint-GUID: I_DmlE0wwglhlXr_eWTqz56fgL2auwkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyMCBTYWx0ZWRfX01eZzFfYTIkm
 mz4SVoKYwgK/QP45Q+e7Tl55dZbPiAGoWKxgCrK84L6eJj6tn9358WFKGRkuP5Wc27Tze8RnA6G
 Us/HK1Pu+bSOh4LQSw5V7gYYh7r6OCGjykcK+zrXFyVR5tLoe1WyvSp8WXzqE+b3m12oCYq/fXY
 vEy1jjTNOBvGK73poTy9xJO8qYkq8wnuf5WMvdy/9kQrDfgdQEIw6HvJ0tf2EZa1xpseQysfDmh
 kvGKBnjp7rtc+gJcYamhTMLtlHdaNjSK8Y1ULcew5hImVvsYM13cHPufp/1hO5KOPD7IwHEyRnd
 mIZQpmCQgPyA0xbzDVgEWOVnFFo2t2Vpn7CKdGsPHBjQScnSeKktg0ZNRYNw1sVmcoZ0dQ/o5Ev
 CG7uWVVtdvvk7CFKwqUrP+WyHAnk3+N373JXWdKoDcRkrO1t/jFpIBmMlwBC5zytDPfORt5VMhu
 xa0N7TdRoLgvn/E7m7A==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a84880 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=Ad23g6fO8UNhwhZctZsA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040120
X-Rspamd-Queue-Id: 127BC20262B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95355-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,qualcomm.com:dkim,qualcomm.com:email]
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
>
> Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only dri=
ver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note, here I assume that dumb buffers generally should not be used for
> rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.

That is problematic in kmsro.. (but also unsure to what degree kmsro
ever got used "in production".. the x86 drivers don't use it.  Android
and chromeos didn't use it.  Etc.)

BR,
-R

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

