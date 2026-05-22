Return-Path: <linux-arm-msm+bounces-109227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKdQK28pEGpQUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:01:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F08375B195F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BEFE301603B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48D93C7697;
	Fri, 22 May 2026 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/ENIXqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIduUQw/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD523C6A5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444062; cv=none; b=oP+1R1+QAr6Fh3Odca6gfVb7p3GcHdd8rcrFpmyTHq2mvdV78JmktRWktXze6OlNRgg7LEv/zOAp7ddyf+uZ+IpYwNz0Y5nJnqhCWoz1faV+gUbBGkVjwBksrwpNDjZ0daybHAv0k9qrW1sd+x7gOaCDekOjiHzf0oik+ZSp3oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444062; c=relaxed/simple;
	bh=+1xqvOBtTjhR467f4KD24eV71y2gTMox1bK7uo2F8/c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KPzTgYk31M7f1WoO6kbODG32sqDt+X5cLihHnNFx8LRI/e4n+FKY7SuSxdyt7ZlNeBEokcO0ZqKh8x/L21a8grUc1IlCiZkmMFig/YNhvZod4nm0ZQNqCXPvqPzFv5XFP73f1WZNKaYRqAb1KmXEUfHwSGFp2H0omARb10YiGbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/ENIXqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIduUQw/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6ULqX1958947
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iuCxH5D+n2gNFhyOX5Y2of
	7w5Zcuoea+gH2Rlo6K2Go=; b=l/ENIXqkelqIqqwXddP6me3HQDLOS3HeQ6XeQX
	LwNoPTpsDBSv5zrl2ik0fG6gITJ4e+6ClFp+6iaJWWX4u6U4ii/68Z2rW9B7WZ22
	DFV/3IE1SXnSCUPZr3wiPDyH6bTDoVwEP7BjuW9mvpDpX8eLVcQ0ea/75QxDWDyn
	y19PwfJPx3RnVZvQxlxqFVCmDKC8VyrwzrytSsASaY+XKk7VtX8m6VjM1/lLT9rp
	c0pRLs7bh7cboj4U11RSyJOAIzkKgsD+x5KmXnN3deEvJkr7+5ZiNC8/L+R/nLlZ
	Uksb8TOeK7tqFoBFRRjmEs6rgmX5aNIiu3Jo+2/oKV+ddFbg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxery9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8354503d9acso9042950b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444051; x=1780048851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuCxH5D+n2gNFhyOX5Y2of7w5Zcuoea+gH2Rlo6K2Go=;
        b=aIduUQw/6Zgw17c5dl5ePIRJPbnrcfHd60FY9DAVL4l5ERqAPHaYHxiymDwpVccwBu
         3ELKD/CCL3Ig7vlMEXZSb5wAMfHmRu/ewTGXINB0ls450zbNeeWFKOw+ycv9TZtq3Awk
         Tn4FvHx9gR8B7M79nm8Vu+o/i4zC7ZNj6HvBfu3Gk8hnDPT5JhUL1ClSJbzSVSS0eH9V
         JCNEKvJSqVSL357wIvRraGpm3r8p+cGfRFw9I3r+lEi1Ib3LWMFZiI9b9uacjZn0Og9j
         k2e2FEyEVBZom2WDcx6zOvKvx5Xm/ZlDw28vgPT2xK4H30wrUgdMsMQSZNhf7omBdaLH
         C6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444051; x=1780048851;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuCxH5D+n2gNFhyOX5Y2of7w5Zcuoea+gH2Rlo6K2Go=;
        b=jf2bg2RctjHmCS4whUczZPGmoMmcEpE/udFo6+s6u0eN8OocxrfBBkV7iiN1rxcp3d
         reVwxIach+IkGqumeacxYJAG5UMRKYHP/lFCssoDL2o/cCAB9RydpImdHsiSB+qhhXbZ
         ykPWO438yynwjSvGzdQq77z7RmX0NxDxj++whgEMJ5/P9OmLzdr5ZirftiDXOi2VuG1j
         NEmHHDt/cQpR5GLGSCaZYaFiMyQbCzR7M/rFMgvXiNrPxLShlJfGpDT5imrhyzbmEj3D
         m0BiW4M/nvNl2ARwzy/tOYNre1M5tOJ7kEVoEyQvyoiUOv6LVQkj+TW+cLqoqgbYoiOg
         k7xQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZKKJ2YSZlWOpscT6ljicAuovdE9FQi+WJ+XNbkmi5f7xvaqYeq3K4a3ebOkB5LB1WYiIE6hN3lr+ZZjfu@vger.kernel.org
X-Gm-Message-State: AOJu0YzFinr98ijln2MlhiXgUXmummzo1jppv4bvFmfmp/JiTAm2YLGU
	r5OTGHOZGbC2C5JASVXO8AvT++3K3gm5gSMdonlurK+0R7wozA6R0Z0Iscj9I6xHjE8y2mRXtNq
	yVfMgNB0jMpRPxcBMCP91PFgQw2KgTUc0qZwpssCgtimEYkqKPeLV+4UN919mwTP/p8wE
X-Gm-Gg: Acq92OEvtNiHNKSdIGW4XXMSi/nf2MlicNDYlyDN5B41WEv4/BnThpz2/xaR9Iy3mlQ
	Y+6YHrGUft7UNHMNfZUxOwIpw3o2xoWv8RnJEheY+PaS5YaeYmNV7Po9e3d8JN8l1sP9ySmuhIh
	xFg7rim61Z9ooKlwVfyb23u3Av9nz0JE3miTBEzIoYThz1jfwgymYBnpMjCqkuNsoGZJbZzorpI
	QgTATNsjYq9R0W1qrUzwtSp+65LFasSbp969l+tF5SaXwIbZcIISYHwMOTBFTRPGWnf7TiV71Bd
	OnSjAm49z+qVIvVkiojHMLJo/pFnlSt7P2dWX+GEkjPuZhx7Uk/9ik4+O8uPzDWU2up+Cd99iwi
	j8ZnKrXYHfV/1JYmhZHKuXPGw+CMK5Sl36fhGh8ScoEMaxJ6TljMmxJyL
X-Received: by 2002:a05:6a00:3e01:b0:82f:1369:7268 with SMTP id d2e1a72fcca58-8415f5dcf42mr2983497b3a.30.1779444050982;
        Fri, 22 May 2026 03:00:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e01:b0:82f:1369:7268 with SMTP id d2e1a72fcca58-8415f5dcf42mr2983208b3a.30.1779444048116;
        Fri, 22 May 2026 03:00:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:00:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/6] bus: mhi: Fix broken runtime PM design
Date: Fri, 22 May 2026 15:30:31 +0530
Message-Id: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD8pEGoC/13MQQ7CIBCF4as0s5YGUFJx5T1MY5BOZRKBCm2ja
 Xp3se7cTPJP8r4FMibCDKdqgYQzZYqhhNxVYJ0Jd2TUlQbJpRJCHpl3dE1TGMnj4FnfGOyUtFa
 pBspmSNjTa/MubWlHeYzpvfGz+H5/kuTiT5oF46w3N33Ya21No84x5/o5mYeN3tflQLuu6wcpq
 3SisQAAAA==
X-Change-ID: 20251128-mhi_runtimepm-f7aed52cc557
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=3236;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+1xqvOBtTjhR467f4KD24eV71y2gTMox1bK7uo2F8/c=;
 b=iacSYbanGsCgJO+FPf6WYlX9gd+HwgLu3fqlbeWGrFLEf8k83HR9i9JLXwUGXl1VNyUq9NpK0
 IN5Dw8Qus9yCJf1P0rKQA7/BzSTy5rzWWcg3vO/q5CYIoLB3Wz41hRb
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfXxGxFip57Me57
 USJABItO5+jYS0KiJr5H8A0w6K8m2rNNrJyxhum5SP6DQys/MA3GwIFejzXJ9W7oMbli7UmhmGz
 Xu4F1KuAIp9DhS31k3+xcr01UcRB7Q7muIZQ1/1UfAJxJSDztJg+hHyw+6OL4JpLR3emboWjaZA
 cDBVH8KNgaK4xHg0d4rQOWNsF1ABMwwbHOBxf5VkzEUf6tV06OmxJgMw513noMwZTnq89EsyevQ
 YNhCv8PXvafCNlezTyryprRY5VaTuO5lEgdO8NdZtw2PfdRlBOQRN7zR8vPMc5wDEcUdd0okdaA
 BgF0q8ySDEjYSagnEn5mmGIrDSiUi5MREAbRG9NpSzO+R+3T7FXY1ADsfMb6mOKJobsP6UE+kpi
 UDEqA7ikg5w3unA5hlRfXcuAlG2G4Brwj9kPBq4v1PcWUv98oZF22KMwchyJ1adf3uSM8nkEi/M
 e8pPRMpzpGu+gcMPgqw==
X-Proofpoint-GUID: xocdHSr2wUpGK99FPQCqauyTqCA-hjvB
X-Proofpoint-ORIG-GUID: xocdHSr2wUpGK99FPQCqauyTqCA-hjvB
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a10295a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KH93JrovTcJc50lypuwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109227-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,sipsolutions.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F08375B195F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current MHI runtime PM design is flawed, as the MHI core attempts to
manage power references internally via mhi_queue() and related paths.
This is problematic because the controller drivers do not have the
knowledge of the client PM status due to the broken PM topology. So when
they runtime suspend the controller, the client drivers could no longer
function.

To address this, in the new design, the client drivers reports their own
runtime PM status now and the PM framework makes sure that the parent
(controller driver) and other components up in the chain remain active.
This leverages the standard parent-child PM relationship.

Since MHI creates a mhi_dev device without an associated driver, we
explicitly enable runtime PM on it and mark it with
pm_runtime_no_callbacks() to indicate the PM core that no callbacks
exist for this device. This is only needed for MHI controller, since
the controller driver uses the bus device just like PCI device.

NOTE: As we have dependecies with other subsystems, Mani can you take
these series through MHI tree if other maintainers give a ack for this
series. To all the maintainers please ack to this series after reviewing
so that Mani can take this through MHI branch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Rewrite commit messages (Bjorn Andersson)
- Remove autosuspend and use normal runtime get/put API's as there is
  already autosuspend in controller driver which waits significant time.
- Add pm_runtime_get()/get_sync() error handling.
- Add rumtime pm for wwan and qrtr.
- Link to v1: https://lore.kernel.org/r/20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com

---
Krishna Chaitanya Chundru (6):
      bus: mhi: Replace controller runtime_get/put callbacks with direct PM runtime APIs
      bus: mhi: Drop controller runtime PM callback indirection
      net: mhi_net: Hold runtime PM during active data path operations
      net: qrtr: Hold runtime PM during active data path operations
      net: wwan: Hold runtime PM during active data path operations
      bus: mhi: host: Fix runtime PM ownership between clients and controller

 drivers/accel/qaic/mhi_controller.c   | 11 -------
 drivers/bus/mhi/host/init.c           |  4 ++-
 drivers/bus/mhi/host/internal.h       |  7 ++--
 drivers/bus/mhi/host/main.c           | 21 ++----------
 drivers/bus/mhi/host/pci_generic.c    | 24 ++------------
 drivers/bus/mhi/host/pm.c             | 18 +++++------
 drivers/net/mhi_net.c                 | 39 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.c | 10 ------
 drivers/net/wireless/ath/ath12k/mhi.c | 11 -------
 drivers/net/wwan/mhi_wwan_ctrl.c      | 60 ++++++++++++++++++++++++++++++++++-
 drivers/net/wwan/mhi_wwan_mbim.c      | 44 ++++++++++++++++++++++++-
 include/linux/mhi.h                   |  4 ---
 net/qrtr/mhi.c                        | 57 +++++++++++++++++++++++++++++++--
 13 files changed, 216 insertions(+), 94 deletions(-)
---
base-commit: a293ec25d59dd96309058c70df5a4dd0f889a1e4
change-id: 20251128-mhi_runtimepm-f7aed52cc557

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


