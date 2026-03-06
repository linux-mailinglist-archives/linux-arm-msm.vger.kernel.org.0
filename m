Return-Path: <linux-arm-msm+bounces-95864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC4uLND4qmlxZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 16:54:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BB61A22452F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 16:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DBA883071034
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 15:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1757F3EDAD8;
	Fri,  6 Mar 2026 15:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcDqzWER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfffdVYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED743EFD09
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812053; cv=none; b=Km5ubv/gCYfODDh6f9dBYioZunkY+fInRZdd4AlW+zmdNkVlBzamecfphVmvUczwNdw/JQDuM7qT4hK5HgHVgNh9fkVsZyOLAbltoLYMtmlahwz4uUDm4jSXhIQQFilJkRndLAeyXQBlHG7mv9uoYl6mDTO/P9PzyamwKKWQ6tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812053; c=relaxed/simple;
	bh=MJO0KbZvnHEzc2bbeB0JHSyxyZrgjCnwMBp9LPnkU84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0JCKRXaHaENj9/daKMGWJTQnXHWaoM4oe8FNPVHgnx7a8HwEugZttxeoztNhA+DdH4M8jPJJRcgVom++JV0DXllqlI/iXv7oY0jO9cRKDluLO/Gv9h8js30lhN2994sZYfwRFzRyPt0KwnG0ODJCi0CgtuUCqofJveIUgj9HzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcDqzWER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfffdVYU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FSuni1369175
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 15:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=; b=hcDqzWERh1YwUlSX
	0mLHqLb0FBgNbAXJzPPEEEsVRDvMJRoeS3eKlpjKMjt0R9278gFh0jv84RrI+NwW
	SkGonXiI6BZTbT4a8NQffujPwc50phY+tos5pI1aDCv2bXiRpZ54+Q5MR8hNyl1P
	8bO4fo08icbC8OV4s1n0KdjTGfp3OhZrBCk89P66q9aehmev514RekhETO0QAgbg
	roqrTRRoJdDHbYO/zzXM3xFgftaHtm7kEE9DzQqQk3bdkKB0mNd2juPZzEoAQbuf
	bC+hErkC3/3+3fSP9nkMFwIIyrKpzKI9SZSbdXhc2X83/8dfNMSFZXULkUTAfX92
	47pzgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5t1c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 15:47:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70b6a5821so4451965085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812049; x=1773416849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=;
        b=CfffdVYUBqSFW6dzCvLFeAotHdRvlXzmNyy0r0+I+3wWMF7FsSOjZtDQfFlZNkLLSu
         cm8GeYEpIqAL/wb22zY+HSsPWkcrW6gJH/WfvZPkfJQAOdBQm5tBfXBG0Z6bAiyLYYdv
         JzC1HRbPNn4RlRtaLycWmkXplsJQfcRrQl+IcpTjf4hqA5ffG92lJY9TzXZMQ3i5lSx9
         mOwYRTFKMlpcKRcoWu33V4AkQXGiRD2LY/2TU2hhw8IkqKiTxEkCwGtiC4INhmJQ/CVi
         sws1ohVq3JLsspQHhoUyTazntB0+9OPOxCoG3q3LvWYxB1khODZ0eVCu9ph+8dWY1zdI
         67lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812049; x=1773416849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=;
        b=t0GKsszt5TwxvOeOutputV1FoTWt8Q8J9Ho+Ipxa35fsC2B5bPGkIJbVN34yLmlB/A
         5iUQzLg7+BxnzPXfyruAtnDaSyDnFhw3/wguy2hC2D6azzq0yuUvTuvvtIgBBhxMQySb
         wW8oERSXmT4J4yXZOki5UnYuPlFweCsKW/zoCQLkcsDtcWlrlxfFktAyAUi8gazXUoPB
         eqXLM/Op8AziU4SOv9DCWXU/4Q5DvDEFXoUXv8RUlZdJjfDNo11qnALGHS11vxqa14C3
         eOzH4YAxil1YO+r8bNn3OtS/WVCqZ+bxZAr3gLy50CNJn6fzODctQP8RkD+PwiE507QY
         A4Pg==
X-Gm-Message-State: AOJu0Yxqyfw6v6Wx8g0d7mZjOlbiI0Wlcpy9dmSRMrt1ZILhLzGVUhTo
	G2Fjl1EzdBJustfdyaLqyh2ABWVskPmTkEZlI6Sf2v0FgkuvZcXOb7qUgR4BFEVL0TmDS10AJxT
	ZrRvFZr27xEEyBpMme5W/acpkxZAAwjZvKEXkGGmL6jnBz+mODHsMlfopUDV0lQDpT1oa
X-Gm-Gg: ATEYQzw/2H7Sonku0L+fU1jT6JL4ODMDsBbWhRzpNbRh6eS5aEk5RR19EMreiiDhACp
	yv4DqU+GVgsOiI9BI5QeYEhD+PI6sttwvxAqdiSV86vdzk8rGco1aiSwMe/zqOlU/VjrOx53ZLw
	fLUaEQOc6qLCFbMej7pazWY0/nobvLYC/lIPFwr1Rx1dlrqVCURfwhCTj9bPfM60VEWioiOISWL
	P2OwecdyeAEs1Tvc6Oa3D/FEkWXV/elMdY/rLMPeSg4A/hFLgJSKZsTUgwaJ0JFXORmreYFUY/i
	boJ4uh08ikDM3e8p76QVXzTS5UF2SWg97jN9+a0/owL4oM5gK0ipC7ItOAjV/G4OQMQsJzdUJ6b
	+4VvTYTga7gIZsx8RopGRAXbHEWvzitb6ReAeZ+RfT3hUZyTS2C5G
X-Received: by 2002:a05:620a:4589:b0:8cb:4ad6:6aa0 with SMTP id af79cd13be357-8cd6d514b2dmr337838985a.68.1772812049298;
        Fri, 06 Mar 2026 07:47:29 -0800 (PST)
X-Received: by 2002:a05:620a:4589:b0:8cb:4ad6:6aa0 with SMTP id af79cd13be357-8cd6d514b2dmr337832385a.68.1772812048763;
        Fri, 06 Mar 2026 07:47:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:44 +0100
Subject: [PATCH net-next v7 6/7] net: stmmac: qcom-ethqos: define a
 callback for setting the serdes speed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-qcom-sa8255p-emac-v7-6-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
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
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bz6/Hr6N/rEPerZKq1+bTvk1x+ewErg9P0amGNZT72Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbwFVICzo2tr1z/2IvJF2RamjaFEbJ3iPkje
 6PT7sJJVXOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar28AAKCRAFnS7L/zaE
 w+txD/9F2WX4OEqjZx/mkaQtwCJT4URVHThB5tZh3U96w9/QhL0ahuE54CXTnRio9xqzuW3TOz/
 DB5lVS7sPFVkaZyTgnT4UcCQMbeD2iDkSF/03/ldFyWCMSbZW++hxfJTsuF+sl5S1eSfz3rdfjR
 7PLeDU599Hf7K05uypwdjdMknTkGJIxKcYFyIJBH612vq8bD369ugOwR4c7Jv5ZtFbyBohzNAlK
 3oVTiJL1X85OykK67R5QreXZ2PgAm1UFP7lO29HttbssnGmHeOCIo2oESCahiQf1juZaHaz56fr
 xVz7Nz2a2lDElolZZR94K3sPRtNhN/8fPbpaVqZbSkgncrxQkl1Jtkmx93k1kAsyVeYFIGTrvZU
 7hdo1O7lYOlziI1POq6TsG4Na7irnbcnQSS9E3nK/dwPAlPkJIj87UIkkINTZou48tczQHIlulM
 KkgMje1xw06xe3zzl81sRKeKTmYQcrRgf9CPA6vUS7yliVZ84k6xaOrCMoTljmo3uw5wQn9SxA4
 ZZSHoV84qrni0piZgFEPrnBfQyiGf89U+7Xue/83jlkVgiU2jBrfb+aKtrhXql2V1JdK6mtztb6
 Zx9NpawD0TXPpx1ym3Vsre2lCLAZ+oI+78jFhKtA8J45ESShZbFG0RCvrrJ/6I9dYYCszuMYNNm
 Tn7kOYWiciMO1PA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: kZZx58mYPFNFGEMkIGLygYOJodr47A3N
X-Proofpoint-GUID: kZZx58mYPFNFGEMkIGLygYOJodr47A3N
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aaf712 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=0aI5G4bYpHrJQa0XwroA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX0clcR21FJhp7
 ewmrhIjQRnggkEeSmf453m6Dv/ciNHXfnEFykViEvYu6MEubZNVo5FAML1jTtnGOdujbvS8SJxq
 cIadLX682SQ+PXfvSvZyAwyzxD9d5+DBPmVEizPiQ5oAIslT+HNLKQ/3Ffm5DvY4CklLpB4xzsn
 NnYwQhvYjBMmjsvi1GgDaPfFTBxa8AR67mbSlT1e58x6DUUiSw0IdfOOSu+ffuDZlwilcc1/S9c
 O/0B/c0F7SCiU3oghvlZov4dO4NAb4ikO4To12tq+t0U7vfqSMJTo7D/mXSVAaCTUbKHoFXCnZG
 eUtSnj1u5AZtNIwqze/Qq1hlwA4/5k4zgSe2yrR97IWLUZcvPOyTz5wAR8jcYb55Pq7SCdgqBQp
 COXpo/VdsCv5kwPk+MwROqx4E28ZzyE44A/YEYkH6p1AJ/dKu1AkiN5vADQxoJvWpsa8NQA+3yW
 /bFhKWXaIxhdfMfba6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-Rspamd-Queue-Id: BB61A22452F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,st.com,synopsys.com,sholland.org,altera.com,linaro.org,baylibre.com,googlemail.com,pengutronix.de,oss.nxp.com,nxp.com,bootlin.com,bp.renesas.com,sntech.de,outlook.com,esmil.dk,starfivetech.com,mail.toshiba,glider.be,eswincomputing.com,intel.com,rock-chips.com,samsung.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95864-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[76];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index b88de56d372c370aaf4929d05138f3744c54b1f1..038ca4da3cff4eaac1d1255573f32e0c87701e78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -119,6 +119,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -616,11 +617,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -843,6 +849,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.47.3


