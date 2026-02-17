Return-Path: <linux-arm-msm+bounces-93200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP/qGPmLlGnTFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:40:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E685714DA50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DA5D301AF4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 15:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22FC332ECF;
	Tue, 17 Feb 2026 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bfnTCh/P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4D336B05F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771342820; cv=none; b=e/FOghgH85iYcEaMI0eoxeXVyqRuYpcFISv+AWi9WP272Fa/6G3sR/Td/CJfawxAcJaUa+/d477uhImuIROZWcpwWCwgMIsJMiXWJ10drCSFr+SM3gw78iLQrQPLiHyGPZjTO42v9ghPbQKPQ1TzMwCAKM9l0lqCl59RlrCGGEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771342820; c=relaxed/simple;
	bh=ay9Wt6Ibuo8nK54rsRjwtFVihyzfkYk8X1+hpdmItI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TeRGbhPCLtRJ+FoYGNLzN8fmjDHqCu0Odf7Seta+79+014KtB73qC6b89hJLb0igR7XTcqbtMxCUJhS5JCvo8Kue2lUQQ+uQkTVoFnk2dWgdeTWr2jp9THFdxWdXIZ7YIUa9Wg1WA2c98EUKeC8mwM1b63MSvG0b9/yKcdbH8C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bfnTCh/P; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-4359249bbacso4271952f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771342817; x=1771947617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkqHe1XyX/ctvoneyaOWC6ZPxkehSDSZz4eMTlKnIo8=;
        b=bfnTCh/PZ3P/sQPror+VmybRX2ljMM5Mj9G9jRAxj8+nxpT4JrOU1Ar4+RV08D3XcY
         N+TuQTY/R8S61c2tBBsh6HGYIZX6JR+8VAgEniWprqEj18kGYZGPXBXcWOtsikbns9Uo
         3/KbdI7ymNhV7wOroILIdvZTTIuD1MVlZ+LMkAHQBwTAk5sD7Xe1ofwvj/pUKLXtq9RT
         bJP7CiaV9Ddn3jbAmUp/k15ZW7GBexYC+OVz1rmcOHxkLdNXVr9n4jCRfYuagrSLyVx+
         +0MCqnHytKRo4SE8+rY3LQHySANcCP/1ab3c/BkmuIes7hI4EZPAvyfVKkVw6GanKFHO
         GR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342817; x=1771947617;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkqHe1XyX/ctvoneyaOWC6ZPxkehSDSZz4eMTlKnIo8=;
        b=Y3Fvy+mqTpewlNKx7y4mfB9wh568K3EE4u1zNs4Vac0ue8AzR7+dt+tYYQ2zyBwBs5
         2jr/iIxRJt7TZli4W7c0ISsIg9GS4mPM5i3cK3BGl5DYCwddqF/ZBLzmZC8dfORa9U2J
         7Pt60enZK4kGDxTMhiy8WwVTO27XToKZM67cTcTi1CLcmOETaPkgwOa50Ed/3ue83RTs
         jgcmDlWW97N53A4VEVeBu2CvxdcXKtaiiwfFXhT2pLW6BTXXBr4ZoyFjOKA/uNDjlFyd
         DHLjr6eF5DjGgiXtWoxohnZQZgsoVz3jMurWbQhUgt0hE2PyEz62doL96OTrLwW8I92W
         JX1A==
X-Forwarded-Encrypted: i=1; AJvYcCWCQF4Qq7Q/RmzMFWbXQXiEghCVZ0zVrtlsPErvzACaqRNt/+dLKC2/vGVGknlznfbYqftV+uB/oFFhLTMo@vger.kernel.org
X-Gm-Message-State: AOJu0YycmP+c0Nrg6mxVwzNc1uzvqLriHIG85TP3jPTl2oSPapJzbrVq
	oYHhLlDFnB02vt1xLdhT3CzJCh4Ez5DEBNOLwfwrCSptdmlGwgXrjZdKyqSIzUWD9UE=
X-Gm-Gg: AZuq6aL+cr37vUpDmqYgBM+QIoU9ROFlzFJ4aFpWSwThAidXfY72M+iWfF0K5/zNINY
	xA3oCZbB5cXBp5C4U/1YEoVb/FaK4gSwwkk0HemqlnuXKMT8gbg1Jxltr3YLR5fJE7aUi9rMel0
	gV8vpJVVaUQl8q2+nWMTWOKA6ERzFFxjof+pORy91Y4s9Z+ewfvRg7+oE/+MQ8qFW4PZfJ0OMo2
	V+F/uiiIhK5II50fAGIQvV0eZybh8d5D+ddjH5PyoOOGyQ8QfrvX19mlhoxIVXnkyS39hzEKvCg
	9yC+BFKBRT5LLbvZaFDMSXOa1WyHnpBQ79mG8JLX09ZUmhBEwMhHmVYV25L1a7D29YLB+X3RsnK
	S0qqnTkSSyKSuq1yXcOap3ObpaNi04916Q/yAUCuEhvhv+sbccDl7yRFSGbtLjveqAeQSNi0DGH
	2HIWUI/NhGIRePZ8sY8wmk1o8ULBgc/c09UPLOkauZBIwOPDya8rJKg18IkeAYZ3BTUzeNNGVHZ
	Tl/7DvktZW2cbOO
X-Received: by 2002:a05:6000:2890:b0:436:1405:3ef8 with SMTP id ffacd0b85a97d-4379d5da8bdmr24192213f8f.1.1771342817327;
        Tue, 17 Feb 2026 07:40:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:72a2:f5f2:e023:2a2e? ([2a01:e0a:106d:1080:72a2:f5f2:e023:2a2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad009bsm34212046f8f.39.2026.02.17.07.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 07:40:17 -0800 (PST)
Message-ID: <12f8346f-3df4-4081-a009-7a3ca83e2c36@linaro.org>
Date: Tue, 17 Feb 2026 16:40:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/5] PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
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
In-Reply-To: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93200-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: E685714DA50
X-Rspamd-Action: no action

On 2/17/26 12:19, Krishna Chaitanya Chundru wrote:
> This series adds support for putting Qualcomm PCIe host bridges into D3cold
> when downstream conditions allow it, and introduces a small common helper
> to determine D3cold eligibility based on endpoint state.
> 
> On Qualcomm platforms, PCIe host controllers are currently kept powered
> even when there are no active endpoints (i.e. all endpoints are already in
> PCI_D3hot). This prevents the SoC from entering deeper low‑power states
> such as CXPC.
> 
> While PCIe D3cold support exists in the PCI core, host controller drivers
> lack a common mechanism to determine whether it is safe to power off the
> host bridge without breaking active devices or wakeup functionality.
> As a result, controllers either avoid entering D3cold or depend on rough,
> driver‑specific workarounds.
> 
> This series addresses that gap.
> 
> 1. Introduces pci_host_common_can_enter_d3cold(), a helper that determines
>     whether a host bridge may enter D3cold based on downstream PCIe endpoint
>     state. The helper permits D3cold only when all *active* endpoints are
>     already in PCI_D3hot, and any wakeup‑enabled endpoint supports PME
>     from D3cold.
> 
> 2. Updates the Designware PCIe host driver to use this helper in the
>     suspend_noirq() path, replacing the existing heuristic that blocked
>     D3cold whenever L1 ASPM was enabled.
> 
> 3. Enables D3cold support for Qualcomm PCIe controllers by wiring them into
>     the DesignWare common suspend/resume flow and explicitly powering down
>     controller resources when all endpoints are in D3hot.
> 
> The immediate outcome of this series is that Qualcomm PCIe host bridges can
> enter D3cold when all endpoints are in D3hot.
> 
> This is a necessary but not sufficient step toward unblocking CXPC. With
> this series applied, CXPC can be achieved on systems with no attached NVMe
> devices. Support for NVMe‑attached systems requires additional changes
> in NVMe driver, which are being worked on separately.
> 
> Tested on:
>    - Qualcomm Lemans EVK, Monaco & sc7280 platforms.
> 
> Validation steps:
>    - Boot without NVMe attach:
>        * PCIe host enters D3cold during suspend
>        * SoC is able to reach CXPC provided other drivers also remove
> 	their votes as part of suspend.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated the cover letter (Bjorn Andersson)
> - Add get_ltssm helper function to read LTSSM state from parf.
> - Allow D3cold if there is no driver enabled for a endpoint.
> - Added a seperate patch to make phy down in deinit part to avoid power
>    leakage.
> - Revert icc bw voting if resume fails(Bjorn Andersson).
> - Link to v1: https://lore.kernel.org/r/20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com
> 
> ---
> Krishna Chaitanya Chundru (5):
>        PCI: host-common: Add helper to determine host bridge D3cold eligibility
>        PCI: dwc: Use common D3cold eligibility helper in suspend path
>        PCI: qcom: Add .get_ltssm() helper
>        PCI: qcom: Power down PHY via PARF_PHY_CTRL before disabling rails/clocks
>        PCI: qcom: Add D3cold support
> 
>   drivers/pci/controller/dwc/pcie-designware-host.c |   9 +-
>   drivers/pci/controller/dwc/pcie-qcom.c            | 162 +++++++++++++++-------
>   drivers/pci/controller/pci-host-common.c          |  45 ++++++
>   drivers/pci/controller/pci-host-common.h          |   2 +
>   4 files changed, 162 insertions(+), 56 deletions(-)
> ---
> base-commit: 9702969978695d9a699a1f34771580cdbb153b33
> change-id: 20251229-d3cold-bf99921960bb
> 
> Best regards,

With [1] to allow ath12k to go in d3cold:

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

[1] https://lore.kernel.org/all/20260217113142.9140-1-manivannan.sadhasivam@oss.qualcomm.com/

