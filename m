Return-Path: <linux-arm-msm+bounces-7512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E2830DD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 21:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0FD0B23CAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 20:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E1B24B30;
	Wed, 17 Jan 2024 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGesZNk6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809CD24A1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 20:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705522559; cv=none; b=iRGlaCqGJM2pDDI9P6p1Q4b9YcV/gt6eQvohCKKBxeqybjG1KYzQ02GkSdg48ilXWrris9abnwGzYwMg8y938DWmNMX15Oh6IidYU8iWM77ilqdPi8WW4LF+af5C6yhe20xI350KXn0081jYQ9Q7I4veoil2TCjsEweBYjqDKxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705522559; c=relaxed/simple;
	bh=ZtCmtaY+wb4O/4dYs6eMRhrbA354BTp1CNtLDUkfs7c=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=gxCfe15jGl8GCdpzPW/F2a1YkZevtlxTLf9jaBMmUoJGVOb4IyDCKayzZLAqHN38/OX/XH20r5sXhTeEWf0yUiM7gg6tz7AvdKqoZfkER+CaQFz6VXGSsyWLGqsiaOc1/x+p9cNapI5/gBlIeEMP3bMA2TGp49XxguuDnosSJf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGesZNk6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so13664418e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 12:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705522555; x=1706127355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wffrKACYiwhCemNTJ2adHv9qr4lw6zEwO+YIXcSMwPo=;
        b=EGesZNk6FeL2umPMoi3M9kIP/NN8z6yqFLStUfivaPaNoU2HtXzdU9f/2+8w1omHjE
         29TMJ1vuhZV39VHPRMgH/APGMqWoBHfNV4gFoTQvai5uhxc8AvI1/cUipwybgzMtN5vx
         0V9rOLWeTfZ/LvzsDNFwfU+lrJjLo1UosezLcvSucIf69KKKSfE7c0c//vsU6mHNlX9U
         PeVwsywQ/Sh1o2kxuff20K0pig3AdY+RubuGI+gEcfyFuLyFarJlIHS3eu3x/XPiNaTh
         hTJDKc9EGuPL62BVA3b0uQkB0kwDL2AOov0FfV0Z8e5S0c1VpBMxP1mHn2Fr+q9049Dd
         2Keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705522555; x=1706127355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wffrKACYiwhCemNTJ2adHv9qr4lw6zEwO+YIXcSMwPo=;
        b=kKMbfs6OeIIt4Iy3R+txoxl9C1hSCOpN9N18TZt5IpV5OU73/yp/79xB0wKkA4sv6J
         ykjfUy2rsplo/s9+MYYe1O1GXtklc97WoSwOWjkO4gVY6DYtFoAjojBFcCFVpOJ9vitB
         1t30ZE9WGCvz4C55Jevv8cqTKUWf3U91PsHGfRhwq9CqsK06qX4BTxGATkay21fl0fJB
         veIVA4pcCfzkMk23n/JBR0ntCjvTpriQdsFurcE3mLQR27vtJQ6CodJKuCJ2uJnD/odI
         3z01drYR0ynE5RzTu6sXCVq2vcz6CyMfaCBBfLRuLOgMsqG97GUV/dLcruDeNEWaj+UG
         6sgw==
X-Gm-Message-State: AOJu0YzH8UDXs9NN0n7C/gSZKwvtoPSwkbeVjWUrEpPlGMx3WbR1RvD3
	ZDW4CAEcNFzmZJFMypESo9ERWCYJIY2ldA==
X-Google-Smtp-Source: AGHT+IG0yfsNlOgbpAYwYnf4BQc1QpssehfpeF0imZ0M+byKLE7KGfXZjzn54tq4R/CQpVvnGQXsJQ==
X-Received: by 2002:ac2:5b1a:0:b0:50e:745f:b0b7 with SMTP id v26-20020ac25b1a000000b0050e745fb0b7mr4371280lfn.52.1705522555333;
        Wed, 17 Jan 2024 12:15:55 -0800 (PST)
Received: from [172.30.204.151] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x5-20020ac25dc5000000b0050eaa1a35f4sm359621lfq.303.2024.01.17.12.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 12:15:54 -0800 (PST)
Message-ID: <6980738e-207d-4cf5-9ebd-dde40d5d7c37@linaro.org>
Date: Wed, 17 Jan 2024 21:15:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/7] firmware: arm_scmi: Add QCOM vendor protocol
Content-Language: en-US
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, jassisinghbrar@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
 quic_kshivnan@quicinc.com, conor+dt@kernel.org,
 Amir Vajid <avajid@quicinc.com>
References: <20240117173458.2312669-1-quic_sibis@quicinc.com>
 <20240117173458.2312669-4-quic_sibis@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117173458.2312669-4-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 18:34, Sibi Sankar wrote:
> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> 
> SCMI QCOM vendor protocol provides interface to communicate with SCMI
> controller and enable vendor specific features like bus scaling capable
> of running on it.
> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Co-developed-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Amir Vajid <avajid@quicinc.com>
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

[...]

> +
> +static int qcom_scmi_set_param(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +			       u32 param_id, size_t size)
> +{
> +	int ret = -EINVAL;
> +	struct scmi_xfer *t;
> +	u32 *msg;

After you apply Dmitry's suggestions on returning -EINVAL
directly, you can also sort definitions in a reverse-Christmas-
tree order throughout the file.

> +	msg = t->tx.buf;
> +	*msg++ = cpu_to_le32(EXTENDED_MSG_ID);
> +	*msg++ = cpu_to_le32(algo_str & GENMASK(31, 0));
> +	*msg++ = cpu_to_le32((algo_str & GENMASK(63, 32)) >> 32);

lower/upper_32_bits()?

[...]

> +	if (t->rx.len > rx_size) {
> +		pr_err("SCMI received buffer size %zu is more than expected size %zu\n",
> +		       t->rx.len, rx_size);
> +		return -EMSGSIZE;

No other driver seems to be checking for this, should this:

a) go to common code
b) be ignored

?

Konrad

