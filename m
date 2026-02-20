Return-Path: <linux-arm-msm+bounces-93481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Nl/Cqg0mGn/CgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:17:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB47166BCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C86130071D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2870433C538;
	Fri, 20 Feb 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYkeMzFP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGGhA7o8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB12E33C1AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771582628; cv=none; b=gw+0YiD4cLGCgg54+Xg/PhNq3+JE88gj/UgeIbfg0xw1J7sdLkQIRVFBABihTQ6lB0dx/iJEG2AdakcGIwo4mtCbJJtKByQD1JBOcfbRACI05FxXsSNDpyfpxockpRNJkouTKfT1qq455AvW4+hwHOj2VHHbihPdtSp27bOtQCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771582628; c=relaxed/simple;
	bh=dCWejxzl/VifzIatEVBeleK+/PQfWHQU9Fp135Vbseo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J385k5BMPacSa9hqFIO2GHs6JwGnH9STGOkkh7RVALgdlgayN9WLrLNEQ9S8QzuTdhxU6wC9ocvnYE7ngolNFnCuhB9OicVFnd5VkvK0jb6ZRSVdQ95IIJPUc0Uq2zSrW++fMM/iS+r3QODRTjroAmfc0vjFjgcUzrzEvLwZFMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYkeMzFP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGGhA7o8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RwfR2380209
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zApk7hJmPzO7Z8/S2OVw3J
	iN9LYKmwlx5Eaje7Q37p4=; b=kYkeMzFPdoA6gUba3IAcQnLsvc7gftUx5YGTqr
	SbJ91e7dL9XFlyGXF/6kKBeQj12jaxT02RXA1LYkyEFzfgi3xV9irTDsg+O2Dnol
	A0QrpUFXx2p610LVR9g1sN4Zpiif0W8ktzHszLPZEYCeZYqccEkyWmEcnkbIjlzS
	a1dPn5LECgNqVVM/vk+fiZB1vds+zVwSQirZwTdluzR8l7PHPBrfIjG65zfUF6Nt
	6Wi6vSMQsXrdhUMbjSIDXyFOHFXzDVJ4b1Bm8uQzwX6h9eDJEcY3XFV53UzA7YWF
	jLue+lZRMvnmNi5f6zpOoZXYmZrHpo5ym71hzcvEy/OS3Qvw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cechh9bjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:17:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630753cc38so10768983a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 02:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771582625; x=1772187425; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zApk7hJmPzO7Z8/S2OVw3JiN9LYKmwlx5Eaje7Q37p4=;
        b=JGGhA7o8pC7oUEcmxVD8J/KO/kWgq/mE5gHbDnpACFyi66l7jwbNrOHsl6OWBUWh0B
         baYRDaZCe2QeMF+V+uN5Wx54RnK38XDv2YXEazfTvrzuRw0/aTPEtoscFgHpeCI/7l9O
         IZnVArMc2I48X9v0h8ECem0xNnIMUcLqQbqeM2nk4EOVvHM1EhGWwRCYcNaex2nFdogk
         GrNTrJXqNRqmlfMwan8geD9luFVpnKP+qTKaG1LloSphQF3MYPCNqHtVxjHWs8fcHExv
         0uBYhfK0aL20Y7pWCtkgLmsk2pbP9cQ02eMb/AsYhxaywwBf3POa8XmLrK0Z/NiOGYA1
         +QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771582625; x=1772187425;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zApk7hJmPzO7Z8/S2OVw3JiN9LYKmwlx5Eaje7Q37p4=;
        b=deYyyPptOPgKMG2qlxP4NuQj2zQeYi+3gq8Ns+kaIArC5x4Hyv2JVbe7/xskLExwqm
         CwdgjY0GxI3eZNN8/yS72svQR1eRnzx9b1zF3J5J1zKEc5VAq+MD/0a9jYPLKRAHl3vx
         0JRp3X9tqP5ZrAnYrWr7M57BY8f20yWBPgafqD+gv8pGhWRIo5qJCwTogatPl9vR1b4P
         4QKIrO/gKweqeTTZ6lb14THPiq6dvpeFsGNvoeikZlXx82xHpzjoT+5bFRkZSwuc/3/O
         bULKsbxUry/HWYqQTM3MbnN6AIvfLx5SjMVdTl1U4dAz685JLbrEsklaww3XxMmTjlR0
         Uakg==
X-Forwarded-Encrypted: i=1; AJvYcCXDXv3sceBFYDCwK7M8/nYpzbAdbdNQ+hJAtOg08QEClK4z9iWhyehv9YP50+dbsVMfGE8hxbPlkr6SWXLI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn/fFUcNzxKsTsbMlOgDVcsIK83INPq5uaftEpstPqA01eQNrp
	YVDfyTyDzmDEL/387nb6DpnKp7JJ5jXAvaa2Ux1TLtLqEd1+wJaNvAtPNTNnfVisx08je1CIGH+
	WpMFhKSUuZPmiuL/vIxcksGtLy9lYN/TK1qjZDzBrGF1OwJaa9WNVfsgbH4+5fMQq77Ul
X-Gm-Gg: AZuq6aKNUaGnKVnuCapygsowmo+qC9Ipf7nWBz2NvcNH/Qy6DT1tKfZ1O5xmYK7VYTL
	xqxmGxAEI7VtuB7ooQdkbZ4FZNZJKumD1eaYoq8nCmcqaDFMhjIYqK2quTf+Cqy7eyJ64HQkfsv
	zcDDauIAY8A88iGKjZIG4JKJbUHW57u0YU+N41+abYpAcHpE/Jt9ZzkWfy4oeZY2aeUyixWOyZ7
	nlvZp0y0CDYgi1Ej6ip8+VNImwdZw/8NgtqkxwA/OJcUqIjae0IAL59bx6CLsia8Fre2i5qXM1p
	hQzeCK+Pt2dyipm3O4Vzp/RQWuCIbjxuACUUrW3c1LAzaUUhNRbYZMSR0xTzAlWsEPam8pfQkd0
	l1wU30oHJHKEJfR8fZrsDCUcpTiFWO3DFmSlyj1MVYneJIg==
X-Received: by 2002:a05:6a21:6f06:b0:392:e583:b76a with SMTP id adf61e73a8af0-39534657542mr1469395637.52.1771582624604;
        Fri, 20 Feb 2026 02:17:04 -0800 (PST)
X-Received: by 2002:a05:6a21:6f06:b0:392:e583:b76a with SMTP id adf61e73a8af0-39534657542mr1469365637.52.1771582624136;
        Fri, 20 Feb 2026 02:17:04 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d81c288sm2768391a91.5.2026.02.20.02.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 02:17:03 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add device tree and enable clocks for
 Glymur
Date: Fri, 20 Feb 2026 15:46:56 +0530
Message-Id: <20260220-glymur_mmcc_dt_config-v1-0-e0e2f43a32af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJg0mGkC/43OTWrDMBAF4KsYratg/diSTSi9RwlGHo1cQWQ7k
 m1aQu5eOWlW7aKbgTcw37wrSRg9JtIWVxJx88lPYw7spSDwYcYBqbc5E17yuuS8pMP5K6yxCwG
 gs0sH0+j8QKEqbWOEdqgcybdzROc/7+776ZEjXtbML48lCZiSufNtcXzorKHrnJaIJnSb6H4++
 XGJk11hyc3opmlJNaBEqRvs+/ptSulwWc0ZphAOebzu73/jjKtn9WFeAejGslRJJYQEzXrD/yv
 l8ZQ2b3HaLb63csrqXlqN1v5t9SYh3Td+aQspG82tqDgIoWoFVlvWOF1KiQoZq5mptHJOkdPt9
 g0AfocxpgEAAA==
X-Change-ID: 20260220-glymur_mmcc_dt_config-c50d9a38fe7f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: onfAyD92pydzO5j-yF1vvQfHzC-huift
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4OSBTYWx0ZWRfX2PUg6A76xsTu
 gxJAUhXc6ap2U28w1mQFddyFwGl4Zb29EQqps3xb2KfKFqWixRfmBIvwy1jW2VxB2aeNqQRisJB
 qMp68xazTUlBTTcB71XkSGYkK0/FGVFVeGCB9ypLx2HQQTMYPB8d/GN17Nv/vnFLvUNNWkBdJTr
 NjiFw1G431TTP69z0gTmFUZElklRcSKP8ketJINwDf8G7NUnNINU7De5FTVo6JOr7Ao5VJoLDVl
 YAWlsetK5sqPXCj+U1HwvMmV2ZRcSCHLyKSbeOnsiQ3FUXReLGh/NZ96ErRHnhOmDZEACTMR29g
 ZHsVVVTF+SVvhoQv+p0JsuMwtt0+HkfSQtkgY9QzE3nrONS9vy7rYOrZKSe4MtfUtc774xVUdSn
 TYUlmJMM0xoS4UYMtH5o9hf580CNBVXH1wRZUVlh5lbsNeWUE923/pw7kBjRW9ZDkDBD9t4Q9cs
 ojAVLL7WDl1cO8ing1g==
X-Proofpoint-ORIG-GUID: onfAyD92pydzO5j-yF1vvQfHzC-huift
X-Authority-Analysis: v=2.4 cv=KYzfcAYD c=1 sm=1 tr=0 ts=699834a1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Epd3R9RfRWPvzS-k06sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93481-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CAB47166BCF
X-Rspamd-Action: no action

Add the Video clock controller and GPU/GX clock controllers for Glymur.
Enable the clock controllers for Glymur CRD boards.

Dependencies(Glymur DT):
https://lore.kernel.org/all/20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com/

Video Clock controller:
https://lore.kernel.org/all/20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com/

GPU clock controller:
https://lore.kernel.org/all/20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      arm64: dts: qcom: Add support for MM clock controllers for Glymur
      arm64: defconfig: Enable Glymur clock controllers

 arch/arm64/boot/dts/qcom/glymur.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig         |  2 ++
 2 files changed, 44 insertions(+)
---
base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
change-id: 20260220-glymur_mmcc_dt_config-c50d9a38fe7f
prerequisite-message-id: <20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com>
prerequisite-patch-id: a9ccb06216435308c295e2de9adffb79060439cf
prerequisite-patch-id: 1e8d403675640d7db68a4c0caf28d1b1be895e8a
prerequisite-patch-id: 09bf515a2cd6bec5b21f15b18bebdb172f4b4a57
prerequisite-patch-id: e88699eb550ada640f5f2f5e4f432d6a3ae2552f
prerequisite-message-id: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
prerequisite-patch-id: 6f0c175707287211c395137ca1786b2d9db82179
prerequisite-patch-id: 0b387f7c7bda3b0221057fdc053e94da4f13b60a
prerequisite-message-id: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
prerequisite-patch-id: 7bb0512ed0a2c198304d3d4064f03e0a127e8a47
prerequisite-patch-id: 0a264581e0868929c5c67c5af315220af2e838fd
prerequisite-patch-id: 4346ada14c281d949e9e25c4bccd775943aad41e
prerequisite-patch-id: 4f2f9d8ce99d2cd435021824f9a68a997c593605

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


