Return-Path: <linux-arm-msm+bounces-85859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE7BCCFA82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1629830443EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A015D320A09;
	Fri, 19 Dec 2025 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AORecW+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPpkScyH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22068322B94
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144589; cv=none; b=sG1SBKpU92xHZfQo+oh5BKxxOQaIwWn8Abp+rJ9hVGpIXcIWzeJTx/d0UJHdDnxEmU5iw3yd8iVaaTOfxVRipNapTUyu/3qLrL4H10noespY8GBLo8ZZoxbTaXylcqHtotOMP9B7nEYF6kSkdhh6TtT1f1X040bWKCiX23VBJ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144589; c=relaxed/simple;
	bh=ffY/C3rLjQNK9hgvPbJK8l/sc4WQvdzTdnFHwivIiAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A76ib4on4eAdluYzVrHuSRysN9CdOduoJGPyfrO7yUS+mwnWYBxChLHlPvqGT27g91h1SuTTIqV7WC/o0rBGcQSbsLvl2QcanwhWZ8G+Tl5OxTAs1o+gTEXq3Vd1IyRDBv8RRUiIKJlphz5Obj6nRuMpU+mpy0Z6C18w0+8LVe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AORecW+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPpkScyH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c8hW3319029
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bX0ELyjisY599ILAxQteYNae5xTg+flefV8EL6QhF6c=; b=AORecW+zGPdToLq+
	HqdASpHg3KknK0QK2jUu7seuqC35HeVs21ktVpMPf8NWX+1fUP1xeC8hTDlzl4qy
	1ywHpG3XB3t/rqOkC4XtgXV8kacDz2frSXnlOy5ai8hg9UEBftXNozjfgwfGnTm8
	5sQn5nPVk478sfMp9SJWKWC1lWJjPm6EOJo7+jZkIq5+yUSFt8RqUejJ06xBDEki
	wezwZCzwaRPOJW+g8ETfsr58l/XpEnSbva6fMWFqBgz4SCku1n+9LUEaZqjSIgj9
	teyaiHwVjd0SfErKCVwOWFa2MLntwUsxWWegI+osVfaB7q5hpEzjafEB0YGXAGFi
	qr56kA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2etf9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:43:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso50147131cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144584; x=1766749384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bX0ELyjisY599ILAxQteYNae5xTg+flefV8EL6QhF6c=;
        b=QPpkScyH+htfUXwACMI9t2j2R8wWJyMzgBLLRYg0JA+vQagz44SVGDf7zI2QCp9JUm
         dRh5+jGGf3XJGXMMWTA8tvHdKy8MrADVDifTmGQtTGXfBPEZx9KdCADWJdjIISUqbp5t
         SYEQy1cvA/1bM5/jMLKcHAUIg8ycsFCsqz25RuSydUpOtoWXK3sqLO/oyvnmKNPRatEY
         miO9+Isy3qGmb2+GI04t9iQzhGLhI38vW1X1LySZ/mEirRds4Zdb23WxJxlkfy6KvGL9
         3NfQhg7K0zSQXfFUrI+BvJhh6aRphkwPy0yXGBefsqKX67f62uMprh+sv95cN9VvlDTY
         fmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144584; x=1766749384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bX0ELyjisY599ILAxQteYNae5xTg+flefV8EL6QhF6c=;
        b=djaKnLcihPwsHJlwKE8Z0PhhOm3CQHVKYpKtZd4/Z07ZzOCYDIvxpWjK+ldIuByy/G
         nrxlbZt3+AZeJLXcwKA6s8MdHZlMiQawB/zXhloJNHK0iqWXH2iQ+48NefdY6HE2tOTl
         0r9Gi5GeMngwiko/b/VivY12wVVPV1nAkpZB0bkANraS+H1HwHG1m8/N0tKGpARJzr69
         mLj44iDpRZ408DVUhNGJ6mvgPlhOR3OY2OafJhD9KKhL4pNp/WcNB1HYe13NtCaEH/Ka
         kIlrlrATkqvur748sF6v8rgAaGJFL17vgtLiu/1DOtRqSiI5fSb8Ptx7MoTkI0Uta0NH
         vBKQ==
X-Gm-Message-State: AOJu0YyhpM4koUdTBAzd71nhJWDf8VdcfATm4Eiy0DgVkkXSJzZXjn8g
	TlbuG2uu69EGIMd9ZwhtxCMY2U2tkGGRM0v8DpqEZQZfe8NNJU5Zp+jrRmS4GJEoQH5DhtHdrgW
	mXltGXnvNpeDJtgpu+j8pDJa0ExIAn69kOHfLvsocJqvoEPjmrTcEjldAjJqYdVYM6Y8q
X-Gm-Gg: AY/fxX6OE/xAqwzKNX7kVxy+Rc8mHKWhcFgLvw+PLF8Skqo5SDTrVRMDgPONXeenKPG
	XntXkSeO/1J9yHFVMgA6fvWIe7bHVqGqyGYhNur/36fJ3+hxwJdvKCFAqXKrl0AQw3Fi00GmTZ0
	fa0aYGycdOCTfnNkTKg7lbNF0sIlv7ZpUePWxILL/CRMXa9B+6kvhOWbrDYRhEdmjRQ47oiEd1Y
	74H6plx9ij5xiPk9ks8xxIQjnTPfY9Dj5VaPV4nZCz1NieY8amWPwE/0XZWQBv/a5rTzJ9RAKZQ
	rRQu2Jbw+BcgIqCaGmfdt1rUgdfBZg2hXvhF76oMKffhc2JQDMidE8qQR8q99ZAvBaRFRSqCTHG
	9IDZRZ3UQ86dWGmDvld0qlmOEeE1WkVd8xJd/3LM=
X-Received: by 2002:a05:622a:178b:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f4abd9da0cmr29498951cf.59.1766144583868;
        Fri, 19 Dec 2025 03:43:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCUeryxEuhslnEMUgRLQ538+mugwQpyqKxhABdKsq18zRMJQYzzEDch02GfgdLzQT6oGGhLg==
X-Received: by 2002:a05:622a:178b:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f4abd9da0cmr29498401cf.59.1766144583291;
        Fri, 19 Dec 2025 03:43:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:43:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:22 +0100
Subject: [PATCH v6 7/7] net: stmmac: qcom-ethqos: add support for sa8255p
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-sa8255p-emac-v6-7-487f1082461e@oss.qualcomm.com>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11109;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ERxrAI7TvvbsXfivQVyIhZA9WF7tFtyd4OT7NKWaK70=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTowVuabPf3tOQ9zohZII/RkRRVd2Gj8jjepZ
 Va1GL7gD1uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6MAAKCRAFnS7L/zaE
 w3+WEACG/S8OdNzvmPmN1BeVLBcoxBvRMN0v8Ucc2P7BkTW39Kcw6jgcTXXh0iRZKaZ1AkXKZLE
 KFgf99nqm2wejxaYbn9Lf2AX6uZl1x0wGAxYY//mywVECqGRyBBr+i07ApEk/SPBsKQDRBp8rg5
 08UfegvhdYq0ojcBB40b8nyE/epaX2yuodZbmbx7ZNjusFWJseSqXiKhizjD1JAVcEC+zKFQuII
 J+LDLAdfqwgTZhhzbjJH87hmqPo9Drb/s3KCr6O3prvKbHmVV/EOcLwTz9fbJPMqwLjz7czdIax
 xK0fLMOqCLCnRbtcWW2ehMR/Iy3w+aAqHaXvDIr5nDac/F+vktt2xDFS5DxEn64/ZSnCe6Wjk+A
 q7SFlaHf9OghjyUikRycrMjNhgPGweUWWJ7RqK5H9p81H76zPQNq8BdEV4kwzEqQFOFgtzFkgQR
 s4wzRZtQBxgVBTn6c7w39gjm2IdKaKbzlo6g5qFeTDmdIvg1m/8o8upbsS8EdPcNfirOXf0CDkU
 Gt//crhoCD1Up2CBhD6sEOzxnRUDO4nDLLo+LcEVKaNp0QO/ZtUr8m0s5Z+23KeWMn83+fcFs5q
 1m/Gx4RbA1MG1/8ROYxwIq0AwOXQ+I32v7fCwkM1bwCzFkYRjKHisNbvgD5aHIBRrUOUw1DYfAG
 k/02tyI78oTROww==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 40tZk7WcObft1VkEfLjMr1qMyVMNnhao
X-Proofpoint-ORIG-GUID: 40tZk7WcObft1VkEfLjMr1qMyVMNnhao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX1hTz0PwDM0vZ
 iZjM3s2ORHDye22nUNqUj1qnh+1HPJPE3lGP9G0Uxo+o7oa7ygv9kzppdK7jx2BrGPJF9ZWlnkE
 wRyNQ0uUpvyJRDq0dYI20F8LZosHsDhKgo3SD4kRqzShm/k2xKpwOhXNS1zUMZKltRHYNg5PkNp
 e/0g0xYbUaISJEQP4jwXS7kWPMnnDwV2GtdOy3nlnHprTZ9sBOUIEHm+CKpPIpXd+9KvP9VBvj7
 YgFxvbGQZdRjZCyzl5KLUHav/JJqtFT2SPakeWHdpE8BUXGmPvO5pqbfQAJs7YcYXnJ2BO7ZvaJ
 eeBUZXH4P49Tsc0pGLsYkFUdGPFS/gurjPXNTd9VTczKKlxHryREyHmkZ+pqGvd8+7pYrxdw+tt
 hn9Drjv8R2bzaOChjaKgTTzeVn/mtjxpkcXhqM+r3lQP+h9txVDJSAgyDF1jJx0jcFRlHekPpbW
 HHbeY+jrLo00codPslQ==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=69453a48 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gYhETRYomtM5McKHAMIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190096

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the driver to support a new model - sa8255p. Unlike the
previously supported variants, this one's power management is done in
the firmware using SCMI. This is modeled in linux using power domains so
add support for them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 234 ++++++++++++++++++---
 1 file changed, 209 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8ba57bba3f2e..54f8ef3cfd7d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,8 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_domain.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -81,6 +83,13 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+enum ethqos_pd_selector {
+	ETHQOS_PD_CORE = 0,
+	ETHQOS_PD_MDIO,
+	ETHQOS_PD_SERDES,
+	ETHQOS_NUM_PDS,
+};
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -98,6 +107,9 @@ struct ethqos_emac_driver_data {
 
 struct ethqos_emac_pm_data {
 	const char *link_clk_name;
+	bool use_domains;
+	struct dev_pm_domain_attach_data pd;
+	unsigned int clk_ptp_rate;
 };
 
 struct ethqos_emac_match_data {
@@ -111,13 +123,20 @@ struct ethqos_emac_pm_ctx {
 	struct phy *serdes_phy;
 };
 
+struct ethqos_emac_pd_ctx {
+	struct dev_pm_domain_list *pd_list;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	struct ethqos_emac_pm_ctx pm;
+	union {
+		struct ethqos_emac_pm_ctx pm;
+		struct ethqos_emac_pd_ctx pd;
+	};
 	phy_interface_t phy_mode;
 	int serdes_speed;
 	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
@@ -341,6 +360,25 @@ static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.pm_data = &emac_sa8775p_pm_data,
 };
 
+static const char * const emac_sa8255p_pd_names[] = {
+	"core", "mdio", "serdes"
+};
+
+static const struct ethqos_emac_pm_data emac_sa8255p_pm_data = {
+	.pd = {
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+		.pd_names = emac_sa8255p_pd_names,
+		.num_pd_names = ETHQOS_NUM_PDS,
+	},
+	.use_domains = true,
+	.clk_ptp_rate = 230400000,
+};
+
+static const struct ethqos_emac_match_data emac_sa8255p_data = {
+	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8255p_pm_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -407,6 +445,28 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+static int qcom_ethqos_domain_on(struct qcom_ethqos *ethqos,
+				 enum ethqos_pd_selector sel)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[sel];
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		dev_err(&ethqos->pdev->dev,
+			"Failed to enable the power domain for %s\n",
+			dev_name(dev));
+	return ret;
+}
+
+static void qcom_ethqos_domain_off(struct qcom_ethqos *ethqos,
+				   enum ethqos_pd_selector sel)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[sel];
+
+	pm_runtime_put_sync(dev);
+}
+
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -623,6 +683,13 @@ static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
 	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
+static int ethqos_set_serdes_speed_pd(struct qcom_ethqos *ethqos)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+
+	return dev_pm_opp_set_level(dev, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
@@ -712,6 +779,28 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 	phy_exit(ethqos->pm.serdes_phy);
 }
 
+static int qcom_ethqos_pd_serdes_powerup(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+	int ret;
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+	if (ret < 0)
+		return ret;
+
+	return dev_pm_opp_set_level(dev, ethqos->serdes_speed);
+}
+
+static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+
+	dev_pm_opp_set_level(dev, 0);
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -742,6 +831,68 @@ static void ethqos_clks_disable(void *data)
 	ethqos_clks_config(data, false);
 }
 
+static void ethqos_disable_serdes(void *data)
+{
+	struct qcom_ethqos *ethqos = data;
+
+	qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+}
+
+static int ethqos_pd_clks_config(void *priv, bool enabled)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret = 0;
+
+	if (enabled) {
+		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
+		if (ret < 0) {
+			dev_err(&ethqos->pdev->dev,
+				"Failed to enable the MDIO power domain\n");
+			return ret;
+		}
+
+		ethqos_set_func_clk_en(ethqos);
+	} else {
+		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
+	}
+
+	return ret;
+}
+
+static int qcom_ethqos_pd_init(struct device *dev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret;
+
+	/*
+	 * Enable functional clock to prevent DMA reset after timeout due
+	 * to no PHY clock being enabled after the hardware block has been
+	 * power cycled. The actual configuration will be adjusted once
+	 * ethqos_fix_mac_speed() is called.
+	 */
+	ethqos_set_func_clk_en(ethqos);
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_CORE);
+	if (ret)
+		return ret;
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
+	if (ret) {
+		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void qcom_ethqos_pd_exit(struct device *dev, void *data)
+{
+	struct qcom_ethqos *ethqos = data;
+
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
+}
+
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
@@ -782,8 +933,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
@@ -825,28 +974,67 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+	ethqos->serdes_speed = SPEED_1000;
 
-	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->pm.link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
-				     "Failed to get link_clk\n");
+	if (pm_data && pm_data->use_domains) {
+		ethqos->set_serdes_speed = ethqos_set_serdes_speed_pd;
 
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+		ret = devm_pm_domain_attach_list(dev, &pm_data->pd,
+						 &ethqos->pd.pd_list);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Failed to attach power domains\n");
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
-	if (ret)
-		return ret;
+		plat_dat->clks_config = ethqos_pd_clks_config;
+		plat_dat->serdes_powerup = qcom_ethqos_pd_serdes_powerup;
+		plat_dat->serdes_powerdown = qcom_ethqos_pd_serdes_powerdown;
+		plat_dat->exit = qcom_ethqos_pd_exit;
+		plat_dat->init = qcom_ethqos_pd_init;
+		plat_dat->clk_ptp_rate = pm_data->clk_ptp_rate;
 
-	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->pm.serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
-				     "Failed to get serdes phy\n");
+		ret = qcom_ethqos_pd_init(dev, ethqos);
+		if (ret)
+			return ret;
+
+		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to enable the serdes power domain\n");
+
+		ret = devm_add_action_or_reset(dev, ethqos_disable_serdes, ethqos);
+		if (ret)
+			return ret;
+	} else {
+		ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
+
+		ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+		if (IS_ERR(ethqos->pm.link_clk))
+			return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
+					     "Failed to get link_clk\n");
+
+		ret = ethqos_clks_config(ethqos, true);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+		if (ret)
+			return ret;
+
+		ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+		if (IS_ERR(ethqos->pm.serdes_phy))
+			return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
+					     "Failed to get serdes phy\n");
+
+		ethqos_update_link_clk(ethqos, SPEED_1000);
+
+		plat_dat->clks_config = ethqos_clks_config;
+		plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
+
+		if (ethqos->pm.serdes_phy) {
+			plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
+			plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
+		}
+	}
 
-	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
-	ethqos->serdes_speed = SPEED_1000;
-	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
@@ -864,11 +1052,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->pm.serdes_phy) {
-		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
-		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
-	}
-
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
 	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
@@ -878,6 +1061,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_sa8255p_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},

-- 
2.47.3


