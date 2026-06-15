Return-Path: <linux-arm-msm+bounces-113175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MGodLFfvL2pCJQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:25:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6506862E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:25:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=lGCcWzdo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113175-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113175-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CD5D3002539
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6F13E8325;
	Mon, 15 Jun 2026 12:25:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C0E30CD95;
	Mon, 15 Jun 2026 12:25:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526319; cv=none; b=DRqd6oaTi49zewsHtp8AfIP1xjjGYXZUTBbXUyeA5NbTssgHgR//U8LWR/rQogLz51pdJL/6IdL/faD5COib3Kvb3NfnGA2mRD9n216iAFYE4gcsWKfjft3l2w3a/ZS3quSXoCsV2DeCNAPMeNWcVkxZsuNCTQw7ZU41sj3htK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526319; c=relaxed/simple;
	bh=Mem8gciQqp2vKKNfnFJOAeuHwmEWlsNPhLMKDD+Oq/c=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=G8wN7U3/7ur0iHHM91Wxm2xVOr2nlXCRrH0piEKKzc3e9baa31lWeyUt1CBsYhvFtubcKkTuQfWs/wTe1wSBBV5surqdCxbEZXXUcD3RWYsrw3si7WMwJqxMdFNJThYR9qWUyLaBnBr6rDg5dvKimrCUrV5YXVWIIChv5LN/G7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=lGCcWzdo; arc=none smtp.client-ip=136.144.136.11
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4gf8J52TsyzTPQNt;
	Mon, 15 Jun 2026 14:17:09 +0200 (CEST)
Received: from transip.email (unknown [10.100.4.34])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gf8J45hnPzJjhY9;
	Mon, 15 Jun 2026 14:17:08 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 14:17:08 +0200
From: me@herrie.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, github.com@herrie.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
Reply-To: github.com@herrie.org
Mail-Reply-To: github.com@herrie.org
In-Reply-To: <tknuizddyhfcyywmm36v4ok6idgpxridgur5qbowvmwhcbve5o@bp3z46gsfvlk>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
 <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
 <66905f4914dc022629158ac02df1c7df@herrie.org>
 <46lrfwoahgzoudq3afnhv4kxqs4fwj3w7u2dnx6ns6soo6pxt2@qkqbelan2iwq>
 <0f6ea4d2-3865-492e-ac6b-b008843f8d56@oss.qualcomm.com>
 <tknuizddyhfcyywmm36v4ok6idgpxridgur5qbowvmwhcbve5o@bp3z46gsfvlk>
User-Agent: Webmail
Message-ID: <0298e09a5b4497910c226269daa2586b@herrie.org>
X-Sender: me@herrie.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1781525828; h=from:reply-to:subject:to:
 cc:references:in-reply-to:date:mime-version:content-type;
 bh=DQVCzEe3UhTF/pWXL5NKxgWSmFLvB6o9KrEsG3fLoT4=;
 b=lGCcWzdoWVr/D282K6vNvjuJ30hk0kakZX+ZRnJ4yXxI5Lb3IIrS5AAjPqzvM/HxhyIrYI
 lA9VAlArFIlfgqUP1/Fmewd+5C2TNtzSlCgsKRnFbmgfiYXkv/0K2GBX03RBS4a4pxMzDG
 HlNIGj7aq4N8b9wxaYrWMfXmQByDfMjve3Y+KLxjUK+be9JpWGCTfBl/+VqTeOD6Dz6aWe
 KrSXgO+1oEonGb6OGGtRfpzCjiVAEGej7o9HY5ww7NklTxNgE2ZNZY/4raGpkP7wXtpRnI
 RNfm3ps1UvEOyssTFzqB55rZWHyeed0cRocgb37Njoc3/G2mv4egb9QhTwaf5g==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113175-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:github.com@herrie.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[me@herrie.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[me@herrie.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[github.com@herrie.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:from_mime,herrie.org:dkim,herrie.org:email,herrie.org:mid,herrie.org:replyto,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD6506862E2

On 2026-06-12 02:25, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 12:39:45PM +0200, Konrad Dybcio wrote:
>> On 6/4/26 1:02 AM, Dmitry Baryshkov wrote:
>> > On Wed, Jun 03, 2026 at 06:09:18PM +0200, me@herrie.org wrote:
>> >> On 2026-06-03 15:57, Dmitry Baryshkov wrote:
>> >>> On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
>> >>>> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
>> >>>> (address, value) pairs that are written after PHY reset.
>> >>>>
>> >>>> Unlike the existing "qcom,init-seq" property, the address field is
>> >>>> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
>> >>>> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
>> >>>> class hardware needs this range to programme pre-emphasis, HS driver
>> >>>> slope and CDR auto-reset bits the legacy msm_otg driver used to set
>> >>>> via platform data.
>> >>>
>> >>> Are those register writes specific to the device or to the whole
>> >>> platform? In the latter case please extend the driver to write them.
>> >>
>> >> Looking at every MSM8x60 reference kernel I could find (Qualcomm's own
>> >> msm8x60 board, HP TouchPad / APQ8060, and some HTC/Saumsung MSM8660
>> >> devices), the writes split into two groups:
>> >>
>> >> Platform-level (same across all MSM8x60 hardware):
>> >>  - reg 0x36 bits 1+2: CDR auto-reset disabled, SE1 gating disabled
>> >>  - reg 0x32 bits [5:4]: pre-emphasis at 20%
>> >>
>> >> Board-specific:
>> >>  - reg 0x32 bits [3:0]: HS driver slope — HP TouchPad uses 5, HTC
>> >>    devices use 1. This clearly depends on board layout (trace length,
>> >>    connector loading, etc.).
>> >>
>> >> So the platform-level writes should move unconditionally into the driver
>> >> behind a match-data flag for the MSM8x60-class compatible, and only the
>> >> HS driver slope value belongs in DT.
>> >
>> > Looks like it. Please hardcode the value for your platform in the driver
>> > (with the comment), meanwhile we can try looking up the actual values.
>> 
>> Do we have the values for a MTP/QRD (or whatever they used to be 
>> called
>> back then..), like we would usually put in there?
> 
> As far as I can understand msm-3.0 and msm-3.4 most of the boards were
> writing 0 here (although it might have been unexpected). None of the
> board files set the hsdrvslope value (which means 0).
> 
> Please correct me if I'm wrong. I see that for tenderloin kernels 
> change
> that to 0x5, but I can't find a sensible commit message.
> 
> I could not find the documentation for vendor ULPI registers for those
> chips, so I don't think we can identify, how to make sense of those
> values. In such a case and having different board-specific values, we
> don't have a better option than having a qcom,hsdrvslope (or similarly
> named) property in DT.
Dmitry/Konrad,

The bit-level meaning *is* documented byte-for-byte across
every MSM8x60 downstream tree I could find: Code Aurora is the
canonical source:

     arch/arm/mach-msm/include/mach/msm_hsusb_hw.h

     #define ULPI_CONFIG_REG3        0x32
     #define ULPI_DIGOUT_CTRL        0x36          /* on MSM7x30 / 
MSM8x60 */
     #define ULPI_CDR_AUTORESET      (1 << 1)
     #define ULPI_SE1_GATE           (1 << 2)
     #define ULPI_PRE_EMPHASIS_MASK  (3 << 4)
     #define ULPI_HSDRVSLOPE_MASK    (0x0F)

   reg 0x32 [5:4]: pre-emphasis level (00 disabled, 11 = 20%, 10 = 10%)
   reg 0x32 [3:0]: HS driver slope
   reg 0x36 bit 1: CDR auto-reset enable
   reg 0x36 bit 2: SE1 gating enable

The legacy `msm72k_otg.c` semantics for the 0x36 bits are inverted:
setting the bit disables the function (see set_cdr_auto_reset() and
set_se1_gating()).  Every MSM8x60 reference board sets both bits,
i.e. CDR auto-reset disabled + SE1 gating disabled.

Surveying every MSM8x60-class board file I can reach: Qualcomm's own
reference, Samsung, Sony, HTC, and HP: the platform-level values
are unanimous:

   pre-emphasis     = 20%
   CDR auto-reset   = disabled
   SE1 gating       = disabled

|  Vendor / board                                 | hsdrvslope |
|  -----------------------------------------------|------------|
|  Qualcomm reference (SURF / FFA / Fluid /       |            |
|    Dragon / Fusion -- board-msm8x60.c)          | unset (0)  |
|  Samsung Galaxy S2 family (Q1 / Celox / Dali /  |            |
|    generic 8x60 MTP)                            | unset (0)  |
|  Sony MSM8660 (sony-kernel-msm8660)             | unset (0)  |
|  HTC MSM8660 (shooter / holiday / pyramid /     |            |
|    doubleshot / shooter_u / ruby)               | 1          |
|  HP TouchPad (board-tenderloin.c)               | 5          |

So Qualcomm's own MTP, the closest thing to a reference platform we
have, leaves hsdrvslope at the silicon default (0).  Two OEMs (HTC,
HP) override it to non-zero values that match their board layout.
Neither override has a commit message. HTC's value is buried in an
init_seq array, HP's appears as `.hsdrvslope = 0x05` in
board-tenderloin.c with no comment.  I've kept TouchPad's 5 because
that's the value the device shipped with and our HS link is happy
with it; changing it risks regressing eye margin on the silicon we
still have to test against.

So the plan is exactly what you both already converged on:

   1. Drop qcom,vendor-init-seq from the binding (this patch goes away
      entirely).
   2. In the driver, hardcode the three platform-level writes behind
      the qcom,usb-hs-phy-msm8660 compatible match-data, with a
      comment citing msm_hsusb_hw.h as the source for the bit names.
   3. Add a single qcom,hs-drv-slope property (u8, 0..15) for the
      board-varying value.  TouchPad DT sets 5.  Absent â‡’ leave silicon
      default in place, matching Qualcomm/Samsung/Sony reference
      behaviour.

I'll send the new v in that shape: single dt-bindings patch
(qcom,hs-drv-slope) plus the driver patch that hardcodes the platform
writes and consumes the new property.

Unless you have other suggestions?

Thanks,
Herman

