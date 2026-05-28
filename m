Return-Path: <linux-arm-msm+bounces-110108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJsLIocwGGpwfggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:09:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC18A5F1E1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2085313407B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EA33E8320;
	Thu, 28 May 2026 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ha1nwsho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGL3Voj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B433E7BBE
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969832; cv=none; b=Za5YjA5+UOnXhzQwafVOnx/6W6Pwi95HW8ZgrXIHc7ntRrg3QPUg7cmPgjZ5MJ0a13at26UN9X4s5q24lU9TyczMXKWL1BNEjHQ4Afmfn3GyZ+r9P6qWzUpURNEzSOOw2aLz30eC6E3GlU4RPi/ooZuOwV82Ao+K7gz0qFKkaBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969832; c=relaxed/simple;
	bh=nAgVt2xAEFZtuaOqq6jd0Vh4fnWJrxaemGuTxFmU6ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HufdGo0aGgz1Z3C6Sk4ACSgt4Xw1cfUdPZDHDMfaT7BZM/ymA99w0YlnW1vLn5jm9UVJWskO+P10NLS/1Y7wWJclPLc9+Qrc+G6PIdZvk7Evip9ECRwUMwWr+/AU7Inb/41NNhE/eTXT7YGAT5pfT8nLpc4yG59tZ/7sJOH7k5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ha1nwsho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGL3Voj1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vaqq1697210
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 12:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XaK795TVjQqRmTeodIBGH0/Bly0QvKKdGJs
	tndQh7ng=; b=ha1nwshoiMOUFo410w4CcJnsV2rgS7p5srfwV7A6E4XRlxMPoGM
	9/2ZzVjIf37scsQvm6JWwaKEmCZ9hDbvYrhSc2vjry9QExG1Pi5BDVzhUzX79wFv
	W+7UppF3Y2+e7sujj+MmwhO48mxrHwy3r7+hh1IlzIXEaMYngAtGQw0G+XvN1nfS
	VVtCoZBMhMSOQBP5tPJJ6oM9jLnF2WiEmYqTvpxcdi86ZK5P8Terr+RtvujiAIcb
	QNwjx3ThqtJqW8QPutW4IMjjkN2jwODGU2HRqy4MCB+0FdVoSuDmW3Z+mexH8Lci
	gWOMDkPq0RVxsAAMNV7D1LPMWIev9E7lfhg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajncx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 12:03:49 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e65a0125c3so5340654a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779969829; x=1780574629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XaK795TVjQqRmTeodIBGH0/Bly0QvKKdGJstndQh7ng=;
        b=kGL3Voj1fy09aWNuvnnIJFjSOt9VVA03xa+48Z+e3h86x/cMhDJVpDslqwDvfR2UsY
         AoGDT94T8bxi9Goxv4Adf9g1v8RXRBQQaJxl+Df7AfzuYJk0ulchNjcVHPs9ueDV/sy8
         snsmb3U7xIBOMPIE40seZ48ASNOgp8Ywq5ggIs2KVsgpNDeLluBhjRRXe7vavt7NNs1e
         knYjGGni7JApwoTjMVlqqwDuwwewcobFf+mcYoN8ApqNpKoDF+//IUghlbu621Fk70u2
         6jkkjLQY11Y//Va6HwKnrEO4ZDvjzihbsc4G8ohe5EIXxJcVovhtEpSSuBGwJPe5splD
         qiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779969829; x=1780574629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaK795TVjQqRmTeodIBGH0/Bly0QvKKdGJstndQh7ng=;
        b=doZ1uU9rvgEQIL2jCcE/N06Vckyifgc6oBn8ZX7meA10kXJ/tO8DoNQoYwz01maVji
         MsJyFHJZOYgD/KXvY22/+UnF68DWMfgr5svBjcW4r/jLlU8I7ld54DcTSTprHsmzWr0q
         MZYI6FRXaB4pbapjiDPVuH7jzWWejzlqvcjAcBgNQNrlLixldFUxZ6vpIBEfoVYw8pBK
         7MA1VwkYCKajXHVuWp+Dg6Z/SORqq6zFNGW2PSJdcdfVeM5LM4B3qNn8QNtH5Wq8GQ8w
         AzsheHh5JAWU4yGS2p89QV29QtAqbYDOUJXCsfDuO93vpZ3RO0IwrD8D1PSAMqFlvDN2
         YSBw==
X-Forwarded-Encrypted: i=1; AFNElJ+3lPsrpvxvFQTCE3u4igp5RTrf7JIFL0OnSn0wxCCtR6nsjda8HUPq3G/rEA0gk0RmaOj1qMykLePVCZCd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy9mR7KeRnsaU49LETMfhZIk1wwHR5JvP4YOlKYxmYbIYvUjEf
	HBEtbQURVBscZerF7iV+4FUf8n+ZDKnMWFtfB5tqdKDIJrwoJkvtRBUbmdJxVz8sBkjn49v5Zj9
	kF6Yg68SgFTvKhLLUbO7STxPxo1eCyaHaWM3KOtg6AbpjnH9FT/WyR4hwEHHuma6gs2gt
X-Gm-Gg: Acq92OGReQfY9cNiIvLScYHdDaLR6Lipw00T16qt4whbewVirlk+ysPE//8btA2sJ4Q
	h8O/O16KjtYnZQwaO9ALXjLILdLW57Qy/ocn4tr7TpVxenA76JO5+YCSw0gsBBUWIhQwt+5oK3j
	UZtwd/GvaHzq8zLhm5TKgO/HDEnPo5zO3dE87eUa/3A0tEHRrku1wr3/8FT6RXb0SIVPOb4sjJH
	400bdt+yddenBrD7DcnWHcnWGm6gMfj7bdSL7v/jLEK6nMES9Pq6t6vqrPq9D83tde308zKEFrI
	gf67CIq1tqAMFfNaJk9G52uGbZu38DVwHgrhTAMDXbpc8AvxfZ4gG/uzPPWyEjRbkPid2VSd93P
	Q0/xGgtlz8g+Fa0sWJeZ/KasfOu8Kh8sQwra8EzeM2LFeEw==
X-Received: by 2002:a05:6830:4985:b0:7d7:fb8c:3c29 with SMTP id 46e09a7af769-7e5feeb63a7mr17670354a34.14.1779969829116;
        Thu, 28 May 2026 05:03:49 -0700 (PDT)
X-Received: by 2002:a05:6830:4985:b0:7d7:fb8c:3c29 with SMTP id 46e09a7af769-7e5feeb63a7mr17670303a34.14.1779969828441;
        Thu, 28 May 2026 05:03:48 -0700 (PDT)
Received: from quoll ([83.144.38.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ee2a12a69sm6467826f8f.16.2026.05.28.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:03:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: talos: Fix GMU unit address
Date: Thu, 28 May 2026 14:03:43 +0200
Message-ID: <20260528120342.46343-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _1UdP_j73Cdg79GOToc8GHeWf50PgSpZ
X-Proofpoint-GUID: _1UdP_j73Cdg79GOToc8GHeWf50PgSpZ
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a182f25 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=gYaODGAG9naNOzoQWaDNdQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=rz0GGPVgkkwhC3TLr2YA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyMiBTYWx0ZWRfX4qH8EyYf5UVJ
 DrT9LTOEB6gVxZXQqY2p5eDVTdA0WzBpOITxmBI3F6o+L/ORYy58ozv+AimbZJO/bM7Fe++kF7O
 cB/Ug61p5uzmi9AGKEgS0E3j1CLDYcLYXeNG9l6nH5MA7ybDBaZDgyU3hDoqJyJzw9ucREjPFyf
 s5pbLmuFzBrVamISWkPqTySJM6zy8pqUxle7Cuj54U2txybYnOTuqgcNPr7wIlLOJ+Jtsyau7c2
 ltWFEE4YqVrdnwIsbrLfP6JUTg6cJ7EA/FJcDTFmwtqJiHlYWVP1KeAViTUHbJINo2DuyCT+xsG
 fVXtLSDVcW6MwUe4WMiC0mQbe2MEXApNm6dKSjvYUy32tCfYs9FqG/Bm15UWFHGKkyhbuPLmE+K
 Ygjqo1qZFEKyR7pmz9Ig0kgccbYcKvbFmnwHIWx1QC1kSacRHCiENHkRQc7uZnmAqh+xzHIKFN/
 Tq4Uu6hx8T3Btfo4jug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280122
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110108-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,506a000:email,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,506d000:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC18A5F1E1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct unit address of GMU node to match 'reg' property and fix dtc W=1
warnings like:

  talos.dtsi:2020.20-2055.5: Warning (simple_bus_reg): /soc@0/gmu@506a000: simple-bus unit address format error, expected "506d000"

Fixes: 8de397a5618a ("arm64: dts: qcom: talos: Add gpu and rgmu nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..70df5db19e9a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2017,7 +2017,7 @@ opp-435000000 {
 			};
 		};
 
-		gmu: gmu@506a000 {
+		gmu: gmu@506d000 {
 			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
 			reg = <0x0 0x0506d000 0x0 0x2c000>;
 
-- 
2.53.0


