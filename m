Return-Path: <linux-arm-msm+bounces-103747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EIuJqAa5mkprgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:22:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A942A9F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25B15302DE07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292BF39A045;
	Mon, 20 Apr 2026 12:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFm2CzEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhJdoZSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1044739C01C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776687749; cv=none; b=dbVZHdYRdYPR9r6WlYQznGyulLCnTz1ND9bBJEkaK9WpErwTamATmNPFbx36YmHMxycz5BSVOZhYWkcn2WpNVY/LCLcckMigY5gab6ufc9EcO1+Anr8siNKK35l37a6D7engpTl5hbRmd4M/pQNAHqGXF/o3m+CyIXAhbA5rIuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776687749; c=relaxed/simple;
	bh=JvKAl/VQcOEJRVKgCG5FcJaKEtHpQdTDs0Ik6qpcA34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FggfM7/9K1DCNpZD46mYX0+1PDj8PHJ94wbFCvC5kdLVFCnI5xqda+aWkTxU/83LCAejvmia45/QtZERuIHBCgTUsZF+FzOgdpeDe9diX1cZqpjCKTo9jqc7JvEeK0tLsAJi0T6uR40OX3FzjvioK8pQIiwBiGCp7i7W4/IGgV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFm2CzEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhJdoZSe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBKJDj3212158
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d9qLWgpjbDnzk8XgHlDYIL/w
	cQIT1V1yN9ePl+7ekJQ=; b=pFm2CzEjU67veNp4ikkvqwTF3+41XmtO15IKPDro
	NDY6++5+hzKyTPyeSnqoMG0t56qJEqBLOqdCmtrjICL/OtPyWY+qKxdN+teD3Wjf
	lj24IRTlTRxPcu0JV+dMxkw6i+5R4QR3ToAYbfw3LGa9AjG2KArIojx+rF5f8Aj9
	PSl2zHEqjq4XmKubM/jFEr6AavEmg6UquQnm+6Dnh71icpvlTYrgVTw8XCgyisc4
	jAgr6KJoWrfRqdB4N4HJsGycvk0sp8stpRMKZY/9k/pvM0WstD4f8V9evEq1/0gC
	c2Gpgil84noEkTDnWqwIHV3EwAPvsNHz7KvYOVNHpcwl0Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfhc9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:22:25 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-953f37beed9so3206084241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776687745; x=1777292545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9qLWgpjbDnzk8XgHlDYIL/wcQIT1V1yN9ePl+7ekJQ=;
        b=GhJdoZSe8CRb9qfoOMzVTfZn4aQBb7b4YXFxE5m4isH/cRM9m6gXV8C2Qx0nR1/Ve9
         +c0bi2ncU1Y3kOlnHrSYnDh9Mrk+Cjq9ZEtRj8+hMeVCpaDjbqI8Y5FxT2j5bIE8c78y
         JnTaPSZNSR7nGMTbvt7naUDzqPKctmIWLxnpHI4UZNLhnS2/C2dK1FR2miWEmVkpyBum
         tu3PSZs7se5gHwrkst3vxsKC2XW8IEG2xaAxyVW4sUDCjSNTeS0OyFUsdshXuIdLmtUh
         fuHwloh+P9tYQW9A9eEHxsQViTa1ojOLnrPBFUYg7Btqdur/GzqX79nmYIlPbFJe4+S2
         +a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776687745; x=1777292545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9qLWgpjbDnzk8XgHlDYIL/wcQIT1V1yN9ePl+7ekJQ=;
        b=nwkDK5Lz4J4vv7sbPOGCYRvZTZw4ltDa5thztxS64pgsRVxe9OCs8ePEOwrl784Vtd
         51Bl0/3/Mf4VeA5l4wJPl7tUG75rlMWYfeavL/fF79dOutsiibACQg8VhNAhXFzwDkPK
         YpMKWx3TnIFdU/wGK4q/5mutSagaY685hKVS81bkMTIJEBMc0qln/jPR0Yv7mvIxwj0a
         o/ohOe11wQac4g2GCoTKfg/njgSlwgWmOt4dAshCn6i4R8/vmRgsw4Xy3y0FKN7KW2HH
         jZlfYmNAf/9bwXRMYkrF23enOtNCj30kbNWzIGP9LYeMvn1hAIc15pOfs6Y/G0u66Xh6
         decg==
X-Forwarded-Encrypted: i=1; AFNElJ9Wm/X170pH8CAooelCqQnN6LhJ2M+rLsIRimL2cWrj0zvyjmZ78QCxFJbz1NpIraO4rTZocs3Cj1vLeyhD@vger.kernel.org
X-Gm-Message-State: AOJu0YzcWCBAgi9c25vLd4LNkuYrO1HUeKzhtk5/KP6J1zNwfkFDESzY
	uhMZWWwt7PtYVEdtENApQjEga5StiYGGKQD9e5cc+KUEAYlqU9cHH3YdEuOUiq6hYjDH0kAFcGP
	Z/b7bn04NWDL94LXsJFHQUVs/HCLgW01C7s7+2pq/oECQpN2ZznuKUjXofNxGt7ZA9ySP
X-Gm-Gg: AeBDiesbJjLuwqTenchnh02o6Tw6V5S652AGzNg2JgpT3RL4p2RvE9RVLA8kllzZ7/r
	bHyEH9SAakufUpPoJuWPE5MCDQygBLfp+8C8Cr7WUyrfzSxPwAaqO1FYw5RrfPlaisW+LEqFkmf
	C+GJZ/U7gPYoAQrtJL+DtBgasKnYl269X2NXWpDgitff6QRchRmF+XaZg9cgFVrisAw9TaqcGoi
	g0dveFq99/SLiCUy7wG8keRJakBQ/YaC7VugV/bEW/86NLsGQXDBelAcuIJf3NZHIXLbfm4IOcI
	Em82KqTPml8wl9HEauS3gl15ZS5Lpb0wvSeJOv75LIhkPXCDf6yvaXw9OP7sE6YirxmLhHP8yj4
	JcsuTGT3bywYOCK2rUaIutaZWPH/8zBM2xEOQAO+ql/xFje3tPLMxoKXvLS7cP33frtvdzkaSUn
	Y8dd6IzXGEABZM0N4oxDt4+VzqKxdFfohz+ioWSeaIcJIs7w==
X-Received: by 2002:a05:6102:605b:b0:607:7991:8edd with SMTP id ada2fe7eead31-616f69cf898mr5180323137.19.1776687745098;
        Mon, 20 Apr 2026 05:22:25 -0700 (PDT)
X-Received: by 2002:a05:6102:605b:b0:607:7991:8edd with SMTP id ada2fe7eead31-616f69cf898mr5180299137.19.1776687744603;
        Mon, 20 Apr 2026 05:22:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f07b3sm25155421fa.22.2026.04.20.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:22:23 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:22:21 +0300
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
Message-ID: <ugeikq47wb2b4vnowp3lyjmp3utyq533qczf2y3uc5dtjo7gpa@v7vclmntisob>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
 <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
 <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
 <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
 <3vrqk67oivkgo26xdc3r774rvj3jn3t6sfydhlytyrfiftubhg@cipain7xxcjz>
 <f74ecd0a-3ff3-45b4-935e-44b89cd0c92d@ideasonboard.com>
 <v7h3a5pwx32dfcumc3diysylja6lhkhobyzemfthb6dsadcxnp@2kkidnsgov4e>
 <ac330f76-24dc-4f6b-aeaf-69176eb41298@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac330f76-24dc-4f6b-aeaf-69176eb41298@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMSBTYWx0ZWRfXw3685mL3+xXy
 CEtI9m+fygJPx1QfeeQXsrCijHJsYj237OMmctNoRNyDujIVMfAqDISj2CoXIT1uAYWM0kCyvU2
 k+H42TmqCnPOA6fUdOJcvPnMzmX3OIZBGuANXp0HacKRFUGB72hLUXX+8ztk52cYvNK+CZtNr2N
 IoSIOtgROfdAOLHO913ZuhWiutEgIwLXIlWoElN3rpAdbgnUGJeIDv3RvvOkqb/yJ3azqFROp6D
 swYhWKqkSEwJnO5thPvuJ8jiE3pWQHAL3B0qRFdnX5ZWDPdRIhzL3qFRfDNKzfFNVUdoAORycXL
 Fxt6Ob0WEAayUiXObWCkhjOwa0e074Auy1IDms9HxA6XofE/eUtABlFTbfgm6+If1o6+JC6xVXN
 U5TVgHy2ObgKnZ6kgnmZEBz0mzDEwvOt9hqhdpCK29JCRw7T5PCyFbOeF5nXRx9Gvu7otN5R3ke
 xQpYp0jAk7vRCGSh9ZQ==
X-Proofpoint-ORIG-GUID: tKthafuqoniXK8SZ3IDzTuL_uArACuXZ
X-Proofpoint-GUID: tKthafuqoniXK8SZ3IDzTuL_uArACuXZ
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e61a81 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=NVKd20UARjXkfPC9qNsA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200121
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
	TAGGED_FROM(0.00)[bounces-103747-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.infradead.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,infradead.org:url,infradead.org:email];
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
X-Rspamd-Queue-Id: 0C3A942A9F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 02:51:49PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/04/2026 14:45, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 02:01:57PM +0300, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 20/04/2026 12:50, Dmitry Baryshkov wrote:
> > > > On Mon, Apr 20, 2026 at 07:50:46AM +0300, Tomi Valkeinen wrote:
> > > > > Hi,
> > > > > 
> > > > > On 18/04/2026 01:32, Dmitry Baryshkov wrote:
> > > > > > On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On 16/04/2026 02:22, Dmitry Baryshkov wrote:
> > > > > > > > The DisplayPort standard defines a special kind of events called IRQ.
> > > > > > > > These events are used to notify DP Source about the events on the Sink
> > > > > > > > side. It is extremely important for DP MST handling, where the MST
> > > > > > > > events are reported through this IRQ.
> > > > > > > > 
> > > > > > > > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > > > > > > > events are ported through the bits in the AltMode VDOs.
> > > > > > > > 
> > > > > > > > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > > > > > > > events to the DisplayPort Sink drivers.
> > > > > > > > 
> > > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >      drivers/gpu/drm/drm_connector.c          |  4 +++-
> > > > > > > >      drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
> > > > > > > >      include/drm/drm_connector.h              |  3 ++-
> > > > > > > >      3 files changed, 13 insertions(+), 6 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > > > > > index 47dc53c4a738..5fdacbd84bd7 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > > > > > @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > > > > > >       * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > > > > > > >       * @connector_fwnode: fwnode_handle to report the event on
> > > > > > > >       * @status: hot plug detect logical state
> > > > > > > > + * @irq_hpd: HPD pulse detected
> > > > > > > >       *
> > > > > > > >       * On some hardware a hotplug event notification may come from outside the display
> > > > > > > >       * driver / device. An example of this is some USB Type-C setups where the hardware
> > > > > > > > @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > > > > > >       * a drm_connector reference through calling drm_connector_find_by_fwnode().
> > > > > > > >       */
> > > > > > > >      void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > > > > > > > -				     enum drm_connector_status status)
> > > > > > > > +				     enum drm_connector_status status,
> > > > > > > > +				     bool irq_hpd)
> > > > > > > I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
> > > > > > > with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
> > > > > > > 
> > > > > > > Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
> > > > > > > If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
> > > > > > > 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
> > > > > > > for both short and long ones (although in the kernel doc you just write "HPD
> > > > > > > pulse")... The kernel doc could be expanded a bit to make it clear what this
> > > > > > > flag indicates.
> > > > > > 
> > > > > > I attempted to stay away from defining a DP-specific flag, keeping it
> > > > > > generic enough. HDMI is pretty close (IMO) to requiring separate flag in
> > > > > 
> > > > > If it's not specifically the DP IRQ HPD, then we need to define what it
> > > > > means. I tried to think what it would mean with HDMI, but I didn't come up
> > > > > with anything.
> > > > 
> > > > I might be mistaken, but I had someting like HEAC HPD / EDID status
> > > > changes in mind (or HDCP-triggered HPD status changes). But here I
> > > > admit, I hadn't checked if it is actually applicable or not.
> > > 
> > > Possibly, I'm not familiar with those.
> > > 
> > > > Anyway, for e.g. DVI or VGA that means nothing. But, my point really is
> > > > to abstain from defining someting as DP-only in the top-level API.
> > > 
> > > I'm fine with that, but then it really has to be defined =).
> > > 
> > > > > > Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
> > > > > > in the VDO rather than a pulse.
> > > > > > 
> > > > > > Anyway, if irq_hpd doesn't sound precise enough, what about "bool
> > > > > > extra_irq"? This would convey that this is the extra hpd-related IRQ,
> > > > > > but it would also be obvious that it's not related to the HPD pin
> > > > > > itself.
> > > > > We'd still need to define what exactly it means. I think it might be better
> > > > > to just define it as the DP IRQ HPD, as then the meaning is clear.
> > > > > 
> > > > > Also, would an enum flags parameter be better than a bool parameter?
> > > > 
> > > > Maybe not enum, but u32 param. Then it can become:
> > > > 
> > > > @extra_status: additional type-specific information provided by the sink
> > > > without changing the HPD state
> > > > 
> > > > void drm_connector_oob_hotplug_event(..., u32 extra_status);
> > > > 
> > > > /* DP short HPD pulse or corresponding AltMode flag */
> > > > #define DRM_CONNECTOR_OOB_DP_IRQ_HPD BIT(0)
> > > > /* DP long HPD pulse, debounced XXX: do we need this? */
> > > > #define DRM_CONNECTOR_OOB_DP_REPLUG BIT(1)
> > > 
> > > Why is u32 better than enum? So that we could e.g. pass short values inside
> > > the extra_status?
> > 
> > No, my thought was to be able to define values specific to the
> > particular connector types and to be able to combine those values.
> > 
> > After sending the email I started thinking about the bridged and
> > corresponding notifications. There having overlapping values will not
> > work becasue bridges in the chanin don't easily know the final connector
> > type.
> 
> An enum can have overlapping values. I don't think there's much difference
> between u32 and an enum in C. I just like enum because 1) it groups the
> possible values in the header file, and 2) the function parameters can use
> the enum type, making it obvious what flags you are supposed to use there.
> 
> > I think you are correct here, it should be the enum. With the first
> > iteration defined as:
> > 
> > /**
> >   * enum drm_connector_status_extra - additional events sent by the sink
> >   * together or in replacement of the HPD status changes
> >   /
> > enum drm_connector_status_extra {
> >    /**
> >     * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
> >     * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
> >     */
> >    DRM_CONNECTOR_DP_IRQ_HPD = BIT(0),
> > };
> > 
> > /**
> >    * @extra_status: additional information provided by the sink without
> >    * changing the HPD state (or in addition to such a change). It is an
> >    * OR of the values defined in the drm_connector_status_extra enum.
> >    */
> > void drm_connector_oob_hotplug_event(..., u32 extra_status);
> 
> Looks good to me, except I'd use "enum drm_connector_status_extra" instead
> of u32 there in the function parameters.

I had bad feelings about passing OR or enum values as an enum value.
But then... I don't see values to OR. All expected events come one by
one. Let's drop that part too. Thanks for your comments!

> 
>  Tomi
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
With best wishes
Dmitry

