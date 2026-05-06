Return-Path: <linux-arm-msm+bounces-106179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO/JF8SK+2mWcQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 20:39:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C50754DF6C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 20:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44F6630166F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 18:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75C84C0421;
	Wed,  6 May 2026 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzVnkXD9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R61mfW34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826B93EF0B7
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 18:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778092733; cv=none; b=pe6PJLDHm83G9eCcD5s/ZcktliWH5EOd/GdKg6WB9ozQX/77DTNmtRZRD3n/iq9t4A8b374w2lTSc7dji+NeY1UIx0B19GbNn+sEiQHo9wzad3ku5i64AptH9hDPGv3AyU8249P2FPnwy3wKhd4Yx81sye5RxTCrjfqhsA1SSkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778092733; c=relaxed/simple;
	bh=96jOQ38DKHlJwyQEUSdRWVCI2RgSf5udNbyTMFN2/pg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dNETUlsUOh8xQKq9l5ZFvNGgUh4LdV1ZOIIt4hnCUBjvhSWjg+YDIhHQiA3myvR6XkNhBZrLhIHGNXPhJHDDrMWYRYvkrszud/YsxkyjFhOUHbdZqWuCx4RiRGlPDVuK1bnn2AQPqUDlcM95eBC0svZuMhjxKePfMe4QLESUJ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzVnkXD9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R61mfW34; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646FFR28442580
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 18:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u5i73O2TeW40M4e0REO3mU
	O4IV+MciKckhAqv2Nzlgk=; b=PzVnkXD9hjtghoCbgomISbLX4MPW2knRx9DGpH
	MOMAT5ueFuKxzpuncFbb3m73ub2TTo7JIu0Cd6+D0WEnmehjEubRgbABWY2CidI4
	dWmm7fJT0mh/l4FHZk7g6aUx4QmTbF8of2/SilFjRqkujnup/l3oaCDn8g6OoM+K
	vAEqpJTF4Htt0fV1kVFGjGTc968iMYKuHEbKI5GcajCZMQpenYGe0xl4WEKfcJge
	LBx+OXnPFrWU7dt5LscWE+iun2i4ecR4eaoecHgenPH/QM/alBP6wmJZd+aT2R+e
	PC8IUtzn5InpS5lAN4ldbZvalUoyDoTfIYcKEUS3kq7mdczw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299j865-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 18:38:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so5734eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778092730; x=1778697530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5i73O2TeW40M4e0REO3mUO4IV+MciKckhAqv2Nzlgk=;
        b=R61mfW34mJYjFBv/0Wf8EUYsO7N8FB1y3bd8QX/KsCLLjOrTsbbsfOLyEGT9VG1CAz
         Lq/nRTdg9cRw2gL6uPAlsYE22aE25TYFvroaoC3UsXf2bQ3BaICE1K4t6zvhgtd1WzvE
         a533LXmo2l12QNcnpJEU/6NC9EhtHrRA/KsfA0UPJ5xpBvXLX/k7+p+sSARYbjhYJDiO
         hiNQHSEZUzzJtgo+dJnYdToVry2kjkl0pctJ0LppUgaJNOJnZ5UFyaNYwuiIaXP+rZL/
         WND5DaYKZFJvfw3xIxyAvunJfTrR7J23vspbbKGyVYg8nWKgbQmzs6heaURcRgfkkuU9
         8mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778092730; x=1778697530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5i73O2TeW40M4e0REO3mUO4IV+MciKckhAqv2Nzlgk=;
        b=qEp4u5t1uEee0M6ORB69z9gRP+PuTZqEVA5ER21NsgljzM4iiJsSQ5Eu+W8G0ZT88P
         tg4vwt8i1yLLUJMWw/qjKIcRpBT6M5/cOz+ghbbRyVpFOEiPt54/0svykPhECpI0hbzr
         a1trfz6cgK9sbDdqwgP/R/V8YrSv91dHYzmbMY22dolcHs8hG/B/s49z9elAnvWq6M8e
         OIl2Hk7WUybCvtAanNjYJOujHeqinShO9m3qhFsw9RE6eKGzQ82Jzx1EX5Hk36xZ1RNb
         r8CoDLSTFf8Xyo9BcYxNXLr56dcm65N54JQWaiCOp92ojDDjoVI7BMBkL6Hqe76Pwf9I
         FLzA==
X-Gm-Message-State: AOJu0Ywo0ZoQB+u2/t9mpqurFcmyCFIdutmFiKVfvdWU8qarz1xoaXMJ
	+W9NNu2NV6Nsb87uHrtqtkZC3W1BtZeWRZJH49X25jMIboZRJpJNv4T3FIUw7u9cf+yXn0O+Ttk
	K12WYH9TAI6BfBn1YkL+MKIeQqb/BFMpP/SxOqmqbAfXd82R06K89lvw542Uxshd44PBQ0QUhmh
	uo
X-Gm-Gg: AeBDievyT3qYoss9ZLIaqv9nJnLRjxjkBPiTTRIF1FliH+7Bu5fkAgDU1oHXS3wrWON
	6sSsULxzGofzpWRMcYCBTwCevxjFF7yOAqrzbEtD8tLjSm1HLYk7rtTl2Z89sr5HYp2bOJzqfzN
	06TpGYZHnhTX65oXVwLJwc2q3jDtvNd5Pyi1ccBToSz2Usu0vpj50L57WL0rPUrtWsp5nUvYcXq
	SsxfOOWQASlqvCQet/CyuVe8ewfURSrbllcRD909IkXqN4tHZqeGdswqY4IkgnpC2B16knot2MQ
	qvmHU68dPhaWkQ+aVHDhusuoygkJ9UV65Nuo34i08GnqHtXnztx2jVQ7d8bQA1a3MA3wpyCXuMB
	M24/iU899PY37KdUr9/4klnRgzhdF7E0bp5A+7lU8cS4qqfXoXqq89EjIKS4QRVg3O02iPSx1Yc
	zNCbSH8Mm3ATk=
X-Received: by 2002:a05:7300:818d:b0:2f2:5c68:5074 with SMTP id 5a478bee46e88-2f548e95c62mr2289989eec.13.1778092730194;
        Wed, 06 May 2026 11:38:50 -0700 (PDT)
X-Received: by 2002:a05:7300:818d:b0:2f2:5c68:5074 with SMTP id 5a478bee46e88-2f548e95c62mr2289970eec.13.1778092729569;
        Wed, 06 May 2026 11:38:49 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56fd92780sm4958372eec.23.2026.05.06.11.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:38:49 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi
 SoC
Date: Wed, 06 May 2026 11:38:45 -0700
Message-Id: <20260506-icc-hawi-v4-0-35447fdc482b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWK+2kC/3XM0Q6CIBTG8VdpXIfjgCB21Xu0LuiAyZZSUlZzv
 nvo2vSibtg+dn7/gUTXeRfJbjOQzvU++tCmkW83BGvTnh31Nm3CGVdMAFCPSGvz9NQqi6BkpUs
 hSTq/dq7yrzl1OKZd+3gP3Xsu9zD9fiOCLZEeKKP5SeamdIUVGvchxuz2MBcMTZOlh0ytni8+Z
 2rlefIKK+d0YcBy+ceLtS9XXiSvJaBB4EaD/eHHcfwA0TyHfCcBAAA=
X-Change-ID: 20260311-icc-hawi-d6dc165f8935
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778092728; l=1559;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=96jOQ38DKHlJwyQEUSdRWVCI2RgSf5udNbyTMFN2/pg=;
 b=sg4fhKMVcehnEw9zYXwuwp6i/tpPNQZfOAc55nKz+OfKKCSQqYA80uLGSRsnpCiSE7JbKwsQz
 viSptHDSwf5Dt6RDr3bJSihCTAuRPkOM6kJ7BGwo/Gc5dZJHbFzrBX2
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb8abb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZFe9A1L9f2-jg8me1oMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: b9eD0K2Et915E44VR9CoPIREW-3Z5cu2
X-Proofpoint-GUID: b9eD0K2Et915E44VR9CoPIREW-3Z5cu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE4MiBTYWx0ZWRfX86pRICjoKYQj
 SySNizjR6COrUv0sLQDJasxmEHXFZvZWoDnrJSOoXH+07qSDVZqgJnVJs6X7TlS0vwR1FKDWZbL
 e8Bu6uUHmPx6u5MJkiQ6sdscG9MbDYC/5uROXEiymLmWUtH3INaWJrQnCUe1TfUwE17FBpE+fOP
 NCbGX8VLE3L/hbfuLbJ9vIwcusKG2BYYpMwbkl0WFk6/733GHrtYHx5+f3QfmoNQ7TMutFmPYC+
 0RbWV3BAuwPYF2EDAyN7uIn9gksfZRcllZ26DVqm4pfVQwSkI1dqPY1eW6sRk8nn91h9LrPRvdM
 u57xRtTobmt5U6UP1d+0Bn7kNWCloVslW4UosYQRIYrvfiLqEdMYpUUZP7ARYVhNW4TVFdco4m/
 A+5IjYCka+h+MnUv8ZHqBNbScSpdRmB3xMKMj0kLxyjepeX+4XHUBrVQVcL77GBJ16/qAJKPLnb
 +D+H1T8weFpMSmdlkWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060182
X-Rspamd-Queue-Id: C50754DF6C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-106179-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add interconnect bindings and RPMh-based interconnect
driver support for the upcoming Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v4:
- Address review comment by adding missing SLAVE_PCIE_1 node
  and corresponding PCIe path.
- Link to v3: https://lore.kernel.org/r/20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com

Changes in v3:
- Fix alignment of macros in the binding header.
- Update binding header commit summary and description to mention
  Qualcomm SoC.
- Collected missing Reviewed-bys.
- Link to v2: https://lore.kernel.org/r/20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com

Changes in v2:
- Fix warning reported by dt_binding_check.
- Collected Acked-bys.
- Link to v1: https://lore.kernel.org/r/20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com

---
Vivek Aknurwar (2):
      dt-bindings: interconnect: qcom: document the RPMh NoC for Hawi SoC
      interconnect: qcom: add Hawi interconnect provider driver

 .../bindings/interconnect/qcom,hawi-rpmh.yaml      |  131 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/hawi.c                   | 2028 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  |  165 ++
 5 files changed, 2335 insertions(+)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260311-icc-hawi-d6dc165f8935

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>


