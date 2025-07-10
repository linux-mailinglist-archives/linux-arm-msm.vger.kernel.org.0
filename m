Return-Path: <linux-arm-msm+bounces-64353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC9B00096
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 13:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2CC23B57B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11691E9B2D;
	Thu, 10 Jul 2025 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="ttYY/QiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE07C8EB;
	Thu, 10 Jul 2025 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752147120; cv=none; b=s6GXaOhbi7XKbeH29Eeq46bw5wPIf7Lo9YuRPjLs9sZ7MCH14vCzErBT+iC3UARdHBeFP+/A27EJwujhmbQ0boAMTimGjjigZDYajrU5UgRCRzvsG9jEmI5Aom7O49PzIDZzFaX0SlYuX+QszNli2FhYzwyD133SL681XrKno7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752147120; c=relaxed/simple;
	bh=veiSIyO5h+Jn0NkjIFFPBiRxaozm4iNhyDlp5Cuuivc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0fTIierziYdZJ20QytBmnSYV5H0qj03nTsY24y3w/FsnlwfI5gOed3VaMJhVGASTrc4yOrY434VToIyTpY/cddWL+lrMvEG534aisH6YM1BPrz0lIItSrvK9EuOw9tHUaigRHtuQkhuGwt3RrOBcBpweyy0wG4w4VUEJhAe+VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=ttYY/QiH; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1752147110; x=1752751910;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=veiSIyO5h+Jn0NkjIFFPBiRxaozm4iNhyDlp5Cuuivc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ttYY/QiHaidnzgG9zryNKG1G6yBmNBRgjM1643EMq5Q74B5xur6M7+VDYe/kufMl
	 jn354P/V1kAnJaqt3OGTxTm/YyGlnUbiW2H07ArWL/71iZm63PEemG8pD/kOJDib9
	 HwLYbFDBP2Bt+I72yp1MSXHr8nvX2fXE/JZwjgeJTGKptRPsvnvxvCn3KawSA5rFs
	 jxQh/5STj42JMKuaftui4InSbR+5uHxpORqp1gses/7jeY68JWlHX2bwP0Dtj8NPw
	 aoicZ9mXHUnHzjsU7G/aapz+XgNkRQfVmVdPPX2Ezz7HQ5juHZNFYosmp0khaPM0x
	 yiIp7zY6woOPVt1UAg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.107] ([62.226.41.123]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MA4ja-1uOFye1z9G-00FAtR; Thu, 10 Jul 2025 13:31:50 +0200
Message-ID: <056c3569-02d7-4668-89d0-91a8d92814ef@oldschoolsolutions.biz>
Date: Thu, 10 Jul 2025 13:31:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook X14
 device tree structure
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
 <20250710-hp-x14-x1p-v7-2-19c10c81713a@oldschoolsolutions.biz>
 <aac2a4fb-c9e8-4e1d-b0cd-d6481dc27252@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <aac2a4fb-c9e8-4e1d-b0cd-d6481dc27252@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tpb5aofj5y62ZXBjqRcxLwNQ+Z93p7O9OB35MiIouuuv16gP1oL
 +Hw8jXN4lD41lW2dvbEphC6yb+jeHlI9V6j0DBf+DMir+uut2TJQ3sOyOG3k0aJVndpcbcT
 QVgxMztSsiKPztZ40cMrznnK3i1jE6x2NHYKLy9LyEAju+AmsKvFCmZNehfbBSsfnaLRT+c
 rhXE1VzELqHV5PgBhoVrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6OwrPtFUynw=;e8kDEdPxcF1sDVTIBF9EnVx3sF2
 jXbXwlTHVg9vlHqU1lpeVOw0O2u88I+80DmKQIvt804dqyFRQPYa6Z+d56G0Z/nlInalr2ezh
 rdOGiIgn9tU/kv3NgLKRVXMaAbbA7n4fXKhsaLpjUtNQ7LtDL5oFEMToy3A6pmBa9UERXRkd1
 WVTUj6Ka6eiIfnYHZYfqyeedduVgiwlIgPZYFytB7pBgZsJCJa7uklHaBbcOq3gN+6UMz6xPd
 EmilTimy4dOFQraYKnSy4OFdIYpi/xIrv5BMQJiOcTFxjqHStho/B3FAJ9lp+qn4HQIpMh6FM
 UcT/kSuvIiTkcoH7JrP7rtfIhRHEWP5QCmVXPJnEs2tzpPmaiT1vIQqCIjpXadxBMwp9S4dEb
 zo2mzVqiGSf96YVyQtG1EVcPy5grHmRjp2cAM4yaNeELA2DrUqiezLOUp+e6csHEqTeoGTCKs
 XC98nF6sNuWdf/TpukQtOMzF+N6jVgGrHgIKLN2R3s/xRdUI3kfwMGJXxAxnD9VOB6MuS/YiO
 WRIog3RReAr/jC4kzK5FBhhoc5UJU8Akx3Jn+VoFccG7YTMi4P61+OPJnqjJbAG9TN1w1sxQO
 z9w6G8+0eHTL1y4eSRn53DlzpXI0nmRm4y2zS9Z1yiPftXiIdW4FiLHA2LJDsyPGgz7EVMwyQ
 httTvGwxKppi8d5JOMzm77eP0fcASg1Qm3ntmdVIbdRbo8AocMTwloWAw/Q0FfKCWmyA9C1Sd
 Eb0rJ3C19WA0F4loOfSBhLAkiRPaIYD+PSNO21kmszkFMrrl90EY9UoujbySMfiH9mV8jlb3G
 Jr3u2MJPJZq73TTVHXZobursgibhGqexEpnVJOSIFLB+ZSZYKoQ78Wi7yS9MN9A63JpEh5+hK
 uv/uIB6TmmwWDw4F5SvS7qY+vmjg5LNIPJHKtkisS10vbUqpTY9q7olS4G4Z9UjpHBXzbHot4
 g8Qe0DCP4ld8FRbeQjY9iNS4EHymspdilHoMBryGysFqueUdLFqdaFzybNp7Lc/i7x+jKhOGH
 FZ9BB5eI3CxCneuyW+GMIGJ0OgRLFJTPneFFGGhj8Ey5xZH/sUL3RoM+AzLRbwMib2CwXXY8h
 r58IDDzHn/zSw3MYoaN+qslu7xwcgDGp5q/WGSY2s+EQ57bAVOh71aI+wepiqU3X3IHJnDkGx
 gc546UrvVp6PdkBi2wqjTLxLgnRFltJ7s0j3vH9ulUm5A4HB6hfYjYycLBcRzxWKJGCecBYBY
 q+YRc1eCmoTlET6imj/BDln6RpLlwBr7fy01LOPPbhMtbBpKX/ycAVsSLQqb6YacAQ7+eKaNE
 J1NvzvHi1T6ClO/nLOqcm9ZHZ0GY8t1zMhhTu9Qp+qbJwAg1NhRIfT0TgyINOdLd155h0PaYD
 O8xQ3uxbmSyvk3LH0ZH2zhqSwhJLuV/g9LBQ2gF2TfzqxlPpyX79rv1KLxdsMyKPBhvPwRV7+
 akrtPH6hcF9hMl+caOBP/0ZMqCghYXytmvYEMBpbpc8XZ9oU5nbt3PLa3A0J4169S00QkObcj
 VVqq8iDPRJwvVcvv9idhry/iJgbqQO5rDl4LXHzCzD+CzBbLaEbhu7BBgCgSnQ==

On 10.07.25 12:55, Krzysztof Kozlowski wrote:
> Why am I bothering to review if you keep changing and eventually
> dropping the tag.

Sorry about that. b4 didn't take it, and since I changed the commit=20
message after Bryan made the suggestion, didn't know if it was still=20
justified.

with best regards

Jens


