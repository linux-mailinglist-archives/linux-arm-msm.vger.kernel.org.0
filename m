Return-Path: <linux-arm-msm+bounces-80753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BEFC3F944
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF8A3188F27C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6F631A55A;
	Fri,  7 Nov 2025 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1EYSsnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LErrStSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB34331A045
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762512641; cv=none; b=B4VtCu4mSUjbZlbmmXjR699m2uARj0avGu5TO46Te4rqkyzElOoojwu+32CErGn6aZMMK6ltajhMcVjAqOgd5SutR/JXItC4n1q3ALvQQ4cWxVl04Fv3aLgh88O33asxOA4ORUKe3tOkDsB5YlwouayNpYilQW5h2ylVwR1Nhpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762512641; c=relaxed/simple;
	bh=H38bo1o8KZgtlMyhOjvzTVZdaXQkA/mCrkUJu/FTaCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpebp/Az8nLhYIqB+83l/TiS2vQbywojshr9AUOv1eSlF6dkX/2Awv1LzdLEdlJDiGGQHdDSdqqzU9kO2vF8yJ7MW7FjI4wmrn1THO9no15WDOdK7P/uUbUU8wu3GVdmzY0SLWb7Ls0e/F0E+7X3hhGPi88xJYVMgAaY6GFkmd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1EYSsnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LErrStSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74NLPk528575
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 10:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=; b=B1EYSsnG47lGPxvn
	zAiOxrAmz/Wz/9UGbFmZFaJUsrfmtRJdHGCRNLO8nK188PAywHZCZ/Czv8tlM8ve
	CGTbIUMThDuTRN2SNFnJdG0FxRGnW+6oQLaE1SUNcHDxkH1p3qM+XKbF6+ZvwhuC
	2xSpWB1caS7pSkxWxhHPfYew/g/o0fF2xf0FwgXZJ9fl/vku5K0YWUR2Bzn1GvAJ
	SLreBdufu7mVgG3gE+Go0RhRFhZFyzFhMp9WBxMVB5AfBt5uh9btC4+Yx9NldHxh
	YgAVAW7chm0tTXTd4tmqkRL7pByvT7vcNlH8wK7Ctms8y6dh9igwU/62YLoua5H6
	vkifZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905htqd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:50:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1be0fdfe1so21926285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512638; x=1763117438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=;
        b=LErrStSJdEkYoWE281QcbKE6B0ryO0iCFykA5UQ5uzeRckQpRGbx88lDuuBlBGnxE9
         41xOLBgsZ3NxWp6GOjqpFKmRLz7nHnZjui2zUerQULoyIz2TRy53Bw6FDHZrCKyN7DgU
         a8GPK7UBS5Bw93msfBVfMWu6m84TgEf9Ti0B8F5hYMGnWgTeDz0BdGJUCwwZ0uwKkg9L
         y2cY2PjaY5gi6ozb4rzE0cuUl2t1d4U9kAUfKeHgLUNdWWlwiS2eh/YpY/MnQGtaX0tI
         MgvHLNH7/GE7OKEFPlfzJWtp8OiVxG0qQZjR3UnXIU/mU3frZeLp4pExPRpTVs8Vg4Yr
         8WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512638; x=1763117438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=;
        b=gZFAh1mAWEr+FqYabIGYjLfngJDDg7qBgWPD0xRUvgrB35X26PdvTFEQVbfWG0aj2c
         WDLeJuNxEWAlWTNL1AUljCB7/0YRCTt8Xly+12TOuwGaUrML7AJI0NZabRrPJSDOO/TX
         FE09xewakMb4uc0cKFpjpsTKNlsnNMAN3Qc7H3It/pGa3XnhGNWaCsDM7Xr1dYIZJlhU
         JG2fVmKgD++vPiDMB5HTdoFufhHQNbpo5JyFzf8+vbt8koUlkJuAOZXF8SpbD0hkEmwz
         fQR0vI5F1BmGrApKh+GgTPnIeMBckKtIoi0wE67+QA8uBAPyYCH8sjE6shDS81/z15zo
         KYdQ==
X-Gm-Message-State: AOJu0Yzv5SGH+NhLk2FkeoVgPTdjHIK8vIEsiL8CObebHzBwfyVBRzCe
	Uac82IHzCsmIcDHd+Y+W/rME1lym/ZhHdkzOglR6J920k+9qX8HRc/RlL1m4BTNViWbjxiab/CF
	QUzA6+flwJOfSRsv7FJQAnsMvGvg4UlhR3JToHm5+8DD8CvYJ7Sh8OHvUnV/HndJxz3DE
X-Gm-Gg: ASbGncuHxoj8S6f41epj9D9V4Q4gvG93peyDlg8YXJwRfXesOppTi7KobUOruraopvC
	bgthOlrATyoghAQwTxflZidNhYi5Pq3I2DzShKRL3wtRzns/fc+MPBXyjpd1UhpPePHYD9gFiYp
	huSOMnEZWdDiY+9ldKdM6RNyBNL8lQfuFAwK5HjcoFd+GHzfgpAf/ShlUckBqLYajqCvyUorPmc
	DGncKTr0T6AcXBfQKmaZOun4wbXLKqSdKXJN4g0Y6ClUaeO1JvpStgWuVbKlux9s81NyKRX1kSN
	WVdLQF6WoAcBkgxyC+SNy0hUqvIhV2eqoGlfKXKcl3Br/vPmquQVq04vBKav3bj0vGbFAVldu/+
	vXvrAukuoeSkfXU34Hl/1LUcjMQeMEA9UjGCNfzSa94voOsa8v82lWroC
X-Received: by 2002:a05:622a:411:b0:4ec:ed46:9268 with SMTP id d75a77b69052e-4ed94a41994mr19484681cf.13.1762512637968;
        Fri, 07 Nov 2025 02:50:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECQ+rghHeVgkMsgvUMsj4lxwZEJlBOwE/naarHWq7nH8xBHgoJZQqQzG8SkQO4ghE/Xbce/w==
X-Received: by 2002:a05:622a:411:b0:4ec:ed46:9268 with SMTP id d75a77b69052e-4ed94a41994mr19484181cf.13.1762512637527;
        Fri, 07 Nov 2025 02:50:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcaeaasm219104466b.1.2025.11.07.02.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:50:36 -0800 (PST)
Message-ID: <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:50:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4NyBTYWx0ZWRfX2nn5evDhkIgp
 xarWpH3cRtDfbmYdmz1vw0FVLPzxlkAU6J4QEouy30M4no7vOxid8raHKeG6BBnnqFFRymkr9Wa
 GhpGcmCIZVypyz5UeHQ4soZ0FtRGikzDWhCp4j97x06AgoCfxhfjdDNYmDcihzqu12x6hiRZTOU
 WBINFars0UcUsR3FUY2rDu9BM2Qn4D6Ihlr0iyTRQHN6HoVelAC+JzA/O6OI8l1d72qb52l9jHb
 bD4on4QN4VKgJE8+flUYaL3/yENsH8tfb3tLYA3KvHLyeRo+jp4OyIlfcASdE38Kohe7+zTyLnA
 sfzExX7EZEOq81IqFmZP0xhSbpo7ONCA5ZpgoCCkkOn++rwidnTxoGiVaAZBR0Uq/3xQ1focC4n
 zJW9Rjzd1T1hHefVO95nd8RT5esuIg==
X-Proofpoint-GUID: PiBsdJvYwxKFasUiPJb_eMTL6-WRq3yt
X-Authority-Analysis: v=2.4 cv=GMAF0+NK c=1 sm=1 tr=0 ts=690dceff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=Xr3OHDAqYAD4YnyFvXYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PiBsdJvYwxKFasUiPJb_eMTL6-WRq3yt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070087

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> It's bad practice to just directly pass void pointers to functions which
> expect concrete types. Make it more clear what type ethqos_clks_config()
> expects.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
>  
>  static void ethqos_clks_disable(void *data)
>  {
> -	ethqos_clks_config(data, false);
> +	struct qcom_ethqos *ethqos = data;
> +
> +	ethqos_clks_config(ethqos, false);

ethqos_clks_config() takes a voidptr too

Konrad

