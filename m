Return-Path: <linux-arm-msm+bounces-94540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KsBHpsUomk0zAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:03:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 315BA1BE630
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B5E030AF874
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 22:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECE34779B5;
	Fri, 27 Feb 2026 22:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zb6xL1p9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2F0362128
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 22:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229724; cv=none; b=A9azoZIplXMmrhFK/+ihnag+HEGRB258svQKZ6lv6aOEFY1zRucIVPpuLJN9FxrMjQNK+PvSzAUTWJaRtgXSWlqww9yUW9f545Cyzb1YSfK+VwGUj9bFMu+vM3RY7E5UWzf6SHENZuB8pB/MKgXKu4BNbYUPl+VkZGFmKRKRv1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229724; c=relaxed/simple;
	bh=0XfJAAwPpqZPTa0S4qXdpqC5AbA+tYTKPN+ODpQiwPw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E/i/ofn3F13tGIEwtwV1MkMjQgBbkRLMUqEBlM1Hf7hbr/+O4DBy3tSwqsDjOrGFdtAHhBahxj1N9qrb4H9XfC1gLDUPWnRrApJq8EXWCkdVDMZkJ6PIQTxSrWF0mKAdKWo/Rw5Ot93dh699qaZpqVdKuJutQjNboWhZ1t125as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zb6xL1p9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4807068eacbso20701315e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229722; x=1772834522; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tBsw+oV5b4W+q0aJyjGVPBNMIWpF08k90ryvmytPfX4=;
        b=zb6xL1p9x/bHkcL2dvE0RE2kZQVvdWVq5/8k0525HWTE9GdQ2gqRbOYqhyU+CbUVAw
         UExSA5PXugxtuOEXJJF9VZe6qT7L2MivWLvU9OtuWan8lWAVsOM0Utg6Rvv2IeYPF96D
         AyJ9G70FhrbTBud4F36hvrfDweCrrLnK4hxyFgVsR0MppdzWbjcKPKLhPRusaDQ1G7mk
         nCGHZAgErcRLEVi7dT3hNM9KiRh7YGF/HoI3ljGJwmUwW77rTyoyznLCDSul/4WSl4TA
         XjCANZkwbJZhRDUViZG//MNE/KNiw7OEnzPlGCV191uFQTWoh1KbOYdszu45e2Uc+ngb
         nAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229722; x=1772834522;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBsw+oV5b4W+q0aJyjGVPBNMIWpF08k90ryvmytPfX4=;
        b=PYlICUWHI/MLsm5HIQ58WALR/BZHnd+xkF4dPX94qiT6KMHAlIqoXaBzcKzOxZ+a+R
         MSUSO7fJCuxpK35An6600vO+a4cZ/NZ69kO3876tdc85w2VqkvDE0J61hhudbpTWs7mh
         yk5Oh6zDnXAwWz8iWrh64K8kG7T1sFuSkWpF9nYgUpCkW2m246NEDTuY5FM/iDtF3rdY
         w/ayD4asWSidhm5xa98YTixwqLvXcjfNT82XAeS9cKquIgjR4Vg+/557ZNCvyTomdPbv
         7/qmcBwBZl3X97RWLyfOuHrdwz5y9eWSmobFNeo5RoBZh0j5NulLebsrMfiwfje2EPny
         iwaw==
X-Gm-Message-State: AOJu0YyuMVuGrA7XZecWxHdInxq21Dll39FWjldSVi9geRuswq7Mj2QB
	9TEprBWychAHNMg54pbDIc8LiQb/DdQqEBhu7mfKHpn5aDpsICdRX9GTQgfC+rrXXjM=
X-Gm-Gg: ATEYQzzKpyKmaX1rEyH+QMf767GxLKQJ51y9YPpllfVIx4HM3CZZBgopGix4hFiQUzN
	SZ05/qED204EhcbMZySwBeUjnyLOpTPE+0j/SVtDYoa3ezB/4a2H5C52SKNt+Sc0bIqRF1/iH10
	gY5NWhquds7OJZY0jlzaaZG2/RWXQtaGVg8uM4B6A5EhwIMaHi9YUJ89prd0XVP9sf3QNrzl50M
	hApJXkrlJZ8H2ladoLwn32tuwsy2nf+RAzpzRdCDxJlg66RJLroIz5gKg7z9tzt9m0JZtkPlaVR
	jymFFsWzuGPOivS6Fqvd0EDKKGHKZ0qaeYJifUnZNqphCZVY1LUtH8qW9Cs/OwNhCWMTKnj2vNv
	/g1l+ncWKr4R7pb82Rm3ioufC1ZaFSU4fEyuVZWH1917KFJVONVo6ACLzCrLYS0zTZ//g2FutgE
	LFHSfZaD8YnxAN7vbwfYTAOmrrKdu17ZjcFUMPItUcS0610EquxAsBTTNRnv54c5Z4r/+PHsJZq
	PJIcSJ60VFrptMWbt+xG+wP
X-Received: by 2002:a05:600c:c8f:b0:483:bf23:1915 with SMTP id 5b1f17b1804b1-483c9ba68fdmr70282765e9.2.1772229721570;
        Fri, 27 Feb 2026 14:02:01 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c765b6esm10086901f8f.33.2026.02.27.14.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:02:01 -0800 (PST)
Message-ID: <e00a03a6728a92f34f7fbb431254f908d0ea49f9.camel@linaro.org>
Subject: Re: [PATCH v8 04/18] dt-bindings: media: qcom,x1e80100-camss:
 Reduce iommus to five
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert
 Foss	 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 27 Feb 2026 22:02:00 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-4-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-4-95517393bcb2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94540-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 315BA1BE630
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Rather than bury the BPS and IPE inside of the CAMSS block we can define
> them like the CCI/I2C and CSIPHY as their own individual devices.
>=20
> Remove the IPE and BPS iommu entries from the main CAMSS yaml. There is n=
o
> upstream user of these iommu entries right now so this is safe to do.
>=20
> We will instead include these iommus in the BPS and IPE device nodes
> instead of jamming them into the existing CAMSS binding.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +--=
--
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 462b1355c9fb7..d39013d4a83e1 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -98,7 +98,7 @@ properties:
>        - const: sf_icp_mnoc
> =20
>    iommus:
> -    maxItems: 8
> +    maxItems: 5
> =20
>    power-domains:
>      items:
> @@ -353,11 +353,8 @@ examples:
> =20
>              iommus =3D <&apps_smmu 0x800 0x60>,
>                       <&apps_smmu 0x860 0x60>,
> -                     <&apps_smmu 0x1800 0x60>,
>                       <&apps_smmu 0x1860 0x60>,
>                       <&apps_smmu 0x18e0 0x00>,
> -                     <&apps_smmu 0x1980 0x20>,
> -                     <&apps_smmu 0x1900 0x00>,
>                       <&apps_smmu 0x19a0 0x20>;
> =20
>              power-domains =3D <&camcc CAM_CC_IFE_0_GDSC>,

