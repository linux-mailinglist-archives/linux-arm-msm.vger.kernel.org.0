Return-Path: <linux-arm-msm+bounces-98757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP3wGa72u2kQqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:14:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A02CBC0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFD7031C4372
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C773D413F;
	Thu, 19 Mar 2026 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ub1F0OvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRuL+ux8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76B73A1CE6
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925991; cv=none; b=QpBonO9gpyrJDbPGuILYDmCCcTBQ/z5XYlph01x4lnTMn3VuL7bosQi6hk/N12cxp1pYK9ougvPh3xRIpZpsNjUDyCtyjs02ASQ/gzSxkXFriPy/BhUly/9imrR5Z69TjHXr5EpBDDHFaqcynbh1JLq2G5alLd6FPwAtQDzzU/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925991; c=relaxed/simple;
	bh=Gf4FDhgmj1NlLjlZfra+jq2aSFIo2e2CUezDgfWKO/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/r9/qsMw88ZG4CB/ZnyHGMO7WSZkQZVlKkWDZMK+2DeSux3ebk+nMdy62asGe70mlIAUiooYJQebv2VCOFi7+PtBh0icv9t1sOmXEe32d21vSoDGTNP3zBPVSskIKnDJCv19mWE71KbSKm0TlS9P/3cTK2+BxXnan/xNEVHkzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub1F0OvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRuL+ux8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74AI01567796
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Trr1drIk6edG8UvbXd9UjXfqPOakCh62uE0dJzBQx7E=; b=Ub1F0OvNXJn3Y4RZ
	fISBNqtFQpdWczFUs7hZ3HozmgRdD5m6q+je0lfTJS5udJwH7FET9erUr5vxcYCf
	+XjqhxjphAAshbSakxrqCDZuLh1tMtLvNvranpdM1Y9dcErtIODH87lzKLjUwlJU
	FUGCkQgJkgevgsgl8HbiM3IhRvyCjPi+7klrvNpBYMblSE3ul4458WeBJjuW6XTu
	KPcipeltSshEeQXWKOw3vcKNwkwT7I7e8mpNX4UYndczu/n9IovfaKVPtaCYqaTg
	KvCBH/PEoNQWxaf8b5ukZgd4IAeTknddLBNLLF1RcawVb2RVblTaDX0frD1dM7gh
	oP3HSw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxhewa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:13:08 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94de7380eeeso9890078241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773925988; x=1774530788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Trr1drIk6edG8UvbXd9UjXfqPOakCh62uE0dJzBQx7E=;
        b=IRuL+ux8iKnPQvrmM09ZZqV5EWb8EylkZKHZguFo45/f+rYQyYwYKegKAg9nlS5SLa
         gB9Ovl/UkzbtSNAOkbx5rONfO5Zvkv+5biM7HoyRiajr84lR4vHZxq3EkyR0bAc6D0tl
         h2+1buM+/AqzLWyyHBDOF+q5hhYDDJGA4YbGe2n7gCUczhD/swu6HNFIXA32I8hlf+C9
         U31AO/UZgMZNvMsI0jWGhNjLx4JwMN1y0c31LyPMXIqHofhsiEyWE23i28QLtdje5vMF
         6l3875p4T0Zd3Ej4VHdzyveQ9ezQtgXGHV6tlpjafutQKbL3Px34rAYWmt/X5k4aqtbx
         w/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773925988; x=1774530788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Trr1drIk6edG8UvbXd9UjXfqPOakCh62uE0dJzBQx7E=;
        b=S2qdgCqUex44Ir/ko01foyAojzIfHmTzcyfzhfAq/SHas6aoxIOAN6hq3+WdHz69Vw
         4Eo/1KfCY6nE9rEryCy5Km6SIRSXtXblV7B5dNSECZ2zBk5ouWgM/vNZ+vpIkig8MyDD
         XxZX7UxC8FkDWz9w2OVXME1hfBScqVOozuGctWf4+J6tzH3DJUetfc4iCqHW7YZ1Pqh+
         HwlgxPBTw1cX8tDRMcEeSftBc7OiWAQ/3JSo7yIAWFf4EwjUvISs9BpCo18yPkfjZ3dk
         asgCar3C6e6cafPi+sBYqcrjy80xf2zM7JeYJO39lVyn/MG04bT4VqsAtArWhtXfS7bx
         Brdg==
X-Forwarded-Encrypted: i=1; AJvYcCWuwDiQrm+ONPegD3SYFN1HiEKAd3MxBTUJ8qv3A6DI/efzeDj3SZwPp1C92sAvbZW/0/PdCwZd0vPHuoan@vger.kernel.org
X-Gm-Message-State: AOJu0YzsLpHf7FZR/FXzMjuyqdt1azUYnT3nBJzquhws9t59oRwoQW40
	vWT0WMSqQ6vwpJ5ls7af/7utZWiu4Ao9xKzSEFrSboIsO+N8pLrgNEoEKYsWolG0s9NS35BSlxI
	hQKNq4oAtty4UNj4FHwCCo2hI+Re7eSVfGu3jcg2dthuv30cn9IOmpZBvpN5+LdGzRhHW
X-Gm-Gg: ATEYQzwhZ7E3AIozAmOwfrU1G0BpkXvPxpCoF26RIeFbbvIcFUuIG2QaH6TLJE80WO9
	e4bRJq+ojmWOliYxk61c8WkOCTMCRF2m+80peaBVsrYdrH6pB88cOtbWjYTLaFR92EjPNRJwvO5
	UbEBNmtYLWFcbZa/L9tvwZWg0xAP6HlNDE2oc85j+zv1V8h/VLjU+6kAhYUekWtkO7zMIDl4xmf
	pjMVAILMNJbvvXGkimsy/deTETYZT4I1Uj64FEujjNzantj9IiIWPhfeLEUj3n2WYda+XYOVXK9
	6n0tw38Zz6fUdkRct5esxV5x6ppn3p2+6Bu1NvNIa0kv+ajW3gk7PsQix/fC02OxG/ldreGsVzp
	TKzQEgTgLB6P2p5n/ga4tJONuKy8=
X-Received: by 2002:a05:6102:e0f:b0:5ee:a0e6:a9f4 with SMTP id ada2fe7eead31-6027d12e741mr3875758137.12.1773925987703;
        Thu, 19 Mar 2026 06:13:07 -0700 (PDT)
X-Received: by 2002:a05:6102:e0f:b0:5ee:a0e6:a9f4 with SMTP id ada2fe7eead31-6027d12e741mr3875747137.12.1773925987173;
        Thu, 19 Mar 2026 06:13:07 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518985f6sm17389469f8f.25.2026.03.19.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 06:13:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 15:12:46 +0200
Subject: [PATCH v5 2/2] arm64: dts: qcom: glymur-crd: Enable eDP display
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-dts-qcom-glymur-crd-add-edp-v5-2-5fc47061660c@oss.qualcomm.com>
References: <20260319-dts-qcom-glymur-crd-add-edp-v5-0-5fc47061660c@oss.qualcomm.com>
In-Reply-To: <20260319-dts-qcom-glymur-crd-add-edp-v5-0-5fc47061660c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EavZDMB/9zQnwaREM14cjG1xoJnC4RuUiEhwa1BFPA4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpu/ZbRgK3Em2OU3puIQQh7ivgyi6WgezHtzEpO
 EmXWJWeI1CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabv2WwAKCRAbX0TJAJUV
 VlSnD/9OxsFErrfi6xw1XObcsM84sRGh0PK4CsoaBL/o+nPIKlyQ7Bda8+o6soncR5w7dDuseWf
 mqBJ8dfyr5mgqbavSFdMemmN1i9I4XMS/MwqQoC9P3/7pnHu4iRDPv5S0PyIHBOzFppXTXmveaK
 kgQPXqWj7qCySAhh4Nlxnxs8z8SJ2daWCY5DaEwfifjwscEKqCggHv6/U5v6JZpvlheQx41XOXx
 bcafYBGYQGt6zmxatMW5IvKTj1QDdvtWBngnz8fJHT98ReipeMNMTgJXIf3EwardPrn7JqQRhuB
 HwW/xXdX0OJh63CUqP8Kcd9uMeM1eX4cXSh887xwpRSqiTW0vlqxVsOvU7OzQU62f6o2s8r6b13
 2V4ZY5mkmwZVzV+IncJREWH384H+/l/BkTFLipQuEWHUkL/Y0/qmOEdUgfLpCaNpfyx4PgxOmTl
 8HXHtYIqhaSt/p2ZjR8Schko21ad6bE5jm7POMmv8vZiSmpAOQKFSyMvTnsUdf5tkrtCe5Gv8P2
 GPSUWCc7SspGE2YbiUdeHZWD9wVx0Ta1yQ9cQlOCoSc75/3xXXc3jv3D4lp/HN9tEdjIfBJgLhb
 ORJBv369gwmC0oUkoDxPRomOrS6EooX/Js5UavFwYU0MVQV82TtDNLb4t6mffaxtYeZQFqGz8o9
 tuviT+8LhE6nSAA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMiBTYWx0ZWRfX04g2Ul+7asAS
 zxTfb0Nwro87OPjm8AwbgkbOOPUGQmr5h0UjcraVSnsoiksHEcWpjlGKfZNroAo0R1q0AV/3/Gs
 LMdbCIXBfWhOvywwyuwltdF98Zyo7naOKXr95nPXMMoA/IHUz7qmb6L1c0h7SKJr62YryPxUjR5
 W0g8RdTCI0PQIY36bOIJ/FjuOU8dC1CYzKtXyuBBfwMy+MbVa8+99hzPTE9vPhBrxad26AZWE2J
 kHZc24CW1AyczNLE1M+2kZhZC/9OJsL9KQchotxMSAxzZL/F5JOiGErBrrzaJEQm3tLfsveLMIb
 aKJ86twT0ER3xE9a+/Q1J6otemgv2aQvfOGgAURauvq8AggKNa9cmAX+yrbw2wPquxm+MxXtlLe
 cS/ETSEofjVOOJIeZBOgTlTuRsZcjQSaBFvaVBJEWPxADQLpn9pqPhiOTWNnoqH2PMc7PhGsPDh
 usmGtZPiVv/6iibOuag==
X-Proofpoint-GUID: QhPIP_rVndE4q5rFYYaNQUQMjmHDvEgm
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bbf664 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=68_4jy3stEaJOreQ4WQA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QhPIP_rVndE4q5rFYYaNQUQMjmHDvEgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-98757-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.47:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 055A02CBC0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abel Vesa <abel.vesa@linaro.org>

Enable the MDSS (Mobile Display SubSystem), the third DisplayPort
controller, and its PHY to drive the onboard eDP panel on the Glymur
CRD platform. Also describe the regulator supplying panel power.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index a7b30accbd1e..38cdcf662ba7 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -123,6 +123,22 @@ pmic_glink_ss_in1: endpoint {
 		};
 	};
 
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -460,6 +476,47 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna60cl08", "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -593,6 +650,20 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

-- 
2.48.1


