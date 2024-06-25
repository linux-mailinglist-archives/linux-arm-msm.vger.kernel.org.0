Return-Path: <linux-arm-msm+bounces-24101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1514916872
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CF0B282376
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 12:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131F3158A03;
	Tue, 25 Jun 2024 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vr3uC17Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2581157A6C;
	Tue, 25 Jun 2024 12:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719320267; cv=none; b=Bhrl37u3XJh7z8iRXJERiUoaIMocUYhqBoCNz02fv3xKp8fXhE9zIUZiWZfT91EOg9xSHzwGixJpJjj5uS0kOyCHC88vok+YFfUenqsbUlazDS7qGRRTDFTTd0O5bYLiJOqShsj2vdsd4Fdk9kIm8HE/TbRAlu5mEmYdBmvU+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719320267; c=relaxed/simple;
	bh=8FjEfbKwtHs29b/F3+jeLz+Oj9YY9vwp9uEARtWGWBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmhdcwtLXj1REDS/CXi6bQIzCIcrlM5wQjcW+p+uKrHOK/mdghqoFx4BlXRN91YxMOVtcxgQbVweLcV8IJ60uRRE6dLMqtt0woqFqLhzNOJguiF0zFMAg5z4xKs2R50J+O/9+HkJyyoCTx3vI8UiQoL2urGwkKINUV+pdONxxqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vr3uC17Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2FBC32786;
	Tue, 25 Jun 2024 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719320266;
	bh=8FjEfbKwtHs29b/F3+jeLz+Oj9YY9vwp9uEARtWGWBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vr3uC17ZhkpqcSWJvNiJUWFK+rkc3Ko8id7GdLGQyMRMifjJre45H4J7BNjV/UF2s
	 RJYK8WL5Negda5G3rEkBkHskbRA4uhXgeeRLYgdxWcpQTa1vZG3wn2tmUSR8lxMpeQ
	 ZHRW1mVxSed4Kng6/WhTZZAZEh6aKo/NH/X9GaG4VjMKZnXL1yfQ0Mj3Z5iDi4dfgk
	 vH0o1XAyCAd/kpiU7aXKFqzVG/PkteoUOHAX8GM+BnA3XcbKOgSXHSdcsXZVQNdL8K
	 CcKfJSyQiPjhOcBn3+uThqn6U9odPMvYtXtgI2UV2B0kuKhWJgce31qQUHtfHmmY/4
	 rRUcx7skwABkA==
Message-ID: <3e816509-a12b-4658-85f4-c0d0037c6a64@kernel.org>
Date: Tue, 25 Jun 2024 15:57:38 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: sdm845: Add DT nodes for the
 TBUs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Georgi Djakov <quic_c_gdjako@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 iommu@lists.linux.dev, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 robdclark@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_cgoldswo@quicinc.com, quic_sukadev@quicinc.com, quic_pdaly@quicinc.com,
 quic_sudaraja@quicinc.com
References: <20240417133731.2055383-1-quic_c_gdjako@quicinc.com>
 <20240417133731.2055383-6-quic_c_gdjako@quicinc.com>
 <CAA8EJppcXVu72OSo+OiYEiC1HQjP3qCwKMumOsUhcn6Czj0URg@mail.gmail.com>
 <CAA8EJpr3GYimirDz39f4n-3hDAxFWzo+9fdY6MAuxaNguouVFg@mail.gmail.com>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <CAA8EJpr3GYimirDz39f4n-3hDAxFWzo+9fdY6MAuxaNguouVFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.24 10:50, Dmitry Baryshkov wrote:
> On Fri, 14 Jun 2024 at 21:05, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Wed, 17 Apr 2024 at 16:39, Georgi Djakov <quic_c_gdjako@quicinc.com> wrote:
>>>
>>> Add the device-tree nodes for the TBUs (translation buffer units) that
>>> are present on the sdm845 platforms. The TBUs can be used debug the
>>> kernel and provide additional information when a context faults occur.
>>>
>>> Describe the all registers, clocks, interconnects and power-domain
>>> resources that are needed for each of the TBUs.
>>>
>>> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
>>
>> This patch now prevents interconnect drivers from hitting the sync
>> state on SDM845.
>> The TBU driver is enabled only when the ARM_SMMU_QCOM_DEBUG is
>> enabled, which is not a typical case on a normal system:
> 
> Georgi, before I start acting like a bull in a china shop and sending
> reverts, any update from your side?

Hi Dmitry!
Thanks for the report! We can easily add status = "disabled" to the DT
nodes, but please give me some time to take a look what would be the best
way to handle this, as i was out last week and now i am still catching up.

BR,
Georgi

> 
>>
>> [   26.209151] qnoc-sdm845 1500000.interconnect: sync_state() pending
>> due to 150c5000.tbu
>> [   26.217228] qnoc-sdm845 1620000.interconnect: sync_state() pending
>> due to 150c5000.tbu
>> [   26.229926] qnoc-sdm845 1500000.interconnect: sync_state() pending
>> due to 150c9000.tbu
>> [   26.238008] qnoc-sdm845 1620000.interconnect: sync_state() pending
>> due to 150c9000.tbu
>> [   26.249068] qnoc-sdm845 1740000.interconnect: sync_state() pending
>> due to 150cd000.tbu
>> [   26.257127] qnoc-sdm845 1740000.interconnect: sync_state() pending
>> due to 150d1000.tbu
>> [   26.265159] qnoc-sdm845 1740000.interconnect: sync_state() pending
>> due to 150d5000.tbu
>> [   26.273189] qnoc-sdm845 1500000.interconnect: sync_state() pending
>> due to 150d9000.tbu
>> [   26.281206] qnoc-sdm845 1620000.interconnect: sync_state() pending
>> due to 150d9000.tbu
>> [   26.289203] qnoc-sdm845 1500000.interconnect: sync_state() pending
>> due to 150dd000.tbu
>> [   26.297196] qnoc-sdm845 1620000.interconnect: sync_state() pending
>> due to 150dd000.tbu
>> [   26.305201] qnoc-sdm845 1500000.interconnect: sync_state() pending
>> due to 150e1000.tbu
>> [   26.313207] qnoc-sdm845 1620000.interconnect: sync_state() pending
>> due to 150e1000.tbu
> 


