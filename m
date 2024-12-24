Return-Path: <linux-arm-msm+bounces-43193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 287789FBA02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 08:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71B06164F5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 07:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22003161320;
	Tue, 24 Dec 2024 07:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p0fIGz6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6440BF2;
	Tue, 24 Dec 2024 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735023635; cv=none; b=U9SOxbOsBiD1x8LtWWqFrZI469nfLiYRJdAjSngBhU3I2BTFQ+X1As7p0428xnNfC+5hq1Qe1Lm5GBAXth6cEY2v+mVYDTyGvnhQfXR51UiUlCV4GColG7aDpUWPzI/blbRxLvuhNEmc/9bRuJsuA2OAL7zazDmJaKW13EO4Rdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735023635; c=relaxed/simple;
	bh=R1qJTlSiUr8Aba/9KYFGPfflVS1onOEAP3bsTVr7Qpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SQ9cfqlRunHNonlkZbY0b520hzm8U8fFsrjgdR/YIxAI/zYkKK5H8zpAtJuyqFAqZ4w7ZrG9T/t803Yr5iOMu4yci+uthoTZJHrGuMR3tOu/XYRUuiMGR+RyUjqgCeTu9EUaW1yD00wHU9wLRwLNAOBNHIWSNDx58s1G0DT091Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p0fIGz6Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO5latV006823;
	Tue, 24 Dec 2024 07:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4keVd3kAl65B62qnmduid4meJPbrIuIDzE86UFOq4/M=; b=p0fIGz6QJewQh43m
	WfgyZlbvWrlUNQ6dwRad3N98G2ewQ1+4gmgSzCgFVpNxBbAQ04G7HllvWiYZOou0
	oxeUl1NhNM69FHnLHTMIMmKwZsrkpHA3bIPWBqX+0RUVjywU6QqyLKzJrN5I8Avu
	5f7G9JTezAyhHiUarwa250z/o/Pbh76iX7OErxJVd7FkJq8CaVgXey/p5w6uPtwL
	sq324pleh+XKAGozOqIoexZ+66xYJUTH6gkU3uHpnRiiPjSL996/aGtMkasXBMSM
	ePf383KY2sd6Du/t1Ji4ZtHE9rUb9VZwpPnsLdSRbRkGjYezv3IORcfyh37fQjiB
	9GUPYw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qq4b06q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 07:00:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO708Tv024546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 07:00:08 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 23:00:00 -0800
Message-ID: <d278ad9a-5d23-4cb8-9de7-5a51d838ba5d@quicinc.com>
Date: Tue, 24 Dec 2024 12:29:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
To: Lei Wei <quic_leiwei@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_luoj@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <bartosz.golaszewski@linaro.org>, <vsmuthu@qti.qualcomm.com>,
        <john@phrozen.org>
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
 <20241216-ipq_pcs_6-13_rc1-v3-3-3abefda0fc48@quicinc.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <20241216-ipq_pcs_6-13_rc1-v3-3-3abefda0fc48@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -fCPTkMNCyGcBwLZ7Ee5pwyfEi1L6E9O
X-Proofpoint-GUID: -fCPTkMNCyGcBwLZ7Ee5pwyfEi1L6E9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240056



On 12/16/2024 7:10 PM, Lei Wei wrote:
> This patch adds the following PCS functionality for the PCS driver
> for IPQ9574 SoC:
> 
> a.) Parses PCS MII DT nodes and instantiate each MII PCS instance.
> b.) Exports PCS instance get and put APIs. The network driver calls
> the PCS get API to get and associate the PCS instance with the port
> MAC.
> c.) PCS phylink operations for SGMII/QSGMII interface modes.
> 
> Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
> ---
>  drivers/net/pcs/pcs-qcom-ipq9574.c   | 463 +++++++++++++++++++++++++++++++++++
>  include/linux/pcs/pcs-qcom-ipq9574.h |  16 ++
>  2 files changed, 479 insertions(+)
> 
> diff --git a/drivers/net/pcs/pcs-qcom-ipq9574.c b/drivers/net/pcs/pcs-qcom-ipq9574.c
> index ea90c1902b61..54acb1c8c67f 100644
> --- a/drivers/net/pcs/pcs-qcom-ipq9574.c
> +++ b/drivers/net/pcs/pcs-qcom-ipq9574.c
> @@ -6,12 +6,46 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/pcs/pcs-qcom-ipq9574.h>
>  #include <linux/phy.h>
> +#include <linux/phylink.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
>  #include <dt-bindings/net/qcom,ipq9574-pcs.h>
>  
> +/* Maximum number of MIIs per PCS instance. There are 5 MIIs for PSGMII. */
> +#define PCS_MAX_MII_NRS			5
> +
> +#define PCS_CALIBRATION			0x1e0
> +#define PCS_CALIBRATION_DONE		BIT(7)
> +
> +#define PCS_MODE_CTRL			0x46c
> +#define PCS_MODE_SEL_MASK		GENMASK(12, 8)
> +#define PCS_MODE_SGMII			FIELD_PREP(PCS_MODE_SEL_MASK, 0x4)
> +#define PCS_MODE_QSGMII			FIELD_PREP(PCS_MODE_SEL_MASK, 0x1)
> +
> +#define PCS_MII_CTRL(x)			(0x480 + 0x18 * (x))
> +#define PCS_MII_ADPT_RESET		BIT(11)
> +#define PCS_MII_FORCE_MODE		BIT(3)
> +#define PCS_MII_SPEED_MASK		GENMASK(2, 1)
> +#define PCS_MII_SPEED_1000		FIELD_PREP(PCS_MII_SPEED_MASK, 0x2)
> +#define PCS_MII_SPEED_100		FIELD_PREP(PCS_MII_SPEED_MASK, 0x1)
> +#define PCS_MII_SPEED_10		FIELD_PREP(PCS_MII_SPEED_MASK, 0x0)
> +
> +#define PCS_MII_STS(x)			(0x488 + 0x18 * (x))
> +#define PCS_MII_LINK_STS		BIT(7)
> +#define PCS_MII_STS_DUPLEX_FULL		BIT(6)
> +#define PCS_MII_STS_SPEED_MASK		GENMASK(5, 4)
> +#define PCS_MII_STS_SPEED_10		0
> +#define PCS_MII_STS_SPEED_100		1
> +#define PCS_MII_STS_SPEED_1000		2
> +
> +#define PCS_PLL_RESET			0x780
> +#define PCS_ANA_SW_RESET		BIT(6)
> +
>  #define XPCS_INDIRECT_ADDR		0x8000
>  #define XPCS_INDIRECT_AHB_ADDR		0x83fc
>  #define XPCS_INDIRECT_ADDR_H		GENMASK(20, 8)
> @@ -20,6 +54,18 @@
>  					 FIELD_PREP(GENMASK(9, 2), \
>  					 FIELD_GET(XPCS_INDIRECT_ADDR_L, reg)))
>  
> +/* Per PCS MII private data */
> +struct ipq_pcs_mii {
> +	struct ipq_pcs *qpcs;
> +	struct phylink_pcs pcs;
> +	int index;
> +
> +	/* RX clock from NSSCC to PCS MII */
> +	struct clk *rx_clk;
> +	/* TX clock from NSSCC to PCS MII */
> +	struct clk *tx_clk;
> +};
> +
>  /* PCS private data */
>  struct ipq_pcs {
>  	struct device *dev;
> @@ -27,12 +73,423 @@ struct ipq_pcs {
>  	struct regmap *regmap;
>  	phy_interface_t interface;
>  
> +	/* Lock to protect PCS configurations shared by multiple MII ports */
> +	struct mutex config_lock;
> +
>  	/* RX clock supplied to NSSCC */
>  	struct clk_hw rx_hw;
>  	/* TX clock supplied to NSSCC */
>  	struct clk_hw tx_hw;
> +
> +	struct ipq_pcs_mii *qpcs_mii[PCS_MAX_MII_NRS];
>  };
>  
> +#define phylink_pcs_to_qpcs_mii(_pcs)	\
> +	container_of(_pcs, struct ipq_pcs_mii, pcs)
> +
> +static void ipq_pcs_get_state_sgmii(struct ipq_pcs *qpcs,
> +				    int index,
> +				    struct phylink_link_state *state)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(qpcs->regmap, PCS_MII_STS(index), &val);
> +	if (ret) {
> +		state->link = 0;
> +		return;
> +	}
> +
> +	state->link = !!(val & PCS_MII_LINK_STS);
> +
> +	if (!state->link)
> +		return;
> +
> +	switch (FIELD_GET(PCS_MII_STS_SPEED_MASK, val)) {
> +	case PCS_MII_STS_SPEED_1000:
> +		state->speed = SPEED_1000;
> +		break;
> +	case PCS_MII_STS_SPEED_100:
> +		state->speed = SPEED_100;
> +		break;
> +	case PCS_MII_STS_SPEED_10:
> +		state->speed = SPEED_10;
> +		break;
> +	default:
> +		state->link = false;
> +		return;
> +	}
> +
> +	if (val & PCS_MII_STS_DUPLEX_FULL)
> +		state->duplex = DUPLEX_FULL;
> +	else
> +		state->duplex = DUPLEX_HALF;
> +}
> +
> +static int ipq_pcs_config_mode(struct ipq_pcs *qpcs,
> +			       phy_interface_t interface)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	/* Configure PCS interface mode */
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +		val = PCS_MODE_SGMII;
> +		break;
> +	case PHY_INTERFACE_MODE_QSGMII:
> +		val = PCS_MODE_QSGMII;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret = regmap_update_bits(qpcs->regmap, PCS_MODE_CTRL,
> +				 PCS_MODE_SEL_MASK, val);
> +	if (ret)
> +		return ret;
> +
> +	/* PCS PLL reset */
> +	ret = regmap_clear_bits(qpcs->regmap, PCS_PLL_RESET, PCS_ANA_SW_RESET);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(1000);
> +	ret = regmap_set_bits(qpcs->regmap, PCS_PLL_RESET, PCS_ANA_SW_RESET);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for calibration completion */
> +	ret = regmap_read_poll_timeout(qpcs->regmap, PCS_CALIBRATION,
> +				       val, val & PCS_CALIBRATION_DONE,
> +				       1000, 100000);
> +	if (ret) {
> +		dev_err(qpcs->dev, "PCS calibration timed-out\n");
> +		return ret;
> +	}
> +
> +	qpcs->interface = interface;
> +
> +	return 0;
> +}
> +
> +static int ipq_pcs_config_sgmii(struct ipq_pcs *qpcs,
> +				int index,
> +				unsigned int neg_mode,
> +				phy_interface_t interface)
> +{
> +	int ret;
> +
> +	/* Access to PCS registers such as PCS_MODE_CTRL which are
> +	 * common to all MIIs, is lock protected and configured
> +	 * only once.
> +	 */
> +	mutex_lock(&qpcs->config_lock);
> +
> +	if (qpcs->interface != interface) {
> +		ret = ipq_pcs_config_mode(qpcs, interface);
> +		if (ret) {
> +			mutex_unlock(&qpcs->config_lock);
> +			return ret;
> +		}
> +	}
> +
> +	mutex_unlock(&qpcs->config_lock);
> +
> +	/* Nothing to do here as in-band autoneg mode is enabled
> +	 * by default for each PCS MII port.
> +	 */
> +	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
> +		return 0;
> +
> +	/* Set force speed mode */
> +	return regmap_set_bits(qpcs->regmap,
> +			       PCS_MII_CTRL(index), PCS_MII_FORCE_MODE);
> +}
> +
> +static int ipq_pcs_link_up_config_sgmii(struct ipq_pcs *qpcs,
> +					int index,
> +					unsigned int neg_mode,
> +					int speed)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	/* PCS speed need not be configured if in-band autoneg is enabled */
> +	if (neg_mode != PHYLINK_PCS_NEG_INBAND_ENABLED) {
> +		/* PCS speed set for force mode */
> +		switch (speed) {
> +		case SPEED_1000:
> +			val = PCS_MII_SPEED_1000;
> +			break;
> +		case SPEED_100:
> +			val = PCS_MII_SPEED_100;
> +			break;
> +		case SPEED_10:
> +			val = PCS_MII_SPEED_10;
> +			break;
> +		default:
> +			dev_err(qpcs->dev, "Invalid SGMII speed %d\n", speed);
> +			return -EINVAL;
> +		}
> +
> +		ret = regmap_update_bits(qpcs->regmap, PCS_MII_CTRL(index),
> +					 PCS_MII_SPEED_MASK, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* PCS adapter reset */
> +	ret = regmap_clear_bits(qpcs->regmap,
> +				PCS_MII_CTRL(index), PCS_MII_ADPT_RESET);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(qpcs->regmap,
> +			       PCS_MII_CTRL(index), PCS_MII_ADPT_RESET);
> +}
> +
> +static int ipq_pcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
> +			    const struct phylink_link_state *state)
> +{
> +	switch (state->interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ipq_pcs_enable(struct phylink_pcs *pcs)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> +	int index = qpcs_mii->index;
> +	int ret;
> +
> +	ret = clk_prepare_enable(qpcs_mii->rx_clk);
> +	if (ret) {
> +		dev_err(qpcs->dev, "Failed to enable MII %d RX clock\n", index);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(qpcs_mii->tx_clk);
> +	if (ret) {
> +		dev_err(qpcs->dev, "Failed to enable MII %d TX clock\n", index);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ipq_pcs_disable(struct phylink_pcs *pcs)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +
> +	clk_disable_unprepare(qpcs_mii->rx_clk);
> +	clk_disable_unprepare(qpcs_mii->tx_clk);
> +}
> +
> +static void ipq_pcs_get_state(struct phylink_pcs *pcs,
> +			      struct phylink_link_state *state)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> +	int index = qpcs_mii->index;
> +
> +	switch (state->interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +		ipq_pcs_get_state_sgmii(qpcs, index, state);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	dev_dbg_ratelimited(qpcs->dev,
> +			    "mode=%s/%s/%s link=%u\n",
> +			    phy_modes(state->interface),
> +			    phy_speed_to_str(state->speed),
> +			    phy_duplex_to_str(state->duplex),
> +			    state->link);
> +}
> +
> +static int ipq_pcs_config(struct phylink_pcs *pcs,
> +			  unsigned int neg_mode,
> +			  phy_interface_t interface,
> +			  const unsigned long *advertising,
> +			  bool permit)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> +	int index = qpcs_mii->index;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +		return ipq_pcs_config_sgmii(qpcs, index, neg_mode, interface);
> +	default:
> +		return -EOPNOTSUPP;
> +	};
> +}
> +
> +static void ipq_pcs_link_up(struct phylink_pcs *pcs,
> +			    unsigned int neg_mode,
> +			    phy_interface_t interface,
> +			    int speed, int duplex)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> +	int index = qpcs_mii->index;
> +	int ret;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +		ret = ipq_pcs_link_up_config_sgmii(qpcs, index,
> +						   neg_mode, speed);
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	if (ret)
> +		dev_err(qpcs->dev, "PCS link up fail for interface %s\n",
> +			phy_modes(interface));
> +}
> +
> +static const struct phylink_pcs_ops ipq_pcs_phylink_ops = {
> +	.pcs_validate = ipq_pcs_validate,
> +	.pcs_enable = ipq_pcs_enable,
> +	.pcs_disable = ipq_pcs_disable,
> +	.pcs_get_state = ipq_pcs_get_state,
> +	.pcs_config = ipq_pcs_config,
> +	.pcs_link_up = ipq_pcs_link_up,
> +};
> +
> +/**
> + * ipq_pcs_get() - Get the IPQ PCS MII instance
> + * @np: Device tree node to the PCS MII
> + *
> + * Description: Get the phylink PCS instance for the given PCS MII node @np.
> + * This instance is associated with the specific MII of the PCS and the
> + * corresponding Ethernet netdevice.
> + *
> + * Return: A pointer to the phylink PCS instance or an error-pointer value.
> + */
> +struct phylink_pcs *ipq_pcs_get(struct device_node *np)
> +{
> +	struct platform_device *pdev;
> +	struct ipq_pcs_mii *qpcs_mii;
> +	struct ipq_pcs *qpcs;
> +	u32 index;
> +
> +	if (of_property_read_u32(np, "reg", &index))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (index >= PCS_MAX_MII_NRS)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* Get the parent device */
> +	pdev = of_find_device_by_node(np->parent);
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	qpcs = platform_get_drvdata(pdev);
> +	if (!qpcs) {
> +		put_device(&pdev->dev);
> +
> +		/* If probe is not yet completed, return DEFER to
> +		 * the dependent driver.
> +		 */
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	qpcs_mii = qpcs->qpcs_mii[index];
> +	if (!qpcs_mii) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-ENOENT);
> +	}
> +
> +	return &qpcs_mii->pcs;
> +}
> +EXPORT_SYMBOL(ipq_pcs_get);
> +
> +/**
> + * ipq_pcs_put() - Release the IPQ PCS MII instance
> + * @pcs: PCS instance
> + *
> + * Description: Release a phylink PCS instance.
> + */
> +void ipq_pcs_put(struct phylink_pcs *pcs)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +
> +	/* Put reference taken by of_find_device_by_node() in
> +	 * ipq_pcs_get().
> +	 */
> +	put_device(qpcs_mii->qpcs->dev);
> +}
> +EXPORT_SYMBOL(ipq_pcs_put);
> +
> +/* Parse the PCS MII DT nodes which are child nodes of the PCS node,
> + * and instantiate each MII PCS instance.
> + */
> +static int ipq_pcs_create_miis(struct ipq_pcs *qpcs)
> +{
> +	struct device *dev = qpcs->dev;
> +	struct ipq_pcs_mii *qpcs_mii;
> +	struct device_node *mii_np;
> +	u32 index;
> +	int ret;
> +
> +	for_each_available_child_of_node(dev->of_node, mii_np) {
> +		ret = of_property_read_u32(mii_np, "reg", &index);
> +		if (ret) {
> +			dev_err(dev, "Failed to read MII index\n");
> +			of_node_put(mii_np);

Assume, the second child node failed here.
Returning without calling the first child node of_node_put().

Please clear the previous child nodes resources before return.

Thanks & Regards,
Manikanta.

> +			return ret;
> +		}
> +
> +		if (index >= PCS_MAX_MII_NRS) {
> +			dev_err(dev, "Invalid MII index\n");
> +			of_node_put(mii_np);
> +			return -EINVAL;
> +		}
> +
> +		qpcs_mii = devm_kzalloc(dev, sizeof(*qpcs_mii), GFP_KERNEL);
> +		if (!qpcs_mii) {
> +			of_node_put(mii_np);
> +			return -ENOMEM;
> +		}
> +
> +		qpcs_mii->qpcs = qpcs;
> +		qpcs_mii->index = index;
> +		qpcs_mii->pcs.ops = &ipq_pcs_phylink_ops;
> +		qpcs_mii->pcs.neg_mode = true;
> +		qpcs_mii->pcs.poll = true;
> +
> +		qpcs_mii->rx_clk = devm_get_clk_from_child(dev, mii_np, "rx");
> +		if (IS_ERR(qpcs_mii->rx_clk)) {
> +			of_node_put(mii_np);
> +			return dev_err_probe(dev, PTR_ERR(qpcs_mii->rx_clk),
> +					     "Failed to get MII %d RX clock\n", index);
> +		}
> +
> +		qpcs_mii->tx_clk = devm_get_clk_from_child(dev, mii_np, "tx");
> +		if (IS_ERR(qpcs_mii->tx_clk)) {
> +			of_node_put(mii_np);
> +			return dev_err_probe(dev, PTR_ERR(qpcs_mii->tx_clk),
> +					     "Failed to get MII %d TX clock\n", index);
> +		}
> +
> +		qpcs->qpcs_mii[index] = qpcs_mii;
> +	}
> +
> +	return 0;
> +}
> +
>  static unsigned long ipq_pcs_clk_rate_get(struct ipq_pcs *qpcs)
>  {
>  	switch (qpcs->interface) {
> @@ -219,6 +676,12 @@ static int ipq9574_pcs_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = ipq_pcs_create_miis(qpcs);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&qpcs->config_lock);
> +
>  	platform_set_drvdata(pdev, qpcs);
>  
>  	return 0;
> diff --git a/include/linux/pcs/pcs-qcom-ipq9574.h b/include/linux/pcs/pcs-qcom-ipq9574.h
> new file mode 100644
> index 000000000000..5469a81b4482
> --- /dev/null
> +++ b/include/linux/pcs/pcs-qcom-ipq9574.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + *
> + */
> +
> +#ifndef __LINUX_PCS_QCOM_IPQ9574_H
> +#define __LINUX_PCS_QCOM_IPQ9574_H
> +
> +struct device_node;
> +struct phylink_pcs;
> +
> +struct phylink_pcs *ipq_pcs_get(struct device_node *np);
> +void ipq_pcs_put(struct phylink_pcs *pcs);
> +
> +#endif /* __LINUX_PCS_QCOM_IPQ9574_H */
> 


