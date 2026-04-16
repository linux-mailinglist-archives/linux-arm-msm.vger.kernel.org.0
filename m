Return-Path: <linux-arm-msm+bounces-103345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FjzM7GZ4GlMkAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:11:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 905EF40B5CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAD3030D8605
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135953806A4;
	Thu, 16 Apr 2026 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExFs+Tsq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gV4SG2oK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AFE38E5D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327053; cv=none; b=hC9/4hXc5GGVVeQYqmtWMw5LWSetapmjSJq2HtZZ2X8APXa9kyJyQ3ykzrbbWX7GRvzBk49dLWpajAMyuPaS3wSWuF/p7a6W/IPAYI/zdekNlXdc0wNc+mJqo7tLXFOzetjErxGBDEllKiAx2WzKPonUAYA+qTw+oZtZ935l6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327053; c=relaxed/simple;
	bh=iOBwFcKIvGQfGatKncFnezTrgtTDmjTNCFZPI/HqB0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4O+czD5P1IARITWst66cBR0Ze/Biuqgi0FYZ2KKdjy2V/Bc39XQXF0ndD6xMm2gFXGCP6qdT9TY0j8JZkeK/EKqDYQHhdau3+gx1m0Pv9g1i8eIjaNJVwWZOHKAq84/LWH8bl/339lfae/+0yjl3orMoKNvLXDhpf+jAGzj27w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExFs+Tsq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gV4SG2oK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G4TDbC1553088
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmdRSOrfWdzGH2dtdqH2Qk8BoA+tbtyxvzoU2E+gQTc=; b=ExFs+TsqAqZECKAu
	MnlxwWapKXxFRR/Os7lP4P6WjwPf+utmDsXczipeiz+ELKLZrUZp5pj73+6zVg5l
	b/KXkimEtkxOZry5jhcPZHb+e7CnbBCFpa5g5iR8K1iNShTyhkZF8vz8cMR5TmGg
	3KOnR/yUGeEoyYBjczDx9Zpj5dQ6Im0kl5UCyjWm7MxMk198UIcx6lK0l/7MG9n2
	f+ruWrNIJYX4JlBUeU+0ooK86ndVhqMT6RQ3bknsATQ3O5HuS6hLxxtQOE9HcHco
	IbYbwDZSbdKzDzPNHy3Emet5qqJU+onnBdA4r00DYstrJItGR1T2s1NW8rWSUpOP
	HlH+4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn8pcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:10:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso138501041cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776327049; x=1776931849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmdRSOrfWdzGH2dtdqH2Qk8BoA+tbtyxvzoU2E+gQTc=;
        b=gV4SG2oKaVZPQenoGYBxSppgScbDpY0oeMCPgXK+XIUJvjTdyi0clS4Lp5jO4xX+Uw
         jQKubexFT3XMobAa1B7UeYxYl/JEk/0k6/gJ3wqVwzWKF0X82JAUaKDuQX/1bueQx9OB
         q3KJgNT0yQ3Xve51NgtTNkqIkoTPAnLKKKbEVCMZpV8bXoH2nLYZ/zso9H7iM9Acmurz
         Bmap1YT6EKT6upe1akffvDOL31S43fGfW/B1h9jxAx0psG+ifmZj85OHdxI3vHtfXX4a
         myot+98o6zli4vuvnPVRm5i6Hk90FvUlsrQGPouJxvJS7ud983pCIWhPxX8KXojcyQB/
         ngGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327049; x=1776931849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qmdRSOrfWdzGH2dtdqH2Qk8BoA+tbtyxvzoU2E+gQTc=;
        b=QtjlGPl3EAqeMw1KNpvNvlkNGxbZF/SX/RxiDd7sciShn5OqRvUvB2hI00+Mk1QZDt
         sft5pOJLQYmwfPhCj+Fwavcm56ugjkSEa1sniGhoP6UhhPXcyhnRUeW/vcXzuOgoebL+
         16ya1s75xgInn5E07SeIJ4VDGzYzO/dxTdYOaevzN8yCNTYuwCm4iTZYDrln442+NfUl
         G38D6SnqH4CODzs5cbpHgEtT6J8tTYgC/g1itQmJWlLgKVqI3SbLF59SJl6YXNF4AIPp
         ws5SFqvEAaIHRSpEoTrGaWOld1HWIot3m1Tnl8xNugvqpnfnIdqvYc4Hh4VXCqmPOvpI
         absg==
X-Gm-Message-State: AOJu0YxJZVWAwe0xPAiucu4vEV7NQnGAy9S1kloMUNiEY7fgBeS8g10Y
	TCuq8C+MSAPPMhSfh+DZImgHvn2TQ4RMtIGDa9Ady0Mz69JNqT+xargW/a3mzCKjTEDyw4pvp2/
	78yYoJDmx6BMiPWIJNM1tGfzZ+B/e956yUJMoDs7ty9dTFcLagQhnaxcEoCFZIW7C/v72OAPpiP
	rJ
X-Gm-Gg: AeBDies9tB3mg/dqr0Wt5bClOEWKU80t8lP7gn2ym8y5A6B1k+x49BFTR4f/JiMS2Gz
	yfP7+q6w4oLJmatITyPEXoyxuIluP5pFHn5F/E8xGNsMpTUmy1riWacCspsbnGnxMfNxLuHjWFc
	CLO0PQCIAFJFoBDNe+o082z3wOVQdjOWj1ZI1pwBW511wfUzgcKAqJXOykOPeRX1dTWDKGeQvxE
	1xE5SjwN05R1P1pwYW3hZEoeJFHPG/5Z0MTjWsGOt338ywF68a4NXrgIEw/pCXFbeUYkJOp9AdO
	M06uWssmx6rvmmw1RK3U0/P29QNEPfYTlwKtSTY/ITY4dyvfDxoG+5lv2doOZIoI5JlRcj24ZvS
	x5FYeqFQp76NLZgTiFLQsLaxsojMDDWZZ6a2m85U1Quq/
X-Received: by 2002:a05:622a:90d:b0:50d:a3a3:e62d with SMTP id d75a77b69052e-50dd5ad9791mr359345561cf.15.1776327049463;
        Thu, 16 Apr 2026 01:10:49 -0700 (PDT)
X-Received: by 2002:a05:622a:90d:b0:50d:a3a3:e62d with SMTP id d75a77b69052e-50dd5ad9791mr359345301cf.15.1776327049070;
        Thu, 16 Apr 2026 01:10:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35bf1esm12059571f8f.16.2026.04.16.01.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:10:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:10:32 +0200
Subject: [PATCH 4/4] arm64: defconfig: Switch Qualcomm SDM845, SM8150 and
 SM8250 drivers to modules
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-clk-qcom-defaults-v1-4-579e75c4cfe5@oss.qualcomm.com>
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
In-Reply-To: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iOBwFcKIvGQfGatKncFnezTrgtTDmjTNCFZPI/HqB0Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp4Jl+GhsWbJFWKls+wWS1ST7dtotqxded4QJY1
 zCerjtPS+OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeCZfgAKCRDBN2bmhouD
 14J5D/479m+/aEARiVp1h0fNlHlCxuW//9GdOvResmwpfT1EVfFqvBN3pc+eoQLeLcq+7ITS97f
 gf406oeTJPEobJGvGSZbc50VQMAokMsGuCpjIr3mhYyM9CS9nyRsGJOIyMCJUSttFk5C/CEJ076
 dsrh3xq04v572c+iuclUGzLXxVEH4l3I1jh9jEPNg4I+6RvQ6cqam9GJvsn/N1U99vtliNrDyMy
 v42YPPZxIiCMr+9J1PJsYnq/A2KLqbFrqGeav0sZzUJ+eYfsn7jBkYU8rD6VE5zicP/P85vSsp0
 CdJGemMApGb5UNvTW6M/8DY4ldV1i5MciW7aXWNZyUTTYAnC1LSozR8z7dEn3jDmgTOrwF/yniI
 4ajpzd9s7fif60H6bwD2k8kD0mwzrvgIKOsgSm+bs6jpK8XL/ey7Z7MF72br9O9J3G3TX4+2VDO
 XiOte2l/kAVKkxg5wjlK8uy03RzUJfuOSng5/4EDILOO+3pDnya1WfZBIyHcn5rFXvZK12prlgR
 S1rFwNlJg8iUY5C5FGl1gTUzP5hhqqWGmZPGL4rIM/is/6KJr2I2+528mKByj99aWF+oziN5/rg
 ZUE6NfpV9cSn/9trOG0mGIbYmUHQiyj0tOHGgnu1enMRPVBjnJJFCFWrD7P8wINMmnd7jwYUlrA
 EOBi3M6V/iPkoNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: byp8017xTOqWkE4Kq_RozAWAf17gZabR
X-Proofpoint-GUID: byp8017xTOqWkE4Kq_RozAWAf17gZabR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NiBTYWx0ZWRfX4uePWoQ5iPw0
 vEq1gxFQ9JD1x99zkjJeMJzRNL8NXKwy7GXMr+SkUzZWPRGK4Rj1rWMg4WRlD8KukT/vzagMNHn
 /AKI9gjD9TJBnSEY+m4uD0KXlgEaecI6cvfbxaDDWEaOfeHqkW2LHz9OY18Gqqhiut9fHrpn94v
 zyPXkn2n77oybmaoyrL3GuGPuInP4FhubnYuCMpmA9vI5nZvDMDub4KXXQ/i7CJLClyV2CK6EnL
 pOt4AFAQUowrAV9jClfGXQTL8mouhJZPp07b50QNT+3AqO2A9U7E5Pi3dm9VEIJNRbJOW2hDgDP
 OPDGju2q+IvvDiA0mDJAE8EDHEgyMzsQaIxXbUQMfOatRl0hqnXJVyplaLTIVqLH1nNFAzBlgOV
 BSCWoM3qo0G7wcBecqCqfMwZjRbki4QbN6B96RP3kQiDFHVEQvt162aZth69KmWpepy0r0FBbVq
 5KuRYWTlg8pproArE3A==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e0998b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VVS3ecdOb3HaevTN2i4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103345-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 905EF40B5CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dispaly, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
SM8250 SoCs should not be built-in because they are not necessary for
platform bringup to shell or even mounting rootfs.  Drop their explicit
selection in defconfig, relying on defaults which makes them modules.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on previous patches.
---
 arch/arm64/configs/defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e2e5784ad329..296fc0cf7d3e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1481,14 +1481,7 @@ CONFIG_MSM_GCC_8996=y
 CONFIG_MSM_MMCC_8996=m
 CONFIG_MSM_GCC_8998=y
 CONFIG_MSM_MMCC_8998=m
-CONFIG_SDM_GPUCC_845=y
-CONFIG_SDM_VIDEOCC_845=y
-CONFIG_SDM_DISPCC_845=y
 CONFIG_SDX_GCC_75=y
-CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_GPUCC_8150=y
-CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m

-- 
2.51.0


