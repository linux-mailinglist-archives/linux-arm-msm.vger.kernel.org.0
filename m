Return-Path: <linux-arm-msm+bounces-97629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IfZEh5wtGm2oAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 21:14:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C69A9289996
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 21:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77F2F309E519
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8543E3141;
	Fri, 13 Mar 2026 20:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXUvVs8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SU+mDJSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1227F3E3C76
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 20:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773432783; cv=none; b=hMClyU7IL7RGdAv/6y8qTdgm3DzM2lZ5pknpUnVLQopC0No9yDXeBed1uXrbBm2Oin2dicwo7FEi9F2FiEFRwJs6YnD32WYVNOK2gj2HDG1wyrrQ3q+ikyMYQZ9DKUJDjVdyw1M1bTQADz/KP882wchwbr4qNYTWjLCPLlBPtic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773432783; c=relaxed/simple;
	bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTWTWulBfI55S6FKo9WbJnlWCHP/l9y32inrJ8O4IXDLJB4cIjczeyJB5luSuqk7P952mB1Rs9KHF8dtL47vrCTZxp8Gh29pTlQG2ErcT+ttxQYIdyo9NCcNpGxKuGKz+6mPOGzb33mp7E2gHwR4RCvSFGMrz6adoBXJGfhPrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXUvVs8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SU+mDJSD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DIdpv81754316
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 20:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=; b=cXUvVs8Pi5Nu48cZ
	+rrkw3W9ADakYMdEPcBpTIQCUdSEBovEyF62nMSSseJVIMpdP8NFGOuFLXoLddbK
	UoFxETVIYXYHfBz6QUXtLfKUlmatEFIkOlpyrUqWoG35/IMrpWDwEWaNi3Rg/ky8
	ZrwqISTVTLf20k23Swh5eCKeRwXpqyNw4OdZO/zdfW9Sc1FVVlU4zn+y2bNXBGJH
	lZxLtWkL4uf2R8zEvU/QJQWFCzVa/9imfvVYbV3eEiuYRlMnRobf+1oAx5b0twLk
	e6EC0RrYcj1ZRqhpD9momroQxxZlOp3KzmJS1k4TDQDo4vYF+EaKs2fub3AIRu4r
	7cO9XA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvr24r9rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 20:13:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd39bso1828830885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773432779; x=1774037579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=SU+mDJSDIokdeJMU6l5rqz45vDGEAtPBIzD1fid9zozx0nM/IogTz/Y1JZgFqLm66w
         eN1eA5XjCFe6mfToqm5jYFMbhQjZiAJ01wwBjhCR2+NLaiS4grrKL7nXUB8zHvNnB5DB
         RoZyAQ1TBBDm4aH4grIZdlU0wse+EMeGzoJURofOPpZhkD1prW1kU3T1wSRINkVyY6Ry
         V4uolcem/sL4McmYENHW4H2GRPZladg6PPpibuPkKL/K99C7/PHlVDiSYRtd2pWUpXtn
         5oAEQdfFzHTiTDBvk1Ynidq+W1akga2FQuE4Bn42mnunNlf9PfYrmYsLI7BSxBmo4Qey
         rwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773432779; x=1774037579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=RgxHFM/mDJCLDKTM+ACXTRdmUtbOyKku+M7mbkRlcA3wOVG7YC0KSK3tPJdYcAxbO0
         INuPvXMc7JkaIufQ+Y5Qkw5ABzd6yXxC6lVsFPLY5y6PCdZBZ+sGLIGYipSMOk87V8QI
         CjeNyZ2nnlPbq6AWHQHyBlqSIbKoCEdPYxsNegy+Y+1juIufn0N0BayV4SLZ+Ec10jgO
         lGPNTnmpnNo6BtUdBWMSJ9fZL33B4GfAPsrsy7jBJm3f/O454KUS0CQP0b/91njDGLNk
         B/7BWsCrfn7OvtQr63W2QY8UOeHgg6XVoGH/YioGDUtHDxbvwLmgi6APZVe5+ZoNcvlc
         bObA==
X-Forwarded-Encrypted: i=1; AJvYcCX7m0D0kzPairZl/V+VcLPiKMMWw7ovNsjygCCjbLJgB1bO+HSneraO1Rw1uwgQOV+6ROajkE9mBP8lSJd/@vger.kernel.org
X-Gm-Message-State: AOJu0YxgA2nK5vhRdhEXt0obKtGgHONuGgIueOXue6u9vNu6KCvtOiPs
	JtYvt8zWKUrE+jKVQqkzJIoWc5p18GcCrzDX7JwKADGFPCPDyQCjQeaucaEqAGWWL2W4SYOq4AP
	etVrP9lLvmRC1YRQsYF4UOkvhTwxzRFonTQ9p3FE0cS5vPsy1W5mYD6x2wbHDYWTcMWFS
X-Gm-Gg: ATEYQzwqdKN/AOMgahTlu8ZuWi0X+UTlnokgqJIdL15hYSYczuNUlc/KTX+9KCganpN
	vLNV9CafwTA4OrZJ8sk8SRX8CHrXV3PsrNMgwXyRT8rzcJ2peR4h519gjSBZ/g4hhgNx05+p59T
	LM5kP6eY9HvjNwor7Uch5eWMLK5CJuigZlLziBWtJn7WHy6yO7otJxHYAHiABviLRta/3VfY/4B
	EQceZXWN2c2uns+5ZfJUG9ouIipWHNTFRnulg+qpUi22wztGLWUyXtxb9cpAeEKAgRaeqi9YHdQ
	iNX5u/J1uo4BKyZbGzN+fq7CJTHJdCjJVWOpwyf/zuU+GW48r49gs0grMXkHblCKpbF7WdNOyRw
	kNnW9eTPDRSqRf6DLP5SytqOuHIXdu7uV3RsQxY5692Cj016bnUKS5R1zC7WUN39EJ45V9R4yyz
	rItwMQmDfAgs3dQr10WQL2y/aiWM5/ho5P2p4=
X-Received: by 2002:a05:620a:7103:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8cdb5a5028dmr630445585a.5.1773432779253;
        Fri, 13 Mar 2026 13:12:59 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8cdb5a5028dmr630441685a.5.1773432778800;
        Fri, 13 Mar 2026 13:12:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c15sm1681259e87.17.2026.03.13.13.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:12:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 22:12:51 +0200
Subject: [PATCH v6 3/8] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v6-3-1763bb837fd2@oss.qualcomm.com>
References: <20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptG/DCajnQI7inkEYzTz0A1Cza7RH16qlOQCnj
 izQlPxthUmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabRvwwAKCRCLPIo+Aiko
 1Uz8B/44cvapd16kVvz7qCZ020lYd0MpuJ+wQQ4OOGnil0q2leMH5oRGp7sluW+rtASK/L+GbH1
 UdaWtTGzT+9AnZ/V0t7WCV6hmT5sa7eKK1wHOSGUk6gY4dmPn0olY69NMhY1RjddFKRTpStzyJj
 0iVx2KlBGLdr9qmAfkU33AKyX+CZ4Mn4/kUH1E0DbDKwiXRdwpHWUvxr9kwUeH3j6glPznQQAf7
 3mP/NZnT0Z8H3TG3OhvZeAG0TbgjoiH2d5koem4XJZ1ioKRmsZR3deJfon/myQzvnNMuJaIXRUw
 cYZdm7WrZgXKb/pMR7tvnTXmqyDCqRzT/CFAkH+f8OoJ1UQR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE2MSBTYWx0ZWRfX+WmIXlj+ecPj
 9nDgGUnh9NZVUvCDJe1PpBzZp/7hNUXuYCcMhHm7d523q2N+3hpyxQDSEuwrKQPFJyz4nrN8new
 Aq7ZlhxhcVfa1t5B+23p3nC/neFD8zGsp92uQJW8uHXFIOUsa3AtdJVr/QquLBflsHu+f5VEqvy
 g2MZ1QpN/Ldntw/522vskrl0+34vdJaIEeeRl46ckJCL/nCdM6kYEQX5QKm0l+BvKrM1C1nd4W3
 Pjqo7tAsU/Nn6Q2B5/o+XO23G3d1qdcDj9NWJ1mxnAE+drt4xJ6wnku6z0pi5WA6RBIPsEcrScy
 JKCzNHqMvrr+i3ZrM5mbYypUhc5WTLJfPk70u94rWTofjEvGDWOa9TBFB+ruHnF72XIv+PxTuuI
 iMKYb3u99/xr9nPGAjGWh28xhu8Nh/WHH/4jrEoINyrZez2MGIRvonjOc2L6IF/kfvwa5k31Lew
 PHbfNTwXmBdf0/fSjmQ==
X-Proofpoint-ORIG-GUID: PffPrY2QQvdq2EbizqScHT_OK8jyl-gk
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69b46fcc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PffPrY2QQvdq2EbizqScHT_OK8jyl-gk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130161
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97629-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C69A9289996
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


