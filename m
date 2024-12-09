Return-Path: <linux-arm-msm+bounces-41177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4339EA2DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 00:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7915D281DC2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 23:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A9B223C61;
	Mon,  9 Dec 2024 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="adL21zlt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE119EEC2
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 23:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733787313; cv=none; b=nDoWrkGqomnrwjPyIWArXAfdcQBbmcZJBbVonF6GQb0OLyjrsVuhYlGcWbtWMf6oUBCb6TfynXz2wSUed9x0dO5nY/MJCRdkdPb0V42TwNsRWeAcuIRFzTg0ff10sQB6qTpNEQO2UvfJA+Wt3lib5gyJN1oaSJ+p4O0Wrif4+Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733787313; c=relaxed/simple;
	bh=Ol03no2dvKfCX77dORK9oxswnoxJuMa+LnUc2hkNM0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFn9xXpxCc/1sjAij0JGGzDPrimommiFVhOp9KSdHGVx4eNyzexN4iTs7KPbXt0/SzZIYjO+awvHC067F7kg8P0w/5J3gzW0BMLYEAeuiVx4dLI5LIWulf9m81rCG2AkIcyBM2JMNONN+t+WY/cq4wZfJkJLZLwQZzbb2mRJBBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=adL21zlt; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467431402deso19221cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 15:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733787311; x=1734392111; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol03no2dvKfCX77dORK9oxswnoxJuMa+LnUc2hkNM0M=;
        b=adL21zltDa0PxxcBgMIHcXc5knaDVGBihaGdNOJBY8kF3OVQKaF5TWcORgJXzScFDc
         /OjtfOQ8t6SX7FgIAdMgLGqgmYgy4YYUDK8g2Sayky1EeK4X9rYzNM6c9HTrgv3bjDJB
         t1rX2x7rSqzPceeYeUK+4H3a7kxLCHrtuj1c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733787311; x=1734392111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol03no2dvKfCX77dORK9oxswnoxJuMa+LnUc2hkNM0M=;
        b=v83GjW2lby++/f7NQVxbpRoOPEbkSSwTyDS0A6s9D9Vjt6sa/CAoS3W/1k9TmJVaFz
         aMgZCPp00VNCS0Cq8nAqKnJ9lOWaJ1WLKdIo+5UIwhQ/w1905kZcbVxyXsTaGX2DViYD
         9it7aDH2wg5niL4Kx9QFT419FIYR4eYM6YVyXnQyULxgPY4O6nPvABGAU+tjsblWxHDd
         R4AXZEhSPnd1zcDziKpBOAYgtcy+fLeNpquQ6zYet1vtVBPs9tAkprSsQgjk5jugcsJA
         GlkT/IHBzAi7BqysMcV8EQbxLOgYJk68KsfQ9h4mdw3N3jpbAbo8UlJtmjsFxRUO7UmI
         zmyw==
X-Forwarded-Encrypted: i=1; AJvYcCXRqsSxzHRjn/KcSwQ/YHPi6B5VlsfkMjEdd7gHyjHqvfnsm7vYLK1aMUn4+8sjY7ocv/C54IEsHLJNO7Vu@vger.kernel.org
X-Gm-Message-State: AOJu0YybKoORP3MAh8pqUuwZ8e+OHcctbPusrS0ov7VJxDvPHH8F6BFb
	iUs0CM6pVxmFIH/x2+HfKYa0a26Zua665u5NLjAsY57NDrB4Z6wZrNjsNUPZSnJkacZW8TBlYrq
	3mmkp/G827xNPEZC40DNmlRWulkuXeqOdwwca
X-Gm-Gg: ASbGncsUw8z1IoA4YRKXv1o5HkCalHulo8MZk6KL8zlS/potuT9+b5T8Lx1AQvztwhQ
	9X4ipU9SHONoGgq+lt6cAXAllm5odqz3d
X-Google-Smtp-Source: AGHT+IG6vBSDnyo8DnXzx5kPzDIJg4/9NRCPEUWYVmSZGIix1BOzyQgBNO2RxNpvwUriTGNn5xGsd58zCPlKbjcYd9k=
X-Received: by 2002:a05:622a:4ccd:b0:466:a3bf:41ab with SMTP id
 d75a77b69052e-46777683c7bmr441641cf.21.1733787311096; Mon, 09 Dec 2024
 15:35:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.2.Ia3dfc0afadbfbee81bb2efb0672262470973dd08@changeid> <wx6qbdbcrvbq34snzkxawlbpxm6vogt5ccjmdqqyazukfbjy7t@qkvax7tr27bs>
In-Reply-To: <wx6qbdbcrvbq34snzkxawlbpxm6vogt5ccjmdqqyazukfbjy7t@qkvax7tr27bs>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 9 Dec 2024 15:34:59 -0800
Message-ID: <CAODwPW8mq-saJuTYnMhA6bCopcjQwBxEoyWhQB60Jg1m7wUZkw@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: errata: Add QCOM_KRYO_2XX_GOLD to the spectre_bhb_firmware_mitigated_list
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > NOTE: presumably this patch won't actually do much on its own because
> > (I believe) it requires a firmware update to go with it.
>
> Why? is_spectre_bhb_fw_affected() returns true if (cpu in list OR fw
> mitigated)

That affects reporting, but the mitigation works by making an
ARM_SMCCC_ARCH_WORKAROUND_3 Secure Monitor Call to firmware, and that
only works if that call is implemented in firmware. Trusted-Firmware-A
is currently the only open source firmware I'm aware of that
implements this call, and it only supports Kryo 4 and 6 upstream (not
2 or 3).

So in order for this patch to actually be able to do anything other
than report that the mitigation is missing, it would need to run on
devices that either use a downstream fork of TF-A with added Kryo 2/3
support (I doubt this exists because AFAIK Kryo 4 was Qualcomm's first
attempt to use TF-A) or use some other proprietary kind of Secure
Monitor firmware that has this SMC and mitigation implemented
separately. (It seems unlikely that Qualcomm did this in their QTEE
firmware, since if they had they would have probably also added the
MIDRs here to Linux to activate it.)

