Return-Path: <linux-arm-msm+bounces-90063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH1nCCEWcWmodQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:08:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D38D5B0C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39C03B61CE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 17:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C183A9626;
	Wed, 21 Jan 2026 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbjF8wXn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ViWquD4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120A33A4F5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015910; cv=pass; b=rpaIhaa4WdXt0DfcRpK8tusieyqTJYSDndo2cooa47r9KCOtjcDOxYSCGYW8hyQD/IpwDUDcv+OmoF0WE5H1ygs8h2/zAiPkZ8t+H3Xyk4nJMVaF9LyygGH5oXUW5RpAK9Zqi8TqyprDm/Guud49aPpJ0xHM7ts3EC3HMopqM/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015910; c=relaxed/simple;
	bh=psWa6Zeao9p4vA8xDb1QWBFuImF0vYlDyuJBkr8p9YA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1LU1GOkuFOgfaIyn0ZbJk9XR8CQbn+H52yq6HbHcGtNQHmJkSz+Iix4EtcFJp28hHzs14HewUoI9vGqIMhJMkpF60dj/XbdyJdxeCIXG9kmJy7XDnv9y5jMSMX4K4O8I5p9297MXNTvKZ/QcJ0K9CRGC3D2uTf4SR2vpNH2UsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbjF8wXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ViWquD4Y; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAn4s03316493
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=; b=Nb
	jF8wXn8ZSgygBsmTdbpBl40vKFHg8dkPGWRKzz6ucnKEoqGHP1UGG9C2dTdL9t0p
	mnmNhkKJTjYQz37b6VQiTjuvANKCXesbGsQ2x4h38XYd8ZHbcBNIcFMm5MpmaeX/
	y26490F+F+YMxAXpn0rLo3Z6HYpISsOiOjuNr1NUq8SZIPzrZaRSrLzDNsLEvK7X
	C9dkGRbzuXSygbTNOYMLC4Sj89Rn43lwFHPbf/Hh+ypZlGbUtCLGQ32FFpegZjZX
	JUPmK1KuNHt9plNndYvaFm3iQyyGTENEbZsnBBIV9HkyfVwJFL/YkO0QBEHyo9Qg
	TmFMF3zjs82TdliaiCgw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btwcjhb1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:18:28 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-124627fc58dso169538c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769015908; cv=none;
        d=google.com; s=arc-20240605;
        b=g1CwZsB3fjw7r98tPMUPWHi7Jra6afEyjwUkfMsIqHucq1mAyFqUkgVuTDaO8x238s
         qmtdxjzUp3/Br24AD68lJCzyNcl/gRaXKcAlCmPXmgavgUktNC+vJwBNV+QArUknL73d
         mBv8EhPhYlZh7iZZS2rS5Fg0ckM7mLQRceynrnD+XdTE68weRPDwOTTyYbFnpUTpaBkK
         0DPHgl95WasrRigiam5wq7i8t/NHajvOj5Qi1eEyQg5ZimNg1VTpHmvNup38PTAA0ztr
         qglacucUF9GHJiASQpn1OMxitkqmRe7GCyGpnPHhNLClR2tblVkpsMoR4OWGjQD3wUxI
         4wPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=;
        fh=MNvFevXfFeKpgf42eb6M9m30G3qPr+lhsbae9+zj9rs=;
        b=ju9QAdyMl8lsGGL56VJQkyZtoxOZeKPja5W/QAuL0mSBk6H+amACoEe53TL4h1Od4a
         Od4IbwJ3Sno5DHRZsenOKh30NFbIS8EtM+wes/1Ky4D7HV1fEqXUnyTFHfeFLCanlphf
         /y+pjfVW32Rme/5cdq4fvE4Df9tVXm+IpGMm1ykAwwsalRN/k6wnjLuF98hS0JJX1Y14
         3PVtd+AvKh3d2BbLfE3YhH+T3xccFCwErdBawPBB3j1kO6Nwml4nqUEc8gAQS8DDTotA
         y6uCwTuKo7Ez0bN/F4UysMh3lLH2cGyi2e8BZj8VpqFpe6/WdtCNJIKQwuyRuaHvH8GW
         l8bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769015908; x=1769620708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=;
        b=ViWquD4YgSKncf7DCA7fasJJMstJgiR/+9iDxn34tIF4zA97WuNOwNM8HJIOv0iOyp
         5uacHY3rhapP+IQLI1gP5EDTVeE4PUt5xRfHErmArxfQIVPBx8CIbp6T6zkHj2kOu5Zy
         6voojvrIdght8p7aJUOEVqcpuSe8loyghjgIsMRrys80BMJT5D6ooAzC3nsSqFRNaScF
         FyxzAbKBmqDLpzVwiNyiK/3hRDXdzvDLQB7RCh6zD6EWmM3d/1yG2c295SOe8iuVR7qy
         yNGYP+7FbjYnkydkdpkFMRKDMQQU7Z89HX7Z1qpbSfmfCJ0+iV+FBQ2Au8QVEaFzn0LQ
         4j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769015908; x=1769620708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=;
        b=ZcENYWmPqdAmUoFUFkdatybkcGCDLnN+ljbiEqW041/qjvXQeRC7h1HSEt8qqTNAGb
         mIKxyp5KJ9prVMNlLyVjYzg2WUMSUSgOjUO9q1Ut13SCPhULko0Q6piQvD0YpmLayqiH
         4pTynSApwGNsFGemHvt6n4JFLZs4p2TUPg/AXGpQ73678eABpkphaVhV3i/N9dl8wQ1e
         kf6n3ds0p9WprVBjeW8fJjr1QXYwMfA6CPdUGi3CtrCFslf1pz6Jg4VQPC6WI03V99hD
         QmQ4q8f7eRFvtEftUkUDZVIbpz94DtomyfAsOwvS89ANp5yIBf9x5Oahq2g4nwqyEX5O
         Yfog==
X-Forwarded-Encrypted: i=1; AJvYcCUbDMl69EN1eV0AYjvTmkh/PtH9w2UnkK4DU6lKo8IkIys1gbd72v+ckCKUc/pPEs3Miq+jnDeEgtUWu8Pj@vger.kernel.org
X-Gm-Message-State: AOJu0Yza2RqRTY35T8FL1HNeiEaOYwm0m/JoA0tlaqH5NqJmQhzrsb32
	9M7aN+o0VLcek8jJEDODhdhCXcXTylpLrxXE0QA6w5ri22N+VBH7dmI/L/Iw32OffSf5CyMxKcO
	9rYUvjHuBIplfNyU1RnWeGDd1ZtMLIYrgQUFNJ+xcuM0fmwdvI71AmMBTjEj4hA234wYECFVp75
	D6J4chfnhNqHm3XLl75aiRXWdNNABSRtkSynFi0/Y7XkE=
X-Gm-Gg: AZuq6aK1Ft5TGee627wD1ZExHAfvNYg3ME6M09HEeaz2TVL/QnjTVJ0iMu9m2qHcyr+
	TkjAFEsTRyvGrBkGyUOSzBmCxXMf01lIYOlZWd5ZJmDytk72go9myqbw9FfjHN49dl4n7Gprksk
	Bwc6rJWeiTw0yOhxnnF/z/oKzNvzJ5iAbCHgHSKsu9Z7Kn+zdWqVWqvj7OpNqABNtowlHm5BMEj
	t3Kt8D6McJe6Kypgq5stVW7Ww==
X-Received: by 2002:a05:7022:6b92:b0:119:fb9c:4ebb with SMTP id a92af1059eb24-1246aab32f3mr3214506c88.30.1769015907030;
        Wed, 21 Jan 2026 09:18:27 -0800 (PST)
X-Received: by 2002:a05:7022:6b92:b0:119:fb9c:4ebb with SMTP id
 a92af1059eb24-1246aab32f3mr3214481c88.30.1769015905900; Wed, 21 Jan 2026
 09:18:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
In-Reply-To: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 09:18:14 -0800
X-Gm-Features: AZwV_QggMC0EGXfDHD9Ynlotejfb84ZLpeoJQeG0wdpRQPgq3KVidg_TyOdspLM
Message-ID: <CACSVV03QHtWNrmvySkf1GdkfJ-iC=zFWf4OYrK1E3oq2S9bzqg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ZGo9wD3WejDCiW9TzhdWjwGC3bWTdnqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0NSBTYWx0ZWRfX3gtdGlJIzHMd
 wFC8ZR+u/FNbePAJ/ziMuNiwP2WGJjrtHV54UMyTgXrvmstxn+pHka06S9Q9fFuF1MnftrS4VsA
 k8ggImE2moQRyBaGxJKWPJU+KRPQNK0mShRbaK/d+FzYBc1wM7pIwhhvCRneY8f4patNRSa7oV2
 wGSgA5z4HU8Y/64AIWD8ni45xD9ZnCPY2b8WDle7fXSFyzLL/oYV3Kb5RDlYndLHltF5x6WIjNB
 K/PDoddBguOrKkep0j+3Cy44t1uFNxG9PNRUuoOlFaieY3trZHlUKSyTnNoN4qCzeoetc/hScIi
 h+1QOvGoVBwm1FGjtLu8PRqtimx/+VkWVBfh8UOLXqPnL5c4iLGHJAbFl4AOaCyg5rDzx+HN2m2
 Wxc7S20zo8sYanDT/d0IlhxNDVNx5oOwV6hTTmKs7Lm8l46QYs88x/+rXuhskjy9qMtLwuIJmWJ
 XKVgJ19VCjUHh253T3A==
X-Proofpoint-ORIG-GUID: ZGo9wD3WejDCiW9TzhdWjwGC3bWTdnqV
X-Authority-Analysis: v=2.4 cv=JpD8bc4C c=1 sm=1 tr=0 ts=69710a64 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=oiMQHesyWy8z1qx9V5wA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210145
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90063-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 2D38D5B0C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 12:41=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> It seems, on SC7180 color conversion results are not included into the
> CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
> tests. Add gamma-related tests too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is the fix for the IGT failures reported with [1] applied. See the
> pipeline at [2] and [3].
>
> [1] https://lore.kernel.org/all/20251019-dpu-add-dspp-gc-driver-v3-1-8404=
91934e56@izzo.pro/
> [2] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1587979
> [3] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1587942
> ---
>  drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt     | =
4 ++++
>  drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt | =
4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fail=
s.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> index e4a8f8352cd6..ae36a39619c6 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> @@ -6,12 +6,16 @@ kms_color@ctm-green-to-red,Fail
>  kms_color@ctm-negative,Fail
>  kms_color@ctm-red-to-blue,Fail
>  kms_color@ctm-signed,Fail
> +kms_color@gamma,Fail
> +kms_color@legacy-gamma,Fail
>  kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
>  kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail

It is nice to see a comment in xfails about the reason

And maybe this should be squashed into [1]?

BR,
-R

>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-=
fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fai=
ls.txt
> index e4a8f8352cd6..ae36a39619c6 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.t=
xt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.t=
xt
> @@ -6,12 +6,16 @@ kms_color@ctm-green-to-red,Fail
>  kms_color@ctm-negative,Fail
>  kms_color@ctm-red-to-blue,Fail
>  kms_color@ctm-signed,Fail
> +kms_color@gamma,Fail
> +kms_color@legacy-gamma,Fail
>  kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
>  kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail
>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>
> ---
> base-commit: f185076da44c774241a16a82a7773ece3c1c607b
> change-id: 20260121-dpu-sc7180-ignore-gamma-dcff660aed40
> prerequisite-change-id: 20251017-dpu-add-dspp-gc-driver-c5d1c08be770:v3
> prerequisite-patch-id: 7a52c31208202effb5cc4b7aaf6d6a75eb9a258d
>
> Best regards,
> --
> With best wishes
> Dmitry
>

