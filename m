Return-Path: <linux-arm-msm+bounces-94551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACn2A/0VommizAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:09:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6881BE827
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EAFC309B26F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 22:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCE647AF58;
	Fri, 27 Feb 2026 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yXIRqj1e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46E4478858
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230110; cv=none; b=FBaRxOe7BImu27bhe3VRIxf65lZnj05WEE1bYuJNTPb9JqgmHbRQZNpubzJ0YTJYY3HOpZHjzHhOzkuUi/6Bj8e4a2hveMFZyJieSwkMc/QLOnVPDfZ0fa7+3z+9Oai7BlkJnjQ/sj9JCCxFKFGblnQVjZDT24emf9yRYHR3kVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230110; c=relaxed/simple;
	bh=Mb2V1kz8SmOB9dG55Z05i6Vkzl2XRS9xEoOEgGRATdQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SPDT2qvJsvpx4cAJC93LDPI7NTRbeqxB5UeUcIsfn8aebawjXEGNcsmKZDYunZh74nzA3X5VVM5BSb5BtHL+EabYzo85RuA9IrQ0CpIgXVE5UUiBLzZrmSHIR/OCVYDEFLF9qnPTfDnOh1dr4KmptYemBBjKzKGek6nb5+V6qDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yXIRqj1e; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so14865675e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230106; x=1772834906; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dA5B+tb+Eq6OoOsXIA4NDTzmJV2und0D9K22z1ftkxg=;
        b=yXIRqj1eze4KGVBYoOdu/Zk4LqnljqcMPMFbhEUm587B2C3KDeiHzrtR/GcGTEFBVl
         twfHMZxiP16f3Mn//uYN+VA1ycrjSLx2TEUmIhLuwOyRzPeidErRgvfnE9KhfC5ml+vB
         b89IE7YlAn2ukIMILAa1gD4N3YXjjW50+lQqIE13z82M/c8X3hPwrctb1Uw2Fa+nmIYU
         UZ8psFWODopboDVWk7cRvpw3drxZ3+6s3HFDQgamINrc8UyF4gKXXyncQuZZ5Zv68M3Q
         qlPQlYr3I7r/WyzV4hk/fPh8FsgSapquAM14ArWSLZ/f2G7uDis2kLbwCaLO3DcbioVh
         zICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230106; x=1772834906;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dA5B+tb+Eq6OoOsXIA4NDTzmJV2und0D9K22z1ftkxg=;
        b=AvlSV4MXJlEaTwFjhnYnDOftII+XreJv7pMYBYX7gqUrvt2k6IHq5mTbRkOaCItrH7
         tfmEkNHkEOvMy87qIYQ4D359yIAoWuk8y8YOKa6Zca0y0+BuW6neUziwnw6NfyMlrLcD
         rxauNhyKgFZs/9Dxlp2U/bIBHdno+97G9RZ2gaWk6Fzm42xtjX3CwaKcQBCh91OpRE73
         XRzOlH6UXTAsVoPgiO8ai3EZzlnOdOeYE1hAp33n0Ijhqg8suELdP5ELMpbjUjOErB+9
         KDD1WLXyZ5UG7SFyDJYLhRGoY+vOUCQ9UrMbrhbxfr8J+YkHC1okjcrK4u2fpZ0jVjih
         5CsQ==
X-Gm-Message-State: AOJu0YxajgN3/x7OkFlw3BLjcgll1IoBCtL6cAhEcPfugFSlZsG+a5+G
	0nA9Adc0I6s6N348THo9WEQPUpQoytTzH4VVa1ImWBTu+VcySf4UnPssTM6x4T8sSrk=
X-Gm-Gg: ATEYQzzAGIX86PiqTM24utCanzxQPuk/I8s2BG2MbJexRNvZ8p/aj7ndXaLhnFoHTei
	qRkOEoH8nRSGvANq+5bu/ggXcn5nf684RbfH8urzrv61d9T2xRZ/w3xGIMUgRcbTwdCwwTo0l7e
	JaAhb7wBzY/1pPMeINWVaYCnazuNYj2ZBgRCbd2ZvVLjXovDcpsZ4bPVlqjoJs5be0BhhTNxANl
	/a7kMLJ0Wy6tDfp85ZiPnSYpQBuDgRDRUaO+EWo5kYvWAPxCwkz1DYR7xr18PRNJiJOQee7vO2B
	6DDTeqEfouJbKfbfmFhD7Gnurl9ynyezfHfHpbhdxQ1MEuNPA39XZeTazqJHQW0P++66g/8ZcTp
	hrqiC5yKIZLgDDQk1ZMzBfX9Gw7m3RNBvU6mDgirsJrCU7sM+Q8BcVoDNTtqYizDn8Yd4p1ZOLf
	uZOhk8E78rNMHST32zkZio1B7mV1VwbrKYjTvZGyU8dtXlUppTiZElJIk+pUPw1sIwKl0rFoR+/
	3vZMzaFJ9GAuJFllL0Tn/0T
X-Received: by 2002:a05:600c:1d12:b0:483:9cdc:8ac1 with SMTP id 5b1f17b1804b1-483c9b9eb7amr63356545e9.11.1772230106259;
        Fri, 27 Feb 2026 14:08:26 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm130583315e9.15.2026.02.27.14.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:08:25 -0800 (PST)
Message-ID: <58900cdf8f5159116b12278ba31da4aaea8d6cc5.camel@linaro.org>
Subject: Re: [PATCH v8 16/18] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
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
Date: Fri, 27 Feb 2026 22:08:25 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-16-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-16-95517393bcb2@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94551-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA6881BE827
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add voltage regulators-8 for Camera on slim7x including:
>=20
> - vreg_l7m_2p8
> - vreg_l2m_1p2
> - vreg_l4m_1p8
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.or>

>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index d6472e5a3f9fa..f10dff1da7f8e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible =3D "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id =3D "m";
> +
> +		vdd-l1-l2-supply =3D <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply =3D <&vreg_s4c_1p8>;
> +		vdd-l7-supply =3D <&vreg_bob1>;
> +
> +		vreg_l1m_1p2: ldo1 {
> +			regulator-name =3D "vreg_l1m_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2m_1p2: ldo2 {
> +			regulator-name =3D "vreg_l2m_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name =3D "vreg_l3m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name =3D "vreg_l4m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name =3D "vreg_l5m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p8: ldo7 {
> +			regulator-name =3D "vreg_l7m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
>  };
> =20
>  &gpu {

