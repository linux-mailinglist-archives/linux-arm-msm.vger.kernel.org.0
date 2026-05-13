Return-Path: <linux-arm-msm+bounces-107285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LoOA0RxBGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:40:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA395332DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0045C313A21D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41097425CF2;
	Wed, 13 May 2026 12:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kco3/NvB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="St40usoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA2D4218BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675699; cv=none; b=rLd9j5mxlUshBLTFI1u68vzSflG0WJ9w7E0DZX2gFOHjy7nJOhftVP8thGKm3zTMwnhMz08cZ6dH0Zes19PKGGnZzBsr1LWsBIqqrWPZs0ljGAPTOFCsWjOgDVzYUYADoWrKSvKWbcfemVKhZt41tb/ITpaV7lFfaClgBuBs89w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675699; c=relaxed/simple;
	bh=nCzaPtOgAzOu6WMMaUkEsvKLphsm8vVsM68gBNmWkoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gp52ZrJiF1Nf3gVOkr8059bBO/yJ3012b2MEp0rzMcNEXBDHpIFO9TXykbmCFiAoXk76IF/CK3pw0HZscC30KDyisLNxxGvw9+ISNkpb0+N23aLgCT0E999AklK4l2oMR/8x/2gc+UZW9iUjnzPOjOGXx03YBAWyxVe7Wocwhdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kco3/NvB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=St40usoF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6iho82965290
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=; b=kco3/NvBpt8juL37
	CBPSl6xQQ4oPvWn8ZmA7+ioZzrRJwtnejWjIeWMtkp7QoOqSfDLRA0iKTYUMfeIb
	aDmbgnau/dTG0pqVSACrdkoSv08JwNAXCD1t3w7dBAnGXFk1P1ac0oA4FlMHAJME
	HP3LwdHi7LkmDL5G56EMujT1hEzALsMid8hrEsMZytwYxz9AIiioY8BMmeWH/3hC
	I6Fy92Ew9Tjkl1q5R7gaaZD8JMdulp/GyELgwu9MrzrB6KgnonkOg5j2LKcnfDsA
	rxiecPjbT9xIwt7E+gWNaN4Px6Xjm2iCSb1BmWzcHzT800jzz4GpLddvFsZj8bvo
	Uo8sOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59act-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:34:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51494d74d4bso106193251cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675694; x=1779280494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=St40usoFugQv0S0nQTyYLF8loiSopLHjmzHZpahOKvFkd5c9SvdP4BBOlC/oItjpsh
         /E7HZhery2Ld0WXrISCylB2e7mdtBicPWZMP7/yEUdpNNGANlA3e86iObz9j2+669i8k
         8rgRsSgQ+w4kVqlLjZANionU/PXCLiTW1Nwskg4IEAZA9yUT+LlmY70dq5OUAnW0owV1
         arCMW6SbUYPx2DbkvLRtpslWGH4PN4J2XazFEwjhvLIG8CjY3W+7O+YuNxnhO1nndyn+
         ZWaS1eJM1svbbDo7RLlAbganicxCGDN3AvkUtaaujDBJvMu2luvLToeJ9j+qR1zfTn6w
         Uadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675694; x=1779280494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=M1gukkYD8QcglOuhfLTTsMkXU0+2UaG7cdc3OvU9qOxqAadp/h82Fdd9/6PnnkqYD+
         KMlwqlusRegfBSjb3yf6d+kKNp6KZbOKlL4Kq0nS8hkzryEc2bGPEj9NHuxSBBgG8KyI
         6x2bL7pQZwHLPQ4Y0gQlLfuaQtZOJJwztP2XEsN08q5MyJtnnkUd9PMxLgNjZ3q1rggE
         k0Cg2foBISJcbgZ3LczHY2B8kL1LuvLa325lAq1wl6Gac0u+MufBirQQXsKt1mh3LlbJ
         knMltV7lY9tGRCHNCGTmL1wovQFrGMYrlmAENDKVaK46TaypweLOZHYYg/7DXeNKCcsf
         BM9w==
X-Forwarded-Encrypted: i=1; AFNElJ+gT4+xJTZddta7GKYMP8uBt5Pu/r9ky65opOe0Lior2wC8bgCKjsyr0wtXt/+8len+MZH+xny3kcYPhUn/@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQ/r3THyRSQW8NGUwwI8CSPoESjbmRFQwUlzeJS0WJ25rFTBp
	0Btxid6EOHlEonIIUgMsfilYz7WoPWfA5c2NMoJBokySKytMkpRQJyJY/HVBFS0hEYOms9d2aOr
	qtCpBbcL8u1BCPryk9ahEnVEuA2F2Q2h94gUqUep8O7b7A52DD38X6LSmRJbUrxXIhCMS
X-Gm-Gg: Acq92OGgoT9NMmGJ949fJ1JjvSnsPtliV2UzvSQOnrGZmlExUBqCIT/exeLf86qUQLU
	juVH3iqIUvf9Jm8Pt/x8uSixUQxsaEusuoUZA895lsNsS3c9t7ic2TLH/W5vT7nB3Hr8SlpK5+D
	jAQAAz2l2bc8OXEn+dnLH2W6yb7RzR7TSzPAhRDuAE3AKs5FYLQVjwaptIcU/B/S3m9IkF99bUg
	VPvYc6ZkbP+D7HhEgIFt7DD0L3fygdzlaE6FuI52yUhnrLbQQgp8yKUgmpXpybsv6BYFs58dMpi
	btNjferquA5h/1l1tCOy29l14RkprkHuqy4a1Nfreg2oSc7MpGUr09uFDViU6ZyEozZZhtTdulV
	tJpquodhAbvbGLMfycdbTVGK7BwZdWM+NvPvHAq2V5BPbtS6S1ERX+zrkOf2PslTDruzJvbk4ij
	53cLnlQqT1v9dS1bhuTcE4XJnkoImcAUVuz4g=
X-Received: by 2002:a05:622a:8c05:b0:510:1492:c3c2 with SMTP id d75a77b69052e-514cf00bd12mr89706421cf.36.1778675694426;
        Wed, 13 May 2026 05:34:54 -0700 (PDT)
X-Received: by 2002:a05:622a:8c05:b0:510:1492:c3c2 with SMTP id d75a77b69052e-514cf00bd12mr89706041cf.36.1778675693886;
        Wed, 13 May 2026 05:34:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:46 +0300
Subject: [PATCH v6 4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-4-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=leB8+LKvE7kUH/wvPz6CoXenJFqROgu4EIFsX585OSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/liNp1cbKAlhIylpeN9llca/6kx0/g8+Cbx
 Idj8CF62YOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5QAKCRCLPIo+Aiko
 1VQcB/9OBG/yJtoqZAYYlovFTl1GEkVBBLjNNUjO+c8YlkUG61X7o6sc1FEYF35CgZpIG3CzvFd
 /ESq0hxGi4N3HXQJRFcilkOvaB/oyv7d7T+8w/DFuTzxvV+jSZj423YGgRAJgkqP0qQ2VU/ohqa
 0TMoGEdqwan8iwJYpgkLqvDz6GvEg/xDo4gitoD9nOIah1I9ikmjnKK4T4XV5TMwN08wB+80571
 qBPcqfO/lSy5A9xTfhRZ6V6FdDMagJYANpCSSpfGpeEJITy8BUGI7CAXZP6xjnhqyAD7uDuio3K
 Z4gJyXjzlwXfA/iujtIz7w2xH9PSosxt0+E9J4PkI+U1RUbP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX7gmRtQH+drWF
 8mR2GJF2ypVYON8CVTS7f9j5DJotv90WfT4wFMQFjMnclN4ICqkU/8oJAjRBjV+onqoY84iIJdj
 RQDwYvQm5eXTlC7VXhHhNRuQ9yezBjgdzoueZK6YB63p1YZE+9nDK4jCiP9Tv7TUWyCGTCs2+O7
 yOhhQK14j03RCkDuGVTkiG6GfJp1SuwYLuUjaEnrMM6dCin5ZBnSeoBrOR+kDvdRj0jcghbpTBg
 43EhllEUUPH1vRcubxD21f8+HOefyGro49nUMt8FtagNCJrjn28GeShEYY4MJh4Pqnok7RcMFXR
 SnipvDqgBgkSv/aIPvQV3JVWlnMOnDAszMBsUUjJHfj/FqfOBScpmPV4lrjBB5QmEVNW+As4NoN
 v5zimMDRPhm3noSNE5vxlXEskx88/8wob50k4ZKHpkGNmmeaKnmen8+cWkrbSYvUFYg7pCwXhrm
 aAi5O2AFghBQc3NqY7Q==
X-Proofpoint-ORIG-GUID: sf0aY6H95zRJrIbR9oF_LMLmtws9JwSL
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a046fef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ie9TG8L8bN-JZtJQupEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sf0aY6H95zRJrIbR9oF_LMLmtws9JwSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131
X-Rspamd-Queue-Id: 2EA395332DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107285-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.68:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Iris and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0eab03495b8a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -932,6 +932,12 @@ keyboard@68 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

-- 
2.47.3


