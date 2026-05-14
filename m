Return-Path: <linux-arm-msm+bounces-107559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEHlOqCfBWo1ZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:10:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D56F5402A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED77A302439D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C207A3A383B;
	Thu, 14 May 2026 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RT7CjWA8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gX+JnvSs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC6E39FCDD
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753413; cv=none; b=C4Gfq98pT9oXaNChznNxMdBMeS4NhyGotvg686ONLUClAJpOMLlS01I8st459HKxVFYYFAimFCeyCR7TFgxkM6nx2iJ3KYSHZ2V2weRym+4HH2JynEIs7V24PaklsM2du9xAHHQ4pzjN6bXMDqIAvvhZXknmdEJQbZYQerVmvgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753413; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h05wm6M2nz1M5u/Vdm+w8ZeaaadPIYfvQyYZtmtXTjFfjvZv2L+ILjyy9iAClL8FmRaw3W9IS2txZbQOHWsnLZU0vyga+mR10Tbxf4JOQB82HOPFqkl8hDxK+sFn5l/Co6cH8/PbEE4IzkD69++IHNgNlgL+XAlXhGn/0s6s/a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RT7CjWA8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gX+JnvSs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kFTZ1989636
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=RT7CjWA8mT4Z2i7N
	xtiQU7Bj6WIZuVFST/86WSZKB/Jb+4CXNRm4BbO/ZZMA+TUp/lvQPNWCNlrMK//r
	N1ie4s/gMxOYlILIy0pPsIgxsAyIey6aQiG+Rw67hTAdcDHhwY4OYDLs4Nisr24p
	E5M9nyYSrc8JiM72zDN8ldEmfAzS78av743qs9URsns81I0XbRoGSi4fcRmOHoCK
	ZVf3getI/I3/JJtaP0i3NgcJXs7jk/Qbo1jfQrSt6Z/12G1HoCxHSnuz181peU+9
	knvUiQDhlMhlRtA5Tl65tK5IVNTa2SWvqJYve+cdyiIwpvnCx8rKxKDENzAXDpwZ
	z7FXtw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bhb4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:10:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82c4772950so212564a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753408; x=1779358208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=gX+JnvSs3IHbaRrxd/r+AZg3J7iJQ0L1xeaJSJcgMfGgMWtWq2ebmbFQqEU8gjm0BI
         +Mu8v5Kgk1opXPtWJpDQXj8P+0HNvwfapGJqL9qH+9CzHqvXAZg69NpKedRArCnvU/Ii
         zzEaxCxJe5MPt3jWtpcHbfJWs2uqIR3paxr8fN/rV3RVD1sO/Z95pSlEVLHs39OgURkb
         RmFv5qJgOvk3DSotJUuAAv0BHHtUMxejqzMIYeVAPGLcrJ1tpbd8hnvq9AZrNIV3CPdJ
         aROlrEcV3wwsGEWR5/tjQP/e1Gr77SOEmIO+aeRaZgGINQaai+FscOZ7MOeJ1zOXvuE8
         05aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753408; x=1779358208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=H7wS6nHZ0yGnPoKDjIbhJv4pVGwv63V2QUgCrNOPevNm0c8Vu0PJ2pzPFd2dw2n6+C
         e7juGzF0NeaAuuOGcg+aKJ2YqdFwtvM7ti5mrJrJQafyn1FNrxRfzN4MZ8xm/EroWaW4
         kLF4ciI6aPu+tNZO8/KzmTALFU34EBoSBKqVpJCK4KIVF/AGULUTRPJsIBlfj/lCvF5d
         tEn5nQWUhG9BDv2FuxJVn4FMZX6w8rn4qgndXcdsJ/yiUsPjtqPz0bvM7v1Z8+2ne7MQ
         8GaSOkAzj1V0nIfSsfTWch18IuJAljR77LFvkDZ+63H3RY15fBG+MzmJREadK+0E4ESw
         N6ag==
X-Forwarded-Encrypted: i=1; AFNElJ8JqMfqUGCEAloJB5Ogsgb8/5oQwYj7RsPSbyZB8nnYs4aRTh2iQUQgk9KRIhZ1YCmOEC6soLMha7jCNkFY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywua/lxOTsF8f5bMFb1ekOSqYnS6Mivw6UssQW8s7lRY5SJWo7X
	yxM4lvlN/MHVcQZIt1j95OXhqZeiaLJ12/36mpVn0MDCkPanC6TyVjnYxRuY2CyD9mhvtEJPbyu
	6mJURRL3mqqrXYy+Rj1jmF/zh/37Aa8/X2aWbLS6tBTYhV0rdTf0FDEYvGwzovDDHDeZ4
X-Gm-Gg: Acq92OGT94xTeM+ik8zmFSU5qyZ12LWOC9sPloklgehI6A045FKvfC3GdmUsYnsp8g6
	4Ab1tXPu3OOAhXU6lXCjwNRmxDoN6FSTgypJ+DDIVW4u8XULRNKf6mSZznVd4VvCsEdcUPsaIE2
	S64v6TmGCs3uav6n3doquzZbpeD2zdURzONqlbwtaAk4PPv4IBTh7b69Qrkcr34CBzyeUoUdb22
	7NuaAZgrlzNc5ZHGsPvCbok3+mzruHfNa6CySGP001AWxUM0L2nTuqM81GfQHUAFVD9uo9HZ1YT
	wmqPxNoUz1TXqor3UdMvuwT2eZphxzD4sEtxBFJA28Vydrja4DbfvZdUQf6Ej7Y5dH9M2uOAZR3
	F4BCY48GB3oh5ZNa+dJK0h8B7CZcfc1MuVajcFqOc9T0YamJlY/wbUW6JxKdc2Lko6KuFy/z5LS
	BrJ+vAN2h69quuCjwc9RIc
X-Received: by 2002:a05:6a21:339f:b0:3a0:b65a:5df5 with SMTP id adf61e73a8af0-3b0c0abbdfamr3403995637.30.1778753407675;
        Thu, 14 May 2026 03:10:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:339f:b0:3a0:b65a:5df5 with SMTP id adf61e73a8af0-3b0c0abbdfamr3403962637.30.1778753407098;
        Thu, 14 May 2026 03:10:07 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:10:06 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:37 +0800
Subject: [PATCH v7 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-5-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=XvDaPxN44wekljoc0CV7Y7J2cIXJH+w6vuKul/77hVGW2Uo6fgyz+6+UsJgKXY/IbAn30qQsQ
 1Z/H32YjFS0CxXfyfp7CxJni41TWGjmu3LZ1vu4iTPjU8RtQ47y9qSE
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: 7IpjwvAXRl_20HKrKqRb6rE322B-PJ_L
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a059f80 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfXxrncw2HnUics
 O89iHbdq9pxyPNZm1TuzyA2v5tuIiC1fu2J2v0DtGfWB4ppwKJWEyZxJWSdXTNEnJWjZqOM1pZz
 yWv96TvJyykQGXtYBnKfdXvoDrJjzsQQY5OpaJSNqymi2xGMKAvv+xmhaNC+vt96FjLIdEmX9SV
 8S1KXsrKjZG01ET0ofmCQabi+WSqim6p7DmMoVIIjI2FZfCfolvsW849DfY+5erdBzOXorfcbMM
 6WfH3UE2dHQ4tqr1GSrFlKrALJX0S83vqvPZ3ELBLNqZg2WRyWLOJq71/TpLIxPTF7hdQIuCJas
 w527Wp0kkC9T0aG4MCVkcrV+6TLETENnZuQvHhLE6pn6txPGwZZqiua9wh80+zLIpHeVjhtKYFd
 MsapVJcS5XaGC6mCb1xU+s8bFRUj+/DNDqkxSZAXQyo1pIjHujPEpnOXeSoRuWTFP4BCDqRW5LH
 vFArg/JftszZb/Zp0Fw==
X-Proofpoint-GUID: 7IpjwvAXRl_20HKrKqRb6rE322B-PJ_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140100
X-Rspamd-Queue-Id: 9D56F5402A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-107559-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0


