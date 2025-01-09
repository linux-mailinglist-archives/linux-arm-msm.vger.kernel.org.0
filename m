Return-Path: <linux-arm-msm+bounces-44649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6845FA07DEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 17:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12BF3A1351
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B17222257F;
	Thu,  9 Jan 2025 16:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="vbG4+olP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2689222573;
	Thu,  9 Jan 2025 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441027; cv=none; b=g+ZuBjZjWi1rokBIImxdvr/CcZtKey5gNHtM2WjPzy4DQb4Prjplhd5SBCyTbH15oJh24b69mdpLAxtWQLgGYWA3UZWSdchCarauwv73ae17e0PYs9pvpHAN4nPCUQ2t9RE19j0Bnb6jAeT9S1oz9/oZ/B9oBUI4MoZjPZOHZ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441027; c=relaxed/simple;
	bh=2Bpr70ycc1jr2o1VGyHZgKH8+P8VK4NXnSb2SBD7YUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvBYX2r1TD1NV6FDBc8LiCMK8NNKfg8LeLAQDXIQj7b3qFQJMoz/zpUXPMAMgedkSzxmU0yKcxcMo6cCJr3OyrO1X6eKAY4CzbaZSx1QXDpdcPUVKh7Lh2mA9PA5/aVsFpbSLfmq7PjXjFfkEBj4JpdvtHFas+D5OKPvBM9sGtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=vbG4+olP; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1736441016; x=1737045816;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=2Bpr70ycc1jr2o1VGyHZgKH8+P8VK4NXnSb2SBD7YUI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=vbG4+olP7Igr0AxqPgI+GJ7lrAnXmV7/dqH3j6AdkoI6ZH5+YHJCuzZZlFHwoqLo
	 eL85r9lZcyBctvZIoPQF76WyxcYdZ/hDCBI8zkFrZe0YFFV4rxF/ErXTTZJpnINLS
	 z4CAQGfE9LqAFc6s0/t7hgX7xRGZ86KiqD3UaOCJP+r1KQ2lWbEll90irDwNmXdKH
	 sAw49tfUH++eUCDDYDusj38K4gmtLP9pI9IkOsZELUw14D8Te3HKbKDdMS5OjjWrZ
	 v3OVxkHmxQ500yDwYkk4s9AHutVJxAJrEURHvx8F34fFpGLELTZJWd/8kqTlCY2m7
	 8nSZ9yi7IjDx2ArhTQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.241.102] ([84.175.89.231]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MbAtM-1u2mPI08Ua-00qY2B; Thu, 09 Jan 2025 17:43:36 +0100
Message-ID: <fca4228b-f466-42e3-aa62-842573a7ce92@oldschoolsolutions.biz>
Date: Thu, 9 Jan 2025 17:43:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/2] soc: qcom: rmtfs: allow building the module
 with COMPILE_TEST=y
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20241202094903.18388-1-brgl@bgdev.pl>
 <3b99b4c0-5880-4ee8-bbec-d07673d9ce11@oldschoolsolutions.biz>
 <CAMRc=MdtbgSuwjv_h7+VVr5U2frc24NYmpifPQJ0O0iQt_sWKg@mail.gmail.com>
 <411d3601-be05-44f7-8e6d-614a0a387fc7@oldschoolsolutions.biz>
 <80486250-2172-4911-93bc-47e2944ad681@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <80486250-2172-4911-93bc-47e2944ad681@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6rGeEu1zf01FHT3KDM3sMC7em5/XokNWawebcIQiOQC/bCv+lor
 P4Y8I5YjJs53mXd6GbNaUMFcjEXr9EmPskZMbOmiEA8MQVdbvt5BJo7YDetnaYGyBSRwTdk
 73mowApgcGlp7Ctsb5ue4LN3UVxDF+BHapqwPb56bPYkU5VZspHjv6SKPIStvGrWam/OwWH
 CVcHSDg8Ng1faRzXWSmeg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ly99ySZHDO8=;nYejLhrhkQ9yAGLq36fkSC0SO0Q
 BXCpVzeqlVhZeKo4PHUDRNp7W4qnCvx8z6bnz55zZievwJq/pxYNgzoZ9mpjtrifL3BQWXdg8
 JkW+ovh7sWUF+kSEh5FydNzJHkrPxmlWc+L8S5wjj0N/YdN5EwQL4x46g0TRvwyTBNaA+nfbI
 q5aBNp5e0IamBK12sK12oKZKr6ciVQLyl8MbA/HVnXyoBSCk+b7it74BkLh70wIQsKVoLxD3I
 rk+DZr9Z572HKlW2VQq4FCW84BBJNKLs1/6rKo6rZK37ySzL9co5X9ykMTbtbuOnycExPFNKt
 GH9c75NrqqlTEpMMn3qQtfikW+1yJQmfAqJIOFWn3Tu3G5XEv4bwpkWEBfo4IWTOFcv0iBpd7
 LNQHjiPx3gLnEf7sZ3ge6qEOueHgI5expLcMUc7j24DyorTRWQjHPa72iGbKOABCM+c06YPz9
 Ro6IWhGqA0xu41K2TD8AFs8vRHV+1KSnk5+3Jy47JI0tFIVFpl3m2R4YTg5pRF7H65M9gJHdu
 ZO1LDZjVw1t28EOjyf+jSjN1fVBpxpKitYo6VSkSRN+CJRkMQin1H2E2P1CBzVox265U3pF+9
 REbvrATWvSJ5XA4MH18s46Jm18Hds5PFj49Wr1An+QXntkcNHJiZ7YH9KEQNxMGdyOtvKG/2V
 ezAuzwtfzfrCgQQ+tOnyBtvMw49o/bMC+bfo3GFze3jgOiaSvYQP3o9TKv3Jv7Bptn8uviDBd
 0Vvo1nNGkupkvqzSfY5g7Sr57gWV4VTTv4ZA01l+pIeYqusVTdFN1YPW2m0SpLAqNamRo3bdm
 2iuYucDKzBZHebykh+scaHdXX8Kbnan9hOAX+nVdmJUMIl1XrlyKcQX400/HjEXM3ULXhImVM
 xeepkC8KxJpqP5iPQKrPEL4FNEHSa5iPmnGuHm5Zqq1w0+4MzO5XG9JzCJw7xHSEg6+3Q4HBp
 8uf/XUxybbzKUcvKHLt4qtUG8A1uY+His4BRiri38vM76LDs9p4ivCGgApdib2cs7d8qj6f7W
 A1sg2c3+ciUMYroxXXIdI40e6PFJB7cwrTFWmxY

Am 09.01.25 um 15:01 schrieb Konrad Dybcio:

> On 9.01.2025 2:27 PM, Jens Glathe wrote:
>> On 09.01.25 12:13, Bartosz Golaszewski wrote:
>>> Well, that's weird. Are you 100% sure this commit is the culprit? I
>>> have no idea how this could happen, it's just a Kconfig tweak.
> I think I've seen this issue before. I'd bet it's just timing.
>
> Konrad

Well there seem to be other (follow-up) symptoms, like laptop not
willing to wake from sleep, higher battery drain. No idea how to tackle
it further, though. drivers/phy/qualcomm/phy-qcom-snps-eusb2.c has no
recent changes.

Jens


