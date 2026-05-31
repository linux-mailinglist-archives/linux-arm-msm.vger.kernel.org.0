Return-Path: <linux-arm-msm+bounces-110449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK0hG3POG2prGQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 08:00:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D247A614A4C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 08:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA203090269
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 05:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E8632B10F;
	Sun, 31 May 2026 05:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQKNiB80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHm3DrXc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2732470A
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206959; cv=none; b=qW9kScX12zl9aqOrLOQxREg9vbOgXAh9MFTOd+cZd+uzLyhiHKzao4JlqaFeRnbQgkCsUaZe4Tlyd/H3Tj2+ozRGdcn3TyUnRsViu9Rpzw696PQ9a1/jkwEVSpN29M7J3Kk1ei5MYQPZD301558XdmsdGWfNqSSnRImAQ19Zyh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206959; c=relaxed/simple;
	bh=alP24qX7DhfjrijXtmZLs7Pqi9WftD4XbQsop7LdBKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bVHSCPVg7dJfbHDuwmh61Cn/jyIAMQOb+8Q5sxlqt+Kf504R+QLhX/1TRQCZnMckrdS6DANG0IXmqN8MWP1YiYg/a3epLMl/5IMOw/lR3Vm9lMxhBPkCH+tErJAX4JXYXyNoflwqV7Y4o2EO9DIoBlr7Kuoxx3yrlz1m+BVYGF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQKNiB80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHm3DrXc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V4X2fQ581303
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3Jm2LCWMeiItYyzNb5FlmstRZ2VQtC2wNQk+gG0Iig=; b=SQKNiB80V217qYVT
	34PkLP4x6Uk4GzCGcfFQREvAKzBDSfMbPBUaszhQdrbvRef5U+ud6C7hAmeqZbEm
	H3CtBIZ6DY1Rf5jHpoNMvnkiFyIskd5xzW2SXTM8nU5WpLTkA5QAe1NjCYbeF4Z3
	Y02/+j/AfT+yN2CdA+dXmIAj54SojHzSe/AFS7ppaGtV++W2XFGJyR6po56MpwiD
	Jr8cEQVuddHSwf6QBIvRDs4UdBHLCgTzR4M8FYShJ/a7msMYFRCa+yCxIG3OlOyJ
	2T4DOCz2zj5BSaaF7H6YqRAFsGQA6WKAtirvlufyZ1cN9uUymwiBZxO4qBXIrj8C
	/PvF1g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pkf5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c36f4b76so3144235ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 22:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206956; x=1780811756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3Jm2LCWMeiItYyzNb5FlmstRZ2VQtC2wNQk+gG0Iig=;
        b=DHm3DrXcukmwIlyq5dIrCtTSNEeS1CdkjvNwmguJGBhrHl+DtDIaBlGVmeomfGIDiR
         OuRoEmIU5UwbIezlj/uHOQMWCDh9UBbuxt0R4zm0KbNqIbfK70DJliYKvZnz4GlRvI6U
         6tcEEfNIuDG/iwBF8BGwLY2be8xmHG4GclrB5SWHlszgQfvqVxXnAEDFL9vKgBhlVe7i
         nwTYYbrVIqMItrQfZ1wY8ii1xrSiNfaA3djwz/55+LVaM0fMoQBFBkxCpato3gsrz9qJ
         ZIjSVKmwu0IxClJ92TmXGLPA7IJc/16V2P+jKWQt8YJDpDA9FPLtqcBUzjbOWwM2ZeSb
         mxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206956; x=1780811756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U3Jm2LCWMeiItYyzNb5FlmstRZ2VQtC2wNQk+gG0Iig=;
        b=rS0AbF8JKzKGZ/LTGmpXOfqMhxFNz3nKJXil4QWHa929horMsimSBr/Dw+faoPtaYc
         Yb95kQCsue0n0xJbit4e9EqPNx8FEwqvW63gSxeSERTVp0Ut4Rjl9LDcg4DYNulL8RyT
         s3OCbpX/MurVl8yEcarNYRyWz0LBDfQeZIRfvdpLkyVOj8nRHdiH5CjcD9s7HkVokPJ5
         mJ1oodjtkUJQpUZEHMaOLp0ksBeiwseoCimFMWO/8jMp2oY50ayP8YivH3xyBIKPNtwJ
         GPfkloOYYnsbHyU3Ay1DuIWT+EGu2AaF1FEuSlwyZpT8ND30uNq4DA5H8j3O3RvLhg/n
         by+A==
X-Forwarded-Encrypted: i=1; AFNElJ9fyfRXK1eKEgde5SyVMoutTk7UYsRLOS+O8rLrLMmaVIdvmAgfgCVB/NSt/7qPCvg3vbOmBF5y1ojg3wxY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8SxF0Akm9Fzp+gi3QDQIsigf0BCu1lFgcgb1P3xZN23dhxW22
	3PruNHXmlwa3jYrw0Tk86tbQVSQttTZuqbpLyCSRxclyTXqI3ZFf9Li2xcEIqqgbpG4HY8mn3e/
	EhjTbVz8eDBnG8Pgz60deD1TWQWZDmlqLoCHvoMHR2QfQx0mkqqlMxHZvESzmq7Ayg6bx9/aYPV
	kd
X-Gm-Gg: Acq92OEuim3WU+W0kNE6Et8nFrPnsERySCItikNlnlTqPvHmS1kDEz/zYTWKs/AOD+E
	sZaEUaqfRL+LWfn0oXgd0A4hWdLB1x+BX2UbwN0K8JJ642TWP7zMplwpThVjyHPScJTzM2XzLFN
	E6NFDbEFAGds+BfUykCBzQr8bbEyB0gEdrg3cdzb1teeX6Gy1Msv9WU+RV+9K6ZmyNYX1T3LhPw
	0YoMOciKMvOS0NVGjfcjHXvXxkeS1AS/qt5nYBeswGzwr23FCskqKVlZzOwRmfSvKvu6l5JxLUu
	NSEsna3anCkVGsGHrTob0cKHihCuxuhOaasd5pMYrofPfskM3QcCDS/v1qd3VdLYi4qI3O0TGeq
	nSikaR0cNUJqYTuOYNQvjC1HX+X1H9P7hE9aBZKusMkK2sjpvfmKZrFCK1rGr477SIg==
X-Received: by 2002:a17:902:f610:b0:2c0:c389:d99c with SMTP id d9443c01a7336-2c0c389dd89mr19582605ad.15.1780206956097;
        Sat, 30 May 2026 22:55:56 -0700 (PDT)
X-Received: by 2002:a17:902:f610:b0:2c0:c389:d99c with SMTP id d9443c01a7336-2c0c389dd89mr19582295ad.15.1780206955617;
        Sat, 30 May 2026 22:55:55 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:55 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:40 +0530
Subject: [PATCH v3 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-iris-code-improvement-v3-6-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
In-Reply-To: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=1008;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Epm1IKP1y3YypBiDQmS8q4B6XeOav7jYm04d3gKp/TE=;
 b=NZZG5FNBcf9RC63vZ+mr1u26VmtIZoWhEUGQ2riAIUczEpgPpkN1sT7pqGBNRNVJzLGOLvao8
 IWd9KWIvoWrB5kpvr/aOCWN3HqwBCEog3lYq0MpqGJah7zPqZV0uQ5m
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: SBuJwyAkpK-_F91hW2wUVh0FBUqFKiBU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX5IcUO+Xs5nGH
 ss9nxGh0XlXMBLsBru78XQ99ue9s0F37htObxtLqGYS2J14l24dm07wj9aoH7Azl9cyw/YoHcUO
 vn3vZMiX7eacha8mf02PQ0vh3JqyYTiRotQb8wKkXnneGY7IphXs2tf0d9zpxiRJz0rf/q/0/Tc
 x3QD+U1Ki0aCsQr2lLesgavT9ul7sqsJrSOW2GGms4WU0EC9xa79rbFfgKH8YamDYwWrUuUxcz6
 01GTYTV9Kn0UKGqdz3PFmw21hzGPQrmncVZiuXxfaGMJKjS3pFhbZ3sGBrjAypEAKmWnljuz3QC
 9wo4gPUHYK5kgyPY0+5hpdAe2hxRBkWtaMUT2zVujbscx6AK5fFlHkD75ZyYoatvI621lTgveS0
 trhCN4jmuhXh6uiJf3618zq6Wc6zzXQPqrOg8d/k2z0djJneKrw/oivaarRe4VQbJahfU113Jgb
 +Skw9PrB5i+HHNfZnew==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1bcd6d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=nqERTrTL3htJ2auDmasA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SBuJwyAkpK-_F91hW2wUVh0FBUqFKiBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110449-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D247A614A4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Without the break the AV1 case falls through, risking unintended behaviour
if new cases are added after it.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 516bc468c72c..1d21ddd84f41 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -696,6 +696,7 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 		break;
 	case V4L2_PIX_FMT_AV1:
 		codec = HFI_CODEC_DECODE_AV1;
+		break;
 	}
 
 	iris_hfi_gen2_packet_session_property(inst,

-- 
2.34.1


