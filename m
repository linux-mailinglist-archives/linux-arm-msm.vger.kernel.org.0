Return-Path: <linux-arm-msm+bounces-102444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD93Bfxn12lVNwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:49:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A40EE3C7F3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60C80305F3D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB37F377EC7;
	Thu,  9 Apr 2026 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQe54dZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjKnZYa7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE6034F48A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724401; cv=none; b=f1KO1nLOHjd4pmIBiOl56sfqOq8uWDEcjkBdruSirmlNFVmX5xYoGDhtQd+sdJV4hK/C3H9YGo3jPAyGc3Jxd9Deq8O0FMZEJPo1ICckzTlltRo+Woy24b9q6h0NzfsBRL72dwiCuJOOgivCvxPN/cmGg/7a0YMSfwjkKrabaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724401; c=relaxed/simple;
	bh=L0ObvfduWGAGP21veczdi1azriQW28n0o9uJhPgYbBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CjwPP1GosHakFzOOa41qQNocYB02TM2SvZwdTObCwnoaL1SY+skWVOG9pMjxuQGa/G+DDG/NFlbedL3habFyHyIF5VTMzC5A1RkId7V5yle0BG2AnMh56Hp0tsMAWBEb247UBWNAHzNMvOx2u8YM1SD8SZL+aMU8nU5n2uF1djQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQe54dZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjKnZYa7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6393CITV1727227
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CrVle28WB7UnN3fLJ+Ty/OkvEJHEIJlIT67rX6hqJA=; b=NQe54dZqD4tXrKWt
	IfH99gSgI1GYFG4OJXyu4tM9Y0D3CQ+hQYtzyk47L8lKJbdAldEFtme1p1/+gXuB
	2WOyN7wAOiTYe3mRuFochd6CfJ81tfCR/K4aWqT80nS1k0m16TWE79+zfjUhMfXD
	LB1tH9L7+2QmWawGqwtjh0feIe+DNd4C6a7eTFHnWiBBsalXbSlYye9Y0+VUsXVz
	Jg6r0ewcgVRDgYK9W0KAqugPa9HgDquxee4dE+AG8gAdUeSN0viTqOaOgCiC1FUK
	njCPnP7CaFkBuC92OV5IV05zhOuPXCnpagw9orse6BNYU6miplonpMRIxo+9P8Al
	j3zUPw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrtcs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:46:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1275c6fc58aso550257c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724398; x=1776329198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CrVle28WB7UnN3fLJ+Ty/OkvEJHEIJlIT67rX6hqJA=;
        b=SjKnZYa7DXoib/ne2P0NLPNfolrQOLQDtZu7CI3t7c95m0ekprVt7G/2BBGCWajFwf
         resGsJo+iBJny4q/BaPMTxpx0kyYeW4f3keRrJ9uXB16wWV6VHyzGcL08STRW2AWXjDb
         HrI8ehEx87dcz9hu9V9S5O48QUqzngiMtvxnVvc+v+gVNaErtS1HYCm6JIdHibtD2cXP
         /Rv6dvkXenh5FaO2tZ/jlO1NR45nOHit7gYRaVjre7qWZ8SpOUPIF9qAt9y3O19TLzcX
         z5OpipsXgZTRKSxA9gdlOzqJoGx7jzSRgUMCTntI7N9CEbrKRxH69MR/yTfE1mPewSPM
         pJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724398; x=1776329198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6CrVle28WB7UnN3fLJ+Ty/OkvEJHEIJlIT67rX6hqJA=;
        b=lpwWOhXYOr2s23qBMLRa6EzNjRVIUBe+x1APxCUjDdFDvIftsEuuFLcDSb6zBKgIzo
         G1Itc3wsZwGXeZdAwwzLUYqG+vCsX0g18uVn0noCewkP5ESRUECHn35Yl3wURDXoXo1H
         VEFnly++OjGRBZNogww7BfibY0erZ+aGw9JDmTfNBYYQc99soUlMH47kaTW1o0/adiBy
         +++YV1iY2L2HiJwGjvW/Ak/xZAwrWnS/owcCjOOSihU7jpz6iGn7zfqUGMKeFVG9PPf+
         yC/VCr9JPSoI7irvsvCwsAPuSVbfGlAQ22Yg/AEf2LFtW0xb3xWznPyWGdMu2qEUH/RW
         8gXA==
X-Forwarded-Encrypted: i=1; AJvYcCXUeBTFB7FaBL+sBYGpXaV0wBLWaoHdx8fS8yrLQY+yWNT6qqXBENhs9fSpb0yRJiVVf6G8rJqogyO+Wwpq@vger.kernel.org
X-Gm-Message-State: AOJu0YwpiJnDHPWAXBYNno7tjyubul0aMEDyTCl+G8pE7XYcN2uRToXc
	/bV0fpOLlmuQaXcCE2zgpqHD2V37gh20NFLDkfmETvw7UuduYb3ZaYh6vdWqofYw9ewx9bhLwVx
	WY27v2bbEujaHhIaKb9IeaXzS03vbBgavw1WO5gUfkMvR0nqMLnPm9VMELv59GqWcKOlGruIX0D
	lQ
X-Gm-Gg: AeBDievNIF35Njmvu65u6CDFNN5t79bR5MHQqmeu23//K/m4CEZwEnF5rWsWSLZ5I6+
	EzXK9dZJ+8r6QHpcnb2NudRsPjjSbUKkrEPShUfL8/ypVcZghJ8be1VeF1vmCHf36ifjwrtvOxQ
	JlmCYgM+6gtBrRHi+1QNL2Kkra9z0FnuJCf3SBYyY9GVKlh/4+Q3vTAVC08jRbpiVeLhcnjJ+o/
	EWlFyluVate54gk75WgE7Y4KTUwJnZThjsGIMVvXI3N7mCIvak81tMjSpl3n0RSDvUOfgjTNom9
	UQsAXrgRajkX0eq2XB51rBqZ5lxuHXvaBi1Z7m5Sqy3yQh0Ijqd8524TR+7Ts1mv2rQJC/cQ1bK
	h1v6+R/Qn9TYbEPZKWWogbTClLY+/Zgpad7WXkfdSNASBwEb04+mVStgxIbxiiZ6k1Kt3wwYZ
X-Received: by 2002:a05:7022:b9f:b0:128:d5bd:3572 with SMTP id a92af1059eb24-12c28c0f6f3mr1406822c88.31.1775724397897;
        Thu, 09 Apr 2026 01:46:37 -0700 (PDT)
X-Received: by 2002:a05:7022:b9f:b0:128:d5bd:3572 with SMTP id a92af1059eb24-12c28c0f6f3mr1406807c88.31.1775724397294;
        Thu, 09 Apr 2026 01:46:37 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm28451931c88.10.2026.04.09.01.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:46:36 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:46:22 -0700
Subject: [PATCH 2/2] remoteproc: qcom: Check glink->edge in
 glink_subdev_stop()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
In-Reply-To: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724394; l=1712;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=L0ObvfduWGAGP21veczdi1azriQW28n0o9uJhPgYbBI=;
 b=xe0URL/XMhcfnx9ZDqY0llEzE2lxiq1Xz3M6I/6NxV/iPXd6RWjb0BmK1m1XL6V2FSQh1nZm6
 H0zrf3mmxCODjPvRtTgTbq5tDmx9MQ09y0Lkm7e7VtnHgb8tOlEpXea
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NiBTYWx0ZWRfXxtE3qDyoVJ2R
 h9qg/7m17KdMdMnVL6ewA+J8vJF5DV2avp7wMjw5uiQJvPGfXuHlUHq4kdGfrkimBeOFdQOlH96
 KvFdy2yp54opLq9gr52I/mk/C/j+P10eJz+n/nLFqGKE6jr9ibhxPUIQs8HH48snhXot8n5vKbG
 51j1cjrDMd58kRUvcEHrO5VPMkDxo6fGTV3jqkAQ7oFws6jbjC31Xa1lwxXwTlf9wS79yqRHxY7
 xmF7Je8G9ES2B16Z+LzT9JLUIGuXXNXqurWJjRzu0XetNd9mp0zVwRe0GkEHKATKEmOcX+1mNxm
 TsXo0XjAySe4pouKxPE5sHAIc4KyAA3PrL/QsmqgOxdusN70N4TBnh056ZD7yKdtedZpebjQC5V
 IJvJwc+Cvl9AXnzzCV7U1p1iUy6Za+ATIqYF5sJrbcFgUxBxmE6ERoHgWfs5LyYQNCjzFGjfG2r
 v4oJ2PYpS8EkeToJZ7g==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d7676f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Bsuwbdf3w_HfsqIaBggA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: HPpnEJFaCzruxTwMsxYNaSDbT1nMG4fc
X-Proofpoint-ORIG-GUID: HPpnEJFaCzruxTwMsxYNaSDbT1nMG4fc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102444-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A40EE3C7F3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For rproc that doing attach, glink_subdev_start() is called only when
attach successfully. If rproc_report_crash() is called in the attach
function, rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() could
be called and cause NULL pointer dereference:

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
 Mem abort info:
 ...
 pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
 lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
 ...
 Call trace:
  qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
  glink_subdev_stop+0x1c/0x30 [qcom_common]
  rproc_stop+0x58/0x17c
  rproc_trigger_recovery+0xb0/0x150
  rproc_crash_handler_work+0xa4/0xc4
  process_scheduled_works+0x18c/0x2d8
  worker_thread+0x144/0x280
  kthread+0x124/0x138
  ret_from_fork+0x10/0x20
 Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
 ---[ end trace 0000000000000000 ]---

Add NULL pointer check in the glink_subdev_stop() to make sure
qcom_glink_smem_unregister() will not be called if glink_subdev_start()
is not called.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index fd2b6824ad26..79d9d45e0b81 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -220,6 +220,9 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
+	if (!glink->edge)
+		return;
+
 	qcom_glink_smem_unregister(glink->edge);
 	glink->edge = NULL;
 }

-- 
2.34.1


