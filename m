Return-Path: <linux-arm-msm+bounces-96586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIP4FRPur2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:10:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB06324928D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA34D3032882
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B802944CAE6;
	Tue, 10 Mar 2026 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJGGsq97";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XbeK9UJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD1F44D034
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137417; cv=none; b=hS6VE3DXY0xrvjkMBfDaljFRpz+5MnZ3wtYYkqRY4sDmanOTeUjucrB2CR/C7ftFu8pYqT3AZM0y3/qj+K+cdacUEnDYuP6CO70UXzMbNTtC1oGUE1E9O5nhdyL38WWldm3kOXt31Y74VJnvqgcDxr1xTTNH635mojjXnd5A+EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137417; c=relaxed/simple;
	bh=MN+fm0uRywa6RXCIvCjK+LurNcdN1vZke5SuQyvo40M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EC2mGXBga0wAcb0tj15Ow95eHQAM4GwUHuqHSzTVb4WE09R8Jmd1mMTdRzgruEOffWWfrrnno6FCp5Gd8y5T53OoKpm3HefUE55x3akXYFSjFnms8zAY7VXnKtLEs0Pv736OUvk1fvMfkpg9YVKKTJCsZUCtZD8NQtvUoWB2t1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJGGsq97; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XbeK9UJk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9D4xu247058
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brjZW2e1tXJtTUhkh2prRm9WANFehTFkS8Xva+sRvkk=; b=GJGGsq97Ok3p+h9Q
	4ePi4ftNoB+AZ9hpDmpB8Oq9UgxM/fZ7mVTwQPHDlxkDHVnLWQhGGBPBEVKFEGMv
	LQ1BuCsQsP42KnZuqYk/yFDvVOvh38+ReiXTfALxV6GHcZahdqiZTqXMzMm7+D+Q
	0yrElGfnKy7OC1sBqMsg+ApkkCp0sbxw/vV7kH5FfNsp+cUW3kA0tL/ydaiAtDkI
	LFBhOC3PWlC6GeizFSGUkJCGz+RCGH/KfRqjaC9aTUWLxo8dWyI1nfA14u1ZHrta
	1W+3JhJxcMrYiZSGdqGc/3iutdq6qvUYI2ZYcRZwi4aoByQgYlQQ4kfmHzd+q/Se
	iFsNzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8801xgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:10:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81506677so1303937885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137415; x=1773742215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brjZW2e1tXJtTUhkh2prRm9WANFehTFkS8Xva+sRvkk=;
        b=XbeK9UJkLZR0DDHoSF4Dbm4h7u3nGYBPDiPNxTC5l1JnD07WS0pqh2OBKMUyKANQIc
         euVYoYm2FUe0+WpIeP2FE0rbGRWyixxQDAJZzLPw2mq3tK33xKxQ0N4avR3weS3+r1j3
         K+PwY2CTvaVPiHqkIkwgc89UnEfS3BB0SuoQDYIso8eYqine9zz3X6eJgJVRJLedqLWy
         EGIGG9Wab8jEq/dbGyJ22fIrPxAjnIdfQ4bnYMDAlR4SwlcwNmUoo0tTlhDFdNo5iF1F
         KE/xwshyC9K30TJVGCQcvK0Uq6+P3WfqoAQO+VmXKTPDMjjrDntaXaQz3HV+XGIdV5LI
         qVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137415; x=1773742215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=brjZW2e1tXJtTUhkh2prRm9WANFehTFkS8Xva+sRvkk=;
        b=iKPNjAAuOZmgpjze0DmGPaUkR/AKxVP0bJfVedL9shDlaXHQpE4N4Pw1Usj+EsY5Zo
         bg02sW6Ff3ZJFU2IuDmAr1II0g9Ur0iwXWkv9hITAGK7YqbXuudYYiSk2bX09UcXB6g7
         9H7l9Nqmz/YWHcThZ+upmT4GIIO4aMDZJnO+i4s2SUWujyqDx5kZlT6oCqhqlfbCBMO5
         eM6DcPHB0YaH5KR9UlHLhcSbV5hdCjKp298taiEoe+xvUfCzowrTtRVuQLPOlgIojS3g
         a7hM9LLaMqdrRxq7DspJUzS6vhHUr4QG+AFvoXUaoOt2kG1IqD9VeX8aXkm397x4UqNr
         kYJQ==
X-Gm-Message-State: AOJu0YwDpBfmodM3gvEb2/sh/scE+VPHsO/sRkIHJBfXzpHdFJtzvnoq
	nacy42S6DivHrjQMB97ZgSJl7i5nD5BLstyLIw6MBW7Cgq3r4Nk0jNZdnRfBiTg47lCww+ykvOH
	3xxw+Kt1C0CO3h64d9VXhuobIrwXyMFXW0GknZmpOuAZSiutCRGtfVPm5d5aEnJygWZJz
X-Gm-Gg: ATEYQzzWjN+4xcGnv4jm/m18YsGvdh9IMRAzbKrDw/8UAcypS9rFO955EMbr9ujVpnY
	Lk09Oe0BNeN1wovf9YeKMaR951/SPCvIiiRuc6+s4dBsZshDu5StEXZUa9eJ58UWOvf3cZFqgPP
	KKQhGbSubodMWiUwFCpgbUvWQFSIP4K/7Pl5svlKIpDx4Dtva2sRuSuaGKJDPj0G3bEiZMHbaMh
	DTiAWlcsuZUKR3ZXcRmqj/lXAMnj/UmWrLXskGjRyo3iOe5M4/FwBOtCSGysxZlTtg4xiaNvKRs
	E6Vfr3rlYTVu0A+eMT+ZdNb5siRCtHooZZtbyT+uMrqWbFf8XEyvp7lspMCnq3sKiKiMQFRdx3s
	qpXa+/W6Wl8fCs4wdISQjakO4kxxqBfFyppHN2pojEAJi
X-Received: by 2002:a05:620a:1a9f:b0:8cd:99de:6b53 with SMTP id af79cd13be357-8cd99de6e32mr73805985a.57.1773137414863;
        Tue, 10 Mar 2026 03:10:14 -0700 (PDT)
X-Received: by 2002:a05:620a:1a9f:b0:8cd:99de:6b53 with SMTP id af79cd13be357-8cd99de6e32mr73801285a.57.1773137414182;
        Tue, 10 Mar 2026 03:10:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a7f182sm87703575e9.5.2026.03.10.03.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:10:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:09:49 +0100
Subject: [PATCH RESEND v4 2/4] arm64: dts: qcom: sm8750-mtp: Enable display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sm8750-display-dts-v4-2-d571a786bb70@oss.qualcomm.com>
References: <20260310-sm8750-display-dts-v4-0-d571a786bb70@oss.qualcomm.com>
In-Reply-To: <20260310-sm8750-display-dts-v4-0-d571a786bb70@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MN+fm0uRywa6RXCIvCjK+LurNcdN1vZke5SuQyvo40M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr+36V4Z4gPL2vMFUeM2iKLesBStPix5LsEJoE
 Cp26WvHvnSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/t+gAKCRDBN2bmhouD
 10kQD/90THNYeaXKFnReKDJSJNg1GG7y60fqQm2/PKUfey6u/g7dd+uRLyHy8HQT2nJgdDj7PgW
 c3PNzR+FzfUP9+t60Ndh5NVMqmZNH7UWdTCdBtO2J1ak6xTICFC5nUa01PBY8T92vnhtQ81tzz+
 CEQRYWIYsdBIVkTnm1oYvgc5vw2nd87zTKq1VlY0UaoGUu6RXXVR883iZkc5sSx2beOTRqV+Q3f
 roKje+NwI3dqeVAf5s0+2RJDC1VkOPCabJq2fc9kdfhqmhVUesKuVcanmJgot4Dh5uG8rfHz600
 bm4s+tO0gF5ldwUUS09jWkGxq/NcU1i3+4KM+4WGD/NLj/j39sWf94nUSX7oOCDQgjuIJxSSpse
 3nQGGs4l/K5OQwGticAdlvzyx/YE4MwheiXwwinm9hCAOAQLG9Tvm2qlY/FJfXehIKs+xtAWMb/
 Z67f1rYyJdyU+b5b9EyZx0rKc0U5MBGyHYrpMCEVVOj96eN/4/4+FhHo9+prbFeMLnrfO/0hbjo
 nhfI8xLxpwYv/fZkNtonTzVyew/u/MgAxUX3gCH6ZreZ1f2zmWwdoglw17Fm3gfRUNiQBD0xrDj
 XMwsUzCT63a/L/HD3Z7Z/36oOMm+FrB/FaD43PRa6OY4RQXdxDlGe9PJQG0nNG3MviUs9i56dlp
 Ow8/nmqOQOKwfAA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NyBTYWx0ZWRfX5RHZRzGiXSfS
 1PLBDzgyHrjDH520v9mMXu4tLNj6tKko2Z5KlwGyF6Vko2pXYU/a6HvHnHC5sHFlGBT/NcYLmn5
 21glV3If00ZFHe3sZ0Kbte1NxGV/OVAf7x03jzX5X1lgL/VIUKmXctP9lDicGFbiPhQDhv/PwZV
 A9vXIFmfrKpSzCoxdrmIXFkj+1UQZJebu/OG+//I3Zzyxo8yspVMFWM5G39nbascMlwc3Dap+tV
 LhbnkL4mxXHiu1yR80Mhr1sztLW8pLVvZadcjUAt4LKWYCmLP3htskBSsmtokomty/D5j9CR6Z0
 4Dxgk6s2W6FBx7Ld1TqYoJE2OOxyuosxKr5ytJMoTnBirFajh1Fv1g3hqijqpMwDA1dvCDqg7o5
 o06cYj4/fU3gB22w6EE8EZSh41oSoMQd2Q7fr2lSplirM+GM7sryI+NZyixy0bqhKKW101Dc96n
 po0l7v6CqACD+209QhA==
X-Proofpoint-GUID: KsaiMEKASPBVv4pxxI7EY8LDR9iCkbWK
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afee07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2EIfaDKYVuuEVWmasugA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KsaiMEKASPBVv4pxxI7EY8LDR9iCkbWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100087
X-Rspamd-Queue-Id: EB06324928D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96586-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable display on MTP8750 board with Novatek NT37801 panel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 63 +++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index cb718331496e..050a85df7358 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -937,6 +937,48 @@ &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l3i_0p88>;
+
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 
@@ -1225,6 +1267,27 @@ sdc2_card_det_n: sd-card-det-n-state {
 		bias-pull-up;
 	};
 
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.51.0


