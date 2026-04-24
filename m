Return-Path: <linux-arm-msm+bounces-104397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E2RIpUr62keJgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:36:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F045B93C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94DFC301FA96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 08:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2F4386573;
	Fri, 24 Apr 2026 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1J9xkVw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kljc4D+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BDF386429
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019744; cv=none; b=hJUhiMl6MThFEnsZzZ7zYQzzB8zyb1JTBsDlExVOUTkcQ4hoLESARkHTsI4EKCpv7tdm0/0uL/D/4pf07g0Z9fLoorDXQTMEK7gx3n4DU5luYas/fPyNDvRWIHDzy/4spbPn2PCBIZCEVRqtWu85NyR71/FUHuj5YRztqOD7Gg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019744; c=relaxed/simple;
	bh=/J52INIEyqe3ryPTItKAe/xWhQ950uSYdgT3SblSQxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWnUgnKcd/ZIIHdsy/riCz/W14cPCH0S7jVG2fH9wMveazkaPWsdRMYz/D0tdQQO3SmlyYZPSb8YZIZoyfZNjXxBwS+GzvwuAfAuj8ELzgXlKF984IggVo8X8IusCekcLvwaCaZDIDQN/jkN6uGIJEYNz8YYxn2aZ2w0VfkVF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1J9xkVw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kljc4D+c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7Z2sc4167478
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mjPQuWLUUjcauUhnqzA5xqePzScAkWSzv6f2oIP6zs=; b=B1J9xkVwuSXnaanF
	PD9KeovKYT13cC/HBCwnHxXlAt0oXxKx97i7QUHy6PNdJ977io0TZxeRNZGbVcwh
	xwazTRnGl8/D2uN4PpEn8YCVjCCXTBkXNe6sFRhEH/Kv50ugjPuX2WeOo//GmrPx
	Yvc9rmL6pSQWw9IYp3WJ8oMtC01LO7bYxOBylLTGmK1quZSydeFhIX/xOOF+uPhZ
	JWp51aiGuYbztBvt8AEeHdxNUl74PMiSJgnzqnFXscCTd5sd342IEWTqzl/Ft7W0
	IA823mBwvSUBL/TojMXJOOpkZ7bDmvYYD/yNVYC5gLlkD7LsjYna1bLHmvweFAyl
	jEt6+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n09sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:35:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b249975139so140035045ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 01:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777019737; x=1777624537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mjPQuWLUUjcauUhnqzA5xqePzScAkWSzv6f2oIP6zs=;
        b=Kljc4D+cK545Qcke4H7go+UN9X75jlwX7HMPtcmgheRt4nmng2pVMhOs0aIuuOz03Q
         LZyCvdC5CWRMmRIYoqfALH6iGjOYHapVA+OA9WrsAPS+/QzG696QguKMzw8S5k4jl6TD
         2EIoVhDlX/1zLHLvXdciDx9JdayYxKhpC67xbCh6GuH+SACTxz8GNNX+Z9LJGxRFgtW2
         Vpo0Nh00U5wkgNgYNl1ut0l7Q2PB3q4kN2pM9UNzGWBqaNw12rtmVPh9iwDhn4u2ynMm
         0w0oNyjgEhXBauVULohdpBRKaSNG9Uel/wnZR3WHS78sOWXvwy2T4VSgqRSER+DFk6Rl
         Gj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019737; x=1777624537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+mjPQuWLUUjcauUhnqzA5xqePzScAkWSzv6f2oIP6zs=;
        b=EVt2oc3O/LXA1kAu1E9JOxZFKgMWm6V6juz5RBIPLpC1MQJ+Xi2QzAHr7W1/CvDwlK
         5qkB/fQY0sIUpgwoOtM5nqb9R6IYa9FcoROQztFqJmsXbnBXnpZ1ML2cJRvhEsJnFR4F
         czfRm5ZeFDIqIRO2skMMheovX356/kIvwRNVmom9IxdALEUOLFmNoGObSihIdylozhGu
         gKudR7K2mmQa1bThuHrMTm+VQpeFlajJ1xpT0u7fHP/bgQeyGjtPsqjEB7Bxw4IkJ/gq
         DhYXTnd5E8Wqo33/ehmm3rikgrPd6Ol1JIqEXdqs7gkSbdVCtiGF7mHPXLCtjXk2OGxa
         ctPA==
X-Forwarded-Encrypted: i=1; AFNElJ8KHcl7Jjk40b1YcMHJZWTY8Yp2XFewvBhKyOSJNUDTSdx0cUFnWn2dWO7JjRYjBQNtxLJgW1t3noe4Fm/O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/0X0btNjCJnmAozes6Mk4jJxlMzxqhM1cclqUOe5CJd/lxbU
	ue6pS/Ic46sCGDsoS8dCYXX0v9Aez9IEa+CZcQghi0pW31AVMr1Iu3Zo9tEiOrNOL27P5olAiQC
	qEOD2LSZSU3qqktwB776RL3su4MANwxieBe1doxtno34+GMYYwciVQdsxWo2g1MB5LpX+
X-Gm-Gg: AeBDieukJbmILSMSmc2sAE/TwAWzkuguKKPfV596FiCzF/TwcGoN5+QBjT8g/Dx9Li9
	XM+aq1wVKTishUm07U4OeDUGG//G2i0z6CzCc8O1BA+gspc2oHRf31ry5Bb8eb7FyGso+GrSjUU
	4caBx+AGSLd7f8k5HRrFwt1hV2JtehBPSPRpOTcnLijmuUQtJpNnzwThCR9E7C7A1FuTK83mV86
	7X8F280B6IVYwb8+W0DS58dd2AWV2OsCEqycSs3W5EE32+830smRN4tMkXU97xglfBYnJKHOtNi
	T10psR+ahqsqJxhzen3jFXPmW7YeCKj08XJ9Iv6EFiODUugC1BRgaVPT9cbpDESTbAA5cy5MFGk
	0aVtA1UqOJNbIhD163QaWRg65GbemsfcRXzlULpktU6iHG0f0+fzodyIvNA==
X-Received: by 2002:a17:902:9696:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2b5f9f7cec4mr224583535ad.21.1777019737432;
        Fri, 24 Apr 2026 01:35:37 -0700 (PDT)
X-Received: by 2002:a17:902:9696:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2b5f9f7cec4mr224583235ad.21.1777019736994;
        Fri, 24 Apr 2026 01:35:36 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3a929sm211389495ad.72.2026.04.24.01.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:35:36 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:05:08 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
In-Reply-To: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777019721; l=857;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=/J52INIEyqe3ryPTItKAe/xWhQ950uSYdgT3SblSQxs=;
 b=Iam1UBTwjoTN0q7XEEYTBVy65N/Q/4JjzJdgQf0MOZsFm5XLvYvex0fZBKQ1SAJnn0WIYAibx
 FXnpgKvI0pECDBo98CQisfZ3wpVWdEJiIVsL+Eq09rBjKENRFX6aafw
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: _t45it2z_d3OPYeWflemruOXMraqC0Jy
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb2b5a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XSQ5iGHSRndYU6rLgXUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: _t45it2z_d3OPYeWflemruOXMraqC0Jy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3OSBTYWx0ZWRfXx4tAnq5ZGwOi
 iMrjNxMMSRyKKxAwfuQEwCVLu9H8eoHMWxBa4AbNLjhHb7MgEsT2YfPUGIY64mlx8m5OQhmeA+A
 pHZ1MNaVZEDJOsm1HA2DXsWJvaOgU2VlTBSHU5wVMO8vAb9wy8gSLtDb8PfebCT3ptmRb/YGgoB
 k+OkIryRGWy1Yy9zQo5XHdSXFnASRNgVCEfn3Sm7dCtVkUUhx/4MLd9+t+EztVJe0RGH4/SCF3n
 1QSVaBKi97Fq7G4zjvFLB+d3SXnyhmCOLv/CnCcE+GhoXWw0lBWuZynvTv19F5W/UILZBAuNKZf
 AjQH5+HQAPWILMrpE+uwpsDmoHZMUr/oXsg0iyML0dgRdBBUOF2F7ebwTDcVdTGI+IjZcCw8s4v
 eVeiNAFo6KMsOlHbpfKy93eH3QhTNBKQHYyYEstcGdsOhTNUtI6blYjnr0iPRu4vJXkyg/Hwysg
 /dYNmOkKAS7UQJo3dYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240079
X-Rspamd-Queue-Id: 275F045B93C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104397-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,f10000:email,1f40000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Glymur has a True Random Number Generator, add the node with the correct
compatible set.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..64bbd5691229 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
 			status = "disabled";
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,glymur-trng", "qcom,trng";
+			reg = <0x0 0x010c3000 0x0 0x1000>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1


