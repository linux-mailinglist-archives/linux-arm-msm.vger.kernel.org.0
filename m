Return-Path: <linux-arm-msm+bounces-106695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAgzNRPq/WkPkgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 15:50:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F604F75A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 15:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D71F2300405D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 13:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BA5288AD;
	Fri,  8 May 2026 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfuhB0fA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hC8HSM1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E03351C20
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778248198; cv=pass; b=lUQ0Ph9D61jh+4Gj/8DTn1v2TBBe8wWpZwQb/zMnZWptNmPgfZxxTc9ksSFtjipjdPMz7Tf9zkGGRJCoPjBA0e6KOb618pVw5mUYz+rztj7Hu1nN7cB/mU23xGMmS9Gnp8Bv6CCvgDPhioj15AkxG7i5rt1NDEGPFtcC7B4LOwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778248198; c=relaxed/simple;
	bh=No92NJGF6YhiUu+dLj5eel1ao2jQ8CXdgatX2J9cAgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpfyNtmURbVFE+eNPDdlwy9Mh55wqAvynFaV8mnDY5NWcy+Z7RKzRe0kRfL6gjfS1qj6UyjezzY5Qb/3uiPqjjKbWySVuMCqNOlkqK9d+A5YmyXKxGYfAHJS9QEQBzzniLc0IlAufSqiIluWu3NdKMsL1wso9Ll+GH/t7wgZ/NI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfuhB0fA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hC8HSM1D; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648DSj3Y1061973
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 13:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=zRan7H5xQtbdOyipQRzsY4GuveNwNe4KOpnPprVLo7s=; b=df
	uhB0fAMttga3/lzBF4XcE9AIBmSRC5wMY3EKATQKM+Ywnf83zMpTFjqP6rfnBhST
	G/FDwh5DGWOBwM2UyUwGOo7I3jvSM5V+VV049tITy8jNv3Jnd6gzgPQdP0EaGRvi
	IDBrQrSkQvtoXrLq+iB5UlYfkwsoU3pniErzmOT1oIFHS6rAAdJpYTRQmo6neX91
	ofSZ/W3DkD9c5JBV1Q6D/dr1FnfYfBnlVeOLH8Cn0n/8+3pwdKN9S5vN0k7xeHXx
	EHtT4GLH0XgVQVKvK44eNqGF3bsmuVxr+d0Xi6W3cUii1bWRnEWlPmE1ZCir7zSh
	LO2dIqOLlHySqpcEatZg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1b3fhjbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 13:49:56 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-475f6d0de69so3401209b6e.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 06:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778248195; cv=none;
        d=google.com; s=arc-20240605;
        b=XAsrhTzWNh6rnZqgtIrlMN19jY8waiAUngAkjBueSuR4q3lg9PnKKezX3R+IIDrg+c
         QNqXR5e1+dj7NsH47o0bVvF0JjMz9EvqPh5eCFn/L2xKFnJ/87+GAnuG2U2R9rjC4tb5
         fLpIMFC/RtbSP3lNRkl8lEdgoLZou299A2XAG1TZ8InhERRJzWh8EaQYt0pQGPJ2INLE
         A4qCU+32g0+lMCCLBIzghEK0GaVdtOtKmEIwByOWBBUYRSaFePfiykoeQOhxy7GFz0Hc
         HiDQ1uAlQIxYDvsYfZ566/Jj53gmtSQQVXmvfhtfokkB+NnTzfUgjAmJJEDDWj+WTbfq
         BUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=zRan7H5xQtbdOyipQRzsY4GuveNwNe4KOpnPprVLo7s=;
        fh=kMjdJufohV834Vwb5maMpuLtvu/YBktPijzgeqcoBRQ=;
        b=OyDbBdxSMxXoMR79UrshV45XO09HZq4gTXeCfb9cdtMohWRkLNtA6cRK4eguzTsGGT
         2l6vb40ip2Aiw6Pibfh9Ln5HqXE0hF0ABp4ZuAGFLbSYspwSn5VyzCYPjW2dCfn5VHwB
         YBrLA4oeMOIaNmPAtsdher2VqoTVq3qu3R7bSbMvxkraxeA/PUOIDjL15iUbkW5Adg0I
         twluQXIc+HhXqzWLUnyeNPcg1WDNameuCiBSgzSG23ELUqsQJAzkbUs6gbpmtlbC8w5F
         DJCXM2rz6js7fEKkQE1psTAbOFde5cDe5Sb+reAGsa+C0v7o4ku3+fW6N7tyOt9lmYs0
         x9Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778248195; x=1778852995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zRan7H5xQtbdOyipQRzsY4GuveNwNe4KOpnPprVLo7s=;
        b=hC8HSM1D6/rPAxc3rG2lFCd5nYmh3FyQegVX+6x0MJdtiSbYCnj7oF7W12FK03BRoV
         MU1VJ49l+PVRsuTVWinbg6yNwW4bVpPbp4fYmA6UObZrNxxd4Ddns1IO8CvTyTGsJClx
         VhAWhbkFxDnLqIHI4UjZ1q341TREkPFZ0px0xZPunx0THCchV23l3PUgpw+vXxTQm6Kb
         n3JLaC1qrF93yM2vcQ6D60oCBm0qMnW/NcvUG8Rpk6Q+YAyiwkioVdiK++wl3MCJ0JDT
         yVzN1jYXN25FdXceRNzriWraki8cW7TqL6yo1iDgdQxcC48qvIvhY1U4VqCQFJL9vJXt
         7Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778248195; x=1778852995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zRan7H5xQtbdOyipQRzsY4GuveNwNe4KOpnPprVLo7s=;
        b=P+Yhpba/y5NE/A6t4sHtEJ7/3eesdpTFkSUq8h2kCE8s5/QXIMefi1tZHeebGSfZiI
         ayYQZcYDtBnxKSTZ/KYF/CVZ1C2vU6whgjQIl25oET/8/VeO2dHFyxihZVURc6UxHWHQ
         f7Orpcf+vFDTBnVxZt3AwZ/0Pkx6H/Ehe/c3HdBmVVqS/LmDgRe6LxyEZypJF87ZGHUX
         ZezVZhOlbzMPGP+GPEyol0/G+qK57NSQunmdK6GNPISzQL/uU3uhBYryJLMeykpMVgI9
         g9qjXdQ8Snsx6kNaFJQH4crkKsCYBRyVhA9nQqwSek/G3XLaDdqm5W4Sm/kc9Jmb3sVH
         JeTw==
X-Forwarded-Encrypted: i=1; AFNElJ+xgtWl2+GQlZZTcrM0uQKW9k8ziF2DpHW2vbQ1ZtN3fn2n26/uRQQ6OZpBxD+SoYIRjWZWx4Vr5ne9ifjH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6VAZspM85TR6xLkxp1r3jXBJtV62QVdLzxridkfmAx/akDnTo
	TKGYEwAonx5mAnjYZWKtSpPy9jPINW5Y2LFfZ1ldgMaCP3BOoEBKUf8VNkNuNYRLgK9+oftDuhV
	1D+t8z2HfFIgEDVkc+fi5z2vDoz9OEdN9oQm3AIoLM4V9Y3qIo37sdDsf7laNlqr5V12r1+8Zl5
	bRYlkPNufI4HhLM86BIEUjWDI4Ouo+HCviaJ/7TcuJ8mE=
X-Gm-Gg: AeBDietxubFBrQLa/HaW1wwTE0vEwADGAaQRin7ElYXotV9HmuqJd4UfCL25Nc83pmx
	w7Z8rYWX2P3N3cHLLEJGVE+VS0temZ7HqB4FjQeuNNUXyCfG/geDDdaEdAo7rnV1lKTve/+6sn/
	vJE+3fMJ6JD6E3yFqrs+uRC0vaTOvslth/UHRQt9p/cLYGWrN8pqxxGKf3mUmQ/ShH+6jfnLqK9
	8qnD19qlPgHb0RsgiG3tLqWDhPna2bEACD+tw==
X-Received: by 2002:a05:6808:1717:b0:47c:3793:c589 with SMTP id 5614622812f47-4804249a98cmr7370855b6e.26.1778248195303;
        Fri, 08 May 2026 06:49:55 -0700 (PDT)
X-Received: by 2002:a05:6808:1717:b0:47c:3793:c589 with SMTP id
 5614622812f47-4804249a98cmr7370830b6e.26.1778248194806; Fri, 08 May 2026
 06:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
 <20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com>
 <20260507144639.68bd699f@fedora> <CACSVV01zGLN8FV3Fpw1BnW+zSokE7n2XJ2dBmDw8-n=MXBmDnw@mail.gmail.com>
 <20260508104107.055223e5@fedora>
In-Reply-To: <20260508104107.055223e5@fedora>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 8 May 2026 06:49:43 -0700
X-Gm-Features: AVHnY4Ik2X6E8TO3p7rvOwpC3pbJfU5jLPapHjI6e4e12QW7f5c0IkRLuB7h6cA
Message-ID: <CACSVV03MYBb5h3cm2qrxp8vGWdSfdkFvUs4ekqhhuCFZKvv=VQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/gem: Fix a race between drm_gem_lru_scan() and drm_gem_object_release()
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: IlJPaAmpHirgDpfauF1ufOKMazQ4J74M
X-Authority-Analysis: v=2.4 cv=YMOvDxGx c=1 sm=1 tr=0 ts=69fdea04 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=bfSRTEewp7xfJmCQdakA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: IlJPaAmpHirgDpfauF1ufOKMazQ4J74M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MSBTYWx0ZWRfXzTAnzvrbHclj
 Hagj2oyl0quZbxSk8XEpoq931Uufg+CpnyTQd03axylIgyagMoI6ZojvvBIDNhJPnwkxe9L9XWY
 zPbbWvKFDqoOR4cTJrG9QlUQz+aWWiha6nnec6FzMAqLBgX3D/LOmHH+vXG5c/TN7QlYqnXiAsr
 wVkk5QaPG7sBMA1DOTH4Br5yIqTlVAI7VOwA87mqtRIlfdG9BUfMG9CzXGJCO55/zZ285RQYrTf
 klXynY+bZGrhec/sasXAHYL2OcQlhG0BHQ4QOmx8xntobtA5FpA7xlEw0HXt+eFL0gKyft0Jc2e
 DasZhWEPEd07OLxTARb623SrDP6cyqlRMaIAA7ImsBHsdROntstJntCYTUnC4Qjse8dkr9Tb7Xn
 J7Pc5PdoHCMysGhkf4nAteBmQyXwQoSAdM06eqgVe8+UL2TlHXWSUG8bfqLq8WOM+cOBiyMbhDZ
 zwea+/Hp08fosfVF5bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080141
X-Rspamd-Queue-Id: D4F604F75A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-106695-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 1:41=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 7 May 2026 14:38:23 -0700
> Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> > On Thu, May 7, 2026 at 5:46=E2=80=AFAM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > >
> > > On Wed, 06 May 2026 14:16:27 +0200
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > >
> > > > The following race can currently happen:
> > > >
> > > > | Thread 0 in `drm_gem_lru_scan`               | Thread 1 in `drm_g=
em_object_release` |
> > > > | -                                            | -                 =
                   |
> > > > | move obj1 with refcount=3D=3D0 to `still_in_lru` |               =
                       |
> > > > | move obj2 with refcount!=3D0 to `still_in_lru` |                 =
                     |
> > > > | mutex_unlock                                 |                   =
                   |
> > > > | shrink obj2                                  |                   =
                   |
> > > > |                                              | lru =3D obj1->lru;=
 // `still_in_lru`   |
> > > > | mutex_lock                                   |                   =
                   |
> > > > | move obj1 back to the original lru           |                   =
                   |
> > > > | mutex_unlock                                 |                   =
                   |
> > > > | return                                       |                   =
                   |
> > > > |                                              | dereference `still=
_in_lru`           |
> > > >
> > > > Move the drm_gem_lru_move_tail_locked() after the
> > > > kref_get_unless_zero() check so that we don't end up with a
> > > > vanishing LRU when we hit drm_gem_object_release(). We also need to
> > > > remove the skipped object from its LRU, otherwise we'll keep hittin=
g
> > > > it on subsequent loop iterations until it's actually removed from t=
he
> > > > list in the drm_gem_release().
> > > >
> > > > Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
> > > > Reported-by: Chia-I Wu <olvaffe@gmail.com>
> > > > Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/=
86
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_gem.c | 14 +++++++++-----
> > > >  1 file changed, 9 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > index fca42949eb2b..97cf63de0112 100644
> > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > @@ -1660,15 +1660,19 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
> > > >               if (!obj)
> > > >                       break;
> > > >
> > > > -             drm_gem_lru_move_tail_locked(&still_in_lru, obj);
> > > > -
> > > >               /*
> > > >                * If it's in the process of being freed, gem_object-=
>free()
> > > > -              * may be blocked on lock waiting to remove it.  So j=
ust
> > > > -              * skip it.
> > > > +              * may be blocked on lock waiting to remove it.  So j=
ust remove
> > > > +              * it from its current LRU and skip it.
> > > >                */
> > > > -             if (!kref_get_unless_zero(&obj->refcount))
> > > > +             if (!kref_get_unless_zero(&obj->refcount)) {
> > > > +                     if (obj->lru)
> > > > +                             drm_gem_lru_remove_locked(obj);
> > > > +
> > >
> > > Actually, this thing is still racy, because obj->lru is dereferenced
> > > without the lru->lock held in drm_gem_object_release(). At this point
> > > I'm wondering if we should expose a drm_gem_lru_remove() taking the L=
RU
> > > lock as an argument as suggested by Steve, and delegate the
> > > responsibility to call drm_gem_lru_remove() to the driver. Either tha=
t,
> > > or we make it so the LRU lock is attached to the drm_device instead o=
f
> > > the GEM (both MSM and panthor assume a device-wide lock for LRU
> > > manipulation).
> > >
> > > Rob, what's your take on this matter?
> >
> > I don't think there is a race, because of the kref_get_unless_zero().
> > Other than lru_scan, there shouldn't be cases where someone is moving
> > an obj between LRUs racing with drm_gem_object_release(), because that
> > means they don't own a reference on the obj they are manipulating.
>
> Yeah, but the race I'm talking about is drm_gem_object_release()
> vs drm_gem_lru_scan(), so at this point refcount is zero, and this
> patch only moves the needle, but doesn't fix the problem entirely:
>
>
> | Thread 0 in `drm_gem_lru_scan`               | Thread 1 in `drm_gem_obj=
ect_release` |
> | -                                            | -                       =
             |
> |                                              | drm_gem_lru_remove()    =
             |
> |                                              |    lru =3D obj->lru     =
               |
> |                                              |    if (!lru) return;    =
             |
> | lock(still_in_lru.lock)                      |                         =
             |
> |    if (refcount =3D=3D 0)                        |                     =
                 |
> |       drm_gem_lru_remove_locked(obj)         |                         =
             |
> |         obj->lru =3D NULL                      |                       =
               |
> |    .....                                     |                         =
             |
> | unlock(still_in_lru.lock)                    |                         =
             |
> |                                              |    lock(lru->lock)      =
             |
> |                                              |       drm_gem_lru_remove=
_locked(obj) |
> |                                              |         obj->lru=3D=3DNU=
LL =3D> NULL deref |
> |                                              |    unlock(lru->lock)    =
             |
>
> We can of course add an extra
>
>         if (!obj->lru) return;
>
> in drm_gem_lru_remove_locked() to cover for this race, and add a
> READ_ONCE in drm_gem_lru_remove() to make sure the compiler doesn't
> do crazy things like dereferencing obj->lru twice instead of having
> the LRU pointer stored in a register. That still assumes that the lru
> we assigned to our local variable is valid even after the
> drm_gem_lru_remove_locked(obj) call, which is true at least for MSM and
> and panthor because they have their LRUs attached to the drm_device,
> which outlives any GEMs attached to it. But it's not something the API
> enforce or document as a requirement.

Ahh, right.. yeah drm_gem_lru_remove() should READ_ONCE(), and check
obj->lru after acquiring the lock.

And yeah, that is assuming there aren't lifetime issues with the lock itsel=
f

> >
> > That said, I can't really think of a sensible thing to do with more
> > than a single LRU lock per device.  And it does make things easier to
> > reason about.
>
> Okay, I'll give it a try then.

sounds good

BR,
-R

