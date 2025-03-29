Return-Path: <linux-arm-msm+bounces-52815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A24DA75587
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 10:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BA093AE42E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 09:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B3E1A072A;
	Sat, 29 Mar 2025 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FZDpjpIq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F8929A5;
	Sat, 29 Mar 2025 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743241464; cv=none; b=g32lxMS+YSc0YYm83Yg98dZTjkTXA0o/gdhW0a2n+2JcfQrnqxMWNG8HJvb7qhnnfOfYKHdsdoGuU3kkJCXgdHqTy0lJnP+lNUiGENS5iUlmYgIAW6O6AHmULkQ9mJ1nTvLmFWPIZk41W0CYYoyAt12Rh4ZMUXRvqJG5uqNlwF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743241464; c=relaxed/simple;
	bh=NpYGIKkcP8FuzmyAH41B/chvu9TNL827CMF9ATXpUPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkoPftexdPZyyzVpQgxa52prFVMTMJ49SdKIk9joRx7PnlHAFrYW5ve3/iYTgTHYkPATO95fc4XoVMLq1gVDXvxtB0teXI0omIBkPiuvvlwBISbo2sQ6ReQgJ6/i/qQDCkep1DZxMV4yDeO4nJF7z+KuhlEgcG7NXVBzzTY4OfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FZDpjpIq; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743241453; x=1743846253; i=markus.elfring@web.de;
	bh=NpYGIKkcP8FuzmyAH41B/chvu9TNL827CMF9ATXpUPo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FZDpjpIquws6DbOTBq4uI3MjSkFFC4T7UVggRgE+uc5E6g2jBJu7Z9ayyGBRLxbZ
	 M9wvdwKq04aZyviwW0pH9IcQIVvfH7sAmfdTe/ROiUGNHr+tHvTX+ytdmvIr0EXs9
	 Tn49Sd0iATk2ro1W4IaIMPMwrQpcHVogbOxcbzQSDyrVFgiVr+1a8N4ZrbzcECplz
	 YK+0SC0Yh1qzcwDYt0BWTBa6WtbSVfO/UcVWhARsZeK4le6S1bsN4+3/YZGc2sENZ
	 +rWN4LIcGbP1a8bRXDIrL+QSiDiAemGKkPmVifYmg36It1gSPtUePObv19NE9Kazc
	 UIb7fOG2rGSX2hfRLA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLijs-1tgnKH0oxk-00KMx2; Sat, 29
 Mar 2025 10:44:13 +0100
Message-ID: <e728a653-dc12-4d2b-83a1-a186611c85be@web.de>
Date: Sat, 29 Mar 2025 10:43:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
 <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
 <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:z67TAXeP44W+MI1/J0Ked3QHpXbkEo1eSqgzBbDctYPJ5NRtASY
 CCmeECJPFDIWo8Cz/fSfQLIzOqFGxRirRsJitVCE0fRp2Qk25aagj1E9E9PPv75kaTfqpXK
 nHsxjMOHygrxazsLGFF8YdBcw42ZwzxkIt+BeK2E8gY/fkpffAPUSwS443jWQRQTIHMDRAl
 LYaBYV1sky4DqtfUOB7yQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P2xTt15EqkM=;yVihSDPxUx52MIgMHvo62uDWP2U
 dASAyom4+iK0ZYQTPGAqqhaG6qtXgx7fPWw90HuTWVStXDxyWJBj/b59jAw9OpZvR9hD3cBbX
 BSzAqXGLnMxBURBmkaNv3gei9Fkxwc+bJLxYnnkrDWiFIsriLcPETWM7RT+1rbeZeY5YYX0qZ
 xoV7hSOVT14i0SitPYY5XWR/rxQlN5jKhXwB5+8OBIEoFeQ8UVe4FY6VurC+8hEemTqNIHY9y
 DfVfHOg1xsgp65vDC8f20qTIg0oWlgBJmG+Zp88jB8dEGiG0deA+w18uxPEAio/T0PSvFPFyL
 +jlkUKoVN5SKR7xzbHWBdqPY88jmNP4lg0treEaI5w2kZkCe6zITH39hIwgQWMMUS+f0h4Q75
 42mabwI4FO/XGfci9572ae+PV0A0EKlseMmVZSt/vpiU0VEooeMUCi3oiTMDRKho+OMQ78+Ba
 ZAKHsI+YQGP3OO1rYdwX6M0fuHTjW3g5aDSx0t0+E/iTQUu4gByf48RO2yJUpaC4LItz1/P/E
 b4Fg6DpLkvAkZt2K9HXhS5IMTdSOEYZPG+yYwUzvOPE+LknCuR9k3hk/uYDlH3v+yOZ00SRah
 Z1/twVs8BeO7iFyPqFPyRIe9ZKL92Q+ctmA9z+toF+8cDqwFZ/3sYsHofi10XNPDiqC8S3VGI
 OIIDS59lCJyvU0lkJxKx0EN9OH5yBbRFXWgxERfVJZN8ctTbw7NShECm0EegywaONCB7eE8Ku
 RVMhY+pE5g6BgdXa/Tn3aT3u1uoXx+eF88duxd/lG9rDYFeL9CFSh4cKv+3Ou8Z5K02wZvoNZ
 qWo5BQgR9X4Thghcxd1qXAKTW52v3KB8PFTwo1hzyvlCTe6cObG5syvpgokc8oezAL4kltbmC
 MRfOUnN+3QxVgcYSYotCRWGmXIAMjTm5iYIvzrfK3pfDif30QLlYR6YYNbWfKYzJkGlNabZJf
 M0smoyYn6AUjjmfGlIKb00SxyOHH+ia4+TPL3l8wf1kD+LgdV4I1cs67cbHZOERg8VgZtY4/B
 RoKJBRU7R3lNTvIEZEXpWoEzPj2bHlJvqYBi7Qj5rQqsL/QsOdyQ7fXCXkj/O2XGamG5lOwg/
 oiuRFf4l8i/6nHlSmqM1MLKAVcF5tEuDQseQV83VINw93SDQOD75ENS5gxsj1f1X8CZ+E+2qz
 DPvwmGwS4kJhLv2cpm4u/z5thoWorL9hXb4dBinn/4nQNS7NlswZtWsmNfFNSRgWpodBlL7x2
 E7e2s9uyndqqPQYJ6io/pHZ/NiY3HOwwyvv8QzJblLYiLKseoRJc1HGXggUgjEh4bkG4wBjdr
 KhIujoRjDTQLTolZVuNOpwqIrET/hcqPY+QIuuc5rWfaQjAHRbXRsdG8/T6vkgqphuARQVxWH
 piGjXf73ZNsE3oCsxNDVGC3PkGxgzIVbpgw0HDeKcNfqKiUHZ+/IJNAZjdBw/kGZKrDH3jRlC
 PjX9s1pIVGzX5wlkxA+t+MxfoBQu68u4EnyeuZ0b13rIg6wGN

>>>> Under which circumstances would you become interested to apply a stat=
ement
>>>> like =E2=80=9Cguard(spinlock_irqsave)(&gi3c->irq_lock);=E2=80=9D?
>>> Didn't get, hence a question.=C2=A0 Do you suggest to use DEFINE_LOCK_=
GUARD_1 instead of existing method ?
>> I propose to pick further opportunities up for benefits from scope-base=
d resource management.
>>
> Sorry, still not clear to me what should i add/change ? please share me =
some example.
I pointed desirable statements out several times already.

See also related information sources once more:
* https://elixir.bootlin.com/linux/v6.14-rc6/A/ident/guard
* https://lore.kernel.org/linux-kernel/?q=3Dspinlock_irqsave


Regards,
Markus

