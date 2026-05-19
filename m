Return-Path: <linux-arm-msm+bounces-108322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDoKO4D5C2qISwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:47:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9F5778A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C74303A91A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05D534DCD6;
	Tue, 19 May 2026 05:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivDzhSe2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+JyzM90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8599134E75D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169645; cv=none; b=Ks/dvMvtqQ8s4Nayy3mUWiy5rY3E+GNK3lE5puqYbqOVwk1/B4G6KDUuwEEcXpJeEkFjDF+Zb81dHfNnfLjdQH36sFy+NeefEg2MGRpMM38newholSzOe8vWBTWBkBFj+5KnhJcAUEOzu6asKFmROlcfR7ZEYKn+5q8gHbx4nSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169645; c=relaxed/simple;
	bh=LGL4VHxqKITnhSL7axVc8uFn3R+u5JVC+56a547NSCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UN73TSwWhQd5i6X8ytl2jISt8T0wt8XJU3q1WgDHFLZbGcJdzXo69KSeJsQjdireD9i8W5JIu6WurR0GWhhDTrTRHbJ3rKC0odeJckskrGY63zjbJups5/gkGvPPoRZQcT86SVQU/UTT9bQV/++bpptWvx2kP2gM9KSHr/c628E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivDzhSe2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+JyzM90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4pu0T1250844
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZ0NwMyzJUB2GQ7WiRH1btiCyEC/1XQsRKRIRIi2gqw=; b=ivDzhSe2Nl7+MLrD
	QPsmkAixAxCKAGIhTthgVrTiy7Oia7h6wbWrl7zoZ5r0OBs1aMlqFtmxA1YtHxQ9
	HUBWUvpVbfqs5B5tgT/Y+FMXVuVsEAsW9nl83P1DCt5km4Z52s+ziJv1GdxvuP+x
	wvxNW2McNEgoNu8s/JIpGw4e1EUlsZyjEKkTZwX389rHeP5uNetGpvniu2qG4N3j
	w9fPN8f1F7jXmLZP23EgH4VKpNv+ldLfWEbHfbXdmxMKauyt1y2vtitzhoed9IIK
	X/4Qh9AfLs6yBG9BzNm/PT/nWTTF1rlLMNlPmPMjiBeJrjcYyoenDeXDb1/MJq6o
	toQWaQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0kj90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f3eb8f3419so2299632eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169643; x=1779774443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZ0NwMyzJUB2GQ7WiRH1btiCyEC/1XQsRKRIRIi2gqw=;
        b=X+JyzM90tdl6aycUxN9DcJOTMMixaDroNA8h/Feg6A55Y2oWp8xY0zZaH9DNCaZmDr
         tVLC9Tgnuk44ZtVjhpP/LFsWmrYO6Rvu4JnIOaDJeguxdgETmBVW1/C+lXyp+c38/oUB
         H60aL/3cE7EC+W3He0lrG+mQrdBFco/k3XQqXD6ZYOZBy37t5z+K1ukw+EXfomWd9+8j
         EbVS7NuLEOUX5lc17d/D7FHGlacGEP9ZO4r8717YZ39hDn8wlCTkm2TgW5w+suCQyoTL
         vGQ/qmfLBRFxUq0z4zrOoGJ2awEhYroQRJzObKJ5U6VU7VmqyWRkOff0g5l711Mwb1FZ
         dAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169643; x=1779774443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZ0NwMyzJUB2GQ7WiRH1btiCyEC/1XQsRKRIRIi2gqw=;
        b=hKAihRic/mBOoSwHa3lltHSZs+3jd+yCp0j4o5J8fxmUIbUIxfxjSeC8Avxlbs5Ayv
         usP6XBoTPfuTHI7BDCmf096sQru708xfFylysh+C/Rey4JRqNHCvRA8jA4cAcuynOCly
         W9n1wMU/l5FSnayyIU7sleaI+wHKC+Iiw6NK9pQcqIN10PZVpnTZqLJuVfnb+e6diosa
         yv+2/3Mvk02TV05USwj6T5VibvlMA7tQV1Duidgdq3ZHNEDBkmSVacKuzOOzSB6hlshN
         G3zYa1Zv1UGAtf+oZUPQKDRt411WbwQJsSpYae83qQ6uFtkVlK2rY3T8h0YYNY37txL9
         AnPw==
X-Forwarded-Encrypted: i=1; AFNElJ+VWKVaCBUwrWhF7lLH3tSt/s9xCL6RzMau03x/1aAbwj7DZz5jcpMkxuOi4N3tXgUEo4mvecyiaNlxILEW@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9yJZOiYvKZj5sIndhATXGbW+DI0vszpVqXyR5BMe5YP8hiiP
	prjhUmFKETrdngUOFF4IeMJVZ1uhNcueDge0z70xc0CdImiOr9zfjKOEFyHHYwmx+nrmGtGwNt0
	Whg+Wz6mxEvc+yQ7T0QQofwMG4EuOcZyyF5HYL1tcZYzKy4QfFr7arMfLfpfNzT3UnhkX
X-Gm-Gg: Acq92OEOS/lfjUaP6ilUW77Djjk8kByb9ScWZIkDbCLZwysE3i+DW6B79R+igSLhzDD
	jLzLHE3yKwJPUz/OxqzkeIQ0fXoQJSTTshDgMtNHjc/9tBDsghQnjQ8ttXpMGtPgrXkd2ENli7p
	uC6Jr+Ey/ukkg87/y6eNJTwLXCGtPf12J/T8re1akOUso0q6QjYxocD1RHSqCP1nK1TBCuoGSAh
	/Y7IKztOU07QrTJjf+rTwqD2mGoGmKfRX+jotwPpGqUCzh85HegUHrmmE5i4Ntgyjuskm9Tqtr6
	MIJnDYDrx9wUr78M/ErNWOttqFaY4h8/PyJ0fyVKleg5Mh/f17iTjdd6ggAHIAqYMaYs5IzvdU/
	Fs2lOQXOav9o2njW27S/jwA4Vw+Bho4MMb9JD8qM5JTyJI5I1CQiig4Qc5g0WzFkKFjEL
X-Received: by 2002:a05:7300:6429:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-30397c321d6mr9406029eec.0.1779169643327;
        Mon, 18 May 2026 22:47:23 -0700 (PDT)
X-Received: by 2002:a05:7300:6429:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-30397c321d6mr9406011eec.0.1779169642830;
        Mon, 18 May 2026 22:47:22 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:22 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:13 -0700
Subject: [PATCH RFC v4 2/9] dt-bindings: phy: qcom-qmp: Add PHY selector
 and Glymur link-mode macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-2-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=1262;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=LGL4VHxqKITnhSL7axVc8uFn3R+u5JVC+56a547NSCM=;
 b=WKP9YnTK4vYGaVO0+9dyaRHPMS4ebEb4bYteVtJj/gWytZ4fE/tYJGj+u8VCDw0E3kMnA+dHj
 hhX8CbwrCUKC+GdufP8pYpGn6xxe6xjagIVekpe8polHzLcl9JUMe7c
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfXw2UfIGMGNyld
 QCf7rxzF3aED95HGYklpgVWHxBL0HXW+uoXbWGb4uj03lAIFnRpvr5ciL8yeY4zzzDiV6ulzs0t
 sHJMCY+vR+g59CFRNzB9rXT0R2rpeKnmuTdshNpo955V0aCCybH4vQ6rZ8ypDeb073K3zz+3t1N
 kJEqL3SKEzJoXsQkHxOq7DZgw9d/swfMY4l3AWATgMEaGzWWm/yZQZHgJnjMJEwdj1s9U+xudkM
 Rut5RJTM7j1PnysFG8H6YLxmmMwfyi9/EGUGjPG4ZaHN99iN1KpMUgbhgakk5VwkWeqSyYRs2w8
 hzixZ9w3Hf9o23NiV3hryuPGm3eckg6FPAGwDN0YfMzzHsVkcdvRiJ/kRZSmrqRCbVZKtqlwMTZ
 lXgzRJhsD90xi7KdxGMoHR6XgDCB8jaQLOFu3+NPjA0F8hhrVufbPAojU85gLRXW63+YOZL6Eg+
 00x7WVXdmTnROsbXYuQ==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0bf96b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=B0oFbsU2YAVyZoOp_L8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: FyeEniYAK8yP5LwI4P0ZkfHlxWrD0Xwa
X-Proofpoint-ORIG-GUID: FyeEniYAK8yP5LwI4P0ZkfHlxWrD0Xwa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108322-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51C9F5778A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add two sets of constants to phy-qcom-qmp.h to support upcoming multiple
link mode QMP PHY:

- QMP_PHY_SELECTOR_0 / QMP_PHY_SELECTOR_1: generic logical PHY index
  values for QMP providers that expose multiple PHY instances under a
  single DT node (i.e. #phy-cells = <1>).

- QMP_PCIE_GLYMUR_MODE_X8 / QMP_PCIE_GLYMUR_MODE_X4X4: link-mode
  values for the Glymur Gen5x8 PCIe PHY "qcom,link-mode" syscon property,
  selecting between the x8 single-PHY and x4+x4 dual-PHY topologies.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy-qcom-qmp.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
index 6b43ea9e0051..befa76f8392f 100644
--- a/include/dt-bindings/phy/phy-qcom-qmp.h
+++ b/include/dt-bindings/phy/phy-qcom-qmp.h
@@ -21,4 +21,12 @@
 #define QMP_PCIE_PIPE_CLK		0
 #define QMP_PCIE_PHY_AUX_CLK		1
 
+/* Generic QMP logical PHY selectors */
+#define QMP_PHY_SELECTOR_0		0
+#define QMP_PHY_SELECTOR_1		1
+
+/* Glymur QMP PCIe link modes (for link-mode property value) */
+#define QMP_PCIE_GLYMUR_MODE_X8		0
+#define QMP_PCIE_GLYMUR_MODE_X4X4	1
+
 #endif /* _DT_BINDINGS_PHY_QMP */

-- 
2.34.1


