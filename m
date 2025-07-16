Return-Path: <linux-arm-msm+bounces-65177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E3BB070B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A88C1885606
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 08:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392D72EE974;
	Wed, 16 Jul 2025 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pbg579Ve"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C33D84A35;
	Wed, 16 Jul 2025 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752654992; cv=none; b=RLne3nfKjX1Dx4Xr6wUJHIHaILeaNLengbxCe7qTtOFEWoeKIt6hq/thJvyiyAYR8NEpmJrWJRGxzX7nDiKpk04GJiK9zcpG8w69kNL+ECVzSBQKFNRr3LiVyNgHN8t4F9DwYjeTVBi0lAqI4uxAdkeYt+X1zq9bjiREbSxCxjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752654992; c=relaxed/simple;
	bh=lINxOgiDw9BL2jkn2XMcJi/MtfLKDDhjO77UU1QoWF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2V5OL5Xqz3v7riph9VIgwhX8uRPJc3WEYRfelUnia9amzjiH7SPSv++6/Hcdoho0ldPcTrPWd+YDXn6/Z1FiBjpY1uYyXEYP9v6FeaQJsCT28P+pJRUtBJeJGGjgX6XUrrrAfirurcZnnCpqLsMFKoxjM193K2ElDMkd2Keu7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pbg579Ve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B407C4CEF0;
	Wed, 16 Jul 2025 08:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654991;
	bh=lINxOgiDw9BL2jkn2XMcJi/MtfLKDDhjO77UU1QoWF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pbg579VewxwHYhl6idrB6dbrAPCyGSmTRvvqWj7BeZBZmu/4vfTscl5vF9Hug7IxR
	 eU8ddKkOrVEYT4ZwsHmxWAihMNlZtK8RSWB3FPbLQ+6+816nkHTR0oiZMREFNxSSoH
	 N3fVXx02XpiWbt3ckTTjcnCSVQYZxu6cHSY7Adg2vI5U8G2G3HeF7RdiYT8U3zLub0
	 aL1xex71bjC6S8znzJeWjGaGHkTiSo9MiVRiP4eYMgpJhaoF1c1phaXJhtZfOh3bW3
	 5hf33gA7YLdOJel2UJpcp/Mk1sDgjLPH4vqrFQ8z15mykSddk2nWZ5nfqN/bHSnU3b
	 ypshtAgKYRJCA==
Date: Wed, 16 Jul 2025 10:36:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] soc: qcom: pmic_glink: Add support for subsystem
 restart (SSR)
Message-ID: <20250716-capable-wildebeest-from-hyperborea-9af840@krzk-bin>
References: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>

On Tue, Jul 15, 2025 at 05:40:02PM -0700, Anjelique Melendez wrote:
> Add support for PMIC Glink subsystem restart (SSR) so that PMIC Glink
> clients are aware of when subsytem come up or down. 
> 
> Changes since v1:
>  - Add "qcom,subsys-restart" dt property to enable SSR

Now I noticed that I repeated feedback you received at v1, which you
just ignored, so you ask us to do the thing twice.

That's not the way to go and it is very dissapointing because I value my
time. Address the feedback at v1.

NAK

Best regards,
Krzysztof


