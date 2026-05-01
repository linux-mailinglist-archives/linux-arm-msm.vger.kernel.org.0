Return-Path: <linux-arm-msm+bounces-105523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFZcFQrZ9GmfFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:47:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B504AE2A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57648303A505
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 16:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F68B3EF66B;
	Fri,  1 May 2026 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEFrc4JA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXh85Y/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72943D47BF
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777653909; cv=none; b=qcHM2CAsBZTVUHgxRUmO9EA5S/0ddx0NVQ4LtweXWmWVf630lvksPEQs/clZtMjJEBDxOBllfgwShJZxx8SLyk7oxenWQjBVCpJfWJo3v+V5j2CUsta/OEDMLseVEH8Qw+UZYQmSGVr82REi5PIyoQGgwzGuITbXn/Yty2/255o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777653909; c=relaxed/simple;
	bh=uRYbDRH3yFsoIBX5PA7y9pIJOKmzwquRTW6CKNMr1qE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O6d8Vzpmy3DQGM4PYFhxyS6R0nij5MRlBNy/l+VnWyOY4feyiFJvTDYM06KxvEw9IINBvtmOUu1a4+JJCq15ovH4ASe9jVKcEF6XDg+hOjYQPBbtooFMY//0hBsUmDjt+qoIHdyw303lmOM+1XmggY0k29YZkwpph/CnPSMEz94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEFrc4JA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXh85Y/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLfZH625446
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 16:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8qj7MfPHqU6avruC9ARP/wMLmeEJWmwTvqg
	Stsue6h4=; b=mEFrc4JAbHWE8b57adrdlM8UFAifD+vBOf6YWboeeig/z4bqgDg
	s/6k96pdgJSf3cAGRUCFk622UxgxSa55TadJBhaghWszYakciwkL4JGSklD3h/B2
	adSsEKgmBB9qEl6i0WxN4lPuo1poyoFclak/k8dQdZL1jeFGRdJmH1U9pObIdGP/
	me5zrhlgxlaj7NporLUWP+e//Hu9dStB8DcP3nx2giZw1hAMJ+M1SC9VfF5WoeWM
	AtgXhExGt2hxwN9Pxjo1cAvD/5EQBBXbN37ZP1hkrFc7T7rE2qwsBVSWtdFTYza5
	f0lPChEGyeu6c2h8F+f6QdXGpjvwXv69ZjA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvc45bcj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 16:44:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso1644895b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777653898; x=1778258698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qj7MfPHqU6avruC9ARP/wMLmeEJWmwTvqgStsue6h4=;
        b=CXh85Y/Oc2cvSACGgpd8/2keoen4G1BdaZzGIC75AKlZ3MTviiWcu5WsjczEqT17Rd
         dhYOGrbh+4uZOTOfAiqYYUlQ1O14NEYCaoMMwyTmBhj7qLa72qry+sA4iCTy1Fy/uFTY
         oGI1L+vyOMjCqZfyrzld0EVC16qZgT5Ibfv6QnsybuM8oNn6q2UDysYyj9tA8adc/f8o
         e/fdvLH20QefF58HMB4vtmVVokAN4gOEv/f+AUX21JnxBCsIt1K3CQdpKO3xc3AMs7bV
         S+lt2EExRQlbN9Cd5J2+wCNTaFvbI2/nTBMo/lUs0+GG7pAFo7jeoLaIUsB9dxMMAKk0
         Vp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777653898; x=1778258698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qj7MfPHqU6avruC9ARP/wMLmeEJWmwTvqgStsue6h4=;
        b=GukU/fKheRW65m0ppVTl6CzC1USHTsui47pNWXLLH/+E6+Btdr9Q3MhTXfgXoWgy86
         cagpAK1R8BsX5hGxs0hOM5FCAg6h8g6g+C2yqgfGPEjxaMPmw12pQsyGwevGoa7N1oB2
         MZXoXLT8I9dtysOoW/fHXgTqWZSs9ucV+apWWfBLAuGZkVHXM1cFw1psl4Yw8O8auMIt
         PL5jNdDMsqE1W7Unp6DOJDdpwhiq6QMjr+h0cH/6ik7actpg5ZfVCGt8262Kvyy9I0eC
         Kd+DUqggsruJFZFNU0bvhRek5RSmRwHemmZguBsOyN6R1vWgIeNf9THP8SztYUELegcs
         Q2Cw==
X-Forwarded-Encrypted: i=1; AFNElJ95ILSi5Hj7wxTZDM1Q7QuJfKIEnqR8mDoPzZ57V7q1hsgqp+3jGn9Wmh81eeXaKhLOFbQEmiFSYriuPV+I@vger.kernel.org
X-Gm-Message-State: AOJu0YxNLlc2R9fj71W/b/l+TsVFEUWJTyi+0gUIaDHQfqWbp9Yg3YIb
	+1ugoFIYPWuPZkyn7+7E9fSw2SAP6X3og/IEUL2AOWv5ajxZBeb9TO+tUTZVcKUT/pM10DU4Bl/
	UgPt4OwmPbryNakP/+nfKwuiWufYSsI40aqdI18KeeeBEmX0syQYXk1F40URFsCSwkFB5
X-Gm-Gg: AeBDietettUAZKSOZLfpSEyjokDG7VjAGHxVhGOyjXyE142g2wpe1MN1x95GaahjOhw
	wonLzcU+tbDJrwQN4LYa6TIqFQCrKV0uaF3QkTZH+/E8j0mA6bRUMz0rQwH5DC1od1dWVFswyGF
	+qonfMAzegnj8r9HGHA6YuXKqfWsZgndEN+aWJLyve5L8BZze3ozlvkZJeR5EekMTmmWJe8nKkP
	opQeJVsQd6kKA5pbGqbzVhBj5LVTabt3HRuQuEXuLvw7X4ZFlCFxQ2534MRc3G1hpYN0QxZ/9eI
	X1c6fetIRpIslXIefDzRoIot8+LYhlGTGQ70C4C1EyQZNIXcSDPmCwT++DG6wmzUZCHWqvMaB+u
	veAf4w/uuvS21zZyK/cHcE7wPZ2SI1WXDN0bO1FXrkRtbG8E=
X-Received: by 2002:a05:6a00:3d4c:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-8352d15b751mr9703b3a.11.1777653898276;
        Fri, 01 May 2026 09:44:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4c:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-8352d15b751mr9651b3a.11.1777653897585;
        Fri, 01 May 2026 09:44:57 -0700 (PDT)
Received: from work ([120.60.59.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835293f022asm601103b3a.45.2026.05.01.09.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 09:44:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: bjorn.andersson@oss.qualcomm.com, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, wenst@chromium.org, arnd@arndb.de,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] arm64: defconfig: Enable PCI M.2 power sequencing driver
Date: Fri,  1 May 2026 22:14:40 +0530
Message-ID: <20260501164440.11788-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2NCBTYWx0ZWRfX3VXHgtZKIUH9
 SjciKtag4MGArsSEatRFu4WlOTZmRJrK9LO/DfcTfJhpuF+g+jNepHVj+WHXx4MdS4Zc9a5+VPd
 plHmn3AOnrOE+48VJda/6XQcMT0/2KGpXIFJJ9pR1c36evo/y7nouzcLFXY0oUC/gbqQvv+DxcA
 BYEnaWiiQB8d5lqI3E/VBotBI+HvpEbAlSiUhYxNfEhOhpnLKonZANgPd6tuxXNZH1l676LSEXQ
 nX0y/6gejEVzDynYKC/+zBRqCCXRJn1Ag5jzPWv9ipSpx4KKS7qs+PTyYcrH4fDC68sP1YRClCL
 7GWeyv/XJYAtAjoPCrwFGli2w1xl1k7irGk1TtSps8BlhbSE/EOkGkEWR24D5t4cEHNuJU/PLD1
 EfV1X9Pdr8Cl3mcBV7rbliL8wJR2zUsS1yvS1DIE6qlgvBcAJa1S1U/NsePQ4NfaE6297ArdLK0
 B+DfkJSs5Wi5n6u8YbA==
X-Authority-Analysis: v=2.4 cv=DP+/JSNb c=1 sm=1 tr=0 ts=69f4d88b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=VvXziC1WMG9Np/cC0Lm1wA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Mt3aZHS-KmEbwue0ZEsA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: p9KyMQqx7RuGIYUK9OIbyNliocfPvR2X
X-Proofpoint-GUID: p9KyMQqx7RuGIYUK9OIbyNliocfPvR2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010164
X-Rspamd-Queue-Id: A9B504AE2A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105523-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

POWER_SEQUENCING_PCIE_M2 driver handles power supply to the PCIe M.2
connectors and is required on wide variety of ARM64 platforms such as
Qcom Snapdragon X Elite laptops and Mediatek Dojo Chromebooks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---

Changes in v2:

* Dropped PCI_PWRCTRL_GENERIC change since it was already applied
* Reworded commit message to include ARM64 platforms making use of this driver
* Added R-b tag

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..96ce783f24e7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -260,6 +260,7 @@ CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
 CONFIG_PCI_PWRCTRL_GENERIC=m
+CONFIG_POWER_SEQUENCING_PCIE_M2=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
-- 
2.51.0


