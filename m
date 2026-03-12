Return-Path: <linux-arm-msm+bounces-97250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PT8D3/MsmlTPwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:23:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67782273459
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E79832026D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF3E369204;
	Thu, 12 Mar 2026 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BsbX8mbj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3/pckhy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4166D36607F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 14:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325134; cv=none; b=XtaSf76c8LboIR0FVbtW2B+aZCulLQOQhTS+/EGu88kPw5jaMVIr0T/ssn3ffkAU6bV39jqyhthkKycyHWXE4cbIskYm1WqJ5pWtE5Vl5fYuC4TwDf3N+uzudYx5VzvO/ZQ9E0TgBRT34PD0pMuR5cIbyI+uESarGNNrJMg4TOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325134; c=relaxed/simple;
	bh=AUoWfAgFnjyaPH53whCm4eNCzAskRw2i7X8UgjEdyss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KA6Rl4hHpFO2n0tfhRAd10PrjOe/fxHL4zVuIs4j+nefw5Z4RJQ9Hs5SH1vaFunKyq1ep8pR5abLZ3YaEdw04Hwa9kcAAkffdOMcObTQhqZteVSn8Ktr66WmgDh4aExgMi1ydqoayPLr5z/tBT4m3su6kNQXSdFgy0TyvGSbMjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsbX8mbj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3/pckhy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9w1W93666500
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 14:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YGdWM5WTQHjeLzQjeI6DXJnM
	O90fPpQqMGjM7wDfFeY=; b=BsbX8mbjQOQk+2Dh72pHcIGauyVPwNBcl2HAFfPs
	fAFOSCsIJlvq4wsNKScuDYunc4UKFgw31oX6ghXYVm8quqXqcfYnH7MxfT1HaR8Z
	TBVovPRLG7opnqMRVvwiJM7Xk7oXtxLH3m9YsTiZxgYfT23ttdgSZ1OLzGZAx/QW
	vdm44Xw94K6FdFkJBnHu41rzAmXP8oS+Pr1canwg9VD1KWu3UIZGhlCpLz/mr1E9
	05ylhz7Na6XrvdK491i7m4qUYjdC3LgC/lrfkgNAdXR9E5/Pd+LgX03/kVBTg1sV
	BdcwSlfgDSee6qA94AyCUchhEGcxvv4WD2cmGUZGs6o5GA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60jcfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 14:18:52 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56b18441394so14159947e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773325131; x=1773929931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YGdWM5WTQHjeLzQjeI6DXJnMO90fPpQqMGjM7wDfFeY=;
        b=N3/pckhyXB7geT1/lQaWrTBLA5NgyrTsFpqnsa044YVOVwSAoTKThLfnCzvKv/E/U7
         D1IQs+FV+irFUnNwwy5hYVW+8qyMLDqX0Lz4BUEvGKfsBKQLMcJEsUzqeTqruvHTNYNb
         WKIhRtgOB7urYIzVQukLYkYPVR6P5evqMHpdlnEFInvR6PUnQTzmsWc+/VrJlY4DkvIK
         dE1+Xvi9z0QHn+zFJpVAf1993Zu6KVTED8hudZNB4mbc1HngyqRnxrRD6hfd8YBQ3bMU
         5VYQLTYxoHZT/hbakV5NzovJ/Zxw6soYJmV/m68leS5V3QbjCO8I921GdyneY98/u6w2
         2aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325131; x=1773929931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGdWM5WTQHjeLzQjeI6DXJnMO90fPpQqMGjM7wDfFeY=;
        b=awfPVVeRvg6uQhFJVg/wXyBwCX8wIxraG7BSw1vWdiTEdRbnJSmXU6pZa5GCBN8Ztt
         8Joa1AlXYLfl4jfS1FVnAZM4ORp31SdpnIdFvTwfan+s2ukguM1gpRmEZmjRQqHjPWsY
         XI6pouIJfcadGP4CkbTCfaJA3PeFdcn/MHbqe4JT+we7k2/oOeKbWsKvGfO3GtBEH1/7
         aU3bYa2ZsI3agembj3B8gsJ6OqqFfQjwmIJTL/lsPbshitlF5iQvLDagwPreL5NbarQl
         EA3p2U9VHHkvpnOH8Yi6qF/1BotNJeun18Obnp1iIY1v5ps2IzwsyT+hTqMqIS8LLDG7
         dM4w==
X-Forwarded-Encrypted: i=1; AJvYcCUXLG6fqwr+FfdBdIESXtyUQmwvBu+zG7h5hZOxKQUPGZgtSuIUYJVFvrBLaZdcCtgkCxRSJAnlj4FraRlM@vger.kernel.org
X-Gm-Message-State: AOJu0YxErVVrvWIUwYNQE299u4829jijHb1HZHQLk0Zn1BVT6Qn4xrMk
	vS5syxYVaTTkEmEKBVizqrWUGDrkVIxR0IVJyy9+Qq1LrNUIJDMLqHSVNPdnzPKpfupNFe/Q9Ka
	ONnsz0x2hjS6VPOcP3IP5vc+LYCUxtf6+0nukm/yrGOlh3o1LQ3eXk5fPLvPbWnAw+Njs
X-Gm-Gg: ATEYQzy6AkAaFIjYRGqFJDAy9k2tv7wpGT4K9F44fSYygN5XZG7JMDwxjvtoDUj3ErX
	olCD6PHK9/eSI95+6R44cdKS64pX1XwF3MQjw5+xbJ5D74R4S5GfEPSnVmMI7E4ry5WcCHIfybx
	H7MFbidTCVHUnlxE1Bcw1Xtgz/ZHQKKJh7vEmLd1/LIL0whJsMKz9M4MfXqPUFsAmy+hJe5ETdW
	NIPEtkErvu7IG9jLedmSNsu74fxU5B3hv9lDRFGgqJfEascJg/mxsRAj4EG7xroYPwSfYuwNX1A
	49Et09/Gq2sfjC+pTXa+c4SvEQmROdLu4lPRFYjxNUihR0LqmyXVW1DmFGIAIKj0BW2Zus+zSrO
	2xIG8NVsJB8PI5+d0p1Mz3uJF/4m6OD4KhvPKAjzWMZ66fl94xcUp8KyXDXEi8WgczGGkwlgcXe
	FxqwRKhXGFWbYkG8pKoNSY8wsSOMmcvXLsKdc=
X-Received: by 2002:a05:6122:614f:b0:56a:8e00:5e17 with SMTP id 71dfb90a1353d-56b4747b2dbmr2662403e0c.6.1773325131382;
        Thu, 12 Mar 2026 07:18:51 -0700 (PDT)
X-Received: by 2002:a05:6122:614f:b0:56a:8e00:5e17 with SMTP id 71dfb90a1353d-56b4747b2dbmr2662373e0c.6.1773325130945;
        Thu, 12 Mar 2026 07:18:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635829esm982007e87.66.2026.03.12.07.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:18:49 -0700 (PDT)
Date: Thu, 12 Mar 2026 16:18:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Message-ID: <phqq74vl5bymh7e67js6ucqkig67d63lsaaymtzo6qu7kgswb2@nbejqe5yy3zo>
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-3-7756209477f9@gmail.com>
 <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
 <CAHuF_Zpa+cr6aq89kCon1dC3Q0PEV17VfyAbqF0Ojgmgn32yTQ@mail.gmail.com>
 <CAO9ioeWCLeF5rD8=WVbyKBD=azFZ5=Ee=BH9209Rw6kd5EOJug@mail.gmail.com>
 <CAHuF_ZoaPd=wPmQM+RATKARSRz9NbrkewWRtOyuQAKXetmxfgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHuF_ZoaPd=wPmQM+RATKARSRz9NbrkewWRtOyuQAKXetmxfgg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: dt3iI1NqczBTv2VJHZTY9waqlraqyk4O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExNCBTYWx0ZWRfXzGS5LWUUKHD+
 yHYIexioy5FsYAIDEpQRlE5/XA8yQwsheljt9ItkuEa3pw7awTmXJf4fBLasLRDTogIvtnIYyEA
 iVQ0jfrUbLALr6QBPkY+Smj2CstZPZmiGQLcCSKA0OVoo4AVnjxjHy9gdK9Xoqr3ErFDCaIeu/a
 iQ8JUxVj8VJcWzRabOcKi6b0qYG9gtm2ApuDF3wDd4P/qDXSy4sj9LERSlMsWy18B71WqWpNgXy
 wwxlJnDgIzuvb4wDYJOQOR+k1P3jQ2kLOP6mFrW3XQUAY6t5CDB0OJ9hd0bSJrSyDjd1eSkYNRD
 il/U4o8wqdykSOsQ3yManBsiI4zN/y7x6CFbakpWcjXv5UhURkw9I+6Gxu9idfPkk5BFjFtt0cu
 Xilq73h2QlG/i7wwU5utYTPnIxoBJE0Yf3yGy1pIsc3Qw8wBx1egWn6Cmp6xHHjiegXIvwE39sE
 YP/KLej9j9tUTutkVTg==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2cb4c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=OqMl_D0fPs8U5oy-UZsA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: dt3iI1NqczBTv2VJHZTY9waqlraqyk4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120114
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97250-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67782273459
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 12:26:19PM +0200, Yedaya Katsman wrote:
> On Thu, 5 Mar 2026 at 00:35, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, 4 Mar 2026 at 20:04, Yedaya Katsman <yedaya.ka@gmail.com> wrote:
> > >
> > > On Tue, 24 Feb 2026 at 04:46, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > <snip>
> > > > > +
> >
> > > > > +&mdss_dsi0_phy {
> > > > > +     status = "okay";
> > > >
> > > > Missing vdds-supply.
> > > >
> > > Can you expand on that? The `dsi-phy-14nm` schema doesn't have the
> > > vdds-supply property. Do you think it needs it?
> >
> > 14nm PHYs have vcca-supply. Anyway, the PHY needs to be supplied by something.
> 
> vcca is VDDMX, the power-domain is set in s6125.dtsi

ACk, please mention it in the commit message.

> > --
> > With best wishes
> > Dmitry
> 
> Regards, Yedaya

-- 
With best wishes
Dmitry

