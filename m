Return-Path: <linux-arm-msm+bounces-64614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D1B01ED8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 16:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 308FC5C1687
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE472E5433;
	Fri, 11 Jul 2025 14:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQgqVpHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCDF2E54BB;
	Fri, 11 Jul 2025 14:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243466; cv=none; b=sx8d4yxvydovfaKesErfihQmdnpKMNSK0nRJUE2mA0Yob+K/ablFN99luCLW6YNEgE/HhQW0XUR4dut3mvLe3vk4ZITQ8xQTessHY/vQneiT6P0KPXMLLY3hz5u5s7wtPeV9ILIqZFaYSYnT8kQOjgm4piyM8StAIhEObSyOCmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243466; c=relaxed/simple;
	bh=MD6S8/xxj9RTBUu3TwT1Ermw4nxmIe/UYx06I1y29OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1C6/kqfpHd0nx+4kyHtYqqlz8OkqTMej71z7xosQ25XZzqhrKpRLsU04enRKNu7v4nhnnJiw3g4uJmqkfEy1JGDkajU15SF2Q1qmWevM/gAboii9XQT6+JZNKOBv38Qf/A30D24KkdxiDjbnRIcr8RfEpKmGIDqDBQAbs/p8Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQgqVpHB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589F1C4CEF0;
	Fri, 11 Jul 2025 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752243466;
	bh=MD6S8/xxj9RTBUu3TwT1Ermw4nxmIe/UYx06I1y29OE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iQgqVpHBqtx+tzbCEiuB5gcHOQoLTusIkyEl7pGgvZqch8b5vxE9rGFannoJAMlz/
	 9DFA+YYrqFEZHdMcscBKQteYDkolwSbimqUmbqed0ugaS/HFEAu/121w8zG5Vk/EJ7
	 BcAtE6WiXqQx1U95eaWe8mLHavcnvzcTMCDA90vtNUm15g0y3/x8AijPhG/njxzsgm
	 9jT+Ag3OVzKqDH3r5XoDJKibdfd4RJzvxE6uCc50Ytkq6G3+1Jpu2h6KhxO/DALbk6
	 YYzW8aev9mEV0W45PuDMcE8RRKYIm0FylI2yWy7WA9bove/zlhQRsnm2+XtYznscGY
	 kkIYZNMXWpsCg==
Message-ID: <19d71903-ae26-4de0-b271-77ae7a89fe22@kernel.org>
Date: Fri, 11 Jul 2025 16:17:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: add a sub-entry for the Qualcomm
 bluetooth driver
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Shuai Zhang <quic_shuaz@quicinc.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709144728.43313-1-brgl@bgdev.pl>
 <141abf1f-2739-4ccf-8a2b-3451c299ef49@oss.qualcomm.com>
 <CAMRc=McYqNm4gVgDir=Er_TdOCFUknapFx8a7q4cdyY63sb-0A@mail.gmail.com>
 <CABBYNZJQrHEWGBaNy77NqTbNn8jU=iRi0wsnvPqDb6rA9E5-7g@mail.gmail.com>
 <CAMRc=Md0FCfqAxqLN98QbMFeACbq8DU6o9k6j+bnF6jPY=KGdQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CAMRc=Md0FCfqAxqLN98QbMFeACbq8DU6o9k6j+bnF6jPY=KGdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/11/25 3:45 PM, Bartosz Golaszewski wrote:
> On Fri, Jul 11, 2025 at 3:42 PM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
>>
>> Hi Bartosz,
>>
>> On Thu, Jul 10, 2025 at 10:22 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>
>>> On Wed, Jul 9, 2025 at 7:06 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 7/9/25 4:47 PM, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> Patches modifying drivers/bluetooth/hci_qca.c should be Cc'ed to the
>>>>> linux-arm-msm mailing list so that Qualcomm maintainers and reviewers
>>>>> can get notified about proposed changes to it. Add a sub-entry that adds
>>>>> the mailing list to the list of addresses returned by get_maintainer.pl.
>>
>> Should this go via bluetooth-next or arm-msm has its own dedicated
>> tree? If we continue using bluetooth-next let's agree to have someone
>> from linux-arm-msm signing-off the patches for these drivers before we
>> merge them in bluetooth-next, including this change.
>>
> 
> I think this should go through bluetooth-next. Let's wait for Konrad
> or Bjorn to Ack this then.

Acked-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

