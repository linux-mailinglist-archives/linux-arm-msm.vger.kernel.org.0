Return-Path: <linux-arm-msm+bounces-102052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN1JHbaL1GmjvAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:44:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 253213A9BC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30E95304096A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 04:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B783375AE;
	Tue,  7 Apr 2026 04:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ojd2mJMO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pzo0SKk4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCECC33A718
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 04:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775537031; cv=none; b=gu17KEA8NW2jliuJ651cfpG4qISwniXgFJkBD905R2WaxLiCmj3hkVZqNXTwxlJ5w1LGr/s0UKek7ipwk8OGm8FGkH61e5Pdd3wY/bYjrZ3ulog7Jk3FVOC9immhFgrb51uF9DccfHN3YcdDZ09Xip6qchEFgGmVIJQRJjbVmLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775537031; c=relaxed/simple;
	bh=oX1pSlo7oUBLgGkMV37O1JTibd7jfWXwVtm/LiTas2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDVuwB8xAflviIRfviAMGGZ3BMQPAnrBUp40djTd8o9FWcUMdspUnXzYA38+p6V9Y5aZKjdUL/NjbyjsL741lEOqq1HdUPRu0birucw1AwBtIlSmbUiTtcKwTHrqPLtEm1G74yWAvF7reV2KbCRDWR8mfAujZwsz6WFdzhCb7ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ojd2mJMO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pzo0SKk4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LSfqT2580030
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 04:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlETBh+6cM//2TJo2BGkD6OW7HngQwmBVKNomE0A2UY=; b=Ojd2mJMOdPnOaBtk
	1g3EVgArWEYFc1rberxX5W01P0f9tqo9bOiGKuO0KpDtnehSL1n6k5GoeFh1F2EE
	U/vfXe5Es+OM/snVVha8uruZHkbYGmQi8ONjo4cerpqWicdUSs6+VosSjkGpHZH4
	hr/cdRmxpa2thlpgVd6GAYf3vK936aebRP8IOR4oEhpp7mUc1cnF5w66SGyAWSn5
	TVj5Me3XvyZAxP7+nSCqstTKkiH3vyBfiQsVD50AxiGz3U1kNcYYBfV9OQoVT1uh
	DMZEVI8FAsvk7Hz4nk5q39F/8uVtvvomIlyAlZEh6IPhCE93DSz4BE/7WLDF3Y69
	7k4flA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf11t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:43:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c83bd48afso2625252b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 21:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775537028; x=1776141828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlETBh+6cM//2TJo2BGkD6OW7HngQwmBVKNomE0A2UY=;
        b=Pzo0SKk4HQT9TO+mW4K+u3NR//l2Brl2ZUwLO3sO0uUe+3JCItTSYwT4KWBGY1apYS
         VimBmg8b0qriLLFZ2xYlgl7Dpu3Oq1R8MInJqpDykz4BB0CISQu/nO2zIzk7mLxeujev
         BWB/iZU1OrFct6+YVZTfDO0bZBBKL1RgPu6LYbvdWT4N+InzpJXU3dtnfuyHmZ6rA69Y
         oH9DaJGcCfuwokiCdE3LLIyB5NvWbcgROMVm09VfBzqoLfZYyAW9mpNFIDfvWPTlJY1S
         wvlOXo6AXlu0oLI49dMRQ6YTjjhK0XIPQPhXxfNEMLVdEnQu+Us046jVUH4tU4mLl5Bm
         C8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775537028; x=1776141828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hlETBh+6cM//2TJo2BGkD6OW7HngQwmBVKNomE0A2UY=;
        b=QjTNQXUIRlfEJ6c+jNoROrULl/Qow/AomsZc6YGcqHFsbBRKFDxP8SeqeHlgHn9U7A
         ZPh39YLcLRMOk91pZVv6xcXsv1Tj+77mU0sJRMUNfzLdVfobirizILURXb9EdwJRRRPW
         L6QqXvOv7gOUauF2hFALaffd606KceqaZbeWlr96kRIbPUypLHtWEbhEDtCDyJSYyTBR
         8f2DjgHOkEZoBJo6ALHSMQFRX4Gi+e9BkvHhEYblvxOwxe6exRV3XztDi5lCHaL9F02g
         sZtbq1L7crY2tpHAv0LOLddmy4YltybfiDloU7Uai6sAoCm7S6M416Y13Mfpi56dEr8h
         yk1w==
X-Gm-Message-State: AOJu0Yz61ALQsULLCsOABkje0lMDjXFvdv5bwkAm80NpdMlI++gmk3H8
	lMP8teP44YthioT3Er7CsGfPmPezmFpwE8gy6rS5oMeMYKZuEXRsoedQCk+Vc9mBjOPqh8cORIj
	C+rFGvP42UuZkxf/JBai3Llakmul/Y+EXsNMGooSikzr1AcSRHKbSHZ9UGsrXPqP1g59H
X-Gm-Gg: AeBDieuBZ72QBt2qwNVImOSFyJ7Wbez3A5I8u9rmozrxiIKW0mA5RCoSt78wQKda094
	+fvZPApfPVDvDH8IhHXNA4wZ20L80s7sqe2va4q4lRLAE0sUvM3eTM/y1d535nJnDgiFs1ryYgr
	yIfGWFZfKcBZcHbk2GqgWUqtC/J5+rgn7CpxcDDw8dm/hj8sZhWdGokHR3SvREg8IwIE2bYijYB
	zELH7WOQpuXqKLbXoWOZnlXeykn+LBxmS1xMeTS9PjsQQScpTv2jYdH6p+iA8EQiawvRbJtgg1e
	CmujpilxxGdtYpp71UiV2FOUU+6sNLAElfJhK4p9GuUUWKDEDAwC5crSJZ+JWS9Uu3qzZoGFbks
	YV/6JzT5Sd6wHZqJP84N7uKlprW50IjtllfFEpM0s4QIedeJFdiI=
X-Received: by 2002:a05:6a00:414b:b0:82c:d8c3:6983 with SMTP id d2e1a72fcca58-82d0dbcfdd5mr15052888b3a.51.1775537027587;
        Mon, 06 Apr 2026 21:43:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:414b:b0:82c:d8c3:6983 with SMTP id d2e1a72fcca58-82d0dbcfdd5mr15052862b3a.51.1775537027024;
        Mon, 06 Apr 2026 21:43:47 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm16123299b3a.45.2026.04.06.21.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 21:43:46 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:13:31 +0530
Subject: [PATCH v3 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-read-rpmh-v3-v3-3-34079f92691c@oss.qualcomm.com>
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775537013; l=10099;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=oX1pSlo7oUBLgGkMV37O1JTibd7jfWXwVtm/LiTas2E=;
 b=X7IAq6hoQNeYRLev1HYl9QD1RD/IuvK/rPLzagP6iUm/H6SS4vGfFG9iNKisfh/CsVFys9AH+
 hIHUDQet9baDfD5s95ajU8DpnCyJ0V/XiauYObs6FPCbFDYXw8mXJhb
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0MSBTYWx0ZWRfXzeDX7CQv0SVr
 QzA/PgXixqa4bSzN56ZE3wnGMjQyRsEsk756oxXI2UVHbX6+E1vVdkMuFhIVV27x0k5/QFItKwi
 xXf0ZkLYlAAf3tfp6opKa/alUEpY7z7aARFynIWatZWUsWzasDuxnzWLFTj6GelGAhcKjitQU04
 8dh/68vAWQA+NyfYqgH5yUeusAhkejSb30RCcMT4LemqnGr9Al1qzvE/6r7LKXDSkO6GHThIFUL
 vrAF/313vvjJ5tMHE1C4ah8uAUPvII28eTs5iIDsBUEvq2otshNhMmfvtaG2UWhn3j8jgO/OnUT
 A3HR9qh/vBtW+gVUNc8cZyvyZic3QS0S9TpN5T6gRmTRaAhljQI7MGJgzXlzguCWXL2O2VwRXjN
 kWlpdo6aBrK4RKwZ/1B9LB3PKNwPtsQblc5aLn/RPI4BefBTnxONqbXMuLBmA0KCce/yy1++wPg
 XiqhEBesgbigMxsyh4Q==
X-Proofpoint-ORIG-GUID: HnhsiAhjRljrHMKjxFS2E5q6kefEtWxP
X-Proofpoint-GUID: HnhsiAhjRljrHMKjxFS2E5q6kefEtWxP
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d48b84 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tHHH2asN0IuRntgD_GYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070041
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102052-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,cmd.data:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 253213A9BC9
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


