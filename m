Return-Path: <linux-arm-msm+bounces-35643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 796389ADB8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 07:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0907B1F22A34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 05:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEA3165F16;
	Thu, 24 Oct 2024 05:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="epV0ymeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7093CC8F0;
	Thu, 24 Oct 2024 05:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729748156; cv=none; b=QRkc60Ts+bjLKgxfMqNB27UrAzd6Gu3bkllQEiF4oOxs+KC/2G9VddCNpLh+9axcTJNLzMa8zClNDm3Nw73lR3jFaJBZwMHFHL8awNV1IRs+Z10U8fjXWeFnZzJjluY0G3kKEzPhkrhrNjhL0Mbgg4+GMo53kkPx2SuXrcZHR9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729748156; c=relaxed/simple;
	bh=g60dll80FQxag8/SLufMUrNVGPzznH20zTIyl/HTuJY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eF0Y+n9o9yP0/SWfw61GDVH3gFs1OYM2By2RdDSaYLdxSgSiNfTkl8PpCaMG0Zz9j1ki6tU5bTWjnn7GASJFVd1OmBkqUp80OxmMz0Js4Nt+BwqOFHiytyiglasWeEtJ+kG8UrIQLP4fxQF4TE0qP1vW+93brXtY+hxZNseUubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=epV0ymeS; arc=none smtp.client-ip=212.227.17.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1729748151; x=1730352951;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=g60dll80FQxag8/SLufMUrNVGPzznH20zTIyl/HTuJY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=epV0ymeSQ/AGz6GeBi7MT1laPzKqGZ3g/FUkTt5uP4eog8ZJ1S97wV1fFuatkgTG
	 0tFRFnrFbem14pbLIauKs/DKAwgRUkqKhHLNY988qI49fQv71RkBF16SIk5i5i9Mo
	 UaSxqs157wnPLZvzuqlobToleMNrnAA7UDTj+zw743Kh+ntlsnQttGkISLgCriLOC
	 cNMDdKV7mwVv9ZMaPkz3KgAMsR+/5wS/bL+TR+p4pd2w8EetcxyyaRp2pumhTG+l3
	 8SCFJWmtyKslCyA9KNs2sfHcmcreUwvT8ClS3uCAbtTkWMYkppf39NlegvBK/qCn4
	 0ono0Eu0k+I1Wb8RvQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MRBac-1tI3tL0HGm-00LVMc; Thu, 24 Oct 2024 07:30:15 +0200
Message-ID: <80334280-1c51-48a0-84ec-f0f81d834da6@oldschoolsolutions.biz>
Date: Thu, 24 Oct 2024 07:30:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH 0/2] X1E001DE Snapdragon Devkit for Windows
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, abel.vesa@linaro.org,
 srinivas.kandagatla@linaro.org
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <f67d0fcd-4940-a57a-0e11-b98ed29cd09d@quicinc.com>
Content-Language: en-US
In-Reply-To: <f67d0fcd-4940-a57a-0e11-b98ed29cd09d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qK+BrI5Vz73rqYM48skDu2mGNQ2ApZPiuZM814xNkSJcZ2i/xOH
 N8KitGNqBKXfC30gteZ0aw7kk48FoeKYRJRZ+sO4SXAuisMubFWZtp7jSh07xHvA2Ele321
 7oAd9VRJssdHHobCZ6EB1h0e8O86eNPgOCZo7OxtnkNUUIrkViKAQUtX3LpsksdLVDQSL7o
 ILlvVI+rLmNuDWBFxOe3w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2wbg/tJno10=;S0BDExEUg0HU8c5y6IuaaA3ApJE
 iliG+XiNjsibQsd+y/PzcgnpDNU9MDRo7zzN+ifzo8Xn1uH0b4IS3IrBg/yel+sauVcNVDLEy
 yWXSwV/i5MWFep3UXV8NrIS49yE54kOCqatOpgCPmrFG33aqzPtdZyAWxPqaq1rA+k8qFCyXE
 EJXlOktliKfAyVuEaTDn2o2Lw8P0f9h+MhVdHDDC8GLGe/3lzVnimcHJYsJtz++GLCktbdrb7
 ubhIccs8lx3HQN13pjcFEv7EjttglvveY/EjmRdnSnqQZgWEoQN1tWA7cEwiaaM6cbXLl7ROH
 GZp3xuywFJZUaYDbi8AVPuRAQBFZuiow91Fzvz8wRWQ5xO2lP3F2xJfPiX6Id1EUbCBjgTAWb
 QSpumhnFlYFh8C1I55Hj390Vhc1B8ANxK19ep7QskAlUHyb0/KWwxHwme6eU2r1W29quZMvfl
 70hI016mllKH3FWHI2cXx84EoY1OHGbQcNIqDky/80lo3xXHr4+5ZG0UlHIB6tU1ejmB6Dujn
 DfjNP4xfPWjJqCMT5haxWP/kx3WUM++GeepIyQA5A0Whpy3AZI1I5drzQxz9ykYX/+W+0igQN
 btCh+dpK4GFrbPltMBzuoZcsc9PahWOyieClgrj6hi+aDfzAyPLlxwRSQyNYzLBugSVrpoD6k
 Cyf33toI9+I6hPRtr54O13OzKfM7T29UWDuwQa7zl8Zu04vNDgZHc1skfjKuRCYvJeP9rh5+Q
 9hwzgyGlJOJyOqFXvv3yyie1UwxEG2qfA==


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
Hi there,

as one of the few owners of this box I am very interested in getting an
as complete dt as possible. It may be unsupported (who cares), but it is
quite useful hardware. So, yes please! I already have it up with the
published patch and its doing useful stuff.

- Jens


