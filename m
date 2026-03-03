Return-Path: <linux-arm-msm+bounces-95097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGWyGlqzpmk7TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:09:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F661EC694
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 169DC301CABB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BB138F653;
	Tue,  3 Mar 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRw8wAhg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51180391835
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532469; cv=none; b=YJ9hNY5nG7BncztsLjbOHojs/ujxum10Gf3qXHUhj03oQHVLPlBeRYTX5sPfhREKCdR+qlIwxq5RkuMH3kHRBijyzv3oXxLnNcrj0zvqrOIp4k/qeC7f7PYYkfJK95dAdmn0fCAcuHi4sDnAjm4QNOnR7IPd8MW2Yx78ikBSnsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532469; c=relaxed/simple;
	bh=Rjq4yiNDsrY2Wz980m8WNISCg1KOiPNISWFecbFsP+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FA3XDLaZg/5sgFF01mKvXilaimeiaFSLXUc3aZeIae1pLl+Ro3kCd+ZlDjO8CzJvWRMt1FRJPpMHNhqY7nNhM/I5lEzuqRAQL3umRCPhzvDgtDhMZcL4t8Oh2LpDYuEla8RwQYH5E3smMJvzJFiwx+RPE9rhW4kkLpvDW7GQ49c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRw8wAhg; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b78b638eso1999570f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772532467; x=1773137267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcR6OUu6uf8GtTbYsci0TdXmSPbbJEFXyuqQd9onRJ0=;
        b=iRw8wAhg6FXDcL4/esOE5WLvHaM09NEYW7J4ky+im66qLRsJCfy4g0uClmyc8XWSSd
         nBUG3J4yziKdrW1n8z8jkiPffddoAczXSW+qlrfgnGT+mnzovEXMtUo+d0RRhS/w+oSW
         arB1IaJ6hJnrob0QNj32fRDSiKteCRKWb9vqwbfv6jz59IbKKS73plG7nFUu7qZXrfYB
         Eyv3NjrpjTXjLz2SIYfomu07OkOjunFYekEAaCXdBVamxxVW/jnosa8ExWvolrLnvctH
         1w96Ua8wXrHUqUZ8S1sXTOVeqWygWB4/ddeMLMCXRm1W1zhxb4nRlIDmrIzzOEoLhOGK
         bZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532467; x=1773137267;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcR6OUu6uf8GtTbYsci0TdXmSPbbJEFXyuqQd9onRJ0=;
        b=Rvx7FHwKF+xMoYAKb32oS49otZiWJuLrSBrerJEZ4xQUakyY8Ku1AcGb/QfCg04qeA
         g/R+Ceblb15AZ/O0KkSHD3vUHQSeX3Kmj4hBGWtflEqmBr6mqTT2R3eL2Hh36myBKhNj
         ly1ToZLA7PDm0MF9DxC5tlbSYFCpgjvlmYKvKDjNW9DgCl9Fy+UDdSLOjWrK3uZObaOP
         rItmOS6v8n9ZDZdPAi1voPGkdstSZAEuzIisQKBP14SXykqvx1YsfoQo2CkrXBimRiEb
         MyzuVSFH5hEtN6/8LDZTZcXiY+7kUZuD7CCV/YjKUFj/s5OZv+WQ4ZvwGpRydAp+0YQF
         R6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXXI4xUSihksuW7o7st0Gdw+2/7sj2eKsBqkADTtIq6yYTr4/ksnzatw4OG/lXzGHnLy/5Nec3FecJL4BsZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxXOQNy/HALAY+Z9yyjyP8VDJJGItp2V0CQfBTO5ZE1RDCNWUgj
	BhHhFFtj3ZmKki2+ivp+gEqEKZDrZMnqpzyXRCwGofatwJdQo0TBIZSl7afFJIb3/Lg=
X-Gm-Gg: ATEYQzyF5l9nnVlFwbqWmryQLxp2YMYUFlEL6w83mW/0kxWf7VJbTzEdO2CTMAT8WAt
	5wrkh54PqAUtuX/fS+a2/lP6PbcuiaHSpucYxW9Qw915CjbHzQNJ5vS88yKp6Rck2syIs/4bTc7
	baJVa0sVXYar/vwyvcAUSYnCHg1W3Y87H+sPKfLd8Zz52TorlITb6yk5f+5gQVEhIEKHrB41TB3
	ETsuUFdma+3UOA0TaibsWFWzRUmSNpaamYB34Jn3Tu0089lBO7L6MKGgHo1ZZzLxV+VpM0Zxuqc
	oefzDjb8upmNd9cXnfsv7U0ABA1xNS1biSDxGgHFmRBhmTfjUiP2MQHB2hRKnM/tkZI3Jtmh0Wl
	NKXy3lX98kYHfVkb7aDCOPh4N04o0gB/nSRMFXC+BnvnFy6cTObAp7NIs0NIiFLhEtLa4akNSKY
	JdYOxNdgmioGlCNGYVrf74+0T2pR66bvZ/0m0/7WIF/5Z0OVwnA/pn9NXNT3D5FEP1
X-Received: by 2002:a05:6000:288e:b0:437:7010:1cf5 with SMTP id ffacd0b85a97d-4399ddd872emr27275843f8f.5.1772532466420;
        Tue, 03 Mar 2026 02:07:46 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm14840871f8f.38.2026.03.03.02.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:07:45 -0800 (PST)
Message-ID: <1fca6458-761d-446f-9223-7875a4a66f4f@linaro.org>
Date: Tue, 3 Mar 2026 10:07:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 9/9] media: qcom: camss: Account for C-PHY when
 calculating link frequency
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-9-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-9-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 81F661EC694
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95097-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Ensure that the link frequency divider correctly accounts for C-PHY
> operation. The divider differs between D-PHY and C-PHY, as described
> in the MIPI CSI-2 specification.
> 
> For more details, see:
> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c   | 11 +++++++----
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++----
>   drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++++++---
>   drivers/media/platform/qcom/camss/camss.h        |  2 +-
>   4 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index b50b0cfe280c1..2fc17c6a15e2e 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -534,18 +534,21 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
>    * csid_set_clock_rates - Calculate and set clock rates on CSID module
>    * @csiphy: CSID device
>    */
> -static int csid_set_clock_rates(struct csid_device *csid)
> +static int csid_set_clock_rates(struct v4l2_subdev *sd, struct csid_device *csid)
>   {
>   	struct device *dev = csid->camss->dev;
> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
> +	struct csiphy_lanes_cfg *lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>   	const struct csid_format_info *fmt;
> +
>   	s64 link_freq;
>   	int i, j;
>   	int ret;
>   
>   	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
>   				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
> -					csid->phy.lane_cnt);
> +
> +	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp, lane_cfg);
>   	if (link_freq < 0)
>   		link_freq = 0;
>   
> @@ -703,7 +706,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>   			return ret;
>   		}
>   
> -		ret = csid_set_clock_rates(csid);
> +		ret = csid_set_clock_rates(sd, csid);
>   		if (ret < 0) {
>   			regulator_bulk_disable(csid->num_supplies,
>   					       csid->supplies);
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 938600f3defe1..ea9dd2cd2e740 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -143,9 +143,8 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, &csiphy->cfg.csi2->lane_cfg);
>   	if (link_freq < 0)
>   		link_freq  = 0;
>   
> @@ -270,10 +269,9 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>   	u8 val;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, &csiphy->cfg.csi2->lane_cfg);
>   
>   	if (link_freq < 0) {
>   		dev_err(csiphy->camss->dev,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ea0c8cf3cd806..4c13bae17007e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -32,6 +32,14 @@
>   #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>   #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>   
> +/*
> + * C-PHY encodes data by 16/7 ~ 2.28 bits/symbol
> + * D-PHY doesn't encode data, thus 16/16 = 1 b/s
> + */
> +#define CAMSS_COMMON_PHY_DIVIDENT 16
> +#define CAMSS_CPHY_DIVISOR 7
> +#define CAMSS_DPHY_DIVISOR 16
> +
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
> @@ -4280,20 +4288,24 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>    * camss_get_link_freq - Get link frequency from sensor
>    * @entity: Media entity in the current pipeline
>    * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @lane_cfg: CSI2 lane configuration
>    *
>    * Return link frequency on success or a negative error code otherwise
>    */
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes)
> +			struct csiphy_lanes_cfg *lane_cfg)
>   {
>   	struct media_pad *sensor_pad;
> +	u8 num_lanes = lane_cfg->num_data;
> +	bool cphy = lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY;
> +	unsigned int div = num_lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
> +						     CAMSS_DPHY_DIVISOR);
>   
>   	sensor_pad = camss_find_sensor_pad(entity);
>   	if (!sensor_pad)
>   		return -ENODEV;
>   
> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, div);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6d048414c919e..67be42b4c9174 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -163,7 +163,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes);
> +			struct csiphy_lanes_cfg *lane_cfg);
>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>   int camss_pm_domain_on(struct camss *camss, int id);
>   void camss_pm_domain_off(struct camss *camss, int id);
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

