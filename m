Return-Path: <linux-arm-msm+bounces-97449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLNCO3D+s2mWewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:09:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77249282BBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F051E31223C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3219536D4F5;
	Fri, 13 Mar 2026 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcyPdW7P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Il186JXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC48A336EE7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403724; cv=none; b=ixBN9WQ5xYYEWkIvzIIVmANlbxt4g3rUQmZw/LqG4HlfZH3I3DfSAicgwrMglUeZusRcJ3N+BhVTaXCrdRX8frD9Gw+kgMTCsvtXWLhLj5PEps4+CQTy79FIEwa4LRTO/NqgviBBF/qhrYdz2BOQHOdmrDelnAHuEQppr7ch2NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403724; c=relaxed/simple;
	bh=on41Xc/5ggRLAfRW+zrTkrut7mTjX4tmeojgEOjuzZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GXCNW5hXjBlCypXP+Zc2CnkAT1J/Pz3tcqEWM9oPB+4HamAgVeQrHTBXOE1eNTmdf+AmPZGJ4Ubhcq7Jtl7hGyS57WtRsxkvCk6p7SeG3XbPFo9e/sFhIX5HFe8B7mvWvrRNQPzUodaOV0t7zpRS7g8oP0tXFA4QN/lLx74q6o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcyPdW7P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Il186JXx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oMi3792882
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IGOT9fD2d0q1zlnv6OnUTILWf5Y89gyMTfA
	EqWAQqBU=; b=XcyPdW7PwRzUxdImdzLrJpali8nZRk/vNxl+gBFJaylkCeLHmsn
	bkUOIs0IKBB16FkZp/bdsW/kIZXz59PFr6Hpjt/8CR50A6CbpSqOmN7dB662LDf/
	GDfhbw0m/mT3CJdNIbsG/fkmFy2PPwqrBlYa9zKK1OgvIcTQ+WIXJP89UIg2Ln4Y
	c9hbSFrFk7hik9eSmX9vPEsL2DyEgJt2lpH7CrDhc8dCNSbBDLgXYwyr1HxSQ7IB
	Z9PysOBXEWsBL3k/2l6vG+7U0+585Wilh6B4BRijl9MOMQAiWZG/Lj+UFVk0qgfG
	ETsWtZgbz+MjMbfkBc+To49om/c3torZjcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt12y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:08:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354490889b6so9002416a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403720; x=1774008520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGOT9fD2d0q1zlnv6OnUTILWf5Y89gyMTfAEqWAQqBU=;
        b=Il186JXxzNX1BGotXFOsv1mOKMW2BGr3JCvapAE0u9yuwKLu2tFTsWSWZi7kJp7kqa
         Ww7VI+/MIUv6d8sqkhAsoAXO0iH4vDB5faPWoqdQ0AfhbQMO6j6ZlSs0XATtS5lGSYJh
         oVKnl1QbUofhG1xefbhRYT1+FTVrKrHN6XumnupK0OcIXJwNrvDYXLiYCEEV6zb5hfXi
         S65fTm6wnDnUo8ihMyNJUVSGCp+GH4Yv9WE8xn3wdvXtA4vf8RJ9JW2y6UBJ8xTQqKvE
         9f/CURvvp5ZdJERW24GNtG2zzeNDjTSLg5LZPYrZSMXVC5YdDCy1l2rqBGXJYNoDjb1f
         0CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403720; x=1774008520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGOT9fD2d0q1zlnv6OnUTILWf5Y89gyMTfAEqWAQqBU=;
        b=FwkaUa5KyBG4ldgGzfjy468IjXczeYvukyUYVLoaR3cji9IMKtBgsL8cEmKRGzEoL4
         jnvFMgU1CZ4dwBdX4S7HwYFx/5bFWasAuAqkXjcGnNN0kiQLO1xPRYyeS0L6EcEpXn3P
         a3YyYEabJNDuxV/lW+bJ1vZj7cGIppVfiSwaAiZv93DHN+oOwDT6bG8beXItzUTKj0o1
         TLhURZUv8X2Kgfedu+WXcLghkUeUTjz+lyb/+Z7j9DJjUl+7ZVeWVTmz7tWK3/KEcp5O
         /kpDkj33Ssb9yOFjUB/7wSlp/0GoqjczDelBTLzpZdTqLptFznnX/89PpjcAy4DgOW7C
         UQqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBwT2wyH98znxQKpD5ciWF6kqhk7OJ9azaS1kRVZCtAzjWmpwzDBU9GeHFZkbptVJp+2OILtaCSJpjCc/Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyrlmoADDJMCMMgrUAgWgcx1JIUgHzUaxAd4SHIfJGmPJxiwMVP
	cQveLp97y71Jhe4z7neLK525sJHLAn9avw3qNvRMSZ+oOCvkQFMaLuTqb7NX9i/XOrn5LiQcuwn
	2orvB0W5ZN+TKcIJlUWvMsJX3CVi9mnQzwA85PYw0MBzuHi/jiLA+7CWD7Ug/wJ4IfMCM
X-Gm-Gg: ATEYQzzuRnaB70ldPH7nhV/vnIBgdYBLG0NdZmrcNkPzl/+5Rd46JalK2KzQ7T5qZqi
	aSpD7Y1pKXdErjBrIWpSgOv/vktHkWFo0nsSKnPnfZUKUchZ8Y7JXQmyk76bH68tqJnY9atyB8E
	ApiFQyS9R4kJS0gO/i183ZmDAVan+LjlOd5IP9irz6Xs+2mbe6JQbpNadodTJU0IsrAzi8BXXGg
	HA9SZYn6vgB9NZPt96JZqzqdF255cq8VV7mttxhR6m8ZD0wFv4NTMuPOMKLfz9b5+91c9peuzDS
	dAZvYJcJ0g8c0jWS2Jy5QmioqtGUN8oMXR3fW3zr9JyU6S4wSMUTjyP8MaI+K0RaEDHlLG4FwWX
	WmeEzOuXD9sPZ9J0zWqSLImINv9P36X3m+13GodWe4Vs3bR8fDY+zzDA5rYfkkvcXlvDDob5tkd
	TfUd7ASnjgxEp0+2/VEbhDyMYVsFflcRfmfw4e
X-Received: by 2002:a17:90b:1c08:b0:359:88c5:3add with SMTP id 98e67ed59e1d1-35a22004c98mr2877064a91.19.1773403720438;
        Fri, 13 Mar 2026 05:08:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1c08:b0:359:88c5:3add with SMTP id 98e67ed59e1d1-35a22004c98mr2877014a91.19.1773403719854;
        Fri, 13 Mar 2026 05:08:39 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm8421945a91.1.2026.03.13.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:08:39 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V5 0/5] Enable ADSP and CDSP for Glymur SoC
Date: Fri, 13 Mar 2026 17:38:09 +0530
Message-Id: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3fe49 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9v-nsc7hOUgGWHzJVNoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: W84WN_vXXMESfTDkVX3S2dCelJX5dpAg
X-Proofpoint-ORIG-GUID: W84WN_vXXMESfTDkVX3S2dCelJX5dpAg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX3WAvMWU9iR4C
 UYPTia0Waml+mi4zJWvY8vwuCGMGP9xI/rk8Aaia0Z/KWqK3iBNaEdKn2rHgPoWgPwJvzKcpX9r
 irhswfDyJmf31s+3uQ77Ld+IIGuVvghuhMJvYDM9VuOegGhBhFdKSKD1gwCOTTKm5jYTaWPx/9j
 Sib0nzbkYgYA/toVMOAt+mrHoLanPFlqkHIeH90K5MbmWIU2haSH+tIkyNPZOZRnTV9hwwdiPZm
 zydjsyQ5RvsGu71KIkB531amjWnKR0cKbnTGQkftevP1kb8u35f7YWhcvJNA0dgIabUJos9NEJz
 PdbYkzEi+gPhtMTDb+/XlUmmnkV0r9bPicqUbp3gpA6RqSgR5pnDYuJTXVYplxEpGnr3RFVoqE4
 s0A5gCvvgJ4iYEPvzQcWVsmR8W8ln9kU4W1izQ4MVInINcMTXgZQvIZnlgJvSCmPBwVWS5Est1D
 RBp9h/BMf7pgLVl9Udg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97449-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77249282BBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v5:
- Fix commit messages (patch 1/2) to accurately describe compatibility [Krzysztof]
- Link to v4: https://lore.kernel.org/lkml/20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com/

Changes in v4:
- Fix SID used in ADSP/CDSP for correctness [Konrad]
- Link to v3: https://lore.kernel.org/lkml/20260129001358.770053-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Add fastrpc bindings and nodes.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

Changes in v2:
- Combined into Kaanapali series since they are fully compatible.
- Link to v1: https://lore.kernel.org/all/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/

Sibi Sankar (5):
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
  dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
  arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
  arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP

 .../bindings/misc/qcom,fastrpc.yaml           |  11 +-
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |   4 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       |  14 +
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 286 ++++++++++++++++++
 4 files changed, 312 insertions(+), 3 deletions(-)


base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
-- 
2.34.1


