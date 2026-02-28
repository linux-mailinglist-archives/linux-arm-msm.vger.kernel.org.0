Return-Path: <linux-arm-msm+bounces-94621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJHVMbYJo2nY9AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 16:28:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F61C3EE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 16:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFD8830B9949
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA6547CC65;
	Sat, 28 Feb 2026 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDo742fm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUFSq6Rp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AC947CC83
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772292403; cv=none; b=rdCKqpyO+/LMTrL7knkjmIb3PhNO8322aQs3DXQx+JLJJDoY58bFcPaIpiG3soK/LY0zPpR+7NYSvefV2+O8n7Pummrl4X8Oi5dGURD41MVMHc3fYaWxtCnJcSC88pZD64Vl9WDaGVNAonlFtgBeiHbaOSaeO2p343KP1jCLJAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772292403; c=relaxed/simple;
	bh=1Kf6KXU4l/H3LFKNax4FrB33AhXXcXlylE0Nbe0Lz8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s6L88OiuLlE8r7D2XqHKyCaVSIeC9WlXW/Q2R03NtVg5pyRvtDwu28gmx7BkJzE7l9xrcYZsGvzvSj87oXfKz7TaCnntE7aQiaFVM93g13n5iExlaJHvm/DQZuLNNaZMFUY9Dc9g9Uujio7nqQJ7co/wO0QKh6/HqFm8MNbqNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDo742fm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUFSq6Rp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SEPQF71896750
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=; b=EDo742fm1U4pjaFt
	14ATFu8PIkQth83hpJRJnNoJp/iGgkzoc05C3mq2CwYPczZv7wyX7K66ZbroCFc9
	AHTxsaAt8o1wBxTAyJR1mauvJC23cqIpXOgSqn4rp4SOmK9XOQo4/kEnZ8TJS95Q
	XffAAKGSLV6hceS71Z1EVPPrj/EjT1coMgQkgsIBMywIK11/l8A/+oZI2XaovRS1
	ADO8Eb4uWzL+kMj/KHdHG4afiDkgPqOsheHBJAgrUUZI4667+gjD3+YHHYw3fLCs
	9o8dJsmeP22e2sXqZb/YASMiMA2Ryw0IyafHsDPrujoIJ1juHIkz6cXDjb8BXmhg
	lh8XQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn4158q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ca3ef536ddso3092338985a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772292400; x=1772897200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=;
        b=NUFSq6RpnC1tDsvmENtw1v8+IGkhcPwLns7a8QF6dydND9ZwajK78cszowOaNscxoI
         1XHZGGfdKeXTfh5IfoSNtLYdoI5iYbcApCMESzLMPvT6fzAqwAE/czUPDGctcW9d6EnV
         uJ0J/rBCfrpRsTSDJqxA6Rr1OBceRf9fshf/sizws3rOXYDfn0LUTEtVU3tM8uYgrFd5
         ys1MTsdYjl0ZmOUIMpmsBiWDLQ275cgS8VWzRJtW5OyV8jcn1Y5ZhvROAbQTqTeF6X0R
         bVx20qpT2Px0LXNEm4cQrpV8NlOb1J+moAuN+bJC5TgQdJh6j7SAYt7+bLp4wpOBZgZe
         lCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292400; x=1772897200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=;
        b=X3hcen4kqkTlZgqBt5Sc9kFyXgy6Wew2WUPGMoiBwdFuRZv30mXa7TPmhDaEGmha9O
         7Ok0zl0f5G89OLQG5vAYWG0GUtkX6SLBzoriO4yCPiAhWZfDsE7HoQXOBoGpYYB6li4z
         cGZI000wY5MCuCLNgEcPZ7xa6NNHKPZi1Tgc3sJgx2ECOuBU5N9jWxDgYf54qQbU6wEg
         h53OBCthSvqCiyPXfmp4Dv1pgsWYMVmlaVSFs0ORznmsY7P4EJtXq9sZnUBAWICinaU+
         SXdXlHNPBcs5jSJ5G66v/gkMGEkmBuKkZ3HREq3fhpWQD4u6md3KzJ32oSb1Gi6LY4/T
         nsKg==
X-Forwarded-Encrypted: i=1; AJvYcCXPpR4cEwP2fAmVffepvYf2E9TFjLkWAwnU/NtQNzBUg5XISjEUk6mHBIoxAQE7rKYKuOVGi2e7qvomw5+F@vger.kernel.org
X-Gm-Message-State: AOJu0YxOn4tFl6kRXqYXSF9MzMIgwpTFt+0rWqlD02Y0SQjXXjhuD5Ve
	8Pa/o7gc2kDEqfeLti5b35xUw2N43+OI3tFwsv2mQqm8qnRg0jpM7vto0/7gAMxbuxeC5V6rchs
	ASKkYfA+9ehVBfs+ZwieUWKxMzxVyNueSjJtnxds2KKTCSWiAvoZ0vxSfmx4/UuzFTTjZ4rhv/W
	4s
X-Gm-Gg: ATEYQzwOtJbCL9VVp0B+8P8CDc+f05PhDoCq6DK9UIH6TJix4wrhoqwMMm7U1K6GLUt
	xAqi+oLIX14i4Vz5Ldox0iU+qhixBdllcEE+b1N+5gTL10yJ5HQObXQz3sYDuq+mEOzK+GS98YU
	RigK0ITYJJlZPXAFA4y0dR0x43Aj461oCldB3L6JqmU3zFVBThOPircLa1vQOyO6WKcOsaLDth8
	gCKoGSvMvrSTHzKt+1fkBtJaN5/57czljR66rHeajExQh0jvJEp3a/oAwfPADL3g0EcSVqlB/hb
	9y64/0AltumVyT13F8RPzr5gS/DsJl+XYqsHOFmub1MbZcLVIOHtnpX9XhHAMqhmhNjT6r/+NQp
	+gvicxsIDBY1gAXWU6YdVECcHhH+nNfdooSfc5fEa1yvAWZs6d2sILr+pK8WcIbvV+EaG5/TwOc
	V9Jj4+73K51H8DlvgGwj2n+K0jrRfRsHcvFMA=
X-Received: by 2002:a05:620a:1a23:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cbc8e4f79dmr792112185a.78.1772292400145;
        Sat, 28 Feb 2026 07:26:40 -0800 (PST)
X-Received: by 2002:a05:620a:1a23:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cbc8e4f79dmr792108885a.78.1772292399646;
        Sat, 28 Feb 2026 07:26:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115b57922sm625558e87.63.2026.02.28.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:26:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:26:33 +0200
Subject: [PATCH v2 06/11] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v2-6-acf036a3c84c@oss.qualcomm.com>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1Kf6KXU4l/H3LFKNax4FrB33AhXXcXlylE0Nbe0Lz8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpowkn9Rkxhu8q1tIOJNFLc6Hb0OW4uCpE/0ULV
 4cb/6Ga1ZOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMJJwAKCRCLPIo+Aiko
 1UkdB/91mSSpM5aORi+V4Fq5qbye4ha6nI5ILJpzuTF5H+jJdEx5P9ehg4pRPewJENn0DlSPOEX
 fI1tEIw+I/Yj9AtG+ax1ZLMT75i/MgicNQDHFMxiJRPbAWcOPZOIJDQh0neTv0XRqVLO6s+YhlD
 oFTOD3g32oDRBY6VNg08hRAmbA8mhejkstrttHG2I/pbcHkhLu5c2Zhwpy2QPDlLFmw9R2usRfG
 AKKX2yEjKi435+on2cIQYNe96Wbzh5pyesI6jYPP5L/Z0YldY1xoqvccONRzu7VAjJcsK80WiXG
 BRbPbaLjNE3sszuC9knCQklzBTVQTDPp8QcGp/INTDkj1pba
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a30931 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=M7otsm39oOdpNaC3G74A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Pxl_g_kj7gcYUixyaO86L1m_GmOu0zxS
X-Proofpoint-GUID: Pxl_g_kj7gcYUixyaO86L1m_GmOu0zxS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE0MiBTYWx0ZWRfXyGVlJbdmzq21
 ZHADUn7QEydlnN2ARa4/ZSZwuJB+250gXJWJ4Jjpp18KpThgwyMH+fLLDySi0TjDj+swwnYhlUY
 quYbDinTrzl/T8CoOsw9LkWBgqPO8wvnR5zq0s2faX028AZT1trgd+EJmOMBe3orud7BwJgS1Bg
 v6g/vxuQF4uKWkRRZvlB64LjL22qjHK4T9A4nJwd5l7VF9Z6B8S6H4Ds9wyXVf4tEmjDeqrwcEH
 MPEaizqMrLI5FDyLfYVoi6infWLNWRNbGWNwQdCj9IcIor2AaW63sdNMyP2nXiD6ByEQys8J6nh
 MZvMlVxRrLPh6NZ7sNiNL22Lc6axhb3QDu5e5T0pKZ3QAbmWnOHHZ93EDHd2X986+TrZeQ7n2OQ
 0GK9UWyb6em4qs8sler8hqprud9Q595mlyRb5OXHh5mjOpzGt9HUcjplfdhXhOLPc2BbpksYhcP
 FX1CNIcOdThgF9jWzUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94621-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 505F61C3EE7
X-Rspamd-Action: no action

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index fd8a055c4acc..93ce7ac3a19c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1295,7 +1295,7 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 	}
 }
 
-static int iris_set_num_comv(struct iris_inst *inst)
+static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps;
 	struct iris_core *core = inst->core;
@@ -1310,12 +1310,12 @@ static int iris_set_num_comv(struct iris_inst *inst)
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
@@ -1347,7 +1347,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 
 	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	if (buffer->type == BUF_COMV) {
-		ret = iris_set_num_comv(inst);
+		ret = iris_hfi_gen2_set_num_comv(inst);
 		if (ret)
 			return ret;
 	}

-- 
2.47.3


