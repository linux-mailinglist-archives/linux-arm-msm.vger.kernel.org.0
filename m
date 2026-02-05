Return-Path: <linux-arm-msm+bounces-91940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNs2EsvAhGnG4wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:09:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B3DF4FEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62572304E6E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 16:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A432A42EED3;
	Thu,  5 Feb 2026 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lM3u9vQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuNa8ZM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71535428841
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307372; cv=none; b=tmEX7EbOi+5NHSadTTrB+AS9i74t1C05hg+uW8XSh7xcLaQWZz2H1ay2l3KBCNlwlIxG8bW7rAf1nBWatbIONmqBzYVgQ60MpK4Zcx8ezfQOOpQBfoWYKCYgHSktcBf7PDery3QpBF1yd6BharUlV8VvRb4QpuvRYZRncZxj3X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307372; c=relaxed/simple;
	bh=9XRfGsovmKGeOFoYqryh4VTM5ZKG5GJciF0+goawn24=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FPY5gxNrpjNZixwKvvF8cgYfZVtK/gfVBZfI/n2qfX5iGPVijFZ+o5y0rFDnkeSxR328Y9fEM3Xwuk4Czz+drFRKoAj8umubN5P7Oqg7iMmPH8e0GY5UIXzyPS4qvBSzVxm5erd2mfa7a7UIKi+gafcC8JozF8uZL2/qlBs3EI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lM3u9vQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuNa8ZM/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BjvGP4125909
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 16:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7gVCs2DHfX1NZ2r4vJLDBo
	UFudY1vIo8W9asMpUXTng=; b=lM3u9vQrlY6zYWKJF5xKU622I1RHyFKBj8V5QM
	whMnpZisdoztdPcWbyxvjDIK5sTxbVBWb3Jzsm3ijxcCD5RNgmvPC7+x8LMIWxZB
	IUmpZMrtBjTHgDDvNuegjjYQ9Uwgxa6AJ5Ad+fCvQSsc3SmPGe5nH/6hyb/ljE74
	tP2quiaQjZDnIHaWm4GkBPA2JOWMmHwwfppjey/pcuU6OO2O6isPhDDM/z2F/KXB
	w0nRenE8LkaXWIa1GmdLFKMQhZZtQlkahwIHKXoyj12gTw8VLVJCZUoBMhcjXKWZ
	DykxqDZQnomqlQBK0qDkvLYBjwfXIKjfNesGQey8FjDrdAcg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8rswt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 16:02:49 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6630c8af251so3607438eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770307369; x=1770912169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gVCs2DHfX1NZ2r4vJLDBoUFudY1vIo8W9asMpUXTng=;
        b=kuNa8ZM/os2PzWW0BobgMYUnyCZxnclV4Ml6nSb5NgZeiM3yCGMShJrPpImCbYrdkm
         FW0tac0Z6jQS64eNNX1Iu2GVb0ZLKR7fW9bskv1b0ffuycnBEG9zlpaBGGutS9G4ZM5t
         +36XM3D1W13jLzH8pLZLMMfb++0bSRjATgbGWi++OgAhRunl+Qd1q2okNMi6BDmiz6XJ
         x+GnZtmGWh5fuUJiEwiv0zX+wVBtYW2F6N+ofEP/AqndCUJO496iITqLA25Q4YvdbNXg
         k9tbNYoBrjLejFOcbKTcXbyC8nlm4fUz/oo0oTGDFrUhHnhLzxb9xAkKbBxCQNqyKYeV
         aERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770307369; x=1770912169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gVCs2DHfX1NZ2r4vJLDBoUFudY1vIo8W9asMpUXTng=;
        b=XrWZVqu3X2yoJOXnhZaxDGt/fAEjL/TeGTnEmW3h0BY11h1YyGAJvMQzcmKUImN4+r
         UEXDM694h0UpUZS7Vb7wCee26OvyzNIsuVGZCp8ZiWw9ooYZy1KgAXLMMjjmqFtJRCsE
         W7CqvP81kABQfO8W9/rWUwW6orUzTkRwsXmQViQNA4SEvtRlUOpWPSyAd5BxHqX8GL/9
         ueiSANjqGNcxLOOTtYTXxjS2H8EmPJrglq4qbcuezCCAKS2qEd1v5Ox5/sUSA6WnmDp8
         bxr2p1g4hGWpBW8DCJXdGAU/iUxu7T62p72xnmtqtYe+hmZTaeR/Wp/AsAcSaFsKFb5M
         OFFQ==
X-Gm-Message-State: AOJu0YxjRjEXVQ6VkBOlQEtHIT+K+hkXYo0vqBLohJ4onZSKjlpZuipu
	cQMO4gT3x8N9Jz+wdTq4BaIvcxPToyCIqQLdCtIcY+ZwQJWG4wAEbo0TtoqzfHAff8WZKre17So
	wyzNbjZVUZsg8P2vpyGFKi+QHHzNYnjoEmTxjg1dFeILpYv4yBgSok3moqD7qK1BWuDb5
X-Gm-Gg: AZuq6aK2qApmA+AlpmCzK+fDjR7VYRmaNTAXXv6M/4RXbbc1m9JpFG9xyQbQpAquJjg
	MXVWv93PV7IA12cKP898tdV6FnrqT+4OZlatEaFuE+/GbsT1d/LD01Fa68a0J+B/CEg4IprMAJx
	H5Wb11Sz6fD9J3h6ya/Ul7oacW82UdAEW6VVwkyDySpXxxZfevo8XQvOHwizJqwZObWPgW8Kbza
	yWJMB+oNQDs0uu4KsKJQPNqHQO2Zvbt7dmfVVS/VjrYElzbt5ZDTZi5M7QTl1qI71wXMDsHeUel
	5HJnEqY9rux5ZRmgMNu9LPwrBk0cgPRyRIIlLl2MbCTPY1DFSKYl990/2UQOHfkrHEhQPkeoNlx
	l9VIZPrQqDaffFMzxc+KYiF1Q91gdz/VZlbtId7R+q8iBVXnLsHhVutA3qx340Hp/2Ct7EBCM24
	gh
X-Received: by 2002:a05:6808:2518:b0:45e:d128:4d13 with SMTP id 5614622812f47-462d5a198cdmr3666940b6e.49.1770307368927;
        Thu, 05 Feb 2026 08:02:48 -0800 (PST)
X-Received: by 2002:a05:6808:2518:b0:45e:d128:4d13 with SMTP id 5614622812f47-462d5a198cdmr3666751b6e.49.1770307366869;
        Thu, 05 Feb 2026 08:02:46 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:103a:9c65:ad2d:82fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180640e5sm13770002f8f.40.2026.02.05.08.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 08:02:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/5] phy: qcom: Fix possible NULL-deref and runtime PM race conditions
Date: Thu,  5 Feb 2026 17:02:35 +0100
Message-Id: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=6984bf2a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=C7rGozDzmCPgz14KtV4A:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyMCBTYWx0ZWRfXyNcGXhnDiCGy
 hGydpcnePLfFWb9NhsYSAwvWRQPHia+yxMFvFOxfdhpLFQ6A4Xr7ks6V3dkJrFmCTidh/tsPvdb
 IHHjkDIHYOIfAECv7vO0fET7oN2PHaYUtVRdc3h2p3MDiJxK+xLWYS3x0mzKow43rywdcSJUDEc
 XFTyZnpi4WOLpJWA+2BY2MOEpmnZr9PguAvQAMPFd34/KVLTG/4Is8ymoRVyhPjVrfDwQYT2wv8
 gwWWn+Y/8N0jl15o//UaXSgIbEngKWyMDPb8sc63J8mUBcsFlk3l4NIRqdag4o3MAacOz8DQkU5
 sJz1WGM3WY3R0EStV6G6jCK8psVzunGdXfZPMNdzblHCLnqWxA/V9bDaUuV0MLmNBh2QJf6azAV
 HohDXKh1ZBO8riaJAeR4ZVKm7QcSu1YHNGNt2XV+gLCmNVOoAF48dyARVnvZQduf/mbq0OHK8Jz
 jkfkvY5/uNQbv9CEcbg==
X-Proofpoint-ORIG-GUID: Z5fY73WPRuRKRMJ_SMhZ20zNg4P6XGc8
X-Proofpoint-GUID: Z5fY73WPRuRKRMJ_SMhZ20zNg4P6XGc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91940-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1B3DF4FEB
X-Rspamd-Action: no action

Address potential NULL pointer dereferences and race conditions related
to runtime PM in several Qualcomm PHY drivers. In all cases, enabling
runtime PM before the PHY instance is fully initialized can lead to
crashes during early runtime suspend callbacks.

- Attach driver data before enabling runtime PM.
- Introduce initialization flags where needed to avoid dereferencing
uninitialized pointers.
- Reorder pm_runtime_enable() and pm_runtime_forbid() calls to prevent
unnecessary suspend/resume cycles during driver probe.
- Use devres-managed PM runtime helpers for proper cleanup.

Changes in V3:
Rebase on next and remove 2/6 (obsolete)

Changes in V2:
Split patches 2/4 and 3/4 so that the null‑pointer dereference fix and
the runtime‑PM enable/forbid reordering are logically separated.

Loic Poulain (5):
  phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
  phy: qcom: qmp-usbc: Prevent unnecessary PM runtime suspend at boot
  phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime
    suspend
  phy: qcom: qmp-usb-legacy: Prevent unnecessary PM runtime suspend at
    boot
  phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime
    suspend

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 10 ++++-----
 .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    | 21 ++++++++++++-------
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 10 ++++-----
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 15 ++++++-------
 4 files changed, 32 insertions(+), 24 deletions(-)

-- 
2.34.1


