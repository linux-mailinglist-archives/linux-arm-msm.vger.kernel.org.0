Return-Path: <linux-arm-msm+bounces-112635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eXELMHNpKmrVowMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:53:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE21B66F97F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:53:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OiQWMt0h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="dUwHt/4/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112635-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112635-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C6D43005300
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF777364EA5;
	Thu, 11 Jun 2026 07:51:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9940F36DA1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:51:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164266; cv=none; b=X/gRC3KkmfD1wy/EvLCguypPYaqCkygnPmxNk/Pa28qUVJrai2r8BGgu1QHWJDyXUpZCNxXV7MHY5cQtsU+jYnNVNstYron5h9eDjVUm9H9IM6QZoVZLRtiwa7vXvidg4JCI4+uqFG51CjrnXpUu/yGzQ79SsqY4BfyHyO/3KPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164266; c=relaxed/simple;
	bh=lfCX3uZP1EXZuVBT8IvLBFuruNNYFrUfs6D6xRBa/u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZZzzzrmLwbnrcoCdxu1o5ER+iCO2mLygl0IlzFdwSoBviqinkM4hJKEOKaEgoiy7B7zKRfW5nxs4UVYRaEw3RyJYmvsCUj8AcVbqyZveDetOF60cuEw91lEd2GBfAWHt34fGuBEkqaukQM779gdWm9jLLDNvO3Ti7OLlfDwBDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OiQWMt0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUwHt/4/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GKGo2247975
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/X20Z2CefrI8yMv/8IpDBoqq2Hb9n39SsxgdwnIVWs=; b=OiQWMt0hPdkUmBxQ
	L0B8ZhmcJtjmI1w/TbShYSDVRgrpWZW3o6vafFjuE0HHB5d4eg5YBL1PKWZ1XKSv
	WWrAqqtcYVONSwYsxy1VvU1LPnHiBq99pR5mSGX1Wbg85GFooHwCicTtMacQLlcv
	qt66nVW97zM7XKl+3Dk3SCZDAyFw41fA9+BUTWUODQ4ubac9aHSme6wwEegIU9td
	7JZObfCtWbHxPom/sUnpVg69aTqAmJ1cOwAnqfZ+7G41+pav2BuqsyD5Fgg1ZDiY
	LJQA2KS62PW3HlNLh3TUU0UdaM3hib3nSeF2Hsx2TmMeCFGAtp081s4WBYRsB32l
	vO0VRw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79j8gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:51:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176ff55dc2so13334611cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 00:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781164264; x=1781769064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/X20Z2CefrI8yMv/8IpDBoqq2Hb9n39SsxgdwnIVWs=;
        b=dUwHt/4/R2SLS7/ZPz2bMnM+Hky8G0+BgVCwVXRYOz/9wXrY0KY+2ka7LZdtpqgpQK
         l/7OL3Zniz6N7i7+ldV6h3NTHbeDCseJyVJQXyJhBtl03iYDRqwz9P5GVYtYbV4WvPA7
         f1ip6OMtpRBN4qXfzyylDfqSZ/31bQv6WREDpoCoJjD7sSru4xWyoCDJdcyETnqVdYyI
         x6jytSOeS/hHaITMFRyz6xS1khnksBEV6BxQO3RRuhlS9WIf1Y/KEo4yfGYUtUR2u958
         Gu9+X3ZQcX9X0gag1YfowremJmDCrR/sPMD0kwrbYha18+ZXTUvEjJIRc1PHIgnT5FkR
         eDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164264; x=1781769064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/X20Z2CefrI8yMv/8IpDBoqq2Hb9n39SsxgdwnIVWs=;
        b=AzHihfKvXumnq0xahiscaHnE0hM63QoMw4Hu3knsWvmXyW5kzazHCVwXhDpxChNe5L
         danz9qKdgxLrhXueNoMl0UtdNLBS9Ehb4n9RC3M43QXPU4TYNf1IHGxfV421KUQMg/3r
         PuY/vb8rG0/uSDjd4kyb+JROnNY5+vq5so38pqU7+sWdLOUJAGhFf6UBpAvu3ynl6ua/
         vK+x5V01Op67v5ehQCHWC9Oj4sRuXl+zuLh6Z37i5x+VB076pn6oie2NTMf4snEeKygq
         yjv3PEVIOIVgbf/VIuGeMnu/Bi8yBG9Anf6tiF8xQR/wfuba29dSrFOCNCDUZ1SPNtnh
         RMtQ==
X-Gm-Message-State: AOJu0Yy6qwf+YnD7j779zYpAWJ9uPsX3ycHP/s8WNaHsUhTTqjOoNmgi
	bEzxj/Mzovj0F6rWl+7sWvOxlegXFUaajPNXGHPvqvrq3PDFdHnKFj/bCuHMe1PWhcGImInDLPc
	avxHA7Q0VQ/cFHCOZE31z5EW7MvagJ+TkbwNlBknSpxOW4vGMQ4qIcJgK0wuMgfryEsv8j0HSm8
	Kl
X-Gm-Gg: Acq92OHFE89Ikycf2LdXciSDGeh05FL5kUADgEeQ21ReYLpmNMIixO/RxsDkUjvtKUT
	gOSdljtjXYjGtHo02L/JxFNGw81M+Y5OQmSo/GJd7+NTUoIaXu9GHjab97kY7Oy/9f4b17MNKC/
	bnpbQwBCC7GjiJLacNz5Fo2ArZ25tm0crL5/MCiPamSaKE+RE/OW0gBfRlb7razYCQdAmFp9w/N
	KV3fNtFLKTLU/9CiKoeX5afKriRXM6wEAo9f6z/rlnNhpm7IrLKMZewQocHNBEJSQUZDYY/RhKp
	0nl3zLoLGleYTTi+RjRBJMbQQpOcyji6kusepwgCiud49TP1+kwsHeTrJU8+OnAwYTpMhXmahfx
	tRADVluq3Zo4UoLOoFO3h38L89VN6WVKM6/BrES0NSmuzwXA9fNDkC7m2
X-Received: by 2002:a05:622a:c16:b0:510:144a:636 with SMTP id d75a77b69052e-517ee281cf9mr17195391cf.8.1781164263959;
        Thu, 11 Jun 2026 00:51:03 -0700 (PDT)
X-Received: by 2002:a05:622a:c16:b0:510:144a:636 with SMTP id d75a77b69052e-517ee281cf9mr17195171cf.8.1781164263570;
        Thu, 11 Jun 2026 00:51:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb6a6cc97sm23272366b.63.2026.06.11.00.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:51:02 -0700 (PDT)
Message-ID: <998b673a-9754-4bdd-a305-73824a8f8060@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 09:51:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/mdp4: keep the bus clock enabled while a CRTC
 is active
To: contact@alex-min.fr, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-0-22925600e4f2@alex-min.fr>
 <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-1-22925600e4f2@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-1-22925600e4f2@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wYaiZtTE9FgihcM8WWF3RvGiKmYMte65
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX3bR3ZWAaY4rr
 sJc9qTmIcaEq6/PosTnnnylJheAn9KdwtT1JSWF1ohUjY2yAqr7Za8eyxfNJUZUZceQ3PHnawO6
 DorEwLOn39c/7QjToyHsn0Q9CgjUwMhB3rlz/IigIsbdMp1fANNg9Q2zzAQ+4tz6Ubv5tchowRq
 B6YAbDw74+Ju/aekyveBxi9cn+HqbiqKlN6quHwQ1khKhpWT3f4OZTJBt1ZYUJj/otPqG3Jsid6
 IEtw3vwjf7nm3JGOqfK5jDJMtxiW4b4N6uyCEeGfpUuwy0a74uukGcujWjQfZcIw09jr5oUCfHe
 oZZTCSWW/N0P+oTyKuAVp8ZMJKM+fbVUuKBMum/3egDFSbLb2Her7gNYYUeF98OYibyoQm0YSOh
 FvSFdVFnR7c3YLDH6DeiieslC25wKEqA6qKHscy0rnkh3O50hL+djhqAY3M0pNuKB3aMdFeVPQ3
 ABhtyLKFSpIt69TeSyA==
X-Proofpoint-GUID: wYaiZtTE9FgihcM8WWF3RvGiKmYMte65
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a68e8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qYPBgzPrCaqp2f--smQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX/ZLklvmXgMgH
 FoUqKh3e+8PCIwMvntp3lUsyELWGIZeVbZ3ZrJaAm2wtq95RqJIg2h4jPjcFRm+v+rFzqh+M5mL
 UlQTnPVYPG1+mkLXq2kIW7XXI2jon7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[alex-min.fr,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-112635-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE21B66F97F

On 6/11/26 8:07 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> MDP4 scanout continues to fetch framebuffer data while the CRTC is
> active. Keep the AXI/bus clock enabled for the lifetime of each active
> CRTC so that temporary MDP4 disable paths do not gate the bus clock
> while scanout is still running.
> 
> This avoids display corruption seen on the Samsung Galaxy S4 when the
> display pipeline is active.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

[...]

> +void mdp4_crtc_bus_put(struct mdp4_kms *mdp4_kms)
> +{
> +	mutex_lock(&mdp4_kms->clock_lock);

If you use guard(mutex)(&mdp4_kms->lock_lock), you can drop
the manual _unlock() calls (the lock will be dropped once you
exit the scope

Konrad

