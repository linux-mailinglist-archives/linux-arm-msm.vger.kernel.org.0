Return-Path: <linux-arm-msm+bounces-97656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEGiB5+2tGm4sAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:15:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF8028B327
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D225631A920F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF072EA16A;
	Sat, 14 Mar 2026 01:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X79+d29t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J29uabuL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6092E973F
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450589; cv=none; b=eo98N949DDQeuTFvt8pqbUGzhQ5xqRywCGcJwV6CupbQgfieSmIL1W7nMiWTjfVYI0z8vb7cVyUQ5DOlD5dDlKXnjY0VlikYUBFhu8HNPBvpGotT8i+pfVreZwsJivZw5TWqMwlraXD11eqRhC1QsSd7UGKh+kNxQ/F/6KXR8cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450589; c=relaxed/simple;
	bh=mM1BPVW1QTH7/BXc4PZivhB4YvjG5aoCpugqUPEORdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=giQ1cYde5VnO+CbNGwqZPKqV6iJJ+0GK4KS+XWfiDjkAaY/DE12UvzP7SEf7COrmgzAP8XVbMc0siMRCOiBY9JdvLlVx8j8dJ8ZzjVjzQDj3WmrJkxytRDWzm2UdRP1vCK5G5fP47+ZGj3tugDWbtIyW5ULHbFHU84k83ZJucpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X79+d29t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J29uabuL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DKfscd3230023
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7B0471sRKQMwDEZP6vpU2reSm934CwZ9IjApmWlQSQw=; b=X79+d29t3XHKRreF
	+O0f8mcaQwDaxa2vr6lUB3WlkJGsbFJicY/jHiQHrOQBBki1vjz9+/lywyfsg8jK
	qifkCBCL8xdIzYHf0397vUECcnQmpTBYcKUlUMR+sN5AW0v0a5tSGcJmOpH6GhNV
	RXPJ+qXonZI/qzkziLbroYq5GA5/xW7E3lIpcdNPrwFhJsgh+dSxky3XXx2L9DSH
	zSblkUiGv4E6QZy8RDwECBKIbjF0jSpcNe8+ehuRDQg0ZmKn6uMNjNW6UCIBB237
	QjILzUK1KB0U6sW1zP1OHQ1BMgXeVH/gCid+QoISVQ+uHcg0VSQb337wYA2PFzGt
	GtbQKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7m900-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77bc8186so2554013085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450587; x=1774055387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7B0471sRKQMwDEZP6vpU2reSm934CwZ9IjApmWlQSQw=;
        b=J29uabuLSFOzl4sFJjBhMSPB8JabKOp6fE1sgUm7POd7+e7/88aJjqg03lOf30BkYr
         P+L1GdFib9n+Uvs+gW83Ucn0jpdLChTNVkQeta1CSsGFhOt+VVx82qaw1mJ0wyzlZajg
         /+d3hFGcsdY2EMsRxjKLcYjiXwjHLrNAGu84JhGryLebAPEb1HoLiwyohG4105lJ+9Vn
         8z0WNzQlMS/fdehRgBXni5gQTsNv98XbkJRXKc6tL2RTIKB3UCfdGOiQciqEElyOqAZQ
         P/mzKOkHNyXm5wM7jtdT0N9nZ9X0y8AkPXsTroPPFEzDu5sxR6SEU6EuKW/a0IA9U9FV
         blCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450587; x=1774055387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7B0471sRKQMwDEZP6vpU2reSm934CwZ9IjApmWlQSQw=;
        b=N5EGJwmagEAHtiOF59ZrXtaB2DIUem+QpFliDsdSkC+50rabUKOxCfdRDwV8SuDRPS
         wmaqIzIszXXKDQYg5904C6G87r1DLe2BEhZUd2T4S5+rUbqYjFkwi+mpS2OTMeaJ6jvS
         Qf74HTg15aNw+GilZ7cEqqgR9PTC4YRb6RSXnQH5yCsWhO9BfvIA1SRfwA4ewI4AeMfa
         5FTbwLH3b40YxsyBrxiOy7gGee44tb42weL6TKfJQEk2/QyN9KqB+AK/1xbEiRv/uryt
         O1jMHKLGAhrxBVrLDRtKWuTWCWLyBO9p9Mx+08ZpJXm9bM19act7iQpuylbrYEPbGRLZ
         Wfqw==
X-Gm-Message-State: AOJu0YwdDf+V9KNf9hxBFiXmcDws/CQhnSwGNbnz38vUJ0lIKsCvWYQt
	0LSrfxNX/MjlWymlelMc6ikVpQwxjKnNDhZKLAOqkJDTU5k1Y4ROnYroEQXgqFf3ynWQ43GTnZP
	xtB1gAwwP/0HKvnz1MwMEI451+mjna6WrxY5ZuUdJPuAd8psrmz/tRrWVppaaFIdiZ413
X-Gm-Gg: ATEYQzwz9Ky98e3cS+26aevScX85RSyx623f5iaMA/Q8wLDp3dD7y9jRMcfJKDLbfR8
	OY8kN33UVIvPa8/C0UVUoTVhi8bUc4J1N9hS56AVDUF4M2MFxasmDAXBROzW9HbiiZvpOA9PSd7
	zdL5uMOHzc8DwNPArqlyus+rSSHPMGj6FDyJ+5A4h+b9zQbr6uAibaIFethB7OwbvbDbtWt0wfN
	SsrbV5nqN6ONOeY8wYHDtEEWPJoY3X8f5QymJWcwV8jiI8n4PtAv/ANI4iFpwwbqC7CN68on+NS
	QphlcPbmWFKoXh1iYBF7fwSxQ+GngXQ1HKR67uUwnUq3yJEEDfI7SFiGcgKndoFrTWP85ALNwVA
	3XfTf/Cg9SrOwTZNS7/PicqziW7/GzZi7+LInz+vHNxuC1GJbfdOni93zflXxfVYxDbVzB8aglN
	V4cr6uSqW94a0pO2GzLU3JCiN9NqrfoE+4h3k=
X-Received: by 2002:a05:620a:468d:b0:8cd:8938:f000 with SMTP id af79cd13be357-8cdb5a610edmr773787985a.28.1773450586671;
        Fri, 13 Mar 2026 18:09:46 -0700 (PDT)
X-Received: by 2002:a05:620a:468d:b0:8cd:8938:f000 with SMTP id af79cd13be357-8cdb5a610edmr773785785a.28.1773450586260;
        Fri, 13 Mar 2026 18:09:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 03:09:14 +0200
Subject: [PATCH v5 10/10] drm/msm/dp: clear EDID on display unplug
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hpd-refactor-v5-10-0c8450737d64@oss.qualcomm.com>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mM1BPVW1QTH7/BXc4PZivhB4YvjG5aoCpugqUPEORdA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptLU0Pw/Wr8XI+UeUONhk97j/MiQGZKZWH4bTZ
 ZuB82VI0PeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabS1NAAKCRCLPIo+Aiko
 1TH6B/9HVOXDOqe6Kq83wbuYJWfsDNfh6vW+7Iqx/NVA9Nnx0o83c41Vav4ihMIyb6Qj/LUe9ao
 uWaO0T3m5Y+Vv2/2cXK7OJxlssS5LPWj0xJlATqaY5bzdmw4dosdX2AdVx7FFeOTDiHeYjeB/So
 P6p/pVrXzztbZMMFYu86QiYRLBhrTMSz01gNqcf+CPIskZM9fuBZ/YqlRAwHOjHKsxfjREYZqll
 BsRNZz0tTh3ItupQBaB9fPnynvNfTPevJZI7r/gBQdChqRydV32MfJ7vOJTssXXg8i4pOX26CXZ
 JoAKIXO7q0Oy9FFK+YEYEeco5LmhuYsZzV2UVLxqIyWs7CQX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EshUYJG71sv7uo1LI3IQ_PGezHdnYNTm
X-Proofpoint-GUID: EshUYJG71sv7uo1LI3IQ_PGezHdnYNTm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfX5+4GjNkcOtaJ
 s0QGS3GNQmWClNqr5PRYukjujNtl+MpHWVoPdJGnG0h48V04vBnRnq0q0LOZ0SOA1EvhrCqeN0G
 6g+4XS5KOw2Y5DCqqFMitoIhVNWFp2RJG5ZtIrZxOJUMC13g6/bRvZMuT2otmOAif7x3JCW6Ycv
 3yPETTgqA7GaPnPDt8wsypLg/cpxXRCvZwvap75nsPtNdsCJsAsjjFQKd6HP7sELxDYSWPYK12F
 y7rCH+GeClF/ofNJdvjSIXFH9GoTdx1MhP08mo1C22V+DxDRmhDUhf+JuMFpEXxT/RSvRJisUDU
 0M9+h+nTUW9CkYTLynuWDcF0Tl/mA5IhcOq8OME4wwvpYfYZspXM/ap2UFO/IEZEgqFxdlI6rAb
 vo+SV9xKjAErUUKxJZcM68O+RzLZKt8Aj5fUtSbqB2SNzdvNsSn0DthndTWQXvuRj/nvEC5VUhZ
 jk5E0A5H0djtxvvVoHg==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b4b55b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=NIqqIfc2bYnrFRhDr3kA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97656-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8BF8028B327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the driver only updates the EDID when it detects a connected
monitor, which results in the connector still listing outdated modes
even after the display is unplugged. Set connector's EDID to NULL on
unplug to clear the list of modes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 8 ++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h   | 2 ++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0a38957ea901..5c6a24ec140d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -447,6 +447,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
+	/* Don't forget modes for eDP */
+	if (!dp->msm_dp_display.is_edp)
+		msm_dp_panel_unplugged(dp->panel, dp->msm_dp_display.connector);
+
 	/* triggered by irq_hdp with sink_count = 0 */
 	if (dp->link->sink_count == 0)
 		msm_dp_display_host_phy_exit(dp);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 891211b23202..6bb021820d7c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -293,6 +293,14 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 	return rc;
 }
 
+void msm_dp_panel_unplugged(struct msm_dp_panel *msm_dp_panel,
+			    struct drm_connector *connector)
+{
+	drm_edid_connector_update(connector, NULL);
+	drm_edid_free(msm_dp_panel->drm_edid);
+	msm_dp_panel->drm_edid = NULL;
+}
+
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 177c1328fd99..9173e90a5053 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -49,6 +49,8 @@ int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
+void msm_dp_panel_unplugged(struct msm_dp_panel *msm_dp_panel,
+			    struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
 int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,

-- 
2.47.3


