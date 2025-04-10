Return-Path: <linux-arm-msm+bounces-53879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C8A84A47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 18:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668159C610E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9192836A6;
	Thu, 10 Apr 2025 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpbICBXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C326927EC9D;
	Thu, 10 Apr 2025 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302807; cv=none; b=Pui9GcbHyilLz24kIbYPZv43rlcTHnXTVjpa5TxMYZsdELYvgBfs/PuQqDWQaYKIF4IZA8SCBrFjcmVtUYAgmjatUzgac0l19nLXCUYFs3KXYeVvoIOb12E023CGCubCCgSyIhHz6ylfzaZSjf/gBC4OBX0pjD273h/yySo14H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302807; c=relaxed/simple;
	bh=cAEMepo84Xh+GVIX8HdvypgNWEu+KGNRgVzlQGGXjTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K++am54hZpAuSSK+MSObMBhcuFYjU88tRfjtKJROlXjUPyFjfBCpglcRXVM8X5a9Ag7oqbL5yk1p8WHoNnIOK+Df9WsVGES8Bw+ypq+UEpHWZxlQbTkOPC/ZKyOjGadqWTqPrvaJpSnd6QWU9tweGg+3Q25M/N47FbckPwrKTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpbICBXK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96728C4CEE8;
	Thu, 10 Apr 2025 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744302807;
	bh=cAEMepo84Xh+GVIX8HdvypgNWEu+KGNRgVzlQGGXjTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GpbICBXKVAPkt85oHPkycUkZKu++pIxIf+SpEmIAb2XO8clEi6n5RtteuUdt7jEZh
	 fm0UNKwjQO56alckkUNHY8zTCEk6WBrGK3p4312jxxy6VUii3Af0bmTv5QZikqjNQr
	 HcsHHqqUoI6LXrUZ/S8TYO3nWvnrwhqQL4zwzp9ptTsTjunsXkvlQJtM6FcH9gwf0R
	 wPiRyJWGh04+IvfPRb4gZ1/7W65RoQAT33mFQeGtVEWaCd364m63qd86l8ABRdrjmq
	 jxO7guue2YSaW9TqdkhFkH20zeAWSK5wBPXF3+7rODrC/OFRfqzPGVDpHMOZUs7p5o
	 /Z/2l2gcroq1A==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so1780928a12.2;
        Thu, 10 Apr 2025 09:33:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUber/0hJPJ8ahW3b6RHsbgyR7sdm7SuQsUZXjO4hKCUW3V7L9o7M0umkZLVc2g6LQJ6by6tSTLsAIL@vger.kernel.org, AJvYcCW0EZRhDIk1Id43my/kmS5sbztJiG7s6+q8wDfaoSH2Op03OD1x/3XB4RO0CkQaxUncdBC9VBPm3kZzc2Qx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn0ai2B+DMav2RqUXC6FR0BZKz6bOFp+dZbF/WfNLl3oezMPHx
	2h9WhgOVxj0GlBx9IhiyfTozuOUKzvqwh0nK+dxCNXb+KfaNLtl5JaW1wyk1z0DxU+BHdqz3PlF
	I9/YtoHEd88Pl+PfaQoECZ6ydTA==
X-Google-Smtp-Source: AGHT+IE2YjKMimgOrw1jDTm1zNi5W5Z6JeKFVIhOt2neLdZJvwUhiq8/8q2mbPCxIyJ6KyZS6Pl1qOns+gXOK61+ZOQ=
X-Received: by 2002:a05:6402:27d1:b0:5de:4b81:d3fd with SMTP id
 4fb4d7f45d1cf-5f32926a296mr2905645a12.13.1744302806177; Thu, 10 Apr 2025
 09:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409204950.1521733-1-robh@kernel.org>
In-Reply-To: <20250409204950.1521733-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Apr 2025 11:33:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL-jMbT6Gcg+vXT-O5aceNcaj9Dgk_b11_Hd0V_EjQn9A@mail.gmail.com>
X-Gm-Features: ATxdqUFw1ed9g8IRN0yJfkoJVK79WgfXp-AmguFVSJI-XH0h5_9YqnsocpG0kgg
Message-ID: <CAL_JsqL-jMbT6Gcg+vXT-O5aceNcaj9Dgk_b11_Hd0V_EjQn9A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Drop undocumented "clock-names" for parade,ps8830
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 3:49=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Remove "clock-names" as it is not defined for the parade,ps8830 binding.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts             | 3 ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts    | 2 --
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 -
>  3 files changed, 6 deletions(-)

Looks like this is a duplicate that's now been applied to linux-next.

Rob

