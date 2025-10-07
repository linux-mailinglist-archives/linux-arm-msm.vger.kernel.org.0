Return-Path: <linux-arm-msm+bounces-76153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9F3BC035B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 07:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E65113C0939
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 05:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC45821D3CA;
	Tue,  7 Oct 2025 05:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GOmEItS6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3741E60DCF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 05:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759815910; cv=none; b=ckUBwzI/76DSBnQkHGqF+21orw0BxpEItSkWSu2Okp5iNz3I6YhFEq5oIIx3IrvptH2l94QZHHniXoTn3Ek30kUEXsrsoGbkmDCBgg/yLSQY9TgeVFMitrGGBsXGv0r7QQ32n2BGZNHl7ud15xxX3DpGsfd/0HJP77H9zO9rRws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759815910; c=relaxed/simple;
	bh=OUUu6/gerX1YHi0u5e5w1G3QfwIy6Dp/7L+64GjSvBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=erNvJI5oxVKGGyDRZHa4g3t/61xoUpd3Q6pey7oDwWV6hIAeKn9yudZ9Y5lBp/QtVwYma1+B6znrYFtX9i1ZtatkJ7mK/iPQxsD5s+zxsI3ES5ex3I6RhC7va0Q/dumWWl1TUoJNbJZoUSG2LVHoU1+UFsRD1GauNLFuDIFc6jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GOmEItS6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973Lgfo012086
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 05:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=haboOX8nrE8
	6yirNHVVxZwV9MxNGuoLfRh/h1+xbQzc=; b=GOmEItS60q0mnXZxKKLGR1rw12Z
	ufyTbKzqgW0qCm/ZS7D+M29MdXZ1MXSJfAoM+PfDOKcZFa+YWY2iYheRaioqKgCX
	s+FgRVWhlWZHHQaTl7pI6K2fqvgQHwPuosTkW2brU141gmYdrRlUZI7nugjTs2Xa
	NQ+I9E0KGQgohMwLVB2qaMwrY9GUaOnMTcrgkzG24cbyIfwPJwFrCc7Ry+DWJho2
	xyBlN9JWSS5Fo/nDwDNcWvnvXzLyKSsLXbvUe3H9EZWeCDDMLo9nz6E+4Kp05plp
	fHiO4+Hye3uxhiODT3r+NsMRuas+jWUcUJvEPsKrvcpB6rlJvcddvsGAfZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn6e5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 05:45:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ed9e38bccso1535262a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759815907; x=1760420707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haboOX8nrE86yirNHVVxZwV9MxNGuoLfRh/h1+xbQzc=;
        b=uSTgUp7P3WpDKSbak76owfdsxqCya3KgZxPnzvL6lx1e+AUBXgudJl7CnfhIakFUqL
         JEyF2N8cr3robgICjgS/NHHWd8YfHnxFT8cWQa6wB59BLidFILVlLmI8zCGHF4ZqPRF8
         Aoa0PMWRymAqHJkFWvD2RWbwv5AQQZuGFDllqMo9LEf8yxqH4qvAPcqAVIPk4xHT1/1Q
         dX0118JJGNVC6pdywi1juVkbY+gk9XUG1bSWEkKw5WOrkmJqQhBYILZja7VBQOQJc23Q
         JXtvDwtIpSeu9ykWU/Pd4SRYaY3V2gswhNX88A+rcWgXU6M8G6sCFtyem62SpQ1wat4S
         nG0w==
X-Forwarded-Encrypted: i=1; AJvYcCWE1yLLrW+kgL1qL0G1GUDELcJVc895vDTsHrWLEXkU+sFKfERBwD/ENPUTe1XxbcbpbjfBabulOcq42xmC@vger.kernel.org
X-Gm-Message-State: AOJu0YzrTEnLwBAt2tEzz7kwqcgt1M9GFwpTyvWcEGYM1O0tDcc68O0z
	c1DV6HMxgdwEQ5nHmo+Xe3btzcekIonmygsxrsFEMafI8UD+fry8ngbMJGtTEH/QfJ1MnCUOTSA
	dm2+5iZwdl1Frll9HSLo0qK1lGf++1pSXJr7y3hN8Hagy7Q+/B2Y2L22DUOq2VCb+tpc=
X-Gm-Gg: ASbGncvpa2lQ6+0wLkI6UtDg90F70rsyDc4q2h5lUy2mxQfN0ucI3Cf1Unp8Mmudcjn
	w/vk7s0hIu8841NkvrlW4H9f8r8RTV6PpYvWk706z2ewedIVHQICmJs0XHE0St/JVRM89g5lmqQ
	q//ravZoI+4eEx9WviAFLQXW2C31eZBmLibaNdlTVr3xCyLgo+9nByGCOTHmoCiE4g2eLun/vDi
	4cavPPDZ6oDYEmX9GToDb4VKszrUTJhMT8GYmVJvnsEgcDHlMQMV4P4JiZgXZjTU/T5EQUUZO1F
	ULbhdtzJ9/05RB/EH7z7TLCVVMEyNSZDoUp/qa0mxjRu0aaicBXwaRr951+1XAD3pWT7kWviJJB
	i
X-Received: by 2002:a17:90b:1b0d:b0:32b:aed4:aa1a with SMTP id 98e67ed59e1d1-339c27a2515mr9170485a91.4.1759815906702;
        Mon, 06 Oct 2025 22:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKsGj2BOgSxlhze96cMSKXMXiS5pzEqDmUCSy2lI8W3FBFiISmCnIBYUBPxWKNp8p8yTm7aw==
X-Received: by 2002:a17:90b:1b0d:b0:32b:aed4:aa1a with SMTP id 98e67ed59e1d1-339c27a2515mr9170455a91.4.1759815906116;
        Mon, 06 Oct 2025 22:45:06 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339ee976b81sm502624a91.6.2025.10.06.22.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 22:45:05 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V1 1/3] dt-bindings: mmc: sdhci-msm: Add sm8750 compatible
Date: Tue,  7 Oct 2025 11:14:43 +0530
Message-Id: <20251007054445.4096630-2-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
References: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX5f+MPhK1p1l6
 z6KzRcmd0HPlTJzOEjQEe0RwxTCr/XfA8y6hghkFbRnXCFf/1Zn7ToL0NfUD0QiUKjIqgg1KSme
 aEaw01ZBfRjbzH85gY1wnWKB18GFngBNjKO2peDPf9ytoGyGhxv4ZweT62JFChkN5Ixjnix5YX7
 UkESFJFIJXZ4BaaaaTu7vDUi/tlOXs0DAlAzXUnAuNat2Mm6Gp+1aYQ3vBedb1TsRE3mrvKU4A6
 X7AuTI/n9vxkJ8TcrWZry13FfN9hAMNaMHpoyemEb7O7JjY0zkJLLvlsrMgI9Lnrlz7tlY2m955
 zDynQqyVU0ikyMLMzumBRzSQV78LHYQoNiWVO7Fi5Okmbu1AMBi3CVwSK4LAAfjnAXiySB75QRK
 y6yfm0W62qrjW5aiXkdfawyDenx9jg==
X-Proofpoint-GUID: azG_R6Qr_nDttuF_XgDF3dg-0dp0zkTy
X-Proofpoint-ORIG-GUID: azG_R6Qr_nDttuF_XgDF3dg-0dp0zkTy
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4a8e3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=CJ-gMd5DwmXuTr6oK5AA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

Document the compatible string for the SDHCI controller on the
sm8750 platform.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 594bd174ff21..027011223368 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -70,6 +70,7 @@ properties:
               - qcom,sm8450-sdhci
               - qcom,sm8550-sdhci
               - qcom,sm8650-sdhci
+              - qcom,sm8750-sdhci
               - qcom,x1e80100-sdhci
           - const: qcom,sdhci-msm-v5 # for sdcc version 5.0
 
-- 
2.34.1


