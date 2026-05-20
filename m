Return-Path: <linux-arm-msm+bounces-108766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E9aOaPHDWr93AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:39:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F8E58FCC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A5813061E93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E46B3E7155;
	Wed, 20 May 2026 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEONiNEw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJ8AFLgs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21B3E8337
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286723; cv=none; b=RidqRp47M6D9MkYS8TApvsRegN4ITDbUY7hVFVLE9v9a0iqo+QKuQfiHhaGmGN5CiPlx0kjQA+2AXmAeuqpd2/ermif4LwaVAmNSYY1aLYjrBqesCUgKAf+FrYqTyFwKsBcnIBxbajFLhN99GUqbY8jbPjPwrrBpH6g8jI4J7Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286723; c=relaxed/simple;
	bh=WJud/LzUXHpuZnvmDnaaNQCWHb2XT5oMZj3y1B4DnHA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oEyaP78NKvgw/5TCIuObDGmF0i7/+aQtwNGpy5PBEkOUjWqoClgv4uucddY5ChqEYwikCWhDH32gjlY66AzSSJOR7tK0fXvMiOYYHSbu39Idceoiadg++ce7dvReC46MUavcKHwqf5RaffnzRCLn4YM8/dBWNdt2fXhcThr66nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEONiNEw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJ8AFLgs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lhHA267052
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Uz7tDg3ey8acYtYjEq8oOd5DW80KoUUi9kI
	sP4bdi/8=; b=eEONiNEwzUNSNUCwpBRbHeHyr+P5mGB35dBF5TtVdNmEH7HnbQZ
	hbF4uSol8c999Afy5lZ49Vk+2U4t5TgpwGb/n4rN5nUJ1uRot1L2lOXD5j1hcCf/
	zW+2tt7NVSRI86r5wSnT3XDfVCttJxDJBAZacvaVBC7AIXgAc0cO9LJKw4gErxR3
	Znov/Du8a09sPJsCt9eU4OemxFkSmWAvyO0sLNB7VCfHRQlkf0wk7f0xC6if4/3f
	liRQCn4mBuWMU6WaYhzaKIHmWEquxfm6od+Dh31NUA22bxsLMvaxyvv2EXaH+C5x
	DiU0oo1cKKeY9gnpPNGd5XVpRicXDSE8U0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxry8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:18:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83565161a6eso2487445b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286716; x=1779891516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz7tDg3ey8acYtYjEq8oOd5DW80KoUUi9kIsP4bdi/8=;
        b=MJ8AFLgsZNo4okCz2zFjVQ5+uNM5EgPFfQm0g4A+VMQset+7h9+3/fzqzl7ksOrRMc
         K4eCmAnJvFgArB7nDmCaeG5X+kzSHvM5n5ugjYuR3WBRwuGJ65SZjM1MN5i6T2MIESC2
         lP+rWePoC6gCN8oru7ytFb5k2S7saJ4B8PbNQIorH05xEktpwQP1jNf0Dax7SzZMilqS
         LojHw/H91P8oVv3s7aGuWwvhAYnebswOZwJpNCYGHHrsGLJXYNEc2AgnNpaxRYK6DrZ6
         Np66VYxtgIEq/AP0t5BtW6nFeWO67flH0jTfxRiA5+BJ/STLiuSrmNDr+87uQbQXx3mo
         1t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286716; x=1779891516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz7tDg3ey8acYtYjEq8oOd5DW80KoUUi9kIsP4bdi/8=;
        b=rqVCl1i1ovGw4Udhk8/4q9mdj8YiVcVQvsepFKueBbpQ9AvvTENbSSfEcXh2SuhzVe
         QppPyWqrXanAtaQWXZIeafdwqH7/U2BeNlTn3QHafq5vllHqljJQwoU83NP9jzcTSctY
         JP9gZM5FQqcNILAw9Xwg9/TXHjgxNreEsFrQpmNv/SD+286h8nbAdTjvnfXXFCKG3IS8
         1HjKu21FM0nhlCgKuYjbJk7DVu+QK1tlZ/sfS9VshU8lXIBjb+3FCNFlmB8vE+6yOkgc
         UYXQZM2OXX52sPtMyi7qw1drO9W+O/SV3RYxbAbD8UxhLONY+BMzFEr6Ld7oguZchuMM
         3SUA==
X-Gm-Message-State: AOJu0YwFN4Hd4iT63r41C1ugpXe3ACsP0rh9xmAtJo71koYeGr7baf0l
	J0WZkF0jh4uNJ8ht3OdjWik3IXPGucXIs3gdYnlZy3veEqmAftwHD3PPa30YI1ZrYzy7wnRLb4v
	CU46voeMHNRtPbKY4Af6+3cLMXOUFxNz9Qjaf0Q1GZYZWNJJUxlz2m+Tf/sQ426WsRHOG
X-Gm-Gg: Acq92OHtZlAeok9gGwkQ4eZUr/lvcUAsCBjijTMlzls1Txnqczxr7hRA2GQWrc++DsF
	yvU2e85zPwUE5EqHtoVTpkDAPq3iFrjHn+MiaVQWBHitDBEVvjx9hrqIMNHqOp4DUjMXy0LX7mw
	EjHAWuTDNREsqSIEQswX2qqaKo1fSlsDhNPl6lNpkZedxTCajWPFY5rHz1VjvBA+abx7/Ex7nnO
	W2MLNdmuHOFKpLq/4QBlYiwOtcsbh0GY/270zOf+RkjVtDfZfkzhqwDzyG5eFrxUrFR+Y8I9b1F
	fb+zGgnH3vsT1buOdSMMZUdacAyPjwvyqgDcTqvMKt0B4Np0t6/F2NWMD3HVQJdRZTh0V1HUxjB
	jcg7DTCIkU82rICYFOA6CBpJUv7ZH9og2iFb8A3DVrzqrT8I+8OAAIrvAoME1Lyl2sY0SkQCghI
	9HaY6FMzYYToPTMDSpKnS8Um6HRXGuA+izyoKx
X-Received: by 2002:a05:6a00:806:b0:837:8342:abe5 with SMTP id d2e1a72fcca58-83f18e7709cmr23766515b3a.18.1779286715857;
        Wed, 20 May 2026 07:18:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:806:b0:837:8342:abe5 with SMTP id d2e1a72fcca58-83f18e7709cmr23766483b3a.18.1779286715246;
        Wed, 20 May 2026 07:18:35 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19775c97sm21990803b3a.15.2026.05.20.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:18:34 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V8 0/2] Enable ADSP and CDSP for Glymur SoC
Date: Wed, 20 May 2026 19:48:26 +0530
Message-Id: <20260520141828.2724689-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JuMu69yi8wUqApzMWHax47jBVztQ1_Tn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOSBTYWx0ZWRfXzJhLOTPc1ief
 al4p+4ovc2EaWsomBnhTX7ZfBZc01lKmwp0F6Bu6QQudo2/EHIpgBlmnthPLvTbZ5ObW8wORO4L
 NpyRhksJJ3mkf0q5o2TKKJuSJ7XoEaB3Bj6s8JEEqcZaDDhNurbB77MRUzezENsybYvZnKPTpUF
 DbxCWlp16iU9QCFt7nAnUlVW3m2EC+qq0h13T64e7+QW8COKu8jzteATAnyxvnXhUTjGTenhLcw
 0cuWdQN7DgyVRdypFBhF6wCxAZ1cRPBVzy6dcO5UElHT4GXtdc6Pg6XjJoZLJiWzc3XXuucl5IV
 coqLwzTXnBpTnX44OHM5OJ5L0K8HgnCr0js0rMCOVo4vOo2m1f3AHW3l9+VllXU4/fozaYVC4Fn
 7ZWzau3DMXZ9wU3vly63jx5RDFrQt78vqirJm+Rsk9oDJSRNGsl9eD/pNYog4IS9nP5gWc/BIj+
 JRP2nncZ/rLTGKB+3qQ==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0dc2bc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9v-nsc7hOUgGWHzJVNoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: JuMu69yi8wUqApzMWHax47jBVztQ1_Tn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200139
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-108766-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55F8E58FCC8
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

Srinivas Kandagatla (2):
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 110 ++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 263 +++++++++++++++++++++++
 2 files changed, 373 insertions(+)


base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
-- 
2.34.1


