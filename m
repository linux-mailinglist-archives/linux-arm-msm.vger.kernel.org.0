Return-Path: <linux-arm-msm+bounces-103323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KYCGMAe4GkPcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:26:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE5A408EC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4131E31A7935
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 23:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADB63947BA;
	Wed, 15 Apr 2026 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPaBuvxP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7JIK8XW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5F738F954
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295381; cv=none; b=JGFbsD3n1AnNkfYDzZn54QgLbCSAA++ZmlroN9/lrmaElpCSQu0FAJKw0SEVDmRHKWTfb9PG3MWFlaMZZAdLdiIgYfSJQd8OJB1S2iM8lawPjtJy0jOwEvWffqi/dZuHchVJy8z3dUGLygpJTOrz/7EJ8+TeKru4i/Ij733FaZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295381; c=relaxed/simple;
	bh=SEN/GR0hrR1a9DBG9m1Xo1QGkgnSMHduOhSuiYVFnL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kvv7PJUKJNO7NFN+jRg4sBGBs7Pv0SI9Ia0FumS24h7nQOYNR1XPdOQzh/uCFf0VwlQAte/pQc0x7vTQtD+SQ39ZhRzbFn9y8uOJZWFJyjxbx8vfnAan6fj7Q7GFCHaKfBcuX6ELriF7j1zmfcnSQ456wUo+2eHYqJlqidaNT8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPaBuvxP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7JIK8XW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFR3RY1703935
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1TlTaPnDMsSjHelLBIYtNHmZZl9OCynI6YeLwhyIsxc=; b=bPaBuvxP/CTH3RFI
	DdDJB18yMTWJ5vbg2oW6dD6oPcLf8r3baGiH1RKX22NwrNJkhXudtwy2w14nHIQc
	IW+xHLBl+PAblH0/sNsPEZUK3kZWi5Pa0jb/bWtjdPNX9DMi/5zOm7YbUXklHcp0
	HczNEKwrvkLFURo9haQXFouBjQAq8h8/xqv7A+6cA7GX9GnnI1LL0tfqMvZrHe1A
	wir+iwaHENGIdo4dJisSlMUiu4F0H+twDs35X1K4H5NrOHhejFXbuooaVoXVXdTh
	+hjYzWVu1ocq7rUQIvj+O43EjHzj6Hslfljy3f/eYQuGCzyQnybAekIe/hwVP2QD
	xkgxlw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamhd23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89502dfd7b4so111785066d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 16:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295377; x=1776900177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TlTaPnDMsSjHelLBIYtNHmZZl9OCynI6YeLwhyIsxc=;
        b=E7JIK8XW2Z2WsJviWcxqe7pcEg8mo0KvWEsgacb0VRsi7XtE+Q95XqWT63ZyPTF8g2
         yPjOqsnJzthKVkoWqqe8oBwqhS6zoFYfUsXoQrBVFCPYljsQwu3cK2xE1aVP8qpNPY/B
         MTdU9LxJ1k8LjbZ6EOHo6YIWvP9TI+qlGhPXBnp/VE+v6ioAhKdYvkvV9N8oiJ2j9ZJO
         IwbvYxrNqE+ukIkPHbswVQ4cIdIJe/qG2I+NWJQ0S01oPXQfmy2c2j11CZbi18FGA2bb
         cQcpJ5dPZIannj1v3FSGodwhM2kS8RieJ/eX5ep3cITzKZ4VI/DAw7TDH5erqBteJHQV
         XJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295377; x=1776900177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TlTaPnDMsSjHelLBIYtNHmZZl9OCynI6YeLwhyIsxc=;
        b=Cr7I78fZ4OQJyqnI6tYlH8xlSk8AraIpuTbzz3dk2bWxHjRWCcRRsY713lb9xVvXVU
         R8OZbBw3cHhugqXCIHIz+MNBpjzTNwkp1WCqrSeYja81o6U3mVVpF35pk4s+PvuXOJv/
         1UGgXet3qQ1osmRIvyLikIQaRAVf4UcpE2D6TVRJDp59HzzIRAxubyatVaKtvALXbRQa
         ijqnwbolfDlJO9fBy46hxwS2zuISw0BFX4I+y/yh0EJJqVA2mi/9ZH0NXCBZvgHxYgcF
         F+73MJHdtvRn2HkHihr40Tq2sEuJe77arhfKfCHpnAlvOEVOp5iOenXnrrZTM4GYO59N
         u+Kg==
X-Forwarded-Encrypted: i=1; AFNElJ8L0u9m9SA1a8hmDMFjpk3ww+3yWn+/NZqV54H/4/MwysAEaSpJyEXhpRPSVAvXX3a2MJDIk+PSeArwM9Za@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw1mgbZ6UBb3g2AyPOhIncXRVFNDfs0KJfnws8+M5RVVpiEOq6
	51DSqK1OgfdJ7fhilRS3GoqnjkxGDdJsvv99yRPTUOcUB5/hZ3Ywoh8DMn1oaJFuLuI0sV4E010
	TOqseHc2rySJL8AmBRJR8oyeYWtfv4zf+zazQSFmOcE58FBo9fzeQm+ftPMJMxBoCbkyG
X-Gm-Gg: AeBDieuPU2yiUxYvAi4OXL8L3n6IQtrySryjmP9j9WmeJoEIU2D7CQpLX8nrPwso+eQ
	UuqAWYZjwx1To/T6K1dXgLeJwDnbmmQmA05kOiQOcd7F6fHbf7JOC7Y13xcCdpljWwgJcPlRfP9
	LvVhqS6hx6mwfUY8W58ElP3543ky0IijGEKMkoe2AQhlbJYx+R3J5htFoFCGqkI23Ct5NKanhuK
	LAZifGig5zLt1TOn6IHcH3e0SV6IYsUXH7A8eemyU7sfCaoxYQhXP04Hc3e+cOrycQTZoav2OwW
	jCq/d2VlfHaEtfQIi53t6yvd/VqdabXg7l4DlU9dc/9y895QN/wv5wIrOjq2vVQ4Up6dAzexJO8
	TyOOM1gGIX/+/DmJ+aBa+KNNWZzF2T/ORxI0jtSFjnRKz65MIlDHGRKGbrM03rkB6iyFCHzxsYz
	QUNtJ6dnCOmrUHxB6cRzYUyh64T3QKIPOBCVcRJKes7zizOQ==
X-Received: by 2002:a05:622a:13c9:b0:509:1590:f5b3 with SMTP id d75a77b69052e-50dd5bcdc20mr342487821cf.35.1776295376956;
        Wed, 15 Apr 2026 16:22:56 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:509:1590:f5b3 with SMTP id d75a77b69052e-50dd5bcdc20mr342487371cf.35.1776295376486;
        Wed, 15 Apr 2026 16:22:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:37 +0300
Subject: [PATCH 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SEN/GR0hrR1a9DBG9m1Xo1QGkgnSMHduOhSuiYVFnL8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B269bBlbJtFKVMj9cfKSjxyfAMo/avZojzn9
 1S4hJysf3GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAdugAKCRCLPIo+Aiko
 1WirCACLulVg6ZpKOCltCebHzmh/eMf3t3bLRta2jkwQIXM8sIkvuLAXeTER8cd0ZDj5c+cGKqt
 mUZIMEpnhLP5RxelE1DCRtytDCjOETI4dg6Pehe9ONh0k8ZP94zzn2aZZgG1tNW1iqFGdHkTLSX
 +Q183rOGj4kJV8ubUk9o/0bRMn1QgmeITH9IJBYHAiKFDogK2LrgZigISt4W7j2RyjDn7rP6CMZ
 2eB2RZhtQHZG9yfT1RptN+ZXG68VayMJq7tV44jasBlZP0lR5KPlwE14F+15fCMJ6GRO4YmuwW+
 PDBdXKXcOpw3cco8JkjI2YgI3hWMdCYFYFYelO5aQ09670Q6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: W4nGe70ghjVasvi2CxY9TCbPxKU94CbB
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e01dd1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: W4nGe70ghjVasvi2CxY9TCbPxKU94CbB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfXxuCe8a2ALRmF
 DreLzfeeJbwiM4xCf5xY+c+HLScmOf1MIIY5Q6DuqqWj3MwI7X4LdmP4Eq84LvSl+LpcZpJ19wV
 xwuujyMZNouHgT5RYYJA5k/QsUpXHeYUhfLBWG1nxIxBA9G7vgBX9xGiDuWF217NkVwskbxqacr
 dacgw2zpFPqGsrBRCeNXSxs8dPcuGCEQHcqVl7slWPLHrTi8v1+xWZsGvSiK72ysJabPHSLIayu
 BVOkRkUsFXbDV9dyEFFHKBpwPV3vmYtn3B3/SfwnRIfFHMgW/5UMynFQ/nnJ3jC3dOf2/+AnylI
 j6XdP631QxlgK55HMZOBDKhVHpf+YFqeYJ9DiHJJ06aYLuUhWBNnr74vHj9fqQ8jK2WB6BPmitQ
 gMJ++8dHn76QNb/xkXq9NKUO4fNVcObXAFxqhzURX5TDP32370Ef/P46RTKbmuMMo/3fepUSphQ
 EV84pSceFGfH26XTYmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103323-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCE5A408EC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ca749fde49bd..328ba92e1b44 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -299,10 +299,11 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_with_irq(&port->bridge->dev,
+						   port->hpd_state ?
+						   connector_status_connected :
+						   connector_status_disconnected,
+						   port->hpd_irq);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3


