Return-Path: <linux-arm-msm+bounces-103725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ5ZJNn25WnjpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:50:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DA34290C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D520B301F157
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133663890E0;
	Mon, 20 Apr 2026 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W57WOtCe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blET/79u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9CD1ADFE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678612; cv=none; b=AwWtHuiJ4TQC5NFRV4CAgf+7cKis+Djf04LgV288hIyIO0NYftL0v1mPsHFV1LchprZGmAtRIyX859tdbYdsYUZYYlEmuEAwoMILBLforU3b0XbL6ZFzjaRW9r4IKVcyJ97Atx3nEJC7xyfTvFrPRGbI4IXdVr25SxmKseeKW5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678612; c=relaxed/simple;
	bh=yZFGhIJXNf3NCzqTTRRPrn9H6W9B1lThqruZXSrzpBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8twk7KFxe81D873gCsmSpME4z4BAagutheN79SKLTn5wIVFHPjnqRUEQ1Qvr0Vh6d2vddSZNfPiFFAuJhom4XbbFTvioP2sININEfrdIKqL39qxSsKGXWE4EVoHtWXS4iuXJyM/gNoAoBtJLKVw5ErTF2SILd0DBgkj520vzfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W57WOtCe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blET/79u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K988N91601031
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kWuPigQBRvg2mmG1YEkZ2x38
	8ocHV9caZV1E1+5l688=; b=W57WOtCeOcicX3eqOdiyb3EDavkLG5irwHoXW55M
	wmRlpJepFltE0GBwDB/eEZBvMRLgtu+23T/xt1DZn4WHzXcrKRfoVPgQut1CClJX
	VOYHOXibM3WI5SZiwdhnS4DizoNnKO4tGaZ4JSDZcp8Th2Dask97hw6Z7ZhAr1cP
	aMwPD+EXq8OVfnwV4UiLLWKNWccIeCI0Dub5H2t9t3AcazG6saJukNtykdqRYJkj
	D4s0lFeY98n8l5NcyXmUp7ALuyhcmg4wVEJt2Z//32LLZZj1qsrLH43JCZX/QjPe
	A2yRQiUlXqP2y/JQ0XNndxovMBtB55L3BZJYG3/1Jqd95A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh898516-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:50:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so38091971cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776678609; x=1777283409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kWuPigQBRvg2mmG1YEkZ2x388ocHV9caZV1E1+5l688=;
        b=blET/79utsNvRAT4DWDqagz48h06kO0w4+Cg0brBcj2NF2iu9TWo7pjdvxqQLKczeV
         xsMo/yg5FKf0Z9Ik0vmXUurG4ORia7FY3lqnu0gl8O1YhHNlWF1TA973v+n6xj2vjSQ1
         DEkSGMZicQ9A7g5kWpf82KWcGCbvT/SQX/ZKDgpO8Qr2qD9f372mi0eDBTE+Vok5G3OB
         0+sAJFmw1o7Bfxj5KKJxQP8JtROhHwGk8QyVHdFIfv3Gsip0/ASA/4ogEtBMUUVW1oxo
         hZWUirw7DyIl/qCEuzZpl1aMwoj4QKO/Bwx9ELoymyg+yCiLFfdxmYjJ4sbKJpLsAgZS
         E0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678609; x=1777283409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWuPigQBRvg2mmG1YEkZ2x388ocHV9caZV1E1+5l688=;
        b=Xp49tKwy9/BiuPyCRS55gzbDSHCsC25VflgPDQh0Dz/avH4VdYjV20XnI9SqCeObYq
         H8L52cN8gkdlJ1ati1ZnzR5dPSV7b+FrO4Vv2vTkKOg644J+WsGjO/NVFGYD2BNDKhrH
         CfzF6GAWSZOYgrOQyV7BREhWxdZ55crSp2bRRlEcbM5iELiRG+JpdD4cFHCfQslls3l+
         ymvqPuioIKOx3+o0RMBfcDqbIvbtlfErZM/mAI0SEMDDoYWQT+I9bBdH5v3VRJ4ssYEI
         2R9b+MGxA8BOkwLvtzSNEwK2cButUI/1da1MCR16YfgiryX49GTEWZh0zIJg57Ipv0AM
         AL3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8f6guNELG5XrSM6C9tatCepUIo93flSg+ZZ5rtkrNudxYE3/PTQTnaQ3AddIbvR2eVsHMou71OKSKt2c+p@vger.kernel.org
X-Gm-Message-State: AOJu0YxraSYRe9068zcHqIIHoTCwpjbruh41B0Y8wkuEcJUDAD/EnmDF
	+gqtF8TWHciRH4i/FaqW2WbJK5DSiiTQCcvgad0wIsr5BQKrOdpZeR+B/psbv5zEsWvgbrLkXTP
	SYzKCKHT4KI/FKduo9E8dwtsqFcy8hLebsCu/oyFhbkp5bfZvuQGXmzuUzKjMo4GXxk9T
X-Gm-Gg: AeBDieuPwHBNlrOnkCDUcK9zEKDw2Bn9PaCaBtuNvz6mOlwJuRNpMHeSwr152I/llqB
	MsNK7Zp8aFAOQHDuKEaB1f4YnzDmL9O3bFd2qNjfbDqdrESaaMWmfxLqHqJA3soyWpnZLQb/fVb
	mBkratYCD5Xgdx4/vmWzjttE5q24OZLzGKnVTgl6ETCjLfb+Lh4DoyvchczBXJgwKKkEHaWo/FR
	kQFo69a8qJKh1WFzyh42UlIL2EWszy7OwB3ZuHjIbsiZy9ej46/BUWIS42iLrHLURyZrK9ta6Sd
	J7//RymgK3gK9C65ybzuL8VzdRKqMne/CvTZQlYXVu8HRdZ2qIjDreNU/O8EuprRVoEFLm5DQ44
	ijHpZtgcJrzlsl3PAKrv5HABX4OPIvQBcHengn8G65rJoZkhXDMAJ42/0c4YF0iFEKz+XM3EYXy
	nmr7nmLQvn7v7NJXw1wrYfDqdzao1Xg5Yot1yjhRM6TqBk2g==
X-Received: by 2002:ac8:7f15:0:b0:50e:5f37:a821 with SMTP id d75a77b69052e-50e5f37af22mr37013091cf.36.1776678608864;
        Mon, 20 Apr 2026 02:50:08 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:50e:5f37:a821 with SMTP id d75a77b69052e-50e5f37af22mr37012641cf.36.1776678608356;
        Mon, 20 Apr 2026 02:50:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad138sm2859553e87.9.2026.04.20.02.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:50:07 -0700 (PDT)
Date: Mon, 20 Apr 2026 12:50:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <3vrqk67oivkgo26xdc3r774rvj3jn3t6sfydhlytyrfiftubhg@cipain7xxcjz>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
 <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
 <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
 <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NCBTYWx0ZWRfXxQLi/hRdADFW
 K+KssIasUyoPfsYLb9VgtkU2YpDT2bitjV2s1to8gVrZgaU92WWM0G0XGHRs0M2C8wvyUal1FEW
 Q+s7F6ZgroLIbEohCTud0//T9l0mcl+vWTn05MV0R8zSDI3tC5N1hjvFBFFMqGORPCNnIjbZ8BV
 qqF103wkMuVYoN+7HiXd+t4r4N/LvO9Yhh2xBG/C61KwCBocB0mnfrD9ezXfx3hm9LnrNYMJyf9
 NHreseSkKIU644AkckpaAR8nvVLWAlJQWYZQW8y4PQPz9RiQlGuPbQDzrXpwW7LsZXQuOYIxMAr
 O7rkEmv0TGq/azHVIkt/9+STBy5K4AeDJDk/kvVHfUWFYZ4VHSDWYfPoebDSzOlgpWSl8IWGioz
 vtLMmxWK2NVuuDvchMKfOOzrQgiJqVgaG9tW1XYnG+mosAaTUW6xZQjjmu7JOTbLch+7o5TdXpv
 DDelUKWpOTno/2/sEhA==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e5f6d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VVbN_I7Xu8gywQYyaxkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: d0kH9cDt6QxtGPgnz033tICqqk4HQn3h
X-Proofpoint-GUID: d0kH9cDt6QxtGPgnz033tICqqk4HQn3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200094
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103725-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.infradead.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05DA34290C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 07:50:46AM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 18/04/2026 01:32, Dmitry Baryshkov wrote:
> > On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 16/04/2026 02:22, Dmitry Baryshkov wrote:
> > > > The DisplayPort standard defines a special kind of events called IRQ.
> > > > These events are used to notify DP Source about the events on the Sink
> > > > side. It is extremely important for DP MST handling, where the MST
> > > > events are reported through this IRQ.
> > > > 
> > > > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > > > events are ported through the bits in the AltMode VDOs.
> > > > 
> > > > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > > > events to the DisplayPort Sink drivers.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >    drivers/gpu/drm/drm_connector.c          |  4 +++-
> > > >    drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
> > > >    include/drm/drm_connector.h              |  3 ++-
> > > >    3 files changed, 13 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > index 47dc53c4a738..5fdacbd84bd7 100644
> > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > >     * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > > >     * @connector_fwnode: fwnode_handle to report the event on
> > > >     * @status: hot plug detect logical state
> > > > + * @irq_hpd: HPD pulse detected
> > > >     *
> > > >     * On some hardware a hotplug event notification may come from outside the display
> > > >     * driver / device. An example of this is some USB Type-C setups where the hardware
> > > > @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > >     * a drm_connector reference through calling drm_connector_find_by_fwnode().
> > > >     */
> > > >    void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > > > -				     enum drm_connector_status status)
> > > > +				     enum drm_connector_status status,
> > > > +				     bool irq_hpd)
> > > I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
> > > with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
> > > 
> > > Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
> > > If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
> > > 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
> > > for both short and long ones (although in the kernel doc you just write "HPD
> > > pulse")... The kernel doc could be expanded a bit to make it clear what this
> > > flag indicates.
> > 
> > I attempted to stay away from defining a DP-specific flag, keeping it
> > generic enough. HDMI is pretty close (IMO) to requiring separate flag in
> 
> If it's not specifically the DP IRQ HPD, then we need to define what it
> means. I tried to think what it would mean with HDMI, but I didn't come up
> with anything.

I might be mistaken, but I had someting like HEAC HPD / EDID status
changes in mind (or HDCP-triggered HPD status changes). But here I
admit, I hadn't checked if it is actually applicable or not.

Anyway, for e.g. DVI or VGA that means nothing. But, my point really is
to abstain from defining someting as DP-only in the top-level API.

> 
> > Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
> > in the VDO rather than a pulse.
> > 
> > Anyway, if irq_hpd doesn't sound precise enough, what about "bool
> > extra_irq"? This would convey that this is the extra hpd-related IRQ,
> > but it would also be obvious that it's not related to the HPD pin
> > itself.
> We'd still need to define what exactly it means. I think it might be better
> to just define it as the DP IRQ HPD, as then the meaning is clear.
> 
> Also, would an enum flags parameter be better than a bool parameter?

Maybe not enum, but u32 param. Then it can become:

@extra_status: additional type-specific information provided by the sink
without changing the HPD state

void drm_connector_oob_hotplug_event(..., u32 extra_status);

/* DP short HPD pulse or corresponding AltMode flag */
#define DRM_CONNECTOR_OOB_DP_IRQ_HPD BIT(0)
/* DP long HPD pulse, debounced XXX: do we need this? */
#define DRM_CONNECTOR_OOB_DP_REPLUG BIT(1)

For HDMI we might want to define:

/* HDMI 1.4b 8.5, HPD pulse */
#define DRM_CONNECTOR_OOB_HDMI_REPLUG BIT(0)

Or might not, 100ms is long enough for all debouncers.

For HDMI we potentially have another source of OOB events, CDC-messages
from CEC controller. I have not looked in the details of the HEAC 3.

-- 
With best wishes
Dmitry

