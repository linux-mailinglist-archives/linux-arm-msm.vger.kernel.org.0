Return-Path: <linux-arm-msm+bounces-107432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPRhMFnHBGrdNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:47:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BF75393BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 590DE3007674
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8993A75A6;
	Wed, 13 May 2026 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5ROVzuO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkxAspqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71921A457
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698067; cv=none; b=rcRizYXzNRTv8Vcg5NojpdlEIBJvS4+fVkXyzg5wt1iSopnnE+0QsijgBttfhO3c9tMzleCjNy0i8WIWQ3M/8b8FgS4x+JvQqPsJ8JeEebEa0ZcVrshVW5kfTQUOms9O22CXHMaDV0/EsP2Oew3SjNNw3JXp8jO6rNGmtAfnOvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698067; c=relaxed/simple;
	bh=7qm4TJ5PlTXgWLtbiBm8P0s0EuJqU6vJB0KebqpWh+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OiFTpUZ4f745/PMw2v0PXkhH/53S+zlValxgOCVAAdW3SCzH0wBTPthu9dgVHqG5KrV2mgki8nRiJqAbIDXhz4fL1t4n63BvAOwGJKCsEsjwMj7uEaOJuCbhtOQyce9R8tFRe6uKFqU0wA3hXMBkOMX1NEjFgHOehc42gODwyUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5ROVzuO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkxAspqG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEnNVp4159621
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zxe0zN5aRPOB47Cchg8FdQ
	3evbLHaTap619AJnc8UNw=; b=U5ROVzuODN40k2NtCAhhphMUbTlLEfmsewXUkk
	cbr/pZTp4TWguCwBst59dxmdLHziRRlM8vdzGskoz8jtxhDubq1QCTYWlNP36dlh
	tbziNVGlEIuEoN3cnDQB9xbXTI5MlsR26/7HmMFCZ/l2EFCJTiml1BqijHsEfuDo
	85ZI6VglfCAbbSK8J7Y88peF8o7xuwMeehtHtLR/k2Akip5qHBHJAhsVlzV8JQG8
	/9xcQbXdJFuwKINbMRN82bkluVbUdXZLqxG0S6Ea9JDOgTdrf2Vz749Lura19wud
	bDe7Iz4PWb7MnAihSBMEvoBzFvVZzBhpSVWwOpy4VBx0uKMg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91td0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:47:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba15e384c7so43647825ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698064; x=1779302864; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxe0zN5aRPOB47Cchg8FdQ3evbLHaTap619AJnc8UNw=;
        b=jkxAspqGQ/Wq89PSRD6Ikm25GxRdTlA4orkHh66TJCmSKy1mgEllMguAmByiNMxDni
         kNiE0eXrozRVQy/k1M9fVq+Szth4Cz3Rzso2mUyc6Dlaf4NRQliiZ0oaydcihHDlhCPe
         1xKKwgpdasMOQVd8es6GAo1FeouJfFe1yUPo3p8H9S/bVLaDgszmef9Go+HbSZgRs+yM
         e1qeL/5v+w9PV6pGD9MKC88YCBI3NUUx2A1+oLmfo0nPqkP6zR9nTEdbRYKFO3T+dxpn
         crf+R5ASsMxfOPTc6j10FfnLaePTHNoboS8KS01fzQKciTgUx+QMM7ju7P1al1j0ZC0g
         A1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698064; x=1779302864;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxe0zN5aRPOB47Cchg8FdQ3evbLHaTap619AJnc8UNw=;
        b=SM3RXxm+48auHviwdTlV3bl/W3rbvajKiifGRKWYOPRIXT4t4q5YRrHpXkbwBL+9W/
         e1xTAHtTQNBHs+wqs5Eakp3g41LWhh55HOprj7WAVzT0uFIfL2NAL5zU7DB51pN3V6rd
         OnG0Fg7dSRzRapoZg3dDQTVGqbDv87mL9QjG0AgqLWPMGJNPwVkNQnyuHWtAhPXLt85n
         62ZcXZ3mQ8qkmPT22+c/MS3vRtdBPAUafI+dQSIKQWnLAvMiSA4xNYOFIND6WnA7bMTM
         zOzejIcxa86bFBFhz01f0dACxzyGmzsVMUUxucnj/b5i/W9LO8xxmLoo9KHLcRQn5QuK
         nu2g==
X-Gm-Message-State: AOJu0Yxs/3/TQK6S6R3EmxL61bbi1u6ySITUxlAB0J6HVKYCAPpSG26W
	67/Bv0cs71tn8w9a7uHORgZFNoq0q9HqETbID5GH4RcPjjCakBxd+SY0F7LDHzZAcgJLFe/RqNi
	u8D27g8VITRVxeKfJxAx8MOovbPzAkvv5LHUNgfg/uK9K3leYCG9V5jKaqcH8Ik9hl6Gw
X-Gm-Gg: Acq92OEcFNaNuibuccSI0WJaVtS40gz88Xr0yCvEQIZS6EEVGZ2V/Ax/44aa1UHgVOB
	o0atPZ4wDfWgk12rm+JavWLNFu21jde48tLLRBLw1Hu+T3x9Os5i/wGtaNk3w5rMy/dYbT/D16v
	86239a0WXL3KdmkdehOOIHpo6UX7beuU5wc+AQjNy+lSqqLjnZpEod58HS/TJssKN03B030lOje
	YygDcHrGSVQu3tN+xaFC2HA0isZrnPlGDEFWD83w4UnV0Z7ke77hSGwoRHD/2nWez3lc/NjYcZ4
	Xso4m2b8myiCrNTt2DjVvLp/JgruycSjSVZlK+0zi2Zb78wCpBNphe/LLRtQei1WaJk6ofPez4v
	BBxwFUoaNzjJgpU5DK112L1tF3iK+FwGKmPOG
X-Received: by 2002:a17:903:1b4c:b0:2b7:af0e:5942 with SMTP id d9443c01a7336-2bd275cd001mr47009595ad.26.1778698063899;
        Wed, 13 May 2026 11:47:43 -0700 (PDT)
X-Received: by 2002:a17:903:1b4c:b0:2b7:af0e:5942 with SMTP id d9443c01a7336-2bd275cd001mr47009365ad.26.1778698063383;
        Wed, 13 May 2026 11:47:43 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bb9sm187438405ad.52.2026.05.13.11.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:47:42 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom: Add Shikra remoteproc support
Date: Thu, 14 May 2026 00:17:29 +0530
Message-Id: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEHHBGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0Nj3eKMzOyiRN2igqL8ZF2DlERjU9NkU7NkM0sloJaCotS0zAqwcdG
 xtbUAsjAMWF4AAAA=
X-Change-ID: 20260513-shikra-rproc-0da355c56c69
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778698059; l=922;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7qm4TJ5PlTXgWLtbiBm8P0s0EuJqU6vJB0KebqpWh+4=;
 b=A0JS5zbitFXK5C17m7MLs8sUMIo5xGCeqwk1S8ViTUGS68di5ECQ3JqL8655FKjShKFx2xyS6
 TXhyFMAcb1gCa6ijEu6qaBmmVmh9cEc35AKwM1ohCJWN1hechlVyDu8
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: Z-Puow9TiPC7wkdO7YKdXAto1_UK-1r2
X-Proofpoint-GUID: Z-Puow9TiPC7wkdO7YKdXAto1_UK-1r2
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04c750 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1wa4pLS3tCHV6WQ5_kMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX7F8SixIThnrb
 MXlCF3iCbwJHan8Ow43c3XcPuPQsST7irBtIapRML7xlO3SSfB1E3x3VPs17J8QQBADkX+iyaTp
 ELidHI8LtPG08UNp8uFhEwhiRmCBwMBEUf5sEguqKD5RBWJdMxWuLFqr98m+MFr1wWV4zm7/LCL
 phoiVV0t6A6eX8aXL9X9AZKTe0ArFq+4FS62XPJIAfXznYt9jWQqZRF+CfGn6LMQlUmVvA2XSxA
 rQJGJtPsliHc68tFDMhTnikMgztzhezmYBojyUBaZuL5Hg13QJqzz3ly8CEhE3a47QVLtOsHVzv
 N9Lq9o8BX5dRQvfFasEYdd0bj3hrLm14Lr+9F00Y9uoXMuOR+h4LuBKb1Mpz88PzpOX6yOd1iL8
 uj6mrTplYPgwESJqCzOhHtcnSDRAlw+v62uRw5n6P77ZJPTsxgRvdonKJ5IN1jf31MNOwTVSHf9
 8E7WL4+vmdS3gPlsa6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130186
X-Rspamd-Queue-Id: 38BF75393BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107432-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add Peripheral Authentication Service (PAS) support for the Qualcomm
Shikra SoC. This series introduces the device tree bindings and the
driver resource configurations for the three remoteproc cores present
on Shikra: CDSP, LPAICP and MPSS.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Bibek Kumar Patro (1):
      remoteproc: qcom: pas: Add Shikra remoteproc support

Komal Bajaj (1):
      dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS remoteprocs

 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 141 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  51 ++++++++
 2 files changed, 192 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-shikra-rproc-0da355c56c69

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


