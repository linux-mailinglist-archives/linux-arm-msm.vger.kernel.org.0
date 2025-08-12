Return-Path: <linux-arm-msm+bounces-68783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E837B2282C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 15:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 082E5176943
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFA927AC59;
	Tue, 12 Aug 2025 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="ooVfE/o/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EE926AA91;
	Tue, 12 Aug 2025 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755004243; cv=none; b=TyRDW8kTQ2T43rexsXNH/nQOjDWQhINILT+WBCe0vwSkaxWL+B7vbBmAL9NpljfUkuHTRjHc9DbgIUqrtsNIyEWw7oITpfkrwbffdBpc54CTBbNP0+lwn4wzAdlmsWieEhsHordvUO0NHxsQ1OlcRjuvoXIUKPW8TWWXwhuoZZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755004243; c=relaxed/simple;
	bh=ZcHfVtKBh57sGSj1qHQY7LIWAmWunnqamgpCc/QHtCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqGzP9e1jWZKqavkdOTqOS36feEnCcnLXfTqVj8eL57+tHaCz9eankFkubkMozUGdHjX8+JXDaCTxzU5REb0lcaUMFvia6galFMFaj88xUAONx5PrwifxQac4NxEtVsl9ESD80/N4dHZoizvjmZ+EB5cwjmQXtyo7HDRHwCeu9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=ooVfE/o/; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1755004231; x=1755609031;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=ZcHfVtKBh57sGSj1qHQY7LIWAmWunnqamgpCc/QHtCo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ooVfE/o/lZpYdYDmKG8ZHOysXk0DOA+2ZgIQ+FkSkxFpnaOzzgae69EaqJfJZsMR
	 6GWdO8NKVwousorTYyW9eL2XC8oUVioURXsfuGY8Sd0XY9pAogRivlkIuIrVjv0R/
	 WNDMsT59uytoPDvVajEjTPeSNF7SVU62sQenkIWjpHBp12SPLDAGKB8g6LZMmLCCQ
	 GEJ/S9aM6IoZlUYSeq3Q0zE/4FXHxfJFU0ee999DWU3Ky853rq++NDIfYkGJ17kyF
	 R5QzjRN/Y82jlK/kdSN8tHhvmQxyanAda53zPbIdRzxHdIDqA/vb9YT4J3XlAFLCQ
	 KSAWcGTSyvvah/cngw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.107] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MlsWZ-1uKhQi1pn1-00cOH9; Tue, 12 Aug 2025 15:10:31 +0200
Message-ID: <14a07b04-dd79-4418-b935-fddeb7249aec@oldschoolsolutions.biz>
Date: Tue, 12 Aug 2025 15:10:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 <a6b063a2-2b99-4de4-a3b3-876f6b778bc6@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <a6b063a2-2b99-4de4-a3b3-876f6b778bc6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kD2kBgaRNvvsdwEgMYxDcuye+iNl7L4/0VcUp2nn6LpVEui8OnX
 pzXKpISwPgmOY+Sp5K9RAnoasrbV8IiZAQBGkNDCLlO6D2oMrIe70p1VbcU+rdst4VRCxPP
 T37aP3kfoTCBGFKW1iH1K0AiIu7DXXfCBz0lnUZo5EtjDQKeHUEcGGgI7yqf/Awy3EC2rfV
 gVwJOTbn/WS0lpZhU49NA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bJp7w6u/eak=;eulfY51ELcm64B9SLgiVFsNlzu6
 tdfKInwwj0adyAojuwwUx7Knv/Q7iScONWFdsTkpClheFmZ5qyb0acMfgV/RABOdqVvFQeyi3
 SnSrXm6i1XHW9PBKuIjXBECQgFR5LZQvZfczqO8OqI4oOTrj8QmOethkBHAbMWjvxoWBTXGPY
 OzrpIiw7Q8h9mNbCLeX0A7TwG8bm86pbQGjrAK6HKTv0Bsxb1nnSvSrDn/Gc8OwMfQ5eIvUpi
 ZGyatHudmPHfm8FkRmAxADCpmDYyZJ/omW7UaPRwIwkovsdFuZGvBFC3KagTt2LV7qTvs1aJ9
 mkB3yQw6ZdHebXg2cvYQXxM89g5KWfUrsxGDpgZmPHTMNz8xKLzFSY7rhX+HWz6AM8Jc+Kqxz
 zHsqvUTLIR8WUQf8p6WypHsi5lqLN7avPr3113piYeIwLDr8voo4cdBZB12WWQxIGI2Rrv5ah
 5HVxlS/p6wbE+l/YPiMY+BJJdl9D51z1s9xtcvEDVbCeCJEl9UWHDMyBWhArRYnZokwFUWLG1
 tXXVT64u99rZaCpnnO23/OiLSc3bU/DZfng7kZ9/bZ2xp1r+2fu+kSCYl0WQnU+GRlC7ZbVRg
 WQoyn/NDNZzh6trzf2W5orwHXF56jrMZkj9ZZHPNF1whNPNTgdn056Iq1rt9OdhUym9k227fA
 WpjF4XAdm7yu2nty+KdrJ2+5bMzf7tAOK0B1AMjf8vQiSHmXq0WQe9JU2JunDyWTgIpmj2GjZ
 /6vpbtj2Xzdw98AhGB5jeqVdkcMOUrWbUq6KA6r7d0ZUVMwit1M3DtyLXbkd1bYA7lUW4rvhA
 Q3hCKDsFJCkFL2sgsvXY2rqlfcGJPdAeGb8oVs4IFMh0GU20CocqaCPlkkdHrhipdkptNUd8D
 Jeg7TY9IqdkXDCGx/R+SbxlhXB0Il/HtF5to610gZEZzX9SF0vT2bXgEgXre0RYAMJKEils8a
 7NcouTHKW9sNgR1gPjZvucDvua3h0PdSy6ZSE0Pfdr5ra3H9DdKGFYFNq8oQTFPkXnSYYvVqt
 RLieVPviA8CxW6poEdRfeUiqz1XoKQZbLZn8l4m92x3OaY2DEUWmtztueH96JgZGeQ0Qig5Bi
 ofHLnMmD/S/6nMbA15w5CP7OxE4pvMg1vyqKcu8HjbYKahpfLG4JBYFREGr3NXOEW+FE/0ZUt
 /GeWOPldUgGT86s99+QDekUrFiAh7PK3hrpvblj2ZpeefSrj6VCDLCok6g3a/4Y6a/zRPmUEW
 YMZHjYlps20tK1lmMFK2Jn2senLTQ7LsckBo9lQfuwvqMnUcEnmaWjJAuPsSMWMpFr/cF2ukq
 enE1KQOLgkXhHlnA2w5ZlRNc7+LGKF34Mud7vX5XTioqivWkcYNIVw4guz82BQ65jmrraqs9i
 GTrPynGRVhE0nplQ6MnUAYGMM8fhn9RZIgLW1L4jGxqGGjUH81zJ/Lfx6UecJp9U9nd4bh0QQ
 o/iPxz7ouyq9xBnZwpPfjchmoaTuWerj6bLRT19WwORnBFm1a7q53kY07ZimpYGVw51XEpEO5
 5bBaBmwyGDflgcoS9DoGVFDoLasMHN5WhA7H8GwLh4BtC0Rl2LTivUyQBrIprIpgeU0x21iOH
 lBZ7qoFAdI4x/ObsExGetbHsBgZs4UpCWezXvGODqJC9VjaNkpwWJ9vIT9rrYhpAYaHDvLp26
 qHbLxCCDwyIG2YqI78ZEkk

Hi Krzysztof,

On 12.08.25 14:20, Krzysztof Kozlowski wrote:
> Incorrect SoB chain. Please look at submitting patches which describe
> exactly that case.

fixed in v11. Thank you for the hint.

with best regards

Jens


