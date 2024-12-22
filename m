Return-Path: <linux-arm-msm+bounces-43064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB92D9FA45A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 07:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EE6A1887C11
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A19913D24D;
	Sun, 22 Dec 2024 06:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbJO8f0m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D3B1CF8B;
	Sun, 22 Dec 2024 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734849292; cv=none; b=N5f+vUvndWb+aGsY6yJhxm0qyb3CIJZ0I25mVbardhVtJbbBb/s69Ne8wlPi+Rfl4PEM3tZEnLT+9ZWqJ+0diMC85vayTazq+2axqxo6ZTJf++ffHKd3y3iAkvqhDYbolQDo8vBIvULn6uUkWK+0JDUBYvy+/10ZVOX/jnwtSa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734849292; c=relaxed/simple;
	bh=Wc3hx5GvBsVwDYWHmaoDQPb0bFvWWx8I0pj4Pc/k5/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFMJR9iOondBEg/l/+Q+hUXzAztF4cUPhbDP2EvgdBGUH2M3qrR1rVtv2BigLGDW0nt21lZgasRDTwkJBesgocsKDZyS1n7eNrpL/zlvWMYeQRhvD6p2pTxcLpZmy1SLg/hAVkMRBwVIp9uFuTywOiDdS7inbhLz3z8H6Q+YI1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbJO8f0m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C53DC4CECD;
	Sun, 22 Dec 2024 06:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734849291;
	bh=Wc3hx5GvBsVwDYWHmaoDQPb0bFvWWx8I0pj4Pc/k5/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AbJO8f0m/4Q4uPyqE90q2tZHZvTk+LsTpGuuaydh6MXYsR0+UJN/YGyirdjmDcbep
	 WIEgHW5P+3e/KslPktYNlfwYNoP8zUqewk1/fPvMj9Oz+R8Z8uqvDWTcX2oXa6NS1c
	 SfLBvdnYAMuHUz39qs8ef2cFa5i+hJfn0RYeH/AfYCsbYo020VgXb6DyQB7RFRmuGp
	 wPh1XSObL5ktt2zFU3BWC5TS2I7KltLJGK1Epqy11y2w9vpUZytjz1fji+zNdquE5A
	 nKSLIZltIJ0lt9kzU1AjwCCY8B3LF1uFq3ODUROnBPoP7Z3k0nuH1KPwMCf1VBKnuR
	 9/kv/Hcq6yVHQ==
Date: Sun, 22 Dec 2024 07:34:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/3] platform: arm64: Add driver for EC found in most
 X1E laptops
Message-ID: <ki4iysb6dllfipjeq37kejqc3gsko7ajuwzaq5g2tl4nalyc2h@nw4srmf6muxb>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-2-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219200821.8328-2-maccraft123mc@gmail.com>

On Thu, Dec 19, 2024 at 09:08:19PM +0100, Maya Matuszczyk wrote:
> +static int qcom_x1e_it8987_ec_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SUSPEND_EXIT);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SCREEN_ON);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_x1e_it8987_ec_of_match[] = {
> +	{ .compatible = "lenovo,yoga-slim7x-ec" },

Drop, you added fallback for that exact purpose.

> +	{ .compatible = "qcom,x1e-it9897-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_x1e_it8987_ec_of_match);

Best regards,
Krzysztof


