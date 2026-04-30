Return-Path: <linux-arm-msm+bounces-105402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJKVES+Q82ky5AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:23:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4F44A6509
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12026300B9D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB9732ED27;
	Thu, 30 Apr 2026 17:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trdGs0BR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029EA33F59E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569763; cv=none; b=txWYXkNFGKniOtf3UAEwiUfVNN6qBK9fRC75+1bdEP7MTbNfMUqYtwZCWVvWf4MlcktNEJkVy8GoJFXoLn8jiRtUCp196Nqpdob4hOnl0hhLMLQjyYGdYd32T5cXZALOi6mjlLGRGbpAthFSEmZyLqZIp8DSCqNTB5pXzYIwe8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569763; c=relaxed/simple;
	bh=/UWCCBGsCu/RGGJJonAz1pXClbHfOB5nu1HYAyRt/xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRZzJMFBa8IeauEg9dtYg5qlxpkM+NiQqOaaHgqejwYbLWRvhNO0iR+dVjOUuoXyc5MlrrG0FwOa0/+a15zSwsmKnOjP+tXB6B+WgEF4USA8yGoxpKBVwGF5++2ZXloYAHUMB4w3QE7hAgM0Tespjl2xAz3B8TQH7+wLqoQk+mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trdGs0BR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891ad5c074so9145e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777569760; x=1778174560; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86ExqbKZCyhM1MOJP0NAPT/CzgM2Kogsj9N6V/w/ADA=;
        b=trdGs0BRd9XkGQvC4s0mWCjGDC0DQvjtwWonWe/mrrLu4ZwtAxG8mBX/3XFAe5Vyc2
         8uzNB+RbUqqMG+qP6G1MVt50Z97BAI3mHyBCMepdYut11KxKm8BVrs+cDJm48HjYM0b9
         wAQpLwK60f6AKfm+YI6GI2hjMeU5pS9gbBMztvfXAMCHvbFk2bDU3yx7P4rWHDwXYQjt
         MZnBPWXCr+80Qh12fR41Ab/HMTta6OCWNJEXjV6dNdbuxRcLKG+Ob72lMbH/oon81gUU
         zrX++LQn3Cl3TxME/xq0mBgRPhh2J1pVUS3XNUwR75Ai6FW0xH+4o56QCQCh5w0zhzSO
         Vy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569760; x=1778174560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86ExqbKZCyhM1MOJP0NAPT/CzgM2Kogsj9N6V/w/ADA=;
        b=LxLwMbfc2Ni35m+EUGIK/gLcUxjlY0kN8UPhV/cXGzOH90GqJyfVYALIhsxBKH4n4N
         gGm3O+vnnBGJ0rUrMDw57P/Y0WOxwFIdPG0r/zzUKYwm/AnNdsjhSUak2PCDmFoEcGso
         lLYxRzeRpWocux/7RcOeaEPtLyI7ohCQ62hyn2Q9/rwpQfz4558TBS0goh+FE9ZTyb7R
         raeIS1Dl+uRLr3uSIQs9B8UMOdIzB+9JTRXRZqQ9UoO0Q5PyQHo3T5dG1m4xeh6iEgoH
         /SQ6LelMKKcvkSUfd6R8m/+qtA8tShZfX2MsrwShxqIdIeJHQ5WMqNLk7zXzeaGexmOS
         /O6w==
X-Forwarded-Encrypted: i=1; AFNElJ99tALl8ZGeYfxZxwzoTONIoeh7/gR0L+IP0LuZI8t8itO6GkHKZEvX/NVfdlNz8sveytM4yA9HEhqYpgSY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9K+NhiujAhKjCw9CwjA1ozSBAkCzqPaiEPxZWClQiDdxbRdxf
	YiZjH2eaeWY02+5a5L8GaZ2oHkHMOKof/e0HycgRub5jtW2iYO7FMKVql9R7018L4g==
X-Gm-Gg: AeBDieuotBYKSKrPO6AChRSqSLz2k8nzFiJInXw7FSi/jISvr6h4a0c0PDyNAGDtOau
	u/F+7qHkDHLiSUIvmqBni/vQH2qcvkZgdQlpRoLFJr9sRVHaAWgGby9XTZpBWNgfxu/ce5yUX+w
	NPCLRGcKYPpnKu/OCmH8j5mGZR5BdUdsPkmS5a83vQ81gfhdSMHQGKhbZwNgRVKuySPZo2gvOxh
	OT72MO1A/lKJcaU8GDD3OJxZILLO/A5rSqWHrUxAL55KDUlbdBe/N1oWp4ZoACC/t0bwnylU8my
	yzemoXqZ90GoyooMPILOMhThTnWr99YDSFwnT2UgOjrZX3Ee5WSgJYiybJVVOf9m08GZt1otvzS
	tCnsJpNQjujh10OXAhHDvgU9PKfr3P4BoRkJyBq0WPIRtmUeA+YUT2JBtmFetTXmMdrA4jufbCl
	287H4z0al3Hgza9Dch58a7UzRFlLGaUcZmCTySuzNKw/RKqa3qPNQL/P+OBtkD1Hg9wN1lQx7D9
	wmHjSzNqRM68oJI
X-Received: by 2002:a05:600c:3496:b0:48a:6321:87f7 with SMTP id 5b1f17b1804b1-48a8dbed9a8mr10305e9.8.1777569760137;
        Thu, 30 Apr 2026 10:22:40 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm126815125e9.13.2026.04.30.10.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:22:39 -0700 (PDT)
Date: Thu, 30 Apr 2026 17:22:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, maz@kernel.org
Subject: Re: Support for Lenovo IdeaCentre Mini X (Purwa)
Message-ID: <afOP2xXmEpV1eI3Z@google.com>
References: <20260429141815.827157-1-smostafa@google.com>
 <5c838838-00e5-45f2-9515-edbdcddf50ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c838838-00e5-45f2-9515-edbdcddf50ec@oss.qualcomm.com>
X-Rspamd-Queue-Id: 8F4F44A6509
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[google.com:s=20251104];
	TAGGED_FROM(0.00)[bounces-105402-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smostafa@google.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,1bf8000:email,1c08000:email,1c00000:email]

Hi Konrad,

On Thu, Apr 30, 2026 at 06:48:33PM +0200, Konrad Dybcio wrote:
> On 4/29/26 4:18 PM, Mostafa Saleh wrote:
> > Hi,
> > 
> > I see that recently the support for “Lenovo IdeaCentre Mini X” was
> > added [1]
> > However, unfortunately that doesn’t work for my device, the board
> > resets once I try to boot the kernel from UEFI.
> > 
> > I believe that’s because it is another variant, as I have been using
> > my device tree for some time[2] which is hacked based on the crd
> > device tree with some trial and error. With that I can boot with
> > PCI/NVME/Ethernet and USB (there are also some other errors in the
> > log related PMIC), this device tree is based on purwa.dtsi unlike
> > the upstream one which use hamoa.dtsi.
> > 
> > Are there any plans to support the Purwa based variant? I am happy to
> > help with testing, but I can’t confidently send patches as my device
> > tree is based on trial and error rather than a data sheet.
> 
> Hello,
> 
> could you try
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
> index bfb7cea56df9..845f303c3836 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
> @@ -8,7 +8,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> -#include "hamoa.dtsi"
> +#include "purwa.dtsi"
>  #include "hamoa-pmics.dtsi"
>  
>  / {
> 
> 
> for starters?

Thanks for the suggestion, I tired that now and it doesn't boot, because
PCI and USB timeout, most likely power issue:
[    0.449155] qcom-qmp-usb-phy 88e3000.phy: phy initialization timed-out
[    0.455886] phy phy-88e3000.phy.6: phy init failed --> -110
[    0.458571] qcom-qmp-pcie-phy 1bfc000.phy: phy initialization timed-out
[    0.461710] dwc3-qcom a400000.usb: error -ETIMEDOUT: failed to initialize core
[    0.468478] phy phy-1bfc000.phy.12: phy poweron failed --> -110
[    0.475826] dwc3-qcom a400000.usb: error -ETIMEDOUT: failed to register DWC3 Core
[    0.481982] qcom-pcie 1bf8000.pci: error -ETIMEDOUT: cannot initialize host
[    0.489748] dwc3-qcom a400000.usb: probe with driver dwc3-qcom failed with error -110
[    0.496742] qcom-pcie 1bf8000.pci: probe with driver qcom-pcie failed with error -110
[    0.536145] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with supplier a600000.usb for /pmic-glink/connector@0
[    1.610679] qcom-pcie 1c08000.pci: Link failed to come up. LTSSM: PRE_DETECT_QUIET
[    1.620224] qcom-pcie 1c08000.pci: error -ETIMEDOUT: cannot initialize host
[    1.627406] qcom-pcie 1c08000.pci: probe with driver qcom-pcie failed with error -110

However, with my device tree I see:
# dmesg | grep -i -e qcom-pcie
[    0.380703] qcom-pcie 1c00000.pci: host bridge /soc@0/pci@1c00000 ranges:
[    0.388163] qcom-pcie 1c08000.pci: supply vddpe-3v3 not found, using dummy regulator
[    0.399742] qcom-pcie 1c00000.pci:       IO 0x007e200000..0x007e2fffff -> 0x0000000000
[    0.407745] qcom-pcie 1c08000.pci: host bridge /soc@0/pci@1c08000 ranges:
[    0.419165] qcom-pcie 1bf8000.pci: supply vdda not found, using dummy regulator
[    0.419290] qcom-pcie 1c00000.pci:      MEM 0x007e300000..0x007fffffff -> 0x007e300000
[    0.419320] qcom-pcie 1bf8000.pci: host bridge /soc@0/pci@1bf8000 ranges:
[    0.419344] qcom-pcie 1bf8000.pci:       IO 0x0070200000..0x00702fffff -> 0x0000000000
[    0.419358] qcom-pcie 1bf8000.pci:      MEM 0x0070300000..0x0073ffffff -> 0x0070300000
[    0.426796] qcom-pcie 1c08000.pci:       IO 0x007c200000..0x007c2fffff -> 0x0000000000
[    0.426801] qcom-pcie 1c08000.pci:      MEM 0x007c300000..0x007dffffff -> 0x007c300000
[    0.530174] qcom-pcie 1bf8000.pci: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 1024G
[    0.538333] qcom-pcie 1c00000.pci: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 1024G
[    0.550954] qcom-pcie 1c08000.pci: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 1024G
[    0.730680] qcom-pcie 1bf8000.pci: PCIe Gen.4 x4 link up
[    0.730996] qcom-pcie 1bf8000.pci: PCI host bridge to bus 0006:00
[    0.736837] qcom-pcie 1c00000.pci: PCIe Gen.1 x1 link up
[    0.745431] qcom-pcie 1c00000.pci: PCI host bridge to bus 0005:00
[    0.748835] qcom-pcie 1c08000.pci: PCIe Gen.3 x2 link up
[    1.075106] qcom-pcie 1c08000.pci: PCI host bridge to bus 0004:00

And
# dmesg | grep -i -e usb
[    0.268120] platform a400000.usb: Adding to iommu group 6
[    0.268154] platform a600000.usb: Adding to iommu group 7
[    0.501050] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
[    0.503561] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
[    0.503565] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.1 Enhanced SuperSpeed
[    0.503920] hub 1-0:1.0: USB hub found
[    0.504275] hub 2-0:1.0: USB hub found
[    0.504461] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with supplier a600000.usb for /pmic-glink/connector@0
[    0.528540] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 3
[    0.531145] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 4
[    0.531150] xhci-hcd xhci-hcd.2.auto: Host supports USB 3.1 Enhanced SuperSpeed
[    0.531529] hub 3-0:1.0: USB hub found
[    0.532008] hub 4-0:1.0: USB hub found
[    0.776839] usb 3-1: new high-speed USB device number 2 using xhci-hcd
[    1.091522] hub 3-1:1.0: USB hub found
[    1.206774] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci-hcd
[    1.300590] hub 4-1:1.0: USB hub found
[    1.642832] usb 4-1.2: new SuperSpeed USB device number 3 using xhci-hcd
[    1.662337] usb-storage 4-1.2:1.0: USB Mass Storage device detected

I can try to see the differences and build another dt on top of the
hamoa one, but that will also be based on trial and error rather than
actual knowledge, I am happy to test patches if you have other
suggestions.

Thanks,
Mostafa

> 
> Konrad

