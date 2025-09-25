Return-Path: <linux-arm-msm+bounces-74875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A54B9D2B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24982188B9D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359CC2E9735;
	Thu, 25 Sep 2025 02:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pm/x9kqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675D12E8E07
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767345; cv=none; b=Bryl+zDgSCaoX+dBTjE9OdXDhFakKpJEIMiAedGq1MpHFrXWEkTehHT+0EcR2E8pSnyD6rw7Q5EHZeYnrrFGgkditKBgorJGoDdGYNrAPwR29ywS1NLjrrZmhS67woHVYmXiIV4iiEnnrFQRR5uZRd2LtwmRruw9mFq4N+ob1O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767345; c=relaxed/simple;
	bh=hda2Xd4Mz5OnSn10548Jx0ge0zF0dKZ+ZJ+uSDZXASE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y9b4hYADrzqgKIKz2Xk401mwrUGprLKyY3seV7n2knyHZWeiUeyc4pntyzqaMVgmT7TfgoX9Yyi7VhvVCHJwUpJ8ns8QYIvd/WxIpnPd1FghVv7KzrQLRv3Smk8iyZtHmrE71s8zFoIkx6lZZNKM3LPCNsU3Kpd1UWpdIGxDEhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pm/x9kqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Z4fn019915
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DQ/0YD5xMRw
	3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=; b=Pm/x9kqwjXpeuiM+EFdZ8VP4H6E
	1Kr6LbYY4UNfgps55EkFu6Yi0SzhcW6/dABhIM1fQoEuVa4D2QQliEBoZb9Pr+3w
	D3PJl/AJxZePybRFQDRHfRhIrD+wtUGvLqIitlDV5MAhDgwekLQ4oT3Rc/njzGe2
	mMfq37HRf1LZp01RbbCnt/Fue36p+jezVTG2Bg1El09GBdTImF8OxKWvt1zMMgnf
	V6DyvFh7faCMB0GQkjGfl3lvkzG7ptYBOYHduZQkMa9T1xAUf1F5hRU6wqxqHXW+
	/kOyremgd5UuvpNdYDN2XPyhmrRXEhtzGpKG7ekk1alptfjEeJyePtIDOLg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyngg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso723147a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767342; x=1759372142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ/0YD5xMRw3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=;
        b=InL0G4Elz92Yus4yTLpx94J1j+RRuBbxXAT8yA7nuH6QKtkUJtpFknSiIaVgGjOlqM
         U1ECNruD7fF7JVCtuyrZoo+ggOWjOnHhDlIiG+/vXwcF/VeP5d2smsu2lwhpXE5g0WHv
         mOY7FP0KHchox3RD/8P+KS12ND9ipyPOjHYv8Ga3gLTW9m3KZl8ic4GvRb0wdr8adoCq
         VkFaxtvlOSpKGFI9zR2nY4iiw69/HWHZcv/1ycC5kk7+GDC/95PmMNGMS2PdsaTiQBCm
         dmBoyY7H9vj0mWbTxZyhNmGWs519+c7bBQSSTEzqHMhJld9PvHbX72NlJSBskoyxmc6Q
         i7Bw==
X-Gm-Message-State: AOJu0Yz7NWFyF45vqnHszIW7udfKoJVErkYziJqt6Ub5oa4wbkbeXRAG
	CK4wR5mB86U5cyTPCCDZuWOtlkqScx6FHBu9d2gxm0+n1IDER1J2YGgM/SumoJVKWp2M2hk1XIE
	9O4i3tOxWOEvNhY8QUxpRMQn2UTI3vj9Klpa+8Q5CVtDgowYm6P3h6l5hxcv14CtoK0GW
X-Gm-Gg: ASbGnct/a1CetylWbWX/R234YJtvehGo/w/ASAxhuQ3h1LU9ivFVXknEI1CwNyqYt34
	BfkRp5orROx7CoSqwYuEdLXPwOr/VAn6pjlF1lVbYeiqX11srtYFFvkFocqEqMX+QOaw8F+m6VZ
	B7wvNZveRfFR802G0JEYa107Q2TY3DPLxuOXd0GAONfLS2cbPDOAoxoyLnosfek7O034AwDy5ng
	AjG6WHjJm2qhzrrStT5rb5FbP+YDuMIqflIMDZ0oZkQieBuTUcNwBVKSE5tSkSnlEDmhNOeIH3b
	GzFtLvQPLS6wjVOZjbcaBg0FQ2ZgEm1rf5YXbQ5n+5NFnF13EiNT1jbCrMJzKhRkmZ+9mlYYgyj
	ZiIuuY/CXBQuIYRHE
X-Received: by 2002:a17:90b:384d:b0:32e:64ca:e84a with SMTP id 98e67ed59e1d1-3342a2436b8mr2376224a91.12.1758767341845;
        Wed, 24 Sep 2025 19:29:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHa9Ej68o30zwHMqd1RYxe408/D5PXvI6i6Er/fRTSy1fm27Fjs2od49tjoO15fcRaB1IM5Q==
X-Received: by 2002:a17:90b:384d:b0:32e:64ca:e84a with SMTP id 98e67ed59e1d1-3342a2436b8mr2376195a91.12.1758767341386;
        Wed, 24 Sep 2025 19:29:01 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:29:00 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 05/10] dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
Date: Wed, 24 Sep 2025 19:28:45 -0700
Message-Id: <20250925022850.4133013-6-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bctm6w6Zi34pX6GHPCRCtgsAclNRCvXd
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4a8ee cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9ZGL9VZrYHwIVTkvpzsA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bctm6w6Zi34pX6GHPCRCtgsAclNRCvXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX+DqNEMgB2xcU
 5Cjde09TZKK/rXAuhpNHiKsKul1/d6OX0QwNw/QLDT/7tLhmsoeV+R9ux1OYnI+ZvMDCrzuBszs
 SBDk3ut14k6UASloDfwmhuPXxwo+4Wkk2yqm+mGgl2zc/mkwDQ11a7ELiFzzm7PaY7COvhPbLqD
 puYIBlUA5c4FoIw05k2GLXR92nP8cQMwi9tA09v6FKuuPIPx6g5RAc43vQueWGWFIfdseHtvjWK
 Zc66tJhMuo0hT0waJqk2j92IAtHmZLt6YiBYRH7sSSuZKf9w2wqmKke9OBD5x6sBKKnYConLgth
 ZPCWsdz3acahmIa2hisMaGnbugzsmn3SvRfxwl3pvcOOeJQrqsRlQPrdvauHe0ZH/KgY30oTQeH
 01aadZ70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

Add the compatible string for identifying a SMB2370 USB repeater device.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml        | 1 +
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

