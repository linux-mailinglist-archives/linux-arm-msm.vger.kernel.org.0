Return-Path: <linux-arm-msm+bounces-76544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A4BC7885
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 08:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 283324F3244
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 06:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB17629D279;
	Thu,  9 Oct 2025 06:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWeOu28u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3339B2989A2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990769; cv=none; b=LMGhS4BydWeGvhzusLIMND4/lTvEkTzC2BNbNrd0mnsoKZPXckTFgEQn7deHoZkd0zenOojokvm84jYB7TioKoZNBuOfez+5vmp32AEhzliPEGzf4i4TLQZZZgt3Qa8fqk9Rm2osJfQqA3dsg5jFcDiam/2SQwe6lL4S3eiglN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990769; c=relaxed/simple;
	bh=77PWjnqFF2rxLV6vy3wMYiqtmpcFtBrBVy4hemvoz/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eaAjTF1147vr0v1vESTt0fkeD8jl12PHnA28R/S9NAW+5G8bJGa4KIAMDX13HisJc4y5tp8JwGvklMAucBjY1W30nkGBSFI/qrm4f8CwPF4VxlG7M1z/izWv1FC2Iw9iJTXT8J5twxiCHwfsbHibXgAT1JOu3SakjxmNQZFzU2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWeOu28u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EQRs029800
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 06:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mHh+0IDbJt3IBXVxkofwT+y+G3d2HQhb/K1OzNac/o=; b=bWeOu28unbFVp67T
	48fWFmki3S0SMJwNhZsLhPD1T0egOTL4deGeqdgBCLrLKgD6RVt1r8a6op3Igo8X
	hOnZrVn/JNr5jJug1Qzq1UKUHSfP3OcaHEUniSYQyni/p3nTG7LuTkZyRh9MCjiP
	vLX7YMWbyFpH9IdQV1eKFx0LsMZ/N/FQsEVmcH8yxsWq71Y9fBuiUhC8abR2pPmJ
	lS4UpG4JyOySLrr2KQLuhfxoA2zpEcolqxeT+iEopateXLX0zbR+TNR9ILS1raTw
	mnlWd8yDZdP/Qz2DEbn69ZlEataOsA0rRCfhpNMVFnz3DAj0ZlF2xufNZGFVqHFm
	AxmikA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4n9pc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:19:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32edda89a37so1216354a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 23:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759990766; x=1760595566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mHh+0IDbJt3IBXVxkofwT+y+G3d2HQhb/K1OzNac/o=;
        b=Zl1dvpKS9gX6twlszuWbSFW9jTmy8CraCWjiJHJNcrD41ErmCTv2UUU8K/bEh12Ee/
         GiYcwd5pxlBHHFEHXTGTRWGrR2DjGjT1U6YomHQCP185ItH2EdAV6MZArBS40TZ34liv
         fextwy4wkrRN/J6wg3/fYQlx3wId+qQA91zwoPZA5kytkVC/zn7oBuLtYv2KPpJ6SWUm
         JJPDa2R1YRHoemranR8THgTsoE+TPNy74nqpaSbaFQ8cVR4nDMOCSU7KwgRjyJApJvI5
         D1cmoXfmbXUm/GwWC6sYm8ctha0/DmqLIwqcVidhR8XnWlJ0wP61tgJSyA7xOxFt2z93
         /R5w==
X-Gm-Message-State: AOJu0Ywqh1pWOnbt74rHFE3aywB9RI0ICEMHzBELUTd0dsTVugwddAe8
	tlYXc/FUkId041Y/oOLsbVtzxhzzNeIZq1wIERFzd8+SI1oHoGupyWLQ3FlXttb9ejICUVHLJQe
	hJI/WtNSj4J2a23NhLvEDv7QI9UbpgwEFmaxuh6tSihhrICh7GH4Qjid0NQzGAZG/35sn
X-Gm-Gg: ASbGncuNmMeYQrDfMtAdWyUkPzVRuRf3frTnLGbUaRI5V8xDsZOInsQTwP9fYwR0OQ7
	WPUuvsyLZ92eqHjzAwxtK2T49b0KDwMhUOwgS6KqJafLtn1gvjlD7a8cLWJvmBsQ9lgpMzru14k
	J+p/SZw+3PlYlcDWSmGWNnds9bGTWcwF+3rgKHhLxmT9VcuVOA/z89I6izWo6kg9WBAWPvcY0kj
	mTmz4c0JI05w+qbZNnLKNMQx0bjt9tMN1SWDIbO1kXiSBeRFlnbYa/FXhQOleejCBZgLBOdWphv
	JShXHZ6RkL01QTI0L94liLSFRo6N9zd4Bq6tXU8z2tYfOKcBNuRcNgwlqk4ZwcAoTdy2Fc2Hi/6
	EJKHazb8=
X-Received: by 2002:a17:90b:17c3:b0:335:2b86:f319 with SMTP id 98e67ed59e1d1-33b513eb68fmr8887014a91.35.1759990766341;
        Wed, 08 Oct 2025 23:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGxM+/0itJtut7tU+h/gHpRdUBjLHespHKzHtM0eqWK/DO9Sdpm+LCvvpON3YUB9AzUXE2zQ==
X-Received: by 2002:a17:90b:17c3:b0:335:2b86:f319 with SMTP id 98e67ed59e1d1-33b513eb68fmr8886972a91.35.1759990765735;
        Wed, 08 Oct 2025 23:19:25 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099adbcbesm19239671a12.4.2025.10.08.23.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:19:25 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 09 Oct 2025 11:48:53 +0530
Subject: [PATCH 3/5] dt-bindings: crypto: ice: document the qcs615 inline
 crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-3-2a34d8d03c72@oss.qualcomm.com>
References: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
In-Reply-To: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e753ef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=0DGZwrxXYRw7ACnPEe0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: nFfF0GxZ7_M1WXXpkLs_0u-xQNlm-cbk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/vbTHcl8Sytj
 rab1RAc/kmw7GR/zI98Eue93M/3KlLCnrOB9wPEP3TUzvi6vgON5duQKuGVvIBbZEIdHUUosKQL
 tOOcjF4jk1GTE5b+Yq9206AA3JQ0rdGUEtQ1OmK5s5Zc4f4HOoQc9RPOW3OKabeP3R9hYlEc8lc
 V7Z/JKBdvh6r3IeIQXPJEpj0e0ku8hg1MS6vB16ffdi//nNZt73nzeglGdt36wKqR9n/aisyfuX
 hQA1eywMyqbRvyjdJ3cFMzTivHSjTVEg+U5R/LmaCa9MJIJTS1rb0LAA5b6vzF/OoOR0DwCyAil
 J3n+Kz/bT8zO0kIf3qCMHd1k/i8RJWR26REn1Q2yQ9JYoqtl7ari1nJpJkYeAEex97i5wj85JhE
 6KO+T+ptghfOgHV4Tqc5Mz9b3oM5xw==
X-Proofpoint-GUID: nFfF0GxZ7_M1WXXpkLs_0u-xQNlm-cbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Add the compatible string for QCom ICE on qcs615 SoCs.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 88bef1d38013fc7d0e6842e370b2adb3bf3e8735..ea335d55070f0931ecf39427c59e2dfb7728cbbf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine

-- 
2.34.1


