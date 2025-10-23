Return-Path: <linux-arm-msm+bounces-78512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29565C00285
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D9DD4EB49B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F3A2FC00C;
	Thu, 23 Oct 2025 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DACa/Lxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49C62FB085
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210886; cv=none; b=qUF4I7ihVENzfPGlUr9Jc2dOnIrx+tVJ/LhSaP+HKq8Gx/lBqPM2sb/0NojqXoLAQnbCJQmkPAlavGTIuIpmXbEcdJoAw9ik301Vli35CfJZf/DUirLiHmpyTSIIaOwpSBh90y6O7Ys+mOAU6K3Aen6OzXmsgNHP5A6NhWXo6UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210886; c=relaxed/simple;
	bh=bZnoqdyFY3pu65TwtNZzfCsh30CpB8ikyYZgkjinaCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWIU3VzLh7Yme2jB7nQm7QFDby7n6n0X/ghHqQFRFs19VJ1jfZ/HL6B43A9w4tE3nOXNH6EEdV6CjPWAXVsb0xMnEWpSqoH5Pgex5s3zfRXPT6FhDUB5tkHf+MS2V1+ygrkSF85hkeHgD7Iz++ibZ02MebOw0qghWvs9k5Kfvnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DACa/Lxq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N76TS2017033
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LipVLE24QMA8YmFHCyk8Jk9meuXazMzb1E+JswV0knE=; b=DACa/LxqwO1AqH/t
	QSNav0XT4TSeye+cCNML5mkfwoQsEle+YVt3y4SOmzqDmlg3NjcjEfeXPnpia4Eg
	VFkaUKQ9hdGRv3gLol2LTGCCMg2GnxVhqlZpJaT9KmnNrIBG2ghw5rhdx0jncWNm
	WKp/FooBw7Skiz7KahL5Fn/FtkEZfynNojn3mOXU8vC9K7jpBlZvpTeGPtOmTNvS
	WxYBeQoaEXvu2nOSHDelT8OX4i8yyiQ7r8Iu+scFMdlBTrY5LOjuC3sSbVZQodfY
	ez+4XlP2e8cEoB8GR1h0/lCbeYciAgrUZKaSlnc7gLCYPN29PjBjpulUnJ6aKupv
	SeDfnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsdd47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:14:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-332560b7171so1493660a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210883; x=1761815683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LipVLE24QMA8YmFHCyk8Jk9meuXazMzb1E+JswV0knE=;
        b=AMhNuLACxtZrIAbHM//6++6uTMUhfHEqRyE+nuuwsb5KU8OyJMlNkqMQCxlSL2rPJO
         ggCeiHW6tfY/MYb1YYxoKvxpWuiJKyzw9pTlk65UO/TvisRt349MBVgRI448gRivMZhX
         6/yrKLmxtsaIt8PVBXFCGX8cy50QXCJdjYLjFJPptBXlT94TnsOeGg0XaDoYwBC67OMj
         27VLof0SpIu4JeCz6VT1CIA2nsTMAZxLxlYvtFxiihlrHQ+/ER9zP65uyNeFTSH+uE9P
         jYFfBFyueFsU2zvCz15vMFcGkGxQZpuI44Yk9o/hPmzXkDYD+aHycp+Cqa6V8CdpTJp/
         +iXA==
X-Forwarded-Encrypted: i=1; AJvYcCW3MPAOZ/IJEUnpe/jkux7EAP+aueaxRcCPpJNtfjcSO69UzLkaVsMMG3EoF3zZ9URQomuGK0gDTc5evq5v@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc/mwJVMfd/klgrno/pgbUp6joj4BHnkkI1NQI9JFDjZmaFr9+
	FjqEQh/lXo30+KON0/jIerRLBuBtmeYMKo/UxkfmiA2pdOyxg8ECDgAm7oxhAdx2KPZx5ikBsK/
	2RXxEOPZK968xsA1cM1W5cIcXbsfNlFiSsFvto9TggmGcWANZwba3voQlj2d9x7OLUMep
X-Gm-Gg: ASbGncvtAa8j77VGZPBdeCWwMqGz11ndQKvkaJPOLDpWd3IsuOZDDUJyn6LqxPpLCEa
	XROG4V/W10chXdtuisB2wFnq8MuVqnw+ojCdT0dquzb3SzObAKgb/0nxoI/MJRsS7oXn7LBR0C7
	XUsuXFRTvhUTHXHlL5oyZ6Yfvz2ody75z3w5qPosUCFw2EPnzWq1srZ0+MBlDO6oiXyDTOlauMS
	/gHfBp09A3HdkOfs1jg0il6l6xKTPds8L2On7Q8NOkz64SozZSQsRpx9mVLN4Aod9gk4U2uXuxN
	r568e9UcL0UkZ8AlswhrZ0+2Bkmip355IS7/e3VKakroS6O07O3PoNguLK9dicD7+45HiRG7rI5
	Q849JDoiA618WBCXPw5ZQj2Y0o8TA14kPCbN1AceFD39ipPaZA62J0g==
X-Received: by 2002:a17:90b:17c6:b0:335:2d25:7a7a with SMTP id 98e67ed59e1d1-33e911e59d1mr5778267a91.10.1761210882772;
        Thu, 23 Oct 2025 02:14:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQeKi3ZL9DiqlL7KKJDUNZULNgbje2o0tA0G5GvOl1jWpfNwjwyRN6avI0kYnUb1hUXIrAXw==
X-Received: by 2002:a17:90b:17c6:b0:335:2d25:7a7a with SMTP id 98e67ed59e1d1-33e911e59d1mr5778238a91.10.1761210882354;
        Thu, 23 Oct 2025 02:14:42 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e318a2sm1490081a12.33.2025.10.23.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:14:41 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 02:14:33 -0700
Subject: [PATCH v3 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-add-support-for-camss-on-kaanapali-v3-1-02abc9a107bf@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
In-Reply-To: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX2nNfr2IJfcYY
 vRD+mzUTR5NF7BdUeJvk2NwRLdOoBMWhfdPiXDnCQtgYG7wAlB623iozD4oEeSNF56RvL8bR8DY
 eWO85QfAGioBLWv4ONxwQMoUpab1vQ/LaBAm6JXXCBEPNef/EzvHpO0nL7uHVrq3AGN4R3ij7UM
 YIyl8EPPystcR7IXugngn18On8foCuLxTCC6cZUBoa9FEDJM7NX2lQy3PWof1G6N4J/mYfPxH5A
 zqXf8LT3Ncm+XYjAZjASSzVC+PcO32j0d7ELbMo50t2eVXolnBSq6wfKxGGDQrpVETNp9WU/Zp1
 s6Ys8NFBOzFNWieKqfPNxFQutce8It8cvUTGJ6PzdnPsLyBB0Phx6A8vPhoNc8lclq95HFkTcZw
 dhJU+EfkKusYnuGsWSAK2Iy+/TgB6w==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9f203 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=j9zjN4cs5acD8dv8RPMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: yfEzHsg-cA3J4XEQXP-HvPe3dtNCWWOK
X-Proofpoint-ORIG-GUID: yfEzHsg-cA3J4XEQXP-HvPe3dtNCWWOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

Add Kaanapali compatible consistent with CAMSS CCI interfaces.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..9b83ec63e124 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
@@ -128,6 +129,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
     then:
       properties:

-- 
2.34.1


