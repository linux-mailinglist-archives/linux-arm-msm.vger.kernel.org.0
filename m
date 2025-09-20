Return-Path: <linux-arm-msm+bounces-74272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2DB8BE4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 05:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C45331BC820D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC5C253F07;
	Sat, 20 Sep 2025 03:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJCLG5K5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81EC246BB7
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338491; cv=none; b=aRZkSCnUGFsoIi3ScMtLp84sIska1nDYAyIJRh0l27VJJbMjPLa074NWkSevDeR4vFuIeDFwUT6HOibx5ffpwuWUgmqhKfTQcx5lHLIJkXSGC628csJyRMdFmTMy2DVLMURLSpQkdU6X3ss/ctzjV8Gg9GHIwRpWP6Ydjt6ebBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338491; c=relaxed/simple;
	bh=kP94qs9O8DLQcs2Bvirs3zIUN/e+b/TSSwwcST/H/sw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u4kyzD4I43sOBxDXNrOgE2LIE0JZkmWkj6XSVbthHHSiC1AxYp7fKUBGFMEFTxNr482xNI69x9OO6tNRUuqARwXf99VgCdvVHibWKAYplWxL987oPDX8mEoPRJE+1DID/TD+vpKSXy/LebZ5zPR3jOJPDTUQVKhLvXOyGudjLPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJCLG5K5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FZZ2000546
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6uA00onJvkc
	yy2M4ZvUqeOEt+eh84BjDYyNUmNEMNdU=; b=iJCLG5K5y5LXSke0an0jS6RPOOC
	7HuyWTkzcucl6yxfe+N7K38UlJerDUYkkFwGi37UqKs6CjIvueeWpMc8JZKrB6BZ
	yjemXDDG2iP7plYqEpLHoWvhxuBRtaUFnmq49boNm8xrJcrK4UgAL6uWmHz3CiRg
	w1L0RbC0ua6TOrO0UPiI+tW74nLJG1jbu8qYba77RhnrjB2Ne7vjOK+/X4ZeLVJe
	hBGjXLloLgoaWzEMdUV3n+xYIW9MTPmqtp5twpt3Uc0btFeY7kLjAu5JC404RdRx
	7xpdmPPOOOuRZflrmDYtYCECJcBLxA0qT8IC9GcFWS4LDjbxzfKYY2cWYyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmng8n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 03:21:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7761dc1b36dso5173971b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 20:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338487; x=1758943287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uA00onJvkcyy2M4ZvUqeOEt+eh84BjDYyNUmNEMNdU=;
        b=Dzj9pPLAMd6xC3Rthe4G0Q3caWzi4DsnOHgByHSfKVWnTovjkYmZ/3sDgGKBfuTkSV
         YzN+5ySd9mxXXUnsn2DOk789/t8Prk2KrurCnFv+Zg3yFFBxgLUkYiADfEBnzz5mXiRb
         DJgghJ0J9DI/j3W+KlFIDlRv4xfb6nFZqA3g0AzxdQDguJU+ALQsOjMpc6VgDBYlJK3z
         z53lvy92tOKpJC+GMxWWqRdFfMT4MgWG5kEgv8Fiuwf/iPo2uG7ZiMsv3KzXPeTv0j7m
         JH5AE+epUenLWDldF82mnvs7toiLbrvnyqAkKuseqFh5bMLS/f2TqxhKqCdlf70niFMz
         hrmg==
X-Forwarded-Encrypted: i=1; AJvYcCXYwkZvaCS4QIAcguew2WvUaONEXEptpqP16hLnxTj3/6V/kIHRj3XiK0UqixGJIjIL0SJqQWojCEeQF2Qv@vger.kernel.org
X-Gm-Message-State: AOJu0YzEXj8gmQNUj5RI9n4wH/SEAe4xpAmUTxRkEJW/2Z+9XDMmT4pW
	3ofrD9uIeVl11bqHICocU8rOez9AJhZKn/Y8PnZtD3SMnOL/d+55Fr5evBRJnaTRCjoiNlCWWDD
	gx1G6tMFEK5iOK8FY2N+hMvlu4sZo7Ju7MdCJk+cppGARgXtZSQu7/BI8h7d5QoxZ3uvl
X-Gm-Gg: ASbGnctDPiv7VwmHkUvMWz7PkSUUhtxYHEUuFHSQhJPMCFmE7G4dBrNBykqE2jqQoMy
	qpOlHfTNHx6dD1c0P8Awy4xmoEFfxqlcmp1YRqF5rdaASmZWA9S3im9kARWTaLszCQLgjYHnqc4
	AY9yZ8NKS1+V6XteerwO90s3RpcjUcLzqjreQhwCzZsjmd09q5zt6wyqfQ9bc1cE+CSCRVS4rlf
	ZBiSnm4GgaKYCSMRgoBcjnL0vRZkOwvXt0DPsQLmzFFjelyqa4BBjitEv/fC3Yhi3ETmLeBq64L
	DCYViw53OkDK4rHFaR0wwm1C/FXz33/73iUIA3revT9tyShCcddtD+N2FnxdSfcH2hJ66giYNKA
	e5AmLLf48XC44yk3l
X-Received: by 2002:a05:6a20:9143:b0:262:cbbc:312c with SMTP id adf61e73a8af0-2925d0de225mr8589055637.17.1758338487154;
        Fri, 19 Sep 2025 20:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFXJwFYvetfpsIeKUWHiInvLQN1H67mlVltjKBQFq18DtwSU2ecOTFXwigElZASvrT0QR38Q==
X-Received: by 2002:a05:6a20:9143:b0:262:cbbc:312c with SMTP id adf61e73a8af0-2925d0de225mr8589029637.17.1758338486759;
        Fri, 19 Sep 2025 20:21:26 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:26 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 9/9] phy: qualcomm: m31-eusb2: Make USB repeater optional
Date: Fri, 19 Sep 2025 20:21:08 -0700
Message-Id: <20250920032108.242643-10-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68ce1db8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LPx1eKQi2Xt_nUOAx-wA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 6WK-NJ7-KTMm8ByqXz7X31FD3-AkB-C9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX/Bbepp4zPnOc
 k5FE1udtsOumUSC6MthIxko3ElS13dLPWgS4ZejB/5687o5stLS2CbnDmffK0yJd1my0U0iGt4g
 virtsw+sYvKbxACKWb5HXDXcD9y+HRxfFdue8FWVQ847F9S1X1BURWdXiEht6XRPXKTn87votWb
 H5B6hbybK3dgQF8wM59UTaJeisjow72ZnQbhLRknfilKiSqv2Q2LlTv7vpbTD+m/ZYZn5L/nOar
 to8aHDGSMYo9og7bNDSC0WurAAzHDew9TMzxo8TIRa8uLWtY6JKQ8YjG5Cz6jxF4NiAvchpkLTd
 oEFoBx89M8n6tkTYVY3snfmn/UqxPUVt1UvyGBN+WCiAlTZUwuYdadXX0GLeyp37jbksdvi/W+M
 iQMx/HTM
X-Proofpoint-GUID: 6WK-NJ7-KTMm8ByqXz7X31FD3-AkB-C9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Change the notation of making the USB repeater a required DT parameter.
Issues were seen when supporting USB2 across different form
factor/platforms, which led to enumeration issues due to improper eUSB2
repeater tuning.  By making the repeater optional, for SMB/QC PMIC based
repeaters, it can utilize repeater settings done in the bootloader,
which cover a wider range of platforms.

For other repeater vendors outside of the SMB/QC PMICs the repeater
should be defined and managed within the kernel.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index f4355d38aad9..b8ddadf78c53 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -285,7 +285,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(phy->phy, phy);
 
-	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+	phy->repeater = devm_phy_optional_get(dev, NULL);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");

