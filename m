Return-Path: <linux-arm-msm+bounces-98630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ddeMLO6Qu2mYlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:00:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BB02C66FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 633DF30066B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB3E39B95B;
	Thu, 19 Mar 2026 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGLwEzOA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XG/BFkRI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4812539A7E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900004; cv=none; b=HoO2jg1TSu7uI5/UPZM9Jp1OOh6oFVhBklgw19K3gysFZVt5UL8A85fL8waCwJeZXv3NlI8QQmQOQHFVOjZWT+9hM7mT//AAxZloPJEfQt0Oy0ym0tEloevdalR8rvQh/2BU4hI+JBjecwnmOWxW9HANRBMS3xGu19waCZ6/o6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900004; c=relaxed/simple;
	bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SjPIIC/zFZfzZM0UxMKR40OpykUKNyBFP/aUZdz8JlR+E2kQuj7bc62wLpfa8Hk7KaXHlCeDyfvNPPhAGf5i4zLDYhE30OBEyrHWyisytdTsl7LKItRQwDwCiCuRgbd6pK0D0Wmoin3XC1X6igiEcDnnOLh7SqkwTs8bPkVFV+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGLwEzOA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XG/BFkRI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Y2Mk2470670
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=; b=SGLwEzOAohQR8PGA
	p1znTz/iUDnVY9Y4ctKuTjN6VD6GkhnRAwy6TXf54BefKHgBwdYTcOdCkPQNpcD+
	ygBQSHSP5bGwk/ppI6Rs6sD5HXBR3unzs9iAF2AmQX+XZ7YbqA19jsFZGd5Oh+yn
	sJig9Ie02t5pHwgRErcerkoEU1OjAPkLvCOiSwVnvkwyanbnfjyZJealzMMODPxf
	OMeftyT1M0rGEs0O5LpUiRPHW4SNQLiVLa9WgkrmX29nrJeizotVzND21ZogPkRN
	E9MpsNacp0KFiNNJH6tGUusnk49sqC0IpK/MZC2ukbfz0wpljSFW7bnb5E+TGyfV
	2r3Ymw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj53hne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:00:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so16347371cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773899999; x=1774504799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=XG/BFkRIaDlvdjS6tu/Al0oU1PLFgdqtwBdBw8RXLS5qG+87Hk0uagULeSxJ0HJi9H
         u0J/t8KUNsuVPhJvpcZPyefGCcnHsy5UXzY+EYjxR/0AeLaMTVNTbNBzS/jZ8nOojvE1
         HpNcX3Yv+H55WC7fOVDfzGeOWtw/+qs5t8Q+/XQSZsrzt+diAR4WV46fXFFHymuCL/If
         Ad7ctjQsriLkxcemmqi79cA6FciUrxHWeL9FobT1F1B7fUyOpGWE5RRaswtmB8fkc6oX
         jXnorPGwr/hUxDtSLNcHiVJkg7jxigYTTugsRxf1RVy2GEl1A08FUSB29nmlE1V+02Tz
         PsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773899999; x=1774504799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=kPwyDsXhn7fdrB/r4yCOGHg2BzwQgVJCZqUFO8FK1bbJkppVTtZOw8sjK4bJnHWrWB
         3SKogv3c0NYvJXb2r29GVyksaHAEwITEAMACm8MHWn+IWAWAuyCKnwIy2+Wq8WsUipvk
         ju6j87G6Q9QuXunVBLr7Z6z+il31y4EABmJMbZ1DLwQA44QoRVAaoo9uznt2xhsLhmFL
         aNw9q0W/Gx312V0Ij1pWQ+L4qeMCJSlfBZkQc679JxkqgqEUq8gjD5T2VWKeGrS3SHsN
         UDNDzCEFVLw1pfqHegweb5QYNpQQj3uqk2PgaAlHGwbV6SDP9NU7TfJ0XcDWLOhXK1Yo
         FCig==
X-Forwarded-Encrypted: i=1; AJvYcCU+OfszRkE+upRiuu7xhgH/wMpDQUQiD59DzLlrIYoXe+TSGLVSsngB+NcNDd6Qv3Otrc9XoXTrWsxRYAxa@vger.kernel.org
X-Gm-Message-State: AOJu0YwpGYH4hKJUe3gb5fkKVdAdY9jKvaJfck/B6kquzl3mQ7r2lt29
	7kOhH2mJrKg9fApKCaeVVc7AJFvFKvEkaUVi0beXT3/AzlXii20bewy5g5W/1MTcrVBHYjjbh7k
	qsUKDTl3ID4+mkuPZqBfvvPsIDzlJtzZtFMk/FSYLYoMSbVQ5pVm6V3YhkZs8sdanGiYN
X-Gm-Gg: ATEYQzwrJn1NAQp8LlA9PbCKIzhkpPD3R0dl+CHamAqZaicUZ8B5Awpc/tEqMM/Tg2s
	4Nf/P5GDbuz3AUF0TEsGZ0mlN0Vj0VynqUubfAfP3Rbnz67Svv/7+EhdNtm3wngZp5uVVYI6yKg
	ClbJwaIeZdXpO6BOR4WWKGF4aNAtU941P8gUOyIVsU+BAo/qQyBb4SV7rBOUtv4EnGblI3WBDP3
	Q+1WmLIILjWILpnjxyJ3zPhuMVGrRF59VFu0OzMN4544oYIojmdk5gL1U2CjL61nAseFABfKZOn
	p2tWwWG0JLgq3HHvUhmC0jKNfIJ39z3lFaa43j0mrNvmnWbgGgjwRExyE6qQcyIGLAsXd/RXiIN
	ytApSg/ez6dQhVyyZMkUsPR+2+xOx+fJHCEPaTiuR9JZ90sBxUHu1XiyjP9yEqBTMPFOFNSj426
	HsBh9F3n4wKb4Avjsx23gqiNoJbydgx05QHgA=
X-Received: by 2002:ac8:5d02:0:b0:509:15aa:cf06 with SMTP id d75a77b69052e-50b1474418bmr78773791cf.2.1773899999585;
        Wed, 18 Mar 2026 22:59:59 -0700 (PDT)
X-Received: by 2002:ac8:5d02:0:b0:509:15aa:cf06 with SMTP id d75a77b69052e-50b1474418bmr78773591cf.2.1773899999216;
        Wed, 18 Mar 2026 22:59:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.22.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:59:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:59:47 +0200
Subject: [PATCH v8 03/11] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-iris-platform-data-v8-3-55a9566ebf60@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu5DVd2XFQuIcbOczoHU5TvYM0qX7nn5Rmtgz5
 /rdMmgjnSuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabuQ1QAKCRCLPIo+Aiko
 1cPOCAChOWRdECNn0NqCGxn1L1y082KStvVckkBpuTDWcFF0xWSGLO9E13hu/lYNpsIBcza4Xsb
 UVCh2iZA77nyZWzQeROi5mF+mhBHzCe2Jh0LotFK6UjhrYpHAvVkKZjROXkEHqthukIFfvT8p76
 ys0w/icDY9YzUH34Acuc1JvK9HHH/kMO/++NtEDFGwJuCgH2yNzy6XtlDVXmAOtc3bPRmKb9aoE
 4rKwVy22YcjelWft9d8P6njr+uql3pNXsBO0lHVf5yRC94dYnKzSSyBr3WvOHYwnh3PVqkMkE5r
 Ekhqwivp9xdzRjT6xC0FnuPKOHMaQ+bvtXL05VYnE0zN8QdP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NCBTYWx0ZWRfX164tA8UDu/IG
 fnD8AIY5En1NK/HHTefOV6Ee8odIFhzPL2Ryv5k/BsofhKidGhGRcLfUfeQ9Qc7vJqGSfufFHTg
 pn7qlYlLdK2s0HznDSHe/xZDndV4pqnj/wjgxTF3/E0Xh10fb+XkS7Bwt0xqAGnDzNnFt35+Igk
 9j3+1MmcwgwkERr+8UohDNpGrHLG4a6yG1rqQQNLmvJEGUyi+25kAAjF6TLIxxVzXEWi0yUWEOD
 9C6ZJWUWQhVW58J3MOVP99FXXyozX025V6x/BKuTLZDJvMxG3fVDV2lRYmTKgEn2QAwKQIt6Kl4
 vOQaSFVoP03DJTn/PuSqws2cShClgktXnX8LZO3J3o0ZX+chk8K8fwvfZoOFaAZHDNbO0Xfafyr
 0G7VRbIIzAGfoaqWmKr9BdlwqXUWTF0QSRu2pSgHTfAWxG9bVY5r+F+ml8+MOBC0nyuVcstE0cr
 VpqITZWoMJki+tnCjcQ==
X-Proofpoint-ORIG-GUID: 3OstoTJYQ3JK4f4MgS_52YKScZx3H3-x
X-Proofpoint-GUID: 3OstoTJYQ3JK4f4MgS_52YKScZx3H3-x
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bb90e0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190044
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98630-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 42BB02C66FF
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


