Return-Path: <linux-arm-msm+bounces-64248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 599AEAFEA3A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 15:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F37863A6ED6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD92944F;
	Wed,  9 Jul 2025 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmbiKadI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3023288539
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067751; cv=none; b=mh/nlnndDabi0hy/tTWvafyN508kNNv5WNcl1Agdz0LGaQgDw32Wcsqp3vkLkLzBm35LCGsntuCKFvoi10wWwsnMsGKkvCmYV3IebmEgv5RHqo3JZsSoQtU3GOOia85mr8jhTiIxM2raaBCP+wEEbY1gZ5n5JEeYwGHmEyNx0aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067751; c=relaxed/simple;
	bh=O1sRYtFIa91eRFyE169T7pwwXOo8vibbwjrf4WOSfQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BS3X1dcKLCYYawFM6qp6F1CGe6aEYvVGHHJ8l1iwIWLZFl1/IRMBGGwvsAK91fVXG6zgR+19IBwMBjYZwgkmfAhnckHPWFa+qjmSVv6qi7may2FxCnFWUPrMe0JtmBZWuiJUbiadojYD2FxRh/ePVrNxWK3St8qoTB+2586UkPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmbiKadI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Cp0ZA031183
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 13:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wExzXfGx7fVDJM1zX5REeYphpIZx0vWkU46
	ZWHHNWtc=; b=HmbiKadIKGp0fUVDC4eIAyN4bMw9PUvK496PeVSxZgvIQjogdZT
	B0vA65jF5+J9o0CMzfwATsVWtrSx5h6/vHGFQWzt0azxM3jWEavdF5Ug4DTHZOgc
	MJSqELwbtoL1CqaJTkFB9RczkNkAkbWe9PmKx7NPiWNf1iA+npHpCB3yATw+RaOx
	us3yQCsbQwcfCmG1SRo0NLat/nOh7rGtPYlMpZ+pI/4j5r9cfGHN69avZWaByayZ
	rXf3fX14mAXUIXf+AC/j5ENuhdXj3eX0197TxQY7M8kw8k4E6Lg4LPMDKQTJQGjA
	It+9RB/AWE7lVrQt9C02vxQHPt9rGjImoVQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg13qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 13:29:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74d15d90cdbso2642471b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 06:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752067748; x=1752672548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wExzXfGx7fVDJM1zX5REeYphpIZx0vWkU46ZWHHNWtc=;
        b=T0XQmP6fae7eCxQpOGfEvsSugsXtvg5gCKn2v2hmwtzCxUIF+L7J4taadj+dac7DzD
         NTGJFjkZugUbwd3s/+czPHyW86B+3N0mHayqXG3/BOZfK7IvdkWZ6BYLQxOS2yIVFCGc
         HkhIIOODmDBjzIcGVVvj15Q1PRdjMNaHUdarCJ42szOJ7+zg6Vy6cnVjt5YNWcIgKPrV
         DFOOisaPBkVVvE0NPx7K+k7BpUFzkdHTk5gwM7MaVqRHS4DDGP9syfBxdXgmCzBwEXR/
         A4JpDuD5lgzYiP4bfpL5oSzr8I3qPYgbjRydNxNUoxA8BEqOHsKZ3jDsZEnJi4auwlTM
         EhOw==
X-Gm-Message-State: AOJu0Yx3hOLoSFk0M+61whkqnOR62mus8bO45MLSchXKr+oMYgoLFEkA
	ygmBrHu7HTNRB/q9+nSPC4PHPhPXQrDmdHSq6VHpGV8I+AnoUzigcx1nAB859nH6BRh5F28oqLH
	3D5Ia3x70HTPaLA7Oif7uDrbWUMg84W2uMJI02n0vN8S7mP0Lfes6STjV74c/zx9ieoxU
X-Gm-Gg: ASbGncu6ZUYgvM/e/MrH7lVlr0/AZY5fMI2qh5APJOnbsp++dyIsFZk6K0j5K06qJ8h
	e1DBEGgHZaYJpSkrbV384q2zIciR9PTuh8lt9kHUUySmvtzyQsvQ8/stfZD7iWxBkM6z5XDp+7d
	SGBvlAHcL0jmm8nENI3n7xz2ALH+Ry3fOFHOylJz7yqDucjsAxt/b7WEMSHLc0GpqMmQheO8+kQ
	xWMPjOqCLce0DXDbSWHaOU3kzV0r3p7yij0h0CqptlJUjh8PH/5NIyijd7cf4A7jqzRjR2cwvH+
	SzgIhsfFF15eJo3gx6CewBLwuLFPtfezxzIBfUeZ54PZ3SqGRhxzCdyAd/YH
X-Received: by 2002:a05:6a00:84d:b0:742:3cc1:9485 with SMTP id d2e1a72fcca58-74ea66317a4mr4024383b3a.12.1752067748159;
        Wed, 09 Jul 2025 06:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzRHaHSO44BBzmOOKO6MwOJrBeEiWuMWa2dHzR3KNz7K+mwg+WYWP5MCNJ/+DbJj2XR1mU1A==
X-Received: by 2002:a05:6a00:84d:b0:742:3cc1:9485 with SMTP id d2e1a72fcca58-74ea66317a4mr4024340b3a.12.1752067747675;
        Wed, 09 Jul 2025 06:29:07 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a4117sm14062393b3a.125.2025.07.09.06.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 06:29:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] usb: dwc3: qcom: Don't leave BCR asserted
Date: Wed,  9 Jul 2025 18:59:00 +0530
Message-Id: <20250709132900.3408752-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686e6ea5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8
 a=rzSUB_1TqBMNDQYVAdkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 6nbM8JlR3VGo62FRK9X_V-ChTsMsRXdA
X-Proofpoint-GUID: 6nbM8JlR3VGo62FRK9X_V-ChTsMsRXdA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyMSBTYWx0ZWRfX+wOSIUX2zh6Y
 bmQL8miZ9x3kplQX/vft9MGq9NcUd2kN7DFY2m6D6sxm18rtI7xGCEBfJ6/PXRjUW0JJhDMi3/n
 qnwsm8tOmBlHlOoNslWCFxyvDeyYabxzFkBj1UIK8/DUCwKbAEqZtM4nfJsF8mpDYEvix4r/e0Z
 hzbIoKKblKMVF0Imkc2hWxgPXsVbp02wSNFMFDJF5O3uqhfyxI/JDP3sxx02u6N0CONiig4IlP7
 c6ImtKAPFk9TyYbRJujWDgkzFwk0UHJsWvog+VtXAdeVFS57fb4nPTUm3hr1oxQ3si3dCq1zapi
 6JK7WRVdMhUE4ur0RgO4iPmar6IlbZ7gyQ8DQsLGJuziBvaXBAlQ1f+53jWuWjgf7KUidqB52LX
 wKezvo0pLRTYRRaMYDVGXETrwVWRPxwMBDjelD716HrRYzyRSbZO4GPPaNtNbShcnJYV/Q3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090121

Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
blocks any subsequent attempts of probing the device, e.g. after a probe
deferral, with the following showing in the log:

[    1.332226] usb30_prim_gdsc status stuck at 'off'

Leave the BCR deasserted when exiting the driver to avoid this issue.

Cc: stable@vger.kernel.org
Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
Added Fixes tag and CC'd stable.

Link to v1:
https://lore.kernel.org/all/20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com/

 drivers/usb/dwc3/dwc3-qcom.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 7334de85ad10..ca7e1c02773a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -680,12 +680,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	ret = reset_control_deassert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
-		goto reset_assert;
+		return ret;
 	}
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-		goto reset_assert;
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -755,8 +755,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
-reset_assert:
-	reset_control_assert(qcom->resets);
 
 	return ret;
 }
@@ -771,7 +769,6 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	dwc3_qcom_interconnect_exit(qcom);
-	reset_control_assert(qcom->resets);
 }
 
 static int dwc3_qcom_pm_suspend(struct device *dev)
-- 
2.34.1


