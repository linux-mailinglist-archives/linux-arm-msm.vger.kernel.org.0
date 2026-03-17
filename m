Return-Path: <linux-arm-msm+bounces-98146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COKUDfwuuWlzuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:37:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 962592A808E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 879BF3219686
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E426F1D6187;
	Tue, 17 Mar 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5GpOGej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwXgRfVO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749823A5E76
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743274; cv=none; b=aFX60J4MItLerl6XWscu7T2Vi+LQcAfPjFAtu7NTZffElc99Y56g8BX+eWjQFOaLfIPZe4M+zI2F7unkuLV2xIvl1B53KAqxrhSpKh079FxQ36rHeGEsVk/aT5CqRm75ist3z2qFBXGP+Y7c/ffPBqBuziFJcL7M+lMwin6Ys1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743274; c=relaxed/simple;
	bh=Wv9Le7mBgyQvDEQxKS0VD06CuMcA8Yv2iRruSyYTEdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sWfdNxSotMnaHGyJM4brNN6RZWwLnQRiwCBPifcGsBVbcsT0iX5sc8WWYyBecwgrcunWLePbYFevwi59l94yUHUJHvt/RjK11hXIdLx50hb6h4n92fwDbyZMBBDm7+/bKnUYpKa+dka9SvmRVtSFwjW6ZSRX2NLoYwT8geMiAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5GpOGej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwXgRfVO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7JHWs3124251
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oMe9m9KfSB/KXji7mjTpys
	JkU6Pplkay44063+xqQ5s=; b=Z5GpOGejCL6ldjVxCEX0JIxga7tLISIpWEVlNj
	LnAstR20Kz1WEa+XLbBWC4V7Z+of0gMK0RDqQUEDG8eZcDe65xQH+gVQOU+JD+D2
	nSH35sI9EkSpHn2iRJ6nl/6shk1N0OlzGwo391yt4SUa9U3wR0KxqSWurorzQbvO
	B6DC1glYQ7WXyHMjZZJOq7saYsrdvD7xrpA7zonp4t74LRf/zPOtHtsFss1XSXl5
	HAV4Yi/+VYReV5cjZEi1M5SV/lNXntBAmkp7qKmVwUts6DXWSxmT0GC3VS/TMIu+
	9IVhIUaA2vU9ldsbqUCB8/DTyuG7YmHqsmh79gvnO2MrexUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2fbrqer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:27:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35b901d542bso20709803a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773743271; x=1774348071; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oMe9m9KfSB/KXji7mjTpysJkU6Pplkay44063+xqQ5s=;
        b=fwXgRfVOeH6KxIJ0u7jrYBUR1LpgNpYZ9YYhQKeiew95FQaefi4ZgsgeB4Sw3lr/bI
         rKv3HJTjWRa0eeIjzuPtm7P3WWUrz5PXstiGC2KFfXqi1V9jcoyzOxyZ5IwF4bDnZgug
         2vVQQoEDtpcaZwAl2+i8yOcRwhkXHVYbnYp0LcYAnc3DcZ05ThlSmU7unIWzeCtcUg4G
         4x5RZEFwWSGalx7w0KTG6o3tL8Q/BFgt23LdBpfBtAFjuSGydBy3N1KVty9/m9lTKiRK
         MVoxC7LczHXVtthepoi6YJ5DvbXa5GB3vxqEDopm7Y7dBXtUOmLkSuDG3YXHuTIn20Fu
         rxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773743271; x=1774348071;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMe9m9KfSB/KXji7mjTpysJkU6Pplkay44063+xqQ5s=;
        b=I2FiGgL+fNeYbuttt/Fe6l9zVWF+jLuRPi3AXqPIZuy1Ll3aZXmHcVyLJITSdfUG6T
         PXZZGlRgEDCO36A3thxIqKsI8iq/hyMPaQ1QV/67iH/dJoj1e4w22Ej6oFb9cq3RK6Wy
         NZ6O+urj7WTD3yTvWpItj7y1y1+cnB0T3Go5K9cXluM9tdCxx7Ji4d6RvFB9vV2QVJYJ
         XI5zhqh6fLYkb0+yeRlMySAQqfjdpJ75seNxV4ce03AM9bhUnRAc3PyEw27Fft5PPSgO
         ZxmTKHj40epoGNu0J4ePjiFPiGq39AHn2SvJzaoQql/narOCY40MxgHp/sq4YBpY+1Q2
         pTRg==
X-Gm-Message-State: AOJu0YzSp5Fa67DRlSNoULnhg/Z53/MDevGvNIYCdXLQOYfBjqEulDJO
	9ZEV4B42kSfO7CE7htrZo9JwHdU2IxnaafqgXq6sWnrcmbMprp+TEqThcD4msWt43fzF5FU4vyd
	ZPM61eu7qOcaXCldsz4y0VbVAOOdE4s/Zxx/kC1XhNv81wEnGzzs+CgTwl8AF4zNU5cwcVnr/dn
	8i
X-Gm-Gg: ATEYQzx9W/vV68VWG34TxoiVykVnH5MsTADJXduPwx/lO6tQWCcOhMMfO9lMivo4rwJ
	rASCyFhCTxcmuVdMHaXsDigxkKeso01VkptbqqGMl43fPpTuJYXJ5Tfuv8IyCFMiwKxlL4kp0Dc
	4Y7oIBA+J7o8ZvEZl5HPe5h780MwbXAa/BcscXbAe3V1Kg4gz6sid0yVJPKjsWCgs/wc0NUoFZK
	mu2sEI7mv2z48WEPDTpS8Yu6kmXA2bEpH+5wjcRlmB2WnvjLBr2jwLRUdpH9B0kZroTtv99tgDM
	hZF1BUKBjD+5f9OfaVRSbRDU+sKvIaMoFApp7vzRh9vSvL5sMU5euB1eaV7hJhH//HC34tFUGKP
	McL2TsZDb317egjleiqLKhgwuCMeIXjK5i6CoON67L0z6dsfg
X-Received: by 2002:a17:90b:2241:b0:35b:9894:f6d5 with SMTP id 98e67ed59e1d1-35b9894fa75mr7396178a91.31.1773743271038;
        Tue, 17 Mar 2026 03:27:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2241:b0:35b:9894:f6d5 with SMTP id 98e67ed59e1d1-35b9894fa75mr7396138a91.31.1773743270420;
        Tue, 17 Mar 2026 03:27:50 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdad9sm3178589a91.16.2026.03.17.03.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:27:49 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:57:23 +0530
Subject: [PATCH v2] drm/msm: default separate_gpu_kms to auto selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-separate_gpu_kms-v2-1-b027ca97b9fe@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIosuWkC/1WNwQqDMBBEf0X23Ii7Wms99T+KSNBVQ6uxWZUW8
 d8b7amXgTcwb1YQdoYF8mAFx4sRYwcPdAqg6vTQsjK1Z6CI0ijGVAmP2umJy3acy0cvKkpqqpq
 kviIT+NnouDHvQ3kvPHdGJus+x8OCe/uTEcW7jP9kCypUnFGMfGkwzc43KxK+Zv2sbN+HPqDYt
 u0L9CKNbLcAAAA=
X-Change-ID: 20260316-separate_gpu_kms-04d2cf4d91e2
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773743265; l=7486;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=Wv9Le7mBgyQvDEQxKS0VD06CuMcA8Yv2iRruSyYTEdc=;
 b=6rO7FArB9QUjw17Logyyusd9M+STidugTXbhzouqb/h/Mqj1Vk/DKVx1ImkNL8WFr3VFfukjA
 eL9P0lRYq41Ba8Go3JfgHmZYoNGuWGCFG+/RyUohxOHdDRGtj52Gm2F
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-ORIG-GUID: 5mfqMVPIUoWP6-hcY4omafGuRUjhuKmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA5MiBTYWx0ZWRfX1L/6gPiTS7Iy
 gVgHa/O/ou91RzWiQbWeZ1Aflf2Qlze+cRFYgcs2AZxX7BUpLM5o0eXYybxZZuLVbDP0FdRm2Nr
 wwCWc1VHP/49y+qMkyd1t0SS45mRun603Xsl7RQKT0yEOcwz4VyKnJZhm1WRuytmNAP/5X0L54M
 H3OnHtR6gxBg1XBg8T0DOGC3cWhXIw59Tp0v7jV1QZicVT1JxHuvAvhXM0oZMhRxwt4Rwvd0czl
 tQl0nhMhM48Fcr+mPBkPzVwjLe7C6Uzo1dSF7iTWrcnA/WqM7Ex/NV4jUwztzCHNtmYq8mclhWX
 ak5hZ+FpFLvFlgW8NdtCS68xL7w4M4nQoy8P93kuPCpaR42IXAr1fy6tJbJPQY/uahr5C2XGTML
 DEj8nTBnYskdWfl9qfre7+n0d7oqjgynclwiikxwRF7RluNde1PkXPcdvmRmIc0Wg0b/jyosd6q
 RFZXSHDbF/620wI6D3g==
X-Authority-Analysis: v=2.4 cv=fa6gCkQF c=1 sm=1 tr=0 ts=69b92ca8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5TsJt5EyTeYoDRTaIssA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 5mfqMVPIUoWP6-hcY4omafGuRUjhuKmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98146-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 962592A808E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On platforms with multiple display subsystems, such as SA8775P, the GPU
binds to the first display subsystem that probes. This implicit binding
prevents subsequent display subsystems from probing successfully,
breaking multi-display support.

Use the tristate separate_gpu_kms module parameter with the default
value set to auto (-1). In auto mode, the driver selects the binding
behavior based on the number of GPUs and display subsystems. This allows
display subsystems to probe independently when required, while
preserving the existing single-card behavior on simpler systems.

The separate_gpu_kms module parameter has the following semantics:

  -1 (auto, default):
     Select the binding mode based on hardware topology. If exactly one
     GPU and one display subsystem are present, bind them together to
     form a single DRM device. Otherwise, expose the GPU and display
     subsystems as separate DRM devices.

   0:
     Always bind the GPU and display together to form a single DRM
     device.

   1:
     Always expose the GPU and display subsystems as separate DRM
     devices.

This ensures correct probing on multi-display platforms without
affecting single-display, single-GPU systems.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com
---
Depends on:
  https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/

  When separate_gpu_kms is enabled, the GPU and display drivers are
  probed independently. In this configuration, the Adreno GPU driver
  may no longer be loaded implicitly via the display subsystem.

  The referenced patch adds a MODULE_DEVICE_TABLE() entry for the
  Adreno GPU device, ensuring proper module autoloading based on
  device tree matching. This is required to guarantee that the GPU
  driver is loaded correctly when GPU and display probing are
  decoupled.

Changes in v2:

    - Drop dependency on Lemans dual-DPU device tree changes as this patch
      works independently (Dmitry)
    - Switch separate_gpu_kms to tristate and default to auto mode (Rob)
    - Rename msm_gpu_no_components() to msm_separate_gpu_kms_components() for clarity
    - Link to v1: https://lore.kernel.org/r/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c              | 52 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.h              |  4 ++-
 drivers/gpu/drm/msm/msm_mdss.c             | 15 +++++++++
 4 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4edfe80c5be7..e40648c05797 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -272,7 +272,7 @@ static const struct component_ops a3xx_ops = {
 static int adreno_probe(struct platform_device *pdev)
 {
 	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
-	    msm_gpu_no_components())
+	    msm_separate_gpu_kms_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e5ab1e28851d..575d1aea7927 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,16 +54,54 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
-static bool separate_gpu_kms;
-MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
-module_param(separate_gpu_kms, bool, 0400);
+/*
+ * separate_gpu_kms (tristate):
+ *   -1 (default): decide automatically based on hardware topology. Split devices
+ *                 if there is more than one GPU or more than one display master.
+ *    0: force single DRM device (bind display + GPU)
+ *    1: force separate DRM devices
+ */
+static int separate_gpu_kms = -1;
+MODULE_PARM_DESC(separate_gpu_kms,
+		 "Use separate DRM device for the GPU (-1=auto (default), 0=single DRM device, 1=separate DRM devices)");
+module_param(separate_gpu_kms, int, 0400);
 
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
-bool msm_gpu_no_components(void)
+static const struct of_device_id msm_gpu_match[];
+static int msm_count_gpus(void)
+{
+	struct device_node *np;
+	int count = 0;
+
+	for_each_matching_node(np, msm_gpu_match) {
+		if (of_device_is_available(np) && adreno_has_gpu(np))
+			count++;
+	}
+
+	return count;
+}
+
+static bool msm_separate_gpu_kms_auto(void)
+{
+	int gpus = msm_count_gpus();
+	int mdss = msm_mdss_count_masters();
+
+	if (gpus <= 0 || mdss <= 0)
+		return false;
+
+	/* If exactly one GPU and one display subsystem single card */
+	return (gpus > 1) || (mdss > 1);
+}
+
+bool msm_separate_gpu_kms_components(void)
 {
-	return separate_gpu_kms;
+	if (separate_gpu_kms == 1)
+		return true;
+	if (separate_gpu_kms == 0)
+		return false;
+	return msm_separate_gpu_kms_auto();
 }
 
 static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
@@ -1030,7 +1068,7 @@ static int add_gpu_components(struct device *dev,
 static int msm_drm_bind(struct device *dev)
 {
 	return msm_drm_init(dev,
-			    msm_gpu_no_components() ?
+			    msm_separate_gpu_kms_components() ?
 				    &msm_kms_driver :
 				    &msm_driver,
 			    NULL);
@@ -1069,7 +1107,7 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
-	if (!msm_gpu_no_components()) {
+	if (!msm_separate_gpu_kms_components()) {
 		ret = add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6d847d593f1a..64a5ad35f7a2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -555,6 +555,8 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
-bool msm_gpu_no_components(void);
+bool msm_separate_gpu_kms_components(void);
+
+int msm_mdss_count_masters(void);
 
 #endif /* __MSM_DRV_H__ */
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..00e3ac7dab3a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -73,6 +73,21 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
+static const struct of_device_id mdss_dt_match[];
+
+int msm_mdss_count_masters(void)
+{
+	struct device_node *np;
+	int count = 0;
+
+	for_each_matching_node(np, mdss_dt_match) {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-separate_gpu_kms-04d2cf4d91e2

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


