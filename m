Return-Path: <linux-arm-msm+bounces-112989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aGVUCYwQLWreaQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 10:10:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE32A67E150
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 10:10:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=adQ4F85P;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="TfPGd1x/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112989-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112989-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24ECE31104D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 08:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A843976BB;
	Sat, 13 Jun 2026 08:10:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A660D3C0A09
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338206; cv=none; b=GZ87NV+eHRBDNXdcCY/TOEX71yMYqq4y4NkRL3ym98G9wrIOMYGBIvlBTWXclG19Mfrcqijf0hc2DcmbLrQCrS1ISf1yX54hF2Qeu+yFdVpGZXnZAv24VXA5t3W1GcV9fKNsZTUMh7hYOk//it7H5W9kk7DPgktmMk7+bhVS3Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338206; c=relaxed/simple;
	bh=3gcQvO6URUblpRlaDNmQdOqJ/hNHJt0MF+bk1vQImxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COv1hD73dCphDJ2w7HsFo7UWA9tdRS4vbWb/PrGGxZIR9ZRpB0YnuQubCixR3EhCl7aHNfkQJFKgSVLn2cORKp/AkBbQG5/e9/gLMrkdVN8kJss3Vh2/bu0lUQplkkrC/92xUedWq3LV5T3cJ/5fwfT7Fh4dd1/NBJ+acL7P6Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adQ4F85P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfPGd1x/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6edFj1665938
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LEWBBLVWeF633hmViG6HO6TJwIIb9K67/3RPaXRjrj0=; b=adQ4F85PvHGxFySG
	YUPtywRgU48sqJxIoFW1IRhHiq8Pg+GRTt24whjoEWIvZjZE1I0lOoE19MIsR+mJ
	3heyzcW9EcNee9gRWV7kE8saA/+S0GwdOFIvpSg9+BdN/Rumi7JZ3pcueqzjORUK
	kYV3ypBlVOwXVNDhAdnYIdB6oMeGLIBdyObJ72d6szVGjXofH3EhVN7CGVBUB+Ew
	PcgFzkIFZk2ePzcWtz37gTCaANSk6bxA2ue4Ay7djfxWwT9ud5nJ+mFSqEha1CTI
	xLGs46tEq3XJoXYjItTEHSJ6cvj+ZFZSoYU55yUcDrA79Ue6foim67b8Nw/uHexr
	Um/Y1A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybrerh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c858e0cbc89so931862a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 01:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781338204; x=1781943004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEWBBLVWeF633hmViG6HO6TJwIIb9K67/3RPaXRjrj0=;
        b=TfPGd1x/KyIVYSjgM8zVOfu9oFdqGFqiyIXVXKzcrwJclr8B4YcOXoQF44jxbQ/TbN
         a8Pw30BgNTjDwX4YSD6yoOCFZzA9fARh1SIAX4rjDP/dKgrLSEEGXX8RxaROGBVy9slH
         E6nkV06T5GDbqN3StW3Ye/OPcDCBUAhaAH8QU1Nn/efIPPxLSJSJiQ1OoGUi/mU1ohA/
         nwrP4goMUlhfJj7SIRsdOHmPMF7QZ8HhMChW0rPeP4Ug0zmcCsXPAzUsCSctmpG/oKT8
         XShm+agK905jI4sjutZ34FfZiH9uWDdV3GCU3x7DOPqrFCKdX/8NCQ71G9Y8hdEntBZ6
         naFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338204; x=1781943004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LEWBBLVWeF633hmViG6HO6TJwIIb9K67/3RPaXRjrj0=;
        b=XDPad1wQvWneyUANVQTy7jQpLcM7GIsyNf7TYEUiFFZy6rzjoANad7lue8yJwJJAVq
         20/SSB9ibjRNnfjIIGfk0QJdGnCt3RLscHcvu7rd7KsRGfC7Qm3x2qkOh25TJJ4t1nIX
         P91m8ELwbD+IWCDFO/YaTVgn9tigAV+Tq/ugMND73voKFKl8NR/KZ6f9lUCa+7Q/6VVZ
         hNTv02S6VUoSDGuewqs07zII0qDNNt5A7WG2i6YC/3E3KjUnxxurHXIOHAoxRkrKHK6k
         YU+JgRapm+zyidjJFAPLzcrFVn2BjYBY++5eJy1rkcPqqB3BXtb5LO+rmQ5/gzzvU19i
         J82w==
X-Gm-Message-State: AOJu0YyQmnfZQSwiu4bLF/cI1wJvW1I+u9GX3fQc4+LCiXgiptTYSxps
	bahhgu/ZHE2cccSily6T38XV2GYkQhErn/9eRizeShWbxis9HGrzIqbYVHazj53AofcAPLM4eZX
	PK3ki4FUPIM0GkGowL98JnrRMMcDOwnhKdceKcdhP51guIcg/XLrn3Or+INT2oH+Cyqg/r9EfT1
	lF
X-Gm-Gg: Acq92OESFDQLZg0E00HH/zc9nw6byuCt/HrOhAAc+Vt5/hPaxszEFLOIb74MZx5Iywl
	EsqWXV6zKjVsaRX4sysdf/fWWJvtxtyEumtUIkqMi2Iu61hwD7X8h7VKw8OZQMQ+aVx1gnJrEj1
	WArJjGA56ypnenF1E2ecbMnN0S2S/g81R9uUbloaCalHFL3DrGxqSggwTXJbfR6pCIBcOGTlROb
	3cUVRt3jzDHBlbwGfBsOxWoFzJJj2S/Y/Rbw8Xd7UBjWD9HFzIUz08bqQN/Ap6qhav5AtB/NCLa
	S3FqQgHnBb3RuhBZdAJyQ7A4PXSpwzhSnJvHi5ACucy2ah4APzJ0I/mxDbCR9S8vjVUZQ+TIuIi
	FE+twjaFmAtaE3xuqUrv0vftWOBvY5Abj3ZfVGvdK
X-Received: by 2002:a05:6a21:2986:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3b783b691e4mr7354083637.10.1781338204284;
        Sat, 13 Jun 2026 01:10:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:2986:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3b783b691e4mr7354062637.10.1781338203810;
        Sat, 13 Jun 2026 01:10:03 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc5esm3926647b3a.10.2026.06.13.01.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:10:02 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 13:39:22 +0530
Subject: [PATCH 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-shikra_adc_support-v1-2-57d5e6c7f47d@oss.qualcomm.com>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
In-Reply-To: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781338189; l=998;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=3gcQvO6URUblpRlaDNmQdOqJ/hNHJt0MF+bk1vQImxc=;
 b=aV0QJbDobp2IYDehkJyJtSg1Ctf4JryFPIS/Pl4OU2sJJfEm2YRxvFXOrs1oOHbe7DqzfrS5f
 pmAZ4SoAwJZADQWoounMiWfhuqK95bIO3yzuoBLVJIEBinKYs/SzzeP
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: Gnjj-66u6Uu52QXSedXI2giRoSzo_yvQ
X-Proofpoint-ORIG-GUID: Gnjj-66u6Uu52QXSedXI2giRoSzo_yvQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfXzn9MsHLR16EA
 ONzJBbotDOSx7wX9Hw9BCkNa4qfR9s2N0xG2xfVF+ftXR9u84ss7j3m4r8v0xC/CrGdMybTjcPT
 n+uxWzD1hBN2MU5opm9L1oK+pooJkwA=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2d105c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mLxU5NzZ_ghZt6E7eFwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX7f7VBtUG5Gjq
 OVxl2TrSBauRRHdYbxM6gMkVbq8mJaW2f6FQTHjKRut3ZyrtjhVYjfIWz+AP8KrCEYAmtoLJYW3
 SyYQUMas20/i7pEH5GD6q4oDdQmb2L8UWtREFw1IOGFKawSW1LQTrwtRnjoDWyCoxYVLF4FL2St
 xpihjNRGI26KaoOl2Qp1LnbsUodL/e9bjxzAU+XdGlmAnFnsZCpRemugIlM/Wu9JEWdQ6MZE+vb
 4XsVYUfa7C/SsiR/6UjI+eEfXQ6U9Tj4zHqExprzaaLp48aatWz4QvRdtIYqVN6KXxNec2jqYA5
 D3OCYdY+EHXeCt3jlHpopwca+D5lWQKazPQcvsYzfVeVUei24kSDCmxjdlTzq4hV/ouePeYDXMV
 cjWl2692zzoBcghoDhU4HHwpZIJZRvCVT9JRAbFpo0DblQJpu/Yoe/Qrxecl/Gwj4qKuNUIE72R
 9/tUsAuHuH7/hYj8DfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112989-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE32A67E150

Add temperature alarm node, used for PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index 0f0ab2da8305..180809a0ee73 100644
--- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
@@ -11,6 +11,14 @@ pm8005_lsid0: pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8005_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+			status = "disabled";
+		};
+
 		pm8005_gpios: gpio@c000 {
 			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

-- 
2.43.0


