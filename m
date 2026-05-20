Return-Path: <linux-arm-msm+bounces-108753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPuLBUW3DWrC2QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:29:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BF558EC49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B6E730182A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6393D171C;
	Wed, 20 May 2026 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2xNKsMY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6n3oWcT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DFA3E16A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283619; cv=none; b=dCdFoDk/0bdswB5jDTd2dSR790zEWi1tXsfVftwljvfjFoF3v+UMnlanGUxj9L21yh839XEq67ZmJgIryGtNj5EGgWoiGrsykA67bthkG8HvMNriJoxdphX7dSb6ZYs2kP9BzjgQs/2jfaEgXN3OmVd3zx5TynUNqkYq1vTB428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283619; c=relaxed/simple;
	bh=HemS74o5kpFzP0BLSBOjgyNhK0QVj940yoFmMZasu7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ymjlz9kZ4fyUCqRYX/snIXy8h12J1sR3ISOZdsd9A6hHwbsWSFhd6mAfXxe7br8vtlMHCFzBJuONkHguCMRxXSNrJYPrEuzgtICMh9T5iK/kjwOkcntyAYuDaqHYuosetKJat0hbUqeD99iqjDwSdCaoXu4mhnvcRRSAmLhUTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2xNKsMY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6n3oWcT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCsPoM1238004
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vaQoESsHm3Fjd/yTXvUGh2U7
	2xcFTmSwrslZBvyqdkY=; b=Y2xNKsMYNtBOg7oJDZRcWtAT5+7On04gsPDJnNEk
	D9Ac4J3+LJu3ZTmGxIKArpVdlMZedEKPdAzGd0/3WJWgznfsaP/tPcWzWMpTeAmM
	lcKIEXgOXtH/s3Td2f/loPXrjXXDU/gVtsYNXabyD8POWTlQIeiIdxI/j4ky9sFV
	LvY/3qYL0eduYoCEgl91QKppuqoQfu7VxQPrYIdFNjltl1nt4v25CBaV2IgMGH9k
	ov4pQe4+OWVavnEPEENQSy7FmFTyqngn/YJ+QBkPG3YzJT2tCxw5T9/8CU5LTsDl
	VTzjuQ4ns4n1DksudrLHdNzvA2mY0tHhjhxESoPQ2p2CKg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3svyu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:26:55 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fd51d5c22so9809963241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283614; x=1779888414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vaQoESsHm3Fjd/yTXvUGh2U72xcFTmSwrslZBvyqdkY=;
        b=A6n3oWcT3D2ORcujF1L8/KBUy5b/s6gHeX1C4UQMbby0E0OWg570o5AB9IAPxRlAWS
         8L8treMaSJJ9nH3PfHCbbM6tok6oaGpA7jJEiV8gskDWAM8rHyceNGDLbq0ZMGkLSmgG
         lKUVCkGflXzB3iIFLrLEBxxRgXkwHsoMNPNYfHnp+0DCZT/+C8ywKLQFSc+lX/1NFSU1
         AGIF6qT6AD2XjXSED60hk3BzK2uqqqHrGk2UYUtGoTKcPcUj5bgI8llQLLDM6shenM8D
         +D5redQl5MClF9FTXUXy0pbRQrH1CTyoWbYu/OL8Ht4C36vRP3B9XkbQod8cUDPcYHY5
         9aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283614; x=1779888414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaQoESsHm3Fjd/yTXvUGh2U72xcFTmSwrslZBvyqdkY=;
        b=NQ85z3LbtcmExGpOwxj371HWFYRIXLvqnKmYEhNik5fHFd+x4Tfm9b8AGHaf1BFJ1K
         5l2b7vLKbTj4kQOkJIwXMB9v8ythMlsDojVSjvBGs87VXxTNlUAxUXnbYQqRqqryYVDX
         UQrd36d0fEOgp8YlE2/4aFguX+xHonuJQC9z4pYHPQIX/ZlWO1VTfdpMSFZqQyjAvDMG
         wpicOv9Wj/EzNX6RpMoJ8/XLZ8Y7SGtW3aSBLN599oWfLmQ1G3LJUeewac7HvV2Pb37f
         WOjH6edGSsy8Zq0G2cBzR+kQWVWrRNPY06nnHh1hAg3NApBXPGx9Uo+lqMr88HGCu7/5
         XrxA==
X-Forwarded-Encrypted: i=1; AFNElJ8UxkFA4oCgYOr36GHNYMJDG/raCHcNbLCJdGegnqe2RLzt/8Ez7li0UPCcqnFFAyZsrTC/WM/knLBcqCQF@vger.kernel.org
X-Gm-Message-State: AOJu0YyktFJ7m4C1i5wurtEwFX+i1TRO4i73FI8bHZVmzlfYepWxiZSZ
	3PqSDp8T/OydNqfS+DVHgIqpdpYfo/fQP1g3fhl5hv+0mzXqNI/pj/gs9aJBDLVoeGjGQYH1yUo
	Px6Mj58B/SSWMU6odRlufS7L36RQ0PzoS2RrFXTgnjGIEjtj1zTjwgH44tuy3TienZEJA
X-Gm-Gg: Acq92OF0xl9IIe87XI/FvrSHNrw9ESgJg0C/csOh244K7b7lcvB/AT67hRM9GnZo1Q2
	EtBFcm0fPErq8CSu3e07wz6HY5WMZracaERP2maKrwt98+QobDwujj8XZ/fT4Dxe64jWnOE56zk
	hHlk6qyG3FvbT6Sa/nhtor0qpK9VQqv0qxaVpTUgLZK7xXJ/WVo+sDowPTiwl5BrG4Uf7E3QjKw
	vbRT3Dn1T6DzyfIgqlEZynxtZho0H+5VxC7J9y0NV3XN9h05pcedaCcTmOp3cjnND6cCZdF4a52
	U2x/NfnjK8LdODRJZkv4MuXgHdi3KTub27cGxw2S87J4rEdaRoUIJeKhjMlGMjNaBzRI6rXBROY
	Y+Xx0BwiS/vZ3z7GHNQXfpaxE8pvGjclbojkch9i1vx35/jbE8cpMX1FpP1zgxwqC19l7uR4tBe
	+xDiaKfAcci102NosEgXYgzXB9gMcFmVrX6sw=
X-Received: by 2002:a05:6102:511f:b0:631:4e25:5e40 with SMTP id ada2fe7eead31-63a3f698d43mr12171727137.25.1779283613920;
        Wed, 20 May 2026 06:26:53 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:631:4e25:5e40 with SMTP id ada2fe7eead31-63a3f698d43mr12171674137.25.1779283613354;
        Wed, 20 May 2026 06:26:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958828151esm28711551fa.3.2026.05.20.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:26:52 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
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
        rajeevny@qti.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <yn7rwuguaqliovlyukcj2olxby7zerv57na3jf2pgbke5zgahk@aasd4ojwdy2u>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <20260519-curly-courageous-sturgeon-2facfe@quoll>
 <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
X-Proofpoint-GUID: x0M7EPuLN9eWXX5uj15GQNNd90YZp6Uv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfXzdlhvW8i2WTw
 LdgaAmtv9glQXb1Hz568u4DdR0sWkCam8o6Rd+VsLjDroqahrKvQbmWv07HrcWV/d7oG61q3gY8
 nLiwOIVALf8+4g3o1hoxzC0Q9+2gxV+8bk7g5mB60v/fxsB/AoqNAyJcUDniPnHxrLjOhIC8zNL
 J4YXR28V20/BvEWRkM2Yp6TC3T7sjZjJo0SAnjh0x6IVqSj0c2eFFYMEDrUdW7wNp7u1Fiamdw+
 7R+yo1VO6rGm1IY48v+zHcgO4ylxKDJQi+QyEq5nRunavdcsdwrT9R6xeONiJE1Mzn7aOZXCDLr
 u8zkKSOKLhfFZHWkhLpuwVmBiEa6PZSI+Y6ZNMCybkxWXwnXpaadoDQLvt2/Olz0YDmZvHrxPlE
 0YIAAcJz4hcdRisJr+kec1GNDvvDd00VQJKHMrF3tHqb+J5/p/GzfJTnCOtZE5j1uRh2JaK/y2P
 xeAt03TmvWcN2uyJwpw==
X-Proofpoint-ORIG-GUID: x0M7EPuLN9eWXX5uj15GQNNd90YZp6Uv
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0db69f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=b4Uryj85X3Pt6JUd_SgA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200130
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108753-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81BF558EC49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 06:10:57PM +0530, Arpit Saini wrote:
> Hi Krzysztof , Dmitry
> 
> On 5/19/2026 4:02 PM, Krzysztof Kozlowski wrote:
> > On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
> > > ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> > > The DLC DLC0697 1080x1920 LCD panel is based on this controller.

I can't find this panel on the DLC website. Do you have a pointer to the
product page?

> > > 
> > > The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
> > 
> > If panel requires it, so should the binding.
> > 
> Ack, I will update.
> > ...
> > 
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: DSI virtual channel
> > > +
> > > +  reset-gpios: true
> > > +
> > > +  backlight-en-gpios:
> > > +    description: Backlight enable GPIO (active high)
> > 
> > What is the name of the pin in ili7807s device?
> > 
> Display daughter card has WLED driver as well as LCD bias driver.

What is the display daughter card here? Is it a Qualcomm board or is it
a part of the panel?

Also you wrote a lot of text, but you didn't really answer either of the
quesitons. Is there a GPIO on the panel connector that enables the
backlight? If not, this is some external supply on your (assumingly)
daughter card. And it should be modelled accordingly.

> 
> The WLED driver's Enable is coming from WLED_P1_EN and PWM is coming from
> LCD_CABC output of the panel.
> 
> DISPLAY0_BACKLIGHT_ENABLE (GPIO 91) of ITP baseband card ==> WLED_P1_EN of
> Display Daughter Card (DC)
> 
> In the display daughter card of Shikra ITP platform, we are not using the
> external PWM for WLED driver. But connected the CABC output of the panel to
> the WLED driver. Backlight update is happening using MIPI DCS command which
> is driving the CABC output (i.e., PWM for WLED).
> 
> Because of above HW configuration, we need to enable the MIPI DCS brightness
> update on this panel. The below command of dlc0697_init_sequence() is
> enabling this.
> mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);

So, this should be then dependent on the presence of the backlight in
the DT. Either it is a panel-internal one, or an external one.

> 
> 
> After checking this, I realized that this panel can be used without the DCS
> backlight as well when it's using PWM based backlight control.
> 
> I can add `has_dcs_backlight`  in panel_desc and set it true for dlc0697. I
> will update bindings and add backlight as optional property.

Why? Use backlight property instead. It's already there. Anyway, you
really, really need to describe the panel in the bidings. Not your
daughter card.

> 
> Currently "backlight-en" as optional. I will fix the commit text as
> Krzysztof pointed out and update the commit text to get add more clarity.
> 
> please let me know if you have any comments.
> > > +
> > > +  vddi-supply:
> > > +    description: I/O voltage supply (1.8V)
> > > +
> > > +  avdd-supply:
> > > +    description: Positive LCD bias supply (AVDD), typically +5.5V
> > > +      (range 4.5V to 6.3V)
> > > +
> > > +  avee-supply:
> > > +    description: Negative LCD bias supply (AVEE), typically -5.5V
> > > +      (range -6.3V to -4.5V)
> > > +
> > > +  port: true
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reset-gpios
> > > +  - vddi-supply
> > > +  - avdd-supply
> > > +  - avee-supply
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    dsi {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        panel@0 {
> > > +            compatible = "dlc,dlc0697", "ilitek,ili7807s";
> > > +            reg = <0>;
> > > +
> > > +            reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> > > +            backlight-en-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> > > +
> > > +            vddi-supply = <&pm4125_l15>;
> > > +            avdd-supply = <&avdd>;
> > > +            avee-supply = <&avee>;
> > > +
> > > +            port {
> > > +                panel_in: endpoint {
> > > +                    remote-endpoint = <&dsi0_out>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 26060e51c067..529aed669401 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7941,6 +7941,13 @@ S:	Maintained
> > >   F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > >   F:	drivers/gpu/drm/bridge/chipone-icn6211.c
> > > +DRM DRIVER FOR ILITEK ILI7807S DSI PANEL
> > > +M:	Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > +S:	Maintained
> > > +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> > 
> > Drop, unless you handle patches for this driver.
> Ack, I will update.
> > 
> > > +F:	Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> > > +F:	drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
> > 
> > Drop, no such file at this point.
> Ack, I will update.
> > 
> > Best regards,
> > Krzysztof
> > 
> 

-- 
With best wishes
Dmitry

