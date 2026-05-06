Return-Path: <linux-arm-msm+bounces-106147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJo6NaRx+2kNbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:51:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7B34DE561
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 526ED300B194
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 16:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EA53EF0C0;
	Wed,  6 May 2026 16:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLbcff8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IqmwqOCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394244963AD
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 16:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086294; cv=none; b=IXPAYXXNZYzeUbi7kMzrgR1a/utII319x/Y2+9VeNScLJakrLJvBYS6sqIIIM0hWXkTYOXjwvTVVswOdEop2RJd7DAiR6eQn8fBJjLq1v7S4kDwHw3vFnt7PwRaaU6GkB1Ed+Glt2/B2jLuMxQyyXhpbdfYkzeXqaBh61egy940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086294; c=relaxed/simple;
	bh=9nb2DIEgS9/ifsDNV/nljVe+IP9/uJNJciMsi2kStis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MN/HArY2VjyeJ/JhnypldWUehi7UG4kVh50c8DDbJXoBlJDwYQkN4c0q2J73/H52BvB43lcOy5Z6t5o0x3Z0IXQUFLlSSWEIcdvKddctQeD+x28YO03BVYB/nGmaqbox1RgJisBeT2m1X83pzMR2pnravGMqcy12fom4rTTm1Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLbcff8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IqmwqOCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646GFIB31985534
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 16:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VBLVZuB0UsgPJBELr6HlVcHnxD6Ajqh3iC5M2T3ZrM=; b=TLbcff8b87ai4LlF
	ZukXEO8Z6sCEquzkQMnBtEcTaKLO0CA1SmqiCqF2G+8QpLAqSvLbsHPQHu9sA8m6
	aEZWT5jIVSVmTErptCwFr9BRloUzTW1Ku2yILEVCITTCMEXsq3Lq+rdxoz+oMIBN
	aZGbh9svErduaDVCfR6dmtOMDweI2bIbjDNsmhAfdwfeta78vh4kWidvE7lNv9Tf
	YUQW1aYcMYK58zEpwesYGnGSSbsSTP8HmZmik6ucagp/KgXIznUlmBg4H5+tsCp5
	1qss52avi3ooMP7vHpFfU5eGnpeq4qZe39VAxKaPkdi4PVArEv4W3du9xVXXCMR8
	fWL1rA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03gp1h4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 16:51:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1270dcd11c1so13522559c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086291; x=1778691091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VBLVZuB0UsgPJBELr6HlVcHnxD6Ajqh3iC5M2T3ZrM=;
        b=IqmwqOCUFIWakoyPWvCMc2gNVqkGvDXmKDetLAWE+ZOp91ZrS6yFOkYKB86dBGnH7b
         MmTCeC/cLlTy26cp6VCDs1H2T8haIL87hV1PMBLVcpG+CEhrfuOKGI13KyEB15cpOuuV
         qfXzuuzU33ME7LNjdTySBT5DXhlHYnCJwgZWfy0YFsAwQzR0X7K0yeNLUHv6ORUih6Nn
         6+3zM8Mw3H25Qu85qG+OszxtW5B6yyPMhlzw5X43NRh1Wx/1vFC0xJBgiIhxINkV+iXC
         maUMbjTjkaJqS8OirjcyBZ7sthBgJGsDrigBIoPzKU0v2ckjSkbxI3C91BcYSGdvyh6W
         pa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086291; x=1778691091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VBLVZuB0UsgPJBELr6HlVcHnxD6Ajqh3iC5M2T3ZrM=;
        b=L1/tzlyTLXaGPsXrqbck2ro6LumMXCOlK5f9N19g8xLY1BhfPxDMTIF7g+KSGG9NFP
         3W8EgYAHem+Flcp+8sfl6sQIIqQkUFSvdggVgslMXOCJ9MUaTMuDi6mp/1Ha9SWtQ5uV
         YS2b59AxMarV24bKbjgaOHhst0mUPwDxdmkIhXq3xR7hcsntVHx2oyJwEpUxP5k+rNqp
         Ky2KeIA8d3lP1VFUTN4cVVszzNcCHj5qEL66d3YsCRCfmtNdblxS7zn2v1oBehi8dcv2
         x4myVha7vOLIafYPcMwgCxpLBbCkKBDERXhVJHkbsZve/PlWNTJsTIyKu9WOd4tIvQEg
         DLEA==
X-Gm-Message-State: AOJu0YxKJ/RxUjywZWYzipSb1ZqsUWkcS7WvMVn/mjrqxV4oGvD9JJ++
	WANwyABQChc7OueaqRAZILiN0UlsfdTqZUDso8Gg6fZKKYGC+E1H3Yo0Cjonfw6iPg7AdIfU7Yr
	626DlbDuWkJgnB6ZVaICeROCah+jVLRp6cekBxkdycnKabk52ZKQhpEKWa3IxbNlHcxm6gok0GE
	83
X-Gm-Gg: AeBDieuMJnNWv4WEiX/la4MJhPjMwDAOQ9vX44AYHJ59qjvVLRLMD/Ysjo+MYFgGkym
	ihleUG308qa9OhpPVO+UUQL0rbCfk+ALZeFh8/07kYF+oI43T9i4h7GUAUafSCKV5+UTigj9gkO
	kKBmWSiVbCQyDQBMNjyd+6VgmrSAMiI1mQjHm9bAqtr/uxoGgnq7CehRy7sakvnjR2vKgANCHb+
	KMQF+bxH/FXIG0dxPO7mFahAw4T0IFTbIYJjnuefIMLK6XfJ3Vvc7ZW32OUUuCxoseJ2qpLvuK+
	ANDLVidKkwbQnyNt3cISEb/4a+OjtH2r0C063RykBpOygk2io7hGOM7bs3hRd052lusEnFnesk3
	dF4ebykqQdC0J3jdzxYKN7aql4pOvz1q88mXcXIw5GL4xDHZjyrP39Rl05uhOpVjTLX2DQb/G/Z
	fngOoFLJGPA5Q=
X-Received: by 2002:a05:7022:fa8:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-1319d14d67dmr2296658c88.29.1778086291211;
        Wed, 06 May 2026 09:51:31 -0700 (PDT)
X-Received: by 2002:a05:7022:fa8:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-1319d14d67dmr2296622c88.29.1778086290651;
        Wed, 06 May 2026 09:51:30 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:30 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:40 -0700
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-1-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=1375;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=9nb2DIEgS9/ifsDNV/nljVe+IP9/uJNJciMsi2kStis=;
 b=cilCmQQeP71NThlAZoUGUm6R2LgngpsgVb/+EOZgaxEDE+wtaaLqw72LPz7peLPIP2VE/u7I4
 5pCYIaUFnmwCksuaZk0YEKVb0SlvaUqqliGwBGfBQQhlm8xxzvHu1gx
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX5Xch4q6Dfr2r
 2IjYDX7EyqnIe1QuShU6Pce/K92xKllUhZkcVsTMUpHonfO8udTJTfYia0IEyx31edWTQV4AotQ
 VT5PLVpHDROx09h4L4htVhtVBHTwqYni4UbQbFNBiRXbY+ph24SeD8vQZgjU044kN1Htv9hqCgD
 cv04lV5+PGva67eSyN4jkCugnEc8iJDpm3hmyQ5L4LnVSJgYr1jAvWH9gGmsWmMing+5m6LYx0o
 yu+np4voFHm0HNr4GyUAmNm9UAD9KOvmpVea0cjzyBMddSlXOah7b25gG+worv4tTONSTLW4iDp
 476+4zwxJPRKjQC/FHlhFPSkVySF8+CHwH+dkejy/kqWESVZ7a1IzjyrsdkeA1p16PGnELww8yw
 +NaPL2Mz1DcXE5VngtZOnoFoa0WmjcgBBMU2PSloDzioWYUNenfSSbBJyhD7uAH6WBvbyogMCn5
 52Jka07FwJAefZiVf4A==
X-Proofpoint-ORIG-GUID: Nk6viD9ZgIlXRIR3xrWUbPTdpluCd0HO
X-Proofpoint-GUID: Nk6viD9ZgIlXRIR3xrWUbPTdpluCd0HO
X-Authority-Analysis: v=2.4 cv=W8wIkxWk c=1 sm=1 tr=0 ts=69fb7194 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cY3P7eX-TFPFg106ArYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060164
X-Rspamd-Queue-Id: 7D7B34DE561
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106147-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Update documentation for the RPMH clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a2c404a57981..d344b3386042 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
+      - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,nord-rpmh-clk
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


