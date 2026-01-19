Return-Path: <linux-arm-msm+bounces-89600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF689D3A40C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 734FF3096033
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDAE352952;
	Mon, 19 Jan 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVr/tD+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqdKo/z5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FC833F385
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816767; cv=none; b=qL80RjUYVC6Di8yZG72DmqLctOC1NIN2IYviqJBg3DmrLhd5G9xZWkCaLh2KOWrDpwpXaYG68/r5WYqJfWDRGltaSxKHXlJv0hPjJ2zp1cc5d2OktLyoBE9lIFAgwTfFgJEp2aYVhnJON6SBkYpFceFXODHEJ6ADYo3zmnn1x9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816767; c=relaxed/simple;
	bh=v4I27t4zkyHdh81jd8a+aaCsW9mByFB6MjUuHZRC0OY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewgWTPjGvv1jiDQPt4zIng/KWm5Cz19Sy1cfRVlQEU9HFKOs/bVQn3s6kd7F52tr0YdcBSPqYrTUtTyjOb5nzOpo5skrl1sRu+w07HR1hiwM6Bka0IHR/yuZOPFhh87NQsskvgoZNI4+4lgOwkQvevhpsTXhejrHMOGwUqG1bK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVr/tD+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqdKo/z5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90mM81904954
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lcb4tTnMlEy
	le8kREMhz/Sgr7ZDAdcJCOY5TwdgAjHw=; b=CVr/tD+4WhueomXEr/JWs2JQzfp
	5SaUpZVpYlz3DRQkqDJuA0fLhVxq61wZKq/ZJ9i03NPJBOD20AU1UJyQQ3IWXI0B
	OWMqwLK7ilyyJuoxYg8G+FlkLwQBpboGGP5fkPqzGXa9ohDy/BxM8+f1za1/0HhO
	TBwa/rAhdXch9SWEXhpIOnaE/Ltk9XRjKdVYxe8zbTVKHuW/RDyRkfkVoj24dDSu
	bOdHdf8705/GbPTpuIkAqUhh7SYnFcBYULMRlusMlXIMfMxZXkWbcijvo87JbHHe
	/f9w/l00u7rSxIJ5IZGYY17WRnoVtGDNu9cIiy1kQBgzTqiD6PRLmDMAR+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu8epw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:59:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52f07fbd0so212741485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768816764; x=1769421564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcb4tTnMlEyle8kREMhz/Sgr7ZDAdcJCOY5TwdgAjHw=;
        b=GqdKo/z5F7ckQX9JozK3E/6/fbYiBcYHDmIJL2s08qRZOuMrh9EJxdtlH9TGlHKKUf
         YiY5Acx8f/rlJqhGaNwyqU0AGMd3j2PAVbdrwPg7pft6a0K3ihykYe0FEJ/pJJjGJo3b
         dwTA7n6nXAaWlFvU1b7IJHWfrd3Lyd0pfcLiRobj9MAiZ4O8VNwD9ri5kF1NMeQ3dF7b
         At0vaTF/xQF3WehUsw6yCCIie+fpiqZkWh0ntKkVgM8ZcK1wrGtjp3o/w1nsBkugRhSd
         04B6F/4kxq8SfDnjTolo7epujBDPEguGouQM74WcYDS5am8P0me3xZFy0nqbq19YYoGw
         qO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816764; x=1769421564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcb4tTnMlEyle8kREMhz/Sgr7ZDAdcJCOY5TwdgAjHw=;
        b=tPCXMjT+Cni02Q/JeCKDKZUnX4VJxh6U9I3OXBeCoU9uSZrwjC9T6gvrdWgbTvundt
         0ZxXf+trdDQ0oh2rb2iJeSSDQLjtCcZVZz9wU3onRLt4kXhOCZoqztDQ5yFB5BKbbYvN
         H38zniHululDOZHUf8pebIJ/AQ14lOZ+R93nqBJzkgTqYmJ6HMU0H0xOuH1ZLtcs8pPS
         11TCY9EYAQ38sUcrR/75KXqVGP17B9dPDyJMQaRWqvnSR/gEex5fH7wp1MCfDuNtA+QK
         pvdpyDvQ40qdfcZO3a+cD8iI8zSSIOQ+5xX5HUgzmgX3CRXuEaCJ7mF5u54qaeHFVouU
         2tIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwxf0eGvtW2qvn0+W8GpBAafQYuFXRcFrymP2UgCHdiWs3sVGwp+4HKpHuZ7A9IhQT/Gy3a9qX5wcTWdYq@vger.kernel.org
X-Gm-Message-State: AOJu0YxQWN0kqTleXgnyfnH/5I2/N31QAWYcp8vgkqjBQeSyPVUp/hMQ
	nM12G9KJ5rwV1L4/7BtECGM6EwGRdR521BeNS2HnJpOaqVgFq0JQJ/4oXJugx9+bd1XD4+GOwaO
	MQCBajuF5IrBd4qieL6iNnjsFw0Wio9A3lkOS0U3fgapTOCAdT5T5ABcDp88hLALGTuEi
X-Gm-Gg: AY/fxX4k50AWebgTyqlnuCjQFVKjv7usC8xkl6DOa6ElIr7GKbxcvKWNN0hmrFh+Lov
	6QiVMgnH9BQfISbC8tg4sI7KTc5RCup2WqLNkI/oP9SnwMG4Q03KGxGHJBjgSaN/j/7tNvd+ujC
	kDtm7zfBwX+bNR8yJ9a1WFJQlzLq6cfJ7TbNZNCeT5Ox/Fl9mXmF1VNHvpQoNG3UBWLQC9b89tY
	p+YCbSvLmarMzTEnGshxSAxAOc+VqZsfd8JtGDOB4U+ZU6OC9Nk+PhgHcqZ05jlOFozJ/v6D7yI
	QVP9Cxu6SepDUinytG7NFS5Clr8WYAPW0C1ZyKmNKs82qlkQK79lnk2TNdoFytmqoHyrdvnRSow
	VrmO6CpkGYGw4Ph2V70CHcUM5AA==
X-Received: by 2002:a05:620a:1a86:b0:8c3:7027:400e with SMTP id af79cd13be357-8c6a69564a1mr1492845485a.70.1768816764706;
        Mon, 19 Jan 2026 01:59:24 -0800 (PST)
X-Received: by 2002:a05:620a:1a86:b0:8c3:7027:400e with SMTP id af79cd13be357-8c6a69564a1mr1492842885a.70.1768816764279;
        Mon, 19 Jan 2026 01:59:24 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b789sm242530635e9.1.2026.01.19.01.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 01:59:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for CQ7790S
Date: Mon, 19 Jan 2026 10:59:09 +0100
Message-ID: <20260119095907.172080-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119095907.172080-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260119095907.172080-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=v4I27t4zkyHdh81jd8a+aaCsW9mByFB6MjUuHZRC0OY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbgBuiigm0dbMzstpmasFYSoz2u45pvvIf+Aeu
 Xs8Rwvwu3iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW4AbgAKCRDBN2bmhouD
 1/0QD/0SdvpkN0D/RCbyrXN96YFFVs0IxZtXDFR+uELVCAGVDK7DgVOWlES0W9bg08JJVOfqEbM
 07OeF+BZQYpj8Vypvcts2QvKO/hHl62jE8bAfhwHClmO1QdvqYNYSkVXj3lMg3Qfh21/VAFyo/a
 8zjsubpdpH9XmyoAsf8c6s2ZO40HXE6FTFm7lX0h8zmDecifKpdvJFtV48XuEBYI+btSKv7cYvS
 8UnEQp66pY4jHDAic9dkvTRnDvBtXvYRdsRUx8nM++3qYZexlWW/pOMm7hP9JJHCehRI4oY8IE2
 50Cc2vq78Gf+v7JgV/uW8oqE5dChfk2DPsQiwFgzg/TBPUQkffEgy0UEiYF5VJAjBKibhF1EHgQ
 uk7K5C4eVijXBS4zky1BRqFpT8IrIvABGw7hXXQrqQIdWrbqBBpHjpJYVKVKASb7Eh6LUXz63ET
 4manXdm8vMx9GXUjBspTSX40V38keJpxUt7L7+yqQbmXcHCzHXRextdyG4sUnQiwbiGjxTrWr1E
 JSPoqvS0ukByczKmUMjo5OdnmAfYMeNZjhQokSAeE8nEtPy5J2Jz6R5Zxgi5VmxJxoZW7obicJ/
 N6LX/Wdj1Y7hnepq9hOds/IPdvD+7O8Z7NsBqNlqxG5svfT8DBpvGYSundQ+sCEXMClNCWVKHcf ElR2fixZdSOnevA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX3GuFMrgtkYTG
 eMK5jfFZiFSrnViphXnNaCmBnt6zI9UN6/IZoy4SDasbVNBlAw+iasSqy3SLgBTPMN2OKm+3jLe
 RKacZ2QxXUu5hVC6XQl/Hr1pv2gQKp+nTVvH1+gVdnNpDj/HvCe1JWeSHPoF51wgEaTtaWPe45m
 ZNOKMF0zWKglbjE9UWD97DSMjKU8tLEJpwS55nRT2UqnPYr6jZd3WiI1q242UOVYDMMNb8uIqVa
 9485TGLVy/zjh7jfjSSplCcikmQEKCbwGZ2vBD61vGXizw/fhZ41pZ6z4j5AaXsWfaXHzpf93wy
 dmlIGmsXw7jh0dn3KLpq07oODyNJu4a6Wxub5wPFB178JxcyWdN1BIEA3pHxr+TNNs8/n3LtXbE
 J1DgLpztnnfv6bAeLUUDTWHNBHjHXEhp78vPiw5AZBPzr/ibPd0iZ5Fpd+4E4UdJn+zAPE4WJIR
 EMpGrZXksaX34Ac3c9Q==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696e007d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jmUqivxNbEi4yHIWxaMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: WU0puz26US1UshVKD3-9cE3vEB8qbkxU
X-Proofpoint-GUID: WU0puz26US1UshVKD3-9cE3vEB8qbkxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079

Document the ID used by Eliza SoC IoT variant: CQ7790S, present for
example on MTP7790 IoT board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Before I receive comments that I need to cc phone-devel, because MTP
means "Mobile", this is not a phone - it is an IoT device without
modem... phone by definition needs modem to make phone calls.

Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8776844e0eeb..3ebab74978d8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -294,6 +294,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_CQ7790S			732
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and
-- 
2.51.0


