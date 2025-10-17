Return-Path: <linux-arm-msm+bounces-77786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9414FBE9193
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 16:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A0871AA2627
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 14:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E38436998D;
	Fri, 17 Oct 2025 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HnzF4Fov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FCA369977
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760709955; cv=none; b=FOw7LM63THUzlaVfk4gF7jw56Xyk96mqBKPt9BLIkBy068N25coQN3q9qb7/23HK9IirW0Heb2vTM9aQlTJK4zuuNkr4kGC6eeWabAIX8GvtwC1m4iafR2FliO4lqtBXovsd/0GqU8Ja6G9bpAB+ua11VSPdIFem926gEIeb3GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760709955; c=relaxed/simple;
	bh=y2j14fKCfSUEyLu3qKfrbsyP8qXM57xWfcpUmJOscjA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CrBKeAG0MuWsNJdSaQ1XYYGmVnFog2AcwKg9ufmdUlddy+urL6K0eJb1Si/xdhO9yW3/GcMqi4HALsf/rpb585rnWCSCjQ/IObp84xwIlG3Q0wb3UgZ2V5L+MOsxMWb6w9CmX9CvaiCJdE+ko6QplVJSDtVGEuJR+yH3EJx6Iqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HnzF4Fov; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63c2d72582cso1151346a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 07:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760709951; x=1761314751; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDtFkvW71ZpCBo0DPDG4zvNO/0+/N+iEEt28V0Z9TN4=;
        b=HnzF4FovcXOObmvLMUbPJTiOwxK3ehxfgyH7u84LetBoLjc5H7FG1kqIFLSH5jTjaf
         OGh4df+M7VWi13/QZgAdVYq/3yJWXT/MtRt1ezmVRJC/27CTPtD14AdNMaxMQx4jQUwr
         +2eWFU5CH5l8RWXG+G799vZhBvt6UAQNTpYwFjl/5e/2QuS9JPIu7vj+tuglbusVRJ6u
         fHPziA8qXIg5RkJreJB+d46gKllAOzl2/ZNC2Scj/By3O2QmhqzRmJwRGgevaBWDagBC
         W7StOWDa+9qrCUhfxY1/XACFSr50Nvz1kc7byZzZwu6OhAaSkAcQQZ33wR9Np/ynfEG2
         USjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760709951; x=1761314751;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NDtFkvW71ZpCBo0DPDG4zvNO/0+/N+iEEt28V0Z9TN4=;
        b=J+SOa6VYVaiqQeD7q+cl91M/yWq98En6rhGNwdk2YSzfp/2h40IWeByZFfALAiyO4Q
         E2SeTFpKWsP/e5aStQo9UK1SmH03QNLdIGuWhJ8P0tJ4Lp8RVYSURLvsr2yEMohFQU7u
         zg7ch85NOKdDaJ6UkUFjIqOQmgUFWfKjecO1MaNHqjjEiCduXL//vlcywJgnD3lSRWQ0
         Me+2/HTQioULZrztrQ/rTypm+zAEfZa79mFiuIunqCPsYVcGt5kkvkNe2J3jvz9M0cAn
         1sFb1x1bPSHjNog0RZYm/hSKoAzlFQDeapiE724wgg3BHzrxmeriL1qtnFYB09Fh2lqL
         yZRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYZNjNUK7ZTAHBSf2EwZg5uMO4BmLviryZ1icJuLJ9GECTGsQnlu94MRNH+64isfDGKd4ZHJ7IkfMFRjBU@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ8Mg5RvQWPp5X9VL8sebgNLbI9dCC17xnOcmgqgQxzAXwgIhq
	FMZH6M60W1gFDSNBhbvj9W6CIhWaeBWIjH3KKFhZCnM4K353js+WUfN+Jl4JPB8I3I4=
X-Gm-Gg: ASbGncuHC/JVOTq5RNy5Fa4Hr/WJJhSqYJZQwxQKX+7eaDZuRg0/l6V5txEbZBwozDi
	qdKojyd/QL2K97oAuffFQ7tHHlVRByhlbBK6DAPuVknypATiVZa8vuqBIALESED2FzOzt23zr49
	cAij+M1GEUuVlFldXEZvMC+Y7XqL6iKER1x2ULcrnE9czOzbP0kfFM2ABTeWTN4wI8afqOmrW1M
	i4xyTxzZkf9s6p9j5RkvwSG3lubH+UPXGtmlIR3kjKFy7qZD0yw5bPlR02K2T24cFb/N36FH2p8
	/xFMtSSA/rKTHpvrsBfeDF1VVhhPNNdK2ywiV+IqWTk9r6gnX49VbBQiZ6yMBW4A3Ip+mhwkrqa
	bP5AJbEKDfUxY3ekZW/azkH4P1Py4ldZVF+4FZLJAZNyRC3dgARjgx7JGnzXyRkq6aTGVCp21or
	nlq1Z69QbkPlkM5R4am05uxca3eLAU9RJDJFfv9ARSrW883KDSKYPTG8GS
X-Google-Smtp-Source: AGHT+IHD0zQCxNlY8i8goUteHIFFoUwCmKep+B7VhLiGVGAGPiHMCDPi+AsNJHLKrrEXZzT+k7ZWpg==
X-Received: by 2002:a05:6402:3552:b0:639:e30c:2477 with SMTP id 4fb4d7f45d1cf-63c1f636789mr3573697a12.7.1760709951080;
        Fri, 17 Oct 2025 07:05:51 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c134062sm18799571a12.36.2025.10.17.07.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 07:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 16:05:48 +0200
Message-Id: <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Jagadeesh
 Kona" <quic_jkona@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
In-Reply-To: <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>

Hi Taniya,

On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>
>
> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>> Hi Taniya,
>>=20
>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>
>>>
>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>
>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>>>>> domains.
>>>>>>
>>>>>> Are those really required to access the registers of the cammcc? Or =
is
>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>
>>>>> Due to the described problem I experience a fatal CPU stall on SM8550=
-QRD,
>>>>> not on any SM8450 or SM8650 powered board for instance, however it do=
es
>>>>> not exclude an option that the problem has to be fixed for other cloc=
k
>>>>> controllers, but it's Qualcomm to confirm any other touched platforms=
,
>>>>
>>>> Please work with Taniya to identify used power domains.
>>>>
>>>
>>> CAMCC requires both MMCX and MXC to be functional.
>>=20
>> Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
>> need multiple power domains, or in general which clock controller uses
>> which power domain.
>>=20
>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>=20
>> That'd be highly appreciated since I've been hitting weird issues there
>> that could be explained by some missing power domains.
>>=20
>
> Hi Luca,
>
> The targets you mentioned does not have any have multiple rail
> dependency, but could you share the weird issues with respect to clock
> controller I can take a look.

Coming back to this, I've taken a shot at camera on SM6350 (Fairphone 4)
again, but again hitting some clock issues.

For reference, I am testing with following change:
https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir.zapo=
lskiy@linaro.org/

Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sensor
on this phone - results in following error.

[    3.140232] ------------[ cut here ]------------
[    3.141264] camcc_mclk1_clk status stuck at 'off'
[    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.c:87 =
clk_branch_toggle+0x170/0x190

Checking the driver against downstream driver, it looks like the RCGs
should be using clk_rcg2_shared_ops because of enable_safe_config in
downstream, but changing that doesn't really improve the situation, but
it does change the error message to this:

[    2.933254] ------------[ cut here ]------------
[    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuration.
[    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:136 u=
pdate_config+0xd4/0xe4

I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK as
iface clk, could something like this be missing on sm6350?

I'd appreciate any help or tips for resolving this.

Regards
Luca

>
>> Regards
>> Luca
>>=20
>>>
>>>>> for instance x1e80100-camcc has it resolved right at the beginning.
>>>>>
>>>>> To my understanding here 'required-opps' shall also be generalized, s=
o
>>>>> the done copy from x1e80100-camcc was improper, and the latter dt-bin=
ding
>>>>> should be fixed.
>>>>
>>>> Yes
>>>>
>>>
>>> required-opps is not mandatory for MXC as we ensure that MxC would neve=
r
>>> hit retention.
>>>
>>> https://lore.kernel.org/r/20240625-avoid_mxc_retention-v2-1-af9c2f549a5=
f@quicinc.com
>>>
>>>
>>>>
>>>>
>>=20


