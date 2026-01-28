Return-Path: <linux-arm-msm+bounces-91047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIY2H6Qjemmv2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:56:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820EA35AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 714F23044A6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE51362120;
	Wed, 28 Jan 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2VBK3Vu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902EC30AD1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612018; cv=none; b=kfr61y83siSw2qfvXo9b8wzJDBKfxRDmB6vUpxPsXQmpRiR+oz2r9QzteepfmxqmPR83RXrtz2yFgt1SKv0sS3kQEwu8adPwo5OH4ClNI9XpISIVSEp2n1c1uV75H8XuFCkS5a5mtQ75uRckmVq00kyDS3vU9O2qVu7HPijGj54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612018; c=relaxed/simple;
	bh=RLGH0KLlJYKtiHI1o5Hc7krURGr/94NxReup/3F61b0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Bre0WYIktiyVHQQX5XPh4wkUidnt3LSW74oGgDGGmaLiU7pODOJ0HNJxBuUqVX/Y201nTkZZEiOLw/GtdzZ3zTfFEb+Ua1WwC/1ICqFRnsmL7/O1H5hzUOM8Iz+MSyu5kStrKsB7tN7k7eA0uB+6oa61bt7+cyR/KBEa5SyCf5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2VBK3Vu5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b884cb1e717so162437766b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769612014; x=1770216814; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tvMFVjPj7LszBlDjv0UEAIY+fzVqoG9LSfE8sRUrMQ=;
        b=2VBK3Vu5lBA6MLYy4oFSUJkVAPutIIKdV62A7v/I1JF/Qc6Bkn5OPE1dRB58pgVjOl
         FN6hU2dQNRI1w5UQpACYrs794d/ZOXmPCJOvE+Xcdk7R2mJ1JGNAojZk4XU4uCMHkrNc
         Juj8qNug6RyhvLWpzgWi9zF92cDtiSV/mFjjjcTRb6MT/TOfDXRg00wiAeadXjwqIJrL
         uu+pFGdKTsrwsSv+GVsmHZJ1bUye8elzi/HzQyj4qrh19VGWxRcj6aarrd5mgbyZLsWd
         X4A9lR4rjaDHKE+BaPubpQVIyqs8D0CxPFIhNPG8SBstzotuW+mgLpdpGryTrG7bZSTj
         L/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612014; x=1770216814;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tvMFVjPj7LszBlDjv0UEAIY+fzVqoG9LSfE8sRUrMQ=;
        b=ejY9eJhUkkSLMxBXWoc5hVIRCVVk9XDLj383C7BgKWnH6l5oKR/+QminJzrYMxXPCb
         8C4PABcSij3445Vgkz01738Y/TVwbjgFf4HcFT+lm5Bo8H7XbhzfZ95mxCVFpE3ruYu3
         rGLU7j/H1p563L21TL5BgB9Ymldbf6yLace7Te/VIZR0I81TfRGuwQ5eheeTtD4eHpTF
         AxhJ5vHXIkEdA7j0P0m4DsgNXS3HxErWp9YNEvvCrVTiC//m9lLY/+rCcdKaBxxCBNGD
         Y7CWG3REWJpqbhYpRFHnvuDwENzviLx1sXh4/0BnEOFv1GeJ2elKal5iOZwYszSxyhlR
         kRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVYCbMEaMwj73CHT0VXOgD5GxEK/fq86ZGQQ1EDgHgxuPIDYjD3W+TpkDHU2cZO5zHMP64BwucCrWH51gl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Fs3rrkaFXqXRGRfP7icEJePA5tdfGMeKI2603ADyjso37sit
	dgauRNXtNRbnGJuW3fsl4fXWEUvSnyYXqhW2/kgttmKP/kQekSLMujttt7XQZUUemS8=
X-Gm-Gg: AZuq6aLXi8JLCU5qt5FgyLDQgyI/FbTvlp2O/vg0uzAyf521KOqIrOs9QT049FUNrqJ
	CUTSsAxHEs6fc14HYtRkGx0i2EmtTB+/ERN2kk43iOY52Qk1ILUlGY0giBQcAiiNbdSlyVqyFzl
	C0tUcbG3YoAaEAWvPCGQ43/6631mQIWQWRV0Rep5HOZG57sSOxnYxrDC1tpjQqYhZ1P/k8eM2SQ
	KZsdk/cbJjkCW2SKVOEirBP4iMWAFeqe5xkWGdqRrj8PV9dVvSj9/4MDQl3kcF12K56UWfpKtnN
	UmKlmH1RZFJUOOKYMGgbS+Uq3NpJGS7m9k6fL8IfKN4JoaAfMlWn1qhnK+nTTolkYaMfEOCwccC
	crivGBw8lGM++zJwZgaWC7zrdqqQYwf5h7DQHW+nCrCMAYPs/7PEZnHPHTyj5KB65RgckTTCY1f
	iJKBwrh6wMVN17YV7599GIQl9yslM3ITettqzr//UGltho85vha+mWQcGRX+QRSx5/RPw=
X-Received: by 2002:a17:907:7b8d:b0:b80:456d:bd99 with SMTP id a640c23a62f3a-b8dacc41fabmr404660466b.19.1769612013870;
        Wed, 28 Jan 2026 06:53:33 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ecc68sm137096266b.64.2026.01.28.06.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 06:53:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 15:53:33 +0100
Message-Id: <DG0B3RX07B9R.1BLBFSOBR0MVL@fairphone.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, <linux-gpio@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-1-36583f2a2a2a@fairphone.com>
 <176960748074.1497503.9897313421386306393.robh@kernel.org>
In-Reply-To: <176960748074.1497503.9897313421386306393.robh@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91047-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Queue-Id: 2820EA35AF
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 2:38 PM CET, Rob Herring (Arm) wrote:
>
> On Wed, 28 Jan 2026 13:26:49 +0100, Luca Weiss wrote:
>> Add bindings for pin controller in Low Power Audio SubSystem (LPASS).
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 ++++++++++++++=
+++++++
>>  1 file changed, 124 insertions(+)
>>=20
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/p=
inctrl/qcom,sm6350-lpass-lpi-pinctrl.example.dtb: pinctrl@33c0000 (qcom,sm6=
350-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s1-activ=
e-pins' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-lpass=
-lpi-pinctrl.yaml

I fixed the dtsi addition but forgot about the schema.

Will include this diff in v2:

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lp=
i-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpas=
s-lpi-pinctrl.yaml
index 2fa2484e7bc7..4903b2d37d89 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinct=
rl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinct=
rl.yaml
@@ -96,8 +96,8 @@ examples:
         clock-names =3D "core",
                       "audio";
=20
-        i2s1_active: i2s1-active-pins {
-            clk {
+        i2s1_active: i2s1-active-state {
+            clk-pins {
                 pins =3D "gpio6";
                 function =3D "i2s1_clk";
                 drive-strength =3D <8>;
@@ -105,7 +105,7 @@ examples:
                 output-high;
             };
=20
-            ws {
+            ws-pins {
                 pins =3D "gpio7";
                 function =3D "i2s1_ws";
                 drive-strength =3D <8>;
@@ -113,7 +113,7 @@ examples:
                 output-high;
             };
=20
-            data {
+            data-pins {
                 pins =3D "gpio8", "gpio9";
                 function =3D "i2s1_data";
                 drive-strength =3D <8>;

Regards
Luca

