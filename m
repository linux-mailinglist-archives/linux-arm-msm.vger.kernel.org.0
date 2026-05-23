Return-Path: <linux-arm-msm+bounces-109470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEHCD41rEWpLlwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:55:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 871525BE092
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F83A301D077
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 08:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8CB37FF44;
	Sat, 23 May 2026 08:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL/CBudX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brTCmbgj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3F437FF57
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526523; cv=none; b=FGTuJJOMLVKTTyLaLVGwyLPFaeYpPftxpj6LetNhZvNzGI4KUgco97mjNrQF47a0Gw1w3du+K02p+3gAKyXuHYfXNuEg/xyNtDPfqLJ3l/ExSIZTd2sz41c6dNZYuZ8PuiKCyBw9y4rcvukr3ZbVVZUMtkH7163N5nSJfdVu8eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526523; c=relaxed/simple;
	bh=xc680dM5PweEhoRtY3qXfnRTWULbCwzK9xBhcVssxNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ub8nWMVD4RhoAzo2PffbF8zz91Q224lu3OUM5tnVIBl06mkjFdIx0O5u3fMY4VtLR57P4uuHnkyNgQnjLWV+1kfk+TWrrAieiuM6l2NZJhU5Fy1bKrUMl1gxbhqz8jFTrGcQ6Tgt4J9SK+BlLGKjJArQKE+oGh3hSYsXiGKwxfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hL/CBudX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brTCmbgj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N3jdCI735221
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8vCAQQ4HHKc60SHHB56+Atg6iiA4OSc5bN2
	Ck42SV1Q=; b=hL/CBudXJkgaJPLqH6h8kWw7xyrsxNGQ5ejBBBCauLcRKkFjX0P
	FIVH8X92JuW91CIJupNk4c0+wDoWQJFpMxi2f9lZCUQJ/vG6Af5t03Mkor/LaC8E
	dSBaxS4TUk0IfIm3EJ8exrO7o7Za+5lq737COqArWfXDdgk2kT35jANtLJ2z/J0J
	kxvlXM1JZKWyGt34Elpy1VBAcAOLwtLH1O4ErEdKDjvwVmA3ZUJU4qSgZQ7weHla
	OK3HK5KOv9yeS7iuC0JwM4AnAc5Y09P1Z2nnmRXhKNbSU6NCoITT+ICXtOnk5khI
	Qn8Rfs+wgatDcK2dbTsCPqfimvVbhKdnAsA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7ggc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba718173d1so140266325ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779526519; x=1780131319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vCAQQ4HHKc60SHHB56+Atg6iiA4OSc5bN2Ck42SV1Q=;
        b=brTCmbgjCyIx5K15e25n801HX3VsF/Kqid917qtedq3fEBHif7RyGV4jOrbY/O86SK
         cHtQ2fSLUl5rYizt+7BvG3w/kcilt9Sn97BWSBdcaSdZcIw9fULLvbvYNq1/5AGeU5OL
         FX7OEfc36ylqnfbK6TJgx2vHObBMGbMvdBgqAC8wXfH50HAAUdo/DvAZAowUfPP0zc3d
         T/oB16n3iezT40AV52TL3K4yYiyyR8yKPoT7vdvH2Fnj0TBai+9xeRnZrHv7n/EOm8Ek
         EKGh+cJaHnKJCrsobmfdVaOxC89oVEkqfAesbUvggPovoHDh4WTjpxhWOlXNV/Dyyz3M
         /YdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526519; x=1780131319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vCAQQ4HHKc60SHHB56+Atg6iiA4OSc5bN2Ck42SV1Q=;
        b=QrEejLYJ3p2WITdq8EorkV0dZ/4YFNqj67Fnns6VmY66OhNwyn6tw0woIg1ONFHP8d
         qt4uS1XA4jW6+mf6rYz6UHJcdGWwUcHrBhahzQ8w5C1F1mP7mdLU0/EdQMPjcJuhNnkD
         rKeQanU2pdDyhYBt7H1uLWdNLjZyplS8kaMORMZ7Yck9PCMZBotaq4cs7nZWbetr9Mta
         QIg5XHSFTuxiD+zVbsmmA5XXxe57tkvnRitEBm8qWguKmd9hVvqXDDZoE/WPkVch5+UF
         no7edCOCzpzt114oAYI+rNGSTlbDZbDrcHAC3f2QUmzzOwYlFXHJR1uoJyPW1TFXRgEi
         602Q==
X-Gm-Message-State: AOJu0Yx5rDmh4ErrWdKKPfK1WUEaTTZqRl035w168o2ObsLIvTB3F+u2
	1JhsN3fyhzXDif4f7txEPT83Knjdi3B4ej6kfywB4kYgwP3Awoj85VsFBHzPhdfkqqNDkH4cOhe
	bbPm8UwnYjzkgtJ7yRQI4LeAkmYvkZc82PbOAhP/Sg+ZYP+D8kWCW4dIMyPl35H8DwcEx
X-Gm-Gg: Acq92OEyDz0c1v/1KIm92QwAF6ZjKCBlMHrMYhsDCBHcW1LvufEzBZf2eTzj4Q/j9ds
	5+p61duf6mVKNZpecHvgIZY3oXRRWaB+ejWzQQLP9RdqmDoTRKSOBN1V+lrhBKo0Zv0RsKef8JC
	5d/LmKG56gqY/PfQiJVteZyPccYSuboxacxx15vWTHtLHnNbwgvHj+fr2JsGwCKQIAPyhfofMBi
	bVTYvmm144RUYk8m8OFy1jMF+6EjVPNBIt4VcLZPXBZz6l7vph7CKh74PtyyIuuEIQJeKD/JZKG
	M9ufj0l32XIFctUWJVN7KAyjIRQwxOIawtjmmdO/03UOEW5dUQZJye5UTNX37sg/o2NtpB6HIaP
	KVBQ+/nQ4CmeAu9+Lytt68UB4Rlc7vRZZjLSQ2F7lZU5h4bu3MGiTI22GEhGu3SNeS88IZUzh8z
	DTNHsNSKOytkJ3THCL0SUm3zIJ735VS9qFFVDh
X-Received: by 2002:a17:902:ef11:b0:2bd:d7b5:83ed with SMTP id d9443c01a7336-2beb07001camr81490995ad.39.1779526518865;
        Sat, 23 May 2026 01:55:18 -0700 (PDT)
X-Received: by 2002:a17:902:ef11:b0:2bd:d7b5:83ed with SMTP id d9443c01a7336-2beb07001camr81490675ad.39.1779526518344;
        Sat, 23 May 2026 01:55:18 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm49105395ad.32.2026.05.23.01.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:55:17 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com
Subject: [PATCH V9 0/3] Enable ADSP and CDSP for Glymur SoC
Date: Sat, 23 May 2026 14:25:08 +0530
Message-Id: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uoF9t6lEciokviJdrp5T4DHoolR8rhb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDA4NyBTYWx0ZWRfX2pq6Y6P2UHwJ
 uokVTXEL14Hi/xtWQdJhd6a5RYyPWYf9dO1PfFv/iE2/v1qjt+OdSbVenrtjC/ecWx3JJX0sNoz
 ApiJpPUEcmhK6PIoURHsOLgMq/CYX9/ulAteWWhJgjEWaltw4u/yBG6nhw4UwvFByvbQYhW1y9F
 qyHa0SEYgZWdwUjfQguXmnuNFwNDCHs89z81RBJ06p+ZalqQsiGdicaUdZvzx6m5IVqHzKh/dFl
 BY2Uf2Ye5gN+rYopaE0sJhT5H75KFN7/md9Dm5OuQGz2OvdHLwMxnI2W7ywTIvJbpJ2kbpT0zMN
 WKWES38J6masQYLGNsZ3wQYDeNlfobGR6yO+iGEbLsZK1cVCQi25BLWkAudjuBcbqwxhkZZ5ed2
 OtFHlc+urSvlx1MnM1hqkIOAYxRqUbn7oZ+q82Y7J0NslBN6GzPqj5ThA8h62BAgZO1CEq3yZ1g
 qkPzFVEd41jbFsCy3Tw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a116b77 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pC0kQTKkh_gLwOHhAVIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: uoF9t6lEciokviJdrp5T4DHoolR8rhb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230087
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109470-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 871525BE092
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


base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
-- 
2.34.1


