Return-Path: <linux-arm-msm+bounces-105109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJNYGFGI8WnNhgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:25:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C607848F302
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 824A23054BA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79C138F923;
	Wed, 29 Apr 2026 04:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyIZ9I4N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lbr4whqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4023338D686
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436607; cv=none; b=MjfffzNWFrmzLjulQ/Dc6hWDVwUj8Ny6NPG3INZXKEL1JVaN6E+LsQbp3BSa1V4/PJ8totQFyvP7R8/vtyQtvsCPxqsroLRa2soS3PaoPIDt+nZjjiQ7Q4fzhBOZYmUeGUlJJXsNN/k+NalassZnqX+RGYqMy9AYwZHpG5KbnoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436607; c=relaxed/simple;
	bh=alFv/kzGEzm5wFtVA/LSPYMgVGkfYBsM6dzteSkR6Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AGfAeu3QLAAWPH0tohbYs+7WHJVguNdxD3yow8UPQfw4xq8fQxX7D9pBiMnCuGHgJ4Ryc/9bZJQHMQPXmgtcolUu9PA0SZZTm8wFEV5DRlIyumJRWGE/DLKc1Z4DB278ja4L0bEB9Z2zNZdlH7MgIhENjbDINCNyuSK8xSSmAx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyIZ9I4N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lbr4whqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2gQ6Q3183925
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFkJP6SekQvPpwgvevR94ADvSmAgAcnOvXqYXDyrcmQ=; b=LyIZ9I4NNuGJTxE4
	zo3v/XAJDkWAAtiYWIcfToGlIMpJoaDq44q5oo4CDVbL8cDu8yAz138hmtfwj/BJ
	ti3WFHKJIk4bd4DCMmDiluA5H/pLrF/ZQwLskQJoYx9DV6LVNh4mi/z3ThAz6v3W
	MiLMt2b4IvHWBpy7s465JaJSCP3KzoMpyzH7P+Oc7CVhK3fdrE6kc87hjas60bCu
	Ytvtxp77prh4AYfaU2mW+UuIOfpwUdnyLcJlaJvTxd/xvx4IiiWla/RFeNcDPXzq
	Dj2xmJ0bFqbANyhbM2CmT3E12Xy9sbfjULHIXx6S4u29zcLPPZCJu+xfEqSBc0LO
	bcR7xg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em08s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso8005053b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436605; x=1778041405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFkJP6SekQvPpwgvevR94ADvSmAgAcnOvXqYXDyrcmQ=;
        b=Lbr4whqwOfiaxaqSlfLFwfVpvqZ+9x+2tJr93QdXKuvxt7eCRgm9i8z5LET8aKLAyn
         AByNep9ylzmcNJgFDLrnNL+pPTwm6lEX+4vjwFVt+Xmf5XjADDyhFshmx0sUKXBTOXCg
         YHgc+j39kyuG3Y9eannu+KRpqRbz3temKRVbnWckbCCObGaLi2lZjXsuzc0glMsNrXfp
         y0YWGh5DhjCRkqIy+czT5ujqeqzH1JiNvdbT6lWzvtrNi+YCXaOqeIelzB9QGVpiSDyh
         JNsw3L+/Ec1bAJt+356LujvZaH+rN/h0NSkC6rnDy0zZbmjmxA34OeYvHPoV7W6lU2uo
         zdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436605; x=1778041405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FFkJP6SekQvPpwgvevR94ADvSmAgAcnOvXqYXDyrcmQ=;
        b=JMdfst9dKAl8CmaXX5FG8DGkgXuoG5/3nO8qfPSRUuzCGJ+b/TBfw6NnA7LpC+Tv8P
         9LB7RmUKwC/SVKbRfQoXBLM7fmgEsTGwIoG6KnwRrcxNENWFAwI8Sit0xiTgb4R6qKi2
         raqh1GKdjp4XrlO6hfjZ7u1O8U/6cG8AgNQJ1vrXPdaryrW/uMUNqVDjiZ528vP482Ym
         Egre6bepEIb292xC4V01JkHVuee6RaGcjGsHY2o8OlE8e9YBOlQZoxCzY1/zYQTUB6Aj
         xjWrMJPTE79EXhB2wvi7qJT7WMbLijO4xdy/nvoeR8DGrupTCZ4d94nk44ypJJBRt4iI
         tu2A==
X-Gm-Message-State: AOJu0Yy7HcDYm7C+6cO/uKJlga1qimeV74Ha8i1fDDyziA1dNCMwCMXF
	MKw6/nu8QmMwAR3ceFXJyVUVJFGh9VyA03OqCWdJn9KT7BH7XP26aEAE6nEGYjmeRnSq7IGygsD
	8OxwIV5gxyR9I0S6R3xiq8XSTy6594ztEsLuzzxFJh2PpO90fveRfcfoZn8YEwGd8br56
X-Gm-Gg: AeBDiesHJ2A9vpcuL70gsxT/hb9N8As1oLsV+l+QGkMY95t26dzTZh22kxZ+vki2fcj
	cSdH0UsuS/SfPNG5e+stlLKAhRg3s6kuJA9ju/ilSq5RlUfcV8cIECrHBuNryHl+OK0JTWTR8Ts
	mdFT3SVVhrm0R+QKmnL4cPOroHBGqpiUddAWU7Fpes+NJn3SMaphhZaeeKy6QpzY7Yj/+aYjRo1
	WBVuuU/z0ghv2049+FZTjEMHYX8oDpChKjkEYZr67BbIf2x4kiKMMzkgZEQKQu4ZHSLSUNE2Gpl
	cmHZk+RLVriL8cR05E0ZbCzNpQT5kKuFo3OiDQS6A+G8VvmNho9wIxTZFMP1z7zs99ZsxuQgUY0
	MCaZkNj+2+xpBwGjPgkuOghlVlj+9ZGYX8POOdR/dajKGdUNleqz0RXvCCCPs7XpYK1kc
X-Received: by 2002:a05:6a00:1ad1:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-834ddbecc0bmr6058987b3a.32.1777436605066;
        Tue, 28 Apr 2026 21:23:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ad1:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-834ddbecc0bmr6058958b3a.32.1777436604581;
        Tue, 28 Apr 2026 21:23:24 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:23:24 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:52:46 +0530
Subject: [PATCH v4 7/7] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v4-7-73fb1bab03ba@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=1402;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=alFv/kzGEzm5wFtVA/LSPYMgVGkfYBsM6dzteSkR6Qc=;
 b=JSUzYGfmnr859ObtZcII/Ah/uduTCRkZQGanPtCqi4M5+Rhyxpjcg67FHkuWXU+oO2hglv4pA
 LTmBpzkNkSMDgwc2ZSk8qU//OIGGJ7/rOtt5QJOGTuGeKLPlYpCRz1y
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f187bd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=va74t0jcI0ebB8ul8YAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: w-SjnSMg4-M52HXqzh3hYDj1NkfChjpe
X-Proofpoint-GUID: w-SjnSMg4-M52HXqzh3hYDj1NkfChjpe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfXwoTTXrN0E+hy
 iUTVRUJTRtg47sAKnCIaqSnkLiJgVvGOSavNhpHrzI39lF5aOx26NfC9NlOcuZKicsj79csHjMq
 1GOWw5PVtFdtMy/Mdh7vHxEQnhSMrPuu+upJqgTRCjF2xlKg9QMD6YM6uqyHjU/B3iPn3XPeYqE
 bj5/td0qVf5lxQ+83n6YnIHJiYmhydc0R9/xNvQwunaZbj0kZbW0KJOwIVbjOpQOQr7wB67yADq
 //gUjhgMRScwYHlfJ0D4pOUAPVZDgDwxr1tEg0F4Xwe6QOF4HbeeB9r0dq4uDbEuogl8admQMAY
 ygNYgW6wTuvw69cdGOVgRT/uZM0J53CFMdXmOEFzXdd2ZStebAq1d0L8vJsHloZSZ65f/gjAAMP
 42nEZC+qoGJ8OQ5DgwwL4k+xxJCH6iYAsKFNweARAUFJkXddwUQz71BkZZiqwiwVbybQ11Jj16n
 /4Q4suoH1uBHQMaMGqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290038
X-Rspamd-Queue-Id: C607848F302
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-105109-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[88dc000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without this path, the interconnect framework cannot
correctly vote for the bandwidth required by QSPI DMA data transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..7515d982b38e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2864,9 +2864,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&config_noc SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7180_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1


