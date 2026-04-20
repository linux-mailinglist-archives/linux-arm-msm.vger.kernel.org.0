Return-Path: <linux-arm-msm+bounces-103662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM/3LDPE5WkGoAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:14:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1654270EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDFFC301B902
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEF237FF50;
	Mon, 20 Apr 2026 06:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLw1zCYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNqWmsre"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC2A3815E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665598; cv=none; b=q+cTssDTnvFvNlHQ2ebTHs/r/Qq4LqOe7DOWEbvy1z6t1dD91m9TP6BQIpMATqemIQLfw7nYiOAR01mmETksApOsKprx6ovOmQaQo8bh2yTdCLyt/CZDqqRiegdD8U90Y7/sEr4Tqrv11kTdZvVnre2k4xbqliSxNnQaV7DJzvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665598; c=relaxed/simple;
	bh=alSx5LhHMXZVaVz4KF3miez0euhqC7ht0IrPBqldfw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpeDZz0R8ArpJkbTfgP2eq+XMH3eqQRY71/IABeGShczuK7gEil/oL1/4ICJJ2stjNmiLfngP+JqLsJd2CNAbq8p9Qmh99HWx/fcqK9HajBb5ixbp9vrC5M/wLvx9a1HtoGWV/7YaqlaDBRQWZ/J6Ai+pY9VqpLj4KXNQQtcRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLw1zCYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNqWmsre; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JMqe0o1466042
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbicD+JjAcPTtJD0uPtbhcOnxF6jPxSUPQ/NZZv1Q/4=; b=dLw1zCYL9JL+A5v0
	JuZ4MnPPcLT3Dv4ZYlUeWIHz2RkJFoRQYK3o8OCob8OV2IV8ms8tGIY481PEJKQ9
	moWh7YHof7pfI2pr0MapFUFCjHxaWmbp4hUNuJX7XUGb2ZEzNP75SSK4rFg50jog
	01YhH6ZsITxjxP7CX8q7RCcGPcIxPBclV7EEADgDxOiM5umhOp3BMdMVed9CxeuC
	8/PaebPJv317Ti5VJKlGmZ0y81zPveNXEernkxxTs0RqF09Vr+ACvGxm3W8MX2nO
	Zh6pPA8nKRmErvu0Y416d4LdTQcFEuwRJmCBgJjlGRaAtYfa5DVUg/o2awFKyWaT
	tYDDVw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr4hch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c797e31a9b7so2095653a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 23:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665596; x=1777270396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbicD+JjAcPTtJD0uPtbhcOnxF6jPxSUPQ/NZZv1Q/4=;
        b=kNqWmsrekidtv54JQXd/hyWLvING5+ivHPJ9TUPWPSa44xTVKB05Jp2apSqwbMbN4j
         HrWb6nqZpkkm9Y9u336xkVligDup/bonULB+EpZD4MFfI9IPsM+R2ghmQsYdHUWcQEDA
         mBU0TmVLwxznRrVINbic4IMAUEwvrH9JbRfI7MOXeCRlK++lbQcieGcUulnNlIRAPRy9
         JIGLWCz9qJoLoXqRFuwNeuMpKSscTC2SkMS1pg1WvdmurQ6VdoEPxGYzW/w5TeUreKtj
         /89CUe+eMYJ7kQBvUy3Q8xg8fAhdX62XHTscsLUQFE3I1X4Nf9gVv4IhGGIRANd8tEyV
         rSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665596; x=1777270396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KbicD+JjAcPTtJD0uPtbhcOnxF6jPxSUPQ/NZZv1Q/4=;
        b=nAbkzWKryPxD3RucX9SrqStzdnT530HX6i3mDI9fvL8QD1E32DlLs9Cy6MCVRZNlTG
         wcBDrTdrU/Yncd9gAegTTXrpNepara/DD386YvVDSHEBxIYBBXPmRZHVdq4xEhGc12v7
         3Jr32UtsQ6DIY+IPPfFDiuWcfgaoq2HCDUVI0oX/wH3N8G0TrVyAYId5V9hS0GAEpfuj
         hIzjaXC5v+va0wHoPyH7BEGygyVLqcdQLlIGFvP//OK4iVpTgYOPl1bT3r2FV+zygOr7
         uTYjVAXK+ur4ZMyC5L9khD9iUZxru5O8DPs7VKkdqA7StMzC4ZL8/4SZqxUNNe8sYqwr
         RDhA==
X-Gm-Message-State: AOJu0YzHt+BMy8l2h9YTJRN1URsJUXvH8CfjW1RPvkje3yjg5ylu35wr
	prkKA+2zE/oguQ8TmusO929+/guzjF7tC+SKQHBJIsEWfkzltsktHS8kZ5Z9gDF8Q/g8IJF6tWb
	D0+vFgLrBsTo/R33rbiQ5Zf5j8ls9sUiSjDuHp581iLvQZKkGw4Kw6ZiespWP+lO6oInr
X-Gm-Gg: AeBDietBbnptFHs9uxq2GXTUXKKkMdzYRh0qdH1iadvRU43C9tfKT5ZRYev4k2aC7eD
	0/xI1Z60CitNVq8tQhFom+cVNtHeUoMYpvP1Mi7WHEaS5vaSgxKHtAvDBF/2u368ADQvoGtEq9L
	5SNSUmyAXVQtjoEj/8Jk5da35ijnOXMgMNWuGatkqlqfglr+ZYXTqSfBhNy5jWATzuXELNjQjVu
	TGp0ZiBhOq7gyVYRpJSJb3LSSThJaGFnF+yogzXSXDGCwnDKdlgud4WQEDIWy7Zm2LQgfJpMDKg
	+XZSP9s7tKYQBOCDahXSPkHK3HCdO0yuxHX5FHo2dgLP6CP06Q330hMjtnSFiDotVr9EuS/CATI
	zUc+OU6hVyklbzYtDc0f0AiFZWqgeurgcUXhsQn2/oPUccI3c73eJ9SIOk+0I1LNc1QFt
X-Received: by 2002:a05:6a00:116:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-82f9d21d516mr6082060b3a.9.1776665595644;
        Sun, 19 Apr 2026 23:13:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:116:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-82f9d21d516mr6082033b3a.9.1776665595145;
        Sun, 19 Apr 2026 23:13:15 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:14 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:42:49 +0530
Subject: [PATCH v3 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spi-nor-v3-2-7de325a29010@oss.qualcomm.com>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665581; l=3239;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=alSx5LhHMXZVaVz4KF3miez0euhqC7ht0IrPBqldfw0=;
 b=hz1LOnX4tYZ3Dighub1FkxkQlKvXQyRbg78ENqcECd/oJM7s6BSAHwxpYesGf7tlfUonqMqbd
 wSvdHmju7eSDqW38oPz6v1shXf87TFugRgHFYVRF/Vv5hZy/StrZ40u
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfXzi1r4+lZNYNq
 6TD+OhLo8voNtU3B1zmJZCb1gW/Lk1xwumjuHiLoc3ZX6oFY4iCXdYhGSPN8xrkyOoUsFgBywJ3
 SuqhP4pxY46bRrMPgtXOY9Uxu/O5Kqp7h12UgvR8mRUKWF1dBbAg2ebs/08ZQXXZdxQ/XyUuuC8
 9HGvIJlRRmC1PHaJp+eFt7dCaB7odUYnkp+yftZZHOMsxb6mq10E71RD24DccVblZIY1ISZffCy
 dTS1XuH8zx1YgOpWA/f1xLKyib35R79X9mLfQPpNYhqOgNBaRw1r8Wng/nEytekkveMv4fZmaI5
 GeOAficTloUuCk1wDB9D8YecUGY4g0dr1GOCmOuDeZZyl4iSRuwD+AiWhi+Jk3aiu2g3rGF4zKb
 v0VmfNcaoI9PWYyW/dY1B/gWkF1gQIkWvhGY1OOiAnavNEu8AuJEjaWc3wXURL+HP2Ba0+FwHTL
 J2KCA10z0db3zCL7wlw==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e5c3fc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GfYcMVghsOmS6C78lsIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Py36rhA5hvUsH0m0wpqa2S_b3otcZqVo
X-Proofpoint-GUID: Py36rhA5hvUsH0m0wpqa2S_b3otcZqVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200058
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103662-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B1654270EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/spi/spi-qcom-qspi.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 7e39038160e0..8496c4a9f642 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -818,20 +818,33 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
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
+	clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
+	return ret;
 }
 
 static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
@@ -840,20 +853,34 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
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


