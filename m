Return-Path: <linux-arm-msm+bounces-102021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDrUGSMz1GmtsAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:26:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D26BC3A7DA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFFE830598F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 22:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361493988F2;
	Mon,  6 Apr 2026 22:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSDNo/Cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGUYtLb5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4F838CFF1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 22:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775514307; cv=pass; b=k6xGNrqgo4ZTsgtV3/u7HpeWGX0savRliMo38IMvRCNQG5NVWIcZSe+IM22Bqs7uD+c1T34tyCWR8DaM8637W7J6c/CQ7iyuW3M8N60GTQzOtrZu4TISdZ4p5e23yqR6yGZFN74AJTQ/iIE2MH0H3RimJvUiqD7bj7jg3h0Kp0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775514307; c=relaxed/simple;
	bh=XDyIQZC8VrWjxOvP0Ys1TA1SkwAcSYq3nLyGA3k4aEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhlQUdY8KMmP0goYa7aoYeI6VFw6Wc4SUCeQkKPWvLfoBDxCWOeuqtFkad778c43Yb7GZYmoVRVdlzSFGk9UrIrKA/pKQtLDHLI6Y7YGxdP9PhtaybNkdwrNapoHjmWQkza0TMikNQb3T1onChiu2TwXtRBnCbWo6hUtoa57wu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSDNo/Cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGUYtLb5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ9sq1404160
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 22:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=t2bz/AuUCyIyjUyeiEAv5+oKtlxkr+8qudGmv/ZvY58=; b=bS
	DNo/CpLSg5Q0/LYBh07j6rSOuEKz+t2Zyqk74J+9h+2fHqzqMddYKfJh/01Z8/G7
	Tdu1wLBcG5RYA66x4rgahrtot3t7g4ZcMyFuFay6O/VkA7i8Bwo6UFJ14pxF7ERm
	J/TGr74kJh/MVOK35vLkWXT3ZzbH56TX87e/DKdUnLQJiJ9tT31JklahFmpdCTyh
	o9tk4f+kTHfWe1BCFnwNd+p8fxrK7xdST/3B/UzYowaKmzLxbz+cz7c9U1FNxDsT
	JtWOX2EkGjQ9LTiIqeyY3Ul4p/wXcDIEt49ahH91Vl0pUW0opJIW6cWtyx+KR+/L
	cFG+g1NBO2bTOw2srhag==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8844k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 22:24:55 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dbb6b95836so10018626a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 15:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775514295; cv=none;
        d=google.com; s=arc-20240605;
        b=PHYsI4NylShTm2fdYcb43B7DnMaOn3g51Y4/o2U823yIRQ4ZsAuBj3PV4pkkLUn4rC
         BJ62EfTOJ0MYKPfc1SB++85+ZK/cLlYoD3x3q2JZZIyLSAFtnED4NK66UkxWe4s207qY
         OCk2M0uwu2+twgMlM0fPZhBkNs4SwxqzxgFEqnrL4aLgeVqwMEH8gfdvNGqeAXCEN/Lh
         amuecDdj7SCLbBUcMLkayH9zeV6BF4Av5SDYdd7mGzK81QQd0imBc9iM2VHJp3YeM8Pi
         gGjmDeeZRQTIK33xXI20VIz7Jt8MUrNe2Ty2jUe0iI4I3wmTbriPzGnx+t4rB9Of4iZd
         aHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=t2bz/AuUCyIyjUyeiEAv5+oKtlxkr+8qudGmv/ZvY58=;
        fh=D4UiLQVERc5B8tHaQSCv9oIys5zk1TOlb9vdq9IDgEI=;
        b=Go+t79WIH+M8Ql5H+YYYT89vH7y0JBbxvUm2b2GhGFlfOudOr/kfipVog6SMGPHyrE
         3tHI2ebPV5z2QCev664TvJ6SP2RTTJVm5nF1AZu6AUpB/RMmopoimuL0OU0hzGjeigLz
         39P3kgpMU+Ux5e/eseu0yyKl1oeHQ7ChBZa14wHNGsVjisx2SbCq1BsM2YPRiV6RfG/F
         6+i8vrHgRXRnIqablYRTLoaRB9nuJVtC0VTux3csRImYlEtyZApszvUN/DTIgylBr8u9
         IZ0QJ0b+tyDuzk2ar4wL+fmdjCkRm27mC+GVLT7hG0SDPq9LPY2j0xnMaSkUK2LfQXqK
         Q1pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775514295; x=1776119095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t2bz/AuUCyIyjUyeiEAv5+oKtlxkr+8qudGmv/ZvY58=;
        b=jGUYtLb5ugFFRDVqaxkU33CahtCQOVss0pIouJBguKhEAJZJGY+xkUuoHxW0ptz9fd
         zvw3+9m9kt9xmx4aV7hRsRz+QAH3Z5vM7oBIdMhGHxu0+rI4dX9f+yn/0av5yGFnBUDn
         UFmxzK6Y3bsTJljatHov0oz/WvwT2oYmg9/xpx0vHY7ixmewJC4Xrh3jZjp4d+vfg72z
         70XQPaUIjYdIptFmSpWYlVyeZfESZtVt5FQjg7jL3kglOPfw3FNzL9uJMyXsrfH/G50h
         AvviVGar29WSNBrUKsKbHHACBqJJzcQIP6l72gYgjcNWjW+fFgJ2GYqceucDsZemTg4A
         fo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775514295; x=1776119095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2bz/AuUCyIyjUyeiEAv5+oKtlxkr+8qudGmv/ZvY58=;
        b=qpJld2tudtaslFW9rRu73q00HAO7kDCieYbm7L+d1T6t6zekrl1USvNDFf7mOnk2Gq
         xWBg9bLIu9gvX5NVvoIv8aqOpMDi7uDYBZOlvFOzDj+eMRiebNmfudnGO/joapXmSCPG
         Sg5QEA7mkoI5Jwzrd+fHQeT11n4BstWiTgEyz878f4vmAilNBivsmdCGPJUl0TUWYvZF
         0BQN0wbQ1uI2SttPIza9V/oKWtes9WN6gW3LN+0TFP+hgISE5ROtrw6eRnjbXjNn7GmG
         r9Fmi9Mg0rdDwUkBv5OudZVJIPnp1mSKCXzqvlJKxbegiJezIeQIMgX2XCnXP6b7OFEX
         Z+tw==
X-Forwarded-Encrypted: i=1; AJvYcCV0X4paKYI/tCD2kf3uu0hlnHyIgW/ktDrdj00IltiUU+1F4b4mSrRG/vKDdk11LrTmTkkUJ4/A0GkjqpxB@vger.kernel.org
X-Gm-Message-State: AOJu0YyWoZXRlSaekXab0n4SP5i422spa5RxD7kiZWpMhJYE7aBao4QV
	3wwG41hGF6wRWp280re7fq7mdxXTCXwSk3OR5g3RAviFjmtAfJipibIf/waSUS0VnABVeBsirl8
	Pod/LHhS+zQ8WeNjNQ7wak/iT7+UzvJAEA85RdHWjExNeLL5OssPk6lvsUR/tNb5yst8I+Wn1ST
	c7B/JeJWVGJ3fPC+IbFqNpRVVUO+RG0Lu9Mk4J0PfF+gU=
X-Gm-Gg: AeBDietHAQaWcyLhiBLo4Rx8r2WMWVwchhqOkGtY0bN6KsZrurJ02nymoVtKCmp6aVJ
	I2RL0IztYr5c5R2CsdT9hBa0+YsUR/5ol/+wJKCvsy3E+h/6vNNINZqBFD0U2fpSzefFqm+F05l
	0NDF3AYAb4Z27Srt0YaPXHr3oCmkTNWn1j6EW3u+2G3p/Zvy+SsxXQCo6/SrgbhxVsuZgx32CT4
	67cab86IFVjPlziZUKNjL4ssA/zXORDWLhHow==
X-Received: by 2002:a05:6830:6b0d:b0:7d7:ddb9:5061 with SMTP id 46e09a7af769-7dbb6fa2b4emr9066004a34.13.1775514294948;
        Mon, 06 Apr 2026 15:24:54 -0700 (PDT)
X-Received: by 2002:a05:6830:6b0d:b0:7d7:ddb9:5061 with SMTP id
 46e09a7af769-7dbb6fa2b4emr9065986a34.13.1775514294542; Mon, 06 Apr 2026
 15:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-adreno-fix-ubwc-v1-1-bb2b09450b87@oss.qualcomm.com>
In-Reply-To: <20260407-adreno-fix-ubwc-v1-1-bb2b09450b87@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:24:43 -0700
X-Gm-Features: AQROBzBS8EWtQypBhKxnT0niYnWq5NV_q0tMBtRASSXiPvPyGM3PAAbslpXL_kk
Message-ID: <CACSVV03uVF-STTwCVR3=9Jf=dCh7buBmk-1LBhYO0YfUDYXNDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix userspace-triggered crash on a2xx-a4xx
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
X-Proofpoint-ORIG-GUID: Dob0GTCE6LWAoPxcoV4YkiBiDi8ChaCC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIxOSBTYWx0ZWRfX/4MM/Tg7d04x
 Wv2kvGw807ILuYMepOoeKz+UpzwFZ5HoVSh6iODsdNR9kwbP587E6hKLKnJ9bXcHodXTNGjR6jr
 lxrO+ly+FTEzdnVsLQtWyqhB672vzozWvlL0k1qge5KypitLgOJANfvpFnOE5WSkEWhJJ48tl7I
 o8V4OtvmPKUB2O3swhbq9Bd5bDFfv0OofMcrP85k8eeUmv1VouE3SRbzzN6z6ZC68K+ShkjxG2/
 lsuQMChdGMNTR8ZU1nNKH7L4UCuCc7W44wpFYtVqkRRkH7FQ4AWGmEcjqqGxPLYNDnz2DjWoRA6
 S1CckzyUKyz7vVVLJj+NWU1nFm4x+oY8JyLOlvVjHncbjLqbmqGC4Xqo+fWHN43aAkKvTRRA5my
 dlPx9c8yMw5UtZmlBG0QatphScooYbQGB1OPhe1xiR3hpECXwWsrqQt6UgTTHYtKYbAPMO4dExs
 kC6mBw+3BmLKg9S2uPg==
X-Proofpoint-GUID: Dob0GTCE6LWAoPxcoV4YkiBiDi8ChaCC
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d432b7 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=lCW5SLys8A1o4QUykOsA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060219
X-Spamd-Result: default: False [2.84 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[209.85.210.70:received];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102021-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.924];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com]
X-Rspamd-Queue-Id: D26BC3A7DA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 3:14=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Before a5xx Adreno driver will not try fetching UBWC params (because
> those generations didn't support UBWC anyway), however it's still
> possible to query UBWC-related params from the userspace, triggering
> possible NULL pointer dereference. Check for UBWC config in
> adreno_get_param() and return sane defaults if there is none.
>
> Fixes: a452510aad53 ("drm/msm/adreno: Switch to the common UBWC config st=
ruct")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index d5fe6f6f0dec..7dc95c0a17f7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -426,16 +426,25 @@ int adreno_get_param(struct msm_gpu *gpu, struct ms=
m_context *ctx,
>                 *value =3D vm->mm_range;
>                 return 0;
>         case MSM_PARAM_HIGHEST_BANK_BIT:
> -               *value =3D adreno_gpu->ubwc_config->highest_bank_bit;
> +               if (!adreno_gpu->ubwc_config)
> +                       *value =3D 13;
> +               else
> +                       *value =3D adreno_gpu->ubwc_config->highest_bank_=
bit;

These three params are only used by userspace on a6xx, so tbh it would
be ok to return -ENOENT for platforms that have no ubwc config.  That
might be better than returning imaginary values.

BR,
-R

>                 return 0;
>         case MSM_PARAM_RAYTRACING:
>                 *value =3D adreno_gpu->has_ray_tracing;
>                 return 0;
>         case MSM_PARAM_UBWC_SWIZZLE:
> -               *value =3D adreno_gpu->ubwc_config->ubwc_swizzle;
> +               if (!adreno_gpu->ubwc_config)
> +                       *value =3D 0;
> +               else
> +                       *value =3D adreno_gpu->ubwc_config->ubwc_swizzle;
>                 return 0;
>         case MSM_PARAM_MACROTILE_MODE:
> -               *value =3D adreno_gpu->ubwc_config->macrotile_mode;
> +               if (!adreno_gpu->ubwc_config)
> +                       *value =3D 0;
> +               else
> +                       *value =3D adreno_gpu->ubwc_config->macrotile_mod=
e;
>                 return 0;
>         case MSM_PARAM_UCHE_TRAP_BASE:
>                 *value =3D adreno_gpu->uche_trap_base;
>
> ---
> base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
> change-id: 20260407-adreno-fix-ubwc-6a2564710e21
>
> Best regards,
> --
> With best wishes
> Dmitry
>

