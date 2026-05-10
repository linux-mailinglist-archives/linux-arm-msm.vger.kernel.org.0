Return-Path: <linux-arm-msm+bounces-106787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBW+CDjo/2mUAAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 04:06:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA55022C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 04:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A8C73002B51
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 02:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55735221F39;
	Sun, 10 May 2026 02:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsEenpeq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4WzNLyn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D712F72622
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778378800; cv=none; b=e92j6LZYsETq+q8RVcHichdjAd7pJbVMAA7xzpfQ3yWmtEkI4WwxNadSsPk8ICjem1ju/FDHrN2q5QWNNvyAUMHzx411qEvX+NfSAejm0X3OeAsS7c5tEpRAj3OrzaBcmoKzUatA0Pap1mDx5IzvPgdeYnSfLlv80UYJJYQGfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778378800; c=relaxed/simple;
	bh=W+DCCrpFowryX11pvJt2K1EBF8G5AAjkOkkiR7AQKV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tAeWpzmh4q3Nyu6ZVFLGcAXaV7wOM6RsRZosH7b3BuWBl8N93vdgPhUAzeF+5ikULIJQeIFKtgedQAbOzvMS5cE0+iJTPlfg/7l0FnhNIFTlz/Y/odWLWrePwhoKT+4/vUUPAiSTWg12YcR8VX7wB1aWtiTW3/H4da56D4hCzWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsEenpeq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4WzNLyn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 649L0jq81768168
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Hc+dMOlXO4kmwhGVPeyOL2/tHkuEgcbSLt8
	7GgpCmL8=; b=GsEenpeqGi0LnK8U5YdTsMsdz4WGa4i8gCIxSSZUGnBK+rU+Xu7
	o3DeIahfJe38v2dL6XT0Kt47c1VRMtdn1G1lohHW3lQzCofJrVyygYgeXrsYJvN4
	CQJf6af2Y5AxzTO3am2Z1tEmVUH4WswzQ4/QNTYse75yksHuU6i+zfbg2NqpNe60
	+I4zBaqbQIpazCC17ev44u4j2Hfd310UZG61Ff8Vn/dtiCE+bCNWFE5WkOEEuA/R
	urgEDpuOQftR5V5cVqk/q4+V32CGXsnAQPiVRTskvvjIpXy4V8mhyiITapixawMH
	8ET0WidxVP9sk/YOcxLDXeUk7d/XTES/vEg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1t9q2de9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:06:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef62078ee7so4252038eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 19:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778378797; x=1778983597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hc+dMOlXO4kmwhGVPeyOL2/tHkuEgcbSLt87GgpCmL8=;
        b=K4WzNLynl5mwFssbwycpdsAlj+u5KnWdvVp8Fm9+ctDG+xDf5iU1uWW4co/amLjCZx
         OF52hOElOtRnexrdr4q4niNKUCy+hYe2hPnhOvOF5SzdWljFzx2/FWt0rDbWs6kxqSyl
         jfoxqtT6Co9C+OP5OI+oz0GgUmAoUORMKNrYSxPeE2DB+Wxkv9t19rtMXKGy1rBheV3z
         npD1YEf7xc/2EvAjf2JMraPj2+wBC8A6ktQiBvlGKvHQa5RNd0KwL3z+ex/a7/XmULJk
         cqKpdCsWEqWNxfn8qSCnByEtdiVUIcjA9iF1bW+yN3eoHOHsCD8MG2502DRQEl9ohR7i
         ChHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778378797; x=1778983597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hc+dMOlXO4kmwhGVPeyOL2/tHkuEgcbSLt87GgpCmL8=;
        b=crxgVFFPYLcRrpNoJtQEJrOPGD6jFAEAzqvzTiwyotQFN7U2IZRZPGsywrRoZH1TPb
         uKzgPIPGLrXTpNSFsHkbvnmlkFAzFz57bSQ7NnH+2UKxbspcsu3ydcaWlQHfsXtgZyOb
         RqVSqUzK6EEh9h7F3bxthz2tWcDTe5m6pLZ0Gs/KDBQg5jwga8MQTyjkUq3P1/IRQay/
         leggD3Pr4bb9b5ThT7p3DNCmL291h1hoTR7GcFYhkagNGNFf6HFtMaVe0JIuMOk0dfS7
         FJAEXM8wNuoq/eg/51lWpTu/zHa0ZSy1hzBSkqdViCEo7+HVYrlIkULtZroBZx+ACmmd
         i2/g==
X-Forwarded-Encrypted: i=1; AFNElJ/XPerCpcrVu1b7X/+nmCpl8sL5+soxPpMi7K9p0JqDOBPtQj7HsZx9Bh8YtlWxPEZ7IT0RJ5JvGME7zrVU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5mP677OqntJfRjp7TCUy98zbsXogRQzG/gEaR8rgBqVto8WVU
	I6Aou5guyq+o8tCVGCe+8qBrYeItQwl5dGefIodBQ2UbjTylndwRWQyu9hb9jqp2vUJ6nWB1gc9
	o9Kk5/dfqYuX7EfWvT136A5yT7E71a+FIx/gdCm4YlsaVQ+WaJxSaEFkZscP4y/8GAHMT
X-Gm-Gg: Acq92OHP8dertDhSCOvtbKhJWvZa3CQYZXG84c/pJebgmo0Owjx2vlQI6J1ujATspuo
	xauqonXUCtDqJpgMCcFg4NWZSB875P/QeEv/sNTDnPCDAPq9CabrzqHs2tiq2g3RNbJKE1AXa7C
	o9plUD1yIFZc5swbF68/2KiTBBCAK7q7ZnBp9wQRGxQ1ExWiiEHwc0vVL2Pgi0FcLnpSVedz800
	qAHHIF218FhFUCnT3Lfj82uvwBADst2EOGwgeHQb5iiOlijd+7RDqnhqSRRNi6j7Ep6c82CgG0U
	0LG+4gVD40y//eMScWVE08j/1wwAtJIh1q9oH0rloEBlEbusoM0lzbwHncE8C/w/mmcoXWJ+J/t
	m0WQjpBG2MHajrkAVDoKblSDt4EDOldjVaQ9w6URj8DIwbqhzhc6uzSgK8JtDZXBZAVRRaHiwkZ
	M66cl/JA==
X-Received: by 2002:a05:7300:ac82:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-2f54b466443mr7716727eec.30.1778378796548;
        Sat, 09 May 2026 19:06:36 -0700 (PDT)
X-Received: by 2002:a05:7300:ac82:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-2f54b466443mr7716695eec.30.1778378795363;
        Sat, 09 May 2026 19:06:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm9645257eec.10.2026.05.09.19.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 19:06:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add interconnect support for Qualcomm Nord SoC
Date: Sun, 10 May 2026 10:06:05 +0800
Message-ID: <20260510020607.1129773-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1p6CD0hi9JRYqfZJMMHOcb3kXDaL5YNF
X-Proofpoint-ORIG-GUID: 1p6CD0hi9JRYqfZJMMHOcb3kXDaL5YNF
X-Authority-Analysis: v=2.4 cv=J7yaKgnS c=1 sm=1 tr=0 ts=69ffe82d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fJYZd5zOr1s3VisSgZEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEwMDAxOSBTYWx0ZWRfX2r7bRwgFuOma
 SOMZ17GcKe4+RWmF96X0QrVGbwLR2+7MUkD3J+3AM8myJ3JZsJ+iuHvLPODSYozznLo6Tl3bCqB
 5djL6hUeUmPw6rHsujOl6/GA6V3fWeJ142/jKfdwNtCOXRS6qOLRhY//GqjG/jURZ+hyqwpmhHb
 YJN0+9jUXuHEOXToL1jO5mAswYxuNLUMGmWJdYmQP2yaVu3DISwzEjcu4Y0Enwz+RezQymS52ES
 BqzvU+Urkdk68l7iFUkAefwLQudG5yeXnRfV0mW2TF/43gUO5cpu9OxVmO5kVjokIq5KbEk5URO
 DdRMgBO5oFFWuQHPJX4N6C+6wjZUWxKHuYjWxznz4cfiHLcPmJkbwn9R771hOyPFXuUrTB0MkUr
 j4+GTSbBtnEtkVwVyXl/ktrXTHfJ8gmLnaAQwn9NLrQz3b+3XGFwwY55dzBpR/yd1gMj8yKwhCP
 PlVaegS+rkQxlOYivhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-10_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605100019
X-Rspamd-Queue-Id: 1AEA55022C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106787-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds RPMh-based interconnect support for the Qualcomm Nord SoC.

The Nord SoC features a rich Network-on-Chip topology comprising 19 NoCs
including aggregate NoCs, a high-speed configuration NoC (HSCNOC),
a multimedia NoC, four NSP data NoCs for AI/ML workloads, PCIe inbound and
outbound NoCs, a system NoC, and virtual clock/MC nodes. Bandwidth requests
are communicated to the RPMh hardware through Bus Clock Manager (BCM)
resources via the Resource State Coordinator (RSC).

Changes in v2:
 - Fix .max_register of nord_hscnoc_regmap_config (Thanks Georgi!)
 - Fix .port_offsets of alm_qtc, qnm_pcie, qnm_mnoc_hf, alm_sys_tcu1
   and qnm_mnoc_sf
 - Name QUP_3 nodes with '_qup3' rather than '_qup02'
 - Link to v1: https://lore.kernel.org/all/20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com/

Odelu Kukatla (2):
  dt-bindings: interconnect: Document RPMh Network-On-Chip for Qualcomm
    Nord SoC
  interconnect: qcom: Add interconnect provider driver for Nord SoC

 .../bindings/interconnect/qcom,nord-rpmh.yaml |  131 +
 drivers/interconnect/qcom/Kconfig             |   11 +
 drivers/interconnect/qcom/Makefile            |    2 +
 drivers/interconnect/qcom/nord.c              | 2682 +++++++++++++++++
 .../dt-bindings/interconnect/qcom,nord-rpmh.h |  217 ++
 5 files changed, 3043 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,nord-rpmh.yaml
 create mode 100644 drivers/interconnect/qcom/nord.c
 create mode 100644 include/dt-bindings/interconnect/qcom,nord-rpmh.h

-- 
2.43.0


