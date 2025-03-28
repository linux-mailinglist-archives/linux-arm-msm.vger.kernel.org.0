Return-Path: <linux-arm-msm+bounces-52756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 017CFA74940
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 12:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1F9C7A42E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00E82135CE;
	Fri, 28 Mar 2025 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Ta014T2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B318E25;
	Fri, 28 Mar 2025 11:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161690; cv=none; b=QeVIF67bjaXHXj+KOkwez3+fFge1/jUq4nxMDTtmO/oSVlSbMBcI/Nm8EFQWQRs3yyNt+VI6OXk6BkNVwN5KtKx0ZWU/iZBHdQRZ25mLXVRfTgoad/jL/j46z3hCQF4f2VrDWYE2fshWCHBfPnLY7YVz0O+hrKbPpDmj5nVlVPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161690; c=relaxed/simple;
	bh=K9wDcef5hQuqNvlnqsblMDwC/g+sNvxrB/xhp3w07Nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6b/pl/YjX8MnxYyjyanuz3oKhO/91k7BlygH8eqv2TiSaPQvpuXhjj/rAc31bU3q9Cjt2LE90Yp2y6PXqCiRVBgjuoJ/A5pk7D/ZmcKLtfaik8tCiptxR79AUOauFBFFOgLt3FAvrql6aZD7TgdSFT2g3Y+oYQD2HSRmclMyko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Ta014T2A; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 32B732FC007C;
	Fri, 28 Mar 2025 12:34:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1743161684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YAsIGem07lshqs83/SkIwt2xkkriVMl0E8eIuZX9gEc=;
	b=Ta014T2AQd1YNRn0CfWQ5kSbTs39uUNfCuma74XWTf4jx4xVg5nzyc6q/cpwrJ8b5MyqTw
	gwsCXR8UdQfEFUMAmJ6vmejzvVIsFq1w12y9McE6rJRrzjdrdhP+JvqprrTkWClULbJr7t
	QnRUQv7scsZ4cXtrNPKXovu2Si4xagM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=g.gottleuber@tuxedocomputers.com
Message-ID: <56b22711-1d78-4cc9-8a32-cb4805497ebd@tuxedocomputers.com>
Date: Fri, 28 Mar 2025 12:34:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Georg Gottleuber <ggo@tuxedocomputers.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 wse@tuxedocomputers.com, cs@tuxedocomputers.com
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com>
 <5hvghahezqms6x4pi3acgaujyhiql6mzl2xhzph5phhki2yiyq@oi3xjatj7r64>
 <129bf442-2505-41c8-9254-ad7cacefab89@tuxedocomputers.com>
 <l77iickvroov7crzg6s2i7nq3kakqgdtbqki74stavqkiwyjfs@rv2oegbwogxi>
 <p5dxsjp2xdl5esmpxseqiy4n2xsici5fvow6wtiquhq7ixmlkt@fty3ez75y5ld>
 <CAO9ioeUSSshmw6gdEhQNzgAUQLh44etHRAsOThwFZ_9mfyJYiA@mail.gmail.com>
Content-Language: en-US
From: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
In-Reply-To: <CAO9ioeUSSshmw6gdEhQNzgAUQLh44etHRAsOThwFZ_9mfyJYiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Am 21.03.25 um 16:51 schrieb Dmitry Baryshkov:
> On Fri, 21 Mar 2025 at 17:49, Ettore Chimenti
> <ettore.chimenti@linaro.org> wrote:
>>
>> Hi Dmitry,
>>
>> On Tue, Mar 18, 2025 at 11:36:32PM +0200, Dmitry Baryshkov wrote:
>>> On Tue, Mar 18, 2025 at 04:24:27PM +0100, Georg Gottleuber wrote:
>>>> Am 07.03.25 um 07:45 schrieb Dmitry Baryshkov:
>>>> [...]
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..86bdec4a2dd8
>>>>>>> --- /dev/null
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
>>>>>>
>>>>>>> +&gpu {
>>>>>>> +       status = "okay";
>>>>>>> +
>>>>>>> +       zap-shader {
>>>>>>> +               firmware-name = "qcom/a740_zap.mbn";
>>>>>>
>>>>>> Are the laptop's OEM key/security fuses not blown?
>>>>>
>>>>> Can this laptop use "qcom/x1e80100/gen70500_zap.mbn" which is already a
>>>>> part of linux-firmware?
>>>>
>>>> It seems so.
>>>>
>>>> Because there were no logs about loading zap.mbn, I activated dyndbg
>>>> (dyndbg="file drivers/base/firmware_loader/main.c +fmp"). See attachment
>>>> for dmesg output. But GUI freezes after sddm login.
>>>
>>> Does it happen only with this ZAP or does it happen with the ZAP from
>>> WIndows too? Can you run some simple GPU workload, like kmscube from the
>>> console?
>>>
>>
>> It seems to work fine changing the `firmware-name` property to
>> "qcom/x1e80100/gen70500_zap.mbn" and updating to latest mesa on Debian
>> Sid (25.0.1).
>>
>> Also tried with linux-firmware binary blob.
> 
> Then please post an updated patch, using firmware & ZAP from linux-firmware.

I'm sorry, all our devices are engineering examples (including Ettores).
The mass production devices will be fused.



