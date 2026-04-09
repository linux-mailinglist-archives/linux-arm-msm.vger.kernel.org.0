Return-Path: <linux-arm-msm+bounces-102547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBCeL2MR2GldXAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:51:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0AA3CF993
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 748293008467
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC3C33F591;
	Thu,  9 Apr 2026 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxfMGP1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGId8DTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4027A320CD3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767902; cv=none; b=braNYo5uzxetegMixaKjTHycWumZaS03RU1onAIfuc+DIHfMoKCBif11BeyeG03vPgNesu1cAvYaNH41JaQBhgYvd01QPL1mtO1GKv6C3CS2wfW21j8bb/V+RtII1vN9k1ItOLcpOosL+cuDYm1AjpH3eJ69i3SKrE+IoVUBVWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767902; c=relaxed/simple;
	bh=tBPHTDIBlLW7JTM0R4qCnebwpFSDqhthFiS1dZu/Rf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcO2pikXRFMhfxI5G0q2BOYHjp+u+ZWtmd6Uo5/QB+89V/8cM8hsUVKTBaFXuZ/0RuHyao1eToOeIsHIA+0lfRU8i6Mr5nU1DnqDoizv5rN5hRobS8tdoepu3/Gz6/6l/hPE1LpcAeMiArRWematsKyH9ESN8z34oPiy4Ax8fsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxfMGP1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGId8DTQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KPJgj731207
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 20:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bv0Uhlmpf3MQzWotKM9cp4joTloR/O9G0upq1+R3ykI=; b=HxfMGP1Cc61ZSdNj
	mWUNpK2WnzKM7VhpojosAi+i+gpyfS1JJqxjyuLNHl5hVEYeUoHR766IJHjeaZYp
	PlwG7oOouXwjAC9BGdtWt8O2BTlLXFuT4uuf/avHXU57BPZTZb1QPiE4LmspEPOH
	/zQ+fSPT287CQPB55gPOFvWg9V/rw9H/FeBjJ37fzV2PXHyWTrym7l06tKqQv1qg
	cnZy/OO5Pz0odxvwMNS4Pgc3EzTatWIAqL5DjZeOG00gzg8pNIRDM4N1KfI3rUkY
	lIxoJbDGl2zaxkao3BqhXMXer9f1OEJeEMIgm3yvLLwzVIalzZlszSdZdT5cHEIK
	C9SlAg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dek4c829y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:51:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d443c3b094so1822016eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767900; x=1776372700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv0Uhlmpf3MQzWotKM9cp4joTloR/O9G0upq1+R3ykI=;
        b=MGId8DTQt9h7cFj8WJMf31qBOuWFZWq77JDqX0GpaPTCQixAkqFhDg+/LS4Uknq3KN
         8uLeRKEvHiqFUgyjNVJ6XnK6cphh6R3l5ulJnZ/nGAcrVEBwo2GjyVfCfQ6xkoPzYl6h
         QMrZSxgrbCVdaDzyUKKMaJHOSa4Zbk5YfKhqoN4caY4+j4YjPe7toIIb/DL0E9TrryAl
         xaGGThvUaGhd3fTnwFFyqg43fFEOOs7CWX+Nm82ZGpkAPh1UjSiO0a6K0Wvrqlw7et8W
         YhJ7cgUkfVpJ0ef+oUOvYv+KWEynuGTEgtSZreu5c57mb2DU76YjLIClGGuE0W4kS7aM
         o/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767900; x=1776372700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bv0Uhlmpf3MQzWotKM9cp4joTloR/O9G0upq1+R3ykI=;
        b=X6L659aavceKd5ap68JJzq3KozDl/N4AvYidGY9aYTgzpaMGy44AQwmkjlSXKmrlAm
         msGRZ7qZu0J4PBnD/MXnMtzynF7hYsNwU01IF0rnmrQhy+yqyBItHbX12tG6zsfvYRCu
         xplgDnAi9wnySsBJbvs3TplF/tKYpfx7UrSdyHwL8Vzm4F7LsQsEMXAitAhOq0eW9tLw
         G9YrQlfklc/ULC77z4ncbGbmEPzXWSSWPs8+dRFQu83AfP45hReYbVphPbzcGTfh3eKe
         RR/PAqL5rDVoGxdzS/GznZQxoYTWQOckKxg+vCYYGraJiWZirMi+hJoJ3UCZ5EC4+I8U
         /WWA==
X-Gm-Message-State: AOJu0YyiflqhhBNSTXYvdQSdoS7BuuDjafwBjQebQV3F3Miij1qN4G9Z
	Zyv60kJuX7ZzKnvNXEGCGi1o1sYiLRH0KVoOnwdU1ZpFFx/q/3N05au+stDY73W6723NdZz1YU4
	Wp79wUJ4o88kZJ1IzrQviWoFUm3RwutDdnpYl47nJgdUcjXIIxIT0KSQI8nNi9MNaKkfu
X-Gm-Gg: AeBDieta6R4wAK2dGAr5PNxVku4eDFfqLe6/LeV7eMpcROYbpZwssWQEhWDL2TJbcHw
	AWQegk5cBBzvG5jb985ve+fWGtKY9rKX4+7zxLefln0NBd2I5BGCqB/bSQsgDBt3ZVEh8+oAPSy
	WnqnZ1uJS3ZdsnbjrNqzuZErkYkNDPZcRmqqYXBObv2oGVRQ9UnEvBv6OIDvL1FS9HzDRmSOwpa
	w4A2XW4U3N8W5P1cUkjCoIKOaESzMSs5xnvGfvc3x0c4HMbxGUh2xui/Hk03/y4eXyLBOz4Nuwd
	t/Jw+xXvSn8LgKCjlwryCzr7Rw98+b8iOsNpfbmujBoocbpeYY5aOAS47UN6u+kHDoMURTWIbSv
	BLfnW2Taa5q73zxbvDufQ+ptUwIac1l+OZdq7kd5nJcv4GPoALwMzkvZBYeyRuVrs3TFIvS6IEa
	7w
X-Received: by 2002:a05:7300:724f:b0:2c1:74ad:2cd7 with SMTP id 5a478bee46e88-2d588d8a9a6mr348964eec.27.1775767899905;
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
X-Received: by 2002:a05:7300:724f:b0:2c1:74ad:2cd7 with SMTP id 5a478bee46e88-2d588d8a9a6mr348950eec.27.1775767899390;
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:35 -0700
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-1-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=1320;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=tBPHTDIBlLW7JTM0R4qCnebwpFSDqhthFiS1dZu/Rf8=;
 b=53WL+vff5V5Rm9NZrMEylYs4zD+SDxWuePGI0P1VBzoLqMW4viwyM+VY55bXeFikKpsRTpyjX
 IIggrSTF5bWATgK3qc9Z3o3HewZsSW4nKOAGwHEiQc3qHV/3CSK5rMw
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX7UJlDWMrNh8j
 rxop2A84UEljmp7MVrHxV9ftHXf5bFgbLJrU4DvtcjSUqn9JZjo1BtS5Csd+3ejszpuceCPwk6E
 93HUSxbO0IPqPDtzk7Im1YPjBzdYezA8maXEokXUyJffk1eGg/zLYb7KdPqxtwIiJ1l/A6qSujx
 07kbKaHIXHBau761jBzlVta5QXUd9uz6CGrBrKgE+RDqkTnK7PcRXwr1W00rAOIcr5tu20DKUBO
 3BpQhua2i/Bh37Y+77Kp4aXDENr9Jk++T27AsotYFV5saNU3Zv8EqyDIeFVcp46o0LuN9yihEar
 2cZN8Y0phWgECMMg6c2bAzcgzPW0UCkIDeMV0LfkC5vt/g0hCa8EPZxwx7iEPcUp9E/umXCKGrS
 zLc4ZAfs20hOsbDyGVmTU2l4q0fZx801Rfz/fGBcgO1ALWuaWqq7clpxWrt6YOsHZCr0c7/fo3O
 ae7qhb9JVOh8QiLHmMw==
X-Proofpoint-ORIG-GUID: 9SQ_IrEy9JGySKS3gCTnJYluqALWXF_G
X-Authority-Analysis: v=2.4 cv=fZmdDUQF c=1 sm=1 tr=0 ts=69d8115c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cY3P7eX-TFPFg106ArYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 9SQ_IrEy9JGySKS3gCTnJYluqALWXF_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090192
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102547-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB0AA3CF993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update documentation for the RPMH clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 9690169baa46..3d5a4d3cb00f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
+      - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..2d62d5d0b08d 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_LN_BB_CLK4				27
+#define RPMH_LN_BB_CLK4_A			28
 
 #endif

-- 
2.34.1


