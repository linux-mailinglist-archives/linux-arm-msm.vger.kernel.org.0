Return-Path: <linux-arm-msm+bounces-99404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wChNBnSmwWknUQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:45:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9B2FD695
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F17FE3005ACB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D3F313283;
	Mon, 23 Mar 2026 20:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7fj8rLv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExaTiff/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6AE3E4C70
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298733; cv=pass; b=SDdy3jWbJ5Yjs11C6uVhP2S+6Kl6/b8uaqX4X1yDk/5iZ+tRs7cFPntegIDoEoIUvQ1w6sVddftOFHybuaFm4igu/9h60CcFtLD/X0mXd3uZ5rWmlfem8QhVDV0XtmQfXXARsaCsa5nX6e3cxlmhAHqd3ey8TRIPBklfOs1JKsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298733; c=relaxed/simple;
	bh=0v76qQMNdu3z/ty2rtTqihu8ay0laDcJuuVN3osZAq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DX9pmmDjfO6rglXQeKKYeTC4G9XAIeFMvwAbm4LY+hWXv6OGo4XfZ5j0ZvZA0MT0XiY1yrpOIPkWoBQJwV2vRxjKWw7fn0025864ig179WMuG84F4VHjVbW3LTBV5JEEaC5kvAqBwc03dNcNiDP5LquBWIIIMKSD/OQAC5wPjsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7fj8rLv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExaTiff/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHquE9618692
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=bNj1iPSQR5++rIXMtXYMWNLEicRX9e/nU1RQDEWyQwY=; b=E7
	fj8rLvakvV8On6nETPNgnnKgHwDTGEBulNMP8rkCrL7guoltEHVqNQcB7jd1uQJr
	3WUkVzcXmVdpgitU2S2L9TDfkpbfa2JlqWR21O3OU/xWUyDYsRUz9zbVnGBYkyTN
	XFEO1atCCCzRvjR3+smpJvNysZ5cJvBh4ofW4RV8u5tG/Ia0WhVf6iQA6YONGUh+
	N93PXFA+nydzL7k3xBv99YWd72kQFSbYeJS8c3K0npHH7FdrdRI3Is/R3lSqRO2v
	z6/LSwidAJZHBFN3dg7wm/5i9LIb/OtC2QExc7X7D7gDc5sAKeHIu+grHOVm2B29
	IOBcEigKVKnT/8pFFUjA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgjpg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:45:28 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67de56b5bd4so29934467eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774298728; cv=none;
        d=google.com; s=arc-20240605;
        b=E8F/y7VQTUf9kyIMxwnvKvnGscPUka/dNyo0CvVzBJurZQTHuSO1xrmWw42viWWvCU
         SmKnbhawgvzbKPqRrFYHiGzzYj7qn7ZOAkISFvz+CCycQVzwo25RUfx4FXOhtdPDbh+t
         37BIga/wgdZkqW8/nC3YXBTGJD9xyYNYYUkckA4cIynrzWaeto8ZF12Wc8hxnknnd1Dm
         AsnxBu/hLjpQsiA0HbdBAa5uRtLbp7ywtFFFnzut01uOlApl2bPF3Vq6D69xZ2d70/44
         fJonkKm+8PL9FlEvaALKzoJIbBEETh02hoUOipIZXhmO0CODSilmJhOZn7w0wBAC5LfD
         9PXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=bNj1iPSQR5++rIXMtXYMWNLEicRX9e/nU1RQDEWyQwY=;
        fh=5VwexUBhul3nf5DshD1DR/N9GjuD7wvIGoYFUVc/Xhg=;
        b=lCIfjYRoJuwtQdGg3MVhrwK2nGXzgw0Mq3joVpC3/EKSJuY3Iy3oFS9JTPXjerVdPZ
         900lHFaNjp4AYfabqysUWkXlItvdHjTG5ESgAwBfAYCxvz5Szekmhge1eBRn5eTvSaek
         DcRmauT5oFPCGrutHjAiL8HJmiznWXigwfO/HJP2akzoaG3YspqjQlqeEYLP+JoBKt2v
         LeF8SPprgKdVua8BjyDqAwyvSUY9y9ZHIfg8iKmunF2r7eSvpqcA9wwdaqTiDMrhv3MC
         /Hd+gBbqNk3c7728vSeY3eMa/dWlNpATcH0GUbgKSVYTXE6o8z/hyFTAHn4DmGLrmGeE
         gCrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774298728; x=1774903528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bNj1iPSQR5++rIXMtXYMWNLEicRX9e/nU1RQDEWyQwY=;
        b=ExaTiff/aUGCQ0HqJRZcLooTWhm9c+JjlXNO4HvZ7m0iYkZh+v7eFo08meuhtGR4tt
         1xiHopAaPnrjITyc71E8++BMKEKmaYyuExiTkZpa3P9yyb8nX8fZCyxaNCqtFKaPfBOH
         Za72bRI4Nytf/38mekEgd4FqIVeji+lwNbWL84wGBl9pPdAzdROTBY+TQsokuH+wtHaV
         xltQuSvPWATlmf2JTmGnpL9Iff0J9FcJjQ/6MPU4Vm7bwz0yfVL36vJVa3BX1iJKpz4/
         h/q4cbdMfcCPUZmkiDlHSUZL60VjfxHQVwEflGpEsVzn3zJ3m/oW+uEgi3UC6gp8xlDS
         WHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774298728; x=1774903528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNj1iPSQR5++rIXMtXYMWNLEicRX9e/nU1RQDEWyQwY=;
        b=Ip+7EHwDBm7YszSPM/8ajZGsXNwNQJrheKbhsAkQnaS5OanWzpBE2zrOgqknLk3H6+
         cGKGf2ujjvHPd/qbHmaDQylRlom0JW3SZr2y9x5gMW6sBzAfR7xmbh7c6GYfQWQztpth
         hWlbkCoobe0PnqSBhD4J7UdTqtj01EgZQC5qE0zHtWmIsrH44y5dK0hxbpUNbwz9ZRkS
         f7xJ6irI5tJtwfH+rXu3PhWt1IfuuWZ8p+0RDtUvBxbYJKw/Ulf1tMzLWsxIIIehFtlz
         AtlulmVM/pRv15CLxu+lHMEqUUDZ1wqIqmc1us64VVfY5wFrU6oNqsCMLtV1loPRgEEx
         Mqlw==
X-Forwarded-Encrypted: i=1; AJvYcCWkRahJYYw7bzHqZ0WOmTLHf94gd7DZNA771PbQZs/2aaCr8aiJxQVAuvsD26imQ2qZ2E6WVNsOACMwawDw@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ5HD/bizLY4NmExNSpirQ4qmnmp7DMYRQS7c49sthXbciB+yR
	kqFXPDHJN2RmrGmsmFXJKKbSP4A2KaPhfwZ5A/rTWYQFXGnqV07/fHxHueaA/7LxWbYXplIOCb+
	DFRe1AehobVfBTVSmj+I3cZhSo0t2VdSX0dyPqoe1alrxkY7X9B9XK9MZ6id+7W0EAGSlU5mgXM
	scich3XHv8CWMdpSIeByArH7KMh2EMu3pSNqVGPrZbzts=
X-Gm-Gg: ATEYQzwA1dcvwYLpqNPtQJwFrKGneqKl/y6A+a0j84QGkfVFGLNaBDD/qACkGB7A6l5
	vkTMwrQtVL+Je5SIg/pkhtBAe3lJJhS87gx+WbGHYyksxXIRWSaEf+DgWqQpKwKygzKSLb176mI
	Kf1TmGetVYhAKe0SPWBgP58IwP/gikz/cNPSVLmqh8QLBz+fBiHQngC3lg7YXYhSlAN8o/PS+1s
	chVoVWXJfhTwvVubsG4LzA4oOGB4nmzzUwD3A==
X-Received: by 2002:a05:6820:138b:b0:67b:b01c:5899 with SMTP id 006d021491bc7-67c22f90a00mr10907290eaf.56.1774298728146;
        Mon, 23 Mar 2026 13:45:28 -0700 (PDT)
X-Received: by 2002:a05:6820:138b:b0:67b:b01c:5899 with SMTP id
 006d021491bc7-67c22f90a00mr10907258eaf.56.1774298727715; Mon, 23 Mar 2026
 13:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com> <20260324-a8xx-gpu-batch2-v1-6-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-6-fc95b8d9c017@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:45:16 -0700
X-Gm-Features: AaiRm51DPUriZJa4xwXTFaW0t808zMAtRVIV2EXrdcYsElEvW_klRHWZS6FmivU
Message-ID: <CACSVV02XkyT-om4LQJA_Xa-4Z+B5aKOPU_3uxtwHCa1nMXVUKg@mail.gmail.com>
Subject: Re: [PATCH 06/16] drm/msm/a6xx: Use barriers while updating HFI Q headers
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: VjMzCrKdpkZ1pNvxJEJLucZ7JI9wB-Mx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE1NCBTYWx0ZWRfX049rY5k5Ikqv
 cnTREy6p2zWkWEnUgMFpS/TzOet5vDdQgJZ7wOYZ/JffWgcZmSvk4zouN8jEpBAGBmqh2KGZ7sh
 /JorgH//2eghCRBaRkgEl73ILBreeAfmAPHrgQGQeL1OIvLD6boqAGOscCt5b+ryaSW2m2hf/+7
 TYVpH4RDehOmSl2XOQ7wDdquxySBCPE0S6P0xuOJ/Jkz+uZZWkho0LkHH0i+0MVkO7W+GRbF58a
 zDP8tt0uI4N9CuSJ58TLKHcYbUjwAndkKeceypi/8WmkrnUPoeWghL/PDDvb5mwF00dhog50ZNE
 Yx/gVmOlsOqbN3AULeOPO7TbVuX8AaAelM1g4AM/VpUUhGg6kmvAQuazqJABkQ9CS5duQWmpbzs
 rZ5H8/vLbtkC2kLYab23UPMlt+HqX2hBzX0Zqjdrds6+vMmGyxBI+goQ4zEYd5dTay68RUxa4dY
 Ikd9VLCadVIFz9hRrHA==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c1a669 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=EN7PASqqd2GOn1YqBuoA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: VjMzCrKdpkZ1pNvxJEJLucZ7JI9wB-Mx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230154
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99404-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: C4C9B2FD695
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 1:13=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> To avoid harmful compiler optimizations and IO reordering in the HW, use
> barriers and READ/WRITE_ONCE helpers as necessary while accessing the HFI
> queue index variables.

This feels a bit like it should have Fixes: ?

> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/=
adreno/a6xx_hfi.c
> index 2daaa340366d..aef00c2dd137 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -34,7 +34,7 @@ static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
>         struct a6xx_hfi_queue_header *header =3D queue->header;
>         u32 i, hdr, index =3D header->read_index;
>
> -       if (header->read_index =3D=3D header->write_index) {
> +       if (header->read_index =3D=3D READ_ONCE(header->write_index)) {
>                 header->rx_request =3D 1;
>                 return 0;
>         }
> @@ -62,7 +62,10 @@ static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
>         if (!gmu->legacy)
>                 index =3D ALIGN(index, 4) % header->size;
>
> -       header->read_index =3D index;
> +       /*  Ensure all memory operations are complete before updating the=
 read index */
> +       dma_mb();
> +
> +       WRITE_ONCE(header->read_index, index);
>         return HFI_HEADER_SIZE(hdr);
>  }
>
> @@ -74,7 +77,7 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
>
>         spin_lock(&queue->lock);
>
> -       space =3D CIRC_SPACE(header->write_index, header->read_index,
> +       space =3D CIRC_SPACE(header->write_index, READ_ONCE(header->read_=
index),
>                 header->size);
>         if (space < dwords) {
>                 header->dropped++;
> @@ -95,7 +98,10 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
>                         queue->data[index] =3D 0xfafafafa;
>         }
>
> -       header->write_index =3D index;
> +       /*  Ensure all memory operations are complete before updating the=
 write index */
> +       dma_mb();
> +
> +       WRITE_ONCE(header->write_index, index);
>         spin_unlock(&queue->lock);
>
>         gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 0x01);
>
> --
> 2.51.0
>

