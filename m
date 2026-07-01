Return-Path: <linux-arm-msm+bounces-115761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +cE5CmBFRWpO9woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:50:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 076426EFFBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:50:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ANgsB3HC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="DRkL2/Vz";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115761-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115761-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 311E5300C38D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5DE371D14;
	Wed,  1 Jul 2026 16:31:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE44D36CDE8
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:31:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923485; cv=none; b=CD58liQINGlaN0UBrLZfF/ZCq+uKhiOXjF5YTRoueKEM/UjbbnnVI6/0AKFoRm/NENkcMiO+c6AkESH37v6B/gXWKA5jBcflNx9L6UTix/tLEwFPV0gTdhF+Lm8Y4s5RtEZY9Lirnw181tQoPrweNpjR/dZ7cusSGWjY7vu8Xjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923485; c=relaxed/simple;
	bh=DqZ0FVb0irYG+2K9mAJHPpKEpkKHUKNioC/dapoOlgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1w6pPEPbVQqotBgHiBzZTqdJPwJrs4hj0fqE1KmPbadubvvvlezDBNgEZoLhanalXG9dKorR5FJ+nepRxSG3nCdBCo9vYi4FiKUMSSLHhC1qTu1ehhsLSG6bYcVETnIjDvcbPEI23gVXHjGq6PPlTsi52SV6zSsCHXdyeDmZ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANgsB3HC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRkL2/Vz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoA6h1546106
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qkJtpxb4LNghBEEDMhuDcIVd+Q4GVz4Bzh9
	sDthSIyc=; b=ANgsB3HCqy1s+OjN3E/XMuUDPxzDNDEq1hcF+2/IF13oTBhGa92
	45IDE95jLuPBgoDLNwKSQxkkisIjRrg3rD/19zX96do8D7JoO+POwONYozZYRHeN
	A936+2D0MT3BpVfB5uJ0ySCPKsOyxirZEvMy8e3HemG98fZBdjY6oFo5OwKOpbnT
	ilx/FxE01ugJq3EtUzAp5kax+0gx/CZs1m6Ns6KtSMidZtcZ4U2UzYt+gPAiYdwZ
	Dv/ijPgHo1MxML+gjgq8r051g9VDUAWiUSxj6+pA6OkKa2V7tFrr+IdHhstpqLHI
	q+vRwyt0XT91F0gDhkF2sVzwTrGMSDkEPDg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqsq42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:31:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a7cbf971fcso111335e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782923482; x=1783528282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkJtpxb4LNghBEEDMhuDcIVd+Q4GVz4Bzh9sDthSIyc=;
        b=DRkL2/VzVmDv0KY7Q7nZCg/pUJWEfZZsqZqXSYQLmRSKpSbjC+fX+CkJ0gfPOzEf7f
         PNd6xseq/NEH63VTwfzh8DRw7SdTD6oXvji4qqvXnUAT+usf8xxDCdYV32otbGdkjFe6
         cHIANpobszspLT+761JY14BRyht3T5Fcdj9nZrtrDn0FADXRynqjKhIrMcIckVuKNTQB
         5xk/2xVtMAtcOden0vCGrMRXtzTXFPwgudDRA7PgfeWHX+CXL+Qr8U15P6kcq9xMIF6A
         T4XuTnNHq0uoxwEiSX9VlU6nXxgS4vPkyRVBHfggAGrpBAcPA+SKKXgOAKuHEiVY61/z
         RnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923482; x=1783528282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkJtpxb4LNghBEEDMhuDcIVd+Q4GVz4Bzh9sDthSIyc=;
        b=qmH3blmVVIKk5LeUK5CIASzVmU4tL8JQeTZ9bZEPYcKM71hL6d+hK9OoOkdH4HpgeR
         meOVMJWhRtJW4x72qgDF8MkNOrWjweZIsCKMkeLqogaW+VkXQe8mwJvy7jyStGWEmMaW
         AP4r0VouvYTkRxRrsQL5N0u/wFikW0/lilJxpOQWncMKQacGBXALDGNiSvPdvAcTyu0O
         1CmOJqQ7rYmdVpDU/GRcFt10YW40zoI/HMtm+zxqQGbCYDT1LDHyXABC943Cy4IgKWlx
         ZlHmSGSueFdCVHEUz96fnqINpZSLBncCeHvl9HmKZswoNshmrGeFwjwxR+1H+NHtREbR
         a6Lg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4XhGsjs1IJ5Tlx92qnZQ0c5/c7wpNGyYFPLpMX1/KNhdKuttTk+oDtrPKQSw6abzrUBbAaa9QceXOvGj5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0lER2qXeqZFm3gvqiyEwDU3PYd1Udcj7I1dqK0IsdsPZdjr59
	XlXFDhr9BixHdHTovClS/e0DKQ85nfFeaR64+P0f5E6p5P1Zz3cAAia0spHFUu0L1rsTyBJYxV0
	r+Hhz3IMmF+ZUpM9IYbXMnROnQrMiyjsn2ytennmNX+qxZUUQuovjsoYDuqvZ+u86AqlnPd5R4W
	SE
X-Gm-Gg: AfdE7clkq08nNyiWluC2jiAmhK5KcjaJyshsa4F+lIES8RCyS6be7ynJOzdodqARgNe
	08tRcbpuXHwu5kyjFXIVX7jHKI1PYJYscshvnjVxh/Tcp15N2xWUho0wsLSayuJgwBSS7b3uzB4
	bkgbpPUKnoO5laIi7A4wEaEe4DFXGMqKbCV4n7CzBmf1BwjIJuWFtDvRmFlQsR5DGtKtAY4zh8z
	x1wLvk/YrjypHFltgPDCmH/xwYTvPzcLNo9IrTChav8A66VTXhM2tOcYap4ZgzobZBIr1QdVUiV
	upFC6wNMncy3y4jy8/p7Kby/O8nLeVgs4nXZQzPPEDkNX0sxysb0y7VAH2gv8e+vREqhBmUiM/R
	ri1ty10xX39SXdff2PBE0i92L
X-Received: by 2002:a05:6122:3a1b:b0:5bd:c11d:ecd8 with SMTP id 71dfb90a1353d-5bddf554a1amr971926e0c.1.1782923481783;
        Wed, 01 Jul 2026 09:31:21 -0700 (PDT)
X-Received: by 2002:a05:6122:3a1b:b0:5bd:c11d:ecd8 with SMTP id 71dfb90a1353d-5bddf554a1amr971842e0c.1.1782923481252;
        Wed, 01 Jul 2026 09:31:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm1077874f8f.15.2026.07.01.09.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:31:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/3] Enable ADSP and CDSP for Glymur SoC
Date: Wed,  1 Jul 2026 17:31:12 +0100
Message-ID: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9d5sMDPfjKjWW_RkG1tt6fIHtXnkrn5t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX3jjY3idRP/5Z
 ZFMkXT2JnxHLPRdYBVnr5/O8Tyby7qaF0Pj7zchmpu19CLer1rcEj3giE8JrrXlNFQhuAr/rm2y
 GscoAxe6PChqeENroMqCT7yZlRuaAoI=
X-Proofpoint-ORIG-GUID: 9d5sMDPfjKjWW_RkG1tt6fIHtXnkrn5t
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a4540da cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LL2NDXCyZq4GGRqjSbAA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX5Os08r/0Sdns
 IOpriAISBKgs4WFdaXkVR2ATf6dsJfzgSiaA3EaTHlDKlqFBWCvv55QKJRGuPR8PTP4pZiItLOH
 ZCP2cfZshbIsB2e2Ii5/2+0EQxnuPvYcUJ7xVCQkZjyNJ6YxFmlt37j4aNEb8fEOS9nd8Qdar6V
 fMsQ3AFnTSD6rFt6gU3FhRzmY75Rc/a3Ywf+4aaVVDsDOnhokOFNIXS5+WCjEB2Hohg4vmepxw8
 AUjPpMru65l43n2NPZx8cyzVnHWlb7MQq2fuBw7i0j5HxmfYvrMA50+drmuDw4wSTwL+2dAOIuP
 LLZqlfazpfyLZNj/Q7E/YxAy4eMe8yzC02kYea4gEc4cTTGiYGHFsv1KkgGlTCU4+Rue09DTNgL
 ISO/C8aYSm6fqvrCyT2XUUOvNg84rzp8cJ/UsLwOp85o0TAiCPaIjKZP5qIF6eWxMdRnM2GyXmL
 8S5wKbSW/J4jXFmlnzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-115761-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:vkoul@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:prasad.kumpatla@oss.qualcomm.com,m:quic_srivasam@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 076426EFFBF

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v10:
- updated commit log for bindings to include glymur SoC
- added vdd-micb-supply to DMICs in va macro.
- some of the Sashiko AI review comment is incorrect as WSA codecs do
  share resets.
- Link to v9: https://lore.kernel.org/lkml/20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com/

Changes in v9:
- Include a binding patch to accommodate the data port increase to 17. [Sashiko-review-bot]
- Fix all double spaces in data list present in qcom,port-* properties.
- Fix routing of WooferRight In to WSA2 WSA_SPK1 OUT. [Sashiko-review-bot]
- Fix all incorrect lowercase speaker/dmic names. [Sashiko-review-bot]
- Link to v8: https://lore.kernel.org/lkml/20260520141828.2724689-1-sibi.sankar@oss.qualcomm.com/

Changes in v8:
- Drop bindings and remoteproc nodes since they've already been picked up by Greg/Bjorn.
- Fix SID duplication between gpr and fastrpc nodes. [Sibi]
- Fix Incomplete DCO. [Krzysztof]
- Match model name to the one already used in Audioreach topology. [Krzysztof]
- Link to v7: https://lore.kernel.org/lkml/20260331032121.1279203-1-sibi.sankar@oss.qualcomm.com/

Changes in v7:
- Rebased on the latest Linux-next
- Split patch series so that Greg can pick this one up so that
  the dt changes can be picked up by Bjorn.
- Link to v6: https://lore.kernel.org/lkml/20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com/

Changes in v6:
- Pick the audio series up. [Srini]
- Pickup Rbs from the list.
- Rebase on top of the lastest linux-next.
- Fix up address size and other misc fixes. [Konrad]
- Fix the ordering the various audio nodes. [Sibi]
- Link to v5: https://lore.kernel.org/lkml/20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com/
- Link to v0 audio series: https://lore.kernel.org/lkml/20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com/

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

Sibi Sankar (1):
  dt-bindings: soundwire: qcom: Increase max data ports to 17

Srinivas Kandagatla (2):
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 .../bindings/soundwire/qcom,soundwire.yaml    |  20 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 110 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 263 ++++++++++++++++++
 3 files changed, 383 insertions(+), 10 deletions(-)

Sibi Sankar (1):
  dt-bindings: soundwire: qcom: Increase max data ports to 17

Srinivas Kandagatla (2):
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 .../bindings/soundwire/qcom,soundwire.yaml    |  20 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 111 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 263 ++++++++++++++++++
 3 files changed, 384 insertions(+), 10 deletions(-)

-- 
2.53.0


