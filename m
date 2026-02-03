Return-Path: <linux-arm-msm+bounces-91600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLa0N8SQgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:08:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6FFD5038
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D330E3028792
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F74A37474D;
	Tue,  3 Feb 2026 06:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wv7wBMOq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imslsuDu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5FC36D516
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770098806; cv=none; b=X+60dX1kkb9uZihLhNONS9esGBqGwtGANJxC8bi45IcO9MhEixn+n3vh9LmtocbwgAUNrMGCHCzaAr+rYQ/5TcWuyjsNzuVuZTY51rxfdJY9GRey0PdtsQZM/0OhijEc0zUEb5b9IAiTIq6U3s5cpGjqPOPzTXamYRh45TsN0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770098806; c=relaxed/simple;
	bh=zSgUbhxM+1v2t0vUuHsTMcJ+1ZgGak0JkArlZ55Mm+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESSjF7eLqJw+YSC/UuC/22/e7SE1DSwn8PlCs+3q6rYtD+o2k2i+g6ISnCu5JoQ1ushqB+R07OUG4tFekreXko7flS7tYCAD7MwMq+G2wNlTiVxqiiqWv9BKRsRShL6KG5Xaq6YRp+z2DYVbfW1m70G3BVJkxFBh1P0eiaZzcmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wv7wBMOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imslsuDu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134ZtlE092361
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkCGCTiCHMVR/mguRwnUT83l5wSIslUVZ2Xb2/EK8Yo=; b=Wv7wBMOqtwCDNKr2
	OsokMonk/uRlADUlB8ZH3KFBvYSqAwYyXIEjldJiDTIZNIgoB5I8QNlpz8UHVOGj
	n8m8c/IbRNSdlEWAJ+QodBl5/HZ2YiU8nWMYK8b6f+SiPc/SFvLP3Wd7x71Bnd0z
	+6F7cWDmwA4aiuTcCV3X8M+SqS5VrpJzouCZ70gfKJnQvGf9NYVFkMeq2FvFqmaI
	kRjRCAExbPdaDHfxKpXSjiRfmf9KjTMRL+Jb/ZbDOj4VTlC6dANWaeuXa413o6Tu
	GrdYjEU+t/UUPt3aiprwI7/rm52plkcuUSBgc2UFf4WD+0QSr4D3ydDOuhMfr8xi
	27mlxw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbk318-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:06:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b708fa4093so15632739eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770098801; x=1770703601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkCGCTiCHMVR/mguRwnUT83l5wSIslUVZ2Xb2/EK8Yo=;
        b=imslsuDuWrUoSCXxE78UUBynsr9tGF1HFlaHNhz3C74787wUUM2+/u5L/YbQ7CQVzs
         8I7FiUEnKHI/VsTcGzSZ5jCHt4OpsiGpkgLZOMjVzFkghJ3HeXhi89VrLH4GLytaVjFR
         hXsRLDWxMmyP4RmIa727kdazfE4MxBcbkr/dzYpF+kTNO4zWB7tl7NBL3RYMRXrSXgwd
         35wc6GUYNCCYw5cjMLwpI94Tvz72tHgkxUYywKGgbcqIAxxKBlK94oW6hZcPRG4kUehf
         zj2fnidup+P9So7GBw0ofS/ctIBYXGG+ZzW0VJ26kuMM6KW1Dnaizjkh7OkD0rfO1x4a
         fsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770098801; x=1770703601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hkCGCTiCHMVR/mguRwnUT83l5wSIslUVZ2Xb2/EK8Yo=;
        b=Bus7Hm6P9DuA95Er4wwBxbDFgsKmtRFEHrZZVdgBgRUNrfVs1sjxperFyYpGHSzfaa
         ceYl6ptcyGVSFusqX+xJT0Jh6kf7Vk6GnEORDVkytBbUvciBVzxj/xjhaJC98AFpxsf+
         dhj1LqtIs4zmzmupBxl3ikU0ysLo3uuYRWIUfhmyrUx3yo0woxWUj+HsY+YOEGogHJbo
         Tdnce4/XtqNnS4Kpf+pi2gTyr9ST4jUQXgv6vYQ9IyIm7v493LF3RWAr8dvZx1N8X2Au
         Sg+eJhJXdgo+v2gw0qIsiklr0mqzKW9OW3cl9qs2Ih8xGE7YyDNwyZ80qdpmT+WCdg+u
         gZ9w==
X-Forwarded-Encrypted: i=1; AJvYcCXfHv4WgxY06wl4YcUtqi4zyPT8zGkim2RGeYxzOi0Yf5mmfMtVZY5LXSgVaII9n8tB5FpS+sNOwpNxffTd@vger.kernel.org
X-Gm-Message-State: AOJu0YwzHiqxZSCSfbiumzhI1z4kYOCOtz/6fRsZiD+XJkeTHd/Wvr2K
	JqcNFiNKR7qN3SJCd+sGjEO2zVexoa89hI/+8xKZVK/JPhmPROAvh4EK6gpCPCStGS0lpJ4LgVT
	IrQ4AbJZuIXH8gDYuy4IK17iwbu6P/ecX2KyVi2R0RmVUyJNZrFaXzGps7Xx3LumFrAUE
X-Gm-Gg: AZuq6aLw8cwAScTT6O03L9SfIz+v8Wf3J+18QbMyVUSTCrpFASzFsW0J7yp7vwaXZPy
	OsUaK5xqhFoq3vgGyjPLIMBmQ4+jvYYcJXht6YieuoFVoSYcb4ii4DsY4RiKQp83uFS8uKmcNjc
	nl7dMlqWaQ2LExlkkbdVWSQIBrmQEu5zm3a+hZtoTKQBP9mQy7UxRJFH6rG6agdw604NmJtWz4m
	ZwcLuA46JsF8uQJZyzY/+b8BNnlonLshHaxKSBfyc6lyzX3MRE1ueii0wjP9TnuYdegEgZ13Mmq
	RlUQcDDenBnHW5yyX7SAN3wD4qtiRzfE/HI2Cb/WsOSjJhhWjBR2b9bgA7FFBNHMbjC/nZrBgtp
	gRgt5JpZ37z6uAJEnpnZCAlGIi1VovxmbyXHEkiMph7ie4NwIAwxGEPfFtfuV
X-Received: by 2002:a05:7301:2f95:b0:2ae:56dc:eb18 with SMTP id 5a478bee46e88-2b7c88da46dmr7309867eec.21.1770098801263;
        Mon, 02 Feb 2026 22:06:41 -0800 (PST)
X-Received: by 2002:a05:7301:2f95:b0:2ae:56dc:eb18 with SMTP id 5a478bee46e88-2b7c88da46dmr7309845eec.21.1770098800756;
        Mon, 02 Feb 2026 22:06:40 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8283def01sm417499eec.34.2026.02.02.22.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:06:40 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 22:06:26 -0800
Subject: [PATCH v5 09/10] arm64: dts: qcom: kaanapali: Add support for MM
 clock controllers for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-knp-dts-misc-v5-9-02de82bf9901@oss.qualcomm.com>
References: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
In-Reply-To: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770098787; l=4559;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=V8klYJcTlCA0XXPc7b6wczy0KpOL9nFdZCIXVz7dVR8=;
 b=FKKu39p50DwCp0ka35XVW2kfs65wOudb7bNZhS2NB7BqFTW6s/K6lfOyY99F3hXL0WS/P29g4
 62OObZZ1szPBD9mU1qwtgKuRd2Mb/N14tkPvHflXQp43OGSdY01sSPY
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: zym8DKaNKQSkG_PdoglTye9zColtavU1
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=69819072 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y3HLYP14RHR0fgYgac8A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: zym8DKaNKQSkG_PdoglTye9zColtavU1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NyBTYWx0ZWRfX46/SNPxtNj0S
 kZ13u0k5c82BybZDNrxLHwBJWI/3yiZ9Y+Q81/lpXMIK5Nd6xavLMa3Jc/lXoAqM4YDMFP5BJCV
 y8d0aIjaVJ9U+Ef6xH2y2wuiRSYi7MI0WuDAR5VTEDBbDtNwLp9jvnDcRNZCqLnmFf2gKdM2Een
 WJyJZiUSuCdu5bfbVxXHRyP1WLgdp7M4xwOVKJohWZq7q2XW1u38JC30hHvCbVxjkj1Y1Q0tSJx
 75hhlZudA49y011n9A22DlFowi5XYIw8l6xLdKjB8y90MQujkHoxtvUw4b2c1awh7bHgWzZ4bCq
 FGqXQny7Z1P68qDWQW1/RftinI0H04Gjk/AjnniW+khGixYgGtSa9kMydByq6pop938glkxGFsF
 Hy5Wcb/CD2LnXSj83BbfdulNayh/3KWzxTVTX/KOTV3eXfjG8/jKOBQ2MtZgtGg6hwIVYYxq27O
 6mUFaFKsj74/6okFuYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030047
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
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-91600-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1fc0000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,b220000:email,0.103.194.128:email,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,16e0000:email,9ba2000:email,20f0000:email,0.27.41.32:email,0.26.219.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B6FFD5038
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, dispcc, videocc, gpucc and gxclkctl).

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 111 ++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 050d47691f5c..08d098c1f5af 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3,7 +3,13 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
 #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gpucc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
+#include <dt-bindings/clock/qcom,kaanapali-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -1557,6 +1563,24 @@ aggre_noc: interconnect@16e0000 {
 				 <&rpmhcc RPMH_IPA_CLK>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,kaanapali-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x8000>;
+
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,kaanapali-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5b800>;
@@ -2532,6 +2556,46 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		videocc: clock-controller@20f0000 {
+			compatible = "qcom,kaanapali-videocc";
+			reg = <0x0 0x020f0000 0x0 0x10000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,kaanapali-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_GMXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,kaanapali-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;
@@ -3073,6 +3137,53 @@ opp-202000000 {
 			};
 		};
 
+		camcc: clock-controller@956d000 {
+			compatible = "qcom,kaanapali-camcc";
+			reg = <0x0 0x0956d000 0x0 0x80000>;
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@9ba2000 {
+			compatible = "qcom,kaanapali-dispcc";
+			reg = <0x0 0x09ba2000 0x0 0x20000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&gcc GCC_DISP_AHB_CLK>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>,

-- 
2.25.1


