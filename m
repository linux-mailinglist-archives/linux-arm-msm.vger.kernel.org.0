Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D40529840
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 05:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbiEQDdL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 23:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbiEQDdJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 23:33:09 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64B439807;
        Mon, 16 May 2022 20:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652758388; x=1684294388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D5fyzz6rdwaKPsDIzGmTxmXHHhexwYJnUyY5uei4zH4=;
  b=ep8I5u6VbKWYao5ghKMsWvWUjGU7E66r4VKY337Q1DXAWB8INf0EUFdL
   3lt4jKd5s9KWO/EimoFRwLrkWzRkRW7+/gqLoYZnYaLjvzCCF8s6wEVR5
   9Lsx4ne4+NHfNqXsIqf6roZ941t5zvJZ2/ks6QAsTOYdK+InetgAYZ4mj
   w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 16 May 2022 20:33:07 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 20:33:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 16 May 2022 20:32:45 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 16 May 2022 20:32:39 -0700
Date:   Tue, 17 May 2022 09:02:35 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Doug Anderson" <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>, <quic_vpulyala@quicinc.com>
Subject: Re: [v5 2/3] phy: qcom-snps: Add support for overriding phy tuning
 parameters
Message-ID: <20220517033235.GC19209@hu-pkondeti-hyd.qualcomm.com>
References: <1652723410-1630-1-git-send-email-quic_kriskura@quicinc.com>
 <1652723410-1630-3-git-send-email-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1652723410-1630-3-git-send-email-quic_kriskura@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krishna,

The patch looks good to me. Minor comments below.

On Mon, May 16, 2022 at 11:20:09PM +0530, Krishna Kurapati wrote:
> Add support for overriding electrical signal tuning parameters for
> SNPS HS Phy.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 268 +++++++++++++++++++++++++-
>  1 file changed, 266 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index 5d20378..fa60e8d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -52,6 +52,12 @@
>  #define USB2_SUSPEND_N				BIT(2)
>  #define USB2_SUSPEND_N_SEL			BIT(3)
>  
> +#define USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X0		(0x6c)
> +#define USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X1		(0x70)
> +#define USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X2		(0x74)
> +#define USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X3		(0x78)
> +#define PARAM_OVRD_MASK				0xFF
> +
>  #define USB2_PHY_USB_PHY_CFG0			(0x94)
>  #define UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
>  #define UTMI_PHY_CMN_CTRL_OVERRIDE_EN		BIT(1)
> @@ -60,12 +66,76 @@
>  #define REFCLK_SEL_MASK				GENMASK(1, 0)
>  #define REFCLK_SEL_DEFAULT			(0x2 << 0)
>  
> +#define HS_DISCONNECT_MASK			GENMASK(2, 0)
> +
> +#define SQUELCH_DETECTOR_MASK			GENMASK(7, 5)
> +
> +#define HS_AMPLITUDE_MASK			GENMASK(3, 0)
> +
> +#define PREEMPHASIS_DURATION_MASK		BIT(5)
> +
> +#define PREEMPHASIS_AMPLITUDE_MASK		GENMASK(7, 6)
> +
> +#define HS_RISE_FALL_MASK			GENMASK(1, 0)
> +
> +#define HS_CROSSOVER_VOLTAGE_MASK		GENMASK(3, 2)
> +
> +#define HS_OUTPUT_IMPEDANCE_MASK		GENMASK(5, 4)
> +
> +#define LS_FS_OUTPUT_IMPEDANCE_MASK		GENMASK(3, 0)
> +
> +
>  static const char * const qcom_snps_hsphy_vreg_names[] = {
>  	"vdda-pll", "vdda33", "vdda18",
>  };
>  
>  #define SNPS_HS_NUM_VREGS		ARRAY_SIZE(qcom_snps_hsphy_vreg_names)
>  
> +struct override_param {
> +	s32	value;
> +	u8	reg;
> +};
> +
> +#define OVERRIDE_PARAM(bps, val)\
> +{				\
> +	.value = bps,		\
> +	.reg = val,		\
> +}
> +
> +struct override_param_map {
> +	struct override_param *param_table;
> +	u8 table_size;
> +	u8 reg_offset;
> +	u8 param_mask;
> +};
> +
> +#define OVERRIDE_PARAM_MAP(table, num_elements, offset, mask)		\
> +{									\
> +	.param_table = table,						\
> +	.table_size = num_elements,					\
> +	.reg_offset = offset,						\
> +	.param_mask = mask,						\
> +}
> +
> +struct phy_override_seq {
> +	bool	need_update;
> +	u8	offset;
> +	u8	value;
> +	u8	mask;
> +};
> +
> +static const char *phy_seq_props[] = {
> +	"qcom,hs-disconnect-bp",
> +	"qcom,squelch-detector-bp",
> +	"qcom,hs-amplitude-bp",
> +	"qcom,pre-emphasis-duration-bp",
> +	"qcom,pre-emphasis-amplitude-bp",
> +	"qcom,hs-rise-fall-time-bp",
> +	"qcom,hs-crossover-voltage-microvolt",
> +	"qcom,hs-output-impedance-micro-ohm",
> +	"qcom,ls-fs-output-impedance-bp",
> +};
> +
>  /**
>   * struct qcom_snps_hsphy - snps hs phy attributes
>   *
> @@ -91,6 +161,7 @@ struct qcom_snps_hsphy {
>  
>  	bool phy_initialized;
>  	enum phy_mode mode;
> +	struct phy_override_seq update_seq_cfg[ARRAY_SIZE(phy_seq_props)];
>  };
>  
>  static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
> @@ -173,10 +244,147 @@ static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
>  	return 0;
>  }
>  
> +static struct override_param hs_disconnect_sc7280[] = {
> +	OVERRIDE_PARAM(-272, 0),
> +	OVERRIDE_PARAM(0, 1),
> +	OVERRIDE_PARAM(317, 2),
> +	OVERRIDE_PARAM(630, 3),
> +	OVERRIDE_PARAM(973, 4),
> +	OVERRIDE_PARAM(1332, 5),
> +	OVERRIDE_PARAM(1743, 6),
> +	OVERRIDE_PARAM(2156, 7),
> +};
> +
> +static struct override_param squelch_det_threshold_sc7280[] = {
> +	OVERRIDE_PARAM(-2090, 7),
> +	OVERRIDE_PARAM(-1560, 6),
> +	OVERRIDE_PARAM(-1030, 5),
> +	OVERRIDE_PARAM(-530, 4),
> +	OVERRIDE_PARAM(0, 3),
> +	OVERRIDE_PARAM(530, 2),
> +	OVERRIDE_PARAM(1060, 1),
> +	OVERRIDE_PARAM(1590, 0),
> +};
> +
> +static struct override_param hs_amplitude_sc7280[] = {
> +	OVERRIDE_PARAM(-660, 0),
> +	OVERRIDE_PARAM(-440, 1),
> +	OVERRIDE_PARAM(-220, 2),
> +	OVERRIDE_PARAM(0, 3),
> +	OVERRIDE_PARAM(230, 4),
> +	OVERRIDE_PARAM(440, 5),
> +	OVERRIDE_PARAM(650, 6),
> +	OVERRIDE_PARAM(890, 7),
> +	OVERRIDE_PARAM(1110, 8),
> +	OVERRIDE_PARAM(1330, 9),
> +	OVERRIDE_PARAM(1560, 10),
> +	OVERRIDE_PARAM(1780, 11),
> +	OVERRIDE_PARAM(2000, 12),
> +	OVERRIDE_PARAM(2220, 13),
> +	OVERRIDE_PARAM(2430, 14),
> +	OVERRIDE_PARAM(2670, 15),
> +};
> +
> +static struct override_param preemphasis_duration_sc7280[] = {
> +	OVERRIDE_PARAM(10000, 1),
> +	OVERRIDE_PARAM(20000, 0),
> +};
> +
> +static struct override_param preemphasis_amplitude_sc7280[] = {
> +	OVERRIDE_PARAM(10000, 1),
> +	OVERRIDE_PARAM(20000, 2),
> +	OVERRIDE_PARAM(30000, 3),
> +	OVERRIDE_PARAM(40000, 0),
> +};
> +
> +static struct override_param hs_rise_fall_time_sc7280[] = {
> +	OVERRIDE_PARAM(-4100, 3),
> +	OVERRIDE_PARAM(0, 2),
> +	OVERRIDE_PARAM(2810, 1),
> +	OVERRIDE_PARAM(5430, 0),
> +};
> +
> +static struct override_param hs_crossover_voltage_sc7280[] = {
> +	OVERRIDE_PARAM(-31000, 1),
> +	OVERRIDE_PARAM(0, 3),
> +	OVERRIDE_PARAM(28000, 2),
> +};
> +
> +static struct override_param hs_output_impedance_sc7280[] = {
> +	OVERRIDE_PARAM(-2300000, 3),
> +	OVERRIDE_PARAM(0, 2),
> +	OVERRIDE_PARAM(2600000, 1),
> +	OVERRIDE_PARAM(6100000, 0),
> +};
> +
> +static struct override_param ls_fs_output_impedance_sc7280[] = {
> +	OVERRIDE_PARAM(-1053, 15),
> +	OVERRIDE_PARAM(-557, 7),
> +	OVERRIDE_PARAM(0, 3),
> +	OVERRIDE_PARAM(612, 1),
> +	OVERRIDE_PARAM(1310, 0),
> +};
> +
> +struct override_param_map sc7280_idp[] = {
> +	OVERRIDE_PARAM_MAP(
> +			hs_disconnect_sc7280,
> +			ARRAY_SIZE(hs_disconnect_sc7280),
> +			USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X0,
> +			HS_DISCONNECT_MASK),
> +
> +	OVERRIDE_PARAM_MAP(
> +			squelch_det_threshold_sc7280,
> +			ARRAY_SIZE(squelch_det_threshold_sc7280),
> +			USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X0,
> +			SQUELCH_DETECTOR_MASK),
> +
> +	OVERRIDE_PARAM_MAP(
> +			hs_amplitude_sc7280,
> +			ARRAY_SIZE(hs_amplitude_sc7280),
> +			USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X1,
> +			HS_AMPLITUDE_MASK),
> +
> +	OVERRIDE_PARAM_MAP(
> +			preemphasis_duration_sc7280,
> +			ARRAY_SIZE(preemphasis_duration_sc7280),
> +			USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X1,
> +			PREEMPHASIS_DURATION_MASK),
> +
> +	OVERRIDE_PARAM_MAP(
> +			preemphasis_amplitude_sc7280,
> +			ARRAY_SIZE(preemphasis_amplitude_sc7280),
> +			USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X1,
> +			PREEMPHASIS_AMPLITUDE_MASK),
> +
> +	OVERRIDE_PARAM_MAP(
> +			hs_rise_fall_time_sc7280,
> +			ARRAY_SIZE(hs_rise_fall_time_sc7280),
> +			USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X2,
> +			HS_RISE_FALL_MASK),
> +
> +	OVERRIDE_PARAM_MAP(
> +			hs_crossover_voltage_sc7280,
> +			ARRAY_SIZE(hs_crossover_voltage_sc7280),
> +			USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X2,
> +			HS_CROSSOVER_VOLTAGE_MASK),
> +
> +	OVERRIDE_PARAM_MAP(
> +			hs_output_impedance_sc7280,
> +			ARRAY_SIZE(hs_output_impedance_sc7280),
> +			USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X2,
> +			HS_OUTPUT_IMPEDANCE_MASK),
> +
> +	OVERRIDE_PARAM_MAP(
> +			ls_fs_output_impedance_sc7280,
> +			ARRAY_SIZE(ls_fs_output_impedance_sc7280),
> +			USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X3,
> +			LS_FS_OUTPUT_IMPEDANCE_MASK),
> +};
> +

I have cross checked with data book. All the values are looking good.

>  static int qcom_snps_hsphy_init(struct phy *phy)
>  {
>  	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
> -	int ret;
> +	int ret, i;
>  
>  	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
>  
> @@ -223,6 +431,14 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL1,
>  					VBUSVLDEXT0, VBUSVLDEXT0);
>  
> +	for (i = 0; i < ARRAY_SIZE(hsphy->update_seq_cfg); i++) {
> +		if (hsphy->update_seq_cfg[i].need_update)
> +			qcom_snps_hsphy_write_mask(hsphy->base,
> +					hsphy->update_seq_cfg[i].offset,
> +					hsphy->update_seq_cfg[i].mask,
> +					hsphy->update_seq_cfg[i].value);
> +	}
> +
>  	qcom_snps_hsphy_write_mask(hsphy->base,
>  					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2,
>  					VREGBYPASS, VREGBYPASS);
> @@ -280,7 +496,10 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
>  static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
>  	{ .compatible	= "qcom,sm8150-usb-hs-phy", },
>  	{ .compatible	= "qcom,usb-snps-hs-5nm-phy", },
> -	{ .compatible	= "qcom,usb-snps-hs-7nm-phy", },
> +	{
> +		.compatible	= "qcom,usb-snps-hs-7nm-phy",
> +		.data		= &sc7280_idp,
> +	},
>  	{ .compatible	= "qcom,usb-snps-femto-v2-phy",	},
>  	{ }
>  };
> @@ -291,6 +510,50 @@ static const struct dev_pm_ops qcom_snps_hsphy_pm_ops = {
>  			   qcom_snps_hsphy_runtime_resume, NULL)
>  };
>  
> +static void qcom_snps_hsphy_override_param_update_val(
> +			const struct override_param_map map,
> +			s32 dt_val, struct phy_override_seq *seq_entry)
> +{
> +	int i;
> +
> +	/*
> +	 * Param table for each param is in increasing order
> +	 * of dt values. We need to iterate over the list to
> +	 * select the entry that has equal or the next highest value.
> +	 */
> +	for (i = 0 ; i < map.table_size-1; i++) {
> +		if (map.param_table[i].value >= dt_val)
> +			break;
> +	}

Minor nit pick:

for (i = 0; i < map.table_size - 1; i++)

No space is needed before ; 
added spaces around the - operator.

> +
> +	seq_entry->need_update = true;
> +	seq_entry->offset = map.reg_offset;
> +	seq_entry->mask = map.param_mask;
> +	seq_entry->value =  map.param_table[i].reg << __ffs(map.param_mask);
> +}
> +
> +static void qcom_snps_hsphy_read_override_param_seq(struct device *dev)
> +{
> +	struct device_node *node = dev->of_node;
> +	s32 val;
> +	int ret, i;
> +	struct qcom_snps_hsphy *hsphy;
> +	struct override_param_map *cfg =
> +		(struct override_param_map *) of_device_get_match_data(dev);

Like I said before, no explicit conversion needed here. also it should be
declared const like below

const struct override_param_map *cfg = of_device_get_match_data(dev);

Thanks,
Pavan
