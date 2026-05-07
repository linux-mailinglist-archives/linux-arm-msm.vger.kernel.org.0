Return-Path: <linux-arm-msm+bounces-106508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN87E3fm/GmGVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 21:22:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137E4EDF05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 21:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DD3D3039885
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 19:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338F148035F;
	Thu,  7 May 2026 19:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxoHucsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CE7DK1RW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA8B41325E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181737; cv=none; b=NwFJsxJ8QogMjqKZgsXtUV7JWEbhWHjWPWXCgt+YdOCSTkrCbcwfW/N1e+lYnEQ36oDhl13gHMl/XJWAdQyDGoX+yr58kHTjfgMNBo0aHkLDMdveq3VtNCDPuPw3L1v43U7Wq0YFlF439Q/C6wK0HJiF0srFw1GJzsCPp4VXB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181737; c=relaxed/simple;
	bh=sfxMae/EqwgCxufleqKr9y+7CQrnZNWHdz9EphTRWQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o7KZAp1IjBG7R6nwnfANIBOD1+tglwF9sVnSITKgrYdayq/rA6LaJKycni9tnqf+rSGbL4vU/sc8UuYc3cX7SSh17XWwZ/txH6uyN4XjvgTbgt/jpuDjUOuGhJx5+hPK0AZ/To2LEHcIOgVSn/5jLXvXJBFrxrTWiS9Bw3ARzRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxoHucsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CE7DK1RW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647H5CVe682775
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 19:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=34n5gfXmKtcjNoE8xNCiR3
	+n6m48lU5QKhqhsIP3Jqw=; b=mxoHucsB/UoCWDYsswUl0IdrFx1JwFuG54tc6s
	2WfgZonfGrtehwwfWPJdi35tSagKOVi9BomyzGmyOUSBsP0SYZXWlQ4xUsEa/NqW
	Eh74q7EPEZd19TXA3eh+Q9LqY8cU0O7ID9hI7YJMWbhhd7pr6kTQqF0Yl+ZQM9VX
	TeLf1D+ynjVxoZ+sSNsHIxZ9eG1Hite+9n+WXOfQpHhVDVkYr+7m194gq4iH+vE9
	pgXw6W8tsnqrl6g+ECvZz+Isq58a2Nu9enRshSn6ahvu/3LgEbOyZlTDAgmlWrOa
	71FzkH2TBvmS5iomX7iii3flXx6ra3sSBveum+gHjiuH1kpA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhau9r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 19:22:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba268cb5e6so14689655ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 12:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778181734; x=1778786534; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=34n5gfXmKtcjNoE8xNCiR3+n6m48lU5QKhqhsIP3Jqw=;
        b=CE7DK1RWhxntnRfJh5EYaVuP0bTe4J2nZmgrxvQAbuTtVrKvM1fnvZjcgdl6Z2O1Bu
         bPRhZxBGmFJpkIWWutkMXlif0dCe9xR3JAGoYS5AkLFIp4v519Ad1DrTeVDhUtiVSGZp
         8f4Ks3gRtGYfk0hteKXb9+TsjDKi+56uWlzkIZ2w3rU2WCB+AwPW1i5XJKfLeu8ksarA
         NNRcCZQImC69jcD/Z2RMsOwxj7Zlk+KswZ/0d4bH+1HOpsQjgqofiNpw7hUSHWu9A8Hi
         fUlDWU8jBEfxj7gtefSsmwkjb1nA8dzTpLypUCWmi25VEkRba/t8sCrm0RTMiXp+70Po
         OX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778181734; x=1778786534;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34n5gfXmKtcjNoE8xNCiR3+n6m48lU5QKhqhsIP3Jqw=;
        b=R3/87YRESySReXwP/JhgT2gRCw1EbwY5ZBJXek8aa/lqNHxYuzkK6BHK/kAs6KppVv
         U3dgR0SpuEbPO+ki3qUC1CQbe+KwG5PNzjZEEMV4niWycEpFkUCDS7QJCFdrmKdsaoYT
         M+gPf24hlxJdkiiGwibmpIMHRCKeRo/I25jvKGBUo4eogwSPypfuef/d8Rvn3qqOV1Sx
         cdBZeVakh0xj+3sTWb9TNEEG6wnYTrszMS5hQI8vdDMwEZg9Zj08rzNWNj9O50eiEvt7
         OLpdopUUp+tCmF6NozQKqwpEpPgsJz+gUF+17g5ihYlsBR6x6sietH7RtlG4DwXAiMdu
         4qlA==
X-Gm-Message-State: AOJu0Yz3q6nk7cm9sTNpJuFLofKVwxq8FbnJBEs/G0UTcxHV87GQ5dXN
	SNOSNz4NgdUFS8s9cdBW5bT6anNgCrO1TpyXWn9ugMhcosTNCSUU7+1T/R4EQTf8rodSqrhIyDM
	FCr///aF4MXHVHQYmmbpsJqnxpWGlggGZ5spDW9n8QyS+/rRCHycSe5IWMo+ZkJTSOqGRNMF105
	m9
X-Gm-Gg: Acq92OF2HGrSsgKexGXQxNzMIp1SdEklv5dEiVG4VUXEzDmmj96DAewqfq7bQksEqGg
	wjJ7uM3J+WRLS87u6rBoMUGBcuHI6zZL1g02AIW+1EwCuA/isBpbAfxqIlwha1h4kIlL+CgYXqq
	7h35LN8Wt7eC/J/ekrBS933w4O0PZc/G4zNr4xnSA8WvvIOCsYfBUBVTL0BW3Xm9Gtng13G1FHC
	v5NG9o6mEHPHoy8J4ofc8YXMTsNo8Ils+gUeJV+tU7AEiTnvfSSULLdB/wug7NxQGyQGfMla5bg
	TIFbXLYj+I/pqyX4rHPYuIBFESPgFGZZa1DTA5N5XM8iWxGQEyFiKgT6Uo0RLV1Kck34LNAbUT4
	uRxAPyJq1zGR9+H4A7l2rC8D3XCymkN53VSFT
X-Received: by 2002:a17:903:2f4e:b0:2ba:3226:21ae with SMTP id d9443c01a7336-2ba78b4bc4dmr85384375ad.11.1778181733530;
        Thu, 07 May 2026 12:22:13 -0700 (PDT)
X-Received: by 2002:a17:903:2f4e:b0:2ba:3226:21ae with SMTP id d9443c01a7336-2ba78b4bc4dmr85383965ad.11.1778181733054;
        Thu, 07 May 2026 12:22:13 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae7874767sm6012535ad.72.2026.05.07.12.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 12:22:12 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Date: Fri, 08 May 2026 00:51:59 +0530
Message-Id: <20260508-shikra-pinctrl-v3-0-771144cdc411@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfm/GkC/3XPzU7DMAwH8FepciZTvtqkPfEeiIOTODRia7ekq
 0BT352kA+0AXCz9Lfln+0YypoiZDM2NJFxjjvNUgnxqiBthekMafclEMNExJXqax/iegJ7j5JZ
 0pMFrDrZD57tAytA5YYgfO/jyes8JL9fiLvfmgx2ab9T8oHl20VMQGlAaZzXKYeVVtZCRuvl0i
 ku5rddMBcaCVhosSK4K0RvNbBu8ASckgx4gkLp/jHmZ0+f+X7HqAf+9snLKKLfKWmElGN89zzk
 fLlc41s2HUnZxFQ+lZeqXIqqisPfOCd+Z9g9l27YvII4mLHkBAAA=
X-Change-ID: 20260429-shikra-pinctrl-fd71ab6ecd6f
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778181728; l=1586;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=sfxMae/EqwgCxufleqKr9y+7CQrnZNWHdz9EphTRWQs=;
 b=o+rLLk4VN/wH11UBFlsCwvFbFJynB+0etHRRQ2/+yLhy2u+hfzUOwnWEwEWT2woQ09jJ15Uqs
 ipU/0Pkh3x3Bq+ZoQYf3FZy3HQWhbIstwo0xQgXMWXjjKReSIVDldTX
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE5NSBTYWx0ZWRfX6lb9nYMJgsgh
 HRDT65D+SgAUnsMdKajwrsFcK8glE/KdyalVcFpBs5o+C4lDdl6zJBb7BLLLFbWjevQjgcKCYo2
 e8pTRxHVAVXvSRiNsnqzk+UoQ2ZaesaSYnh/lteEIO8uTzJ+wx8S8Ws0vwMMv92O+R79JfaH5dD
 bSgX7lfvN8cQSXQvX4HbLgyJeCL4zm1i/oioPGtRCpM9zolYr+Tpf1nOHP8/Ve8STZuRd4JVpOn
 AnwbySGx0kYDybezNdHH27pNebw1ttCDiRRZXWGuuoCGaZfK+TkMXIFUak4N2IcfEb/ZKtYJiTl
 5PfwrjmvHHEGrR/Z+3ENhJFW2ekw2iS+1nybRXiVgmFvzQGauJgcZJU7oyaEK0rIrOH1DqKlxsW
 w5RSsF6ctcbQMBb7ajE3uMxX4zmqbqVnlzLdGFVLq1iU8LprEYXmfe0SPuzQTc8lZ0m7Mf1G22I
 pDXaCwc58pR861a8PCw==
X-Proofpoint-ORIG-GUID: G4_vTM34sRepJVrtBe5EkZxSkHONosdJ
X-Proofpoint-GUID: G4_vTM34sRepJVrtBe5EkZxSkHONosdJ
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fce667 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7K3iWs-JhacpI5SHW8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070195
X-Rspamd-Queue-Id: 1137E4EDF05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106508-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as default.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v3:
- Move MODULE_DEVICE_TABLE(of, shikra_tlmm_of_match) immediately after
  the of_device_id table definition (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com

Changes in v2:
- Fix Kconfig description to drop "Technologies Inc" (Linus Walleij)
- Remove unused UFS_RESET macro (Maulik Shah)
- Add spaces inside braces in shikra_mpm_map (Maulik Shah)
- Fix gpio-line-names maxItems: 165 -> 166 (Krzysztof Kozlowski)
- Link to v1: https://lore.kernel.org/r/20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexer
      pinctrl: qcom: Add Shikra pinctrl driver

 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1256 ++++++++++++++++++++
 4 files changed, 1391 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


