Return-Path: <linux-arm-msm+bounces-116647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZ9CCDFZS2pIPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:28:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C1A70D88F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:28:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ggsDn8lV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gj/p0Fw/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116647-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116647-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E8B53089E5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA8A3FA5E7;
	Mon,  6 Jul 2026 06:42:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2393FADF2
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:42:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320167; cv=none; b=S4UbmqsBDTpvH2MvWCWk4726a76AJLFAMAQVhJJxJwgM9csF8w2Arou/+6dIMNojwjC0msIYR+kl3bcfizFK4m795xkbKtEzU7iCaCnfHvjP7Z6HVIvfm8HfiP7z9rfYKOwEI9m0zCCCTpdCZf1fchi8hfTVjWmjwkLBl+1+7SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320167; c=relaxed/simple;
	bh=lr07Sa1LL+bANOHURraO7areoYwhIVnfwu0qiDwHz+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BI5+1OEsixbiyVMl2UU//3ntZWR3YUbwqAgXq99togCeh6qiJ8v23zSWMIGOagETufZV2kSqxFI6Y9g+VnkCfwoMmNhCL865dACRNaIG2gHzlDwHeXLwZ43Z/cyYLLVfRkx7Xt52PUqlLyRLqsMlqi1YMogK7GUE16QjwFwiOWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggsDn8lV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj/p0Fw/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641cNv3615550
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ubG5dDnjAv5lWaI6kEtVG9gBsMiUc2gOEKI
	VnVftgdk=; b=ggsDn8lVm+EZsFfYH1nhjQVP/Y/r8XS/FoU7THgHY6NEJm6S5wX
	DvIdrCGc4QkRWHUvoDLFM7qLjKrDDJDZgGwPo4udtbLPcqzERi7OwUHBjLkyhMG5
	94jEemLRxjVf9viWpN3fysFN9XGt9IfJJFn19z5Cpf3uBELcnf7flB2xRP4mdQc8
	Utw/dKw5cy1F7QN6TN1RZOmj8eo7P6gHKKsqDUqFtutLvC+PLHpC7GzpYkrlG7kO
	29t8jJ1yBl30eRhviyh/vWdZX1d30lUAVfvBz5XWML2rCwGbgkmKvUMn2yhZIRru
	uyRbLh1GxBgtE9eyv4k8UlpUqwKVv8kCrxg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3cuqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:42:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so30584546d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320155; x=1783924955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ubG5dDnjAv5lWaI6kEtVG9gBsMiUc2gOEKIVnVftgdk=;
        b=gj/p0Fw/TYzfueMHuMd58vu4iU2jUeZZHxD8ZVx27vAxtveHPqRwDmIP0fqtW/y0sx
         q3nV3g/0SmRxKHzauk+MSTLPXY94r60MUVHiydRBhkc8PZ1bR55QFnidQMtuXtNSsKJV
         hCxPt2BPJ+Qr39PJEOtKtct1GjsP2Qrdx3xDxcbItedXXEPtn1FT8yGak4acH3kH6QiW
         /P7K/k5175aa/HDPnAJ+qS6rT99obILdwGPlQHRuK/FamqzV4PU93c64id3HaUAvunVS
         bJtEZPyi3pp2gGiyy3k05CP54MoCR+oRLvcQlRH3NC+7abgBoCD8IIToPvynoF3DKwZU
         e6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320155; x=1783924955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubG5dDnjAv5lWaI6kEtVG9gBsMiUc2gOEKIVnVftgdk=;
        b=Og5YPjqu3XWeKED9fYsM5MZOxhJWgDaCPE58olb+whcENAc7hYPZ5crYLxJrOxctTy
         RZEiblGmup0YpZxPfISkmV4KNNrXimDOSVpF1XxFtdy8xVmpl9sEdE0cuZ3ydt1G5AZc
         f1t24brGxS8ONDMPAW99jIfk+5ba8mw4jdNiWvVaGWMH6THZkH22pX7UUSKSWyItZvIS
         H3Cu1ekS1AyOTCPmz6UbmmDfRArshs1s+c7cNMhlH8K/ShGxZeYXD6q5xRLaomArz8UM
         ouSCHC1qkFYBXcbM3tUgrcXN3JAqQnbc9ZIMY6NpksIx07985Ie2M06q7tiHngRcJFkB
         1KNw==
X-Forwarded-Encrypted: i=1; AHgh+RpsdFPYW4ltesXQIOOcH8J+RkYBSJOxaEjy8uvky4YLnGQw1/Xbi9LAh6D+mm9NDD5U8rSSW339F0L4Zxn7@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkiU6n/HZOOxkfILp2IRJBumTjkrmfiKgpyUVHwdqWy146aP3
	89Qb8QK/pNp6KPXR2CJ6fhEJWb0sEbIk7zDAovWMKyqzGJPdFUph4mZB7CXkjcAJ6vZLGFd2e6K
	18MGiCag2Nx9Sbx34gt9tCiO20pbqSeJi93tbaENQ+m/UGmw/N9+KXKIW4mVQ4dPfvWjP
X-Gm-Gg: AfdE7ckBOBXRFcozUOdTA+sZX4ZZ6ZTRTFdwHt6FaCjq14hjB1RyvH9IQxsWGD88MZo
	JjYhvvU+/vJ/FZhM3L/KW64Sid3DaCSJs5dvHf8hSw+2I+iWX4yGvKOk828deQuGDOKr8GuasL0
	b75Fde7wsT/Xq3DlnYAoArP+aEkieLpNYiIxfG2NkWvQyrbdeQrIJqLk8VuzHBswPVtJT2q2106
	c35vrCJWuTwMpPDZPPIfoAPav7y2ysT//UxggjETzAWAwH603ILib7ebv7X3B0mV4lPwa7abAub
	tKMJ1XLFxVxOGVU2j54omRNO3+z4/il4xcZRs6zFme9V5zYAUuUxEKO8ITosrX2PoCECRUBUtpJ
	f+z1A+AtRxfMmIwtIr9q7hk0A
X-Received: by 2002:a05:620a:46a9:b0:92a:c203:471e with SMTP id af79cd13be357-92e9a344366mr1249811285a.9.1783320155130;
        Sun, 05 Jul 2026 23:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:46a9:b0:92a:c203:471e with SMTP id af79cd13be357-92e9a344366mr1249808985a.9.1783320154566;
        Sun, 05 Jul 2026 23:42:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6381e4fsm401457155e9.8.2026.07.05.23.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:42:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v11 0/2] Enable ADSP and CDSP for Glymur SoC
Date: Mon,  6 Jul 2026 07:42:22 +0100
Message-ID: <20260706064224.1328576-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NCBTYWx0ZWRfX7bPLsi+4YZaN
 nA+ccwOO5Gh+bvTGblKGi603iCs+nWZHUVswiu62V6e32IHMm7j07s3Zh2hCZnSx/3B49/cvy+M
 qRSBPBdStSmKnaAUJN4mbyeOV0UPP3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NCBTYWx0ZWRfX0C/ThgUPY0XO
 zEikCy79vvSkGv4enG9ywflGWxFR7TanLQOTnjFj0uNycB+9SH4R2uhs+ZFOco7W29sBLCKvTW4
 u0BSDuIF2P8yW0DpUwHTJVJKcmkjCRHjoVUf+o/3D9Ys0xl4iMwer9CYyVw/5aBWUTOEtIuGQvw
 yWidzFyP/k/llHE94wqE85DSftoik/NO7aanwl3OApxpsej3lTIOSQ9bKDdRNnF8ByDStAGe7CU
 OxOvb2S4FXnBNAfy9VivlkYfB1uulmzM5nOX99KIdOo4hv7CRQsmIj2ZM5VcJHYK6aCt7Us0PcL
 qt/ClH+TQaKCCFswXmFysjvyNZ9CrUvH5c5qUD0prF5ox7za7vqdn0BfsIoeUuGAmOvtVd+caz2
 TeKXG6hOaYihIr/JXmwwtfX5j0W9AV7zs15cHRKm7JLOCoug2Kqh7dH+5Knck2m6bbtsNkB+yhI
 dTEkjG8VbgDAeI8mwng==
X-Proofpoint-GUID: g2sQoKVukFxGLfiXkJk4bNJQbWoEb8E-
X-Proofpoint-ORIG-GUID: g2sQoKVukFxGLfiXkJk4bNJQbWoEb8E-
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b4e5c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pC0kQTKkh_gLwOHhAVIA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116647-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72C1A70D88F

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v11:
- updated SoB Chain
- dropped already applied dt bindings patch
- rebased to https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=for-next

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

Srinivas Kandagatla (2):
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 111 ++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 263 +++++++++++++++++++++++
 2 files changed, 374 insertions(+)

-- 
2.53.0


