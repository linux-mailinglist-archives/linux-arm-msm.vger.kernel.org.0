Return-Path: <linux-arm-msm+bounces-107108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKGHFDctA2oR1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:37:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E17965215BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0355A30ED26E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB0A3E1733;
	Tue, 12 May 2026 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YcZOhgCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXMOsNO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213C7356757
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592354; cv=none; b=L498a6T7/h5xdpn88G+ShCt/yhjWsMa+Wmj5FGm25bMmWrrCYPnWATc7G8/5Pr50H61FCoI8WHYAnz2QIxNYC7UOzedrq3zs3Z+CuohR6cuSpPBDhsyk+/M89n1VCwdMqBuALE2BcWsOhK1HE+78hYB920b57xC0sFG/VMUGELs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592354; c=relaxed/simple;
	bh=dAUT6urYpcci7+seRnPuuK6X6/yN+Qxdu2FzYuJP7Hg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kdqy59qW3O9Ftl9WMXCPsK+vO53NydUNcq50BTEA9OTeKQZqzE3Lz6iDyGH1aKhUdO9S6wlKGWOAmLP1ZxY6TkxXhh4/sjnJrEBpY8tsMfaL/BQThN5gJn8pyUcSnRYcf2GnDoS+7NOCKm89tEW0/t3kWKv7g1TIbj7mA6cZ9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YcZOhgCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXMOsNO9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB3dra2186992
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lMr3Au4g9Ol6K3jiliyVVM
	tkLtrNvcrj6O2G0UGOHms=; b=YcZOhgCDiWBS6xmV3kVm2KKAveDmLO/4b12J07
	hCfy8JEijGdANMUZOKd8K2JVqcYOlxOytZlO4/oilpPD4Y6/ZSJabHGu+NR2regW
	gzZoNBIwJCRrLdoFNcr/gpcbMm2SLtXDJyZlM+Q1+BJU9+rtdx/bhDW4+L5h19pz
	74yffHvL2ImViMiB5HSHCFprKGNg5j7NfF/T9g2AZXCc+MfiM9KACQQ8t1nY5tEb
	TmBjzIEAsU9V8L00tpnrfMbEZfd5yUZf/TzfxHxMFNGyYVxdbMQPTTetBN72XXl3
	h+iVn5RKhoq3B46puALfCLwxLdUftJ1FjO/PZc/ZrXU/BrgQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0ucvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:25:52 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7c5d6bdf9easo5700527b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778592351; x=1779197151; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMr3Au4g9Ol6K3jiliyVVMtkLtrNvcrj6O2G0UGOHms=;
        b=bXMOsNO9a/dR3Mffpf86x29pBBbZb1BWzoLAAEv9sR7zliYEzPRO+VGtADCWztts+p
         IL0+RAKrVKTb1BuMTBhWUWmCcAoenE+pwL4g8xpdL3T87hywcUXsEARAYolFbiYWgdrj
         kGibgQLUkRcfFQwhvdSznJJDnaD6EBejEd0jrKQNcit+/RROPCdXJq8cvbG3nX4y+Lto
         tLhAVT5Vpw44L5ztOz9B7uBRkQTIB7UIVMKLCpuUC4oIO4Cu0PoB3WIUYTUuUU0EoEUA
         7VVowUBAowHC+dP3sUPvzWprMD963fcxRcbYdEa7W+Rta451RMdFEgIAv8zxM71LFqXm
         QpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592351; x=1779197151;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMr3Au4g9Ol6K3jiliyVVMtkLtrNvcrj6O2G0UGOHms=;
        b=m5JVQXdPU3Rpn9xa2ErinMF0Y7oWKdpc9U7aqoktiQ8PORF7OXXaEtM33Ri06rlWmt
         x5sN0eH6oMVqef/by8165YGHe3rXY+cI30qbhwk6LDfcS28ig4RuxMXuFUnIupHJnwfV
         c1eRYiE6zSu4bCupWkCnyzMm3vsTChbnPA49F8MFNhII1AEM12BF0K2wB8yaR38CDQen
         P6sC5w22cBuAge+faC9f1INWi2lGdGMDbYkGuuoD6zlSfJy43oUDOPT63ObAAfDzdOO/
         1Kfxv2G+prhiUDLzo6FsLIyc8fcCCdERscLTFKegbCKxYJGgvVc24wVaPdxmDFskkESl
         GgjA==
X-Gm-Message-State: AOJu0YwgDAmU4jA0HtbOOOvXxADmo4mVETU/ywRAYjJis89m/KXEBqp3
	ny1dedsxuH05H4ze5BQeLOK1GXgnUJdRqLJCU0BJV0Ewf4bl+KPXmn3vM3JzCQ09GdtRIfGZqFj
	pfFaob+BEU3GzAR77ZZWFSgGlUm1L4yboA3+7mqkF5p6vCRZj516UVaEAcG7ExrfhMFFJOEHemU
	83
X-Gm-Gg: Acq92OGti0/tvTevzkZboViYn+I7UhYNCUnFdwiIFt3GQ5MNFMk8WEci6txJo47HnUh
	C2YSL1wQwy80YkpJI/nC328xosVARDTgqNv864sOap5Jwn9mfZEJ0UVN97/mpPswj+1Pq0nICd9
	xuqw1GOqzJ5BTlYTKSsztsuZr7MnPH9vfDH0dv9uIgUp2eKVMwvoJYia2G2Q3QFaYI7Y/dqv7e6
	oYn7u6dYlW2yRYvxoEZxKat+rM8tqDp21/7+7ipL185uJT6JogMra/MkyEGuc3mA76C+subQjMr
	Vc2qfmhPY/Gb23BQDn5GeA/O4vzFWypLOlNLRXrJhYwDzQ/J164QhNhnlzj2eyLnbUnAzY6wMuB
	53Icl9mVArqT0VV1CMX3NGnJuAna/HLjOLWNK
X-Received: by 2002:a05:690c:6d84:b0:7bf:3b0:27d5 with SMTP id 00721157ae682-7bf03b03627mr269366567b3.47.1778592350861;
        Tue, 12 May 2026 06:25:50 -0700 (PDT)
X-Received: by 2002:a05:690c:6d84:b0:7bf:3b0:27d5 with SMTP id 00721157ae682-7bf03b03627mr269366267b3.47.1778592350409;
        Tue, 12 May 2026 06:25:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66861afesm164595757b3.37.2026.05.12.06.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:25:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v4 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Date: Tue, 12 May 2026 18:55:42 +0530
Message-Id: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYqA2oC/3XPTW7DIBAF4KtYrEvEnw32KveouhhgqFETOwHHa
 hX57sVOq1RKs0F6SPPNvCvJmCJm0lVXknCOOY5DCeqlIq6H4R1p9CUTwUTDlGhp7uNHAnqKg5v
 SgQavOdgGnW8CKUOnhCF+buDr2y0nPF+KO90+72xX/aDmF82ji56C0IDSOKtRdjNfVQsZqRuPx
 zh1lWw1U4GxoJUGC5KrQrRGM1sHb8AJyaAFCGTd38c8jelr61es9YBnVWZOGeVWWSusBOOb/Zj
 z7nyBw7p5V55NnMVdqZl6UMSqKGy9c8I3pn6iyL+KeVBkUbTmpZvzTnH+j7IsyzetGTwTvwEAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778592345; l=1860;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=dAUT6urYpcci7+seRnPuuK6X6/yN+Qxdu2FzYuJP7Hg=;
 b=lwNmKw1UkDXYNRZDZd15AAJPE5rNQldpF+B5wS5fwyWqxTDlc8Wn1+4c53ez/uQqIh7QzVA35
 9IZPGzivPSPDuHJO5wkWo6jh2UcdyxuBjny+aRGZ9M6aZCKlTu9zqkT
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE0MCBTYWx0ZWRfX+cOR7YAKAOb0
 EgQMctsWavwNvOPJeY20M6tJJsB9R+Trw221yZozdsZChgn4JkJlin8AZv7zWAE4opxH18QMLA0
 wvogZzTp8Ff0TLFOWOIuJjwErW9wS1D6hDOL+4Lmb5Kv8YdcxDHyC4HtAeVKNcrCE8HfAssTif+
 gxs0aUEySS7i4IatEuv1jAyxQ8ZDdZneSIFt4/qKmD6EKz4bfW043zWqbDBHFsBgeTjD9QcpdUR
 riOTyWU9Nhn+cDiVdlOtSzslfSKFiR5rgG1yV0plgN/iM2l7wSPxVeZm5WtsCRPJ6hEqJzFutCT
 CqP/0qHM+tGgda7EDtw+p9vOy/O/uwiQT9Mstn5xTXpWlo9g5EVdGMdvskaC0YJgi9C/UHVeWbV
 g5ZA3e7DxcHdG2w7q67gyOJ91Ij5n91Fd28t7pSNWMFHd6hve2P4fRWfdZV31fkbUOzSN3CysCG
 9L9uMp0ohAQ1pCPTUfA==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a032a60 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7K3iWs-JhacpI5SHW8A:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: LQmenPGHrcYZol3H797P1HJ2BgoEyS-t
X-Proofpoint-ORIG-GUID: LQmenPGHrcYZol3H797P1HJ2BgoEyS-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120140
X-Rspamd-Queue-Id: E17965215BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107108-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
Changes in v4:
- Remove eGPIO fields not supported on Shikra: drop .egpio_func, .egpio_enable
  and .egpio_present from the PINGROUP macro and shikra_tlmm (sashiko-bot)
- Link to v3: https://lore.kernel.org/r/20260508-shikra-pinctrl-v3-0-771144cdc411@oss.qualcomm.com

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
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1253 ++++++++++++++++++++
 4 files changed, 1388 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


