Return-Path: <linux-arm-msm+bounces-74693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E159B9C670
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE6357A9426
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 22:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD11298CA7;
	Wed, 24 Sep 2025 22:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm7k6HBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C8F27FD7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754746; cv=none; b=XoQBooIDMiI6ax4hBjBI368uhUbJY0Vze0DuxsAv8l2Bn67v68aJW4jqtIO4I0YRbe3K+xVPIDIUGXratTJfp4wOqUv4X8KF7bQyUA8eSCiCXfdSjVuPiich8WaINsvcVIkgwpPd/ozUvBGWTv4AlXA5Z4smIXD9gdGIBLUAwz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754746; c=relaxed/simple;
	bh=nccuP8cYHwqRLgitAVKUToM+oD9cA22ZoDKwCaULBko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HNpbA5tbvYhhW6eie78OOGWa7dKu/054kIlNED3WOMC8KLrdDEBNMocltigPnjDz8h/yz+sjjj9ELRwKirnEOHcMWAloeCtmzdaBIuzr5h4fn96PqXfPxjNIDAxH86GrSGcNKj/3HZeoYtd5OWLPlDU/5YNtdnzeYN9sH3ZlOkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm7k6HBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCq7k7020897
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fMgpIMFqrzsSm+B2qsU+OeemAY/LmfQHctAKtQNCtPI=; b=jm7k6HBIMgEFJDiZ
	YpF0lrJNdphuFuYAUSKWJNdvWUN8N2M8mRSRKdgVf6jUxuox0NWpgr54BtWegrmJ
	Ke/qFPoLGubR9H3I8YhH9xIng0JHH2T0lRNDRqbjFPBasQj1esxtwivShQh8H12o
	5MH3e6hopPigaf+EJJ8ZFvn1Y/SiMUu2Oxg+sRD9vbX/fGILbsw1zcGQeoUUIkOW
	sg6xjDxmqwy0Zc1VJVxKa1OuoD3Y7rNPcQOv0bdCU8pvdZHa+fK5/kY12VMnvG2T
	JLKhjNkzoCclLZrJtY/3W6SFqUEzl2A7jkJAgfvkFGxvNCXZKWwIfnSg6B8gDpqB
	chhaxA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy6e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5535902495so235329a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 15:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754744; x=1759359544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMgpIMFqrzsSm+B2qsU+OeemAY/LmfQHctAKtQNCtPI=;
        b=Ps5mjKhlweiDTssIrIFATQL75/YbZBoK/1TIFJxvkPpux8YNcfDY+X+qAbwAf8nx3p
         KFoRtWJXccABwrhvhsveK2QkZ6KlUXv7sDuXL10u/yKeRcXh7vr+6i/yGWX5NM4tE4fg
         1bKloWMPhQ03U/HStaTRzAhTAoh8LVch+QVU1bUBUMtppKOddja7eUyZMtPAtNNBJhoZ
         vJS3wCt4A/13E0q47tgrSXEQuYlauv0dTssQRuFe1MffMY2HmPZBBKC1kckCu4OfvjBW
         AXp5Ru5s5KiBFwx9NWlZMFfCCk/P+VPUABu2dhtjO3GUjgTKqUIsnP8oHlbzd2x9RWRU
         cvSg==
X-Gm-Message-State: AOJu0YyJ45fk3SzH8aOE0MKaquDfmIEbeIPy9MSHIlLcizlTY5Z1pc12
	LNgFW07gdXZgX3Q685/hdh623Gd0n7CA4qkogtWfppDyvjyNFs9lANhCKQnaRO3c2THeyOzXDlx
	/rMVhlmDtutFpINmMjHvQ58YbKOyD5qvREZP9inlf9h3ov5+MmynyweOmJnDnhygsovkX
X-Gm-Gg: ASbGncuKqO0xp8fTacG9Zic8WaVgz16Mey5N67KisLCdZV2sDBm4Ijg9BO3sXK+TZGG
	yG025imHBTibO84uwbGe3VliGPAr9xbGggNi1o9zGAGYpeflTuEAcAXH/i9Ef8zfgLvWCFvDeiJ
	P18Ys6kZIZKi1s7OGVUCAaRUwVe2iLBjy1kXx3sVBXJIn8gZyhL9O5YnFo+KsG2zjXyRaf7NMle
	Dk22pyWrd1hhEtf5bTbbSHSCjTHP6F12TKSY13e2RFCIq0QuJa6Whikgx4hYv2kgm4OE1r891fU
	zsIPHd+3NuOvJBpSgQkGMDXJXiyr57yFpHXuVGbj4YxJWDrq07Q1oxZjBujLFDWG9+ZH8499ZYI
	QPQLVgLF0I7uujdE=
X-Received: by 2002:a05:6a21:3396:b0:2b1:c9dc:6dab with SMTP id adf61e73a8af0-2e7d2e45e02mr1491856637.48.1758754743634;
        Wed, 24 Sep 2025 15:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXb9iTgoVPLaR0CHqKB/TzfTzAqbsVbT7DO5mubz2WWzmbtksZ6qJqUAfhpQ7FIRENwBXqKg==
X-Received: by 2002:a05:6a21:3396:b0:2b1:c9dc:6dab with SMTP id adf61e73a8af0-2e7d2e45e02mr1491833637.48.1758754743202;
        Wed, 24 Sep 2025 15:59:03 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2b70esm111166b3a.101.2025.09.24.15.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:59:02 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 15:58:53 -0700
Subject: [PATCH 1/9] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-clk-v1-1-29b02b818782@oss.qualcomm.com>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754740; l=821;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=phKtN7ebMiQmSiG9AvoMUJXIakeBUvWlreynI7Iyig8=;
 b=/3h8ths0TYSVixc4PJayGd+ZArZnNhGQdhWuSaG6FBjv6i2DsdzTmRt/5hBJ6Hml81JAvRwgR
 UQ4zAULmxV0DoyWOG5l/TEUw5iFD9IXHvhE/n+LddOV7VNcB3QHbzKQ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: KXHCnsvshVSHsIUImakw3tQQJmmByryr
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d477b8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=b6mPgT8S7ijOLrz7_y4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: KXHCnsvshVSHsIUImakw3tQQJmmByryr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX2eoBCUx37fHI
 XtFFOxpMcsGo101hJItEMSNstR18O8OfkLobhdbMT041REpXKUiH4OZrCIecmkPshp6ZTnyY4zz
 TxT0ubghyij3BEZBVABVXazvvCGVgjFkvJsmurwMTyxj52rZ/lwT5jW9kyRqfdkBElSarw/+kLJ
 caCyT1dKCmHSMPjFizzNXP3UiCBQPe+ybtarmEORa08th23Wbx5DLuwDBknSjLY5wvVpAJWeruJ
 qFi6y9a5jYL9s4GYeC1qf7VEGiUoKF/z+YQc3WsrA1TrbY2iMCykMzUc5dRoSJGpuNk/Tke6FMS
 6PD0VUVCCUu+JMCEeOBhKUQqleA5AaLU8v+5xMhPvmPjUZyOVn4vl+XoR/fkjIieQUvPbpfJa/o
 PXCCE6m2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for clock rpmh driver on Kaanapali SoCs.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 78fa05726685..3f5f1336262e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-rpmh-clk
+      - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk

-- 
2.25.1


