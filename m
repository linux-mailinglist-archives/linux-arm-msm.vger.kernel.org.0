Return-Path: <linux-arm-msm+bounces-76702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65384BC9A2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AB873B7A2F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8402EB5A3;
	Thu,  9 Oct 2025 14:52:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.65.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCE62E8B71;
	Thu,  9 Oct 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.65.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021533; cv=none; b=Bk00c8PqwPHGO2ezzePsB2/iJgJrjMMIqXeHTGw50ifgr+MYJg791yaYXkJzC004hzrtk0PViBN1muKdy6lzb+bxbDTuaMOCdGdGt5c+VG+FOxzfhui3QOn9EhitO26bfFIg3SQvoLa4e0qdSkTBC+WpsOvV3zEjibvXMK1GYGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021533; c=relaxed/simple;
	bh=H29R5aPeBqWFuXv7A6Mu9K8ClRuF7tT/UIJ3SJwY76M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qox+Hp2GwfHCTGI4B78YaKjkmLGENgzj0cIsmPi0SM5rgLrlH4tZN1MoubJwNI6soN3zFOaCs543rCgUxsctN885U6LEvzrWYxU8WPoHtxn9r2kK/MZJescUOKoDwr+s3N5njtAHI94/ytoEMoxZFVQHXzN7Q2CyvOczl2AkT2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=114.132.65.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1760021508teed882b4
X-QQ-Originating-IP: H3oCVwaNOoE4vRYRwZpNRzAtVOKNTGpl6VBf5QRc/60=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Oct 2025 22:51:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7343424782769660848
Message-ID: <60E11B9D37CEE163+8cf864e4-579f-432a-a507-9711d03776ed@radxa.com>
Date: Thu, 9 Oct 2025 22:51:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org>
 <20251006-topic-x1e80100-hdmi-v5-2-c006311d59d7@linaro.org>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20251006-topic-x1e80100-hdmi-v5-2-c006311d59d7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M3vv73qU6a4u5A/47SDlK52SJzdJtgQm8xb5MsIvgfu0bYy3hkNJxRYh
	NRsFl+VwV8UQ0QyU1Bf7bVDwdnrV5DH/Aq4/vRz1bbQX88+eKeLksWBdAaPHwt6g4JIz77q
	tvOreEQFseXqscmds4aS8YTQLScBV5EvoBfIe/zheXuUBedt4dco3c36yTHjvEtijb3L0as
	aHSkZWGe/M3m7UhFlK/+J7H8r4K6LI4QTOCa6XX8jFIeZ8WVA06X/vzXFcytIsKSFbrpDsW
	C8Chfv2k4OeolMFxgGBrDnaGQhgK55TaIlAgvgrQtR7m2it5z0RX4T6xiYOCikV+jWooaTu
	neFZVBEULOjhart8zKfRALHHrbdGaLt4qK8Fpo2mH93+qHOjhFzKLausgzXW0Pe/KVZou2c
	z0W/eP0DeoQfSD6jQbHXgCGLrI+yoy1yYZMWmwrZ5oj1RRlmZ9CGXo9F0YMutqEHesqmzkd
	wjHtuXU3DdK5jvVAoYQrx2uE+HZtzYO0PiejSr/WptpUfCIDzCDS2+EOkaAA9LJGHbMYiOp
	YqpcS9CLt1e9W3E3QNKrRVe5eZup3HW9O3+j/h3nj5OoHz76Q+i/mBfSHy9ZlidHX+Xx5Gj
	YylDqIuAb5vZUmNZ74QeLEXxKJn8B9jCDrnMxy+MU/Y859WthjGLWCxoVDg6yapDfSZmR2M
	u7P1NzYRF4SQKZnGL1aJouQjBvIbc00L2aWMMWXFfddvEofkm7UOYEa1HpEFT+xbTALG61K
	g3GyzMqkhzIGjq+qnW2CtJ/gg9cEadJlPYbbPm00xcibDhSy8vm/oguN6liYStRIYjJApkl
	D2E9cgg7bxiaZSvr0EYn6a1sTOuIdsWszxB4CitDIVn/prl8sH7T5+EsluLWGsfgN9O0xXI
	k4Vjm8L8KmmfqQsul/ARC/Wir/25rutu5snYILJzw9cbhi1Z9oBpxld9/DecH/1pzjHO9Iu
	TrDku2sz+PtTpgvdM+wuFv71GA2rBcLEq7xfdYhlxEodMl0jTA8cNTOIX2VhbOLzCPBggVO
	KlHNCZRlEHwHU+YQOf
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On 10/6/2025 9:55 PM, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> Get the lanes mapping from DT and stop registering the USB-C
> muxes in favor of a static mode and orientation detemined
> by the lanes mapping.
> 
> This allows supporting boards with direct connection of USB3 and
> DisplayPort lanes to the QMP Combo PHY lanes, not using the
> USB-C Altmode feature.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]
> +static int qmp_combo_get_dt_lanes_mapping(struct device *dev, unsigned int endpoint,
> +					  u32 *data_lanes, unsigned int max,
> +					  unsigned int *count)
> +{
> +	struct device_node *ep;
> +	int ret;
> +
> +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, endpoint);
> +	if (!ep)
> +		return -EINVAL;
> +
> +	ret = of_property_count_u32_elems(ep, "data-lanes");
> +	if (ret < 0)
> +		goto err_node_put;
> +
> +	*count = ret;
> +
> +	ret = of_property_read_u32_array(ep, "data-lanes", data_lanes,
> +					 max_t(unsigned int, *count, max));

I think this should be min_t instead of max_t.

With this fixed,

Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

