Return-Path: <linux-arm-msm+bounces-112949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 48OzH20QLGrQKgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:58:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB23367A03E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:58:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IlgLuP5e;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d87xWlHX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112949-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112949-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27C40302ED5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2899936C9D5;
	Fri, 12 Jun 2026 13:56:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164B83644DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:56:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272590; cv=none; b=eMqDH1BU15avWNCzRE9GLaq7MHUNECyc7JQ5A2zhJlp2Yasl3Q2TE6OIGC5TWTmsaq2DI697/3KJi4GIVFas3a73N+X3tSLgp8iHpzrsXiSv9PTS5+7snfHk4xRIZqwNsdYQuKZxWy11bX7Y5SUQf884JmF7XNpAM5jOj1dQwGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272590; c=relaxed/simple;
	bh=MhfrCz/ETu0XHtGYH5FvULEzWeShS1i9c1nXgnlW71A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHRb7nqkwJDXZHQPPLSBPDl66sLIaHCRTq3izJT4N3rt0Pn9wn5Urk304ifG5tJQ7zOTI7CSHxr0ArumMBcmUqVrnjk2gGdbylvCMsKlCo3pxUco+9gM9cAmAKTwP1huTCMKEYGzG/1xHzNh/NCUP+tc2MVX6wVsdiT39wiuqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlgLuP5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d87xWlHX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj5On3716451
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lj9iP4K0GcPnNCW95XMo8tVN
	jOPr4RfYCBOREwlPyGg=; b=IlgLuP5epKG7Z5khBWGVWey9TcvkzndL34gn+BRL
	wbvqAp7hbNbX81s1YbPiX7vmpFIfJH+h7VAPVJq4p8ifKI3T5XT8RBMqYSMstXHS
	ZChjsp16KOYilHe2GvI93MdroXzY/O0MsPLRyw1uUu8BkyiSBOubv5PValHc2rCu
	aD30yxKF5QIbdvvvpgXVXFGP+Kb6MblChW4vCdglMMF8cogrY5+BgQ+BHTAvedsI
	e+QC6dyVvfIPdXUD0PWalBxRuJ1SMovpDQW7z3K5saTUUgq4JePSDhT1ohia1Dtx
	SQm2OOijXfcwoGbdikDVHlcXCHeKI1orwQMKGk7bPczKBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd3n7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:56:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157a31ac37so152822485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781272584; x=1781877384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lj9iP4K0GcPnNCW95XMo8tVNjOPr4RfYCBOREwlPyGg=;
        b=d87xWlHXqbWlLWRq6/dh+q3opbfryMpV7C7b4giHZChI5vUyX1bwbLoqZ9zcqwkKf8
         DZsukyh1IewkjOU8GrqzQW0cWMWWUdo63aqBM051WN/nXYkvpnNp6n2PtAtz5gAysu16
         ds2ZWqDdS0UkSyq+wgceXJhSl1t/S/lxAre6YOAbHmHV5aKll0hwtn3aRildktXpph0x
         O9eHIarYCBfn2xOP9XPmejFDfXJNBoXGXL9xbQ2aWw8wJepSRBsfAT4D5xhZ1DBB5+y+
         y8xW2TzCTpo8VO8AzqlPHeC5ibqsC9e7PoWzjiH3138H7JKFN7ZTB6iJnUKOdjyw3v4n
         VArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272584; x=1781877384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj9iP4K0GcPnNCW95XMo8tVNjOPr4RfYCBOREwlPyGg=;
        b=jHZDN//dIVmRx4Zl34EdMMNCAFs5Nx6tEMvRXZtb38YTQLYN0EiZS/oeQ98VcbAw39
         KyhH5Gcw18NP7o5RPhnnmy/niCrJcDrM49KpQAI6exNHlIkdYLEjdDOXh6BBUPpS/kpF
         AQ+UKcxQJPzpfR3pnQLxx8prZL1eHmT4mZlKdFML3T4H+fT3Bua/0vSVOvU5E2xbTfyK
         YSv32c1uZgwci/ga+LAyJzV+xrWRIDrDA6qlya/8NIWGGK43Vwoo2zVAypktnfUG0VvV
         ce5opGU4j4H7pIqGaajjQ5B5DPUFVIBmLIEdPqAoiUgxpVOaWNlMfLi4pZ9edgzOVRul
         KphA==
X-Forwarded-Encrypted: i=1; AFNElJ9cy+8CDOHrRI3n8mz+Cn6JUzUAgszXWQCKJPzCcNplnPFVLaUiWpSwf/YuRsb2ZqLq8hENmM6G26YFYtIT@vger.kernel.org
X-Gm-Message-State: AOJu0Yylm9oV7tQI3mPxPodNeCWY1SNBhepDg4rkFj6vf4tvNEguq/Gq
	IPGWdHIgz0K6OYODolMSrZMXITb6rOYRGUK3wmL872j3Iak9rdw/0vVy+H9LPaLMMSfK4QpK234
	T7puhXSbVJEVcXeq4FHRUF7dTfyvJ7VvTuY3//yTH5yyHs8p2Oe7rN92vRVV0r/1RF9of
X-Gm-Gg: Acq92OEJWIlaO5SkHRYvsznRHqRt5WR/0svjM4SUtTS6IwCOICaQcIOfJwh2GmF/eoG
	pN8XrzrVjbnLpYV/XB9gnapiZBu2HIqw5lJJPrn7che/zb+MPBKhFVeZq+g+Tupxnrv+qZYpzCc
	8zvF4Hv5G62mTcQpA/4Pc/7uEmTG+r6eGZQiAxFoqWNMY9S8xR6/HLZlDjXOSLhC3Ct0brlYQUw
	vvp7T/gsURw/zIY7DSbE4t2cXg3kjJwylz+AZ5Nv0Lx1YP0aRvLwT2BYtS7QRIIJJtWacSOfEbP
	hd2zh+zxaVuTaQ34OeWDHGX6L7JYccoEu9mYuOB5maLO3iSzjdgAG0C0msV8WvvYMkSf2MoHN2a
	R0Hht/Q1SeTDKDHLP/uJiH2UgacpTqGfg1LLty7ARuvTlbd+uzUiAhKS9FE6W/rw3GQAt6QJ0Zz
	b9AhTHd/M+GviHupWAV3XnSCRVdeX+5iPQ+As=
X-Received: by 2002:a05:620a:2411:10b0:915:75ba:179e with SMTP id af79cd13be357-9161bc9f023mr286845185a.30.1781272583868;
        Fri, 12 Jun 2026 06:56:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2411:10b0:915:75ba:179e with SMTP id af79cd13be357-9161bc9f023mr286837985a.30.1781272583368;
        Fri, 12 Jun 2026 06:56:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b4869sm563523e87.75.2026.06.12.06.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:56:22 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:56:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alex Hung <alex.hung@amd.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 2/8] drm/amd/display: use
 drmm_writeback_connector_init()
Message-ID: <kkfb5lvudgo3curnoakp3qre7pofaobaxynz7qhrn6jy2ll55f@clhfe664z5ci>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-2-42567b7c7af2@oss.qualcomm.com>
 <27db214f-b57b-45ab-8deb-da2aa8efb9d7@amd.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27db214f-b57b-45ab-8deb-da2aa8efb9d7@amd.com>
X-Proofpoint-ORIG-GUID: LVYrxOU6BCE5W0dd4quUV04dVF5W9g67
X-Proofpoint-GUID: LVYrxOU6BCE5W0dd4quUV04dVF5W9g67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyNyBTYWx0ZWRfX6xEThjAitAzC
 Zaw89+XTTdmcxEb0dcNqtfnysjlsak8dv7Ao+LmtnGZUTAc36kQ9scdQ/7fmbym3q9M1qifgAT/
 iJKSRpJ1Vs87DhY9tHCQAPTG3qNB01UG+IWqIKQNxuAvQdowpbyohSw8zRbkovrGp7i+QuQ+Y54
 wMMrubnPqKRUnMM7sTGprjPQxP0fp1OcwGkPMc3amcNJd8EiLF15e1w2DAM7GMsJrCgCQN8iNyh
 OX7iXgR/POJ50CXIsg8AA7j2bqTelMVYFLg0q67ElA0z6baMJlUBM70b0/4xy5Z+4EEStXmWSqA
 3ZLPkJ/4uge1RVOGZQsWb7jtG84ya55WNX6h/wpWP6t08dIngroj0JYUXbB5vq6TkA5dMJXxC3Q
 KXKgN9apB/knNus7f+jks5EkYoS0I/9BCPSxHZ8iQxcHTQaEkQM9hjY9PHanIepdTaWPvBRXOJT
 sey+bKhrswQSpSqIrgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyNyBTYWx0ZWRfX2JsCC5OuAcG5
 jDkurql8wIkcP2KTLUb/iTuI29fRR1QlE4SUaIgoQgmiLG1sgDOI5IF90jWI0LKW339Mj8v2eLm
 AXSH/PUHSXKZu9w7Rvn+6zjsjJVKsRs=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2c1009 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P-IC7800AAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=t-2y4xJzw7g1bk7x_BQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120127
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-112949-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex.hung@amd.com,m:jani.nikula@linux.intel.com,m:suraj.kandpal@intel.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:christophe.jaillet@wanadoo.fr,m:jesszhan0024@gmail.com,m:louis.chauvet@bootlin.com,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,
 m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email,bootlin.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,clhfe664z5ci:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB23367A03E

On Tue, May 26, 2026 at 12:46:30PM -0600, Alex Hung wrote:
> Will allocating wbcon with drmm_kzalloc before calling
> amdgpu_dm_wb_connector_init be more memory-safe as below?

Sorry, it took me a while. Yes, it seems to be a correct idea. I'll
implement it slightly differently.

> 
> 
> @@ -5790,7 +5791,8 @@ static int amdgpu_dm_initialize_drm_device(struct
> amdgpu_device *adev)
>  		link = dc_get_link_at_index(dm->dc, i);
> 
>  		if (link->connector_signal == SIGNAL_TYPE_VIRTUAL) {
> -			struct amdgpu_dm_wb_connector *wbcon = kzalloc_obj(*wbcon);
> +			struct amdgpu_dm_wb_connector *wbcon =
> +				drmm_kzalloc(adev_to_drm(adev), sizeof(*wbcon), GFP_KERNEL);
> 
>  			if (!wbcon) {
>  				drm_err(adev_to_drm(adev), "KMS: Failed to allocate writeback
> connector\n");
> @@ -5799,7 +5801,6 @@ static int amdgpu_dm_initialize_drm_device(struct
> amdgpu_device *adev)
> 
>  			if (amdgpu_dm_wb_connector_init(dm, wbcon, i)) {
>  				drm_err(adev_to_drm(adev), "KMS: Failed to initialize writeback
> connector\n");
> -				kfree(wbcon);
>  				continue;
>  			}
> 
> On 5/4/26 18:24, Dmitry Baryshkov wrote:
> > The driver uses drm_writeback_connector_init() instead of its drmm
> > counterpart, but it doesn't perform the job queue cleanup (neither
> > manually nor by calling drm_writeback_connector_cleanup()). On the
> > contrary, the drmm_writeback_connector_init() function ensures the
> > proper cleanup of the job queue.
> > 
> > Use drmm_plain_encoder_alloc() to allocate simple encoder and
> > drmm_writeback_connector_init() in order to initialize writeback
> > connector instance.
> > 
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
> >   2 files changed, 14 insertions(+), 6 deletions(-)

-- 
With best wishes
Dmitry

