Return-Path: <linux-arm-msm+bounces-104137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBE7Eovf6GmeRAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:47:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4C244772C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85A6C307848A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3663BFE4A;
	Wed, 22 Apr 2026 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZP7pFmCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejSbdQXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06393ED109
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776868895; cv=pass; b=BIpq23Te1Z4ugaZlnOS4dbLKL4TSzVvjZFrG9FO3a3H6n+5ushththrdJvgfmXMsBMsYC1EnqbNG2srs4fmuv+Y+oEK8qT2HR/oQyaX8aXV+yZSwa8Wa1U9rvkHvK2MSMb3wbbvs1DxulMot/uXVrk6zUqmyNZj3v1vsyIJWCxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776868895; c=relaxed/simple;
	bh=/p3tAPzOhh3fJGwg59dmRIPuo464telx7Z5XPUoeBK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsniPRhMPgBoIm3KxjJXf91mEmBAS+uPeqMvaWgmCpJZ/vYHAztut9xSr0Sfp4BU9Slr+PO6bBjd7cOtpGIdA4Kqt5bMjYvg0nWOUhfbbeEKgEmkcqCiiUG99YdqJoNY8kp30jopnkfqVH0Kb2erRdv3EI33p+HQwtQgrGXGrwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZP7pFmCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejSbdQXI; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MBjF9u2209292
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ASK75C548NXlvmkhFEvuKgc20/D6DTZS2vwxyHG3ttk=; b=ZP
	7pFmCmx1bqK/a0r7k5pDbeLBR1y6+oMk2bEUDLe+pH6iOxR9RyGiBdSSoOQ3Th/D
	tZKvxs4Bhx5mxTss+dHGfIksdnsIqnR3KB+XR2xcgJkfj1eJPL1EqApMX1eNfLjr
	Z+vaZjI4Bo9R3KqdMGpQet9PqN1R34n3sK8d9sbN9zjMs9R5KvLhjyX+jehyNtYt
	2Icw0OQMjChwcgoETDGO8jjjRjJb+pUMMvud46p3JPU/+4fFaVL2KMlZmg6KgEQ5
	JdV3V+nsOTIMk5F9SNyiXR5UZRaUssUrVzBj98/baV28fQB1Npym7oeTg/LX4NQ5
	RtQ4QL2k2CG7RTYOTwNA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengbssu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:41:32 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46ef241b62aso4392648b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776868892; cv=none;
        d=google.com; s=arc-20240605;
        b=e324QWgejgo21xg2ICfB88Idvq2Pf9I+SfvbXEG1I3p3Juqz/j7aQeC7cjSyUb9SCf
         +tP3UWtkBDPC8YOtFDj/7CWWrh6SKB/x7BlCQQz3t6/M5lzFFeePSPZ65mI0JSkBZyR3
         kI/EC2LtnyFOK60Vb173RmZ8B0CJHZYoSC+W+38jEHERRNp1wU8mf+1qjbvuQrAFBlWZ
         M583+49GQ3ENokUH4r4ob8V4Khp+Heo1C0HK21EtvYfkGpktyu/HgqBYSIH5H0ACrNCW
         bWtPnpL6K8TwB3WVeIPUj5zl83b7SoiiF2hAzUoznz18ccBPQTsVY+e2r8PIR+XILWHv
         X4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=ASK75C548NXlvmkhFEvuKgc20/D6DTZS2vwxyHG3ttk=;
        fh=jC5XvrOrP4aU9/KNGqnyTeMolEoE+C01q6nWAZZpow8=;
        b=Qpy97bEg+G9N6FUT1gwZVFl3jNBdkeMOOJAvZF6K2WIyg4GLHiDQk5ZmJpTXW2CWzp
         QcqPHag4VBk2PyokUpOd8thRtfpBtl8H3B6lkTSz+Ffj7+0HTdB85BvclDF6RXCgBVqM
         STW0+9g/9YtwWXcUlK9Q5s2AoXRC/9q9NTYtKZAdMGQdUR4rURTe3bsmaxwGaZXCoM18
         JW4XXQK1szUTZyf/OOCXAWmSXNIWjl8l04FEsYNlR+cQTR5R8alE4PEpa0VDcuCecTeF
         EJSIIznIHvvftpw+RltT5j1maa5bkMi8sg5H6Yi+Iv/ioKCje8ACGgPYu6iI26Zv2ylE
         0aAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776868892; x=1777473692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ASK75C548NXlvmkhFEvuKgc20/D6DTZS2vwxyHG3ttk=;
        b=ejSbdQXIFLIZdv0LP/CnzGlX1X+MVx8Bw2x1gjn0QfuNvXBowOZ/uVbWsZa46PWYJz
         FVlhG6N1vjfOACK3UBJgu6uHknUNdnDJgBHAp1xNd6jugpNk1x2lmg5bMnhu303QrhtP
         xGxfdrTVMP0+IQSAhQ6QJ/yiqHRhH5eKHGLyJHsnuFzHIJTJWXEuKQj1chUmtPlyGvI8
         3FivfwFMTI4aoMZZGnfLEPFdAHL8xOr40k4HGYphBNAqT1j0I7hXXgk5jp6I8Rkt4HH6
         XlxKHjNTMP/G+JoyAiqzEKj9qWvf0bNa5to6v7qrTWrrJ4+lmj9JL+M9Mk+x/StTrogn
         ARjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776868892; x=1777473692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASK75C548NXlvmkhFEvuKgc20/D6DTZS2vwxyHG3ttk=;
        b=YI141zh3xgJt55GEt+MJss/JYX2jXcVnNKIIIZxiqk8ykiFcehaFqAYDEbb8Mo8PTb
         iB0L+0dsLs1XlI8BvNYk3+kI9+ZW1RgnTB5MrbWgOeqeSG6dbbgifP+fPgdy55NLUulK
         dtCBFZIIPOYhA2QMpgiJZpu3dBM+GTv+2+YQPz1ctOEL/Egrh2mKoCAun4nlhZ2OQybf
         F8tNs1dci6CsdAzn47fULreLhh267wWhjtg7XJTJXxmSuA9VAtSopYslcNbZXRGMf7ZB
         wVbQQgEUBd385jC56VlPcjJcT7l0lr2T76ijhiDETKbgDhH0JO7SVd7LAqdT80rCtcvo
         agfw==
X-Forwarded-Encrypted: i=1; AFNElJ9NevK9lmOIHWdx+96612Gg0VnSJ1SUZbmAj6dB/Lg9m6M/vbaPYz/jT5QhOWTfmJJktQs8lw4zGkqIyNxZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKYwVJzG2Y1huJm5sfdyrwe9dpK/Jv+t2pZy9Cg3ZvBcpOGua
	4cllnnpF9QVKXhoS6l/pPAj08j4GBxUrnAC8FD6i1dYMM8OhmYpUOK5g2/wMHHc6yuhfcGGUhjh
	QUveTQ8WPAFJXlO0Rneogk3S6zWlMRQSZAmdV9fju8jhsRUOHGQNLAP+9RGlM+HLRgIT3xvkvDM
	XpSUyloy2KLIR+8PILzb8w+ghtYNWzOns2DMsbtWhA29Y=
X-Gm-Gg: AeBDieudFqJ3lQh3L0Z2HUNLPM8lFTBEmibenvOM+Ky0w5Pqwo1qA2/8aFxbX4/Gemd
	9FlcpKewfDx27T6I+I1XhievFd0MB+Tzn2kark68O28a4zL2KPsI7vmUHF9BovqCF79U9lEe1ca
	4c1vSZR14HKaUYIQBT5jOFd9m5JrhkC1Yyr9pYveeuNdq6Rh7DpG6IXMttCN6UBm83bRCVXjkMs
	OorsfhcAE8dRbM5IqftkSdeWQ10NWkCH9e/HGQHc9VBbKPo
X-Received: by 2002:a05:6808:bcf:b0:466:fcbb:1673 with SMTP id 5614622812f47-4799c986c82mr12178724b6e.17.1776868891990;
        Wed, 22 Apr 2026 07:41:31 -0700 (PDT)
X-Received: by 2002:a05:6808:bcf:b0:466:fcbb:1673 with SMTP id
 5614622812f47-4799c986c82mr12178700b6e.17.1776868891528; Wed, 22 Apr 2026
 07:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-2-robin.clark@oss.qualcomm.com> <sidcsgvqxddatwwflohsd6gjzm5ehbs4alwaejh3pnjnlhj7vm@nqxhdtxxxizs>
 <CACSVV01TK+iLiaCofFfPU2eeMGT5HX5iW0rf=m+gjojXsjrk8Q@mail.gmail.com>
 <puvvx2h2jnoxej42blcdx357uzx37ogwnqldcynklmm4acameg@4zvnrueodcon>
 <CACSVV01D388voqDxmfOm_qhV3=H+F3YW2oUjzZT7MfKYwjapDQ@mail.gmail.com> <cczwmaecg7h5lpuw7mi6n6k2zu3lqisrkqybavxe4h6wlrofkg@qcmf7eq3siaz>
In-Reply-To: <cczwmaecg7h5lpuw7mi6n6k2zu3lqisrkqybavxe4h6wlrofkg@qcmf7eq3siaz>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 07:41:20 -0700
X-Gm-Features: AQROBzDalJysxrZn27grdaXVt05e6kb3XI-2svp1NTZOzlE7UWANlWhDRO8Wc4I
Message-ID: <CACSVV01rHMY5NwaZ+e-3GRPNnuVCkYjJJRUzGYvXPi7JzrOgSw@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/msm: Remove obsolete perf infrastructure
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE0MiBTYWx0ZWRfXxaUinjz3jbxM
 B+/25VjeFNEp5zGE5gepsbd7H4AAHCe42uI45rOavsNl/u5hA9+4I2UBVo3ROttySBbSfcNTYgS
 uYczPGNCr8cuzrqtSgicKSRuL7ZRXj0/u8qpWOQ/irmqL4+vfMS7MYMNPiJQh7vep6Jfr9JPeUV
 hB+DCefW9LgO0HK4KdJXlJpwpF6veJ/ZakgfPxG4zhJOopBdxjEOfdZB97T7KShXaqezAPSShKq
 uMoSguybzTSyUoUjPpdvibFEvO02O3yKMhPPR4Ey9Rk95ZrjCkrqG4B43J+9h74qSswIHDnqrTe
 j174J5+EYqYZmHZgW9kXeKB7I6ESOK5NyV97NqjXLhEbM2y9t0aGM+Iw0mZl8ZVx2FvaM5cI7AH
 ETAt+ZNTzAsTZ9pBgQfsrNb+7xniIeI0O1J2HikTxdwSowMXjJFOt2lZ+ruAYHfFhhnt174mCZq
 JEd4pZFM/m8x4hJqJLw==
X-Proofpoint-ORIG-GUID: UTPup-nUft54PPL0ylMM4rfQezsdJpio
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8de1c cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=z5GDcAh91ePceZgdlIkA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: UTPup-nUft54PPL0ylMM4rfQezsdJpio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104137-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gitlab.freedesktop.org:url,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D4C244772C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 5:41=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Apr 21, 2026 at 01:48:40PM -0700, Rob Clark wrote:
> > On Tue, Apr 21, 2026 at 8:39=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Tue, Apr 21, 2026 at 06:07:20AM -0700, Rob Clark wrote:
> > > > On Mon, Apr 20, 2026 at 4:49=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Mon, Apr 20, 2026 at 03:25:23PM -0700, Rob Clark wrote:
> > > > > > Outside of a3xx, this was never really used.  And it low-key ge=
ts in the
> > > > > > way of the new perfcntr support (or at least it is confusing to=
 have two
> > > > > > things called "perf").  So lets remove it.
> > > > > >
> > > > > > This drops the "perf" debugfs file.  But these days, nvtop is a=
 better
> > > > > > option.  (Plus perfetto for newer gens.)
> > > > >
> > > > > Would it be possible to resurrect "perf" later? It was really use=
ful.
> > > >
> > > > Nothing is impossible.. but I was having trouble naming things with
> > > > both old and new perf stuff in parallel.
> > >
> > > That why I wrote about resurrecting it later, once the new stuff is i=
n.
> > >
> > > BTW: do you plan to get perf counters for a3xx-a5xx back? I remember
> > > that there was some issue with a2xx ABI.
> >
> > So current state on userspace side is that only a3xx/a4xx are missing
> > perfcntr support..  although it looks like we know the countable
> > enums, so probably not hard[*]
> >
> > In all cases, the existing userspace-only support will continue to
> > work.  The main reasons I omitted a2xx/a5xx on the kernel side are:
> >
> > a) Not really sure how to do the Makefile bits.. since they wouldn't
> > be using a6xx.xml.  In meson I can use a table (2d-array):
> >     https://gitlab.freedesktop.org/robclark/mesa/-/blob/fd/generate-per=
fcntrs/src/freedreno/registers/adreno/meson.build?ref_type=3Dheads#L20
>
> I saw the comment in the commit. I'll take a quick look.
>
> > b) No good setup to test
>
> We probably need to figure this out...

More devices in CI would help, but I'm not really even sure of a great
way to automate testing of perfcntrs outside of some simple sanity
tests (like is the ALWAYS_COUNT based freq measurement something less
than fmax).

The best option I see is to just leave what works, and not introduce
features on older gens that may actually not work.  If there were
infinite hours in the day, sure there is a lot we could do.  But we
are still trying to close feature/perf/enablement gap with current and
recent hw.  I don't see how to continue to close that gap while also
bringing every new feature support to older hw that upstream supports
but android/downstream blob/kgsl has long dropped support for.

I'll accept patches, ofc, if someone is sufficiently motivated to
enable and test on older gens.  But otherwise, to close the gap we
need to run to where the ball is going, not where it was 10yrs ago.

> > c) They don't have IFPC
> >
> > They could ofc be added later.  The main urgency is a8xx, since I
> > don't want to add mesa perfcntr support without PERFCNTR_CONFIG (so
> > that we don't have an older-userspace, new-kernel permutation on
> > a8xx+).
>
> Sure.
>
> >
> > I don't remember about a2xx ABI issue.. but a2xx perfcntr stuff was
> > added after I was already busy with later gens.
>
> I might be completely mistaken, but I think the issue was that the
> kernel didn't reserve one of the counters for its own usage.

hmm, ok.. json has a "reserved" property for reserving counter(s) for
kernel usage.  We do use this on later gens.  Although it looks like
on a2xx there is only a single CP counter (which I'm guessing is the
one the kernel needs)

> >
> > BR,
> > -R
> >
> > [*] there are some counter groups that had some slightly different
> > config programming, like separate clear/enable regs.. which I haven't
> > dealt with yet.  For a6xx+ this only matters for some counter groups
> > (VBIF/GBIF, maybe GMU?) that userspace doesn't care as much about.
> > Idk if that was true for the earlier gens.  Eventually I'll add a6xx+
> > support for these counters, but there are a few other things to deal
> > with first.
> >
> > > > Is it really adding value
> > > > over nvtop?
>
> And I skipped this question. Yes, there is a value, when developing /
> performing early testing. Running tail is much easier than having an
> extra tool in the initramfs (we don't have nvtop recipe in the OE, maybe
> that should be changed).

could you monitor freq from devfreq or some clk related debugfs?

And yeah, getting nvtop in OE sounds like a good idea.

BR,
-R

> --
> With best wishes
> Dmitry

