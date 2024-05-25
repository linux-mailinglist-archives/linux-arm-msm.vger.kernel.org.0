Return-Path: <linux-arm-msm+bounces-20448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E928CF069
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 19:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7C2F281B1F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 17:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE68884D2C;
	Sat, 25 May 2024 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qgOTWEm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5BF38382;
	Sat, 25 May 2024 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716657699; cv=none; b=NOwktyKpW96Nwf0e809fSmizcanEnMqTcYNcwUWXwnXUbigq+BXV1DFyB6xUTfmcSR6zWVvtepbfaO3tm4u9DPp1Dq6u4JkIIO0yJzhXRqnOO4aJLOsvifjJCHZLtMW8BgqpZrlQ0lp9RhVvbSZAW7snX72Wgbfgc+CHGWDJHZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716657699; c=relaxed/simple;
	bh=Rqn2bor37RsFwgFLD3HjbxIhEDoLOyMMuv1rlEp9kYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFQhLRODckLemVMiBs3xJJ/7vL0id9F6TXvOyJIoFjmdOhaYDrpSx8fSp2wnOVfZpcEt0M3RWLt1ncUVl47/H1hDvy2zfLRNXltcTsdv7u5J5hFyr54AgtOQ6AWsLuLfIfuDxkyRdUHjgGdHsYp5cnbVfjBgTY7bzA8Goc48QZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qgOTWEm0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B97C2BD11;
	Sat, 25 May 2024 17:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716657699;
	bh=Rqn2bor37RsFwgFLD3HjbxIhEDoLOyMMuv1rlEp9kYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgOTWEm0kS/AF0r/OyXZg1xoWMbBCO08zAxiIhkMBTrBwOEPMUF7iVMl+nscm5iqf
	 49PXKDYl+u/KNU/mrZ+GsKUgS/0qyGm3tzQ8IM6LqITSNVTRn7ZOH1HwAoGz2E1Ear
	 Kv6Kvc4MtfcE8hZ6EtuE2qURd6mRPtZFjDgXbpSbz8rK4knf0HnRec5QZh+Hz39hxg
	 gDLbulfx6DW1VgoSoWjacm6SiPQOrudeZhCQrFIH0TFUDGvfYMnQHmrKh9SMfaC+LJ
	 hOMSv4YXh4GftKQxJ/Q1kC/q3KbvmWTh6CbHGeoF2vLp0pd3+h/WGGl5Sx39qBakbs
	 GnW/LppPvcLIg==
Date: Sat, 25 May 2024 18:21:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Amrit Anand <quic_amrianan@quicinc.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	"Humphreys, Jonathan" <j-humphreys@ti.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Jon Hunter <jonathanh@nvidia.org>,
	Michal Simek <michal.simek@amd.com>,
	boot-architecture@lists.linaro.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC v3 4/9] dt-bindings: arm: qcom: Update Devicetree
 identifiers
Message-ID: <20240525-bountiful-reprogram-929d3bd18aed@spud>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-4-e6c71d05f4d2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4tB/GgnTEPN8TQw6"
Content-Disposition: inline
In-Reply-To: <20240521-board-ids-v3-4-e6c71d05f4d2@quicinc.com>


--4tB/GgnTEPN8TQw6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 11:38:01AM -0700, Elliot Berman wrote:
>  #define QCOM_BOARD_ID(a, major, minor) \
> -	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | QCOM_BOARD_ID_##a)
> +	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | ((QCOM_BOARD_ID_##a) & 0xff))

I assume there's no devices that have a >8 bit QCOM_BOARD_ID that would
end up with a different value in their dtb due to this change?

Cheers,
Conor.

--4tB/GgnTEPN8TQw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlIeHAAKCRB4tDGHoIJi
0gB/AP9LWrV/o3QfWoBp287kX94EGtCCgytdbcFd6mIqV+5RMwEAl/2Vk1JvZRge
Gx4UpVYZLvDu24nE4S8gn6ee2a+WTwo=
=LSTt
-----END PGP SIGNATURE-----

--4tB/GgnTEPN8TQw6--

