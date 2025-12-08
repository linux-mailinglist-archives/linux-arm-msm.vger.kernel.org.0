Return-Path: <linux-arm-msm+bounces-84610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A35CABCC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 03:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F6F73018F63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 02:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C9826738D;
	Mon,  8 Dec 2025 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxHAfUS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkHOMsFD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2C82B9B9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 02:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159638; cv=none; b=d4EAMlMRC2A6olvxnlX3gP42nuvwRnNKm1qRrGxjCby2F42f/oq7YTX2ogWKBwYVoKX4hZ4ZCW8Ody+wwuwm2klwLLn+mEnDO+K9FTJYPhtA7wuzR2G773xZf5OKubEpGj89EJXhK3XHzVm/knc8ArtcJ9n/HptHkFKBfdjvOJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159638; c=relaxed/simple;
	bh=3XMbSouumyMb0sB3Penj33n4UCbD69O7N+0naNphoNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XhENMuiPFPqVlLsxvoxnyfh2eHh9Hy4io1MTsjVRgoXnvqnHLX0x8MZ74hdNuXqj3OE+mDdqX12cnEhijPmEJA10v/M5x5KRPLByFtBmWDf/roMwvmDdYMGG7h9JxUc5/zeWPV+TYZ4Sf/GGmzwYK56pjcHt8Wi+ki4C73Ru+jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxHAfUS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkHOMsFD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B80A4JB3626129
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 02:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HbKBSlf4MWwTbUUCWmkGSkEEOES4f5rj57S
	mKWxqLo0=; b=kxHAfUS1f5+yqKsT54RBg8/O3epXm7t0w1TPU6dRJQOTh/XHtys
	lFuf+F3jkwJVBjLc7HIVUjDBOh4bH4/X7WDYDIGonk/WvGs4hZ86UO3fRJyNhy6r
	WD+dBCSkWvAacmV6eFjAdaUBQ8q9hAWNUmqEyVKmvhDtn8VETyur3cjwklA2BDyo
	8U++h/7a653NqmKex2iFfImw1cIrCWUBpireO37NnGOFtW3JcCU9o+SU5BkZi4sh
	qZapY8SJf1ALUrbn3hm7VwTAHYDTTnCWO1zxdx43nYUD7uFbihsEHLYCmTPVpf/o
	RL2ovgZHCGq5WU8EahLb8xHaL4UuJDYde+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjvb94r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 02:07:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2956cdcdc17so41894005ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 18:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159630; x=1765764430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HbKBSlf4MWwTbUUCWmkGSkEEOES4f5rj57SmKWxqLo0=;
        b=OkHOMsFDsK3jDbLcFftx7TN9+aHU3ysQV2dA1mJdJd1mrMBKU9VNtFRtNSBYot/Hbr
         sIjWFLfi/g3+LN8J4Gv/C0LerBCYkUNUncfRc7FtX2uEuY2IfQCtgyaEXIkJ5J9K3Scr
         wiHkClI8P6CD1hVL+s/O/mIgXIRJucBbyiDIDhXQwJN4du145+FV1/ezkvN5rfKc3/Y5
         47jdwaBUySIPaDhECPOvGTXweG5vz8FoapgX4ln2cQ3/URJvnHUiDsaVIRrXPIpP6ZD1
         67fNttpyio8hV49J1h9+Ns+XRc9XAO9XrsaZmlhSwT6L8GI01Abo8hzx3FGodEeB7hIW
         A1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159630; x=1765764430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbKBSlf4MWwTbUUCWmkGSkEEOES4f5rj57SmKWxqLo0=;
        b=YrSPfsxR3o1riyh21SVnzzVi9Qu9KL7oPFTQWPnXCabPG9Q5SGDdLO7k0w355sXad0
         39hdUoWObNMH8WUBdu/8NFmQILMhzT9AQROyHjNwvaQHdieEbnostBkw9tJdFsKUojC5
         mU9JpK7Z5vuEcv9FJSNCi1jWBK3HcK6waC1moSyVLaLKkYHKaiDnOrk0sw+1hVJZFCY8
         LohACX7jyOVwDJZihGWfpy0LykPZ1tXPBpcBW2M+G4QHgF31utNGC8Ujqcaf9RAgeolq
         DQtrAQgbIJYFiqH3+cdKrMaSlVmGSoohEN5rEcuQSeUnWSsImaVXkVeK5JUCIh3MM7Vv
         vsmg==
X-Forwarded-Encrypted: i=1; AJvYcCWHzmNB3W3TOxQ48jbsjKGov7pHVun5N5ntzQXsMP/QmnShuJwxcDIrufr7MzB6/FlSI1Wff0wFGT5If8ve@vger.kernel.org
X-Gm-Message-State: AOJu0Yzun/VHm5UEy8qdD/jp619bvbora93YXUXPT+x6lW0A2aNgqGmL
	Ktpi/+GrvR3V9vXs6EDjznqy8spFVzc46iy5WhVV6FrCtzg7X0MftKng71MHbt5bmup0l2lBCTo
	V39YNu4xvSIFpexrviAC2VKOb5No3v673/7w0csXdt68pcbIdzQJqYDlIJs6cCjJ6dwcO
X-Gm-Gg: ASbGncuTZIfiCRoOw9Qp1h4yIzYbzFb3/F20zXWM0eWRCIK8YP2WhZT+1WyJYHY2ugu
	g4qskSaDeRWHxJvBCQBbK2SUYsHcz0FVAyFL8+w+2DMxhv7xyf3v78f+BvDnZ4/cwjrg2NkjS10
	f/25WBS4iKYcP8OiW++koVR1dKmo9p+llkITXsxfMNMX7GLf5mr0Lap8C0eCnSTbU6KUFdLzLx0
	xxy9LoWbNtZ6N3PpudajyX+wbqEgUVYNIZ1FTaxVZN0+MVkBtW/rd+T5wlei71Q7gHNO47LslZA
	nWIAUUsaGSxEivrKm0U/9914z25fV6vwuYSbzpvch1F2K7Vq99zazf30C1+eD79ckZbSAsO6aEp
	zqHD9f9Wx0XOLo6OoQPoTbU3rpsmmHndXhW2MW6kHFBq2oPtC3eLdV/QI
X-Received: by 2002:a17:902:dac4:b0:295:94e1:91da with SMTP id d9443c01a7336-29df5ca8fc0mr51881895ad.33.1765159629832;
        Sun, 07 Dec 2025 18:07:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx6b8dm9fRYupp7hQJI5bc+l6tDgEtO9HPfMGHHiGLSNeas8LKpHhKGMOHvqYuqrVJSQ7pCw==
X-Received: by 2002:a17:902:dac4:b0:295:94e1:91da with SMTP id d9443c01a7336-29df5ca8fc0mr51881715ad.33.1765159629346;
        Sun, 07 Dec 2025 18:07:09 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm106201175ad.46.2025.12.07.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:07:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: videocc-sm8750: Constify qcom_cc_desc
Date: Mon,  8 Dec 2025 03:06:22 +0100
Message-ID: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=3XMbSouumyMb0sB3Penj33n4UCbD69O7N+0naNphoNs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjKdTQVVK4VKvEuahoPVFeiirgYjw4S9h1pyX
 8Ns8YmcKXSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYynQAKCRDBN2bmhouD
 1+QGEACXPtKBTbKddoiVBMTVrowSZQuKO3JvXcmfkhzdk/ggTqJQrVb77+nlnKomeRLBTCzmZeX
 q9xghBEBIsnQT/cOGB+A+Sg8kLOirYchZ56KJ46S5I7ZIdXC9CtN//M7j8HJj4Eyao9AKszswBJ
 OTOJzGAeji7Eh60Zl4MsoZXeB39eFxKBCtyXFd/3rS0ZHVEcW/LJPkHqZ9ayM8VCm4s0jzzcdPO
 5VWN3iKlrxpbzAGZT12TKXHt5GbwPu/twB3Zj3z0gsMpOpjNCm0mIABIFIbSDJs8u0Tb5VhO+Rp
 sgPNZP/GnySsYXfDvVRakt6msmXmAZa90ItmiTEMNgfuOm7FTQnCXLcf40crnQnO1bvSQ73mSYu
 wk8bbeACkDZ3EcEFkxA3UUT9g2/8qsehxNbq+GEaQqrATwCIS31eciXrtS0QfTKKUmSISGj7kH/
 T6p2ambt2rhIDZHaDJQgL6KZQx30lHulGd43UNbBo5Sdjr5WMHgvJ25HcXt4MP4W8FbDf5FsD03
 ZYWH8Xc797+rtRlezhrAQG9Ix1o4qOf4pZWekeyLLA65wekgD3fHra3k7MdxWqeMwYniJJfaOow
 p3O1jUxDZXaXcimgy0xZ7EyUNEdaO6ID3v2nnLsX3i7SLAi8MhpfT9O/Lu5HRQGiweAXfpD6hFB LezfhDxBoSVeDUg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=693632ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bwAipWyxTdKfI1pBRG0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX2JesNPEMVkxG
 DoJBNVOEsX710UDCGSt8SCzdR0newpC7R8aszpMuaqD8QX0gSh6e4kr5K1pMHeTuBqEpI48NamQ
 hMauCUznjf6bOyFOWq25F2598TI8FZQT+DPqf09q157gHkyhq6iBiT6a5zdpnO8GrcwE98DZFMu
 oP0OfNsfwapWl4bsaQ1KbSHRCBpuoMqw3UwCFBlbbwS7OS/24VhD2yXujybE342EIDkiZu3a9qp
 NFufWXVRHdMR629t17HnlBCJSQV1E/WPd9BlCMCFgiqrDY5IrG1goCW/WW2hpUUg9s8Tb38kTOY
 ptCFryu/P66uRZWbZD+u47KfbrbaPwUtzFvpGdevlKH4u4RVspy0juwA7TzJJfQZ4Q71PUZBagQ
 +lxh3y82lmRjVKupWPtbfTPMN4gZyg==
X-Proofpoint-ORIG-GUID: VQEiz8g1ATyBZbUBKqqKux_TxIxRJz7s
X-Proofpoint-GUID: VQEiz8g1ATyBZbUBKqqKux_TxIxRJz7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080016

Static 'struct qcom_cc_desc' is not modified by drivers and can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

My standard commit, one more time. I wonder when I will run out of the
same commits doing the same...
---
 drivers/clk/qcom/videocc-sm8750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index 0acf3104d702..823aca2bdd34 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -416,7 +416,7 @@ static struct qcom_cc_driver_data video_cc_sm8750_driver_data = {
 	.clk_regs_configure = clk_sm8750_regs_configure,
 };
 
-static struct qcom_cc_desc video_cc_sm8750_desc = {
+static const struct qcom_cc_desc video_cc_sm8750_desc = {
 	.config = &video_cc_sm8750_regmap_config,
 	.clks = video_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8750_clocks),
-- 
2.51.0


