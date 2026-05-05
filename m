Return-Path: <linux-arm-msm+bounces-105829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMSxGys5+Wm46wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 02:26:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 310194C5535
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 02:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B716530237D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 00:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB512765ED;
	Tue,  5 May 2026 00:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/BMwJAm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DaobUNtt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C1327AC57
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940758; cv=none; b=QqlAaoJCQmYW+FplEo6eYcLbL+xzfDGg51K/y3tZzJvLwI7A2JXOs++hIDvXqxlxuQcjn+BKZEC8aTXTj9awHUlHRegGxw2VN5uJwydKvYgpSP4vH8sjSgQI7vFm6UWX4yMjUW1aJ9nzRaq3am7foMEB+Sj0jO0yqJJ5o7kz3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940758; c=relaxed/simple;
	bh=mE50BYUB/UAw+zq2VOqPPalyAMn1gAB1RtsYcBWwgx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShobxIqLuXJ+/Xet0AhcqlQ2JBvOcfLcZFTO1qYHSLx76D1wUbPVCth4Za9kR0TMszI5hjVobuiLP7GHkG5M6V/G6NlnzixMQDmOfrc2pM7A9cIHApRxWR+C5zazipxKDQfOMlowLqeIH2i0JMmj7ykJZtO3CbdyYsiacbjJTGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/BMwJAm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DaobUNtt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644JVZiQ299537
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 00:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4rDxNdRWU+aebNlPWMdizg27R+flJppZJLNZrroSxs=; b=K/BMwJAm1EgVSC0H
	/UWzYKdQV25HgaWN1Q4EQV+EWf1k0+1xWKtDFu0zA4XvWIKudYzQPzuUMyMNQGAT
	B28V8AP0+tBOW+9QVWOsipLRjRxm3a3OOHIYdWUsjM7RrEN6icFVmBZlqz9bnUee
	SGuyVjqaJVXiVgWvpGkZjMOFORmoZCcOZGiulvf7/ucCdUjyDfC/SpaSFv0gl+Vw
	0lAH0nDaa2wXgyieqauqp379JNwrKjNkkXtDwWZQ/Fi3W10gc6+OLGx3+qDuWywT
	yuvZD8xlcTTl6hhjUq5xojyHScJ96s054cF4AlSBHDlJOk0wlG0itxB5Xyq05dcv
	e32h3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvnda6w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:25:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5102a9671c8so112465911cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940754; x=1778545554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4rDxNdRWU+aebNlPWMdizg27R+flJppZJLNZrroSxs=;
        b=DaobUNtt/u7aFeYm88NQRn0hPxGhLKLYw3Wog1CqKHuQG+Twkdy1Z1Y+Cl9oHp2MsD
         vpyDvBM1QnVI3m+tc4r6nVOg95V1hjqXSjp98LGUskSPpsYDDsevvTJgN0MTpDSaOxLw
         YfGbu+XnOIQ6UaZygVnA20bO+rZqqYaI1mRAtbl39+P9X3LH3aHAVOAModzszHM/bMe/
         gpQ78aja04rK1AfZgSiR4laSSIRj/2XGOH5/PkKitVOT3CM9cyxkZmiFxN/cQlKyZAM0
         6SZvxrjm7iPJ/NrhkqrcoyK+XHnK3LJ6zQc+ZtI60rjKepj8t15BYoMwecT6kvxbRzNp
         IkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940754; x=1778545554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y4rDxNdRWU+aebNlPWMdizg27R+flJppZJLNZrroSxs=;
        b=dzM46XfH99CPae+tVUN7sVpzvZQxo55jE2/MRZzIXBUJbnwdK3yOCxaGmthS+ia6Wn
         o2ymcF7eNAOtk3RPRJkWDR1pjY4NwVoI6u+csHg5bl5tC6LBOnbfytQzyz9HXEEw3lt8
         z8e/EBjW43IpwMORE26crePG/suHVTF7HVtbZxNlSz46BsUBjuK0YLpjZ1/llVGkWLkI
         lHeaCgokPKX8Yzmwqm8wWDOygwfeZ/FZZV0LuTP26Gb0Nb3XZqPKiDuw+mT1WlBwLdHo
         LcCQRU6c6PCm6HE8eS1nOjpQrxboL14Y9O31wsrATluFBFq4gbTcuaPjyFdEG1TAJj1Q
         EO7w==
X-Forwarded-Encrypted: i=1; AFNElJ+FuWnblW5lUJW9Pkq/f0pc7CU0fio14AJ+t6tSbhakaPCF3jEQdAjYW0oO0EHGg6Rqk1UGF87ai5VVZk2C@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/wZaBW56eWE1yRKLPSZ2blVA8vE7kj5b+qgAXAoMlSTuOqVF
	Zn+B89lstXxE50wQB+DKTPYbDWo6Hr6x4X1ttqUFUCS1Pmjto61HsfYVdBU1ShtdPTZSh85S8JJ
	kJyhReOD8Z+22h0BQF5UNHrkJHqKpHsvu7FzA7wkGBrvoICP89ksH8dAwt68sP8zAKV2j
X-Gm-Gg: AeBDiet5ISm7nzVO/S3RJDNkEMx67i8NNpDnC2c1SOTpvbu+oLhYdks7BhfDr8eEJr6
	2rhgYDNgrR7QVJcd4c23TK4t73Y721ptZNmok/NoPemVAxGsJv7PJNwD94Z1CxWDRienywih8+S
	fYOuTQcMj580WrFIpXSPSex/S0iSi5aUtMyV/ogi7gFxLjoRPAHXs6O6DkEt6sSncoKui5/3+yy
	0Mb/myyyKsMWIdMeBGNOKJP+8F7wYQFmtacrdoJ3hmDAgs47e33QFNHvFTDzZ3q+Z4kWfO088dt
	wlbvNde1/uoNiDkWqxE34SO/lOgcQfBrn4sef4KsFDHEJaTo2GoKBCB3RfW8YXTL/ww6JGTtWh8
	QLLotfbjyM5C5leE43t4FNYCLeH532wv582CR8IB/xcYHnYkgss+DuICxUtVKzDEz7q5wsOgdy6
	ES7igT04FQ6fG+fQYQBrfd8mKSWOKLIkfnZgQFVrtTitGqlA==
X-Received: by 2002:a05:622a:4c83:b0:50f:b4c0:62ff with SMTP id d75a77b69052e-5104bfa6b9amr166831281cf.54.1777940754481;
        Mon, 04 May 2026 17:25:54 -0700 (PDT)
X-Received: by 2002:a05:622a:4c83:b0:50f:b4c0:62ff with SMTP id d75a77b69052e-5104bfa6b9amr166830581cf.54.1777940753775;
        Mon, 04 May 2026 17:25:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 05 May 2026 03:25:05 +0300
Subject: [PATCH v5 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-wb-drop-encoder-v5-8-42567b7c7af2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mE50BYUB/UAw+zq2VOqPPalyAMn1gAB1RtsYcBWwgx8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp+TjcXTDEmBL/PifKO5n4u9XdLzRyirOofSZ0t
 R5jHaCLw4uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafk43AAKCRCLPIo+Aiko
 1fRrCACGOoHDQH4QaIwa/GwT9MrEbWmX7l37G0lci0xr/0cZZGn7Xbv1H5YVaHy6Jy26K8OsEKv
 S1oFOWhfiWWmPop4LiH2xFuCDz445YbGw5v9bxZiZXLtNlN205+VCu6A1bTdwk/tZAQTCwt/hxY
 IIExi09aX3uRiJsDHR829mUb96OKDFC+vddC2WLqFsb7j50M4INLuMHhJqKqEcywPNc7D7S/SK0
 1vtK25FJGIvjReowOwc6NBiilcdlB9HAjDCzR1ne8Jkg02DObvbQ3PEIOtNJFcQDRfdCBH8J3sN
 s1qv0znAaU8Hh2jKuzUPWrKL35p3EJV4cPleldHBAY1yYn0z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: OrJF_8TukoAs-aqIgpUfBWUcE5FRAAFO
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f93913 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=By2WwYRBACVvdXAjiroA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: OrJF_8TukoAs-aqIgpUfBWUcE5FRAAFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMiBTYWx0ZWRfX2tI3Hk/Xy8A2
 Dv05oRoaAPamrWsaU33XTwizSPZsx1qC3Zq2qT1zR021/75ISEPpQ6SDJq06tIBK/g6YRAStaby
 oxb/4zqp3RFPDwJ2zHHHtJlikNqGUvq6jYTWGX3v7AxYWrlS4Yh8S8FSCw9Owp45KxdNqquf8Jg
 I0kWTSOMGMb3lvlG0l8vFoLu7702RvxfHKiAvLjR11vA6OOb6MCuk/5jzA5rxt4Wg1t9AC8fDp7
 bV3sSfJmzki7fYNTCwOP0bi/A/0LMQeRanql6R1lcyRtlWXPyzi0jACNsmbLEEeYCtOMoIIKzfX
 0TCJJdsAexklxiiLhOgHY4CwvA1uyzo81ao4HcFHXV51r/qTD7dH25uiIq0gFQYLVP5j0USwboz
 JlrQs8buHWoQJ9IKwDPcaXMt9HbAfox602SRD455XclDf0h1VeS7+1zO+3jmk6QLrvRNr0RmrIW
 WFvMhdZkCWtPl1SVgzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050002
X-Rspamd-Queue-Id: 310194C5535
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105829-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,bootlin.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init().

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 14 +++++++-------
 include/drm/drm_writeback.h     | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 9fc15168c34f..68fdac745f42 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -235,7 +235,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 }
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
+ * drm_writeback_connector_init - Initialize a writeback connector with
  * a custom encoder
  *
  * @dev: DRM device
@@ -263,11 +263,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  *
  * Returns: 0 on success, or a negative error code
  */
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-					      struct drm_writeback_connector *wb_connector,
-					      struct drm_encoder *enc,
-					      const struct drm_connector_funcs *con_funcs,
-					      const u32 *formats, int n_formats)
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats)
 {
 	struct drm_connector *connector = &wb_connector->base;
 	int ret;
@@ -284,7 +284,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
+EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 879ca103320c..958466a05e60 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-				struct drm_writeback_connector *wb_connector,
-				struct drm_encoder *enc,
-				const struct drm_connector_funcs *con_funcs, const u32 *formats,
-				int n_formats);
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats);
 
 int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_writeback_connector *wb_connector,

-- 
2.47.3


