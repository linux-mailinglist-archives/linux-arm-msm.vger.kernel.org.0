Return-Path: <linux-arm-msm+bounces-104830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB4fOpbF72m4FwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 22:22:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C8479F6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 22:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A7FB300DCC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F7F364EB1;
	Mon, 27 Apr 2026 20:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="YMzhjdp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9D29A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 20:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321362; cv=none; b=OZiIr86Y+7Hhjiws0rnnOAfrfvSQnSco8eJWWNmGUd31j3xgje+7D17GpPBH297GV4C6+zOvgB21pIG+iObVViKKYg205aANBEfrJJRJ4A+0bI62DC4IN/ZQQeZv5R8lXo6Rmc8Z0/c2vYNxfjMkZzajwEFSfDfmuaETfqQC76A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321362; c=relaxed/simple;
	bh=YTd/Z0HCcKLHukgv576kTNa9f4xPUI4kMQZ0Lh2Y+V0=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=TnsshqQWxt+kvhrzDIydtjldma1u41xdroSRgi0AV2INedjkqpxv1OjJ+RDl1juFX4+Zb4/QOV787coOCwTgZZgRmVajayEmRvQ6Jl4U4e3EYCK4TBitYeqjxpMOxs4y8ItEUk3p14zyXg65KKj8VF9QrkSqgNpjWqrZ8PQn+8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=YMzhjdp5; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1777321358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBUWoNvxUkGv0blpLp4hLR3tQUEDpc81rOZHnN/VVUo=;
	b=YMzhjdp5FNAhb4Z1tg0sSgl0PNTXf8kfwPTd2XHvmruWGEvC5xOYGB9qDihwT9c8ppRkdf
	auEJ/Jb62RLQJMjSVjfAqylbKIyunq9CRr97vOKUK4iCvMlhjGmfETa2lLCJXm5v76NXdH
	Qr7ltK+j2Fvzf9WvKqLWlf1QjdOiU+AgtoyWmwa/lerPKtMXvvIz/uPFCy5lbZDsWX+/0+
	LHU62gM+poogk3Bbx9CS5YHM2mLia9wFcr1D0bkTVmjCYmhku/alA5Ij8xVe8xV9K5FcVZ
	RQNGLfq2Q6tBzWF68Yzg8XCnHKOVzFMcT4VDvXLWkL/gg97+v0Vn2eW2k0FdCg==
Date: Mon, 27 Apr 2026 20:22:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <a0bbc97055846dae83db766e60a39899f09e1e91@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-lg: Enable
 qcom,snoc-host-cap-skip-quirk
To: david@ixit.cz, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Amit Pundir" <amit.pundir@linaro.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Konrad Dybcio" <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "David Heidelberg" <david@ixit.cz>,
 stable@vger.kernel.org
In-Reply-To: <20260427-b4-skip-host-cam-qmi-req-fixup-v1-2-4398e94bde70@ixit.cz>
References: <20260427-b4-skip-host-cam-qmi-req-fixup-v1-0-4398e94bde70@ixit.cz>
 <20260427-b4-skip-host-cam-qmi-req-fixup-v1-2-4398e94bde70@ixit.cz>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 740C8479F6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104830-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

April 26, 2026 at 11:44 PM, "David Heidelberg via B4 Relay" <devnull+davi=
d.ixit.cz@kernel.org mailto:devnull+david.ixit.cz@kernel.org?to=3D%22Davi=
d%20Heidelberg%20via%20B4%20Relay%22%20%3Cdevnull%2Bdavid.ixit.cz%40kerne=
l.org%3E > wrote:


>=20
>=20From: Paul Sajna <sajattack@postmarketos.org>
>=20
>=20The WCN3990 firmware for judyln does not respond to the request for
> host capabilities. Add the devicetree quirk to skip this request.
>=20
>=20Fixes: eb8fa3208526 ("arm64: dts: qcom: sdm845-lg: Add wifi nodes")
> Cc: <stable@vger.kernel.org> # 7.1.x
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
>=20diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 71d070619ad73..2d02d77d35ea7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -675,10 +675,12 @@ &venus {
>=20=20
>=20 &wifi {
>  vdd-0.8-cx-mx-supply =3D <&vreg_l5a_0p8>;
>  vdd-1.8-xo-supply =3D <&vreg_l7a_1p8>;
>  vdd-1.3-rfa-supply =3D <&vreg_l17a_1p3>;
>  vdd-3.3-ch0-supply =3D <&vreg_l25a_3p3>;
>  vdd-3.3-ch1-supply =3D <&vreg_l23a_3p3>;
>=20=20
>=20+ qcom,snoc-host-cap-skip-quirk;
> +
>  status =3D "okay";
>  };
>=20
>=20--=20
> 2.53.0
>
Tested-By: Paul Sajna <sajattack@postmarketos.org>

