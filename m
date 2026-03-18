Return-Path: <linux-arm-msm+bounces-98426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJd/OGKKumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:20:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D2C2BAB3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 265A73164D93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D7739F16E;
	Wed, 18 Mar 2026 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPbHMay0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNpOR5LB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4B439A050
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832136; cv=none; b=XeH3f7mUSKq8OfhouXsxvcCN2lbNE16DknEUvh4k5V1I8nCicgRir/VOEvy6g4oufSK2txEUjVPnllRA3eFANGwXPjqJ/LPzm9HCOAE8lI9aHJn+27VwFFS0qWg6A1gxUm7dz9+pws584laIFK07eurRdLs45HHnXkNdTGf7u9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832136; c=relaxed/simple;
	bh=rwJ0s/faRqzjl1Gjd8c7YLwvyl8TT+CqHt9K4WZTzss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNVzKaxSRdW2d5JeuvIIAQx6/cqcvtGkm93xBU9a8fviF73GhcNxZMJAUk/1jOvyMbH083dasVltIfnFfwVM2o9ThJkrd1hv9OxZnf86GFLH7/wskvHxcB0yTqyPxODYr2olXxuGas9umNEMfdPoL6mNZYXqvOngygHpnzLWW4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPbHMay0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNpOR5LB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I96oxe402541
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=; b=fPbHMay0Jir2ng62
	tdJZNm1JE8iGWPoNZl07UqAih8B9Q/6vNEOzw0JFfqoZJd2lFpVWHTN/1yJ+7iGf
	eiJWMCIvhKWf5wwT6CLNhEnifTHmDJLi2h0xcxkr0+zZ4BVufUPYo+p3pdPMnqYy
	BfomCmvFtt20ENF3AvtgPr49PuT+KgbS3EF5w/R9ahYrULKvaca2m0zcKTqAjFne
	1xCcmRXHafS/wGZADMYPJLSWDBxrW8ukXkB++e/5DtY64gfXnHEpLigyKOZL1Rvt
	6u/adY7Dh37SVAGGpRybB3Nz1thMgVlj712OI3zEIbuYnFs1e2xreHMmQmp9n2gO
	ue4khw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dueta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50923a9bec8so18239421cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832133; x=1774436933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=;
        b=dNpOR5LBxP1+s92naF/PsMK1mg+YPo3Z1JR/Owxpg7vewxdv4TUaZ3zvHwMkmP1gnn
         /663AuQT+NYD9TkxqVLPGEu5U66oTSu0kYyNIKwN8PlcEg6NutzhMN8sU6B4hxG9JAzG
         rfgToc3gsiWMtWEpxpqPmMuzhQ/9qpXyEQaUwXH82bxWRsbMpJKGzH/3fJvVD6rGi0y8
         VjFJROLYOzNaaJdx0rEAqicqSTEu875uxgJ4zlitndjoGXQeYu3YqwneW0Z2s3f5scBn
         D7uw+75r2EuxhJ+CDuI/Hpe9kMq+G7nBJyHP7Y05jwA8/qVTEG0Ja1raqjVbkVCgTU2l
         Sclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832133; x=1774436933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=;
        b=kWeXf0iNZgBcJ8antcXOveAkJ2etQEC3JOjDeuwKQxItccDPxtebotuVM12nBdMP6H
         l9D/ZctUyn2ukbPodxrB0hN5ejv+K0YFonpgjAaMIsKVSY6Rb2+VJLWNw1l4NX+cNGuN
         YDBhQRAI/7+EEnNmPGKxZ4iKwL0GzyKMiIYNgr/USrnG49i1XiKK8UdiI9nrWdnWKBM4
         hNlolKxmYZwNbChYdX0KJLZIX+S5QJNDkX8fu6o2HAnputIHX7S1iKAs/OV73AllQZnW
         sKdndDNSTXZtDm3XP+8l7Hg26tP2R8AlEEzMLiuzpp6PQBImriel53QjCOwQjuk/O6Mb
         lcMA==
X-Gm-Message-State: AOJu0YwcTgdToULYE93ozHrlaKy07XalSkYHhxX7NKfuDBvUnxGYuXlg
	+PLcaVyr3nUsr0g51rt4kHw4YD7CpTULVXT5lmPzbIQQX/MS5iSbMFQyPrr0ByTlrNvueuS1RrS
	VjEd1BPNMC8lmDokexcQtOd07WSdjisA/6fVrVGg+/z0zBFUmKV7U074VNAucLQHqK1xB
X-Gm-Gg: ATEYQzxwOJd1R2ltuIRCSotcTduxc4XFryTM65YmCS0pLQi0mJ4yl8NqFojD3BaoMEJ
	QwFRHk/Q/H+WPR45JdGbDesBA+C1tAOqFxRjdS7DrcuMuQPbiv3ofVWcpPr8MYJZ0I/3rfNsxXR
	N4qxHhn3rQR2Ht0mldnuKC4UM2swPbQSS1VrA7f+rUpgQLYyxSBoYTAXLWcPn15sTz6QOD8WWNP
	Bc0S/HshwLGSPK82xDJoD5dpm+q5jiBLMK/tJfMWssrE1vzwOtsjHBFtFBgtPHfgZzwHOuHZHQ3
	/esWGwJsrns/AnafJDBA99qIDWp03JV+mI165WfgMBeoB4sXr5UlEALYIYforsJk2E7vLpKO8An
	2j3Htf/AVj77dk53E0NhYk1WsohfadfE0rmQpns98p/ia
X-Received: by 2002:a05:622a:1b89:b0:509:882:9e7a with SMTP id d75a77b69052e-50b148bd94fmr31893511cf.70.1773832133451;
        Wed, 18 Mar 2026 04:08:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1b89:b0:509:882:9e7a with SMTP id d75a77b69052e-50b148bd94fmr31893221cf.70.1773832132970;
        Wed, 18 Mar 2026 04:08:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:41 +0100
Subject: [PATCH 2/5] clk: qcom: glymur: Cleanup redundant header includes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-2-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2550;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rwJ0s/faRqzjl1Gjd8c7YLwvyl8TT+CqHt9K4WZTzss=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe7tb3T1F//ePKnz2ZNSrG63JhuojRWfgyba
 or99fgohWGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHuwAKCRDBN2bmhouD
 15UyD/49o6xfpTW6OMtLVORG4Cq9Xen7SuTGalwr3Vpq02B62ezBLlRAtyMq8BKdosAfA92c87P
 ta0VJcgivQwTCE1kxLCsneYl8QGsrKOCBi1TRKXmcPHa2uQBTIl9SNK+LXbMzyxNPsaU+3xUx1l
 SzJeqAWeFgDddRWFfWJIOwwRMCHENdv8YmCIl1BozuvmtnSYarpJqYcOTwoE44FOeZ8kMGs2WrC
 b7FjNgta6idYoOCD/oS0uro98YEdnlq67AGUgyIr/3MQzcYymZqnEzr8fUTMduiiO8vWCSRHsNN
 UO1mgHIoIQOg4tZBSz8sU3Fm8TqNxEEIfTIKwUCJ1vJXX/Am3isOhlub4pTIjAyjuE+UipXl/x1
 923raUkaN5hKPSOKdCkWN9gtYqCvNuiNeClQWI1KIhmZCP8IeqOGTGCnEJbCXF0zHJBe0XPPxie
 IWuOY1eNb2oNQXwQwjH4z16Ej2BxhVX3llfkxFAM9PDbrgVbRfG7jSG3jJINU70rqAMxhctfPsR
 Gey8JKvidAKoTwLbSCm1EppQ4DrAK0YfLaju8sBmT36Gqnj1OxulLUvzUU64efzk+4ZXWvS05NG
 Al2EFC21I9lopynMLUm0xFMC9WS7Pm+CctgxpJfSv4ZJMaMcg0qESs9Ds7NSuB9CHoDGy2iStjF
 518b+5RVX852DmQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfXzR+yYWX6x3hU
 HZqgoncGjflsN65lvGkVmCpS8aMiSBsBUNaL8hInATgXJkbzN19L/Vf8UTsEE/QpcZCqBk/iByI
 d2MOgOB8H9nreA5DKEqoQI2GF96RZqPAWTkyJzNKR195yJDSbZGr+LHm0Z+vH/ElbcJcl7l4hfu
 +AhbI0XdfB61qo4hrigk9TJtfvqnX8bCZ0R7SCHci9QWG/l9YTQZZoJau076nNTfFdyRsMd7xWc
 5hGXCU60KsR74wvM2bDbBWh3y+2nCdfNivBKm+66bRa1TMNRAa0rvppT9+hTAF/TPYeTuGYX+gC
 o5bNVw4gdJ7Ns0wn+FgfL7JlBI/38TyWMzCF0eW1wKQag2o3lqA35rLQTymRMfuyfxRtu4+54i0
 +/vAkLw2O/0gn59fivdfXAqR/z6OifrKUeNtyC8yXizitqhV0dGriBrhWsXihZmTsQujnremv9M
 2WXgJ5FONe1bJbZd1hw==
X-Proofpoint-GUID: zdN22rcMGo3sxG9Au7cYdtD60crEM0Bu
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba87c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=n9SAOWaOJGgEd7NqaGEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: zdN22rcMGo3sxG9Au7cYdtD60crEM0Bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	TAGGED_FROM(0.00)[bounces-98426-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56D2C2BAB3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused header includes - drivers do not use any OF or runtime PM
API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-glymur.c  | 2 --
 drivers/clk/qcom/gcc-glymur.c     | 1 -
 drivers/clk/qcom/gpucc-glymur.c   | 1 -
 drivers/clk/qcom/tcsrcc-glymur.c  | 1 -
 drivers/clk/qcom/videocc-glymur.c | 1 -
 5 files changed, 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index a8c3cbf591d1..fd085cb90667 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 0f3981252a68..1a5d3d182705 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-glymur.c b/drivers/clk/qcom/gpucc-glymur.c
index 2617de0cb1c9..1a1d946347d0 100644
--- a/drivers/clk/qcom/gpucc-glymur.c
+++ b/drivers/clk/qcom/gpucc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 9d9621a61072..9c0edebcdbb1 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index 5dea01f9e20d..bb3aae6b8396 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0


