Return-Path: <linux-arm-msm+bounces-110134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJCvGGZZGGrIjQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:04:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 545215F4185
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFA7630B4449
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953A0DDCD;
	Thu, 28 May 2026 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yxntkil3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZynUTmwv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23A02E7366
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980348; cv=none; b=Ha+ah7vetNmBIyJ/13P4e+UuROkCR27V/y/vdCOZjbujX5tjBAYaTyGrx7GcC7yb+DH7CcK+s9nITRDCzi3MZ3NbgUNSDseJfh+HYulyXcdlS7QTekBj7fqK8/9tR1oYJRQYS2WNS+ONoGjsMVq3gsja3rFWJ7WGZkKi/6KncfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980348; c=relaxed/simple;
	bh=QeXjD2QwiYcbfdLCy3Lj/rARlnUZOMYSvrrb33oEhE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NB4LCRJqSMl30QcN9+plmSjZMnra9oaYbJe1JboaYp0XFv0t1RZkXAvrblurlKDmQH2+r+6Qln0BthjZr/ESht/fort/yKAzTqHjXEYuHrATqOG18mp6gWsRoeF0qfWjuyJR6FIDHd7zo6f72cSqNasCiDxKX73iTcdTqW+X7VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yxntkil3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZynUTmwv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vb86566549
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 14:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JF7FCNKgC+/N7fXpBOgq/DWr
	CNsYoGEOdFyMNVP5q9E=; b=Yxntkil3rlklLRhS5RH0zK0CJS6ASWkRlIkeCVQ2
	J5tJW96s1Eh4rd/jTTh5NDK6LJWqYkhoT1etdHo2ce5w+LriLhqWQzlO1Dh+Oieh
	XeGUGlVHjdyoV5E3WW7uJBB04A+GsQGuhXuKd0XvsLKeQ5kzNWg0oTXfQTXw5L5y
	Qq71zx8jCPZV9U5QSoepivwnS+tMfOpmAjS4NJREOrA7napAqpOfDtgy9JMVZIHc
	syHikQHC1mpEx4K2nCK7AJkcTw05Cmr29NwK6/LvHwYI227JuiFqgWHpJ53btSLC
	8eSSj8SkPB9YfOzoQoUOrtM8jz5I4Z2bKEnBAtMiAy+Wjw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynk6x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 14:59:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6443138516bso16557734137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779980345; x=1780585145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JF7FCNKgC+/N7fXpBOgq/DWrCNsYoGEOdFyMNVP5q9E=;
        b=ZynUTmwvey2dwkZg5+9OcgsF90TQtJwBlfciGjVnqCWXzfmwsdH9Sltgoip0o95RYQ
         sVEdpz2MsY8910pGGGYs5blIuBPhTUJSHQlzBfnE+7gngp0/IIOZcMivZNqPfcGDUU01
         C0TteNMEyk30a0R7c05azhR4t4CMYz1Q6kcApS0WS3hy0lRkb7ukyYSKZ7K5+/ODPGjF
         OxiNHECuN8AL9cXbC6wQ7yYvh8vM0znkTXKSGFtp9zzSQ85RzbFvnkSvqfBpP8rysZR2
         IkJ4qDTYMcX4VNu90Nq45LTZ8Sr6LDi1pzAvKvGeeEHUEZADC2cZtS76dNXqiHspQu77
         qTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980345; x=1780585145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF7FCNKgC+/N7fXpBOgq/DWrCNsYoGEOdFyMNVP5q9E=;
        b=jxfIQqIW0tZgUadHqMN4WwrjJRE0nqle2EzH4QOD544y/sJv3DwdUNMZ3qHcXj5KfB
         0UV/Yd9GeogqVdN1JuR8w2fO72if3vQQlSVsklsxYmF2eY9aoZhVHSfSrD0xNJ9n7aMs
         qhysWMFy0UNR8ghue7dcr6xphzrpi8LnmgR4AnGRxskqkokE2KLuAkAvD2esIPqVSEvX
         jbOUs9P8/I5jLL0mvckSwjfQF4d6rAnmkddqMMcx6t4BM1pUeTOY3ou/5ZYFUEKHlxme
         yTFBZCv+0bzDwb7cWhgVLUeM9we9GIs/E8JNY/jAIHzhVWDJ6BZXZ+NyklR4revcIFET
         liNg==
X-Forwarded-Encrypted: i=1; AFNElJ8bknO0V4mdmKmrWvtzL9mdyF1i/l8tSqHUyB7mCkgeCtUp5xkBMN4t67KjB1zcfl9C6yExzu1F694Nz+cT@vger.kernel.org
X-Gm-Message-State: AOJu0YxPNuC8SWMD08MiHhIP4lWIUwT6N6I0HE9mqG13W6IJNfCyz3LX
	Rg3eX4QY907EY4vspTIWoY2vwkdWQiNta4l3FiWjEU1LoP0sot7Qm8yZbUArcCS159SrAaXZR2F
	KXo0CWhvwpVYJqiDPlsOAXOpieTaYdIKEW6dm3nPy4RvgvaeCH9N1rLZwfCbBTAqo/USK
X-Gm-Gg: Acq92OEMTSBZEoUNflXS03Z9iYSOFMum4uRfhK6Q8oRW8FjGxedPnu1a+COOfy6YIPk
	dYOQ4P2FeRP9TkxDSHzJ4cRN1Uo17SSyOJ7yDQhXgw7z8ncEf6vB9thnUDvDQRVtUcQmUf19E6i
	xFzsgGD3LhbhZVoOADCCCpxZ2Lzk5VWHvPeYcdbv7j+15MuAjbhtbcU9k/RaM/ib1K63Zd3YsiZ
	nE/IcDymioMNu5/Uz7jrjEVoWc2839yxOpcTVDK8MO3WbByb/QQFO9eDxBI6tIdXTLuB8PKFlqo
	ArC2LirgawDbm9whqr3i2JIZQ6ht6BAgDKPCopknBEv7SleiLPrxaa7M6Ve3vrjqlh4wnyCDEDH
	G0kZgiAfw0Z8Bvd9NJa0M2XSuRqiQLiv5BdJjIY6Z+QB8xBlJSt4tF1wJeu4YCHCigiXuJatITN
	ZiZ1UBY6cMf1kLArP+hQ73Ov4eAcubCiRBKX5MvuEKmGfzJg==
X-Received: by 2002:a05:6102:3f90:b0:610:1c78:9531 with SMTP id ada2fe7eead31-67c7f83cc72mr14626484137.24.1779980344995;
        Thu, 28 May 2026 07:59:04 -0700 (PDT)
X-Received: by 2002:a05:6102:3f90:b0:610:1c78:9531 with SMTP id ada2fe7eead31-67c7f83cc72mr14626470137.24.1779980344596;
        Thu, 28 May 2026 07:59:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa46322114sm1986254e87.44.2026.05.28.07.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:59:03 -0700 (PDT)
Date: Thu, 28 May 2026 17:59:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v6 07/10] drm/msm/dp: rework HPD handling
Message-ID: <eijkwjp7taugpxsitpxu6oc7dxsvfenlsavzajoqrw6yaqysn2@lkjkrhfevtco>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
 <20260524-hpd-refactor-v6-7-cf3ab488dd7b@oss.qualcomm.com>
 <0c6ace6f-26e3-4a15-a467-1715480b1115@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c6ace6f-26e3-4a15-a467-1715480b1115@oss.qualcomm.com>
X-Proofpoint-GUID: e4EuE8V0F-8O6C1XjGXh7bvQbK2KFFcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1MCBTYWx0ZWRfXxA7GA6LrGAcq
 BWBrKReTGKFRw0x02wTioGfRsx8YBJaxs+TjpcHYZMT/fPJwGjwB3cuilUt5sTOxlZPNtNSTx7N
 zku4bZVBfRFAel4Np9ODhlOKqjgAbw+XjI/LhNmtrdPxbR5k9F2tvgbRI21GybLKrkraskRwWWD
 xgGFzLX31j5RV3/dvJt31c5CKob1Xj2g5psPxZQgDX+cNhvhW+wl9SE3Ng5nXpTpua/7D5bbwHv
 YSLLO2pqKaBJAocvNwZB52ZuP68cUQB0TlYcsAWnf5WncEoT5YYpXSpqopUCYBuy5Kq98kHhIOO
 s92kHjSBuKFtNrFaOine6IrqL9+NzJ7SUHod1e8Kh0FLXpg8Nc+0cXwKPWOVZUdMcPUvAhIdgr2
 nsYQ7fGkQrGuK5LnZ43GBpV1R4CzjVFdQBpSfA3l8u+SXW/sKHCUqHYt4BM6apDt0PSgW/ONJtu
 385AuDgE9LkPMr3GTzA==
X-Proofpoint-ORIG-GUID: e4EuE8V0F-8O6C1XjGXh7bvQbK2KFFcO
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a18583a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BT-0i3qiSzrRAeLSTCAA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280150
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110134-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org,packett.cool];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,packett.cool:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 545215F4185
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 03:51:15PM +0200, Konrad Dybcio wrote:
> On 5/24/26 12:33 PM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Handling of the HPD events in the MSM DP driver is plagued with lots of
> > problems. It tries to work aside of the main DRM framework, handling the
> > HPD signals on its own. There are two separate paths, one for the HPD
> > signals coming from the DP HPD pin and another path for signals coming
> > from outside (e.g. from the Type-C AltMode). It lies about the connected
> > state, returning the link established state instead. It is not easy to
> > understand or modify it. Having a separate event machine doesn't add
> > extra clarity.
> > 
> > Drop the whole event machine. When the DP receives a HPD event, send it
> > to the DRM core. Then handle the events in the hpd_notify callback,
> > unifying paths for HPD signals.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> > Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
> > Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> This is way too complex for me to grasp at once, so I have a couple nits
> 
> [...]
> 
> > +	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
> > +			dp->msm_dp_display.connector_type);
> 
> Most debug prints added in this patch have odd indent and some
> have vague messages

Correcting the identation. I'm not sure, which messages are vague.


-- 
With best wishes
Dmitry

