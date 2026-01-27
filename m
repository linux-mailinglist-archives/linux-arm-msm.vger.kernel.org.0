Return-Path: <linux-arm-msm+bounces-90787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPdXLknMeGmNtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:31:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1E295BB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9174B302D08C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A667359F8F;
	Tue, 27 Jan 2026 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7eUaL8F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9XqfoY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB883587A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523964; cv=none; b=OmNGetS5pfrCBDgqWDi9jlAJCnNUnC6qXAvKDr9x8NnbzjLEMo0otJ8OpeikQTURytconOPQphX8VTk/zNukc9Sb3rE2obybwTvOca9vluErsDAyTfLZMzqdLUiwAn8UJOmv6QQzyzYJBMLQKYGKemDwfAykCLFsGXqaB/oTzBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523964; c=relaxed/simple;
	bh=Rj6r3LFeX7UEeteYTUs51v5jgZPlRg02IraZry9nF6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFF311rmhxvUia6GEvdVvk4f9o+DPPfAFIOeYF9jSgy9enhuoxaY3xe5PlVE5SQY/cPUUp9qK9xWzsk6l89tumFnslQJFggT1vpZYty7kuxeIijB+3xIUgiJKCKqieXQskCMLA7+BJerrRBVqq5isXjnNGDaYpD+MEM4UTPJx5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7eUaL8F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9XqfoY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RD9TYY113343
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LeBGXuVPBeSkZrySiP9d01PK
	e2NSJk5/OBYu735H4lg=; b=D7eUaL8F/NQC5dIugNwP0PYoJJ8XMLVA/hWsVtxI
	TzAG0cBfSO/OEVWj3LXovywqEr0h5KcKGsN1gbRNggn55uj5TJDlj0P5rz3fxiR5
	uQTSTvRKsWKqq+4Cy0kPTyOMgUonpOpduLhMhALGfpBU071fhmEWYSFjNYvI+wJF
	Qw+GJ64tAdNnxMco95gcqFEP8Cr1Tr4YCjwDaX9mFimeBof8Mz2WvS/HCLCk+o5V
	NNWFIh0XXSbz7xwg/dg13RYXOfzzxDzHQr+sGFOaI8oTYjsA8wPvpEwmb+ChduZp
	Y0HvDtg61ADlLO1qUzsxlcZnVGspsBhvv/VrlZEvFhPK1w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e1cj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:26:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5f53b7f1341so5283319137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769523961; x=1770128761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LeBGXuVPBeSkZrySiP9d01PKe2NSJk5/OBYu735H4lg=;
        b=D9XqfoY2AwDMwBjE/8efOEpVULYDPNJ+QL/TaOBEuPCfML6ow0Asq/GF0PaTkoi83V
         ooohrbFn/Wje8YTnPFtBHT9+U8JE34ghBRLXf59GAnWbRpyMQPlJxjA4HKY+8pbAJJEx
         A2shmIf3oRsHCS1p6iplJ2nztOqQ7BtzntNuqT2sl84d9zHbT9aZazMAuatE3UX08RZi
         ZEGKwJZ8fzBNbnQCpq5WgFlTEdHZJzPsW/bCcpF4JZ5y4/sZJe51l35XL5AOJLwR7QP+
         D2b3BsivqccqfvK2ViH7n4DF2WfXe9xIPGE0tTEjNFODsN84dNfixwp55ADoLbjz1tKg
         gYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769523961; x=1770128761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeBGXuVPBeSkZrySiP9d01PKe2NSJk5/OBYu735H4lg=;
        b=fjqquWR4bp21fRZGnkuhVrOO7A/2OpxzgzNPtATVRxlJ1RPY/PaB2eHNyzFrSDIaA0
         qAlLu3PRDPqMWTWPUeQmubElGJpeiKdLYrk7N6Fo+6NSo1XfxS/AiBNzPe5GEulDzHB8
         Q0ItfnUQLe4HNXLBYHJQpasQ+THHxLTFyPqo/Xru7s30IJTA9jHQLndg3725y6bhAyn3
         T6+AAFrRtIt109YfcoT9tTEWYQWFwZpxYERnPhq2I6mmww5JZ2vXYhtTg9IPNxBDifER
         jHYTfUWpQ92QJYl9H7Ghbbz4CzDOo5xlK6hqDGnGNXXSczv09wUt0FasP795syZNcORB
         IeDg==
X-Forwarded-Encrypted: i=1; AJvYcCWXTrZFaMmFal/fQwv8k3CQmIXZ/4cBa9TJiiCmf+SLMWwMxifD5zrxA0LAD7njkRhPjSylaXRlaEnnx6Yv@vger.kernel.org
X-Gm-Message-State: AOJu0YyW0ockhld9fHCn7anFIJ9QXypj2SxaMGoSl7XgV7uOkXCdkgJe
	XTKY4VnpiermdAJe31V9fhA1567mLyEwHugPtERjpQOI+L/Nz33uh/645uvJbWsFx/5Syth6IUB
	1HWppwnlsFEN0JXB1yf2Q8wkMSigwnoG3C8XUID4G54pvZNVDVs3ljAO8fOgdZqOEUAEX
X-Gm-Gg: AZuq6aIqsulYPGWpTA8RWiHnFy70aJ5MqFVLvShKaauFOLKIlFhuOjqNXe7ntQ/H3+s
	FUb1sDRQHD5FsD2+JC1+FZDOrMqxsumpvl7NfnP1KRgWIH484U8bx9KNVWa2DBnHKrNiXkuVfWc
	dqHfnKwimaKeO2CvhEFvFXgFKc3kCkQ2iDjtFUwP0BOKStSceldUrAMYRbtFPTyujIK4Kfbfyz8
	gIkJVkMlNXJOF3GqMB1Ni+YikyTgTW2uvjCVuPahLMpgp6+NlWhUPpgiTBhdL9gnD1W41AzUTXG
	zQzlU43i5yx7wO+Ux7CNjRq+G34HTRlTQjW/EFlUKbpArSsX+GFolnSchPkIHty54Fw5U+SavH+
	rCDeqIee9Fm+FEzpGbrPDw+z3mFHmvVTtxIDC8QANGYUtAlFjv/F7PaGnXNLslyOH0GZq6BRYav
	pzm3eBc96KxjGRfdgCKkdwTAs=
X-Received: by 2002:a05:6102:4610:b0:5f7:24db:fdb8 with SMTP id ada2fe7eead31-5f724dc08c8mr478861137.25.1769523961039;
        Tue, 27 Jan 2026 06:26:01 -0800 (PST)
X-Received: by 2002:a05:6102:4610:b0:5f7:24db:fdb8 with SMTP id ada2fe7eead31-5f724dc08c8mr478854137.25.1769523960506;
        Tue, 27 Jan 2026 06:26:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918965sm3637789e87.55.2026.01.27.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:25:59 -0800 (PST)
Date: Tue, 27 Jan 2026 16:25:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/7] drm/ci: uprev IGT
Message-ID: <5vxrhiilcsaull2airasmc3pjqazvswrtojozz264i5vk3m6zl@pgkdwq46p4ho>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
 <20260127104406.200505-7-vignesh.raman@collabora.com>
 <zi7frtnecrzyei4fl4nmwmth3icnsyycxxobbrcwovbqfsfq4z@eh25dyfrjkqz>
 <9949e82b-6ec2-4975-939b-d6a709ecf43f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9949e82b-6ec2-4975-939b-d6a709ecf43f@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExOCBTYWx0ZWRfXwO1zjpY8x0mH
 wixG2T1eDaOH2yU3/fy9Oqqm5V5RkMZGP958Vrr+dLKcyUhI56gJudhjI8dqsoI0zclbkvhmEXT
 Yxy1XohOau+tA20e12sxk+JQPqAwlZgTrTQeEhl4DlL8n7ZFKfP+Cp9pjXNf0djFednpg6WHnRV
 8BPbIZKrpYhSeE6WHz4z5e9ZFpHYdPeCBPxhZl1/MfNV2zt/zvSAm6u9V0YemPh4o83UZsOI9cP
 RqJEfMPHfnptrw+jpgB1awsU72HYUJjvcQzba7QUGaILsoKrpaDsp2I3bNnZqoCJv4J+qPjr0K3
 kXpBnDPLEawPgJdSoV1Bbbq8nh0WGCyVGzty0Hs9h9euEPBpMB44IBHTd8/ELllWL9L+n/yeKmO
 AkLhryNajxt6cHMQLcJTIzXkj2YkUxvxrAnt1Syhvrx1KkrkvJPyCg1txSoDBKNzwtMJPVjqEMV
 Xbl62h2pi11yQtHW5Lw==
X-Proofpoint-ORIG-GUID: ogr_ScHNXE7k1Dvv-u_zAHfCXgcOHf6Z
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=6978cafa cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=ocmXNzLk5YWpj9Dh6n0A:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: ogr_ScHNXE7k1Dvv-u_zAHfCXgcOHf6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,gitlab.freedesktop.org:server fail,oss.qualcomm.com:server fail,sea.lore.kernel.org:server fail,collabora.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-90787-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B1E295BB3
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 06:26:11PM +0530, Vignesh Raman wrote:
> Hi Dmitry,
> 
> On 27/01/26 18:01, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 04:14:01PM +0530, Vignesh Raman wrote:
> > > Recent IGT [1] seems to be broken on MSM hardware, with many tests
> > > failing due to the old_primary->index != 0 assertion. Uprev IGT to
> > > the last known good revision where the tests pass, and update the
> > > expectation files accordingly.
> > > 
> > > [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/a909ab05
> > > 
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > It is not clear, which parts here are due to Mesa uprev (yes, there are
> > some of those) and which are due to the IGT uprev. Please split into two
> > commits and make sure that Mesa-uprev passes more or less clearly.
> 
> The mesa uprev and the IGT uprev are already split into two separate
> commits. The IGT uprev only updates the IGT version in gitlab-ci.yml and
> xfails.

I think I was not clear enough: Mesa uprev also causes some of the
xfails. Those needs to be a part of the Mesa uprev commit.


-- 
With best wishes
Dmitry

