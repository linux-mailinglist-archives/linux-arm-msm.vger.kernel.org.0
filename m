Return-Path: <linux-arm-msm+bounces-96575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EwsFvrsr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:05:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C22490DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FBDB3139B59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19BB43E4A1;
	Tue, 10 Mar 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oD4SffH+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULcCvSYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E09543E9D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137037; cv=none; b=G8ZZvAkzklm5GZl30iV2FE2itznTyJ/9stSVfd/IsLvuaDi3BLREcnX3bkpGq6u48KBrXO/6rZt/Ei2ufcnDhLudLZKS8Khvm0tdR5mPwupqtvrJoS5dPnlUFPXInDoEpymnDqxQ9Vqua+A0kIEuJc/6/Dxc1XEyvfrX7fc6sjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137037; c=relaxed/simple;
	bh=At+afQpHORDHw8ar1zSE5xpQA3L8j2vtp0YNEu0a8UY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i2jYFzGfWYhxH5lrW+GUxF+gjG/KrIn2IPrJ17nNNdAWgj0ijVO3DphRU/RTo4d7xiMPAXTLY1jzQ8Aw+ueWuCtAHzhR2fpHPJJ3wgJIPvr7TouvmsSj9CrEZ0MLARMn3+AnF3vtUy7dTG81tQrCPjB3qaCE8rACgxjHrP36dbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oD4SffH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULcCvSYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9D4vl247058
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LzvyVLBG89ChITLYlZgrhv
	0Nr/o0nS5xMxBN8/P9Nq8=; b=oD4SffH+ybnckQkzdGK8qAYhcZ8+pDID48ZZdJ
	QfJonwCZG4dQojnRCfj83CCJZBXlkYdaFqBXIDW1YMtNMzJGzOk2miPWHBrTA3k/
	CoQInV8kSLkXcmyErYXjAKoOxWdMXPTgMB+SbcXdimImvznGjgzH6xwGeE/tqQBO
	FZRke213mtqRl4M1x3LoTq685mG50lMXg1L06TlGjHP6GgwoLXO8k4iTSgw3DFsa
	YgwU92Ii7heqT1ibPPDPNnw0mrhss7RFmSb3tfjoiL3Fcp4N8lRjsUFQBh7OwNyi
	Ic1guiC8sjDVwHMTR/XBRq5U8Z0Xv0Hj0ShQZyqB7t/m9K4A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8801wpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:52 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d742bb4003so9563856a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137031; x=1773741831; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LzvyVLBG89ChITLYlZgrhv0Nr/o0nS5xMxBN8/P9Nq8=;
        b=ULcCvSYPnPxXIdFu6CWts1FTB/JfdPbifY9Bh+wP+hY1DMhveWXxSS17bparBTzN0s
         5JKm5oTKY/zMPrbJk4Ibf0t/Dk8Re9NqFDzi+A+jlRRyVuv771Kdfq2OcYcz2iR0BjzI
         f1go/CLK5uhccQSaefW3+8ETpP7G3mkcbuCzGaq44/lQ466U697YxsT1iMMr9qxKtot9
         AyFk5ts6wfqHqLpXkNfqOiAx0x1pKtJS+3fbXGZzzaycsHvZ+Y6h2PuqHc4zXs7+A9UO
         sxutWE0PsxMbCYhv9Mc1GP/CAeaBjqc69IdPDx0KasENHo/iePW03EpJ84N71PKb0a8M
         pxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137031; x=1773741831;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzvyVLBG89ChITLYlZgrhv0Nr/o0nS5xMxBN8/P9Nq8=;
        b=cdDBprqx80f8wskSG3clc209NclxVWsq12eMswmJu+9oU440dq1zCKLjhVaol9j25J
         2cM6gqRbzkJ6NGVwytX/dScOVO/fZvo8PBw7uom0/fCDpXZ0j73yQAfPx8N3hr6pxu1j
         q/rzxXZeY9eF8BwZB96y7Ml+ghpo0+3bIp1Rz2Ip3rs/fL1ZOx2YBgkZmDH61ZjLbyrY
         b48ZAy10Kf08mqlnN/1qSsBYrNKe0TvptiQohUjFuQFk5fLrD1J2COV7cBgmEkR0ygyB
         z4RIJgQU5U0skkrv77T34i6SLlm4u+s83KxRblJ/XkgJAgIEr2yXuRQSiokDhHIUHqmj
         GMyA==
X-Forwarded-Encrypted: i=1; AJvYcCUgM6AHPGf0Nh45tmdOTAaT2++VP5mxrDLM0h/xcTK2w1J/m2YZ824Djs+SPkct+phUsSc/26xfKk+AfQX/@vger.kernel.org
X-Gm-Message-State: AOJu0Yygf1UfYp43hbJP5FSXx/6PXczJjTFli2Pk3uTZ8IEbttkqTMa1
	fp+4DAS5QRrmnrooUUmJQl4QYgwV/VHJHbSy8GE2WZj/q1zVq8xPfJsA8e513V9UHVwf6/j/poX
	SY4E80xhg/tBordu+ZltRT921LlPeZD7lzhTQEf6ce84ZpOXLudwiGYur7uWSKBG4qK5f
X-Gm-Gg: ATEYQzw6DncAWzAb4eyeEvhLggfjalpzRwX8UpPq3bGDWEKn8QuDLmxWK19Q/7p8wpA
	i3m4dvQgKINgFFcuIoexzFQQF7vtr9eMBZ+/epESSwrVH7EqiCyvXKgI1xXq65MTQRWi0S868J1
	r/Gs2/8e9SVR1cZJwAvniRMyapwHNFOtLqTX8LAtRlAkPwVm3lgcpwDSHw5RMp+pNyYvqD0R63j
	jNEOvTB6UYgwSNR8C/XMhRwR8Qtn9WGvmwq2BhBrpm/VJYpQzYA95YAce0KuljRTkkpPJWTT+MJ
	alp9l1c/JBzxzSSRCgWJbn0hOms/aXXPIIfYuq0x1H8OCrTU2IHqRdHAN+S4hOFVV72fvLuv3GR
	2R/kPEzRFMXj4Kk9LhhE9uB/UFSommvdZ/by9g/9w7zs9UvxYvuQfG8TlMG5tGRYcY5vi1eYB
X-Received: by 2002:a05:6830:6185:b0:7c7:6063:8e0f with SMTP id 46e09a7af769-7d726f3a659mr8429257a34.15.1773137031021;
        Tue, 10 Mar 2026 03:03:51 -0700 (PDT)
X-Received: by 2002:a05:6830:6185:b0:7c7:6063:8e0f with SMTP id 46e09a7af769-7d726f3a659mr8429240a34.15.1773137030652;
        Tue, 10 Mar 2026 03:03:50 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d746bdecbfsm4337611a34.10.2026.03.10.03.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:03:50 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v4 0/7] Add binding and driver for Kaanapali SoCCP
Date: Tue, 10 Mar 2026 03:03:16 -0700
Message-Id: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTsr2kC/x2NQQ6CMBBFr0K6dkgZqKmuvIdhUcogjUJrB4mGc
 HdbNpO85P03m2CKjlhci01EWh07PydoToWwo5kfBK5PLFDiWdaygeccgL21AQZEo/tqQEItkh8
 iDe57tO5t4s4wQRfNbMdcyOusjY4XH3/Hx7XKco6rCrE+4pEmv1CI3sJagwTVyYvWyipl1M0zl
 ++PeVk/TWU6ot33/Q9M9uw4xQAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773137028; l=4522;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=At+afQpHORDHw8ar1zSE5xpQA3L8j2vtp0YNEu0a8UY=;
 b=ADwNuKAZ+TBb2y8Bda6CCCNxutNErlR7MilGHJs3H3cspIOme2daYsF1i7ZFFYCy3Dl2a5oCe
 l/dlF2roLCyD1AgMmsn7gEKpAt46TqBIkTBhWuTi3e7eRCQjZh9rOY5
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX6mdrxfxB0juT
 ker9PpK2bemUlt7jxyWe5/JD+JxxuGilSZ6ZYYmubIfmUIegDsWDx6V8NopFjgTN7417S6Pcr0A
 4iqCUeK6wKGvrWYmVf1lWsv8ZeUpx9xdNASt2NdZvGvDzVnp6eQKzO29AOj3qRTlIxetb4PpE53
 ehlmTe+pvPRRq0TXq5GJnGt1dAcwrGzoakoOQ1wQ3yL2kMhlbdCNRH+o6Z79aX5jh1iktm2ryCW
 +zfXFM27ruyWsG0km81VRdweN1GT0Acs3kIPkM+lQP1+qwlq1YVKEoElLIBYztoQk1kUZFKM/OU
 0pnzjynAT+Jo8c9Yg3hxoFxGrXLjB2/gOerLHrpapBSWXrcH5Uz9QQHTQrHdNVzp1T6pAQc0FoQ
 fU7RvkFOc5Eq6abMSHNLnCJYZFHThQ5Mc+//emw3XnIdVexOcGeAJSI5jZx//9UQjYJZ1UjEv8A
 Y3KoIyIqWtzqj1kQyLg==
X-Proofpoint-GUID: 7el7BNEx82b4e0iZcPY95u0w7EMTFI9z
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afec88 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EwbTwWG3q5equovErDoA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: 7el7BNEx82b4e0iZcPY95u0w7EMTFI9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086
X-Rspamd-Queue-Id: 008C22490DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96575-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add initial support for SoCCP on Qualcomm Kaanapali platform. SoC Control
Processor (SoCCP) is loaded by bootloader on Kaanapali. PAS loader will
check the state of the subsystem, and set the status "attached" if ping
the subsystem successfully. As the interrupts are redefined differently
for Kaanapali SoCCP, list for the interrupt properties are moved out of
pas-common.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v4:
- drop adsp/cdsp binding that have been applied
- move interrupt list out of pas-common yaml
- add constraint for smem-states in each file
- "wake-ack" interrupt and "wakeup"/"sleep" smem state have been deprecated in design, drop these
- coding style fixup
- add a patch to disable recovery during rproc_add to make sure rproc_report_crash can be called correctly during qcom_pas_attach
- update the handling for irq_get_irqchip_state -ENODEV in attach path
- skip qcom_q6v5_unprepare if the state is RPROC_ATTACHED
- Link to v3: https://lore.kernel.org/all/20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com

Changes in v3:
- Drop Glymur ADSP/CDSP binding 
- Extend the "interrupts" and "interrupt-names" properties in the pas-common
- add missing IPCC_MPROC_SOCCP definition
- fix complie err caused by qcom_q6v5_wcss.c
- code clean up for late attach feature
- call rproc_report_crash() instead of set RPROC_CRASHED state
- fix q6v5.running and q6v5.handover_issued state handling
- if wait_for_completion_timeout return 0, set RPROC_OFFLINE for PAS loader
- Only ping the subsystem if ready_state is set
- Link to v2: https://lore.kernel.org/r/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com

Changes in v2:
- Drop MPSS change
- pick Glymur changes from https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com
- Drop redundant adsp bindings - Dmitry
- Clarify Kaanapali CDSP compatible in commit msg - Krzysztof
- include pas-common.yaml in soccp yaml and extend the common part - Krzysztof
- Clear early_boot flag in the adsp stop callback - Dmitry
- Use .mbn in soccp driver node - Konrad
- Link to v1: https://lore.kernel.org/r/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com

---
Gokul Krishna Krishnakumar (1):
      remoteproc: qcom: pas: Add late attach support for subsystems

Jingyi Wang (6):
      dt-bindings: remoteproc: qcom: cleanup qcom,adsp.yaml
      dt-bindings: remoteproc: qcom: move interrupts and interrupt-names list out of pas-common
      dt-bindings: remoteproc: qcom: Add smem properties in documents that reference to pas-common
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms
      remoteproc: core: set recovery_disabled when doing rproc_add()
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  82 +++++------
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  26 +++-
 .../bindings/remoteproc/qcom,pas-common.yaml       |  22 +--
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  22 ++-
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  22 ++-
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  28 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  24 +++-
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  28 ++++
 drivers/remoteproc/qcom_q6v5.c                     |  88 +++++++++++-
 drivers/remoteproc/qcom_q6v5.h                     |  17 ++-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 121 +++++++++++++++-
 drivers/remoteproc/qcom_q6v5_wcss.c                |   2 +-
 drivers/remoteproc/remoteproc_core.c               |   4 +
 22 files changed, 727 insertions(+), 85 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260304-knp-soccp-f22a8d1f2e28

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


