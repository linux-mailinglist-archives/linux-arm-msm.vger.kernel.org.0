Return-Path: <linux-arm-msm+bounces-99777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOdGBhRfw2m1qQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:05:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B37831F6F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95E4C3121238
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9D02FD1B6;
	Wed, 25 Mar 2026 03:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hG8HmLWY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/luSLS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63F32E762C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410834; cv=none; b=uvUhpMg3vh5173qRvpr3/dXeDGildimp89eILmUIxkClVrxzdF24N1iutY6J65yKDGJc756cfqVkjZKN2a+/I3KdEVWso6XRBSEa9AjfaMbadC3TQHRbtJebX7JNJ53v3/IoYss4HuBor0e4Tc/Dvs14dFMOf8+Ng/ejYKA8Vjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410834; c=relaxed/simple;
	bh=mDV121ELhEZSnYhKnrHW2cQwwTPWEQEVd0r6IgjIIl0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jrUiakJFJ3dG80Hdq/mntoc1EdzbDjFwtJoxxaCmXfdkjDvndZ0nfUkyj6CinCxTDk9iFNeg+lLeeXbtpAWsHL7fSRDyiYiFGaLtln1YAoq2OoBb2P6tuqzravMYcwpArz+BCazmcswmOKThnfGWrgfJX1gO+bxwLB99iE13RjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hG8HmLWY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/luSLS/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P2JGq63057481
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=28PMbL2jvquYr9ww9Imwe/RUFpb6JBePIL5
	+Ewjv8kg=; b=hG8HmLWYLHq8hViQWi94tCFrHkP1CzBBWZF42wbEHLc+rcgm1wI
	FbsPJACY4rGrTsfCjT1SvIcAqmRYyYyeP7PjVJ25516/46jWMqTJb6cksWKFpYAK
	2nw/IgzFxSXnvQX/yuDFOP3jZRa7YoCgme/J5GQF8XM+Q1k2pfV8KE7JqfZZ/wxi
	U9HGKUXXaEo3rhqibj17fcQQkwp0hUKWajFi1u2v1PLNTwgm8doOEQQ0pFjOca1S
	vN5AIogOWW0+f8agZ3r5hORjtk0hhG6FRqff/asfD461aimzZBkvQmkxTQnHR3bu
	VazcLBgz1VYLmOUAO2BHXeBYZuDsJcHgALg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp08sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:53:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso3879019b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410831; x=1775015631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28PMbL2jvquYr9ww9Imwe/RUFpb6JBePIL5+Ewjv8kg=;
        b=e/luSLS/3supxC9fLUhKzRVReoZqXWDPDfZZXQFCOAwtqL3zMSqofB/5IXSCiGWDxR
         hzUdY/TnvTskQZ/fFe2ZRLH9gjPDWh8fmW0J8ZEA8AbqVUsTiTj3zb9oRUB0aVGBmri4
         DqdmgdCmZ4/3kpp/XWleKuItOvawP4fUHE2RyBSB3BJEV2PVairwwIVLSmOMBunn3R/h
         hC3l6ne3JdkLUSkP8jJjtcteXHUKxdkOLnxGrZuYb6guO5c0Ft04tiZIZs1cxB+pRArp
         UZCqs4DEF5josZll/oV+Qt17z5KavRxzNKJ+APezSEK9Ui+FkwDZQTy1uGVmC9RlNjAG
         klvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410831; x=1775015631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28PMbL2jvquYr9ww9Imwe/RUFpb6JBePIL5+Ewjv8kg=;
        b=lYXA/XHD96Dt9gBOO7M1NUKcE+8UNTeMC3lDMO4RCHmpMixBWhINZOe0PSw8waE8Ws
         lLZBzOwlu6qHrnpWHwe4DvPXBpYI7njVIKSj2EWlxJXyi2RxJsJksS+MWXOkRwuTnko9
         OVn/yfrkS0cTFDeThl9eiR49AtQOU2nUoH/oLn7laWa7Qedk7gmWTfzZ4Jzl8re4vXtk
         qtOJ54AaCxfrAceNcCtD9DqUj404oe8cIELDS2syvUMhTWAUcA0rd6XP76H2X8VEh+3O
         wtbMb2YcEHBPUCzlxXCzn/NR7fC6HNhMVciK8o6YQysxVo1HcmFrPKIBYA2QTjc9lJGD
         R0rQ==
X-Gm-Message-State: AOJu0YwNbsqlw+oTSXizlcp3nriT8uUou55GThu63e2fi5J4rm2Z1+WF
	LWDW5KvB+6HwJbr26+kcQLLQn37t9ih0xVZlfb7bbh3z0TrQQeer+pWP9Xej625rOeApaI/L/3i
	xFedLbdKkHpjwHK0NZbjSuRZowMjOHNn4vxad32MS1Fiy/XU03/dKdp/ddsAycQqDgtoVbyzLHv
	qZ
X-Gm-Gg: ATEYQzwre3bE/I1JPffq7Cb1RmZ8oTh3Uy3z6/lQDvG8Jq+Ljyl72eOhhIeBbgZ5579
	TkNHAnoFv3iMumUtc3ZB5y6yJOWjxlXx+JxOYbc9S3rp/iCrLD63VvgA2d4V/acn5NXqg5JC+1P
	MM9bavLHsN/2BSgW0oaaADHJkXv5szpLOXRO0rDPhSXoef2NEp4NLjg5FsapFbklccUTo65wx2z
	ZnhFELu0J4eM/1bXPCNksXPUv/Mezemfhg+pU1KUeuUgUE+ftFopfzK+riErToiU0qLVli1Hipn
	ScG9NCKqw6/N/9vy6gw9AvQDGioIzA9fkhAzB5fG1AGh14/V8MbPbtRq51cQ6g10Dd+Nh1Svhy1
	oHK80zZsUK6hJ2drzJ1tMX/np4Hl9SZ4Xhe9BEcWLGaiv+J/UXvdfRQ74ZNHyJPllEXuXeL7ykl
	1qY5g7AscvalicJQkvLw7FDK+Y9h5ClNsf8efM
X-Received: by 2002:a05:6a00:3d0b:b0:824:188b:c173 with SMTP id d2e1a72fcca58-82c6de8582amr2084374b3a.5.1774410831388;
        Tue, 24 Mar 2026 20:53:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d0b:b0:824:188b:c173 with SMTP id d2e1a72fcca58-82c6de8582amr2084349b3a.5.1774410830885;
        Tue, 24 Mar 2026 20:53:50 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410870csm14220689b3a.52.2026.03.24.20.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:53:50 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V6 0/5] Enable ADSP and CDSP for Glymur SoC
Date: Wed, 25 Mar 2026 09:23:33 +0530
Message-Id: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7t2v6FdDKFGRlT-z_2LclpjeHc4Ju1iQ
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c35c50 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=9v-nsc7hOUgGWHzJVNoA:9
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7t2v6FdDKFGRlT-z_2LclpjeHc4Ju1iQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX868zs26sSe4D
 XOrK0ZbJKeTtqZ1Izp1Em+vz8qm5wGJCSCodL/rIGeHOrzIpwEbEu5G0FNTCpLSTMCvjA9wShNp
 KgFxgGjprPR/KE0IcUkPmtIPD1C37W0QLkAhq+LDsUqIj106nTigibQyeOXx/XiNDXd4uqKoBZv
 vy94yuhBfstFXTV+Lp3OTq0BZMbeNAynmIUf0twq1oDXqNdmuaf9MRNNvesich/oXbp5PMvvYlY
 kxFb+UIrZc34KpD0MUoFRTV7qEVv0yjr1CN9FffF5BwIGb5OkscSuk968y+V5VQJNfwXxDcYptU
 oItKXyZzWZpRs1YUe9UIa3ixtTDoc5g+XFnDCKbz3HgF3rH94WJJ94ri1wEKEMXlsUzk+sCbXuc
 sP3lFkv9CeHHMYiooQ/30KHPe6OK4aRZQKfWuCvF7gPFh1rKqtRoN3V+x+O0aOHrzc9wZ6rNdxW
 +9mEfmgwvZXgnLI2Peg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250023
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99777-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B37831F6F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <quic_sibis@quicinc.com>

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

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

Sibi Sankar (3):
  dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
  arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
  arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP

Srinivas Kandagatla (2):
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 .../bindings/misc/qcom,fastrpc.yaml           |  11 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 124 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 549 ++++++++++++++++++
 3 files changed, 681 insertions(+), 3 deletions(-)


base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
-- 
2.34.1


