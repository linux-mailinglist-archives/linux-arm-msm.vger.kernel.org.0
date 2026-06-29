Return-Path: <linux-arm-msm+bounces-115106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ACA8CX54QmoM8AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:51:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFA96DB8F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:51:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cM9JEiz7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XxomEiEd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115106-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115106-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4671631C1789
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA6240912B;
	Mon, 29 Jun 2026 13:18:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456B940911C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739114; cv=none; b=KXv5LzYjV5uQSXYG/3+kpRLYVpmIpHLHMsGkRJVovseFMh+CDVv/R5yxQN2G5D5bCd4xW2vZBCs8GTFHUS32+bz5cZwQ2w/K9gsN6iyVszzZlzwmvS44fC9gynyRqcd+wgym+7vSTx20HJl+sZiS4UxP0NJVrKpu6SuUnhS/opY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739114; c=relaxed/simple;
	bh=2N25ZqVfMCVlIUNY7Z7f2RX2UUBnVPVDtT4yNvyHTt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KvNjzffWs3LCTWLa/zw45Hs6p3oAkfe675LI5yMa6PAp3oNhB2FXG27qmfxDSuGkzrNxUCeCEJuqvPA2BtDLvdvV4bZqdkHiZi3CSEsYk+4vPzdDlGTtYjZ5zHNJBLK7TPzpprZivi7SRM5aStB+Ot9uM4d1FG6ALJgPn0lG66k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cM9JEiz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxomEiEd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT7JP2618934
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLEmu0SuSJObPGT52LcwIf7D9jxRGU4XmXyxCd29wxY=; b=cM9JEiz7izEnDBbl
	3cmaLmy8AiQ6KxFh/oYOwHRkcUJuSgIWcw40f+GDqHbTqr5L1cHwY6p30nOnhPCm
	AHymRAI0yx975hSedEnMujgeQX3c2zu6W8KHECpX/SOmvVLcBQuEFmhw41TBh5oO
	LUJf8HWGhcEmtZvmS+aQJ/n3T8EHZE4L2mNrfO19OXEvFs/3oMkYRm2xURKht8F5
	loVJBc9Yi8njcC6IM48duxZQF1L9rvj2IbAKRgCBb3rRk6L18xythRGZdNSzgrTm
	sD6Jx4M2yLEBKbU+5QpIdL5FCoI29gklEVrIq0otLZ0Nux6U77ASu95BLzxUf7Xv
	J2WmTA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkrrte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f000e221d7so16180276d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739112; x=1783343912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLEmu0SuSJObPGT52LcwIf7D9jxRGU4XmXyxCd29wxY=;
        b=XxomEiEdf94yGs8HGIN9RoQh5ScqeSA+zbsgTB2A9QmY8MHKNw6DtNqLPRs5CLDqUh
         tkLi5z7dwzatsL5/rN6julMb0G8OzOBno3j+izS5SQGbGh1Ikwk5O6kpXcVDjjY4sPm7
         Fkue17yaeLUjSthDo58vHN5834CI7Em/9Jxq2mmZRaP9egkhihTooNFniG55ZzSjFJLD
         XzG7+koOxx2c7sJpLLF97IKMYUlhD/LfktPLVcgAW+s4W0Md/aIg0eS553rp5bMH7TAe
         zjegRChEnpobIFz0sLmFr3kLr9pi3B4w49WF7jto7/ub1BDJEJhl99MSjf9/4JHZ2hF5
         DsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739112; x=1783343912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MLEmu0SuSJObPGT52LcwIf7D9jxRGU4XmXyxCd29wxY=;
        b=MRzCXnjirDHIaR72WZ3bIqMaBn5daKxkZ9J6yT1xgsyx/bI94nyk+eQSotLekYjnDM
         yA5rJLOv7MtK81nygQ0RYcdnovEepdLPOqKvpuOMKnAqx0S5FOcrEZtFsTrxHjCyCdGT
         jGQ7t7tpROyd54OXL3/ieQmbbXI3gK+kHL2HjCP/PhD8S/6RMZtP6Z4BOurTtTD+87kY
         v6zbx0I9KYj5ePynU48WEm7xMMXxmo3BmkQIGb2H8bs9IkHsa5cu+4sScRRl4MVgFwaw
         AX7nYYtfbi8ZCWkLUbgcAYbvkQd0pMA3rSaLBrRyCap6bYWNshd1no3pMg2H9AIAAtyh
         4nMQ==
X-Gm-Message-State: AOJu0Yy2De2pBLkkz0rYFRml2uDxGkI2P8RGarkxC7xc/1fv+iycdHKK
	QnE0G3ZrFK+9GN+rtBD+RJLcZVvrkixCs0lpmbwuJPpVFKYPv+S8OlUB8g6Eo9lv43njbUW5Ngi
	FamKIz/FEypgCOU5o4iDrQW0+pSgNTDvh4ML3PWH/06jmNxputZdUySps/tlHoklnuiM8tfZVrX
	t39OQ=
X-Gm-Gg: AfdE7cmNZtR4Y3XY1Y0hv9YEgUpOk7x9vMmzIVnzDPXsrThoiKQepZjc7HEieLL0TPb
	hunDj2JOWW+nUfLtyAhyeVmn6IkAuN83JgKgP+m/X3HdhiUgK9LqR4GdSqq74ZYKsrYpEitXB8o
	r77l+Q/Y050KZ4yjhSmTdgp7imC+rPdnA98IX3IaV4NogGAz9cbnhvTccWM6JtJBLKyKkqDM7Ty
	S7Ygcv97W2pGYwIJ2UzO0T6d88dPLCqDFzbezvGRBjbP34DjSvr4CPPX7Wkyldtb7h+aplHLWsA
	uG4IqUxzxBRpWd1FGFKINZ9ZTc2OiX1K3wFMCU0E2yeHWd/AoodIbYOqALVMA1G1Od5m4knwV5M
	Opd93MO7M422ryGGVbIQ8p9R63cAzmA19WxmQePleqEQA1Gw8P71/LfNgJcPccOOx+tz+fm7PCQ
	==
X-Received: by 2002:a05:6214:5095:b0:8eb:24e8:8d28 with SMTP id 6a1803df08f44-8eb24e88fb7mr124548326d6.46.1782739111575;
        Mon, 29 Jun 2026 06:18:31 -0700 (PDT)
X-Received: by 2002:a05:6214:5095:b0:8eb:24e8:8d28 with SMTP id 6a1803df08f44-8eb24e88fb7mr124546216d6.46.1782739109973;
        Mon, 29 Jun 2026 06:18:29 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:18:29 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:42 +0800
Subject: [PATCH v5 24/25] drm/msm/dp: add connector abstraction for DP MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-24-1d882d9012f4@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=9169;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=YsuaK/0OYI79/l+b6bHLlwEgQ38BKEFF+/BvXN79st4=;
 b=dpsT3F7m4xWYxbXhi4HoV+G45lZK1FZygEXqP8Mzq0qZQsAO6XgUXP4VRiwayWl7co9eAm8ri
 vvzI3QF9IAFDpSolJqOZnw2V2JnYztqxfW+FprW2/hjSKrlru8gj4fA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a4270a8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mVHCav_IkjWnAo0-rBcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xmhP7OReLUR1PAiFCH7s6pddD7vRvFil
X-Proofpoint-ORIG-GUID: xmhP7OReLUR1PAiFCH7s6pddD7vRvFil
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX/p/ieIG4dmtq
 5aQM6gYFnxtI5WxPUsBdtYn4o+iyo7zJE+HQEkclxG9OOiOIancHh3b7eO6rf1lsW3ElOKPzUbk
 emgBminkhHV91pw/de5hk+lngjV58aICKpU9IffL5LUYtQ8Xxyf6mtURo1e41VEUrXzGjsJdK2o
 DN3UB973V0CWZAOiX76YgPBWrxFsxUHoMz1FBDUaLdl9jNOLg9srH1OrYjel7jnFqzypofZzNBT
 6pdomJTfcSc9IafIvTjF9N9uCy8RhN1ul8xm86nrQPpdhaXpHZdJLvNvCRRoI7UV85/gxhLBPyT
 b/LOxzv4pHMxEnws50r4RKHgoKgyc9+OK7PyVuLNXlqkgY2I5UEZE8yJmSFSURs3TuE4mzvJdyB
 cWE5Fn0bg0yMoDp009+WndWviZ7H3b/OoScHV3hTvDAVAlHW9f8yRk6e82ZF6gQk8wj44iyoaDr
 s2lpJjVzOpHm7UYFNhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfXyLIZc5iNkTv+
 IWA00RB85NEy2eGhRgyc4SpTrhaeL1cgjkFMKI6IGMNIDICwbFc7KfBSw3dhw3dXvSCa/jI+9Bs
 C3rJtLghkiiB4yC9jOrJ+X1nyL/r67E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115106-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FFA96DB8F6

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Introduce an MST connector abstraction for DP MST, with each MST
connector associated with a DP panel and connected through a DRM bridge
to an MST encoder.

The connector is only used for MST helper callbacks, such as detect,
get_modes, and get_encoder. Display enable/disable, hotplug handling,
and modeset sequencing continue to be handled by the bridge path.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 232 ++++++++++++++++++++++++++++++++++++
 1 file changed, 232 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 6a77fdef85e9..12b47a413793 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -7,6 +7,7 @@
 #include <drm/drm_fixed.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
+#include <linux/pm_runtime.h>
 
 #include "dp_mst_drm.h"
 #include "dp_panel.h"
@@ -50,6 +51,18 @@ static struct msm_dp_panel *msm_dp_mst_panel_from_encoder(struct msm_dp_mst *mst
 	return NULL;
 }
 
+static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
+					struct drm_encoder *enc)
+{
+	int i;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (mst->mst_encoders[i].enc == enc)
+			return mst->mst_encoders[i].stream_id;
+	}
+	return -1;
+}
+
 static void msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
 					struct msm_dp_panel *panel,
 					struct drm_dp_mst_atomic_payload *payload)
@@ -275,6 +288,224 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
 	return rc;
 }
 
+/* DP MST Connector OPs */
+static int
+msm_dp_mst_connector_detect(struct drm_connector *connector,
+			    struct drm_modeset_acquire_ctx *ctx,
+			    bool force)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp *dp_display = mst->msm_dp;
+	struct device *dev = dp_display->drm_dev->dev;
+	enum drm_connector_status status = connector_status_disconnected;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return status;
+
+	if (dp_display->mst_active)
+		status = drm_dp_mst_detect_port(connector,
+						ctx, &mst->mst_mgr, mst_conn->mst_port);
+
+	pm_runtime_put_autosuspend(dev);
+
+	return status;
+}
+
+static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	const struct drm_edid *drm_edid;
+	int rc;
+
+	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
+	drm_edid_connector_update(connector, drm_edid);
+
+	rc = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(drm_edid);
+
+	return rc;
+}
+
+static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
+							    const struct drm_display_mode *mode)
+{
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp *dp_display;
+	int required_pbn;
+
+	if (drm_connector_is_unregistered(connector))
+		return 0;
+
+	mst_conn = to_dp_mst_connector(connector);
+	mst_port = mst_conn->mst_port;
+	dp_display = mst_conn->dp_mst->msm_dp;
+
+	/* FIXME: use negotiated bpp (DSC, YUV 4:2:0, etc.); for now use
+	 * 18bpp (6bpc) as a conservative lower bound like i915/nouveau.
+	 */
+	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (6 * 3) << 4);
+
+	if (required_pbn > mst_port->full_pbn) {
+		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported.\n", mode->name);
+		return MODE_CLOCK_HIGH;
+	}
+
+	return msm_dp_display_mode_valid(dp_display, &connector->display_info, mode);
+}
+
+static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs;
+
+static struct drm_encoder *
+msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *iter;
+	struct drm_connector_list_iter conn_iter;
+	u32 stream_mask = 0;
+	u32 i;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	if (conn_state->best_encoder)
+		return conn_state->best_encoder;
+
+	drm_connector_list_iter_begin(connector->dev, &conn_iter);
+	drm_for_each_connector_iter(iter, &conn_iter) {
+		struct drm_connector_state *peer_state;
+		int stream_id;
+
+		if (iter == connector ||
+		    iter->funcs != &msm_dp_drm_mst_connector_funcs ||
+		    to_dp_mst_connector(iter)->dp_mst != mst)
+			continue;
+
+		peer_state = drm_atomic_get_new_connector_state(state, iter) ?: iter->state;
+		if (!peer_state || !peer_state->crtc || !peer_state->best_encoder)
+			continue;
+
+		stream_id = msm_dp_mst_encoder_stream_id(mst, peer_state->best_encoder);
+		if (stream_id >= 0 && stream_id < mst->max_streams)
+			stream_mask |= BIT(stream_id);
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (!(stream_mask & BIT(i))) {
+			conn_state->best_encoder = mst->mst_encoders[i].enc;
+			return mst->mst_encoders[i].enc;
+		}
+	}
+
+	return NULL;
+}
+
+static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_commit *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+
+	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
+}
+
+static void dp_mst_connector_destroy(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+
+	drm_connector_cleanup(connector);
+	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
+	kfree(mst_conn);
+}
+
+/* DRM MST callbacks */
+static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
+	.get_modes =    msm_dp_mst_connector_get_modes,
+	.detect_ctx =   msm_dp_mst_connector_detect,
+	.mode_valid =   msm_dp_mst_connector_mode_valid,
+	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
+	.atomic_check = msm_dp_mst_connector_atomic_check,
+};
+
+static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.destroy = dp_mst_connector_destroy,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static struct drm_connector *
+msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
+			 struct drm_dp_mst_port *port, const char *pathprop)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+	struct drm_device *dev = mst->msm_dp->drm_dev;
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_connector *connector;
+	int rc, i;
+
+	mst_conn = kzalloc_obj(*mst_conn);
+	if (!mst_conn)
+		return NULL;
+
+	connector = &mst_conn->connector;
+	rc = drm_connector_dynamic_init(dev, connector,
+					&msm_dp_drm_mst_connector_funcs,
+					DRM_MODE_CONNECTOR_DisplayPort, NULL);
+	if (rc)
+		goto err_free;
+
+	mst_conn->dp_mst = mst;
+
+	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
+	connector->funcs->reset(connector);
+
+	/* add all encoders as possible encoders */
+	for (i = 0; i < mst->max_streams; i++) {
+		rc = drm_connector_attach_encoder(connector, mst->mst_encoders[i].enc);
+		if (rc) {
+			drm_err(dev, "[MST] failed to attach encoder:%u to conn:%d rc:%d\n",
+				mst->mst_encoders[i].enc->base.id,
+				connector->base.id, rc);
+			goto err_connector;
+		}
+	}
+
+	mst_conn->mst_port = port;
+	drm_dp_mst_get_port_malloc(port);
+
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.path_property, 0);
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.tile_property, 0);
+	drm_connector_set_path_property(connector, pathprop);
+
+	drm_dbg_kms(dev, "[MST] add_connector done conn:%d max_streams:%u\n",
+		    connector->base.id, mst->max_streams);
+
+	return connector;
+
+err_connector:
+	drm_connector_cleanup(connector);
+err_free:
+	kfree(mst_conn);
+	return NULL;
+}
+
+static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
+	.add_connector = msm_dp_mst_add_connector,
+};
+
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
 {
 	struct drm_device *dev = dp_display->drm_dev;
@@ -285,6 +516,7 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_au
 	if (!mst)
 		return -ENOMEM;
 
+	mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
 	mst->msm_dp = dp_display;
 	mst->max_streams = max_streams;
 	mst->dp_aux = drm_aux;

-- 
2.43.0


