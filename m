Return-Path: <linux-arm-msm+bounces-86566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7FDCDC155
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52C733009104
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16700326946;
	Wed, 24 Dec 2025 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX7RBAJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5WxmFde"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4103131A57A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574667; cv=none; b=jPx8ZqsD3RRWX2W0Iqzbn/Cg2zIRuHfCj7PsgQdOE09hMx7AYUGzx62pJgHbc60hDXNsE30js5LYnvN6BvhwmTbu+elBeNCRjOj08QclPwysvhYSDUkNKAwJ6bXwd9ypv7uVNrjKdUV754uRFwLwC7gKGGKdirC15IWrQoh7230=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574667; c=relaxed/simple;
	bh=5O6EH5DVR59pp+DlTUQCdF0vmA2VG+e9rZqfOU5g5AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJnpEQHk4lba/f1z8S9dpni1DpbshSbA/ihs9uJjLGXXuFGFfMUFXurpAbsxFDXIMwkparigDojRuGdlgNTShwJ0FMrvtSZB+V262FPTBginlDwvL6kIkU8W8SL6buh//N6QOJTMm6hxUESDM8Y9cLvGNa7YksYkiNPQ1YZy5tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX7RBAJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5WxmFde; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO6PNeu678225
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQM+beAzq0/PR9/1IAhbmxN4dIeCVyZh+8gDQ306rQ4=; b=RX7RBAJHdaUyDBv8
	LmCDZdchHPnHFS7/INNPHT9hIcVMO3mSVOcCnyOE2hHB6ftPhCa0tBpPmMG5tTSW
	VZm9kyZHFmujj5hnBLLjy03AthJUZEDj4axPcpq+9TXPJFO4h+ib6AlrjT2riPVu
	afDS/YoK+RbOffMqjkSeYjWL7zvhfKofD0gFlMHFr3vjg/e3of31+lyeCSJCWmNl
	OEzWBZrzFKSnl1ylnDD3Nvy+KtE8ayCA4gyEBBMRaFENG9DLkBOU/2f5qJQJkl9E
	9js6BqE3z36TH5ZctlwJnNhrOuPzyh7EqQRW0YsRUOTz5ZJwIYH0d7aCUWpoRxtw
	rVsIBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq2eey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edad69b4e8so123120611cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766574665; x=1767179465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQM+beAzq0/PR9/1IAhbmxN4dIeCVyZh+8gDQ306rQ4=;
        b=E5WxmFdex/9+24HbV3kN3OrPAtAKz6q56YzDYUwgiDmzAu9eDsNApzF44zrEOgqEEd
         8rSzz+/PDZLM9MWLrOP909wPP8vsio4ctr8kUB2utcoYGuWDGkyX5qcZxx6hZoTvnxrp
         oGztUnON0C6Y8Tp5QudyZt19d1JZCEhIcqXor5ylrEzS7UCYchkFjqiUQ2Iu8jz0I+JZ
         vZJ6sbiy9UwgtY/CxogVOQ0RiCAMeSqIPYOaNOPeG2l9+Ajcv9ncik0gFz0xBiW+LobG
         8KHjrJs4cUvJtUYoYQwJJI2oZGeUIrQaV39qRVKOWgP//uPwZg2rsDlvOh2vmNp64aRE
         0AXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766574665; x=1767179465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQM+beAzq0/PR9/1IAhbmxN4dIeCVyZh+8gDQ306rQ4=;
        b=r5q2szRwnYwImCqD+zrXcZ56oznpDiOZuJcwkj3Kf6PPH1VtrBzTFKTUAMH+kvsEeG
         atEKkh0PpkuTeDKksLYlhDwwdEbts5gEdNsb9baeqa3GQu51TbRYklSZXJ5GYswEPLK6
         1NZHnwU6rg3CWCYmD/7S1cyBw0P4wPeVssom0TlNDW2S+JENxuGj+VO/8BVHhM16MYCB
         bdD+WoIQR3sWUkr5zXvT7kDxebRpJ9AAO8COeqvKEjyJuEbydLUsvVNCocmx10OVEZuR
         8Se2FBDBUARD92Y2l+/6M3vljKKtTJNYznvMgIYnDweEVR9EgjlHQ6yBU4RdDkDBQZKX
         A2dw==
X-Forwarded-Encrypted: i=1; AJvYcCUa6cbl8bSDoqr8jSxp7kgWBw5bpeCHJvnVdm/bFaOBSxgRStNPpx+wxWGz+ztpqkfhTBPn1+dV7SNzH4Vf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyno4f+Pt45pnwaGCST4FDos9tk9r3rVSiW+vnPLy9zbG7DBxG3
	JeiSir+H64OvjsxOvQ3y2mS+saf+49s7N71WByIwuivkeucMDWscmZhd3uvkhKK7F92B1MOW4qb
	Fskf1iofS46/vx+6CD1QEPycxX2DhI7uhhXJ5MOFxTafi1BfryvuSLZjHTUc0KJXNykz6
X-Gm-Gg: AY/fxX5/ufK8nX3hG2S0uI5AH15JQDCNG5fiS6Xq5xZFB2D6nrN3BYvMEloMZ6RzjBA
	YFm4Qp/Fz9qqGNsjTgP5aO0K+yzKmKoT2KABKHG0F8STf6YBINfmBAppFR+l2KgMku7PvYxfSdO
	kosLwgzI+vCf08o8hJok8uyjc2gDCj8YgDBasl+eZhWzq3ju7zcDUqvvzawz2dN2z/EXOA8EN9+
	JGxeTvJ2SnayUIS24v2uxFxX++zsUe2MV+7biGIi+8lD8vShi0kukNvGbd6pkcUvZBk4zI0nMS4
	nhHED8mTtgDHiu8vO/nCnoTc/d/LCcdQ/n1nKi7oNDGC1vK6jq3NPElG1ZAlckM6m4zU/g5kNun
	c8KRGRjf3+0a271Q=
X-Received: by 2002:a05:622a:199d:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f35f3a046emr279974441cf.8.1766574664533;
        Wed, 24 Dec 2025 03:11:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY+QXEQr9fA75Iom8zAGPbK0MF2jM6Xeby2efJjGDdoAhvTFZCsfc602Uv4p1sHvP/+1qu0A==
X-Received: by 2002:a05:622a:199d:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f35f3a046emr279974131cf.8.1766574664041;
        Wed, 24 Dec 2025 03:11:04 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm16799036a12.31.2025.12.24.03.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:11:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:10:45 +0200
Subject: [PATCH RESEND v6 2/4] phy: qcom: edp: Fix the DP_PHY_AUX_CFG
 registers count
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-phy-qcom-edp-add-glymur-support-v6-2-4fcba75a6fa9@oss.qualcomm.com>
References: <20251224-phy-qcom-edp-add-glymur-support-v6-0-4fcba75a6fa9@oss.qualcomm.com>
In-Reply-To: <20251224-phy-qcom-edp-add-glymur-support-v6-0-4fcba75a6fa9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=z/5gvRTWmoFviOJ7wu81OY1UNYIgxJ8SEI5ecSWoHm0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8o9sB9QxfHFF84ivRguy+9vK2z1CO1NN5dcn
 sYXr3eVgh6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvKPQAKCRAbX0TJAJUV
 Vte3D/9dUcwB9f08kDZGhordYfzLvIdLl1NxIhe7onk0rEorigyoPK6p+Q4/UwXFtHkWeF3hb4d
 /gdac2+Tish3pPaJi93LP7BQHg2gKGPFWwgy0PXbFwNhoGduuzgt+NMSFFxpO22LHCyYbr2QHZ5
 dgOgLZZjXMoU/rF0ZfJbMfupysdtLcSqiyN8DrewNjKB4nJ5yIH/pf8bwlQ1BoP92C2Ro7Pmdmj
 qcMLuwY8heMw0hVYSb9WNeDIe0ctTIZfzlsofbeZ6YGpWx0ykkXRwoBDKFkTW43yqbWtCN8wHIr
 DmGSElbAb5wMx3+VowGyfXKHyo1fuhfw4NaZNiAZGiTc+nriZEwHYoP49uPBxaKWqBdRGPNJDo6
 vvFZtvcxaj/AtE9ByfOrgGjiaJaeT7qB+7EE0iSXBo3mkwbWnQCDG7ceHYYtNCsxkFt6ElyleA0
 CILRDQBHdN8tdgZOboyvgjoCyq+1ziw4N3qcWdzmcCDn2iG01pri7VGq+XF4xNko051g9JPnsGt
 WlUeZuBKZxSX8+aqauHtKDvz3wmhX86V7fK6ak9GvGx2EIblgckvUOkjlbmwCUGfQZwxnz9YJu2
 ZsICLRJW4emO07vDiR9JrfByKcveod67ldI8OKf8R/vDLIkRcHqFlGsxVTk1Ri8nk5yayVDcfFh
 asuhXZPSKBK21nA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: ITxtfjcDOASVYZxQ7BHWW-5XMXCMOMaE
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694bca49 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=EnfBGAjIh6IkBJmaZGcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ITxtfjcDOASVYZxQ7BHWW-5XMXCMOMaE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NyBTYWx0ZWRfXzDENA/3ba3aw
 +yYSrTtYz+E0d9k6ueTF8YOxARvQ54h0wqYPWjOulrkHwxhIr/0IDKEF/if/n/czluCnYXEql7F
 hvtETUC+7Mr/06hlKPCBdnSsZMcW3wQvwwA63bSgP+7EsBkmxekSyew04/9n38QlKRiqvdZXFva
 un351CXWc3VIPoZ9vD1wsnyV/K/37umL1xXSkZJ52ZUhwbaEnvTbJU1gJGkG0w5AIdRJWUNd+0d
 yQQd9H1HavUa/SHOwLu6z7z3q3c2Y9flDCwflGKxBkreiGPQMn2hsdT77tyLPbfiCzLdZExptIM
 kr+rmIPjyuU87z6zwzQ40XSi8yCVYI6V66WfW2kHpPedC1/YHntOhh56/YtPd2yzqqoqXpwzkny
 NOyZ6yMqw15INeYz8+DrSi32dGKSDKM63EJ4Ot5vIrNm9/N1DiR6hXLNG/sqqW9rx23dcdR/vF4
 RcoLKguBMtXypHXoICA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240097

From: Abel Vesa <abel.vesa@linaro.org>

On all platforms supported by this driver, there are 13 DP_PHY_AUX_CFGx
registers. This hasn't been an issue so far on currently supported
platforms, because the init sequence never spanned beyond DP_PHY_AUX_CFG9.

However, on the new upcoming Glymur platform, these are updated along
with the rest of the init sequence.

So update the size of the array holding the config to 13.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 06a08c9ea0f7..f98fe83de42e 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -32,7 +32,7 @@
 #define DP_PHY_PD_CTL                           0x001c
 #define DP_PHY_MODE                             0x0020
 
-#define DP_AUX_CFG_SIZE                         10
+#define DP_AUX_CFG_SIZE                         13
 #define DP_PHY_AUX_CFG(n)                       (0x24 + (0x04 * (n)))
 
 #define DP_PHY_AUX_INTERRUPT_MASK		0x0058

-- 
2.48.1


