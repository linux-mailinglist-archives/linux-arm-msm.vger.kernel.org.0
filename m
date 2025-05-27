Return-Path: <linux-arm-msm+bounces-59465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF0EAC4609
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 03:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DCCA3B45FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 01:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5F77263D;
	Tue, 27 May 2025 01:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwubHAZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD152CCDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 01:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748310753; cv=none; b=IrCte/yscbx13GwU223MxkA6eXIEMA8Ko9khYK8TvLKVLmmApmrIC+ApRyagLx92sRUEjBS4ybaQiGCdOd6rNNHneLE8E0R1pc14KJv6D766e+J7n77jWoyWBkVTnB+6bfWsF2fPlsUrW/E8R10rQaADyHOX8f6BspvAX4N37bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748310753; c=relaxed/simple;
	bh=CG+PP32bYH5YOvtuUJkh5a/nT0blAza6nTpuGQ+bD4M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SLrbPid788i/R/xa4ZLxMrjkk8I5LqarbXvFtvhs1td6N0td5bePjwJ0ScthdcckKC7gGqZZyD447K8wLmHJ7Pxn++ZXwVxXFIR8K50n0fumohTqmOE2mH+VsV9TH9+3076PruTSAbeloD2xz6ZU9I5t+GBYMXvxItFoYSKSQ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwubHAZk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9uVXD021749
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 01:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RPhwXL2UFBJXwjDP+zU7U8xZYZF+dHPJAih
	YI0JxkmQ=; b=SwubHAZk2hTvIFYO0qPF3GDTM9UBr6AcrTV7gQztEYhGDm83bCE
	6FpX9kUGl7W0mW3t3w6qtm8GJhPAB4YCT0OetXgjOY5THinhet6ytuyqM/nVNVun
	OCOaH7iGIrbC6V12cRPAWUZn7/W4hklQ9BcuPgivlMzjF3fmvPXg8FVSiL8hpgST
	iObz45+0ZU4A4rp5urwJ0UJM8PIOlp1qoBBMQlvpSSofCmp1zwLZDx2GGtZBE3ii
	aHDK8o5vB3BtVora/l5GgVA8VqC5pcM4qfHIS0s11hHgy/Ry5yxF1pGW3G726Wg7
	fVwddH/OXTqTzpU34sMmd0D7HzRADkn7OYg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjnaqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 01:52:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso1892651a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 18:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748310750; x=1748915550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPhwXL2UFBJXwjDP+zU7U8xZYZF+dHPJAihYI0JxkmQ=;
        b=ECME5BqBZh4xtMdA/IJyDsezSD67njp9+r6qBiUb4eTw1KK4IYamnFkaDj8WiU3asz
         8GoxHYpMlIJTMMXgHxhhgbmn4mo3QPI+n+bWdnZf0pexFfQq5PfNao/POHggEhGtIYYU
         59KsaYDJ/nuw0Ql75dNJv9vyRTx2qW1xSEW+6RvVP282CfOunfhvW5/JRifVe7QCWOzg
         f+RifL4flz5UzZQF51RIk54kDltYrUL2pKjUYMbm+2pKaGgMNJxzBHhTS0vqkht46Ttt
         C7fzAHOB3RbM/oVsBY7D6vnLinbQ8zvz2fTdNq8J6HWRMn6GDxzNGn9jhYKm0wugHXdM
         8uQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCei6SxgOghUpimEiD5BZU3xjjrFJCyAwI9f7QzTi1DHAf/gKwl4A19pUsQbpvbWV/J8epFirirGSDRiCS@vger.kernel.org
X-Gm-Message-State: AOJu0YxWqYTzWDCQhwtZG5TZfTYMtppi2AvjmZM0ikkfWqtfW0iTg+Q6
	mUeExirSl4W5/vEEnickYyDwXErK2iKxGmt9s1vWHh8ou0Wx8yHROB+AP/0zjhwOjPESMPce+hI
	rrGEf4/hH2/h+0B3rqHT/NYf0XphF/mo+CpgdfzYYrMMQEluLwDmiAS3Ir/bj1IIbGoBb
X-Gm-Gg: ASbGncv3vpYeXgVdqbngDc+kdi4OSTle2nU9zFfeiNtwUCodtDt1UcjH+Hxyik7IBEs
	dP3tUoeJB6FayL4iJtZYuG5Av9ZuOsHty1QxuKMuQ/mohkB8PhXro/fa6osq56a+v5GnO3Wv+dQ
	4Vg9p9ZSIvlnl7tx9Fc8FSr3rL+pMc9MMVFrgR0zrPzFT0rJ2LIoF4lOdD/N/AhD8ALUY7PJcDh
	Jusxx5fAx4VsWGkH/jAzfNCrAS3ktFIOJP0pWR/BD4T+sRXc+UnWrPudz3sf79sfLXV4lr5p4/u
	TiakQQiX9VgyIRxSQ8QWbTTCuFA3TEAZ+uztA8uCa88pth5sWvindUvRh16EQis0oTjY
X-Received: by 2002:a05:6a20:c681:b0:215:dacf:5746 with SMTP id adf61e73a8af0-2188b718813mr17634676637.19.1748310749929;
        Mon, 26 May 2025 18:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSAyTJNwocBVvaOW4Z+yLvgjBUFE4WYUxXDmztiuQzbkBUKlG03gV7hY0SgRsqa5YgpwcR5w==
X-Received: by 2002:a05:6a20:c681:b0:215:dacf:5746 with SMTP id adf61e73a8af0-2188b718813mr17634647637.19.1748310749549;
        Mon, 26 May 2025 18:52:29 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74615cac674sm2000888b3a.153.2025.05.26.18.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 18:52:28 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the camera block
Date: Tue, 27 May 2025 09:52:24 +0800
Message-Id: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68351ade cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=95F7GRXi1wRhAKWngM4A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: xQ59ihGR6U-01h8uJdeVPnmdaDeCLSfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDAxMiBTYWx0ZWRfX/F7Uj+NkYUJ6
 Pd517xRCEtI5H0Q01qtKSrl9fghnDkpICJ9J/zxK1exeok/SZwf3o7BFuXD3/BEbnz6KDDfSAlU
 SMossg/Zg4xIwJ0H5fV3AQt673Q7bXdzt2bBWCLupVR5lK59iHvr3SoxJGvs32yukxCwPZG+Ah4
 9TnPwhehZYIKebiWr4fuv0ePsJ77tjEKi9KC/ANpkFTiHOvzmd6SzrvzOcBIptZWlzf1TpsNQXs
 SKg73V8CoDZtyenM5cJetmat1TtlaAWeLvZO8v2BTWm51s0ujxVqb2Iz9R5Ily0T8Jx8an5+ZrR
 YvsFjB7DiJOi0PErYedrr/WhmhmfS2XrdbgGoFLZI+zmPGpuyUeVWvQ7Jip2NYbCbwYQDaHHuYy
 ruAdT50fzaPy/L1LAcEJLbnxOrmyCiDs0gQW2TjLMtdFEvrHYMjosw74fVEX/086r7NoIg2v
X-Proofpoint-GUID: xQ59ihGR6U-01h8uJdeVPnmdaDeCLSfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_01,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=676 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270012

Disable the CTI device of the camera block to prevent potential NoC errors
during AMBA bus device matching.

The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
through a mailbox. However, the camera block resides outside the AP domain,
meaning its QDSS clock cannot be controlled via aoss_qmp.

Fixes: bf469630552a ("arm64: dts: qcom: qcs615: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 559d3a4ba605..a31920691b65 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -2462,6 +2462,7 @@ cti@6c13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			status = "disabled";
 		};
 
 		cti@6c20000 {
-- 
2.34.1


