Return-Path: <linux-arm-msm+bounces-99785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB4IEndzw2mxqwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:32:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4531FE06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67619303982C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134C22EC54A;
	Wed, 25 Mar 2026 05:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HrLe+SG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMiGO2Ox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA76257824
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774416757; cv=none; b=lCe8IjjdMt/mYI+IKoFVwl4bPY8Y3pgMZEZh8YGVOUKf25Hw6DqOPynkgb2E1xdV0V6ZRFBIqqU1FX0XS1k3Orybzw5B7CFXWWZW9rQAHOK/nyOszYzui4AvZGt/I65rLd3EJd4SA3GtMu266IEzaFCnR1aBQPUczGF8IP3ymas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774416757; c=relaxed/simple;
	bh=F3EVUq0Vr/T8oNnQm4MPoEwBvZKsm+fzQxuULgojRBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MaGBWKAmkFoLkuPFUXzpLfmW/z98kYcvZP8BH+5qGBha3/6RpqW5bVaFN0MyoLFUpMAw0iW9DGhmtU+3SOUKJGr1WjoLxnR07mCEaiHR59z+/B9hgBT8ZuGBB6SdD/ototzdSx2g7E0yB2qIDNBgkXHjMpJDhYNyA36t5vGlTNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HrLe+SG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMiGO2Ox; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4uiKR989140
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yc9FdsFxogjJOfz+eZ2mXs
	S3zXAd0UDxu0KaktPy4xY=; b=HrLe+SG1TEaUo8wMxqPH9yAyH1jkIuTBfbhPYo
	E8AcoTlzZO1o0TapSDgM+GzJ+/np207V70P2EIvSYhfjMhGhqKAxzbrp4E1uJGGO
	RZO5sKiQZaPAosmYSJwF1rh7FRIKET7C4+MRag2GrfG2M885VMINnFBp9gWbFHbG
	b+7O6nSegiJJaOpsv6Rgv94NmR3jUamWPcyJ+MgA6gHQIBCTW1mZZasvTXs7wv+M
	JDHquUX3F8ETWjWbbFfJGeWThxn3f1kQO10o93s7kF7JypL38uCx6dQ94cIq/52R
	6tRFBNg0Ru3cMJe+Kf6wKvBQKG8WVRHD5RsvOXeehvjDQWmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m37sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:32:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090bc4823cso17475971cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774416753; x=1775021553; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yc9FdsFxogjJOfz+eZ2mXsS3zXAd0UDxu0KaktPy4xY=;
        b=UMiGO2OxIcAYG2Dn6g3bseIxpE3UIiLJWOzDJKwNqcJcgeJaA4Vv0sGAsYrbjlXFGY
         IHgX29Uuj3o7edvrK6ipqnrvnbmSJAiu/aLHU+bkif4qQNmIW+lA1Mvbw+tf8qCeNV2q
         pfX2mrV3P39X+pJMAJk+pqIJgYgNWXdd7Q0kQsqRf/AXNo9BnoQsO3dV/d2MxLAnAQ8b
         p7bmbBGLufw0QpVDSsYbLUh3FCLs8xbGAvWLKgT/1VWd/9CRDxaKUQPBBbruaPM0bEc+
         c6e+UpPIMXTUTfyizf/axsTeLB6Nm+JHObj1BQArtYrUcaVDCRgVSfhOC9sXnDChrbab
         lYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774416753; x=1775021553;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc9FdsFxogjJOfz+eZ2mXsS3zXAd0UDxu0KaktPy4xY=;
        b=rlnovtlPJXQqK5mHLeus1Ph0CUCJtn6UIW9qEGiUy5SNIQdMTJW1E8t8BuX+i+pJOt
         6mBlbbQFA6HP33MzDeYyuZfoYsMxh5F+tgh2Yrk+1DL4hIbyXYQ4BeZzAGT+LrAXa+8E
         TFRlDVgp0zS+jR+dQIkWs/RLcjaFUfY6888PnO/kzYQtwnC0ArjhvTqF+GTVZfsftYeG
         dLGCx70IC3T7vFxLXCegGj08sLQ5mi0rDNthO7cWRrpX87ctfmDVnlZWRYVCF37JogE4
         VrLOAljIZWyPt3O3cqyIdNiW2LRLRoK/i6UpSu6pSA0hs0eQvHu5VT3Aai/nJRAvBUez
         z4Fg==
X-Gm-Message-State: AOJu0Yw0duQqUc1os+85FLFp0jhOfObW0aRw26cHD3+llVD5ZbVfeRoW
	EKUB4tw0SliuO2qbGq3Mdd1aYKbslcxdEbA1srmM8UQAM9zZ6ffwYV3IJBymJslp4IOL2xoXUIE
	e0kvf0QITvueXo0Xa8ETuWv3xARtMwPsvuW+Os4/WDL78LGb7bdT170qkTmQWq2OYfOI/
X-Gm-Gg: ATEYQzxIl9MOSTGyTAfoxm6aK1tbfpSYZLEbKJQxVoGYVUQ0Un2dAXXUw/HDQUVqCZD
	lW7w02nVSK2Bf6x5PgDlIAEU99JzanoQHVw4IfrUhM0UeXBbZdrjTIujgG+FMZYPhDDXqyMccpn
	9GRVk4+HNpG6r3g7+YJ1HIuYvtXiPZ+vhBdVk4tqm6Hl6cawTA0wm+MsaMfmkqe3zJnA7z3/Vmx
	DbOLsjamcs9XUvMBhYiVYvICU1Oo8uzewXU6YKWcpHBIT/XiiscbO6rieFbXFWD5ea7g9W7FOmH
	DpMO5ks0IltSzkW+ROcGHtTtxcHoImRJ45ThbRVhRBWN0sBSohptLcda2svcd3G4zgc83tKKo6R
	2A/9jJ1Lkb8Dvmqr2aUErMFGWBNb5gHQJwg4mvLvjsd2BPYQlVzPYGLiQSqZ8+hgLlc1izd8uco
	f+t7H7Bn7l4h975oI5vUVrbJ43ZC8o29c9UpY=
X-Received: by 2002:a05:622a:315:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b80ce9d96mr34821251cf.21.1774416753259;
        Tue, 24 Mar 2026 22:32:33 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b80ce9d96mr34820931cf.21.1774416752639;
        Tue, 24 Mar 2026 22:32:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192da8sm3629365e87.10.2026.03.24.22.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:32:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 07:32:27 +0200
Subject: [PATCH] drm/msm/dpu: correct DP MST interface configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-fix-dp-mst-interfaces-v1-1-186d1de3fa1b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGpzw2kC/yXMUQ6CMBCE4auQfXYTWlJBr2J8gDKFNbGSbjUmh
 LtT9PFLZv6VFEmgdK1WSviIyisWmFNFfu7jBJaxmGxtz3VjHQf58rjwUzNLzEih91CG6Uw7ON9
 cXKDyXRLK8Ne93f/W9/CAz0eMtm0Hri241HkAAAA=
X-Change-ID: 20260325-fix-dp-mst-interfaces-e1817b5c395f
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18058;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=F3EVUq0Vr/T8oNnQm4MPoEwBvZKsm+fzQxuULgojRBs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpw3NuPx9efFk9FNUNdLg1adV7Eoe2AUPfIquXi
 HBJcjX+nWaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacNzbgAKCRCLPIo+Aiko
 1QVYB/4/MfosDyZL8FSQthcIRSYQmba//qTqH7PZf5NnIVrcV/R+oGFqb+hTj99tmOnneOgoMpd
 UTapMo8bb7t+xfHDifLjLpHIuJyyUc1mErSE3ZoZ+mhGG0M6aCrknfz3NpZCWW1MS7krvm7boNM
 ITyyCX1psZKo4n/0CiOQxiFEowgnYGputEUKuIXecbO7SfAbnlsIOL/tcf3GQnle0mFpGHzfXfa
 DLEGPtiSWoWuA9qDXve+mmXHvnd2e/kob6v8MYkp9JF2eeRvJUPBiE+KlImuuCSn7q0dA1QFGBb
 f9RVUD7xn30tICA55oe0mFAfmszBNIwv/MdMg+8punhgsBl/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c37372 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=jJtEEUhPyClvrqEGy7EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3vLVt6NvLPuolqqz2qxeJdBmnQGvw6zk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzNiBTYWx0ZWRfX6s80l+AfXz3y
 bxjusy+Gu36c4/37P7O6N8CmW1BhCBH/VLspS009No72Z4tpojMmajaf19wbHzXwR7+JaPkN1BF
 3jFgv+9zGzlG+zNtioHZznIkr6JTfAjRbnj/OkQJ6gYRXt36u6KXYENFR9O/83Mtc+HxzAgotj2
 rdfUjB51Nn74yAqwwsFPI/lO8qBUMG6YCmMxE/q7YpDdiKyJM7CsL6FvrTZkxrlF4Y1MFdghC5K
 oHpaAR/lnQ3F8a1gQQ1suO7xFZq+ezy8vV0/J/9Sa7ENdxVbnv6jAAWCkwQxzcEKlw46yUCejQ6
 94juuAmYHoY+wL7mGDRJNcPIApmXFY1q2Cy4T5K1MChs3eDVFCtWNe2Wf6RL3u0Ka90hNWIqbu9
 XbaYM+98wJcJNVmBY0ZcrqqsmS2Yl1FQCUPlyymV0mdv9JIyPlKljqmbZWtcRr8FbE35Kp0iQVu
 Mtxwm7L6CyEcO4leFrA==
X-Proofpoint-GUID: 3vLVt6NvLPuolqqz2qxeJdBmnQGvw6zk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250036
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99785-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6E4531FE06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Due to historical reasons we ended up with dummy values being specified
for MST-related interfaces some of them had INTF_NONE, others had
non-existing DP controller indices. Those workarounds are no longer
necessary. Fix types and indices for all DP-MST related INTF instances.

The only exception is INTF_3 on SC8180X, which has unique design. It can
be used either with INTF_0 / DP0 or with INTF_4 / DP1. This interface is
left with the dummy value until somebody implements necessary bits for
that platform.

Co-developed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This is based on the earlier patch written by Abhinav and later updated
and resent by Yongxing. Sadly, despite the previous request, the patch
wasn't updated to fix all platforms. Fix all of them at once.
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 13 ++++++-------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  9 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  7 +++----
 16 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 56d3c38c8778..bd8139b5d711 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -378,7 +378,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
index db8cc2d0112c..73c19a942d29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
@@ -420,7 +420,7 @@ static const struct dpu_intf_cfg sm8750_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x4bc,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
index 13bb43ba67d3..a3b590cca21d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
@@ -426,7 +426,7 @@ static const struct dpu_intf_cfg glymur_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x400,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -458,7 +458,7 @@ static const struct dpu_intf_cfg glymur_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x400,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -466,7 +466,7 @@ static const struct dpu_intf_cfg glymur_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x400,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
index 0b20401b04cf..80c532a78b78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
@@ -418,7 +418,7 @@ static const struct dpu_intf_cfg kaanapali_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x190000, .len = 0x4bc,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 5cc9f55d542b..1a201cb7746d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -258,7 +258,7 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index ae1b2ed96e9f..adad0114fbb7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -317,7 +317,7 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index a56c288ac10c..d81d3c616b3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -230,7 +230,7 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 26883f6b66b3..e65f198db9a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -186,7 +186,7 @@ static const struct dpu_intf_cfg sm6150_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 7b8b7a1c2d76..1562b8363f3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -301,7 +301,7 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 85aae40c210f..1d8a32d10990 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -327,7 +327,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9f2bceca1789..c407f01abca7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -288,7 +288,6 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 	},
 };
 
-/* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -319,8 +318,8 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
-		.controller_id = MSM_DP_CONTROLLER_0,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
@@ -351,16 +350,16 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
-		.controller_id = MSM_DP_CONTROLLER_2,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19),
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_8 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 04b22167f93d..6a09da5ed670 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -340,7 +340,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 42cf3bd5a12a..0b78180eca81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -316,7 +316,6 @@ static const struct dpu_wb_cfg sa8775p_wb[] = {
 	},
 };
 
-/* TODO: INTF 3, 6, 7 and 8 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sa8775p_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -347,7 +346,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -363,7 +362,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
@@ -371,7 +370,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -379,7 +378,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 4c7eb55d474c..1f06710dafad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -335,7 +335,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index dec83ea8167d..078f5285c46b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -335,7 +335,7 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
 		.type = INTF_DP,
-		.controller_id = MSM_DP_CONTROLLER_1,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 52ff4baa668a..4d2bf5c7ac98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -304,7 +304,6 @@ static const struct dpu_wb_cfg x1e80100_wb[] = {
 	},
 };
 
-/* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg x1e80100_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -335,7 +334,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -367,7 +366,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -375,7 +374,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),

---
base-commit: 6efced27f5df9d7a57e4847fe2898cdd19f72311
change-id: 20260325-fix-dp-mst-interfaces-e1817b5c395f

Best regards,
--  
With best wishes
Dmitry


