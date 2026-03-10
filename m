Return-Path: <linux-arm-msm+bounces-96487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGBcLrGZr2lbawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:10:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A172452CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC6F6301D4B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2F53CD8A2;
	Tue, 10 Mar 2026 04:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyn8NzuA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5ZH9F7O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CC83CF69E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115765; cv=none; b=drBt9TfWu/h/otZV8974geW40WDm7lKOehcwk8U2Df92kmTpzAvZ4bam2z1pG8rWZitohsIFfgdfgDhw7bFKssuxuDs9GABS8+UGyDbDlTLUmA1IxKwM1uHCd0rZHdhlBrZ2FHPDt5aYsQsKm74Jwt4XUwUCClm5TX0BDEG/GEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115765; c=relaxed/simple;
	bh=68+BXhTLgDWKkLMk+I9StqSF8+TK96OU30KM3ca9y2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKOIstQaq0bxvNNdl6D4SWbHJOSy02HqSOPtw6ocosfrQGbgv4Twiiuaw9ucKTXzwFFJIuWFpXgORYLOF8fBFV+gYmdoJtxHybXOELTjYMlYyY+iJhXHL6XBEJX0gPwyznTafa87ppnTsFMqy2k8HUghH7up6BM8Gl54f15y/oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyn8NzuA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5ZH9F7O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2ENaV2020564
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MurHg1m2uAKvWtn7RAZi7VVz1qreouQXsuQDvN2q5aU=; b=gyn8NzuAZ+sPSgiU
	TPBkhBqbCh25Oo2DOiVBJSK/AbkylsNaMg/O6ZouCK+r8+bXvL4VVaKYkzVgLpS8
	Ujybxw1Ir9AYQgqRopXafM3ffOTBceaee6V3ipXT2uyfI0JUymbt8eEjvJYldRGj
	ksjT6Y8RTfaK0+dhdjTD0ZPQzs3c1tIlseCU6h8tpjJBNAT92C6n5oDpqSgE1axH
	/g6TK/iLkL7/sL8kUCXmnr/+eozgS+XxNvDtnEJ/6xCEQ63YOSpsN6SioPHXqzuC
	o4z/Nz76UmKZoFRKBkjC0tSE/SOwITekpBleQcv8EGzFwYq1kGQHBI7qSPnYHdTQ
	J4/WxQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbtg2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:21 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-40450320b4fso35434057fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115761; x=1773720561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MurHg1m2uAKvWtn7RAZi7VVz1qreouQXsuQDvN2q5aU=;
        b=P5ZH9F7OEZYWMgjh6BTzRX6Rn/WZ3jEEFNG4DfEe17OyJnyDWrFUlFU5K1+MphD+kN
         DUUfzODU/hWDERWGFtp6NyzGzMbhv6KYYmZ6oQvoKctXlZmE+cDgIlud4XsnO0A/2WEw
         2mBWqHDahxpIW0nL18e62mc/LB1wKDKYY6kc5qA6pswBJXfVeqrPsY2ogUI+DwWD6izB
         MOIUBW9fBOblLmW37x2aaUvY4lDMGK2sOXrXdrpOorT0qwaDXAJvC1vDEA+WYnmAgVIq
         NIkAPf62yt5EKEdIYXuaV0pbm8jdltwjYukORpvqh7IPsu1RyUXu/Zc2FUwH82VRrang
         IRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115761; x=1773720561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MurHg1m2uAKvWtn7RAZi7VVz1qreouQXsuQDvN2q5aU=;
        b=n2bsUsA/09xxMQBgKb9JqUTw8YiZywsxgLcVGgwhsF68YUXyQbWhIJBi/0ka+nZ+Q6
         +UpVTpjwq0aW9qliJnfr7irehR+7XYyXqUKhmazJjjebAca6FUVrjxbz3yuYqDo6x22j
         NOoWDNcZQr4H39Fd9nj4zmOF8d5pRZ0DEXW76baVdZnKuI3O7XcqVzBgn8fiYO6aTke0
         /CWth6CUvhnqLEG+EgKALDyiczkVBexmZarj0exno23gY4+5PYo4VdIAcE+9PPxLcMoX
         xUwVfpxbH5biL8XWKiFHP1zieBWNlxVL1xirahysTCFh+XfqQX6ap7BKJ9gt6zRDOeKS
         FNbA==
X-Gm-Message-State: AOJu0YyphL+rLF0rHeSoYbECUgTAapE7o9Bp0X+ehr24oPHzu0NX8vx/
	0AAHrR6EvJp811b2VmECmYM8Vx5AwrzpwsyRHMKAynsFsQsxhucwfyb/Al6BMk9QDQ21FyM4Kti
	jyfdiIfXRp8Bd9TrAZjd1pskJbLYkB+AzE9iKX3PDJ7a4byLUyMye12zNgqpHYOhZQkPe
X-Gm-Gg: ATEYQzznaAtwdmQCQE2AFjQirZk0Mhk/AqO2EjE7OXWH6YQnHdO2zhLDUjRO+FLXoVX
	PMLBFypm48Pfe+wBuonSFZE4pmJ/OyFK/ZS8nrSdThl0bJLBhUT+aIG1OcKH3nBNy86lFpP1Gn2
	Pz3NzEM6fUh1TWvWv84dVTE8k4N7MHOdwnwm/0jwPI3UbIdqx+Sw1SGUWY5TNwe3xSLjDjVyR2m
	w5ilFDzv2qU8u9fM+aLf1di+j44zJAo5TBiq6AnRVygmSxjYcHnNZQ3/c6eD52Goh/bdQ4OaDbf
	5NoWBp5/WnwUIBP6QB26EEw3TXvf2HL/JKTVA6ST19z7qx2j+Mj24dB/edxyLSHTe8+8jAuxXNc
	hcOtrfrckmPm5V7/LB+ekOQxX0tZgYPy+o1zIkpiU/ho=
X-Received: by 2002:a05:6870:720e:b0:417:5e91:626b with SMTP id 586e51a60fabf-4175e9163bbmr633014fac.53.1773115761046;
        Mon, 09 Mar 2026 21:09:21 -0700 (PDT)
X-Received: by 2002:a05:6870:720e:b0:417:5e91:626b with SMTP id 586e51a60fabf-4175e9163bbmr633001fac.53.1773115760624;
        Mon, 09 Mar 2026 21:09:20 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e24c39sm1595685fac.20.2026.03.09.21.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:09:20 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 23:09:07 -0500
Subject: [PATCH 6/7] slimbus: qcom-ngd-ctrl: Balance pm_runtime enablement
 for NGD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-slim-ngd-dev-v1-6-5843e3ed62a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=68+BXhTLgDWKkLMk+I9StqSF8+TK96OU30KM3ca9y2Y=;
 b=kA0DAAoBCx85Pw2ZrcUByyZiAGmvmWnIPoY9VkcBwUCZzjReB8mBuemmmsw56vlCoijsujPCg
 YkCSQQAAQoAMxYhBAXeA8xfNepPCWbVJQsfOT8Nma3FBQJpr5lpFRxhbmRlcnNzb25Aa2VybmVs
 Lm9yZwAKCRALHzk/DZmtxcWCEACUHy50tUY/zaO6ecq/5e6ic9BsYZ6G0EFiBQsaEKAHjTlCJ16
 nW6BDtleYHMfmzOs4fLXZjZ9f7TbT944RR+xgmiktbF8VkSFbweFpr4TwFE3DXCMIbLhk9Nrbtd
 /8eTBUrHTAcHXXo/K8Qou6TYJ0ILQcB5ER7IyqV/ov/TUNphiZaJhYAhB2KBPYGDqmCgND7+H0I
 yUPAwsKG8s4Rb00yt5EDOdmyIVeCn5m1yqdfm0MzzDfX4chzXwA+IQ+N+mfTWOrQar9CVcOrj9e
 MWiI4jb0Zc3ZlSaFFMqDUrL+e9hHkNDoeR58LVMDnvfA+LTCqmzoea6p9AESzZ7gKauhRY3/WO2
 OEDhERwQ73bV/PHl9ThAiQcZju+BJ6NLx/R8Og6qL5fn8rdyyZyUh55DAWdNzWuWHwDC+lEsczW
 lhwywtZ4r7fte0zScxqxzPz4SrH5DJWb/yoPMy7TpC0SDUR7a3Ph3KU7F6xjJzBVUC+pZ+Ve67o
 t2Tt8uE7IYncbLEN78v1wrIAbcWCLuwmvs+fkXQU4kX0Mfh3FfdQ96enw5IEWJLdOSH8osKtIbl
 GzaK21rE/09cN5acnSx2zLlF9ajKBLQXn39A+AbcI0ofKi0JP9M8Br21mUhBrbSogDVfB6mCwtb
 zFdc9gS8Nk37nXVaOfIaLA2HZpoAuW8ZcMQ==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af9971 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v7zRpcr-n2crOtZbBgkA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfXwHDLvF2v+9oS
 9SBmNoNFI6Q2niF5hRFaw5AznGWKF6d0QVY2HOrcGWASVicmxU4zfhtP115oMsxivwlxIs0DuP/
 5A1GKzO6Afoyo8vLZElUZm7GIJjCl8ix3iqF2yRXi3+c4+5hFZlNashwhI0dNp2jk3TKiThAZCy
 KWjqTy/jt3qGPpwmsV233gNCzwrIX1Zf/PYqeolYQUuW7DuS6IlwFpiPD1wUP10wOghd+JQqj9x
 XLJW/aT2qLh+A1j5A8bdrZ+/dVILGOpKCsKSAXqx/Js6mrdajWSo3B+dzOH3muNWESdPrJumQiX
 +VPi5iHrK4zAjrEfT1wWypMaFUMIeGBObO9VEA5spYpYK5+w9IXzzcR7vu7ReyTqX0WfAH6XDqh
 6G+RW0ckBg+mY0oxD/3Y1cS3uVI8WAvpM4yfA+s3zhYApHHnaYkiseQHpdgYDCoagpbA1Hzcc9L
 oKHgVvP3AgI1hllWr7A==
X-Proofpoint-GUID: dtu1MTv_5fECajvP5XUQUIq6aXWYyx8l
X-Proofpoint-ORIG-GUID: dtu1MTv_5fECajvP5XUQUIq6aXWYyx8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031
X-Rspamd-Queue-Id: C9A172452CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96487-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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

The pm_runtime_enable() and pm_runtime_use_autosuspend() calls are
supposed to be balanced on exit, add these calls.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index d932f7fd6170773890f561e3af444ac2c5730338..54a4c6ee1e71fe55794f09575979826d9aa5be9f 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1584,8 +1584,11 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_noresume(dev);
 	ret = qcom_slim_ngd_qmi_svc_event_init(ctrl);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev, "QMI service registration failed:%d", ret);
+		pm_runtime_dont_use_autosuspend(dev);
+		pm_runtime_disable(dev);
+	}
 
 	return ret;
 }
@@ -1699,6 +1702,7 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);

-- 
2.51.0


