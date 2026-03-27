Return-Path: <linux-arm-msm+bounces-100440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK0cNsLgxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:55:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DF134A845
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A577E312395C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF1138C2D2;
	Fri, 27 Mar 2026 19:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cN6z0mn6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NePSdhXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9C83921C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640891; cv=none; b=B867/n+Yl7bWJc5HCFPt02hGkYMB6MkZ6Ug72W3o/kFXXKLLkuc7WLmTeQrIG7hPtJhRqD6hcysEmd3CwTTmwyKewPn1KjVG1WUt2IcTChlnurenhKbLputvXYnz0Tuudh0Xk8yaHXmmZwwr0LzCkzvppoDAFPL+K/lVPhAnkw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640891; c=relaxed/simple;
	bh=z2cN/k/vEPGK/Qnc3pbA0QsbHDb5SVfNcUSzUxHiwdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E/gIHaTkl0KHOrrHZctuosE6e/EI+Is4emMkqd9jpmt4BUlhglOEMyCg7DX0x2wXo9kAyzeI9QYo/XLiNN6M3KnWjCq2igxPhsTujaWpw6lquCSsMsGY6CCGAk0wWgKhnWt2OQgIgi0EZcg6QyeLZBnaTvh3o3tTvFeoXvuzUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cN6z0mn6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NePSdhXP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2gDU083226
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dL4YJ6d/SChfLedCdJe8nDIcKte1YxcOzhry8zQBEk=; b=cN6z0mn61b72m+zc
	/tx0RE7Vw16MQB0lUFbaPA19MClrcN/H7Amp7sTg14XnbBPEwltEMTYSphtm7d2Z
	dm6JPOHnXeLpuAP0XgHtDkYW/vnVCPMFTFpwSe3kkRQCDDNdGiZ44rfUSaxe2FsJ
	/AVWdoDgRV42TEbosP/t+JxWTm8OEPESJJQ8kYazi/lQUFCSBhPiUTPrcE4mOrGy
	onpYhqt29c7N6zBPoJPUxz8AU0e8CpS4aMihJHP3oEMdBsrIhSxI5wIlPhEzXbMP
	3LVafit9CS9n+5TiFV/tt/wP4gPMsfXZN6Yn7tqs3Dfz4IiN0Bgd4L11Y+B5AA6p
	lqdk9w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx39t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso34154151cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640889; x=1775245689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dL4YJ6d/SChfLedCdJe8nDIcKte1YxcOzhry8zQBEk=;
        b=NePSdhXPxTK26+CPaRHBjW5AIEzanPLXavY29m/Myx1CefGFB5YE4GvQZW8TIdvR5/
         dtFpxGgpj5Ph3OLhb523ToLL3NZTAO5FnLtNfnjQr5VeSCVTvNchO3LatPZfrDjTkKvr
         tCCGsB6nDdEIdlmBBUMx1fA/qOmIK401Vm7RyyaHABYAJUb2VPnQl3Zqj6nCSiEgo3hN
         VhKha4kr3O6gt2/39wod4+/lBJWMbstr6rrqyI8G7RayS1d0i+7DYz5dlr+SbHbSs1wT
         c0/RLe9vOPmQsLnnr2SwUhVrZm0P/il3Q99U8I9LS1Hs8RuLX+DNeSXKRWbc1bSCvFn+
         CFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640889; x=1775245689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+dL4YJ6d/SChfLedCdJe8nDIcKte1YxcOzhry8zQBEk=;
        b=bTJpmDUQ4xxVyycfdauqHsxEVZeULDKKGFDBJI9iq0u5P7pRwWtcXpLesE+pA0/mMW
         Oxl8qR1KMyBrki7V/MtK+/9liolcs2RjbarjP7r6SawKALolpO8NqqukBFzf5PkdENAg
         QYGCD3gnKvDWmc1u1PoMRub0U9Iy9eGmqdAeh0PuNUJQeRcM8VbouSYnKfpSRaABr6j7
         9FeHgEghtJhz7eMW2U8sOwnF2OOp60JKs4MMPWdvw/SDs5FUsI4BRBNC02iDSMvs579y
         w8l062c4N4f8Mr2+Pa04N1Mi0R/0x64iEspoq62TKgYHXf4oawYTnnIHCkqV9b2ukDTz
         r/AQ==
X-Gm-Message-State: AOJu0YyZ0wkvggFPjANDIyYtSsmGtDpFIBPgyFUzyNj0FVfkm3Mod7Ou
	baLcUAhgh98J7GxLr5I6ynGu/k5J1eTK9uBEL71aRx2tB9xpVaa0fpYc/wUdzvZLxo5WjGtwBZ0
	FBfnI1Q6js3zRQ29d65mNgPT67+XMqIC3PbP+e+nYLZxcDKR6rl+BkedednQ61dAaE1h9
X-Gm-Gg: ATEYQzzSFIPgVTPuZNF2Vyg0hipP7erKqPq4H8Px8n5CtPuaJcjmSFKdWUR+VApCCMQ
	Qe+8R+1ZRtqiMwlNZcgpqjDxX88v6r4vCny+PnUMYMTwFYAdXbPAJ5/oWGmCfsCNw5Z5uDoc/qG
	eS+ut1lwxabLKFtEM3BkGofyM8WDfyPSMLZu1+v4W+WcPoHd/EPct40VQgTKrqtZmHmukhv8Bic
	jSDfKHUBi6Bg5wVY7FBQdnql6sUh2H7Nbg46Vq8B6ALm5a0tE53odAUI2QMdvFtHP0Bi+Rw1KYt
	gUMmjhl1k7m+2fKDUaN9C1gdAoiO2AZOjH/jpq22X2sRfQkD0D4mIA75bZgb6uf86XfUH38CY5x
	M8XHfQaTahx+9PwXBGLMeN41bXfvuWi25Gas19uytWgCx12WX66GNw7ahuWWGxF9EAcSVAGmLdT
	6TbvRB32GKQz70Nvp+RGCdfgWNVlUYuCDP
X-Received: by 2002:a05:622a:4ace:b0:50b:4922:4b8a with SMTP id d75a77b69052e-50ba38080c1mr54080201cf.10.1774640888874;
        Fri, 27 Mar 2026 12:48:08 -0700 (PDT)
X-Received: by 2002:a05:622a:4ace:b0:50b:4922:4b8a with SMTP id d75a77b69052e-50ba38080c1mr54079801cf.10.1774640888363;
        Fri, 27 Mar 2026 12:48:08 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/mdp5: Remove MSM8974v1
Date: Fri, 27 Mar 2026 21:47:46 +0200
Message-ID: <177463970842.3488980.5562803402548499202.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302-topic-goodnight_8974v1-v1-1-e0006f7a0526@oss.qualcomm.com>
References: <20260302-topic-goodnight_8974v1-v1-1-e0006f7a0526@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6def9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=ttHDrauno2BbZGVTw4UA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Bw8J3g_-mn_4Xo7Rv6E-0iVTFqufL_9I
X-Proofpoint-ORIG-GUID: Bw8J3g_-mn_4Xo7Rv6E-0iVTFqufL_9I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX+23K51CoRAr4
 tB4nqJccmSZDVnQtDnCIYCDVzp/pnKoQb9n6G7b3mb3eVJRc1sYtTDMsA1aKoKRYr0iB7KQy+9e
 KR2K814aZlMxqZFd8Z2wmI7IudgEpPEd1cFLrkpiXZ2bdgjTwvZhV1ar+qOiABQS3TJUS2XgJth
 KrQnENr9928CvvlYif8GTBpJ/Az52KUpU0/PhiTRi8sn0HKG9vEI3an87GIU0j/1cBdX94GVH5K
 IiX1RVr5Fqu01pv8fGQhzhzxa7f20T9yoBPUcXMAKOD0hkPVmpNBd0V6i/ahv4Btpi16NpTScUT
 +XnrNs1npXRPVb50QsPm/6fBHRotxEedWB3mRE6YsP4wMfZeGiO1aJJHW2NPyrMqgLgqFfG13jW
 FXOzgQ02iCh7so5a4KBpzFjAS/TSY7V3OpgGon+6CtUA8VMhe0NdOyLF9PcQFUBYw16ZYdWwCUn
 yvKr1HRGMU2fJNzCJ0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100440-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34DF134A845
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 02 Mar 2026 14:41:26 +0100, Konrad Dybcio wrote:
> To the best of my knowledge, the v1 version of this SoC had been
> superseded before any device was released on the market. Everywhere
> else in the kernel, there are assumptions about the SoC being revision
> 2 or the later MSM8974PRO.
> 
> Remove the config for that flavor of MDP. To bring the naming in line
> with the rest of the kernel, remove the v2 suffix from the remaining
> config.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/mdp5: Remove MSM8974v1
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a6f081ec4ce6

Best regards,
-- 
With best wishes
Dmitry



