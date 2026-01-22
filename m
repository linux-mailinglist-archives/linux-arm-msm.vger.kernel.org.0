Return-Path: <linux-arm-msm+bounces-90254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMjABBxncmmrjwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:06:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C796BF50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB16D300916E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673CA318146;
	Thu, 22 Jan 2026 18:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKJzSfL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB628C2DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 18:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769105062; cv=pass; b=NgwqRIR9T9GSz6iijuK5+QBJ+DwdkpH3oDgco4l3/1OcOgZREEKm/sJM/Ks8SCt/2nUPvuZJnU+XW1ihBItgo0vQMXAMgvNU6BTDKRjR0NTML2nyi2usB/eEEpumyBBdMmCulgEPEvnNdbX1pls51G6gaceKrVk2NcIa1xgeXyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769105062; c=relaxed/simple;
	bh=+is2jLbMzq0Z6Kfc8fC+eUDq4l5RgoKWrFKSARRKu4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrUIWSfjxE28vm32LrwI0MCnngt6C+jtW6gWfE27+euR9rXg9hH2COqpgql18BHXbBmIox2bL8+u/Ia07ghwIChGj5KBt9fFCwaTQYn79KrFq7+jTqTQkWzY/YjvFpVsRw4lPO0oQ1NNPaIwM2WvivZPXdPIEUee3X9YcYmD8ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKJzSfL5; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b8466b4a8so1066232e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:04:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769105046; cv=none;
        d=google.com; s=arc-20240605;
        b=Qm1muEpbaA41S8/SYoQnYLNX5mWy9P7bBEAbLMWvkbrj3+1i2GJI0tNWnLpm+NJ3Kn
         Aq5M/tCkc1rv59Qi7VsuxYJJmisW3I07Gq88m5921i7cowZWjVyy6yjv7Gf7t7dg1e1W
         jPfLbUXq7f7zvT/QbAfU3koWNXH4+I1D5wvqFrZ/dSPIKs8VB67nGkmgIv6yY6tBsjsq
         +AROCl9eEwXuv9YU3n3mHzyZJHGVTnBU86hiKkBS1UFsGw7eBW1/KC0T9g+zKP/VljqB
         zZA2G+OCxeCG9mYnh/mqarrrP7SkvsNy00TJDXQ2Itcn66Ktok7vsaYzaURhYLIYd1D4
         T82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+7GHTE3dRB5BqKenpbv68JYHRVBWjnrm6Bs4wCM6D8g=;
        fh=HqkC+IR4Lg+I5P+sJ14va297tDPcsPCWNMBi/Xxtb8Y=;
        b=kn6i8Fp7qWXVSQYlahxs8mfRqa5++79994SrtxqE5mRTkeEV8CqWRc03DvwbUK+EmD
         c2peHqGhbvQ5Cy+kgvBIr8ySvBU3lrKwrsjeG3FXfLl3TAy/wHqoxnB3YGye5OcuhU+X
         GEMCr7pHeQ/4J6q7UNgqegTIeEvCn/mbiaJ0+2agl1PNsTmgyVmlDYAfVsLv4pUHhHMq
         8iFr/uqSyZyRVEchX3GKkZLaa6Hi1MQNrE2RjgB/8UGP4tyuDlpNZgmsXdx9BbfeF/8/
         YgGALTtRTQEirPmzORjRNoGIuKvgWd0Cu3IMMB/6Ps2g1RDDkpA0pKozhxja6mZdwiWY
         +UnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769105046; x=1769709846; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+7GHTE3dRB5BqKenpbv68JYHRVBWjnrm6Bs4wCM6D8g=;
        b=SKJzSfL5d3wEX2z6hbrPD6DLES1jROK4dOOOSXJP5GWwvKwsEfEhvs+WUuFeVPTZxV
         OAN94/BVDIKBh03rLQHKuGJ/uLPHPgBGa58Mklud7zz74G/KHKUdDIsnOoCj2M9j9aj8
         Y/5bNTZ82CcxDuCcFs3s+86T84gpUfntljgvEnazTwgscayv5uBLrDDdAb4xZYZ6j4kn
         cJO1arn893VS1VQl9R9nu2JMEpWORBQg603NX8WGIEyWVJfjIJD6fstntBI8G/nbETWB
         O+O+pvHRINiSRXcjxZa+BJXz+j3StGPZKrmerzp+/+KozQ+S1UR2sE4ASPOIbqsEToV4
         A33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769105046; x=1769709846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7GHTE3dRB5BqKenpbv68JYHRVBWjnrm6Bs4wCM6D8g=;
        b=IZbLmndUH/h0ns+73hEeGHB5bZ8JstvvsS42NCHCnHVS1DgdKLcAD63HBZ6cIi+XvE
         HvmiUxli9liwj88CQT4Nn9nxO1XdMAax21BE4huAXhDK01TJiCDfP89i6FrnwA+6b1lf
         Qqnv1Mku8LJMzUVw75UU/R1exaFvEfhTC5WzAgITVzzfgn2rWVIe0z4FFdSvpLEQNlO+
         dF/LnENw7WcgyuNf7VMbpWOGzCJ9KmjxpXZ2ajxECppFDxCTr8mSL3N3kr3UsObKdw7M
         22GaWTwM2IQy2EFhNoG/fsYy9YHiIrFGcaK6bMzWUgKHk8LkvL26QU+Tz24+C+cP+J7B
         AvJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW810M8q8EHXOQ3FB9HbNtIeRbI/ke/GDNP9GnvZzzJhi27Ij3C6jsvlw+UwycCNMGv3j4bIc0PnODhnVNS@vger.kernel.org
X-Gm-Message-State: AOJu0YzJQpuMRdVuLxRdIqzmnhWn+Q4bmyTkmYn0z2FAZqjpQrNxlLBP
	i3RiBLCbe/FgksMl8XokNzhcCrwUAiH0qSpUhsaUkwXAHrNcUbwyZ7L5lDzgibL33E38ggXBwfB
	n2yDmFZ84QMfgewu3lVK7cyidlBQS72hd4zkzpcJHkxmB8VvQHkC0
X-Gm-Gg: AZuq6aLUoZhPWnR0ce3+Q6MWkzdOzMQ3OWHLD/lgiRXAWZUOa3DG341qFLOS7+hdi3F
	NkW9BkCvxJsNPHa3e0mPp44pc0OAx8XuiVYj6tp+nOPgPikkmqAptQ7RDMQ8SvlFJ38W7GfwDMY
	CccrWPx9YdQp9mz7lWPMknGvL8v1FGl7UUFDFr8a0YMAR6XHKgYZSd8uO36SSOLkgpGa6imFAPG
	Y1LpCQHNQ0eH0pTrKXySObVFtXyHoC31+TiMLFPfAPXOmnAXHYPvjW8ZESagUR9BTEGG/PR
X-Received: by 2002:a05:6512:3b97:b0:59c:ba5b:ff62 with SMTP id
 2adb3069b0e04-59de490d21amr53289e87.15.1769105045566; Thu, 22 Jan 2026
 10:04:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-mmci_qcom_dml-v1-1-9b334479968e@qq.com>
In-Reply-To: <20260120-mmci_qcom_dml-v1-1-9b334479968e@qq.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Jan 2026 19:03:29 +0100
X-Gm-Features: AZwV_QjDIpmCdl3xsITbV6Pt2jHn3-Pc7ojNKEOQi8IB6Ipjt84DU72iscHsb2U
Message-ID: <CAPDyKFpJuUL-GfpYDUNK_e0r-CS=oX-tPXozOtvVmFZ8XLBTTw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: Fix device_node reference leak in of_get_dml_pipe_index()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Felix Gu <gu_0233@qq.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90254-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,codeaurora.org,vger.kernel.org,qq.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,mail.gmail.com:mid,qq.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 59C796BF50
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 at 15:26, Felix Gu <ustc.gu@gmail.com> wrote:
>
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In of_get_dml_pipe_index(), it does not release the reference.
>
> Fixes: 9cb15142d0e3 ("mmc: mmci: Add qcom dml support to the driver.")
> Signed-off-by: Felix Gu <gu_0233@qq.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci_qcom_dml.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mmci_qcom_dml.c b/drivers/mmc/host/mmci_qcom_dml.c
> index 3da6112fbe39..67371389cc33 100644
> --- a/drivers/mmc/host/mmci_qcom_dml.c
> +++ b/drivers/mmc/host/mmci_qcom_dml.c
> @@ -109,6 +109,7 @@ static int of_get_dml_pipe_index(struct device_node *np, const char *name)
>                                        &dma_spec))
>                 return -ENODEV;
>
> +       of_node_put(dma_spec.np);
>         if (dma_spec.args_count)
>                 return dma_spec.args[0];
>
>
> ---
> base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
> change-id: 20260117-mmci_qcom_dml-e169407da7bf
>
> Best regards,
> --
> Felix Gu <gu_0233@qq.com>
>

