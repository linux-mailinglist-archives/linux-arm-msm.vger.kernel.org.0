Return-Path: <linux-arm-msm+bounces-108189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAQMAj3/Cmp8/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:59:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA7356C1E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8859F301602F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B452D249B;
	Mon, 18 May 2026 11:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ErLR2sQv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A883313E3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105099; cv=none; b=CtNmheiGxIY01j9Buix9wG+mHxOKuxoRDcaGGgZUk/8EiHUKblL7Wr1fnZEfoGoD2v1NUTPILnF8qPW0OzfDgN6MlMarYo/aCRefnvVw5HMzjL3MSrwewuUownTntd4xQREtmw415+y5Q2Z0sy+IniJo2r/01cb8sNVQp7mDJ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105099; c=relaxed/simple;
	bh=5Z9hPhqS8oaSLq86Bc3gD4M5ws/BmUkz38QLBtVDsSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ilx5LPThTgoHxVIXeAkfqoF00VLRghE3pY+vvOQb97bzpMp+9bzkrwMDRif8X6Gfiyxmf8Zo8S9dBUWpxM1Tult/tW3rv5wZ6rnka6ySHymeRGJj+kuDDZpZibSTmCrh2oNLMaKErKjUnT0SyqPtDX6NqfL0ZiJFB8U57Q2NEkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ErLR2sQv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so2835e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779105097; x=1779709897; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tqNcSw5901z0ZWyLeYPwIMccpM8CGNBD8cgagm4vKA=;
        b=ErLR2sQvRD2NAz/YAzulim9c+ASR9AgNK2vh1u/IvqSQ6WgS+qPAU1airk0xybcGLX
         VX6Wc3kFl2C7L+HMULZ+KLr8h9NWAlbCyw2B1lWehuFsIYjHNQDUyQx9IZE/Wt9i3bvK
         sXcZhRkviz20F39odlDSgwliVQClZ9ArOIJnmynIgoJPCY3IrsxuesZYXxH49Yl83GHI
         oP5tesLZxVuMFr9hIYfnDEDhGbVlWS7wiRsFnO6kSbgs9n+/wPo/pXCxPa076C4i0ix4
         e96XG4S+1ael2JnkxV2Ltfp0JZToU/WnYPAtmrCP5/+Iwwg12U8JaFL9JMmSbdTajj4P
         DWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779105097; x=1779709897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tqNcSw5901z0ZWyLeYPwIMccpM8CGNBD8cgagm4vKA=;
        b=k5wAauUAHla6dglYcJTLnWR6Gr10Nkxt6ZLaCgLPiwZdAUS9lTxIVw3A23PlvR/Urc
         IanWErrC74zRbaeXMUrKQFH5TBJ0aCwonCkDsvkQF9dzpIQoUoYOKXAMtiQ0yQDHrI9N
         RpaxSlSAos6yP8j2z8lMQspX0s9pg5m+gxOeIGv88iyw+lrl5hc1kG0JdtGPrdUkG4z4
         4SB8Ill9MKs73aEzQm2Asf8w8IbbMmrl06C+rcXgysG//KkPDD90dDEPxv+8Jqpjckpw
         lj5uUwuuUqYWHFt4SxXNeZiPf3RYx1SwwVgFj+b490lvdzw5chrRrIh2/PsE1qbK4Hnk
         WAhg==
X-Forwarded-Encrypted: i=1; AFNElJ+Ob3YKOTtzhn6pvp/4WdiDsYuceDaFoE6IZxdNOzp+QWuNV6vToR9Kod+1Wmi5zPvM9D3buvhY2EpuNfiK@vger.kernel.org
X-Gm-Message-State: AOJu0YxPaDG9u6vHZKcXf45kkcx+iWJ4fzOprvNrzD9+cOQdsxoBoh0j
	/RZXyrcqpS4BFerCGjTSbU3J0jdFX3b8nJiqhpzWSsvqVT9cvwEJHoX2WVw195E3gg==
X-Gm-Gg: Acq92OHen+9ZzNjBktJFcZvAwx4v3K7CJnbLwdjtTjHjO6LK2SJbdL44mdYprCRg99f
	1OwZNaW9teHZ9w8oJfquInoqOaRgxkYrHLIOfojjOa2KvUHRAt74XMfM3IMqgXaqZaWKDYacB+A
	ZVHa9lezRYTcNOWZcw+jdG8t0gv5eoDYF5mFyAgCpr6plqIzqUi7nTJNaNWea1fMT+z2tTZEQN3
	NOynLVo0cRzrakTgQplejXQe9m+FR4+eM4BlDeF/XvVfeVxEqz8zFRFntgEiGSc+q/jRsMA5joq
	0YdVSzbRAIBRwUQ0wD9fQKfHndjk1cNtoueE91tpJqLyvLyVGle0G4Hk/rxVu+OptHwBAZFG+J9
	+zfVyehVyTh+OUdvoyhYOESkvXcEj/MCe68bBA6JYy5+aQhR3qLlUl7n2gE/nzc35NMlmOQ5DmR
	2kYZuM05VMp05a9Ks2cZfh2vaRZoNhlGKgWy6LCqa1SYg6uG6iPUFunj9w8AcoM/pMqSQ=
X-Received: by 2002:a05:600c:5650:b0:48a:5aa3:ac1e with SMTP id 5b1f17b1804b1-48ffd828c95mr1864315e9.3.1779105096335;
        Mon, 18 May 2026 04:51:36 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ffed68baesm59218185e9.0.2026.05.18.04.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:51:35 -0700 (PDT)
Date: Mon, 18 May 2026 11:51:31 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, maz@kernel.org
Subject: Re: Support for Lenovo IdeaCentre Mini X (Purwa)
Message-ID: <agr9Q-CC8v4G9neP@google.com>
References: <20260429141815.827157-1-smostafa@google.com>
 <5c838838-00e5-45f2-9515-edbdcddf50ec@oss.qualcomm.com>
 <afOP2xXmEpV1eI3Z@google.com>
 <abe8443b-9871-455c-95d9-d16975c0fbdf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abe8443b-9871-455c-95d9-d16975c0fbdf@oss.qualcomm.com>
X-Rspamd-Queue-Id: AFA7356C1E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108189-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smostafa@google.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 01:28:00PM +0200, Konrad Dybcio wrote:
> On 4/30/26 7:22 PM, Mostafa Saleh wrote:
> > Hi Konrad,
> > 
> > On Thu, Apr 30, 2026 at 06:48:33PM +0200, Konrad Dybcio wrote:
> >> On 4/29/26 4:18 PM, Mostafa Saleh wrote:
> >>> Hi,
> >>>
> >>> I see that recently the support for “Lenovo IdeaCentre Mini X” was
> >>> added [1]
> >>> However, unfortunately that doesn’t work for my device, the board
> >>> resets once I try to boot the kernel from UEFI.
> >>>
> >>> I believe that’s because it is another variant, as I have been using
> >>> my device tree for some time[2] which is hacked based on the crd
> >>> device tree with some trial and error. With that I can boot with
> >>> PCI/NVME/Ethernet and USB (there are also some other errors in the
> >>> log related PMIC), this device tree is based on purwa.dtsi unlike
> >>> the upstream one which use hamoa.dtsi.
> >>>
> >>> Are there any plans to support the Purwa based variant? I am happy to
> >>> help with testing, but I can’t confidently send patches as my device
> >>> tree is based on trial and error rather than a data sheet.
> 
> [...]
> 
> > I can try to see the differences and build another dt on top of the
> > hamoa one, but that will also be based on trial and error rather than
> > actual knowledge, I am happy to test patches if you have other
> > suggestions.
> 
> Hm, I ran a quick diff and even though there's a lot of noise (mostly
> due to the same things being named slightly differently), the actual
> meat and potatoes aren't very different at all, e.g. the PHY regulators
> are the same
> 
> Could you post the full dmesg with both DTs?

This is the log with the device tree that boots[1]:
https://gist.github.com/misaleh/b09c04480062c5a3e7bafe3d4176b15d

This is the log with replacing hamoa.dtsi with purwa.dtsi inside
hamoa-lenovo-ideacentre-mini-01q8x10.dtsi which does not boot:
https://gist.github.com/misaleh/aaad5704824edac9a43e2ebe45adbf85

With those modifications, I can boot:

diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
index bfb7cea56df9..00f9a1d5ac95 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
@@ -8,7 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "hamoa.dtsi"
+#include "purwa.dtsi"
 #include "hamoa-pmics.dtsi"
 
 / {
@@ -17,7 +17,7 @@ / {
 	chassis-type = "desktop";
 
 	aliases {
-		serial0 = &uart14;
+		serial0 = &uart21;
 	};
 
 	wcd938x: audio-codec {
@@ -185,6 +185,7 @@ vreg_nvme2_3p3: regulator-nvme2-3p3 {
 		pinctrl-names = "default";
 
 		regulator-boot-on;
+		status = "disabled";
 	};
 
 	vreg_v0p9: regulator-v0p9 {
@@ -714,19 +715,20 @@ &pcie3 {
 
 	vddpe-3v3-supply = <&vreg_nvme2_3p3>;
 
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie3_phy {
 	vdda-phy-supply = <&vreg_l3c>;
 	vdda-pll-supply = <&vreg_l3e>;
 
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie3_port0 {
 	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+	status = "disabled";
 };
 
 &pcie4 {
@@ -1064,21 +1066,9 @@ wcn_sw_en: wcn-sw-en-state {
 	};
 };
 
-&uart14 {
+&uart21 {
+	compatible = "qcom,geni-debug-uart";
 	status = "okay";
-
-	bluetooth {
-		compatible = "qcom,wcn7850-bt";
-		max-speed = <3200000>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-	};
 };
 
 &usb_1_ss0 {

The issues were:
- pcie6a and pcie3 conflict in regulator pins
- Different UART

However, there are quite verbose errors from MDSS clocks, and spmi
failures. Here are the booting logs with the above change (at
loglevel=5)

https://gist.github.com/misaleh/3b1d67ac51a8960b811cc20075ab7630

I get cleaner boot logs with MDSS and pmc8380_6 disabled.


[1] https://github.com/misaleh/linux/blob/lenovo/arch/arm64/boot/dts/qcom/x1p42100-lenovo-ideacentre-x-gen10.dts

Thanks,
Mostafa
> 
> Konrad

