Return-Path: <linux-arm-msm+bounces-114997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SxORD6ZaQmot5QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:44:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3926D9955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:44:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Wv893MEJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bbEaJCG2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114997-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114997-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB4FD300276F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6158236402D;
	Mon, 29 Jun 2026 11:29:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB503B8BD1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:29:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732556; cv=none; b=nCZoWn8tM0Mhwn7EYxn+jgwXDQbaWEfyzF4lysH77hhnzSUzZl0daSg0BJOGAh7MXr+Ufv6gY7x7gyZVWYnZjfp2GH5AIdMwGCnqm6BGwMUL0Qc21hQix117u27Xbzu2MhID602ujsTSlLLY5qoAM0NGfdOV2xb3OCoSBqXuQZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732556; c=relaxed/simple;
	bh=zST/BG6lwE90KABxMz7C3gimOZiCUsBv6Z+vt7mot+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TMZP5jXNPigOZDo+B3EeUZo4kEew2IzROVeQQUnZrrRGT9TyeEYTliT9Yzk/PZCPnhytUJmfJNDT4cPDh3ii6EgxPZaKoZaJTHwg6WrWDZ3AJYqyBEiMo1q2PtrwMpS4r3S3GX+7ElwBASa8vBPp52yt7oEEUHMsTdyj8Q9tIlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wv893MEJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbEaJCG2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATNqN2619286
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Upw75PcXyy68WlOAyDJOIC
	UGb7kPKOHDSv26rXko7pc=; b=Wv893MEJ5CDA7qQ4tkvxKbURrlTBR/JjmLoLZx
	b6/94l7eScZQHwTQPdlabs/I1v094SWM9byDUgwBpO8huWmEWLS1P9frHUYJQYN+
	s3wG/2q2wrJZbjjKKAPSRNqcKCWQiPkd3PlzrZgYnSk4KTnln6u9m+Zxx2HuNSXV
	rWHuJIBH9O9iLDCSSZu1zdDUh/R9zJHl/JYpj0hspVvmgYKHkxk5TPYVhLOtife/
	cCBuLinMEQBGU5FzMxg7gdTUBWpR8MmWYsUvddIKu1580nM1S24+1D9bcqclUB80
	5X1YR0DRi3HGjUfGUqWw/zg2z8MtI70Yy3BlVvEEDDZgAjdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkrb6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:29:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4aeea5c3so132573985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732553; x=1783337353; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Upw75PcXyy68WlOAyDJOICUGb7kPKOHDSv26rXko7pc=;
        b=bbEaJCG2XxHhtH1yDjGxfTwF518hPkWADP2WJishEJMMHUPIPd6A75FJUoWZXQYo29
         8E/jxRihB617sPUB82C3rRw3+HqANX3SrNJzo3AuSDnho73sJRU3tgQcUd2EGMs4wPwX
         nV3i2Lvlfod0FVG6qpVsozurUpqYnCGaYgA9SXfY8ZcY9nh2rYCuOBSL2b82Vlwfrr5E
         fJs1NgYFprWuPy/jxNUGLpCtOcQW8cvGu3pYANK/gVrxmC9AcsWEroebMxWM8bawTG50
         k0bWeDT4EYd6HMqySTy2fKIiZC/1azKfpr7uZBt78exAgfbNqPxvu3PmWc0hZU3GBgVD
         gumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732553; x=1783337353;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Upw75PcXyy68WlOAyDJOICUGb7kPKOHDSv26rXko7pc=;
        b=sg1XcpSbh8zfWP7wOHw7X1G0wzt1Q/Qyj3rffZzMaX7nyltIBs8RZJl2r2I7hCZNqT
         rnO2pWobvtWt3gyugdLXht74IL+7oCIABV5d/OxRSGKrEjUHDVX9L75FqpvFl9GeUpaK
         +KEBpPF0t0xMX07U+Ma44ettcYhb+KcSE9kYg2AbRD6oJkDMfAPKQWcYDAu/dRhoLZAY
         HTAP48MvWnj22aULsODt+BopuXQ643lxyjeLZiD6gfyyU7Ms80ZVeByJ72Uz/Lko5Mf/
         oaBqwBDEjwuphtEeb+LWrHbFN8uY6LuRl8mxuEH2NKqPvhCbRDLHnxUUVz6yr3aWMaTS
         +BRw==
X-Gm-Message-State: AOJu0YyPnyjMhj55elAgShZhF4QnVMu82hQXNZNIp15vmLFSxzqiDG8w
	6uxupG5nF89+9wUOEACeIryUL35RP/JZ91LCVYyW/+NaEzHNCaBoOYbLUdfESl7cggIdYBcCuiX
	NcsHfJAxI91g4wKA1KlbrBed4ODBNGbXMLxz4DJHgNTLXxEFpNQSZY6tnjZjLNeTnxIxG
X-Gm-Gg: AfdE7clNHP+pFCnKvfKIJ3YT0sNPor6WPsGLTUKnXCQYG8GdXAeBw9eSJea62wSQznP
	qeaXt7Zy19iR/oP4lBRsfBf7GcEJUpNtfK1fKbFopN8wdjys7xGCIWNKp/jF2/+xLgzMcaHpqcy
	+Iff4+uPnnqRsximUwyk2upADE1YFUvCtEA3u2019ik+IElKchycndOkd7T2oMsqpuHCSQq1pMo
	uTdTpU6+XH1mhIJZDDcx5qOrXWh0zhfqtXeKfAz5Hjo3IOOAlduAkh1N8htr8xBEYJB+FtLW2Gl
	sFJhQuCojJiY9b9zaEoqhzltXB7uxTYLhjiEd/zNY6QRpOssKhi/Q0vKnt+PdAKKHBviicQe54B
	0nSGMGU2xaiyXpaarrvlunM1jn3FPoMt+1CeeCpBm
X-Received: by 2002:a05:620a:2252:10b0:92b:6e09:b0d9 with SMTP id af79cd13be357-92b6e09c3a4mr895292085a.21.1782732552861;
        Mon, 29 Jun 2026 04:29:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2252:10b0:92b:6e09:b0d9 with SMTP id af79cd13be357-92b6e09c3a4mr895287385a.21.1782732552385;
        Mon, 29 Jun 2026 04:29:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v11 0/7] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Mon, 29 Jun 2026 13:28:46 +0200
Message-Id: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO9WQmoC/3XSwW7DIAwA0F+pOC+VbcDATv2PaQeSkDbSmrRJF
 3Wq+u9zI22NFHpBAsPDBt/UmIY2jep9c1NDmtqx7TuZIL5tVHWI3T4VbS0LioAsODDFueqPxRg
 9WXsq0jFWhTcMpG2sLJKSc6chNe11Rj9Uly5Fl64X9SmRQzte+uFnvm3COT67ASHjTlhAoSm6U
 DWYmP3uq+3i0G/7YT9zk/4nEMjlCC2Es45dGUhDLFeEeRKYrW4yQjSOmQG8q1JcEXZJZLOwQgD
 WOukYG+3XhfCTIAw5goUw3jUIngxj2vXjuD1/xy/ZetzK8Hh5ARgQ6RXgOeralBRrr9fAnIn7y
 4RBA+cgJ1AtEKCGYEr3AvILCDEHeYGsJ3Kl/C+gfwGFJZTNKAhUWR+0SY6bhl5ACAuJdLbj4NE
 vQQOVpH1EzlD3+/0XZnMXrDcDAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5779;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zST/BG6lwE90KABxMz7C3gimOZiCUsBv6Z+vt7mot+c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlb4z6i1V7LFPiYX7myMy+Zab60t8f6FaZvYc
 S6K4a2vmyyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJW+AAKCRAFnS7L/zaE
 w6+2EAC4p6MaWsl6CLBa20s5cg0XwuSA/09eEWosU//24wUcxOXeBCC0Ckj50xzZ9UafZh4uUAH
 A2t44kyEH7JNfCuK1zs7tyaD1NrguoATbzaRb+LlExpE2QYuX12VjND3MyeMwVjxO9kQe6tst1n
 cCgy7RqINwHDoSAZsEKE0d+exMWpdVOZtVYs8ODTE6PBhj+0ACoesyV5Ys/H1qJo2uFK8TyrdYm
 HOKUSOQcwDjEDmqGflmVMH1DTH1VFzvTKCDLr0iPeiHBbm2kLgYQOo49hAGSJx0PwqHetMHnijZ
 TUELl9CBuXQSDkB9IvnYn425GWyWUAswNoIxgLbVBeocdeMLyb1+xJqrdcqdBDeoYHeGA6JVN5A
 Amrcq8GVA24qnZgqv1DLVmbZRF3n6RBPDfu+hp3DzX8SOwzLOWmjBe6pWfJgeNjkGDE4CaMGwYy
 AojwsvrwrrXsKAdMKPOF9JnODe8W8M6W7xgFCRAHvGv/hd5sK6cIytAVtoQwhIXw7l5rOjgXhCX
 /hAUJFLF93knEoI34kI1JLAA4qjgqk7hCOGv8E/oWF++NzkbaTZe3Iqbd9id0g4KtGg6XtvOKC+
 P3BDLM8h7ex3dS0B+E8tEUC6HqqBaaVN3DgdGm2sBzMUMD+Cgdj/FSGamA/r0/SynBZ09PsL0xG
 MF2d9PgEUuZMQFA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a425709 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: 47roLvZmVTbxyJ3r_nNFG4cCvLtkV-HA
X-Proofpoint-ORIG-GUID: 47roLvZmVTbxyJ3r_nNFG4cCvLtkV-HA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX7pm1jRrukVzg
 p8QWeIldiOw7T+RUfBuKvGk8mAigeBhcZBFoBhV40+jL3fTc02tt2kXROt5BsY+kbcocg6nowIJ
 FpTNS04NYDJG5D5z4xEHLU9lMC57UyH/3I8DVUKb7bTEN7JJi9/Ds5FhG+aOF1HCArXdc/yDj/f
 92FIC2/DkrJt/S1x4xFvuyL88uO+Bvq3LwQihWzhW4m+UQeBbL0nejqQMLZrZ8MS6Zgw+iK11cf
 7ScpjhgO9CpSe6kLc5Kd1EAORhdcrK4hcV+QyMGch1UlLB4FrT94PdUtW+4aCdrT3AqgY9hMlmU
 FluYfpXFxVJfB1n1hq09WerFBpe8zP8pzam5Bg9r5f23AXlgrqpgvx2f/T/9ytRGgBI7TM+y2Az
 mHoCmflDWvoK/YTySDUw745O1MZ2axJYm+/BxRxRkbkTOIqPOKhQ0Zh2cAywa+MKgmIpsKmlmQE
 B8K0IQtPbYM8OjPXVxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX1P8iwcRqs7+f
 QrCx0z+P8mFnkft95VRTB2qdkNLJO/jJ3d13zSEMn+ReNhvAgj3JActr7imIyx5uKUG7uvmmNjk
 /jeGvGUcnDFve6V9aEJoee2ghFKeVwo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,kernel.org,linaro.org,oss.qualcomm.com,googlemail.com,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114997-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,armlinux.org.uk:email];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linu
 x.dev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:martin.blumenstingl@googlemail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E3926D9955

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (7):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
      net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
      net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 ++++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  51 +++++
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 230 ++++++++++++++++-----
 drivers/phy/qualcomm/Kconfig                       |  10 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 161 +++++++++++++++
 29 files changed, 573 insertions(+), 56 deletions(-)
---
base-commit: a8bd881f6c5eeb8fedf29d8dc0df9296de576f93
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


