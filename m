Return-Path: <linux-arm-msm+bounces-96858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNIGMxv4sGkRpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:05:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC825C33F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB4A1312B775
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D313242C8;
	Wed, 11 Mar 2026 05:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0uHjVP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VpZANF50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA7431F9BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205513; cv=none; b=pbVI6XtTlHrasWRJLy8cMEkadkdy5vrxVy/N4/01nUzFaU8ZyBt3rt3Ouf0XErkGCLPLkYFHXkBqWnOZzMG0/qms//Wt+cHPmfcpoDZm/Aa4Qo8J3QB9sDpn2GKAdgUUAffp3ZtJyA2fdCnuxsd32J24zN3kKtZ1UokzebHlKtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205513; c=relaxed/simple;
	bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KIq8+uDK8ksfvXYmQuw2S+875r/xn1n7cv/mzhsqBCpKmtbuSc7TABFS5/tJY7GNVD0qBDvznwc7ONX+gbdvnYt4cBy7Z6wdmfHm3pfM/P1oxFW7Qv4ET6ameYmmBMi1dhNlnW8j+8dgkP/1Z4+4Y5ZEyaQK+JcQecjSIX/o3aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0uHjVP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpZANF50; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4t1qx3296079
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=; b=S0uHjVP/AnAiRjiN
	JFlaibyCbMlTt7nrBx9YSmHSfyDLpKORcUxRoWa4/ugbl4qTjNfNeaeZhVAxT83y
	kdF78mBH06pFGvQ1FOLoz41r55abDUYOcc7/Jm/aUHsj1hLLoWGAr1cUY7so4URA
	mCALXe+ttum3Gz2HKbi/SuzRL/Nb5fsu7GatO3pARhpfmRTRMR/S1rjgl5bTxNrY
	e3j43VLzNvwNTp9fqlS+24K0g8KqbU/Ci2zbWR89fmiHpEQ6UWXFbXRlWmis0fHg
	nOF22paV4Tvus0SCksgCsJrgbx1gLvZ5cb+vvmqG+5vgXR80ZUCazyoCT1Qs/92t
	AetBcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mv1w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:05:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso11068394185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773205510; x=1773810310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=VpZANF50mbEJPbJl9fClkQk+OWqpGEiNRe+XBv4XTeiEaGsgH7BxkQ5gH6EPx4GRho
         AsZwpJMZ8fykIDABERdJSgPNkq09NNOQlTaznPKrftcqo1gbyeEXsKNCCo9ze+P8PIyH
         ihgb9xrj4uujQj6JWHmeB5hlMBOVlUR1EW7qGl09XHhdsHC4OEdNIeOMcTm56EgKzQLv
         CJ6IJnuWKGf2Vc1WA9qaTpThgJNfJFFCRiyY0y/3myyjsCjfbK/Q8CnsVzCf1n4H0/gW
         EsLM5vQjhCM4z28AFYT8RS+b2ODaJg5DkjxidJqm9w5hESuGFPwpo7babLoGOqdQRxX+
         5CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205510; x=1773810310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=BMvH+DXEcKZrIPM7AiDv0jJU+1PADeDyN+YAtNUlfV6+q5FBfBsrmQDQq1o+WfQtyp
         UZXqqGUIYT7EDF46PkkQoRO6rQUzNEZU0ZJilawnX8y1OqQvt11oXPhI1VMpDc9Y7bSm
         Vwwr/zg7n7vYvbZX7IjZtMqYOiZfjlmK5iZvtqcTDA3sF+yvMFQFGCkGj0v3TSeskcib
         wx6lBg4PR/TJlFnnHuUrpQYL1ghS4HwftLC/c4p00dFA85EmWsFoAPcDOdMNSUe1UuCr
         Y0SjVHLzr/vhcm5cIslkdFoUQpqEO29xElA9nFsbBjfP7sMcV//SCrR7Ixvr0AMqCf72
         e+LA==
X-Forwarded-Encrypted: i=1; AJvYcCU+USELMn4M4MNeUu0TyBJ3i5k1rNWtmvY+JPqowjfWjUkolNp2w8fWI3fy3uFiESFeMkK4rkbcZj510f5h@vger.kernel.org
X-Gm-Message-State: AOJu0Yww5eQPrnuwWkTv+k2PL4Mcr/zqLhdaJuKHFkA1dyzmWIGr0yKO
	eORoEUNL07U7SM1vKJLiLymUX+p/yffLqP6Uwmr6d2bk7kPF0TiF+/YbIkppAeqgJZwylpvo4tY
	Ha9ZNhEUEuuBayY7fmpWeAhs/S+Op0V4DNQLFeBTA7Vdg82Hpv6bq3+lX+3MQ8PtRVU4D
X-Gm-Gg: ATEYQzzO53zdT2OL/Wp5rUkMIxP28J8D9oySu65H9L1y43IYx+gxNuYFmG6GH+BtASt
	piP+9eMcCoYc94AL6/h2dyLnwyqDUiKpG97kyPXQett8UJRYh3cdJrO2Mklkj88LbNTEg+l8byd
	Pvb9zBnuazNV8ZiDl6ZulVDG4YYZ9FQelLiQxf1FtwwJhocfSgQ/E5ymKmNdz0hjrtKd9d3xRWC
	Dk4jEFAjXHRWnaf9me6kq9tAyCxqBCGDykQoTqLOPfuIT8vdVL9AYgRuuT+b/S61aW2ZiLcJKk6
	O1bu5AKA4W8Z/+WwUxLyPkcB/7AAkhE/tgMHPU8ZRNs02VlB4Svd6y1/BMpreEM+9a+tuFSButq
	9qoHS1LugmLxtNn6ejzBbrvpTAKtIFuv+pWk8qHRDDA5jAuA1XZYEOwRtETVwTnUFOwD6lJqI4N
	xTxCCHXFm1H4QdiK1HnK197m2ZZj9D6uz+DgE=
X-Received: by 2002:a05:620a:4485:b0:8cd:98c1:762e with SMTP id af79cd13be357-8cda1a56dd6mr173831485a.63.1773205510001;
        Tue, 10 Mar 2026 22:05:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4485:b0:8cd:98c1:762e with SMTP id af79cd13be357-8cda1a56dd6mr173829485a.63.1773205509578;
        Tue, 10 Mar 2026 22:05:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635805bsm199240e87.65.2026.03.10.22.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:05:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 07:05:02 +0200
Subject: [PATCH v3 1/8] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-iris-platform-data-v3-1-f02258c4d4ed@oss.qualcomm.com>
References: <20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com>
In-Reply-To: <20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6161;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsPgAFqDolu63ZYTEYBbJ+rNqr1zfdMJDfIxS7
 Ef/YsmriI6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabD4AAAKCRCLPIo+Aiko
 1fc3B/9j2jNlSMK7bUjKfGmV/cmenjJYbbq3NwiS8mcYCJaYmRQFaBqUWrYGMnFvVhTMkkeBNo9
 MAdwYSw9NS9JP2rNeBBARQt0nkrltk6/Clr4IjUT+xFErKPJTC2c+1guv6cianZXFflw0FZV89q
 4LiBX39bKfBZrBYzm0VtLhzlMgdGJxfvNwtifUNkSE8ui6rT5MWfrzutM4vPyLaXcg9dq1TsbIb
 EoSLNwMJu47YXSLQGrV39BQ930LTiE6rlqIIQq2XvtrZMKFBLwNpSC/tJkU6gzCu5eq/G9bhOYr
 ljQ4pr0XurxEd8POM5MOBfNwnnO194i7K++YiO14uy+44PgQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b0f806 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hYMYe-gnznq9qBW6PAEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9lCwtsEpKqdHhEkyuEvcWiFIDr4UCi2L
X-Proofpoint-GUID: 9lCwtsEpKqdHhEkyuEvcWiFIDr4UCi2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MCBTYWx0ZWRfX4O3j1KT17Igs
 s8oI1ULdIT3iFlsqY0LDWsXHSvGpzBy2pfV2gWy+NRh5pJv0aTZd5LCfz46oKwMEoY2vG/y99MH
 i1UYOI20ZB7Lc8+PRbZU7FlnzJdJVmfSMaYngRSV2rn5WtNIiKupGGrJwe53f7qdkjrKvkLincf
 nMJuaHM651Zf6GPYG0tC3WS26FTpQckbzWHzIsUjoSZ+S4Pocbg2M9Sa5QfzkV5vUzNhXwhdiEV
 +tqykw768bxEUbw3W4X1KIckO1h4s2mD1lznXxwH1wy8ORk/8rqr+hXlQdrjdvBqy0aMmuYfB7L
 yXZZUdZGwp/5eq9EyKTFcf3vFZ3k0yCQAZ8mH6NU7hrqnVGdyDQLZjHEJnIDspvgwaPd1xGQvBU
 W0Bd4TCK37mCsyKJ3ULWE/O56yMtyOfcGUCFZUbr3//1FogWtvoFM6lvUNB/2H8wRLfmGaklI+Q
 dh9xYJ5YnDw7ok4QY8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110040
X-Rspamd-Queue-Id: 34FC825C33F
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96858-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c        | 11 ++++++-----
 drivers/media/platform/qcom/iris/iris_platform_common.h |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  4 ----
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..bc6c5c3e00c3 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -12,11 +12,12 @@
 #include "iris_core.h"
 #include "iris_firmware.h"
 
+#define IRIS_PAS_ID				9
+
 #define MAX_FIRMWARE_NAME_SIZE	128
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
-	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
@@ -53,7 +54,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	}
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
 
 	memunmap(mem_virt);
 err_release_fw:
@@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
@@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+			qcom_scm_pas_shutdown(IRIS_PAS_ID);
 			return ret;
 		}
 	}
@@ -103,7 +104,7 @@ int iris_fw_load(struct iris_core *core)
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f42e1798747c..e4eefc646c7f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -12,7 +12,6 @@
 struct iris_core;
 struct iris_inst;
 
-#define IRIS_PAS_ID				9
 #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
 #define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
 
@@ -226,7 +225,6 @@ struct iris_platform_data {
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
 	const char *fwname;
-	u32 pas_id;
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index aa71f7f53ee3..07ed572e895b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -360,7 +360,6 @@ const struct iris_platform_data sm8250_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
@@ -413,7 +412,6 @@ const struct iris_platform_data sc7280_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index a526b50a1cd3..1f23ddb972f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -934,7 +934,6 @@ const struct iris_platform_data sm8550_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1038,7 +1037,6 @@ const struct iris_platform_data sm8650_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1133,7 +1131,6 @@ const struct iris_platform_data sm8750_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1232,7 +1229,6 @@ const struct iris_platform_data qcs8300_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,

-- 
2.47.3


