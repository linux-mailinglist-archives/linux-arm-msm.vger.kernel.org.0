Return-Path: <linux-arm-msm+bounces-97385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HdICHLcs2nwcAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:44:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E68280AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9578031D88A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709F637D13E;
	Fri, 13 Mar 2026 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/lAngTI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2wCnFzc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA6226A1CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773394955; cv=none; b=vFAUWGrnUezk2mcn6yIrJzPuaIscVDB4s1PjVjlenbXWKNEF6gmgOfVG7i3MZQhNTaOyB8EWKoIjhlYrheQ4rtf2SSTzEuiWWcFKgrNQ9Ra2JVKydZr4zENu3w2DGMr3P9sYXE1P5EebLPp8NEMr2zFyHla3IANPHyUK25DLGM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773394955; c=relaxed/simple;
	bh=8C+Bfl5w+ESq4aJnG7TTnkk5YDJVGnCoPOSKfHiEKKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t//Si2Rt9sLLIRmzA6BsWlJCHJiE6cG6MDbrygOmKTIhjS7Ip8Z6xeGC+SAbH5ZnFHao+I6W6Lu2Vk8+dT7vy+4XTOYgg5WXE4uPvfPkDKLbf/y7Hgd53TNWDzXwrUmZ7QDTkCilFfcrkV0cBpjtXQe/D78i8+134fTYW/p+a80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/lAngTI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2wCnFzc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tt1a3844877
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jt5AGeXSm57vPQPDFY6A5jMUvS2MQ9bHne5IvcZiYRQ=; b=U/lAngTIuCb/DWWD
	PiNY4rDJVKALjKH2IPVJDFppjsSdWitsOEu6xLAqaKIyEiP1mIsjNjUP5i1L9XyM
	7TLsBDzo2UG2BQ2QBFVAlER1vsQcyHUFagLpPl8Y3dRuhe+1uJg2Mimg0/WSPc1B
	kcf0W1nn1h7zACGnVRk0ir4jB906zvOOtXv2XzPcmO3SpEy9ZqEWfnyqWPUPIpR+
	FuHHNUTVM0lcyO6QbHGQsmBJnih+VpuLhVJ+BOj6Y0ct5gGZTXyqYehSwL48UfQ+
	qWPqnn+jDKcE+i6vPEikyZpQWQqDXTcA5GPhFnmnmsLAHVEmeOlX5cPDmFS0rtaX
	uXXJIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54wenr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:42:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fa82ebb9so107323216d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773394952; x=1773999752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jt5AGeXSm57vPQPDFY6A5jMUvS2MQ9bHne5IvcZiYRQ=;
        b=Y2wCnFzcb5W0F3gvUSSc0DAmEWob37JO43FTFejbW5Ymjr4AGDCubqgg2PriaGDoGv
         eNdtVCZ2jq1rF9R/4ZtB6YGJbeOX98h4WwCz/zRJw1P8h0Eeco+E8/1Bs/nrD3Cs+W7z
         OlS3AnqT/MbFvk3Nmx50s4+jGrz9UY0Btx/0xRHY7OaCP3bvVuxUI1hUg7wJ+YsZZf6S
         zEE474zY7J3FjClEqZs5fsvIDNYAuwDVU/mNpyrBOVq+XZGQbQGwjNqraCRipsk6aC7m
         lyp/pw0RA4GNFFx8d0hBWBo853NZpF+qGoUxjetVpiFdfAr9Z2AAEoU5cankUN7aaigB
         4KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394952; x=1773999752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jt5AGeXSm57vPQPDFY6A5jMUvS2MQ9bHne5IvcZiYRQ=;
        b=oZkhwr4OPxWx6GocjvjKmIZ41PuUf4wSNbyqH7a5Df0SjC6MhBdE+HWDMEtHsA5Mh5
         +bdEdfAus6b5uzYA/9L6wnjShdZpkXwvv9rclPfiujkS2ycwckaRV+6tKHrKA96x1RxS
         9NF9xgDSJNegIIvFmspSu4By6lBHpY2/3q1DiHmvjrl/IQ+mmbaMch/3OQWex66o9GUr
         XDNnMpOdnk/+b/Yh8OUWpvhdsR1MCx7ml+vMwXQ1XskWpIfz5NwQLNEQt1LwpfN3tL/h
         XBgsHH6xVy4tMJ3TG2Jko0XV3EJb0QEUWGStj6sZD1SNmGuQWvHFDKsDu1AIojSRWbsh
         GZpg==
X-Forwarded-Encrypted: i=1; AJvYcCWWY6/lK18DHLLjDb5hODaDM4SRsHTdfPpcRaYR0Vj2vjqYvmmMKbkDeu5bl+jWg/ZsK2f5flXLngHAj49l@vger.kernel.org
X-Gm-Message-State: AOJu0YxgoFSSWs6RmWZbSUWl4ziRPZOUJEvHVoYYDHejgnp2qu9Rin0/
	FgZslOAfzfg9+oy3RMQp1OeXqzs7QpROvBPqrjKqoJaIx3KoYbtfU0Qr3ES5Xzofh4coIMM95yl
	avmmwHgUrjedPlReBwMfn9Mr5CcDl30jnksqSZMazYlovmxCo0Bh27flvuvvBuynpfbTf
X-Gm-Gg: ATEYQzzBu6w6azDq+NhgSBDF7/8jknFjxCpTIuk7oSrjv4HIn2GWwt3BkXsEBAbbg8G
	GlDDBQBbbCT0qqW/0D96BdtFXBHW/TK4Sxs4ZDEO3ivnGu9s1m7a3Fh0QDNBnvy2RqOrYnaelnX
	MZRlZ58a4kr10adLFXq4OGkGrowUkgfiqV8Ng3oNVFJf5LQnuuFgFjpSBZHkfXjgLZRzXuQP1UK
	e1eIbxM+qj5xvvkRrzy3U2ibOSh0ZG63fe9KYRcF13wkpCL3Q7Gov+gGQ4L2VHH0TcVpLAejX+C
	DfM46kRSLdXFA4mFKvFhnayKzyvHeoaJnajQrtvm3ZCpmpOON8Av0LTjbXNoiRE1pOdIkRfWjgz
	7YsUTII+/B8qhiZ7msgkIiCUzzDfduCSYDCM8dgyDGiongrnQ7+d3ASP/HwDxw1c6W7lS1JRXOH
	ElY4G51owuFTC+
X-Received: by 2002:a05:6214:19c8:b0:899:ff66:8152 with SMTP id 6a1803df08f44-89a81ea6211mr41110266d6.39.1773394952198;
        Fri, 13 Mar 2026 02:42:32 -0700 (PDT)
X-Received: by 2002:a05:6214:19c8:b0:899:ff66:8152 with SMTP id 6a1803df08f44-89a81ea6211mr41110016d6.39.1773394951760;
        Fri, 13 Mar 2026 02:42:31 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d0a7b6sm54663656d6.44.2026.03.13.02.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:42:31 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:42:14 +0800
Subject: [PATCH 1/2] media: qcom: camss: Fix csid clock configuration and
 IRQ offset for 8775p
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-vfelite_fix-v1-1-2ee7de00dee7@oss.qualcomm.com>
References: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
In-Reply-To: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773394942; l=4548;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=8C+Bfl5w+ESq4aJnG7TTnkk5YDJVGnCoPOSKfHiEKKk=;
 b=2hshOiChSGIgowfhQXkX79N7NUDWsDYFzPEJc4yBZvZTiJ8kERNOfjwYpyXFXUQ9sHl8Ty8MC
 SyZqWlCrVxRCbPLAZvd654I2QMJcDrSWuK+ULgkiSB2Sks3praYlc+2
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: QxzWsLu8wIA4HSvWZYsqc0DX0Z_c_-MD
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b3dc08 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=st_MFZYYFGq7bypRZrYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: QxzWsLu8wIA4HSvWZYsqc0DX0Z_c_-MD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX4y3V0bHmGao8
 tBfZGTC2UE2S9GQiOZdzfNeTmiXRDCeIoIScGFWMRLTojJWIzqXFBnXFltVTptZXWzYz8QdwRf6
 QDJ57C+086YeQ3y0iU4Y2Vo9cU3CJ+opTyiIiA8Y5JA8VMPfnpfP7WkJDJmy2ncsX8qV1crF+4L
 bazc2vqq2OqCISQjPx8wAiJ/Z7kgN/dt1FJVT+BktjH5uPF+BJCfNB6Ko2MpdKZLeUCKQDWZ8Ch
 zN8qQQkWpaixyuRtPRwneFEsGrLh3dM/vhsDXDEIhK6BmkLecbtQxD1+15YwHmACXTrzDaog++k
 XHHMzJRoAeT4u+HQmL21xsJP/hpphriqHTWZ55fGo27IIa1QNHLsLzdrYGBdduEl5D9JMCCDrIm
 EH8AkgcZUVDvw+WQrQ+MGqxTQanqbEw7bZsHLf4XpW9Wfw5G+stl/VlTWubWhrzjF9tODu7WgW2
 qAWtYQgODgsqtWRu9sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97385-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71E68280AFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix two issues in csid driver for 8775p platform:

1. Simplify clock configuration for csid lite by removing unused clocks
   and correcting clock rates. Only vfe_lite_csid and vfe_lite_cphy_rx
   clocks are actually needed.
2. Fix BUF_DONE_IRQ_STATUS_RDI_OFFSET calculation for csid lite on
   sa8775p platform. The offset should be 0 for csid lite on sa8775p,

Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 40 +++++++++-------------
 2 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..bd059243790edeb045080905eb76fef3b12caae1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -48,9 +48,9 @@
 #define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
 				 || (csid->camss->res->version == CAMSS_8300))
 #define CSID_BUF_DONE_IRQ_STATUS	0x8C
-#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
-						1 : (IS_CSID_690(csid) ?\
-						13 : 14))
+#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ? \
+						((IS_CSID_690(csid) ? 0 : 1)) : \
+						((IS_CSID_690(csid) ? 13 : 14)))
 #define CSID_BUF_DONE_IRQ_MASK		0x90
 #define CSID_BUF_DONE_IRQ_CLEAR		0x94
 #define CSID_BUF_DONE_IRQ_SET		0x98
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd89871ffaee9cb2b2db6538e1d70d..4a0bf8acd7645f8cd8c1b4cb9b6ff6f3a54d42e8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3598,9 +3598,11 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = {
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
+		},
 		.clock_rate = {
 			{ 0, 0, 400000000, 400000000, 0},
 			{ 0, 0, 400000000, 480000000, 0}
@@ -3617,12 +3619,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
@@ -3636,12 +3636,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID4 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite2" },
 		.interrupt = { "csid_lite2" },
@@ -3655,12 +3653,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID5 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite3" },
 		.interrupt = { "csid_lite3" },
@@ -3674,12 +3670,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID6 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite4" },
 		.interrupt = { "csid_lite4" },

-- 
2.34.1


