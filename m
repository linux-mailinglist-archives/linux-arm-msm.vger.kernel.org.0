Return-Path: <linux-arm-msm+bounces-105846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM8rDXOX+WmB+AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:08:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CFD4C7852
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88CB4305820D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694773E0C54;
	Tue,  5 May 2026 07:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdjCu4P/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJvoHINv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A743D3009
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 07:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964471; cv=none; b=RMM9UfBzOsmcygKeJKXDi+iW7R8k/gA34FVv2Z0EDZO2M3IVZ9rb0h358lRHRWxHWmSKVN/sZcTur4D9i7wVIp1s/ruk1X15kcpBAh5XAXhvo/RPtSoqj2/bvthHiJ7HkgKetP9YuFO7lDCI0mtldGOOq6JZrjpkABfQAVdCXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964471; c=relaxed/simple;
	bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkbQKOOOOJki6r579rBttUsyrZ5kQvu0E0U0lUWpclVpllHJOonwN6U6A4lXUQNIMLQ6fS3wkYgbVfake7ctkaOLjlGzNyZL6FcVPxEazTLSqDDk9f1fVB4mRHrEuO1Vpv7OCYqmED+2U3p8eb28IYk2aLVypwj6xmZAMoQUKrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdjCu4P/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJvoHINv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6453xi691151496
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 07:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=; b=LdjCu4P/8xtim++H
	11ySw/8csdxm7YeaptSggci7OMVSaCGBF4xeVOyXcx7gVzCfzBNHiJdGV7lZFoMK
	ezw57U65lW9LW99UC/Kt102lan8RhFEYhpp1v3c0UJI20DYN5DjN3wyRD5HQecKO
	CYh98HbTIHRetymrNc/kmpCWqvgscUZH7w+fAFntRaxaeIm0IvRiVc1o89rvlMa6
	fvyes115G99cxv6SAmOmj1qHKPqa97JxkTfEVOw+EpgZteOB6MC2S5MIoxgrSl+P
	zcSWZsidybdF7FzUEec60YwoTU2xNjGO6RbRHkKIPg1XGNFhVV5wvnrF0q+oUahv
	jXB8lg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscybumj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:01:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36529b265cfso2203900a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964469; x=1778569269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=IJvoHINv7od6KCDboNRw7XbHnGn23UDZena9ROtvpIF6VEjPen/gmRPk7TKyDrc6KX
         N0faQfaaXMkPsL6T/q8VvXplPdiWgYOu0/0vPGS7EXz+XtUAqaUFbA/bF/NhmAIZIg2i
         UHVxP/A1FSEyB+JyHBhhpE3gUK7hIWBBj51yAN+KLfIKhWLnAw4gJteQVnwNaeh6MA34
         skRFn7ZjnWnYuqtSxywCQ9HLP6+foGYscQ6AmNPLK6ysD6BjpMNhrpey1WIzZ03H6ejU
         mLF7sxj1hKeIg9QEk+pi3Z92zjmdPAL4ENjlwZEm5Y8U2v7D9rYnU6nzSlYjbN2LD+vW
         INRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964469; x=1778569269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=TBqZcw5UDoS5rFd9O15BYKzmVPniTKDgEqLVWfPVc14WdDjh5DL0A4WwzVkFLMIX1t
         aySKzUf5wpahSAFPEwQczgfXnWvU5nLGozBc8lN7PIVuTOj6IKHVZZZMSuJUcB8Hd4YK
         PiCK2IDiOU4zx5ci+V0w/VicPb5sApBmi+mKJ1dM2NoCTUueVwm24GRBEjeb1cAMySwk
         FWYuVm8ce3BEy0Jp4BDMw2qSAgIYg9g614dO4K/a94M8FgysAvLv6JdboqhONMpsVHCO
         0eKeSjRBbatzIQCYPrcvZxCi3e64H+1/py0Lor4aCkRLxSbA3lpk4+27ghlkyjZWUnGe
         jGvQ==
X-Forwarded-Encrypted: i=1; AFNElJ86B0h3peVFpAsjTQK8LdwEORFmBMZUGlOoFL4wunWeTpH51WmJpbQmJRvJrvhVedOZQviBOqwitBlj6YUj@vger.kernel.org
X-Gm-Message-State: AOJu0YzWMj9Py6SYgYRx7yF7EzQjasZvgdPfANvrGsJzhKKo0tk5nR7h
	ELzgBf8rbuUmQiAz3mEfdQnvb1hDj2PFrAKcBk9Ur5ksZ+cO0qAblUPIfnM18yUda2wXiCoyOzj
	9jTOlDYbHF8ofoIzv0FOSGhUSSDshefh57QltyIeFm2OHBT5bxaB4A9O1Fg5+Mn6rRiVc
X-Gm-Gg: AeBDietm6ZABUfl3ODV1HpwwbxX6L3bMVTSvEphXkzgJGlacViggzjKjGB1aIQWamEe
	JqGC+d+Zk4b0Udk87c0CeGk4xtBh6SC6C5exczNdSikto8kL7n5g2gOyFaI+dsQ1K6Tn9s1z7wn
	qMirte2FbW8bl1HEwjfk8HiED500jzToi/0m2w5ELd5w6e/2RpWfbnewoA4eLPpvayzhm+jZ3z8
	gUxWVC7x2lkS/TEevF70irKIbwKo1BuuaaKk8qJWq0mc6J7Sa5zgpZ3fG88yDPxg9P2NPIbEJCK
	VA0g0lvve51H6W1aK5Xt1kQNVA84eKA9fglBG6CFWETZ22K1VuxFok1+1Ov+dd0EncLzCggHoFu
	7TgIYoAEwdIm8cR9PGvfR3xeigQa/vpcJ0h8HzLQiP/XenqH5emVafcEkSojXQfYvL/D9pGHu4Y
	Vh
X-Received: by 2002:a17:90b:4a:b0:362:bfd6:a875 with SMTP id 98e67ed59e1d1-36577369c85mr1964929a91.1.1777964468572;
        Tue, 05 May 2026 00:01:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4a:b0:362:bfd6:a875 with SMTP id 98e67ed59e1d1-36577369c85mr1964891a91.1.1777964468052;
        Tue, 05 May 2026 00:01:08 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:01:07 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:27 +0530
Subject: [PATCH v4 06/13] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-6-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=3016;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
 b=gsq9OxYUHQTzG9WaiC2/lfHisQcvobFOu9F3SM0jPXdGrbQ3ToFwtcC7nTt2I2lSoKXnT3nkO
 Ac2QeRNg2mbAez7nZcKlVIZXGff1VBznkJqWiAmryQnRSp7Q6fkMsYh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfX5LTosQfsPBDj
 ODGhsciJ54jlFdvJNs85KbSUX/L8O93cbWAzbxoJQJfhEGvKJ0EzBs5VccfZugvI+YHIbO+xDSX
 NMD/QmwvN3/A3U5aKFnqFgmWUlLF68b167gjRJL3Ojm+J26ucWcUc+sRVPDopMixdUMLDv2oh9O
 zpf1B6CahIPbMsuZHDHAMVoekhKx5KrR7O/U0wxAL1k3nIfFZGeMcJO8WnR1pbKHW2UpttUewpl
 4oE/hNElbaj1Q5c0AtSUJLR6a0tAlKAkIKLU/mW8vHNicWGZ9JhkkTqO8g7RV96SbCDgU0Rqk1X
 mjkVnYD21iocyf3P+v0lTd2tGyEicPDzjGi7TBOM4RxcB+NecF38oq7I4PiS/+5fll95F1avpf+
 5a7TLaN70SCOXe248CYCqLjEywkrbDwbepG3zIjR05lVipaiZgeeqkt2UZ4AQGQvQ/hMo1dCy1e
 RWJ6z6eVOFznUWs1/UQ==
X-Proofpoint-ORIG-GUID: 66gVyI2VHZlKZv3gCN5ZGt5kpKnv1t3y
X-Proofpoint-GUID: 66gVyI2VHZlKZv3gCN5ZGt5kpKnv1t3y
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f995b5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050063
X-Rspamd-Queue-Id: 30CFD4C7852
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105846-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Glymur platform requires a dedicated firmware context bank device
which is mapped to the firmware stream ID to load the firmware.

Add init and deinit hooks in the platform data for context bank setup.
These hooks allow platform specific code to initialize and tear down
context banks.

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


