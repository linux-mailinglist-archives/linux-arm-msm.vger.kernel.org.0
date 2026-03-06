Return-Path: <linux-arm-msm+bounces-95764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLZeBIOuqmmLVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:37:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6879F21EEB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6A96304408A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 10:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A51933B6D1;
	Fri,  6 Mar 2026 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUrNjmir"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37C92ECE91
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793282; cv=none; b=MDZRQQgskQErbwOmPmOXpRJq1qq6z/bS3hGRoIBLqn/ahNdQDJmDkN9RuOHESIBkZdyQgaH2tg3JEkksFr/8tygHFMd22DPsdZG2FWaEm0tZ0oEFQkIkGZMAaeM21pN/jcDIbU8BzWUbbR+7pNu8K6z8vz9T2MfK/lPO1D6yJ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793282; c=relaxed/simple;
	bh=+zOzOlL8vyWgdMGmYx4ROrBCU7Rz9pYzTFon1zhtWeY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BoiTkoVn9K5uj7zRHgJOUwnSXuOZ5sFGig64a3xQmrx9vINMhl+PN/txK5+V8Pt+H5u4LGEB4Qdl/KBiwI6GZZ2QZrs+xl2PMVXi6agz1kWx6YS8rT6hDUNaZARQqtCdRBK2wAvefya2V6qxzYYMJ+TO68urgQORhT4oDXbMN3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUrNjmir; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so109487025e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 02:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772793279; x=1773398079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkkHpa9La9cb+M6Z0UUZsGUfrfqDbpK8tOGQLDZgWkU=;
        b=kUrNjmirc7Ze9CBsa1idBE/jpAukZup7OAaHTupOoEV753ZCazl3HpeiXnMrkeMMus
         g+ZS3p48AYw5i8ua98R7k81FDkdAim+XD3vzlR84ZVSougLrqVHb97bMe04ciubVHBb5
         p3vNGV358IUse8AleXFjog2y4ti0DyJAYKnvzzLHhf9BFHyYX+ULxhwC2sBeGN/R5OaT
         6+ThZbMvH2I5uloY9WUDXl/TC+8fXJgM23mCDmP7wErH6oVVq07KftDPl9Qa+ut/d/+a
         4nqeGMp8OK9z75392+SrREYpvZFbOC8y2EP6KcXfmelQRbtFXnDIJCaf33ulNOgovJbu
         3jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793279; x=1773398079;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkkHpa9La9cb+M6Z0UUZsGUfrfqDbpK8tOGQLDZgWkU=;
        b=VHxLYAh6c0rKGB+q3z7tluZSd6nBVNDxrGqZHQPMvJ/VnblkUI2sRlbQ8j9ZP3I0D+
         3HiaBxSCu0/0oudzMYqBpBTQHBHJXM0JD/lDfDTbss7vFyO8dx4ToF9Y4YtZ1wnAshC5
         kDHL7Rm/3JuAk8E99LXwnqXuD7dg/HBfgIk6pFzldohguTpX5xvriztd9HvFm5ckrmJ+
         MJto7hDr4LXMr/0gAPHluiU1p1ODUzda9rYsrNCatW57Af7TAPZZlUHyMt0Xf1JfKe7x
         zzIcx2MFs/KauIytq3J6gtWutpR2ZQrCCtiL8MYNdH8O10VfkPTsfBWUUybAhS1xBLvk
         e+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQOh5bJikKFFsICUAROs8p3X2wXxh+fIsBcfojBBNWZeIPILk2rkfohRPqair/Jx4Tja/c9cW2CSTuJdLv@vger.kernel.org
X-Gm-Message-State: AOJu0YzObC4l3qAP7/63DAl4homkt6qoSBszm+19Se7hBhLlNg00sqep
	aidtfuuRb1OweodfXCy56sxWUaoj+FW9MqMF5/fdiKG+baDJxI0VmkkHI+/J+1xRGT8=
X-Gm-Gg: ATEYQzxCiePQ8zDSkiGzZ70hydY/QZPkeyiuaBlpUINuMQSedrBEsEBYjmsUVUmsNDd
	PmiYMElP6uFt84D9lNEaeyo7gnWlTZJAgnxTjh0Ja9O3zEkCbSfXO23cNxE+EbAEAU9UjzPr+Pi
	sv5ZfD73HkmCr+6v+bJ46RtjeH9CR3H/dRLDkdNW0Ta/ct6sNtifPRCTSdE1MDsL7bN49iBrgpH
	h2Qbskj+g0Y0MFj8xcPkTC1wAifvirb54B2jvVbj7E8JjKE8toVs7zA8Z9T1llX/rXz1b2cAYRX
	dJ/t+4UZ+gs23/PycyNF5ITtTHCudW55RXVVR8ofMR5kh8c4ji3XUoJrzSkopfgBpa20fRIJKHO
	Tlzy6uUEsLm+IjBs47Ikjp1GMxuEIraJvQLekhapn9o7o9app+BMlSRe013wltXrzPyfV/GHbPK
	Jz4C77/2jiwrNOMSm43vX75DhwZxLeoCLguJw5Qbg8YdIMHcyXpWsX/gi795w9RzRJO/Ws+Qjkp
	5Oo
X-Received: by 2002:a05:600c:8184:b0:480:6999:27ec with SMTP id 5b1f17b1804b1-48526930cdbmr28598765e9.13.1772793278683;
        Fri, 06 Mar 2026 02:34:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95? ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686bcesm39742425e9.7.2026.03.06.02.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:34:38 -0800 (PST)
Message-ID: <fb75023e-8fac-49c1-a8b7-2eb8b70fda3e@linaro.org>
Date: Fri, 6 Mar 2026 11:34:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/5] phy: qcom: qmp-pcie: Add PCIe Gen5 8-lane bifurcation
 support for Glymur
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
 <42a9dd4d-eb96-42c0-b836-dcd7cb9405ff@oss.qualcomm.com>
 <aaqdv7Zx5AODzg6P@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <aaqdv7Zx5AODzg6P@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6879F21EEB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95764-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/6/26 10:26, Qiang Yu wrote:
> On Thu, Mar 05, 2026 at 10:14:05AM +0100, Konrad Dybcio wrote:
>> On 3/4/26 9:21 AM, Qiang Yu wrote:
>>> This patch series adds support for PCIe Gen5 8-lane bifurcation mode on
>>> the Glymur SoC's third PCIe controller. In this configuration, pcie3a PHY
>>> acts as leader and pcie3b PHY as follower to form a single 8-lane PCIe
>>> Gen5 interface.
>>>
>>> To support 8-lanes mode, this patch series add multiple power domain and
>>> multi nocsr reset infrastructure as the hardware programming guide
>>> specifies a strict initialization sequence for bifurcation mode that
>>> requires coordinated multi-PHY resource management:
>>>
>>> 1. Turn on both pcie3a_phy_gdsc and pcie3b_phy_gdsc power domains
>>> 2. Assert both pcie3a and pcie3b nocsr resets, then deassert them together
>>> 3. Enable all pcie3a PHY clocks and pcie3b PHY aux clock (bifur_aux)
>>> 4. Poll for PHY ready status
>>
>> I think we never concluded the discussion where I suggested the
>> bifurcated PHY may be better expressed as a single node with
>> #phy-cells = <1>, removing the need for duplicated resource references

DT requires strict hardware description, no abstraction for HW, so if there's
2 PHYs, then add 2 separate phys and reference them from the PCie controller.

On platforms where you want 2x4, then add 2 pcie_ports using 2 phys, on platforms
with 1x8 a single pcie_port with 2 phys.

Neil

>>
> I understand your suggestion would look like below. I agree that the
> unified PHY approach being more elegant from a device tree perspective,
> provide better DT flexibility and eliminate the need for different
> compatibles and dupicated resources between 1x8 and 2x4 modes.
> 
> However, this will include implementation complexity to phy driver.
> The driver would need conditional logic to selectively enable different
> clocks/resets based on the PHY parameter and maintain mode-specific
> resource arrays. There's also the issue that assigned-clocks
> GCC_PCIE_3A_PHY_RCHNG_CLK and GCC_PCIE_3B_PHY_RCHNG_CLK will be set before
> probe no matter which mode is used, even though in 1x8 mode or only one of
> them is actually needed. For pipe clock outputs, only pcie3a_pipe_clk would
> be needed in 1x8 mode while pcie3b_pipe_clk would be unused. For
> powerdomain, we also need to add additional logic to attach and turn
> on/off them.
> 
> While these challenges could be resolved, I'm not sure the benefits
> justify the added complexity.
> 
> pcie3_unified_phy {
>      compatible = "qcom,glymur-qmp-gen5-pcie-phy";
>      reg = <0 0x00f00000 0 0x10000>, <0 0x00f10000 0 0x10000>;  /* Both PHY ranges */
> 
>      clocks = <&gcc GCC_PCIE_PHY_3A_AUX_CLK>,
>               <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
>               <&tcsr TCSR_PCIE_3_CLKREF_EN>,
>               <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
>               <&gcc GCC_PCIE_3A_PIPE_CLK>,
>               <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
>               <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
>               <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
>               <&gcc GCC_PCIE_3B_PIPE_CLK>,
>               <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
> 
>      power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
>                      <&gcc GCC_PCIE_3B_PHY_GDSC>;
> 
>      resets = <&gcc GCC_PCIE_3A_PHY_BCR>,
>               <&gcc GCC_PCIE_3A_NOCSR_COM_PHY_BCR>,
>               <&gcc GCC_PCIE_3B_PHY_BCR>,
>               <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
> 
> 	#clock-cells = <1>;
>      clock-output-names = "pcie3a_pipe_clk", "pcie3b_pipe_clk";
>      assigned-clocks = <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
>                        <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
>      assigned-clock-rates = <100000000>, <100000000>;
> 
>      #phy-cells = <1>;  /* Parameter: 0=PHY_A, 1=PHY_B, 2=UNIFIED_8LANE */
> };
> 
> For 2x4 mode (independent 4-lane PHYs):
> &pcie3a {
>      phys = <&pcie3_unified_phy PHY_A>;  /* PHY A only */
>      status = "okay";
> };
> 
> &pcie3b {
>      phys = <&pcie3_unified_phy PHY_B>;  /* PHY B only */
>      status = "okay";
> };
> 
> For 1x8 mode (unified 8-lane PHY):
> 
> &pcie3a {
>      phys = <&pcie3_unified_phy PHY_AB>;
>      num-lanes = <8>;
>      status = "okay";
> };
> 
> &pcie3b {
>      status = "disabled";
> };
> 
> - Qiang Yu


