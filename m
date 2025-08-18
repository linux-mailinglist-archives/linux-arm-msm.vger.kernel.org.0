Return-Path: <linux-arm-msm+bounces-69609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6177AB2AFB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 19:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C65AD3B06ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 17:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4541F2D248A;
	Mon, 18 Aug 2025 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="LLSlxI3G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D29F2D2482;
	Mon, 18 Aug 2025 17:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755539149; cv=none; b=cvwpw7dHfxOHcNlM0gjbtcKkS3t6AUxAC15e8VVC0667srhGRfc0958urDT7z82L5MBIXdNdYyTFJvR6v5QR4+vbx2amC7BG4va+NmyjaPl3AmoQgiFwDsztMiEReL2SwmH2dSYTRM4Shv3R+5pnAqGcALzh0ys0CzdwewywRSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755539149; c=relaxed/simple;
	bh=UeHG12bkDTb36K5LCQP3Rab21bv/2vYsLcsdVU9WADw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+4ggpAko761BMxQ5LgzE3BsP0iRNcHiuKJfmbVojlQCF00/41W5HXOyBZ6cpyoqu6zmSsCPlLS42CGJV8mXoW6od4oHKh0a3zOewuIYg+NYqxWRK4I+kP09Fwn9FwKhaMxfhoTl5pqyt8XVeF+ed/e3tlIdG8MT0dcPpUgLc9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=LLSlxI3G; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1755539140; bh=UeHG12bkDTb36K5LCQP3Rab21bv/2vYsLcsdVU9WADw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LLSlxI3GxYZYMIOqP3fbxGXMGGCoLocLKEJEHpBoTXUfD6ITDH59zeT5tDC+1ecj/
	 ZD9W87I85MvtvlKi8ZJ4N09p++h2qildeDpUknt+DkcNp+DC1eykZE3CEx79w21xA/
	 Z+VdzaY8AQYL5XF3KA+W9EI4jwW7CmgkQtDAhtZ4=
Message-ID: <d6159eb6-7777-478a-8bb0-298bfa607c06@lucaweiss.eu>
Date: Mon, 18 Aug 2025 19:45:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] dt-bindings: eeprom: at24: Add compatible for Belling
 BL24S64
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-3-e83f104cabfc@lucaweiss.eu>
 <20250818155103.GA1272375-robh@kernel.org>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250818155103.GA1272375-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob,

On 18-08-2025 5:51 p.m., Rob Herring wrote:
> On Sun, Aug 10, 2025 at 05:37:54PM +0200, Luca Weiss wrote:
>> Add the compatible for an 64Kb EEPROM from Belling.
> 
> It is generally not required to add a compatible here assuming
> "atmel,24c64" is enough to identify the specific device (i.e. read the
> device's ID registers). If it is not sufficient, then some details here
> about why would be useful.

I thought DT was meant to describe the hardware, and this specific 
EEPROM on the device is a Belling BL24S64, and it's software-compatible 
to this generic atmel compatible.
That's why we have compatible = "belling,bl24s64", "atmel,24c64";

Am I missing something, or misunderstanding how DT is meant to be written?

Regards
Luca

> 
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
>> index 0ac68646c077790c67c424d0f9157d6ec9b9e331..1e88861674ac8525335edec1b214675c8efa3ffe 100644
>> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
>> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
>> @@ -131,6 +131,7 @@ properties:
>>             - const: atmel,24c32
>>         - items:
>>             - enum:
>> +              - belling,bl24s64
>>                 - onnn,n24s64b
>>                 - puya,p24c64f
>>             - const: atmel,24c64
>>
>> -- 
>> 2.50.1
>>


