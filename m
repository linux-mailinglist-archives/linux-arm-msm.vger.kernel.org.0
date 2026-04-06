Return-Path: <linux-arm-msm+bounces-102018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCSqLNww1GmUsAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:17:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 172043A7CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8586E307B03C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 22:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB0839DBDD;
	Mon,  6 Apr 2026 22:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lhc8/uXo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HarbPbJs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854CB39DBFD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513732; cv=none; b=CJ9qwHrYB9KphAmAw5ff0C4phSzDeXNce3aiSbWPoQga5jlO4ZlaXFuBr6KrCk13ZDnnEGOvyXs1nv8kjQPXIg8JW5MxeO+ye/HY2nz/cFuxRsNmn6E1xfgeks89ZovVjNjaBcVyXnzDA5GjeEeEeAj1HLYiflgQN/ifNzzxedc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513732; c=relaxed/simple;
	bh=oX1pSlo7oUBLgGkMV37O1JTibd7jfWXwVtm/LiTas2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mKiACwTVW5wL82JY+7DmOf3pggyQl3z1MTlmJLTX+9gRzoWP3KPwQM4pCzzhron5f11/QxLEM3VuUnppXRlgvLiKrFJDbPkXYm404qadrRnaFMGXE4pewSDp1OdFxMlUTnrbpEgZTiL4IgVnH2vd6vF0l9FL5Tur11Zuf4kYgS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lhc8/uXo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HarbPbJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LSMhB2328163
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 22:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlETBh+6cM//2TJo2BGkD6OW7HngQwmBVKNomE0A2UY=; b=Lhc8/uXoPth/NDej
	chNi2qwHUwja4ADLZeI6IjxEOF8H6zy6DuoQLHIhDbaqc+03GugwfYI/Me97Ay9Q
	mp0Gu5LwcRdtcDiMmM+XzDhuNivAlsx3IRdKrAUlhzSqiqL71CS6IWbY0Dx7IfQ0
	HqVi9oBFCKBfu7rxUhiQoSOoMm/65zRDCF8gXClO45w7Rhx1Tmrv0mow1XeGx3xr
	mA01+7LFxJr8K7qM2NAEGIKeIN6enLMl0ZH1iBpRgCKaSAbTls9eDwT07fU3DVTN
	gNPvbA1alQgejIGTo0VxNJglnQKOvlP/tYDEcUCZHqawK2oOUE4ibAz+kLIxoJFk
	nW3qQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4r39v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 22:15:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3595485abbbso5289976a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 15:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775513729; x=1776118529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlETBh+6cM//2TJo2BGkD6OW7HngQwmBVKNomE0A2UY=;
        b=HarbPbJs3dqLCixLeO1/oNlD5gkQMmRBDoNF9ireu7xSR+Eq4SAj1r83JzrldNESNE
         s9ANHjj0z9or++KcmVihyc/NkHjnIsM5OCnlSak33Stdz4eTBEuDprJby1ywMdhwphP4
         3v1bgaF3ZzeN1qpXl3d5jUnORNL2x0IZCV7FMclw2ZM0P/k4aEcXx9X4UZPH0h7sIWO0
         ZgqxLAW0BwMgjX0vSQHLd6sAXvnmbXbSd6pw1tde3DKd83Z2tntqzkeFbnyURF0AfKsK
         q5Qe6tQy5o/d8hSqXzJluCP9iVanjpBlBS76InqoN1WT/uzmkUZAzl1L0lyC6xsKfFe3
         v2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513729; x=1776118529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hlETBh+6cM//2TJo2BGkD6OW7HngQwmBVKNomE0A2UY=;
        b=aVUmRa8OjXqdNJF+FsQB5hP4n8HyzYK/t+6ZkCW+sdsQTyOshqOoNgLglqHXPXl8h8
         H3awyt8YObpKAyPMeG8nTdiXMLT/n+3ytnsyERn8TkMnQm6b9sf/CPzgnrRglImT4vFP
         4EiAn6KahhktxSXlY+OcMoXNNw1DXBP6qExVpWgcFQGcfmlLnr7rHBMdl0I+FzRijJuq
         iGNfqF6ZxVcut9xDwITQOXFqxX05qSzTr8hKQwaOiCBVicUiPkwu2aT6C7gN6j2JzMx8
         TpWD4dMnVK+nnS/ErDHjw5b9LYu4w0owi3nqYsensricpbT9ui0jK/0Zw7u1mv1sxJHV
         HvsQ==
X-Gm-Message-State: AOJu0YyTc8CBd5ZAN0jQZHfmVrlhdDXsrjPEpU2tAJHWSQW9C/KP8x0O
	1m3vvc1Z7vggznWMKIVmAPiqw8+gMOoHYqt+Wn2J5SrpKm1PmE7bTJeUYX6ROzL9keYhd2rO2no
	o37QHdoSsJI8bks0zWvtw7vxP2Lj4PybEYL0j3HObJORtoYdfvxxatH3l2kw+/i2uoXHw
X-Gm-Gg: AeBDietfg62zSiggP9aGd9y+UOXJw5sVr1eYGMVIbmV3Z9q/QRIFLzP4cadZUC7sivG
	9G3ntUjtH9/MD1uBwpIhWTCnStH0RoVICCDswZSUjwbBr62OlrklROeUzMRJmOLryGPaZx7MDAk
	H9GeRaw65p6yQecArT0mJ37pVEv1MZ9bsuD1t2gujjEs9jHaj85kGgELqVKz0q2Sb4jX5G77Wru
	7teda5l+NNoKw0d+svX/zoXq0QKyJnEZjnZ14D8CtZUxOkFGSlxejvNODhX3HC5jpU6/ltVGPP7
	1yxvYbOrLIa0bKvKfRQJPxMqMvM9t40uclMCRMXpQ7oUVnuTuCsFBCVrX+Ra1VZR2KzwC7vXQRn
	nQJIfJiUGrSRpA2OShaPeznvTMFu3+o+5+6xog78Uz/HQNvLy07E=
X-Received: by 2002:a17:90b:2251:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35de69acf35mr13641193a91.22.1775513729067;
        Mon, 06 Apr 2026 15:15:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2251:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35de69acf35mr13641159a91.22.1775513728345;
        Mon, 06 Apr 2026 15:15:28 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34f9sm14447519a91.1.2026.04.06.15.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:15:27 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 03:45:00 +0530
Subject: [PATCH 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-read-rpmh-v3-v1-3-27db2a56b13e@oss.qualcomm.com>
References: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775513714; l=10099;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=oX1pSlo7oUBLgGkMV37O1JTibd7jfWXwVtm/LiTas2E=;
 b=LVfPcK5wVWZ+1L/4US2k6RX5sqQHVXTnD6WDCbzLXyhWj73BDyZ4blryIgrWOxzKooYFoGwqL
 eEy5iUfe+eoBwxvGanPESfr7QQk3duhyu83v0n5HUp7jG4qXI/JS14f
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIxOSBTYWx0ZWRfXyxQVHpzpR67S
 OFpIH3zGkvRr+RacySWX7YXIDPvynWTffg0dt7k7Qjl6qBTvObbfLv2QxjcA3UYj5H90B4nYzLy
 kQv/qnCPNqcBTHBUMZm7o1nSIjLxLs2D9JV543FO2XvoMVhw+Pob32a2V6lzRDjxh169t0ldH0v
 j/0KrxW6fgybZay20Evsjx7KMWCI1JDzFTTT3R0JbhNURgB0/P5mXhg5LEtIdZ029sqPw52BD1j
 6mp+xqkbdUeJjj3Er4F1c9HXga0XqFRjAtiAmSWM6YULeztTHjVfMhiGcwNAskHxGGZ9r8qXLHS
 NTtap3SqKym8Rni5y2TvuVu5xDjOIowKRKkYTCCm6RCJXXows2/e+Td6uv9rnShTUZ8bZdAwtCr
 m4oa1wgqzmV98zuBMuW4buR2f9affO9PlOS3tR+VbKAMuS9Td93x+HBGK2rXWBElIieEblb9mb8
 tynT50qls7Cu+kPhBhQ==
X-Proofpoint-ORIG-GUID: 8mertjgWHQvqHsDtAp_LXW8cyZEEYQ5n
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d43081 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tHHH2asN0IuRntgD_GYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8mertjgWHQvqHsDtAp_LXW8cyZEEYQ5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060219
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102018-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 172043A7CCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, during regulator registration, regulator framework sends an
unnecessary `min-microvolts` request for the rpmh-regulator device. This
happens because in current design, we do not have a way to readback the
voltage settings that was set during the bootloader stage.

Fix this by using the rpmh_read() API to read the regulator voltage
settings done during boot and make it available to regulator framework
from the very first read after the bootup.

Also use this API to read the status/mode/bypass settings as well. This
will provide the regulator framework a sense of the initial settings
done by bootloader and thus preventing any redundents writes for any
setting post bootup incase the same setting was already applied during
bootup.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 178 ++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 85fbf10f74bb3393071bc65681356312f27b7527..8e1c576b718b595bbbff7f5fa76de84d4e90f3bb 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -61,8 +61,13 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
 };
 
 #define RPMH_REGULATOR_REG_VRM_VOLTAGE		0x0
+#define RPMH_REGULATOR_VOLTAGE_MASK		0x1FFF
+
 #define RPMH_REGULATOR_REG_ENABLE		0x4
+#define RPMH_REGULATOR_ENABLE_MASK		0x1
+
 #define RPMH_REGULATOR_REG_VRM_MODE		0x8
+#define RPMH_REGULATOR_MODE_MASK		0x7
 
 #define PMIC4_LDO_MODE_RETENTION		4
 #define PMIC4_LDO_MODE_LPM			5
@@ -154,6 +159,7 @@ struct rpmh_vreg_hw_data {
  * @voltage_selector:		Selector used for get_voltage_sel() and
  *				set_voltage_sel() callbacks
  * @mode:			RPMh VRM regulator current framework mode
+ * @status:			RPMh VRM regulator current framework status
  */
 struct rpmh_vreg {
 	struct device			*dev;
@@ -166,6 +172,7 @@ struct rpmh_vreg {
 	bool				bypassed;
 	int				voltage_selector;
 	unsigned int			mode;
+	unsigned int			status;
 };
 
 /**
@@ -210,6 +217,28 @@ static int rpmh_regulator_send_request(struct rpmh_vreg *vreg,
 	return ret;
 }
 
+/**
+ * rpmh_regulator_read_data() - read data from RPMh
+ * @vreg:		Pointer to the RPMh regulator
+ * @cmd:		Pointer to the RPMh command struct to readback data
+ *
+ * Return: 0 on success, or a negative error number on failure
+ */
+static int rpmh_regulator_read_data(struct rpmh_vreg *vreg, struct tcs_cmd *cmd)
+{
+	return rpmh_read(vreg->dev, cmd);
+}
+
+static void rpmh_vreg_update_status(struct rpmh_vreg *vreg)
+{
+	if (!vreg->enabled)
+		vreg->status = REGULATOR_STATUS_OFF;
+	else if (vreg->bypassed)
+		vreg->status = REGULATOR_STATUS_BYPASS;
+	else
+		vreg->status = regulator_mode_to_status(vreg->mode);
+}
+
 static int _rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 				unsigned int selector, bool wait_for_ack)
 {
@@ -248,9 +277,42 @@ static int rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 					selector > vreg->voltage_selector);
 }
 
+static int _rpmh_regulator_vrm_get_voltage(struct regulator_dev *rdev, int *uV)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_VOLTAGE,
+	};
+	int min_uV = rdev->constraints->min_uV;
+	int max_uV = rdev->constraints->max_uV;
+	int ret, _uV = 0;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (!ret)
+		_uV = (cmd.data & RPMH_REGULATOR_VOLTAGE_MASK) * 1000;
+	else
+		dev_err(vreg->dev, "failed to read VOLTAGE ret = %d\n", ret);
+
+	if (!_uV || (_uV >= min_uV && _uV <= max_uV))
+		*uV = _uV;
+	else
+		dev_err(vreg->dev, "read voltage %d is out-of-range[%d:%d]\n",
+						_uV, min_uV, max_uV);
+
+	return ret;
+}
+
 static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	int ret, uV = 0;
+
+	if (vreg->voltage_selector < 0) {
+		ret = _rpmh_regulator_vrm_get_voltage(rdev, &uV);
+		if (!ret && uV != 0)
+			vreg->voltage_selector = regulator_map_voltage_linear_range(rdev,
+							uV, INT_MAX);
+	}
 
 	return vreg->voltage_selector;
 }
@@ -284,6 +346,8 @@ static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
 	if (!ret)
 		vreg->enabled = enable;
 
+	rpmh_vreg_update_status(vreg);
+
 	return ret;
 }
 
@@ -333,9 +397,27 @@ static int rpmh_regulator_vrm_set_mode(struct regulator_dev *rdev,
 	if (!ret)
 		vreg->mode = mode;
 
+	rpmh_vreg_update_status(vreg);
+
 	return ret;
 }
 
+static int rpmh_regulator_vrm_get_pmic_mode(struct rpmh_vreg *vreg, int *pmic_mode)
+{
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_MODE,
+	};
+	int ret;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (!ret)
+		*pmic_mode = cmd.data & RPMH_REGULATOR_MODE_MASK;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
@@ -343,6 +425,13 @@ static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 	return vreg->mode;
 }
 
+static int rpmh_regulator_vrm_get_status(struct regulator_dev *rdev)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+
+	return vreg->status;
+}
+
 /**
  * rpmh_regulator_vrm_get_optimum_mode() - get the mode based on the  load
  * @rdev:		Regulator device pointer for the rpmh-regulator
@@ -379,6 +468,8 @@ static int rpmh_regulator_vrm_set_bypass(struct regulator_dev *rdev,
 	if (!ret)
 		vreg->bypassed = enable;
 
+	rpmh_vreg_update_status(vreg);
+
 	return ret;
 }
 
@@ -401,6 +492,7 @@ static const struct regulator_ops rpmh_regulator_vrm_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 };
 
 static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
@@ -412,6 +504,7 @@ static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 	.get_optimum_mode	= rpmh_regulator_vrm_get_optimum_mode,
 };
 
@@ -424,6 +517,7 @@ static const struct regulator_ops rpmh_regulator_vrm_bypass_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 	.set_bypass		= rpmh_regulator_vrm_set_bypass,
 	.get_bypass		= rpmh_regulator_vrm_get_bypass,
 };
@@ -432,6 +526,7 @@ static const struct regulator_ops rpmh_regulator_xob_ops = {
 	.enable			= rpmh_regulator_enable,
 	.disable		= rpmh_regulator_disable,
 	.is_enabled		= rpmh_regulator_is_enabled,
+	.get_status		= rpmh_regulator_vrm_get_status,
 };
 
 /**
@@ -540,6 +635,83 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	return 0;
 }
 
+static int rpmh_regulator_determine_initial_status(struct rpmh_vreg *vreg)
+{
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
+	};
+	int ret, pmic_mode, mode;
+	int sts = 0;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (ret) {
+		vreg->status = REGULATOR_STATUS_UNDEFINED;
+		dev_err(vreg->dev, "failed to read ENABLE status ret = %d\n", ret);
+
+		return ret;
+	}
+
+	sts = cmd.data & RPMH_REGULATOR_ENABLE_MASK;
+	if (!sts) {
+		vreg->status = REGULATOR_STATUS_OFF;
+
+		return 0;
+	}
+
+	if (vreg->hw_data->regulator_type == XOB) {
+		vreg->status = sts ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
+
+		return 0;
+	}
+
+	ret = rpmh_regulator_vrm_get_pmic_mode(vreg, &pmic_mode);
+	if (ret < 0) {
+		vreg->mode = REGULATOR_MODE_INVALID;
+		vreg->status = REGULATOR_STATUS_UNDEFINED;
+		dev_err(vreg->dev, "failed to read pmic_mode ret = %d\n", ret);
+
+		return ret;
+	}
+
+	/*
+	 * NOTE: Since BOB4 BYPASS_MODE value = 0 we cannot confirm if that BOB
+	 * regulator has been sent into bypass mode by bootloader or if bootloader
+	 * just has not requested for any mode voting. Due this limitation, we
+	 * must check if the read pmic_mode value is non-zero before comparing it
+	 * to bypass mode value. This also is needed to avoid setting BYPASS status
+	 * for LDOs which dont support bypass mode, and have the pmic_bypass_mode
+	 * uninitialized value as zero in the vreg hw data. For such cases assume
+	 * lowest mode/status, if pmic_mode is zero, to allow for mode voting.
+	 */
+	if (!pmic_mode) {
+		for (mode = REGULATOR_MODE_STANDBY; mode > REGULATOR_MODE_INVALID; mode >>= 1) {
+			if (vreg->hw_data->pmic_mode_map[mode] >= 0) {
+				vreg->mode = mode;
+				break;
+			}
+		}
+
+		vreg->status = regulator_mode_to_status(vreg->mode);
+		return 0;
+	}
+
+	if (vreg->hw_data->pmic_bypass_mode == pmic_mode) {
+		vreg->bypassed = true;
+		vreg->status = REGULATOR_STATUS_BYPASS;
+		return 0;
+	}
+
+	for (mode = REGULATOR_MODE_STANDBY; mode > REGULATOR_MODE_INVALID; mode >>= 1) {
+		if (pmic_mode == vreg->hw_data->pmic_mode_map[mode]) {
+			vreg->mode = mode;
+			vreg->status = regulator_mode_to_status(vreg->mode);
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static const int pmic_mode_map_pmic4_ldo[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_INVALID] = -EINVAL,
 	[REGULATOR_MODE_STANDBY] = PMIC4_LDO_MODE_RETENTION,
@@ -1823,6 +1995,12 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
 						vreg_data);
 		if (ret < 0)
 			return ret;
+
+		ret = rpmh_regulator_determine_initial_status(vreg);
+		if (ret < 0)
+			dev_err(dev, "failed to read initial status for %s\n",
+					vreg->rdesc.name);
+
 	}
 
 	return 0;

-- 
2.25.1


