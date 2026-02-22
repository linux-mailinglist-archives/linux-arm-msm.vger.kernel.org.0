Return-Path: <linux-arm-msm+bounces-93557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JzyIYE+m2m8wgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 18:36:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A01A816FF2B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 18:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C05503007B17
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 17:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA1F357A3E;
	Sun, 22 Feb 2026 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3s04kqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AB/wjaaY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5343023AB8D
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771781755; cv=none; b=cI8YLcYWhU4MyLtqBpeVB46FRI2NwPY1pLwRyHUPCyY4u5o3dqd5Nl5oQDacJL9yrV/qSrf4baetPJyjyktseIoiE2omXmMhgG2/IYfE02HHh2U3lg3wpQnJw57qA+KIqBkwtJTbuOg+e9hNoauc/vmFPdnAOsj7F5TXJBDFvxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771781755; c=relaxed/simple;
	bh=5DQuEE/m0wxOPzya/s2DiLZRERBDyu4RyD51U16bErA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G6f6LYy4nKImJ3Muvb5Arg1wlwU7mVJWPa1VcK4ixgrYcAc8B2Z0V73ow/SuzKWNONQvFo/K60r0Esh0/tSC3s30IQMeFSIA3fYAA2ZW93YD8ru/R63XRV+v3TXLTal/C0SyUI0znF2FLlsMMOXvIpS9VAoxqP7gzyCNS8ArUoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3s04kqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AB/wjaaY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MGe19u1508139
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 17:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bTf/TmVCtY/Ti8nuspkKuKqy+2hnTWT9LA8
	pDciWTK8=; b=S3s04kqTarX71KS4wlt+idMKFqU+jl+mFvIv9Uxdg1CtDGr+Plg
	8ppxWm8SfNFJmFD+on30e7WNrGvLmXKG8k1ZqsNsCtUTtRfTKxrJW0XfS5KbvY+L
	jYqL+FA4CCvaIYqpJcrsnVyVwLmNCUfLAfwMtX2FPsz/cOSu3EsyHX8b2/oQX8sA
	nngi3guJuWTL/esKX5uh45hJyppcB38tYnBXgc/6twUdOs1mxmxVqigpd/QFF05l
	9i/96xCWpR7u6lgXB2/omKnDxQ6N5T/bgGsOueWY7aSSRowRGr8zjZu27MvmEr0P
	VQXmSBzqeeErHa6jamLsKTgejQ4q8NcXcgA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vujfme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 17:35:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-826c67a7aadso1648524b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 09:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771781752; x=1772386552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bTf/TmVCtY/Ti8nuspkKuKqy+2hnTWT9LA8pDciWTK8=;
        b=AB/wjaaYul8bqPLHe1JIsp+GkfDPPyzOIXlegbcNBZ/wv7l6ymVxmDWR0AcbnLCLnc
         B2S3p1ZrLkjFJKmhlahT66oaHZAwrJdeQapITNC35u/TgJeESZakP+uS1JCoIpdBpsHe
         s1DaY0zjcU7+M1owC3wER3qxEMmu+qZrjB2PMOB+V4zjZzzs3Ou2HGByjD7vsSyznXUY
         54C0UjV/WZ1AtKoL0kRTWD27GbJ/jrmHHsXWmBxGZTAuEltgnyZ8IJK7oqWQzIZoSDiS
         POl0NF1lTmUhRXftrjBSmC/OEEamLSKlxtxkFuLEpGDlsBt5E6pI63DLjnM6Gr2V6t/L
         Wi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771781752; x=1772386552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTf/TmVCtY/Ti8nuspkKuKqy+2hnTWT9LA8pDciWTK8=;
        b=gmyfyEjGxEzVNwg8iY5OyWtOWjDJHPNPJ3c0mKRHadXYZqfpc8tih8BOPBsJlhINSO
         R2J3W8RhsrsilxEtSCGucSwzeLrtUHgSliiLh4uixVVy3xE8EYCTcCOdvkr9q8DMM4TC
         EnW9fChFAskerO/PadfWNttunLXLiYFOH/OjzJ7BGC9A/PCjke4RpR209wFpQEjHtG1z
         O9tW20WylEcp0jz/8/qcjCNWXtBlApoXmYYjEej8aXm//Wq/lYBFgXk7pL82GJQNz5wM
         qHh20+34DhNQWGK710zO3VRdHeTU+XNjZ15EN+KKrt7o3wvyIVg0rxisnFqv6HvSvyoH
         4xsw==
X-Gm-Message-State: AOJu0YzXVDXumIDPetUyBs2UpnfSo8n6JtDH9w60nW4KWqwoqimNIu7w
	P8H3rWtZ8TYVfr1x80lT8B9aFG9xZ550OjeS1jpeIHEtmryEmuxZ3bphG9QeiXCPKWqLSUpjd4f
	sqY/p6UegGqiQrgOgEPNz6GULIXF6Per/s/Eo5osBqROC1pbyG67lNKVR+wjH6h2/vKGM/OhoJg
	RA
X-Gm-Gg: AZuq6aJ8o+9VB5f+VrEewi16aZRVgZEdFiYe/KsFBm+BBJ3JzGdBkxv04eJ8VZwNIuM
	1QCC8YtABnodtJS2/2vAwI2tL8flSGP7ue9Xrf6epR2uk+Dn1s4LKdu24Qqnjhr/DNvOp5JGUAv
	VejeMGnHldR8WMNRq7CdFc4QwVblXEkj61i1ZuSpTc27B+ktNNcZ6zEewxUS4sy+Y+iEvVgu5Gs
	zcFRpdWEnBRqzhyv5o353ElOYjQnwJyU8arayQuNpqxuGQrIlhGOolBsETR4GbbgQwvob32uUSN
	nvkpk+ZhbE1PHYW5VkGPw+rZPIAX5WdHo1Sx9CkoNU89areIwSZs8sPCTTEeB+jx0ad0cceCJlX
	JCXeYQ7kQanyK/2wSiBYpQAvyIrEuJsFOQfuX2nePo4NmejAkjr6d
X-Received: by 2002:a05:6a00:2354:b0:824:cb8f:2a06 with SMTP id d2e1a72fcca58-826daa272c9mr4035357b3a.3.1771781752165;
        Sun, 22 Feb 2026 09:35:52 -0800 (PST)
X-Received: by 2002:a05:6a00:2354:b0:824:cb8f:2a06 with SMTP id d2e1a72fcca58-826daa272c9mr4035345b3a.3.1771781751664;
        Sun, 22 Feb 2026 09:35:51 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8cbb02sm5193757b3a.57.2026.02.22.09.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 09:35:51 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH v2 0/1] Introduce Monaco EVK Interface Plus Mezzanine
Date: Sun, 22 Feb 2026 23:05:44 +0530
Message-Id: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699b3e79 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=K9Lqolnw07cf1ahGGkIA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: qWm22M1NcDBTcYuhAsSqzv7tL7cs056s
X-Proofpoint-ORIG-GUID: qWm22M1NcDBTcYuhAsSqzv7tL7cs056s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDE2OSBTYWx0ZWRfX6pgzl0lAi1wX
 NqH/6tT874xNuxJJsEXRYPVJSGcy7w9bzpW8rcQYxuPFXam9xi2pE4EMrCdmMNb2iO+Aluhc8hq
 SoxtOBAX5kk2jq0gXBPwWq2ge6pWyzrW988YYOVkAFkKKCHJBSXMWIaekzUi4MCyi62EyZEXqQu
 SF7vtOJD6sEd9ie3opc4mHNn+GX3NmKoCaiBQ2OAYmaN5qxodfYXjWwPyGx/+daGc0ugW559zHX
 GoBTqzkRfvneqU2Osa+zVZq2zRDvnXRuowrkt8hw/qEL5tjX3Rh+iLoGCzlCJExy4CAWLRC6RMP
 Eo9Ms7XjEYzau0dn9U7o3ygNodkKf+qyHDt4/3Hnbf79LWfe2jeckzxQHLk55t/EKMnWv5aIaP1
 pCSrsZ5V1lB/K7zDXFBWIcoj0KYuq6MdJONnm2usvKwGfOtFU279392+Q+kvLC45TJyqrfVT/Mr
 +0JzPU3fKWaQvz4/06A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_04,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220169
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
	TAGGED_FROM(0.00)[bounces-93557-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A01A816FF2B
X-Rspamd-Action: no action

Introduce device tree support for the Interface Plus [IFP] Mezzanine expansion
card used with the Qualcomm Monaco Evaluation Kit (EVK).

The Monaco IFP Mezzanine is an additional add-on card which can be stacked
on top of monaco-evk board to extend peripheral capabilities of
monaco-evk used for industrial applications.

It connects via expansion headers on the monaco-evk and provides
following peripherals :
- 4x Type A USB ports in host mode.
- TC9563 PCIe switch, which has following three downstream ports (DSP) :
   - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
   - 2nd DSP connect M.2 B-key connector for connecting cellular modems.
   - 3rd DSP with support for Dual Ethernet ports.
- EEPROM.
- LVDS Display.
- 2*mini DP.

---
Changelog

v2:
- Change the DT filename to "monaco-evk-ifp-mezzanine.dtso", also
  update commit text and cover letter text to reflect this change - Konrad.
- Remove "status=okay" property from i2c15 node - Bjorn.
- Remove "power-source", "input-disable" and "output-enable" properties
  from tc9563_resx_n node and add "output-high" property instead to
  align with TLMM supported bindings - Bjorn.
- Remove extra '\n' from tc9563_resx_n node - Konrad.
- v1-link: [1]

[1] https://lore.kernel.org/lkml/20260210103821.4169-1-umang.chheda@oss.qualcomm.com/

---

Umang Chheda (1):
  arm64: dts: qcom: monaco-evk: Add Mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 184 ++++++++++++++++++
 2 files changed, 188 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso

--
2.34.1


