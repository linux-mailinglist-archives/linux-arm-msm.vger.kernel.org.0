Return-Path: <linux-arm-msm+bounces-27583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B4C94388A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 00:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BEF8282B5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 22:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7D616C846;
	Wed, 31 Jul 2024 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKr494SC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640D7101EE;
	Wed, 31 Jul 2024 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722463242; cv=none; b=W02PY1EnUXFN5uIHr00XYlnSOhzBZm9kWcxVl6KBEyyjxBvU6udJmwgtswrzQ5HFwSPIRpwB6vp6v2BrbHgAlyBxsDScy/C0nudC8/2ZDo74RDlbltbv7gYYEsXNiJvKldKq+cwd7Q3BkFvRcu3rOAH4s9UuBOQ1wLy+XXYzw3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722463242; c=relaxed/simple;
	bh=kK/oYxmAHm7lt4Cdw16UQcrQh9T8jQ9kD+EgdVvsA60=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=lWYSHGlnIL2qd7AsbJxiy/27hKiBNsGZBWR87IooaRboi72iGKEEVG/Jd3UmDMITDCR2WgGXEPQp+epmbpF5SQg5KuerOMpe0G0ucAhiBqpbMqQxP3M8/Z9nfbCycn1n6FANGsOmMyrczuocUcXSyjjCvgyKlf47Xa+krd/9LhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKr494SC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43E2C116B1;
	Wed, 31 Jul 2024 22:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722463241;
	bh=kK/oYxmAHm7lt4Cdw16UQcrQh9T8jQ9kD+EgdVvsA60=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nKr494SChSgCWpsIa7qfBEfxX603POX0p3hUD3saXCSkJZ89zz57uxuFC6p/tHv+1
	 5gdpOxT6c5VhoxxDoydz55NGA8Cbsw0ZWV5pxAN3HAjiZ+4Au7uPgX/xYHV6z6A3h9
	 PowD5j/kAAXHm+0lXFNAt+u3bEs/T4QtVcf9I259SQo4ONef2BZDp+AIT3lAz4gK82
	 iYqkRXaRnCRlXrR1MCmMmlUveo7BQu52tyxoTVpk8EKwbl2AB5Dhb/NKrYLaRgBOnx
	 fCmbwedERdfelkrKq3PRmQD5NmKWepGYzADRh4IXNzKw8fNjRlnPJzR9XS78bjiAbn
	 QS6Iz7Z0GlAcg==
Message-ID: <443fe6008cae894617ac77d83ec6699c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240729-fix-smd-rpm-v2-2-0776408a94c5@linaro.org>
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org> <20240729-fix-smd-rpm-v2-2-0776408a94c5@linaro.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: soc: qcom: smd-rpm: add generic compatibles
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Date: Wed, 31 Jul 2024 15:00:39 -0700
User-Agent: alot/0.10

Quoting Dmitry Baryshkov (2024-07-29 12:52:15)
> Add two generic compatibles to all smd-rpm devices, they follow the same
> RPMSG protocol and are either accessed through the smd-edge or through
> the glink-edge.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

