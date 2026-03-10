Return-Path: <linux-arm-msm+bounces-96484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKD9BrSZr2lbawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:10:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F48B2452D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E05D3304DF24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C4B3CC9FF;
	Tue, 10 Mar 2026 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pkf4ppJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMCxunJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA2F3CB2C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115761; cv=none; b=DIsqnGrZ0ktA4d4cs5ZRjqK0UH07ecwrUOgFGHPtilPZ6lMRFTo5GaFu6VDZCv0+wy3c/2v1qnGGzrGhCND5giC8FKRYC9xhYhqTS21f7U/dOCG3WIIY9yLFXATXcEKdHc/aVSgC45NIkGwB6OIrmUphXS8ZDaJ87SOkTF4UjyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115761; c=relaxed/simple;
	bh=uTr8Ave//isAJhHfIzcKDULVkXYMBNmtFbD/mSWV4fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EG56Heg9ZhiigxSjN488UTRRsczQ/SMelzNROtc7ugrW232UN5CumLzExk9vZuDFijqvImrgMmMMq5CCVPCsTBJ71CpVDP1aGRO91A0JGUVQXamimfYgz1uFHLjXSiG7jJ+2VzVdPSisSmxGWs4ARiKSnjy14H+zGtObSOcDeEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pkf4ppJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMCxunJe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2ESsF1459451
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X4n7Cm+zIgSF9DXpgX4rOaED2hMX3L5ub7hq9cR6BPw=; b=Pkf4ppJ80/hN3+D2
	VXLAXWbkYELxbtichDrCeSbTxPVvJ/rd3y95oG3HT8wHAB2n4/XtWqRWLIpSAjCp
	yDLZDXKVWwEIPgTQjRkVdKBjtnLyEG6sqq2kn1Dzb6/tG5Else7k437mDeUI397n
	4S85VPDYEMakSQz+GpMCHIhUc5mqTeXJe/TUWxTRpVklV6kPCiF9NLCEdnUuYD3g
	vtqvTEVVvJwvEoYY/3NrrREprpHEqedu14EDRQJrn3+rLMkZrgtY53wKwrcz+8ty
	9DOvZs88IAa1QlPOyiGghwKvSfzsJYcBt9goPyXaH/7qw48rfAFGiWflBNX7KGxu
	uN8Mjw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy2jy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:19 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-409698ea4dbso79697480fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115758; x=1773720558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4n7Cm+zIgSF9DXpgX4rOaED2hMX3L5ub7hq9cR6BPw=;
        b=LMCxunJe27DjtQe9lgwT5SNn5uE3pQKCdafc5gorSt8GLoj8b3JpVXKHv+G6fPn+30
         cgv8cZI6g/Pxw47hc9LKXqbn4QJm+JEAiifV8cHbBsboFoV/q7ysXJ4VPolnW31tmyQn
         huQuCsQhnAgQRHPnQdEObMAjFGTCRZNTKaAoxFmBTVqlIyWIik+OUDmMVT0PPFD/zCxY
         2m+j0Qr2FnV+QBAYKUY8hiGY8Tfq4D1Dqzh4m6QX8R43folaRY917N3qBdQt5bVpCUbu
         myK6kzzlx0hoAVblWfQGcZXl2xszeWocLWmpKDWPsYc2ALTX6j0wsj+giW/TE/b5NmKF
         yEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115758; x=1773720558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X4n7Cm+zIgSF9DXpgX4rOaED2hMX3L5ub7hq9cR6BPw=;
        b=mw6rQW36i4SH8rPioVuAxxYRhmfcmtbjrWvqQgpalfq69pK5f0TpdTG4rxSGq9mYSF
         WLiiuECcbxl0Dt0ZGgmkbsfIDL8ieqJyyOz/qMFbNXi+XELlG5pgnrYokCH8BFw3IJSD
         gFwpDHLVHz82ufEeWcbVjEFVthtbHKjXu3XrOOC6No8U7nQbawn326EQUPubUrDnx673
         8/MiSQryYtZ5dAkDkLZrjbCpeJvH6Y9KrDlNgEFzf8rse748lXmENNpxK5x1gfvriXUU
         EHDeovPikM0on4W3NFFaERWMskdkrXZYWPZxr3MDbZZJo7HpJPNJhc0jiLvQxKoxelTy
         OQ+A==
X-Gm-Message-State: AOJu0Ywxex986HB7J588/nl4L8gB2u/hh4nBaUkkNY1kJwzFgsnXPoNj
	Kq82T61ZrO4kLWUeGxNRc/RzsdnmFnHc662xVSZSEZRGcDxOiVJWLj16dTS1FZ2q8dRDRo2KK4h
	WgUJnndaDspFRGU0m2S9PChLl1iwFAueMsYsWjyPBOtBPjcfHUL8ePMaIaLTZRwRoP6JX
X-Gm-Gg: ATEYQzyBHHaBZpWz1b4qc8G/VAuz3czaWx09k09LJhJbE6B+NPVYv25iOt4XVLzJjVB
	1vNlmCPXusj+vw4qAmXZ7RMsVTKoYNs8fkTRiWW2wsiXYobsiHyRfSPPcsLpnP6Np9/uK0u4sFZ
	agtN8v8cdBDTjYBvuHxECadpJw+2OEZdEGKYGIKffsunaC9MU1sjo7cu1ka+X9GYcccWT1gfuV3
	trCKEcI9NQ5p5vWlZ4m5yndeFcgJR0/YBSdngq8An75166nXVeMu1nljIGz/IuTjKHQOSNRapnv
	6fSNqkUWpBrUDD04FOlLYrZooML9e48GpJAkUgmxBVCTTFSpghU6ZX6Sfp7kb0Tj6/5L7fLH5dy
	N4+7+ddnyq272L03ZpYm8S8N8WJeQeQFlVR1tmC0GTwk=
X-Received: by 2002:a05:6870:21cb:b0:409:7ba2:c5fb with SMTP id 586e51a60fabf-41756a7eb7cmr1267533fac.17.1773115758330;
        Mon, 09 Mar 2026 21:09:18 -0700 (PDT)
X-Received: by 2002:a05:6870:21cb:b0:409:7ba2:c5fb with SMTP id 586e51a60fabf-41756a7eb7cmr1267520fac.17.1773115757967;
        Mon, 09 Mar 2026 21:09:17 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e24c39sm1595685fac.20.2026.03.09.21.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:09:17 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 23:09:04 -0500
Subject: [PATCH 3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup
 ownership
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
In-Reply-To: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=uTr8Ave//isAJhHfIzcKDULVkXYMBNmtFbD/mSWV4fI=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpr5lpHTscuk0HN9e86xo4yvw9zmInztm+IWgn5
 ekAl1ly/CqJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaa+ZaRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUBqhAAp5HJ3HE77j7SFIwR6eSX1rrYLjbZ7FQNtLoDyVm
 nGVZFsTgjK4L0YTpnTL88O2lAkJmsgwL/VkxTjI/Ord97RTXGTLYW2f7ekJH4k74RzZTPc4Bkss
 mkE1ma60Te5iPtqFTtP6qVpFJbrOIAswAl/LI7HwGOicQxWleT5CELlu87WnxY4As+wsYmFKaNP
 y0juECUpoNM8hZEne85QO1qbN9Iu3WMuCS0YMPHnWb/8rcyrVWIuXVIbz7T+dflxzxvxb19l32K
 AZFX5R9+f0AoBa6FDxbP7azp+BnxMwxC9eVdPGDPBGSeZJQ1m+qN8oefG4AbPfL91WTRh00X4qG
 A2JCG/cf/28JiZjcKePD7kxJY1Jjh96YhLb6yUIe5An2GHPxVZE7BoBWj+NyriOKn63jE/brdWT
 6PaHN6Czyiwp4rZNG30cXDCHuqFVBLkdi49cmWFdj3VFR+W+ElfhDAx/1ZICEYueHf3IjNPwTg+
 MNL/mzN86YkxAiN6P2KdJ0Vn1BMtRep0mLIcA2b7ITlkGSf0NXDuBZt8I8ximxJQM/SeSTTEAiU
 a/5gz2TSKne7thefnfm9llY3QWWGR9Qms/IBFB3nqhMghx3CWjXOUiqvAdxwpW8IK+SDdE4urLB
 j8FXUYZT4xhooNV8tXEtJf4fLrbCleEwbCPjCt5mqvt4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX0/Kad09ay1U2
 NxrlLoN+5+QQWoEBlLeVsfAUe46WEP7yTaeT+lPOjVygy5dI6SlBihiAm7U5s8P8kS0FgR10KvP
 PqKSe5NpM4UDKgjOJ8tc5cpWGImFM9yuk02+GxpGC1tidfJAtiEUMg6dW+wlUWdttAah5DPrpsc
 qfeXo6ONzKSWvPXGeTN3QMQWVV/yoJ+Q9A1Vi4XY5Dd7tCiFDO+bdoUH0fZRJ+jCuCp6pmZxMSK
 EipESduPHw2APReMhAxLdUGsI6lNeH/7AQNRKFE1rYy9Z7r/1fDsXipMjsta6ZpIUMsllu8GU8d
 c1UtRBqUNn1sVxioD6kfB558KQcK20lfaQNiv/mnBiCvHWQm01X1J5opagad7+8oE2DXZTRcRT2
 mMS2jBDNE+//16ep2WQfWqsmhT8WwhWDsbMGFfcaVS48Bzwp3fQ1T1WOUQwTd+VEXSlKZo9GYd8
 WgJs1RLoQsy1BeQcrUg==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af996f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v7zRpcr-n2crOtZbBgkA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: R9wiYNRenakqf7L_0L1TzxsolTt4dg9o
X-Proofpoint-ORIG-GUID: R9wiYNRenakqf7L_0L1TzxsolTt4dg9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031
X-Rspamd-Queue-Id: 6F48B2452D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96484-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

PDR and SSR callbacks are registred from the controller probe function,
but currently released from the child device's remove function.

In the next commit the controller probe function will be modified such
that the error path will unregister the child device, resulting in a
double free of these resources.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index b34e727bab086c95dc7e760bf1141baac9ccf6a7..09ce3299e15c25b1b9cf6b1559850adf4aa20737 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1685,6 +1685,9 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
+	pdr_handle_release(ctrl->pdr);
+	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
+
 	qcom_slim_ngd_unregister(ctrl);
 }
 
@@ -1693,8 +1696,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
-	pdr_handle_release(ctrl->pdr);
-	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);
 	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);

-- 
2.51.0


