Return-Path: <linux-arm-msm+bounces-68629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF2B21B69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 776383AC600
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BAD2DAFBB;
	Tue, 12 Aug 2025 03:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4RUZNOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B212426529E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754968313; cv=none; b=u9a6cL8eI6X7x/Xa6y03tu9tplCFwUOgpbg9BP9t5qi+Gi74gka8+gx/E2hKaHS9VUev4do9Ef1OaW/ME3mctOW/6ividVSxlSQ5Z3Y8s1T0j+Nab+fuvlxY6cnB2ZOmAfEThkNyJHrXv86POTBgbL5NC/zdKdA+C2Ted1o9mvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754968313; c=relaxed/simple;
	bh=yAYPEUK08VYj2ujcch9sT+wEp8YxtQPuLJnVvGWBCps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIHU7E6oEiSDLazAuEJOfUzxldXt+aXFC+evmri9O+oC+8Praipq4TGARxm6q3KTUet3f3MVlTg8KHsJLdeqB16DpkM9p9IZdS9kzAwpA7hUtRbyq+sgWZnM1nv6N9kutFiGC7foOrYZGfJTzuOTxHFV5knwjYZUuF2O/lbrIxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4RUZNOB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BGdWnJ029204
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	koGcEsmeJ1+5mqLjlYSSxGm4OKtlykXOE+APf7A3PYE=; b=b4RUZNOBsCP4dlYm
	8qxEV1BmZk72gT4/JbsQHHhlbNePEtFQ4gqUCCqKROUKygdh7+2l8uVQmnB3tKDj
	LggyrajmWngFSg26/4QEc+4fLBDYXLHYSL60RMXHDGhyqk6lbM0Su4a32Dj+WOvN
	yUF1ALkNs4U1q04Pz9Q+2FVhLy6zdq4yvaZsa/xmAM8KqG3U8fO42iYb3wlOGTIC
	dB3bTwJouIKSX2ugGK15xwhYRHmEsddvqyNyaUy/j5oN/ceRP/0QAJn/pf3DY4Fa
	91SvvttWT4nORM+9UlcXEeCF5/HxD7Ws4hYkYWe1RDriVFoQnKxzX5oa5ePqH7GU
	B6OtLA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9spqyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:11:50 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-30307350af2so9284078fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 20:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754968310; x=1755573110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koGcEsmeJ1+5mqLjlYSSxGm4OKtlykXOE+APf7A3PYE=;
        b=RrI41Ue+VEAy3e7AhbhyWuo0IEtQ43ZiTfIUR13Crylnoj2AmmGp/bY51OgD2Hs0RH
         dF9jrMrmQdYdXBzohlp5U0WuRFlYWGDY7SYxN/H+fKxorEfjsscx9C6syQ6k3asIvVdu
         lBxL+j5GvYrVyXMywWvi6ozDQ0rSGl0P5eSYV9C4tcX7iPeMObHvO7bJRtY+6JEG2B9u
         W351FDsidQf9ph0vowFXUasl68bZnxW3wyZlBa2AAU4x+N7WLJticAvtVu/P5fq5ButT
         IGuKs3gv79AJmNecAO4Gos2sG0qxRhm8szpbZ8fQyzAKiY2KBcLOrsO/yUxLEmgXPYEo
         QoXg==
X-Gm-Message-State: AOJu0YyGhZhT5BM0h93gXEK9Y3Od1hr8rYCzYYnTSh/PvgNL/u6v6JS+
	euuljsFUQthTnM4qYKLfU9l1s6odXfBH9+LrJQilhxVjtz6ujmIEoLaoCiZVS9+ZDb7WZXF37r3
	T3fGT4ZevszmUWSCczBOCHjdrje99bvRC9Zl3I5b08dY/fbHpg78ymHEUmq6LnsHBWOl2
X-Gm-Gg: ASbGncs6a1jUPzJiWrdCNJ/XG6StBNhPKJSfa3py6zQK+OddD07ZyDg0p/zv0XPDfRF
	HDYrTLkkfMZehEN1c84ZKuA9bVfL0p3cufCh+ENEpE0YtMr4fL2t8/EvyZMlbDyGqiMYu0oRFsm
	mryR8BFgKX7MIPaeUZv4Y3H40Ind+7725G92fv0WRj7UJuUuAIHcS6tUM89O45JaLwEoc54GcPC
	YaOLqWkDDckyDFIIsMSgsdkgfFbpZnwjY0cpwdHOjsGpnjsu1snHXvIi9U/jo2d3aB2KrSia6TO
	fdaalFqtPvkHToVzp5xytmuCMM+zbSR4rcS3gnZWSmiVbx69cnU5+VyK+AYvQPkCp85CBrHIp4Y
	O330jSRDw5CT6O5lGg4+TbfnrYR+tgibrP1jCQ1g=
X-Received: by 2002:a05:6871:8305:b0:2bc:918c:ee04 with SMTP id 586e51a60fabf-30c20f1f6abmr9606645fac.14.1754968309915;
        Mon, 11 Aug 2025 20:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcrtot4++AM2DTQZDZVUqKw/I6MmXZTfbfJDZPGmRoZtqtAJkZ4YF8l2jc6IaKXeGSuDOFrQ==
X-Received: by 2002:a05:6871:8305:b0:2bc:918c:ee04 with SMTP id 586e51a60fabf-30c20f1f6abmr9606629fac.14.1754968309569;
        Mon, 11 Aug 2025 20:11:49 -0700 (PDT)
Received: from [192.168.86.68] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-307a717f0c9sm8174531fac.13.2025.08.11.20.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 20:11:49 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 22:11:33 -0500
Subject: [PATCH 1/3] dt-bindings: clock: dispcc-sc7280: Add display resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-sc7280-mdss-reset-v1-1-83ceff1d48de@oss.qualcomm.com>
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=828;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=yAYPEUK08VYj2ujcch9sT+wEp8YxtQPuLJnVvGWBCps=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBomrDzIVrU2qOI4utrb3zu6aJ3bGes/Jv8BjFbV
 chxKEUzWSiJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaJqw8xUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVYkw/8ClZbWphkBhh7Fh0H2wi223597q9cOeVWPcy7vDx
 svRcPIipdrdKVTfUyoCerM9qqXbsZ7d9fwkyEUme8p/TGI9bbFpbo9DfdpR8HpGstKn3mnJVkMq
 RTMvt1LsGaZbpxmPIv7kR+YuMkIsZtYSd0+9voSJB5kbDHHyjYGjyf1fVqgkoS1uKgMJvVDpuEf
 /Vmd/slrfDTqCWuAQGNw/GWJZhuvHHH6rC7WyUfBJscEY3A4PSpmJwWHM4WLorGBhmLaRhJRRg6
 S5CglPa+U8MAFduqQrZT1PuQZVNdvUhAl2qangbbakz9Ss4O2Huj3uEpPJ4gyy4CWyHDolNJM9U
 J+0f23PlalCxN/Z/wHGd3I02zu77klHhIV8QFZtQhXHUwynDvbLGEuKN8KW6EDcZgpkI3ykVh06
 T1LixADBfu7zUpn1ECmhZ2kFEOKAR3Bj4o4ZHK4CxXn5b21AR26/0/iy/MrgbaI4DHqrm8yG4Qv
 SJMlCi+DoZIx7WJh4RjwZiZx4TT/coY+BoEPOyoVJpR9xe4Y+Ndkx8GqNE+dpVL5uXL0E5eaZFU
 ZT0HTLRQk0/QZjRoSCv4gdWpuKdxsFTC+lqC5Ik8pQgCzNMWp3PzdiZ7HvCDdzLaLsBB1cob4UR
 MvAff+ZpagZsXF5ox7pDxRMn/WQ8t6DAEVak3dLIosWY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689ab0f7 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ZzzWQa5D6bKC9TZe_doA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: y6GNQXE6muOJrIy-xrN6vJ4WBPJN2GjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX5PqMeTYTdged
 jUvkM39ZKau6a+aJuulozy6yQS9AZ+6LwsjDA1Umrbekz84y8tEd4Q1YnDsQ5ytwzMkFJGY5pIf
 ctjn9FZ/gaMrtVi8K+JsMBS2ojm7e3VG9lstcT8lGTBcYTqi31LVhPX9VJqIEdo8nuc62cgm9ns
 4ISqxEEpGAgZ5BX5ijYKh43TAeY6nv+a5soUV6nwV6jYLUn9xiTIfzyOLq/w+/ktpbIf+ZBcaPc
 7a3ctAzR8iAQ1/BE0NOJ/9VLDpLpWSBzwdawkSl4nlU/K4GtPSa20D/AY8+NpTnBsoqZ046rQ0o
 2IKomv1QupODz4qSWzkyrH/hAXpHNm45iJnz5Pna6hZsH2hHKXdLYJgyUhgckwt08oTjwaF3veq
 nDbbmxss
X-Proofpoint-GUID: y6GNQXE6muOJrIy-xrN6vJ4WBPJN2GjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Like other platforms the sc7280 display clock controller provides a
couple of resets, add the defines to allow referring to them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
index a4a692c20acfc954251fd1a1a59239ac62b20015..9f113f346be80b8a7815ffb17a6a6ce5e008f663 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
@@ -52,4 +52,8 @@
 /* DISP_CC power domains */
 #define DISP_CC_MDSS_CORE_GDSC				0
 
+/* DISPCC resets */
+#define DISP_CC_MDSS_CORE_BCR				0
+#define DISP_CC_MDSS_RSCC_BCR				1
+
 #endif

-- 
2.49.0


