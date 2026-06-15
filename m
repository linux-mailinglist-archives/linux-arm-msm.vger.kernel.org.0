Return-Path: <linux-arm-msm+bounces-113135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 74QcOrO/L2rtFgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:02:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B84684D77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:02:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Cz6GMLJk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="b/MwgVfU";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113135-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113135-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6F2B3101CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BBC38239F;
	Mon, 15 Jun 2026 08:54:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBCD35F60A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:54:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513698; cv=none; b=aUxhQ3FKBU0x/oHKwE2PIy31q7nh4qM8ssVMhFDygMSK36QwfyGhZQ6UBczCjSYARYoG41HCVHspuRQivppssHtzzOIqpe+7PnpLrpvJ8/NVnNX4OcXGK7wn/L6fqiyCHqgFQC+GRu5CuTF55GwScDRWfRphbM2mkAvqm2iF8WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513698; c=relaxed/simple;
	bh=Aw91lNihbyfUu3dKw2JrhaQnNktb8WfdOPmiLJRkGbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pvyPMRSzBGOE7LkffEJ9QrUYkBBaBAwwBBmEaXGlmfJUgiseZCDrytHvnUyoGDt837fmxqO9Gv4BEToRZZByWudsq2FMmfYukFGo3j2Xi6a2G/chirBr52CdPpnrFl3RAo3Ex3JLl4kIteHwP8vwHL11i6SlfvZHhgXcfQZMxhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cz6GMLJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/MwgVfU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J06x3344591
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JVQMLL3ZrQNcmnMtFodv8W
	UXVXZuSQcBIGABqGVlxZM=; b=Cz6GMLJkQUctzA/zoskxYzRba0257/jJ6hSzV/
	iA4+boaNxHMWO0EiEw8e1/WF4JBgIF1/P5i84/s06XYBku3go8ReA9dS4GvXsNjc
	bSqC7eUX7zoC3QbzDvLTZ1Gcr+CtxXd6BftDcPY7XW+SvSba514pyRoI9C/Vx5OU
	xkqgOC1VlZEUX7xAhEYYh3/zXrcURbUxdgyEmIs9+nQLqGBNCBZ2eV4UNRlKswF/
	/eC3EdGJrbSrYfH9P3BO1Omc++9VUBiY1JhXA19ESkmoxzI1ujHr0Cv+0ZMQBsUp
	tcPNVwv0UCZXRTKrnulGBlvNt0UEcw7mIR60/74dL+Z5oeIw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9fehgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:54:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2c98c1be2so23651845ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513696; x=1782118496; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVQMLL3ZrQNcmnMtFodv8WUXVXZuSQcBIGABqGVlxZM=;
        b=b/MwgVfUWKJjT70a5qjPHBZ9+Qrnlmp98kJTOtWDrQ3Cs59ofldy3iskhAKFIkDlpp
         2GnRiR3Jk5LGgQ6UnOVaJEk+FakAwBsC8xtwCDcQPwAlDRDGB5zoxi0HTvX9geL+zFCV
         Ye6OHAANsoKgYxPaQYGXbX+fmrU49Xiu6nhnd/+6yvt6ZGS0edkAhA7RVTpNP51HOJHT
         9nBM9Uda2x2UHjl4N/kggf1T9Ba2p5RHg6whH/jid4neRV3KqF1U/xIolqGVP/suFoZR
         KbrisynH046tilRGKX06rGPqLZ4o0V1Sfg2AHPBRSvnB+T27TmTHjYeFkvGaILgWigMM
         /WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513696; x=1782118496;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVQMLL3ZrQNcmnMtFodv8WUXVXZuSQcBIGABqGVlxZM=;
        b=FZWnnIO+eBNmLSJMjs+RzsZHzrcss/ULN0Of1rrj/uF9ow/RdCzH3k+U3HLOTPZ8SV
         1+3JtoEmh42uWZRP19/B1MTePc5KpR8TTz8KApuR7UbPjt7dhd8o8Twe20IpgzVpqUwK
         n2/aQNNRtFW8xIHL9tkIgyfCBWaWFO6tzPhj2xm6lwmoC6M2ETMUMSEYwH8GMnYBuegz
         UhzjeBsMTnNOYXxvzysWHkaSGSvbtQLLwgHhTVs0svnhW2HpHMkfLvHVsOpxv3c6b51n
         M26lRLvQsLnxXhpvW4NE13QoXzFt7cHl/QlHbZTguUnhtWgGv7nSGx9MNgOiDdgTDgF6
         EcFA==
X-Gm-Message-State: AOJu0Ywo3Kz8YTepFIj5v7zEVsfRDJg/G6S7DTw0W8WGdEFUrK6fK/Lz
	rFaNI6//xukUD+U/l9qa/2BeCa0vdQ+ETbeZSRyCGgyb4vkN1qAv+xQm/8Mf0NMYQ1epsTIVSHZ
	1HazYArvda+rmLOKstC6Tw9GfE4hboIgj5BKHo7k5NrMiLdQk2eajkcZktlfRZiRB1DkN
X-Gm-Gg: Acq92OHs1uqqXUappA2utiBflTYQTDUaBuS3Gg2Epll9S/Mj4sFPRLiO+13rW+zkF3a
	EW7c/aSZuu6ti6cuBS32CIOg/385lc7QcqEA2yZ5YhJdk6iYWXkm1X+26mCpBgCJE8X716NomHI
	t528kLm9bdGgYDfKRHm2auvjHoP93iAKR+6zQS6YyxjWXe5WgRG5Br3kBNsRzlUvvgoou0zuPgH
	dNw+KWAJxD9oLcIszgXId6MgubyZv6ZRyZtaHK+eYq+DABsg54zaCNXbt1wXK/mvcsS65U6geAT
	0A0qPsrDjuETNWlO7sCCqJGU64P8EB0s6PFXPJ/ly6u2l/qHjTBCdmBp5Tm7+SFuKwRcNNMwDW6
	oaJeVP+awmXIqdLVwwiO4gxoRGw6qZ0w1ZCd2eSIC37D7Tl40LfE=
X-Received: by 2002:a05:6300:6701:b0:3b4:8300:7019 with SMTP id adf61e73a8af0-3b783b8b59dmr16127948637.18.1781513696162;
        Mon, 15 Jun 2026 01:54:56 -0700 (PDT)
X-Received: by 2002:a05:6300:6701:b0:3b4:8300:7019 with SMTP id adf61e73a8af0-3b783b8b59dmr16127900637.18.1781513695647;
        Mon, 15 Jun 2026 01:54:55 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5b207sm8434601a12.5.2026.06.15.01.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:54:55 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:24:36 +0530
Subject: [PATCH] soc: qcom: qcom_stats: Add SoCCP and DCP subsystems stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-add_subsystem_lpm_stats-v1-1-d40fc7c755da@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM29L2oC/x3MTQqAIBBA4avErBNKSqKrRIjpWAP94VgU0d2Tl
 t/ivQcYAyFDmz0Q8CSmbU0o8wzsZNYRBblkkIVUhSprYZzTfAx8c8RFz/uiOZrIQkrrvVONqay
 CVO8BPV3/uevf9wOpVyT6aQAAAA==
X-Change-ID: 20260615-add_subsystem_lpm_stats-22cffd68a4c6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781513693; l=956;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=Aw91lNihbyfUu3dKw2JrhaQnNktb8WfdOPmiLJRkGbo=;
 b=B/+iLZR+rC/5s/pF+/FgOtOXfIJ8McLc7CpBgIAo+PwN1ovNi7U5gQ+A2ULfTp/6cShvoKdN+
 fElYp4XCAqFAttKZftV3qJKtI2EkmmnJFtFD2lO740lzpdXKRfg1csT
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfXz74WXGbv16AJ
 x+kQLpLQzPq31O+9TghXJGIgSnGjNeNqxRNO9XtOtqwwCMDKBl3020idpISjeg2bBGSLKl2hvVF
 EF1Qv9644aySZC5eWqyUIAIuUloJT9sKIxfUVhusnthpyYfloLRzKU3w4LJ53bIb/Yza18rHCf3
 HpS6PWIHeieHgkaQA347fFedDIKRJtYxiDxna/gX+dKegoVULw2s9FOelXqAhGgHj9GKVYNz2Cx
 xt/zLpfOAg9yEJf/Kk3VhSo4SLlLSRygZxuGwtI/8f/iPuwz+SQVY/1JzjHrSCqZ/V0jK4cE1FH
 sLFgkQdsZP3GNbJgobuogakE1/sy8sRIdI+xAXPSbCruoZFSwMPipJiXH/Hx0tynI9g4qR4WGRe
 zJiliXqi1vnI3Fc/z/A0oXvQ8rOQ5EVc1+t/ttBArac6qyRDU3NFV0azStX3Jdlkvz3qFuc5Hbi
 fxdyIAiSFumBQMbfz6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfX4m6XS/ihZBOP
 7/anqD6c69tdwCr9oJJag+zX0TEqXxNhCE/Q5VdaEFosZhD7FSXRBxe4c1NXWg4wThYAaCNki1+
 rJ2wvfZ46bHnDYD92yATQQTpZVXUYys=
X-Proofpoint-GUID: eLCPv-j9q1YNBK_3jMsjAMUiPgulOJyS
X-Proofpoint-ORIG-GUID: eLCPv-j9q1YNBK_3jMsjAMUiPgulOJyS
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2fbde0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=95GhvVOJPIhwer9nb7AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113135-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42B84684D77

Add SMEM items for SoC Control Processor and Display Co-Processor
subsystem stats which are present in Hawi SoC.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 2e380faf9080354fae120e74f0b9bd1f3786d3e5..e7122444f12a3593547923a4fcdb6a144efd019c 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -54,6 +54,8 @@ static const struct subsystem_data subsystems[] = {
 	{ "cdsp1", 607, 12 },
 	{ "gpdsp0", 607, 17 },
 	{ "gpdsp1", 607, 18 },
+	{ "soccp", 607, 19 },
+	{ "dcp", 607, 22 },
 	{ "slpi", 608, 3 },
 	{ "gpu", 609, 0 },
 	{ "display", 610, 0 },

---
base-commit: 95e56f0f293ef797123eb032f78f5b5d56a035a6
change-id: 20260615-add_subsystem_lpm_stats-22cffd68a4c6

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


