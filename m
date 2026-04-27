Return-Path: <linux-arm-msm+bounces-104755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAFzLrGE72klCAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:45:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD6475785
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33B26302D9DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957F4346A01;
	Mon, 27 Apr 2026 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxejcjNY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8FlmrhW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45784345CCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304413; cv=none; b=n37Y1RjkczxP4oc2Ku+TvZ+Bw2VtlMFQUc465PIS+mb9Fz+WmesYe7ic8SwCjwdNTjDAf+mJHoy8tTlWOjxKLNzIYecTD1ZuICcvUJFUA97xD5OjraXnb6ymZPAECeXcG214H3OY/a7/La60tCY1kvaNziJCYYzCDAs3VgWKBzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304413; c=relaxed/simple;
	bh=T3Ob6RGdjbwoE7jWGwSxRUaZfQM2UFdEvXHSXSQziCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlVL4eIkZ6A8pex+PW35mrFoM/mrf7kDDsZnDlIi1rLQLWzZpvUfm4kkn34qGw/Dcp+vK83kqjU+wJ5VaYuNM65D3AFTEavsZBihrRPkTpKf9SR2ORg13rV2NiH/5/rFenND/73LCqGQTnDP6lG2atLswNUSsBqgcWtyjdpqdyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxejcjNY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8FlmrhW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDknAP3639605
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CUviyHu5v9SxxUYlb7F9z3cM
	KSeIvu5TB0UyInkwE5I=; b=LxejcjNYF46JL8CghhnnWUgn7vAMcALbuZChuwMS
	xLlo0RXzncMth5mJY6jHE1iCzaow0ZiETxNZQ/8aVDNpwhsssRV6LR1sdO25WGxs
	oCrqH8tcFwsi9sj1+4sXJdb5u52Y4HJXR/GP+nRLzCrRiM0+Opc5mfn6Otd0+C5i
	vgkLXFOo9bcZqfzKs2yiE9/yc2T/3aj/ltJEtiIUURefqpeaf9a0dE9qCVpSByDC
	nZPzJ4S4IVFCOhUpwYnOlBXDRDfqZoOHEiMwYO2kAOBZyvxIFIFJszv38+GIKlhi
	xzCJe19Zuuf3xfyMK+XHkT5y6K9ibi2Jkxa6utP+NFCc3w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya02rm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:40:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9546466000cso3812082241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777304410; x=1777909210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUviyHu5v9SxxUYlb7F9z3cMKSeIvu5TB0UyInkwE5I=;
        b=U8FlmrhWEzse6S7+g/JkJ4pJWHZwK+Q7N1ilsMvuuSRUIingaRmJA+aG9zFazRlhd1
         uA9aYqVyHgM3OMjANs48wdjDUZgv46D7uU2Ft7QlErKiSXCVlecX71+qPAeJvKII4aE7
         Yb8t9CneGwBs8/Xf9iyMxlPLjD/IIfJqNE6rxOdZM5gA/oEpflv9A2kxzzGUcs4Ynj8i
         Cdvn6c8ee7s41eREpZPGDZYPKmklNFf87BM0iVc5VYzhZM21PSPP0hGmylK1Gmku5Ruy
         QGcufGUMaP4rKn/UTtZq4Tn9Qwemls10uiILL/UTrBDpwFPFWwFwUutJvNqLNZZMSBk6
         GTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304410; x=1777909210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUviyHu5v9SxxUYlb7F9z3cMKSeIvu5TB0UyInkwE5I=;
        b=mnRj0mh3Lw9SzsBM6vkQrNjJYVoATHs/Jwg6mcAGvNgIdEsXsjf5aQFpghSV8ZCSnm
         7zt538nYgnuGpQ17MgkNW+lDxyqUBj54/PKF/gSXKkC4o6ioipgg8tE0U96uqmT55hIW
         4HqO6ahV7IAIcHhYE+rh459ecRQimMZL2HXEv8FnB4r781qGiLyVfOSTfATw6reYGMQS
         DGMrK7Ncel8wTVJ8gZiJvNSSBlCHts5knmh1PmDcKbd/8QEpnm2in7Neme25mRkPTqCX
         ehNFVbFtiE1AcnfGP2X4KOPmlLmFu8Qp7xVvVakYwA4bqJX0aNshW8WJ5eDwH67qD9Yu
         tcwQ==
X-Gm-Message-State: AOJu0Yw34T+Q7S7mPn2emFX76kFriN2LlueOqQI/EgZUBF+DVHWVI7YH
	RjlMR3lnPJ0qkqgbOJMnVKwdHAmFPOjFDxTMjBOBRV4pYSEHMlwUX/qCq7vBgYIlkWPlx7t8xh9
	To/XDWwxkLA//BGzufBrOluU1uv1Yp8KARtYYSBG5YtXaBXYFz63jXs93y20ppEhmqKmtM1Ggu0
	v8
X-Gm-Gg: AeBDievC4ipHYm5OStXSXDfjp+Ru5OwrpjIBksa4Ohz6LVSyvIXOzq2Iaf8a151c+F6
	SORijq4/62t8fp7S0bQeyW96vltmgx014Z0uCsWiRXU0GAq7yKaE07CVwm5sHBZjJI5QeZbD7aJ
	P3mXKdl6O7SeV+Y6K3CSz9dmpwhhbnTi1padMP7QyA+gtUp1AHdtH0dCidD7RA6xOjIm3WVJ8hX
	kvwJs2SoQb+bqYmdvWfpWKMlDoVHFuqVEKw2jopuQXSJ7ilvhbEczucU39mopTRRTpGgo4TtGuZ
	p3kqB2/wmiYOVZLUyJaKpBrffMmknT4yF7M94RxM1C3t/Fi9sUa3IYnQdYeql8hvuh4+kpgUOcH
	irTrwVRIFJT3xh729KQQp1N5V/tcUWYwPETP4eFjbZvbJH/5dMGUBAQdpS6zShneqUFkc5nSKgd
	p3CHbkTOPumrA7W/TE5Pc52MwobPGBnjXlE5m+Jhb1hriGmA==
X-Received: by 2002:a05:6102:4415:b0:605:5e1b:1d2a with SMTP id ada2fe7eead31-616f68d398cmr19144020137.18.1777304410448;
        Mon, 27 Apr 2026 08:40:10 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:605:5e1b:1d2a with SMTP id ada2fe7eead31-616f68d398cmr19143994137.18.1777304409936;
        Mon, 27 Apr 2026 08:40:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb733847sm70648481fa.34.2026.04.27.08.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:40:08 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:40:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        bsatish@qti.qualcomm.com, akhiverm@qti.qualcomm.com,
        nicolas.dechesne@oss.qualcomm.com,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: Drop modem support
Message-ID: <hfvrinoiv336g6zbqsxish2gyux6awgwlk74qh3arkkptligyk@74qfh23iaxxf>
References: <20260427112833.1160332-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427112833.1160332-1-sumit.garg@kernel.org>
X-Proofpoint-GUID: QSWot_xn3nzYGBnrJ5BvL-9g9UxDJgHW
X-Proofpoint-ORIG-GUID: QSWot_xn3nzYGBnrJ5BvL-9g9UxDJgHW
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef835b cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tTgMjHgdtQGs5P9gr_gA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE2NyBTYWx0ZWRfX07rh9ACZFOG6
 NXsmVIsj2pIdJelq3CQXNWl+OwGDx+SxSCVujUui5OuhXGlNkHWzdHnoptlToYHNqnLoMn9KWAQ
 wlouui19H4mQAva+AknpzyE3DNwI5Pd9SfWknS1dqItQ3wE3pfVH9kMaisljqcj6+p/zrjVMcBb
 1renLTDa+SHBvY6B2G8XNbVkauvBPRExhsjxmI0/AGCEBojx0yNgzGhlNC3NqLMaMbZtU0fKejb
 uyG20tlKcw/wP65duhIU0NRUgUfoluuCFkRKSlNOgRyvFfnbLRmF73HN84U+0zDjpTq92y3pc6o
 UGMxDtLGkjPqAxPADCCOvpLn3KDm7JYH9gIlTmQVnGV20CCHFzwVfuk1tbCMSkFZ4QVlLJZhwlv
 r4OdGpQItGeFPMi1MBhvBMiH1OeDBs7mAwi0oKU9z2oLH5Hv7efNkM8axsoL13VVE4C/uliKnHd
 6xM5XTf+9iVz6BAehvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270167
X-Rspamd-Queue-Id: B3DD6475785
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104755-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 04:58:32PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> QRB2210 has modem fused out as it's only available on the mobile variant
> which is QCM2290. So let's disable modem support from RB1.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 5 -----
>  1 file changed, 5 deletions(-)
> 

No, this is not true. On QCM2290 the modem DSP is being used to download
wlan firmware. As such this is wrong.

[    4.186507] remoteproc remoteproc0: modem is available
[   14.811564] remoteproc remoteproc0: powering up modem
[   14.883766] remoteproc remoteproc0: Booting fw image qcom/qcm2290/modem.mbn, size 8881672
[   15.505182] remoteproc remoteproc0: remote processor modem is now up

-- 
With best wishes
Dmitry

