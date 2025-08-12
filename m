Return-Path: <linux-arm-msm+bounces-68751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D604B2252C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF31B3A686C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF2B2ECD33;
	Tue, 12 Aug 2025 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="ZN2aCNDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C66A23BCE7;
	Tue, 12 Aug 2025 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996528; cv=none; b=cKrwus4kGhf9wpvJ2xJCJX3LNkUNGp+9o5jthUlu0j5Q8bW0zsBWXtmALNEOGf/HCA1EcXNrx8VfmW5gT0powb6p5HFG1kUeWHbLHnisyhE7UPjAWNCmofk9r6b+1qjIChoV5mCc63hYmDnTGdDK8e7r+UEEQ5B1ruAAVwaEPwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996528; c=relaxed/simple;
	bh=3OwEx3ATq9hTzfxnY3gg+hw0Eg7P8zJzOgQ50ls1n/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWlFv0zNXvp4wAtf+yuQSXsv8fwgwG4MSK+PtnORHTOrFMYWVZIVJUmSyLz5YjJbwT6VF4w+hqur/EQ62OzzKPpq5wjUPJVYtwNDaNbuyJm+RORmZV3nT0jPgG78Jv9yCflWTIeNRQQOca9ZNGWMlgUAmUSSg5TIg4Gzvab6Bos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=ZN2aCNDZ; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1754996506; x=1755601306;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=3OwEx3ATq9hTzfxnY3gg+hw0Eg7P8zJzOgQ50ls1n/Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZN2aCNDZ7+fuca61kc8CwXfxWDreYBIubAXXY/0vhJZejfjvV3QrUYr+23fiR12H
	 uU9WPoA2nIee4iGyVEbsAW2YoGFcX4Rk8WAwWgeA38QJyWBqfOKX3D5/TRn/W7vvz
	 Hpxwh3ujch4RPenca6d+PR/hkhkC2Tv1OLRET1XM6B/Xv2tjAtNRe/rvHnHuDmn07
	 GtmL2h9QKnANIlqNQN3bV139iggemmRFK6l3h2r8NiLDvT8Gl1gdHsBS0ul39HuUu
	 TWh0L4YqaH5nI7EeviiYQ6bNG50HW4yE1rdJ0rIpX8+d8FZVdZ57vfWLd8ItswoPA
	 n8qIVOgOcfkA7IybhA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.107] ([80.128.171.52]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M6lxe-1ufi5X04P0-0063Tk; Tue, 12 Aug 2025 12:35:45 +0200
Message-ID: <8672fcd0-cae3-428e-b1e6-cfbdea1ebbb7@oldschoolsolutions.biz>
Date: Tue, 12 Aug 2025 12:35:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250810-tb16-dt-v10-0-0bfed6d75c69@oldschoolsolutions.biz>
 <20250810-tb16-dt-v10-3-0bfed6d75c69@oldschoolsolutions.biz>
 <388aed37-03c1-4a5f-a425-5ed8c4f9cb34@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <388aed37-03c1-4a5f-a425-5ed8c4f9cb34@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TKFUv73J8yNj5Mz4hRnRFr6FPpJQYkvdiCBpYbKd9Prxuz1qIWS
 9NJm9gFQ9CTjMut18m4Bmfw2YOpQo7doTleF6kP9b4uDz5UyNBJ7oPZ9SDx5a8b1XXrk8VG
 RGgv9Pq2vHG5+UCWRBnQ0gigRX45I49xvUwyO4LwfNsusmLjJve7uOpxnYSR98abXJXatAu
 QU/64lyrPzFNxzoHD1QLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BO9bf+wCaaE=;21li4PT0UtvQmLP3+6YDaP5Sc/T
 5T+MwSOnH4GK9g+0tLn/MzAK/LoPaGqIm1eYDtMeun3n1fVSxXatmK8M9RACEB1FfhbkFP8ze
 w/7vGJ7TS8CUtUtwVpLCxeKEfFIKbk0yEht+CYi+2c/DEjoLRfSXtHNVflfEa7ypJqsrvKmOq
 WHs+VwR+sSDac3wPa/WKCXZU9a+3LNeyipDpCALGldTvNoOOnz5F6uipsz4O12IuRANweXJfl
 TGJ85fExqvxprVOjZS9yS76yjHhjrL6uM7IEOLIMWSqz3LSiadLU3gGxydJknPYO5ez145lUC
 WYYeQ/1YfoAsLYMhyIdhuodmILCBM1zIFoGAmlwr8R+khUz89qGUwly5x7YYnncdCqBqL8Qt0
 kuo4Cq/dXL5O5497Hkzn6K+73/70sTKobAle1fIYUEPvnqg8hpQKP3bslYarM2KUWZUT/R6md
 d+4Eg2yCBmr/DsWgcHyq2hULmYpBusKXmMKU377hg4YTwXrZOmjOMoqcGb4pwOXzkNNjMC6Rs
 PPBJKT6uMh6ZH5nq3lMctOG7Fsp/0BAKu2VeS7m1IhkGtxgnzrJ1ePTQomdeGLva6/P39URmk
 n9cWJKvkp4UyjO7Ytb7lCXwS8FvA1LnUnfvXR38vLGI/JJSMsmx2mJMxBPa3XV39kb94sa7+0
 BvrGOA5icihVHQeUITYWhACAAvnYmO93WdR4cR7pCKuRKPV7xqb16dMGIqmxkrHmW0ESJHBB8
 DUTTmxpPV2uIu9sM+BSED5HL6j6BNRi74a7/FQg0gjklOir0LOjfo9iqitpEfiZ/sJc0dEaCM
 DXpcuPJXPH+gMcfFbENJa6741Vl/lDtFHAJj2HhHiVpF2UZDKHXNzQNB/f45Cdk7/5jpyVCYK
 TnYJsynQNOS34oXIA5nIsrCWIhUATnMxQfodT+1Q9b6SGW6jdKFR12+UzA8eKp6D3kD9p1JC0
 /zIk+SxzG2k4eL2Tyhaxd3olYarZZVmShMwj853+euP5ft0xJg4MLmLUjtKQhRT8azuDBW0Nk
 FpQEdLV4QK4g1/4Cuo3fL7RmUz9ImstI1dT+1onGPt10l6NjQPDbqYqP+vw0YXIn28JSXTRQH
 esmG61e7Rs/fNhbjqUdxyrYqhLdes7i8wbB+nt7pgHshFjUKn9MYzuRSlXK46EnvwAum1IuyN
 R1Htq9aEp/AQkp0rmXYl3O+NqjEwLPXwa91WfHJKU5/Tl6HbZLpUW5jvXvYwrbIhWiQWgBktf
 esNAFT50sKpPpYBaafTWj1gy1VCjTuwKnX5wAsrX3YA9QxQ96pi6hJw/zTPL3ubjWxsXseAhg
 l0lRrTPmYi/61UKWkPq4GHpL55xP2pGPkSIWWKUAEKfbxJBxf7xzXvIJUp+LKZkXxFnpw+Fi0
 Ork6Ts9hqTX4ygo5L1Bgqi1pjf5vprsTK/7uu1sbUfAIgMBtF50yT/NgHfVf+DWHKieoGZsvV
 lmywC28cOPbvaLtHlp6S1hBfyH3SmtJYsdn3Yu/pska4wqepa57uxI0gelQk7IIPFT25MB4Pn
 ihBWz5Z73rBx/Jbcnp/BEgSCYNccusxwy6rGbov5jAw5d21yc3IkvuO9UhftfQvCjs694BAa1
 HtousJAS0CWhG8XEWILYOeWMwKQ9wAE7dG5lNVD7yrhhS80max8Nw==

On 12.08.25 12:17, Konrad Dybcio wrote:
> On 8/10/25 7:37 PM, Jens Glathe via B4 Relay wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/ar=
ch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
>> similarity index 77%
>> copy from arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
>> copy to arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> I understand that git may have gotten confused, but the diff is now
> impossible to review

Oh wow. Yes I get that, haven't seen. Needs either a tweak for the=20
similarity index (needs to be really high) or I need to disable=20
=2D-find-copies-harder. [1] How do I go about this: is this a resend or a=
=20
new version?

with best regards

Jens

[1]:=20
https://lore.kernel.org/all/20250705-format-harder-v1-1-55c5342be55c@oldsc=
hoolsolutions.biz/



