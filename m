Return-Path: <linux-arm-msm+bounces-102411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P5JGpZG12mTMAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 08:26:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE10F3C68F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 08:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AFED300CBF4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 06:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AB130CD89;
	Thu,  9 Apr 2026 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ti2zcQoN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGaf/t2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727842E06E6
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775715987; cv=none; b=TbpYJwukX8nD8Fg4nBHIUKezCEqdymXI07I8UZ7lFDvPl8Gga8kh6SDgArbdhjK6LAgpPsE0y7EUfUKAxXHflMKKH7nIuis7HQhlJVCWih1dc4Xtnuqvlgk8mZ7JWs5MByGQweSLlZydHcHitJTPFjnEnfTOX3ESSiJMQD5YHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775715987; c=relaxed/simple;
	bh=/xOm6TyNauC3DzQ45c2C0G1NDXqTQyctsguu8Z1akjw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=if4wnzZZ5ZlFmmOx7vXJS6Gi+yE3uj/64bjq7AkODDjzaB/uy4MuWT+etmfCw4feUOT1RFi4JzWcEso+QUq+jUKBlrhEzqFnhyjmfY78fVi/kTFjeqvrf6TBhLQR63zfDyDZ2VRNc4G9qQUMP4c6AMRqMGPpNXFe+KUxeBK/q3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ti2zcQoN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGaf/t2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394ggxl2615182
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 06:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=shontEpkN+VyNwHrAxM7Bh6b8F8XkVW6TSO
	Gp+P9W6g=; b=Ti2zcQoNche4LFMWGOwpIk6RXNyMJi9ZTGNh53QzM/+kG8hUViz
	vMQGytepK1h7BDd6Ye52VDHQS/Kh0huLaNc74YNfgACDsc8Ipm941tVYpXz8XKR0
	XGMtDseS9yoTe9iJmdHDXKywM34PWPRPC0GnxBXIN0yRdYJtG8s+08m9LElzx1jC
	rnOeRM4GGoHiT/YVR6RWptL8mq7TkC66m6VrZL7MjTzBSNinz8jNpC+0jKm99+9I
	HoGC0EvcM6Iz/O7DuHf9jbryIi/8Dk75jN21QWVbNKujAu69Ta4RfMZefujMn/oZ
	cJ2/4NnXyQlH3E9QOCD+xdRbPPSLZJnVm3w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28tse0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 06:26:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0b0aae381so8139885ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 23:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775715985; x=1776320785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shontEpkN+VyNwHrAxM7Bh6b8F8XkVW6TSOGp+P9W6g=;
        b=jGaf/t2gQhV8KKfgjPPVA/E8M9w3aab8MlSC/4F8So5o7VVyR562BHsVu4Lb05mqpe
         F7LBWUW4Z/y06oSNFReDzcvboT00+eMyUFofpgoC2Pj5r96Ajenpo3OW9Ss3CKblSwMz
         QJ25hYF9rfp3JW5HiDboGuhZNmmRN+ulAI/81m1CMkbU2Pgs+PI7n+/fZ2NqAVn9H7oz
         6W0kVtx3tICNWIBqr9feA4fFiW6JNEqmEa9/Ni7VOJIf5+XI4EEhVVEZCRlUhfALqsA/
         2f4NgCbJzW+UDjJlN/gHLmPrNzwK+FRgdurRCXe2OvJfku6yin0I89X5HPW1adVJ/y4K
         KnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775715985; x=1776320785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shontEpkN+VyNwHrAxM7Bh6b8F8XkVW6TSOGp+P9W6g=;
        b=QHIkKYcE9JMY1UuArSCHrjUJyhplaoAe4RdkxEt7eVAM4m5naolmupOm5nttv+0Lh2
         EbzYXDAse0afkON+m7ce3x6rIFzuGY3ZCGjZtF2XQbeRbp0jlFGGerv6sC5U1y4qtvAM
         Sio0VXZ474IE3RtI5H9hHVMQwhGbJpvmg4YSyDkgjMDHa25MMDr37MT5Os2Z3bftfwLZ
         xEbkjgUtMTzAl+ne1VjZMAkdkQeJmIvnncJwh9c5FYs7ugC3df/44XLLKLlnZeh/tl1Q
         s9rjJyHYRAFbkHVs3Gnyz6L4U25eF4O0tOooQKOvjR/nmY0doYZmzaS/ucgoDHvr1jNj
         Fzmg==
X-Forwarded-Encrypted: i=1; AJvYcCVs2VPL7ufBjHHPDXysYn07y4kzON1OY/AAL+KtniLQ0GbvSiK5Q9JCDaIx/+Vp1xY0RyIeJVamSUP1rMaI@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRjjHDPRsmQ+BN3kdsatcq1pIVEV2LgQet4s7b2yuvVwF9BKZ
	MnUvTfXfqYKLzk44dSLIRi28i+s11t+no3uNpDRzQITMOxr64suW9eBiugOoA07aacjcdjvBD7H
	UXDWnxla3TYeWo9rukVcmPtWpf21ccmzIievp3mnkjrNqMo8AumQnP8o6klD8AO0hBjOa
X-Gm-Gg: AeBDietKzcrecFSAPRie86Ff1T7BRo5ou5OoYNbz7TP3S8z0x1yCjh+L3SQJttPEstp
	cRiflYcdTtXwbJlUHMoiR0C2Z0hQoOSgSRNwj9nnPUdQTIdSVkp76FR/Lpo3QpGFbhzLncGKoRH
	BOZXXIzJhqwofTQGCABHywtF6keMmjNUpAfM+LLX0+afDfQNCqghn7xneBjOA+5FR7MFNCkhuZD
	W9rRnO0h3oiiobNDZ8HqPqvddB8c9W5LDCLTIkxe31O4B8J3OZYZ86VD3OwxJxQU3i9No0LY72g
	imiv4HUQTzuZXeCF/RYnbWieonSpMgCIvsScFZq6QQLOq/6kHWY9ETMfZiZGuTrkOp5l3kmpKtK
	3anfp895XXppvfQyOB7lhcSR48n212kBgBDDAcI9sEs0MY3kAp5JS4FiZ8F/xEuxAP8lVEmSWD4
	uzeWXLmdimD5W/Q1PP8Q==
X-Received: by 2002:a17:903:384f:b0:2b0:b41e:c5c3 with SMTP id d9443c01a7336-2b28176a416mr247491925ad.29.1775715984845;
        Wed, 08 Apr 2026 23:26:24 -0700 (PDT)
X-Received: by 2002:a17:903:384f:b0:2b0:b41e:c5c3 with SMTP id d9443c01a7336-2b28176a416mr247491615ad.29.1775715984381;
        Wed, 08 Apr 2026 23:26:24 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd4dsm220786795ad.76.2026.04.08.23.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 23:26:24 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v4 0/4] misc: fastrpc: Add missing bug fixes
Date: Thu,  9 Apr 2026 14:26:13 +0800
Message-Id: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RziMEh18M-LywYZhIQxD9MjKrhu8a0f7
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d74691 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nVt4PUt5okI7hfkv_aUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NSBTYWx0ZWRfXzNyRtgIjW/8i
 dq+tUcyGYugyrtVKNApWg3e1eQEPhXEgdyVWAB1rFp4vVXXioKMmVnJpWsQAPuWR5j+olsoXk3K
 dZ/vkTqoeMFp/k0HfV/WTkDhDsDiY6PQdUSgI4iCop6mjkg7AOD2cW/XMbUAnC9eRLCyM+326zT
 PcfnAQ2uI3p4bWg87SKij1FyTvTJLBcqBE1JH5t54MZGP2er7mHk8WR0VbYhW2hxPGSuXc5TjQg
 KkYPCE6Mje3v58HJoCGs8aWzpvAhEnwutopUej+uTgiBynMpfNIWY6gPy9SDSH5wl2ODzf/fUIa
 1NvD+cE/VqZxILN/DRTuWnl2msTmKhW1AAQBxzwDXykuD8Y3pt2eVNhpHm/sBfM7jXX9DSyamz1
 FJPKnXqd6YhYa3jSICX0vzqZctA0Z7NUQDfkqXurpSxhcVS62cIhk2atfO0faMZaYBL7a0tRiTn
 5eINsBkiNsFU3MPYwMg==
X-Proofpoint-GUID: RziMEh18M-LywYZhIQxD9MjKrhu8a0f7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090055
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102411-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE10F3C68F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing bug fixes in memory areas. This patch series fixes multiple memory handling issues in the FastRPC
driver, primarily around the Audio PD remote heap.

The Audio PD uses a reserved memory-region that is shared between HLOS
and the DSP. Allocating and freeing this memory from userspace is unsafe,
as the kernel cannot reliably determine when the DSP has finished using
the buffers.

To address this, the entire reserved memory-region for the Audio PD is
now fully assigned to the DSP during remoteproc boot-up, and its lifetime
is tied to the rpmsg channel.

Patch [v3]: https://lore.kernel.org/all/20260407100508.1027-1-jianping.li@oss.qualcomm.com/

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

Jianping Li (1):
  misc: fastrpc: Allocate entire reserved memory for Audio PD in probe

 drivers/misc/fastrpc.c | 136 ++++++++++++++++++++++-------------------
 1 file changed, 74 insertions(+), 62 deletions(-)

-- 
2.43.0


