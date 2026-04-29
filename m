Return-Path: <linux-arm-msm+bounces-105150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FsDKQ3I8Wn+kQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:57:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCAD49170C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02FF23019637
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B3A3B8BD9;
	Wed, 29 Apr 2026 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqCm0W0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsMV/DIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316023BB9E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453015; cv=none; b=RAi8PzK5q72Z6mFe+nVWa+U9l4vsQnJgFLb0RkfN755u4AjjFNZo7i8gYp9RY/xIzVrSP3Qt8vapny6ssKGVX9fuIQ8s8IfZ7jUp9VRERkh3o4RvbApO0UQBvZH1U093v1czVU5mUoav1Tz/1p8QodnE5ATCW+L+mJwE8pb2VKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453015; c=relaxed/simple;
	bh=CK38rKkDq+RLbFZ8AxFtRY8upy3ep/OyRQxWo0tHp9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3G+2ltyWobR3QySH33jptNnFrvEhKWFKfhYZ6F1k195qHMQbEgCkzjUEsCBg3zdhmkFvZv8rE0C4PMDdghw1Ohi17/D3U6+3OWPO84p+TbyziF81K255gFj6LfOREnkyRVZnNhVMyaEw9ShV7N99b/O2T2t3GOUAD7IxmjQ6wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqCm0W0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsMV/DIR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8po9q901766
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQVHkLqjIbMiur37tdNBpO1Zpy3OgeKlp5miPa3rQFM=; b=DqCm0W0kwskraCe0
	wO5N3pJBv6B/92ovLDzA+LNbFpXXriiqoLVZIAuX/rJkncVPs1WZ3nllU1bCNvz+
	1kF+Vsu65eMUSaXeQXGEYYu5PTvQLwxTsoI6l8btGvY6+1/o902zMcbPRPWlOpm3
	xuxfkQa88RP4XLyIpv/2IzB+3ZSN3RY94FyjPbLu5KJUo4TlPaWq9w5a/KKP8YvZ
	GG2Ys7q5ZmW0yozGUHGx+jhw8aN9guQIRw21gLuOPzqC4PDiSCkhNYT3vSAZu2jn
	KcbtgE9xZKdxEgfiv6PgLOqkkXK4rFl3ccErBDQCrg8/OOH7AeFsPPhvOrdGyod8
	KfPm9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9gvmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d58bed44aso271071061cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453013; x=1778057813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQVHkLqjIbMiur37tdNBpO1Zpy3OgeKlp5miPa3rQFM=;
        b=QsMV/DIRg9/5WQTNCvwA6uZawP0LAXkD0NV0whTUb6z/OCVGoZFrhHS6y+//nwJvTI
         w4qRbEQRL6wQOAYfcNRv8kYz8r6gaNzcntkZ7CWjSSxIC40TCpSMgEoMoRz5D+Bbtw+h
         qiXpJWhnxCC/O/xu69fmwS694iXqBo0LnaSfphRAuqB42feqHRb0KdNzfsvP/V2BdvC8
         Oj+4K/IKbu9dU+p1cPUN1sGCul3Q2UD3f6GQs6iF6e9M5NY/oSR4F5Q2FJh/0ZV2MCNg
         VzdsEvrOSZKpf4aM6GW3VhoQnDkVm4AGkgEEUafKf1pECHZRNxPvQ5Wx77wvjbmIRv5U
         Am9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453013; x=1778057813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQVHkLqjIbMiur37tdNBpO1Zpy3OgeKlp5miPa3rQFM=;
        b=E+jBcXP5SIKqdEcjwS9/UfpL7gUVhUWzL1+7OkXgF+sITb2xh03TFWRfmLal7K09fG
         EEluFDufl21BRUVJUrtmp11cjJv/VgoVB3eON/ppkbcXVkC2Ixegj+IPK2rA+u2hT+3X
         c3BfChTaOp3/QuLZpURcpl6j3XaAvkQTnq+jBR7PlUDx6rqig3q7fnznieXua7UcFnAa
         qzgPEF69Smojlq9IgLH9jgi3vpXFcWdSrx+uvlXCcY8gMMxXfBeW5Lc0HhPEJF4zch2I
         Knq5PIhuZ+BkskZEU1uYqNUJTKYlz5TCMHPFRx2+mmtzrYcC6YL5M0UdLWs5Oz4xkA0v
         Oh4w==
X-Gm-Message-State: AOJu0Yws9r+m9x+TLfpi1urQd0whiHOpectiGTUQ+Yd286WPlp4NS7p1
	kb0TblR8CwVzI1QDgWDHZ2ZRsr0XGVZbTNRBrXLuS+YlMM/GHGKoe5uaLjHSUD9Qb20Y2hwclCI
	LFqd2VdtMQwattkBhcw6+qC1aPLxf4tg3LMBMybBgGXIFS2SSS7pChJ4S9rGsN8eOXej8
X-Gm-Gg: AeBDieusS1WvaZx/tzkJEuhr3WcqkPzJCnabvQRnBNXbyALlN0QID5P/8evDoWNFmH8
	ddyqtTt9jktImNXIZWNs1dDeOp5wD8jIIYcJAHwVkUYvJCOPy0PHL8jEBEfeIf/NEZnJHtxlb3j
	JQpjuYLeiJ/KExMsmGkD3EoMTlKUPZ6Q6UIJ2XmqW5Wqsf0Oq2GcAe7tgTeVM/9KEyrYwSWVw5i
	L/5gQlpXtncNmiw7UkHoiWYwq9XFxX1l8PEuXKbmxSDkSt7i2tmWgBEf7tK+fhGTwCmbOryU19e
	dGelOUMeMLS98aRCciMZxldCmXT58YjyDS7iAnwXutDiAG3S3OvT/k/2bTh5drI9gPe5+JyDEMq
	lAv346e2ZLaow7PkGumiJw3kJ6hnXivDlZBdIyiTTNdYPkc/SWdYt4Fc=
X-Received: by 2002:a05:622a:5c86:b0:50e:6165:11e5 with SMTP id d75a77b69052e-5100e0fbbe7mr88087821cf.2.1777453012691;
        Wed, 29 Apr 2026 01:56:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5c86:b0:50e:6165:11e5 with SMTP id d75a77b69052e-5100e0fbbe7mr88087741cf.2.1777453012295;
        Wed, 29 Apr 2026 01:56:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ed6sm4950689f8f.16.2026.04.29.01.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:56:35 +0200
Subject: [PATCH 4/4] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with
 defaults
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-soc-kconfig-v1-4-69ba540b3fe9@oss.qualcomm.com>
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CK38rKkDq+RLbFZ8AxFtRY8upy3ep/OyRQxWo0tHp9M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8cfLpwLrADeABkQUYzrPeDG/v+md2BW9vCT3/
 mBcNj8Vk9GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafHHywAKCRDBN2bmhouD
 15JeD/wN0+T9uIxwU5//x1nBjE86nPqdtn527hOFGO7EpTkZLXALmDGpcFLb7+bsaWRRLZp37nV
 jbA650wDzgKnfFEqX3LsgUYrCNOB+AeuMuINLkhn3ps2OC1Iylk4dVRDBri9O142qEDxaxjYNzh
 NWzAAFpuGtcMVB408bGMxf7iHxghGlnxsoH9g7NndgeFrASSfSmLKVB31gPjM8pWyte/wfTdGih
 H4X5tQszGxtYADbZ5HMCU2DA2o7cv4hrdNPMi6FIIvx2NUYpCMHkUjkBZAvc0vXlz55ejFADe79
 thpod87l6uolVxeEhLyxkFALw0yKzFVLMD1TkiknPkXpYvbLEBzTLOncgHO7APV845KlpZODFba
 5Wf6KSM0T/hgaU6IsUOUAY1fDucYbQm2zsBDmkc9olWgGJML9YigxSrr2NwEA7i9ytF0aXfSEPD
 XKTKBlUiHpUJvvKrMyen3gcMRvLFmriwkWMxzndXJj3Cy/BHalXBE1vmeWyOBksNK7uCC+/azkX
 4pWW3JEFtP+NM/+Wscje/EGuOw0E/4Up5/BSzELfMRoqBWfpXCMuoIC5gZCbe1k27VG9GT4KacG
 FUELvscNMf3jSqWa15RP3KLDrZZoHr3saYJES/kjBzQPy+6KJNnR9+VokEAtfAOiIR/n5KP1L+j
 TTgBlXF5eT+lwMw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 41iVV75sdCr4WCMigTXETQEnfAp0TYSg
X-Proofpoint-ORIG-GUID: 41iVV75sdCr4WCMigTXETQEnfAp0TYSg
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f1c7d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gBdK3KNpVRY46ggoUIgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfXy2nStTmL50Wx
 NXfgNAEylYNG9yoZmX+9SQ/ogz5RmRYdwSU27Ew4cmZGOm6gbH9Le7DDTrfUk4bcnZ5weSe0UuR
 984254yUTGPiJW682aYNXi+0Jv+cpCtur5BOxMwFMmcsGHyII/+Y8EvYPNYKgm/xf8Oa0kVuSgp
 5CaF6NUJduMYNniCTYwWh4rNS/UU3cSu1edK9KVMuRmPkz6QAVd/ZkB4f9Iy1zQp0AmVsrawf33
 4CKDSHeE1ds8Br3wZOC/Wr898WP0MgRtvtRVlfO9GAQM1f3vua7Uom/bF/x8RCebSYwludFECtb
 0/GZCU77uEnM2Q0rzLg5Cohfc2PEyyoOc1ut1YnS2Igkq8h0vtHW16PMf0ozPNsFlUPiGenNPV+
 vPcnGNcVudVDPUDd/39SiJ3+4RQ7t/8H8J6oFVO3I5far+qnLNCgW3P3Bzu+Xts6OWtETEAIuNO
 +nDWQHgj5mylZjf979g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290089
X-Rspamd-Queue-Id: 9BCAD49170C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-105150-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Several Qualcomm SoC drivers have defaults, so their defconfig entries
are redundant.  Keep the few options which choose specific choice
different than the default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 11 -----------
 arch/arm/configs/qcom_defconfig     |  7 -------
 arch/arm64/configs/defconfig        | 18 ------------------
 3 files changed, 36 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bcc9aabc1202..09abe406d2a5 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1152,17 +1152,6 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
-CONFIG_QCOM_GSBI=y
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 29a1dea500f0..b738e7f8a5e9 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -249,16 +249,9 @@ CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=y
 CONFIG_RPMSG_QCOM_SMD=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_RMTFS_MEM=y
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=y
 CONFIG_QCOM_STATS=y
 CONFIG_QCOM_WCNSS_CTRL=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..116d0b17e404 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1656,25 +1656,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
-CONFIG_QCOM_AOSS_QMP=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GENI_SE=y
-CONFIG_QCOM_LLCC=m
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_PMIC_GLINK=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_SPM=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
-CONFIG_QCOM_APR=m
-CONFIG_QCOM_ICC_BWMON=m
-CONFIG_QCOM_PBS=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y

-- 
2.51.0


