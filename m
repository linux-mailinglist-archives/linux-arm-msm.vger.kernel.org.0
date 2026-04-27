Return-Path: <linux-arm-msm+bounces-104605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOrcMy0F72ma3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:41:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7336C46DB7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B68343021E78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C9C371890;
	Mon, 27 Apr 2026 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9v9KZBp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgjN29ZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F9938F651
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271739; cv=none; b=BFO/rTyYYvg9aXpiRJ6V94STAdP6p9ytW+a0P3CbXsSujnjRxTg8fAJ6EBMi5sXTiiYLaoGW4dWqegjw0mTcNS4DHmp3mYM6C6xYgjRsqXzPj4V9VA0rUuFdgnf6DOSBwDKArwAZ99utMEVaIRQH2p4OkqUfpU9j19VmpEx7R7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271739; c=relaxed/simple;
	bh=O1GeInKguzBA9mYySYOWGiOvhXg4+XShwWBtgMAL7dA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRZcWtKEkyvS1fGLCcpcRK1wspU2x51l9zEeW0OEmWBrdOUnpb1PFEzkAGzRNd9fCHPFSyAYYIDnz0DI0WjoVELDTQPjoe3+NMoRl5yn3w7n7KbiwJJpbCvyP617MCH+zn1iXKMOyiWmqPufAoONwoegVzOByBDoHeUgGuo37cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9v9KZBp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgjN29ZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R2jUUF2884198
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68zN49TtAvswBkOR/vsRM9+htKxL4H2WIkv6U0YNdLw=; b=X9v9KZBp0iKSdQmi
	pdGNeg+qchzhLSd8uCWXvUl04Eff5PJXlO4w6xl7kgHXBEoQNq5UeWCkGwNIHS0l
	ZfjXWPB4hgKMzyNoRRc2PDVnQn08D5uDiDDVkelcUSwXVCOoOcu3n4UpPBqp+thY
	U04qUL91176YmrN71UbLs6L+f107ehwA3JLq1b6JxiZp+t25PLhbKAXU7YOTji1U
	6dfcPD/5DiEQLC4kFiWDr8FroAQLn4DEc/dQuhmd4I4OD0Fk7s0xzRCgoEpt6D77
	eIX+wMFyZr4UQmnQh/uxOqNsoz/cqMlUa4Qkc5TBT302s2zbvl4KW8rmZIMDRLQV
	NgpP/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya00mud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8f4ef450191so177086685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271735; x=1777876535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68zN49TtAvswBkOR/vsRM9+htKxL4H2WIkv6U0YNdLw=;
        b=CgjN29ZME0MBQRHx1vO3THxY4N8ArUdsGhRJE1ehyAZ6TLmaG574dvU9wwvYI9WVmP
         dkdP5h854EBt3BhiRCj8RRb4wSfE5UIumP+yQWBAzQyOO3gwKZRQdmEkyJoPE8Izy3/g
         +RVgrMUvz+L3cOBzgI8+g/wmQAfgW5e6euAc+QVP+nGGT1ANWncjsNmvlpSpftdLIt5I
         6n+J0sIPTC3fzWfQGsBd0wY5i9SSneVqLcvQjYHtnKYpRbYGkA+uW6oMibMaOBPJkvPh
         MeCD9eexeuc3H/+/NDFOPURHWJgk6pyqezXzYh5hr2k+ZoVeqlLP1iwyrLncIkoN0+FN
         8KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271735; x=1777876535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=68zN49TtAvswBkOR/vsRM9+htKxL4H2WIkv6U0YNdLw=;
        b=Dsh8NSH0UCtyjNsp+Q0jmRge64h5bLod8gF2iKbDEIsyaGVcT5TtFB/5vhtum/W1Ok
         aMssWiI8LcFVfEPOlfIHZ4q84W7K4YO4G1YIb2VSnP/aNyFo7Piydc7H1Bmq4klJzEUl
         liKD1GCSdhxW7O/o9xto17NaVn6/4F648JHgYn4XgQBKP5XgtYr0aS5BAzNn1sNBO3Lb
         8BM6PRfKblOwurhanScES2t5XjhAaH88PsbeQr9dm8e4ahrIPMHxMnm+27Utkb8Rh8vR
         30TON1TSF3B8nT7f6kpNWGjhb4oxHbxTmFlgJp1zPIKrI8S2+60fECTy500ak5Ol3HFz
         dkYg==
X-Gm-Message-State: AOJu0YztEZ19Zz5Jph0oZVHPCBfn0LrivuO8C24+ppvqVhDi/b6ZVhuX
	TIgpmaBxiIF+kr+nHg034LFJ3lCNvlBmYsFE+468Ev/FWqG1mmZU5VgAuHEhpHkBl8/79kSjheh
	+cJYDXtMq9qMfc+3PBbK9dJMQhZQ9KNjOVyNS+eJ3/6yhjptxmM49HtdD33k3cDkpTQ44
X-Gm-Gg: AeBDieu9ixNjq0a9L4Sz8Nq/XD7zVNVAtbzfCiFvnprKKw6IUBb6m+W238gp0QL3gwX
	esOugu/uZ+B3pmS7GxTOSpiQAJNYmARbqv5AvRkMBA5UfU0rohSZdEFlmcGbHYURmPU8urP2FEp
	G/iv7sh2+P+pNUXXvotq5z+PvQEcoAwhw2xokgeldzUSd+wOeaXetUQNmwmqliKysaL4Z9Kt1fe
	+PL6fyNNtr6/35B7oD+GvqH2wT0w6WpuIFa8ULwRbTu7/XyPsnhTDqTjatjkDiPky65ZpdpgNXv
	DNmobyrFHKkAeuFAHZmpoGCCmShFLv4ksUZ0J8oRerK2Y0tpVT+/VpEZSbFck6RMMbRzN+O6LG7
	gnTnoK/TOQ6RSofHhbE4RuAp7UN7LO8qCriUcekMARx1u5A2NC748bSjGhb2ElIq1Lg6ntWqCBQ
	cm+Wd5oFavQL/3xSgBag==
X-Received: by 2002:a05:620a:31a7:b0:8ea:e1a7:24a1 with SMTP id af79cd13be357-8eae1a73341mr4642101685a.33.1777271735539;
        Sun, 26 Apr 2026 23:35:35 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:8ea:e1a7:24a1 with SMTP id af79cd13be357-8eae1a73341mr4642099485a.33.1777271734943;
        Sun, 26 Apr 2026 23:35:34 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac7d4e6sm251899256d6.20.2026.04.26.23.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:35:34 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:35:20 +0800
Subject: [PATCH v5 2/5] phy: qcom: edp: Add eDP/DP mode switch support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-edp_phy-v5-2-3bb876824475@oss.qualcomm.com>
References: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
In-Reply-To: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777271722; l=5731;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=O1GeInKguzBA9mYySYOWGiOvhXg4+XShwWBtgMAL7dA=;
 b=xmV6Q+zgJRGesaYmJBkrJ3zWdAKMKfl/DOqcDFppyLCtPSgqKZ05PXBvzJKYUMGOaKFQJgJc7
 eO1J7wXXO8jAApwXuXbyXXD4kXufby08Ya2MMZwhRdMAr7KgEiUEP90
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: olryzFl9QjYL0OJo2O6RmXQwrgULZ3xv
X-Proofpoint-ORIG-GUID: olryzFl9QjYL0OJo2O6RmXQwrgULZ3xv
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef03b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=se8qGc9sdx2UsIF7nuMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX/WGZIjmos2tL
 rWg1bic7PmAGrJ0bsZ4LrdTPMYflMfWjs48TO2QZUoZFsO7mZ7h4KVJuMSDtir1Q+qfvIcX2jyu
 0Tcn/lG8K/hRkuqSGvaXwSURHjqYNY8YVQmnTZgkPDPGUcZPdaK45MGAifCvWihRmoCaNcn6a2a
 tDqyGsIwjA3nm/5AzF5Y91t+a/v8tuDj2vSw8tW25OwX/K7ShvPUZ/4Ukgrf6OsP1dsN8m7igs9
 DT77d7d2EBN8+NQfSCdRveKYbycGsa69L+76PKThNJjV6BfXi7xN9Qucg75CGnRifSjxvhluKKC
 Pt2/rvGLW9L2UfuOKcX0PAKaSFDSUkdwEntXtWqm4a2LlS+ksHak1/PtxTAz8Nl3Wb0IZrxFafh
 5k0iMO9gWQvgdeRnxkxtT7sj9kZFcJa7fWzgZPG4paxekeT8/ystvAelOm5SlFGXtSDNJnn6YvQ
 DvBjJAYOEydNc+oD55A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270068
X-Rspamd-Queue-Id: 7336C46DB7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104605-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

The eDP PHY supports both eDP/DP modes, each requiring a different
swing/pre-emphasis table. However, the driver currently uses a fixed
static table for eDP programming rather than selecting the appropriate
table based on the current mode. Add separate tables for eDP and DP
modes, and select the appropriate table dynamically based on the
current mode.

Glymur's DP mode table differs from the other platforms, add a
dedicated table for it.

This also fixes the table mismatch for X1E80100 (eDP) and SA8775P (DP).

Cc: stable@vger.kernel.org
Fixes: 3f12bf16213c ("phy: qcom: edp: Add support for eDP PHY on SA8775P")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 46 +++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 2af3fd63832f..3266026cfe37 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -87,7 +87,8 @@ struct qcom_edp_phy_cfg {
 	bool is_edp;
 	const u8 *aux_cfg;
 	const u8 *vco_div_cfg;
-	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
 	const struct phy_ver_ops *ver_ops;
 };
 
@@ -150,6 +151,20 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
 	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
 };
 
+static const u8 dp_pre_emp_hbr_rbr_v8[4][4] = {
+	{ 0x00, 0x0e, 0x15, 0x1a },
+	{ 0x00, 0x0e, 0x15, 0xff },
+	{ 0x00, 0x0e, 0xff, 0xff },
+	{ 0x00, 0xff, 0xff, 0xff }
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg_v8 = {
+	.swing_hbr_rbr = &dp_swing_hbr_rbr,
+	.swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3,
+	.pre_emphasis_hbr_rbr = &dp_pre_emp_hbr_rbr_v8,
+	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
+};
+
 static const u8 edp_swing_hbr_rbr[4][4] = {
 	{ 0x07, 0x0f, 0x16, 0x1f },
 	{ 0x0d, 0x16, 0x1e, 0xff },
@@ -246,7 +261,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 	 * when more information becomes available about why this is
 	 * even needed.
 	 */
-	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
+	if (edp->cfg->dp_swing_pre_emph_cfg && !edp->is_edp)
 		aux_cfg[8] = 0xb7;
 
 	writel(0xfc, edp->edp + DP_PHY_MODE);
@@ -270,7 +285,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 
 static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
 {
-	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *cfg;
 	unsigned int v_level = 0;
 	unsigned int p_level = 0;
 	u8 ldo_config;
@@ -278,12 +293,14 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	u8 emph;
 	int i;
 
+	if (edp->is_edp)
+		cfg = edp->cfg->edp_swing_pre_emph_cfg;
+	else
+		cfg = edp->cfg->dp_swing_pre_emph_cfg;
+
 	if (!cfg)
 		return 0;
 
-	if (edp->is_edp)
-		cfg = &edp_phy_swing_pre_emph_cfg;
-
 	for (i = 0; i < dp_opts->lanes; i++) {
 		v_level = max(v_level, dp_opts->voltage[i]);
 		p_level = max(p_level, dp_opts->pre[i]);
@@ -543,7 +560,8 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.is_edp = false,
 	.aux_cfg = edp_phy_aux_cfg_v5,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -556,7 +574,8 @@ static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -564,7 +583,8 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
 	.is_edp = true,
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -745,7 +765,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v6,
 };
 
@@ -924,7 +945,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v8,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v8,
 };
 
@@ -942,7 +964,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
+	if (edp->cfg->edp_swing_pre_emph_cfg && !edp->is_edp)
 		ldo_config = 0x1;
 
 	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);

-- 
2.43.0


