Return-Path: <linux-arm-msm+bounces-100252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHxDK3RYxmkrJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:14:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 341CE3424AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA8CD312366F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C9C40DFB0;
	Fri, 27 Mar 2026 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rfad8WU/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aM5v/JV/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679A3A8724
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606117; cv=none; b=ErbGR49lw03aTfmE/jXf2jlBBe4DGTR6UorUAVBGmeDEwOdcxhpxSpR2f5V5A1IP7UqZEWsctu9WcIHWyzDKKpygWlQ4iovLXB0+seowDx/T9VWGff3g86s/qTKeG/eRle7whz+ci2fAEweQJjqwih3LKaStA/iX0fVx4ERweGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606117; c=relaxed/simple;
	bh=W8MngHpjqLAWwEI5uwRfVWrdOUQHWF43k4VpXCgnoHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBFxzRy9JYMcGTK1QajrO+RwvEIS4GI4cMWRvLdLwR3/0AXwnAKZSr/Sci3Cb7gYeYqqrT3+yuCUNIGHH8uNynF6wQlLvYeMyHUwXzPWUyuB9tDfioS5pgvECiaaqCBmi384k4eu3dRCZgSRKXqCZnFHExdVaFhZz7RYBTsScuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rfad8WU/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aM5v/JV/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vnEs3713706
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPRmoAwV+p2kNLWuKf8uXHWLY7sYAFBhKbCdvIyoYZk=; b=Rfad8WU/6xFi56if
	5YZKqIZw+xeJlWPDYUak59sgnCfK7sNbf+70NDc+arI00fsngd2sGSMhr8jNXjdd
	Ms28frCerbn+NAyn31GKnDT9dxZ6D2IHQ7eLEqBXTMLm8wodiUV01EYAA32W/yzS
	uIOylHRrhvF8VbUxyqy2Fh3TzUyfb5yqyHtqfW1ZGIF+iY1zi+aMsg+d/G8O/jHy
	kThZISNN1rd+WMtRBQFOArJFQeyXD8RoE6IqRVCxnXOA6YOJznwsRgCN2lzmi//a
	7sBqRz8Nxlm1ZHifklfpWE7QDO5Cu3ZxZsFa4AiPdQRjSGRJA9zQRKOTSrFelkJY
	4rDo3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapsme7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b08025f240so24804665ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606114; x=1775210914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPRmoAwV+p2kNLWuKf8uXHWLY7sYAFBhKbCdvIyoYZk=;
        b=aM5v/JV/Um/NcsXdHZVImkh2szCSlGsEVLmGEpHSsyZYnOqtVbbW3Cn1ipOLHK9eXM
         7F9i0ptt8otsxokWC8hkJiWCDOgRtvruvL1nIMK7ae1pmeQYkNSfgOlschgoYg7Q3Yf5
         9Keau7S81gu181dI60e/cDy1oRvXhDTFreDI3oj671M5iN+bouM0ZEJOXHNDct8/OSLK
         jXM+MYwJfNLmrq1Hh2KzVjTD1IPvFfxp4HTHJ396iKKjUSU3N6fUYEhuAFhuXqzl0oOJ
         ZXmCQNkV0TXeEwt7VQYvqpXs6pxxdhmDMLxqRrDMk9sfl9Gj1XVg5er23Bw/JqBePhdn
         a+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606114; x=1775210914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gPRmoAwV+p2kNLWuKf8uXHWLY7sYAFBhKbCdvIyoYZk=;
        b=e+rQwZjMago+9KRNhqMOihaLu3yVshgMAc8kYrpcxu4fBWkjHiaU8Ipk+kxplYM53S
         xOiQJ48Fl6yYMDRq/WXT9naRHCjDr7N0hFDWpwQojKMEiZmF9NX3aGj1Sir2vLBsjDQZ
         l2Vu5DG/5PyEQGcnIV+m/g/MmFdiSsBEYt1TczHddUHpKjSwnXCZjorveXCcpQFOBIP4
         OwKUzQ3zG7o+JYie3KX3EVaqIjWXpOwIu99NcdWVV0p99vXwZaKGa8CW/l2/TFeEsigI
         gPDrzdShCrVH5rH6PVzjEHJz6t6q1fgocC8DrvcOMIyAIeOh6JgJjEaOoA9PPVILxL9L
         eDmw==
X-Gm-Message-State: AOJu0YxTd51OGFPb6sxhD79mSB8nCeKVeNT5VLNW4QTJ9z+1fJ3rhqN9
	6Tz1I4KxuIlM8J2oaktsIr+DNTIAVM81tQcvYepO3zeuk/aVoORt/HRhIBS2aIIlJEuWJR3l3r5
	3+YXE435cXMfKVQVsqSdeOXuIJz6h2KTYYn9t6YGHawOU3uLusjcKPtQUvnWBXunghZch
X-Gm-Gg: ATEYQzzJ5hPlkI+G5d7NMEcmDOAzrQ13Gh7uC8DB07I/0PqRmIn5u5u7KtHCl9r55/V
	U4VIMbbK5nzBQ33zAqfCvaNEko2AjCu91LC00sQIP2q79cqC3r0HmzbJF9p1gSOb3Isw6QEaqdH
	kOrZZdtcTyN7WMDEC/nGErNBAcicTnWxHd1adsn7HMnpPge5HhfozkMCQ7UlssDooybEWNpmjn2
	4w65pX0XTi8CrPJh/Y4WjNtdO5KVNimmStWW5dkjE1LBa9dKLBdFa0mVqDFkpO6A+PRAf6MgA72
	3Jmqf6j12zMDX7XHnBIrIv0iOaOxl5Tc+L/ACP1mAQ45XiE0BD4tcUztwwfdTB/TkHaBv4S5W7j
	lq1F1NgBo7a3LnybyEwRKMSRvFVVquEyvA26Gx7fARKsR6s8E4B0JHboiEouTTCkF80x94M1PuU
	Z2MXtVwbI8LY6TJtLiD7jUUC+MMms8uMm3Ug==
X-Received: by 2002:a17:902:d2d2:b0:2b0:5629:37fa with SMTP id d9443c01a7336-2b0ce5ee51amr17538265ad.24.1774606114091;
        Fri, 27 Mar 2026 03:08:34 -0700 (PDT)
X-Received: by 2002:a17:902:d2d2:b0:2b0:5629:37fa with SMTP id d9443c01a7336-2b0ce5ee51amr17537985ad.24.1774606113516;
        Fri, 27 Mar 2026 03:08:33 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:33 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:15 +0530
Subject: [PATCH v7 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-2-7684c915e42c@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
In-Reply-To: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=17289;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=XumAIr6e1i9sxQiah1xpqhujDgR+St9AsC9LqKtP6aY=;
 b=hi+n+k2L4g9ct1YH/wbAdazkb26rbvIhwdYt++AuU1tVOhAYDdYHha4Ccdp5MPMFUiXQizhUP
 TopVFSRqRI0CmR1W7C0Z+HjoY86LsQMB4m1oYOMfeuFdFdfmrSx5lGn
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c65722 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=ZZkxa-lhXBFmNfqa1H8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX33+/znwD7Z70
 +dH4WjnrO8D601pY1NhbL6GFJhuzIJmnWbawAKMxK1xIcM/bXLjeC5JOnlxZuFIsLgeNMsDt5TO
 TITkD/yd31YjQWc8hx4cJMCarYR7o9qsHPYwU2FzxMwx4oQYX+uhHvZf/hCQw7rvXcXQ6zcQNnW
 wKnNrh8cfLcX/J8jdPq7HxbrXxMcQZpZ+eSGNZmMapgnUuOxfXg9+p8YBh5DEFvINsUyiCMyftJ
 +oI/dg6d+tk1Sq61cRB9fWZ4VQS6HVascIbdqMaeC9YGlmESnnWCN3j13uSOvnCha4KgqbghA6S
 r9jK27FBQSlPfNbsdKVMQ5YYURfGea8qa6/lMIlimNMhvwH6FQg4/GXFuNaMzpjTuEvGWthC8LY
 /tGpBJjRVelSXf7xqJge03YjHijBcVbnp2QIMfYqTtJ6s4poOXPDRYCzRxn/wAbm7ESEu7YQsPY
 4OpclL+UxJTk0yCnxwg==
X-Proofpoint-GUID: 1L00Nmv44zFmTVH8iVe-nBlBPW_hUnbd
X-Proofpoint-ORIG-GUID: 1L00Nmv44zFmTVH8iVe-nBlBPW_hUnbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-100252-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 341CE3424AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the
EC.

Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 MAINTAINERS                            |   8 +
 drivers/platform/arm64/Kconfig         |  12 +
 drivers/platform/arm64/Makefile        |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c | 451 +++++++++++++++++++++++++++++++++
 4 files changed, 472 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30ca84404976..536dfd9adff4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21804,6 +21804,14 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
 F:	drivers/misc/fastrpc.c
 F:	include/uapi/misc/fastrpc.h
 
+QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
+M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
+F:	drivers/platform/arm64/qcom-hamoa-ec.c
+
 QUALCOMM HEXAGON ARCHITECTURE
 M:	Brian Cain <brian.cain@oss.qualcomm.com>
 L:	linux-hexagon@vger.kernel.org
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 10f905d7d6bf..025cdf091f9e 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -90,4 +90,16 @@ config EC_LENOVO_THINKPAD_T14S
 
 	  Say M or Y here to include this support.
 
+config EC_QCOM_HAMOA
+	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	help
+	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
+	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
+	  control, temperature sensors, access to EC state changes and supports
+	  reporting suspend entry/exit to the EC.
+
+	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
+
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index 60c131cff6a1..7681be4a46e9 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
 obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
 obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
+obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
new file mode 100644
index 000000000000..0f883130ac9a
--- /dev/null
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -0,0 +1,451 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/thermal.h>
+
+#define EC_SCI_EVT_READ_CMD	0x05
+#define EC_FW_VERSION_CMD	0x0e
+#define EC_MODERN_STANDBY_CMD	0x23
+#define EC_FAN_DBG_CONTROL_CMD	0x30
+#define EC_SCI_EVT_CONTROL_CMD	0x35
+#define EC_THERMAL_CAP_CMD	0x42
+
+#define EC_FW_VERSION_RESP_LEN	4
+#define EC_THERMAL_CAP_RESP_LEN	3
+#define EC_FAN_DEBUG_CMD_LEN	6
+#define EC_FAN_SPEED_DATA_SIZE	4
+
+#define EC_MODERN_STANDBY_ENTER	0x01
+#define EC_MODERN_STANDBY_EXIT	0x00
+
+#define EC_FAN_DEBUG_MODE_OFF   0
+#define EC_FAN_DEBUG_MODE_ON    BIT(0)
+#define EC_FAN_ON               BIT(1)
+#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
+#define EC_MAX_FAN_CNT		2
+#define EC_FAN_NAME_SIZE	20
+#define EC_FAN_MAX_PWM		255
+
+enum qcom_ec_sci_events {
+	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
+	EC_FAN2_STATUS_CHANGE_EVT,
+	EC_FAN1_SPEED_CHANGE_EVT,
+	EC_FAN2_SPEED_CHANGE_EVT,
+	EC_NEW_LUT_SET_EVT,
+	EC_FAN_PROFILE_SWITCH_EVT,
+	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
+	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
+	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
+	/* Reserved: 0x39 - 0x3c/0x3f */
+	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
+};
+
+struct qcom_ec_version {
+	u8 main_version;
+	u8 sub_version;
+	u8 test_version;
+};
+
+struct qcom_ec_thermal_cap {
+#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
+#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
+#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
+	u8 fan_cnt;
+	u8 fan_type;
+	u8 thermistor_mask;
+};
+
+struct qcom_ec_cooling_dev {
+	struct thermal_cooling_device *cdev;
+	struct device *parent_dev;
+	u8 fan_id;
+	u8 state;
+};
+
+struct qcom_ec {
+	struct qcom_ec_cooling_dev *ec_cdev;
+	struct qcom_ec_thermal_cap thermal_cap;
+	struct qcom_ec_version version;
+	struct i2c_client *client;
+};
+
+static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
+{
+	int ret;
+
+	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
+
+	if (ret < 0)
+		return ret;
+	else if (ret == 0 || ret == 0xff)
+		return -EOPNOTSUPP;
+
+	if (resp[0] >= resp_len)
+		return -EINVAL;
+
+	return 0;
+}
+
+/*
+ * EC Device Firmware Version:
+ *
+ * Read Response:
+ * ----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * ----------------------------------------------------------------------
+ * | 0x00	| Byte count	| Number of bytes in response		|
+ * |		|		| (excluding byte count)		|
+ * ----------------------------------------------------------------------
+ * | 0x01	| Test-version	| Test-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ * | 0x02	| Sub-version	| Sub-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ * | 0x03	| Main-version	| Main-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_read_fw_version(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct qcom_ec_version *version = &ec->version;
+	u8 resp[EC_FW_VERSION_RESP_LEN];
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+
+	version->main_version = resp[3];
+	version->sub_version = resp[2];
+	version->test_version = resp[1];
+
+	dev_dbg(dev, "EC Version %d.%d.%d\n",
+		version->main_version, version->sub_version, version->test_version);
+
+	return 0;
+}
+
+/*
+ * EC Device Thermal Capabilities:
+ *
+ * Read Response:
+ * ------------------------------------------------------------------------------
+ * | Offset		| Name		| Description				|
+ * ------------------------------------------------------------------------------
+ * | 0x00		| Byte count	| Number of bytes in response		|
+ * |			|		| (excluding byte count)		|
+ * ------------------------------------------------------------------------------
+ * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
+ * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
+ * |			|		| Bit 5-6: Reserved			|
+ * |			|		| Bit 7: Data Valid/Invalid		|
+ * |			|		|	 (Valid - 1, Invalid - 0)	|
+ * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
+ * |			|		|	    (1 present, 0 absent)	|
+ * ------------------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_thermal_capabilities(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
+	u8 resp[EC_THERMAL_CAP_RESP_LEN];
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+
+	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
+	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
+	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
+
+	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
+		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
+
+	return 0;
+}
+
+static irqreturn_t qcom_ec_irq(int irq, void *data)
+{
+	struct qcom_ec *ec = data;
+	struct device *dev = &ec->client->dev;
+	int val;
+
+	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
+	if (val < 0) {
+		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
+		return IRQ_HANDLED;
+	}
+
+	switch (val) {
+	case EC_FAN1_STATUS_CHANGE_EVT:
+		dev_dbg_ratelimited(dev, "Fan1 status changed\n");
+		break;
+	case EC_FAN2_STATUS_CHANGE_EVT:
+		dev_dbg_ratelimited(dev, "Fan2 status changed\n");
+		break;
+	case EC_FAN1_SPEED_CHANGE_EVT:
+		dev_dbg_ratelimited(dev, "Fan1 speed crossed low/high trip point\n");
+		break;
+	case EC_FAN2_SPEED_CHANGE_EVT:
+		dev_dbg_ratelimited(dev, "Fan2 speed crossed low/high trip point\n");
+		break;
+	case EC_NEW_LUT_SET_EVT:
+		dev_dbg_ratelimited(dev, "New LUT set\n");
+		break;
+	case EC_FAN_PROFILE_SWITCH_EVT:
+		dev_dbg_ratelimited(dev, "FAN Profile switched\n");
+		break;
+	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
+		dev_dbg_ratelimited(dev, "Thermistor 1 threshold crossed\n");
+		break;
+	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
+		dev_dbg_ratelimited(dev, "Thermistor 2 threshold crossed\n");
+		break;
+	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
+		dev_dbg_ratelimited(dev, "Thermistor 3 threshold crossed\n");
+		break;
+	case EC_RECOVERED_FROM_RESET_EVT:
+		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
+		break;
+	default:
+		dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
+}
+
+static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	*state = EC_FAN_MAX_PWM;
+
+	return 0;
+}
+
+static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
+
+	*state = ec_cdev->state;
+
+	return 0;
+}
+
+/*
+ * Fan Debug control command:
+ *
+ * Command Payload:
+ * --------------------------------------------------------------------------------------
+ * | Offset		| Name		| Description					|
+ * --------------------------------------------------------------------------------------
+ * | 0x00		| Command	| Fan control command				|
+ * --------------------------------------------------------------------------------------
+ * | 0x01		| Fan ID	| 0x1 : Fan 1					|
+ * |			|		| 0x2 : Fan 2					|
+ * --------------------------------------------------------------------------------------
+ * | 0x02		| Byte count = 4| Size of data to set fan speed			|
+ * --------------------------------------------------------------------------------------
+ * | 0x03		| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
+ * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
+ * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
+ * --------------------------------------------------------------------------------------
+ * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
+ * | 0x05		|		|						|
+ * --------------------------------------------------------------------------------------
+ * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
+ * ______________________________________________________________________________________
+ *
+ */
+static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_cdev)
+{
+	struct device *dev = ec_cdev->parent_dev;
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
+			  EC_FAN_DEBUG_MODE_OFF, 0, 0, 0 };
+	int ret;
+
+	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
+					     sizeof(request), request);
+	if (ret) {
+		dev_err(dev, "Failed to turn off fan%d debug mode: %d\n",
+			ec_cdev->fan_id, ret);
+	}
+
+	return ret;
+}
+
+static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+{
+	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
+	struct device *dev = ec_cdev->parent_dev;
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
+			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
+			  0, 0, state };
+	int ret;
+
+	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
+					     sizeof(request), request);
+	if (ret) {
+		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
+		return ret;
+	}
+
+	ec_cdev->state = state;
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
+	.get_max_state = qcom_ec_fan_get_max_state,
+	.get_cur_state = qcom_ec_fan_get_cur_state,
+	.set_cur_state = qcom_ec_fan_set_cur_state,
+};
+
+static int qcom_ec_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+					 EC_MODERN_STANDBY_ENTER);
+}
+
+static int qcom_ec_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+					 EC_MODERN_STANDBY_EXIT);
+}
+
+static int qcom_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct qcom_ec *ec;
+	unsigned int i;
+	int ret;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->client = client;
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
+					IRQF_ONESHOT, "qcom_ec", ec);
+	if (ret < 0)
+		return ret;
+
+	i2c_set_clientdata(client, ec);
+
+	ret = qcom_ec_read_fw_version(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
+
+	ret = qcom_ec_sci_evt_control(dev, true);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
+
+	ret = qcom_ec_thermal_capabilities(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
+
+	if (ec->thermal_cap.fan_cnt == 0) {
+		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
+		return 0;
+	}
+
+	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
+	if (!ec->ec_cdev)
+		return -ENOMEM;
+
+	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+		char name[EC_FAN_NAME_SIZE];
+
+		scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
+		ec_cdev->fan_id = i + 1;
+		ec_cdev->parent_dev = dev;
+
+		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, ec_cdev,
+									&qcom_ec_thermal_ops);
+		if (IS_ERR(ec_cdev->cdev)) {
+			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
+					     "Failed to register fan%d cooling device\n", i);
+		}
+	}
+
+	return 0;
+}
+
+static void qcom_ec_remove(struct i2c_client *client)
+{
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct device *dev = &client->dev;
+	int ret;
+
+	ret = qcom_ec_sci_evt_control(dev, false);
+	if (ret < 0)
+		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
+
+	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+
+		qcom_ec_fan_debug_mode_off(ec_cdev);
+	}
+}
+
+static const struct of_device_id qcom_ec_of_match[] = {
+	{ .compatible = "qcom,hamoa-crd-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
+
+static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
+	{ "qcom-hamoa-ec", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
+		qcom_ec_suspend,
+		qcom_ec_resume);
+
+static struct i2c_driver qcom_ec_i2c_driver = {
+	.driver = {
+		.name = "qcom-hamoa-ec",
+		.of_match_table = qcom_ec_of_match,
+		.pm = &qcom_ec_pm_ops
+	},
+	.probe = qcom_ec_probe,
+	.remove = qcom_ec_remove,
+	.id_table = qcom_ec_i2c_id_table,
+};
+module_i2c_driver(qcom_ec_i2c_driver);
+
+MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1


