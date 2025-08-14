Return-Path: <linux-arm-msm+bounces-69269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A465B26A6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 17:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8874C3B3D38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F471214814;
	Thu, 14 Aug 2025 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpLLQwSC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DD821256E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755183281; cv=none; b=GrqkHf/gV8LZNx7okdcXqclsIdF5ikfPN50jntDhMs0C9aR7dOnWR+429JXUKSH3QcBUPdrOutlGzv0JTFcjoVGNLdHykWAtB3dZeB0n1qxkcBs5ssHbA+LUFI/39pWv+Ge0c/A1tJ9BeSq3cXxfOsuLXavZb/40om0I4ARVBg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755183281; c=relaxed/simple;
	bh=7Ao2rWjQ/ojqXztz4wSXnsU3LKOpkyHAtipVC883xJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blvtt4w/G/6DE+QrOs9zckhICzy3JkQ0/xyTTk4StD4MKP9r72daIAo5czH3Hrl2mZ59Wqsj27LCRLjeAQdY8exsKdGoc3ELBzOluC8au34pZ6f2tyRSeunzDYkGAItOs57nm+Cio/HFbzWwLKESFpRt2sFdH1WSS4xGZpDttEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpLLQwSC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9LRXx027282
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 14:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tglaKq5MwHPkzJhC/F7WN2IWUMXxho8xACm5J/TZbM0=; b=DpLLQwSCX9cBMEKl
	FWx3GxQQmpTJ6U7GnqyCSmtWxr+KYEDZilKjeIWCCAOLStZxJi+Q/AxZCcjmkalw
	tEjT5tHZh2YzBSCzbKwBiMe5Ii8LT23XztdUzvyiTHPCva+wEj8XyOZHLuWacR4v
	OrLY0q0FQX+dNOZ+OaC2AYxniKOUhqp2WR0HRtLVcAK4PFn8cWMVh3B/YO7Nn1bA
	/xkPpDlhpY/0nt04RsuNT7Yd6awn8eTxL4moR/t7A9xQnJZHE3wKEVS/QNubNczP
	cwWqlRpkmPlB6nPASKPltr4/7NOMGimpW3JsU6Dg7LOS4Sh4yfyKYeHar7JEN/ur
	VsvKEg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjux7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 14:54:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2e8afd68so887217b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755183278; x=1755788078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tglaKq5MwHPkzJhC/F7WN2IWUMXxho8xACm5J/TZbM0=;
        b=AWHeGiWdtY0xzIWTNLp4tZAmuNePGZ6P35L4XFub/VQa7RhlpZSVXtNG/WirFLZONc
         6Ob5MBD4oLX9PwHQ9gd/Q/dtceQy6afC1VETruyAJXwZjY/DA8Y9DC4zne1XfGp4p47k
         Fy+MpxdzlEZGc5ywcEcSiSjgjysskQCVLyvJXrcPLlw8mHAQ9ex7JwdBYOZ/NgPwVN4+
         j0n4aAuxOSs1hf5y0m/HL03htn4CBqKsMpYrfqONu1B37Yi1OMe2choBDdITUZuc25aZ
         By23FokxjHsJTah1hV55iLIpblSK6TGYG+AwFZOhwl0oxLqFfhOzxwIz3BlhCIh5UW1Q
         M/jA==
X-Forwarded-Encrypted: i=1; AJvYcCVtgbQQ82citRqI8cHbpI4O4RNusK5V18tKSC4CnyrwKLluV9bvFxsInssqFsrnX6Ehdqa29lqfyBsxphMr@vger.kernel.org
X-Gm-Message-State: AOJu0YxZJ7d4ZLSyj/XE6qiEQxhEsIV4q8VFjhmVYOHbHHXxenZqC2zu
	jqOUyGvI2RZ60g1EoDTs7kJ94MMwoQR9SOAuQichb3hHkXVZztGBkGJVSlOb4Bqb6uag0gcYDiw
	j6fJm/i4Ehhym8mU6qJ4GHT9eOpfBIfQ7ks10+jQbioclIKigw9IQXGhTc5M5BmklULB3
X-Gm-Gg: ASbGncvw8H00/Npm7i46Sn1VXpCBy4T9rNW0arXWsNZDBKNA35XnNbh9DC6HZbXAz5Q
	ysD2PmPe9FVz2Pg+BAZi7vcJXrl3kOIa70dVY09Gy+iUuDWcIB3cqwZObM+ORdPOOoD1p4MhfR8
	ibuFJQkNBA7lFlK/PUf7TOoq7HRzQnkKQcaDIBfGSoMhB6lLJ4ZwVSUpz4vCdUrhv1ocSiAlKCM
	Nu2tgEa1pfJy73J8WiQIB84wTtvNmYd+/zbZZZPgiil8sEkEkuP1frROLs1yCWgaesy8uxBcdSW
	WajuKBt25mB9+qQPv0dwbDorJw115UTRmFrjMYrJOStfSOQ7lBNZyCXRqDPEmEA=
X-Received: by 2002:a05:6a00:4650:b0:76b:ef69:1543 with SMTP id d2e1a72fcca58-76e2fc0c9b8mr5979295b3a.8.1755183278026;
        Thu, 14 Aug 2025 07:54:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNVdJy1vrWmBYvpmA2uQhEm7g+HPzTdliF9g3hxn/kU1f8cBwtjX4rjsL1kAtrkg1z9pZ0jg==
X-Received: by 2002:a05:6a00:4650:b0:76b:ef69:1543 with SMTP id d2e1a72fcca58-76e2fc0c9b8mr5979243b3a.8.1755183277479;
        Thu, 14 Aug 2025 07:54:37 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76be718b2d6sm30715274b3a.56.2025.08.14.07.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 07:54:36 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 14:54:20 +0000
Subject: [PATCH v2 2/3] interconnect: qcom: icc-rpmh: increase MAX_PORTS to
 support four QoS ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-glymur-icc-v2-2-596cca6b6015@oss.qualcomm.com>
References: <20250814-glymur-icc-v2-0-596cca6b6015@oss.qualcomm.com>
In-Reply-To: <20250814-glymur-icc-v2-0-596cca6b6015@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Mike Tipton <mike.tipton@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfXxgtUY5jnAVqA
 kfjJidYr9MweOvB8jJLygd8T8VLIfG32PNx8h1l6lV4xKtPb4+oGGwWnuWc4tbXfW+TqunDP6Kb
 uok6XtgnuE1lRZr1Gc1603rErirjwjDOXDn6J7iDr1qIthp5aR/N2cb7E25t9HOF8qjwkc+oQmz
 Hh8a2bZYxbORyFf7Ll8oiySGo6/aV4o6cYVlBns4tCqwdlou3cgLjv0yfZu5vD0rpa2dzLUr2HA
 CPw7WZwJ0RKQ6iFethoj2W5oCjCDnhaTe2adFqg3WjHDIkmy+84r2gd6ncpHEt80XYMVqpuWqmT
 l0CvN7cf3wRA1xqRwNSM3MSUbwsKXKkLiEuK4JXj8VhI19KKKIbHZ+w3vyA36tj54ALprJKkMBN
 5qM4CKqi
X-Proofpoint-GUID: xObLCd6uSp5NnzMAZQuWY0kgzdi5PanY
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689df8af cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KQ-1iU-oSatw-PdDDDcA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: xObLCd6uSp5NnzMAZQuWY0kgzdi5PanY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

Update the MAX_PORTS value to 4 to program four QoS ports
available on the Glymur SoC's interconnect master node.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpmh.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.h b/drivers/interconnect/qcom/icc-rpmh.h
index bd8d730249b1c9e5b37afbee485b9500a8028c2e..307f48412563690049e944907bd80500f263f738 100644
--- a/drivers/interconnect/qcom/icc-rpmh.h
+++ b/drivers/interconnect/qcom/icc-rpmh.h
@@ -53,7 +53,7 @@ struct bcm_db {
 	u8 reserved;
 };
 
-#define MAX_PORTS		2
+#define MAX_PORTS		4
 
 /**
  * struct qcom_icc_qosbox - Qualcomm specific QoS config

-- 
2.43.0


