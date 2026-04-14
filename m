Return-Path: <linux-arm-msm+bounces-103032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIbBKpvK3WknjQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:03:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CEF3F59CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 235B730B3336
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB5D1D5AD4;
	Tue, 14 Apr 2026 05:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpih+3HN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yp4jrPCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FDB27FB1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142854; cv=none; b=j3yxDQke0cpFgAzZqX+N0ahNMPdl4U+QbMUQ0zjYMLgZ+q0pPeX1lFKq3Lq8pPnncatLljF9fxzU3cQolGKNV4K7rIrkkCEfWripd4PoDFy2NGpa/HbSBepV1OB6ZKOiAxkLNv2G3u2wGVJnh9VIDFIuO+R6nE2VBS6QJkzpdPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142854; c=relaxed/simple;
	bh=i6ZmiIhYyteEX9ku3DC5s4Wu1KZIwZCobr9Vm2PQ3dA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QU85WRtRqZWY7eBg+dc3AIOc/r7/EeunNtJz7yqF08XOsAd/zBamJ4EtTpTubQTWpbQtWdl/I8LRgpT5xuRhSpqD1QJ9i8ZKNNAmagJMYL2u7QJtKb7Q5ZSJhBsiU0wBM/nLjrnPwdZRGZev5FJXx/jD5sYz5+oE/jx+sn48Y+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpih+3HN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yp4jrPCM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLChNW3505410
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/V6Rs8rcZ7PWWMWLKnxm5Zkp3zsUGa7EcbO4a5GtxCs=; b=gpih+3HND/I+h2iI
	E0zqieeXjDHZEX5HqWtB5fFp8+ztXhjYpp+BxQA6KpiVtJsLFu266A99rfghPyA3
	CZNBXiYcpMEZ6v55ygSTZwCIEKf7WVVpZljpgWb3BB6GR5cmRBOj9AFDq02Tj96T
	9sg3iE6DqeQ/Us0bcs3pnxzMCBkeC3WnQtUs24HA8LTKMx4mxANkyBGUhWRBro5l
	Gb/kmekTcEnuS1/9ErG/er95B/PF8Z/nymCprb/dsr/aD2EuVWqf/SoYQYhpI+Vf
	QXPlClLSmJKrqjqxyrKw1FMQ+m4so/Fbk/0OTxntujLR9KOlANZGPhDmIauKCGpa
	Pa/RXg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870h2e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:00:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da86144daso6109399a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 22:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142852; x=1776747652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/V6Rs8rcZ7PWWMWLKnxm5Zkp3zsUGa7EcbO4a5GtxCs=;
        b=Yp4jrPCMeaBRO7Hm6N28zbDIvOuUaweho3EnOg5p2cisRtVhwI/Q4x/YE0m2X4HsTg
         kTYDw9bvolchFQuxIbxcOxDvZa1EuG/3AV0V6Fyz6JZzcRwfm4j5T3i9RoHPC08UQQyQ
         7NeDpkbC05p8AWbdj1zznoBHawh755tBNN9gMYfuOD2f4k0S2ojpeOJfd4kUeMtB0kPp
         1KLDMoGB3yn9Q4bI58gdo5cAT9HIAGeG5cq4tiVyHO3/w9OZnZbM5ZUaunxM6Fbla84W
         O0Rsuo18eiLP+Gd8zmiiqjO79Eg27mUrJeDbtAUfCqqeOERgSaC8KJu2+LZXn1RbRXVu
         eCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142852; x=1776747652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/V6Rs8rcZ7PWWMWLKnxm5Zkp3zsUGa7EcbO4a5GtxCs=;
        b=F+VPLcLkplq0tNd1QeZyBOku0bfdMw3wTjkyl19Mbi7ifOu+w8UOVOKfhkN7q2p9Iu
         deVvrZt6OynM5F6bd+Lg2tOffoNCWjojE/Fmu0Z2+/hjaVMNm8+25dqVaV3s0pdReW8Q
         khFWJ8B2AJYpCKXzIuFHIGKqbuX/4O1JHOTpuiPg3NUAgdNX10/AsGo8MoHucAKdM5jZ
         4E6vvpWN+gRlvXAMdbTgExRIl2WJBjOU5kYhX/k2edMzy3bB2dOzBn46ab6k3PlFL+vB
         R2m63/tK3mrIcDJdGCI9JuJJ1jqyDSn4+MBt6y3jxZiCdUHx2dsF2N1UigmCJNSvkq5w
         jdqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xeH2wNsq16SYedlGVFusbspkrxLYgXnextzBp5ZvPenCqtD7tn6U2LOcg4La3n4DFxK1uAPYvgVnGpZ7v@vger.kernel.org
X-Gm-Message-State: AOJu0YwN3iagayUJHmWNNHmLmMOKX9eNvPLACUBOBejJ03abIiDbUIXM
	85xMFLuxi4QX4ts+fh40jERIy9omty77FaumB35lA8Yw6E9GYjdq0w5Q2gWK+X6EH8M4szq2fUN
	+an5HgfzFYUpenZtDX/EojkWWxkO/ogJOnNTwCRvitCn7jbovT8e5MR3VvTtoLmVdUbKO
X-Gm-Gg: AeBDietiM7gtfMpk/FtG1Ohss7FnLWizG6Nl+YUA5BZtuUFtF5DA1wQtDJRaUoRq3ay
	hRKn3xC1/SD0mjKJhDWpQXNHhDbOUSacJ634Lx96FwxOqDu5oOljvYpi6yY0vn0QujvAL7J5C07
	u2yJmYaOeN9muuH6FDC7UcSO3DtdRh60wiY+TCZBygoH5NlE4lbVc0YP54xPB9hc4uk5i7+qLnH
	DMKgFBLEoTYnDwMBoFCPXhPjS6cjdBv6g+6VmQQB/9flsjndRai4qZ8H1uG5VUoMkd3Uru7xS3H
	cMYrHKfKDntGS7wc5NXIz9TvNff5mflVw0tNHqa5Jr2vEgmNONr6gFPG0cXciDNYiQ03pTs3m7e
	7bysRuJ0cQcDXS0yldbvVqzX5UH8W1Tirqnb9f8lUdMnMHSm+B+IEMW8=
X-Received: by 2002:a17:903:4b0d:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2b2d5a69f1emr147909775ad.30.1776142852158;
        Mon, 13 Apr 2026 22:00:52 -0700 (PDT)
X-Received: by 2002:a17:903:4b0d:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2b2d5a69f1emr147906225ad.30.1776142846873;
        Mon, 13 Apr 2026 22:00:46 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:46 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:29:59 +0530
Subject: [PATCH 03/11] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=3016;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=i6ZmiIhYyteEX9ku3DC5s4Wu1KZIwZCobr9Vm2PQ3dA=;
 b=+2+NbB6zm/k4yanN1JURhnrXB+oAf2ZOIVM4jw6hSDlg8urxTn2L1XRBSID6qg9Tot7pjAl7Z
 FeYY6PQsmWiBH7fqg1XPOijE2WBn/Q5eKdptaSAHhJBvzPYfJMoBCzA
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX52pbZiwlWk2w
 cLyKnsNqMNSoPhRByYTP+YOujj9w2FmYdeBomiyxhRvQDUIyO8mdtQrP/nI5ZJnVMaiXZK61zNw
 hinmavIRbPaxmft6kqe/Z8l+fRmtvh+gmWzCo+PYysZiydpPdyvqhEhLO4adeLC3wsm1m1/Asl7
 riVFBmJEPCCn4BCQL7EG+8oFTVAecE4EWWORKKv/xLhijbFpZ6IKNcwE5vhKSpKGguQrpUxM7ic
 ViOolkB6tRsHtsuDShupDY0+DdyZ0foxEvrii/8xTHLCDs0ktpIqjOd+TPqiKKwXPRaUefiOOQz
 cbOrzycNxr5NLaAlabvbisaIj0zLMq8dlw4X7gM4FWsx1sY49HSGdc2JQeV2/NQDyt2xyqj7SfW
 zbaply3DNVsjakFMT/tVwrcIm7nMACLCKqvE7EDA9XnxDlzU7bFrcoxFrMFWt6hvaBpX2PY4Z7T
 P8xZQIDVCX+DgxCgRYw==
X-Proofpoint-ORIG-GUID: t_zdSr19Oz0XqwoO82992Vh9am12VCvw
X-Proofpoint-GUID: t_zdSr19Oz0XqwoO82992Vh9am12VCvw
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69ddca04 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
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
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103032-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16CEF3F59CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add init and deinit hooks in the platform data for context bank setup.
These hooks allow platform specific code to initialize and tear down
context banks.

The Glymur platform requires a dedicated firmware context bank device
which is mapped to the firmware stream ID to load the firmware.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..55ff6137d9a9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -219,6 +219,8 @@ struct iris_platform_data {
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	void (*set_preset_registers)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..34751912f871 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -142,6 +142,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->init_cb_devs)
+		return core->iris_platform_data->init_cb_devs(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->deinit_cb_devs)
+		core->iris_platform_data->deinit_cb_devs(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -193,6 +207,7 @@ static void iris_remove(struct platform_device *pdev)
 		return;
 
 	iris_core_deinit(core);
+	iris_deinit_cb_devs(core);
 
 	video_unregister_device(core->vdev_dec);
 	video_unregister_device(core->vdev_enc);
@@ -259,11 +274,15 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = iris_init_cb_devs(core);
+	if (ret)
+		return ret;
+
 	iris_session_init_caps(core);
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
-		return ret;
+		goto err_deinit_cb;
 
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
@@ -298,6 +317,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_deinit_cb:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1


