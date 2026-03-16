Return-Path: <linux-arm-msm+bounces-97981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBuOJAYguGlYZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 16:21:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705529C31C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 16:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66258305D7C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505033A2571;
	Mon, 16 Mar 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jtsz07GN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74DF3A2558
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674165; cv=pass; b=BUsCEVPqpUFU7KrlCUCushqK7jq+KV5V/gZSvkYTbZYZKFMc3zL7OUm3uAsnPL/8f2g8fVN+nmyTkoFw7sf5Ky/791slbjd/Tszn8Xi+y2brqIEMvEBd86C8lmxyKMr+d5HnD/wJrHE75nYYbGeJgEVBmJgTw5U8XAjNMLNzQqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674165; c=relaxed/simple;
	bh=SGrKOh6DxyjU+GV0XnOjtJnq9uPykPDANTIFfa61QH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFGhyFm/uAwgtxxvEP99K5D16RYucnieuFNxHPSKd1xuYzxQN8o4OD5KvGM4QQje609dVqIYs+15puN+0SunLG1Igm5Ig0F0Pi07/HiMZl58xSFuNWBqNugOxNo4K+q/IzbU8xHS+jwzHedAFVpYyOl9vsjZRDg04KDIaNXpZLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jtsz07GN; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-386b553c70eso40830111fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674162; cv=none;
        d=google.com; s=arc-20240605;
        b=l3sTAGLhKhqj6wxPRvDDTIjI1xOZtrH1ZeUQlcpv2FVnJvarFkJamiwoI/Uw0aBMCH
         bXIeWKVI8p2eaSSFcQ4xXlMtG80VVT8BVjWk/ngmXhX2amboYmMnX/NRpVREghOCipCR
         IFg4QfSKzUrrZMu/tuUQDDsmAXSgy3tNHD84SauOb2A0zUxvsuO4OiD7nMEsgcfI9p/a
         grk03PqWD4H8TUZTtNIPwzaJXEj1enUw+HzCHaB0h+HsFgLy6/ZbyzJm8y55JJ+8U4U7
         Mn188A455tad2rdZAkJsvOLnO1R+RgUfdnWVwRHC1+I9ssiKJV5CKNkUbUpAR7OXqMGE
         1eOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aWwOA9SQqzmxmd74/y4xRp+f9Kw/OsZUX40Voc8OPk4=;
        fh=zHSY5y4JZ4Wmq8y+FQluLE5oKicc9DO2mxNj+X1AI2w=;
        b=KilOMfUCS7gjfYfZVgA814PLdS0wdBpwN7GvZAvMw956H+xgGFH37D7dVfH0fv7Rd0
         LvYfkEN7gOMOkMvm1esa7ZaWp0fNUdJxHZm/0U8lzo5IAMbx+ZPCDGVjwhahDiAB9JTr
         jwEwK/PL6LwnocccMc9JhFYRnHJYWHW6D86WPKDSNuDw+mwufMl6oqTUpXJKF8vKYSCM
         UHJ9OjtHtRbhOVKnY844nhywaAleuDM/LLsllfFO9MBIsRNvl6ouHR381MGh2EoVHdtk
         6QSx4vqrH9Sg+ApALeqiVchB4tAVoDLsVJVaxIWttWSzC/6l/NHmzUPb6Pd3V7ohDWJz
         iAkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674162; x=1774278962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWwOA9SQqzmxmd74/y4xRp+f9Kw/OsZUX40Voc8OPk4=;
        b=jtsz07GNFeAEXMC6uCu//Kl6N+FETjCtKU3pYIQGECDs/OEavmObeUfyyeV4xJYGAa
         JP3KQ/hR2fIxtUIi4vLy/zrESlImC2KgV8N2BWbuXtqq+lodc+6T3NnuRqHg/36XtRM8
         2jyu9oHE6oP6NpGRlGITsvzGunnEG6OnlOq+XQ97omXL/cGdtiRTfj4Xkypi8XBHzq4g
         hi+9JLBr+Fek8NouPQwdUQ8u72u5DpSMoK9DWQbPZASR7aZOntoPxVGjLJ92dI9D9ZDU
         2sTvLFOCqHr/zBXOFcAZpEH5e95dpF787Uv5voUdcW0ozL5K2Y8iC6mjSxDMc65Hf/5j
         RUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674162; x=1774278962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWwOA9SQqzmxmd74/y4xRp+f9Kw/OsZUX40Voc8OPk4=;
        b=es6UZf4y/19ECsSMS/77FtdJIYg4KvTEItFmBce8J4laJ6nLXYl9z6//gU0qalSPlT
         WvprcQhiKSalVzwvNTMUiAMf/zgHcW3j23LdSQYhJSPelvexKvGOXWPHBWf5s1DfklZN
         ktOhV91NlpF3vmU+jQxq/Acqy8pZ2H7qmYNBTaGCK3rNDCM0MPxHjVtp3j+hPkN+AlnY
         cqHobdVx8o4WE5ZwVi87v8qApM8TJdj4V39BZJNhtfVkDFhYZmBVBkMjz1aGv9tdHPq7
         5/jwRa+Vol+IrYq/34tERnM2V0L/675tOunvtTUp6GJAGozCRzNEY79z4MHoOkm99AfQ
         GnrA==
X-Forwarded-Encrypted: i=1; AJvYcCVRrqtMHe8bxo4+lDycR/l2kew/aVj8Ejo7kWHkxFO35s4yQKzeSpyXz6G8ZsHqZ34I1d0A6Izu4+tr9ejg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt+2+/PIowutmXZ7EoVyzUCzQiZ8iWzNgfDs41EzUgYWGPmdyR
	2X8GZTwSMPRMfD4NIymsWi8oRZH6MWVauATlQLnnPol01CGcbzvFvd3mntp8YqIz7JDdgjZ7yID
	Mb5d7kCk4JcwmJiRy8VkynSwnop2owbvpm8+UvK8fFA==
X-Gm-Gg: ATEYQzxdD/GX1Wd3fO8j3ssEBKXtZupgVbYSh6Xt7apoftDq33VkIvvZfZY6wvkBoxK
	gvTU/GBo9hpIC6rbd+3kxI8O8fNhmZOOQO2zHumBmC8J2fw7deIAauyH5C5CfGL+cjtoTIEOZpk
	/LfN1jClOGeWGTcM16tCVQrsiXqz7FpuNWQYuus419TPOURfw7fjSJz2LteLwYq5Dn74WRKo5Ql
	iBXwXV9S9+eOrtt+Pu7ECh9tpMuHVwDf2XIcOupClERLtF2e9VwVmlskpAiCIj1HGpuDX5Pa3xP
	eH3ODQB+
X-Received: by 2002:a05:651c:b1f:b0:386:7e61:5de1 with SMTP id
 38308e7fff4ca-38a8930e573mr42245921fa.0.1773674161832; Mon, 16 Mar 2026
 08:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-6-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-6-fe857d68d698@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:24 +0100
X-Gm-Features: AaiRm5153tShsk2TIyyE8TGCBjpaUzTwpROv6h6ltabxhtejv3_1C_1EaRy8Em0
Message-ID: <CAPDyKFq-pyTffu_D_eZAZQo3e=vkO3uhQ_hAjS-s2DY4TmXoXw@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: mmc: sdhci-msm: add IPQ5210 compatible
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97981-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 7705529C31C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 at 10:46, Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
> The IPQ5210 supports eMMC with an SDHCI controller. Add the appropriate
> compatible to the documentation.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 938be8228d668c87f0be95c63d4d951ebbadd4e4..fd1d5b04e7556903daffe86e455fde11be0dbd9f 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -38,6 +38,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,ipq5018-sdhci
> +              - qcom,ipq5210-sdhci
>                - qcom,ipq5332-sdhci
>                - qcom,ipq5424-sdhci
>                - qcom,ipq6018-sdhci
>
> --
> 2.34.1
>

Applied for next, thanks!

Kind regards
Uffe

