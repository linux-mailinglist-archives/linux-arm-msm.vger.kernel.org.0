Return-Path: <linux-arm-msm+bounces-50908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F82A5BA5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9E147A1E02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD09A221703;
	Tue, 11 Mar 2025 08:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1Ii6f0A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2211EA7FD;
	Tue, 11 Mar 2025 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741680138; cv=none; b=AzTp0Ze9uuk6IPD/8g07BGnzoy5ZoWaIxNma5fTqXNTnZzY/NYbJ/6KaSiwEXXOv5jjDJzOip1x9VGMkRd0thyqfYQXs3R6a4ZDf/qvhE9Tr3xjQXwd2KGOT6tLIT3gZ1zwLncJ0J32+Vn9Q/QMNH3z6E46Wx+x9ugff32tpDPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741680138; c=relaxed/simple;
	bh=ER+SoneXM3aC53kwTjsYgrHGqM1EmcSSSqClcNpsios=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUbEq5evEruGaafD0gv21riPI3reXCw8ZqNhwRLU1k3vXt1UAmVg0IkXjskT6kVL2u6EmkYzk2C/H5KAqiCt6UEOGaX6bgos9VrZ2ITaqQc1cTI5SXnoQNEPTOhdAnZ5kwIvKhWpmvgTrog4j5AntmTb10iO2nVfbeisenXZwfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1Ii6f0A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9BAC4CEE9;
	Tue, 11 Mar 2025 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741680134;
	bh=ER+SoneXM3aC53kwTjsYgrHGqM1EmcSSSqClcNpsios=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L1Ii6f0AYn5e94wJ6fY4sQ60vyv+Ve56Uvflq+oAUrLzFPD5ndP3C1i0zbDWVLBay
	 DUSB2bZMaqvUBDC1Icgk3X1lrElTqnjUbhwmw7uiiNaJPjwmIV42bIDmKs6RJDEYLi
	 MXRSYjh2JiZg1xEqC0loybvy11SrazORpc/Ruh6sDEkaePrkcetIL5WYE9da29O17k
	 6vvL93mJM/lr1l9Ao9sDaj/zd7a7uXcPu8V/ti0UbwBkgJ0k2SyR+REmx9G3O2UunY
	 4oQw3b5z6eE94rdwxjGg5iT9nPKWZV8xbcd5pMAYlS05vN0H1y80750gd8jsIs9kUV
	 OmyPj3ORjNzAA==
Message-ID: <e00a7061-5283-4809-b652-5f6c5e1e4496@kernel.org>
Date: Tue, 11 Mar 2025 09:02:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <Z3gzezBgZhZJkxzV@hu-wasimn-hyd.qualcomm.com>
 <37isla6xfjeofsmfvb6ertnqe6ufyu3wh3duqsyp765ivdueex@nlzqyqgnocib>
 <67b888fb-2207-4da5-b52e-ce84a53ae1f9@kernel.org>
 <Z3/hmncCDG8OzVkc@hu-wasimn-hyd.qualcomm.com>
 <b0b08c81-0295-4edb-ad97-73715a88bea6@kernel.org>
 <Z4dMRjK5I8s2lT3k@hu-wasimn-hyd.qualcomm.com>
 <80e59b3b-2160-4e24-93f2-ab183a7cbc74@kernel.org>
 <Z8AWHiVu05s0RJws@hu-wasimn-hyd.qualcomm.com>
 <a8991221-88b2-4a39-a51b-587c4cdeebe4@kernel.org>
 <Z8laCxtHOdNm3rRu@hu-wasimn-hyd.qualcomm.com>
 <Z8lb889QrqluPXXl@hu-wasimn-hyd.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z8lb889QrqluPXXl@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2025 09:25, Wasim Nazir wrote:
>> +-----------------------------------------------------------------------------------------------------------------------------------------------+
>> |                                                                                                                                               |
>> |                                                          sa8775p.dtsi                                                                         |
>> |                                                              |                                                                                |
>> |                                    +-------------------------+-----------------------+                                                        |
>> |                                    |                         |                       |                                                        |
>> |                                    v                         |                       v                                                        |
>> |                             qcs9075-som.dtsi                 |                qcs9100-som.dtsi                                                |
>> |                                    |                         |                       |                                                        |
>> |                                    v                         v                       v                                                        |
>> |                                  (IOT)                    (AUTO)                   (IOT)                                                      |
>> |                                    |                         |                       |                                                        |
>> |             +----------------------+                         |                       |                                                        |
>> |             |                      |                         |                       |                                                        |
>> |             |                      | +-------------------------+-----------------------+-----------------< sa8775p-ride-common.dtsi           |


There is no ride-common hardware. If there is, send us any proof of its
existence. all your statements here show you want to create some
structure because you like it. I don't think you get my questions. You
painted diagram of DTS, not hardware.

We talk about hardware. Not your DTS. Drop all DTSI, DTS, DTSO from here
and show us the hardware.

I have been asking it for two months now and it is just waste of time to
keep talking the same.


>> |             |                      | |                       | |                     | |                                                      |
>> |             v                      v v                       v v                     v v                                                      |
>> |  qcs9075-iq-9075-evk.dts     qcs9075-ride.dts         sa8775p-ride.dts         qcs9100-ride.dts                                               |
>> |                                    |                         |                       |                                                        |
>> |                                    +-------------------------+-----------------------+-------------------< sa8775p-ride-ethernet-aqr115c.dtso |

How does "sa8775p-ride-ethernet-aqr115c" hardware look like?

>> |                                    |                         |                       |                                                        |
>> |                                    v                         v                       v                                                        |
>> |                             qcs9075-ride-r3.dts      sa8775p-ride-r3.dts      qcs9100-ride-r3.dts                                             |
>> |                                                                                                                                               |
>> +-----------------------------------------------------------------------------------------------------------------------------------------------+
>>
> 
> Updating typo: qcom-ride-* changed to sa8775p-ride-*.
> 

Best regards,
Krzysztof

