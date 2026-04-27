Return-Path: <linux-arm-msm+bounces-104784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC1NKkuf72kbDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:39:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBAB477C88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD16F3037664
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044623148D9;
	Mon, 27 Apr 2026 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLfgE/n3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITU+9Vck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836CB3126D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311387; cv=none; b=JTZ+v2paOMx121b6sxEno2LkC52nBUXH74Ak2wr5LjrAIrZkLRQZGjZgiw47/JDtYLCKxWo4DvkEycWdD9vA62CFylg0cP/Ugxlj4r0OtpTe+9ORnC/d68pR01tkaYJqMCCntQGE0FXfUcwjAR+W26KDBljyz5LATZ9yust6pS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311387; c=relaxed/simple;
	bh=P5d6Br3dWmkgJQvTmqm2xZfcEwgYOHL0jl0KY/yqwaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYOaP5Vx1hKbuTvSB+CEgYbmP6URcfd+mqYapydvgGBtX/DjDcIOpILnZnKyU4qOuS1ajm0aZv2mF+/xJZYX45/8IuLLppRW4/eqlCERArgOJIuGUba8HRcTv8Lhbfeb04PTdnJPyBT3b17ZUT6QB7y1G2zkLM+HuTVeYOrWgoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLfgE/n3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITU+9Vck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYW2I429177
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRd/LNkrvRz1DsBjodx4Y6wMCeOUpdwMyOE0mSsx0jA=; b=nLfgE/n3NLAQO07H
	0zosDqQfqEQjScnNt3HdiF+haVytSMbYo4fPnVXcRyUW1JhILaI+0VmSR7TD+aUt
	+wd2Vmy2IVb2duRtoifqu2NTR7IK64zPljOp6OcUSXzXRs2hYvYTSuT7VTT3tIQC
	jL9Dkw3XxIMSItcQqxc3iUFy+1SHqS/4JoJjFGEkw8GPQPkVMmAREyXzWIh59r3D
	0n0epqwsHtnTiv5etpMsum036WWDncxBbmer2B+j4riNIKiaPr514/QcXAi7xnRl
	8yCrbuvjl0LJpiBhf1bzPfscJiEGk6H0aW35roRjHNKgxZcXJDWQXwpbd/nPHLte
	EXj/FA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x3158m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b79f4b35b7so44769495ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311384; x=1777916184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRd/LNkrvRz1DsBjodx4Y6wMCeOUpdwMyOE0mSsx0jA=;
        b=ITU+9Vck4uGiaBuGFVzjftjYYzWEXI9Bi0thw0kHswtXySmvpq1u+wCyFUJZY3J7Kb
         50GP9XiQgKuEs/93driHfOOOeHpcYUUTmYvABbp2EtgGGdmIxcUMmvDx+AXD7GzCdV/+
         JhZx0ywgqWJK0rMe+kkgnfHMt1AAtoCwFz/8YPhnCV3AfveiA219niQZAuuW8LpYySla
         OplMQ/7b+9OL13o/NG1stHwUOvKbHFMKyg0B+Zq70Lp3A1xYPE8IX6mGKEvq5Hf3VhnS
         x/OPmP0qLfHIZX8hGFwPny8ZrUTGs+vlHPiKVj/Won9AChICQCxua0JEmQSX8lHf20r5
         lt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311384; x=1777916184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wRd/LNkrvRz1DsBjodx4Y6wMCeOUpdwMyOE0mSsx0jA=;
        b=hSzBzkKkSudLL+VvXkfT22FOLYCgEC3nsza6O+JIREVZNHu+w8DIo/9CIN3Rg0qjYX
         owUsXtmqU6PLcRU8DAQ4ifw+uBqtB1QdT3hRAIm5gcYZL31Gca2jgDkVBPPNBb7AJG7D
         SA+Iy5Qmnk92xlQTbaVc3pQLMbHmAYrdNYRCb1xDQDc7Qcj2+l8r4fZClHcv64rCo5C3
         RoQPxCjzMn4Y2I5OyG+B/9SzTH5A8P/RS6sjvC/ngRhe4B6hlAbvnva/buWuFs6Pv+Qm
         Q59AoQJ6D2OpXZYYxB1cKPpHIr4jIKZQHfMokUuKVFxVUjHUhoXT4yLNOD6Gr3aEQXjH
         zCdg==
X-Forwarded-Encrypted: i=1; AFNElJ+OkNisKclEuZFsERW3mu2KOLkOfttmuOuE1EXXkVzGjWD0h9rlQOdrJmt1Q+TFqHERFxlMYhkj5uyND9yC@vger.kernel.org
X-Gm-Message-State: AOJu0YxvIq5egaKUNI58BBlZK+VuqW2v7YvhKhltDAQgTeIx3jveQk0C
	SLNvS1d7UOjYr7dD4phw/pNTw6JjAXAuH5sKJVJKSGh5YHHbiPelkoIO4zFOUNVHAAF3As58onN
	dI4Bm6W2gfZ8TKeUFFmf/PCxfLBRGnqi8OfROHMMCvPPlq5q6qFG/2/cVvZeXAHBj4PU3
X-Gm-Gg: AeBDiesV73/MXIjRPN6M2JaoauHPby5Rrxxno/0DGhcJ7QZi5RZ0qmjLWKzF/b1MgD6
	+3dxA88weIZnUpsGUG1cPDD2xERy6Qy1JDLPlohMCrEYBSUzbjT4Pc5e0sYUL4OXuNm3fbidQqX
	bLcYVdBY2UMOL0o8+eeSPhEReTqsEthj06hOE0H0L0LL/yTyeH0De3NpD4pPlD1QBIvHeVt6P3J
	lsMomeohT0vFl8QLwDeaT+JDchNblrOhwiM56vIbOXFmxutdHsaEoUiok7pcNQNGyyqx90lr60H
	dmSBY0dgTbPlbR8TdalL/UVJbCdvpuQPPhJulThDOeHqnAnAhqhUrBHu6dxcnIDt9iNX8BEvUN4
	9+JtiXzIxskHCE5BMYKyu0Bbe4ML67xY3e8jqF4DQTJ5cmbdvH2YV85rJL4BnPRr8w/Xq
X-Received: by 2002:a17:902:ce11:b0:2b0:afbe:4e14 with SMTP id d9443c01a7336-2b97a960cd2mr1555705ad.40.1777311384266;
        Mon, 27 Apr 2026 10:36:24 -0700 (PDT)
X-Received: by 2002:a17:902:ce11:b0:2b0:afbe:4e14 with SMTP id d9443c01a7336-2b97a960cd2mr1555295ad.40.1777311383693;
        Mon, 27 Apr 2026 10:36:23 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:23 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:47 +0530
Subject: [PATCH v21 07/13] power: reset: Add psci-reboot-mode driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-7-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=6423;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=P5d6Br3dWmkgJQvTmqm2xZfcEwgYOHL0jl0KY/yqwaY=;
 b=+SQenioOGcW7SFDLo6mJbiDF2OjPf6L5ZwJ8rzJ2IHrPTqZFE9/b7EOq4UW8Y0mSKF95PGCxY
 F6xXYyiRGuFD8AOML3Jm+c2FQF43heEHHn353zsVf967jshES3lBeqB
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX4gvurLQ/NdS8
 ECD837yaRpJB63ZxD/WYnpH/h0Cj9mzB3Ca69TLxGM+vW9sMofN3vpj7VNaflcWNzEIPPozR9bg
 ym/eLmfXlmuaJvJz0/97V/9nvqD3fUdYKfhESpyCCfroi1w3iVlInNZ9gnu2g/OeNQ9IEHtmb0A
 9r+x5WrSExDD62QRq8Wb1gLZ6I06xVp7bvMVN3cVweAVtfZriTqkOSiqmGhWSa6CLemTORrAIK9
 YY4rQk/STfPo9DGClATh5Zv3GYB4UXpkybbHkQQZdD5RrJazyuAY8boVuldeqylDw+pRVTOae0i
 B5Gojyp43jgu4deQMaU8+n2Q/8v0rf8CKRfQrJXJ5ObUUJZ7rsjvHkQGWnUpYZ1ZW0kaD6UgNay
 VdgNpfJ/3FGXiBy8OYfxljo/bRycPp3GHTHKa7bsuJ9EnwMb+ZBHe1QQmqfe6gxxf3REBIPwqHb
 Jv8AOMAEwsh+hbIyZlg==
X-Proofpoint-ORIG-GUID: Ii1QmRvXMep5aClxYpWI_aFL7n2fKsHh
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef9e99 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ywhReTWICjBcZAfHApEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Ii1QmRvXMep5aClxYpWI_aFL7n2fKsHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-Rspamd-Queue-Id: 5FBAB477C88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104784-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add a psci-reboot-mode driver, and define two types of PSCI resets,
predefined-resets and vendor-specific resets. Predefined-resets are
defined by psci driver and vendor-specific resets are defined by SoC
vendors, under the psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |   1 +
 drivers/power/reset/Kconfig            |  10 +++
 drivers/power/reset/Makefile           |   1 +
 drivers/power/reset/psci-reboot-mode.c | 109 +++++++++++++++++++++++++++++++++
 4 files changed, 121 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 333b01fa00b8fbd15e6f31a6b9af47600411624e..8cebc2c7e161c8a226802a4102756b4ed6034395 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21240,6 +21240,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/mfd/psci-mfd.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 124afb99febe92450b6ae322aeed3b63fa2070df..d9d1f768b8691abc3b32f2675519f2ddbaf19b84 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on OF && ARM_PSCI_FW
+	select REBOOT_MODE
+	help
+	  Say y here will enable PSCI reboot mode driver. This gets
+	  the PSCI reboot mode arguments and passes them to psci
+	  driver. psci driver uses these arguments for issuing
+	  device reset into different boot states.
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index d7ae97241a838fe1b536b2f911868e7590d12e3b..02948622fe3d00e165f941108ab92ecb66b0f0e8 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 0000000000000000000000000000000000000000..29f53d2f50da8e34e714adef9507d340bc4130e2
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot.h>
+#include <linux/reboot-mode.h>
+#include <linux/types.h>
+
+/* Predefined modes use reset_type = 0 and cookie in magic[63:32]. */
+#define PSCI_PREDEF_MAGIC(cookie)	((cookie) * BIT_ULL(32))
+
+struct psci_predefined_reset {
+	const char *mode;
+	u64 magic;
+};
+
+static const struct psci_predefined_reset psci_resets[] = {
+	{
+		.mode = "psci-system-reset",
+		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET),
+	},
+	{
+		.mode = "psci-system-reset2-arch-warm-reset",
+		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM),
+	},
+};
+
+static int psci_reboot_mode_add_predefined_mode(struct device *dev,
+						struct reboot_mode_driver *reboot,
+						const struct psci_predefined_reset *predef)
+{
+	struct mode_info *info;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&info->list);
+	info->mode = predef->mode;
+	info->magic = predef->magic;
+	list_add_tail(&info->list, &reboot->predefined_modes);
+
+	return 0;
+}
+
+static int psci_reboot_mode_set_predefined_modes(struct device *dev,
+						 struct reboot_mode_driver *reboot)
+{
+	int ret;
+
+	INIT_LIST_HEAD(&reboot->predefined_modes);
+
+	/* Always register psci-system-reset. */
+	ret = psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[0]);
+	if (ret)
+		return ret;
+
+	/* Register arch warm reset only if SYSTEM_RESET2 is supported. */
+	if (!psci_has_system_reset2_support())
+		return 0;
+
+	return psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[1]);
+}
+
+/*
+ * Pass the encoded magic to psci_set_reset_cmd.
+ * magic is encoded as reset_type (low 32 bits) and cookie (high 32 bits).
+ */
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
+{
+	psci_set_reset_cmd(magic);
+	return 0;
+}
+
+static int psci_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reboot_mode_driver *reboot;
+	int ret;
+
+	reboot = devm_kzalloc(dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	ret = psci_reboot_mode_set_predefined_modes(dev, reboot);
+	if (ret)
+		return ret;
+
+	reboot->write = psci_reboot_mode_write;
+	reboot->dev = dev;
+
+	return devm_reboot_mode_register(dev, reboot);
+}
+
+static struct platform_driver psci_reboot_mode_driver = {
+	.probe  = psci_reboot_mode_probe,
+	.driver = {
+		.name	= "psci-reboot-mode",
+	},
+};
+
+module_platform_driver(psci_reboot_mode_driver);
+
+MODULE_LICENSE("GPL");

-- 
2.34.1


