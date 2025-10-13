Return-Path: <linux-arm-msm+bounces-76906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D02BD110B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 03:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 130791893CD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 01:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D8F1E9B0D;
	Mon, 13 Oct 2025 01:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQGuRgAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74212186A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760318053; cv=none; b=JiTuLMlKlazMs4WcLgyNkbilme7Zu7C9hgP9c6UwPyXqDT+IV2IwBs8EIoPgjKN3TthUigcOfICGgX+44w4rVhJr7L9kg/T/WDDlgtzekeYBHfvjKJ8QThC21zl+o65fuoP55NgWsAMY4RzXS6NVnjWceLLi4c6zRcQfvt5t8W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760318053; c=relaxed/simple;
	bh=vYTNGVpJqfVNWqTFnghL5MAMhtBYnTD2XCWEwdgn2To=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YKV0/QhhsYsG7tU/dMg27r/KFcdv6YyDRJNm/VehNdXKuXgkatgEj2PPohKGZWjVpPrSfeSbef4BujkgwMEozeU9e1kzJtdLAKSZvEcJ07I45l/Ke4M0Hu7z4jlQoGEqlRlt8GDeeWRVVMMP+LeRT22ddqWsdCRnIvVMnSi3UtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQGuRgAr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CNBh02022822
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vK+SJgwnOTEZYAlMkPB/qihU7mC9Y5KP7ce
	r6c8Azng=; b=gQGuRgAr0p8shwpEcS1em5PgCzaRp7SDskDjDsJRc7IgOj83lGS
	xZ1YUXq73s254/R5Anbp2PwBB8lWyQGUzLZXRi1A3kilMkJEIiqcmf2Wfw7/b9TY
	qXSc3pv29gdT6dPlQix0h3b8/uwcWe3EjPHdS5sYk+aKhc+9srfqSvc+bPfCPLBh
	wO0t4Z9b2JwjVVpk6MGbCfzTC47o39aWnZu/lyb8whnYzzNIsdiuJUFUk4cakj/r
	gfzl+1wX1DxDyhEiCK/PUshUBjSqdcXGd7nMw22kRzoLm26ymfK4ZbBwCqIJXa80
	mi7q31M+i9t5zRtuoWJL/MNvj2MdI6uP6ZA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbs2tur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:14:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4c72281674so5854966a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 18:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760318049; x=1760922849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vK+SJgwnOTEZYAlMkPB/qihU7mC9Y5KP7cer6c8Azng=;
        b=dG/7qu632Ksv6Krehg2VFlAtEYy/Gi4GjXAdbXzUhU4RT2ZX0+WVOZlRWhwirjvc8s
         +EaqC4LUAEZBbWVNOdiY1/HO1+DRQZ6P+AyUUOa1N88vPuYNOD5EVbxeMDsQB/T33dfF
         3zblQrV4HC5SnC/mFjaO/dZpUnxS/fkmVf3oc7e1VMZPTgSWh8+kDQSOy0olNsj5nKpE
         mmqOcxvkZ1EVrwQK+t3JBSVynRVBREp7IaZkGquY9CwSXe3CBsFUrvm27lNk3hgqPCi6
         TrbZdR5yi50AcsGeQwp9vlaNnYB6HNTkPwvSDaaZNrvFUNdV25Xba2NMky3GGLc7ilmg
         /URA==
X-Gm-Message-State: AOJu0YyCIQX3WOl6pLArpKDS2iUB5GtcytoEB9r+kyYzXLrCf/lzBjSS
	pjCYXvssVXZDrtkhDR6cadv+CNJsEgqtB9LmlKtiFagPnYnP0JUradBG+CW8PYLF6g4Iz5DFL3o
	dEHqpAZOGtrabSkbNZL+WiQ0/CTMdWAUfrk49YnVRSSq4Cky7q1Hi3siKmQpCPoFM+EuJ
X-Gm-Gg: ASbGncv/iF1qE+kQBUbaIvGQF7GfhXbWeTL+LcnDTqVx76lDp3Usyi0jrodOgrgr2zg
	XXtNVFNgTmIYWTcJd51EOzPUQRrSLX8B6A2Dov8hjRkAiZ0GA6PL3akCjF/Imj7H+mjpl5woRrt
	J5yRPhfUo/teeVsfBmT4HPUbw3nM+mGHGBwhZBfPTscbyWaZy0Bn7/x28zUhWMQAFIKWi2oTzmE
	C177x0fkwAUJWs3DaaKUe9UizXBwbbxkdW/XHxXoE0KYifzQzHz006nkd156dCulkR2V//tr1Pb
	tx+7M+i7jlSrkfk49KzbvCCiBlx39zFtb/3UuaL971jPmWy9jprfj/TwdvyRp9NSkisx/A4qkGj
	a/w==
X-Received: by 2002:a05:6a21:4843:b0:32d:b925:246e with SMTP id adf61e73a8af0-32db9254d9cmr17513629637.43.1760318048826;
        Sun, 12 Oct 2025 18:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2QXwY3MOrK4ad1ja2OEJVP5yyAqc35NeoeynehrZkJOMLTtorm2RzOTEzGNzwKQ3z/GLTDQ==
X-Received: by 2002:a05:6a21:4843:b0:32d:b925:246e with SMTP id adf61e73a8af0-32db9254d9cmr17513603637.43.1760318048362;
        Sun, 12 Oct 2025 18:14:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb11ca0sm9672647b3a.32.2025.10.12.18.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:14:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix bindings for X1E80100
Date: Mon, 13 Oct 2025 06:43:57 +0530
Message-Id: <20251013011357.732151-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzmw/diNGJvqj
 Kh0ZNVkqn6hmhs2XWMypg9hGy/ZzwPaYnat3W8OhI62Xnobp6vKAPDldh9tQmbyzrsDReP4uCQg
 n0KMpm2niYPwj0Yf+UYahUAzoB2o1cLT0s3w2Ckitdk1H2sZPsoAdKkDdhOsG7gYlKLA3E4BF47
 8KcfhnxAH3q3uiTA7eUuBBFIphUDcoEmaDnoXd3QvmReTTGAYJ9P4BOkXOlUZSUY9kI6r3J6w1H
 RHgu5m2+U6Z61zZx0PJRiwchM4htfphO3l1dX7WK9KAqFRiYTYCBn+HsAdb++RUNSEslrmFYzhq
 lJD/irwtvEMRk5cFHWcKQYf48i4UBYmIcIUNClzvGkjWYcvnxZq0gf4GKzd4lfKcYs7HVrVUO+l
 xlb070nhJkucSQmcQdtZDprMr6K2OA==
X-Proofpoint-ORIG-GUID: 89TFBWD5dQRw37NsE2Vnmwqt2b0H1lSO
X-Proofpoint-GUID: 89TFBWD5dQRw37NsE2Vnmwqt2b0H1lSO
X-Authority-Analysis: v=2.4 cv=U7SfzOru c=1 sm=1 tr=0 ts=68ec5261 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=QltsTdpWXtN-n1SMwaMA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Add the missing multiport controller binding to target list.

Fix minItems for interrupt-names to avoid the following error on High
Speed controller:

usb@a200000: interrupt-names: ['dwc_usb3', 'pwr_event',
'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
The above issues were found when effort was being put in to
flatten usb controller nodes on X1E80100.

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index dfd084ed9024..d49a58d5478f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -68,6 +68,7 @@ properties:
           - qcom,sm8550-dwc3
           - qcom,sm8650-dwc3
           - qcom,x1e80100-dwc3
+          - qcom,x1e80100-dwc3-mp
       - const: qcom,snps-dwc3
 
   reg:
@@ -460,8 +461,10 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 4
           maxItems: 5
         interrupt-names:
+          minItems: 4
           items:
             - const: dwc_usb3
             - const: pwr_event
-- 
2.34.1


