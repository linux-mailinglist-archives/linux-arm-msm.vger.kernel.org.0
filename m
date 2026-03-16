Return-Path: <linux-arm-msm+bounces-97977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePJPMY8VuGl/YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:37:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9429B815
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 437DC303205E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A19293B5F;
	Mon, 16 Mar 2026 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjB8vNLd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGWbrPUd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6886528B4FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671696; cv=pass; b=TjgTOQP4MHC4+JNrumoyx7FVL1Vnmj17IrtIV5l2OIo0ZugrUbPLOsA4+eh6cAvZFLmEXczbgMAR5Lh4QBcpNrTko/0TbRf3LNsbB45X3pWmp0Qw2Nf4FsxLnmdpqcooepyZg4iDM+TyFVcEpqAqtBksnehHeDqKP41dMQkNA4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671696; c=relaxed/simple;
	bh=pCXRJ2LDYcyAj3iZn65FN6JxT4hLv14urRcRawkqk0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOUFQdo7SQlHtHahLpFXHnff0UpBaoyetD1Syk1jxEOWjSBw1ZWG/6Kh7tIUcamPNITetxknEqAQeK9OneS/t/hBVWZ+Z6AHVpOydciZbeOPe9oCrd0LjudpVdYf87p67Kp7I2mMuIDiWsRDHMADx2Z9vl5MD8bh3wIYPhitMi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjB8vNLd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGWbrPUd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GA4DxW3125150
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=qpgGU0OS8HxTocU+awaVOYMZN98rW0ghZnAMh2Ic4BQ=; b=Mj
	B8vNLd2J9092Ip15xuHvtAyfvBeBSeRKgqMFCS0CLbxIG6xRcpOtv0nTUDYM7k2K
	7L9A+8kFzo8V4an0FO9tOw2RfJ0Cq581jhA2r5twlnnLbdK1vlQVxpkbHFNKtJSN
	JmwPGvfq5D2D2jR34d2W8298LwgXm/mo0bdrrB8nR3M0LHuZBSaQHeN42Oq8JdhH
	RCrC5BTdlF0lu8Sa4x7X8bGyJ7OwmURdrGtmUOmwIiJci89UV9zYpXPwMDi/YUt6
	xRlPlzP31Lo/VCgsLhE0zv3QotJyYy5dfapwugtwVaJoxMvFO7/tUzRSeASimVQz
	jkGR17JRxpdAn2Q364zA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmgyat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:34:54 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d73fe3f986so41375755a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773671694; cv=none;
        d=google.com; s=arc-20240605;
        b=H0OJqDYoTGCah32mnBSM6Q2+ao+zpNavEwr+4HO9wNj22SFaHMx+Us647Q15ZpAWN3
         kbShD3MCuVp1spF79nUSAPxhnFnM5c0G9ds7v5OYwPcPMITwyZZQavJ3iE7L+oXkNhZQ
         fr5edDATaUcRekEBIOt4vXrJstB90UGd1FtcAiH1So7U+fyR0T+xxvGTQT5GDXgCsRSS
         4Y1mTICqNAbCNp/1CPToSt7ltGdkf7NJia4BwEKfXTuY0UTJGrosVKZTqa8Ae8yS6c9e
         0zeBt2S4+beUCTlcv4M/CMBpxubp6A0uyl3lpsD9EZsLPOhRGcw8rLFZ1beZcqP8d/jV
         LmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=qpgGU0OS8HxTocU+awaVOYMZN98rW0ghZnAMh2Ic4BQ=;
        fh=Msh7gT7dBNB8b9IGsq6/jF89tnApurHBmG1xrjsRsm4=;
        b=cUEBH/Ju7zpvNUiLC1WLiFbjUkiaUgdmwaUG5StnvGoC1cSrEMGuYPU04PAdlxL4y/
         j6g7amGN6FAy0moDgfq6TMam7r8swevheIyPQ9IbWHIqP8/zcHfj2/H3Z6bWZBLOnzFc
         Pc4pQdT0OlZFBidFnuNaIzQrIPweDuASlezzopGj6eBTIT+1l3AttnznN96RaEj5tR+g
         aXwcyuxWEyljQ53JEpRTD8z3t+1HvGBtMzbCliD4JrkZMgeMrTF7d18WIYELJlH30ie8
         PPneDh5eZAuy1jDyUDD+5bSz3XZXkKp9R6KPBIwK7WCiJtZsTUiiPYb4DQLCNmRXhvPD
         C0cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773671694; x=1774276494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qpgGU0OS8HxTocU+awaVOYMZN98rW0ghZnAMh2Ic4BQ=;
        b=LGWbrPUdr8oCvxNAoUhHxnQI0DwDO80KGsAy6rWJyiG/m2RyHEeBWKSzsAVbjF9ncp
         8a6q5cw0oQxLEETtJBqsm5okm3WqI628WShoSca6E4u+aSpET5oEEHz/s1IRnW1xEeBy
         +VbSI1t8k8svBBpfwSqkQRsIFKBrxNYtushAzYZeHRbwyD8ujAcyMIpWGi7lcTO63TbY
         luPGnhA+grFOkk0zCSgzGcfxlDBdqTXKRkAqxah5qJosl6Xvff8nEgdL5Z80pj0BBtf/
         7TAEYiUE+nZESblySkxB2goGunHcBLjBYtnygbNOADZkyMgYwUv3TLv4ZGn5HSbrVWJZ
         e8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671694; x=1774276494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qpgGU0OS8HxTocU+awaVOYMZN98rW0ghZnAMh2Ic4BQ=;
        b=KoLvHZR6okvzaJ98qTWnRdtzCThZrpDWIhjibRTcfIVCk2i6xlgh0AQr5izDY6VE96
         Q2I6E4dquDFqhLhCNT2+nMUngaaSbCrTtc8zRMNCqa4SmSqJ/OiOHtBKc9anJwS2fG/o
         9eR+etsHdgJi4w0P9kMjLPuBl+GOsd666IriFqmENHMeO1Le3zb4XMLtldPAgxhxHNjb
         aMuzapv4XeURbF7ij7k8504D+xOy8UKHaV2r7RsqkMrpD/u2Jy7DbhuSwPHjUolVrYb4
         BEJ14E0P7MFyB5wxcgbK8XWnmG3u5MPJEN/ve2onMN7Ty9W/SOhGhwGz2slpMDQeP9Y8
         AtMw==
X-Forwarded-Encrypted: i=1; AJvYcCXqgC6RgJlNNef4BTAa1vhKA7mg1AJY6b4xvG5+tFOp87gH2664EOP7bHZ24mLz9TXFv7ItuwDCaX+TlZzx@vger.kernel.org
X-Gm-Message-State: AOJu0YyjFDW0lTTkMydY8rnk7zuZSsA1Q87c4klDDBnvsN9JENGRqksM
	aOn7l39VAc4j8USGpLGQbrGhyKKzK+O+Xj92cASU+JvMfzYYaj585DOiCo7ku5ztr4bqvHAk5+g
	YZuStMNhBQ/LEe+On2jtdduGP5swEoyIfywBHc65ITTs8F6QhYLueup3+0p9YDfpASyOlPVZKNO
	i4GWZtcD/Ai0UYGq7ynGkDCSJxc7hSUYaPir9i/QXI+pM=
X-Gm-Gg: ATEYQzw1/7sAjUKpegU6cNqd95KOgTwFndZRxla+8TCBcS3PTT4K+65u2O1BsGGEn0x
	HR2ibBae/rs9tDjUb6XYz+F1JDzJACDGp6PpSTz4Wg3FEOCNBG/S0K6MAJjOj1DxCuFC+vFRu4D
	gz7vbZG8/ABhVA3wIt4YAelASjJCmopuPjV0TQkahQeebUTY0od/Ucydxwkmfmd5IOo8KJPBwxo
	2hPazWjK2isujEpap7/w0oPri9jeLYUBTXqAQ==
X-Received: by 2002:a05:6830:f96:b0:7c7:6977:17cb with SMTP id 46e09a7af769-7d782593b16mr9291047a34.21.1773671693890;
        Mon, 16 Mar 2026 07:34:53 -0700 (PDT)
X-Received: by 2002:a05:6830:f96:b0:7c7:6977:17cb with SMTP id
 46e09a7af769-7d782593b16mr9291020a34.21.1773671693506; Mon, 16 Mar 2026
 07:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
 <2938aa01-cc1b-4dd8-a4af-45ff8354a061@oss.qualcomm.com> <6gxzcgwzvqoaqgynwnturjybanjrk2jmmsa3qh3r7vafyyzj44@dfzkd3vigluu>
In-Reply-To: <6gxzcgwzvqoaqgynwnturjybanjrk2jmmsa3qh3r7vafyyzj44@dfzkd3vigluu>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 07:34:42 -0700
X-Gm-Features: AaiRm504oEpIuaNMAPdwmyeHEdylJ_ESyNWoS7oE2Ztnzgl2FhmB6Sbe8Jj8mx4
Message-ID: <CACSVV03tAeLuwuHRqnaSkSgtGj=nJ5Gt3bzLJZT9SXXRY7jvfw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix GMEM_BASE for A650
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>, Sean Paul <sean@poorly.run>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwOCBTYWx0ZWRfXxAX5TUP5KCwd
 iG5NuKsJcOchf9IyK/hJjd6kAlJ+SEGBalJhuNOPZMHNPm6/LiABu0ANKBJcplu9rv8pDb2oXWB
 fID0XkuiP+t3rUHwccSLkQskxshVBmLKLAxRM0IzwMdOD0yMUrynbhuTRrXvEV/fw2N+cNRPmy9
 MYzD9aUVE2MOlBTHagsmmLfaVEpSpuSXhm0Go+UhkiKmtGqzCemXwd0URhVNL4iXCnese1XjOia
 jjmBaUaXCSYCzRjIVdD2dvVLXUHAcKB9J0uPV+V1Ne7rFCaFUDffUNYwnYXq5gGvI61ljO6KxLB
 tjEr+CwMZ7xby6iZWHPTqiAUrjFh6GyWrmUDugLT5wngFX+ci/IB1iUprs0P3S3BTb3I76SAjUy
 hwzbOKK40APkZu9ZK+j+BNRo9Xx/7/G/zepEGqPlBfXYNYUMkJE4cjJZ3j+5U7R0rxgLMAI5WQ2
 N79f3cAlrOMBPLXwvEw==
X-Proofpoint-GUID: f1HFqPI4AEq_Ka6_SfGC0YqsKlfPDCEr
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b8150e cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=OH4h9_dtBadAJ_YzgJkA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: f1HFqPI4AEq_Ka6_SfGC0YqsKlfPDCEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97977-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,pm.me,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 29A9429B815
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 7:28=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Mar 16, 2026 at 10:22:44AM +0100, Konrad Dybcio wrote:
> > On 3/14/26 5:14 AM, Alexander Koskovich wrote:
> > > Commit dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8") changed the
> > > GMEM_BASE check from adreno_is_a650_family() & adreno_is_a740_family(=
)
> > > to family >=3D ADRENO_6XX_GEN4.
> > >
> > > This inadvertently excluded A650 (ADRENO_6XX_GEN3), causing it to rep=
ort
> > > an incorrect GMEM_BASE which results in severe rendering corruption.
> > >
> > > Update check to also include ADRENO_6XX_GEN3 to fix A650.
> > >
> > > Fixes: dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8")
> >
> > Hm, that commit also changed the value for A730 - Akhil/Rob, should
> > that be changed back?
>
> I'd say, I'm also surprised about something being broken for A650. Which
> path / stack uses this value?

Anything that samples from GMEM (gl or vk).. which could include
blend_equation_advanced, custom resolve, etc.

It's maybe not common enough to immediately notice something wrong, it
depends on your DE.

BR,
-R

> >
> > Konrad
> >
> > > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/dr=
m/msm/adreno/adreno_gpu.c
> > > index d5fe6f6f0dec..0ac3fba5c277 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -376,7 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct =
msm_context *ctx,
> > >             *value =3D adreno_gpu->info->gmem;
> > >             return 0;
> > >     case MSM_PARAM_GMEM_BASE:
> > > -           if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN4)
> > > +           if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN3)
> > >                     *value =3D 0;
> > >             else
> > >                     *value =3D 0x100000;
> > >
> > > ---
> > > base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> > > change-id: 20260314-fix-gmem-base-a650-cfd9bfcea425
> > >
> > > Best regards,
>
> --
> With best wishes
> Dmitry

