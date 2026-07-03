Return-Path: <linux-arm-msm+bounces-116159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fCWVAxNER2oiVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:09:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E33596FE971
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:09:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j7ybRX7o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U0RwNDdS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116159-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116159-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06499304CDA1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D584B3845C4;
	Fri,  3 Jul 2026 05:04:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4F5379EE0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:04:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055073; cv=none; b=SEzLQS9q3ZiZ0NjfFnVnMdXBH2D2RYlcR8OU6cC7Iy+nRYCGDqf8N9cQmOFz4/8/uYIH/hGx+86Xxn+XYbrW+l+cnyRFW1mx6rdBMJCzoD3//KpSIn2fYvdlCx4xP4mimteZgtStVBWFPnBhnnwoRYymZdQD2QwFwr8W95BqTjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055073; c=relaxed/simple;
	bh=mw2xywDtGE86eMiTObjMgtV9IqdLC+USGzaPZvRA/pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Akp78TFP7w7TXYvdWh8N6YDNNTHmyHxlWygJvC9ga61/DqcOCzlzkegfzP+0FWoy1M7WqSDOdGU3cqILmBoIaF0wppXfujKcnKQPDqB04drpNoHQdfCKDiyWIPLLe84UsbsdLMIN9wo8IzAyP1X1/N7LqmDxnq+hXzp9YLunmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7ybRX7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0RwNDdS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342VeF2686905
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	md8wWc6/cgAOJXI2yDz++qo+slmTKVQf5dEfPIb96Jk=; b=j7ybRX7o89rK6kKu
	/G3+cqhxVEaf/oFTjSHPoCgSuQuP/4WzvDXZCeYbKKYKHUoVp1U9aAvX9xzWQSo0
	oud29xUyfv0iTHdkzbIKklSIsErlht4XidYcnKrunC5z4A3dT1A9rdbSvpC6gUa0
	EWUJpcZs09+hGYc/hSK5f8RWdhUzilHjEFoiQGybOKeCmKTCLCsrlSK286SE3js7
	7OaZLixqFcogRYT49HMkCB3W51uTTvg9Hj9ZDIlTx6t6DZ52hCNM982dFEo6NbjS
	spTT/RPehHg+zb5DvIcaOTBjshwU6/G6JSZwuz3iY4Nj6HWL/khgVDHWohJrQhOo
	ZswItg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n0htd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:04:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a298cd62so226979a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055055; x=1783659855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=md8wWc6/cgAOJXI2yDz++qo+slmTKVQf5dEfPIb96Jk=;
        b=U0RwNDdSfbMXx084KS9S/y7u6A2YJmxu091bVSO234Rf6pcusQWpwAXXNwzAiO2MmM
         I/iUwiwTbnnioza9nEX0bd1eIh2DLgrI39/B/ggsC452JcSqhC6qL3UD4+uJ7xMpzJj0
         XIbEVm0N/oveB9Optfytk9VER6dlmUPQG+6jJ+KEXVqmcAZQErAYAbNL7mfGyXRroC34
         Zompz0btS0R3assV3qKY9YMzsGHg8XhG1dHVjfbn9/M3jbfvk54hmbdJ8N2sH8tRjE2F
         nfAJe2Lky93pM5dai2fbeQJfYVoWaTOm9GPsXz4xMWxokdjCSWsFIICo29nEZ6pSt+4c
         GAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055055; x=1783659855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=md8wWc6/cgAOJXI2yDz++qo+slmTKVQf5dEfPIb96Jk=;
        b=ripZ1UZ6k0zHZ5BstZ2GstDqPqgrKUKGes42y406H4ATxUaTe4YQwNFv9xgkOfMkIE
         C34GJiRQqLPUIgO5GqHId1d+nKawFNuT/fukjSns4F+DbwnjcnpwSn6xtjzSFgZwcek8
         4P3F6n0S2DI52SpBsorjBNuaRK3zJn7urAhcysFM5yZeWPVC/X5buYW5Ct4poIYNOqq7
         z4wYGu4sX4HdZM1Y7N/OcZw2G6ncg2HyICaN6v63sMEwftZqMIze6YkYyvZH5UoXQmVb
         Q6UYUDDLGotXSRWKDkRYLGTae5U0pLqfN+KoMTZnegQdJwjtxWRcIKa6UsBrwnJo0UGj
         ow/Q==
X-Gm-Message-State: AOJu0Yxcx1r0ScyyRnXK4EQIFHOr7Bs/uj7dhYFdwGla8fedAFiB6etv
	iGn0qHrPQblNeBt+q8wS0lsdf1ewgCKx4O7Irez59zZgsZUPIgVhRX5vKhO7ArMD7VSwHKTnsyW
	wyfObFca1DNi0CVNqAXFILfbxvdiqAyUhapG+MMXtKHscN9T7qMgaj02uFnPwVwCB8V/9
X-Gm-Gg: AfdE7ckHLmwPN74dr68itzbDHbI/TeVRUFc7o8FJZa3XNkIPHW+7ocef8zC3EXKD90w
	WSlorkxUUCbOreYluFA0IexPLsO5UWu0gHIuvtgjmpoZPZbmWwkiIEnBjcuYbWB5p/FXPC5g0ao
	rWKg42Nqgh+MYcgSy1ekYSQqcGwtkTceiVRy2FE+VH6ZdoDkfF/kma9ZG/i0N1jcwUP6F/RVjYG
	Q/yE4B7tS0sykxE0Bbgo2E/XhYnuAGHN6x7f8lQGo/yrLYCGZJEt+WEMbnhDy6iQa3G3MvDeikN
	mXxw/rHZ8n5ikLMkDOaJFvzsdk9lOYWZecQQgZ5S2Qawfot4g/A4wqvwHPbotW9Hv6iLvML9V29
	TLN7YU7K2zSayKsXYb0LOo2VMFXznw3CRGFQrHJW2
X-Received: by 2002:a17:90b:3811:b0:381:5ede:1296 with SMTP id 98e67ed59e1d1-3815ede1635mr77869a91.11.1783055054654;
        Thu, 02 Jul 2026 22:04:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3811:b0:381:5ede:1296 with SMTP id 98e67ed59e1d1-3815ede1635mr77838a91.11.1783055054031;
        Thu, 02 Jul 2026 22:04:14 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:13 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:08 +0530
Subject: [PATCH v4 05/10] remoteproc: qcom_q6v5_pas: enable QMI TMD cooling
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qmi-tmd-v4-5-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=3860;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=mw2xywDtGE86eMiTObjMgtV9IqdLC+USGzaPZvRA/pk=;
 b=ikEWVDd9kQOc9aRYdLrIQRqy20EpLvW9r6pThjNeNOGwddivHx9OZ/0ZkxdGjXxxIaCKgSOFX
 LOXWhMa5YioCLK3ChMQTtJcVx8h012+foUjbvpUg3oqYjlxd7w6lT7E
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX1AcQcjvOqQzt
 /g2ReuQE8biO30iJ4WGR2jWIEcm4qBH3k/ADfzjCUk9YEIUYXeUyQBv5MKPb/tzCmRXpAtl0bVi
 7+wZNDShgTFRodmmib67x4KgBCCvmTE=
X-Proofpoint-ORIG-GUID: K7tnHMvHhjkzcHwC3daREmkspm2qBPhq
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a4742cf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=j6jQExit_mXiN_RbaP8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: K7tnHMvHhjkzcHwC3daREmkspm2qBPhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX/59HM4+zYmPm
 oSd+QAugvMAXJzX7hxbZwbIvpws8/okjZuOMNDIWlSHe8M6CcajfSFSiFlsW9QqYypKCXr0I5d2
 89ImU8rj+jOZrK/D9xidi1iLqLUb8y7hs/uGEOrES0ZMomTTOMHTUDZeNq4B7ckyqBgHb/ntqnd
 S5jgCxvteuhap+Pi4bAQffuQDkjaBwGP7kaHvpefxBwSYjGvy9XqUCkxgu4RnJZICq2wAdTrA56
 zuz+7PrILLrWCVvbtQjcRQHql4RxOnXhic8P1Xqtv4363szIKkRv0MrYtn1xGFe1EBO/ujVXqMD
 P7Xp7x1Uf2q9s52RaxR1VM/NU5njv7rTdXpgxZZaLx16WZY0xMAqW3U1214QgPciVQ9ke0FX+eq
 GcXMnuWTZZYr5Rk2WmgZwlMqu6cdYruUIqQIq84W7lUtqUItaBNF+6pVuDuwWdfK9uCsg9vHcSE
 FDa/h+YSRy/16//QfAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116159-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E33596FE971

Enable Thermal Mitigation Device (TMD) support for PAS-managed CDSP and
modem remote processors on platforms that expose the QMI TMD service.

This adds per-platform TMD configuration in qcom_q6v5_pas for:
- Hamoa (X1E80100) CDSP
- Kodiak CDSP and modem
- Lemans (SA8775P) CDSP
- Talos CDSP
- Monaco CDSP

For each remoteproc, the configured TMD QMI instance ID is used to bind to
the TMD service running on that subsystem (e.g. CDSP: 0x43, modem: 0x0).
The driver then uses the corresponding TMD endpoint names ("cdsp_sw",
"pa", "modem") for cooling-device registration.

QMI TMD identifies mitigation endpoints by name, while DT thermal bindings
reference cooling devices by id. This change provides the mapping
between DT cooling indices and QMI TMD names, allowing remoteproc nodes
with #cooling-cells to act as cooling devices in the thermal framework.

With this in place, thermal policies can request mitigation from CDSP and
modem subsystems via QMI under thermal pressure.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ab5bcccc91a6..974526195e97 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -987,6 +987,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	device_init_wakeup(pas->dev, false);
 }
 
+static const struct tmd_name cdsp_tmd_name[] = {
+	{ .name = "cdsp_sw", .id = QCOM_CDSP_TMD_CDSP_SW },
+};
+
+static const struct tmd_name modem_tmd_name[] = {
+	{ .name = "pa", .id = QCOM_MODEM_TMD_PA },
+	{ .name = "modem", .id = QCOM_MODEM_TMD_MODEM },
+};
+
 static const struct qcom_pas_data adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -1144,6 +1153,9 @@ static const struct qcom_pas_data sa8775p_cdsp0_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sa8775p_cdsp1_resource = {
@@ -1162,6 +1174,9 @@ static const struct qcom_pas_data sa8775p_cdsp1_resource = {
 	.ssr_name = "cdsp1",
 	.sysmon_name = "cdsp1",
 	.ssctl_id = 0x20,
+	.tmd_instance_id = 0x44,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sdm845_cdsp_resource_init = {
@@ -1189,6 +1204,9 @@ static const struct qcom_pas_data sm6350_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8150_cdsp_resource = {
@@ -1204,6 +1222,9 @@ static const struct qcom_pas_data sm8150_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8250_cdsp_resource = {
@@ -1288,6 +1309,9 @@ static const struct qcom_pas_data x1e80100_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8350_cdsp_resource = {
@@ -1356,6 +1380,9 @@ static const struct qcom_pas_data mpss_resource_init = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.tmd_instance_id = 0x0,
+	.tmd_name = modem_tmd_name,
+	.num_tmd = ARRAY_SIZE(modem_tmd_name),
 };
 
 static const struct qcom_pas_data sc8180x_mpss_resource = {

-- 
2.34.1


