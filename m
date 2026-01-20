Return-Path: <linux-arm-msm+bounces-89900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKPqA0kFcGmUUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:44:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A170A4D2B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B4F4960E59E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BB03ED130;
	Tue, 20 Jan 2026 22:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbFDpJql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CnO8oKKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EED43E958B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946807; cv=none; b=cwXIs6QHwtJB+9rzBBKrUja6upnjtTcMR88O6G90HDjTNWep/DI53dq1C9euv8VJS6Zj1hHBr7Ny7oPn0ItBAhN7y4JXAzEW0Dj+SACXQ1zZ3QDadZgIv1uKKabzCcEYMielX5vxNFc436NwSFQZeqN2TDE3XXrsIPr2tYzk944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946807; c=relaxed/simple;
	bh=OKiWcfJvMd+qn0yC25CdvTUN9huCX95jPBUaCYbJdwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8vngRUWe8ILJmjX+6uOuMcIGbYr882kF5CQOf2wGut7ZJYJ6/xe9SmFIuvDLTUHmlTbsOL9vWRLQuK4VISSrmOcWl7IP55ATrnh7Nc5gRat39PuLJ7VvYp7Asr82dRUnNrOXKXnmyNq9DYCpmQ5uqsuHjEsgtv4UlrrS5NSLBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbFDpJql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CnO8oKKs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHTZaA825994
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WB1ECFOLGITva9lWFvjGi9bk/gpXjPSRbqGr6mbr/Us=; b=cbFDpJqlmDkbWwCP
	eEs56Zbq76UflCH06fVQCjvO4z/oNGBxZJ+xK1ra+0OrX3Qzkh7dTMYYsGkruHPp
	AhPaxVlodSuhwfGeAIwbeQHE9rLlDBD32tz031nrZnd/nqrhudLlkMlG7IvCYxG9
	LzBwJNcMEgA/rJwVA8VLMY3PZ823SWU1NdnMZMFLkNzkyW/62vh0FwWZgNOWJNcC
	SVJ9TpFutCKU8PoM9+oonzFXAX/VHsXoA8a8utvoLE57PrDI7Rfyr4Qck79MUpBN
	ETrllYvphODOrB7FwizdEj2gz/RlcLfobF7zkOehfBqPJbKkVWGXnuEcw3L6pY3a
	FteDJg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e0xma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f3fe5ca8eso5135194b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768946803; x=1769551603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WB1ECFOLGITva9lWFvjGi9bk/gpXjPSRbqGr6mbr/Us=;
        b=CnO8oKKssEiv6dkgJ257OC/c7mAOwdxcRyB6oyxxU9luEDpVXdY+69nxWUDqTt3EWv
         BwGiH/JxWTiyWolHxjm0uzu3Pj2ao221FJ+6qX/Vx3RYVcCjjQ3ruWi6dCP4Knmn+q90
         Ib28ryZUcpIM4WOjH6f+5VltUtoIFIlC7WYeFRecZ1Ob7qbXpy5Hmp+2xU4zxrJikOI0
         5JWrxUfI3RggCxw/u8T/8pwTR+K8pWx3IyNgX7NCIQ4BxvFwr25vR5/urzENl2ejYKWc
         JFU4QInvdhtAKrNHaYhjkoEXxbiNbSwSVF52aey3naa5bJPYMjKvAipugPQYZYO8up7B
         yL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946803; x=1769551603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WB1ECFOLGITva9lWFvjGi9bk/gpXjPSRbqGr6mbr/Us=;
        b=uELT/Igfifq3y6Ii8m1Pw9m66aYlGCf4DNHLq4kI8GX2ZE3bKikOGQp8yN8BGO3GPp
         9Heb1h51N5D1LY82BYWLezXQp2l+Lw2yzOXF20b1GUej7uvvgY2TbDoL1bk8JuPYTGLW
         lVqkFPoEm0KK2a2VRDnH09FqB2Iqt4h38t04NqAWbqPm+sEqGOgcaqxCXmQRHqpJBBlX
         +sks2H01g41fmsWGyX9JAfGYCcNtG2pQFOyI3pPe+hjt3nvWYdpN3vr7x3/suGAe9kzg
         MJeM0RQcnYY/QoWCl24kE6nCb4vDEfSZCkpDucfyLHGxkH1Gz++zDmm80iA/biRB1pHG
         h5xA==
X-Forwarded-Encrypted: i=1; AJvYcCVPazLWP2PLjjCrWrJilKMBU7rKlYusR7kalb1H+4uOydNLXmZkQWXkQDp7ge3SxQnCFEwCJzPb7CUOTi52@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Tr3qcmrpv9ssbDb1UN9uLZyjbVPv3oAaaTCgHCXWvwTRamPu
	OYT5m1FcPnx3FevLQ9hBWlTCjvsDKg9a49X7epMJ9n7cgKGEKcyuj452TbKgs1jM1PCAcNCqadd
	Azvw0NxdbfMzxfU3rPSqxiKcGs/PjeRKO86jiXZP18vlmU8wboY7ZVyscXWwlU+y9/Qsh
X-Gm-Gg: AZuq6aJx/XRRmEB8+XapQkzS7zIcg3RMMhIXJkHbsNqLlrFW82hVFqR6wZxOycIBvLf
	0o3EpjXeLjTsv+1q53QQH7o90AsiY53HkvH0fWNzNj33WLU/pdAOrUONTQiNn1wmF8AGRCN0JPE
	q1+IR6cWIw/j39Ss76/IgkgvpNhZgquw8PwBTmMJ2BnCGVE9xGO0eS7ziXlhCwE+mN6kOovL4n3
	tBhZBPvkCsHj+LPX/nxh+SeEG33r40e7HBCdOdZPBQiBq3h4+JaABC194PqkojANbRYu6y7q9rj
	E5Dh1kYx+iMdmLsWNqyt7URo78DSMsWL2//RjNUtBLlIHHFBfgARpBR8D92XvOkWKN+xnhUpXCc
	S7BYJXvvnsnRLeC6M1dnLE5HMkCqnnh7BuQ==
X-Received: by 2002:a05:6a00:4b0c:b0:81f:51f5:77f with SMTP id d2e1a72fcca58-81f9f4d524cmr12167758b3a.0.1768946802864;
        Tue, 20 Jan 2026 14:06:42 -0800 (PST)
X-Received: by 2002:a05:6a00:4b0c:b0:81f:51f5:77f with SMTP id d2e1a72fcca58-81f9f4d524cmr12167736b3a.0.1768946802339;
        Tue, 20 Jan 2026 14:06:42 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b30f0sm12867088b3a.61.2026.01.20.14.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:06:42 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 03:35:55 +0530
Subject: [PATCH v7 4/4] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-qcs615-spin-2-v7-4-52419b263e92@oss.qualcomm.com>
References: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
In-Reply-To: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768946765; l=941;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ZiW6jOez4q4s7UFSzYJiN8BRNzCWh5U/qQxE8K5ykQE=;
 b=QZP3GHh/qNFnuZodCzW+5T/jIbsllVpQCI5AKabL5BYKxofRVvG88hp8Hly8uvAj4sKx0IwqK
 ZPYM3F6ds29DGbWubQlvcedlKMOfvH8VD5YZTxUr3GNtOI9hETIYQSx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=696ffc73 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DDenb0FKNr3EH7qfFfMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yr25smIP1R180bKwy_OFGt7RaRsHhQaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfXzq1AZoP+GgAh
 tJkN4sE+I2GSZYAaDoLcJDX+Fb7dsAlp3+gtel4tXqnT3tS84NXebkBnunL4GMtZIF2/ONkbYb4
 vu+tVsZdGKG0rIoVvrSSsGEIkjf4hEx08Z7D1mKJiVffQENCSnsUH3F5mW3JKSAiv9F92MPeVyv
 XOE+d8YMw5K0vgIE0hO+bSB3rgdf9Gh5HpVarx+CEnoCm5LZga49KA2yKd75ZMyF104du7QGNIL
 LkZsRzz+m/p+EbY/i0O83nEnMaNyOWDrJqkh1RoAsumPogXun6rKWR2JK7oVlZqob8y8N3oO/ev
 lWur28WGDtjr9XGOJYs7111+vBHcEZ9DEKszT6rUabRgYjRhtwnmAY9AI6SDyDKfoj/pIHNss8O
 gOTv+HLSsB5HjfYheB+eIuafB5LWuY7aKUawJoS08bRpYy8TL7BKncjUhdR29XQvZFJJlQxnsZy
 pZo4+t+8L77qNv+VaGQ==
X-Proofpoint-GUID: yr25smIP1R180bKwy_OFGt7RaRsHhQaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-89900-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A170A4D2B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e3fa92e3b543ed48b2fcd6b20c6ca..599361b7c54acfbe9e5e45eb2bae046e7fbc5715 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -372,6 +372,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.51.0


