Return-Path: <linux-arm-msm+bounces-107424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KLUAzDEBGqbNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:34:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A921539042
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E123B30923B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB51C3AB298;
	Wed, 13 May 2026 18:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adOOFUnq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCPu2xKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEBE3A7D63
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696648; cv=none; b=HoJh4xEvo7eXQjgNHSmYQP4Ku5birXeq1l5FFUz1gCc8l1MbT0Kbk6njdPugNtd0jZ8BZo1NhSlC2HujdOYNEjdhpA1SxwTLn7lxHbaYAXTxhKdCi/ap2RpVtgPhcNFeLgH0/+n30j5Bxed+5joLVJtUT1yh4ZXQaRPndWoX0/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696648; c=relaxed/simple;
	bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCsbzmy8dWczeACoGeuHlI5IpXpVscfuEKHyFENTJl68zCcOKpMFX8JiPCHmAGXI8Ct+EEez45f0l8Gf76jSv+vM3mVtLgpoLAmkM+8hDa6Vl0X035rjZqBpcREfMoAUi9f8aFrzD7oRXAC4UPnjdf0ioVVOnmmojYJjHBAOV34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adOOFUnq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCPu2xKN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuR0Y3995869
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=adOOFUnqD/cK+eQt
	lzJ7pMMU0fq91KwakaSBkYOagBIE6/8cH83nWlAgh3JSK+ZkPY4lAYueqom0Oa9f
	wc0pEl0e0UaS0c+Kynn1xjQhLjmV7cdGToDW1gWuSiqaiuWP4AmvLFddcO31vAPI
	WxptBTOrewx+2AHw1RuIc5ZHyq9RjarZWhCQo7wYpRN/X2Jy3TUYWOAnur1+AhRP
	8/4VE+NdttnJicMKGweDNaMHGF0o0bkdvpC0g0eExp34w0X2Tt7qclAjhSXjw2ih
	g1GEQyi5cDWpRFm3VROExFq1gsIisJCw1lhQn4ZCAxW+/hJapsL2ANbARxN8JZyS
	XyYgDA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8urb5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:24:03 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-956732444ffso11880111241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696643; x=1779301443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=HCPu2xKNWJ9IPYbM75BkKzhrkJXBIsoo6T8CFyDLOmQqagEjGUXRXnnW1fdKpeHOKq
         3Rwp8EX4d1vYUMQYul+ZKPCju5i05qhAmiIPzSqrJoUgU4cZcVDuYnvA/K881gw+i4Jv
         KQYil+CRivt7yN24v6QPpEw56izlvamaypXlH/suJ2bVX3dnc0ribW0gbd1s8copBuQe
         d0E2vaVMeu5wUfjvmHX1bhzn8On2NYx3GqQlATkUr1052AG0teYVyW1821i+avyOHnmk
         TGyV8uZg/z/klpHI84aap2i1i0hmgGv3zV4IEO9bh+emwTxKEVYIxUU4gHifQxEnrPxQ
         FNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696643; x=1779301443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=UXlGoBpZ7zvvczWZ+SMBqvLGZvT2Vqjbm5tJxEJcQCxNJoofA6g5aLO0ATyr3FW2MY
         lv2TdoEvBWXmAXDhRco7WJGWPvf6AGynMKh1mYdh2MWMkstoHFkDyzCMzajGzKxrWyto
         pwyKpt5gM0I9NnKfvt7K+YAAQrAKqfaE+TXdChn5LxWcvNSaLB0Dk4Iy8zCiI0zjylQY
         jM0TQycQl8/3zeAeextWOEIvQ5YKWyCKesymieGz5GRNTnwqw/sHklOvnDRJx8xXAmUS
         O/qiL23hn8h0QwmgKIvmVKX4kTMC1OP93o0MYNMTepcLsa0LDYBbMm42KZyLyexpmTvL
         vSZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iJybb2K4OQNhz6HCYKCQ0K/HIN6mxKpRs+8cRHB2OP48n96C4YKLGjaAwEBtGsE9teMVEcYfvMXrTBg4I@vger.kernel.org
X-Gm-Message-State: AOJu0YxSe3RSZsapwIgF8TOLmGMukFNUjQmiQxHQMZ+L73HBZIF7smV9
	g4M3vWkRTl25jPVEPy2S9ZFNh8rFIRfk+cSXWe7fwf9iXk0YyP0g2w78rxlQRjP54+59JUQk9m1
	vfTtE9FUmUtGRMBLz0Zz/eNVxtuqCa0gSYf/Bm3i+cB2s8+6u6zihITlh//cMAVJFqAhm
X-Gm-Gg: Acq92OGQkAr/LK33IJXz6YGgDHo44vUbfCQvJMG8xQ7n2em3OxFt1MD9Jsd/PV3Mpe1
	tYSkFGOkQArnr0DpPPWzyrcfoK/1zdqy8vaCXIGeWffRbplY76+Bge8lUBKx0JUA1zjZEiDqcMq
	8QaE0GTAjwabc3kjpM/4JKPWRpK7xmR+SQ/lT/QLoP7y0NEtQccVO88ePomMv/TyqaIunL/+y0H
	FyzC8JlDZLyCeHy7a7VPZmzNHRWepBYjVgC8cM+zfsCg4r9R3FiITv++9RSJC9BAi3pc9KODcXi
	00sPKpp1rkJKPg5skZrIzhL3p7nlcsN8waPy4dV2yd+pSXm2cy+BDcIfe5frB+NAHYuvlHX46h6
	14EEi+yNJfF183+h4S4bNkLVLyw8CtDtqdpzxqQdwwwHaoaIz9d5IKVXUli6Mp4nBrU11DeY+GF
	U5NXiyAt0ix53ua2O+uXUb12RE2wl47B3Fziw=
X-Received: by 2002:a05:6102:2927:b0:62f:31d9:7bf with SMTP id ada2fe7eead31-637754eace2mr2861767137.17.1778696642495;
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
X-Received: by 2002:a05:6102:2927:b0:62f:31d9:7bf with SMTP id ada2fe7eead31-637754eace2mr2861750137.17.1778696642033;
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:24:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:25 +0300
Subject: [PATCH RESEND v3 5/6] soc: qcom: pmic-glink-altmode: pass down
 HPD_IRQ events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
In-Reply-To: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0drlwCbTuEWcWCuHk7pQDuuarVA3oztNqH
 T7Bd2hVw3KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1RL7B/4jgrhGIEZynL+WT5KesqjMHxOK4WlzF0fcjJVPHChMLdUytHaxmufdMqTgSy0mcUbDBn9
 6q+vvyQ6qYt0ElA3eZFhzZswAyCgcR8e4VTK8o8hpdhNHHqN0OnWTYPFN2SHs8+2VNdnQpl3rl6
 nMO0qA5XZZ0N0MW59OPPIDbL7bNNmFqUKmIe2WCRfvquF0In8ReMbRiQJj7LkMVsU4X/WUHvw1c
 D8V8E3vb27NV4op4UtcX7LQjtY/tpC3kuvEBz1k0eDC+LlEa/A9pzrNHGsDflhVd9anRh7OF2dP
 6y+RL8SzW1ovqNGn+6AgKDUbs46tJjRUUkfsmEfNEOEnsmEN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04c1c3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: qmWw93fPpDm5gh11kXmd2v850lFzeGHc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX5WJ9nSCzdxVK
 JAG+WHje9imipQgWYP2Qf4+wWj3S9HFNXgEFRJtgQygWJewbVCc0rvfX60JLJA9qzO2Hr38DPh/
 pfwUd1a+lCxWSAxw+WpK3VqiPcVWccXKrbrq/pTTl0y0MjP/TbDyk0xPc2EqEiOlc/JkZrYozmm
 t6taGuJYHJAEqKoD+hC7Y7aYt9m2JUsHpwR/58SwGugHP+52kvaLvk3GOhs+43b9vVSTAYHjHNw
 4xcB4rlJV3eHoz8CgXkZSdppQytUN/Mb8QyJB4yVE+883nl3C1dsB9Zof36OmILCthuByog422r
 NA4zMAXVk5+eTrdwE/dtQgAHr5DzI2CS3wLL4NuvYVUWYp/RMyV+tc5WjRyfFIqMQhzMy0hxG8g
 fraZm/X8K6mWubLkF0hBMwEhlptHoVyukguh0ojfQbAS+5V7gtgK0jiMV42GvZ3nAlPLGg7TDNn
 Sd+GsdflSgS1GHOTTlQ==
X-Proofpoint-ORIG-GUID: qmWw93fPpDm5gh11kXmd2v850lFzeGHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130183
X-Rspamd-Queue-Id: 0A921539042
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107424-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Action: no action

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..946eb20b8f83 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


