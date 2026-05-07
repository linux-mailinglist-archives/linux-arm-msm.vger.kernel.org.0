Return-Path: <linux-arm-msm+bounces-106460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KrWI0et/GkNSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:18:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 027134EAE43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A91E300EC9C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB0043DA3C;
	Thu,  7 May 2026 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TR5gwrTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zp0dhEVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA62D060C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167106; cv=pass; b=Ba9XRYS5o1+WPagspkus829DRNSsanBAJO1GMbIPzRcfhZ40SXUAd7yz8lzIBlVxOWKXEo6et7FGQPUhZXNLqXI4b8dibGj6RbM7iS76KNnkFx56GfqbjeHKKKRk5ZzUYI2QWvpOUHbnCo6tCKzCXkzlrf6PD36Hpc503f0Je5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167106; c=relaxed/simple;
	bh=auDUMuRyfN/cj1KdvcrFiCPeRsi8JlAAoEjgRQUWack=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHy/vl44sTzgujNy28EcCxjg0kxOZd/2yu7tLlJDsaDlp0EpTDuypOHckgd3TB2OA0OZTxImNNHO0blyjl6mN4IXotU/xvJ4vCIjgikepMtwsbm5INyES2ZtTWLQnQ5WjckTlO0eruhZ+D3JSAw0HkV/zCogZITpS2IjxNlAdxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TR5gwrTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zp0dhEVt; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BkZkP682839
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 15:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=auDUMuRyfN/cj1KdvcrFiCPeRsi8JlAAoEjgRQUWack=; b=TR
	5gwrTpW9iBTzyT/I9+2hDrKUU0mfax2DrSOuyzHxjgDo3aa7wqf/3Ei90nmkHyXV
	THoiYja3E1KH++YptQ1k6X1RFJmVPn4wwIAMw2ircLv4aErMZxLXYcPuN2lWzVca
	AhDZ56cQ3U5XKsWlipF1f2OU1V9Xp6HKNGZYfxExWvNUJsIQvRo4iQtuc1q7nulA
	4cNb8W6IDczTXQtxCW8Hnx42B4SPNwldclNzLKlgYDXbxs0UUijrcE1sgilcAnrN
	v5avALktFJO+RAlgwNYOghpJz8XQogtsWH8UmvFdVffIJH78Rvv2XYYO6SBjcIPd
	gAMDmjXETOWKRtUruyHA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhat7fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:18:24 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1309f4ee96dso2418149c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778167104; cv=none;
        d=google.com; s=arc-20240605;
        b=dFV1C3quFv99N0PPrum+rxtLIqVjJ5SP3NYk+5JMn2wllb4sfGYicbayO/sFoD5FN+
         YdiiecHgWi9KhR3diCeAdpo5FdKA8GiF6lcBQbEG6emAK0NMwX2ytMuyLxXHkhpHLZOE
         yieAtMAGvrJpGa1r7sXI1hccOZ8O+INdST72VlC8+dgODYmZ+zqy2bpBoxKPStenD7YT
         vbbqjUE+4PuP+UnidhsQiIzFhKPaONxXY1LLcxmeTThagzl+Th3XTLwpQg3fFZtGE6x3
         +nmgm6QRUdH9LEUKaKjdqZ7+g9DSBB/hH5fLM1Ve3rJElHdwff3pUL5xeUcKZDNe/JOz
         wc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=auDUMuRyfN/cj1KdvcrFiCPeRsi8JlAAoEjgRQUWack=;
        fh=s4NV8+lUEQekl3XUdMyWIjU1bCWPMZPO+zCQjF4Ix0c=;
        b=YShdZ8mq/9kFrJp0KCrUaki+QHY27n7Mj51BEd0kGHe6uFFh+nzPStUQ8OLcyVAHkh
         LHzcxmMliCL/B75XcRlgCPlElAJTpb2uGjzCfy1mKNW6e7hPpDcQGkUHgzxvH/atIdql
         kpNDqOooyAPhh4JvxecO0emYHiRrlRTt/N2uxg6gVEaqJLzyLK8WxI2Mj4ODvLSE290K
         Y++iVnNP+pdTIvcvhp9G0N12DNgWNQw+Xq+FUVaEf0YTLsPIBMCWlQnsdLUGc6brYnVj
         X1/wmwYTSSLAxW54/5s/CaB9vPrbSdNYt5gthdHq21FlHEBvxBsNSJlh0jLIbSSyPZX2
         FL9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167104; x=1778771904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=auDUMuRyfN/cj1KdvcrFiCPeRsi8JlAAoEjgRQUWack=;
        b=Zp0dhEVtIV63dd6okYU7rP4nRg2BLXsmfboLppGevTCix0Wl014igl4Qg9ASIJDeWz
         2vjJFnZEz39C/LZJN/J2Zf/IgAz2i4dtBD14UfyeJ7YOh1m+R+kndribGW7+RLh0IytT
         C0eUGlV03LqjilVG5igLIfEgSGUocn29mmUN6PiwK+lLbVYb6I4E8NOAV21FGPfpQLcv
         bog/MrgYgAYuIY2mU3VckPkOsH/v2jmupFBvY7chadDqNMXsIKVHKRenh6U6Il8EmYH2
         gD8jxt0f6E/UWiSCQWxxQVGN8Q5F8kGZijXzhxLqO1W05+EGJqZN//Ri8R+8bPVikkXX
         hHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167104; x=1778771904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=auDUMuRyfN/cj1KdvcrFiCPeRsi8JlAAoEjgRQUWack=;
        b=c2nVuSmICXEPS5IvlBcJD7Taow3SHTI0L0Zj7I/V4aVFQl931zkWlb/pG7osJm92Tb
         tb6LLTVz2ahTLWW65bBCGXFlsqfVWwvF8Euzad18TRSUhoV/YwO1FgLjSwbvlioxwPq0
         DlOIN7nhQsKombx+tb+fU+DG7ChPHLoerPEUs/KERCL3FgCTGFVR69zbIu0pEg5X5e+u
         3PCKrWecbeGdocCyMhjqt3qFbkZvhsRvmDLrX7GfEFO0bqOGZcmO8uEVWAOGCdioJFgj
         /MEpMz0fY2gQnLp1aOR/C9RSwK7ePbapemN9U4pGCq5oWppnr4tEVavYWPO4JzmEzV71
         /oHA==
X-Forwarded-Encrypted: i=1; AFNElJ8TEqGTHaW1UIwea2hcwEyFBw9BuFn7kj/9k1hUsTVzpuzOg4+yglcloVZRMkE454lDzprhCoHu+zjYCkTj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf2ExaUADAAs3AmguE06h1c41zNuoHXzXQ7rSYHDYyo29kdm0Z
	3lcmBZxnvhCikhMJFwmwC6dDdFtD/HOh2UyHiWteN7pmN/iDt9+JlcWSONfm76WpcLq4gw7Eexg
	oeujIkglx6ETEYb0rsYn5F9yZkppaeNXSDkIt1avK0/HWWg1jiPU+OrXu1ez8UiRZ2sFhEeaOO0
	6Scsn7iZZpzwbTNA9Xv0E5yYGYoxy9oPefy4BWya3fsrUoJoYYN/o=
X-Gm-Gg: AeBDieuoE1+kez5kmX0arDHnF+fq1X1GXZidENEaJuZ5D2mh/pHnJR6/oO53wrztDuc
	8pQnx4N+SVrSoVeOs+DEkSQJETTFUZyeyqCVLmkg1SQ5qzdDMw39l4wT5ksons7xVTXrloZp8HY
	NpTKnizn0CP3wJGLGIhdi7twoHg3WH+gdoRgAecaUd7gEESsu0iKd/ucxp0168f9IMVg3eaDy8c
	p4fT49LwPvoelJ77S5F7CNupMGNGmCCW9Cp9R257zY2BFGj
X-Received: by 2002:a05:7022:6184:b0:12d:c4cf:cd7 with SMTP id a92af1059eb24-131967d5328mr4459199c88.8.1778167103595;
        Thu, 07 May 2026 08:18:23 -0700 (PDT)
X-Received: by 2002:a05:7022:6184:b0:12d:c4cf:cd7 with SMTP id
 a92af1059eb24-131967d5328mr4459165c88.8.1778167103051; Thu, 07 May 2026
 08:18:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
 <20260506-panthor-shrinker-fixes-v1-1-e7721526de96@collabora.com>
 <afxi9ab1O9J_7J1Y@e142607> <20260507141027.166ab00d@fedora>
 <afykcyiURGZh0xdr@e142607> <20260507170343.044934a0@fedora>
In-Reply-To: <20260507170343.044934a0@fedora>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:18:11 -0700
X-Gm-Features: AVHnY4IZP4mKinqS_tOhHtXbsn7pn6oSMK1COKrIgdveZWhU3OUNJZSGy0duX7w
Message-ID: <CACSVV00_OjD_MLcpnqBo-4Q0iTQuR=QoU+s30+iLw=HeW3v8YQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panthor: Don't use the racy drm_gem_lru_remove() helper
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
        Steven Price <steven.price@arm.com>,
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
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1MyBTYWx0ZWRfX87tKKjITrHpf
 7+fb2LRmkOj1xkf1XcOTu90BbPAxbrDOCT0Pg/aRcaDPyWMc3ALNFyhKjcKqLKuNIB3n6DWEgm+
 DilLzXqXP4mHFdRsgfrkE+kPr69CVhkHiEd1UgmQ67OSXOgdTcnNjIGC81pjxCAB4zLP4NJxkjI
 uBBg39VkQYKtiP7TPxIvSOknOjKQKBBVWJ9wlhRGkakGFxwlVKr+c1Kp0rsJScwVM4UcQ6g2vCr
 tHaRLQRM1yQ6DvTDizll0vCEmzI6ZIr/5rtrDTNBj9ECb5Q2EW9rZovFG83Re4XqZPYId1tH9k4
 R0Fx8VygMgmaLTDA7UNk5TkQeO4Q7B2Ws21Ivr4s/our+Xd0dnTIva9wyV159XdOdf3T34UCy7/
 68mDcuOIkeGU7pF97Sgnfos/SMMR2kTELvI6L39rkd8L7yNi043/OMR/kt5oNOfSAPv7WcJdjFs
 vXyyFY2pbdE7zoyMkwA==
X-Proofpoint-ORIG-GUID: ajccVJ1hPxQnfKS1vVl3exKcT129qFz1
X-Proofpoint-GUID: ajccVJ1hPxQnfKS1vVl3exKcT129qFz1
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fcad40 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8 a=7CQSdrXTAAAA:8
 a=9BaP3OHj2w789GXPJEAA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070153
X-Rspamd-Queue-Id: 027134EAE43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106460-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,lists.freedesktop.org,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,collabora.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 8:03=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 7 May 2026 15:40:51 +0100
> Liviu Dudau <liviu.dudau@arm.com> wrote:
>
> > On Thu, May 07, 2026 at 02:10:27PM +0200, Boris Brezillon wrote:
> > > On Thu, 7 May 2026 11:01:25 +0100
> > > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > >
> > > > On Wed, May 06, 2026 at 02:16:26PM +0200, Boris Brezillon wrote:
> > > > > drm_gem_lru_remove() dereference stores drm_gem_object::lru in a =
local
> > > > > variable that's then dereferenced to acquire the LRU lock. Becaus=
e this
> > > > > assignment in done without the LRU lock held, it can race with
> > > > > drm_gem_lru_scan() where drm_gem_object::lru is temporarily assig=
ned
> > > > > a stack-allcated LRU that goes away when leaving the function. By
> > > > > the time we dereference this local lru variable, the object might=
 already
> > > > > be gone.
> > > > >
> > > > > It feels like drm_gem_lru_move_tail() was never meant to be used =
this
> > > > > way, because there's no easy way we can avoid this race unless we=
 defer
> > > > > the locking to the caller. Let's add an explicit LRU for unreclai=
mable
> > > > > BOs instead, and have all BOs added to this LRU at creation time.
> > > >
> > > > I would argue that drm_gem_lru_scan() is broken by design. If you'r=
e going
> > > > to release the LRU lock in the middle of a loop you can expect that=
 someone
> > > > will get hold of your stack-allocated LRU and end up picking the pi=
eces.
> > >
> > > I think it's fine as long as you always use the drm_gem_lru helpers t=
o
> > > manipulate the lru field, which is true of a lot of kernel constructs=
.
> >
> > I think drm_gem_lru_scan() should never set an object's lru field to st=
ill_in_lru.
> > It should set it to NULL when the object's node is removed from its lru=
 and add
> > it into still_in_lru without making the drm_gem_object->lru to point ba=
ck to it.
> > At the very end when we splice back the still_in_lru list back into lru=
's list we
> > can then update obj->lru.
>
> Then you run into another race between drm_gem_lru_scan() and
> drm_gem_object_release(), where the LRU removal in _release() is
> skipped because obj->lru is NULL, and all of a sudden, the still_in_lru
> list has an element that's freed. Honestly, I don't think obj->lru
> pointing to a stack allocated object is a problem as long as we don't
> let gem users play freely with obj->lru (which we shouldn't do anyway).

Holding a ref while we drop the lock should keep us out of
drm_gem_object_release()..

But yeah, we should probably just document this..

BR,
-R

> >
> > >
> > > > This patch is fine in itself by trying to avoid stepping into the f=
ight,
> > > > but I think we should also add a warning in drm_gem_lru_scan() for =
future
> > > > users to be aware of the dangers.
> > >
> > > Warning the user about what? There's nothing they can do about it, an=
d
> > > I don't even think it's unsafe per-se, unless someone goes off and
> > > stores the drm_gem_object::lru value somewhere else while their shrin=
k()
> > > callback is called, and accesses it later, outside the shrinker path.
> > > Given drm_gem_lru is not refcounted, there's no way one could safely
> > > hold on the LRU they saw in the shrink() callback anyway, so I don't
> > > think that's fair to blame the drm_gem_lru API for this kind of misus=
e.
> >
> > Yeah, that would be the warning: don't store the object's lru as you mi=
ght
> > get a temporary one that will become invalid after the shrinker has run=
.
>
> Oh, you mean a comment explaining this should be avoided, not an actual
> drm_warn(). Then yes, I think it's fine to document the expectations in
> the drm_gem_object::lru doc.

