Return-Path: <linux-arm-msm+bounces-104792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOq0LBGj72kcDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:55:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BAE477F23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A1E130103A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315013E639F;
	Mon, 27 Apr 2026 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYwaI8nU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MP2KIFDF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD2E364EA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312469; cv=none; b=SXMqurwJSpTrWLtj1v78MKS1tOjnyyCIwdMhHTvUh938vmwYNSS/xtb3iG76KgqFNeRtH54lcV60Dtx4v9uVnxvaKi+dtmVnArrjbPNfttXhLgz6x/7Cszpd/qn/60MLTScqEYjSQIGF6E2wW8TErTj83LHazgA7gB40GfwkOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312469; c=relaxed/simple;
	bh=H7uhZ+16HWzdzWJwbCsCrputCbUs3rrvqkdvxVwe2AA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aEqPN/lkCdKDOkxvJzubXc4UWeqPSuLyaoQVQb4lk47Znvnp+idiI8Zsfq3eCDJBSKU9fis+kRBpCoAWdD/Me9jDzMz8KUFyPcO+TsHfD2YuhhRJ6aasUCd1cvvtBfngHRGP7zPl3QW3Di3O9UsLJBOqvMLwllWQlcY8uPr4Z3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYwaI8nU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MP2KIFDF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDxZ6g2913806
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/Ww0CqGEY4qW1eMzLhFoFo
	sf8SrTRYdwf/vxYE8ysHE=; b=AYwaI8nU2GnyZcnSl6yjWkBNjzesuhiRRSz+Tp
	sy7u09dZGClrSzOuG46D5KlXhtsxrZ7kvRtz4nAXQCl3/Gdw+IwT2skoRKxbwzJS
	NFs/MCg5T3g+3or0JCvM2U6T/jX2ecBIxAVXF1B+1Fm0U2Klqybc+p2695ylQF9P
	8z8McoMh9ebh3SfTVJRr6v25KydnWS+P+odeckuQuew+2d0f3WNn7CJR0Xr7NWlw
	esNW3fQ+XsLlEaeAx9CtqNBi4GCctpVOU0WIcPb9cnWKDebgpkATSzqZvfkvHztP
	0gGhfJtotfdkID7Icf2pdXNRAJOtB/4ZqqmOlou7fthoR+fA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xjq83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:54:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b7c2ee830aso64297065ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777312466; x=1777917266; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ww0CqGEY4qW1eMzLhFoFosf8SrTRYdwf/vxYE8ysHE=;
        b=MP2KIFDFdOALBCYy5NtGqNg0j61aBMOeNRzSqaOUep7tFyCC5QuMlJHOrZ05AZoMjI
         r9ZYEbEqn04ILjimBT3ADz8upmQhTYh+iL++7oZ/PeH9UQlh/A+XgJQ/wd1EHHJGnFTy
         ji2Aea1omxr7GP4/FT3UxZUWgsm96y89Tnm44AMha2zyjPsVooUtuVzLc5KKh648NWYG
         diPp1e3Ch2ILmEfBUHAw1Jf5KwzeN2mtaPCZRMaWLcu0MEqRqxQtoT49MvKRGWiAskoS
         f/XwDfxUnj6QhzoJPRVKUs8LPyAlKosznwki5ohKuvIJlcwnwtdN2AI2aKBOu7kmHvS4
         ucDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312466; x=1777917266;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ww0CqGEY4qW1eMzLhFoFosf8SrTRYdwf/vxYE8ysHE=;
        b=WMJnPiR5rPJ2uhIJw3ggxVGRp0ammx5BeRdjoXEKOp7qdxZ7UVNaQcDjT5GwSr2fcj
         CPuesxMG83mZy+ikiPmMM55v0dVIN+Hjflz084qqOw0Gt+ksbmRkYBhl8JYD4ktLpURH
         vTl8u1Q03kwHarlacJldJTSVQ1RRJc155dmtoko4IzhSdFd8fa5NaQijkHyiieUjDMN+
         VF7EGE7/UsQMWP8NnJ85H37xzNTPSAkmk0id3gcKBeZSJM9p/sDdqAH7790UN6CaJ52r
         jYdSDqRfKT5wvPF0zCCZQhervqYEW057pD11QjheibPbhYJAjMMOx9BgL05uDG6TfqJ8
         YsFw==
X-Gm-Message-State: AOJu0Yza6wwpxnvA/MI0trNSlDD/Xat5/YV2Io1omX6liXtIYMO/jvRZ
	Fu9tCKj4HzDt3HvOUI67hDY8/8gm5o/KhUwFtzuKtuCPjdUouXYxSi608/2y02lmFigG8MivRWx
	JNLTZWDxmL0dJkH91SjQyG0RKwNiQJKU0Td3SWTPVIVde/D8jHgBJ8qtMAJ2NIBPdDlUh
X-Gm-Gg: AeBDievvdcKMSN/UWQWWpbQh540anL3nBy9MbQe+a6vgheA2ZZrnkqXJSf46gKuqlmv
	iBuYjT4TpPylmX4Wny7VHl8F5tR+WcblZof2rlCyczRfH/CCMRAIcfhVmww5oJqYdF8oamqKrx/
	P6ia1G3MWXXlNfi45Nb/at07bFPPBCXwCnq5FRrOvDQGAfzfFGsQI+nJuAesm51KbZlnueh8sR4
	NO1RmXKY3nBoDBkWHp/CkEoIsHd73n8CkFYovoLTtD2/oZeqYmzYne9dlGZxDjVsJWqTc3NIQZP
	GONYTyuPz1rs8jk7RA3sLYeLRg8Tg14LVIGUqvVXRGT0UDdA0XBX5HyHs4BYz6bxEmLfjIil0hp
	JBGgYSf+Ay4+ZZ/ZC0Zcil2dUta23WkthjjpjVJJbA0Zix9eYjflOzRXT
X-Received: by 2002:a17:903:3c24:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2b97a8a5a11mr2509575ad.9.1777312465875;
        Mon, 27 Apr 2026 10:54:25 -0700 (PDT)
X-Received: by 2002:a17:903:3c24:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2b97a8a5a11mr2509365ad.9.1777312465405;
        Mon, 27 Apr 2026 10:54:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa7b60esm1016955ad.17.2026.04.27.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:54:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:23:53 +0530
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable Adreno X1-85 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-hamoa-evt-gpu-v1-1-5434b5be76f5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALCi72kC/zXMwQqDMBCE4VeRPXchBmnBVyke0jjRPSSxSRRBf
 HdDpcd/YL6DMpIgU98clLBJlhhqtI+G7GzCBJaxNmmln6rTL56Nj4axFZ6WlUcY1SrVOWdB9bM
 kONl/3nu4O+G7VrbcI31MBtvovZS+CdgL/2kazvMCHcVcZpAAAAA=
X-Change-ID: 20260427-hamoa-evt-gpu-dea01004ffce
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777312461; l=946;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=7ol0WW21RWyziuHQd+8/Be8+w8BvvdhRkpEfn1Y+6fs=;
 b=hRCWXmL33c20KJt4rH5nUkjyMAdV2XALOPdfdeI+ma8u+mTMvoKFaquYq9/v8czRYniGONFgV
 27GHCAydJVpD6uCyc0kpeyP8TKOyEhe1fsIcvAPvetByHLBTWXR+Izp
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: w5URgu5K-PSuGOwt4mJITzk50OsWVO2G
X-Proofpoint-ORIG-GUID: w5URgu5K-PSuGOwt4mJITzk50OsWVO2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5MCBTYWx0ZWRfX9j4RiWr1rcyw
 R49sS5g4OCoc5PEROXXdKIuiDGcmBv5OwuXaXXUlsxMGAZyBZVeqE1WGrizt0p7FJIsQRPjCzg5
 qVbFoL0w2OCSaQhlq+j32EiZFglpVpiPxSkMWIc3fs5JtlQeVJ8lTsBjGe2QDxzxjeVbpap0UpO
 4TYmBiP0/GI8olslnW9jDL8nOU+/YmjMcEaeBjTRVjF7qF8gz/CbO5nbWo4TXS6wNG6OoWq+Aoa
 LX3u9cvH+tDu+kx3h4UlVF9/6ynS7impOHgfFKiw3yUR0Vhyxv/NKmpcjsAVXKpgpSDqVXldai4
 lbHvfk1TFxtPg8IIFsrqaNTyztuXcFPOAAWj/3i2YfuSlKyDOHOHvy5bbWHUI3zt7QLWkj/+sWu
 j9LRRuMq7u0Ix2bdMIVR22g0g1tJijS1PkOwgeK01Koy7wJzCyAxyjWPaLFeNbNP6Xl8smdr68O
 OE+YhmjVSVAT2gpM3jA==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69efa2d2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270190
X-Rspamd-Queue-Id: 52BAE477F23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104792-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Enable GPU for hamoa-iot-evk platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..b2a2538747f5 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -729,6 +729,14 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	status = "okay";

---
base-commit: 6ffbce0fdf09f89d4f970301f6ce6d6d88d9393c
change-id: 20260427-hamoa-evt-gpu-dea01004ffce

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


