Return-Path: <linux-arm-msm+bounces-98773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FCVAlYMvGkArgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:46:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E1B2CD1CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC5E73187E8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A359B3D5675;
	Thu, 19 Mar 2026 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JV2t3pOV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyyGMCs9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC603D8107
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931489; cv=pass; b=UhL9D+4z3FewkwwmpithYbCOmmh89+1mWQDDrskw/9xP/+PWnsffh0x9iB7ZrIjE0d+NtflyHu0Ix/lgQCAZ8vSqLWvHUT8wGtFuKzxMqkWaLoQTze503e2kwZ+CNMn32DJ0Kil13wDAFsX5Jzxmxkt5YgLJ6B5jl3btG034cxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931489; c=relaxed/simple;
	bh=iScI2R+wXgkBZvtVOrn5WpfJEeko1N1DqCz/XnwMYSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpIP82KVEcJJsN9BPPQkeOiV1Ag/R/H6smxFD8yHm0fGCToo1aVCCY1U1gegGmDS7wHHLHoIEvsPi45fbW/hDjoXVg78MihrGg9FnWMlzAgFD2JvPCnnqc9dmxXIyeUdjo1k/tFJ0BX7TJT9EtqNS/mbMUxBvLZQYKVlb/QyFlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JV2t3pOV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyyGMCs9; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74A4X3369825
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Fyi1yt3nTs/xAJSqJrKxvPcn4db4szTYDVPLo4lYLk=; b=JV2t3pOVdBSRpfgA
	iIFRAg05/206birVMfPQThVb06GnTPe+Sfabr7NrAyLW4qsp0uAVc2oCaxaBqFBA
	LTCI+KTg7Ee7Mk7byL3tO4da6fFutzM+fo8alxmhSy8Y5jO5EKQTWGpZAOCHjumt
	EXZclBtKPaBxDxjXwf8KZPprVrjEe4iCwTQ784VLohfuDZ/H+nB6uAy6xJE/QUgo
	VKqfJFD2PN3KSfpqZGNo1ToxBjI1UaaSOHTyUyHGZUtQMs9ymg7b9E5vDTJgeoBU
	K2h5OpNfZIv1fQFG+7aX5It8YIWS13+m8qPNVy1HxDRixlKeoONWdTz+fu7RIBDu
	S80+OA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9kj52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:44:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899e89bf366so66339146d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773931483; cv=none;
        d=google.com; s=arc-20240605;
        b=XiunZh1zy9dHigvgUEVWCZ9Ci4KLreLGoURTGKlvneGBXz803Q5XMz1FcFuDGyxOoO
         g0HpzYz2OKKFfaukXryHpLri2qXSr+BMDwOMiCkiBaiuXeU0PPlwrmdiN/E/2kSCVb8c
         d4+ewlD2h92vMhPhk8p/GE2s1iXVjXWSL807gxNAzeqP6EZFBRgcwya537xdd7T4/rKZ
         +l2kE1A3GrQEAi8nClNotJoLavwvAnjHK6XdGAE2KQ8BVhWRaDYREPbXlpEbwTbcYpFB
         YSEtQPcYK6N6g9U8CbUXPzG6Hf/b4OzNSouzdDExvf4zPjy62/8YfFHDRi7MHNwRLmjf
         +toA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Fyi1yt3nTs/xAJSqJrKxvPcn4db4szTYDVPLo4lYLk=;
        fh=4Nfz4MqQGk75KRBi2S+i1jEk/Tee718yZ08vrZanYcA=;
        b=I67bYjtuz0NQcP02Nvnt5Ixzg64dlfh9RSC1NtY7CPxeNAEqSj4YaaHq3+pbARrAf/
         cchbVCpvbfOVfH+bLJz5LycCp4Hwj09Vrp19ojYhsuKsuKdra9I/CvpPMC1rwushDx8w
         7wf0lcef+OvIi4bxZV3a+KQzyIEZ83YHYB3nhUoaxLFfZsWA0gar/HviSoiFNSFxiynE
         2X1e+99Yk4oV5v3+o4l5i5K8zf3ysiY3hEz5ysW4ruKVLFzNmmX1ucyFV4GOwkMxByoe
         znsCnpcrN+3YkQMsbTy7Jy+Eq6EczRnXRKvXaWhI5qoPuwRHWTyHO8YcLOqafpturtNE
         gjMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773931483; x=1774536283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Fyi1yt3nTs/xAJSqJrKxvPcn4db4szTYDVPLo4lYLk=;
        b=MyyGMCs9qJeWj9B03scX5KRXCr1nzdRj+d7Oybfj8wi7NgQ0QUPQSjkxWXd+cMgdDK
         8BVsi/Kg1wx2Wcptaeisy96ZF3lPvv1vRMlMxGsly1dbU8nTjft2dYEcAXI1q5V5uLqJ
         aMNpmIOpyD5GBwtFQslk1/E/bwNsOHanlpBE8BecBXrrXe4QtmNsnFGBbHuQyyPvYVDg
         ZzQNXqYkSR9JABfiuiIlI3YMS8shDEkr1i7kYl7vTtlrCuGwk0jA1WvwMlzbqqlTs+SZ
         mgsKiRScVofGVALtfJBVehljuWHktd945wxk/2Fa8H0gIEZHtr1a6g+ZKzU3ZvQq4UgQ
         eGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773931483; x=1774536283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Fyi1yt3nTs/xAJSqJrKxvPcn4db4szTYDVPLo4lYLk=;
        b=le7DASbsK3eFkEmAvPVTk8zv1PNcT8a/ThyxXnIHCkOx1A49xtLjD0teSJNUzFDnOA
         /0f/q3Z3+vlS3wru2pC6u58+IQRUuHGIiTEJ0O8vCfnJsSAvX5d1+03xw69oU+WYOBGO
         7X/tiYNVpWzMLX4TwLRAKPjmRdKCqJgJmHZOw0N+rKqE7qv3FHQf5eRAY0FQOO2g/jt1
         g9wnEbHYEVviFjUn6E13GnCxZW2/osM2fUM/Rzj3OOxU2Wr1tzW34Rem2F5OH0RYXVGM
         SbPmMeZ6V5VFZKKABq10ln9pDzLdrxT4VyG6KmP/FRSlDmt5HSKZWO7kbwt+lviLCoGL
         JUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7/P04f6j0Bc0ZMUJiWt0lX3no13O44EDjH0IUDJL19vwBnqxb2DXIsavl1QG8xLA5tqC07v/YM9JmNonv@vger.kernel.org
X-Gm-Message-State: AOJu0YxVf7IsYYOWlUdYjWSqlJ5gNUsU9QDH4YYdSE1tS3Zjpi9nyNdj
	HzGBQX8ci9Kq8H3myTW8MwHHvRNYspUlNh2zJERm1LYoQih2oscBSnTo4TLpW+4EEHNMPqeci+y
	p36YRdLzTPmzOvu1IWsqlma+a/i0vL3ZcO0oTJQFqIf8ac+k5pV4G1j4fz0GaBwT/GXsmNd57s7
	Sgnj/NI2qxWK1pFW6nTSXtsKfNbBRxJRvAnT/EIrQJLqc=
X-Gm-Gg: ATEYQzySJyWcXx4wCZy+eZzx9ASDFSBz4jFGVcJXUz7D3bn/tTp+kmCCB0U/Haa4Upi
	pIQuj23U1urv0yDi76GVjjr/b12Veruu1fapRVc418kGV1fdg489luwfLAig4it7U8i8yfzUV5J
	16JEVRFQPQEbzzjGmrA+fnGNU0SrsNPpCgRD4IIfCZssIw9SC63OINH5YBOeBisMSPg9QMjXUDo
	ZqApJP9BxfYfcUcKwqlna5ErEW7vqjmUXGjWqAc
X-Received: by 2002:a05:6214:2f0d:b0:89c:4bba:1a8b with SMTP id 6a1803df08f44-89c6b5ca720mr110874546d6.29.1773931483553;
        Thu, 19 Mar 2026 07:44:43 -0700 (PDT)
X-Received: by 2002:a05:6214:2f0d:b0:89c:4bba:1a8b with SMTP id
 6a1803df08f44-89c6b5ca720mr110874056d6.29.1773931482936; Thu, 19 Mar 2026
 07:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
In-Reply-To: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 15:44:31 +0100
X-Gm-Features: AaiRm53qCQKTMqG75QzQnxtOWdhLcjw56IMjmkTc-WHUEwdd1sCbYQhDfR7ObXM
Message-ID: <CAFEp6-2XrMkKzA4KAEkYF0v7XzVefFpUEG98VYa7wNuanbZ-Xw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: vfe: fix PIX subdev naming on VFE lite
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExNiBTYWx0ZWRfXyRcSaT0WSZ1C
 SOMThfP3AognSFTcSfkssjacpcKob5CFSLJUyWNnJrIUNz6e0uEWgogHBtY1flvUjDJ5I69MpIH
 KzNmLLC9+dIkKwgR6iefXWDy3T+sXIEXo9lOHt9eIJ/o7cA9EIir52cgmq/cDdODbJGKRAGGaxJ
 OEiEL3/AIlqnUQK679VwlCBZTDRbODO/X7t2LY+rpOIew58jmNf1iWA4nVVl3iLPcoX+JNuoae+
 /dg1nrBF6jDXA4DXYKwKSIKcVK726wE3cwGyz60JIMhztEGWZeF0F9pmJ3CpQqtqJPO8G1/AEPT
 0o60iUVjTpdYf0FAP8regnxUfhXHj5+XK9/fEWZsadBJ/Vo4Eg3c1fHlqdTArBX1Uuql7AlSsBC
 4lAFDYGVoGQttqzfGFeH0WO7d2M3cbdnPSx8se+W6NU2d4DlIryj2/v04IxO6LE59m1xWDhy2mN
 mOmT/Ztcf8qAs1JBGGg==
X-Proofpoint-GUID: gnulM6sfif54EPZU8ACO10sM-rmwKZ2B
X-Proofpoint-ORIG-GUID: gnulM6sfif54EPZU8ACO10sM-rmwKZ2B
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bc0bdc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=kqQi33uepLIkosAFTLAA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190116
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98773-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.964];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 48E1B2CD1CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 10:11=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
> VFE lite hardware does not provide a functional PIX path, but after
> the per sub-device type resource changes the PIX subdev name is still
> assigned unconditionally.
>
> Only assign the PIX subdev name on non-lite VFE variants to avoid
> exposing a misleading device name.
>
> Fixes: ae44829a4a97 ("media: qcom: camss: Add per sub-device type resourc=
es")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..2ee4f9ae0ab50e22f916736f1=
d1664767bdb6a36 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -2053,7 +2053,7 @@ int msm_vfe_register_entities(struct vfe_device *vf=
e,
>                 v4l2_subdev_init(sd, &vfe_v4l2_ops);
>                 sd->internal_ops =3D &vfe_v4l2_internal_ops;
>                 sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> -               if (i =3D=3D VFE_LINE_PIX)
> +               if (i =3D=3D VFE_LINE_PIX && vfe->res->is_lite =3D=3D fal=
se)
>                         snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d_%s=
",
>                                  MSM_VFE_NAME, vfe->id, "pix");

So the PIX path will be called RDI? Doesn=E2=80=99t that seem misleading as=
 well?

>                 else
>
> ---
> base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
> change-id: 20260319-camss_fix-506ae164a5dc
>
> Best regards,
> --
> Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>
>

