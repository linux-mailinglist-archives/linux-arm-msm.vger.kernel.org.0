Return-Path: <linux-arm-msm+bounces-111498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rqgaIq4PJGrw2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:16:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F8E64D583
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:16:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UrmBsf1D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GetRCjJq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111498-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111498-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFE093016EE8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF3D37AA86;
	Sat,  6 Jun 2026 12:16:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B9370ADE
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:16:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748173; cv=none; b=bjBTIez41v9yLpObYcamDJRMqKEkSc82sIb10wmR1LW3Qd+gEtVolH4DSc5H+7tQL/fXOVztXbvtAaf0kobb56JOD8KJ54HziVwGxJNGdGyp8cIzDDjMBk99HjhJgE38cvsJGeM+Jp4oUSJgt7b40nfyYQmIzaRhSnDt9PoJ7Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748173; c=relaxed/simple;
	bh=RJW3ZrUC9CticGt7TJWt8EEhmxJcCwuHLns53qLa3qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3qhiRJ7MVdQTa6a8tV+IE8Clk7an5Heu4F5dBZXDsa6gw7sRey7ClZAF7lHhSYA0mNQNquEvfQ8UnrPOEmSKxZxxfIsKvgMtHsibFBT2RavcJgylrKlFmcvnt4aSTofzo5ZHpLPzhqBPR2ASb82kiwf2TS8xU9Zpxpc9khTVGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrmBsf1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GetRCjJq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDfpY1279225
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1zE3o4VQZjHAay8n7mzWjWrr
	l7kDTW8knX8g5BBXo4w=; b=UrmBsf1DursXcp+DHml2Fw+Yi7SWRWd0SPCDjAiK
	X0pcnwOI8e9tRgFaO4kfR6ISmHjh8laeT6W9iZIW7p1Pej4g2Jmhax4DS+QHfWwp
	91qMxthPY+gDtsAE31QVZby9GR2PET2XYvWFWVtjbuH7/SIl0+1rdL4u6dLNMS+B
	UtkiaHFs3Qme3J6JImm1f7O3s8hSBaoU4/lwtDR3xBXZlLpl7RMMgtFdl6uRL7/5
	spyKfMYZ4yaYPOBrldqp3Sd0QBkCUXIJegkWb/cOIyJQKhLoSeREQWchVnTUkVqm
	hMDRnc8NCIa//tOs1R3NJxk0QY3W/9yEudgjFUl2QBtmgg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagr9a02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:16:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cff652cc58so4660431137.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748169; x=1781352969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1zE3o4VQZjHAay8n7mzWjWrrl7kDTW8knX8g5BBXo4w=;
        b=GetRCjJqThlwoMstbEBhZVbg/KYESmCZGaUpGNON8xL9VRqRRxi3WN6wfu2/WfyrZ1
         SJG31rzbQDwl5geP6FTn9h4tCyitWs8KhJBCg3KFBVnW35BQeKqbfISqjKPoaia/YnpL
         SByWyQv3Hm63NM2+W98mtWjDJEyJrbel69w108R+eKfatggJxNz5DPN/U7j0c6vQdxMc
         +oT6KemEoWcm2vTxxgPSK1rFHUFQO38smdGcWwSEvmhAj57JlFnBTB8zTJd+r9X/91JL
         VEISLVrlvEeXIHVQc2Bj3NmV2z+nimqNLV25CLkH2YPu+3cn2P0ZG1ybXEyeBV9Q+90A
         Tq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748169; x=1781352969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zE3o4VQZjHAay8n7mzWjWrrl7kDTW8knX8g5BBXo4w=;
        b=GGO05+YrThTBaR5A3W2FQKvuwRXlY8xqdV4zNgRQxyBSw6Ls1I7OHeAoNYEPR97aph
         orNUXX7ug52sNiYzSE5BVRDTSRJx36B8xW3kcN8+gt9mj8s+NYeCaz50rv8sH3Wvrdrt
         5X9AgBX1nBwfP9cy5tRupJh99HQ/BV54ZRmTJGlidd5z6M6lb38nLJ64dAYs9j5tJDx5
         Zt75hl8ypqZzQfZV+gv//V9lFY8/EBesaHrP587HPQxeLPz81hFNHo174aWvrX6UIzsb
         Mvyz9smCEjvh/9jv9bKjnes91qF1jtOXGy1/vwWQHWu2CUH0b2Xydsy/QOErsh2sJhAW
         y5vA==
X-Forwarded-Encrypted: i=1; AFNElJ9mCQGP151b0YgX+x/1xSbyG+CVNQdxHSnjaVxI3TRKyNCzUfU6dHcqX+9mMiqXMmF9Mra0Lt+F069zvuLV@vger.kernel.org
X-Gm-Message-State: AOJu0YzMetZW7GGzL+m/IMc9fCsAzfRTBn+2Y36RUDFljB/kb8Lz/De5
	aIKvVbAlYQVNApAhd9avbIvpOq4LoCZHt2B3kndHRyKN/tAuyKETj4GIiQV8ugZCMZnLURaGlks
	qOxwRol7lR2N/0gqHzy3Es2Rc7XNU+iWksR+ScB+1tFPVxmz71RAjEOJgWkW+ZlG9S8+u
X-Gm-Gg: Acq92OHJ2A2CpvCtMu2xMdzhTOlEqXjSXbOeqoKQxOQYxxZzss/p4HKLXQodlNLlaS5
	1ZH3lbJeGV1YkeZhB1BRIwa+ozhgObYmiCAfGJKfu+xWazRpwNBIDRhS2/EuW8ZQXHOhsfJ9riE
	6oXI4ZDAdN9nVDeY7BWxqbKApPSoMMcSPzQ+G2DZcFCnapTflGwPs8sz0aRP3c6tK6nugzovxTU
	UPYXGgBgL64vX2ZWNmk9uw0xAObFR+Y9e5DmDldUI8HNjv6ktTExsqDNFESwxuHkUahoD4dvRM+
	DmYRP/FkHnZvBDwWWWCqKFWleN99D/IDQSId7EhjxeQdPGu0AfJQhKet+g3YIKSOaHOCS5lzO1Q
	06KoRK35I8lh6u43DxVGCTUZ9mWSk+gDHsulc5gA/xPr9VEoUXFZOQhVR+Oe+UqxqPDItCNMz9D
	rYHfxk980QYtaC8Q5SNF/KjZ98SvT7134GfD0KltyXWGUvBA==
X-Received: by 2002:a05:6102:c91:b0:6ef:fca1:13f2 with SMTP id ada2fe7eead31-6fefc8b5b6amr4334564137.7.1780748169185;
        Sat, 06 Jun 2026 05:16:09 -0700 (PDT)
X-Received: by 2002:a05:6102:c91:b0:6ef:fca1:13f2 with SMTP id ada2fe7eead31-6fefc8b5b6amr4334521137.7.1780748168762;
        Sat, 06 Jun 2026 05:16:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm31092601fa.0.2026.06.06.05.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:16:06 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:16:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <aiQPhPycW07t0U-6@umbar.lan>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <ss3deh6wb4bjasig2r56bhl6opygpkid2ixztzdsegqgayuvdk@vgy4ytjzyife>
 <1ebc7c8a-b0de-4f25-b4dd-571909f9c67b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ebc7c8a-b0de-4f25-b4dd-571909f9c67b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyMiBTYWx0ZWRfXzA7TS4Uhp+7n
 697udZLsUrq2w6I+FlyiJwM0BCo5iIamGBz7vynru0JgGga5rDjo9qRTgDgZAv450SL8GrcPi2I
 JZqB0iDU/AtBv7aGXM4ObbNfw4Pu7UOixejiM5tp+hm2fU41GHCwR+L3Mms3mGRQW9fkjv0movk
 6wCFmxDlCiclHk8MaaF+QLP+w4S08cGgWO+t0gi+hNYHAd4rXtWL80m9PAA1TrGKtENNhKViZo1
 0yvQB2cI0M2MlvPTg31qf4AQfPudNXinG5jvM2rhJPzO9aYq/auiM1xnaOYygx6T1ffbLmv1gzl
 t4JrXMWra4jrqUzs9fOhzn6tUBWi9jb4qgroI9abtLkfvsbtVeScUSE8Yf+pjlRN5214KamFsm1
 hvTxpyo3BGCs5a3hgfRlbtMK0lJkhOoxI86aVAjOx3tf38HhOmRHPQgPIG2xyRGcCvQ34pgcV5N
 2Q0nByyxm9Tj7fj5TTg==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a240f8a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tJgGB5yCzY2aFmRDZG0A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 1vEEkjIOgridCiO-R8TqvLqjowdy9mxx
X-Proofpoint-GUID: 1vEEkjIOgridCiO-R8TqvLqjowdy9mxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111498-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:arpit.saini@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ayushi.makhija@oss.qualcomm.com,m:quic_rajeevny@quicinc.com,m:quic_vproddut@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,umbar.lan:mid,devicetree.org:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3F8E64D583

On Wed, May 20, 2026 at 06:24:20PM +0530, Arpit Saini wrote:
> Hi Dmitry,
> 
> On 5/18/2026 9:53 PM, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
> > > ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> > > The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> > > 
> > > The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
> > > supply (vddi), positive LCD bias supply (avdd) and negative LCD bias
> > > supply (avee). The panel operates in video burst mode with four data
> > > lanes using RGB888 pixel format.
> > > 
> > > Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/panel/ilitek,ili7807s.yaml    | 80 ++++++++++++++++++++++
> > >   MAINTAINERS                                        |  7 ++
> > >   2 files changed, 87 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> > > new file mode 100644
> > > index 000000000000..93c511d03c00
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> > > @@ -0,0 +1,80 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/ilitek,ili7807s.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Ilitek ILI7807S-based DSI panels
> > > +
> > > +maintainers:
> > > +  - Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - dlc,dlc0697
> > > +      - const: ilitek,ili7807s
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: DSI virtual channel
> > > +
> > > +  reset-gpios: true
> > > +
> > > +  backlight-en-gpios:
> > > +    description: Backlight enable GPIO (active high)
> > 
> > Is this actual GPIO or the GPIO-controlled supply?
> > 
> Addressed here https://lore.kernel.org/all/dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com/

It's not. Or, from your description, I can assume that it is a PWM
controller external to the panel. Please model it accordingly. I assume
there is no 'backlight-en' pin on the panel connector.

-- 
With best wishes
Dmitry

