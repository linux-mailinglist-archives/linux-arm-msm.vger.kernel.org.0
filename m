Return-Path: <linux-arm-msm+bounces-101217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKv0GeuPzGnXTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:24:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B233744B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB1A330B1415
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9753803E7;
	Wed,  1 Apr 2026 03:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1oZZ4zc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPvkHnWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD3F37E30B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013774; cv=none; b=VczyRtHyDIIVSfOesO95d8sbbXkauewLt6HKIl+VsXWZXtk4f5P31bGQVknQbcCivPrlpddo+KxmYeeguvb9ns+BlaaaGB0oaPTPPiEekQ1k7bkhG4svNi8EkOhJE1p/lEqnwKi/9FxFXHC1HC/HEmjT/BgmHwn+gLSp+3cz1gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013774; c=relaxed/simple;
	bh=eh1pflsFy4i4xWuCJ3debJEBSGewUbDoQf1aW0vXPiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfSw8dW+ZL6pJPCp00UI0xLV9AGXoTpIefc7GO1RX8tZ7ntlaOTBdZmmU2KnxSQOHfMT239DelthTsAV8xTKIed3dasS+IVbp6Pkofy4AkD067iRebu4TgsLTCK4ivwd14jPwnhK24b0rkyLwJh5gYD1K0vpsqVILoUDv8F7eWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1oZZ4zc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPvkHnWE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VNPwDK639236
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 03:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NeBiXiKM8mAXaG/h32EbZAyo0/+HNOhfKQaw4GQVIz0=; b=R1oZZ4zcgENv2srb
	SjTxEfcJMUYSe4XsmDipeJXQbykaifAQBQJO1parvpFtRtvSS2f2YEDdO32vgPIL
	uqROD+Afz5NIYn46/FNr0uSenVCjYYnL/atzLfJi2xHXTv8stJmkIZlxsDSxkqxX
	W29SbR0C6drJ+U5awUoCt/jeaucRqIkDjhqoDaLm+WF3TdmnHY2SXFil0MhO1eom
	bHv8ZGsJyxT2MCNMra/TujUARAK8phalNPLaAV6UUgK8t7Z9SqSt7HOYol87cXE0
	bHP7iK71Yg7g2mId5KXp1VyaJ2pivIFAxcLM2V47L5oWu7MFRHadAlTpcMJpFgnM
	F9Tpuw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2au1a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:22:52 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d81042e8c1so25464971a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013772; x=1775618572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeBiXiKM8mAXaG/h32EbZAyo0/+HNOhfKQaw4GQVIz0=;
        b=TPvkHnWEEiH/SEARC5B4XRHQtrmTEU/FPDByprl5Zqf1FfWNUNKfT/MQK5Tx4ljkq9
         6y5s//dVJgqfma+pBgG0Hc5M1MUhENB4UfBWESNJOaAE3tnIradjIuJEnB/MVALW2nPw
         rTid0wKKWb96kHCxS9qDCN+n2+gUfOPF8fITKvyJEgCijPHIdliAUBqkDfNhO+lQebOk
         MY32qQ4zScDqTWkMm5mIL73AkGnDh9wh0kV+tSyYcb6e+SEixV1IEppcw8RlyBPLC+HA
         hxatf26XMcqPBJO39m5oNhY+d15Cnv05hPg6fBL3osZJiygEc8lTVxCNXa9zpmMw8izS
         rZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013772; x=1775618572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NeBiXiKM8mAXaG/h32EbZAyo0/+HNOhfKQaw4GQVIz0=;
        b=qOSNl91NFfnLoABumLb0CxbF8k7XdfXs54QFGEzH4p39fui2qbSoXwUQc70yaZPq7n
         ijC9fZ0XGwj7uRJBlY5BRdpaZaioW/l+0L++vUK9+xls8OSzeDBG90JjUxJSMRbIyE5K
         hltAg1JpuGThlajsM2UaJjaj2bGkSz+R7Hee8RbEbatLECxIGG0e1tpNZq2fXS3/6yxD
         aMxhA7Hj8igTt2oDVf+YRfcEFJ7gan4xP21lfO6Q4vm1HRhaqb6Yc9c5mVNcvuUUZr3+
         mpbrNuDOVAs6issLib+b0foVF0muAdZQG68H//Df8zxKdkJ4j3HYb+DNKmLyMO1fGHf0
         xu/A==
X-Gm-Message-State: AOJu0YxITCwfcGB5YRLZ+Wt5z4zmGvFuOMN8pAp5kMvoE6WXCDV5tL5M
	6QWc+Mw5dd5UrnVuhLOK/jyb2Ou+sZcCbyqUq69bJT8ZZSkiK6L0aES87Mr5lKZJ+k1G54eB+zX
	NIFZsmymnqsbc7LbT1NxsL4t1DbocyYNgNfHkKPlkCYmaGiZ2K7yExbeyqoRpm21gfnBl
X-Gm-Gg: ATEYQzwBPrAaTfqniCCp64CQ1r8l8BW/hzUc2uueWq8XI3IRcNGcPdXN1Beyf1MDlAu
	GDUAOktBH1GFrnaysSSJzyzTUGzKbuo+PIVYWRuZ4cCmFyHksylVR1maTu4IbcQ9yJRlqsUV8oi
	gbZ5zLqZUO+oSdRiAgm83GQxRlOsXT1UpZou3nax1lFhPmir1pVxYfjYyL8FHinDA3bkIaP4YHy
	MXzZkGhOnEvGMYFiHqgcmKbJCIbterKQ/1agXVicUFy3+wOTHMo/1oXVqOtTXhMg2sRP3mezJqF
	KpdEO1xWnOTgWpSuSxfQypNB6kH7i1u4KpfF4l0rPkM0Hb/35wgPfDsGYdS2xoWwp+BstvhMmI/
	Z7KHb652KAAUdZYHpjRLGvIYbEf+M0YbAP5lxFBdUQaM=
X-Received: by 2002:a05:6830:81ca:b0:7d7:d1f0:7493 with SMTP id 46e09a7af769-7db9934565amr1409210a34.18.1775013771783;
        Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
X-Received: by 2002:a05:6830:81ca:b0:7d7:d1f0:7493 with SMTP id 46e09a7af769-7db9934565amr1409191a34.18.1775013771358;
        Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 22:22:45 -0500
Subject: [PATCH v2 3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup
 ownership
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-slim-ngd-dev-v2-3-9441e9c8420e@oss.qualcomm.com>
References: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
In-Reply-To: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=eh1pflsFy4i4xWuCJ3debJEBSGewUbDoQf1aW0vXPiQ=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+HEE+6zNK/v2yvG3jpdJVZIL2zvWuS+H9Ov
 Hg0ELibHk2JAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXF0A/+ORqUdaF7mRoNlZKgJfhlryleRnQNlHgahS/+/E8
 Zr1nuupkvYlUttbGyNne6kiNfcU0lXDEZkuFNz+VqvDc9FtVCTn1RpAdvTTHpa78rUEgXOp4vWV
 ZyDt/vyEYZu8J4brtB+Go72Ug2XJHDBuIi+htYSa5bBhLeUgV4VBq9NgFF/sGk+QIGyVkN4FH02
 bbeKxHlMDWCWVY1W77it8/LVjExl8neJ/265ZtHB74mer8ojfXOM1dE1RpH5IM1QndktMseeKSm
 eOtbtTwlV3LVTH9oFj1azptmEyLZaIdPOGn5Wj6qezuoDz1WhgBp6bnAeQB5yxVFcjQbZHx/ILh
 mtO9Dl1bkps5m/bJOpQB5+Jdxmrpzy3bGcPx12pKonYj8K6QUIZFWkaVEyYc+vlKY1loHPdaVvE
 IORld5eusPmPCA8AKYrgdQFZhDJJL5TtFq17yucRt7v5E43HAx8lmmPUvALhBqW6otXGsJ4dOee
 HIV3Muq+gD7Pnau+rTNNqoDU3iQYIjmX965ShihiFeG4GUeiFr8TIf9WYb6oCIAAv2foq4tNv7+
 QEdkPMSAWCAjpffwnoIt+76tRvG4X5RvCFLG91V4qQiqv1l2d0xH93d3nBgqERxIBrZcoIMEK5X
 ZNVJqnwY372Jdu99LcI5kCRku0qqNvDJa2kaH6KBmikw=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfX+67p7uqaY65L
 ylrjYp0WKjCtwHI/KvJOhduhY2zUkBjmkFjows9CZzW5CPJ9AaD4Azr2qzmoY+FzJO8OVsXEQAI
 Pce/YLJSBMsoibDylJxEQBLl1KGAEdt2Rl2+72pqRYAnT44FkFWpSp2hgjGpWzpkyi78Xqhg5tC
 UKEG/OJn2AGu79a6Mq2/KzJBVRdZH8fdo/P88ix0tMKrJ2us3/4KyXkkeAVKjTwRaH/JF/ZFfEi
 9DeCP9lwX+9D7kKYJk7ktmJPAzxiSoIhBqKA+ZxXK4BIQqmsML+mJ+QH9Hg94t5pJ27zfjx86PK
 3D9BPb4FWqsEEVIhbgEyrjjp8tnOFxfFXAHV6vfviZ4E6qKK9joZdUiR4m/P10Esd//KEuK+jTb
 U8isjnQ5cgcf7dzHfrqZCrhBQ/OT9oDa4inlWiDZMBnC8Kh4yiP9GYREyFaC83blq5earnuMrfy
 ZAhcxTKBfzDO9ko/waA==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69cc8f8c cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gyDl647GgXGSOFt2m_oA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: QsukahnjpGDGT97dwBkRjTiYYAxUv45j
X-Proofpoint-ORIG-GUID: QsukahnjpGDGT97dwBkRjTiYYAxUv45j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101217-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04B233744B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PDR and SSR callbacks are registred from the controller probe function,
but currently released from the child device's remove function.

The remove() function should only be unwinding what was done in the
same device's probe() function.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index f26fe54b2ffb4bbfe6da6b717257313536abf60f..fd533d5bceb6d7352e8ac6fdce321d3acc285f1e 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1683,6 +1683,9 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
+	pdr_handle_release(ctrl->pdr);
+	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
+
 	qcom_slim_ngd_unregister(ctrl);
 }
 
@@ -1691,8 +1694,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
-	pdr_handle_release(ctrl->pdr);
-	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);
 	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);

-- 
2.51.0


