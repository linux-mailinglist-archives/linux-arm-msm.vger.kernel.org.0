Return-Path: <linux-arm-msm+bounces-80057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0659C2A3FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 08:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63D6A4EDB58
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 07:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA30296BDA;
	Mon,  3 Nov 2025 07:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orCV1CB1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JC2ZtFJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C88EEA8
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 07:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762153610; cv=none; b=pPvAsBvFj3HzeunmxXg0O5Lh7a7GjL8uloINK6ZhML+WITUZ96fdoyDF18VKKaWWCWJRPtm3V7Ed7Oa7odWpHNbAxp144Iwc0iYqNyldPSA3/Q5pejsF/AzsIiFFKc6zJifOMwWvw6GzmmaiW5P/wRkPXWme1JuZlx2IpgEd4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762153610; c=relaxed/simple;
	bh=5feK2N/IK2O6e9qopvnZcd3fQLzy4a95KobwSy+NIHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIGvmmsFh75Y/wXQiqQZ7BPUoz12wruNP/V+znMuJaO7Nw0kOfKnTU3t3r+7SvafICOy9ZLkvy2OwtvbIrGQYMbB+SVoZvo/Ji6p7VYdBlVRpi96u8nQ+ICcSvC39vLpQme8KY2gSREEKn+B113dU/eazKPkisTeaYGcW+sL03E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orCV1CB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JC2ZtFJV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2Noitj1529800
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 07:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMiAzcEtWsm2GpmS8Mvt7u1so77xL7gySGMapgJ2dos=; b=orCV1CB1h45GUHdk
	uH6RhMtC5KQ0W8DOWfy6OEkEi+JS6r3yLtj9NMyn5Cp5F5BK5n2q2wweSQvCGs7j
	DBmCYMpBlsj2pj5DJW1QK8w+KgmchGqroESQSYFfPNDuDaN94cndWnbBMAGL0q13
	Ac5auVxMQlHcAgDn0rIJf8Uo+LdIZcxfjKmMwLY67e+vEitNHHz39/aQPs7D9/Oy
	ME3C0rYcCPTkJJKgFIR90qiSOwmonJ4m2ed9dsykAMiYez5aNU9MxsGWPDtRzNzc
	tTSzdfkCI0NtfOvYmjfNDeRoWPkK+OAvuyUWNXw/2Co4yYRtAvDraK2lAF2SfmeE
	K3HMTg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5a9vkm08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:06:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33d75897745so10493991a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 23:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762153606; x=1762758406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMiAzcEtWsm2GpmS8Mvt7u1so77xL7gySGMapgJ2dos=;
        b=JC2ZtFJVbRzwVSPzBPNj4BmOdcWpP9ybDhVRjJDOYUMZKpgZSh646xMvj/0PqWfzTB
         9zeOKUR8Zxp3zQzxanXSFCl2BPS80uNDuEcduIYrDFYu3AhcbB//8wd7xLxFcpEyptCZ
         d0NNCHgv+4IK+XDxoGNX7aXH2+sGa8vC720DeUbjtryGRMZOaoIihmZRKlG4XO/l5ByQ
         uxj3bp+uYX9WQqjgvGDd+D6dStk9PznGOB+o+obiQXdU1xNnl052ZqDjcTmjUiGacjIz
         qF6xhv+a6YyqEHKv85IivFgs0Y8TAArQaxtEBbYLrUFTic45rCxWZ8avFdFwJCvb92yc
         vpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762153606; x=1762758406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMiAzcEtWsm2GpmS8Mvt7u1so77xL7gySGMapgJ2dos=;
        b=e4L6GXmi1V0CrVE5TECtkOfe/lFUNeQ1NPyK+TOywBU1qdlwqlh2tgNkizZOYWjzF7
         YfCZAVdSXV23StHbtpge1oAdBuj0reru0ogtON0EtwhrT2YyaOUOkUp+79I84cIIZ2LR
         G8z0uKvKncdv35cKEtWpNmVmhufs80cB/tWWWUUg4H7skA4DdkYsboMV9mxNuyNZ8AJ1
         Guf+cZa2Dbqj82PCwDipCOUjOIWMTvVFlcuUn8qZWYkWqLaKP7hk/XXT4PCsdxYLFFk/
         sa4dbueml4ncl1YSvvMV0e8Ed1CpkxLBvZnKV0FGP4KU/R08pgo3MPRJeKiZRvkQu7PX
         Gmkg==
X-Gm-Message-State: AOJu0YwXKPk4++8E+Vg6K+PWtOiqHxR/fxXzvpDt3xaET3PVb6ppWTqM
	HZLoVvJefZlPW2PAlycXvJbyC3iPRUSLwiXGRyH+Fgrxakz8sVv8dNRxZE09BdIudm2R9sbnlGC
	HjLUEpiwKOPc/MS4UnOLmcFBRygXxs6hD8YujCbyvaTdJAXz/d2GX0OSn6/CdcalKVuRg
X-Gm-Gg: ASbGncsd9VxhVdCqhbcpB2PHJfm+8JDslpmJKSuszh1/VlZjMTzhqQuM0SqEVd9zF67
	OgCZPTtJKMNY0spkJMCE1j7Lu4JuDHGpyxjlReXcH5rITC5qLsYMBFbwa3uJzzxiV6ZcyGlXjbA
	dhbVkroH5085SI5JA85qsN/R11UR+MTbz6F/VC41VfJPU5UdoUC2x1m+8oxE1pSGYgUx5f0cQvt
	JXC/paH9Fv938MSae/Lp124ZPwZVEL8mbxNFm5NYzRAN9wY74/LnegzMQ9zoVYSeXt7JBGbx3/A
	q0Q2jJx4JOk9RG8JnqVMoe634gzA7/Vm+QdXC9ogkg/POE7SiFV4JgAUVtvKmM14AicP/jnmBDm
	nsbZ6+q+12cVV56w3SQS5UUMFupYrRAMSL4eFyEkt4BW1jOZVROLh1xK+ED1gcQ==
X-Received: by 2002:a17:90b:51d1:b0:340:2a38:d45f with SMTP id 98e67ed59e1d1-34082fd9dcbmr15875293a91.16.1762153606393;
        Sun, 02 Nov 2025 23:06:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc4H2LRGClZtWN81SzIchmgkncf9wzDlUy0SH6VKxxQ3RTVsKby5uuHb57K49kE/2mymOotA==
X-Received: by 2002:a17:90b:51d1:b0:340:2a38:d45f with SMTP id 98e67ed59e1d1-34082fd9dcbmr15875253a91.16.1762153605909;
        Sun, 02 Nov 2025 23:06:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ef49da8sm5808704a91.1.2025.11.02.23.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:06:45 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 15:06:21 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762153595; l=1171;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5feK2N/IK2O6e9qopvnZcd3fQLzy4a95KobwSy+NIHw=;
 b=wSQTSdvWIFwS8IjlZpSNpP8OrFOJfB2BlcLGf7sNcivE6BG019LCbSQNR8PfHS+18qv+MV0kn
 UpnqjY4VYTJA0HvQJC9yx5JbVBIC5JEBHABC5QH9WqixYL3WueWT8OQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA2NSBTYWx0ZWRfX14ZBFmnZrAP2
 VvZ/7fOsLk17xSXgIjf6svXizMAub9UeIsMrB5m6F/qolfIY+Ig/uD+SthjfBHXCZI7q4DRB2rX
 dW4KwyAxGNYw5FhGEUflK+stgEXWyRvPyuINyLgNSQOWPeYxFcuzzh4vYeiz7qSlDVmK0JwBXct
 nzcVIyut/iQ5wFY7cHdspZ1k3q+F2gZoJowi/FggekLDP3IHMVFSpYOF17SEhWAGnn+JaGTIpFQ
 SGSCuYs19A7h3oMBHr112vs6nPmkGZtkB1DLtnmSHBzSH0+nNzNpyAI62q1rkp5HoettCKU+D13
 P+SI9v4ZkiTf70/w8F965FgYHhZpHPyTG3Smv2+OwXJuDXA4Glbn9cAbnECSZ0B3RGurDoE+KGj
 ShZ0NIj1fKQKhwl0PAnWkQDKPcn5qw==
X-Authority-Analysis: v=2.4 cv=c6CmgB9l c=1 sm=1 tr=0 ts=69085487 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ekrabmmykuFM9VwHVzQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: JvHJgsdD58m_wlCbR_xlEB2yv8BXw3b6
X-Proofpoint-GUID: JvHJgsdD58m_wlCbR_xlEB2yv8BXw3b6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030065

The CTCU device for monaco shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for monaco to utilize the compitable of the
SA8775p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..460f38ddbd73 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -26,8 +26,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-ctcu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-ctcu
+          - const: qcom,sa8775p-ctcu
+      - enum:
+          - qcom,sa8775p-ctcu
 
   reg:
     maxItems: 1

-- 
2.34.1


