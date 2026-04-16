Return-Path: <linux-arm-msm+bounces-103440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Kq6I7Xu4Gl4ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:14:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E493040F6F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 623CF30AB714
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF803DE427;
	Thu, 16 Apr 2026 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpm0hb/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P352djZ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07CF3B52FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348622; cv=none; b=Y+jt8qDAsBdgEl90RlV96WXnafksYzwTllhNd8Mq4oCAK0oa2IJ7E/OgtcfUA2tkuaV/RSG51TsS16AaH87+XqM+lzgUncyxtnz7hFrvBaB9niRelISYuSoDG/WY7laJZqlbmQw4K9X08kmzSiyAHDJclfesCeg7jdKnq2uCYKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348622; c=relaxed/simple;
	bh=y9g67LoOAK1zIYhgVoqMtpnLtPZtPHG+SZ4nbuUAoiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SRHl/oC+968htYm77YPwV4Bln/Ts2onEpsz+/Yt6VW+9CFf2IpGic0aNi2PCt7j+vJ7Prh586Wvb1QbjTzWxBVnCogJlSWaact3rbN2lEC0qIxj276dTbR8YP38uUQDs9vM97Qf9391ILAH87uom6NTN0en8Ew66tqZej5Uh2h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpm0hb/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P352djZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G9a9pv1553076
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWnkB32rC8c/c1FmukfGJLAkXTQ/yzUwW5QZTJ1tuHA=; b=hpm0hb/bFNhRlhQm
	0sLAALK9V93qPCce9b7ucLX45C1dmbYi2MfOxGGbKdeMgk3bRnhiLISNPQVYGE8n
	bHXIbaoGh1O1bNQGXY6+pSU9PzeHuxb0BGwoiYG/8aZdmeYLbrVUMIPQAM4qP0kd
	24cTtIKc/8Rn9rbjW35pL37BsP+PbwRJmbpt+7Kkow+9z3nd+ZXLi+D993MvUGIQ
	soIQm3mXVTq+2n8ZqQbfGR+E0v9NoWG4E5FF9MwW0Ipb2iF63ZQQbx0NaTE4RpaS
	7awyScIBfjNsPSgM9EAVqmxrjztZ6B3xELGfZ9LwM12ZS5V4QdMJnF1mEib1+3fS
	66BY1A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn9yg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:18 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7987861595eso230747377b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348618; x=1776953418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWnkB32rC8c/c1FmukfGJLAkXTQ/yzUwW5QZTJ1tuHA=;
        b=P352djZ/bIV17XWW3/F7yVzXoxfBVvJesbKoSqlTQVECFW0UboKnrEYV421IlkpV5e
         50bz45SkQrPsyN4V9y/T6OM6/jWBSiUYpZxbSfN74N7/GO1uMs824J7Fd86wtI2ULfAR
         TKrffZ0MJH7W1HBkBuM1XpvRm1ntxvYlu8LkJFFe4JOiIqGMvXiBtWWV4/rgodx9aJ1i
         WSBcesLc5D1ZesuixeorY6F91A2FgPpZ+aEC1R7twcfyLVzxUTECJnOnaTNSgfieouWy
         ZFmS/BuUq20gDtVaOz5VH4QUEd6yt4OpqVjLLwaLe0553AdW0t5ky351wEkMoDGVTE+t
         XZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348618; x=1776953418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eWnkB32rC8c/c1FmukfGJLAkXTQ/yzUwW5QZTJ1tuHA=;
        b=ndAVwG8X4RFwOu4dzMeC5jxrVIPunxsPtbChMqFEItnWdLHv/xjbmdomkVs2qW8MDB
         AlU9Ln7snVDO3tZteMHJ+AQGgpaLHrQNJtBTZs4184E+VOM3fMdJpKSxuZxmesmv6gED
         u5rxoyb5y5jGf67yIZwcr0xrc/amGigZANtV1VcFr0iVl6XckDffYaUTVxaYvk8I2iJZ
         dyiTmQ6LzKDABBGAUwdi1bj8XUQzq0maoariHgef6MgueBJx8U46d5enBnsLhFKbf1lo
         XgU+O59Pqr7ND6etODuc/iZyZXddN0rldq24qYzNehC3LjEcb42XX8+u4vXHKLerqRDP
         a2wA==
X-Forwarded-Encrypted: i=1; AFNElJ/J5kM1pfvyPmOvudVSZFljZRjG71yo7gmWQ3WV9+LNahxFrUBXAQJRZHgxoFlv0FiuHk+49UkYiuqv3+LZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxcYN+RolE+xoaSfhGF9o98XQkZoQaKPKAMSBUlbLu7pGFm3UEf
	5QdbDvBWg9Aj7xn4lTqQcnywWo+TltoWm5WzKALS6vzyWtS/GHQYN4Sfjj+eZq1nzSDx+0j7SWq
	UIOslz5IEujYqApv3gPx9z7aIck/MgtGh+btNF/ok1SRZdH2vEbgt98Rj4HFMZpB8cUB6
X-Gm-Gg: AeBDiesxWbDWsMNjHzLHQkGM7akcT8s/3FaInqxhYtxu8j6dQ/LBnQ8x/ECDJKSu4l4
	dX5DWIqabfrE9Tnql0L3pHo/swj+b47LGRL7b3WTR5smDVadNkSZTvQZbAYpyqnaIhKhx0iTnT1
	sYFVd4IJxogFpg9VJCS2AjBgARCHMbeJKwlKYF9kG/cB+BogTtkuOZE6BiKkzWGDORdabTKJBK2
	OGTMh3xVgYfw9Zxs9HCtkxD/jFlIfZyFqKlfQWfKc91GnjVGThJrtgybklvReyWG4lH7o5IR1Ui
	fpWtgJVXL7rUwOAixYuIGya9xOQ38a0sPg+TNAS/fnqwW/yQtY+8afkEzA5mqvhk9ioLe8XFRZ+
	sX0Ni2wzKrDaJP9IUhG6TsA/yG14d/Gb7HbWso2nhfiNZojGppwU=
X-Received: by 2002:a05:690e:4093:b0:652:b4cf:5f4a with SMTP id 956f58d0204a3-652b4cf6489mr9471030d50.37.1776348617299;
        Thu, 16 Apr 2026 07:10:17 -0700 (PDT)
X-Received: by 2002:a05:690e:4093:b0:652:b4cf:5f4a with SMTP id 956f58d0204a3-652b4cf6489mr9470976d50.37.1776348616813;
        Thu, 16 Apr 2026 07:10:16 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-652e47ba4a3sm2084691d50.17.2026.04.16.07.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:10:16 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:39:45 +0530
Subject: [PATCH v5 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-sahara_protocol_new_v2-v5-4-6aebf005e4ba@oss.qualcomm.com>
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
In-Reply-To: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776348592; l=5296;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=y9g67LoOAK1zIYhgVoqMtpnLtPZtPHG+SZ4nbuUAoiw=;
 b=moq8nUJ0iUz8BQ2TQ8GG3ft1cyqL1DFfDQ3UYv2eS/Qyql41eeEq9JnLpiDH0cxJMFU/XU1RY
 QA9H7PAlju6BGFBKd2Mucqmhx7mTeCTRhGPO2W6QwUfnz1rrBJEfDSM
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: QgKkWbDF3HACDjXoUdG7YUCjDdpiFMUa
X-Proofpoint-GUID: QgKkWbDF3HACDjXoUdG7YUCjDdpiFMUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNiBTYWx0ZWRfX94xl9m100Ymv
 QaJypv0HdFo+fbdD9kgdYv2h9B0hIa38ItESVAjWiZ5mgD6PmI7ZNXP3tCixMYze4EU0EhQ9BlJ
 7ncmJ+fzkTjouunYaW7XiP2KtsSoApvjB/VgUdh3vhTF5UWEX3IRdHQQKy2r3ENfVYYio2c4cRA
 +hMUNPIlyAmo51r9LnN+rulMT6YFQSm7ncPKhC6zhhrcqKzSL41YGeuLyj4hVOclrsWj/83RHfG
 0lHUhH19UZ+cjeF+IXNE1A5rq4YsRDc37aIryJG5+YItqvI+OVNk8Ye4w2Goc2cUCvCY1t/5c8O
 QPM1YXfAFoeXOlIj4vSlr9MG+b5klwpAOOTEExWczGh2qd9IaW2A5bVIqQ8+7SfYtKHvDD1bQUC
 96mob6cdQCfOwzh2hgPkHOBKcfhVErhZJ+KusaOMttY5SvF5CKcIUgHAFNvLRDOxvtrruC6QkMx
 dsOjJjhPLTdwCSg7rPw==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e0edca cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3TBL8zyTcm-CCHetwZgA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103440-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E493040F6F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Sahara driver currently selects a firmware image table based on the
attached device, but it does not recognize QDU100 devices that expose the
protocol on the SAHARA MHI channel. As a result, the host cannot associate
QDU100 devices with the correct firmware namespace during image transfer.

Extend the probe time variant selection to match the SAHARA MHI channel and
associate it with the QDU100 firmware folder. Add a firmware lookup
fallback for cases where an image does not have an explicit entry in the
device's firmware table. This allows required images to be provisioned by
the platform.

This change only affects devices matched on the SAHARA MHI channel and
does not change behavior for existing AIC100 and AIC200 devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 27 +++++++++++++++--
 drivers/bus/mhi/host/pci_generic.c           | 45 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index e339c67e236af271645ca81cc517efd9eead87e4..9adbd84859073d8024ba2a5fcfa33897439d6759 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	}
 
 	if (image_id >= context->table_size || !context->image_table[image_id]) {
-		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
-		return -EINVAL;
+		if (!context->fw_folder) {
+			dev_err(&context->mhi_dev->dev,
+				"Request for unknown image: %u (no fw folder)\n", image_id);
+			return -EINVAL;
+		}
+
+		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
+				    context->fw_folder, image_id);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+		if (ret) {
+			dev_err(&context->mhi_dev->dev,
+				"request for unknown image: %d\n", image_id);
+			return -EINVAL;
+		}
+		context->active_image_id = image_id;
+		return 0;
 	}
 
 	/*
@@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA"},
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 391ab146f501c6ce1c81f6138f7c491a49c2f264..82e41632afc555a53dec3d8395558ae039b33bbd 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -300,6 +300,43 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.reset_on_remove = true,
 };
 
+static const char * const qdu100_image_table[] = {
+	[5] = "qcom/qdu100/uefi.elf",
+	[8] = "qcom/qdu100/qdsp6sw.mbn",
+	[16] = "qcom/qdu100/efs1.bin",
+	[17] = "qcom/qdu100/efs2.bin",
+	[20] = "qcom/qdu100/efs3.bin",
+	[23] = "qcom/qdu100/aop.mbn",
+	[25] = "qcom/qdu100/tz.mbn",
+	[29] = "qcom/qdu100/zeros_1sector.bin",
+	[33] = "qcom/qdu100/hypvm.mbn",
+	[34] = "qcom/qdu100/mdmddr.mbn",
+	[36] = "qcom/qdu100/multi_image_qti.mbn",
+	[37] = "qcom/qdu100/multi_image.mbn",
+	[38] = "qcom/qdu100/xbl_config.elf",
+	[39] = "qcom/qdu100/abl_userdebug.elf",
+	[40] = "qcom/qdu100/zeros_1sector.bin",
+	[41] = "qcom/qdu100/devcfg.mbn",
+	[42] = "qcom/qdu100/zeros_1sector.bin",
+	[45] = "qcom/qdu100/tools_l.elf",
+	[46] = "qcom/qdu100/Quantum.elf",
+	[47] = "qcom/qdu100/quest.elf",
+	[48] = "qcom/qdu100/xbl_ramdump.elf",
+	[49] = "qcom/qdu100/shrm.elf",
+	[50] = "qcom/qdu100/cpucp.elf",
+	[51] = "qcom/qdu100/aop_devcfg.mbn",
+	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
+	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
+	[54] = "qcom/qdu100/qupv3fw.elf",
+};
+
+static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
+	.image_table = qdu100_image_table,
+	.table_size = ARRAY_SIZE(qdu100_image_table),
+	.fw_folder = "qdu100",
+	.non_streaming = false,
+};
+
 static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 2048, 1),
 	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 2048, 2),
@@ -1399,6 +1436,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pci_set_drvdata(pdev, mhi_pdev);
 
+	/*
+	 * Provide Sahara firmware mapping. Sahara consumes it via
+	 * mhi_dev->mhi_cntrl->sahara_fw at probe time.
+	 */
+	if (info == &mhi_qcom_qdu100_info ||
+	    (info->name && !strcmp(info->name, "qcom-qdu100")))
+		mhi_cntrl->sahara_fw = &qdu100_sahara_fw;
+
 	/* Have stored pci confspace at hand for restore in sudden PCI error.
 	 * cache the state locally and discard the PCI core one.
 	 */

-- 
2.34.1


