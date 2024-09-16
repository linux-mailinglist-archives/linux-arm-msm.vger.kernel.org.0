Return-Path: <linux-arm-msm+bounces-31873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8765997A9A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 01:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DA7E1C22DA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 23:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C4A16130C;
	Mon, 16 Sep 2024 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYb1IZjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A611160883;
	Mon, 16 Sep 2024 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726529572; cv=none; b=sffZn0mdz9p99CTqSwfSuAPmm54s17pITMh45M1uSQ7YOeDWI76sw/nlk3gOkde/A5PUQbiRABUPxAywSmZ5NXl/IhJCfRbmTGwlqyz8M2elfkyLNAMEHP6454MNbWUgIbn4Df/iKZbEHV69kzzlWawMwvKF4jhL49Byi02aTjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726529572; c=relaxed/simple;
	bh=ROixPGdaV3KjJlBn+Wx9tvLmJ8N/itC/+M1JA09al6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctdiPAmadXroUI0HZu3DmcALqXChC04dgYw4U+jrkMos72jOVv8R+VPR4MdyoqbvQkgYZAMrjmjZm7duLNSw7P7im2c2MuEBkl6s/uyxYyLa0wzDtPniCrrDdoZ+YqWBqJyEf51CIEqIoSMt29xRCv5gdi46DWDv5mZktRc6p9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYb1IZjh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9747C4CECD;
	Mon, 16 Sep 2024 23:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726529572;
	bh=ROixPGdaV3KjJlBn+Wx9tvLmJ8N/itC/+M1JA09al6A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dYb1IZjhVZuJz1KUp4Ws0YIaX2OA9clWgRo5NSP65kXzYiPJF30lpDl0lA8U1/uik
	 j8+WRqmmjUq6eUkvs+W55Vy6ZFstVmvY6DPwwtFY3zG2Kh+oC95yCTujnqK2BsyAwI
	 V7XgQX8QEEItO9rvYd0XshXwDshRqwpR7qj0bHqlUt8n/W+qwR0I1BSgtRiJK3GrPT
	 rrGZ1NOV24eRnHtoP+mgq6hwv9/q13LiwMPfFAYyteUP+YhqhNxdGzTOAaJ+Kfvb5y
	 xoWvJBZjODT7EYatczYMXrZPu2+AhRnySAAi/cLViPPftkHZMofgsHqx1noApnNhiC
	 5FvaUC4qhpdWQ==
Message-ID: <dc1216db-128f-4cb4-9df9-ba095dfe713d@kernel.org>
Date: Tue, 17 Sep 2024 01:32:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcs9100: Add support for the
 QCS9100 Ride and Ride Rev3 boards
To: Tengfei Fan <quic_tengfan@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
 <20240911-add_qcs9100_support-v2-4-e43a71ceb017@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240911-add_qcs9100_support-v2-4-e43a71ceb017@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2024 1:10 PM, Tengfei Fan wrote:
> Add device tree support for the QCS9100 Ride and Ride Rev3 boards. The
> QCS9100 is a variant of the SA8775p, and they are fully compatible with
> each other. The QCS9100 Ride/Ride Rev3 board is essentially the same as
> the SA8775p Ride/Ride Rev3 board, with the QCS9100 SoC mounted instead
> of the SA8775p.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

