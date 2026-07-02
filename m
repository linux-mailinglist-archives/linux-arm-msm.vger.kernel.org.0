Return-Path: <linux-arm-msm+bounces-116107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BT9eMTWwRmqdbgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:38:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 456986FC2C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:38:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VIcpgaCG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XTFjLmOw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116107-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116107-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F31CC3110F59
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6777A36C0DC;
	Thu,  2 Jul 2026 18:34:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E4D368293
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:34:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017252; cv=none; b=lE+gyHy7Fr1EPNZpsoN+oQCvO+VpaxyEaMCrO/ql1NXHT3VagnmAeEUnmBoXtQ2lL4XUjptLm9SHfyx0DXx6U4pnd5y4j0P734IaDpIDopoN9uERvmd1pi5Y+5qvm3NsXgYMFAJNOZIdwjtpQDchIXmDbmyHqow+L5vSS0JkYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017252; c=relaxed/simple;
	bh=8Cq6VbOXS7/Rq/Lq5G3WcmwMpks7f+OcQeIRzlpRjxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UjCsURfzzNYVT+eU657+oMZvV/dOA/97hVFyBZSghDyu1LaZZVeVC1chC/AxxYAjPRWuwh8DFV0Eg7rFbJ+XOLgyhoIXPemcASI+5P+dutv/XHIlHEXZVtbd2ldf9bZtA+rSjGc7p7PT79hsw0c9oQV3Ixu01qybjPtP1Sw3hVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIcpgaCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTFjLmOw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3OD9666012
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rpwjBgnb5ruoqiefAdfBFuhL6uaS/x0MR01hksH1x0s=; b=VIcpgaCGBPIMv3Zt
	qw8dOjXgCULrkSQWOiIfp8x+xCtHifsfe9kMbq3fxHvqJzg5GKNkwLtBA3gPsw6F
	3hp4/Uxgg6D2J/YytqxM2/c8BCPmHGRlefd8+geOyfL9PKHBcUyXpQHpHkbFIebv
	WyXipnMWGEyC5X3ZoDbvwkRp5NQi9WAqjtqinH+n6PcjPtoVzr84q9P8FZ3V5aSb
	WRiRmyb7vJWvkDsaFBYRhqErTaGkZbvJsCYdtLi+FZfNeeDjjTkiTdVE9gnY1hIg
	2pHks7HOLnypmAOR9UjteraXZWoce/PkMPvrtapHAvAUXL3QkehVPYJPt9FRW12D
	ZNwqGQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc2qu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:34:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so3025474a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017249; x=1783622049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpwjBgnb5ruoqiefAdfBFuhL6uaS/x0MR01hksH1x0s=;
        b=XTFjLmOw6+ZGTGErniO3XLe7BW4zRyrHEHgp4yuYNovaILRPkgLzj9LogaqRJV6THk
         lW2RtNF/etbV095BrmJfntVY2R/MgQXUmiItJsp66ECdcIoOKrzu9hzXVRTh/ZRgLUtn
         9wxT5FmKqXDzvSUbxI8i1zHoMYfm8Mxobgy+tUeh7c1vFa8k8NDjd3Jo5HBi8o4b5jDk
         4i/+7xJShXJ7HjtnCrkEgrVDnkwCUW7rJ3rfcz4WcOh8zBelUR62B2s2BO1IuJIekQD4
         FQQKKA9vMoGJpFcszh3OD0o6+gHLOQsrLmctY8s9fK1NA4viGpOmopfmd1l/Di2dx73p
         urfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017249; x=1783622049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rpwjBgnb5ruoqiefAdfBFuhL6uaS/x0MR01hksH1x0s=;
        b=o39qAHzbGU0ulOT8mygvQ167iC0aeetjVH9LuNasKooA0bvWjkvnCuTGUZfi9nV1Lb
         j55b0roALDJdwjJzURVY39cWB1rgiVAmIlSrO/VVQjpXRzuzmBtAftGGZRX/1Oby/lzl
         eJYD5+IUtsOMVuQHkLRRKYorJIfOqKcpVNZNTM/ftDPFfGXbDD/MwHTAvXJc5sCu5k4+
         wFgkVD2jT2mmhK+J3YcmaQglVA77PY8Q0A5y3kUK+ZI4aP7BwACDBppJh4RTM6HHapeL
         U9Sl7tj5tuG3IB/47xcWTEEk3jnQtZGhacFoAfBiHDQmwMOUmBjWIVRWjvGcTvtwa21r
         UT8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+YkpEUozabEIb8WgpiJiTCHZvH030eC9F/N/VwVhfqJa16Fwn5LHHOyhIus4VRgV6S6/mxdD/lwjLFfeWc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LLNYU5tiQg+nHaZG6EKd6jS76NURtf900sS8H5rz0mdaNX4s
	Byb/E9DIsktGbX8d6xIhPSKOLfrgjQnbeToFW/3e4mhMLFACuK0voxbX4jGGOpB9qzM1cBRgEAB
	slwB0ia1PX/crzjEww5/FS2ctGxCcomAVtN+Gm7+/1ZEgsRcCc9U1gaLU+NRU1m0kzGep
X-Gm-Gg: AfdE7cmOylRIfKfQhbZsdzWkooA8u4f9XpzHXmZc0oPSTsLAXYnk0Z6AssycMw3NSGK
	Ts26etTRhz0hwALI+0rfRB6mJwbhmmucF/PqAldHzaw10e4FL+EIQ6RmZ4jAF9Dt4+H1quXaZJ6
	R7KZ6sI+my11HGADMAMuNhhS6/mwppncQrdoUbqD3xTIsrMN+6ouE1H34PIJJBhWhzkPca5DCTU
	5afIr/vJzmkTHz5BmknGQgO8zPdSF6ZmLbZNUqPFTA9BIPZBYTl205xcRE3T8Sccay0cJ32VKbs
	y8e0DYydBAMdLa/ayWxmU6Fjd4Kq+sfQZU4XMD8A5UMIAYiLpaX0YjA/3pOAquLgeSv93fgrCtf
	Sv4bvXnMGapyLjGRh+ds9JYIkwYTVrQQXuId1ePHTgw==
X-Received: by 2002:a05:6a21:7016:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3bfed472b94mr7711381637.38.1783017248938;
        Thu, 02 Jul 2026 11:34:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:7016:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3bfed472b94mr7711350637.38.1783017248481;
        Thu, 02 Jul 2026 11:34:08 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:08 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:35 +0530
Subject: [PATCH v5 13/19] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: DzVlKMJvQsFKVWiZHF5arGrvjCkVgjuw
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a46af21 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kfuAGOiE8AnRzSM1rcsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXw+Y/uzS8apw2
 xoi9cPhwQMiKcHQ2ahDea1F3OKEVa2awHpTKr8KBZOgBrPJvQKEpQo58tDDh6yvZMshnd2OBJaT
 p1aLo6qXx5maVlSW7Sp8Vugz36Rvj6Xb3wDeK0Doih77Uyrmvfo+qkuHYskiFiOA9I9D2G48duU
 6JxR6/TCmnOiY9vD59Z0xduRE69Odae5lt4BneOSzme0woHyeiZwKqDE2f4Pb4gY+eLih3Cyvah
 6viPaleY3yoHGDYfMp869oRRjvzcLm+scNdkfcMdkdAsOwsLhM4vn9EeFwCLE49mzFx0IMuLHlA
 BX+p9v7BXxOKszfJa8w6lwmL7awPqWEzsFW+N1vwVKBoevW+zwpddQl7CnL2fWMNdQScZDcK4nu
 UyZYEI3xsKHTkOcSxRvstqSgN4HceGVjc1rJY28hr800FrDzykpq+Hyt+AJEswHNuQHc+oJtihc
 ifYD3ZlXYcPq8YpZwUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXzwq8SZyu8wmj
 ONRM6lFTH5hqmJdq5Brx2NIJmr/yUoZcd07jbEa0EpzVOQsiXLyX9Rdz6nAm54gAjdwKspc7tFd
 w8o3K3J1sINCD4fzFtETAMDSJCzICbY=
X-Proofpoint-GUID: DzVlKMJvQsFKVWiZHF5arGrvjCkVgjuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116107-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 456986FC2C1

Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 50 ++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index f14b4620090efea139316ad833e034536caa5199..b19e8910931d85ceda079c2745eba37e18112955 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -2,12 +2,12 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2024, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
@@ -19,6 +19,7 @@
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
 #include "clk-regmap-phy-mux.h"
+#include "common.h"
 #include "gdsc.h"
 #include "reset.h"
 
@@ -55,6 +56,7 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
 
 static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
 	.vco_table = huayra_vco,
 	.num_vco = ARRAY_SIZE(huayra_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA_2290],
@@ -346,6 +348,14 @@ static struct gdsc *gpu_cc_qcm2290_gdscs[] = {
 	[GPU_GX_GDSC] = &gpu_gx_gdsc,
 };
 
+static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1060, /* GPU_CC_GX_CXO_CLK */
+};
+
 static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -354,6 +364,12 @@ static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data gpu_cc_qcm2290_driver_data = {
+	.alpha_plls = gpu_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcm2290_plls),
+	.clk_cbcrs = gpu_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_qcm2290_critical_cbcrs),
+};
 
 static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.config = &gpu_cc_qcm2290_regmap_config,
@@ -363,6 +379,8 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_qcm2290_resets),
 	.gdscs = gpu_cc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
@@ -373,35 +391,7 @@ MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gpu_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	clk_huayra_2290_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-
-	regmap_update_bits(regmap, 0x1060, BIT(0), BIT(0)); /* GPU_CC_GX_CXO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register display clock controller\n");
-		goto out_pm_runtime_put;
-	}
-
-out_pm_runtime_put:
-	pm_runtime_put_sync(&pdev->dev);
-
-	return 0;
+	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 
 static struct platform_driver gpu_cc_qcm2290_driver = {

-- 
2.34.1


