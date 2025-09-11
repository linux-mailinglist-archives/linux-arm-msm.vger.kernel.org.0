Return-Path: <linux-arm-msm+bounces-73112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64981B53142
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33819A87157
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7170A3148AC;
	Thu, 11 Sep 2025 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wL9iwYnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED48B3112BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757590787; cv=none; b=gk4vkoVxv19Irp+mB/fosjHHn+0WcE5HNENxpiRtpE4mjFjAcLk7Hky0ZnZSm2Hc8of2YqMARKe/KuvT+Qv/F0lcEAFxPPcWiixL1zyL7eEQecQnTKTBAOMr/IsjzVRsZJVU591UaOsHHFM2Z1HNKWIFbDWDjleFMDgkdt5k8Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757590787; c=relaxed/simple;
	bh=8+8i7/gLEt0rUUB/6gOKoYAHQWN5NiQ9tvfzw40eu3g=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=OmnEQcn69ByFlztg0lLkseCzP8qZoiYXTQGMOnLxEFlLOuCg7PTW3PFKqzmnCT9ibJibW35yp+5UNCM/pib460Y18HljDlMINMc9o1jpLFmwe+tEZ6ulVxHdgLcCP0lFgNpay9WyMTYnHVQr0WnXnMoND1B1LUd2Fg+ukSj3Wj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wL9iwYnU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so909193a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757590782; x=1758195582; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xWMuhM2RYi+FNrqmYok7gVFHArgnW7224bi1jdFV0c=;
        b=wL9iwYnUHbINvyZQj9gRaXdJuE7wXUoqz10ciDGzQwcj6AXABSv0jcHMP5kWEcV3Yj
         eD00vLCV8cMSwQ7Iud+tOjHLdfV83EGsR8DK6p209dWLX9hqbKQ4Gv9ZsfheNfenLV2T
         EN6Qw8bVPFu2Hgr1T9Bn1aFXkv3jGXR7/CcwXaRF9qX99ciGdv9aJFza1/sAP63s5I31
         B8XAA0dWvGvx9D64as63Z07z/8qJ95gIhrVH8kO/Ss9suun8R8KQ6SCljcNcN9QRl5zv
         3nR93Ce3WZ4vnAz5516c8TuNCAdYokN77tavqMxSgkGhp7VOLdD8iHYmV+EMHBbAtYAR
         GURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757590782; x=1758195582;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1xWMuhM2RYi+FNrqmYok7gVFHArgnW7224bi1jdFV0c=;
        b=D2zOFkpmqTQw3sYno675TD5xYAXr/BSjX7POYi/rcJ/SY7pcV05NB+zuwgZzJrwgdB
         GViSCYyV7imGzV74MJuI48ytTTKhKXhJhgsNVv6SDs2m+aqGL5e15Oiokcn3K4bu5W4t
         Ly6hTHtqpXzryTYelWbHQSPQqtJdFQ1ZgB/0P2dyTSoFJ9BbeRBSN30XuwqmJepI/otb
         nvQAmVttnB3s9llUxsCkZ/B7N+B9nxRATyVTSqfYqzzW2vS/KYle4L9k2MELArNyZ8CV
         KuV3QI3ApBAGFat+q7UYHhB6L9e1aHM/OuHgDjJvJac/2OVu/X8x+LHFJ7Kj8Ut5UzxR
         uYmA==
X-Forwarded-Encrypted: i=1; AJvYcCX0l2npFkJOX0xkdg9wKwmzWC4AuFGgZFhsJnF/btb7zq/0Mv62Kgy7CqJtsra4qr2OAXWSCN/VyfOh7DKi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjtt5LX6RMOTsJEDEAhNDx6DaCiepIG2lyYoey/FfCljqIYWVH
	sOoxLaudqEYzPdsK4TayZzQ/V52k7oOalxw96Gr+rPHDXPfPKvmib/PNyICJids5dfQ=
X-Gm-Gg: ASbGnct8zTVVXEGSHxfEtd86YYz/3ejxkH1LwhlZxfxinb9fQWsrBq74RUA+iPXGTo/
	vxFiPjQ7bTK9O2ppp6wRjPPcSeIsc+aYxUkv2NQ0J2BxrVunzoKGRb/NvR437ISIzdLDFfHQpnf
	EiOfrQ7P3eqQAvc7QlyjAL9GNZAxiTM4T9cnuPuU9TGWJpdaVObnyHHop3H1Fd8aJ8lnIe/zJPl
	BCnSZrHF8d8Qtc1NdQQaMDlJ2wUoWGamorRN3RbZ0RDvkd69SCvFQpTYER2Fnkcep5B6RYC7ctI
	JydzEiByPHfRIrYkUiUxaSwUaTJZJufoyUSu8sL/Mn/A0hQv7/sdpLfuQzleU/4ngQdqUKDUH6g
	jaQRyYd3mjqYStYXAPIrWJZcywj1CoMd0FEIHyCSmpkzb7YhF+waQchBK6VwJOGz4ibE=
X-Google-Smtp-Source: AGHT+IEZInHp+9rgeAuckIp6cJQfSWvhm8Zsy0W3A3PB01GI/sfd7xFPa4gn9aBZ52W+AAwoj8BOCg==
X-Received: by 2002:a05:6402:1ec8:b0:62a:82e8:e1bd with SMTP id 4fb4d7f45d1cf-62a82e8e395mr11930164a12.32.1757590782260;
        Thu, 11 Sep 2025 04:39:42 -0700 (PDT)
Received: from localhost (i68973E31.versanet.de. [104.151.62.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec3400da2sm1035690a12.42.2025.09.11.04.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 13:39:41 +0200
Message-Id: <DCPXXM9P6F0V.5COAK4KHJHZI@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: "Taniya Das" <quic_tdas@quicinc.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Jagadeesh Kona" <quic_jkona@quicinc.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power
 domain as a parent to other
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

On Thu Sep 11, 2025 at 3:12 AM CEST, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM6350 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.

Thanks, I've had something like this in my camera branch for a while,
but since I've had enough other problems with clocks/PDs there or camss
not working fully yet, I haven't bothered to upstream it.

Thanks!

Regards
Luca

>
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for S=
M6350")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm6350.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6=
350.c
> index 8aac97d29ce3..6c272f7b0721 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -1693,6 +1693,8 @@ static struct clk_branch camcc_sys_tmr_clk =3D {
>  	},
>  };
> =20
> +static struct gdsc titan_top_gdsc;
> +
>  static struct gdsc bps_gdsc =3D {
>  	.gdscr =3D 0x6004,
>  	.en_rest_wait_val =3D 0x2,
> @@ -1702,6 +1704,7 @@ static struct gdsc bps_gdsc =3D {
>  		.name =3D "bps_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> +	.parent =3D &titan_top_gdsc.pd,
>  	.flags =3D VOTABLE,
>  };
> =20
> @@ -1714,6 +1717,7 @@ static struct gdsc ipe_0_gdsc =3D {
>  		.name =3D "ipe_0_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> +	.parent =3D &titan_top_gdsc.pd,
>  	.flags =3D VOTABLE,
>  };
> =20
> @@ -1726,6 +1730,7 @@ static struct gdsc ife_0_gdsc =3D {
>  		.name =3D "ife_0_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> +	.parent =3D &titan_top_gdsc.pd,
>  };
> =20
>  static struct gdsc ife_1_gdsc =3D {
> @@ -1737,6 +1742,7 @@ static struct gdsc ife_1_gdsc =3D {
>  		.name =3D "ife_1_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> +	.parent =3D &titan_top_gdsc.pd,
>  };
> =20
>  static struct gdsc ife_2_gdsc =3D {
> @@ -1748,6 +1754,7 @@ static struct gdsc ife_2_gdsc =3D {
>  		.name =3D "ife_2_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> +	.parent =3D &titan_top_gdsc.pd,
>  };
> =20
>  static struct gdsc titan_top_gdsc =3D {


