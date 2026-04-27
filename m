Return-Path: <linux-arm-msm+bounces-104613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMntFBsG72ma3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:45:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B526F46DCD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C26C03056148
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FA037BE9E;
	Mon, 27 Apr 2026 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kClnZSqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7uFETHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473E537B40A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271978; cv=none; b=H8qHt/vKE+m69/KaI6e7FZwmGwWEQXdtpDfBfVo/wF+dm6KEfLweZWlR7truvhe/jtfdZ7TpL958WvoWruwXJKDayx+m3Zn4UyPdKgqoEBT7wQhxe8DMqBPQLJ8b1RWVWyGPHCUlhdSzapdtbvA53iCFh0axBzwzubpEiGoJD7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271978; c=relaxed/simple;
	bh=akcdbGGOHDyFpDJgNeVO17N4YErBzFZbupPDnt0Ff24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XEmPEcCuYeSmI82fFC99zdXXEdHex80/q7Ev+TjqoB6r+HsEqjzo7WDt9/tBvR0lqEOZuSJlpov5bmTYbu96fIumKex127qlgXzUF6Q8Oi/Bn9GS/cSaf9X5XvfxS8xFbDezYjqGGEYctcULsVFP7uEy5qBM+II8DVqZJ0ZAQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kClnZSqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7uFETHp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKcwD43556929
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=; b=kClnZSqe3MNu7d0V
	N2PI9R93KmB/Ek0+xOoyR72UKrbETS2m4rUUo982josgQARcxk9dpWxxn8lVCtyj
	Quy2Nsq8Ab/mmlhbKsrXCuKSViAASGihNT0GdyFHydyel8YHfor8ojoQxO2R1SYW
	8IWII5d0ZeP+yjpphUL8fGJ3DT1tpDKzEeUorGaadIZ34VCBFCSdJTT2yPpyteZT
	Nw+SH6tHpwV4iM8JT/V32s176lph0KhVu83GCagtpS5fyslpDXzSJgLJV0YHvv0V
	YLzLKO7F0FL6EjapQiwwK/V4DG0wpsoou/vKbSkK6s8rsrK9IA0HcUq4v4A2EoRS
	D65iZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw4r3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so11480329a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271975; x=1777876775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=;
        b=O7uFETHpVvXmvcdUF1RFguebju2gEXQssIQpbzo8xtNYcEo+YVV799cTjT4zQwOLYG
         z7gZ+ABddJv/y1Wk0EVcfGmSgyPt69t9TYYXqecgbbQp6SY9BNWwcbYb0/G5MICt3XLL
         BzyOlpb3xmEHFQcDFZcWgpIOYsnaDdJ9RkCTfl8jbSj1PsOiICA2HDBlSDSzWh2EwYNy
         VfuA9yCMr/Edbo9cTCxFUOU8SmVCx9yU8wwTj6TOoY8LpXy8UMxPrYEBHsm4MaV+ERXD
         sCeJHR24fnEKpsumjcCidutbPhC32uniZwi9IDO+xJaalaEqlI2SeDr7D2/qfTVfYc/z
         y5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271975; x=1777876775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=;
        b=nFr3FWBkIrNDw0rGM24EG9RZThi5AShIF0EfY0LkEpWT7TbamWM7Cbj3Brld04DL6a
         yYeWxw2/uJSC/82sVpXxbI2ArINgNw+PEc+xGwd+zmplWTWkZnu7CQ5HDpd0RLQUy04Q
         MpxEemEWzESlPpMkgLF0XgmJTKFeSq7Sob7e3b6fUSnm2JftJt9ZtB9hY5r8mewC6zxx
         2QP9A2dA0d3TOky/sVojdPDmZcQSODWGidTohZ5UyOainST2YfcTAKPmmv5g6B7fQ2tS
         /g2LmLYebv3wFJP1u65rCn4EJrmsIVIf+2azTIAyPUXcS0DzztV6fqNv81WNIigAvWcJ
         ZmFA==
X-Forwarded-Encrypted: i=1; AFNElJ8PZI11rx8FJqVgfeyT5ZYcMhwaMNP5Ize9gs2xWPnzQj3z2LUVcxSWvyWkEyyJSfJCmLVfY+55hwPdxBM4@vger.kernel.org
X-Gm-Message-State: AOJu0YyjQNAOoPcAHMq2DY15iAvlSFGhd6D41LhYt4WAKkc/LL+fYbfh
	3VfOVcAEeYpu4E4SaUi2ua6mbZPwzUWlow8VQlmtb6ShTauVVVkcYwcA+m/B1vMFu2kT34P8fXt
	z+BzPRyL/CGIgbogNsIwRjq+/xjqZ66D5R+uLq/EEiCGCc7V0BYC3n223FE68+qmBmTaG
X-Gm-Gg: AeBDievvt3OJEDQGX3ZERvYCmpFsXHlK2ZoM0fpqOSKWsrl9Qi1fTe0g+vKjkN3UkZ5
	EBV2Z2QZ5DmYuI6BWEpIei1IyhQEsmbVPh0rYFEk/Cad1dK9JgfaYsHd3klavAyg9lU8+raRYvF
	xQxCOVqsE68V1WdVTFv0th+nn7g8tthsn03vaZbbmehBWnPIrvIN/qjXRsMIcWBW0XLCh9rUnZX
	8v3L502p1J2PUrMGGj9mbcxRJygqsI56S0DaaeLcgBKR03qSu148gWQI7XFcLb6KBbCgbY6x8kp
	NtP/IiJe4Y9zG+KpylobiQVhDKr3W05vvycrycSmG9wcu9jwSm8/uDZrevqEYhOl/WdAqEAjcg8
	4vSgUpbk3/jrt2wNNmAyjyYBc2Mf+kPK0KxK4HMKi/HBNR2NuP61Gh7Km
X-Received: by 2002:a17:90b:558e:b0:35f:c1cc:fee0 with SMTP id 98e67ed59e1d1-36140290941mr27724113a91.8.1777271975228;
        Sun, 26 Apr 2026 23:39:35 -0700 (PDT)
X-Received: by 2002:a17:90b:558e:b0:35f:c1cc:fee0 with SMTP id 98e67ed59e1d1-36140290941mr27724083a91.8.1777271974659;
        Sun, 26 Apr 2026 23:39:34 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:34 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:08:58 +0530
Subject: [PATCH v2 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gfx-clk-fixes-v2-4-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX+Dd99XNR5uBF
 xob0U0xfr7+0tKkbBJhERanqUMeh4rXqZFmgE9/VbXQHB8u635eTfKHsTg/6AmTiM4uamc4+s0Q
 bWbvCu6WQEuQw7tHcumdAxB8EAZTXx6X6QovTRiZ9XNQE6658SzySC2hJBXXIMiNUyK8vKYAHM7
 tVY9jSq/u3bVWHS1EVqRtukInZfBCT2jvdxcV29Koc48pMzrudrIbGYtw2b1Z5nvAq/39sFZhdy
 3FL8892C1tw32xEt45YyjKCKh5DUBJWfgSRNfJfxO3wKE5xd7DWubIJb3+M4JX6c8MEA0FCaT0/
 xrY4BtLX4xDtVKl6mRyy278cmJmalFuft6nD4xgXvgTho1u2I5eDLCWxHnFIi1EJsNrEoRmwOZd
 kF/uHgWwilD7rOWtFiFgu5eNwqUssUtuZmwHZY48yzda78W4Hk1lpFaIv2AAlMD/N1FYhuzhDbl
 keN6KkWxHDreO3fi9vQ==
X-Proofpoint-ORIG-GUID: KpO_5QOZ1t5HvIiFwNsyzzXZfY0HPhwS
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69ef04a8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TmjMgu7cwLfWQ02JmboA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: KpO_5QOZ1t5HvIiFwNsyzzXZfY0HPhwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270068
X-Rspamd-Queue-Id: B526F46DCD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104613-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The GX GDSC control is handled through a dedicated clock controller,
and the enable/disable sequencing depends on correct rail voting.
The driver votes for the GX/GMxC rails and CX GDSC before toggling
the GX GDSC. Currently, during GMU runtime PM resume, rails remain
enabled due to upstream votes propagated via RPM-enabled devlinks
and explicit pm_runtime votes on GX GDSC.

This is not an expected behaviour of IFPC(Inter Frame Power Collapse)
requirements of GPU as GMU firmware is expected to control these rails,
except during the GPU/GMU recovery via the OS and that is where the GX
GDSC should be voting for the rails (GX/GMxC and CX GDSC) before
toggling the GX GDSC.

Thus, disable runtime PM after successfully registering the clock
controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gxclkctl-kaanapali.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index d7cf6834dd77c2a5320ffb8548cdb515be237bdc..d470ade11b0d11eb40843fe84c809e71646dce27 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -7,6 +7,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
@@ -61,7 +62,15 @@ MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
 
 static int gx_clkctl_kaanapali_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc);
+	int ret;
+
+	ret = qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc);
+	if (ret)
+		return ret;
+
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gx_clkctl_kaanapali_driver = {

-- 
2.34.1


