Return-Path: <linux-arm-msm+bounces-110981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2qKYLXYxIGqhyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:51:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 113EF638418
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:51:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EyyhwZTb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AJvy+Ubv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110981-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110981-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40192306776C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C0F31B131;
	Wed,  3 Jun 2026 13:44:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FE7315785
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:44:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494242; cv=none; b=TBfhK6DAZGWQzwCvCIRr/My1iD4r1OVJJ0S4tfio3VDlVgN8OHgj1r5eZpNGEA/AfXasYTb4C5p0kl1fT0gzmQRvKaKEqK6FM3dE4iBlpLY29oH76qwlbZyiIbeL0sbF+sGgsMDU79kEyOzK7Nv7K4zFYf9gbzkQ/XSMPse5hNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494242; c=relaxed/simple;
	bh=a8BDW+CrunOYbTFlwKZkd/OyryCGgg8B9X++SYgSnD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jxt8fJz7XMpAFtliEVyoCVyuPsC2WR4NQKrzlaC21xumuDD8chLgIjqekTB0wjxn6B+3zjp9yd6+omB3jpHdyYi2qaG5Qmub1Wu833OVprdsw0Ga91v3zbciPvNpSBIVqP+tBYPUbUwDlEOG443Hm4QfO80J3H0qP2uG4RFJaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EyyhwZTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJvy+Ubv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vTJL2368077
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRbnU8V6Zsc+nav/FJky6GGhRnGxbQyRHCJCHQ8YEm0=; b=EyyhwZTbQfhFDZMd
	7/4fMwTCUpSRhTNsWsHAyx8UwJfcKZIMQ4/sbAEpnkbOlhoUJvKrU3m/nGKyn5mG
	rSnp6b+aFYgaLyXIQZsfy0p73XLEmKHqgQJVSe4CNf1IL2ZH2BZfT0VZdw8yAQ2u
	2qe4dGi/2pzYRIsbCkw8p8gWxLJAdlIz7PRyqJEzN0XIkosS0/k7uTzC1HrNn3ki
	vBV3JDExkb/BOU8kc6q1ZmOJ5OVpYxY1AwVdbUrQku1ZO2MkOmndJD73lqU/QRtM
	fxQuxERcwTum1w1uAJbJ2maUN57342AI6ICT5qZzpKAuV0frf2oeH8Hu15aw2X93
	IiT8vQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3ggtrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:44:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963c12f125aso4513507241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780494239; x=1781099039; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kRbnU8V6Zsc+nav/FJky6GGhRnGxbQyRHCJCHQ8YEm0=;
        b=AJvy+Ubv+cWNPgV8Z23mF3BFrwrE0CmZByFKNzbRhRAeyRbqVuNqkDDL9Bczg94JbX
         wN4yuj5WlddxLl7qC/cUhZtBRXfy6cgatgCRtBRMrFZ/lkQLUHpIVWDqXIX4GFvmA9cg
         xUsMwHa2llbccB6VJCjGNdFGPSowtA18cYII5VFMP7I18Hl5Zckp4yasXHz7sMOADOom
         a2TB1CF+KctCaoynMI7GyWbJYnW/kHeIdDyme0gHGzMen18SSyWaqwdeEnsh6TTd3l4G
         uodgyMzbttMeh0HRe7cAJbjR/cFLk1c3ijuvsg7hI7QQWi3TVO0IcBpkdd2lX1rwuWNr
         Ru+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494239; x=1781099039;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRbnU8V6Zsc+nav/FJky6GGhRnGxbQyRHCJCHQ8YEm0=;
        b=EMLLL5BanfemPRHUcmCrupmvZ8vnHmdU9G/jRP2vldYXMOyE436a0/JWCOxHOjHJvV
         MJ8MTaWvwyA5TygvCwYizfWxEd2wFrRDIDCs+CiEk+iyy2l5kiYMKEKH5SLjYPCt0ZLL
         eDUNcY2rifHel42SA4LMKsRVOMdafwy3bY0QzzKsDPKVf8yxZcCaCB1mSoo1/IM2MMDP
         0YVGCSpHnkf6bEdfWQNgeM/eLYJeXfdH5MwBT9u0apQmgYTKdhb9KqabN8WRx3UDRuRO
         n+wtwll1/PC9NNtoXlIur0TAWP7PwZICxWHhLZTMcESMt2HS6hOEU6hV6zhdwB3HG+s9
         SiRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4ozn1vYTZF5rlA/1fCxv8V1emsnVXtla+KbG6+hWHBFUatL2Wudw6wGn5Ie9GQQS1k046W/vhkDa5tqlt@vger.kernel.org
X-Gm-Message-State: AOJu0YxITdYPjHkYgldLjtuMaF9PkcuMyzfnGyV9lHfPeHcF8Aw7OwVn
	Yvv7mb+E/uA4vSqVV6rDND4ZXS7vnDz2VM1KHoCbdiNi6H66mF8Zhap02IPGffCAJd7w8X+yJ4C
	OIYHlrGzyjw2gL6ZTVgdelVSnn+bXqjSzyZfXK7H0MtRSER1jhH8YWObBlq+xrs523JN+
X-Gm-Gg: Acq92OGq160nVuLQViNSbIOMBym4rOYISKfkZ0FFAgG89DE48E6JWKniecSQF9JJStJ
	jk6ikjzWxzAxnWPqtOG0BDDJdf9JRNttA0/OjaUEaL3OTFy0paAmGTEGcyFg2GLiDUJ0mZu6Bhf
	QPlKgHdc4BXAMX8l63tueDbl+6GsgTFc/mlCA7wHj+XL+KLj5CvqyaSyirbC7fvzdXQRh/G/kG/
	7WoeHRvkjbyPxntGPY487JhJVLehoKRv0oRw7aeGIgztPpUgWYw1/b6eest35RASicm5VmQGuSb
	p4v6S4t7NTSvQkp1tZPwwUURShA95ZMeXG2CmxxqGoz/9Nat2lNG4APSlT9xO5Uz6AEqVIjE8WC
	6EWCV2JC/7f7jnbQkyl3lglE5H+c3bp1emIt/WR4+1pNnhwSbSi9TP3S+JZhPf4SQz3tpAHHfXK
	Y6IVl7+JdzICa3MQVCnw41x9NQ0JZsjlFqkhDZPcy7rk+77w==
X-Received: by 2002:a05:6102:dd0:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6ec469592aamr1534011137.21.1780494239370;
        Wed, 03 Jun 2026 06:43:59 -0700 (PDT)
X-Received: by 2002:a05:6102:dd0:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6ec469592aamr1533992137.21.1780494238918;
        Wed, 03 Jun 2026 06:43:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed56fsm9210311fa.37.2026.06.03.06.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:43:58 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:43:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
Message-ID: <2ztwmdejpkp3f3naz3g2fkjkpd6iomlb34bqnpnp6bhzn27vbb@wnd3fjcz6tgx>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-8-b2d984c297f8@oss.qualcomm.com>
 <m4zo2nkxtl5yeyo7riuata6r5saflmdgqf37cz2g2ezrwhk53m@mnad6bb7n3ik>
 <b5c9d149-1a48-4c0d-aa0d-9ad331896f47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5c9d149-1a48-4c0d-aa0d-9ad331896f47@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzMSBTYWx0ZWRfX4B8rsmJbpV52
 g8EwroWTpaVtVzzPoD28WiQ0PmGBvTPf3mFDf9W4YJv4zn2YM9jYYwPODLYT8FZOdP2S748W7rQ
 SrtqltbMbbhwiz7lak3iJuUquxQ++lGdfW4qWHFASNFkK+1T+wRkTcx5BnNtfxh5IT8PPfhOmtD
 0xyTyAze7l+02SMsjmfWkHSFt3QxIgWbmbGDL6mPvyvBr1uxOJx/WoGonnjcmDDG9J9351Fnq9W
 2QTt2HZmJVdvkxLGnWM4A2PGsZfAGwo2od6SsLmvVhhA6a/OGq6B1USVBxpBo+fCIxwabAc5HYF
 FpXfYK4K3JoDMC/WvgnzNjXqPrmD5ws01jSFDEG1LoMMygi0vYxLYthA0bxi3Iyt8+mZNMANasj
 Bju8kZY7N7zs1fKZlTULk9vipebwLQJ8iib8k0VuVStg5k6/l9DXycen6DnCDGm2xYzmvJzCCqP
 5APiv2xImVrpxx7HHxA==
X-Proofpoint-GUID: 4YURlc_rF6YuAXqlEG99WIn2e83IMPDL
X-Proofpoint-ORIG-GUID: 4YURlc_rF6YuAXqlEG99WIn2e83IMPDL
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a202fa0 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LflQWrLztFwobrB7iZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110981-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,wnd3fjcz6tgx:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 113EF638418

On Wed, Jun 03, 2026 at 11:21:43AM +0530, Ekansh Gupta wrote:
> On 20-05-2026 19:59, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 11:45:58AM +0530, Ekansh Gupta via B4 Relay wrote:
> >> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>
> >> Introduce the DRM_IOCTL_QDA_QUERY IOCTL, which allows user-space to
> >> identify which DSP domain a given /dev/accel/accel* node represents
> >> (e.g. "cdsp", "adsp").
> >>
> >> include/uapi/drm/qda_accel.h
> >>   Defines the QDA IOCTL command numbers and the associated data
> >>   structures. The header follows the standard DRM UAPI conventions:
> >>   __u8/__u32 types, a C++ extern "C" guard, and GPL-2.0-only WITH
> >>   Linux-syscall-note licensing.
> >>
> >> drivers/accel/qda/qda_ioctl.c / qda_ioctl.h
> >>   Implements qda_ioctl_query(), which copies the DSP domain name
> >>   stored in qda_dev.dsp_name into the user-supplied drm_qda_query
> >>   buffer using strscpy().
> >>
> >> drivers/accel/qda/qda_drv.c
> >>   Registers the qda_ioctls[] table with the drm_driver so that the
> >>   DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
> >>
> >> Assisted-by: Claude:claude-4-6-sonnet
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/qda/Makefile    |  1 +
> >>  drivers/accel/qda/qda_drv.c   |  8 +++++++
> >>  drivers/accel/qda/qda_ioctl.c | 26 +++++++++++++++++++++++
> >>  drivers/accel/qda/qda_ioctl.h | 13 ++++++++++++
> >>  include/uapi/drm/qda_accel.h  | 49 +++++++++++++++++++++++++++++++++++++++++++
> >>  5 files changed, 97 insertions(+)
> >>
> >> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> >> index 701fad5ffb50..b658dad35fee 100644
> >> --- a/drivers/accel/qda/Makefile
> >> +++ b/drivers/accel/qda/Makefile
> >> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
> >>  qda-y := \
> >>  	qda_cb.o \
> >>  	qda_drv.o \
> >> +	qda_ioctl.o \
> >>  	qda_memory_manager.o \
> >>  	qda_rpmsg.o
> >>  
> >> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> >> index 0ad5d9873d7e..becd831d10be 100644
> >> --- a/drivers/accel/qda/qda_drv.c
> >> +++ b/drivers/accel/qda/qda_drv.c
> >> @@ -8,8 +8,10 @@
> >>  #include <drm/drm_gem.h>
> >>  #include <drm/drm_ioctl.h>
> >>  #include <drm/drm_print.h>
> >> +#include <drm/qda_accel.h>
> >>  
> >>  #include "qda_drv.h"
> >> +#include "qda_ioctl.h"
> >>  #include "qda_rpmsg.h"
> >>  
> >>  static int qda_open(struct drm_device *dev, struct drm_file *file)
> >> @@ -36,11 +38,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
> >>  
> >>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
> >>  
> >> +static const struct drm_ioctl_desc qda_ioctls[] = {
> >> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
> >> +};
> >> +
> >>  static const struct drm_driver qda_drm_driver = {
> >>  	.driver_features = DRIVER_COMPUTE_ACCEL,
> >>  	.fops = &qda_accel_fops,
> >>  	.open = qda_open,
> >>  	.postclose = qda_postclose,
> >> +	.ioctls = qda_ioctls,
> >> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
> >>  	.name = QDA_DRIVER_NAME,
> >>  	.desc = "Qualcomm DSP Accelerator Driver",
> >>  };
> >> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> >> new file mode 100644
> >> index 000000000000..761d3567c33f
> >> --- /dev/null
> >> +++ b/drivers/accel/qda/qda_ioctl.c
> >> @@ -0,0 +1,26 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> +#include <drm/drm_ioctl.h>
> >> +#include <drm/qda_accel.h>
> >> +#include "qda_drv.h"
> >> +#include "qda_ioctl.h"
> >> +
> >> +/**
> >> + * qda_ioctl_query() - Query DSP device information
> >> + * @dev: DRM device structure
> >> + * @data: User-space data (struct drm_qda_query)
> >> + * @file_priv: DRM file private data
> >> + *
> >> + * Return: 0 on success, negative error code on failure
> >> + */
> >> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
> >> +{
> >> +	struct drm_qda_query *args = data;
> >> +	struct qda_dev *qdev;
> >> +
> >> +	qdev = qda_dev_from_drm(dev);
> >> +
> >> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
> >> +
> >> +	return 0;
> >> +}
> >> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
> >> new file mode 100644
> >> index 000000000000..b8fd536a111f
> >> --- /dev/null
> >> +++ b/drivers/accel/qda/qda_ioctl.h
> >> @@ -0,0 +1,13 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#ifndef __QDA_IOCTL_H__
> >> +#define __QDA_IOCTL_H__
> >> +
> >> +#include "qda_drv.h"
> >> +
> >> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
> >> +
> >> +#endif /* __QDA_IOCTL_H__ */
> >> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
> >> new file mode 100644
> >> index 000000000000..1971a4263065
> >> --- /dev/null
> >> +++ b/include/uapi/drm/qda_accel.h
> >> @@ -0,0 +1,49 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#ifndef __QDA_ACCEL_H__
> >> +#define __QDA_ACCEL_H__
> >> +
> >> +#include "drm.h"
> >> +
> >> +#if defined(__cplusplus)
> >> +extern "C" {
> >> +#endif
> >> +
> >> +/*
> >> + * QDA IOCTL command numbers
> >> + *
> >> + * These define the command numbers for QDA-specific IOCTLs.
> >> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
> >> + */
> >> +#define DRM_QDA_QUERY		0x00
> >> +
> >> +/*
> >> + * QDA IOCTL definitions
> >> + *
> >> + * These macros define the actual IOCTL numbers used by userspace applications.
> >> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
> >> + * data structure and direction (read/write) for each IOCTL.
> >> + */
> >> +#define DRM_IOCTL_QDA_QUERY		DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
> >> +					 struct drm_qda_query)
> >> +
> >> +/**
> >> + * struct drm_qda_query - Device information query structure
> >> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
> >> + *
> >> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
> >> + * allowing userspace to identify which DSP a device node represents. The
> >> + * kernel provides the DSP name directly as a null-terminated string.
> >> + */
> >> +struct drm_qda_query {
> >> +	__u8 dsp_name[16];
> > 
> > Are you sure that you want to query only the name? No extra options, no
> > attributes, no hardware capabilities?
> There are plans to extend this ioctl to support DSP capabilities and few
> other query options, but as per my understanding, I don't need to add
> reserved IOCTLs in drm case and I can extend it in future. Please
> correct me if my understanding is wrong and I should add reserved fields.
> 
> Copying the statement from the doc[1].
> "Note that drm_ioctl() automatically zero-extends structures, hence make
> sure you can add more stuff at the end, i.e. don’t put a variable sized
> array there."

I'd rather have a query type as an input here, to be able to return one
of querried params.

> 
> [1]
> https://www.kernel.org/doc/html/v7.0/gpu/drm-uapi.html#ioctl-support-on-device-nodes>
> 
> >> +};
> >> +
> >> +#if defined(__cplusplus)
> >> +}
> >> +#endif
> >> +
> >> +#endif /* __QDA_ACCEL_H__ */
> >>
> >> -- 
> >> 2.34.1
> >>
> >>
> > 
> 

-- 
With best wishes
Dmitry

