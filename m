Return-Path: <linux-arm-msm+bounces-63606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECBAF8833
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 118D0584493
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 06:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E21026156B;
	Fri,  4 Jul 2025 06:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K//zEAGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1B261390
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611418; cv=none; b=tbPGSE3pFGnm7ltq9OlxdwwhDQdNkzRsXnUHRX35J7XCpQ/jp5DV3WRBj7hGF/Rd3ORCLZKsmAi8fOWsVQaJhUUZOmsfGBqdEJWvhd1XIP04bO2RtBSSDCmcx23vThRrHv1XZLbg3N83tHAmJey2n7oo08W7dyH7/yN65Vi7uuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611418; c=relaxed/simple;
	bh=jty4VCWzrjoGz/VBm938Vlu8XxCsF0DbU+pvnjj1hug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=juWf5H/KNx33PRIA57V3MtosTX/+yLdTK6/meTesPDm1olH5+JJqVfgVWl5lh6N+7+ZeuBv3Xdxv68Ur9XwB6AA+/ix4K4Z2ijGy88gR6q6+NMUZl/Jpt7YXIGqkayk+ia6ZUtrt/po+FUkbSFTuhh9CzuM6Yf3cQGzHjQot1c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K//zEAGH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645k743024702
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 06:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2XKEYcroMPJpNNqAp+mZe5
	8vSDLDJjE9DwyGFdh30rI=; b=K//zEAGH12LDm4ottBih6fb6i/liqmGQzNiEkY
	1avkUqw9E43Ig+b+RW/mKgImOQAn1pHK78fy+c9soke0n396+RcQK3tPFBqASZxv
	kiocjyu/laBEApsmJsqdUVKdhzGcd1yXH0kciOmlV7wwtAlkrCT5mIrkXLwmJCus
	/9H/35kjeLRso0AQxw8GFYBHSLQnLOuEnfBJ1n/Z3Bne3Z11ANH+PAGJxKhUo3zc
	/jPST8xDVsFqD2YoKRq10nG3uRUK3IHlx30qSQbp+D1O7w7ojHxUI82oBbn3n6yF
	gwU8zWH71przlJ4C/2YbZg6/ZtAcAmcJEBeVmO3N9PLDgfqQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9tt5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 06:43:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso707466a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 23:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611414; x=1752216214;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XKEYcroMPJpNNqAp+mZe58vSDLDJjE9DwyGFdh30rI=;
        b=j/i3MsmzeOM/xURYoPdJhaMNwsarLiHmQFXnsfXQmeGa0iqXOSSoAeLCDwbjuwkzjh
         g5gPSE1bqqm/yOW46WensnvxWbkZvfFkzMgDtXyHeP3KnlcVvhu8oW7yIutWuL/5lmq6
         SPqqEfLYENZq78/s2jSkcxNiKVh2SwM9aNcBlw93Ouh6KntwL84CZYg+k8w9EYsqZJQo
         ssp2rRv0COcIEaj5wfaHDa8FIAaHZRvkPGiV2YoE3nzUevxbLXkzMyWtzj+3P/aQxx1S
         6jfe9wc2jmuvJ4sX9V/56AJPjfJPIoBvdCmeB/y4rrqPiw+PH8L9dcpkG/J2vyW4bRjK
         K9Cw==
X-Gm-Message-State: AOJu0YwrT0z7Jk7hqYow0v5fcDHI8oi/rLsJAQqYXwRtdUCOuNcYUyl1
	wIPd87SP9SjieGEb/1ZpWBQe7TVj7gJGaG+v32oAvOZs/7nt8aTDFjKG/C5inTJs8fFuYiR8moM
	+ZA5tPFwbv5K+fBB5HwXw3FfgctOYRF6fdjuODnUIJtfHQVKerABop3KtxKX5tgvK+UNO
X-Gm-Gg: ASbGncs9s+4emd7lvm7BG0V0vqIpQYxNE1HeakaOEhE5+mDOlXDpFCN12j9NcLTzFDO
	LnJZq2BoYpviFznNTHGJtrQ6M4ocYx89Z7IIOjHKProy4zXS8ggfUctPAnGSG9EVMnXmvSF6vQw
	XZoKRSvPBBV0f+IE+VLHmU6eTkn26mjWcEBhKZtYvY0iTd51l9FTBbPhkEXaJKoAINR51fWbJJA
	pd8atwzWfaD7SLmxoCxqfjvOB9Hnjw3Ex4qKWkXFq31pKsE+/3Yqc+vzDl/bG4YMEZTDQm/ACbA
	B52H+obeZm1aY43uMu9aCD0AqIEwyHxi5n9NFMHi7BXTUq9wHq8ey1o4FZBs6ilP6Cvma/or3qO
	7yMdP65rM4Q==
X-Received: by 2002:a17:90b:5205:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-31aac43e002mr2637654a91.2.1751611413977;
        Thu, 03 Jul 2025 23:43:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTji2b7g7CyyIxHemh62b65s7VRcn5dEfOSvtJ3uANGqEo+LW+UVy053hMzPuc8XBnv5oONQ==
X-Received: by 2002:a17:90b:5205:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-31aac43e002mr2637606a91.2.1751611413412;
        Thu, 03 Jul 2025 23:43:33 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae3e24asm1260338a91.5.2025.07.03.23.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 23:43:32 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add WiFi/BT node for qcs615 ride board.
Date: Fri, 04 Jul 2025 14:43:19 +0800
Message-Id: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAh4Z2gC/22QzWrDMBCEX8XoXBmt/mVK6XuEHmR53QjquLFsk
 x/87pWVXkpzEcyy882s7iThFDGRprqTCdeY4njKQrxUJBz96RNp7LImnHHFDJNUg6IcAlcAFh0
 4kje/J+zjpVAOHw894XnJsPkxJAOm5AusqV5/WYI5pQWrtXZMSgr0Fq8L1rc99n1MqT4v/iuMw
 1Dn523PaX1Cuk/i3FS200FZIXgw3rY+M/vQe6Otta0OwnRtQKeFIHujY0zzOF3LmSuUSn8uWiH
 nB+dAOil7NOJfgYJZ+RMrz9b8GZ3RLCjP4Yl127Yf+6Ax/GoBAAA=
X-Change-ID: 20250704-615-21c25118e919
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751611410; l=1477;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=jty4VCWzrjoGz/VBm938Vlu8XxCsF0DbU+pvnjj1hug=;
 b=AkusZETtP4gSlZHAz5lfczZAYTe+yL8YIor+o5MI7IOpL6AVON3IlHmTHvvjEBMJcu1dp4a2s
 OOHO/ZozS6nAIWrqNs9SKMql4H4nFg0jmbWdLKfg3sW/IGnw5sw7wS2
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68677817 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=TmzUbGvDyKMaPb01JRcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fgwzUtl_Hm9mP-ToJwy-OJdaAuq9xAnQ
X-Proofpoint-GUID: fgwzUtl_Hm9mP-ToJwy-OJdaAuq9xAnQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA1MSBTYWx0ZWRfX57C+FaPRthxp
 53znUwSEIthrH/8ztFtXs0WDUtGQqNtv4YYrhL4RbrsME5BQaRQzOz7islHKSxw6ihibexrIAEG
 nswOMGeutXr98IBghyHaFGtQme6TcVLbxiIz+NzOpdbSUuYrMEH19rJ0diHTknlIYry5Pgnj+5s
 Z6eC8IiMHKDnIpf2AiuS1IJyqLMzWSRj7GqwntYH+YF/hdMRYERZexYNhio4503JQkg67tknVPj
 AvTTWC1zhLQwE5xBCOSUgB8WhkvieE2sOuGcowlfkeIhBGC28vOBudeC77Lt8Zgxh9qDD/DzukZ
 LeSvF0KOlUyjIeTK4xmoVcfdIHBlNnora7D5QwBdqIo6dbnkcHFFdEqj8dSHAh7aWWG6tSuWCSz
 siEKp77be3eqIC3cu/VR+YO0kR2fiTjh5QsSliEdcdcKBS0iyeuwrJ5LyZ+yYssydIfH48f1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040051

This patch series depends on:
- PCIe
https://lore.kernel.org/all/20250703095630.669044-1-ziyue.zhang@oss.qualcomm.com/

Changes in v3:
- Formatting: adjust layout based on reviewer feedback.
- Fix DT checking warnings.
- Link to v2:
  https://lore.kernel.org/r/20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com

Changes in V2:
- Correct the version metadata of the previous patch.
- Separate the modifications to the DTS and DTSI files into different
  commits.
- Formatting: adjust layout based on reviewer feedback.
- Updated the email address.
- Link to v1:
  https://lore.kernel.org/all/20241203060318.1750927-1-quic_yuzha@quicinc.com/

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
---
Yu Zhang(Yuriy) (2):
      arm64: dts: qcom: qcs615: add a PCIe port for WLAN
      arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     |   9 +++
 2 files changed, 144 insertions(+)
---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250704-615-21c25118e919
prerequisite-message-id: <20250703095630.669044-1-ziyue.zhang@oss.qualcomm.com>
prerequisite-patch-id: 37d5ab98a6918dba98ef8fd7e6c91ab98aace170
prerequisite-patch-id: 1693faa1e23bbb0a37d4fb9cbe13e5dd43148ce8
prerequisite-patch-id: efa688b2ddd5744df7aef40182787ee4ceb90c98

Best regards,
-- 
Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>


