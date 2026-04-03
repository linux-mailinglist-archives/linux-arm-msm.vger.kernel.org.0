Return-Path: <linux-arm-msm+bounces-101623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDq+BjeUz2nmxQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 12:19:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B52073933AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 12:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC2C8301D68B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 10:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03467386C38;
	Fri,  3 Apr 2026 10:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cX4nEAgr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSWebH4z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980D0389E05
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210893; cv=none; b=iO6+i01XDhlGV/AYuSH7C3ohjxlfGpW0dTvTHCoaRdUvU78fLjt0AhWmNeoi70Su5uY3iJr9hxp4Yg9tNTUX2c2eHY3LJenxbLL1l/AN1pjuwg/HRvIgmM8xCcS0dCy6P85dfwgEAxtil/jWY3eyRcblTaoCtUfQqhDDWauFJwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210893; c=relaxed/simple;
	bh=XVSQJAsYoVMAR93G9UBt1XvC4Txcv9nD5uc2OvoYbDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kk5f+K3JuDfUBC2c8ogeZuoVxVZWFCgTElgNtHp0C1sTvt1ZfQ2Ifefy6Wjjnkpx0uSO7XbGjZ0/tL1fHnYi5BiYLMb8CGrjWA7iL0bGo5y9zpQYZMHZzBDpHrGm5r3L/haHP2Ka3gnj56erTGLtVOutnk+rz31AAdR0JpfU2/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cX4nEAgr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSWebH4z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633452mu824355
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 10:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PGIKvZFR8Ji
	2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=; b=cX4nEAgrIZIwzK31BbLN6BwFn3b
	fESMbfHHguounj732FiBjUqC6N6f5/cVWTaZCjfp/3H4NNnjy5JSffjbteVc18Ts
	0zRPla3O950Qzla7JnEjsOgHkxjajFzLsWdFd6qM3uG/KPvj/qMpxGXeTedpghEU
	NHPblEasgpalVii82LDJqWR4+Ra+ppkjB2eqhEGGEpKw0gHd1YI4/L5lPAXsyE63
	iOjbYEdDPyIkjOj1PvppIjABuHVxMgqAocIjyTxK/9XJV/N26KePsSk4GZq9n9XP
	Uj+GkaVNebBTGhc1Lv7CiPpSVG9Wf3jo7ynvstslfSVQXSS7QNvz9dAjS+Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da67390yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 10:08:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9010602bso1743822a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 03:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775210888; x=1775815688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGIKvZFR8Ji2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=;
        b=cSWebH4zAN5OMD9PRcvjGsWlcwGrgWtBx/xlB1M3Bsf/5xluhs4tN86iP+/TGQV+lr
         zhn9LYCFDBKdtjVO4M2tZpFv7xM0z0kkdRfvC5idZ5vHKAGX5tU5B0W+aLfY+RypMtZb
         +Hi/YI0mnJmCkLgB7HOU7jnufFxy4x/mQgdI5KUqXek4TLewiV/2toHe7jQOet11Bpw7
         vrgpX6RGbBSum1jjbuVDMF+qNw6mIG/Fo0vGmtDMRiY6NK1rVMZDqDCyP+/TIHmgqBMP
         OqJbCZM0Onn8j18xT2l3x+piJS7anDuLR8IDvJEvDwfG7JE4mNKvtjEx3fmByb+b3Qv5
         gXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210888; x=1775815688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGIKvZFR8Ji2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=;
        b=pCOIj/TX4L+GPTZwZ+Ivt03d3zos/QindyrGPaM1ekJ7QwVoQxSjypg8g6HJaqfSIH
         TzUOxy08m6LDulisHjmL4WaKOEX97cM6azUxhVaB3zBe/vr8wQHcvbOZqbS/8iWQplLQ
         v340YDS/AAK/zKy7ZfaFAlv4VlyUZFeQrQI3d7ys5ykIb/kiQzusC5c7WupogNRMtgje
         F7w1edhdqtfevGSmVSihmchSCXp6+o3DCfrhHGsz9aoNykGoIcsQvLocVDG90abwzU4Z
         HcYoZdjSS4mcBVy7N6IHeSX36ImGNGri4mVZy6HYbeSSmhkbqZZAtEqP1Yfr++CKabFH
         f2zg==
X-Gm-Message-State: AOJu0YxY0Pj5zEOiO2+AbXSANUH2Tbs5dJtwFMbm+0druvUZUZ0IztkD
	emrN9cbmhNxvrH2K+r6grV10mT/jEC2ehci8RFK0qase2DaIKZO14WllBw5HOmuCbAvrGtOGwfZ
	sZIPgmEaPKJ8B3yDvV2nWkwXpL6NV+N1h36Yxxdar0LkzISxIZg2ZYa1c1gbnsg4u91wKB6TdXz
	vw
X-Gm-Gg: AeBDietsYKXFcuTBeWjitLC6Heo2oLh48c/RsF4tJsXDtX0+kLlnTfo23M7FpdxNzud
	ynogXMqiOylHwSR8rEAMC9XB0ZtTaXC3Z6OmdQYn2SlJ8gC6AqcgUL+5fMpZj4/ml92vE2PazV8
	0xFqbTdjXJU2WS4H1kydd+Sj8ug2Hsz5uWt2zuL5d5Ro6ZzP1l6lAyh5NUxHgyAP3G+7BkP1nQ1
	DgvJULCF+tv1XyMkRw6Syb8h4SEbLCW5OcsGh2TFYjOp5cM9PeupwKMAQPmPqkQXcKcUqnRDVI/
	HFsDoLR2h72TbHUTEzduobFwf/wijq2TB1P4jEJZ59xa3AT2dM1bNkjuwjTlUQ6BN/dkwwcge83
	WQKnUR106nPH9aVqsd0np/Gyb6DK5VDMQdddQGsDY4ZpiYVntqrreOs4=
X-Received: by 2002:a17:90a:d407:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-35de68f8988mr2213298a91.14.1775210888156;
        Fri, 03 Apr 2026 03:08:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d407:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-35de68f8988mr2213271a91.14.1775210887666;
        Fri, 03 Apr 2026 03:08:07 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm13497522a91.5.2026.04.03.03.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:08:07 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 1/2] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
Date: Fri,  3 Apr 2026 15:37:52 +0530
Message-Id: <20260403100753.3477925-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com>
References: <20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69cf9188 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=917_i3xC6rPZgS4eXuUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: gLfV8nw149cH16QNLPkuBC3dPisclTMI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4OSBTYWx0ZWRfX7bkHwb8s4gqC
 tidMB4+A4Du1cWxrzqf57uvLBeGRukDlSbZmfCHECQWgokXzrjsnLFX1gJe+FRt+J+rvuRVggDK
 QoBIbF9DXPZa3aaRPG1Wc5H5toZzBQ++OoRjXFNNd/Fnb2/ehhmxkpBex1vGeoO5FlVr3Me0xeL
 xeIeEwbbA6gMW5UCw6A0+DcR1sJNsihLibQGfM/OtKhw4oizUd7N9xBBciDAM3AcoUCjROA57sW
 m3RQYFdElal+YmutsUwdb7zI2wRPRkvJMaRKbihior64K92UZH3+IWgHfTJjsyInY6qZQAHzUn0
 VT91hNJHq3ls1HZxnVkJiM4t8xa34n9BsBFl8hQ+fyMiJDIUQDytFgGohttDKhJ9O5cMe0YNEd+
 9HTw5jq9mkRNtm1C+yav49xB7otysBvuVyJouGUeaIuHQ0unrQs0+lK4GYoeeoqG9FBsYJrSfS1
 0bnkSQ2p+ASaHWxnsLw==
X-Proofpoint-GUID: gLfV8nw149cH16QNLPkuBC3dPisclTMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030089
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101623-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B52073933AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename the hd3ss3220_ instance to improve clarity and simplify usage when
adding a secondary port controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..522d407c9925 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -63,7 +63,7 @@ port@1 {
 				reg = <1>;
 
 				usb0_con_ss_ep: endpoint {
-					remote-endpoint = <&hd3ss3220_in_ep>;
+					remote-endpoint = <&hd3ss3220_0_in_ep>;
 				};
 			};
 		};
@@ -551,7 +551,7 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				hd3ss3220_in_ep: endpoint {
+				hd3ss3220_0_in_ep: endpoint {
 					remote-endpoint = <&usb0_con_ss_ep>;
 				};
 			};
@@ -559,7 +559,7 @@ hd3ss3220_in_ep: endpoint {
 			port@1 {
 				reg = <1>;
 
-				hd3ss3220_out_ep: endpoint {
+				hd3ss3220_0_out_ep: endpoint {
 					remote-endpoint = <&usb_0_dwc3_ss>;
 				};
 			};
@@ -989,7 +989,7 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_dwc3_ss {
-	remote-endpoint = <&hd3ss3220_out_ep>;
+	remote-endpoint = <&hd3ss3220_0_out_ep>;
 };
 
 &usb_0_hsphy {
-- 
2.34.1


