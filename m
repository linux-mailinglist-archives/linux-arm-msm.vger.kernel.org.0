Return-Path: <linux-arm-msm+bounces-107088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOvtKL8cA2pD0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:27:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF25201AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A12F3016B3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 12:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1E7372061;
	Tue, 12 May 2026 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ll3KrA0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBR8jIxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDC739934E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588830; cv=none; b=PfO0nsOuoHJ67pw2cxjUiXRfkJUVQrhx9EzYcDSpuiJdQdkV4YcZEQsQqMpTre2RzvrS8JTkv5BklylYXfkJx3EazYj+h+EqMCjAlzs8CsFSdognSd2SszypLtkzlgyiUFwYPhWNbkb/ySoFZO+1BbZuJR4ukvrf2DayKfjhgUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588830; c=relaxed/simple;
	bh=VE9zYakVKXcw64xN3ntaqUGBdb9GJ+q1zQ5aGM+Z1P0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EkxBlmSPquNvCZl4lrUZBjBk2adH1Zu/hxlNKcRxLFt3cXKX5Gg0BRyn83pJTm9n4s8DWbGau2izic+u/5VNY/wjbzu1WbWYpeLX6FDRQ7dAKJZ7M2zGR/Qe9hNEI+TZRB7rsDyFAnn97aMyTQc9a7Jmb684JAONptC+TAeP/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ll3KrA0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBR8jIxe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB3rqY3444178
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1rUY3+a++VGq+5VGAEgKNy
	M4DahpDViLmO4ey2lBSpI=; b=ll3KrA0eQy8fQ97+e55frjbFM2uUXfcDD+NCal
	dLsfTpSKozlT6FroZgJx6egnIx2Ti9DrxMmjz0Tf1M5zM1hzBH3vQ4XChyV62aJI
	aQkDRCi8CvmEt3eITWdxXnaVHtXH5eg3rEtriQDBPqJ6FBSocYjyKvR8/J943iuV
	LPQYdJghk9IbRSUfmBR7pGwihLc55YHkyKVmjaK9jQutYTJKBtFkE/umuoSEJzYO
	07XtvnaZ48GPI/aHKO7hswu+RqcNMAadd1gHrhcK0Gf2zqZ7Sa9WR1kWw5EPbqgf
	ers6bTpHzmRDMogtESvAn1b0eptR/U8i/E9kP7J3vaB5ek3g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0k7n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:27:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8bc140520c7so101342556d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 05:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588820; x=1779193620; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rUY3+a++VGq+5VGAEgKNyM4DahpDViLmO4ey2lBSpI=;
        b=UBR8jIxezkVqoF5E5wzb6RF+XkGyHUMLPBiTQ4BALIKlWocS6Pqc2edV4Al/CR5BBk
         ESThUcctQMuvql8+ezMRHwKttuUNSnCJWRqcV+NXiGhLIc9EfMOeNUpET54Hmz2fkZC3
         hve32/eDfSLi47iz66olrcv2ydj9qye42uoY3/dVnR6IQew2Ez3IpWvflLL32+nRBhni
         4SgmuFsJmUWA1XNtFWgIlVRar1pWn8E3S5qQ8mRNVJbEjnOmHL6REvYF4lnkfshTnntE
         xeftS0kUnXRSjPXlrjUPmDC2M4y+2Bh+LYmsk9NmLCoFkYPvrsnLd951H3eL1Yb9BUhJ
         qLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588820; x=1779193620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rUY3+a++VGq+5VGAEgKNyM4DahpDViLmO4ey2lBSpI=;
        b=Qq8Vy2u9eMnpiAjh4A+lVX3DxCFHc8w/TUEcXP8VFBX0kFsKfOeKjZEum7w1DXcuqQ
         t9UR0W5PxF9eKrLDfkK0scAvP8untwi0e9rowHYQmSezeyofq2h4E0sxvS7ICcdQcYCH
         QDUGd84laTMtECCZDSmKm7A53nW6fVe9DxPrsRyD8cjuYcLpIjo2yon69TQjErcwkGTn
         h1NeQ5Iaj9felqsWK8hixF6xb5VRHfRnK8Px68d6hkdOnTomcvS4qE6DpJeYUCbGmj/2
         m3AHIDwMaDkk1FtGmMcel+B9gjI7BbEqSxKt9dT38iu3Fy0j19+PS6it/noalS5vR49p
         eBcQ==
X-Gm-Message-State: AOJu0YxJIb/ObVV7YLZoiLqcciw0HhyCHGuUgXYm8F3XfoS5WXbJlQAu
	INkKvdH1RthUT9gxbYT8CE6e7mkUSS2Qt2zH1V0PP5BcFrfdzbYrRzcYpdQG8TrrhxleUjbCM5i
	czhwqoYQLEv2hNHCAFCHBBADYXpDgN3IxbsPdAw5cSmsKmq0lHTIqwaxVALwjgJ9ITyzsjVxv8m
	mn
X-Gm-Gg: Acq92OHPFQmQLXcmLDy5ExZKhLUXQndQMTtdvOSOPl7PzWK93rc2R7rW79MhgroaJ3b
	uNMrdsBMyWd+KqRp6YRCufhXqOKhm73B8z97zAsH5KNPGN0s8irGGitPnXCGspdGnrOqN4xfSfr
	dxl4i6KHomONI6gedSlJnEr/CPscr62zOdz653GmZGrtlWQzXuuON110x2lsbdoI51oWsvIKGkC
	g7J6maTVqwrSQ2j6Rt8rICzj8G3cR5EKJ4vrGmJR9KekCUdl1TjAkqjI97p15FyLaP7SIt6UDM6
	rDBROFP12ZTDbO1ZNnfTU8IuSVMhmFOwN5yFUSN3ju7cOdUCz0rxEqaywk3BDeGALIqDje4OLrO
	hiWxyQBn8siCaso6ggSRlJI0+pa2kgA==
X-Received: by 2002:a05:622a:1789:b0:50d:82db:773e with SMTP id d75a77b69052e-514a0b821bbmr197431561cf.47.1778588819274;
        Tue, 12 May 2026 05:26:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1789:b0:50d:82db:773e with SMTP id d75a77b69052e-514a0b821bbmr197430881cf.47.1778588818487;
        Tue, 12 May 2026 05:26:58 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e90681760sm43089135e9.12.2026.05.12.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:26:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: eliza: Add ADSP and USB support
Date: Tue, 12 May 2026 15:26:46 +0300
Message-Id: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYcA2oC/23NYQuCMBAG4L8i+9zktmlJn/of0YdtnrlQZ55KJ
 f73phFBxcHBC+89NzHCziGxfTSxDkdHzjchqE3EbKmbM3KXh8wkyC0oBRwr99Bc59TygQzPsJB
 GGCisUCwctR0W7raCx9Mr02AuaPtFWRqlo9539/XjKJbeGxff+Cg48DzTMhUGJVh18ETxddCV9
 XUdh8WWH6P8KCkkP4oMisgQTJgEdsUfZZ7nJ7j+xRULAQAA
X-Change-ID: 20260330-eliza-adsp-usb-8ef2b1b0fc13
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VE9zYakVKXcw64xN3ntaqUGBdb9GJ+q1zQ5aGM+Z1P0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxyL+4RKUiIVKB57UGebQXuzeMcccfTfQy2Yo
 8ulOVXqJSiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMciwAKCRAbX0TJAJUV
 VgvoD/4l9pilvTp0PpohGGeB453v21CqENUF67Moqi0Lo4WU145dA2T9f259IfaN8n7RC3PSO2P
 xwIxQg1bltOqOF8lNzjR+Hey7d9Y6vCQnfWq/LUkp7IFyBGD3mTyBKdWE1eDWh1wGtBrIJscNRF
 1Psf/hTs5vbRBGJy+gO1X3VDvCdr4UN5bIGVamOmZbKycGZSus0PpLZke/d8DUCBBk5UseZGAuw
 /fS6FnBuXmd98nusD16v9tuIycrRzyKY0tjTr6czfyKLliuq9ZiNgWjiscygpdLpbmE5iYSha38
 XV01s+CK8Yy+aOxq8iRuondyjjZ3uK3a/n+EFZQyFFtY4ozCg+wwn0CXsqEjALo6SwOT0IkNttI
 GFZH24wD2QraeUPMyHBaV9Z6zVT47RX59AAgWY672MtWqNMCaqVYy99fB8IKA+nFw/8nD7zh8uc
 ff5p0qNTlErTgLnMPinsbMLAOcx9u5sCiomvbncMbB+jLLIwWJbiVk5ECLmLFn736pJioxUChG8
 hH8CgHTWy9SFm6N5jFYAMS8EX1Hf+nszz0KEzqoA79osU9pJApI4mIa+z/cGshCk/gb1a5rewAC
 Vqgq8kgqFr8rtEszFcWuxMfC2P/3po2DnZLfvYKvJHbs+uQniZv2FlEQWTlV4oEU6cJlqA2v9t5
 /g2hm4Kix6ygJyg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a031c94 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=v-TjB7A8gc_t_YAPOJ0A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: iqu6MEwlBAhsDzpRrEYNmK1K1jsihyAj
X-Proofpoint-ORIG-GUID: iqu6MEwlBAhsDzpRrEYNmK1K1jsihyAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyOSBTYWx0ZWRfXzW7ozZuLWcnZ
 cOXe2W9SKPj88CvyiC/thshmuMU7okhqk7uTF+UJoG6z0MGr1SOZr4K08a3+dCuYyFFewJpsG+m
 LTxtwenJFnhE+V1ZmIGWiRhSUnDSDddU1TxvSqJY/1jNPXfgH0JDxAknTKL/aXszsdBXmTw3X3U
 OeQpwtoIcV8e05J42F75KxjLy+3TmuAvAZ0VzheqXuBwCde3HpR01FLmWXJgZAwPeSOhP7EbtvH
 i+ySGDQvKUmY4LQsoX1h8NJNrUzffrz7OUof6fN2zM3YF3pRCGE6kGmlYrry6her4MPD8kKgy61
 rlbaK7TWRbP0sxGBpWVETYh7dKN4eTpyjC278Jsm3Qp/BE4hcmHcFyVe/P3hN+SmK9Y4Aa3RQFJ
 9QB9PYN/c63WNEJV3x8m7ydyvb3SRLe0VgFI/8Se8KpnDaqkqUaF2pdRoSTJ1jZ5YxZHfIlG8ra
 LLU3axc/6GiFgSCxHyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120129
X-Rspamd-Queue-Id: B2AF25201AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107088-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds the ADSP and USB related description for the Qualcomm
Eliza platform.

The SoC dtsi gains the ADSP remoteproc node and its communication
dependencies, including IPCC, SMP2P and the AOSS QMP channel. It also
describes the USB controller, the SNPS eUSB2 PHY and the USB3/DP QMP
combo PHY.

The board dts then enables the ADSP and USB stack on the Eliza MTP,
including the Type-C connector graph, PMIC GLINK integration and the
PM7550BA eUSB2 repeater.

The following patchsets document all necessary bindings:

https://lore.kernel.org/all/20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-qmp-phy-v2-1-849c4de8d75f@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260508.
- Picked up Konrad's and Krzysztof's R-b and T-b tags which I forgot
  to fetch from v1 thread.
- Link to v2: https://patch.msgid.link/20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260430.
- Changed the HS PHY ref clock to TCSR_USB2_CLKREF_EN, as suggested by
  Konrad.
- Changed the HS PHY VDD supply to L7K instead of L2B.
- Dropped the dr_mode property from the controller for MTP board, as
  suggested by Konrad.
- Re-worded the cover with more info and updated the bindings required
  patchsets list.
- Link to v1: https://patch.msgid.link/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
      arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

 arch/arm64/boot/dts/qcom/eliza-mtp.dts       |  81 +++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi          | 261 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi |  69 +++++++
 3 files changed, 411 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


