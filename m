Return-Path: <linux-arm-msm+bounces-104607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPLqFScE72kj3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:37:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCFE46DA37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 332D03027302
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A02937DE9C;
	Mon, 27 Apr 2026 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oARk0f0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gBVWpszm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD4A387587
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271746; cv=none; b=a+ER/OGBu/rbOr9PWMP56LUTgEa/IxDwEa0nkP4wg3yxcpVJ1/6u69Ke2H/QnVhmlPkoNONOHhw145SZG+im2CD0NVNVhBrDurOLQ4f2InperkoAqzS1xxGjFsopEUIRArI+xjqCVjGr+KRwV2JymD6zVTbnBx7X45/V0CDlqp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271746; c=relaxed/simple;
	bh=aO28WQilAxZVtQvI+wCGetkRJaY0+sEy2pV+6FVXyTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMjye3jDh9qJKXKZ9tKtlEKdb2m1TvtEc2i7XQMK2b3QofHDlwdr/KvfnEylrK2YA75+8zrT2ldpDcrisJrc6bSb6IfmfFbPK2BuOrHbwCt3PilnSlLSunoNv+z1VMZE5CRHoXPnTzLd92EopdAOipAAG3f0dz6S8s9ZkVnh6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oARk0f0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gBVWpszm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMwVMb2685479
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hiUBwHms4Hb1isi9MNvxSr7/NA/P2eiTLjhGmjdWM4I=; b=oARk0f0pCY8Mf9Hz
	Fya6UQRmjX6wEXmriNLNQ7YjlHchBZHOKHsWXxPWlzDw2TS7uwQzPhsi1N0SV3f3
	Ze53DZRO4zHFg9jvU+wovEAzSdgN8TvEIfGqLNzRa79DZuBVXaAf0uddaKzvuhVh
	55r97B+DJjktE0BtKycy3UxenvyhWgUmjR1bwDAToZfW2j6JvX3vZTLaEmS0npa0
	k8zmrvTxuTfYyOkLDu2PhuxiraKIqH7ZJ1hV0KfVlbzqj2Lt54tUepgpJ4JH1OI9
	pOmakGQHfpZq9driQNNPXi8jd0qeOHiyVw2PxcSn8z1AOF38j5IEuBbtzB5cyTiO
	4g/pmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtcsft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd722c1a69so1777061385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271743; x=1777876543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiUBwHms4Hb1isi9MNvxSr7/NA/P2eiTLjhGmjdWM4I=;
        b=gBVWpszmoTZtCrnSFsO0bICrOqJK643kWyO1ushHyyACXwzQwaUF0sJW71UqXHfWnI
         6bv21xEzNgDt1Q8Fcmi3Iu1l96gcQPvhalcDoyJH37ok4WTTMYDIfN8d5SDAZAnD/AbN
         KAG2bsLrd2gTK+2eG/2ppX/ZjknJVHZ1AvKNkhjEcuJOlZioGcUyVZZq/EnlOOd5WA1B
         ReJc4l5eXsXrw/6dKi4qAHsEYRvaxi6alkwP83X20EaiCrku4qSlz4yztphlbrvAZmCj
         ru2lZZQABNM/hHJzxyZat53+MvVoxSbYaY8ZNktuzIx7LplS2KmirYdk1c42QDOFLWMH
         9dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271743; x=1777876543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hiUBwHms4Hb1isi9MNvxSr7/NA/P2eiTLjhGmjdWM4I=;
        b=rFQty40uoMEjjshMcSaNeZ31TwC1OI5sPxr0A7ac4d6dSk/RFEODoSS0Z5JwbNn7R4
         nmKH/dXK+L+8ttkLHxEqgDxTBbOIcTe4sQHlQYklGuLQvjkM8OhekwjlgoTCGybGOhnF
         vRwLDhxXBInR6Kytuex+/EcYzCO5Uthr1P7swoa1o3Qx35Q3EF37xUlAQxLOSZeIcTer
         bRvoliFsIm332umQIEEdqOIjisJ51Y9dkw1nixeeBIpQumoaKV068y96LkaQhivucgOv
         /ifCerkpfB2nFjC+N7OYhlKGHcHxwKlaFcjzu4P8/y+q+sdItzExgXVMTuRd4YQkr/Fq
         4A0w==
X-Gm-Message-State: AOJu0Yw45c5eyiCg+7CpqwaFyEMb28eRYDgjSm7fHyeLoJIwqIjSsBn+
	ZuVB2Ro8uZ4iEb/tVT9cVmpY8DRHEdQzXvULGs7yOdp0ro+UPLsdNTl6dfe5wUNBJWjRywqm/OW
	Hybk2qKvo5eSbJDNkZA1NIlokGqRzC06GYByroHPXioicH21YT48Sy03ircwHOVvUjECU
X-Gm-Gg: AeBDievfA+gFniKw8DtKqkhn8fw0cddqhUuhOvF/truB9v04RJP6sxieTfKkm4472gm
	E5girO1KA/bv6N3L5J8ZrG+JZRyo3IQSmBXIAfeqPM1ZkylC/5wjdaXlCL7BJstZqKPaXfHw6sG
	LnIFCmubNE4h2HJq2LCEKVuN2UMotKSPfjGsP1ByxYIpe4NP3BGsII0gF2uw/Qbwq3agpMTJjFW
	j4lZhMGNIgP4hCm6V/yA5AafeCAxru+T8gJllcbeaCmy0yCR1L0nFCTCgN+2EIc1ErNCKsjYuWV
	C+JxidmWQcagST/11bYZZyjHOts5Z1tmHyiCzBqWKbWGPZbt/BT9bCZJ5qZu201ode+JOJkxnzV
	yCz89i2oLioZ+w2/f8kj8E4m5jAV800+v4Vj1yCgh8TMRopjFakH/AkC8YN7JMGGDBmSHOevQ5e
	vowFYIDXle5GSWNzNppQ==
X-Received: by 2002:a0c:e003:0:b0:8a2:1149:3337 with SMTP id 6a1803df08f44-8b0280cbac0mr536922086d6.24.1777271743150;
        Sun, 26 Apr 2026 23:35:43 -0700 (PDT)
X-Received: by 2002:a0c:e003:0:b0:8a2:1149:3337 with SMTP id 6a1803df08f44-8b0280cbac0mr536921836d6.24.1777271742775;
        Sun, 26 Apr 2026 23:35:42 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac7d4e6sm251899256d6.20.2026.04.26.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:35:42 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:35:22 +0800
Subject: [PATCH v5 4/5] phy: qcom: edp: Fix AUX_CFG8 programming for DP
 mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-edp_phy-v5-4-3bb876824475@oss.qualcomm.com>
References: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
In-Reply-To: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777271722; l=1322;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=aO28WQilAxZVtQvI+wCGetkRJaY0+sEy2pV+6FVXyTc=;
 b=KhT8bRFH9JS6NuUlvP1bcZQMegP1Zye5cxMcaApOj1lBr2zb4OC7W9m2Q7pfbKczPsrAsty3K
 WxNAK+1XhaKDXx9A2RQ4WZtSERsqPM3AN5McM+OZsqiUec4ko+30Wmf
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69ef03c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SO9rCO7GgoKHDwPkKK0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: yzOsuIW6nu_zLSEqeQFt23Bo6a4pVTIP
X-Proofpoint-GUID: yzOsuIW6nu_zLSEqeQFt23Bo6a4pVTIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX8M1FIYzADIZG
 pvy+F4/5GoI+uLRg/hTmNXledmAbxNAKcKyef5fdZ4ULGzOTwzwu0DFV5fNpSCf6aC3MFt7mN1S
 P0P0Dbx1EKnSc2bKxG2SCiuQvjdCbJ56xdSeXTQBd9pjuF9j5KUjAQZi1UT8EP8uT4brh3Tl9zQ
 JKatBVbQSXpaTljJoRTvkX2HDOUlzxO0p+ruLmnvJZFK9Ll9EwPbWfKMYDchQZcwrSD4lXP8iaj
 e63zCFZhXd2wOLNFA3ATIhd6TJyGpGBial+5fcebnIzgAMt4H9TaNc7sL0BadRreeUTMonc9Yio
 FIj913dX8j5KiPrJO016APOw6bioA4/J1zgQglLrjTK96iatxTUwSZKd9Fw331XqaSY4kpI+0ci
 tiCqPxFyovKh0Qfo5c9UILLV6exfB7OxZnnO91WfS4jwcAWtVSkWVkM2qp48ggCRl7jXGZeBUPK
 DnwqFDKdYP5J6BqA3iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068
X-Rspamd-Queue-Id: DBCFE46DA37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104607-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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

AUX_CFG8 depends on whether the PHY is operating in eDP or DP mode, not
the selected swing/pre-emphasis table. All supported platforms already
have the proper tables, so remove the unnecessary check.

Cc: stable@vger.kernel.org
Fixes: 6078b8ce070c ("phy: qcom: edp: Add set_mode op for configuring eDP/DP submode")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 3e613b374032..3a848f18a8d6 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -325,12 +325,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       edp->edp + DP_PHY_PD_CTL);
 
-	/*
-	 * TODO: Re-work the conditions around setting the cfg8 value
-	 * when more information becomes available about why this is
-	 * even needed.
-	 */
-	if (edp->cfg->dp_swing_pre_emph_cfg && !edp->is_edp)
+	if (!edp->is_edp)
 		aux_cfg[8] = 0xb7;
 
 	writel(0xfc, edp->edp + DP_PHY_MODE);

-- 
2.43.0


