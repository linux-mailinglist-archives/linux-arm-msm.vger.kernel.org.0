Return-Path: <linux-arm-msm+bounces-59701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBEFAC6A76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 15:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0684E2D1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 13:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7BF257440;
	Wed, 28 May 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QDm/OLtB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1669284B58
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439073; cv=none; b=shAB+LwS2ylF60er0rwiUxeUPlJpX/wv/NXVRWKUNGPSN6B21YQdHNg3aW3HTS6sHnIf5+viG842oi+jpgxxs+S1LjFWUZlDEKBt3GJCUagkcj0bdDpUjx6ovhLQGDKjFQCI8dGd6BsKdzrXzV5GQvl01YWC8eGOqDuOHUsNxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439073; c=relaxed/simple;
	bh=Vg+FrRbGTeA8f3PlM/x8Z6doWF3ojO83xJlLB1B3f6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tcaa9Ph/tx7mWv1XTZToXww6sHGsp8XKTJr99UqFkLXHC5IIYVgfWgPZOJ9CyjfaVa2F4HfrCNbNCwjo5I+K/2gdug+GaLo9RNHz5646o2t3PkWYm3KIWgvx7jTLaKo6B1VqKp1/hz/TFNB8uH+aDeXUjJodXtHQKTosxAMGhhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QDm/OLtB; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so700655b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 06:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748439070; x=1749043870; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8UdvRNXq8aAecD2U0dxQ0wWai5QzfjmCr8Z4Xq1f1YE=;
        b=QDm/OLtBHw+gGCXuqIxydGAHuyck0tTiBNtReqL/f1zP5YQUuIjSEdSFEPbgONw9vj
         sgAumuToC4b1b3Jxs22ce1/+CQaBhVby+GVjXwH0ymAWwlKwWiaJBNiz++gEJQG0rH5B
         Gwa2h5BB+WnC/rg2Ih6eCELqxAN+3tt3IGhLKIape1vYGECzDWKKsGtf5UtWTxZ/mw+2
         +OTdRRN0holGgrR866/8OgZ4tkY8kYG+KVrpPHDdoe0wN47ZGESs/oytgfVP4Esfd3FT
         hB8WLgpBkWV1xxbxUAwtHXdvPxeyA9jFQ6haXjuEigHwjb8Nd8d/+ngfgGbyJfjn5PlG
         YSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748439070; x=1749043870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UdvRNXq8aAecD2U0dxQ0wWai5QzfjmCr8Z4Xq1f1YE=;
        b=ZjAkL5cbIEdkQwhdmGJqwT0eymsnOYOw+y8yxV/+7vxzglBvq55xl99TKhUjK1m/rb
         azevULm8HxqINe9vpeZKus65I0eEQKDx1yJCTUzAjHj04UI4mJBhA9s/Oncarha3YmqD
         Jt15w/QLNvDdkYDO/UradDfG24TSycWPHnzXwqwQC99QZR7+gI5hAT2kUZjOw1buv7VK
         M/IsgkBH8eMHqWufSO0YC00nVVZc8rHr0GfPh5I0hSLumFrhfRraEbINFKE31qo6aS9N
         rvyDncbI72lZqo3DJm1qbRYdGT8CEoMo+wAfo/eoAwUGxeBFzpSFvsU9bc5ajHD27AKi
         mN4w==
X-Forwarded-Encrypted: i=1; AJvYcCWbOs4pVlJhdULE2Wyn15V1HSiVXBsQ2JPvGQOGPqLDl/nGDglL2cNWcP9YxNFgyYFEJi/qCo9+0qhDhWSx@vger.kernel.org
X-Gm-Message-State: AOJu0YzYW2L2RKpE8mT9hYABKXLIZ0OYTjP/TGE/S+55Nt1R3ZlWKHT3
	8VeqosoHHlmHUglbLquDnB1Tt52Ns3/HDA5dIMPDWmF1NaTNNdF1+yH02kY9YoZ0xyyBLyLQUVz
	CWyY3boT5kmo7LFNpdqtJbu8JASL3Z4hqqGYO+2mdjQ==
X-Gm-Gg: ASbGncug9QybNVUp7bz3s1ciiGMoOt8Kaj4VQmVlEjgkVOifPowO6z+FUCK/95tHQB0
	VO6q02SSqiAUxWjoUlyvvOj34XVuKgXEvziohVm7XJqx3dpAW6Eo0H7rd0NjV5JkPY0RNTEnUu2
	gr+a5RoobaY8SFlIT1nyXoQh+W9W7Terj0q5aMMNrpvrQUCq0ANhhol9lCyrA2iYDpuw==
X-Google-Smtp-Source: AGHT+IG9j6POnBtn5e0Q2pGrtNN2Sbh3sgqFrqPfg1VSh05XHmn/iVMWNJ6bEEiFKPdnKFJUg0aWvLMjuZxJtWY11l8=
X-Received: by 2002:a05:6a20:cfa9:b0:218:574e:830d with SMTP id
 adf61e73a8af0-218ccd94689mr6594968637.21.1748439069932; Wed, 28 May 2025
 06:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
 <757925b7-3795-409a-9419-b33767c49e2e@oss.qualcomm.com> <2f010e28-121e-4e60-bf48-5ee5bcd0cbea@oss.qualcomm.com>
In-Reply-To: <2f010e28-121e-4e60-bf48-5ee5bcd0cbea@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 28 May 2025 14:30:58 +0100
X-Gm-Features: AX0GCFs8sPqVEo-rRNs0GPnAqg3ldJr20mhUWNavfYnn9A10EucMPhXNzc1P-NU
Message-ID: <CAJ9a7Vg7MtLaud715JYEo5JD6x4WmHq9TsSSor1-TYq5M5u+cw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: fix a crash issue caused by
 infinite loop for Coresight
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This is clearly a platform issue - loops as you describe are not
permitted by the CoreSight architecture specification.

We should not be trying to fix issues that are out of specification in
the drivers.

Regards

Mike

On Mon, 26 May 2025 at 01:40, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
>
>
> On 5/22/2025 11:06 PM, Konrad Dybcio wrote:
> > On 5/22/25 2:50 AM, Jie Gan wrote:
> >> An infinite loop has been created by the Coresight devices. When only a
> >> source device is enabled, the coresight_find_activated_sysfs_sink function
> >> is recursively invoked in an attempt to locate an active sink device,
> >> ultimately leading to a stack overflow and system crash. Therefore, disable
> >> the replicator1 to break the infinite loop and prevent a potential stack
> >> overflow.
> >
> > Is it something we can fix the driver not to do instead?
> >
>
> As Suzuki mentioned in other mail thread, it is very difficult to
> observe the scenario that there is a loop in the path by current driver.
>
> I tried fix the issue in driver before send this DT fix patch.
> I will continue to seek an option of fixing in driver.
>
> Thanks,
> Jie
>
> > Konrad
> >
> >>
> >> replicator1_out   ->   funnel_swao_in6   ->   tmc_etf_swao_in   ->  tmc_etf_swao_out
> >>       |                                                                     |
> >> replicator1_in                                                     replicator_swao_in
> >>       |                                                                     |
> >> replicator0_out1                                                   replicator_swao_out0
> >>       |                                                                     |
> >> replicator0_in                                                     funnel_in1_in3
> >>       |                                                                     |
> >> tmc_etf_out <- tmc_etf_in <- funnel_merg_out <- funnel_merg_in1 <- funnel_in1_out
> >>
> >> [call trace]
> >>     dump_backtrace+0x9c/0x128
> >>     show_stack+0x20/0x38
> >>     dump_stack_lvl+0x48/0x60
> >>     dump_stack+0x18/0x28
> >>     panic+0x340/0x3b0
> >>     nmi_panic+0x94/0xa0
> >>     panic_bad_stack+0x114/0x138
> >>     handle_bad_stack+0x34/0xb8
> >>     __bad_stack+0x78/0x80
> >>     coresight_find_activated_sysfs_sink+0x28/0xa0 [coresight]
> >>     coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
> >>     coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
> >>     coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
> >>     coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
> >>     ...
> >>     coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
> >>     coresight_enable_sysfs+0x80/0x2a0 [coresight]
> >>
> >> side effect after the change:
> >> Only trace data originating from AOSS can reach the ETF_SWAO and EUD sinks.
> >>
> >> Fixes: bf469630552a ("arm64: dts: qcom: qcs615: Add coresight nodes")
> >> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> >> index f08ba09772f3..b67c1f8a1118 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> >> @@ -1902,6 +1902,7 @@ replicator@604a000 {
> >>
> >>                      clocks = <&aoss_qmp>;
> >>                      clock-names = "apb_pclk";
> >> +                    status = "disabled";
> >>
> >>                      in-ports {
> >>                              port {
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

