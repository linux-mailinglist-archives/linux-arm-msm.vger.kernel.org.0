Return-Path: <linux-arm-msm+bounces-113508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UI/EN2FWMmo/ywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:10:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF85697727
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:10:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=GCoTvWIz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113508-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113508-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FC7D30086F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 08:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4763B3C15;
	Wed, 17 Jun 2026 08:10:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DE5313539
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:10:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683807; cv=none; b=M7nZZxG6GRTJEkGnA8f216KvGLru0rUWuZ4XGtdhzGFhmCaBtDxEmbETlHVE0Cr9yiKMQA7eX6y2+4jcDeyIC+DE6U0Hcao2e+6Ey+IuCIfVC5X1erSeb4Ui3xE3qX8c5UiS3CrnaK+EgoSJgD7qKTpxUX1EeTv46uH51a93EmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683807; c=relaxed/simple;
	bh=xwvy2ZcXRdQVNsdvURg5djpvEAjHUGBfx+ulYsnHkXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B12uIMifI2+ESv2AnBuZ7/yzjQZ8jaEgHI76jdj0Z+MsICDRwkZcCmGISY+AA58YhewCy4g5mt7dEgrpMnv2NzPgzPZI6eeaC0pspCcQQCEijxGiqmMpSlLw5j6dxnwvj6mFGDpRJSWRToulIjW2CSI2WQP+WkLC6T8iV1MwdaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCoTvWIz; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45fe59255beso3054639f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 01:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781683804; x=1782288604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJVNCdcKD4gEI2MuivW/VCnurJJvnKmFjFb94f74ebs=;
        b=GCoTvWIzzLU5hSaEuQ6lsrqcRPFAfOWfFU/o2l9cM4bsZ+o09Vcm8nfgK7fYlJDhvh
         pYjmXZgU+71or1S68XsgtCjFsngKByfdU83dGGYCZZTBqTrQzoB0fZ1zvhPfURBsYqsK
         Wk1djoG3eaBSTvtxFEpTMKjjRrXR9Ckl7ZiTq06AN8nznmxwNAQo9LcUyZQjNZ9PYXJd
         2Da/qfuDlMC7tpbyjWW/XK1kfSkCTsgsQ3+erzstJRX2I3nrz1ofdTXSMp/jstdosZfR
         LwYsGZvdO4A12fu+An3r6lNFm7WPf25EbS0YqRVnvuyRSjce0JF8g02IPGb8e+kvCN3x
         hPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683804; x=1782288604;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJVNCdcKD4gEI2MuivW/VCnurJJvnKmFjFb94f74ebs=;
        b=KpAZCONaZKzRlGAAl0IgI24cQLTET0+lsc/hRx3yYH54At2VP3mEkgO3ryH/eDWY7R
         6di/usi9FeB6+9DwBIqVMhZaOnNOZfY2aHXcguArtteASAdGKC78GcUAT+ncRpM+mi5F
         ZV/h7RZM8p/NxFmz7hotWv/1vmc9D3JGg7q29r7Qm8P1fZXUM+aRREyga0SGeRpcjbKl
         I2VuwClgwFj6E255MN4XNIheS59n/wacoZ6MnGTZ/OfR2y45zYl4mTBsKIHlkdTzInsY
         Jb04aLqKw05mzuMAXW6W+TKNiiXIwAIqb9hzv3YDhNMv8fbpNoM/2lwuUlYoDkpDxPmf
         v4uA==
X-Forwarded-Encrypted: i=1; AFNElJ91yOmUYVRcI8gEwa/wqhTlDHf5YvDoGWn3g77ijjZ4Kj0dg9yIehm6Ds/zJiPtRZ0JpPZhO8QzXKWUGFPj@vger.kernel.org
X-Gm-Message-State: AOJu0YxIGs1VXd77UGoHNR4RNm7ijHG1LGYPOx2LqKwSOvKHmJ3RZCWt
	UlQBt7HnujYgUhBBJcrWnyyLX3/f5GUZeIEH5BNR/eDX/uPy/uMrE/X0bPlH2mRYJPk=
X-Gm-Gg: AfdE7cm3v+MF+McFwe0xekonWCg6verRCOioCCOcsAEcBZRgL4R6YEZymAlFZwO3S/v
	Tow45Xm8GSMGbmB0D2msTdjWZ1IBJbXOx0AG1PtojIUPPZtfJxGjQoLT4d4mhfsb2L1Eu2BEm9i
	WpcBI4EL9s/3cm9LF4CHMVPRTp+LG5FnI95+9x2NcCSb3e+9th3IlG9L1TI2lSpM7KPqKY7+lr3
	rMZc+xFYhbgEV4UFpWGfcA5R2WQbdUAgE1kXR5WEhhVZUsC3Ce7+2bY8xf5hq0skgk4Mh4Ysoog
	NkRU/EFnCX9CXUr/3Mp5TADGllVeGAkEirFaYjzQ4TOCaFmoVvYR4r99tdz7iLYoQ8BzjaGVc3d
	sr23dvFMtjGCbYE+RsdFyDcF7GALutRfcX6cT7mqSWz9fsTgwUeOC8b5qQ7Z9DwT7yxkoxUoObk
	dHUMa3MpHivR8hQRgBZNvs2g==
X-Received: by 2002:a5d:588d:0:b0:45e:d3aa:e45f with SMTP id ffacd0b85a97d-462416a2b3bmr4312960f8f.28.1781683803754;
        Wed, 17 Jun 2026 01:10:03 -0700 (PDT)
Received: from [10.12.4.106] ([212.133.41.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm53999576f8f.11.2026.06.17.01.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 01:10:02 -0700 (PDT)
Message-ID: <16314a15-2891-475d-b6c8-591af87f1330@linaro.org>
Date: Wed, 17 Jun 2026 10:10:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/5] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>, Saravana Kannan
 <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113508-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:from_mime,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,vger.kernel.org:from_smtp];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EF85697727

On 6/16/26 23:09, Brian Masney wrote:
> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
> 
> This series:
> - Adds a generic clk_sync_state() callback that's initially empty.
> - Adds a generic qcom_cc_sync_state() for qcom SoCs that need to
>    interact with the Interconnect framework.
> - Converts the 7 qcom drivers from using icc_sync_state() to
>    qcom_cc_sync_state().
> - Implement the framework-level sync state via clk_sync_state().
> 
> This approach maintains bisectability.
> 
> Changes in v2:
> - Split out clk-cbf-8996.c into it's own patch, and don't call
>    qcom_cc_sync_state().
> - Clarify comment above call to dev_set_drv_sync_state() about
>    the -EBUSY.
> - Added Tested-by from Jens
> - Link to v1: https://lore.kernel.org/r/20260603-clk-sync-state-v1-0-457120eed200@redhat.com
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Brian Masney (5):
>        clk: introduce stub clk_sync_state()
>        clk: qcom: common: introduce qcom_cc_sync_state()
>        clk: qcom: convert from icc_sync_state() to qcom_cc_sync_state()
>        clk: qcom: cbf-8996: add clk_sync_state() call
>        clk: implement sync_state support
> 
>   drivers/clk/clk.c                | 76 +++++++++++++++++++++++++++++++++-------
>   drivers/clk/qcom/apss-ipq5424.c  |  3 +-
>   drivers/clk/qcom/clk-cbf-8996.c  |  8 +++--
>   drivers/clk/qcom/common.c        |  9 +++++
>   drivers/clk/qcom/common.h        |  1 +
>   drivers/clk/qcom/gcc-ipq5332.c   |  3 +-
>   drivers/clk/qcom/gcc-ipq5424.c   |  3 +-
>   drivers/clk/qcom/gcc-ipq9574.c   |  3 +-
>   drivers/clk/qcom/nsscc-ipq5424.c |  3 +-
>   drivers/clk/qcom/nsscc-ipq9574.c |  3 +-
>   include/linux/clk.h              | 14 ++++++++
>   11 files changed, 100 insertions(+), 26 deletions(-)
> ---
> base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
> change-id: 20260602-clk-sync-state-c0539c5530f4
> 
> Best regards,

Just ran this patchset on the Amlogic boards (AML-S905X-CC, AML-S805X-CC, BPI-M2S, BPI-M5) in my CI lab, and it behaved correctly.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on AML-S905X-CC, AML-S805X-CC, BPI-M2S, BPI-M5

Thanks,
Neil

