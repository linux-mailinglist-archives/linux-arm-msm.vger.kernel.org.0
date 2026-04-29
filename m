Return-Path: <linux-arm-msm+bounces-105104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFTxObaH8WmchgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:23:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01048F20D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B98C23018608
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7957138BF9C;
	Wed, 29 Apr 2026 04:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUjbIfPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWl7E6TH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7838AC83
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436586; cv=none; b=t4/tvk45GHD+nRClY6geyD7o+xBC+7uZtFxJdtA6GW9hXTu5NN6G4z+p+zqTCmRREsei8hFEjn2ay3NMyMYN0Ug7j3z62kjnvwgOFMbBgWKzXqYZ59WA+WHyOy4XADiFF+mljc1bFVdIDd5lvPNP567T+CY79lZjxHGxOmfJJB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436586; c=relaxed/simple;
	bh=jFRNIsAAfyAug5VRjXEXqFLZUcaJoNigQqeYCKQMUe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iM9qL9+kCUgI6/UJsUGoVVGSMwoqLhhw1QtcINUnpm/s1GfGSL3GunK/3ZzqdTGuvmWStLabaHbPKGrC0fCHzMSdrtJcWn2MyzCJkhZrOA8SoSkb2bn72EX13whaQ4FiLftEB/9pBMhZ/Ci6/4TeSI5zsDJmTRSMG2Dpf8KhmgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUjbIfPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWl7E6TH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2vU5w2983640
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=; b=WUjbIfPiTO8Zs3Ta
	XdfCjvrNeEHxDMGw+wzwPF2qqJ9S4qRVcvcvaKVpnk/RjREMiUnyxIre7LMlvas0
	AZteIiYFMgRXq/dn6zrUlroT4u+m0QYimJBm2aJhmgFReOv6tITA2+pQQFGicZXY
	aHXRjnqXvQTwPHFzxMUHo81ImEezPPCyUXpxQO8ZHHu24+YCgLzqePefH29PPBoi
	vPe4nTQpL9IiqcrLhf13ygQUmQdJpSINJZBVUnUS3WGiPqmKuTbXPJARz881/ca+
	gjmOtNlw5ukrJ3MhFVkOOemlYAUd2hdtxNn+RtAc30n4B6R0Ze2JiAmsc/28ouEl
	g5eBJw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1t1cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so12792370b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436583; x=1778041383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=;
        b=bWl7E6THL0rJOFj4LwA0+CB1RwWUWdD9AJKGKG7N5LQSB44MAnEYTTVA+tpHRm6MK8
         8jZfDy9m5wDT7TaRk1yBMXvGsBqI+UYE9PNY5tuBM+S6S4UEti7SyI6kLkrpo/deCVAp
         YJFSI0PTtG5Y67cny5F1ikTdxk3ygxifUBEUhB042mGjB4CYl+G6G32CYIIqgMY+OUuS
         ykCUaYVDcwyoOAyFIIFD/R8H1W5idLDKz9du1bDCks+DLDfZDmH6I0Ly8YXB4O5lBpk+
         BJHwvGiOdlAAMv/60nEGlue3rX5kRmRU4UIzAL9Er0E1SmrBIdBnF9m+/rE9GN/EzkJz
         2z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436583; x=1778041383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ajOkDbyqj2nICqoGPG637xYt2lDMFeRBdsFcCgJXb4E=;
        b=OvyHgM76L5jtKF58MwZXZw4ylflM+Rhx81OFlwY+F4k1w2msJqp7pWzVO3lLg0nO6f
         LUq9FV5Tm8sVdtzJTaCJkGb/xuDv1O+SUoHfO4Veh2olft811DB7/nM6CDqre9MiRV+o
         q3ioM/aQicfVyHFCHc5xjPXZYLNdzQgHg3sYtA1KDON70Pq47ltZ+K37rzwChREPbT9c
         QszbPNWpQvhSiAhTLru4AfqdxuAE8dwKiyhs7bgYn3Go2liorFMDuj2z6sXC2d1E1IJt
         eP5NHFbowMdp344iW8fk5VdPnXZ+1OD9CU5VGq3ZpaG0BJT7OHGBbyGSlRE3m+jc76YQ
         7kQQ==
X-Gm-Message-State: AOJu0YwcGMqEuL1evXacdyQTM0bOU5jXtsEDhRKLq9O776Ibpo1nZKO4
	gmXx8Pa2EsPIVQhuAhFmPVUmylbku2LkPg7vWNp+FD5CUOYjNiY8Ilvn9k/O/9zLGKrOvrkqQBy
	g0EeZ2zSs7vYyP7/akrsIZz2ih8QOa5oaOprt+/xXBhgSqRtTHM0LAP6sN8VN4mhZlxlD
X-Gm-Gg: AeBDieu6WMalURI1xFbOmn5njqOoEB6sou8t9GyyHPUrXbNtZT+m392r5Tv2nltxpzj
	oag7+EGJ0w7gVsYh1NlEABy3GGAr9FvXbV78mxbxW6uBXkwee9NU4agTYUcjaNIKmGh8K1m1KKW
	BPgNR+be3twA9IrXCovXsa46aKhMbmoU3ft40kzBoBZO/8AkGnwCqLwf/cMFylAFfjslr9D43SH
	JmURXdEBkkbb+V6824Lkarmxat0Z+6Qi2Rg18fsegZIMyCasybAhqHAEJJMUMBX1/EOsgG+OfXj
	xaRV+SU9DI4cIoZqHjxPajI/zpSohIk17jX7jP4igtYyb/zV/c69VLHzQ+UZa1fIkQualhpAN9s
	zF0Af/uLF+x7UFENWm4rMWSb1GmtzjW8Vc8wYgM0GRB1FQPqvdzZTy0EhThCIBpBW2Mdq
X-Received: by 2002:a05:6a00:8e01:b0:82c:6d88:2a8e with SMTP id d2e1a72fcca58-834ea5e5777mr2116145b3a.20.1777436583438;
        Tue, 28 Apr 2026 21:23:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:8e01:b0:82c:6d88:2a8e with SMTP id d2e1a72fcca58-834ea5e5777mr2116109b3a.20.1777436582893;
        Tue, 28 Apr 2026 21:23:02 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:23:02 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:52:41 +0530
Subject: [PATCH v4 2/7] spi: spi-qcom-qspi: Fix incomplete error handling
 in runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v4-2-73fb1bab03ba@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=3312;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=jFRNIsAAfyAug5VRjXEXqFLZUcaJoNigQqeYCKQMUe0=;
 b=5jiDIJ6FuIkN2f9nBOgJWvdtBUYK20DHz5FWpeVTv7dPnAW0CbbnuCNnJVUE91h5Xrcu3B06w
 ql+TsQPmoAfCPtDcyZ0XBN8KVe+l9mEizllu68NrLZiCcTFNoV0i4ua
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: F4NrhOgqDazqZGqiLsn2valesG39III3
X-Proofpoint-ORIG-GUID: F4NrhOgqDazqZGqiLsn2valesG39III3
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f187a8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GfYcMVghsOmS6C78lsIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfX0cfjvGIU/ojD
 zi8o9I0QNeU0RQRyqcoOU1bOyTYNBm9s1dy+ifMtBbEdyQeSCaqHi8d1LbnpCPbaChaLX+IZwUC
 2Mvc67h6nRRF5faplTInpjoHrhRI0rNb1lzT2irxm6J8Xh1O6igxQJlAje/MPoty1++MEdOVC5J
 0fyz2fe+p7Je7PiYiSj9giI7iImTazEzIIu+iwYqkn9vWcVbh6bO5Uaq3CWVkmtCO6ed0zzJey9
 44QNe0mL0LFW3BbVGzspWGOc6w3B0K3MnSIN9mc2zBedxOBZavHSKiaf3MdvixbMnzsgo3RZUDm
 npqXlWik/wlcS9xuCivq7pPCWmYjbiSlBTRtvvIsvSNIvzebMZDNEm4wucjOKbN0o7kR+IbVyoa
 enQoFnWKznEaidxMtEVz3QEyZcf3jwyZE5cB0X2rKYGM7astoqJA2BOqBpYsqX2zleKjb38cav4
 2zec21j1cDw8W+Q+SwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290038
X-Rspamd-Queue-Id: 7C01048F20D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105104-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The runtime PM functions had incomplete error handling that could leave the
system in an inconsistent state. If any operation failed midway through
suspend or resume, some resources would be left in the wrong state while
others were already changed, leading to potential clock/power imbalances.

Reorder the suspend/resume sequences to avoid brownout risk by ensuring the
performance state is set appropriately before clocks are enabled and clocks
are disabled before dropping the performance state.

Fix by adding proper error checking for all operations and using goto-based
cleanup to ensure all successfully acquired resources are properly released
on any error.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/spi/spi-qcom-qspi.c | 44 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 7e39038160e0..edfbf0b5d1fa 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -818,20 +818,34 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 	struct qcom_qspi *ctrl = spi_controller_get_devdata(host);
 	int ret;
 
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
 	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
 
 	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
 	if (ret) {
 		dev_err_ratelimited(ctrl->dev, "%s: ICC disable failed for cpu: %d\n",
 			__func__, ret);
-		return ret;
+		goto err_enable_clk;
 	}
 
-	pinctrl_pm_select_sleep_state(dev);
+	ret = pinctrl_pm_select_sleep_state(dev);
+	if (ret)
+		goto err_enable_icc;
+
+	/* Drop the performance state vote */
+	ret = dev_pm_opp_set_rate(dev, 0);
+	if (ret)
+		goto err_select_default_state;
 
 	return 0;
+
+err_select_default_state:
+	pinctrl_pm_select_default_state(dev);
+err_enable_icc:
+	icc_enable(ctrl->icc_path_cpu_to_qspi);
+err_enable_clk:
+	if (clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks))
+		dev_err_ratelimited(ctrl->dev, "Failed to re-enable clocks\n");
+	return ret;
 }
 
 static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
@@ -840,20 +854,34 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 	struct qcom_qspi *ctrl = spi_controller_get_devdata(host);
 	int ret;
 
-	pinctrl_pm_select_default_state(dev);
+	ret = dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		goto err_opp_set_rate_zero;
 
 	ret = icc_enable(ctrl->icc_path_cpu_to_qspi);
 	if (ret) {
 		dev_err_ratelimited(ctrl->dev, "%s: ICC enable failed for cpu: %d\n",
 			__func__, ret);
-		return ret;
+		goto err_select_sleep_state;
 	}
 
 	ret = clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
 	if (ret)
-		return ret;
+		goto err_disable_icc;
 
-	return dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
+	return 0;
+
+err_disable_icc:
+	icc_disable(ctrl->icc_path_cpu_to_qspi);
+err_select_sleep_state:
+	pinctrl_pm_select_sleep_state(dev);
+err_opp_set_rate_zero:
+	dev_pm_opp_set_rate(dev, 0);
+	return ret;
 }
 
 static int __maybe_unused qcom_qspi_suspend(struct device *dev)

-- 
2.34.1


