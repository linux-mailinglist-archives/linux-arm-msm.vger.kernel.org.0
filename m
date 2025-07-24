Return-Path: <linux-arm-msm+bounces-66601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A1B10EE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 17:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB2893BB8CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2702F2EA486;
	Thu, 24 Jul 2025 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4fXOLa2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB021D584
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753371668; cv=none; b=oTJ3BN/WCUElwzTHL1GSYYYs7mP/1kJG3jBg3sUsk5As9oTkfMmuZ/8uGvCgsS7Z8hoc9MWE5I5CCfQ6xGTTDMzIedVwSn22qPvQj/jyu+xZwk8CEO9i/tWEN90NQyNx7X/5S1iXp0+sIkWzbSNkti0xHnoAby152nczTADmJaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753371668; c=relaxed/simple;
	bh=rL72xLvDpaYB5a3K56U+QX+tDm0UKRXbjJu7lpGADJA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LQUZtw1iNCSOmhrYdlK1foYTs2Uk9CUq2EYzVqT0YNwe4cn+LWyGofOKxSebM//sInThLMTu7tSawHjnCzxyOGhXVaNSrLlPhs0sLrMzVgeiCkBdpf60GjoVRvBZh508Ut/HZ7U56X6GfkwkH8tpGYLDJN6EJQ2Em93oXFB/1mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H4fXOLa2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d6ade159so7745125e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753371664; x=1753976464; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijalKac4tH/bOL3hkdX4ec4lsO5RsEUy1SQ79bJniFw=;
        b=H4fXOLa2L7z4w2CWSCTh7c+w0wpqWUYXBVlunlre/7F9iX/aefEVA6PyBEht1wCa6T
         EYGYyjMXJRU+t2Kti3H9VLa7ebbewV1ZoOFNqlpAH7xpKxno+liAUvG/Tnsamk28LZVF
         FZry65eCK6e9utHQZ9bjdvEFfPyWafUN2nFZ+a1CTQYSnvlamy+dyOdoIIu+JWA5iSE5
         Swdxljkm1kCqC4cKvkL6aPjVGeKbXbTPcYubi6HYQxb+h5ZNefBLJ9oj2O7VdQu9nI9H
         koZwt7Xj/rw6yNjOrG6M17+66L8FWy2Y3ohgbk34sbt1URaBOVd92uCxZRD2thEO5Cdy
         Wigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753371664; x=1753976464;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijalKac4tH/bOL3hkdX4ec4lsO5RsEUy1SQ79bJniFw=;
        b=qOtSYFPuU8clRunCuC4xyzx7nbQSs70dNpjhcg3KUvJmqGU4EZZotV9bA2Y+E+lR1X
         RR4asQC9ULnwClQh9GUScxw3nnWUDuFq+YOp2q37HWzGRYtqZ/ZK3h0w+06MU1iIBy15
         PRkw8fqSDY77awwPg0W1E9HJ++o8A0ETSugh6BfjiRSEpH+q3xBZxQrg1BCKRtTa9tlu
         WLee9CBs3QejDrusSzfo8pEoEXI/UnpsIQA9qd3crT0PRP64GsEtLybzJbskhBOsflha
         SyNLm3sIjXmqhRKI2VV7tGqmRnjjKcyzM66RL0F7hm7UxFSDfKcF0nIcrTWKEOya6s2G
         g19w==
X-Forwarded-Encrypted: i=1; AJvYcCXgwuoDLBOR9eCGZnsi9LsN0fqaGwxai7Lb+nZAgyjYAkz9XeFwrxSib/5g4vtjhQ/CLzVgU8NIxZUGj4XC@vger.kernel.org
X-Gm-Message-State: AOJu0YyEMsZkVNH/67cuIA3psOtCUDv2JEeWzXs34Upg9NchydwnlOvc
	sp8K4RG+psZMtBpoVrWpQjNqIwcwYokFjY6KXDCBW+/Om0NxaIwcwSJABHTJ9C+E0WY=
X-Gm-Gg: ASbGncuV3qkbF/NXL7WKGvjhg3cejyTf7ZqUovxEyO66PTJ19tiYd/GwPVduarucFcB
	BfR8XI/uREH7Efb4WQVsjNLgOr4Xf98s6V+9sId7HmcdvJSV36yLp2N4l8pi/qk/CqGwtUQoPvt
	VGTBIU0VF4AlP2ct8mCE0oe9hcXMog4Ff5Rwo7mFZ1Yy3kODqaf2B1NWL0xOloKaQhFnR/ET6D4
	aAjCs1G3HKIoCPZ2OzRyS6B/Bqd8UfQ9adqIER3BIhqFT+SaS0Guv9P90S7fZuDh009XgIIJOyf
	eJKuNy1x8oM0SNz1jWy+wkK57aBfpgYoVZSjHuEWBD9f7G1pmqpTttTAONaXr3nG4Gdwv7UVh2b
	6J2BR6Vy9PjxBTvlPTpMoOc4D/ozuopNSt+vSRA==
X-Google-Smtp-Source: AGHT+IH+Kt4CbvgwU5Pt6jGjtNicK9BRckQRniUA+bTcD0KYObJ3m+6Ey87TiLjq1ghjyaSgL9Tpdg==
X-Received: by 2002:a05:600c:8905:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-4586954d51bmr52814455e9.8.1753371663558;
        Thu, 24 Jul 2025 08:41:03 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45870553d72sm24018765e9.16.2025.07.24.08.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 08:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 16:41:02 +0100
Message-Id: <DBKEDPOEQHOJ.2DA0F5PUZGCJO@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: add new pm4125 audio codec driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
 <20250711-hungry-uppish-taipan-a0a35a@krzk-bin>
In-Reply-To: <20250711-hungry-uppish-taipan-a0a35a@krzk-bin>

On Fri Jul 11, 2025 at 9:29 AM BST, Krzysztof Kozlowski wrote:
> On Fri, Jul 11, 2025 at 04:00:11AM +0100, Alexey Klimov wrote:
>> +static void pm4125_unbind(struct device *dev)
>> +{
>> +	struct pm4125_priv *pm4125 =3D dev_get_drvdata(dev);
>> +
>> +	snd_soc_unregister_component(dev);
>> +	device_link_remove(dev, pm4125->txdev);
>> +	device_link_remove(dev, pm4125->rxdev);
>> +	device_link_remove(pm4125->rxdev, pm4125->txdev);
>> +	component_unbind_all(dev, pm4125);
>> +}
>> +
>> +static const struct component_master_ops pm4125_comp_ops =3D {
>> +	.bind =3D pm4125_bind,
>> +	.unbind =3D pm4125_unbind,
>> +};
>> +
>> +static int pm4125_add_slave_components(struct pm4125_priv *pm4125, stru=
ct device *dev,
>> +				       struct component_match **matchptr)
>> +{
>> +	struct device_node *np =3D dev->of_node;
>> +
>> +	pm4125->rxnode =3D of_parse_phandle(np, "qcom,rx-device", 0);
>> +	if (!pm4125->rxnode)
>> +		return dev_err_probe(dev, -ENODEV, "Couldn't parse phandle to qcom,rx=
-device\n");
>> +	component_match_add_release(dev, matchptr, component_release_of, compo=
nent_compare_of,
>> +				    pm4125->rxnode);
>> +	of_node_put(pm4125->rxnode);
>
> If you drop it here, then you do not need to keep it in pm4125 in the
> first place. But this will point you to the problem - what if
> pm4125_bind() is called after you dropped the reference?

So I guess the right place is in pm4125_remove() right after
component_master_del()?

>> +
>> +	pm4125->txnode =3D of_parse_phandle(np, "qcom,tx-device", 0);
>> +	if (!pm4125->txnode)
>> +		return dev_err_probe(dev, -ENODEV, "Couldn't parse phandle to qcom,tx=
-device\n");
>> +	component_match_add_release(dev, matchptr, component_release_of, compo=
nent_compare_of,
>> +				    pm4125->txnode);
>> +	of_node_put(pm4125->txnode);
>
> Same problem here.

Thank you,
Alexey


