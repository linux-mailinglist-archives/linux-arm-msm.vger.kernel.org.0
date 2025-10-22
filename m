Return-Path: <linux-arm-msm+bounces-78263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC06BFA3C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57D7218888A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7EE2D5927;
	Wed, 22 Oct 2025 06:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="apz+BQo9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA0B257824
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114756; cv=none; b=UMGVeLTJDe7UFRb9JzX644APqOWaQmtPrhX28jVnmsNSajaXwy9azVd8nZVae2R/+jwLY/7voqi4hXdG+oo0FOi6XTsAtkOB4Jn2INOcZgIL7fkxy+r8FvcoqZXVivrZoBD25LQU9r8k+LoAb5NSGAZiCJfAk7DsBts4awurxTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114756; c=relaxed/simple;
	bh=uaLbcQUIr5YUqcjrF9noOI3rqaP8x3PY0YKoF8vsSYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N8SZWMqVEYlvwz8LqoL+iDyXqR7zi3/28NoAD2dmz/ZaUHtnjtzlKpzSzVUR6f1xRyoXtsCggzBjTgi/qlxz3STuH0wNGNDpNINauJhS+5ZoUDUtJg0ObXRwZHLH+gUjeKVaAl8HGu+YKlPh6LDxZNi+isjpouT6DaeEzbhxiDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=apz+BQo9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3TQkt026973
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9tgWr2zJ3vb47UvMg9RSYc
	kWwaM6yFcPhLmKAm4hjeQ=; b=apz+BQo9xEYP8/7D/hP/poJfq/4Q0axJpzMopA
	oLNvzHF24icQmH3Q7FInexW3WOCgeYsnnlsneQoPUIVly6oi7XoUqd6eIss3cbvf
	GarHj++IWTDD2iKKYVIqmBT+moUUGjMOoFzgPPkG7BGsVU/hb9TFcFa+mbn7b8LD
	U8LVMrWkZE08+mcI9YvMhYV9xXqdWPJw+m8Q5n43BGGA7856XLtSKWtYjH0qIJdF
	9UHFIq60w9mM7iurulbYUJgSDuCdUKyXNdzi79GkOh0ar/q5f974K0L0GyujVMml
	iPenE6lN3i4T10iF0vMWBNDVc5p9zIdIceegg/R8ISC5eEPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pkr6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:32:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so11308800a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761114753; x=1761719553;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tgWr2zJ3vb47UvMg9RSYckWwaM6yFcPhLmKAm4hjeQ=;
        b=kbkJUnDkrVRdg6y3PujuIGDfbMX4ySJ6yOVBQYis/QwiGp0o+WPLfr0Mr1hSd0muwC
         iChufK9phIDRhLzq3hKgUlBGYwgB0AcHSn91DbuNRjTmU8MVGeV6RaGI9DVJgEUy0GB3
         LwMMur7PRNqBJhPmchyTtJvIHEB7Vog8/WTgp4NapDK5khJSRZ2CDc0upCkwPdoBKfMl
         fPwQOfuuzLH0Lpyjrm8p+S5djfv7xjJUnfUPXMMcmYfrrn5NpqKU2bE70U00Mi15tDw2
         wUVa0AGomgOah+AHw3J/5uVvtzdHytOJJQ7ihWYrWH7bXc/UBKbmF2GLfZ72qn7ER0iC
         VG3g==
X-Forwarded-Encrypted: i=1; AJvYcCVNtKpWnJTCLO1WUrCAK1GZNEI/0sc3hHdomBkWvHB27oSgGCP4zch5ticaxEj52YqLy5Va0QoCFwNM9WaX@vger.kernel.org
X-Gm-Message-State: AOJu0YxGK/2O4EY84h3TrOiEvK7G23tTfX+6erZO/aFq3wjMzW7Mz2FT
	bPWb+PQi60X4EeEhsOBnbsaAXM/splc1jDolqZy1hurxBJQ5za9sedt1bxfkkJsJkPxvOMNw72q
	VDHaZCZAkZO7NHV3hl0i4DsD3+RxOC/tJBp+259TjrkuL6h3J1NMYI3JuNBoyJydsR30K
X-Gm-Gg: ASbGncv5O6+SD6PFYQrxu9Fz8nQzuZvFQyHwoyMAm8Kh2WZbFUNkyZdzCOom/AjO8Px
	r9FXuGDFrlGDIRrFCYCvSWnsGiKGaWPmGiGaZRb6epkTozvVzJZOp3u0Nfvi6ZI9KM5CDUWJvPE
	YqA4O0a4v5z8K6yMs/ZXkFTOwZduNBHr8hfolHoW4kej0WYpLCftgrgJX1DRusJ/0/NFBoAT62s
	/x+DZLZ0LrOHcqvEIfYsdZDg/16rTETnm+Rurd6r8UfG7h8sePFKJruCXrm8NVZWRr7d0e3PaRY
	g8K9XxHZDpAXZ0OQSU9mc1NRigsQezvHk3et0blNWz5tZV+fJnEqW4z9WPAx/KddGbjBCPsB3j8
	VJ/SG9vfe1f9A9nF0TL2O9F35AUUk5EcAaew3ekPxPSCogGFAZA==
X-Received: by 2002:a17:90b:1dc4:b0:330:6f13:53fc with SMTP id 98e67ed59e1d1-33bcf8f870bmr25361205a91.27.1761114752779;
        Tue, 21 Oct 2025 23:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyy+S2WxF2RXCWLuWUbI03Sz1JIPlWQmK6bpEB8eaWAIQhSBRwAhnBoSn52WHDu8LRAbVz/g==
X-Received: by 2002:a17:90b:1dc4:b0:330:6f13:53fc with SMTP id 98e67ed59e1d1-33bcf8f870bmr25361184a91.27.1761114752373;
        Tue, 21 Oct 2025 23:32:32 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76673a86sm11931778a12.10.2025.10.21.23.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:32:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:32:30 -0700
Subject: [PATCH v2] dt-bindings: mailbox: qcom: Add CPUCP mailbox
 controller bindings for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-knp-cpufreq-v2-1-95391d66c84e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH16+GgC/1WNyw6CMBBFf4XM2pLOWB+48j8Mi7YUadQWWiEaw
 r87sDOT3OQk956ZIbvkXYZLMUNyk88+BgbaFWA7He5O+IYZSNIBJaF4hF7YfmyTG8ReqcrYsyW
 JCnjRJ9f6z2a71cxGZydM0sF2q4P3tNY6n98xfbefE67lTS8rUn/6CQWfaTQeT5KMwWvMuRxG/
 bTx9So5oF6W5QfwtujcxAAAAA==
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761114751; l=1211;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=uaLbcQUIr5YUqcjrF9noOI3rqaP8x3PY0YKoF8vsSYA=;
 b=nf2I9cNcUUz1qn+RG6q2SbkljfhGazq7TfggmPqJwt6H4cuI6D3bX71JPZZhxW6PCetSFQnd5
 lx34cc/uOpUAsXPJY/EHWnl7JAcIn6JyESzxVJ0v9B92o8dN6Ljbknl
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX1PGvmkXR1QWn
 Mn9AEpLRCnb3KKlY3NDbD1ALwuc1LlNig9Jh/MTZM7zvPLlWr2QqB/zlhjHdD9tgH+JmED6BMDN
 AplBnUqWdlCXaJfKuhNkmzUWM8echNMqBQzcABH24WQ7+z9sXdgWvnVs0nqZG2MTGK/qw6UuD9F
 gha+OSUsfTBsy4i1O9F2uNBteoJJx6Mr7zSS86LByiJRubY1uTi73Y2okW4oPh3WmGyBAoljNwE
 EN/Y3HiCiYEDowi8AnKa5sl6+HjjruhAqjOH/+uCz3BzdoQOGW36c6RPFd5BwYHsjkQNt3c8h15
 ObYa+3CX7eabdoya3Jk5wm34F9GIff2gHhY9PdtHgV3N7BEoUktmNKQVl9UtAwyIPtFXr55UIG8
 G/HAZISp/rWV4M8Edk7ZRxZxPHubbg==
X-Proofpoint-GUID: xkPq4xs2zetGN_N1U8ac3NLMJDGz6Qwa
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f87a82 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8jNUSCxD5SpwfXmMkmYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: xkPq4xs2zetGN_N1U8ac3NLMJDGz6Qwa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
Kaanapali, which is compatible with X1E80100, use fallback to indicate
this.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- patch rebased
- Link to v1: https://lore.kernel.org/r/20250924-knp-cpufreq-v1-1-1bda16702bb1@oss.qualcomm.com
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 9122c3d2dc30..9e91247c521a 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cpucp-mbox
+              - qcom,kaanapali-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox
       - enum:
           - qcom,x1e80100-cpucp-mbox

---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251021-knp-cpufreq-3449bc8c2014

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


