Return-Path: <linux-arm-msm+bounces-103563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH66BKB64mnh6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:23:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B46141DF1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AC3E300574A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBD33BA246;
	Fri, 17 Apr 2026 18:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8xeBqhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4mfG0iw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E051C393DF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776450196; cv=none; b=EkAANXBlKTn37Fw2vFTEhxssrY56Qy1XZGmS1TtDcn8uiPY8yRcrHlIygyyfA0AptdiUAKlBEyGV2lxYJvEU2ALCzn3RC2YmnLxNyolgo91DdM2q/2nGZR+Sa/FX6mdB2ixlntqWonZmAwrirGiUNcCy8Tb1ZzJ74PSr+SeihB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776450196; c=relaxed/simple;
	bh=FOVV8ytkXqNmDOPHJRES0xYYASo8VFa6Q/ljQtjPeWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0X0VTBWl9PXm3O1Kmd05z2sSMJVGLmEBCkrcO54f/GajHj91j8XHjeVE+16HyZyBW2At93idf0b/CPeBza4tpTTgUCFG9P+NmSFzmWAXhnLKC47TaFzJK5cQgiA44OHS2zzbaTO0a5iwWTQJ0mFTglYsXMZzrhUsaxQCcxXOwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8xeBqhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4mfG0iw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG45Iu1889589
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c/Vo33zTig6JD1FHHp+ufQHh
	3tG0Ic/BRrAC/lMpdIY=; b=N8xeBqhbKm7+PectbSVf9VmQT8daYMkUTkQinlTc
	yiYnts6LdEzn7KFk1//jEFKrFjXIfySj6IlbbewU0TYuSRXecRrooi5hpI1VQ2qU
	dvlM8iPQpf8BvQURfDvS22w9LoYh7AbtLWU1cHUX+ejPuuzNERCAlhlBRFUMdbQJ
	HJ/6DTkfCx2MTQ6JOYW6d1MiajiDX0PqSSfLuM3+xJ5pfNYhy4zix4hY4toCnXv7
	DPkgALxkL+J62K0JJbdVVcpHnHg9a752f5XT7Y66B1kejBYbM3V1g6/2b0GR2WH4
	obL7+UbJwdEb2OcYJgCzoBzWzYLlgMSmOjLG0mjIWsgKig==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkjhdsqrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:23:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-610503b660bso504216137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 11:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776450190; x=1777054990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c/Vo33zTig6JD1FHHp+ufQHh3tG0Ic/BRrAC/lMpdIY=;
        b=P4mfG0iwhjfoSefsc/qDRcNSGAUHVqHcgzwE+KjCgRhKRN41+BsXFi7qKqaQJVTaJZ
         BrRTfhVPu88bhgA/d2kzNJhZcZuWWwpodwKhLD3ntH8v9qLDQzBFcrHFDERl/CF+ra4r
         +bbqoOJQgbwPO4+mXpUB0iom6NVMNe5q8R6+DsNEn7H4l27FCk0y8A7BpsO94/8KT8Oj
         IX4KAKVNlsjQe3Q+yxnJrnRODpyFO31+SeMVqggHab/81yCXusKatw4eUPkU/KXeJpbW
         nvVftaR64TWSF5sk5st4S+21aXfNvWoL7CKId9VaCyf0JTNTrcOfC0nQF1yw5cs5WvfY
         XH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776450190; x=1777054990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/Vo33zTig6JD1FHHp+ufQHh3tG0Ic/BRrAC/lMpdIY=;
        b=LqJ5Wn+KKD0gxzcav01rYwRps/gxx+AdbBHREXm3djQTiDryomFUvceK/v/kzJsjpV
         H/98/JWYKAHDLtO0Huj8Q2Yxxf8Sw3GkErEHrBi6yyuD7qD+sTIwDzoy6LWWAM/75Lbr
         a8I7tM4lZEW7cqnS9LV1T+KY8PdaQdBh5nVHO//1Kx3AFXgnJxg/BzMMzwLsdV3OkoPA
         cVk9oie+yapEiIPmp38xaUcW0E53lG3/Sms9z7qFHQNs4+suLzyKc2VZTUOqyeCv05/Z
         yhTdRHPGBzWn/bbeNAzMDBuZMCqJeJZbD5qr9hH6jRWTJ5ZMjc66uADRSNPQhtkXHX4d
         ukdw==
X-Forwarded-Encrypted: i=1; AFNElJ+8eH8MtC3Ih4HkZdcyB+0AUZJ6Rq6E4jXNZ/DHNCyvt0yxyWCd+N/Pj7Iw0owYwe7LHFfX19bFKXTcvEwD@vger.kernel.org
X-Gm-Message-State: AOJu0YyYnUpUYvbh9ZGJ9oSYzE/y/zIgPS5jYTE+Lb8zgomjmIR5MAq7
	O8/tz5UCbwbWAneKqXviZ18A2FIWjRZREecEnOeDOEnaKf5PUuzutSaDOeLPIarUSqIY7J6GQNq
	GT1a1c5vaJt4KpiBrHe6bSH0neoKZootO4z/dve03aDIhdoc19uhPB7AnokJeuaWBR8Np
X-Gm-Gg: AeBDievB8GdXXFPcCXxaqleptJPqocWVirFC9rWmRQRV7PRuJqw8zZzKmmiokmSPr8D
	EonEOsHehNT4rhoMu9ibzXZ+eq9QU5IUZQmPefpXGLZXCgFijxs4GUWoTXjuJp2FAsQsy4pcAFq
	VWo9H6EaUcs+KznaeoD0vQRhoeAqUKzvUGZs/t9ezk1kxUYc0Mry+bZRzlSfAjhJF94r6+avFBW
	uu12fc0Kyof/Jj7OgO10buSorZaojsLggEH0OxemTAQvIxKaOIxOwy0F34BnE8z3BIpr8SWoAeo
	ZszicNpNhDS2O6ayi+RLxn5sB+lv1khAwDsP63uHEeTsBCzVnKYazpT9Vgj4ZxIQUbMy8VR3Jh7
	aY0ABSl0yhGia0AYYbQjTw0jsn24obUfD/9Cnp10kX9Ixs/doXasUUBbmSP6JYbpKzdesxisyj3
	eU6rgp+g2u2w046NTiVSJveBRBEjSOx0V3C6zquM2/MNx3fg==
X-Received: by 2002:a05:6102:38c9:b0:613:86e6:b2d with SMTP id ada2fe7eead31-616f7c5f0camr1810551137.21.1776450190331;
        Fri, 17 Apr 2026 11:23:10 -0700 (PDT)
X-Received: by 2002:a05:6102:38c9:b0:613:86e6:b2d with SMTP id ada2fe7eead31-616f7c5f0camr1810489137.21.1776450189831;
        Fri, 17 Apr 2026 11:23:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb763653sm5616471fa.42.2026.04.17.11.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:23:08 -0700 (PDT)
Date: Fri, 17 Apr 2026 21:23:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 04/11] media: iris: Add helper to create a context bank
 device on iris vpu bus
Message-ID: <sqg2db63gsjg3cxfdfbmndhxibzlprgviarbcl4l6isza36nc3@ljgg23nkuooi>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-4-7d3d1cf57b16@oss.qualcomm.com>
 <ie6dad3xewm25gdrqqne2fsroopu3jwgrqmu54sfzjliis6mo5@6qsgagvyynwx>
 <b0ba2172-3f66-c912-29e9-0a48b4480987@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0ba2172-3f66-c912-29e9-0a48b4480987@oss.qualcomm.com>
X-Proofpoint-GUID: wGMQkAvi6xWEAMIbqojCzf-k7YK0fKJ_
X-Authority-Analysis: v=2.4 cv=YpQ/gYYX c=1 sm=1 tr=0 ts=69e27a8f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qp5--WL1MiOyaZoWmgIA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4NCBTYWx0ZWRfXx+dr35K5NRdI
 K9JCivIG2kMhEFn8bxjOOlh+/SR5p6oDXBBK4OQrvkGsKfvCuwYkQlH0/PZn7/RHEnZWPStQhkE
 rB+v6FNHiIveaMvBcFsyPW8ZFBJZ/mUy4ln12ATditV/J4mGXIu5I5lomx5ra72r4coa2in3G6n
 YRxBAMx2exTubUSyCx52Z0UJvhFY3/jcbCLoafwUIcp0x0Hp/KGXtPJZbetHdqxVbwc8GIjAV1K
 HhMPnpZGzJSfnb3LUluEcsS2TQ0L3H+KV00TzZKrmPgmtxmMqRcaNAezSJeFRUbe2bd9k1Q45T0
 1LC570NOGREk3WjCKqahu9KQgUWL/RySMjh0YtKdt+MrccNm8ByNB/bWXzzzPGqPD9tzEp3PU8E
 K9Rn4dlzn/zwznlfwNzzH4UMuBXG27cXt95d2SY/kRdYAf2K1Bqjci9ogK61cKFKgkCHL12+5PA
 5PfFvR5pAlN2S4zI3gw==
X-Proofpoint-ORIG-GUID: wGMQkAvi6xWEAMIbqojCzf-k7YK0fKJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170184
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103563-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B46141DF1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 08:49:44PM +0530, Vishnu Reddy wrote:
> 
> On 4/14/2026 8:48 PM, Dmitry Baryshkov wrote:
> > On Tue, Apr 14, 2026 at 10:30:00AM +0530, Vishnu Reddy wrote:
> > > From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> > > 
> > > Add a helper function to allocate and register context bank (CB) device
> > > on the iris vpu bus. The function ID associated with the CB is specified
> > > from the platform data, allowing the bus dma_configure callback to apply
> > > correct stream ID mapping when device is registered.
> > > 
> > > Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> > > ---
> > >   drivers/media/platform/qcom/iris/iris_resources.c | 33 +++++++++++++++++++++++
> > >   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
> > >   2 files changed, 34 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> > > index 773f6548370a..a25e0f2e9d26 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_resources.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> > > @@ -6,6 +6,7 @@
> > >   #include <linux/clk.h>
> > >   #include <linux/devfreq.h>
> > >   #include <linux/interconnect.h>
> > > +#include <linux/iris_vpu_bus.h>
> > >   #include <linux/pm_domain.h>
> > >   #include <linux/pm_opp.h>
> > >   #include <linux/pm_runtime.h>
> > > @@ -141,3 +142,35 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
> > >   	return 0;
> > >   }
> > > +
> > > +static void iris_release_cb_dev(struct device *dev)
> > > +{
> > > +	kfree(dev);
> > > +}
> > > +
> > > +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id)
> > Please move into the bus code and make it generic enough.
> Do you suggest to add a wrapper to pass the varying inputs to the generic
> bus, something like this
> struct device* create_and_register_device(dma_mask, parent_dev, *release,
> dev_name,...)

Definitely not the release function. The devname is also not that
important. The rest, yes, you are correct.

> > > +{
> > > +	struct device *dev;
> > > +	int ret;
> > > +
> > > +	dev = kzalloc_obj(*dev);
> > > +	if (!dev)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	dev->release = iris_release_cb_dev;
> > > +	dev->bus = &iris_vpu_bus_type;
> > > +	dev->parent = core->dev;
> > > +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
> > > +	dev->dma_mask = &dev->coherent_dma_mask;
> > Would you also need to set the of_node? See
> > device_set_of_node_from_dev()
> 
> It might be needed for FastRPC as they are following sub node approach, Iris
> does not need.

Wouldn't it save you from passing it to of_dma_configure_id()?

> > > +
> > > +	dev_set_name(dev, "%s", name);
> > > +	dev_set_drvdata(dev, (void *)f_id);
> > > +
> > > +	ret = device_register(dev);
> > > +	if (ret) {
> > > +		put_device(dev);
> > > +		return ERR_PTR(ret);
> > > +	}
> > > +
> > > +	return dev;
> > > +}
> > > diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
> > > index 6bfbd2dc6db0..4a494627ff23 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_resources.h
> > > +++ b/drivers/media/platform/qcom/iris/iris_resources.h
> > > @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
> > >   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
> > >   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
> > >   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
> > > +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id);
> > >   #endif
> > > 
> > > -- 
> > > 2.34.1
> > > 

-- 
With best wishes
Dmitry

