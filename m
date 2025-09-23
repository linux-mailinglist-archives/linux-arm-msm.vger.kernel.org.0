Return-Path: <linux-arm-msm+bounces-74500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2EAB94B9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 09:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BB9C2A0EB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 07:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E60E31158E;
	Tue, 23 Sep 2025 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZqaMffOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6C719F464
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758611843; cv=none; b=cQvkODm+aorhbOIBuJ97cbT9RHiQjtjSsO712Lljk8FMy4b0fNGTssj0zBg59rzYjeeDOIdnu/vjzcKvU1GH499T2Ezn1rbcZdjevkhQWXuN43nhKyZ72+YGicCLzyCmQLJ7rJGu6NvLQanRlXUJHnQQUOo/+7vtITdPN4/Hw+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758611843; c=relaxed/simple;
	bh=Kgi6xBpKlXVh0Wl1HR8sB4WMwLoB2WkYMC6YlNhYudQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Hb0LhOHNHtPoewyfaM8uw6DIteAa94WpTuIfH1xHdfDyQFShWfxnXZGIMf/BpApNGY4g+pX/trWfxzdeiNhTrc0mRFSrJSg8KnhESrIbsMqmEJNCHHz9bVE2NXqSdAxJOo0VH6Psw3LU7ttoXG6XmHA2MiGUK2XBeR8dX7cPjR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZqaMffOD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7a16441so774314166b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 00:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758611839; x=1759216639; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xp/wVVYVglDb0K9BV6oQ/Qee7hbnU4VQ4y29oQDrYo=;
        b=ZqaMffODX/NKrI6T+4zGmfA2BRjjQh606Kp7/3v8tVd4tZ0POwTpG0XCV7KmdpOo61
         v57hIU9ic/8sNBwdXdJdIoIzwzl2v66vUVE7qM1I/8F/TzH/6xsOFbX6ePZiUoDFHLEI
         fBa4dC5gv4HCERmzNFA/cX9kPN66m6CuMOOXr5ssJ9pczdX7FHIEnZoyp/MwZSyJAU/3
         lAikG2qO0UC7cQdf4dq2wC8Dg4h+AvwuqH6jCZJ4hkyULj4RdtIh1FFO2gBUXJ50YnVC
         QsS0GZ5bxM341/2g/tNSfHc8NqS32WDDBrp29vNlsvy9RV8qKN/VesQf1sqD8/yRlLgT
         E0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758611839; x=1759216639;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2xp/wVVYVglDb0K9BV6oQ/Qee7hbnU4VQ4y29oQDrYo=;
        b=G5/QnCLBBrxmE9WApm5VCL7/pPqXF8Jv4GMz/WzLJJfgIXYq/QurJt2eCt6HNq1d4P
         z9+Nj3vW6ZmsG+e9df+ZFt6Wah8BGk9ZLmrha/B0TOnHepuDhjKYZVRvNYTHyAas7Q8C
         BQDe1k4nv8f7K6dqFD3xcdZUzLyEcFh4odUuwxghYI28S6tYTnJf/j0NsK6rLA2kxddC
         GjISL/IkCBZ9lr2t9L+UjojX1FgTmt7R/zl0XB2hPOc4wDCsFEGdEGYkvAIh7FtWeO68
         pAjp7DT9ob/moz1J6GO6OTION3Y6DW2YZPA1U/u11tsF9ViwDhwx9vL/75JPZwWStBuq
         Updg==
X-Gm-Message-State: AOJu0YzX5RZCkIvUD4JT4NP3/vLJNyFsinbPeA48RYu7+f9brpT4AObT
	bPzjdUcHKuym9z+W+T/O9m1ULuS4ArlfeUoHeYwt4dqu8NuggFL+mBjpAyIxxX5gvMFDi/humlK
	bHnrH1SVtGw==
X-Gm-Gg: ASbGncsCwSS9rFbnIA6jOaQdYhN936+boyrEpPo0JMCusgJ1QZqwcCHm5VOPYNe5wy3
	hNQvmP2PtcWEWGZa2ls8YhZzEkm6MFjdctELEHYVbYoG+oMOifwMQikCkqeQdBUfNFaIBdwLasl
	kTcwS3AOzzXrCpY7kB5jtIdQ81A5OoBm2P6VXOeY9NbFhYuDrJDDx7kL1obDm7ZN7CFKFrH6vKe
	ElzB5GZHhSRh7ohqYCDbzMRQ4YsW4qE+yA1HqOSV1I9gwc7FB/4l6/SX+W8amlLtWwWYHJsORsO
	M66welMv9nDbipxxvBQ+HZWzHwtX8VTRipYZqOFRm/jwhWr+m8oUeaqzU6NPnfQn9TVth6Y62ol
	ulASWRFsFz2sTsTRkdifojnsTmWZSU3Z/Y9cEVae9DbbwUQTO0fc17nvNbbRk89sFcw5n
X-Google-Smtp-Source: AGHT+IFDB/7GOU93rg3HC6u2rymyBmPfi52FYHKm2lXJfB3vOvNUC7hTsmLAd1+CEV9CwyHGTA0KFw==
X-Received: by 2002:a17:907:3f20:b0:afe:764d:6b22 with SMTP id a640c23a62f3a-b30263b2e94mr148085666b.9.1758611838518;
        Tue, 23 Sep 2025 00:17:18 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2928cd318csm689045766b.98.2025.09.23.00.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 00:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 09:17:17 +0200
Message-Id: <DCZZV93PMWRZ.1J9IZBZYP5RGM@fairphone.com>
Subject: Re: [PATCH 09/14] arm64: dts: qcom: sm6350: add refgen regulator
 and use it for DSI
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
 <20250921-refgen-v1-9-9d93e64133ea@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-9-9d93e64133ea@oss.qualcomm.com>

Hi Dmitry,

On Sun Sep 21, 2025 at 9:09 AM CEST, Dmitry Baryshkov wrote:
> Add the refgen regulator block and use it for the DSI controller.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/q=
com/sm6350.dtsi
> index 8459b27cacc72a4827a2e289e669163ad6250059..dd009569a6683a25f13b068e3=
e0bd8746b2ac501 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1768,6 +1768,12 @@ usb_1_hsphy: phy@88e3000 {
>  			resets =3D <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>  		};
> =20
> +		refgen: regulator@88e7000 {
> +			compatible =3D "qcom,sm6350-refgen-regulator",
> +				     "qcom,sm8250-refgen-regulator";
> +			reg =3D <0x0 0x088e7000 0x0 0x84>;

Are you sure the size is 0x84? Downstream and hwio_bitra_V1.cmm would
suggest size to be 0x60.

For sc7280, hwio_kodiak_E5.0.cmm does say 0x84 for refgen.

Apart from that, it's also what I have lying around somewhere, should've
upstreamed this already.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

> +		};
> +
>  		usb_1_qmpphy: phy@88e8000 {
>  			compatible =3D "qcom,sm6350-qmp-usb3-dp-phy";
>  			reg =3D <0x0 0x088e8000 0x0 0x3000>;
> @@ -2360,6 +2366,8 @@ mdss_dsi0: dsi@ae94000 {
>  				phys =3D <&mdss_dsi0_phy>;
>  				phy-names =3D "dsi";
> =20
> +				refgen-supply =3D <&refgen>;
> +
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> =20


