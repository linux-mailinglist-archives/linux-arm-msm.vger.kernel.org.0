Return-Path: <linux-arm-msm+bounces-84814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 867B4CB1660
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E73F530C389B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8AA3074AB;
	Tue,  9 Dec 2025 23:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCqFIZ2E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7aAuRpj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745FF2FE06E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321796; cv=none; b=VCvHj+VWYhO7rJB4RPYNE/HxSx+pqq4JodPLfxL0t0jbJN4WCuSUKglR5oYpCzlCZMvKZuhyMSeSRaYOz431GqtJua7xVuxUPF0Qgm2skzY2V/pIXfMrpeFI4PdoVdebtPjmShxmJYEVz3RwaEzfRKpiaphMdBhYuqfC44qo3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321796; c=relaxed/simple;
	bh=Gc+9GTCwE6Q65glT/UspkMZu20/gwwKg5czwnmi0HQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m8kkXBf4HCblFn6TtIUQJ9I6UeAw4FITkcDFLYZNoocnRXB7pRYEf1nOITmrzGuHPt6lQzOH8I2Rz5GpvZ1VrieluQmn1WStD7wEwOlBTasbMM0HloOwtBq6GVz/sW8LDCp6hWlEIzfih+oNSb+CTfpSnobAQsE6iwM4rNthzcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCqFIZ2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7aAuRpj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9Mm1Xd298472
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqQ7CuFg2uQG1J5bdN7Vc0a8C6p4JOXok+RrLgiol44=; b=JCqFIZ2EtMiqy0GK
	MMoVRXkY9AEgJ4kQIS4QDETcsos2MvEiOBwF2kHjpcdmB9oUKzJIvhelSSePGDL0
	bXVLzLIaWaIsNXPr5I9relBW8nCQWupgacan/3LRJE6s6QgOUoUEddKhwxWFCaD1
	EdyeMA2j4tDJX+JH1px0zXYwVFeDSEjZzSguaKXaLp7hr4Wa+gXjTTLnaoEzc5Ct
	0YMvsM4XCcVkTnbw98YNpFBzoNeUF4MuPOxT1W3ESHvALKur9yrrx4UN2TFhi69M
	K5rNkH8O9iRl9SsRdEthiluo3+43uyKEAwE4Q66efLomeBG6ClvFam+a8iNbA76K
	DYp0KQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vsea5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:09:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-be8c77ecc63so8577373a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321793; x=1765926593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqQ7CuFg2uQG1J5bdN7Vc0a8C6p4JOXok+RrLgiol44=;
        b=T7aAuRpjfC4mv+gE+PG0qo+Kqa11c/k1DOJe8HNQxG121vnSsZ3K0AGgwuKsqHDZGN
         KC2NK3aqnyEJ0FJbq/iEf7gNcZhNwQF8/KJMop7Lz9y7fROLQLYwu2tplB1R4xcWcfw5
         b/Feuz1Ag6KMC3WrHJabnzn0DNhkFh4HkBxsivsltjJqIlnL76gLBhly63nRSTdy+XPF
         c0l9oE/VPwhbtQ9mexLq2fM+OFCRmXVVTAorP+BzhVIwlZkA/7ZllHH3U3V0XY2QiFov
         xmH20wM5dw8rXPGjyHckCU8QYhzpkpiRZmQdZSH8cqU/C3azKMgtClHSd2NFOcZbB1lq
         q88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321793; x=1765926593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqQ7CuFg2uQG1J5bdN7Vc0a8C6p4JOXok+RrLgiol44=;
        b=mQ9B2QMWTjl+4s71udl34N3ldwOd5AXfSpe21huIqv81Ma1YWWMrgBGzV4SKHZZdi1
         wPNVRUg5imiGI7+sHBPWzjM6ROLXW+fjE2Frmeac/NJc3p24lVTVCA4gWOZyApnAJVyC
         tZ1MhwZ0cWUIvscKn3uvdGq5kl4TGQX7tst1zPum76EL3TeT22nFQMNVHeGgA1Javwcs
         Y4g2GnkmwfmDg2UZFNVudoKqwbefANF3f/48z2oB6W3JDX0vLi39jzUX1Ge6kyFe4msz
         uc7P19ReEYyciU8WsyjEMHFAV9MhrtnbH0XBmq5GuceRf5v2TVtUYMLSD7Zlm8CFAxP8
         C2JQ==
X-Gm-Message-State: AOJu0YxzjuUCkd/nOYGtL4h44cVWI42YU+jeWqk9LHsi3VPBgVBN1nNQ
	5c+Bm6DhzSOe0t7jiGB9uQQ618ZCwGB+KeNfpUwcpv4Ww+6juQz/zdmk20D9/bYXNTl8FIPCKsm
	Q9k/enXGNrJb6IJnOezgIbqq69eQdAbjVB5eZmG65VoYVtIB7/nQi+hYc0wIaOwB0bl0U/cqTIp
	O0
X-Gm-Gg: ASbGnctYo6iEkf3vhPa+DXJgmKJhkOpi523UkjaYtA1tuYH10YxK105DP/lsotP0qL2
	Y/OqSQxkosU1JoyrI+J0n51YejCnws29Pmkyys8+aWGC4G0Oamz0vZtqcmrrLNOtlbTVNq8coWQ
	9N8h+bVYtOGCRCFzOZruYQZGDYiqwomgwTanzR/D/e+ASQ/LwXcN3oEUUWuzJ1ssgwVyAWmeJn/
	r9AQS1z2iiCDpn9WbKBf48CSjsGcvlO3RohlL0y6Rrc9b083EzWsgbOPFw5h84OOsMJrfuAL/77
	3DwLv90S4EE/91X4W2njPDmrkKm3hgUibuEwF/Y150uJbevT/IvlHA2rDCrYOBlSY9O04C4iDrt
	okHXDhUBHWcucntJoQwwrICyXSPg5tu9MaKDxI9NJhkr0tNzGTtiZB4wV+8GHAw==
X-Received: by 2002:a05:7022:6b91:b0:11b:adb3:ff9f with SMTP id a92af1059eb24-11f2969f9c6mr293982c88.36.1765321792851;
        Tue, 09 Dec 2025 15:09:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCC8NeSyIA7e5vPQvysCLDkecln9w4ZgsA3OxaJEwsQ/wSssMZPk3ra1j0O64cNCZVhT0arA==
X-Received: by 2002:a05:7022:6b91:b0:11b:adb3:ff9f with SMTP id a92af1059eb24-11f2969f9c6mr293962c88.36.1765321792333;
        Tue, 09 Dec 2025 15:09:52 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4811sm3338933c88.11.2025.12.09.15.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:09:51 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, vkoul@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 4/9] dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
Date: Tue,  9 Dec 2025 15:09:40 -0800
Message-Id: <20251209-linux-next-12825-v8-4-42133596bda0@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xni6JuI7RwI0M7Rznou98t_Bm3LD3A9L
X-Proofpoint-ORIG-GUID: Xni6JuI7RwI0M7Rznou98t_Bm3LD3A9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MSBTYWx0ZWRfX2EfmSyeV6lJ3
 5vkpw1mJ5dfj3mz9oSMdEcM3TnQv84936dNoMEY1UMUBEcekhx4sQO2lofh4kNnXNogRDn20CQw
 kvkPVie35KCgUnI98DvA3SCOLBOVZPhjyWXFlLm1B7Hsc7SATADW9gnj8/JC/BumljIofYN8ZYO
 w+9WtUM71maMHjMCYRbzkTGa2bqEANNq38YE+oY8ipXrEd775htdGX9G7ONPI19pACozCJPpTK2
 i+YvIvzPy0axGEDJ2nBf9ktK1IMaydoXzI9Q/b0JokUed1xqTK7oZ94EN7yJ2KyO0AO3g4PS4Am
 969k+HEKa0p9eLilVaugAiV90Gh+2oRAqbP+ckdVmV/VI2x4XC1NRUB2bM4OJcvk29Qm4vnyT1B
 MjM0kl3+k1Aws3I8HtPb2O+Hwqlieg==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=6938ac41 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=9ZGL9VZrYHwIVTkvpzsA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090181

Add the compatible string for identifying a SMB2370 USB repeater device.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 5bf0d6c9c025..0f015a4c2342 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,pm8550b-eusb2-repeater
           - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
+          - qcom,smb2370-eusb2-repeater
 
   reg:
     maxItems: 1

-- 
2.34.1

