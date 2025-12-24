Return-Path: <linux-arm-msm+bounces-86505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D2CDBB6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F8513040A7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 08:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F9632F75F;
	Wed, 24 Dec 2025 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4PgeuSd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZ3pOhLs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7EF32D7F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766566647; cv=none; b=Vso300eLisrfKxy89aK7VA5ahQM9eBbdUKDk0FleGni4uryZzBJKHc6xAT51mjufbnE7aKkxRYxCFD1vgZtmF6h1Cws0MtDPerL9Qy9ZEpDaF/ZJc0E27fHaT1OgppDMBhYyetSZZb4/2tW2wLQ8+x2o++9Qd/ffiGSpxUXjYT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766566647; c=relaxed/simple;
	bh=1rXRxP8nv/uDHN9VqjcpMRmHbKkQYlxf9869zOf39Wk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZAFvYak5QrgcTJH1+XRHlqUjzBYFk2/qF2+UGYctUoFgPYFxrk/bzCD1bcc8H3Rlba7iQFBMaFw6Zre58Amh/K5kU5ISDEH7BLtsI6DmxBXNNQ4tqYiR2slemSgusV0k3PebniOY0FC3Zb69jYmD2nt/2UCl6+LIBaR0ukhh5u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4PgeuSd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZ3pOhLs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO84hHq1056223
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R34bM4+eLNe2u30X75gtKquF7yNcXFk1HUt
	lACJY6DY=; b=p4PgeuSdr4dXxTzDGs+YYpt7n1om59ODo/IYqdP3rXb4P+xiuOm
	3X8DcKevL1qZ5+jSaBtYpuNZo2pVn2xWZKL1IqYa6chh3Xgx1vnYcyMn/tgfwYSj
	Nwc5kPHx0fBwvEpH7uayNQKjj65rv902HGpVW12LUxZrM4M6gsm/xA5msRlFwf6u
	vojQDXa8Rqv/ww2xPJUIZs3TV0hKeTYxyijGHkljY6keNYfl2eqNEX20k0HaVKQj
	W51NG4AzTVpBAB+LiyTyvRjIGyng6pE9wE/lSmkCraFrDmS/bflDSJZ24O2+V50f
	IzNCfYNgVXVAb/PhETcvQzlADsQwF61v3Vg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v1x1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:57:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25a008dbso53192425ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766566644; x=1767171444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R34bM4+eLNe2u30X75gtKquF7yNcXFk1HUtlACJY6DY=;
        b=DZ3pOhLsK2IvQ3jp4gHI116WfJjwNGlalb9SDwSB+hImWkyDJde9v8RJPZRcK4LsC/
         xMs4gDZvBRBkrBkkyQafZyiMVkfSyBKhXezhFrLP2BHEYlRq0mwFBpTSDXXnBz7HkRB1
         k04zlPzbt8G+QNu84N+EPpn4Z3GTzdDoUI+K+AKFef4lRKgZqy0Fo/ZyXR2vf0S5wErU
         cRJBUdCKZ4LFHmYYgMf0lRkwG4YhS4uDArTKmvSaiGZiQ14LAvMPB1lvzdhGOl2qtrwq
         E6h5UmGWHs3bqPLMeEsk5cLBLq2+Z8ozhMZgDcjgf/FFOkdTtOgBfBv8FI5//oYnaW5V
         c3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766566644; x=1767171444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R34bM4+eLNe2u30X75gtKquF7yNcXFk1HUtlACJY6DY=;
        b=tgV2KMWhmUUUbOxQkts5iRQ5HOu4fc1Fig3wvrjgbstc73uFYbHY1LaYkZMkJLmq7D
         J7SXoGN28XDABSPVvdJJ7Eb7uhEkMuuJQxBjfS3JKuYldb6x1toy7LdnnxmMnd4Q1lsP
         ampgs3goWc1TQyaFQr64YQFAm8Y/NXcjWgqViyiV+3Vpnh1iti70z1wcE7Biqhwp4CvB
         JXF5ykUK+U12SNuE9ojDzOWaYE6kxrS01dliK6OYakxHbeF0HM1/NU2zoc/2tw+U6ZGr
         ig06Smb4joq52dvlhTLZK45uJAT8DtCUknrwBmyZha5dtCNpHUIfp1/q1T03IP+mKVkc
         Uh/A==
X-Forwarded-Encrypted: i=1; AJvYcCXx74AaaUDSzoWj6lGI7ALLh2ju0V2/OryzYHKzA+hPGc637BwPMG6E8OSjIwgxNQlu+CI2nYHmxQHO+oI/@vger.kernel.org
X-Gm-Message-State: AOJu0YwxpDnwZNf3ExgkD3IGFK4Lsdsf8aryfeRAF6FZ/7YIWvpd5xX/
	qM79vlotUFd01LA+odyNUaKEvLMK5Y3juhZVb/plOpbYAFJ0leRwKLB07jM6wEtJPjyRZP+cIeF
	a0+sKLHrDtnfvP97i0bUHhzxmHnvancIdOmXmqu1FVRP2+bxjXLNTUOSJAyx7at2E7qkz
X-Gm-Gg: AY/fxX5L0DSBUifi5bijGWci2CYjtXUvgJDQSLTFBS2s671kxblg9RDROAw60vpIxYa
	2cQByMql/C4fD0NiJ3B0VJ57VkvQLyzed59ep9Z2Cmv4xpvF3qQGf2ddksJ6KOY+32/Eub5tZpO
	b330DwUA9l0xIavpmQLse1f0hUa2KPZ9EbaLMBhMj19Ek0/rvsHaQndB+N/FE/imQoIZvZ1WvAb
	2pDds9cnsjA6rBHC2N4xc5gRFAyMNTUh/VaWXcLBCLt52elvyM07bJRGEiAouiglqJCMbd7qiIm
	8Wlge7X4bAHoTfsSRmL0qq+wcvRjTvoYTB5D+DVUOTGrXL4OJGzYW9TY/SU87HGcxVib+SUuS5U
	DS5bNceEqQ443MAy/lArClKCSxtdtW7MfK0826gpB
X-Received: by 2002:a17:903:320e:b0:2a1:360e:53a7 with SMTP id d9443c01a7336-2a2f22229f9mr213753665ad.13.1766566644233;
        Wed, 24 Dec 2025 00:57:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9X/LkjTkq8X5ZvuLDM7b+2hdXqXNvvRkYJfxIwkQKO3M1TRc1ceHiPg7G9wmGQB9BKjx2hg==
X-Received: by 2002:a17:903:320e:b0:2a1:360e:53a7 with SMTP id d9443c01a7336-2a2f22229f9mr213753415ad.13.1766566643806;
        Wed, 24 Dec 2025 00:57:23 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018eb5sm14760026a12.16.2025.12.24.00.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:57:23 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
Subject: [PATCH] arm64: dts: qcom: hamoa: fastrpc: set ADSP on secure domain
Date: Wed, 24 Dec 2025 16:57:09 +0800
Message-Id: <20251224085709.741-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3NyBTYWx0ZWRfX0BZBjZly+D9Q
 N8Np1wQdhd3homFLVnGxlvXHfvu4aELD2u6Kbvy0HtlCSfaW/RlQmq+ngoLfS27RwimV4ngveVa
 chjeiHFMcSC72dT4TbG4R+YY09X1onl3+Q4WXPZgomLB6JRhVim38oMsMquSTV9W7RztvsDOEt4
 6E7Ppy/wDmAxU3BEv3saxs/fnBtR9OC/moGN8Gh8oCWDpvcOzhmC/plAqNaf9/QrzZu+ejU6vXh
 /hE0w3PuV6zjSLMtFEUeuNXBOVTZ6AOGlrzduZCJVYGOBLUPqQYSEVqy/HPs7TjUxzcqQwf8ad9
 vGxONjJrpWlhqxW2mTFDo2+nOb7ZG4w64zkPVyf1l07KKkt/P0Q8WZpzz0ruwSHe3fH2IvDTeS8
 6VJHL6L/vFo8uL3N7evZVIhrzXlT0IuxXoL5hKruPOr8liQlsoXkg0DZFEzEZnKTOjH5fMlmx56
 ojeeUvCbSjKeuqDmKVg==
X-Proofpoint-ORIG-GUID: -ERnME06tVQ8aEZxbO7FdrPXRK04bnWx
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694baaf5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rhCUNHnpazzhfgg0QaYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: -ERnME06tVQ8aEZxbO7FdrPXRK04bnWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240077

On Hamoa platforms, ADSP FastRPC should be instantiated as a secure
domain. The presence of `qcom,non-secure-domain` under the ADSP fastrpc
node causes the kernel to expose a non-secure device node, which is not
desired for Hamoa.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eacb20..da62c5741350 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4193,7 +4193,6 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
-					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.43.0


