Return-Path: <linux-arm-msm+bounces-118743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4z6lLvLGVGpVSwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:07:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 416E274A22B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:07:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P+gPTAlh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="M37C/OE6";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118743-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118743-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3FB0303B7F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BBE379C43;
	Mon, 13 Jul 2026 11:06:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A2382292
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:06:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940785; cv=pass; b=iM0/KnPKwBQfNM31OqzOE4QG5G/PmxnZZtSGpK4FeE0+KrLHMJK4s4BB7ougOo1jsvF8S2isitsSRmn2CGGOaSru2QMVRti4/5vCjiyaYUt/L8672FCUA+honcr36phe5VCMJuuX0JkR5H5yjPJEUJmp3Z2bd/9Mw3DDi7bWxHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940785; c=relaxed/simple;
	bh=sI88CLDGwWuLo2vHkcEpUE+bX3EFHUFXza+GIHzjOEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKtnJ9J07RYGx7IxcuomI1CuRihXljl44oD8ctqAg6rWTDJp6dlSG33BU0Xo5yOGfVB0QNnybR2UeTHuddwz+RBHYZtGJZAugIE3ThfFF7IzGbzaUH0e5DF98tKheXc0WwiMMaeArUa+JUUhFzosS8jbW0pk4x6JEi6iiixw4M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+gPTAlh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M37C/OE6; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DAfDc4507140
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80U/u6M5Yt6MJmBPkEYyvS5rDUhvm7mS2yGSTVzGn5c=; b=P+gPTAlheUScbQBB
	bUY6yAoBV5NeeLwuHAojtVABBUwXQ5FvsmDzR0jYBGfZs1xGG+a1qhEMviOrhJFX
	63tFchkgcS9PhfusR0BkdodSE+IEl0gKJpIGpFgORl2Ca02IxvV0ww3/SW0KKau2
	U7xBeFdqcZVY2q1ZwUwA0zhi2Fxb82Iw2JwQiSFZBdRfu66UV4j0o2u38QtmcsY1
	AihknM1sm2GJbdYQ6UBGE+Cbt/IkiSUgY01DCJh+3qNIDuOMTD7YLyxVEtgLvaV5
	wZqr5CyKOUPDz2+oXNIdti2wWyIxRM+nwH8Mz7phE4gSlx3aRSVysBm99QLXAxZl
	BRowmA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h5u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:06:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f45dde7595so38310316d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940782; cv=none;
        d=google.com; s=arc-20260327;
        b=Pn1N2x++ei47p2CNluOYu4CV16vh7EkL2p5ZwCj19fT/OayJt/HTJHNe58Z2ReiwBS
         qt0bSHSNFE3TJ66FWI+dnmLz8cVs9ZIH6y2CGeG1DIzy26kNVLZMTg127R05adIgQ9wI
         hvQaZRFUGRkQ3vfFLcCYlYhWvgRZ6+yzsxsAC1X2QXYlJcTEpVbQXuYPi+QdAGBt/9iU
         ZGHkBhmYLl92Az0wKSuTSEoBACjPMbkoDLEeY6QTckUM0omDx3V1G2ONOs3KFuddGxDj
         OQ+p1HidFhgDFExDZqCq+ZXPYlgfSZNHyxedpLWH3wCGNBoAePuYDsyewuna/7rNAOVN
         Wv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=80U/u6M5Yt6MJmBPkEYyvS5rDUhvm7mS2yGSTVzGn5c=;
        fh=mDdKScD5r9NDk5inNcL7M++nGg/jskzdA4syAVE7Pk0=;
        b=qcjAx7ktJYyfoboxVXl9UQTvqqQMqe/ndz8NQO8c6+V4MAxEi9zma9FgYoV9fiUv/9
         smNen/QNP1ansAfClm2uv/KS7XoXwVQaoLhNu/349bBhEQfV+QUkk+QOUFmOcrLmgDxr
         HN5OjNApdSkvGHANUm1BzzYQGIdlc8lnuXWmcjshV1eH46GE3zvCeidX4H40vhCbI5Jl
         1rKrAPX65XzE53dj/pppgw4ywflol3CIxURYlf8+S5AuCRVE9UI0FOqtiVYkJAJoLebT
         gejW2BQWxw8fXQjE3LhZ8BPNbz3jT+AzXO0DcqThX/qTnnWcia0ClmflAI5349zkbgKu
         pSTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940782; x=1784545582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=80U/u6M5Yt6MJmBPkEYyvS5rDUhvm7mS2yGSTVzGn5c=;
        b=M37C/OE6QVACpDSXbRXFZNMKZEmiShiwZHiAnhUKL6FDjRIFWiMHklDoixgWCeDJt4
         P0/pH7WZYsT2s8HWsn0Icf/scGlcxqIJOIiWofR0oXADwP0a4dhgqvauWCB6W47MafZE
         9SOMTnn3d6o56jRRYdS4WaEDLU1PD1MEZ9KAtX5McTWYJA15rfHW1OFzUunsnADL5DNS
         Kqb9o/VT2qtPCFWteOQ5dfHWff5MDo7lZm8GzM94JLG+5r4iAF/DbNFmBglmJEZCYiwT
         qFRhGxnfh6m6bGrswRBREcZflnIhhiep7/bq4xTRKLnudAMdZERcEUbo9lHvEE8g4QTS
         O2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940782; x=1784545582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80U/u6M5Yt6MJmBPkEYyvS5rDUhvm7mS2yGSTVzGn5c=;
        b=UFkPlfD9ogpRLPMgH4LQkfddV9JghMboakkWAjxnXr1ABjCzaF8D3lTg0y83wRV1ZZ
         F/h45lur1WU5TtcW2PjJ2dTLDgmL3YWljwz4Ja3pzt65D95VmdOMNodbPEht8TfJ222R
         mFiROx5BHM4B7OoD+nEIIt7K2CY6LLz7Yns7mFWeWmvQ1obOY4aHeuW9EpYRErDJ7TRc
         2wU4irk2KghFL0h8MD4BXR2hQnauO/Je0HOKGzr2/YlQ6yYsOPO6mG8dxCEVch5q+/qd
         WHocWSocEQPn+KJNXs7AFw5kjeYXUhbFA1yTrmZJvzIRBEj0kGZNZlCwY6vGLYqVK3rM
         OOEw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4eXvI1F+BbSIxJVBj1oPAZw7CKBIUrekBm4OP5YCFuj8ks0MlQMBU9szCQ4u2cPM6DuVsoD0GctYSJLoF@vger.kernel.org
X-Gm-Message-State: AOJu0YxWY/pxVqzKuq98FxkY679t5aW2Fj++EODuDPhP6wXYnvVLrVcD
	uKEITho7tWS/7BkGNZZAouWguSUv/0C5qIFqs2Ta7XFKo9bOXXDm2SkXmG69sED6VQouqqKedVn
	9Ki0W+CvX2+Z+Kn1OKbBoRgjPLrOiyZBgQuDDZPQwMhwvmA1aAxqnXfMT5dsy3QyfAVyY6bPmBW
	AXKcLLN7O7QqOcm2WRK9TPqHddFRu8oZZWLJ3/E+lAKkE=
X-Gm-Gg: AfdE7clpfkocrpElmzlcAbyN6Jg2gv6zl41MwlDo8yHHuu0Mfzbc3jRnNt4wsynLtNm
	v/WX1W2NL5ey4xN/YNjMuwJ2qkGY70thzRx0YvdY8txLyyt5jYJBD2GUkmy3cCioCzjIm/qoc1E
	W1RCY+B1azGnPYOrntrdoy0ZY7woLSdwp8N4ObqPB/Rs+n9KYznoOos4OYOum1zw+2fRWI
X-Received: by 2002:a05:6214:4d06:b0:8fd:6de3:dd88 with SMTP id 6a1803df08f44-90402967e79mr83477206d6.62.1783940782124;
        Mon, 13 Jul 2026 04:06:22 -0700 (PDT)
X-Received: by 2002:a05:6214:4d06:b0:8fd:6de3:dd88 with SMTP id
 6a1803df08f44-90402967e79mr83476766d6.62.1783940781520; Mon, 13 Jul 2026
 04:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-rpmhpd-skip-ret-v1-1-d94180ad9a29@oss.qualcomm.com>
In-Reply-To: <20260629-rpmhpd-skip-ret-v1-1-d94180ad9a29@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:06:10 +0200
X-Gm-Features: AUfX_myGsnTpzeCLUzCCdEEGEMdmUEnmiVU6eRml5SOsa6NlI_DndZfCYLoO0mI
Message-ID: <CAPx+jO-hFpXe8WUA+b=jDqXu_+RmU+AsRWr-XXZh5v_DoUd14Q@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Skip retention by default
To: Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: z5AI328VqEdrryGJLnHWxm6OxZb24JDg
X-Proofpoint-ORIG-GUID: z5AI328VqEdrryGJLnHWxm6OxZb24JDg
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54c6af cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=NH0glHQFlFSo9nq5Qf8A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX66HQKOcSLZt5
 Olgwqq+nykOVw41NdLL/L4sHdpecKbNA34vYkmkW/cRf3EcKwuiLXRR/lQYNrLztvMR8ulnliyG
 5FFwujdtEfEz7w1Gn5nrHfJ8Pl6fYfA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX3dPjGolB4HHs
 RSKP9lA4m/4yZDTDi5k1bZvNk0GPiHw/xQ1XX9eFTrf1wYeIICAnqf+BPtqWU25gHsniY95QDw2
 F1QkyifhEKZkMc32IX9Zp/bHl5IIz9dQIlloIglh2OgX8E7x4nG0DsmfRJKhv/R0HygKrr2FrwZ
 XHIa4hSGkMWg2y5vrCFDLpp0gyHwFySUyLgfBuFCgRBerl5DsF2Cm2TW6S8yZJ5U+UzVSZOue0f
 JRjsk1Y9qoQOCItzJu/1fHmEmwjaD6w6MXek8IbQpR2Cnhv5cg28SUnXslWG769EDyXOnA/27gM
 vHpxlsty7NY2qW13epcFOt5dHrZVBseDumeWJ1pBPJdgHCvG1oQG7E+yQo2e+iUHb3Zcbimk+/y
 1OgBak3c/uVeCmGGiY5TeXb4ZlwzeTjPhqoGMLYKX8oiBPgcuwmntro7hNkoza9UwcmUQj6w8kE
 Nu2w94hm7AVBRj7J5LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118743-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mike.tipton@oss.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:fenglin.wu@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 416E274A22B

On Mon, Jun 29, 2026 at 10:37=E2=80=AFPM Mike Tipton
<mike.tipton@oss.qualcomm.com> wrote:
>
> Retention is very rarely an operational corner. In the majority of
> cases, HW cannot operate properly at Retention levels and so the minimum
> operational level when enabling a rail is the first corner above
> Retention. A small subset of always-on use cases can operate at
> Retention, but those aren't controlled from HLOS.
>
> Currently, we allow Retention by default and only disallow it special
> cases. But this leaves us open to various failures when the PD is
> enabled without first being voted to an OPP above Retention. Such as
> when a child GDSC PD requests to enable its parent RPMh PD. In this
> case, the GDSC would get stuck powering on.
>
> Newer chips have started supporting Retention on rails that didn't
> previously (such as for MMCX). Instead of adding more special cases to
> skip Retention on MMCX, start skipping Retention by default since it's
> almost never desired from an HLOS perspective.
>
> Signed-off-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index 63120e703923..35c598b33ac9 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -41,7 +41,6 @@
>   * @addr:              Resource address as looped up using resource name=
 from
>   *                     cmd-db
>   * @state_synced:      Indicator that sync_state has been invoked for th=
e rpmhpd resource
> - * @skip_retention_level: Indicate that retention level should not be us=
ed for the power domain
>   */
>  struct rpmhpd {
>         struct device   *dev;
> @@ -58,7 +57,6 @@ struct rpmhpd {
>         const char      *res_name;
>         u32             addr;
>         bool            state_synced;
> -       bool            skip_retention_level;
>  };
>
>  struct rpmhpd_desc {
> @@ -191,7 +189,6 @@ static struct rpmhpd mxc =3D {
>         .pd =3D { .name =3D "mxc", },
>         .peer =3D &mxc_ao,
>         .res_name =3D "mxc.lvl",
> -       .skip_retention_level =3D true,
>  };
>
>  static struct rpmhpd mxc_ao =3D {
> @@ -199,7 +196,6 @@ static struct rpmhpd mxc_ao =3D {
>         .active_only =3D true,
>         .peer =3D &mxc,
>         .res_name =3D "mxc.lvl",
> -       .skip_retention_level =3D true,
>  };
>
>  static struct rpmhpd nsp =3D {
> @@ -1093,7 +1089,15 @@ static int rpmhpd_update_level_mapping(struct rpmh=
pd *rpmhpd)
>                 return -EINVAL;
>
>         for (i =3D 0; i < rpmhpd->level_count; i++) {
> -               if (rpmhpd->skip_retention_level && buf[i] =3D=3D RPMH_RE=
GULATOR_LEVEL_RETENTION)
> +               /*
> +                * Most HW won't function properly at Retention. The mini=
mum
> +                * operational level is the first level above Retention. =
The
> +                * small subset of HW that can operate at Retention isn't
> +                * controlled by HLOS. Skip the Retention level to avoid =
HW
> +                * failures when the PD is enabled without first having a=
n
> +                * explicit OPP level set.
> +                */
> +               if (buf[i] =3D=3D RPMH_REGULATOR_LEVEL_RETENTION)
>                         continue;
>
>                 rpmhpd->level[i] =3D buf[i];
>
> ---
> base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
> change-id: 20260618-rpmhpd-skip-ret-430a25af1cce
>
> Best regards,
> --
> Mike Tipton <mike.tipton@oss.qualcomm.com>
>

