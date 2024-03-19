Return-Path: <linux-arm-msm+bounces-14573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBA0880212
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AD1228371D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C59482D78;
	Tue, 19 Mar 2024 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DneJ/nvX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4628A2E62A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710865011; cv=none; b=A8rL+dtgw56e99CrlhL9vWwbHEKaSD1oLgzb/e22jaAGDEu6rVfsP2AA0dcH89wUct75xTsAUu1lA/E+pYxexGFVVqebGOLulHFCiowgEO3klYlga2TnnF72kLMZJz2nztyJ5nmmg0ChYmZOCWUpENEBZ9IvY7N98RCQmP9tVq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710865011; c=relaxed/simple;
	bh=jt/z4E2fl/MmVcNLQbE3dr/YDP5CaljyhC9bWYkStRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ch3h3Cvg4dRb+eNUMdz2xs6y+G+9KkQRp3GdIhKCzS1eBdQlkoQ4wZ2xJittZc0bHBip3tUtz3mAdTDHbTaI8u5o3+hOI+9q9G2BwOVNa5vSoAq179KzJjeBiN8wU4Rgwl7Xm4qQdOp+aLH8VgbpLvZvOFgRZt5DDjuxRdl5GsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DneJ/nvX; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d476d7972aso84900351fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710865007; x=1711469807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zkkIJgJaurA9K8QokEebR7bixjWgXEoceQbAEPubtN8=;
        b=DneJ/nvXqnQFc2si0xLZ9xQjeTkceqMzK+AK0eDYIQeKIcSxftaRneC5MR4Ge4lu03
         5F/SzhI5o3DyJmD/hDLEoFb++nghh13uNtL4NEUakGzOd6ynKrUsJ7MGO4dtrbbVAyEY
         gu+oHZJexLnEDTY9Jk+lggYKDReIw7bJuWo+E01vI9ynlWQ29R6AEJKQqEtid3SKLlyM
         BZn+WbGLCDpalK/HnykEg3sGkAT+zYkbBeiAkIG2UYlKdea8QKnbUpjlYJyFP9NA9MrY
         l8stUThCfjgx1wfETJ0dux9EJlAupLkHQxmUkLolGrVKsb5r6JL6CiyUfE0f59XxzwoS
         tmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710865007; x=1711469807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkkIJgJaurA9K8QokEebR7bixjWgXEoceQbAEPubtN8=;
        b=VIEGu9qOslqtI9FPFLK/XnIUXUen5Ub8lYRJmKyK8OhCPgnAYwqkdWgLpEV0TwB1pr
         Khyfg9UBGeuyItxUIolfXIMXoIr3dDefWpe0pK2NgKhBDw4iji9HSTHcQaC5sJMTgVvC
         l8vjvjNDXHPqBDVuza/ZaVTyDcGxJDO/xxrq1aJH5UuU5Edjujm3Aj64IH3zIc+Wb/zp
         JiDlis1bHx6HfqeQQSq6CK463mUQsys5PSPS1Ixb36rb7o9c+a0NrwB2FbXrL6sQUJkf
         WlPtz1PXmYXZ+rRGobIEehinWPAHAxfpwRZSibpfyCmtqirb/w1C5IU7RATDfkcJv0qO
         3wVw==
X-Forwarded-Encrypted: i=1; AJvYcCVkwqyNlBdmwUKiNO338DLext8jkdSfHwJznA1U8yvFNpjiHj+DB2AxhWLwHNzsb2xlwiHgaZBUDZdpVIK4a3dJjVwNbtn1uJrAeKodOQ==
X-Gm-Message-State: AOJu0Yy2AuxHoFpl3taL8wguP74p0i4DTQuqLaYU5Yy9xw9ou5YlC2p7
	BVdLNZQHBX0M/sE9LGb6ahjNzC5Pdh2sO+UHrIMsV6rPkLbKENXLwRGBvm2HE14=
X-Google-Smtp-Source: AGHT+IEMnVT7pDGsySafCWfDKj7dS9ehW1PKUPyGsJqRXzf4ESkY6ATnWPC0NHRaxf2yidkrmVjupA==
X-Received: by 2002:a2e:a794:0:b0:2d3:1043:749a with SMTP id c20-20020a2ea794000000b002d31043749amr2801599ljf.21.1710865006770;
        Tue, 19 Mar 2024 09:16:46 -0700 (PDT)
Received: from [87.246.222.29] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id a32-20020a2ebea0000000b002d42c91249dsm1895250ljr.16.2024.03.19.09.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 09:16:46 -0700 (PDT)
Message-ID: <c3a109b0-1672-484d-99ed-656a43143538@linaro.org>
Date: Tue, 19 Mar 2024 17:16:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] Bluetooth: add quirk for broken address properties
To: Doug Anderson <dianders@chromium.org>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Matthias Kaehlcke <mka@chromium.org>, Rocky Liao <quic_rjliao@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240319152926.1288-1-johan+linaro@kernel.org>
 <20240319152926.1288-3-johan+linaro@kernel.org>
 <CAD=FV=VUFodCAXEJgfpSqZZdtQaw5-8n_-sX_2p6LuQ2ixLRpQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAD=FV=VUFodCAXEJgfpSqZZdtQaw5-8n_-sX_2p6LuQ2ixLRpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3/19/24 17:10, Doug Anderson wrote:
> Hi,
> 
> On Tue, Mar 19, 2024 at 8:29 AM Johan Hovold <johan+linaro@kernel.org> wrote:
>>
>> Some Bluetooth controllers lack persistent storage for the device
>> address and instead one can be provided by the boot firmware using the
>> 'local-bd-address' devicetree property.
>>
>> The Bluetooth devicetree bindings clearly states that the address should
>> be specified in little-endian order, but due to a long-standing bug in
>> the Qualcomm driver which reversed the address some boot firmware has
>> been providing the address in big-endian order instead.
>>
>> Add a new quirk that can be set on platforms with broken firmware and
>> use it to reverse the address when parsing the property so that the
>> underlying driver bug can be fixed.
>>
>> Fixes: 5c0a1001c8be ("Bluetooth: hci_qca: Add helper to set device address")
>> Cc: stable@vger.kernel.org      # 5.1
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>> ---
>>   include/net/bluetooth/hci.h | 9 +++++++++
>>   net/bluetooth/hci_sync.c    | 5 ++++-
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
>> index bdee5d649cc6..191077d8d578 100644
>> --- a/include/net/bluetooth/hci.h
>> +++ b/include/net/bluetooth/hci.h
>> @@ -176,6 +176,15 @@ enum {
>>           */
>>          HCI_QUIRK_USE_BDADDR_PROPERTY,
>>
>> +       /* When this quirk is set, the Bluetooth Device Address provided by
>> +        * the 'local-bd-address' fwnode property is incorrectly specified in
>> +        * big-endian order.
>> +        *
>> +        * This quirk can be set before hci_register_dev is called or
>> +        * during the hdev->setup vendor callback.
>> +        */
>> +       HCI_QUIRK_BDADDR_PROPERTY_BROKEN,
> 
> Like with the binding, I feel like
> "HCI_QUIRK_BDADDR_PROPERTY_BACKWARDS" or
> "HCI_QUIRK_BDADDR_PROPERTY_SWAPPED" would be more documenting but I
> don't feel strongly.

Yeah, I thought the same.. and the binding, perhaps could be generic,
as I have a strong suspicion Qualcomm is not the only vendor who
made such oopsies..

Konrad

