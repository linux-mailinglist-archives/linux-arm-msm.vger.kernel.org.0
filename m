Return-Path: <linux-arm-msm+bounces-104603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLHNMr8D72lz3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:35:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF4146D9BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5EB43006B7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F97374E4E;
	Mon, 27 Apr 2026 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSqI36Cv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ltxg2JtN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F437187C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271731; cv=none; b=WGMm5/FPHCiOsBbUy5HvLZqY6Ksmm5LB289KKftaAKPoyAG4OTKNGCKkia+ptdSqQ+Oij4GknRe/hVhzAHhgsG9HWoKuhNOxvT7RkLTyCtbtDtJulax9Jh17YuLSy+kQk7sqre5b6NlCFiFiMCRLatIZ/o4rta9WLejWiX7H+kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271731; c=relaxed/simple;
	bh=QStrsG5uTXq5Jp0o7MBHvU1XARjX1OyY/C+EwXYD4pg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ARuZp2m6qCEu5x30LS+d8uQw3bk6r5GD9nt7X0yew9TgXgQP/KXs9DVQx255rh7Z6WRm/XMv+i/fvIkT65eMrPr3yWwrkd4mlEedg+rb66CqkIFQhZv0JT1IlHxmV69nKUmnzP3AowU+M0aTkLIPz28k/LlqmQ2Ee4Bx2OFb7qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSqI36Cv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ltxg2JtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QJNvpV2035273
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3Z+8TK87GHCr3otUSfoktY
	j0HVRbiKfDKrZ+2O6XNvM=; b=nSqI36Cv+nmEWB9LFE/ynWA+HIOO3Umu2ghwmW
	oIoz5aYJZdhXgWEP/cVUt2I7v9jBGO5gh5ABVWo+p5MsmRlNFZ5xrwAUQK+ilQI1
	V9E/91ppgT+GDJUjQYK8dRBefGt6H6Pbbpnc7ifhkdb+Yv/AHFy6ofrnMd3/NDGw
	WL41oiRKyRkQjOz7WQt89zfswX4AKv/unMLto8Nw/Xp6SHGagaZUQCwEvl2EF7qg
	BEwgT3zsgop4LY+KhcwBMCuBL4HdBrEHgB/C4jt34qt6qpJfvAIIKQ4m7nGobEBw
	FBrq4K4setR6Wte21VDGw0R1Y10vDpoGhxlu1r56HBjmu8FA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgvm7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ae6aa148a7so189027336d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271727; x=1777876527; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z+8TK87GHCr3otUSfoktYj0HVRbiKfDKrZ+2O6XNvM=;
        b=Ltxg2JtNwhoCWztd3jqxyqQZwV61GnhDOeQeUt+JuHPrLgrcaG83RgUc8RaJtIYhgK
         tUfjhp4vYCemdHZunvPQwifTev+l0BsskC5p9pjsWnmv34svnnrV/8sw6NgCmYcNG5AK
         GifkkSTg6XdOAxTNdJwjqvOlGIEG64Er+n35/M5yjRi0pduYyXhjqZ9Wbpwr/gBNCE0B
         iy2U/HMbp3Qu7YXG1LyFDhajjhU2xQlmHAfxMu96iRbJ1Q5m13v9luT1iAWAbeDmCSjk
         o8xW6piIkQYi+jlDZZvjthqaTcDAlpFh3RAEbC0yYOimlbUu/JdGAG5oYP2EAayIfzgh
         xbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271727; x=1777876527;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Z+8TK87GHCr3otUSfoktYj0HVRbiKfDKrZ+2O6XNvM=;
        b=bB/jMwYUMwssRechYGKb1Mm8nutCD/38ojGr7wEjLDRFH80hN39F0YxYkxmQVglYoe
         0mR+AXNs6OfR53WuR4Kh2QEvSfE/OB/KzrldJkcHPraqke8AY7cG4L0dJqIqUQjzkoVV
         jVGKSMP3DRV5C4QLV7bloAHhxAzQaF9gmWGU7VQRGEG8D6vcPLEU4hdXfGJRI9nebePS
         qQ5H+rc4dm4zm1NX36kB929LL8Vf4kNE8ICGN4+lYOy2Ye84H3NYQC1t+XTCskxSayvO
         5VuVUpyCCmU2kgJXotbGyBFLQwgiKc3KM5ZML/pVuLaGxE7uScFTJDefAA2s03ZFlEfd
         G62Q==
X-Gm-Message-State: AOJu0Yw7b2nXase0HdbGOIIUS2tZGlhlFTO2LAzEkkh2ZTilA/PWdP0T
	LeO2kpvMNm8bmZZSaSAnmtYr1UnSKykBPUbDESc5zPMX7bMy0K1oVUWY9+iPwkAEPxjixsyt5qx
	dPz3Q43ww9ngVa7WjJx0qZ0TxQm2VmxbIGDUzaGo1aCaGE4ZyORESseLXPUdYN3HcMZQa
X-Gm-Gg: AeBDieu/WVFY+x+cL8yiezv+TBwdRwtRupd1KahTkz2dX5KIRGl0sxL4Hj+RxTQgXUH
	ZDyUOOTK9naxEgWp2wKPRe0PF4r6jRA+8xxEeoEwDygEvf1W1K/TtGB1yt48CZflzKBlCmqOyRw
	lnh486pFUWI/6sdydCgs+kvVtDh/S7fDHqj7h7Sqr334PxzlGLwD5wIx5ZV0PsKiUIN3xFrDaXG
	WywiXMCc9yZ7w9DxFRpYuPN9d+9I12a9002Frre9wIfqvuhwdOJpGkDUj+gVyU+pp9JuMzkEnVh
	t3N4NjZEYayQ8ZUEAWroXwqUPEvH7/9XWa1Z3dY+pFNRuc5Jqaoyd/znHlB5riaV8nkUnHjCuMw
	hQqElYGsm749UPNvHnAgoOwt5Hz0zhvAS/U20FVmzO2EoT+C6CQ0wtF6KMtji0cUbJ/f1Y744qm
	VxSxEh4ye7x7k6/AIw5Q==
X-Received: by 2002:a05:6214:29e1:b0:8ac:adca:231f with SMTP id 6a1803df08f44-8b0286918e2mr566947606d6.14.1777271727424;
        Sun, 26 Apr 2026 23:35:27 -0700 (PDT)
X-Received: by 2002:a05:6214:29e1:b0:8ac:adca:231f with SMTP id 6a1803df08f44-8b0286918e2mr566947356d6.14.1777271727012;
        Sun, 26 Apr 2026 23:35:27 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac7d4e6sm251899256d6.20.2026.04.26.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:35:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v5 0/5] phy: qcom: edp: Add DP/eDP switch for phys
Date: Mon, 27 Apr 2026 14:35:18 +0800
Message-Id: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKYD72kC/3WO3WrDMAxGXyX4ei6y5dZOr/oeYwz/yIthbVI7D
 Ssl7z4nvchgmy4En9A50oMVyokKOzYPlmlKJfWXGvYvDfOdvXwQT6FmJkEeQMKeUxjeh+7OBXm
 LFEArD6xuD5li+lpNr2/PnOl6q8LxOWTOFuK+P5/TeGwc0YEsgldGG0PCoDIIbTStoGBsdFFrk
 NazxdWlMvb5vj45iVX2659JcOAShTHSuYhRnPpSdteb/VxO7mpbVRNuOILccKy4t6ZW0C06+Ad
 XG67kD1wtOBpHUQaQ2v2Bz/P8DSCO5WxvAQAA
X-Change-ID: 20260205-edp_phy-1eca3ed074c0
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777271722; l=2308;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=QStrsG5uTXq5Jp0o7MBHvU1XARjX1OyY/C+EwXYD4pg=;
 b=zgyGuvhWR6ZgTstYfnwyE1cd3qzyUu5zdRlWplmRkg6SigHJ2NpKoicLmjzdU1ur1ukphJE8+
 c6BMM9MixvmDdX1BAlXoUw3QiVNZQAkb2y5v11kENH1YOXd7Z9hpGQl
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: r1wapNNvfYmeyjTjZi50Gl-4Qo3lHq90
X-Proofpoint-ORIG-GUID: r1wapNNvfYmeyjTjZi50Gl-4Qo3lHq90
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ef03b0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VlNtBrZHsXuFd6lxwUsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX+ezG6e52N5ZV
 I0D+OZgxwQHrL/Pw5iba26VdAw2WUbS7amjYyOCN/yHF89LFdjHncxjrOiFPmk3Mms5YyNmBhUm
 FfTXCVLtFBX4hh7HgBndMc2F9rQuDQJD4wF4TIxCOMdtD5G3AtGabz2H5lVwjzthqIMqfbjpDHa
 bIQ/1dtmuAOaRTTXHWErrpLNsQen7/ne1Hzludj/nXYkIjNrXSmyZC2Bit8kjzGgXtKpcO7KdnY
 2K1FaCH5Kjt81W65wty7moyjOPys7qyuynfER4o1D6qrKLaRtMuIcOY/xItrY/jewtCUebtlgrR
 +4eAb48Q0dTAkqtpSnrLCBT5H91U6LbDkKzvEycH7baINiNRHQCOryZAorvHhhHJvYjrO/wcfMo
 1uAtaOfEhzx27RBId77J5nKoeATxfjxcfQju+agQiyOxcjvlY3YxcxODw5d/4tNbrtQhg4uSvnL
 QyhE5Olp8VQfDRDw1bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270068
X-Rspamd-Queue-Id: 6FF4146D9BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104603-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

Currently the PHY selects the DP/eDP configuration tables in a fixed way,
choosing the table when enable. This driver has known issues:
1. The selected table does not match the actual platform mode.
2. It cannot support both modes at the same time.

As discussed here[1], this series:
1. Cleans up duplicated and incorrect tables based on the HPG.
2. Fixes the LDO programming error in eDP mode.
3. Adds DP/eDP mode switching support.

Note: x1e80100/sa8775p/sc7280/SC8280XP have been tested, while
glymur/sc8180x have not been tested.

[1] https://lore.kernel.org/all/20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com/

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v5:
- Correct the incorrect swing/pre-emphasis table used on SC8180x.[Konard][Dmitry]
- Fix the commit message and add the missing Fixes tag.[Dmitry]
- Reuse the HBR3 table for the RBR case on SC8180x.[Konard]
- Link to v4: https://lore.kernel.org/r/20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com

Changes in v4:
- Splite changes.[Dmitry]
- Add sc8180x tables in a single chagne.[Dmitry][Konrad]
- Link to v3: https://lore.kernel.org/r/20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com

Changes in v3:
- Rebase to next-20260224.[Dmitry]
- Only enable TX1 LDO when lane counts > 2.[Konrad]
- Link to v2: https://lore.kernel.org/all/20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com/

Changes in v2:
- Combine the third patch with the first one.[Dmitry]
- Fix code formatting issues.[Konrad][Dmitry]
- Update the commit message description.[Dmitry][Konrad]
- Fix kodiak swing/pre_emp table values.[Konrad]

---
Yongxing Mou (5):
      phy: qcom: edp: Unify generic DP/eDP swing and pre-emphasis tables
      phy: qcom: edp: Add eDP/DP mode switch support
      phy: qcom: edp: Add SC7280/SC8180X swing/pre-emphasis tables
      phy: qcom: edp: Fix AUX_CFG8 programming for DP mode
      phy: qcom: edp: Add PHY-specific LDO config for eDP low vdiff

 drivers/phy/qualcomm/phy-qcom-edp.c | 224 +++++++++++++++++++++++++++++-------
 1 file changed, 181 insertions(+), 43 deletions(-)
---
base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
change-id: 20260205-edp_phy-1eca3ed074c0

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


