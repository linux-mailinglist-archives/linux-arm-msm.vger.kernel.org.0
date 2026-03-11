Return-Path: <linux-arm-msm+bounces-96870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDM2LsYBsWkzpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:46:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87525C869
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C10E130054ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91936625;
	Wed, 11 Mar 2026 05:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWt6ArBv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnFEr55x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3817927B34E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773208003; cv=none; b=eRyC2q6F1ogWL2GqEhFB+Zf6BP0PRc/ugEKMs2HamxfJicM2EWR0xsgMpNu4zmS1BvVK8PI3tnsT3YeiFv9BxxcfRm2LGTDO3yO+6ko5l5F9JUuZSVg2sLTsfwQWjTVIR0f3JWsXlvwn4GAKnQlJ0MdGg/mjtPP5UFSCIHMM4uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773208003; c=relaxed/simple;
	bh=iguH8XDPSekwCbNvLzdbE9/52s4hYfTzQ5S7iKLMu7o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g7FE5ybi4eaqQkv2Nucz+32jGXXmIOdZuPzbEE9Quma1Chjr5veMf84IEtRwnDSoFS3/Igr6wO9UE2/cASialZnSctDEq2DT29NXEJVTREIVsaJ4FcCqeIKWptoRr+1OuFuireeYXjIqpuE0yxt2agkwM71ha+i9DshMp3q4HvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWt6ArBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnFEr55x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AKv4Nh1863466
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=76e3Iqlg99CdchD8Hdokgo
	bp9u20UkSViv6UMrsoxZ4=; b=PWt6ArBvXlj/E8ptGPYWhzjS7CLnL3Td+yrJD/
	8vdjNlXq8hRYF7GMiDHULup03gJVXQ5DkLyFZ8zFA0P2UlAqhH4i90K3rJl1G8We
	5ANaAXxWo+m2mY8sC0+p5TjyD7SaU4oixnTHZuu0lyKvV00d4djkzjaQAk/nL1VF
	5wlWAF/o24guWPW08+9cWHKYzNc+B7FbN3xkEZoW8PZsRMtbQUfb6DI/3vYSwg4I
	Jj28q2tU2AZ1IyWyDr8KY7SbrJ0rtNnw4uWDNGAwwryIXCNjF9cpz+kSjAmQwSOG
	v7y46POJZwYnyiZyxAEw7OMoEgeCSY9p7GnuJRAd6Y8Rt4+A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw82ye8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:46:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8299c57642cso28928967b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773208001; x=1773812801; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=76e3Iqlg99CdchD8Hdokgobp9u20UkSViv6UMrsoxZ4=;
        b=gnFEr55xBNYtRPykcFd1Pv8KLv7k3Nbz69av5cYPpXGT29v6UGJYLtlJq1SzT9lmNX
         f+Pz1yqyii44dGR6mKAvyvo0cu6Pv0LHhRv+KqvyUntH3LXkTQszH48+2caAUapAKJ2p
         rbH/NxqD7FfoWHlIUaTkSjiOwLjqEM9tsEImmjct4VXflEh0ek6xLNBY4oAptC69Rhpx
         KnnZZHA+9VwCh6lVaj++z/Jqh0vOSHg8CcngJ6uYJlJo5RFtkQqvGTnaeNUoh7tR24vO
         +wvfgX0qIt/CJ/0pumI9eznNnIuGBq2olzRXSDyDnU4DmKKyHdZTsKh1Nhp6GNz+lsD0
         wGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773208001; x=1773812801;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76e3Iqlg99CdchD8Hdokgobp9u20UkSViv6UMrsoxZ4=;
        b=kXjm5p0wGN38/a2k7zuurUy91zGtC54PA1D7IM/w/Pk7apd6ZQ+y0Ttm1gprRTHXeE
         c/R+m045hTHrO6UYYL6tLdL1zot7i4/hnsBMh3dOpCpR7El/9f6l0xCARc3itmG/1Qfq
         +VUTu8w1Y2Cguy+5UHmd/sFl29Bqgjza44fc07CmjkQSaUxcA9HnkE15wBEKDSyrOYhD
         4psYfvS9wDWKKPYmbtARuKQUEczzc4Mci4y3Lk8wu/J+91zgK/IlEwxpDBw/YKenrwkM
         oNg8qIHDRZJRnf+RxsuxRZVR8KSyYBFfmzuBtCnk0oYQ4+QyCwLNEWZEpc2styXdzjEZ
         zDJw==
X-Gm-Message-State: AOJu0YxPm90chyA24Fyv9+OvngmtM4/rht9c2MUPt3c5c/9Iz938lc5Y
	CeXDiOqNxjxf3tmIoKEEjLXroY5xAwgsBs7Rjv8NmIabyHKaibN6PNrlrQeJythOT3F73bkVQL0
	KyuwmplZtGNyVwWvhg+wCPDJNQjue60LZPYy8RicqqSJbEe4AtgwA4JJk+tkypcsQldcS
X-Gm-Gg: ATEYQzyyp4aLVwdQJP5ffqtb4zzGG5hkD8fmrN/wz3q4rVUClyaeqOxF/UYVHaAKjkq
	X5Y9ASz/wsP0VOiZQ9o0h9rHPl8lEwNjLe2grul1DnUG8XGDVkJ/Y9Z/n4+9QaciGz9GK1jZm6c
	hjj4Js82DSQw0HJpX319wwzwboKeU+MFSee9Iq03jNU5DEeVvmMW9OVQF6+/+d07+EB/9hJMQpi
	DQTD5lFLyz5dPm8F4f2jdWBkjBs3iW6QymI49Z1914MAJMJTNq/I0pCO9wI3HSsrfUBLucjrs74
	e7aR/kngPlTn9yesl8qVk6NjHD8OIViKS9+aOPG3hgVxflEOG6JyAkdJUp8nFYEx50ZA2GsCn08
	amtCapefnV8ECT+Y5F9riFFdOwHF1ETaudURjnJNov7fWX77TEF4YmP0=
X-Received: by 2002:a05:6a00:4b0b:b0:823:1252:9428 with SMTP id d2e1a72fcca58-829f6e932c5mr1531043b3a.9.1773208000626;
        Tue, 10 Mar 2026 22:46:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0b:b0:823:1252:9428 with SMTP id d2e1a72fcca58-829f6e932c5mr1531012b3a.9.1773208000111;
        Tue, 10 Mar 2026 22:46:40 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6eebf43sm1114108b3a.39.2026.03.10.22.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:46:39 -0700 (PDT)
From: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
Subject: [PATCH RESEND v8 0/2] Add support for Gunyah Watchdog
Date: Wed, 11 Mar 2026 11:16:29 +0530
Message-Id: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUBsWkC/3XQu07DMBQG4FepPOPKx7fETAx0ZYARIeTLSWKJJ
 hC3garKu2MyQCSTxdLxkT/r/68k4RgxkdvdlYw4xRSHPg/1zY74zvYt0hjyTDjjihkmaHvuL7Z
 7/bQn34WhpTxwLY0UNXJD8qv3EZv4tYjP5PHwdHi4Jy/5vovpNIyX5aMJlu2mOQFlVFjUhinBU
 Lq7IaX9x9m++eF43OdjISf+ywBjumQ4BeqMCRKCVFKxDUasGF6XjMgM6gBoc0wHYYORK0ZAycg
 cqrLOASKAALXBqD8GWFUyKjPSaxSN0+ig2mD0igFeMvqn4toGBk0drN/qplozsmSqzDTKg1LO5
 Jr/CzXP8zeqyIJiZwIAAA==
X-Change-ID: 20250903-gunyah_watchdog-2d2649438e29
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dd521
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773207995; l=4897;
 i=pavan.kondeti@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=iguH8XDPSekwCbNvLzdbE9/52s4hYfTzQ5S7iKLMu7o=;
 b=Ro9OxZOViqWtDPyjOKuUBl3mCSOFV48+9LHQkWR5GG8XgnIBtB+58ErccyaXVX1rOF8HUYcFD
 Yi+kbD24UYfAs9ItmydJrCOjYtftjPLwGzWReFPF+uVEYP9mmYGOQ6Z
X-Developer-Key: i=pavan.kondeti@oss.qualcomm.com; a=ed25519;
 pk=Pdl9NnQpMlqbYaAGGkgBGpURTnZFe2de5LRZSGHkbHY=
X-Proofpoint-ORIG-GUID: y2mPsSdn1EOIEMcEL6sgdvD6GW2oo2GX
X-Proofpoint-GUID: y2mPsSdn1EOIEMcEL6sgdvD6GW2oo2GX
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b101c1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=SB7onciJ_egD0uDeQz0A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0NiBTYWx0ZWRfXyDQlX8yOF1ME
 TynN1J8OXCDNiz1LmQ31lLGf9IaVJl7mSkZIHtDZJ6KJEZfCW7b6IZXy9jwVwJFu/Ez672gH1ua
 xCWCZHamu67n0SYfNUbk6g3mSmb5y3V3LxdY+DEKnY82P+ba7l95jUyD/HA8akK67a5bkaLJtPi
 AgyXnVidghye44e1hjGF8Qh82w2nClaIi1L7l+C0r0qyPJml32mZ+9zRnKBxwJGpoAYWjsiCTK1
 1OZ7zwsgRfS2atvOwxGEslofLONVDB4BsGMZ5vWhyvjpsWQEa2+R1E5vn482ysxTUvq9jYQuxuc
 g12MnIZi22h1wogTX2d46Cy8nFYTRrTgNrKSM0MWUre2nVCoCvMHJtjFQ+gKluVNuFy0ISNQqGu
 5yiA1mZ03XO/xK+H37BXc5gw0tjGu3WgalExcBofhC2LYl5Y0EL3auDR/DKYxq7RE97wNi0FCyf
 xO//vah0knrC+qIM9VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110046
X-Rspamd-Queue-Id: 5D87525C869
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-96870-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavan.kondeti@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Gunyah is a Type-I hypervisor which was introduced in the patch series
[1]. It is an open source hypervisor. The source repo is available at
[2].

The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
access the MMIO watchdog. It either provides the fully emulated MMIO
based watchdog interface or the SMC-based watchdog interface depending
on the hypervisor configuration.
The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
version 1.1 and uses Vendor Specific Hypervisor Service Calls space.

This patch series adds support for the SMC-based watchdog interface
provided by the Gunyah Hypervisor.

This series is tested on SM8750 platform.

[1]
https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/

[2]
https://github.com/quic/gunyah-hypervisor

Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
---
Changes in v8 (RESEND):
- Since Hrishabh has left Qualcomm, I am resending it after rebase.
- Link to v8: https://lore.kernel.org/r/20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com

Changes in v8:
- Fix error handling in gunyah_wdt_probe() to fail silently with -ENODEV
  if WDT_STATUS call returns -EOPNOTSUPP, indicating support for Gunyah
  watchdog is not present. Fail with logs for other errors.
- Link to v7: https://lore.kernel.org/r/20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com

Changes in v7:
- Convert local `const` arrays to `static const` to optimize
  initialization and stack allocation.
- Link to v6: https://lore.kernel.org/r/20251112-gunyah_watchdog-v6-0-38ad01f8dac0@oss.qualcomm.com

Changes in v6:
- Fix build issues reported by the kernel test robot on PowerPC and RISC-V
  architectures by adding IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) check
  before calling arm_smccc_hypervisor_has_uuid().
- Link to v5: https://lore.kernel.org/r/20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com

Changes in v5:
- Move the gunyah_wdt device registration from the SMEM driver to the
  SCM driver. Add additional logic to check if we're running under the
  Gunyah Hypervisor.
- Implement .remove() for gunyah_wdt driver to make it not persistent.
- Link to v4: https://lore.kernel.org/r/20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com

Changes in v4:
- Move the contents of gunyah_wdt_init() to qcom_smem_probe() to make
  sure we're registering the watchdog only on the Qualcomm devices.
- Link to v3: https://lore.kernel.org/r/20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com

Changes in v3:
- Move back to platform driver model. In module init, determine if we're
  running on a Qualcomm device and there is no supported memory-mapped
  watchdog present. Then proceed to register platform device and driver
  for SMC-based Gunyah watchdog.
- To determine if we're running on a Qualcomm device we're checking the
  presence of "qcom,smem" compatible devicetree node. As an alternative,
  we also tried using socinfo for the same purpose. When both
  gunyah_wdt and socinfo drivers were made built-in, it couldn't be
  ensured that the socinfo driver probed successfully before gunyah_wdt
  init was called. Hence, we resorted to the devicetree node approach.
- Limit the errors listed in gunyah_error to the ones that can be
  produced by the driver.
- Link to v2: https://lore.kernel.org/r/20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com

Changes in v2:
- Move away from platform driver model since the devicetree overlay does
  not happen by default.
  See https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/
- Only when MMIO-based watchdog device is absent in the devicetree,
  proceed to detect SMC-based watchdog using GUNYAH_WDT_STATUS SMC and
  initialize if SMC returns success.
- Implement pm notifiers as gunyah_wdt is no longer a platform driver so
  dev_pm_ops cannot be used.
- Pretimeout IRQ is no longer supported.
- Remove struct gunyah_wdt since it is not required.
- Move the contents of gunyah_errno.h to gunyah_wdt.c.
- Link to v1: https://lore.kernel.org/r/20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com

---
Hrishabh Rajput (2):
      firmware: qcom: scm: Register gunyah watchdog device
      watchdog: Add driver for Gunyah Watchdog

 MAINTAINERS                      |   1 +
 drivers/firmware/qcom/qcom_scm.c |  53 ++++++++
 drivers/watchdog/Kconfig         |  13 ++
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/gunyah_wdt.c    | 261 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 329 insertions(+)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20250903-gunyah_watchdog-2d2649438e29

Best regards,
--  
Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>


