Return-Path: <linux-arm-msm+bounces-66436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EBDB10332
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 10:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B44D188BCCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91BE274B21;
	Thu, 24 Jul 2025 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlFDArXX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2442749CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344963; cv=none; b=XH/ShMC8c545fE81WmGNZjkCJoQBdWuOJ8tKna6MmWNVr14to7mnSQ3DXOHkveyQJPHQ1GdptsIlpTveB4eR2c39y+8eQ7Msu/9duFD3o+xUDUOOT+RbafD31M8eUGCrPZU/hTjgkN7GxC7xl5x4K9fEZGTyX2SNkAJmhkVUZug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344963; c=relaxed/simple;
	bh=ZcJEhMl8aRXGhWKoedNGnq1deLTIo6Y1rB5+WklLcZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/bNQ8tkPa6B7WSd9a+6XBrYju0UxzSckZZApI4wOAS7K30u/WuwqwzdBjj2ie0emj6Z5anoKDEJLFRafRJYE5KLveFSPMBgarydeytneRzHE1HIZ1QtdYPzlWxjIhqWHaca84EqkPl/GV4ujs+kaNF6JhzkgE/wzvFGGDW4YHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlFDArXX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXOC0012641
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bm3aovFQ/K0kdRKvGL94PyzsvpCmxQWUujwTzg2h1Tg=; b=TlFDArXXRyqs6h7Y
	G+GN1cjqYrEwafzY8lQxHId5bEGmCoahaegwbrx7JmTxsImVqV2KQPjcKQzk/o2M
	a3ck6USDZwnmsT1MIkZH5FtJPR319eVN6tWuKKnhZ8Q1OAn8O9KXDhTHn5MYxAZX
	sh9KkLnk+aHi+qo3L/ujeEC8qarM6MRlGwr4zy5x4eDb1aPnYLydO9o5iKZd+5v8
	pgEOU38T82lfABFNa5h+KXxmPOxN2eyCeOOUwiE/IiLwD8Q8N1/WWe0/g1znxGH3
	jW7eEK7eYOeBb/3CCj093XVFRR1tLf3SnNPpiZnQau5iLdceGws0LTUaHKNC8Fwj
	0T/UCQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hwym4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:16:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234fedd3e51so7067365ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 01:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753344959; x=1753949759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bm3aovFQ/K0kdRKvGL94PyzsvpCmxQWUujwTzg2h1Tg=;
        b=VuZNeVAH1n8Ut7TdMrpcFYAYhXcngekDN5pN0ObrKDBGD0m5cE1ycrpzQT/8yl7evJ
         ao2HU851BekuvJEHGAFuMiUx3eaq99npzq6UdRmPkF4mN9K7nS8ixLAXzZzOryYpbf0K
         eZv7vqnfJrthvKH8DRndggR8M56SBAPm8FR64knxhFxn9xv0dDFek+NurvKNPA7K/K2n
         vaMCRTdAPIOUz2DtRX1kVBlgEzRBasp6kSh9vdaQiOhWM5Wul70xr+XuNMN6NdOVGvzu
         5oMOq5svFBfc4n682eYPXy/3HDMEHIy01+0TtiYcDf/hL9nN4HhT1li6GpFmmk6AgNTW
         iaBA==
X-Forwarded-Encrypted: i=1; AJvYcCVXaPG73TLlOg8ARAmzFhH9yJnVDag6fiyRcBKlgT1gIonfHgFnoZ4B0/lgT7NmY6Pljgkm4pM5Il79n5sz@vger.kernel.org
X-Gm-Message-State: AOJu0YxgmQqKdd6IwsewjQ7VAE5bflEaSVh/ei9yfNIGOwuWrDkKj89e
	cIw0y5vXvcFnC52kDxnUbbbZ/02RgIzicnroaan/cxXfOHde0qNSbli5QBI1fDXe8CI7KNHBGbj
	8jTKwkN/R5tKGRdI3jfkZrFpU8MDfmOgpO0pEryWTNiuda2jMyKI1HtfzsKOHNFJ7WVST
X-Gm-Gg: ASbGnctUSnHdZwKbccHOo8p3hNKQF1rxAqdDVw1y/flle8zg+hwc46owUENgLeovWj6
	oP0X2cX1ZwCIc5LaAxedKL6dQvoeB/4YNm0EkWFVU9Ium7Vlc9O426NLe+5w5+Wh3iUZmGijyYH
	mDzJOMcT1cmNiinK1GF2BfBvC2RAiX9AhB08gr9wb2Pb3XYkYkMMUnLigjQ4KLK30hm7QKe8NxP
	VzgEsblCHDEC0NVYMBc7FpnuZN4Gv9SwciH67+/xW8mkvdqipOFKPowcHC255yRzNoHlkaUJtj5
	WHLpGlaTJuZ8XE7kDXKvCmQpzWyJm1U13VY4W1zJkYiRa7xjLPdt07J2gYgwpd013Ons8GYOwpv
	eDKZULCoJl4+wrld5Vcipo41h0qWyyPg8/w==
X-Received: by 2002:a17:903:1108:b0:235:91a:2c with SMTP id d9443c01a7336-23f98222756mr80196025ad.42.1753344959615;
        Thu, 24 Jul 2025 01:15:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8QThZMPnBD5usjJurD2Nco802MoUQDuB84FdLmRcEGGnZ5jABk3voC7kE0hdHOcQyT2fWyg==
X-Received: by 2002:a17:903:1108:b0:235:91a:2c with SMTP id d9443c01a7336-23f98222756mr80195675ad.42.1753344959117;
        Thu, 24 Jul 2025 01:15:59 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476eb07sm9770595ad.65.2025.07.24.01.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 01:15:58 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 16:15:23 +0800
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-hamoa_initial-v2-1-91b00c882d11@oss.qualcomm.com>
References: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
In-Reply-To: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753344953; l=1359;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=ZcJEhMl8aRXGhWKoedNGnq1deLTIo6Y1rB5+WklLcZE=;
 b=rs/99e5tfSDn4Oy32jYJUz1CY7pa1am8gw6kaWuQH4/GStUUMCtJVnjq5XD5Pw1HdZYlDKNcS
 GeyxYTb44U1BITSwGyXn8Sjiupbw4PytE7IJgGrfHwuxlLJAHGxaLL3
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6881ebc0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=X4CchLBkMRYhfesQTxMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA1OSBTYWx0ZWRfX3Il/fWwx+5yD
 b0Je/Rv2YrOMb0vNn6iUM8LHoZcOKgowxwOr71Z7JjPejewDrkehA+M1efmxRk2jFPw8Ub55ZEa
 UmrXAJx39t6KaIO9342UqH0LShLz8n9UbnJ/2LtjYzm/FiUR7CWu133moHukOdKUZdQI2OmvxrS
 hKl3LkJakQxNz+LOFR5WOc+zc4aDA8jvT/r0JA+DwlJquDoDUAdt9tpvn+w5DO8nfCTEvEJDxB6
 oTHXRZ2GPba8VKphxVkJ96ABABxIVYweljl5yIuXzSMdS947n/lUM0JXiQ34YRxqgw0Jo6BBqlY
 nwF7e5oJg6qa97jmIVA24qSdcE3q0lFYrXK164lp4CPRRT6fIf73xffM/Ia8EzHRG1MSDjTaCCr
 hfpsOFu937B7QYReQr58wC5eudWoQqANmCkvh8zMRnuZm0T4+TgO2wdW1BkFg+ngR1NJKqni
X-Proofpoint-GUID: BuFQIXMf5dSw0-Lh0AKqdtcahUKK5J_l
X-Proofpoint-ORIG-GUID: BuFQIXMf5dSw0-Lh0AKqdtcahUKK5J_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240059

Document the device tree binding for a new board named "EVK" based on
the Qualcomm Hamoa-IoT platform.

The "hamoa" name refers to a family of SoCs that share the same silicon
die but are offered in multiple speed bins. The specific SoC used in
this board is the x1e80100, which represents one such bin within the
Hamoa family.

Although "qcom,hamoa-iot-evk" is introduced as the board-specific
compatible, the fallback compatible remains "qcom,x1e80100" to preserve
compatibility with existing in-kernel drivers and software that already
depend on this identifier.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 47a7b1cb3cac1150bcde8c2e2e23f2db256ab082..f004019c5691e0a9a3d56a0e3af395314ceb3745 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1161,6 +1161,7 @@ properties:
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15
+              - qcom,hamoa-iot-evk
               - qcom,x1e80100-crd
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100

-- 
2.34.1


