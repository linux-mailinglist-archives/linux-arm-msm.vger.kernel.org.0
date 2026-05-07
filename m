Return-Path: <linux-arm-msm+bounces-106270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHkGDYc0/Gk2MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:43:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C03214E39AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E24FC300DEDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8927335B631;
	Thu,  7 May 2026 06:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgRj7Rgx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqJMI+UW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C00534405C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136158; cv=none; b=c2M5kzIsSOU+w8Re2zlUBYflgKlITOf+DXLyPDQvIKF3/RNFYgknDPbxAXdHVPwYa+K8grykGLPfR5mOEB0Fw6R6BB5BQLZWaUcnC/dMH6nYt0BKMe1UpoEFryApVqK2QO8KtcyQRdz8tgjGn3UiedxQ5UCjS0Un8emDQ35QHto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136158; c=relaxed/simple;
	bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXXWsTpdDUeBpRzFR2auZ9MgONaxOIziHikrLkhO4nL7KTNo9JO8qP37PTWYRc5O8AHG4bTzRxcBz/jKwKcisjFZ/g6AM9ZDUcf/1e6Dn0vVM9ZgVccCuxKCjm4KtOMwYH31y+LvlRf4WivdHVuBH5kp/2a8WJbVrhZ5C0L1wjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgRj7Rgx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqJMI+UW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475Le291068278
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=; b=lgRj7RgxdAzUfk1J
	+BW9Ld/7zInlOOQd0xaxWnB8qfDaSNZWnhI+84B8hJ8O99kTXABUBZOZytNBw0cr
	Ay83KV060XZ6y0KY3wi6EiFmZnn4KmoSpUWASeVUv8aoa3mYhrDfrnFUjpJjY809
	XIT4I5GJhKKow/huC6WWmf5QOMoK4Oni9Tzu/eRgOhjBYhxulfa4TULdfjMDZimG
	Ymt5+IxnMk6LaibVjlK3C50PGBOJoX1nbMkjngCSJHy2vyTYz5Ehf0knr8lMSz5A
	kBqEMJ6VpjbbZJfW8VM9PCIbOGwn4TNPGA/O4BfRP1B+4qKm907fdGeIBTuq8zeU
	/hue0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mh18903-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5147078691fso11436431cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136152; x=1778740952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=CqJMI+UWerh+WbgzXHdDjFMDL1NODL/njX5c8EwOYAgzSbt9MdzUBwX5ICGXOfmBCQ
         NyfOWYfALjX2XKSpuwX68cv6FHJSpE1SFCY3GD8w1jN5QDH3Xry2+ubKuFvNra7RO9Dh
         5n/sJeW0tvezg9wTzgsq/m2RFl0420RGifFvsae9do379cwCWQzLjXWGUqN5XlwwEr3C
         K6DKxFk3nK6nl0M3Nb5orzG2VXmVWdkSbBh9o1Teh7+dE1iYJNa8/b8YR1arkTk/KQtp
         jEmJVu6FBKlrjoeio21HfOqfdh6BfxDWAVS12C4LSeRJYv7UdOSjjkXzeLnIz8gIToPz
         +gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136152; x=1778740952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=CYTzB9n6bCHpNL/XbOswJSz43ru4J6AcK82vEjwTn8an4dsEWReZfglosRXnV9Laj/
         yxsXTkAPbg6YnbiTJz7ErWdhIlaxTxAAmqqqWT+r8SrJB/cIv06a6VyZhSRzJ20fgj/D
         8ENzNpYBHZIZLrU+eQKLmOWO9KCeYjooOImoI4fVBrZ2EXRglacWoUCbdIr2fcGZwQXi
         jwTqGNNEybYU/CWIEaimT8jt712bKgOvg/NbMWOq2C8ZeC2oep0GeHKp/0+cepm1tyDp
         o/5KD93ZE+C+3/Qg4N2ykt02NMLfT9vmxgpNojAziMFAO644ov9dO1xjdfXXxztN/SIU
         sdtA==
X-Forwarded-Encrypted: i=1; AFNElJ+Amjg9JvZqtUpWlD9hFaOML8ED6teo9Lyc2aUexnZXuBB9EXOtBEZvjBkbVyUNkn8IVKRDdah7FdN9Ef9B@vger.kernel.org
X-Gm-Message-State: AOJu0YyB1Rcc5JaR3nOxSLbKlox6UCGJFoI1ZIsycnQNt+gdJfuy7ZA3
	yDiU/yTYeoMXpYGCJlkMScaU9AR43oK+glCNhe8+GdhBvPfId8uxEVbdZvq408dUOFdGFLrq2G+
	3mAXJAsubRSeQ9pT8xcnVa7C2HzAwUN5geifsQ93GvgNOq+JGybfhXxYdES8O9Tf2Nm/BhMAUih
	dl
X-Gm-Gg: AeBDievogNlKLWh2pt9mTluernkNrF4hDBDUpEExjRq0dArmKtE+Diq0YibbCQ+GXhd
	MSRB3NPkpVIRhEBR5LCVm6CsE7nmRQHNycjMFg7BKQ+Wrgv0Vmzlv875V8F7z7lFECBAu6UoD6s
	lG8IOz1wzTMCA5kafH+uSz9CbhuQGwjizbN++eZBo1i0n5AhCGaQaAJP6DCf3pf3VRDB6Imw5z2
	73GhvXJiVzLGJjthZHBs4o4dOk9XdUlI08QB5m2Wx5Avaj8xMISlPoYE1mSkYXpc/jjpHo2qOrv
	W45lcOaUMuj7l371aPR2CxJWtCHQUmKNrzweJj8rKfxgg5gmzgyTjJ9OXKD6qou1+hcsXKW2M6f
	fO8AYwuBvHy++EX4PN4doMYcXGEbDIc1CfEBdkvDJkunShxfKOGCAd5y+UU7eYKqrLEQIEchKlu
	RtwqzfBk3nG/XWULQ/weX7pGeGwokYywSW3hwi83wF42PMqQ==
X-Received: by 2002:a05:622a:1181:b0:4f0:131f:66fe with SMTP id d75a77b69052e-514621f49f3mr91799931cf.59.1778136152201;
        Wed, 06 May 2026 23:42:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1181:b0:4f0:131f:66fe with SMTP id d75a77b69052e-514621f49f3mr91799581cf.59.1778136151720;
        Wed, 06 May 2026 23:42:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:10 +0300
Subject: [PATCH 10/16] media: iris: add minimal GET_PROPERTY implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-10-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ+z5sEOUgtHL80c7YAFQiJ9xqfQZ1SbISqN
 eXFDrYwvbmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PgAKCRCLPIo+Aiko
 1YzSCACWCW6ngGwZlGy5EaXz9WiYjjQ91VKR/i6bdllpMVWYm4Hddfk06NvoDVdlQ+x15Czwthz
 XTF43orRNU00n4dwg+Jbk5vAIXQ3QyRPkNRWowch3cvqL5UryKHECzSC0qP7CQkzrBo5mqJjfFS
 5tiJEF/WUMixONxSWXvkYdgg36/hiIy1+TxglV6aXZjdeYCeJnJJj3OqyCwYZs21JV0oBVS+4QE
 HNDw/BO2ZLjs9bD6/RKw7+M2PmxsWDz/lb1kQpRAHr4kW5HvpH8uSwYnihDuLwpNUSYqiStBQZM
 YAFW4TR1zGO4MxUP9q+jSFKHd5jxXBFpKtdKuztzjyec43Db
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Dknw4B_0f52tgKy4_FPCGS87-HCUZ_4r
X-Proofpoint-ORIG-GUID: Dknw4B_0f52tgKy4_FPCGS87-HCUZ_4r
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=69fc345a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=4y4YWC2vBVg0P_IM3hEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX8HyrrYkyFa9F
 33TSxNO4pZ0mxD8fPdCysLFq3Bme2xx+TxiSvshetlJjGXGml5t4QyBkz50t+eXpODqiZlO7xym
 6wPhYDCED1f/djpZcacUwWFZL2KCJSwUSxDW1co+fT+nkJMAUMV01rIVgeiw3RNU6XFnhnZg+m5
 Gmj4uLJSIsclHdYj6VoAc9fuHO5WhJdpKKoZgK7/weiCFJ42QnUZtp8nIjVdeIa2bS1JFIG56xi
 9ytlsJ0GpDaNVBH1nRuc27b5NChzNdXLGFm5OxI8/OPNzXb/gS43gbnynG67JneldrsCZRw0q7i
 5HWEkL2MmDRb2Im4IQGMvySv9BO5ElmveJGP1Th9KUZYrjzA4GP9SglwJTREZlxqSg5FYHKitV7
 XQOgdQYF774lhML7XOZaWvWZ7Gwaec7C/dtOMY6w64EfO3lOs3gr+vMvw22gBvD+HiJplNFzBRx
 VqWNiOAZ8VAo3g3PjZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070063
X-Rspamd-Queue-Id: C03214E39AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106270-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pkt.data:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwie it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 83373862655f..4e17fa3c602f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1063,10 +1063,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9..1b770e830c58 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -186,6 +188,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -525,6 +533,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


