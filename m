Return-Path: <linux-arm-msm+bounces-104853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOnmKvYv8GltPgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:56:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1ED47D33B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3195D3016035
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 03:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4912F33711D;
	Tue, 28 Apr 2026 03:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzxslg0g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChqRgFx6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A532E72F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348568; cv=none; b=ODpM93m0eD9fiVG2Io5BG1K7QAJxC4QDVFksbSkXo8gFhssMDvGEYojEeqLDHjgbbuobDYDcDzaLLuMK2r9au46VtRVmn8q8TtmjmetT7p0AcGR88OgHzAdq0/jTQXvAhbSdNSF6tSkU86oYXNJ6rjh76qeAIw1vZHHumFOLHho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348568; c=relaxed/simple;
	bh=9ojkIAdTpgdWLJL63T3L3LzXB40PPdXzhWOQLp7Cpgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ENOeto3w7WYH/aQ10H9xblbgptnTw95xIeh+xky01jwQmEX0w+ohJUbDofH/SkEIF1tTx1wSRc9VPKPW3eQo6ITCjTyK28ikNsBwYCxy6Kye7Nivhj2M1Y0m8aJ7Osk8SB0SBqeIcfBxRfxO9kCIDQ+UyQF9eLdSZYCPeiO/DlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzxslg0g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChqRgFx6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RK0rc42383098
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=; b=mzxslg0gP7zoCWL8
	HK1m+jk/GCKz0EfmxyinXpZzoW0GwVrVBWb3dCbH7fX9eSQKEifMf0PES3zfNDn/
	5tuL1k1R6zmNzWMSO5Xc8ow40h5IIUCE0GI5HvhcKp8YURwnqK3Ib7iJpAxj54/s
	GycsCfsj1noxB3KlHZMbUFPErqmGt2RrQ2Q9JUZN7MKqnZWp5W+I5HQYL3F5uv88
	j/Z5YH5pHXd9X4S5LHwxNiAshXjO3isBmizvU3qpadfv5M4ijL+OBebeXyjDlZjy
	KkuU1o8DLzXLP9qVmI2sw/e5OWENrpwWdnx/c8sylXD+tFruEC1A4Lq0fdqZVAwP
	+eknaA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xu471-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:56:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so24272573a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 20:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348565; x=1777953365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=;
        b=ChqRgFx67mEnwnc7ur9CFHND0emiOTwDZY8zHZ4M6BirSia665v6EH83cSb8cMsIb9
         aMPs01D7eo6TsuMVOYNbz1AeFVquVbD2DByEz9W5o9jL/3A5rBcJlLmUsVb8ZCZvatTx
         qL5bzjQ1qdf3Cd/6/cl6W4iTlhWlGdQ7WN4qtg5gbrnbA4r+tkM14A0J2jJulfeuwImK
         30Lb85oeViOMSnCgfztJT27Z9NaVgetr8Bz6LbCPVIMm87yQ5WG1wYBzj1urG9Y+aDsf
         IIRnNQu3h/MgxE4CcTfGzaNH/rj6KRWyGPML3lWMGI4RKFaoTk4wOX/as8zHL5NWKQSZ
         Y+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348565; x=1777953365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=;
        b=hfVVhxYH9+nmC+MTGnihApDcRh5Tt+U3t4jBMXCsOn4ytOzWex3mf0o/ipRroVVRRm
         yiyM4vrIuZKj597m1Ubw24oHW7N3Ikd6k0rUMh7Pontc9wtVIs/USJbD+QFPP3t4Bq5z
         y7fHb32cbNkesYiNF0QMo7F3xC0WjznwJXm63tUv4PL1n7j4r633SziSss0UmHbpPIpB
         m+D27nIjy60dBBYjAwYNfa0dw+LJAcDITqu7yNyfKaNw9YglliEs6mE0DSWA0JTtUphl
         e7MngilCXIhSS5XxtcqqqkeCdG85yilnF+ZApnfzuwayzBCEtCPRRyMEcLtphbPKyjan
         dH9g==
X-Forwarded-Encrypted: i=1; AFNElJ8iXSUWNTEVaBdODarH5Vi5z0g5C0qSZoRHnla6DR+NXXYIkVhqWDnjJtbNSCyehGzk3KeUTZ9qk5pofXn6@vger.kernel.org
X-Gm-Message-State: AOJu0YzJUxnbZFzKN0RSCpwz2PZcdJTDpuvpH47pjCAMQpL2FTMdEGXZ
	v/yE5fVT/XH8e9q5i+sKXIGgk4ggVuQske6SsxIbad4sZ+aR+k/yATn/HmW1zNBSN2xsD5GRWm6
	xUC4yfQm5RzHRcEosZladsQ5eVVb44QyI0VCvmjLY3E5FuZ2yIFmWMfbJwxMItPj8ldo/
X-Gm-Gg: AeBDievBpVjNwVUVdd4rBL1TDQih/Pm4bkLrOPbh71KSaUPFDzYEfmQ6wq2eJSGhHsN
	XpB2R3BYjHv4YaCfHGOL6J8xOg6t0dPve9rH9T4cWqIZIoj7v+CruK9khojJ5PrC6rQnIIG0rDD
	qBZKYCTgore+fxrA3Qa5JMByZ6F/aIeoPXfq6Sx1LejwqSKEb5fcFSmcw0VrX+10QCDAOogCHkX
	cyXrRHdQt0IzHWbfD3sxl7nDvpSQaQTDQc4i4ACTsB05p5xw7rq26VQ7dClk+f8eOg2u1x9RUh6
	iZrLk7vx8kugNIJ3D//yO3RU5egxcwluxeWKht8TqJx92O3kxZY8r0ZoJvawkQHpLpSUHzSuO2r
	DQeUWXvUO+HfeHxxPI/AG9G58Lay/Za3c/qWgWxDCfNtyXLkQ5ST7AZlv9l3WH2FZ4A==
X-Received: by 2002:a17:90a:d646:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-364921b0f18mr1617201a91.20.1777348565546;
        Mon, 27 Apr 2026 20:56:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d646:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-364921b0f18mr1617163a91.20.1777348565020;
        Mon, 27 Apr 2026 20:56:05 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:04 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:07 +0530
Subject: [PATCH v3 01/12] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-1-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=1361;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=9ojkIAdTpgdWLJL63T3L3LzXB40PPdXzhWOQLp7Cpgc=;
 b=ay0dYnshvA44WROZCAGWy4lKalYgcb7yDOo0fRviOiuhVcATuyWxdErrTpNeQbm6pWWNnv4X6
 u3mbWherdU6BTtXEW7QFWSFFg8yQ+9jQhUvkN+qqjo9clshZxPEAcC6
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69f02fd6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 1qhYWyOW-AaGS9zNoKTci_oYKZGGvz-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfXyqXiueUTMsvE
 m7EbvZX59QdqF7KlErkF2PIuaZ0HeCwN590iyg3M1rR2okM42SE7oJBCU4fpFfml7kU2D9zdB4I
 769u/TPQ8T42mHXD3rnibOGdE5Wn48I3pbUH5izgGwEbm3bjRE5K5JSYnDROwGzUiPFvI1kp/I+
 rTq5RIInJJYQf6WluU1bQKYs9eXoFPn3Dp+oxhZaZPQggxy+wahL/dI4/2xRYK6BD0W18nZYxMN
 seLCa0Iyo0T2X8nwMQgpGWnyUsn6Uq9nnihs9A7n2BvWGkktxFWu2MQO1yrStwpthkcVV45BEbz
 jRUlge2RBPK3m0EsAndW82E9kVTwub9GgmjXu4FOXH3flipm2JPKM0iK8s2KBn6LqMcWpcd0Zyw
 vQsn7dcxcPJqGY6nrTGNOlC58/roQGFFCCDZr2+JRqw0wfOPhWA/Yfg3ks5jYhZcFRjguMs0hsp
 e1oOghexJv4sr0OhH3Q==
X-Proofpoint-GUID: 1qhYWyOW-AaGS9zNoKTci_oYKZGGvz-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033
X-Rspamd-Queue-Id: 5B1ED47D33B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104853-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..bfd1e762c38e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1


