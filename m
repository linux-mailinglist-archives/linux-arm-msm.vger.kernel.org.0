Return-Path: <linux-arm-msm+bounces-93301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH2RBbrxlWlTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:07:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD5B15814F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DDFA300C012
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203AF22D4DC;
	Wed, 18 Feb 2026 17:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dL08YxIV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHYuM1BT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65AE342144
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434369; cv=none; b=h2DU20iPYHsJRiVV4+pIevUUEdp7KoHUnCekJtxWeFBmcxIKWcWZ/uaO0YTYQFHG/wTFQeGjbEY6sIrkGMGgkLzKTT0ogbxkwnBAt7HouvWAdnqNTYpxBdVqMo3reLA+ODQElEbhdn5XcDBr3jW8JGa2RP6J+CCcTrotBMVUV5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434369; c=relaxed/simple;
	bh=eNUPHACdGvd5iZVpi/2IdeMGbrdFYD389Fy9diCrOeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvZXW+y9/YatXemt0clILJZ7LTPzlI1XWKeUzcbDhWIbAgI4jxkiG/Q8jrktSry7EVD6jzm6M4tCb6tP8d+y7E9vggvrpRsU1GDk5+l4/xXfsSWq3esARVNHxw7CQr/y7TxpjZ2wn5xFQsr9tuRBUf3G15FVv4170fMGv13bd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dL08YxIV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHYuM1BT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IBRnXh413993
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQUYPq3PZR5/JyJtJ7GKTj5OPFi9JWPmB+7kOkJngY0=; b=dL08YxIVggQOpOOn
	WCdkNXRkz8YHOLrBOjDkBT5aH/5AdxHvHjOZbgbpZ6jOPEzfmlj+H8f1H0dc6nxy
	m7JcRjrHg1ytltM8BzX30P5Fp0SARSSX0vsGQdEs5gx81IkjY6QlmzTf5RcKpLrL
	MsKuK7/s080xrqLxZjMRdDR/Ct9vWlDoafxUgnpHgXkkuEAzS7VAhZrJBrvWjomB
	HOInSuhlJSsoyOvOz8CXEO1sBOFfLp6w8kXngIV6RWJk0ThmzFJt6P06FaSIqxJY
	PBHIM1BGM0h+My2k7fdK03v7AL5adqw5esH+i+rhM7vtJNrFcOn1jk1r59F8O3V0
	Z0tjCQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1q6tfpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso1469285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771434366; x=1772039166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQUYPq3PZR5/JyJtJ7GKTj5OPFi9JWPmB+7kOkJngY0=;
        b=YHYuM1BT5tMg/bUAOHmf/onejK3iP+2QzWhF1gRWB+moKwcFO7PnCYf1CsG50mCq18
         YkqdFUq1rxR7JmIt6XovvSRiZ6QiIWy/X55yV6+hQV+UKEgHKcPL7mfLVzRdJ3z5LQE9
         ZZsItK91JRv8H3BSgcDfZZTRGWy6pmCJxIE3Y+PzWMqcC4zukqooqUO1I3YVQ2xgL8BR
         /kavjpqMg/jJPBH6z5i754ZhfNrvjJNDVDRmsKTtoMXIotx+W38cxOneEkTJJ/ck5o0y
         /cIuyaKeYZCUIVq32adRnbeQKurU3+edqhOznevCJ2FqP/KS+gOFU0m2RhaU1S56Ln5c
         XlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434366; x=1772039166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EQUYPq3PZR5/JyJtJ7GKTj5OPFi9JWPmB+7kOkJngY0=;
        b=uUkumCG6kLkJana/I/KqnrH7bhzd5JaYj7W+KQRYXt5VmntCZFGJbpZ7blGHNAu7v7
         iabtg8LzNC4HX4gYyWCdX2jnMoVGe9yhAruzUIG0f+xgsbZyCqehn0NeZs2TX/TeAjT4
         pdkGr0VDv06hszZ09aa/pyu68eEmSHwz7sdX0yew8ykbCmfJwXPMWFga2ztTwTmi7i8H
         PeNOkiiEGtxt22NyOYZVqYffQedhjVV/jlHYUm1BhLDoTjbeDg6wihQPFCqfM7xyL28Z
         bUZu8YK/uSkuq/7lbm1HW8THpCkqfC3xk90RHlpbCNPcGUL0ZNoxABkd7MixIWWTCyOK
         tPgw==
X-Gm-Message-State: AOJu0YzPMlWc6eL3EA3u7W5zTdXgiDey8hbAJ8ZTa4nMx5loWEkkdnFS
	aCvZXdr6rTmZnYT25QqzSMmTfGN+C1xIEqETTckES52+9yTOMM6UN6TIl27gGa6OdLciknuVbTi
	PN1A/odx9n/AYREig8j42JvdazLALHFsW+B0u6iU6gb7cwgJmgXyGLolIPsV8+Q43S2DI
X-Gm-Gg: AZuq6aJ52Xz+WrXkSklwg2ZJDYOmw8bY2qqwMyw72gmIywgBhNRAqFrILGrKwC3exot
	Ilk5CaNUiRPspQB+5hlheYFPlpOUB31ZoTI96qlOUtpcwV4CKj1ig+jZO8asFy1Lrrxk4sth2Wu
	PazDmZjdz3cMLOL7XhN+S4t8d5CyG5ZyEucxgCkNVqBBvkB4QVr8w0PK/+crmEuL3of3oqq4HLM
	uStGYiadkA/79Eq4rI3wsnVDSplkpfkHHeZT44sXJList5yQZ/I9wudfhcT2U9Azl9neUSczwhS
	GekBIn22gyeamPybdQCyOdbEws7AC1vR+dGDtXPz0yShbFrGsK6g1fUI1u2xZ8k31Pio1bQgoqk
	Rs0vcanwkFxPVZOeUS++TsNUByycaKUMm6BjBmitBypiChA==
X-Received: by 2002:a05:620a:c4d:b0:8c9:f8e5:9efd with SMTP id af79cd13be357-8cb740a674amr285004985a.55.1771434365884;
        Wed, 18 Feb 2026 09:06:05 -0800 (PST)
X-Received: by 2002:a05:620a:c4d:b0:8c9:f8e5:9efd with SMTP id af79cd13be357-8cb740a674amr284998185a.55.1771434365294;
        Wed, 18 Feb 2026 09:06:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm482188845e9.4.2026.02.18.09.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:06:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 18:05:44 +0100
Subject: [PATCH v4 3/4] arm64: dts: qcom: sm8750-mtp: Enable USB headset
 and Type-C accessory mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-sm8750-display-dts-v4-3-1743e9848864@oss.qualcomm.com>
References: <20260218-sm8750-display-dts-v4-0-1743e9848864@oss.qualcomm.com>
In-Reply-To: <20260218-sm8750-display-dts-v4-0-1743e9848864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eNUPHACdGvd5iZVpi/2IdeMGbrdFYD389Fy9diCrOeI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplfFyrd7ln5jH2rf9jeCKViMpfUBDbZq83d29Y
 r8BWgyIdTqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZXxcgAKCRDBN2bmhouD
 10F/D/41Cl1mVkiiQ2ACyS9t6y92bHGzUCQh583MIDuinzKI3jOHB0WCumdmFJu+h3h3fOpsX1N
 PEQ3yUJOqdPWutoy1UFqThBMv64oo6Yy2Pp1JG/d4QfBrW3Z+0VvlrruuqCVLdw8ZepxuJHtOQw
 w9gaOaLqiyp+hvx5R6mJAh/mBTqJ30nirMUcKJIZeWluXYmboVlgYFzoCJ10oNIsbfZ1tjri+L3
 1Ae7JjuClmYCIvOfUlgDWWiBv3yELxfXOQp7vL75euKM7ZswbznBSELfQ8YsdlVkw/vX2xjZtmH
 rDekSkPJbbNRwS9/DbbrtyPDgHOkuG3ns+NO8inTSgDDgDPBFtBzvBT4M70YssPStJUy4Np83M/
 +hAOn94gPM5r72J9f8yv17ADwsNWuj1SbNgdRuHo9N4Qu2FcyKtGKSAD8xqzi96hIRaLQV+VTGo
 YzeJ+gVgY9OSclNNTk99MLUxEa4KcWzDj1Fao+mHJm8lS++Y4ycnw0HWoN1s5z+BskdYQsNT78Q
 443A7hlIahVTwZNOMKzyvWUpctOBha3p76+MvzgapT6iHFkKhIeobvrVA9gk56ClyVF7grgXdYk
 kGVRI75p6DkSKqhZ9RPTLsJyZNdfVb86hxyJmct1BSpKVWHWecT+JbNuEHhHkSe7qU/vmu2kwFo
 wWdB4iRF2n1YTug==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=K60v3iWI c=1 sm=1 tr=0 ts=6995f17f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XOJNJb2f72dwbY1LfMsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Wh7DID_X-LYNTYSUpju2ryUEvXDchRwj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0NiBTYWx0ZWRfX+A0Stp4SfvoT
 +nzFnr7E2AAa3A6adxplX3AmlO6l5hFR0caRtS4vom+jabQ1ZyDWHW4Q7qM2n3jxUkSAgh+YALN
 uq4438dOsV5G9lgJPm1uQYJ/8REJ1/nWMkzraQnvavL3CfWws6NqQk9Gh1EpP9JP+w2j9ku+i0v
 c/cDtsMZf6cR7nZWv1SD/C6VkyOkclf8d7O+cxXZ5p0imJRAXudR1N3XuBLNbcCra/jptozv+ZO
 N3BCaUlsGxA19EaySgeRqnZxyYR9IqLhGJyxhBJyM1WybLLlO9v/CrkFPCG2PoysaoAPLGzOYO9
 /gLscUHVO7ZTkejFtpIWcGhDjr5ckZlWiln5nIJnjFV+vYtfdgxiSg1HtYVirn77KS4t5l9SgjC
 0TvfL8P2SAeS06Qvam5dKLhak8NgOqgm6fimVdUEEnqL54HXY0Hmge1hdT3CWA8uutptIXuMLPA
 urQuGAGNNYhAB4wX63w==
X-Proofpoint-ORIG-GUID: Wh7DID_X-LYNTYSUpju2ryUEvXDchRwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93301-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,e:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DD5B15814F
X-Rspamd-Action: no action

MTP8750 does not have audio jack connected and relies on USB mux
(WCD9395).  Add necessary nodes for proper audio headset support along
with USB Type-C accessory mode and orientation.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 51 +++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 050a85df7358..6107a4ed2c80 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -54,6 +54,15 @@ wcd939x: audio-codec {
 		vdd-px-supply = <&vreg_l2i_1p2>;
 
 		#sound-dai-cells = <1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			wcd_codec_headset_in: endpoint {
+				remote-endpoint = <&wcd_usbss_headset_out>;
+			};
+		};
 	};
 
 	chosen {
@@ -230,6 +239,7 @@ port@2 {
 					reg = <2>;
 
 					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
 					};
 				};
 			};
@@ -925,6 +935,42 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l15b_1p8>;
+		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				wcd_usbss_headset_out: endpoint {
+					remote-endpoint = <&wcd_codec_headset_in>;
+				};
+			};
+		};
+	};
+};
+
 &iris {
 	status = "okay";
 };
@@ -1095,6 +1141,11 @@ &pmih0108_eusb2_repeater {
 	status = "okay";
 };
 
+&qup_i2c3_data_clk {
+	/* Use internal I2C pull-up */
+	bias-pull-up = <2200>;
+};
+
 &qupv3_1 {
 	status = "okay";
 };

-- 
2.51.0


