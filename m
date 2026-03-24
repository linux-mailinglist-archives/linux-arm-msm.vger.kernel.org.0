Return-Path: <linux-arm-msm+bounces-99750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBKXAtoPw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:27:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 732E131D53E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4511308A948
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5473C6616;
	Tue, 24 Mar 2026 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRUlYJcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsqKd/4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3058381AE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390804; cv=none; b=TpaAdpSUV9AO99OZxZZ47kl9A+zakvhhDmj7lZSw/xjgn1Qjy8hF4uv43Jh4zdx75dhbZMqYQDaNjTMOuxEWbG8O8rL/0QzBfpuOu/LIk2wugD8u37vTYLGGxtDy37sOSu4KWrah/vhgZYQrH9yy9FJeQlVlymbWzMq8DsgP8Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390804; c=relaxed/simple;
	bh=0GEDeTiHUpsHyCgP/15tglbvgfhfh8UB69k6+ilIvD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcAe/Cb1o2BPD+SCF//mDRrwFsd6oc0JlgRPfEPhLEkFU9Gagd8v6sKKxv2+DSwa0Zc288eahw7m7RQ8Nxd0uAnJbgldibeWjw01+Ub0+wQ2Eau+UjYUGnDR8TEvUoIFOFWlQxDBY3T3IXnDMQ5mtaTRGFGQ6grXOfhaFQ56AWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRUlYJcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsqKd/4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCtVI2808009
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DXfDq3Ed/IGLER8UTluc261t
	apAHFbnvzfmNWppFei8=; b=KRUlYJcq6++KH3hcFE3AzmTVq9QteFk2BxBcsBFy
	Udag8jUwIhFKslaE2/HCbAqLkc4XGzibmDRsdQnTVN+DxcjcIuch94TwpZXSJzm4
	MgJZmKsb3ebAQQhTFf0CwJt1doDnFkDDQxr+dbsDqF1iFzbb9wEnKVTl/Rtmi4Ll
	3I4UMjm1SCRoeqo6Y2ayu2Zj0IWsg5JRaHZT8iAeGOJBhNBSt+DZLOkrRLFXOAqD
	jhjJt7flLxk0Qe7nqDSsdchjeQirwH4Nd+bfpxdnD7Om61otP1Pd29XjzalqAnnq
	S5Hych4IiZbiKie30zx8Q9esJs293NlCrez43XaXUHr7cg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ej9yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:20:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so113374011cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774390801; x=1774995601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXfDq3Ed/IGLER8UTluc261tapAHFbnvzfmNWppFei8=;
        b=TsqKd/4WsVE5YhWd1zNChDXhL71X9/l+XKyA+pwp1uLXT2dNQMMbKuNJjv6zXznstG
         V2pIHC03q9tdc6uwtghf1VmY0AbyrXTmB7Kw44gEe7EWopa1m3AjOSVT6AhBHS3HJbuC
         RGaMSnR8ljQgw5hMYpc/9+WWl87UxqLJEvsc600cBFfZ2GoeHcdvnxGrhQE5BmnO7ao9
         9HMWwhbIMuA7QYTdVsNZpZK8+s9zoT+iNO0BHJCR9Tnu72ADRLcYvhzdh4AV9Yo83L4a
         ecbOk9bHd6yb4YHt3JTtDQz1jJ/tZqaI9jEadd81Jq7orc6tYngzj26mTFeQCqYin6rJ
         oDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390801; x=1774995601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXfDq3Ed/IGLER8UTluc261tapAHFbnvzfmNWppFei8=;
        b=d2wmcGxWmee7IZUroY9o/P9q+eLBknNQdI7genlPDRnBZiP4A7s/3XuBr41xl+xCxs
         rL+DBL3EfUbfKGtFNnfIkMzoftoQJiX5EsDzxElwVWU1v111PmmND8JVzschUaKzSQ0g
         ZtGxkNP1/LOGieCsLkMPkSW5ctxpidOvx33qHsfXX52gBb2SK3DI9G4MGtqSopRcpFsM
         iPsNoQ3d956c5g2flAyuAkKZiuV5+UEX0gqI21zh1Aq3zxcCYrNpVWkUhKbYFUfYj6Ya
         cI3ebX8kQOV4DhhEqSqG9P56N4z1R10whrNzmsixK7m1ISv/q8cOimIYAgWfwNQZzfVZ
         lszA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Pnu+gBY2TEqFY+TdJDoqWaSuw38zaSUbKkbx4M+whn2SNUC5zwVC0EFZtVnArZ8dsyUs59NnDSTKfneT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Kh0pHcIhw2GILt3njnpvd6Qop1g/HvbFsLbnFJHpB1NNS0Z+
	EQe0l44oWLDNg+BlsORwpcgP62uBbzmHhEBioDPWevAnLop2vSJpPN3XlSpR+o14m0DvFNSzziy
	vYsJOkeM9nxZuw/D4D0nXLV7mp0wYaSJpum/gYcYoIbJvi2NP9xHQhANZTwVqOxbJwYs4
X-Gm-Gg: ATEYQzwiOHBMUgHtYXFGifs4wTXg0/OYoi34BFORE+zrzWljbgOXl5TnZbm+K8tdkV8
	RvPM3p62Im+oKB3dypqpemDOvMUOzeX7w+zbVWAVQ0s7mwue+9wQmxVg9Mgg29t13HTb94KLeQM
	eLC/PjucxvUZfbUayGiIhtKPwUlmKK2t3a6+7hFS+raj8ZwEH0Rh2aEo3qbfpWag0Z2APKEAqj1
	uxIUzTrlFP3gmSaIcQqAm+cJ2mQZt80gjAyKrTDKiIJ3dZUPAHy+A3yfFVNo4dirpauDeSJOFfo
	teKw9taoMmF7LxW0sjnYkJ67aLBd+MTCFvAbmtZXlJ4CDciKqLA0ar4HDLUDXzoJmmk3POT/5ms
	1M409ECMW0zDG9D8qdb86DsMZLhFDC0dTwkzQGcqbBSQiCIhKlZri8AhePCLEJtyGHgcKiFUmKE
	r5CB3Cc7LVIuSxaXuU5YBF6kWT5gkVvV4Y0pI=
X-Received: by 2002:a05:622a:820d:b0:501:b1d8:637a with SMTP id d75a77b69052e-50b80ea6259mr17386151cf.61.1774390800861;
        Tue, 24 Mar 2026 15:20:00 -0700 (PDT)
X-Received: by 2002:a05:622a:820d:b0:501:b1d8:637a with SMTP id d75a77b69052e-50b80ea6259mr17385761cf.61.1774390800305;
        Tue, 24 Mar 2026 15:20:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972bbaasm33033261fa.6.2026.03.24.15.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:19:57 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:19:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: display: panel: Add Novatek NT35532
 LCD DSI
Message-ID: <fh7rfswcwcrquijgjq547b6jjuq2v3wxiweh5xnnd4z5ql5n7r@gt425ujkpctu>
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
 <20260321-rimob-new-features-v3-1-d4b8ee867de7@protonmail.com>
 <sdcfwycey5ykhn2fghun7imx3tjtnwat3ny3mut5dwstl7wvw6@maqrzlycwdn5>
 <GF8zsK-szOM98Ck2jznCOZ4xjuJTl9g1b0uPc1N79Dzf7PNzOiVgewdqPFGjqF3YD7tOUa2tzdc7rG_e7iNH8yjHOJ9DobsihTxRLUk8EL4=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GF8zsK-szOM98Ck2jznCOZ4xjuJTl9g1b0uPc1N79Dzf7PNzOiVgewdqPFGjqF3YD7tOUa2tzdc7rG_e7iNH8yjHOJ9DobsihTxRLUk8EL4=@protonmail.com>
X-Proofpoint-ORIG-GUID: 7oiGClniNn0NOzO1Y5xAjdWFdzGgXCXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MiBTYWx0ZWRfXyi0AE6pY2hql
 Nl7IE5KMPNxh3l94wZzEYcUO6SPfpopfwM0T1pt04fXxkpideFqR01mfO6Sk95khaaDcR0FL8IR
 a2gi9vA0YwN3qZk8Bgb1xCEoxdHe/tfwJEYhKEaDJe8NmH9XoV5E7GklIz2Sy8uqTlYGNrpEMDk
 flyPrixNHsOt6tgBjHsxlqb2TzaxAe62cKUbnMOEntKZzkU+ixSxYTOkPM2nARwUgeyUoMQGlEe
 ihCTKKzWYD0AEfYqKKaT7QJlHpoHqPCmxwZ+SYRCLWSGTTKQI6sN4IHl/yusE6HdGdHy+RO+6on
 EtQr5O8ccIHa10L9+lECM1d1nVs+0YYMzii3/Ms7XBiALuHPzomJ8z9I/OIj4hC0nB/xpf9tpt/
 Q/we6LlKKy6QbIPEJVC21gdjiZtkNXlrCF38KoNfj2RkFA5OilxKNFj6TqEVoByq8Rl5TFCeuo6
 TZmyt0dVLOuz+/Xl4qA==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c30e12 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=0x0uYR1eAAAA:20
 a=zvOWnUYkAAAA:20 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=BSL3PQau86bbBt3lHzsA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 7oiGClniNn0NOzO1Y5xAjdWFdzGgXCXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240172
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99750-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 732E131D53E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:10:13PM +0000, cristian_ci wrote:
> On Saturday, March 21st, 2026 at 17:46, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Sat, Mar 21, 2026 at 05:23:20PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >
> > > Document Novatek NT35532-based DSI display panel.
> > >
> > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > ---
> > >  .../bindings/display/panel/novatek,nt35532.yaml    | 77 ++++++++++++++++++++++
> > >  MAINTAINERS                                        |  5 ++
> > >  2 files changed, 82 insertions(+)
> > 
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: novatek,nt35532
> > 
> > This is not enough to identify the panel. This name identifies the
> > controller inside the panel, however the exact settings (and the
> > behaviour) would depend on the exact TFT "glass" used with this
> > controller. Downstream usually doesn't care that much and frequently
> > just uses the controller name or the the controller with some kind of
> > "description" like ("wqhd-dsc-cmd").
> 
> Ok but I just don't understand the following: I'd like to know (also 
> considering that I find it difficult to find someone, outside of this 
> ML, available to discuss this stuff, specifically) exactly why the 
> current bindings are not enough.
> I mean: looking at schematics and datasheets of other similar devices 
> and based on observations about my device, I believe the generic bindings 
> approach for nt35532 works quite well for panels.
> Novatek made the IC first and then whoever buys it can be a display 
> vendor. If we talk about downstream, differences between panels are described 
> there (i.e. my panel makes use of four supplies, while other ones could use 
> a different configuration).

Different "glass" means different programming sequences. Take a look
at the existing drivers which handle multiple panels. Sequences, modes,
etc. are different though the DDIC (controller) is the same. For Android
kernels this is handled by putting all the information into the DT. This
approach does not align well with the upstream DT expectations /
guidelines / philosophy / etc.

For example, let's take two NT35532 panels described by [1], [2]. The
sequences are somewhat similar, but the contents is completely
different. From the upstream point of view, each should be described by
its own compatible string (so that the kernel can identify them).

[1] https://github.com/eliot-shao/qcom/blob/master/display/LCM-NT35532-JM55FH-1080p/kernel/arch/arm/boot/dts/qcom/dsi-panel-nt35532-jm55fh-1080p-video.dtsi
[2] https://github.com/balika011/android_kernel_xiaomi_msm8953/blob/master/arch/arm/boot/dts/qcom/dsi-panel-nt35532-fhd-video.dtsi

> 
> > What does it mean for the upstream:
> > - Try identifying the actual panel used for the phones. Sometimes
> >   googling for spare or replacement parts would reveal such a name.
> >   Sometimes it can be seen as a marking on the cable or on the backside
> >   of the panel (again, googling).
> 
> It seems that 'google' approach fails, in my case :( (I only know that 
> the vendor assigned Smartron the work to design the HW - but SW too - 
> of the device. Nevertheless, Smartron is neither OEM nor ODM, so the 
> company was relying, at the time, on a series of chinese manufacturers to provide 
> parts required for this device, including panel suppliers: in general, 
> the list of panel suppliers for Smartron includes BOE, Tianma and other known 
> companies. So, this panel may be any of those, paired with NT35532, and work 
> anyway). Unfortunately, even if marking on the cable is known, that doesn't 
> identify the panel but the cable itself (which is available on the market, 
> though), instead, in this case.
> 
> > - If not found, come up with some artificial identifier that would
> >   identify the controller+glass combo (e.g. "tianma,fhd-video" or
> >   "lenovo,j606f-boe-nt36523w" (where lenovo,j6006f is a device name and
> >   boe is a "supplier").
> 
> Assuming that resources available which I've as source of information 
> for this panel are limited (the ones also described in v1's review thread), 
> my vendor devicetree describes the panel in  'qcom,mdss_dsi_nt35532_1080p_cs_video' 
> node and makes use of:
> 
> qcom,mdss-dsi-panel-name = "nt35532 1080p cs video mode dsi panel";
> 
> property. Until now, close-to-mainline devicetree I was using the following 
> compatible for the panel:
> 
> compatible = "flipkart,rimob-nt35532-cs";

In the lack of any information, this is probably as good as anything
else. Please describe in your commit message that you don't know the
exact vendor of the panel (nor the id of the panel).

> 
> and I'm not sure about the exact meaning of 'cs' suffix. I cannot state 'CS' 
> as panel supplier and use that upstream without proof/evidence. What do 
> you suggest, in this regard?
> 
> 

-- 
With best wishes
Dmitry

