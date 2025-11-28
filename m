Return-Path: <linux-arm-msm+bounces-83809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E13DEC934D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 00:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 012764E13BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 23:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7272E9730;
	Fri, 28 Nov 2025 23:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="HV7ffaOM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68F754654
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 23:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764374286; cv=none; b=BCTrcs9etP/wZWpNYFGRQ6jwI9+uqisdo/yeoSE7Q8gTT+IDVzJSIdOM3nNpbDQlwTuwyrjCdnryioS6/GO7iqcMtbNqCsi5BN2tUJ0LmWNNtxSwSGlApyngFKowB5k7AvcJUlLDRjEt/DKcPULmAcrHzeq6e9+ym4owFa26gTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764374286; c=relaxed/simple;
	bh=SY/EHg6W48d8O2pSGhutlYyPPTSWcuItc5/a11Sy1kg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=jIdFSXjbUF93MgNFfO0BF4aRspYrkDy9uIIPddrPhi9mfxfBGoD2GDkWozIa4hClwA0/Egxggl/4to0FCuNcZJBqGFtp6AiOMn8uEAYLByiflRdeUDo5aPj7V4hto0o55xSpeyAQJFkjX+/Hj+5SMGT3QO43akZwnEGKl2GO6zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=HV7ffaOM; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88246401c9eso21153636d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 15:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1764374282; x=1764979082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrziiLoWQt42KZ+NdT4M3OxTtrrYi+ppUtKZx0c0ePs=;
        b=HV7ffaOMXzMhTKUtoC6mPOPoh3q8jYdwmKsdD/IVJoK6afSS/ah7aQXeuXTuiB+Xpx
         qU20ma+88KMPJwFQfJ/Y19GPlj85FpUYDgeT/i7uysZoEyrCJYsr4IWMP30JJIeHYytj
         FJNVtRyhssZilNVjUSGDOrJLR3rynDAZkHNE8Chjs6lEdlixraogUEDe87ZhrzZeSt7w
         mdTBXbVJaZEHrS830dxS4aPrQiEc3t84QGnJnSZ6awGk/ahzZSmNsS53rR6cU5txBHLL
         ZABtQ4OOioZXgfJ/yzpZdSrMR3F4bBOBDAgg9KQHW7Vp8wMnWTGTcWov84/JmjUpGHS2
         /Zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764374282; x=1764979082;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UrziiLoWQt42KZ+NdT4M3OxTtrrYi+ppUtKZx0c0ePs=;
        b=K6mhSQS8uNB9rcUuNCCgRW5AAmpXp4h2A3RMD8sjGMFjVhw0DtWYajApg077gmhxbM
         GITw39LkNFEviJ+j0fTmq7wfW8/K4wmavWMYEqhXzIqflilxyKp1CCmI1kg8bCm/jKMO
         Sxwux5e5VVnBFCqRvOi7uLGyM3dfP0gzxdyrEDPScYgMElzmBfWkbpYb59euRPyMP16n
         h7HXjTP7HFjCMy0E3Nhn3TX3zUC5j/EjwZrOTHDGccmWFH5t+4byRMKpi6I2Pxe9Gsbi
         Pvsz7/RTaLs5T2kjbvGqxwUGtFZpTyvA8BQjhfxomCixvxG0t1pnSgsTrFu9NkCbzI5g
         4kXg==
X-Forwarded-Encrypted: i=1; AJvYcCVltOaux35g582YAMhsYVCpGgJ/13BX/siR+ZiJbdIGTDFFWc5OZ5LxKxmSpnddoi92uG8OESkjpqXyIxyQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzFUR6CIyqUsrLGmCycR0+5mxURhGFbx+uqwFyeL8yIq9qTqTms
	6oJMWc+ksFRC2YWaI2tcWjN4IrIqPNKKqnsXj62zmSMZWOb2NXKxOFFekrUlnX+ygF8=
X-Gm-Gg: ASbGnctKGe/y337WG6T3rQpGCIS8GgHJUIyRixZ5m8MVqQfVGsS/YcNEti1IjXnPThu
	ulkAM3Y87w1BM++bAaQ/hsT9SvRJQabH2xSSOr9NFggFe8nerBnCGRMtnfH4wSz/GCX72hjcstD
	FmGl79/IwIL9PiqK/XYGJLmep05Rrss9qp0nysBt3zD1xhu+Y76HWMmPLGf781mTLjSzgpRRLse
	sMv7LGOuYT2SSyh3zoDXSBbA3swlpyexQns7LzfSiUDpjCQ2zqxqeRYbnCiNHDlTFHrqOZ2PwES
	O5wHYlvB9DmZkDPJvii6hEmFDxk/ARGbyJJtkpZyUqs4lZjEDSWiIiZhhGmxNgusLf8HZz9QuV4
	SoJMhwN39LZZNd1HU2YRTt8P4mtk+0Sq6JJCuvqxMtz/Yd/iJ4UaJhNkkl7We5K7Uh2Msn+pyaP
	NLz+q8LDf0vKDCFeoHUVoXenhagwCJtuqvWznH21iiERB79XO089Oeat5aRA==
X-Google-Smtp-Source: AGHT+IEnf888i0RTZmv/jkc/n6VWyQPoARdQlGkxMDj48nvQ/lYIodw6c8ly2PHjP4UdRQ56cz3d2Q==
X-Received: by 2002:ac8:5f0a:0:b0:4ee:1b53:ca70 with SMTP id d75a77b69052e-4ee58aa0a0dmr404048241cf.23.1764374282540;
        Fri, 28 Nov 2025 15:58:02 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b8efa9sm37078486d6.50.2025.11.28.15.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 15:58:02 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20251127212943.24480-1-jonathan@marek.ca>
 <aSl48gV9laFb-MR1@linaro.org> <d969b3e6-a6e1-6dd3-45b9-539ba7a9f42d@marek.ca>
 <aSnH3C8s5xVSk_ti@linaro.org> <1aa75dd2-6fb4-e9ca-ca27-c0bd910246fe@marek.ca>
 <CACr-zFBLC+dhM1Unv6iWaqg2H8DC2UbHQ_aQ9-am++MPUgg8ow@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <35615ad4-5b86-577f-4695-c6cd85206334@marek.ca>
Date: Fri, 28 Nov 2025 18:56:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CACr-zFBLC+dhM1Unv6iWaqg2H8DC2UbHQ_aQ9-am++MPUgg8ow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

FYI, for a less hacky solution you can use CONFIG_ARM64_VA_BITS_39, 
arm64 linux as-is refuses to use any memory it can't identity map (and 
the extra 32GB of memory is outside the 39-bit range).

On 11/28/25 5:10 PM, Christopher Obbard wrote:
> Hi,
> 
> Sorry to hijack this thread, but I've been carrying this patch to
> workaround the buggy firmware from Stephan for my Lenovo T14s with
> 64gb RAM which seems to make Linux boot & work just fine with
> systemd-boot.
> Of course, it's a hack and not ready for upstream.
> 
> On another topic, perhaps we need to add this to
> https://gitlab.com/Linaro/arm64-laptops/linux , what do you think
> Stephan ?
> 
> Chris
> 
> 
> commit 16e21600c6a65ace0c75b5a722e27ced8e1bfc48
> Author: Stephan Gerhold <stephan.gerhold@linaro.org>
> Date:   Thu Mar 6 17:41:15 2025 +0000
> 
>      HACK: efi-stub: Exclude 40-bit memory
> 
> diff --git a/drivers/firmware/efi/libstub/efi-stub.c
> b/drivers/firmware/efi/libstub/efi-stub.c
> index 874f63b4a383..355a9b2c0818 100644
> --- a/drivers/firmware/efi/libstub/efi-stub.c
> +++ b/drivers/firmware/efi/libstub/efi-stub.c
> @@ -106,6 +106,17 @@ efi_status_t
> efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
>   {
>          char *cmdline __free(efi_pool) = NULL;
>          efi_status_t status;
> +       efi_physical_addr_t addr;
> +       unsigned long pages;
> +
> +       addr = 0x0000008800000000;
> +       pages = 0x800000000 / EFI_PAGE_SIZE;
> +       status = efi_bs_call(allocate_pages, EFI_ALLOCATE_ADDRESS,
> +                                                EFI_RESERVED_TYPE,
> pages, &addr);
> +       if (status != EFI_SUCCESS) {
> +               efi_err("failed to reserve upper 32 GiB (40-bit memory)\n");
> +               return EFI_OUT_OF_RESOURCES;
> +       }
> 
>          /*
>           * Get the command line from EFI, using the LOADED_IMAGE
> 
> 
> 
> 
> Cheers!
> 
> Chris
> 
> 

