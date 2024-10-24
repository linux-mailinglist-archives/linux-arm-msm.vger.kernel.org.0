Return-Path: <linux-arm-msm+bounces-35642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 999919ADB84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 07:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3D57B2107D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 05:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4539172798;
	Thu, 24 Oct 2024 05:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="O/496grX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414F1741C3;
	Thu, 24 Oct 2024 05:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729747657; cv=none; b=lf3/IZh5fKqf45yGKcQW3pkfPMMOIlF5byAnsbHoFBzbnIVoU4bHhPdDkRMC32rn5vhBqIKaOG7UDF99ZgkLsveemZIFWBy7pz3wVvFFHbStkvmtL43k6AIKoP5nQgsmXFUFFC9Eg6I9WXIn+otrXIvJwnXcFFI1A0vkmZpUAPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729747657; c=relaxed/simple;
	bh=d735oG1X3IXEcrcspEMc+GOMPQfO+sH6teUICELrMqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPxQ0sGZMXvCC7h0KHF+M4oWeGKIA3vwi+vRlUgvofrPXZ/uZ8aTuVktX7+vCcOISbWkvA3DcJO8R+WyAf4vLAHmRWMeMmRJpfR40EXOxB/zryrQh3TpYColN6P/z1qgvECTZfuSzpkAPKa3Pi0zxrtSI1OcFudwXMt4LVskKI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=O/496grX; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1729747647; x=1730352447;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=d735oG1X3IXEcrcspEMc+GOMPQfO+sH6teUICELrMqI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=O/496grXak77NplxqA33W4XJ8F+USqwdOseS32iKYAuFO9qeH6y3BqwD8se6GDjI
	 W6ZDkWJ+/oi1MIA1nxsAX1CFR4lV1q16jJ8vvJyc8bPX55/OriTYEH1WE3PC7raZr
	 ubjCzUGW/QgTQh/zSV6KAUkaJxLpRDGqkSkiaFfTL8bEgMgS2OnHnsGwAff431/z0
	 NDVecgZpa1Dm5A54OcQLtjk8CtAv/AyoWFhUaBLLJGFesGU1jZcziNtfHxV9s87S3
	 gwjdGtEfr7Z5u2/JHvAuaO6D6nVMAhnvPp2aC8hUi/GvelTxlC2izQCVk2PFWp66l
	 mQZX+0AGn4eEfaz+hw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MrPVJ-1tigXp2Dhf-00jy8d; Thu, 24 Oct 2024 07:13:34 +0200
Message-ID: <2fe704cb-52e4-4f41-a575-2570484dc18d@oldschoolsolutions.biz>
Date: Thu, 24 Oct 2024 07:13:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] X1E001DE Snapdragon Devkit for Windows
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, abel.vesa@linaro.org,
 srinivas.kandagatla@linaro.org
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <f67d0fcd-4940-a57a-0e11-b98ed29cd09d@quicinc.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <f67d0fcd-4940-a57a-0e11-b98ed29cd09d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pH2FjDbwXLQkQXlTmmN+YbeEJGKTHq/1SBsD7K0n7lQtWOKCxHF
 Z42CcGRnR8tJACI+gh4KY1Lmt22txJDjasUSw0IPzJJUj2BoXU+AFgnk2nxArAbmw8Ig7nS
 n9ifxx0IEjdM7BD4RuShIVnWddwkY7+yrzqEaCWDUhXG+ov75eGVbbPFUzsra9TM0sl+Lek
 ZKRPy1uXgBETDDLAbQPtQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PcpljmiV5cQ=;JWZ2AvMWFa4Eio/iR3HYAY3jz6G
 XSLAGwoFqFKaGNNRp3RArMl9tNzMDn0zMNNC8+oN03s9IzaBRZiHzNzn0v17AuMBivRq0p1Vy
 bELSdCgUddLr1/Kt4jUyJ322e5avKSK/PF0evWSLC5t1v50m8uPW3LIgDj4d/RficB8HTEOv5
 30o6CZEw3CMWI2b3+5UovOCoZ0hrkRGB1YvF2L05s4ihYNZbfIX8GEFAo94fLfacuavHa0wTf
 r5GNbMt0JteR0VfIA4fpgN76AmgK4k2EyWskqEWWWDyLrA2hEix+CZnGyb3FlH2nfl+80ZNla
 iampn9ZjEbfkpt2dNkVQR+qP/TSILl4Y/ZDtnkccnGKQw/6onEcTlTjuNJG3hu4TIsZsGQUbb
 q9Z4uqHMmu83lmTQEONOyP0GbD7gud/R2i+PBUBVK+dAzqbE+tbqaPJeDoB+gZ3n3Nv/tmmcg
 jD8M6uIlmROf21kQYApB61TqcFcAXEJJUqlX8ldfQdEVRrXRLmN5MQ+HQyDgydhQ5T1iF8kpt
 sDknEz3JVZMXHFzSgDSPpnkMgyl2uP42lPNSYtN4jpuV2OQOdocEfeMBxSrXyE//pA52Pf6bW
 ufTGJq5lbhPBSKubMYMeB8eGpoxrmQOS0WJHNDOi0h0619Y9e+UdB9HG9jGMC4ZpUmIbgdffs
 vF5I7Smi+ppMNQx4po7OPo3Rl2pbu2UDMg8JHX8tlvDR6G0dYBb9SoeJ1ZZQ3nJ95NGl/tnpA
 3BcmIYl/ZS73psXLNlFyeUVCf/4y78jCg==

Hi there,

as one of the few owners of this box I am very interested in getting an
as complete dt as possible. It may be unsupported (who cares), but it is
quite useful hardware. So, yes please! I already have it up with the
published patch and its doing useful stuff.

- Jens

On 23.10.24 13:05, Sibi Sankar wrote:
>
>
> On 9/11/24 13:03, Sibi Sankar wrote:
>> Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001D=
E
>> is the speed binned variant of X1E80100 that supports turbo boost up to
>> 4.3 Ghz. The initial support includes the following:
>>
>> -DSPs
>> -Ethernet (RTL8125BG) over the pcie 5 instance.
>> -NVme
>> -Wifi
>> -USB-C ports
>>
>
> Hi All,
>
> With the X1E Devkit cancelled and with no firmware updates promised for
> it perpetually, please chime in and let me know if you still want to get
> this series and rest (external-dp, usb-A ports, sd card slot and 3.5 mm
> Jack) merged and have it supported upstream for the folks who already
> received it!
>
> -Sibi
>
>> Link:
>> https://www.qualcomm.com/news/releases/2024/05/qualcomm-accelerates-dev=
elopment-for-copilot--pcs-with-snapdrago
>>
>> Sibi Sankar (2):
>> =C2=A0=C2=A0 dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
>> =C2=A0=C2=A0 arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windo=
ws
>>
>> =C2=A0 .../devicetree/bindings/arm/qcom.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
>> =C2=A0 arch/arm64/boot/dts/qcom/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts=C2=A0 | 813 +++++++=
+++++++++++
>> =C2=A0 3 files changed, 820 insertions(+)
>> =C2=A0 create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>>
>

