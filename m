Return-Path: <linux-arm-msm+bounces-99771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAEAMYJPw2lGqAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:59:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A262C31EFBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 172B83038D43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D772622126D;
	Wed, 25 Mar 2026 02:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWYOWnCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5DLdodr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AC4296BBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774407552; cv=none; b=YCydO+XMGN8jdi1/QQs//uGO48CwqKjiSpDYwftINjIt6bXC+3m6ZdvDc7FOuafMz5oYUtRTPCPiLVW7jdUj1Fn0lU36rPhWF5wUPIfI+iy7Ph7MKPuYRBa4DiYjtMAUszh5hvszJBtyUJkoHKAKeaqUIlvVyCuePg9BG2AqC+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774407552; c=relaxed/simple;
	bh=LRaUhUC19UOUkXS5dvPplXuBx0t2aGc7Jxfm/5YZeHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gINaYmyd7UvFsF9J2WcxK1vBDTLPqChA44X2+T1AYnf7jI+wfM2YWpCu/vCGsastuqaZ/gcl5h1gg2yoogimIPI4+0Ova8WAHWZLK9p0CL3YgMP+KKqzPwxJr2jhxksAiTAhlqNE8vHexkIOhfJ6wHHIYZ9eM52SfiPzP1a6O4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWYOWnCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5DLdodr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCrmT3110432
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 02:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wV5/ZuuC91zLDNx+7e4SnT
	PPCzXtvZtWdVpISbaXSrw=; b=NWYOWnCwIKheRGJhrTbn1qF6WkoND46RYB9EDg
	tRxvWS+6zZ2xvGzt2fSFGs8OI/r/VplFDjZ7PPA6be4VGfGBFVPRYICn52uF7fDJ
	9t+v2MAZw4S9eTd/UPEfUDrGBZOZWAuRe4aYodpaVkY42pP1ghbcVC50GKAyAEWh
	DQAAoRKa/coDaU+UUebdKExJ+D8Up5u9ViVVGoutD3E5JBEWKC/oXS6J5p68Q98l
	QKP7mmmbW1KIpMBWb1qlO/PGIm5rVsqEMqsLgqjOE+ZdJ+DiuaMd2hkpJqbKsTJy
	5ZraHlSa9v2+POm619IIv+JA1SQusTyus4lsfsg8QibeUYBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvte65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 02:59:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093025ffecso68321761cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 19:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774407550; x=1775012350; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wV5/ZuuC91zLDNx+7e4SnTPPCzXtvZtWdVpISbaXSrw=;
        b=M5DLdodrGuzc2jf3lpa5S62LUnjjXC5IhOe4xGohOARSu/NXfWyZl6xXR5DREoEdhp
         5kF13T50YzKsXN+HBDsyK22UYfMEDN3iqf33MEdqHPgm6lPHPRfGlssrNfmDaHIwqLAE
         DIwYmnM+mqnlXDWbTzKcP93JTKg+mkyUrF1MNZJpiXg8Fv1U0EUWRd3KbPEu6NBDe5Ed
         V+svO4qWoNq1VTFxmakiVcwzbTJt3c9wyjDClezeW2EeaQw4HTL5te40O4LKscwCbSB3
         e5aIaRMpjW5PjlWWO2aM6/KlK7bDEH7Bs4SG/Y5MxxgrPWcECuvrMFwmCRyPKDgjwQZI
         G0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774407550; x=1775012350;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV5/ZuuC91zLDNx+7e4SnTPPCzXtvZtWdVpISbaXSrw=;
        b=bFbqwkkSQ5SluGALP0QJyZNEg6P9vm7kYFGrIhbHi4ZiTOiWX0qM3X6l+OD5TR2KAC
         SV9LJxn9w2bZp90+xJpiGGWceLklVOz9bBQ1vrfgmvUnpLfVhJQVvt8ReRXzIoVba8zR
         My353ueR/XwYaH84MEjytutGUI7IY9u83odQMPuNYife4jseNXjGUQRfq71VBbVH9vR1
         /JnTy0e2b2QFNdZOj8cId+qQxcLCj+yWNnl0fgFvJct6IHChJGZU/uXb8j5kJxrF0a1m
         cYB8GZUU74HSiw/70LyfTXJRHP2XJO4IRi7YO7xkxo4HxfiifbGuqOSHuLicn+cpV44r
         COxQ==
X-Gm-Message-State: AOJu0Ywd4ZlbDzTpjf57ERPWF1BX4Q1L/ajBEPU26VI26B4a0eUi9zTn
	C/FhbEBZExVb0tGXEByneD6Fxdv/Ahrvgs/+IY0vowNwd7yiyCH4ZLezKE6X0DdfVB6e3n24VUP
	GYgiG/Ryb5Ec5fe/iDYiKtGBCTkEcEwTHfU1XoGRmgON/6p9NCM7LMzfoBmJWo/jtgu7L
X-Gm-Gg: ATEYQzyj/5hzI2f1gv3zadl83G+gmxPnxBvpapC2eO8WgvCiesE4t5kfIGujuTpE5Ol
	/M/eN1IVUFPS6oGF1Y27W8B5GfvT4YqN+oOjzfaTxjxCnby1db4zLdFWdj92CdDu8nH+LCCj9tX
	6B+BFUUwD3kU5xry7qUj2ETGoWo2/zb8Dg17w2mo1eZhstXwZGxS7IG1ftD+pJjoenwUWcRFSw+
	myzOwrcsCUORrdurMFqviY+1IltvhaO7WMI7bnq8+odeuJ9rJePFfOkhznymHtHLfTL9wi1ewx5
	GjklOLh0iPygS3HFO7UOT6g+lXZPlb78e0MvRXJAnRXE3yLf0yxA+7EJnlcsGsSo2n3FF6juWM0
	39BNvY7Rf/CGaVtXMpSPtI0T1yyD1G80utF051DpSDcNZqTeSHvWwmApslMtZm13GffwrnmGYci
	+Thu6qi117mMLBANtoGgRKXbTgCeN2LX59MyM=
X-Received: by 2002:a05:622a:7009:b0:50b:3a6d:db5f with SMTP id d75a77b69052e-50b80e9fa72mr20441401cf.64.1774407549583;
        Tue, 24 Mar 2026 19:59:09 -0700 (PDT)
X-Received: by 2002:a05:622a:7009:b0:50b:3a6d:db5f with SMTP id d75a77b69052e-50b80e9fa72mr20441171cf.64.1774407549057;
        Tue, 24 Mar 2026 19:59:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28e890ec8sm2278129e87.80.2026.03.24.19.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:59:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 04:59:02 +0200
Subject: [PATCH] drm/msm/mdp5: drop single flush support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mdp5-drop-single-flush-v1-1-862a38b4d2ec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHZPw2kC/y2NwQ6CMBBEf4Xs2Y1YgkZ+xXCgdAtraMFua0gI/
 24VD3N4ycybDYQCk0BTbBDozcKzz3A5FdCPnR8I2WQGVaprWakanVlqNGFeUNgPE6GdkoyojVX
 3qtZW2xvk8RLI8voTP9qDJekn9fFr+zcCvVJ+jEcNdCeE/ewcx6Zw4s456GmN0O77BwJrXECqA
 AAA
X-Change-ID: 20260325-mdp5-drop-single-flush-bdf2935bfbf7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6042;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LRaUhUC19UOUkXS5dvPplXuBx0t2aGc7Jxfm/5YZeHY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpw096GOTKcKP1kjTp+BZKi25rWFZ9xbmwJUAo1
 y607cdkKJ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacNPegAKCRCLPIo+Aiko
 1VlnB/0U2RQgVvktqX50lomOi8KF5ZmNREpIY00e//ZjjafJn+bSZ/CRjPrYq4ZvtexbAb15lzJ
 iojnXzAn051yPNeHsuw2Ayf05Z+i7pA/fkxiUyqa8EnOfevbRSqZdKZmr2Sp3gj88rSJDidZh7B
 b0guEzEQ3ycoR2acs8Dro3MM6nOP+ujdBccYhkEsJ9oOsZqd9VutEFAOb+R3OBk+dKf4y+/g5Gx
 D4bdxiWGshEZ7zvOLJ3H4BYqSxyKutpGWBUZbFiGu2XRHZbBOBmi4EnOdGYhNA2pkk2YcGigvLc
 g5WbkndUxn4r5QryZLXAjx2Z18HM1QXfoMJj950+snneLLJJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMCBTYWx0ZWRfXxxtYGgYmahmx
 1cP5mde6UuPbB3OcGbBYRbC1uHQPNH4+C8PR25GPNk7hcoF7VEcMB7ONK7SaoJZY4IYo6xETZp5
 64Nq7cJ3bsWmHLMtikvB+lgXNuAo+BcEid3pNzZGX8HmkLxs1+qcHQOjblm2kcrF4kqNsUwU19B
 QdpsOh/Enl8bA8a4e74Wm2rpwh4aYuWjU9WZDFg/7fjTjxl4XfBSauur8Dum+C/pFTm4nHYtzak
 sSjcKqQF7C6Ykt4gB1y7Ga5oeJz/TO/Zgfq9lVSAQkkzc1NIoep5lDbbModiDokhbnXovOPW7/O
 jA+Z5ITywtBjpGleU2OnUzMMA4hpJ8IK77z/yf7CTJFMWp7cv55klcffEJ/37sN9ovqNduR1JOG
 Qxv7ppLW6C79YkrERPV5rAOn0iMMlTTQ9xxDaJcBjSyp3WzyLKwnSjRWVH9d98A0BAmH1/DY4AX
 Zo4smz9ngjppVBZNPSw==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c34f7e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pd6Mq7pKhYQ23eImG-cA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: L7gyZ0JTknKcJZi_VXmaDizsZCL7F4Gs
X-Proofpoint-GUID: L7gyZ0JTknKcJZi_VXmaDizsZCL7F4Gs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250020
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99771-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A262C31EFBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Support for using a single CTL for flushing both interfaces was not in
use since the MDP5 driver dropped support for dual DSI configurations in
the commit df3c7899946c ("drm/msm/mdp5: drop split display support").
Having the MDP 3.x support migrated to the DPU driver the single CTL
flush is applicable to the platforms suspproted by the MDP5 driver. Drop
it alltogether.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 90 --------------------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h |  1 -
 2 files changed, 91 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index fc183fe37f56..1eca140616c6 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -17,9 +17,6 @@
  * a specific data path ID - REG_MDP5_CTL_*(<id>, ...)
  *
  * Hardware capabilities determine the number of concurrent data paths
- *
- * In certain use cases (high-resolution dual pipe), one single CTL can be
- * shared across multiple CRTCs.
  */
 
 #define CTL_STAT_BUSY		0x1
@@ -46,11 +43,6 @@ struct mdp5_ctl {
 	u32 pending_ctl_trigger;
 
 	bool cursor_on;
-
-	/* True if the current CTL has FLUSH bits pending for single FLUSH. */
-	bool flush_pending;
-
-	struct mdp5_ctl *pair; /* Paired CTL to be flushed together */
 };
 
 struct mdp5_ctl_manager {
@@ -63,10 +55,6 @@ struct mdp5_ctl_manager {
 	/* to filter out non-present bits in the current hardware config */
 	u32 flush_hw_mask;
 
-	/* status for single FLUSH */
-	bool single_flush_supported;
-	u32 single_flush_pending_mask;
-
 	/* pool of CTLs + lock to protect resource allocation (ctls[i].busy) */
 	spinlock_t pool_lock;
 	struct mdp5_ctl ctls[MAX_CTL];
@@ -485,31 +473,6 @@ static u32 fix_sw_flush(struct mdp5_ctl *ctl, struct mdp5_pipeline *pipeline,
 	return sw_mask;
 }
 
-static void fix_for_single_flush(struct mdp5_ctl *ctl, u32 *flush_mask,
-		u32 *flush_id)
-{
-	struct mdp5_ctl_manager *ctl_mgr = ctl->ctlm;
-
-	if (ctl->pair) {
-		DBG("CTL %d FLUSH pending mask %x", ctl->id, *flush_mask);
-		ctl->flush_pending = true;
-		ctl_mgr->single_flush_pending_mask |= (*flush_mask);
-		*flush_mask = 0;
-
-		if (ctl->pair->flush_pending) {
-			*flush_id = min_t(u32, ctl->id, ctl->pair->id);
-			*flush_mask = ctl_mgr->single_flush_pending_mask;
-
-			ctl->flush_pending = false;
-			ctl->pair->flush_pending = false;
-			ctl_mgr->single_flush_pending_mask = 0;
-
-			DBG("Single FLUSH mask %x,ID %d", *flush_mask,
-				*flush_id);
-		}
-	}
-}
-
 /**
  * mdp5_ctl_commit() - Register Flush
  *
@@ -555,8 +518,6 @@ u32 mdp5_ctl_commit(struct mdp5_ctl *ctl,
 
 	curr_ctl_flush_mask = flush_mask;
 
-	fix_for_single_flush(ctl, &flush_mask, &flush_id);
-
 	if (!start) {
 		ctl->flush_mask |= flush_mask;
 		return curr_ctl_flush_mask;
@@ -588,40 +549,6 @@ int mdp5_ctl_get_ctl_id(struct mdp5_ctl *ctl)
 	return WARN_ON(!ctl) ? -EINVAL : ctl->id;
 }
 
-/*
- * mdp5_ctl_pair() - Associate 2 booked CTLs for single FLUSH
- */
-int mdp5_ctl_pair(struct mdp5_ctl *ctlx, struct mdp5_ctl *ctly, bool enable)
-{
-	struct mdp5_ctl_manager *ctl_mgr = ctlx->ctlm;
-	struct mdp5_kms *mdp5_kms = get_kms(ctl_mgr);
-
-	/* do nothing silently if hw doesn't support */
-	if (!ctl_mgr->single_flush_supported)
-		return 0;
-
-	if (!enable) {
-		ctlx->pair = NULL;
-		ctly->pair = NULL;
-		mdp5_write(mdp5_kms, REG_MDP5_SPARE_0, 0);
-		return 0;
-	} else if ((ctlx->pair != NULL) || (ctly->pair != NULL)) {
-		DRM_DEV_ERROR(ctl_mgr->dev->dev, "CTLs already paired\n");
-		return -EINVAL;
-	} else if (!(ctlx->status & ctly->status & CTL_STAT_BOOKED)) {
-		DRM_DEV_ERROR(ctl_mgr->dev->dev, "Only pair booked CTLs\n");
-		return -EINVAL;
-	}
-
-	ctlx->pair = ctly;
-	ctly->pair = ctlx;
-
-	mdp5_write(mdp5_kms, REG_MDP5_SPARE_0,
-		   MDP5_SPARE_0_SPLIT_DPL_SINGLE_FLUSH_EN);
-
-	return 0;
-}
-
 /*
  * mdp5_ctl_request() - CTL allocation
  *
@@ -687,8 +614,6 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 {
 	struct mdp5_ctl_manager *ctl_mgr;
 	const struct mdp5_cfg_hw *hw_cfg = mdp5_cfg_get_hw_config(cfg_hnd);
-	int rev = mdp5_cfg_get_hw_rev(cfg_hnd);
-	unsigned dsi_cnt = 0;
 	const struct mdp5_ctl_block *ctl_cfg = &hw_cfg->ctl;
 	unsigned long flags;
 	int c, ret;
@@ -730,21 +655,6 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 		spin_lock_init(&ctl->hw_lock);
 	}
 
-	/*
-	 * In bonded DSI case, CTL0 and CTL1 are always assigned to two DSI
-	 * interfaces to support single FLUSH feature (Flush CTL0 and CTL1 when
-	 * only write into CTL0's FLUSH register) to keep two DSI pipes in sync.
-	 * Single FLUSH is supported from hw rev v3.0.
-	 */
-	for (c = 0; c < ARRAY_SIZE(hw_cfg->intf.connect); c++)
-		if (hw_cfg->intf.connect[c] == INTF_DSI)
-			dsi_cnt++;
-	if ((rev >= 3) && (dsi_cnt > 1)) {
-		ctl_mgr->single_flush_supported = true;
-		/* Reserve CTL0/1 for INTF1/2 */
-		ctl_mgr->ctls[0].status |= CTL_STAT_BOOKED;
-		ctl_mgr->ctls[1].status |= CTL_STAT_BOOKED;
-	}
 	spin_unlock_irqrestore(&ctl_mgr->pool_lock, flags);
 	DBG("Pool of %d CTLs created.", ctl_mgr->nctl);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
index 9020e8efc4e4..0c45f7874c24 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
@@ -35,7 +35,6 @@ int mdp5_ctl_set_encoder_state(struct mdp5_ctl *ctl, struct mdp5_pipeline *p,
 
 int mdp5_ctl_set_cursor(struct mdp5_ctl *ctl, struct mdp5_pipeline *pipeline,
 			int cursor_id, bool enable);
-int mdp5_ctl_pair(struct mdp5_ctl *ctlx, struct mdp5_ctl *ctly, bool enable);
 
 #define MAX_PIPE_STAGE		2
 

---
base-commit: 6efced27f5df9d7a57e4847fe2898cdd19f72311
change-id: 20260325-mdp5-drop-single-flush-bdf2935bfbf7

Best regards,
--  
With best wishes
Dmitry


