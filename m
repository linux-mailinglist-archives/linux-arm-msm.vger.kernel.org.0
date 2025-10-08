Return-Path: <linux-arm-msm+bounces-76427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E0BC57E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 16:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A67DD3C34A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 14:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B1D2EC571;
	Wed,  8 Oct 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpR31PHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB6B2EC567
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935490; cv=none; b=NPYLl7zkNBAfBYhVDTMZ6BmoBxhB+BWg5nqhNqwW5OF+JHWMnk5dsfoqRoa7bl5xd7Icd1ZOLiEXencEAZDWrIJOxtVJEGvuvApjlKDQN6hssHhA1MWYg6QCVav7yYU/FhAcN8X0yM+sPmyBADR8ERBR8QBgm8MzXEGzVn7RwlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935490; c=relaxed/simple;
	bh=5V4FY1lGCPXLwOcBdDx/5qV1DoJAfuAXFe8DMG4W87o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAnK3MjkBPjbZ5eqhXvuKQDSKa7di7/dqSm//Js6vqJZZEsvSmAVeiqFwj7q/xrtOEhwVNbfSR/vtKPn6yvv0uQUsWYRpK1DrXrwlujknYVYDrslNGU2yWSSse0DbTuwSQEnLDNRmKdy5yjTTxMq68mlab87sznUeMzP8AYGEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpR31PHb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890OqG015715
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 14:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gg2XGw954hw/rNzVk11kaod4ZGuB5Izji2/
	QJiTgN50=; b=fpR31PHbNQFaoP0jHLmGl4/ob/VfzSwr+TexkvmZW/2LsaesVKc
	hVcEvVpFm+Wqi/dKj/jCiyAeF6mhOGyOhw5Wh63RjkWS0Bd5Ma9xERWrQ8GvM2O8
	Ba5sqwCOyLiampeTHEPlVJ/NL7cWjq72Ywab3Mv2MrysAv0420r+FVyd7n82S1Fk
	TBTQ8nlXsgHDOw8kJjoejrAau1NJPEAsxwpsG4BUhceMYZuPk9XWQkfmCEprelx4
	59PPG2TkYgaz5+1ZkrjNLgg5Hi7AO13oQHPmuz8xrnAR8bD5M6oTA54ZAszkO/1Q
	8tXKbnEBcFEaWpGg4Y/1Kdab/CzWNcnOYBg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk72ybn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 14:58:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-782063922ceso7005280b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 07:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935487; x=1760540287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gg2XGw954hw/rNzVk11kaod4ZGuB5Izji2/QJiTgN50=;
        b=ma+XOOXAJSN0SUwwIq5/Fdwg3e0+MEzFb2Awf8Tto7u6eg/5M2l6nEVart2+vCrRK6
         xOXLVRzEkdVK9qA1ZUEOTral+ZfdCFKoj7sgcEQEsRBU8ebhqQa8F1tzxc6b6f3ls4Bs
         94vroCrkYjtcncCiIlpfTGrHqtCLDhvywkS35s+K+idqzr1FQg9SaxKMFs0Yhk3xY62Q
         z2+IKw/Byqk+w6vwEWw2N7puNh80cPJ7FxfjxBhY1upcNuhQiyTSNEOeslngAD/3CF9c
         xhYL1c/aFKwcST2Ep/97jyUu0gtYDfQ9bTmIMzEJKRJ0uC/RbBw0D+L43jacwVA+2MWq
         2/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVGNXnEFlZUq7WqyUzMGZ+m6x3GQXPUoHlJMikvASssJP6PowHTzbSgmdLPLW6vlIIZ17htYASTF8p6+EFq@vger.kernel.org
X-Gm-Message-State: AOJu0YycowJhXaqRh/LaaOp/UccBbS+6wxK8oKfJly0BlOlgH18S6mSh
	piVPZT7WzPidDz8DMCo8SR5JJltDiPB3TR47rcks9jBgKT+71AyEjuDwlzB8H9DJXpZp6OgS0/n
	MdkFklP/9ygWE8ejaQPMpJpYUm8J3I96Qe8OAw+fSRDPrfsMRMjHyYXQJsUBEVBuV4ce4
X-Gm-Gg: ASbGncs5MdKMC8GI0/6cK7JfT4pXU2qiMB1qFZ1Yb7Ccw3TcuXFDzkFYFvWx4wmraLd
	WKDw3u96ahx/3J3EmPDA2VNePflvPSdPnNWFwRIdnlUsRiMdSkpQnT+hwSgkE4ES9bbWjSxYDcF
	R+fWNK/QBKVex5jCn4oVfVzRHvZfLMAFE+/QixOt/4ynK/zP1o3wOBZrSuZD3GTS2RC+HKGvFpY
	rxQrqp+A+bLct1HXsT+cUhfFsJPoZuFThGxKiGVAf9DItIt7kXD0CCYHIuNsw5WKQD+8LhLLTRI
	AfHdzdGfmw8st9y9NVGBhr34rWh4D6ocdVi+nm76ycL7l/LPn55sHhjQKd3Nrh0TnlSZeX/+j+w
	=
X-Received: by 2002:a05:6a00:3911:b0:77f:3a99:77b1 with SMTP id d2e1a72fcca58-79385703346mr3825669b3a.9.1759935486524;
        Wed, 08 Oct 2025 07:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW5q5j+m+RGehMEdTTXNFPYB2WX/itVnHJwVii8g/LY0p0ro5CAl7jexOkZcXjHDnVYlqG9A==
X-Received: by 2002:a05:6a00:3911:b0:77f:3a99:77b1 with SMTP id d2e1a72fcca58-79385703346mr3825645b3a.9.1759935486009;
        Wed, 08 Oct 2025 07:58:06 -0700 (PDT)
Received: from debian.Hyatt.com ([192.210.17.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053b84sm19068892b3a.53.2025.10.08.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:58:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] ASoC: codecs: wcd938x-sdw: remove redundant runtime pm calls
Date: Wed,  8 Oct 2025 15:58:01 +0100
Message-ID: <20251008145801.3479-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX83kx1CwkxyjG
 vKd9U4lK41E8MyAK8Ukte4TW5DKe6KQ5mvu49J3Ijqi9gLU5R5ix/mbvXpab3EHW0z/gAYFQ63u
 sfbRzfHgwXjl/PKsUQIQdjQ6qd54j+TQl7bOqChJ8s+A27fP/HCbQvxAGoIvefCe8/MurGo0MYJ
 Zep2tx6Y0UioYV58cgXctv4FBlOu6+N+NTrnEPKV5dhDW4gPlyxzFw+v3IBQ4vDSfTeYNdoxZL5
 JIMq1pcMzKIQ9CD84/ThFZpbCpn/Cok/KUrc1oJJ/nLc3pOPkyq4m35RMeHF8V2zw2XaQtnzI0N
 ZOOkuv6YDopvyUvTgXquz/3b4+K1HDktYsLAWIi/wjf6MQU+rGr9qbvWOxOH4Iz8YPAyZW4jCRv
 N4/riAEwgC9oDHp7+INC0Jl4m3pkLA==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e67c00 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=3CSVYe8HblTQFsWiJzwA3g==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=J5h_BI_um8seuJrpCkEA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: bDTvO1UVqJ2W3JmhheHcOPp5FuLTXOHo
X-Proofpoint-ORIG-GUID: bDTvO1UVqJ2W3JmhheHcOPp5FuLTXOHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

Component bind callbacks already does runtime pm calls, soundwire codec
also tries to do the exactly same thing resulting in Unbalanced
pm_runtime_enable and disable calls.

Remove the redundant calls from wcd938x-sdw driver.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: ebaf88c0546d ("ASoC: codecs: wcd-common: move component ops to common")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd938x-sdw.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index add907cb2706..8c8f39d04972 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1207,24 +1207,14 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 		regcache_cache_only(wcd->regmap, true);
 	}
 
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-
 	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
-		goto err_disable_rpm;
-
-	return 0;
+		return ret;
 
-err_disable_rpm:
-	pm_runtime_disable(dev);
+	/* Set suspended until aggregate device is bind */
 	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 
-	return ret;
+	return 0;
 }
 
 static int wcd9380_remove(struct sdw_slave *pdev)
@@ -1233,10 +1223,6 @@ static int wcd9380_remove(struct sdw_slave *pdev)
 
 	component_del(dev, &wcd_sdw_component_ops);
 
-	pm_runtime_disable(dev);
-	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
-
 	return 0;
 }
 
-- 
2.51.0


