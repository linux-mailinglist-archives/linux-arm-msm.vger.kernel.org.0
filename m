Return-Path: <linux-arm-msm+bounces-105823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FgBHzM5+Wm46wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 02:26:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E93AB4C553E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 02:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24BEC301DCCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 00:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD9578F26;
	Tue,  5 May 2026 00:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6xjJCq/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKZwy5cQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9A723507C
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 00:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940722; cv=none; b=IEzIdNSCUTgqRL8XqyeLLxrfOf23tgHkZ9SLaxCO2VepHokEL907u+4dLvqJFaVcRGp1uThARxDkMAAVLcOV8c/Tee+uTNk+mjA0bmsXmoX8xp8dPXzzbLOyqsq9V1oTmrutrk6uMdgQ6chFJLdjA+gLJbRZY40crRU2R7x2cg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940722; c=relaxed/simple;
	bh=VXYhbpIFMk+a+YB6jZYpq3ZZlit2Dn3QcOteP6AnmKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbf/P69Zpgo7LmLHa10lfWE8qICiTC1BXAvoALxv0I+Qu+uVvZY9TwIxnh25JBH+MWMgWz5tf3OTILCENxptmTlXiYcsCv3QYMkrs6sXJW+y8zIfV2jJHwafxGygWAuNnmNQH9rfk8oPNHrVWUHuetSVCQhK46vjhjIMgk+PdCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6xjJCq/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKZwy5cQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644KomQK1961285
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 00:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7lYNft/WMRlNnP4xWSfKA/IuNz2ut4KJmCGdJbOpww=; b=a6xjJCq/WGW1/FEM
	AdOoV8K8FXhR0RZB/vBwjxGX0g2ifoQWb9yrZiO0XgSWdU1NCoiOPoFvScJr5hpF
	ITM67h3/DDvA2kacUeU42bEvricMPNX5rNHpf7jA6kKAIxz0yRwwgRmABn8SjP7u
	YdVqXttMYNs1ODYuZ+L9abxvXvE8vie99PuFh7IKpGrFfNiyYgG9ZyxdR3YV7EQV
	tnX1vY021ex1AcqzTIlJ/+kyJk5c5HiOZwVAUTspB5oK3kLXGndx7gKef/K9wAqO
	9dIxCh6h/H5vw6Mbg59JY1rj7i0X2vFQPRfeQrK4ypYDK3jGJAVxT5rQbkQKtd/K
	vdI6YQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5dt14h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:25:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so116327451cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940719; x=1778545519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7lYNft/WMRlNnP4xWSfKA/IuNz2ut4KJmCGdJbOpww=;
        b=UKZwy5cQUrL8+6Ey1cgiMJVAvJ8JaxcS5ORjlbEKjGnhWoszIGQQ7CKUD14FYc4HEu
         aD2DJXNIUvv0c3eq0bpzSX+aMAZnOCQGixiIsjfRT/A1hGkaDVMqhgaYresf8RrSyirW
         dRa2ixhpQs0k7STCwQ4fb+JC6ZWU1rjjtG3VEIEj15+Y70f0cG4AVak39xEPA+CNqU42
         eaqh5Hc5wjSRJbBnDNp1saToSeEC+9lTtUpQ2vUsPn+3R3h0DBzV+5ZheNY/hSfLzlUs
         oeP7BdwuCvuQxaPr8Yv9rwdESj+0LBemRlosNjKSWSzpei1ECwdZnU9370i1kt1VT3I5
         ocnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940719; x=1778545519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7lYNft/WMRlNnP4xWSfKA/IuNz2ut4KJmCGdJbOpww=;
        b=RR6h/5po41U9n+cYVRA97OCNeD83Lh3C8Amc0/6AzdfxPiYHJu+8RNlOeET9VkAVHt
         z3mNXtKChq476IMjW5U4A5agT7sJvxPx9zg2nq+Ib8LG0B6tGkozTLMsDYGD7ptKmOzg
         DPiWAEFGKFTzr6LyTDnspSG3eauoYl9WG1+qhll9AKuhk0Vg8M3ZrcaX8xyx7MldY88E
         Yxv8cO1AFbT5oa8ALC2atE02PzcjeWg2IBPnNsvb3VAWR+89PUOKciZ2BJimNc87enDc
         WRPGGGaB2OnDfpfMNweusmAdx4Ha3j+AjvJZCrQudJPJYkLPdZ8H7hySHJVTX01MIWH+
         XRzw==
X-Forwarded-Encrypted: i=1; AFNElJ+jug9pNn8UM/3UoXEdDkyuCD5SfwtAHjbGlWmWc+il6OrUSA4RB0SNlnMekkccb5RbXyQwwNuM19iG72mQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwyfyGbi2AgQTvwT/KEZVMqCTOdf5CnYZVyrupXFcDLPS4I8AN2
	7nVHqBI1F4PVs88oZ0uh8otz921hB+/sccQWx4S/6xnPTGVRju5aLMHN1JXKLpl6IIyDAu4Ckp3
	qWlYvW1u7LQ1WFLQgKvM59KjYmw59SajkjT1F2sIiTytL7ky0++uJR0qy1qpPnE09K1tB
X-Gm-Gg: AeBDieu46VmbBAqCoOt9tVIZvfTlgxHNJBNxsHyoAufnDLYM8t5Q4UzoozWJeZH/20i
	tjZcd1OJcZP0ByLtTWLQf/SkavjF3aUWoeecmdwE1tkMov9Y56Zbxazqpg8n8XdebC0lghXwEC5
	fd8SUdKN2ooiu7FDqSNlPK2FdYaiwO/wnLuVU5nhUNZ3S+rRKMfy+gJiTKeXgsg04JdgCmiy0v0
	svtcEQDrXGaySNF+hht/G+PaWiSqfTXrKeFpVw0HCKQUB+zySfQ9H0dkUVpQS/TfA0LaFmbaasi
	7bMn/zb7SeT/zbtzUFor1spiB11fLYu6TQ2lXbUNWZjde3r3AE4TGhxSFxBRIj0K8n9uknO3XK1
	KA3F/ZiZqz92yMAwsXaaPlCI4zIWuVOA6hnFXHcWJvFGkblY/5NJT85H1vrFOhPZ7Nb6H2WZBDk
	gL+C4n/6OgjEm591CzpBOEFiaRkTKB5UycrCcb6nuFi/g5mQ==
X-Received: by 2002:a05:622a:418d:b0:50d:8172:714d with SMTP id d75a77b69052e-5104be0ecb3mr192101371cf.13.1777940719375;
        Mon, 04 May 2026 17:25:19 -0700 (PDT)
X-Received: by 2002:a05:622a:418d:b0:50d:8172:714d with SMTP id d75a77b69052e-5104be0ecb3mr192101041cf.13.1777940718915;
        Mon, 04 May 2026 17:25:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 05 May 2026 03:24:59 +0300
Subject: [PATCH v5 2/8] drm/amd/display: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-wb-drop-encoder-v5-2-42567b7c7af2@oss.qualcomm.com>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
In-Reply-To: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VXYhbpIFMk+a+YB6jZYpq3ZZlit2Dn3QcOteP6AnmKk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp+TjbsYlM9JoBmtnVDGJmGqEqnq7lq33TSJtIg
 fTudvo5ePyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafk42wAKCRCLPIo+Aiko
 1QxTB/9Aa3eYPFv5Q5FBjOoEneEfa9E7vysKWQgDGcnuDOOIME+jIw5me0iDQ1TEa/4WOWWmwPI
 NHwxxo/GLd7CVVbYW8Y4rWuxFvlKoiiDI2OXKKOBSQbwdPcvSzKBSlRWUQh7sPliGuqZyb7nGFN
 igTh5bAOSsXDN5dINbSbqKQxg+p6LAx+9RvNaftKq77283JdnlFC6mzlZLAmyLWlPyjH6Nc3vu5
 6ej7HjsjMluWP5p2fqZxHuQSKKsEc3gTMKc7daHdFY3MlXj/UdzgBa19tQGge9K9imb5ta9xdp9
 Owf5c4Sf2/QkVE7onaa0l/6vZ/VxAnTo7WfujqfsdQ0ofKOh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMSBTYWx0ZWRfX5VeEMgVvKRM9
 B+ytDn1QcWCRNLw3gOUnsJNgHGJxf3c/3bksoQRU3usIwsz5UcmE4ploIc6Cdm9XOproVd3tEWw
 lAtnQuDvwea3uKAy/GYLqTkVXosYGKCCuYOlihQK1hNEYfkJiI8LD22u5C66eVGhGWttXPHSaDH
 gjP7zRFLbbYMWhAw2sIWpZD28onjvmaxDJ9JA/8+kVyGoEuE68RRfl1yB6qBsNKNuVBFAIdUEri
 gmg/C/Ly2O9Xnz0Y0S/Ua5OhMbR0hSo/iN1+55/Q3w2tSU+LVw0tyvWrKddj/bvX3n2no4eWS1X
 SnywNclASpvxD6/ZiuUUbxVTMactpamVOEBbnYZmu3ghqrvauTtWZf4IhvJ7n/eSbpdQzr+QvyB
 zohde9cGifXcxEDYG3qr2FyV1AIrJw4UIJhBfl2/vPo6D96Mk+VbzGlW37ccxOXr+9AtIe+E3BF
 PZ87cndAlJ9gb8kDHOg==
X-Proofpoint-GUID: 14zpdOLziHUthu-FjetsEdVkCl5EgWF-
X-Proofpoint-ORIG-GUID: 14zpdOLziHUthu-FjetsEdVkCl5EgWF-
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f938f0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P-IC7800AAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=M-qvw7r3wQx8XY5Jx90A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050001
X-Rspamd-Queue-Id: E93AB4C553E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105823-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The driver uses drm_writeback_connector_init() instead of its drmm
counterpart, but it doesn't perform the job queue cleanup (neither
manually nor by calling drm_writeback_connector_cleanup()). On the
contrary, the drmm_writeback_connector_init() function ensures the
proper cleanup of the job queue.

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e96a12ff2d31..2ac64495cdb7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10683,7 +10683,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index 110f0173eee6..fdc3da40452f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -169,7 +169,6 @@ static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs =
 
 static const struct drm_connector_funcs amdgpu_dm_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = amdgpu_dm_connector_funcs_reset,
 	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -188,17 +187,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 	struct dc *dc = dm->dc;
 	struct dc_link *link = dc_get_link_at_index(dc, link_index);
 	int res = 0;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
 
 	wbcon->link = link;
 
 	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
 					    &amdgpu_dm_wb_connector_funcs,
-					    &amdgpu_dm_wb_encoder_helper_funcs,
+					    encoder,
 					    amdgpu_dm_wb_formats,
-					    ARRAY_SIZE(amdgpu_dm_wb_formats),
-					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
+					    ARRAY_SIZE(amdgpu_dm_wb_formats));
 
 	if (res)
 		return res;

-- 
2.47.3


