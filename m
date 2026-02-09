Return-Path: <linux-arm-msm+bounces-92195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPhIG7xciWlY7gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 05:04:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C076B10B7F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 05:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FEB33004F4C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 04:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D94C1EFF9B;
	Mon,  9 Feb 2026 04:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNLEUi3M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtBdHtt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B5E1A9F8D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770609849; cv=none; b=rx6YnT92gC45Dxp/NMk5tsedQs9QUbhQben8V3L5GgLsmT0jEe4qHkpY23scTfhCrbQaiLgndgdaNSMhinKzarF2NbQ/dgZCWaDQ2yiNtg9bMYlrIB+gg0CBmyEdwJ4h3elT8veF1akFpBUbLAxs/Se3yazFiTvc0JLJnvWnG2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770609849; c=relaxed/simple;
	bh=S8P8GRl4vzx2iQm31lys8wN0JTN5FQOi60Q20yLqfbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ewW4KVTCfvFWjBHdPRkHh+23yTiEMG+y7GY1gJhWEPl5PJrbiNgEUk7JabqYrlq4+jjxK3f7FLwnMZgehxkzFGJmi15Y58zpzjrGXYIdh6ljeoGJQWox6HgwuJ9TEMh7U2N2u8k5lSovV/fXUJ9atmEueyuSXEHRbofoFaS93HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNLEUi3M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtBdHtt/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618Mirdc1138642
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 04:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y8tsalU24isrNEjsLLCx+X
	AoZSHueatt6o40Tkkj0uU=; b=NNLEUi3MlCma3VylHUdIld6fT7Vm+WmC2H6grg
	WsjaaEiTsccuoZ1KqSDhp20zakYHv4uKQ19K6r1TMyZ8fq5Kv9yqYCIki1nUA64o
	ZeAIS/eCQFVogz5ZuX6mD/UuW8iDVHiHWTMIvZ/CcHGkovpFdhZgl1n2kXNMFxBG
	Mr7x713k8aO38iv3bxSYTIG8icok2cgnKeL4CGO/rOlQtnATnzClJz0KWElFUyQ0
	wZMU7NgyQwvCnvz/YG9x3Ye8UwD6nqcXKcA8TxIdHSsda5Q9Eig8/LCFaatnM3zT
	tLV+xokRrmpIzcslHC64cHlOQBPYhnV+KjFGQ22PDwb8hW6g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdd3j3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:04:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a8f8c81d02so41015315ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 20:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770609847; x=1771214647; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8tsalU24isrNEjsLLCx+XAoZSHueatt6o40Tkkj0uU=;
        b=XtBdHtt/8b7jxGlSK1BJjfbDKUdNheSqLUw8/B5BWrGQzTZS5EEjbgkRILCXDd7K1N
         QxYZ2Z0qOBD6xOviWEjj1Jw/wNfEc1JB64i3t39JPDxCjnE7U6s5INnf6JwpKIimVXmO
         6/R6u+fUn8SLI/RizUSh7zPvLhk2WToRf6VIYB3JTQikucaRNWCec2yYDWb++Vd9Qtq1
         EEMjG9VUKXXV5e9VpVERrGCMeoa6AKZmyqvSptRdFncBywyTzns7HxOxhUzcar07lqtA
         GkGOYmyj/2qZo52xBTxGc8Bgs2KE87DloMGJ2J07nUrEMu/Jm1AcHVnDza+glkGLs9Dx
         n4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770609847; x=1771214647;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8tsalU24isrNEjsLLCx+XAoZSHueatt6o40Tkkj0uU=;
        b=i27UrJDTn5OfmG4sCkjcTqvByBCPQQ2gDDN6QloPXZ1Mlq/Y/QO53ulYv2yIwWW18N
         /WJLzy202k5TWMS40RxvWTSpxlo33cExzS+3rDstYG+BCw/4zOEGGt0pGNwQ4M86MdMF
         2csO1s86T87Cncd8wuGspi4wDgyqZ7FBXdDGDiJpYap1NutVbItFfBjazo8ij/cPPKsR
         mkRTxr9iqfcFc+QLSh2bRSNSEX/agH3dyXNwnr5AkvLctV5WPrL1ezBZYL6Gg9yAfWfE
         Ld1Npea+2JomWSCE5g/R7Ci70qjacEymWXWecmVN6BaO1+lNDbBxsejoVJ/Rh+tWH2dC
         gHWw==
X-Gm-Message-State: AOJu0YxbYbk9xi2dah/W46e3wgCtHxHcn0Y4ub3SgIlyO5/f79OwPxLu
	sIPsTnfAdJVYPeTASmfmBEQiNSMJr008ZAFCLCfXjwsMIQGElBTW3qy0BTWPnT2xrrjzOLb3y5o
	iGm8IzeaBQ1qWa+ZKjlS4abYdFWIVfXkDHro2oBTK1d4l4p4mVg9BlIBjE9XOKixMhDHu
X-Gm-Gg: AZuq6aLqOJlrAlMaYvmT3OFLcDh/JWjmTsEffW1IriyuZDZpS3u0wAApCjYuHntL68w
	YVFMCISg1I3+qxAAnzJuMUZqM+LA1k65iomrHi/IdyJq2UD1rsWj6dmpNQR0QDKovkgH4rijo3M
	73+nacFKaln9YwbBgg7U2Ci/wvgpbhdoUBizNw16NnFYY26YNxHsAOYN1r0S/3kK5OeKfIHtSUP
	ZG5HWkem7dqKtPPfDzRFTYIK4u+9aaCJanPjC0gNCuRPbwLCzrA2AR9FJBvBAUJiwu316JVBDYG
	pcvIvDM/i/fjWru+IWeeU5OncAaBdlKseNj9GsqRZXErTdNeZs+rr0AtYqEa2+hJRL5hER93JU2
	zgdcY46QmWUKERRrBiXwNShsh8GBgrEf2mpBoLg==
X-Received: by 2002:a05:6a20:56a3:b0:35d:b5a1:a61d with SMTP id adf61e73a8af0-393ad0028b1mr9997608637.26.1770609847421;
        Sun, 08 Feb 2026 20:04:07 -0800 (PST)
X-Received: by 2002:a05:6a20:56a3:b0:35d:b5a1:a61d with SMTP id adf61e73a8af0-393ad0028b1mr9997590637.26.1770609846926;
        Sun, 08 Feb 2026 20:04:06 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb61e4a1sm7456041a12.27.2026.02.08.20.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 20:04:06 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 09:33:44 +0530
Subject: [PATCH v2] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-qcs615_gpio-v2-1-ff15114d837a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ9ciWkC/22MywqDMBBFf0Vm3UgebUK68j+KFBOjDlSjmVZax
 H9v6rqbC+fCORtQSBgIrsUGKaxIGKcM8lSAH5qpDwzbzCC51FxywxZPWlzu/YyRGWe0t+dOWyk
 gG3MKHb6P2q3OPCA9Y/oc8VX83v+dVTDBlFNWqka51tkqEpXLq3n4OI5lHqj3ff8CezL75K0AA
 AA=
X-Change-ID: 20260207-qcs615_gpio-7b76c94f6921
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770609843; l=1368;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=S8P8GRl4vzx2iQm31lys8wN0JTN5FQOi60Q20yLqfbw=;
 b=UISo3Fs8z34g5h2Pl0rwOIoilDPhLSgOjE0PCOMfnwsj6wpgg4l3gLnGcHFTtG2VK7EKAPga+
 WzNYWpflnTpBXlji5GknJaxk/9cD5/HMSwBWE8l47abPtmrLrhF84aH
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: PeTDrubDFO4TKCdPXj-YpgY6pRX6aBA5
X-Proofpoint-ORIG-GUID: PeTDrubDFO4TKCdPXj-YpgY6pRX6aBA5
X-Authority-Analysis: v=2.4 cv=Rdadyltv c=1 sm=1 tr=0 ts=69895cb8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZsY2b3GV9AaLsb3Qm6IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAzMCBTYWx0ZWRfX8d1Hxn57LMN7
 HA0sea3DQ9zPcQ/KIYIEMCOrqR7MUcoQr+QC2T+xsrMH9B9qOFOYk3dnHLOynV59lzOaS2H794p
 HZCg5QZQ1Is2+c3Wzd/6HmYUbYbc6tCnHkQMP14SltUcAjCAhEsboXb2lvOzRwDqP6dHwGSFL66
 J3oYeVzbS2N2c4Wlc4GR1DC7zcj4/9l3KOLCskg7ZeVjtLBD5rkIyDY4zl5eRJMkSJ0JTyG8Za2
 77LU3NwL0mfGCRzcrlu0G1Ye3OZNNdDUdNzqiBfV/1ERuvXdvuQ4S0kwUE5SJ6g0h66Ipu2OiKW
 8jJgumc7QDEuVp6JE//pn2h7NYZb5aYjRfeBKr7fTDzGTuDJYXuyyF0Lhsg0emsh/MJpCOhC3EH
 8arjQb4JFSkjlJEI0uB9MILPEqB1uoBaz8wfO45dVUPl0gHqxUSj7b6mJDkFZraKchbqyXtG5Hm
 hQth6wn8u4hESV3Dy5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090030
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92195-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C076B10B7F0
X-Rspamd-Action: no action

Wakeup capable GPIOs uses PDC as parent IRQ chip and PDC on qcs615 do not
support dual edge IRQs. Add missing wakeirq_dual_edge_errata configuration
to enable workaround for dual edge GPIO IRQs.

Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Update commit message to reflect HW do not support dual edge.
- Link to v1: https://lore.kernel.org/r/20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 4dfa820d4e77ce8157a3503ee8ec6e426b54e030..f1c827ddbfbfa59d03ddea560eca36ffa997aa8d 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -1067,6 +1067,7 @@ static const struct msm_pinctrl_soc_data qcs615_tlmm = {
 	.ntiles = ARRAY_SIZE(qcs615_tiles),
 	.wakeirq_map = qcs615_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(qcs615_pdc_map),
+	.wakeirq_dual_edge_errata = true,
 };
 
 static const struct of_device_id qcs615_tlmm_of_match[] = {

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260207-qcs615_gpio-7b76c94f6921

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


