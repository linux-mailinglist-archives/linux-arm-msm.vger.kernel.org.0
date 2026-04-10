Return-Path: <linux-arm-msm+bounces-102745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG5KKmZH2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:54:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFA03DBACD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1890B31327C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEC83E9F6F;
	Fri, 10 Apr 2026 18:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAzAcFBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZKY50Rw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379143E9F7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846648; cv=none; b=hOerr/vyicizhp/Ajt7w/Aak5NiWRsKo/ynHMP6ifNlYwrHDXOk4Dv26AuA42PtiqzvzU8a5j6DvPclgC/eSoTX/pkAJ2XxttUsvn4A1ChS8iGHyTsv1gfWwNpLhofRkdwTtwRBgXIjFY4LTFvpCmAggSbZDYgzArgJ2NM2S3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846648; c=relaxed/simple;
	bh=kD1ezleZxBGbUkoU1r7F48hvn+QgREfOMICAR44lYSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2kb7C9IypI6GjHs7Pt2vSVC3CUE/WYwS3P87zH7Y9bkcKS0WkjnVJX1zLC3ZTo5m3sxH12FLbe/GcTv2dCL+lCOhClMLgC5lQJkn1YLek4dxhJFiTpfeM4KpjpeQcw5KzTCT5n7k2m8T4ZtnxIjOjnvd/5NpVkY59/rzCemx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAzAcFBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZKY50Rw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AApP7m3743239
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3YwNOJHfvnW
	B1gZU3cn4ouH1o7MoAZK7KihTsqW8Ymo=; b=hAzAcFBqsSc5AsafLpC9M/9kGsK
	bR+6/dGz3LNzIBO+W/nNdG9nWDXZgIbW5EQX+Xva4kRLvXBo0wlKFquakCN83ufc
	9XSEAq7tPVMHY30HxsWvuOf3gj7Gw9JQO2vzO1Tat/ARD0Jv2MWqFafUtVNceB+e
	6YiTReyBGsTUYZAY0tAKxDQkAtK4KZj4Xn18NXKQAYs7AgZAUbuOenTaL/L5+gb8
	yjmOlvmfwPnGMAmcXQbUHQXIW0olWVGdsjzwwaVXkvCv78V38jQeMEX776F4xB+E
	ItYO7vmB5SLERSbGyeiLKaO567FNY7++G913GQpWjXfOvlcZB6mC+/I+/cQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytnhdrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82d40278103so1693645b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846646; x=1776451446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YwNOJHfvnWB1gZU3cn4ouH1o7MoAZK7KihTsqW8Ymo=;
        b=OZKY50RwnbwW4JMKNWXkjCI6Y/h2eUXI5qm6Ou5G3+0uSepziqOkGPIcECYq4MOPi2
         QGRPoAct0xhob4TLQopxrMQSLgfRGTVBxkwJRnHDdBZEnszI4Cvh0uA5QuA+VaCvq1k8
         snw2tVlZtK/NhKXopW4KX8JwYzv3gnBIqhAexLandxKQCtSqdv6Vb/SZTvIdJGVNkkCG
         rn/X25RznWq8Qtxf2CIdbj6mOGRddIYGw4V6ZhK+SXp8HZPm08QjtLzB4jU62+Vzal4E
         ez32dtHJgTTSI34/6b2J4eAvkJvF/2pafG4sJDbF0q+udUjlgGn8jGgKb9hP+d/4mXN1
         Q9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846646; x=1776451446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3YwNOJHfvnWB1gZU3cn4ouH1o7MoAZK7KihTsqW8Ymo=;
        b=NOf7X8MChoV2G4qV6h0y5SehGHhxjS4zfZ2d5C8AgS2aieqockiqbSlV05YZ0ai9vs
         5nMpx9SBxfS4AHuZap0mkuOKh3woY4Ct4WoMUxVfOxSgbtvhRtdz2Br4AqTHttosLLwb
         4NYwM7UZZsLhbQr3gjrPMnvAq9kM01vcQNsHsjutrWFUcfwamWufGao38dU1ZgnTfMP2
         mmIV+0/1WyXDb7cPe2bz1dqjGv/zCSjHlM/gWw1ItJHWJIRGh9L47wQexQ8tkV4HKjZt
         64yr8w4X41kRkseo7eBIsMeRdQl8wI+48jQItptvqphVO6BML6B9/cqQ4O6Fi9pCO2Vk
         PnxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUztdTippbPOXgVUwzOlSTXmoOB2kkB3YTRt/M+hi2rN+7CMaXhROlMmRsgex76FQJysbPaqfKfYsp9YXW2@vger.kernel.org
X-Gm-Message-State: AOJu0YzPEpY0ek5ol0yzKM4CJ934yAMyvmvhsdJIQbvWlsc0j8AOyg8M
	XSU9qQb8SBFhAV38hIlI2K/77BWrucyKQ4Wn4EUvkSQWeST+Z1k0/0uwASPc/ZzrOuIzy+rKCBw
	qPp408UqE4zNV4Yplka/lGaWTHYcy05IiL+jZxMFXGjZ/CmdsvXgX/b0UEdQuob54w/fY
X-Gm-Gg: AeBDiev291irXLMProNyFXO/dG0AxBLBI2TSEyFOgnUNljzIeyUUj2y0PgD9BDX+eix
	iVcvYb7PeStXmdrpOyWb9R+107WVy3zlFZvE1H4FXWReZsZnD/P/fE9hqKg/Wkzi3WwQu9RqhFS
	k4ubQ5mJ8mZx11SoAjHEJjB/qc1T36G8h83gE/NsaG3u/cp9K4VlXoeyGdLmLFeVACtexlCMruI
	pFmj6WC4AhWhkV4QC5CpQiJhPBghNcc/U0Leq62anaprlIDwNmzn1UO0NMVnoNH4Kb0UUVUDXnW
	0NvPsV89UGRph9yhkm8YMXbbcQHcraZu/IrTTnsPALsNLpZiV+atMdE5oK3F5wZ5DvlzeWn7g1I
	5J3ke2bH+mz43+EsUbktrT7gdPsFLN3WN8bHtTJT7aMx3qRT4
X-Received: by 2002:aa7:8a52:0:b0:82f:1b1b:e16d with SMTP id d2e1a72fcca58-82f1b1c0e88mr1176993b3a.30.1775846645736;
        Fri, 10 Apr 2026 11:44:05 -0700 (PDT)
X-Received: by 2002:aa7:8a52:0:b0:82f:1b1b:e16d with SMTP id d2e1a72fcca58-82f1b1c0e88mr1176976b3a.30.1775846645219;
        Fri, 10 Apr 2026 11:44:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 31/35] arm64: dts: qcom: milos: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:08 +0530
Message-ID: <20260410184124.1068210-32-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W5GECeoEhQqScFu56wfPXDOvHc7WUsxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXx9MWQlpjeh/b
 OT9tVlHTEISQytH6nruR6q2BWdCtjMbfGBGPdSOUZK0eZNidsOEdwx3RbDue/l07IKVmJDlXqNh
 Nn90qLx68FJFWMRdVQDy10CCbPa42fIsfNTWvq7jApUskENGPhzjPToawGeu9hM1HRGO159VZwa
 FTp3Jn8UgwODLyNNNoZly8pOQbkrl5gdnrxd3nowYmbhm9/BOv/9PE/fpho5ODV6gvrmNF/oT7O
 ty2O+0FU/vzYck/iXHQLIs1pZKWUiJq7cCP9o8ZdU1QSMaVNRWmbz4qI0QNUHBFgLyVnwp6jujy
 cCxaZ9tbdssrj7sNaOexuXIICyc+YUhT6j7l10AkskYML7gxsNP7TxVEBaBzsCWftx7xRnqBvkK
 PYzZcG737gxmIpr0nu+cWD99JJ9QMsDVXaqSiypnCg1bntFu4y/VEmN6ViRY4h0//NwG4YUyaV1
 8vTCBO4Gb5eVa8LGlRQ==
X-Proofpoint-GUID: W5GECeoEhQqScFu56wfPXDOvHc7WUsxA
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d944f6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Z-SV6IHASCxNm6f5L9QA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102745-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,af00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,b220000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FFA03DBACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 71941e6f49bf..a3c2ac8ca675 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1564,8 +1564,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,milos-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x10000>,
-			      <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>;
 			interrupt-parent = <&intc>;
 
 			qcom,pdc-ranges = <0 480 40>, <40 140 11>, <51 527 47>,
-- 
2.53.0


