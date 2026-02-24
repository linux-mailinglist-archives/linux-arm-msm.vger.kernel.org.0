Return-Path: <linux-arm-msm+bounces-93952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKffDK91nWmAQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:55:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE855184FF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 10:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 405F43048D90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15EA372B20;
	Tue, 24 Feb 2026 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKdnxV3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCDbdO8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD2D36A02F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926955; cv=none; b=B0nkxdJzyuPtuGfMPPFaIsCUZq6CmDelDFswtRPzeuVarR9vgDiFQNqm4/xz4KITuyu4UJXfm5z7kU//sdgtbh+/elIC0KrGLO2KwB//WDUQrzcFBPqClzoIYPGelIcOK+dka6d4cbUr1WBDkXS/ClUrk8iYkmSHQIdhW87paWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926955; c=relaxed/simple;
	bh=yt2fIk54oS0XsyIBun+HVIenhJOeRN6sclpfrO3q04I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMpAhVuZVxxdp9kPIU+e84oyBnnk6vGctThAFKIgghuhjkmj6Rnzrlb9cCWMz+Kn4oW4MsgwyCi7LgrGmBjlAiF4tR9N9Wu0hQ5oqyFz6SE12I1TL9ZJCinsTyuSNuAWTIReIeUbpeKquUie8vefViEkepv7tYgal31qvhTb+lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKdnxV3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCDbdO8p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9teVH2176582
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NLB0qQPuzbACSQImKVEef+mg
	RNvirxc5Ksz+GvAVFv8=; b=MKdnxV3yzibPL80QEsKWXtKNa48g2J7/F29iuHMc
	718U9q+WCWn6PWPyu6uf8pD54aLMAQs0F7rIlgU5c99EbayoA8HG1LUL+HQ7B1NR
	GTgBYTv4kIV+jqYQ/hnk4Bh90PUw8D0HzuYEaQE+h1WsP0G1iFFHtKzexszyTZQO
	ecKnu5p5bSFqO4zlO8vc2He6LJgDbIRP0TKN1SGcEyssGXNGJhOoAeLWgklYBKD0
	2xtL6CxuIoAEfD2jd5b8lGCu7Viw3bAiw8cSj906S/YdJR76UeuQtBqcZbhJwujK
	Q26rErbHgnZRiD8BcrQJf6bNMjMoHeTsID9ZRMISGgqUNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e390p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 09:55:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb390a0c4eso2280441385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 01:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771926952; x=1772531752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NLB0qQPuzbACSQImKVEef+mgRNvirxc5Ksz+GvAVFv8=;
        b=XCDbdO8pH4jNl0ww0EatDr+cmsDTYyylFJozT1+0cjFrCYt3CKo57T00ir7pcnn4Np
         99EOqwfUY4WhwDq903QQR+mC7foWOuUcodjTBmD3Sg+K6p6dM1BJOqgeG2Zu8HpvU7DQ
         hblZo+JU2HiWLzQ3bnR5rVOkU+/Qo7/Pj+L10QJdy71qTJKmWiCLYnKMEZN2QzKBIqoc
         lOrLYGaoQtH7K3Fv7iM0zFK3CJhYgz7gU/vTtma5/YrbxjvSle8riBj68RzH6hTukMyq
         mBt7jhba6MfzIdM9QphBy49RaW3TF0GaGhoemYmVa+bhsl2hGDBbCg5YMquOC87YnSeI
         46XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926952; x=1772531752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLB0qQPuzbACSQImKVEef+mgRNvirxc5Ksz+GvAVFv8=;
        b=h1ns8VtJ6ItWpXVnAN61fa1axgPMyzKVKBRUagyxk93mjbIrKB5VKWKL1AQBTl30ls
         3unm1Y+1A7CDa4TgSUV64XXIcRjxTNghqRFbj++KwOUPKhFRxOWw8v32XofqTn3rJnJT
         +uoRvEN0w5q/XSifUZ7eesQruVoA7F4/AqhfmtmuRVmMbtgr5ETiY9UFrkUIjYWgzU25
         LCuibwW/AvZVTmFETfuXpDpOEJeRva4dxoxk+CSnsY47zAXvSery4zEteltMexAX0ZqO
         vS51pSDvVSdDgVkXS8zJ3BvKh2lbTLbE3Q1CwFd4tmPhMyNUQzlgp7mpuYvoVa94UjOo
         hZVg==
X-Forwarded-Encrypted: i=1; AJvYcCXkxozOSG1c5x617seSL46aB6NmdHxztKTdgwz6qzOIbUsSEPn36nOG4Y/s63Nkwz5OQAabTKPl53ih18wF@vger.kernel.org
X-Gm-Message-State: AOJu0YxKQ8Tq8lkJFke7IDFHTnuqyzk4jisAQilUMQ2f6ssGpExn4Rp3
	BtXw34w4sOIOotQr6kfhnR1ECAEfWBZWkU4uprcRAd6RKcPIeTrSwhvtpnPaZIMvN8DIGS81FB5
	FlgAYfGCLpZTNM3Hwj1PiEkiGXncQupDiiZ24sIF/X4G71IeuFHuiJe2PnUo/vxAh/gLI
X-Gm-Gg: AZuq6aLDtSSPGAxVYLy+IGQa8uvrU/Mu1qYbwWULRadOFvi8j9k+DlCcSJ6R4eM7yAX
	zmtvE8egLlAtDF+PPg8aEx46PijbmyKoyD/fEDQRIpADH9PI94gyD6XgdFBIiTxq49vSktXC1QH
	cBMgRkVWnbYmCEI4sdzua4CMAnD4KImlDkt4XFNzpZZrkTC4fczzWJlCsnseXxaokVRRBlswfIk
	GdYlsrub1vA0jRfPVv34IW2QRX+YDO5INvvBD72BOTxdS9NjlEEgaBhxn59X0N7Nlf4YnjmQq1k
	E5+ZyzUl/yoAu64Gc/VGXcr6ltEHVlbVanrozD1gvTXx0hi3/92mSlz+c0YYKGR3979BFqQ7SH/
	ygKz0SZ8LhR5lS8mS+3EOj0dAizJw9kJT5SzsfPcDuMALPMA6Q7ACeq23MEC6ZeESzNE1YTxZBU
	SELV7ME20syd/yViX+WFTONExDfOvbUeztJTM=
X-Received: by 2002:a05:620a:1708:b0:8cb:3505:443c with SMTP id af79cd13be357-8cb8ca63f71mr1522350585a.44.1771926951638;
        Tue, 24 Feb 2026 01:55:51 -0800 (PST)
X-Received: by 2002:a05:620a:1708:b0:8cb:3505:443c with SMTP id af79cd13be357-8cb8ca63f71mr1522348085a.44.1771926951077;
        Tue, 24 Feb 2026 01:55:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b95csm2073554e87.16.2026.02.24.01.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:55:50 -0800 (PST)
Date: Tue, 24 Feb 2026 11:55:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yifei Zhan <yifei@zhan.science>
Cc: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/panel: Add Novatek/Tianma NT37700F panel
Message-ID: <u72thihdv7ct6twwmqz6744w7ls6ulhqqo2awwq2mmhkva4xzb@cbkowz6rwnj4>
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-4-mailingradian@gmail.com>
 <gpkuq7b6mae5ib2xvphmir66pb6ysexhhfqkorve5zewkj4ofc@ryccazsoxqm7>
 <DGGAL7I1KRM8.1DSZIKWRHLEPM@zhan.science>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGGAL7I1KRM8.1DSZIKWRHLEPM@zhan.science>
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d75a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=X6Xd5_H3JNy0hcg6DaYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0aadSZ7Zim7pLDfHjysIqPyfw0RwOLuC
X-Proofpoint-ORIG-GUID: 0aadSZ7Zim7pLDfHjysIqPyfw0RwOLuC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfX85U7zMuq981v
 U/sRKIB84h6ibh/xjT2hSyS3Kl1nBH6d0esiXbbfVaqx6vT3Z6onW2jnjosaiKjYLFfVwttB0jf
 o1PV7Sq71hz8N26A0xNJxvKCe/25V+0hvivgMzynrTF7iceI+IAau7v6ThKKpArG87V9XulbrWW
 3irsSTYZzEM5E3KYmZ71bLtLOe0uI3m1SJNkDyYijK0usQnkAfWK5llvTYlr8iL15tw2Hi2Q08i
 Y92a2Zqn4QSsfGtKfZMvfvwkxaV7cyF+P1g9ugQQQ7s1p1AKKmZWSGOiXA1IcA4VhQXkjiKru22
 7/orAMVwjKIr38OkEyV0Tf0NaMs9509Re7MiDQXEl9LKMB+iFVA/KaWtdIEIG7FEP+qBBqvsZad
 FCIWXeKRoiCY3m/cApXCENyLx6hBZGyWRx6devr7VOPfTTyeqjjGGVkgvEexcDpbTZG8jTlP5Ps
 PPY7so0AfKT5ZtG6dHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93952-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE855184FF5
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 09:51:57AM +0000, Yifei Zhan wrote:
> On Fri Feb 13, 2026 at 6:07 PM UTC, Dmitry Baryshkov wrote:
> > On Mon, Feb 09, 2026 at 09:32:57PM -0500, Richard Acayan wrote:
> >> Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
> >> the aid of linux-mdss-dsi-panel-driver-generator.
> >> 
> >> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> >> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> >> ---
> >>  drivers/gpu/drm/panel/Kconfig                 |   9 +
> >>  drivers/gpu/drm/panel/Makefile                |   1 +
> >>  .../gpu/drm/panel/panel-novatek-nt37700f.c    | 294 ++++++++++++++++++
> >>  3 files changed, 304 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> 
> <--cut-->
> 
> >> 
> >> +// TODO: Check if /sys/class/backlight/.../actual_brightness actually returns
> >> +// correct values. If not, remove this function.
> >
> > Any chance of checking it?
> 
> 
> I tested this with my Pixel3A XL with tianma panel, it worked correctly.
> /sys/class/backlight/.../actual_brightness returns same value
> as /sys/class/backlight/.../brightness and I'm able to change brightness
> level.
>                                                                                                                                                                                                                      

Then TODO needs to be dropped.

> Tested-by: Yifei Zhan <yifei@zhan.science>  
> >

-- 
With best wishes
Dmitry

