Return-Path: <linux-arm-msm+bounces-78171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D69BBF6928
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8DAA94F2C1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E03334370;
	Tue, 21 Oct 2025 12:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APVA8szD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726732E73C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051375; cv=none; b=kc2LUihPVBgbvKrFbyxtObn0rT5qzeT6oasf3OCnf4fwjN2UibTEVqGkwoGxF679EdxpQl29BMdRzFFWijP5vgBCkHscf9y805r9Sp06yBa1haS8m7mBMepY0lzv6gW6EGuyA++ccvGWKHt2haTZG5EeaTXBDkPRBJm6ScMSexw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051375; c=relaxed/simple;
	bh=G6BUtnjEM/zfg1qCW1pFmzrsk68q9uL7cRAs98tzYYA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=bexpVNAqurU2QUz3EM+E9tw67IHZU/aNSoq8yUeapKeLP/dMsnFRokSNQU9no51UKEsA4tiVWOKB7kLaZxsw3mfiJe4tPOaGkkOvVbA/WlchINzrirfoeoaaHBhtgaSRNAYsdVNI9XwwvJ5tL0ApfkC+4IYScNeVWXpDRJnT1xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APVA8szD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-427060bc0f5so1848434f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761051372; x=1761656172; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3+jqWip4cBpergxUpE3r3nDPRXBu9AkUkhJj9MutYo=;
        b=APVA8szDJAiTkZJNaj6Hq1AuBwpvzZ6SSMFTJ1vHdGh14L5DKXxBvCWI8ApIJGsVdQ
         JROzQdlXEuQnTZRpYCtwqhSdJIJAt4m2ZyHwkqMUQNQ8CzHZXSbiQc+WUtdBVCA0dXIr
         ZINJbqJOSId0NLQfEBJw3tOgCOKWv/CJUDg1MOXLbixyfMFezCKtU0BSfHwzCJNvAKJD
         eR/RgeIuMFvUU6iD7C0UvfabIidwx+uu8zAFd91jx7QTXORa4UF6BTQqukOc0OKC2DjV
         pbkkAhCrgYOrW/YVZnPurAuQi4PtAMMRfFAUgKtXVyjIPNzsmTegpdcdRE9QThVoJILN
         1Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051372; x=1761656172;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D3+jqWip4cBpergxUpE3r3nDPRXBu9AkUkhJj9MutYo=;
        b=xKHGM4hveTsrIUhW2uXA9G/C+HLvOPY0KDd1I/J+jWHD+GIGenJ5+NPCiBQIztlyaw
         /ktm0qxgPJf/Vy0zYR2YOrXVgnaf0c9Jnp9znc5yH8YDrmBXltnP9QqQqqKhZi5xSdKZ
         N+WI0rZSQWTSLKi40z2e2nAIjMXbpsdcTNCODrsNuLLdC7NJyDLNCMM7tlwGxhzSkq+q
         eLcfngp2XbqgIA67tMHzi+218VT4zGT8WKeIzlI0uGWy5Tx4DU5nAxT4tJcaS7wWt5BT
         kdnz7hKlh0ywDfjMbWzojIAqu147PLioTKXq1ahnNc8kLN50S9pE8aGV+YR0leKR9uKd
         VFHw==
X-Forwarded-Encrypted: i=1; AJvYcCVOS54CVIZE5vvYMmdfyi1nk8Rd0R2wCA/oee1UXoET9I2+8ZDOtyCT+wasVSsrmQQFvkMRCWhK6OBkMA34@vger.kernel.org
X-Gm-Message-State: AOJu0YyDAz3Vj8GMKhMOlelrAkHVDNCam54dZblaHvNMy9McfgCqap83
	a72+5jhLDv4QqdD25P3CvryUUzKISgqgve2ZGVXIF5/mSdSgIK5+ZHY47PPDKp9h7TM=
X-Gm-Gg: ASbGncvFCpukqOvsMsE6C9S54xx6xTySOx6RFP08FYy/pVG0CLUdjEYg2OYexys1qyV
	CSKQv01JUkHkJJWUP3E6c5c4LXisXynu6jsV4nkWbZaKvyF7sS6HUm20xU1CETBmnGN/241zFZI
	EDdKuf2qf7OTKIGP0FSXmyBrMGHzMuDA5PeyDSQ+BdNttT3+tp1p4hvBGfUI/jTTgqfc2Avmbp5
	YNz4Ee8q1SGT3DjlNejo5VnC/7mkS5jBkWvEj6oGBMrVa4Wsxaj00pxKSxXmsQhTSPnPlFmvktR
	Qdn0wBkHD9QeuxblNofC7zz5pE1hgb0+BwKLwn19ha52uE2YO6Mttm3RI/6pAwU3MCiu+Hd3xkh
	PHpBOt/ld+g1zyWeatfkZ4IB9zBEGXk8oXYkA3CIaKmMxioFHsJ1Y/nLAGz/0AtxUzhJZzgBVeT
	yY8Lqy
X-Google-Smtp-Source: AGHT+IGwoXv9N8+tNudgKcCBOtAB/G2QWEcSJ7tMnIbD245sZlfvNJ9I1xX/MPofutEogENazBSdSg==
X-Received: by 2002:a05:6000:1a85:b0:427:f012:5943 with SMTP id ffacd0b85a97d-427f01259e0mr7681625f8f.17.1761051371929;
        Tue, 21 Oct 2025 05:56:11 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:8d4e:2f09:764b:8b5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b9fdfsm20142679f8f.40.2025.10.21.05.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 13:56:09 +0100
Message-Id: <DDO0LYS7UTEW.3A9WGTAA5DKVO@linaro.org>
To: "Bjorn Andersson" <andersson@kernel.org>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
 <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
 <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>
In-Reply-To: <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>

On Fri Oct 17, 2025 at 11:42 PM BST, Bjorn Andersson wrote:
> On Fri, Oct 10, 2025 at 01:29:38PM +0100, Alexey Klimov wrote:
>> On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
>> > On 10/7/25 4:03 AM, Alexey Klimov wrote:
>> >> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
>> >> controller device node required for audio subsystem on Qualcomm
>> >> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
>> >>=20
>> >> While at this, also add description of lpi_i2s2 pins (active state)
>> >> required for audio playback via HDMI/I2S.
>> >>=20
>> >> Cc: Srinivas Kandagatla <srini@kernel.org>
>> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> >> ---
>> >
>> > [...]
>> >
>> >> +			lpi_i2s2_active: lpi-i2s2-active-state {
>> >> +				data-pins {
>> >> +					pins =3D "gpio12";
>> >> +					function =3D "i2s2_data";
>> >> +					bias-disable;
>> >> +					drive-strength =3D <8>;
>> >> +					output-high;
>> >
>> > I.. doubt output-high is what you want?
>>=20
>> Why? Or is it because of some in-kernel gpiod?
>>=20
>
> What does "output-high" mean for a non-gpio function?

This is not efficient. It will be more useful to go straight to
the point.

This description of pins was taken from Qualcomm downstream code
and the similar patch was applied (see provided URL in the prev email).

The same problem here and no response:
https://lore.kernel.org/linux-arm-msm/d8e202fb-f494-4b5e-bfb9-c94c1fd3af4d@=
linaro.org/

After looking at
https://lore.kernel.org/linux-arm-msm/39ebaf4e-e91f-4568-8de6-9fc1f805a1e4@=
oss.qualcomm.com/
I guess the output-high should removed at all (if it is the case) but it
will be more efficient to provide that as a feedback rather than vague
responses.

Back to your question -- does it matter here if it is gpio or non-gpio
function?

Best regards,
Alexey.


