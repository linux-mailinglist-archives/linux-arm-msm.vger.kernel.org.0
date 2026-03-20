Return-Path: <linux-arm-msm+bounces-98861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLmnACupvGmk1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:55:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5976B2D4E5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C823313DE64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 01:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B913290D8;
	Fri, 20 Mar 2026 01:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVYNpLTn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ex8619tc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E6322C6D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971709; cv=none; b=YvMImoFwzd5gc1+5y+de+SDTaRJb5Jxheczcl1NY+Pw73L19Rk9ecKtMTOhyfCzpMsbHQp9f20VZftXzHnJljl+aM7wpGpnxw8jAnU+bUVZpsiL6gbC0Ou72uZnEp5OZMcxr8ML5h6MavbVlFgxmaA9t+2hf2Nd9o2okrNM3O10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971709; c=relaxed/simple;
	bh=xFJdeT3yOlq/oRgFq0BzLBs7EsRlJjjKB4aOCgE5Kn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYJ7Bqrylli6Y7P+n3oFZWQ/3eu2pzFasy64qM+vcHXEKzCcAeWbPxg8usghp27kPrDBJ8ycg66E4OaSAR6jR+ZZitNK8ADN7ZgzceGF5mJxsRFnR+OHa48uPRornsXWhxNUmPyLuPSTebGzZVv590bW3l9R2YsjK0MWR2jDT3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVYNpLTn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ex8619tc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JN9UF44155726
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=; b=XVYNpLTnYn6mMFaS
	fqYBeshBqApe+jSKplY5FKKnlVD0g3m+L1wi1P/dats9tMZOQ4f4RJufHz2DNLCe
	7piv4OIx9wluUF/SOQW/U3fgz/DEoXcUVxOYfRPLxhkGeyngxY0YtIZenA/3CwtG
	c3GKPjaRUg2JwfheHEzq3Rj1oW/YjN4Hr7GganCd4pMtv9cfSK7SJcmW5+OUEp8C
	a87U6txMevzoeiYT7HGzGE/LyS/W4nItQq3B3yPQeRrZvpvAJ5AiSv0qcPOZqZoT
	Cb7La/iSU4iF7bXgJThKNryCOP6N6cgbRLf909HPYamLsxnxFV5vgmIt6dw/WQb1
	A8XqdA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt91xuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:55:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093787e2fdso24629911cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971702; x=1774576502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=;
        b=ex8619tc/M0yW96Lb79BWQOdXU+PsktW4z1MBVdjHRBqL5XgLBCTvmb3WWp8fSEZxL
         b277MZkGsXuu/Ntlg/EODtokKtWFsNu7L9EArYucdle6ro+YatVaDAv1I9OVKXM/VmpI
         a0agfpW1vX3objOb3rVbOKn3mWTIkaPTOrlIo23DNu7CAxFkxetzIbGvOhihgXqDtxyJ
         K6EhLwx+eNNOqukstYeCKSHOcaUj5tu5ZmZzFMn6sCUmKfSI8nebyMg86a0oa08P698o
         4pdXP0ELSdpzbcnrt/Z8bSGmaKLvCI2BXLnjgRRw+6EHx5LkeSTvTK2xscdU6NTBl7dl
         BGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971702; x=1774576502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kiX3oiS3V2FER92MkVmW6VCS+AmFEidamWAh+fCmPtk=;
        b=icgUe8OP8cbrJoF/NXZD1qIrJO5h3mq/Hg/7Rg+yjiL4gfN3o0LiyNvA7fm2/+Tpv6
         ECze3iJMlKUkiRkZaXgFdI8XLrVYIwoXi6t7qCY4xwGE6gDeoW7atKR3N+5Z3DLFAadt
         jEr90ghmLREtIYnIIJAzI+ojFfM6daPYBa5CwJWPH/D2rDFPio8ad7JgsWKWVA/kplZn
         Pm+fUbPQeg2AJPHjLvGgtHYenlP8QlAftvCcYIzvN4GfRIqn5ZuRLu/uFArLPB7HvVDe
         W/G2s+8E2LllqRQ9yCdX++yuia0+zd9FmRh4pIX9GbRBPrKXJdXofFDnL67V6bHkkjGz
         wiug==
X-Forwarded-Encrypted: i=1; AJvYcCXt4+xxlX/QZmGndkPJvF0BBmQ7eML1qc40EsQQElWPxU8dZVKJGxhcPKbLMlzc710I86h/Te9mEH/7oxky@vger.kernel.org
X-Gm-Message-State: AOJu0YwNXlVnJq2UauuzMDC6EITB8zBNYNT0ZpVrOMT+/tbREy+iNYZh
	Wy0AS6R6b+5fcyAiRiXNUz5e8VVanK2ZCQldx5IIEGmMhdMSDmfxYKWVbhGDnchRw8rxUlZWxiF
	WrS7x7PQIvO24DBYgkcszIInX0UmLnBizJr7puCnLMu1DpBqXB5ldRUTodt+BDCLYjG0Z
X-Gm-Gg: ATEYQzxNx5fqT1ayCokys+Uj32ldkPETCvDjo+ANsoOgumM3vlrqqGpypi6UdFlHT0F
	3Qb8eEd8UuNW4GGa3tyH2yOdRVzfZT/reYajTayPvj0edkQixLwSlbZkadZruewi5HnzlkjOP20
	gQRzxLjwf2d+FBbMPW4QHHW6mEANuw9ThZ38kt3LUdwh+0jkqO7bahy76sxW8Vdy/XVneg1D6uo
	MgAUH1WmslnNTqaGABUQ4ucyFXsSkSKlfSpCDWhiymZFhENALJtwZSCWvH4yUo4/8/becF/mYPU
	+i62Bkqqn7UI28fNR9cgwPHhoyEQZv7VPZt/Sgs24NWWfBgq2iKbHRcoMF5KYJGi3suVQwpxln6
	5cTs7YiUyt1b4a4ewV6/mVBjmxSiT0jconcOs8GAa1HUEdWWueBfttLkn5rWqF6ABrbV6otrAL0
	+zoDezR3tK/oNr3opKmMJ1hiAokcQ5nL/gnFU=
X-Received: by 2002:a05:622a:5c95:b0:509:16a1:2033 with SMTP id d75a77b69052e-50b37426b4cmr23364001cf.26.1773971701567;
        Thu, 19 Mar 2026 18:55:01 -0700 (PDT)
X-Received: by 2002:a05:622a:5c95:b0:509:16a1:2033 with SMTP id d75a77b69052e-50b37426b4cmr23363871cf.26.1773971701109;
        Thu, 19 Mar 2026 18:55:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm232344e87.70.2026.03.19.18.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:55:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 03:54:43 +0200
Subject: [PATCH v9 03/11] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-iris-platform-data-v9-3-3939967f4752@oss.qualcomm.com>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xFJdeT3yOlq/oRgFq0BzLBs7EsRlJjjKB4aOCgE5Kn8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpvKjlNpgE/23wOC2LDjN6Gx8/lKavoOhB8zklz
 f9ig8Lu4hqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabyo5QAKCRCLPIo+Aiko
 1TbVB/9YbXJ9TJ/L8sPPEoXp/+Ws3KAe1VZ/efKMi1iDZowDdLlJHkOQ4MiAVNBBtn/l7F90QGv
 JnV5asAySAz/hOXianXZSTmG986fOZumntU1eOkLsM8Og0ayNC7fllCJ+R2A+/iK0x6xbYuImL6
 09lpu0Si7GM5+jeRzUb1XhJPWRf/c4x/BfQcCyraVF26wlFT7ly/dZpXdIjYbeI1ean+JTtPH0r
 yGKUUYTl8jWQ96wzxCewRNWIiOUvTGWtXBm5ZG1uZTssd6fLr9IItU0qhNOaRlFkveCHNUgWwUX
 x3jm9L0K4r7PL11+EO2ZbEvnxqiVsG049vI86vEOQ9vctRvR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: b9iVK9RMOLMSbx5ZjtIRTslmAjwlnkM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMyBTYWx0ZWRfX5xwbf0JHExwk
 cKQE1fcaWGArhvy4UYZcmPBeiJoWh2kAk9no2twMJGCnIk70ZLiy4jRgCtR8Zpy8lBeBvRob7ti
 HuxAPv5U55Z9RWLIIl9npdAdaHWp+Ps76WXjCW08bSJeA/cuNUlSznn38O7XcMDrXY9q3asC8P4
 WbOduGSiCgsOMOdRvIkKtx129cEhNfeyXkwBMUbOvzqid3fFJdUsnmc512mziOXON5jDnUDCaCl
 Yrj74apBD/XAOgnNdyTB3eBdJRGAam0KfUJlWAIiS2o1qguN0IRo2DyCrlt6r6G3YXfu+377qu1
 Ly1SSmaVXZHppAFe9vgPfBzlfAbTzBaLs0P/izFeJYPqshDx8B2ccD1DcC/btRchkyH1totvnTx
 QDwjBjjEpKqvOqJ6vv0vm9Lnt2wayLtHgCKSCLKq8LuRC7tlijI/rCw/+7Cxo4tsgm4V6ux6j1K
 KvnaXzeGzVLYf4S/ysQ==
X-Proofpoint-ORIG-GUID: b9iVK9RMOLMSbx5ZjtIRTslmAjwlnkM2
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69bca8f6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200013
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98861-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5976B2D4E5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
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


