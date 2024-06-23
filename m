Return-Path: <linux-arm-msm+bounces-23771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E967913BA1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 16:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3A1E1C20618
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 14:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABB7148300;
	Sun, 23 Jun 2024 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cek9IP7X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA694C6E;
	Sun, 23 Jun 2024 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719152039; cv=none; b=AhzDv03KnTk/GELRJ3Fa6djTjlp+99FBa/S1I5KD5I3dL5NdiTrs59e4CCmUnJ4pC3QcudB0bp3hpnJ3yjowKHQJZHXN4ruiz4fHOPTh5/UQf9NpWZwxrvFIxVoH9C35rsaYSRrykarx2QBo1OiaznoAua4HzFqCOHkPgl5+dRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719152039; c=relaxed/simple;
	bh=vBdi7Y+JsMuywpAhKODLZF5AlDKmn0t9bNsBl3+S104=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lb7oWKHdka5HjWPZ577zZ6r+q1dMvKk13J1mWJ7ArLPBHiqIHC4QIePC6YfFOXskCAP/ntPVIBY2DlSlRIBxJP7Z2lPzipL35B0E9xQazWBYQkHtylh1OCOaQtQcpxoEPn4JdT12XNIj4LKKqbFPvH5JmVZKxLQizw5m/AiN6i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cek9IP7X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841CBC2BD10;
	Sun, 23 Jun 2024 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719152039;
	bh=vBdi7Y+JsMuywpAhKODLZF5AlDKmn0t9bNsBl3+S104=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cek9IP7Xgn1QM9wB01Y3Yr0SqV4RbNSgLWMkpE6D17axquFUkuIkd8uSSMNXRHCHt
	 fqI87GccXTIvpidLR3Z3b3nYZHgOq1K72shetjWPlynD8slLSx/voTnuqh97/jjVu6
	 hwVO2rQC4KvOUTpAGk701A6DovOF+MobIfR7oTqNbqvL6x+PJ7meDazOrZWGkxb0ZT
	 LdBD1bQ90SQMAR9KmPrG5QFSe8ehzHVH1k+USDA7uR+6MtuFDu7W7l335mPFtvH+vD
	 E+PcJo6XpTSu3Pyd3S+RrrTj8VsJnQwJNAebpsREl5D9sXEGRVeHczW8EUkbj+Mjin
	 qyLQRVZX/WD1A==
Date: Sun, 23 Jun 2024 15:13:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: display/msm/gpu: constrain
 reg/reg-names per variant
Message-ID: <20240623-mule-plank-b63d0e3f3819@spud>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
 <20240623120026.44198-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EJYLbj7ym6Q16epL"
Content-Disposition: inline
In-Reply-To: <20240623120026.44198-3-krzysztof.kozlowski@linaro.org>


--EJYLbj7ym6Q16epL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 02:00:26PM +0200, Krzysztof Kozlowski wrote:
> MMIO address space is known per each variant of Adreno GPU, so we can
> constrain the reg/reg-names entries for each variant.  There is no DTS
> for A619, so that part is not accurate but could be corrected later.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml  | 87 +++++++++++++++++--
>  1 file changed, 79 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gpu.yaml
> index baea1946c65d..e83f13123fc9 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -130,6 +130,22 @@ required:
>  additionalProperties: false
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a=
-f][0-9a-f][0-9a-f][0-9a-f]$'

Does the regex "^qcom,adreno-[0-9a-f]{8}$" not work in dt-schema, rather
than this repeat-a-number-of-times-I-cannot-grok that's happening here?
(I know you probably just copied this from above in the file...)

--EJYLbj7ym6Q16epL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZngtoQAKCRB4tDGHoIJi
0vseAP45JYysyf/QkbBti8k51VjLu7arXjS3WiUYbjteE5D4pwEA0cj4u0rfZtAB
y43jQ3wv5a6CjHyNWibOH5MhtfHEZwU=
=JM/k
-----END PGP SIGNATURE-----

--EJYLbj7ym6Q16epL--

