Return-Path: <linux-arm-msm+bounces-108574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ55OpaaDGqTjwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:15:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9699582E40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13D613005318
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D253FC5D4;
	Tue, 19 May 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVXwd0la";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eew13V1y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62ED3FC5C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210897; cv=none; b=meu54gcbdMbC3bL1oFE2db7INrv9uwURW24lAyL5JqPFBY7a04uGI5lS2o0kURfFXewvFpeOtBP1R6XAeA4vwmRchnrk1vsWzCoLzgIQd+qEkfyzYYudHpIbS/qCz1qB5i15MFejY/goqV99WE2t+btsEP87AhyQSnafETA6jzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210897; c=relaxed/simple;
	bh=AzdLA1TzAsCzuU/MBrnUw/9CewP7MVdZCq9MNreNRZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vAR0xWCVxwznNrUOIgCE5ldlhJB2FSZfui4Gfp4MuNfTupZ8bZzhlB11UouMAd4TBGiRB2g8uZnQi/9HvxRIJkVrWzBH5xyGxyW8BweA0Z0XzbwnqTynYX4lHgVJAkxXgw2Tv8gVBckrP2If7J00D9tG3eYsAZtCjuLMjNnOSxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVXwd0la; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eew13V1y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx9Y41953936
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=661ATbGkgPTBuBK5BhuwWyi11aQQCSuMWmT
	9eAVX2m8=; b=cVXwd0laNlE4IczR/FTlPsfYT9724UXYSdRk3UjoXLPXo58rzaJ
	ZEoTIYxi/Mjgp7Sr0YAYZ+BvEDhLds++XmpnkC8r3nTKU1W5qVZX9CIa8izFtzXm
	tsPmn9rT17iuz2ALDbmF6pmf62hjW6DhOGv7xi6X2Y3d5rij6R/RK9LiqQMKzccQ
	ftsxosw//NdqQwQBBoC6sT8s7p1YUumIza5hk9pnx3/nGQeR3WIsuAWszB8GgyAp
	I6a4P7K1dtESzhK/WQWvwONX9/gFm95VchAawUU+Ej/xpg3Tsjb1BAjnNx5Trvf0
	LqWeMaXFsJI9oUl4p+4ND1tQ39hViLN9qxw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xrn0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:14:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-835444b6ce1so2556211b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210894; x=1779815694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=661ATbGkgPTBuBK5BhuwWyi11aQQCSuMWmT9eAVX2m8=;
        b=eew13V1yFyEwBbLieJI4aKe+oacB4w+S24ptAs3JOL6Un49pgcOiHTFbEOozJV5t2l
         yMNRfvv4wOA3csG6gh9v3z1MjNq/Xy8YzOH2ielPVzl59h6+UoBthcKFU91lkZTqnq28
         Hf4ENBazPb92gQntHY6NONZ6qyWD+gnVRaFXXPmsMmbPvdcp88IZeVWLOgCv23vk0hh9
         ajh91Nb637+Au7KhH56BcsDUjRXNFNxVrv0jyWDRYzypeZjJK1T7WJW0N8tOoHiTaiNo
         y+6Ov59a5Y1f5TD+vLmAeOh80v/CFPUzMf8QxVq5yrl/V5Q1RluHsm0O3wpIy+om6p2I
         gT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210894; x=1779815694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=661ATbGkgPTBuBK5BhuwWyi11aQQCSuMWmT9eAVX2m8=;
        b=ZQnQHvx1K5LoCL4AcmdJ6EWsnNbmvziCDmZzKaIryw2S8cW5pQqSUciPf7HTPNYkL9
         a3MpKyRqAv4H/wFIl6qabFx9F4MwufqlQANxdO3dKvedDN+Ht6dEcn7XqdeJPMd+V4XT
         A7ej4meLIiqqYIWezeCug6cuezqgR+x3121yUGt04ghqGGpf/qX6Dn3u2Tb8gYrrDBVd
         SwuF9avUaSBgPdXpzWiPIJniAPAi9wn5Qz8bN1YYwX9exeLUmscj5wBzsxXHKracdXPQ
         nPrb+f6t3u4DPoVNyRhC/zeFgeDcRfyv2gOSFtKQxiyAqWK6akEpMnkTlKIrsdg5UdXo
         /EwA==
X-Gm-Message-State: AOJu0YwDZjHRmYoPfQaSkouuQ2SGEm7qWoYexNu/q7WCmP9hu18HZ7rO
	8jtGwkMI6VJo6hWgYvYnH4RMP1OxLOaZFvs5A9gzSUh8goBkH+qFdn0o/KW3OyCjDsWvAt6SzA7
	23PcglabHF+pOVj21yTnuMlG5T70aZkccEZEt6nplbaiQEuPRjhBd7ffAz4rB86W2CBAb
X-Gm-Gg: Acq92OERmEYc2ei1QkCyH/TY2tiETTFynGXLUl7qJk2UhnLqVt63mT0fUgLIjoQrKLo
	NPBPNMnHtZsJzpIVNjBoiX64pPMXl/MI8E6qbBUQz3KXx9Ky1HCUGJBtQ7++6l44eaV8iOPYRZc
	9ZNp7baHjeSee8pwpqT7Vpykk/ZLcxZIQE/IR5Z+yA1tCwEI12vvPWkL24i7N1KjXAkFq5dgirK
	/4mnuYeeExZfuxBvyMLoKaFLf2cFVenZlZquovFzTREIe5UZqhZnkHpDMliWyqwptlpGQ7dWnzt
	1LAXncxGDTFW+doHGrz6PDDUjGynYGqg6YMkGTT32UZMf7uQGd5mHFffz1j6CErcUz6z3jVxIGL
	e7P/YQsqc4BOIU0kl6XMDfnpJDJt5urSuEdhFY3+J4VEQ4cHg
X-Received: by 2002:a05:6a00:130f:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-83f33c54896mr19200027b3a.1.1779210893965;
        Tue, 19 May 2026 10:14:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:130f:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-83f33c54896mr19199988b3a.1.1779210893254;
        Tue, 19 May 2026 10:14:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm18634720b3a.41.2026.05.19.10.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:14:52 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/4] firmware: qcom: scm: Add minidump SRAM destination support
Date: Tue, 19 May 2026 22:44:38 +0530
Message-ID: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0c9a8e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Uf9RHLb8GrDHKnSoJrcA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: DUbJl90b22TlqEwEzSyYDauD9AN50J7Y
X-Proofpoint-ORIG-GUID: DUbJl90b22TlqEwEzSyYDauD9AN50J7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MiBTYWx0ZWRfX67AsHd7baVMu
 0Kr23uh7OvQfRTqZGxg/a8mwWe1wubK8gt6O7BrVuodeBwp7ZsXPLlFwMVgZGejHGvKGe3ZJpsb
 DKeW9kHNvVRV+JCn/gLkDt71dSGQIljB/XUntL6QhwxOo8+oc+EZnz4B1XWLzRtrRInjqquyXuw
 GxglCwAP0qkFLMFx04rR+5PbmsPUw5cK52afYTrLrsKsSXTp6eHdzQ6yOD35SwhmSHbyp7NO0rw
 7eHMW/Ryv1VPk6UorddhrGcSWZZuYta/2LBwDSambpWaowrXrvYejBOusnePwHwMOWcInAqPCTr
 /dgwDuVCKLMVZ2juxlBCIq+YXjY+00IS7T6nwZTBp7RVeb02gsckjQ3D+8EYCPPHGvtMwK2lFoR
 kZDExEtXYptZlPBWR6NNrmIa6mDcAxDg/w5j+VpLMS05ydRX0TuMVU2Pl67Qrrk9UFVD6vVISMC
 oAcNtZahMi4GyiUFYew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190172
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-108574-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E9699582E40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
to deliver it (USB upload to a host, or save to local storage).

This series wires that mechanism into the SCM driver:

- The SRAM word location is described via a 'sram' phandle on the
  SCM DT node.

- Trivial change for consistency.

- A 'minidump_dest' module parameter (default: usb) selects the
  destination.  Custom kernel_param_ops expose it as the human-
  readable strings "usb" or "storage".

- Add the support for Kaanapali.

Changes in v2: https://lore.kernel.org/lkml/20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com/
 - Remove the restriction on the binding change done in v1.
 - Remove sram-name from binding.
 - sram definition is introduced and merged, so removed the refs from
   v1.
 - Minor change in the log as per comment s/find/get/
 - remove reference of sram-names
 - use minidump-sram instead of minidump-config.

Mukesh Ojha (4):
  dt-bindings: firmware: qcom,scm: Add minidump SRAM property
  firmware: qcom: scm: use dev_err_probe() for dload address failure
  firmware: qcom: scm: Add minidump SRAM support
  arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node

 .../bindings/firmware/qcom,scm.yaml           | 16 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  5 +
 drivers/firmware/qcom/qcom_scm.c              | 94 ++++++++++++++++++-
 3 files changed, 114 insertions(+), 1 deletion(-)

-- 
2.53.0


