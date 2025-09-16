Return-Path: <linux-arm-msm+bounces-73633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE44B58CCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 06:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 426641BC18E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 04:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FB82C21C2;
	Tue, 16 Sep 2025 04:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyvtSAoh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338525F7BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757996666; cv=none; b=ogdVd9dt6HE1D+wBLf572tlY3g2xCW/yt8C4vCAI9eIa0E2NULKhysVHioU7/Tg0dtr1ShOB/HyttiiTh65XFJKbraix3e0GsKgDacaRKEo8g+DB4dbELvr52wed0x+wzCy1jDhnKC5TvhBNWggILqDNRHg+4W/xxgnN6gBDXQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757996666; c=relaxed/simple;
	bh=nhd2RHIK/5Wkk1VEUvBtU5/9EbZeITdPPkKg7Vsnmys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ITXvHG623AowtE3qNrtHs1r8vVe6WWtqq+ktMssGuCtiVIL0rqVyTZG76qlZpq0Xe22MbpKqYb4nsnLX3RX8gKPjqXUV2sijcvKR3SCI0miWD/ldOIiEuoOz9k4qpb7ImJy8SPA+TZInNkk2SiNAIwDIj6cHVMwi0w3IqPMW5SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyvtSAoh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3qYh4005518
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fy02dgHGxGtACOefh+UkfUw5SOovP9+RPFkgwrZZl+4=; b=eyvtSAohgz19I+k3
	ULf1TnqUmsSn5qitT2IcwscI5dQbnPQbSNZcXiQ7iSTT1GN9qgHgbFRq8Zz4WC+o
	f73Vqo/KH8RdxjMRN9PSZw3UA9xMf8ka877Nw6zFa5rhiNO3TMIfIt65Vj4jX6PI
	7McFTz2V/EF4Kvz1MtgREjygfSNeNuGrWn6ch0KfDrqw1MfxdTpnZ3Z38qwPenTg
	PV/Da8z2DKBUjl378i/ZHJFtjNYxyEnrDhk+W44JPDUHpt+BqEsqwgcnSt4+YyJv
	YphkQtx2G09Q9zJnYx7a0My+vTXxkjbEmLWnzxndzLDAsTbOs90qdMy0ZC8ZVKZ/
	CGwoLw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr7m4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:24:23 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-74b64da4a81so10760117a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 21:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757996663; x=1758601463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy02dgHGxGtACOefh+UkfUw5SOovP9+RPFkgwrZZl+4=;
        b=LnQNJgHs2HxMNHho9IM/dI0EWuKes06PKSk72Ehr35lZGsB2cdBgry8I1ntId33qcj
         JyME3UuQ6yA8IqJIYzQP+/m4SLKebBW81kPW0cpATXCngH7nBwcgMXWQkfYbGeUa6JaC
         YOHZ6VXIMqudGeHxYPiZGwyXv3MSxQie4aGZPHG/xw/qCnbLgDQd/LNd8WXqhTDhZIAc
         mx+ubC7EiQaCP5LJ91GqMHU8GFnBHH9EL1OZ5iGJrE1SQYEGifLddgJigqvpk6ixS4pF
         pI3p4AMdaEirLtNToB0aDzHfPkWz8ktJXgz34X6Y5LzHpJDVhjBP872jIltnT/SZ3XT/
         wjTQ==
X-Gm-Message-State: AOJu0Yy1WT6vMJiQxwEwr+pmpLwdJn1oT50Thkdr6+WFLiS8+2/n2JLP
	Fos4j9JMQpuFW0J/GOIAgvpPKTnUVwiVZ37su/8HfooW8ktBJpl1gqWVT+5xpOUCLdN8YgyBbsE
	EkGdMe6JUFANcVEYOE2UIcL7QOgSmvzjxdj5E/sThlWcu1jNYa0p1pQmW+pO16Ad346rR
X-Gm-Gg: ASbGnctPCM2p4RCYjyNCeygkt/FJB63z1OLSUH9neE6mmrm0XQY+3lUnntPMp55XYI6
	I+tdam49zPNL0uPtsJ+wnBSWRE+++deWIjUFRTzCgOcJCICmZT5o9HuYEfthebzmYbiz+hNT935
	dTQlDFOCRrNce2iIbsk1k7qorTgYsdFp+OCI7GZgJHKqQHAR1uNpucvxewKhpxarwi98CbkB/ez
	6g5XNlP66pLKZ4K+y4cTPrpLcKGc0y9w0LeRkyUL+eSCYEYBJGS2wL2zPRPbocesNxqv2WFvHGD
	P3ebKenfCp8uzX66VaVBxobV/gsoBYy+uUgT5VLC6kICsb7f7IXV1bbWMo1FfrLgWiKVHXqpKMk
	OL2j4LjgiqWKj/2A+Fu46xyjOBdnqVK23Jw8WVEw=
X-Received: by 2002:a05:6808:1881:b0:438:1c9c:4dbf with SMTP id 5614622812f47-43b8d87a904mr8067286b6e.11.1757996662728;
        Mon, 15 Sep 2025 21:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo5uj+Rp//6eSBlEaQ82sl0S4ZcUJU4mROLG35WU2YM36kgfmzqs1AhRCiE/a80HwWw71qyg==
X-Received: by 2002:a05:6808:1881:b0:438:1c9c:4dbf with SMTP id 5614622812f47-43b8d87a904mr8067267b6e.11.1757996662347;
        Mon, 15 Sep 2025 21:24:22 -0700 (PDT)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b82a73075sm2772862b6e.19.2025.09.15.21.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 21:24:21 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 23:24:16 -0500
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Add Particle Tachyon
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-tachyon-v2-2-4f8b02a17512@oss.qualcomm.com>
References: <20250915-tachyon-v2-0-4f8b02a17512@oss.qualcomm.com>
In-Reply-To: <20250915-tachyon-v2-0-4f8b02a17512@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=nhd2RHIK/5Wkk1VEUvBtU5/9EbZeITdPPkKg7Vsnmys=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBoyOZzE6OxVcsRncpsCjDerjCjZb17b2m/rg2vg
 ud2xO90zKaJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaMjmcxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUzMxAAwJUJlxydchMCkwNQdx3zeUuGQ6JQXD6aPD1FQk0
 5SM+Fk416mTsS1xpoNCr+90YcHr/4t2TGhC7OeBNPWgSDYz1PC9OeHXiR9P95d/2WD6RawXjpyP
 uAaYl3qP8mZxwdPLX8/yOE5o4wY0678iFBvF16iN6J4613Gls8k1jRYwbMxjXQ3AjU5EUPgFpew
 xPIR1gBZ4bEBgq8wSdb/r6c/yTyOPU7kF9cAGDAufNc4d7zqk9R6ScRXpl/mmWiaNsR6GrhC74P
 UhOKmi5RABMOtC0WeMfx7zKZb5Zj7gzUZ8r4bqXoNuR7FMcaWkX48Mvj01maxM+MHIDc/WPGFMI
 a7u2hoccGW70NysZaArRDQAxErp8iPVOhCLf+FWM3CjRlLvpwVn9mrbKEjwolJpyMPBpy6vdcvq
 jdV4jR6XdMslMHFXzEn3nH9rhlmTabSdtyhBtns1Wfb57mocAaQFcM1Sn7mLpKTLnxOq9ic0W50
 SnQjbG8d748yblq2niNLoUQKhjO1SYMc7AMGERPuGyiGtUaNIe4HExpdmIU4+grUJK0z7B6tCNe
 D20iQmCmc7+R+ce+TUEq5fpzCSIUlOrnKVlMZwVaqwgjwsWwP+2oL0MhOTng8zLdH0vIJcVfhAu
 i/YTxdMbFfHwA3wnw6RFcSSRR271+pWNrxhcPGo0L4c8=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: vluWDBjtL5fquNNPAWAb4cdCqWArIaw-
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c8e677 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wQQti8BIFarMilUVRaAA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfXzidOeN3w3ADz
 47NtljWdU5Z36BfzDtgVblqzSOqux9SvsrZAIrZJC8e77QQsF3E8fLhB4oJiI+LUgs6KXFS1Cfi
 4EaNBVfrVTPcgle55pPHZv0GJL1DvqttMeUZT9bS4DPDulZ4jiE6E/u0UCPfOHU8o+AFi5XCi/x
 sVrfIu+W3thXmn4dptwkqgs0IiK3Z5DBQIUNVJpIIjccb9oinPfFFoWZ8EIlTbv+KP/CeXmS4eU
 WtWU3JY4ESQXxyguIjaDFKH2rBhELl1ezZFi5RYXNej9QhBGg+HtIrL0PPpTq3wXlsuxlCdZK1k
 BLLuFMGPLr6KOXQcbKj8kEcJv8gj3M12oGTbQha8Ck+ZNy+6uNmPh84gdM9sxbiip4M7jG9KhGV
 KFFqShNk
X-Proofpoint-GUID: vluWDBjtL5fquNNPAWAb4cdCqWArIaw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

The Particle Tachyon is a single board computer with 5G connectivity
with AI accelerator, based on the Qualcomm QCM6490 platform.

Document the top-level compatible for this board.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0a3222d6f3686f1647b9e2ea192c175b0b96d48a..8e0b42ad65607abe687a0bcc5310df264e14157b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -337,6 +337,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp5
+              - particle,tachyon
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
               - shift,otter

-- 
2.51.0


