Return-Path: <linux-arm-msm+bounces-54374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9EA89A15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2585C189DD71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12DD28BA93;
	Tue, 15 Apr 2025 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeCMSONe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFA729292E
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712817; cv=none; b=T9fVz8iKdNxqncGCmqnOUYb613B/uUw77B6T/BWdCXW/aRhBpKkSPW67e+sDxvzXhn2w1ZrK88NwzJWnaN5NVedUHeQZv3eqEx/lew3k24Syw0fL1lrsuV44jgeh1bXt+vPbvR4Gn0UWe+sISQ+BF51S0dUXZLmR3ndJQBFBkdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712817; c=relaxed/simple;
	bh=pm3pX9Zbi4OUnxUYZCz0j+Ytv9nU6wsZWRLKvdi5nTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1uoaUr42eVIcnGoXB1SCAYkarSZ8etDpA8NVTTdCFRGV3wegXpEVJmytZAbgloyTdhp0aT1l8lBHd/BTB2xkMWWiUq6taAcUesa2SLLK4gJiumxufr3ZbpwpqbDIYBNY0wHKqQNidjeJK59K1NNTdmnRPrpDNNdn6SW54Fui4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeCMSONe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGbJ005844
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ropqi67On0nf3OF4hT3z4LS5hPC6lTHj3/728K9UXE=; b=LeCMSONe1bDiAFYy
	H/B1NMHNDJv8fbUsXcBgR1sdgdtdATpfZCDYGLs4dfrQzxn5ShjBc6XBq0bbjLzB
	o4u9IW0R3crakaxvnLa82jyyP1e+/EospYMWpTWfYlVPn2YpPEyzJPBrcoDj/nvB
	yhmjLQmkq9V4mB3sUzd1QUx5MOod7fwB3e671ty8s6aoZD2AQEtxbti3rwT6p+YF
	7+GEd7QZPHVQIhYvqF5hzO1L488PY92MWIDJptBTFtTxn74bKdjOBH+S0xb1G5cQ
	tmaWr0pjYZK4Rm3MuqWq3TiA0homfzQzQRk+fyyitnDU/CqzGC5YITZe8Bw0NXwS
	9d6wvA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7v2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so904736385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712814; x=1745317614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ropqi67On0nf3OF4hT3z4LS5hPC6lTHj3/728K9UXE=;
        b=B7/20pDhYatJr87UqGtMMzVdfSnPZghYHJqZpp/avhuIsIDajG9UvPwjPpVsnK+cOS
         AwlJex3DSS8B9uq+b6lXdS/6FHKEsVae1ekrJpUigwUz5PG9HiB51PoWi3C/0lOMo+5I
         JmZUbhNAEbNsmrKzvjK7ngl2TL9UzQ47+FB38rnCmYZ++ccrhOvzTXDlgbpf8jqU+B/s
         SXKc/j3JpcFSeYD7xxbPvYs4qi8NteD2TL3bY4EUoa7mLisrbaVjgdFa9370zy+vujaY
         sljibvI2E98MwmVtn9bcFp0KZ7XFOjogZ+tNx0JUbhsmSGgEzYRnMvj8k1KOZQWsR0xd
         TdRA==
X-Gm-Message-State: AOJu0YzokUQG+D3T53m3XUXVY8W1OP8W+jMdsXVRfpd9DdjsK1BofKMS
	q+sAucViYvInMfeHEONMHW2orqwkv+pVuImNgiGlQM+LVrqcOYlUqelM9qUL6KRIlL1dVoSuGXQ
	DFgAK6506TbYV6kR18rVTKS0hPRlSkNuEkG76KlICE9JZXnUVou4r8Tl9TFZ7POhkvpYNaUcyp+
	w9DA==
X-Gm-Gg: ASbGncuXvai2gXmhR2nuv9t5h95bqJ9DaB6e7URo/XnEVZEzhP3RQAd8wKdWW1s2o20
	5p7XqbCFd9BGAcDzTFeO/aOHgJdXeXTvTKUI8ndTIHF+BgpMpJ90yWEtqLUxISY7wgr+H8YupVm
	22bkuz6EiLtuoWlFY+9hgTDIFM5jc7GEzlf7zpW5Pa3ooMVoM9dYE8JJdG6xLyBZDJx00rittZH
	gDcl5zoNGuzkYtSV7mVJJuITSV61GpGnxQZdZYZAbkW0SzF5Plwtdvcr2myW/5Q54QD6dCZBTAq
	+Tkxka4n+gNSa0A8VFYipylVHB/imxI2RFuqV7k4/SmPI4l5YtseXEz0vhdHHa+y8bsu1VbM46D
	z6aQXdFrcLLTFwCf6vlg+r9si
X-Received: by 2002:a05:620a:198a:b0:7c5:e38a:66c2 with SMTP id af79cd13be357-7c7af20ca4cmr2338132185a.58.1744712814316;
        Tue, 15 Apr 2025 03:26:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0V4IhoenXutpT24WBuyetITySS6TWuLLAhFtpsVOUOayQSkY+YUtpiXf9kR7BuB/nHwyY3w==
X-Received: by 2002:a05:620a:198a:b0:7c5:e38a:66c2 with SMTP id af79cd13be357-7c7af20ca4cmr2338130385a.58.1744712814008;
        Tue, 15 Apr 2025 03:26:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:06 +0300
Subject: [PATCH 08/20] arm64: dts: qcom: sc8180x: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-8-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pm3pX9Zbi4OUnxUYZCz0j+Ytv9nU6wsZWRLKvdi5nTc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRceapdhxwmeBNYoHZ4TxE53kmfK9Juh16+D
 i+d8tVByTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XAAKCRCLPIo+Aiko
 1QlzCACq2dYLByDLYBvavB4FWhJMAHP4D71eo57rZl9Kty5lv5HPkAelBwQnFDVo2MMUckxVTMJ
 6qokaaxP6dszWI+SLiBoJ/UJrrCSi9aBP5f2D8KFN0Azt7POng+rmoYcjreEpgMH1e6pUjuXiFv
 swPIwjoUUprkLjMCfUOUsDtypCleHEixqJkInFWEjqKaRVPt3OWodsyipA2ibx5WX6acobn0SIj
 vaoMUMn1cBgdNQxqBe6sfA1OKfAWCx4WlS8JqkCBOdW7m5wste2Vp4yaz9kFJkKOWnp2dn7SeI1
 Qi4V2G8BxuqJ+sVqnVTAtlgU4CtE8DCI4GFr0i2eOJupNlFz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe346f cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gopO3nw5QtYC7OkQFFIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uYm0P8hNNU79l7o50OUNaRIR2RWgRxXh
X-Proofpoint-ORIG-GUID: uYm0P8hNNU79l7o50OUNaRIR2RWgRxXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=789
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 30b8a666561d7b56009db988fb70bbac402a934f..b84e47a461a014871ef11e08d18af70bec8e2d63 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2977,7 +2977,7 @@ &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 			mdss_mdp: mdp@ae01000 {
 				compatible = "qcom,sc8180x-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,

-- 
2.39.5


