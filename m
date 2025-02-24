Return-Path: <linux-arm-msm+bounces-49204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB45A42E33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 21:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAE70189B1EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 20:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499A224500F;
	Mon, 24 Feb 2025 20:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="YYI93cJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A91FDE0B;
	Mon, 24 Feb 2025 20:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740429832; cv=none; b=bz/00qfqrYcJKcaqMgJHfxdQyct5ETMvlyhMaBjKHZfoTlYzBK0cTuw0B5VN7RGIFZOLafibhb5WcMVooMknJ869If/VrisIDkYTUj4nO7Rq+vcD6HrxtswnDR4M6q7pTul5y2u4VfczLW4Hthhn7inRqZ4c5FQVWQso1hbJH9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740429832; c=relaxed/simple;
	bh=rvbdOy4fuBrSGEQQD49/68Vtl1Atgp4vEU7Tw+AbOCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wzt3uFx2eOlUQwnMNMzXG/vjpjyHDLUcvhoPe4eUYJzbuEnzO66shLGzOFUmUXxHcfz0QwlVpdXjqTGgcyTEBe+zwbC6xSNRg7OwRIFOgFnw20YfOxFoDCi0L9G/DdKB1ZWy7UKXHGf2IfkSiaB8lB6CpBc5OkFZ+hHwHD+ongs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=YYI93cJ3; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740429829; bh=rvbdOy4fuBrSGEQQD49/68Vtl1Atgp4vEU7Tw+AbOCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YYI93cJ3ML0XkkKoLoj3AWEbpPS699twI8GgjcLm0DYhFueIEuLdXkYna2TiWCva0
	 ta2n/67t+jgVoJ5PG1FveqmZljuqL8zaJckecN5RXKbqdZF2/UEEJbyfKTNAlwKuFB
	 OV9ljQUkGin3f9XLWsJ9hOx81lYm896wCruEUbIg=
Message-ID: <82a9d623-2033-4d7f-93b8-67007b46be79@lucaweiss.eu>
Date: Mon, 24 Feb 2025 21:43:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add
 firmware-name for adsp & wcnss
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-3-237ed21c334a@lucaweiss.eu>
 <w4l5drhu6exq4jb7x2pisqtkz5ylare7ashsmjjqomv3yetjwj@z3wapq4rkk3u>
 <6d1a95a1-0b84-4bc5-9cb0-3cc514d292a6@oss.qualcomm.com>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <6d1a95a1-0b84-4bc5-9cb0-3cc514d292a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-02-2025 9:27 p.m., Konrad Dybcio wrote:
> On 24.02.2025 1:17 AM, Dmitry Baryshkov wrote:
>> On Sat, Feb 22, 2025 at 02:00:49PM +0100, Luca Weiss wrote:
>>> Set the paths where the device-specific firmware can be found for this
>>> device.
>>>
>>> Fairphone 3 was shipped with secure-boot off so any testkey-signed
>>> firmware is accepted.
>>>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
>>> index 08ffe77d762c3a97f470efbfb5064282fe2090da..5611209dbfa41d7834af7903535ed3e05604ba63 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
>>> @@ -82,6 +82,8 @@ nfc@28 {
>>>   };
>>>   
>>>   &lpass {
>>> +	firmware-name = "qcom/msm8953/fairphone/fp3/adsp.mbn";
>>
>> If any firmware is okay, wouldn't it be better to use
>> "qcom/msm8953/foo.mbn" ? This way if we get any of the firmware (yeah,
>> I'm a dreamer), then FB3 can pick it up.
> 
> No, the fw may have board/wiring differences encoded inside it

Second that, while I don't have access to the AMSS sources for this 
device, I'm sure there's at least some board-specific config in these 
images, and I'd rather not boot up some ADSP or modem firmware compiled 
for some Dragonboard or equivalent.

Regards
Luca

> 
> Konrad


