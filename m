Return-Path: <linux-arm-msm+bounces-91983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDNkComihWlKEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:12:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 375E6FB4BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E513830072B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 08:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1C8329E7D;
	Fri,  6 Feb 2026 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5e5FWGl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmBLb5hH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A101F9ECB
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365568; cv=none; b=TWazZHgH8RmniqmEu58Ez0+S9k8rPiz2b+O+wvCjJb6WtEEmWKrcJz0Xw1CL282PV921GCVSCgabQyr1VysO3jrBavyv/vzRc53wJ0a4BcFpe0qiRrvgDXCD+/+rT3b5yMevI7cMfA1Di8lD86MNTXtSoD7uMiS+mXqggYG7tYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365568; c=relaxed/simple;
	bh=h9Ihd+t8FgteUUt8it5iiV/83RPW5jgduWOelTyHaL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Am2np02N5xc5A0Ggti1FCrdE3o1nU9en+cM3gqqF4k7R5Mdh27CdhVN+BZhfHlKd1BcXbnGDdv8sKDdNC+1aYbGdf5X0ecrI1F4B32nRrzvAPL7551ww6RUvQBhYTAqFf9nIJSiUqreVRwCmrXpUgOOb1L2zwCqhDS9CD0z3gH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5e5FWGl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmBLb5hH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167Y57o2482664
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 08:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CkJlWZGo9t5t7NicyWfQkWXYdwTUdx8Ffh86gvs2RYk=; b=d5e5FWGl64QUudfJ
	rKPH0sbODlNtSn+X76Hx94QnhcqvstBsouzIqFRHASAC72ncAJc9LKWcTS7uuIhh
	F3HhYFh2FfrKqxVA4sLt9pR4lJgOHOp4ChGSySJ3cGAv3jjEs5cTgR+k98HDnXYM
	zKeEOPPviXBGO27IHQYvmk9UMfyLPnaPBWFDWu49yPUxzrzI/WJDJQ3Hi181R8gD
	K3dhs1asQS4iCSDw3f3z72kRbDgkTA4lIzEyyMlAhhKJuFy4wCwf+cVvFb4VygpK
	osrJ5BWDflTN+2czSGBRTtrzCCtt/VZLP56fmM3YHCenCSiAvT0xDDAQAi/8eJe6
	h24FdA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c1703x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 08:12:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8216fece04cso2636988b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 00:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770365567; x=1770970367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkJlWZGo9t5t7NicyWfQkWXYdwTUdx8Ffh86gvs2RYk=;
        b=gmBLb5hHQVWseaAd7SDy/Ix6IrOmuEAsTZZUteqwj3OTYtYCZ1d2T0aTSGQyOM9qS4
         z32HcoHbRv1IjBCv6XCEVsqO1sjGpKd7bOQfLMcXLPX8KWqK6tksCpjQLmUeKFYcoIGs
         UYI9Djiay4BAXv83Ymna+69VAdthFI+JVPDsHiAVq1u3mM9/RRdQidCiY6LIo1ahW+uY
         Fw/ffIA0d5RuYlqyCFVTdElh5BKMbODaLv305yTZUjTiCmcJoeMH0uRR0LIKzXzI9il9
         I21QrBmp7/5rtXxW52ovheMJhxujoJwAmwr38qDbKuWSphDYKWIEybl44Cl1zyc6aAYa
         jqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770365567; x=1770970367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CkJlWZGo9t5t7NicyWfQkWXYdwTUdx8Ffh86gvs2RYk=;
        b=WhC1B7JPteofqUuYRE7dnh8VBzHBjYBrDm6ZRGsZTTUS8NjhsQk55Bk870S8XCyAxS
         9jWNPAievCbngivMLSaDwMxT2dDdEtjnXoPSq+p96G4tnzzC3pmkrR7RJiHR2HqTlC/c
         DLgoPNtb6q2/CQi0vPY/DOyI8pyaqTFY6yAO24PVM7nTCd1Qp8+RDgRg/Hjmts9jCgC2
         ZKlF0EOAWfHr/eTc+az/2XyZg2rnUuq7qXZ+1IppL0jvdfdtyOomasulQRNYMmCkHkWd
         ABbch9aWJguOi399wpITLLI9EV1wOS/VPH3VG8JLiBUj1+0itit632Ulze288h7WY2T0
         of/A==
X-Forwarded-Encrypted: i=1; AJvYcCW8u/FScWoWM7Pv6wREhgu7O7SKNV4FzWGXbkZWOiDG3xASA1yQ6Dx07l4fLrcg69UshcEDSZHx0PyFFB3s@vger.kernel.org
X-Gm-Message-State: AOJu0YyQFn7kmyFL4kQVxI5ND2zC99qhyqmzu1oZpihYjHeYWGCyLgFF
	fvSyT+9MNKDH0T1lNKwBCTH/Z64rk/ONdvxqG2l4BO3xoilPqBQf+lh75bXRHvdB6rYkODLZiD8
	X7s1L2Rd1prQyDTKU+yABXtdyLvLoZhaBb/9Hc0pZzT3A259W6iOP+3zVFqbXLfp6hZ0t
X-Gm-Gg: AZuq6aJbwbOWpr3FYvV/8BKirgVIfUx2KFkC3WDUg986OMtcWopD7c+cOnr66lTEy0r
	+jy9E0ppxUZzG2a2A3kQSKpc7c31zpHqYVbPhWYaUNuDxNWopvAP9EO31GXafmP4Opw2zQim1Ji
	Q0fDD6S6TKP/jv2WcxvtAfG1qhYg1ztN4tKQkw0wGQig+zLhKS06V38RPRm4DCVcgrn1TX2zHaJ
	XkfigDTQFo/cLbJf8Exfo21EvO5dS2N/VXlWhFPH/aF0BoNgJOIWsQWv16HPhtm92m4mI5PsJ0z
	QmgknbvcYkRBWYOLGzDoUFvlzMDPY3ACtctfSedh4xF1yZoBZI5uBc0C/13z1Zs/DKW2guXE4WL
	IrkFZ4w8CzentxqUrYYliZXvSAm9xjnhGyr/VD/DW3jNQutbXZ+YJngtZT5NpaLSyB3vIyYEL2w
	MlczsuDH7V
X-Received: by 2002:a05:6a00:92a5:b0:824:3e25:3cdb with SMTP id d2e1a72fcca58-82440d83d33mr2240213b3a.18.1770365566923;
        Fri, 06 Feb 2026 00:12:46 -0800 (PST)
X-Received: by 2002:a05:6a00:92a5:b0:824:3e25:3cdb with SMTP id d2e1a72fcca58-82440d83d33mr2240179b3a.18.1770365566251;
        Fri, 06 Feb 2026 00:12:46 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b75sm1671866b3a.39.2026.02.06.00.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:12:45 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 06 Feb 2026 16:12:11 +0800
Subject: [PATCH v5 2/6] media: qcom: iris: Add Long-Term Reference support
 for encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-batch2_iris_encoder_enhancements-v5-2-fb75ed8fa375@oss.qualcomm.com>
References: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
In-Reply-To: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770365554; l=16389;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=h9Ihd+t8FgteUUt8it5iiV/83RPW5jgduWOelTyHaL0=;
 b=AiUT6K6CtDJT8DR96W/h4K3TU4vaamzKrSFdksffwOr7ShMlc7xl02vwIzjeNd3UlfXYKncC0
 50dzb4oS06rAHBSka/Ru4y8Agj3+5NR1MyvuP6WGdJaipcfd9P2L5l/
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: wLfi_9-W4F9wC6T6RZBp6yXgCJ_U0sXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA1MiBTYWx0ZWRfX8gLIJPPSmwas
 a6NfA8d5wifz7ChwulrslmSUyrMBdLSthKY4MvQAZTXnf8nDlNqr+sHxDcn3wO471yfoxBSQ+96
 nId9TnRvDgEnveFdrKOCtvIfiHXGl1xzanmzKur8enKR9sfbHGxMtwuqRdG5eSeyAdl6iWjPU2J
 mPlbckjl/0FyMEKzwxfGCE5svzqR8jeHoOwNZ/hd+OJ9EZNzRH6K4SJMUfSDeeuMWs/jCkf5DSE
 /b3JL1UXqWPO12l0l63WmlhVqCl5JQYsSDubxptiqYDXPVw1p0AibQeldK67WB69NQ1SGHxYPaW
 fo3DxPtY0jZZmIMGKAUXX23b/XcvOmFZtT4kooVtbEmN+FGkw2Oqc6xsCRTnNwsZ98qWsUfwNNG
 yGCQl3ZtQyH4dnyFgjOa59oy5J3UGiQQwtKjzmz08P6h0coLcMNYhfu4zXqqVyaXl71kApUhOml
 QHj56PtbfnHfIVMSoVA==
X-Proofpoint-ORIG-GUID: wLfi_9-W4F9wC6T6RZBp6yXgCJ_U0sXU
X-Authority-Analysis: v=2.4 cv=E7TAZKdl c=1 sm=1 tr=0 ts=6985a27f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QunbDvX0_-zBgmAapgUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91983-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 375E6FB4BE
X-Rspamd-Action: no action

Add Long-Term Reference(LTR) frame support for both gen1 and gen2
encoders by enabling the following V4L2 controls:
V4L2_CID_MPEG_VIDEO_LTR_COUNT
V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 128 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   5 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  25 ++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_platform_common.h      |   6 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  30 +++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  30 +++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  20 +++-
 9 files changed, 267 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 5441278f80fc5d0f97367c09b2ebd98a55c7ff1c..9a9dec022b35e94c800fc13ec35bdbba520e7168 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -112,6 +112,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return IR_TYPE;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
 		return IR_PERIOD;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+		return LTR_COUNT;
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
+		return USE_LTR;
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
+		return MARK_LTR;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -213,6 +219,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
 	case IR_PERIOD:
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
+	case LTR_COUNT:
+		return V4L2_CID_MPEG_VIDEO_LTR_COUNT;
+	case USE_LTR:
+		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
+	case MARK_LTR:
+		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
 	default:
 		return 0;
 	}
@@ -1033,6 +1045,122 @@ int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 					     &ir_period, sizeof(u32));
 }
 
+int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 ltr_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_mode ltr_mode;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_mode.count = ltr_count;
+	ltr_mode.mode = HFI_LTR_MODE_MANUAL;
+	ltr_mode.trust_mode = 1;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_mode, sizeof(ltr_mode));
+}
+
+int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_use ltr_use;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_use.ref_ltr = inst->fw_caps[cap_id].value;
+	ltr_use.use_constrnt = true;
+	ltr_use.frames = 0;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_use, sizeof(ltr_use));
+}
+
+int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_mark ltr_mark;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_mark.mark_frame = inst->fw_caps[cap_id].value;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_mark, sizeof(ltr_mark));
+}
+
+int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 ltr_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	if (inst->hfi_rc_type == HFI_RC_CBR_VFR ||
+	    inst->hfi_rc_type == HFI_RC_CBR_CFR ||
+	    inst->hfi_rc_type == HFI_RC_OFF) {
+		inst->fw_caps[LTR_COUNT].value = 0;
+		return -EINVAL;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &ltr_count, sizeof(u32));
+}
+
+int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_val = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index a0d5338bdc910bd30407132e8b700c333ad74e4c..996c83fdc6f492dc252771129fc1d62e8b7a7e07 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -36,6 +36,11 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index f30fbb803936cea030c2b5485801cbb7addef34d..74f9feacfe3562d44a8415de83fb7a6c058a3d8c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -695,6 +695,31 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
+		struct hfi_ltr_mode *in = pdata, *ltr_mode = prop_data;
+
+		ltr_mode->mode = in->mode;
+		ltr_mode->count = in->count;
+		ltr_mode->trust_mode = in->trust_mode;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
+		struct hfi_ltr_use *in = pdata, *ltr_use = prop_data;
+
+		ltr_use->frames = in->frames;
+		ltr_use->ref_ltr = in->ref_ltr;
+		ltr_use->use_constrnt = in->use_constrnt;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
+		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
+
+		ltr_mark->mark_frame = in->mark_frame;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 04c79ee0463d7f32a2042044fe4564718cc01561..34249fc0d047918c2463517b8303e30df3666b97 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -147,8 +147,16 @@
 #define HFI_INTRA_REFRESH_RANDOM		0x5
 
 #define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
+
+#define HFI_LTR_MODE_DISABLE			0x0
+#define HFI_LTR_MODE_MANUAL			0x1
+#define HFI_LTR_MODE_PERIODIC			0x2
+
+#define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
+#define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
 
 struct hfi_pkt_hdr {
@@ -460,6 +468,22 @@ struct hfi_intra_refresh {
 	u32 mbs;
 };
 
+struct hfi_ltr_mode {
+	u32 mode;
+	u32 count;
+	u32 trust_mode;
+};
+
+struct hfi_ltr_use {
+	u32 ref_ltr;
+	u32 use_constrnt;
+	u32 frames;
+};
+
+struct hfi_ltr_mark {
+	u32 mark_frame;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index cecf771c55dd36a13616344ff4583bf1d0544e17..aec19efc41a5ef47bbad2471d3c4575704859743 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -71,6 +71,9 @@ enum hfi_rate_control {
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
 #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
+#define HFI_PROP_LTR_COUNT			0x03000134
+#define HFI_PROP_LTR_MARK			0x03000135
+#define HFI_PROP_LTR_USE			0x03000136
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580eb10022fdcb52f7321a915e8b239d..544c65dea922ae693adeeba972f1418002fe3f92 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -29,6 +29,9 @@ struct iris_inst;
 #define MAX_QP_HEVC				63
 #define DEFAULT_QP				20
 #define BITRATE_DEFAULT			20000000
+#define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
+#define MAX_LTR_FRAME_COUNT_GEN1		4
+#define MAX_LTR_FRAME_COUNT_GEN2		2
 
 enum stage_type {
 	STAGE_1 = 1,
@@ -159,6 +162,9 @@ enum platform_inst_fw_cap_type {
 	VFLIP,
 	IR_TYPE,
 	IR_PERIOD,
+	LTR_COUNT,
+	USE_LTR,
+	MARK_LTR,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index a7595c302162b9fe758c61706895a709b3b4e852..42addeeda47a849dbab2758b11e948606479f25b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -265,6 +265,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_ir_period_gen1,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_LTRMODE,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen1,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN1) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = 0,
+		.max = (MAX_LTR_FRAME_COUNT_GEN1 - 1),
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_mark_ltr,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0de85c51cf745e9a121da14b1ad7bc761505c957..617879ec0fba39c0f8529d69ccf0bc7612445110 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -740,6 +740,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen2,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN2,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen2,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_USE,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
+		.step_or_mask = 1,
+		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.hfi_id = HFI_PROP_LTR_MARK,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 9270422c16019ba658ee8813940cb9110ad030a1..891aed5091c7a0fd0bf1f1a3a7737d49e6d8cea2 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -934,6 +934,19 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 				  num_vpp_pipes, inst->hfi_rc_type);
 }
 
+static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
+{
+	u32 num_ref = 1;
+	u32 ltr_count;
+
+	ltr_count = inst->fw_caps[LTR_COUNT].value;
+
+	if (ltr_count)
+		num_ref = num_ref + ltr_count;
+
+	return num_ref;
+}
+
 static u32 iris_vpu_dec_partial_size(struct iris_inst *inst)
 {
 	struct v4l2_format *f = inst->fmt_src;
@@ -968,7 +981,7 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 {
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
-	u32 num_recon = 1;
+	u32 num_recon = hfi_buffer_get_recon_count(inst);
 	u32 lcu_size = 16;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC) {
@@ -1677,10 +1690,9 @@ static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
 {
 	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
-	u32 num_ref = 1;
+	u32 num_ref = hfi_buffer_get_recon_count(inst);
 
-	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,
-				       false);
+	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref, false);
 }
 
 static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)

-- 
2.43.0


