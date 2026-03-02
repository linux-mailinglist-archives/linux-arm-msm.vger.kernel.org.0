Return-Path: <linux-arm-msm+bounces-94824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHoOIZdcpWlc+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:47:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF651D5BD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65C593024502
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEE5377036;
	Mon,  2 Mar 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qnwRjpUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22486376BCC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444720; cv=none; b=gV0keF73ZBDJ6aci1nNQDEsyCFTcn1Yw4VjOUh5v/2tyZEiRe91WCa7YbvBNRSn3bSJwgVDe4Vqb+xEeAa+qEgjpfmLiHuEYn+KBI8EY59vNjTbPdjHu/Inrcu5kU8tFER9Gc4hDdSEj+SEBDTx+n5bHhKiQDRMn0Eb2x3LOyTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444720; c=relaxed/simple;
	bh=91L1A0CJXI5hHlouKioR/+nFr1fv+JF35vPLCpBnZWg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=m23lU/r+eGzwcVoVfFu8AerevQHzBBN86K7UzzCSM4lDl1bJqp7pgKZPdIuGSbpS/7nBpJxWSzNXGSJqTQp8kZitL/zeNzqeY0P60epTMzuvXI7JfSmI92aEaDqhIbZosIUB6Qz2HU55OhMpf382aoeosMtnctkVqBCG/h0gxUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qnwRjpUy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483a2338616so26427575e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772444717; x=1773049517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8XV6vWrdSfBIVmKpoz6leHiVZcyEwRuzmhHYYW85Zk=;
        b=qnwRjpUy8lKhOA35iYeE+ocfwSoH8UsmqNcM/b1bhWUTm/93/36eH39UjL1eQubTlM
         qu870LTw7BAUX1np4D7dXagy4mNfLL04Zb+RahKR3fWJjZ7tCyQiBJiJFQCNZcVlpqfZ
         9/hjyHCEhm0N6SIOY/1A+U7vcjJlV/waTpwJy08FZWMufQuf8yBvGpKGeCmwAEPT7UIJ
         KiD5mHCYHvYsPZw+l8n1iicGCNTGvNeF4/o96eXvI2PNNK/WPAQ8DuXy6FslAlaP92+0
         Cr5fTXW1stc16e2Nn7C7OrpfDarG3nQJSwtp5pLiK/hGgOeYKo9lbr+hRLZdd6mv7JZk
         zYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444717; x=1773049517;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8XV6vWrdSfBIVmKpoz6leHiVZcyEwRuzmhHYYW85Zk=;
        b=CZQFDZ72LaiLnWSWRgDwo84IDDZvOigtwwY09Ys1V99xe4+KwwkwgJwcs3m+G86qG3
         6xEh8yINzRU32Ll4yptGx24kQpPtndgWZgXU0vTrcf2EhojBwG0hvfQCDDo0UOHislA6
         qYqveXvX/cuISEEMoX/dMYD0lWGtItCiDGKSUV+vnCCA8WEh51nU0wqF64HPdHcauIGG
         JQuEFaMsVHs5M1XFTj8iitsAPoVDPO3hILzk3HIOv7oZBkoRA4ieBkCfhpsOIie+a68d
         R7Brg2T/wAmO3dwUdgdRA7m7e53euCpP2pCQHnpwZMD+3wYvwXvhYPPfvpV/AIqIaasM
         7r2g==
X-Forwarded-Encrypted: i=1; AJvYcCUpRWKF/wNeSMLeieUSSoWkZjEm5Wer3jZRJeNIyvL+vJPv7EI3ch2SpI6y0BHTx6lD/hUqx+QzaTXtkcxT@vger.kernel.org
X-Gm-Message-State: AOJu0YyOmQdnEQLOUUX8nhr6IE2uvaEJkJQlsOpcfYtVv/yBRJadgNJy
	KIt6gQPDaFWJFG0iLjjW20Tg03heXeMrsW2BXJpu+c5d246PzH+JrYLNEBMnwAW3pNnKLfg9Bqe
	SfjKOXEahYg==
X-Gm-Gg: ATEYQzxpuxZcjEuooKrHfr1gln94QHi6qybfDiYzoGFc3JmAS9cRLvBfio5N3QdtPZk
	I1UI2KqaOYRUiFde26/MBWcHRboUQkFMeszCleQ4jbpF/dWMCLAYB+mhhfvz/BlP8SrhIwqAQac
	cC8y5cFzz8UX7AxHyUQnySsPJNDeFI5Jwi/c4bkLTxv2k3Au8m07rmoOWz3PtBX9H6fjVaXmpfZ
	DskRrefR4YN+X4rXXx5ntr3NATnIhTjcMzKURCKFkGWpX1ZwvWYxONcTIPSKXiEFHwth9KXVvFj
	QvjYRFk3tB9sfdoP0h7qkAIrBYQ5DPvV8eHfKqN8YrK5u4cf0RFqevz+MrgDEw0JZLZTIZlssRN
	1ntLUUURSbWgp1KxXVpe7Ft9umXz3kLJHqrzEG8C7x8P+aWsSViqUt8hnHTUcLgl6K9NJ/qmf1N
	LAkJJqEB4CnhIvFfYU1LBx63SkZrd3J2FnmXWmFQImERbO0nkzUL9UPIiEbY+Dfu7a6bmQsi31e
	vIWnycdimuScrI=
X-Received: by 2002:a05:600c:138d:b0:483:361b:deff with SMTP id 5b1f17b1804b1-483c9bb2c10mr203431275e9.14.1772444717283;
        Mon, 02 Mar 2026 01:45:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:c342:61e:309c:3478? ([2a01:e0a:106d:1080:c342:61e:309c:3478])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df90sm408400105e9.14.2026.03.02.01.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:45:16 -0800 (PST)
Message-ID: <7da9c4d5-019d-407e-9bf4-22994c801706@linaro.org>
Date: Mon, 2 Mar 2026 10:45:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Move pipe_clk on/off to common
To: Val Packett <val@packett.cool>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260228220634.22778-2-val@packett.cool>
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
In-Reply-To: <20260228220634.22778-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94824-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: DEF651D5BD3
X-Rspamd-Action: no action

On 2/28/26 23:05, Val Packett wrote:
> Keep the USB pipe clock working when the phy is in DP-only mode, because
> the dwc controller still needs it for USB 2.0 over the same Type-C port.
> 
> Tested with the BenQ RD280UA monitor which has a downstream-facing port
> for data passthrough that's manually switchable between USB 2 and 3,
> corresponding to 4-lane and 2-lane DP respectively.
> 
> Note: the suspend/resume callbacks were already gating the enable/disable
> of this clock only on init_count and not usb_init_count!
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> See https://lore.kernel.org/all/389ca5d3-a698-4dac-911c-39ba057e3d17@oss.qualcomm.com/ for more info.
> BTW https://lore.kernel.org/all/20260205160240.748371-2-loic.poulain@oss.qualcomm.com/ helped with coldplug.
> 
> v2: Reorder disables as suggested
> v1: https://lore.kernel.org/all/20250927093915.45124-2-val@packett.cool/
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 93f1aa10d400..28428a8d1192 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3691,6 +3691,13 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>   	if (ret)
>   		goto err_assert_reset;
>   
> +	/* In DP-only mode, the pipe clk is still required for USB2 */
> +	ret = clk_prepare_enable(qmp->pipe_clk);
> +	if (ret) {
> +		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
> +		return ret;
> +	}
> +
>   	qphy_setbits(com, QPHY_V3_DP_COM_POWER_DOWN_CTRL, SW_PWRDN);
>   
>   	/* override hardware control for reset of qmp phy */
> @@ -3768,6 +3775,7 @@ static int qmp_combo_com_exit(struct qmp_combo *qmp, bool force)
>   
>   	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>   
> +	clk_disable_unprepare(qmp->pipe_clk);
>   	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>   
>   	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> @@ -3871,12 +3879,6 @@ static int qmp_combo_usb_power_on(struct phy *phy)
>   
>   	qmp_configure(qmp->dev, serdes, cfg->serdes_tbl, cfg->serdes_tbl_num);
>   
> -	ret = clk_prepare_enable(qmp->pipe_clk);
> -	if (ret) {
> -		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
> -		return ret;
> -	}
> -
>   	/* Tx, Rx, and PCS configurations */
>   	qmp_configure_lane(qmp->dev, tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
>   	qmp_configure_lane(qmp->dev, tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
> @@ -3922,8 +3924,6 @@ static int qmp_combo_usb_power_off(struct phy *phy)
>   	struct qmp_combo *qmp = phy_get_drvdata(phy);
>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>   
> -	clk_disable_unprepare(qmp->pipe_clk);
> -
>   	/* PHY reset */
>   	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

