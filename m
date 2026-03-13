Return-Path: <linux-arm-msm+bounces-97341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGoGI7rCs2mEagAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:54:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567527F09D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88FA430F841F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0542636D9F7;
	Fri, 13 Mar 2026 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LheGfune";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/U8nyAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997C935F61F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388368; cv=none; b=bWFCVJD+CfVPlI6KXLSnMpeGwTFWYMRP63x0kxLgXpD6XqO7GWIoK7gft7DyrKGrqUvSE6K36ZBPJjWBbK3O7H5T79JG8BV0QYBC2vlhsC44r8/aWt1UsqpsBdQWh/9HKFq2Tji7TmbEX/tJRFF6Y57ypxvoVOtjFN6+gf+iEy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388368; c=relaxed/simple;
	bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BEchvwKFqucGkZe59s0IeBtk8Tyc5sdqFpvJPgN2ZfAdxx41+Ah+z86XdqlV6wtgFMM4VDZJNNAxmUCtz+IihF/qgO+6pwTkIg4YpwrpEntyj9V2LA1R8MDJdNWtuzGURQO+4pUxDv6UErhohZ3NUrr8vf93YDOG0R5oIpfvjXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LheGfune; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/U8nyAg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oXBP793612
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=; b=LheGfuneNpt5kWjj
	vfN/e+RPCfiR7dmOZDZZnF0zwx2T3JDQbNEYU7kXucUNisdrFcd4U42ik38gt5DS
	DRHKBuWYz8ye2B9p+EFNCtP+ScZMr34EYiXZZQIVUTzJD8R7t8Ivpb2Z80iM6Zav
	6qoqzFtLx9PoT113kURTIzOVMY0n9VM13+Q+gPhjdKTgrY9c/jXogLZE79XAOzWs
	2pAoVL9+IDJNk/3PsOg3jqxaoWo3K3f1butIegg7NcKam0MquBubC+qO1vFzGkEB
	9OIH6a9HSYGA3bLKIM2p54q4MPi2zEXsQO1gF/PzXunEmK258NU39vQmbIAsMcF/
	GEOl6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt07ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:52:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50923a9bec8so32494241cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773388363; x=1773993163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=S/U8nyAgCw4rhw4wMeTnPaEasoLPP8bm62mAYDGVrBhZHvGmwpsspMHsMej7eXlZJ4
         iN4FdHu7PLWtltQHbqEc0j6R4CTr83l9dGHOBgVFTCg9LkNzE/SHE29uVuK3W+3Ce4U2
         VORdHam/hMdR4zCL0/++KehqySxVBohQaTw23rZNKDup/IPKLvmNFIjfUStP3uwCV0x5
         EhptvelQtcpotaRvcuU8jqwoKVIJyefCAu6dkkhaAHeWLQ6ywSjwx1CI+NfQH46HTQTw
         7k/F8ej8CgA4W19ZnknyrbwxbJZ329OIyC3drYkZIzEOXAhmPa5sPLwMKnCTxEIIJP6K
         /hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388363; x=1773993163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=idRgQx7UaXvPpMn1PlgW3w8SZCAEEDC8HGrYd0HfRgJLH9yClVQOB0E5aY/Oe4btw/
         4/c9yhaiRE8LKpOaGxjeUZdHp4vPH4q30m3VjaebU6YDShtqbsAsE4LFm6+a+VKSB0l+
         QHZ9vxpRfZYt7pqXBbLfIlUvoMDfkOGl5XnTe+zl+sz8lOERVc9BkuJl8ZTr+QtWNBwa
         SJsaFIyiwzpFL/QJe4PrvesJHrm7ICI/k1gvPAVcEO2TfebCelUDObPQJBW8betCSFHW
         HH5Shd9DKzwWRgN7IzoIUUjKTmSVC6lIGwdAgi4GtbOiWZCOQHSMIqDVpRanKsWBGq+D
         Kxtw==
X-Forwarded-Encrypted: i=1; AJvYcCU5YwHWrKXytwp7/HWzhmIKGUY+HKqer57LKWz6zKgfEZPf7uVKrS6LBHCtbBjehrxCPfDYxkdyjP2Ur7Oo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw46Omxaw1Ljje6e94JHIoXs/ZV2msoY2h3pRpln0xwIhj2gsaR
	mO9bHjoa2K86HMLFmSxlpfFhds0T6q5SRmTNTJ/ouDPp4iZ1+BVDRrCUS6dpDMr1dzeXCF4MUIB
	kD7OPH7etMscNDqv7yiOaRrerku01s+piKetwJJNJMuzYVaDPMPIJnxirlYI9EJIecBOi
X-Gm-Gg: ATEYQzyLFoMhw9k7g9FmgDgAvKTMAxR9d/vnU4wm2ZhiDtKueHGbxBBEaHB2vx/wf3I
	+a4dfVIa5DWjXQj+Jxs4eYm/dGQ6mGSrP4gO1CpVD0hiernc4Tw6x5/GVg6+06Hzh+phPL5RoAp
	eIO4CTRmDtZa/TZmMbsFcncnkuCsC5jqklM5zw7fgpoOG8cIrzTp3xdT8t8pwpDiOmU/3IWam2k
	gS686lvOZEhe0RR+qqLVj+sWZomB8AB3Fe27zreBhBvp29VrF4y1Nig8FyHFrw/UDUi5ZgVqkTr
	BiRx2hjhxp/CKMo9YOzlHTcVuXP5wRAXMLLWoF/JNAlmdQ7IXc7I4qXm+GUXwhfNRDSXn40y1a6
	G4LV5n/c+WfTFamF/9ZTK5WksRGb/DRAuvGKtYlkH6BQR4hriVUSmkwmIdZqEBzup2t50B2T5Lh
	AVjC1X3XxQNeEsW3HqIan95gdXO3geex1nFpo=
X-Received: by 2002:ac8:5703:0:b0:509:398e:4393 with SMTP id d75a77b69052e-50957d1376fmr29436131cf.22.1773388362896;
        Fri, 13 Mar 2026 00:52:42 -0700 (PDT)
X-Received: by 2002:ac8:5703:0:b0:509:398e:4393 with SMTP id d75a77b69052e-50957d1376fmr29435901cf.22.1773388362444;
        Fri, 13 Mar 2026 00:52:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1563775a2sm1347475e87.89.2026.03.13.00.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:52:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 09:52:35 +0200
Subject: [PATCH v5 3/8] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v5-3-180484af4490@oss.qualcomm.com>
References: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2169;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps8JCTUTQVUt9sqxypfZUXByC1poheoeGY/E83
 moXIj0He6mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabPCQgAKCRCLPIo+Aiko
 1d9HCACK5uNKz0Q4QzzQGWiFU0cOYZiQ6lZg0TcUq80jXRo/h5z8qkT8AYWQ/bPONdk6+zjFdlG
 Ln42rMh01q2ur0hk9JJsfhs3tyOoIIspgecVon7bQVuiiXBAd3KmD2OoNnYNRkkjN8sNHOLplLi
 B72kvOMGfqdOKQf554av4RwKwihnCln25LmJYY/28MPXm0GPUoQp3VsVhAFOCWsZLNpr6qqErQB
 Y4HOU1YrWJ+2SZByczwItRa+KJ9HoPQl2G2Nn2pK6jP7VeJQk9e6oQy38CPHZ7Z7etov55Q6362
 7g3jJYJGjyh2BY1m1R2ZC9bXSPEPxB6Y1hgRZZ5+X5wsxVgM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3c24b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2Odhstf1cG3Y429Ehvw1IIGghrDImd10
X-Proofpoint-ORIG-GUID: 2Odhstf1cG3Y429Ehvw1IIGghrDImd10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MSBTYWx0ZWRfXzCH/cMVomYqU
 eRitMk8G29+HLubkN2pKfoCQhIa7RjV6xlOpiGHX04f5Rq6MBU9La6bNYPz4J4kxUG0kgwRZnxu
 +K/XAw48PHrI2zRTmTHeT8IHYCNPt0R6PubIFnb5wkvUdq7lkfS5+41Csumy2gWVpeB1c2YatNP
 vX/fP+uU6dBLD+oBZLZ8ahgdecem65B3E5zxwcHo9AuAidsxGhNHC12kKoxhEA+R7nv4OhqDBzU
 8lrIDvE9pqaxG83Qva4B+/mf2kak5bZGcQ5Lv6rHlSV/R9Lu6iaL9Z0Q5cQqzCS796OIArz7DAR
 LZJDEdo3X0LOAq+sgMKnRWMyS0VeVwYmqL4wKq4UKpkleCqcfQYHui6IoS5HzJbzlnACw5uIczD
 7u9JxAayTwbb6MRo27f95axf+Q4SGWi/7wuh6AieuaqmT4i5skSbxXcia7JCBYQIaTemoFqG8M5
 oV1lkAQCw/wGVbUAD3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97341-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0567527F09D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..e4f25b7f5d04 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1205,7 +1205,7 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 	}
 }
 
-static int iris_set_num_comv(struct iris_inst *inst)
+static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps;
 	struct iris_core *core = inst->core;
@@ -1220,12 +1220,12 @@ static int iris_set_num_comv(struct iris_inst *inst)
 	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
 				NUM_COMV_AV1 : caps->num_comv;
 
-	return core->hfi_ops->session_set_property(inst,
-						   HFI_PROP_COMV_BUFFER_COUNT,
-						   HFI_HOST_FLAGS_NONE,
-						   HFI_PORT_BITSTREAM,
-						   HFI_PAYLOAD_U32,
-						   &num_comv, sizeof(u32));
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_COMV_BUFFER_COUNT,
+						  HFI_HOST_FLAGS_NONE,
+						  HFI_PORT_BITSTREAM,
+						  HFI_PAYLOAD_U32,
+						  &num_comv, sizeof(u32));
 }
 
 static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
@@ -1257,7 +1257,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 
 	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	if (buffer->type == BUF_COMV) {
-		ret = iris_set_num_comv(inst);
+		ret = iris_hfi_gen2_set_num_comv(inst);
 		if (ret)
 			return ret;
 	}

-- 
2.47.3


