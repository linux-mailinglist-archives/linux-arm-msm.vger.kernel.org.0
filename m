Return-Path: <linux-arm-msm+bounces-107091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKiwHvEdA2pD0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:32:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E3520312
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99490309FE3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 12:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2D94D98F7;
	Tue, 12 May 2026 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjsQ9jzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpYXHTcA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D09D44E053
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588838; cv=none; b=nAXdGeQaWJ2R3Qlh1E1RHEj5dOEZdNYO/T1LsIqp8OinF/qUcVBjSW8zJ/f5XIMmFjDx3PwyjzOK+VsSxCmJK442B8vVr4f/Hv5uHRKXobDXECoMEHUPylbtn/FQUEcbgqUuJFAZbhyCEUJbwQJ9BC4rKVrrKeMk+BkY17L6wQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588838; c=relaxed/simple;
	bh=SYawB/oHyzHo0cUYfJOla16FUwI8AATcR1vypiFsAR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GUXR63JizzWkxuI0bl8AhFKHhVjH0kcCUupF/RtIYt+ja/8qee/E4WYGzpfJSawoNmTuAIKjVxI/q8mgMJDQ2OSm8lnXWYdi5WQN/SZrXZsZDo7zV5nqqPnavNY1Mk1MWM6t+DZnDT9dYip3gwN+jSMOyQL12hkNbyppvtco11k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjsQ9jzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpYXHTcA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBcjFg075221
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2jR3WdNN8lbkGVLk2yqKjvm8WRSUmssFSsLXBgfWFE=; b=GjsQ9jzkhZTzN/nB
	9R5Oci0a/qLJZgX8QVCPapVlvS8uRAycQo9Wi/JdkVsG6N1/gPEKpvHTD+5ixVci
	Kenm2csDnxd2mWgJG2fHjCQ/Axv4/NE/RzAvYp4aISCu+TXeQJJH3yzQNA4+X74m
	/Ztx23vdBul4OyDJdAyfPNO9NntPEf4DmW58wz/W9wRuET9DQmo4W0tBRy4h7MQe
	Je0h/kbbM7gTqUPM2PENtKbgGa0gOQ1IobpQY24yq8Q1PaHpK0AAFJBhntetmm8w
	yFaN+PDnzEECo/BBK7uaGMxr61Z37jKcec0Ck/aMUWr1g5/nK4bMmOczVPKP8Tup
	b2XF5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43gyg87g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:27:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso35690061cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 05:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588825; x=1779193625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2jR3WdNN8lbkGVLk2yqKjvm8WRSUmssFSsLXBgfWFE=;
        b=dpYXHTcAG//8XUiFOB6f55VhcIPPrWTgqD5PpjbSlOIplZGpN7RSvAEknSjXA9/U6N
         GONCWh8ESheis5PUctYF1thHJd6sCQCR/a/XLd9X1NYFbV7D7leZ3JL2wCdZtwdAlhYM
         fNq9Ey8okqkcLaSU2ISAH3eJeh2YZAsY6NePT6CvemqVLBjvjt/weFht8oWcuW9xiJrI
         /N8cfuJlc2cGdrfqw58iFwMPyYZ6MUr+Yufx9aJXKrcP0pHp4KO6eVqK8leZ+wMuXnOF
         CoTw+wFHGLqMrW/yF1cWN+wuXT0ClCurFs2Exey4menFTeF6uXtVQiUNnUMQgdNIhunB
         izOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588825; x=1779193625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m2jR3WdNN8lbkGVLk2yqKjvm8WRSUmssFSsLXBgfWFE=;
        b=CdXkv6ImP10MAGeXbmhBbpNefFHTB+m+uECqUYhVPw4KDPrUUldEhU63KbODMZwRCE
         HmO7RcT+6HxLMiYeDpT+iY263kfqAJlr1DhGKuBrD0CDCXahsBEX8cmbKizf5Ys/OcN4
         yMDf8Tu7EokMd6A9H9AV657YHxB3zm84QykgK1S6xyBr6hfmzSc0aR+exMJyzjmkjY4z
         SMhRSNh5dBmQ2qaoc0gjBOpww+Jff3r5lZVM6Xfj02Snn7e5a1z1qXv4uUXM/l4HxUbm
         WmXLEvCcZVHFyVNHIk2Ym+Qz7i1lib2seebdJS3NgkU4hZ/vS0BYKLBYahMxhfocAYnD
         9NEA==
X-Gm-Message-State: AOJu0YzJw5vgVq37oclR4tl2Yh3517D94ltAs2fzvkwwJsK874hWsE5c
	2L+2qj+ZqHQTfq/SdjCpFE9lCA3bVwwdGvAS2qupNXP5e8hmlzDO7sgb9YqKVyDUvB6//Xw3gxT
	oVY1AGepFWczJ8YQPy4sZkcq51lD9xxo5i0BTq3YZrnSnkXE9vpMJE/Yjo6NKuiYg5ocsRsK28x
	CF
X-Gm-Gg: Acq92OFsOv86aQxer2VecYnq59V7Cwu+tWcIoWx8oBTyOAWRPz6TemepkT2xJLxDO83
	7MJ6Jyf2X7Z3UmcnbUTHzPjO1ra04yhdcdywjNZF6HpL0qdjwGeKxj3O9mDEwzseC3BdN7Okauq
	UX3pUuQw8qlAv1YWkH2mJ1pfeSqcU88AtIuiyKtQgxkk0X54D+Mg8jyBSKCBxuGKJvFYg5CZUNc
	iHQeR5fbRqZfIWMHiyDKQbHmXFHXaMBgHFziZM041mpjU/fNL9nquHmB5/ODzVXhn+R07ZThklb
	OQh13JGMUgTR/JOL2V0O75TdEYJF6g7trE2/qc5ytkt0C3Z18ivuEVqeSh2FHtd8r7hOLDuOLqv
	nDxvmc44IOMtFbfL7f3YS7SJZjXleDw==
X-Received: by 2002:a05:622a:1196:b0:50f:c2d5:3154 with SMTP id d75a77b69052e-51461fc41c3mr357566361cf.42.1778588825119;
        Tue, 12 May 2026 05:27:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:50f:c2d5:3154 with SMTP id d75a77b69052e-51461fc41c3mr357565981cf.42.1778588824503;
        Tue, 12 May 2026 05:27:04 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e90681760sm43089135e9.12.2026.05.12.05.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:27:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:26:49 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
In-Reply-To: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SYawB/oHyzHo0cUYfJOla16FUwI8AATcR1vypiFsAR8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxyPPO+uZGWc95tyV15VZTT37p3z26p6g9XJ8
 3m/7PVGlkSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMcjwAKCRAbX0TJAJUV
 VlVtD/oCXYS/2kbD4Z+sctVs9RxzydrLUDtKQvX9HBOATUjp8cFzcQIG7jT/0QwrtkrT3lTrwpQ
 cG2Xn272KlEnf0q+dAPOA6RDbz1Lr2D+OJ7K4KEOp0hB6W08khkDmw7G19cPD6JCI7F/QDZe5KI
 cb2QB4CVA7dZ4j9V6cGLtch3wrkuFNxlLQ7GRf47TDrARvmnktk5k45nHXM/rX5nJ/XMP9bNUOM
 M36FAq+UstAd7ZBBdLbGeaBMvK9B/RJa1GyCwP5e6hIQA00Wr6gW+bSoFd1zWhT4zXFMMX9dAxP
 NdPl3ncnUGF6jghdfJPaQvCVshfy/FeW/o9y7ETpELcFbwG6MWneM8N12VYW/ZxOV09r29uk2MR
 PsA8VSUmBRsjfM5Tjkq/Xg6AOcSqMyDjOZxVWN2uQOx8k0Uc0Z0jy9nFx2XUNQQIuTkMl3cFLEz
 mHMOtiY+JDWLtBid3/CGXNTCPBhbY5mv+lkVvm7hyy8UV/ZNU3ERx+KR4MP88lOzAtKj8vlQAxe
 AOWQkXWjDDdTkVUh8luJbwJkOztLZzqAIcUTbBv5ESNuUr5RZvxRRMRYC2cyFfYwSoRTs110Mm1
 tm8OCkkhSglsbtm4qBzoJmcxol5PCKhHEUfYtE1wcQ7kVG+iGsrBa18Q0/Po5HVLEkIozMAJQPI
 oqQAiF3AeDfUxcw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=fMAJG5ae c=1 sm=1 tr=0 ts=6a031c9a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XerPLwBTpPCFuubScswA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Iku02QuBG6gujDIv-W6mnsIuAA44s6iu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyOSBTYWx0ZWRfX1djNmPZCoEM1
 eNqw+Kyzr1V2CtrSPIVQ/VJnDsl3aeid5jDcxZ74GniwRciAG0F4MhVzq0KyRNf+I5637q0/ge+
 9T0QhHEJ/HuqkFzsUYhLJBSQ/Pvc4cnxZbwAi8rLpmMr11e3KiSOQ6ywXSxW6WHjFUsQzJ9NEbX
 YsdsSqu9NW+GE21aOyOlh/dPuOixtJtik9RVasUzgttw5CT2zq5ITyn4mj5xtG572F/fwE5xAlx
 DdIrYvG4CwUXqUkD4dc9xk0XTO4pUg3KTRgGhnjibHQ5iz9/y2oqmwGbAP2tEAr78YlWCwciSZw
 QymNR8MPa0r/NA9wDuk88Zdmnw59dK+N8UYCDLnlu0WVbwoJoPJWGgljgi5xUqo1G27NSMlLgec
 esfC7q2v4OY/s4CxcEF/XxrOhfmYMV97OH5lV2cW7GjJcyK2EugbGzcjXyY5L5mq8B8pdoLV7MU
 vbGC/jxfXmSocFYC8hQ==
X-Proofpoint-GUID: Iku02QuBG6gujDIv-W6mnsIuAA44s6iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120129
X-Rspamd-Queue-Id: DA0E3520312
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.1:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107091-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
routed through an eUSB2 repeater provided by the PM7750BA PMIC.

Describe the port and repeater, and enable the USB controller and PHYs.

Also specify the ADSP firmware and enable the remoteproc.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 90f629800cb0..3e41c95edb28 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -6,9 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "eliza.dtsi"
 
+#include "pm7550ba-eliza.dtsi"
+
 / {
 	model = "Qualcomm Technologies, Inc. Eliza MTP";
 	compatible = "qcom,eliza-mtp", "qcom,eliza";
@@ -54,6 +57,44 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,eliza-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -376,6 +417,18 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
@@ -405,3 +458,31 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g>;
+	vdda-pll-supply = <&vreg_l7k>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l7k>;
+	vdda12-supply = <&vreg_l4b>;
+
+	phys = <&pm7550ba_eusb2_repeater>;
+
+	status = "okay";
+};

-- 
2.54.0


