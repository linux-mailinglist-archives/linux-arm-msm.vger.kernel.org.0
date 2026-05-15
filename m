Return-Path: <linux-arm-msm+bounces-107910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLCjJ+8YB2rLrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:00:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2142E550140
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1722330F1DB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEA647D95C;
	Fri, 15 May 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0kVlfhy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cf3mspjL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4742EEBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848952; cv=none; b=M3/cX/U08+3tHPa7mzukdmateITgvakJad2mnTi7elNlfoOjBaHYGllNxlb/pYeLSQP0KYVSoWDAw+j6SsWe5+88tejMmRAbWUjBO+jJ+2Kq80TACb6qYpQpIhi0pvStyV44mRqMW079+U6MZ6Z3kDZak8ihssJ9A4sUED64kyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848952; c=relaxed/simple;
	bh=fKYBDJdXDp67Zr7KM8kkWqEN84dwC5WY1qu6gcK8d+U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kznQaRgyihYBmm9yReMD1Y8rByyvR0dOrq9rh37lEzaoSGLUro254dHAg/Ewe2W7mDHZY+4dX7QhIWL6bHR8ENfPEmxkmUTtjjFsSSVt8dUU9TZyEXqkDyDd99/BBRsL8SENJ9Jm9Zt8z4xJpplRHwReCF8T/rcVBbeYMzCYlpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0kVlfhy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cf3mspjL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBIVI84008297
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mNVZHM0vaurUkrmXeKukxyvOImFgIrlQCkN
	FvjRNZcI=; b=G0kVlfhyY2obMrR3HkjqumwaD28g+4iaT9Nv0FC1yqQmymYXDac
	54JFDhVgmkPjZ8J6NgyuPJBog41YPfXH6ik6oMQwcVYwxKLhJflF+lWfUhgbNekB
	CYZDG8ms356a9YjRxXTWBLnkfeXw6mNCiSbiRAiJND+fq6x2sSD7XO7dpu5Ipywc
	32lU5cq4GMlGdFH36igqoQmUSVG8bfKFgoz1s6cPyrcU9TzTHDDNQo9neG289NPa
	yoxokS5USGbls29t5pBYqLsG6cfYTOXAPn0oQ+qilvdhiV5T1Z38Av/ZMlLVDIbZ
	+4sYi6OX8JTggvOoTuW42QPgXbDDEvHjkkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su9j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7748d0aso84747555ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848949; x=1779453749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNVZHM0vaurUkrmXeKukxyvOImFgIrlQCkNFvjRNZcI=;
        b=cf3mspjLi4BNuWnoFpnZZv+J3vrD68jpJOcfTid2tdZEX4P209y1Laue3Gz8fv6MCW
         uinPVaaHMgge118VNPDAcBmVDz9hc/Vm3ql/4X1EJZCHOw8TtMjkrAghZrtk9R24ibCb
         vTT7zpe3FBcYoC2zUHWEyu6RSHC3GrWr0jnHx5tH293Vr/MRB3CyiB1vp9p5fzjJAhPk
         Jvs4nohkUaf8C3i18CxzOhxm+OZhXmnYpqT17dxp7r4r7zRKDBmzT5wA5vFqcgRbbUka
         w0rOrbMWzoa11KCLskEebx+CZcX/AgZ1qk3ZjDF1LiruA1ArBq7Ag1IrucCqc6qY1mnh
         qp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848949; x=1779453749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNVZHM0vaurUkrmXeKukxyvOImFgIrlQCkNFvjRNZcI=;
        b=MhtisrM/8PZUUVv5v1/lueE4wmaDNnH7WZ0e98aSAcGcCJ0Omgeg5HeaQv3sSxpFOM
         Rpg+9doScpi5aTjKcoOlR95eJbg7+RkNJWV4g2vGfoYVciOQaN/xqpM2j0/hAyGkWj4+
         wrEleT1cWkH8QZD/esxFz3ovcYjiCit35kQwsX72H/T3rnb2HqqtIquEsYljo/nFxi/l
         22CGyZOMvzsXz31WQk6XG1z1/ptJjNUoJ+Q4sy/NFd07esZVdFDFUIHYNhBHOeJ4glDX
         vmS1Li3QZ99S4ndZHJuAT/a36pFr6dTyGpBtwW5zkjoklYDWR0Tey5J7s7snsxTELgXJ
         P1ig==
X-Forwarded-Encrypted: i=1; AFNElJ+H65gJnlgaYHyCHRCFO4jtjfjs5sQr7eAcXPus2Ou6I4u47Grq8jDDHm/U2GoZXhFnvJRlEhVxUvS+TmuJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5QVTlYqUcFxvW3FTgv6VMD6j1QlrfpujAukSEZSMU6tglyfin
	N8DgMnGksenJ8g1vV+67d87CNuIZQj1c0pmdFZcs4kaAO0fA2K62XlEJcPQ9Mq1IOA5wjPlM7Zc
	BXxpEePZaRn5Gi1T7wl/71eXI4Yk6swQ/oHsAzMiOhr+S3Gdx9AAuDqi0+X+TGqGvbnjX
X-Gm-Gg: Acq92OEjfWutQJJ8qWL4M4RYTuMqzR+2aXZfnKjBD4nUDzR9ffMQErptL80qKfSki/h
	T+PZL+ydxC/BpqmWwMutJBYIm/GzUa3mRBXgHQgy+Vpnzj9cnJrLqULOb+57rl9BbUpDfJqaqYJ
	HjtdH2C3O47/7yx8HbNE6MAPDUmoxkBmg4otss1Os+qca7gK1TiYqVfjZEet9JnL7mz9WiiTDG2
	LaBLLusp/yzFMqvolGv32ALogYP1527IIZ6ZpyGTOvwniWVzgQbvSncQkXYKU8R7cR7aIzyrcH4
	8qpQoMK8OJpADPMsVaMxzNz3tJ+wX1USKuC0sfX0SddJRYX92/xIeY89QPx+rC5dueHt4jqZsG/
	QH2zT33roTHkkIiLjwJUGqho+slDK7s9V4MwC/UmIb/+DSciclJDaNyry1O1DG1P6i35VezSPoq
	uVRZUaaBOcZcmn7/1A4/U=
X-Received: by 2002:a17:903:3c28:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2bd7e8d3b9fmr45081995ad.26.1778848949215;
        Fri, 15 May 2026 05:42:29 -0700 (PDT)
X-Received: by 2002:a17:903:3c28:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2bd7e8d3b9fmr45081585ad.26.1778848948761;
        Fri, 15 May 2026 05:42:28 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm56119395ad.25.2026.05.15.05.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:42:28 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
Subject: [PATCH v5 0/5] misc: fastrpc: Add missing bug fixes
Date: Fri, 15 May 2026 20:42:12 +0800
Message-Id: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PpRwjkfyKQ9sJ6ayUnni7NhOuMmWG61y
X-Proofpoint-GUID: PpRwjkfyKQ9sJ6ayUnni7NhOuMmWG61y
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a0714b6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mSfM1xQJxAVIrMv2y48A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyOSBTYWx0ZWRfXyoRjq09rNb12
 FumjlmzzPJS5nltJFDDp7t7lFqBzp1iv2ys6WDg9VGNcp8+Tn8BTOKLqn3/OJotC9wjzf8MpZQW
 3KQKvUZkV/mw4z/uUGreQGv8BY8ab3C4/uk6aUZKQYFQaEci6mKEdlQENC89pEFKsS8kn8QlvV6
 NUxkgpelOSeBieFPEVBeZE1dMK3Je0C9S3GiFgunq86af3VUgKO3SObXN0DGO2lR7lbexlzGuH5
 IodbIjQ1qBCOGJyjiAKg+9OQF7zFV0RTQJmJBKaMCaU/Ir8OzW2WtqiIJS/Zl2ape88hSOgs+6e
 M8ZyYunrqA7+zxf1XFQK56lHa6H+QQYthBTp0Ai0UgkavGQOqSBl7i1b8Ol98NRfY2kc/Wp+Z8e
 76vSHXg02TWdrxP04VPO0fgta8r7ZFuwJmMtTm7wtI10g9DJTXOMmuH7EFTbow+P6Y+JQN6PEPS
 bk/UY52mPjY9Oggh/bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150129
X-Rspamd-Queue-Id: 2142E550140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107910-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add missing bug fixes in memory areas. This patch series fixes multiple memory
handling issues in the FastRPC driver, primarily around the Audio PD remote heap.

The Audio PD uses a reserved memory-region that is shared between HLOS
and the DSP. Allocating and freeing this memory from userspace is unsafe,
as the kernel cannot reliably determine when the DSP has finished using
the buffers.

To address this, the entire reserved memory-region for the Audio PD is
now fully assigned to the DSP during remoteproc boot-up, and its lifetime
is tied to the rpmsg channel.

Patch [v4]: https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/

Change in v5:
  - Split reserved-memory handling into separate patches

Change in v4:
  - Fail Audio PD static process creation when no reserved memory-region
    is present, instead of silently proceeding

Change in v3:
  - Adjusted the order of the series, placing NULL check changes that are not bug fixes at the end
  - Modified the commit message to describe the bug background in detail
  - Switch buf->list_lock back to fl->lock
  - Add locking to the operation of audio_init_mem

Changes in v2:
  - Remove the if check outside fastrpc_buf_free
  - Store the spinlock pointer in the struct fastrpc_buf instead
  - Allocate entire reserved memory to audio PD through remote heap

Ekansh Gupta (3):
  misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
  misc: fastrpc: Remove buffer from list prior to unmap operation
  misc: fastrpc: Allow fastrpc_buf_free() to accept NULL

Jianping Li (2):
  misc: fastrpc: Fail Audio PD init when reserved memory is missing
  misc: fastrpc: Allocate entire reserved memory for Audio PD in probe

 drivers/misc/fastrpc.c | 135 ++++++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 64 deletions(-)

-- 
2.43.0


