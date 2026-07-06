Return-Path: <linux-arm-msm+bounces-116848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i34yL5O2S2ozZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:07:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B39711BAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:07:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Bx6/5iA8";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jQR+LPbb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116848-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116848-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6559B309ECDA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8E042CB14;
	Mon,  6 Jul 2026 13:20:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323EE416120
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:20:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344055; cv=none; b=hZEpflmCUw6wbAV2DE6m0y0beLFrqzNxlZ19xxWqx0g2YK6z8Tsqjp/f6Yx+7XOw95OzSXJ5ZMjh1SdLbjJXzI7UDWFo/kNwn3meuYacvheghRFmlvhJB6YOyiF0bSGgyt55bCthO4l9f/vlEyMHjpbOJ0o/66yiANBcW95PMRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344055; c=relaxed/simple;
	bh=px3gFNalJW0myw4JO8FxOi8xC4WUF57/BsmFQdIQdYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NRrGKoF6n1q+xd9szVl7Wj7dRxlFpGgqXwx6MxclnKknN+CTJ2ngIXnr6jD/hmvVitH/R1ZX618hlAHRH3JxcPOfnFv2oui6W09l2FrIQiq1vz5LyQBtX2WAvkO0r8FAw7cTzYyhXHja8eumTDlH5h8qvB/wlJnHA9ed2XdN7MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bx6/5iA8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQR+LPbb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxPhh317026
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgfh2/38B3WhwVMaRw3DoRNAiK5OOTw4W1PNnpwazmU=; b=Bx6/5iA8yJdpooEK
	R2A+v9gulHZ0/xkiPZwpFWlwTCFG/s9Hpm1m8cPKBU5weMyM3ELRPL/80Q5Stnrx
	iMwvKi2tOtMu0gDZ8Jxt1DODBXblbCH6zbaXbl011l19fyRsvuCS308SV4KZ1vCL
	wiW8KzLanfWIPHYVTZrusFNdQdTaK54hkqDFTid3Ra5yu3FCJ46T6FWvzhZlTJhW
	CU87NG3zJ7ozueEYfJ4/gAI+3b4MK/VCd1h/6fSPzvNVOxKDbulHBkPyNi3tzaIK
	FMtZ8NewXu3R6g2Zl5hOL+oA+3+SEWa54HnCIvLSJJz1+E0+k5/92rkh9cmMxMo9
	DzIB5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7he39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:20:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so291319785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344044; x=1783948844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgfh2/38B3WhwVMaRw3DoRNAiK5OOTw4W1PNnpwazmU=;
        b=jQR+LPbbVmUg6P53qtDcOPLQJ+PjwKnctc/a8+XK0s508Z3o4QJnSrZ2C/dqa+4bQ+
         Av26bvHJ/nv6toHVQ6DuhVdyIEbIIjuObWqS5smYbqX7Tb9fvRRTTaa9KKkA5QfTt+Qv
         xh5JKhlpSNiq2Hcb14sy3F4DeV2W1onboIypWlzGrWpEb1+mQKl3JBo7JX4mcdtE1/0+
         KG0T7n1YUIZxVkGwd74jue2DR6l5uL5x1p5UfCVLrSDH7RseAw5g8KTkkicBZO/O05YO
         W51f7NS7SQIUzQ5zj9+qY3mdQjnUfKlCgvhMGsnHn4ceJJ+cIKRXuooOq1y/0EILcpW5
         uDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344044; x=1783948844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vgfh2/38B3WhwVMaRw3DoRNAiK5OOTw4W1PNnpwazmU=;
        b=o46GE6KqJ76nUE+bpPAJdiF5EJL/wGSLlp+MeoZpZYGx0w20oRlVDSTFJlt/OvG75+
         mCLfXPnP36Bdfug+d8XXrY0MB4NVQ9ZK5St5r2GIwhrxjIq22wyYU22qgKdn/y4Ut5Tl
         QKsoewIGVrlLQF+0R1uT7ecNwN5OKlpVC7BOacpSJKAUiAstqMXpXvu1eI6z1Uc+TVyg
         ZwlbG6Ds+3rpD1M1r6pg4ZL3Aqoj//s3y0Xcxxwre4PxlEQQ68LH74QKxESEJeH5NpmD
         dtpwDMGqzTZnJyLa7btREB+FAJls2sTfBjNuX33WapH5gk2RguEtKXj64JBYVA14bDGW
         pSkw==
X-Gm-Message-State: AOJu0YyONIb4QNZsKD6iTcN4Bh3AHrr6t7Tihy0of+Pxt1LK7M8e1Ak0
	/AcX5pazP2OVw4qm8nlZLrvp0oh6PepFP6W7YGUh39oxfhWX0Hpw9IXp78GU/o0cNxvvn96/ntt
	qZ3k5z6aI2gz30DXfX39o+a8DtYqRAH9xlKhO7VAvpYRjP84GzCYfyxpAgReO4dg5o4Tg1YXxRl
	0k
X-Gm-Gg: AfdE7clmueYdYm6zG2s4DrT2j35Vlj+pDEIJ02dFhPW30iNjy5UAZXKayjoBx8ox+zS
	w7PZX6QG+80rb0I6dY6P3uuNPBj1L4l7BV4Zcvb3DNDN1ZvW7N1tbl93YsFPGGFUPP8nRG6A53O
	hCN7bcvf1pzhtvfbh2o6bWKPifowUCFF1wOU1yFRb4yWzYh09l/9DBQhWubWmq/S6cG9h2QGsl1
	KUfgvpuA0Zl7B4k8AG/50RQzzQLS3HpzpqEfan882ZicDG1fniVyq+OjLgLIotVMb7IKMDna4WS
	9PbjaPz4MDFHYn1cjvpjD46mphLCBF3fn04qSzzKDXj4vQnZK1gaEFuO7uBPD9G7pkJbM5zBZar
	mpoIdW4MW4qAJxviktZVr3H2921t4RdTzOYj/7v9N
X-Received: by 2002:a05:620a:27cd:b0:92a:c203:471e with SMTP id af79cd13be357-92ebb4c940emr65804485a.9.1783344043778;
        Mon, 06 Jul 2026 06:20:43 -0700 (PDT)
X-Received: by 2002:a05:620a:27cd:b0:92a:c203:471e with SMTP id af79cd13be357-92ebb4c940emr65795885a.9.1783344043148;
        Mon, 06 Jul 2026 06:20:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:17 +0200
Subject: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6726;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=px3gFNalJW0myw4JO8FxOi8xC4WUF57/BsmFQdIQdYc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uchS4csS4YIcS0mi1Ifm+LIJhbGgTUvShSf
 ydPuYJXWmaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurnAAKCRAFnS7L/zaE
 w0zzD/9SCsUE9nshAQyInqJLWoFIM8/bv54ACwjrQ2SLcq5ghDCutaXpCzCQFH79QU3gcsV7hid
 9WRL1B3pvXCNlRmZMDmiPdmHymy+1cCQ2nz0kzyELvhGm19aaJyIVRajtt2qkCdUFa9rJTnrL1L
 EHSieziZDKkw0UCo1GTEJZl4oq9Fb08FdSsJBMFI0aRlr8DrhYRVVE1Nj2qjHPRV+RWbNqmSf0K
 69XA2gEVSIYqykcHzGIi1V6hIoxhbwdoJsPv9KoAhoJqv7McGTZkRu2VpR31aH7rAWw1La5PFeH
 KU96pFcBkSvy8a+lh5eJ9ES5FPv/hth4mNWQtUdjugM9b0o1GGTOXkyId2OwBA6IqbaAz4dzKtl
 3u/I28s1UVntXT33yfliBNrV0d3ZVUYOqNXWhDx0yRCv70fP6LJiP8fitPovwynNOlTNHdOHSVH
 3Q+emhc9KPvwGauW5lipa3RqCqGmcwZQsMpyqNQh66czQKWB4V+HFkls+Ao55bX83NRZHK67g4W
 ur9Dokj/KleRMu3g2FU4zm3nR6sdWnRNacQS4MyBnxzSpdDxICRxC6udFodF0Xtw4Wk+jVZvqwX
 ZYoqv4ylO5Kal6ukUy3bUMkLTbCdLXdXPjNekUOOOkss7LcURiWU073B59r/QQSY/BGGwersAeW
 gWBpQTcQFWqJsaA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX+HMsHIvcWuIw
 25mZD+Ws9HnwfsNkSJTMWvHDrAin7v5jrSJHTEJCWp8lBaF+iqtovaD0IJY5V1Dx5ALliAZYi6t
 PkIQnk48e6029Ljt8NmD0XC0BUMMiqv5rt9zKD3UPG369Cl6381reTguA5dYA3hJoLj/IeLeNiG
 NBeGOQ3pVEBemwfBppeVD1VpKnJpw2YRX0Om8t382RPq8ONG3rCiZaxtKOJ61xCfQgk0aJVnXei
 N1DtcaaXzXSuYtWu3MyzVf370Jvu2/p5AJ+99m3uHXz/KqG9POTeg7ZR/syyuFWNnQgEXPgdtVR
 n9kgmQeLz8UbGSvkBSTwP1T1i1i4qV3NVRo04VjysWCC3KWeaehvM+m+O8/pxYiD2i7PhVfXjlX
 1AuwotR4jiLp1R1V7D+RB5OyprpfNrtjXbqQK5GtcHyFGJDngBJrTfFGY7dyDFNa0Wdyr/OG732
 fZQ5erde5kxnle/tuWw==
X-Proofpoint-ORIG-GUID: CLs23ipPzzXpEUeA2RvDtWYLGmOdYMt6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX0mfY4jMIp/97
 NElNe/Wsr8G+yKmIVEO3YKPhd6g3Dg12XfUDxOLYYnL+5Dzc9FyLP2i05vTB03BNa9PHKwfei4R
 d3nk7Xm15EB/4A9/ItXmtMs5wJCWlJc=
X-Proofpoint-GUID: CLs23ipPzzXpEUeA2RvDtWYLGmOdYMt6
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4babac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ZvYg6ySBQLmwDIutsxAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116848-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linu
 x.dev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04B39711BAA

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  11 ++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 161 +++++++++++++++++++++++++
 3 files changed, 173 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 60a0ead127fa9f08749e1bc686e15cc5eb341c28..a7cf348f6a7aa18e8b3f39f109b02ea672ae4177 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -232,3 +232,14 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	select PM
+	select PM_GENERIC_DOMAINS
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index b71a6a0bed3f1489b1d07664ecd728f1db145986..032e582f2e1af96687484ce28aaba0c2ef73e754 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..8ee62189556fe4ff0d8aa2f8b105175e08000b7c
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/delay.h>
+#include <linux/ethtool.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+struct qcom_dwmac_sgmii_phy_scmi {
+	unsigned int perf_state;
+};
+
+static int qcom_dwmac_sgmii_phy_scmi_power_on(struct phy *phy)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	struct device *dev = phy->dev.parent;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = dev_pm_genpd_set_performance_state(dev, priv->perf_state);
+	if (ret) {
+		pm_runtime_put(dev);
+		return ret;
+	}
+
+	usleep_range(5000, 10000);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_power_off(struct phy *phy)
+{
+	struct device *dev = phy->dev.parent;
+
+	dev_pm_genpd_set_performance_state(dev, 0);
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	priv->perf_state = (submode == PHY_INTERFACE_MODE_2500BASEX) ?
+			   SPEED_2500 : SPEED_1000;
+
+	return 0;
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.power_on	= qcom_dwmac_sgmii_phy_scmi_power_on,
+	.power_off	= qcom_dwmac_sgmii_phy_scmi_power_off,
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_runtime_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_disable(dev);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->perf_state = SPEED_1000;
+
+	/*
+	 * Enable runtime PM on the provider before creating the PHY so that the
+	 * PHY core enables runtime PM on the PHY device too. The single SCMI
+	 * power domain has already been attached to this device by the driver
+	 * core, so runtime PM votes propagate to firmware through the genpd
+	 * device link. No register or clock access is done here - firmware owns
+	 * the SerDes.
+	 */
+	pm_runtime_enable(dev);
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_runtime_disable, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	phy_set_drvdata(phy, priv);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3


