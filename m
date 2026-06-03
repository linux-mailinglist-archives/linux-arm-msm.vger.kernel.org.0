Return-Path: <linux-arm-msm+bounces-111036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yeZmE6BTIGqN1AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:17:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8276399FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:17:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=lBcog0a3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111036-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111036-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB578305B996
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 16:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53A53E1695;
	Wed,  3 Jun 2026 16:09:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound1.mail.transip.nl (outbound1.mail.transip.nl [149.210.149.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB7438D40E;
	Wed,  3 Jun 2026 16:09:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502967; cv=none; b=brOxBiPeI303LwIP2qCgjiXYI6MOEiXIfNnZuhoPndZotSkgMZC+fdkINL8nNcJF+MYD6+MLHDcRnZzzEce2jk7tukw79V+Fq9TICJqY5fsUym9T7AT8Z9okQABzQUfSQc+qn1jg4NDqyEpw73fqe2xWgTJUv38V3q8JZfvWg6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502967; c=relaxed/simple;
	bh=6iSSDJrd1g/5ccSaf2LhHGlopQA5o76L1WcoFbkvatk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=DLYzvM1DsGtxwqhXq+Udef9l7mn2dZKYPJkTCza23IelRijMeXNeno4q4Kd2TL33NbK13qbSmdXlSdqjytbJC3x23NJIX4FzjFr+XR+LIl87BPHrczYKiRxdyQVbPIEyzvbZOtnoQiCWnRjH9zlItP+KUgBuCb95Of/D5ZdX0Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=lBcog0a3; arc=none smtp.client-ip=149.210.149.72
Received: from submission12.mail.transip.nl (unknown [10.103.8.163])
	by outbound1.mail.transip.nl (Postfix) with ESMTP id 4gVt1V5zL9zRj44;
	Wed,  3 Jun 2026 18:09:18 +0200 (CEST)
Received: from transip.email (unknown [10.103.8.120])
	by submission12.mail.transip.nl (Postfix) with ESMTPA id 4gVt1V2Fs4z3SJ37R;
	Wed,  3 Jun 2026 18:09:18 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 18:09:18 +0200
From: me@herrie.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Herman van Hazendonk <github.com@herrie.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
Reply-To: github.com@herrie.org, me@herrie.org
Mail-Reply-To: github.com@herrie.org, me@herrie.org
In-Reply-To: <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
 <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
User-Agent: Webmail
Message-ID: <66905f4914dc022629158ac02df1c7df@herrie.org>
X-Sender: me@herrie.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission12.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780502958; h=from:reply-to:subject:to:
 cc:references:in-reply-to:date:mime-version:content-type;
 bh=kTA/m61jv540sGh4xUbqI8X96qKnrTavHeGABcK34xw=;
 b=lBcog0a3vWRJhh5Ky6Y9a4K8n6uHWEOvdCEfoobPhYWIdclMzODAJG95ViJwVs+pvfW+hx
 j6Ju/8EU2kjdaeF5kFQzsBDvYCf9qWAlPGGdoCy58HzC+dePji8pWoxKSKYkeDi6nFBGSo
 eAr97llmtKoUrfnkvTnlip7wE93ssiw8yVdgTGajFG9Kc+XriWd6I2FKohIb/Kv4fBGAGL
 svWzxcESHL2k86gSNnpZoaJBFSexeUi0uf/TuMkQ1CX/t43ptKJzXJq6EXTT6Gv+gwQH41
 WSP33Be/mXkW761Tc85FHqCZ6XhpAcmixSSgUGg8XKHly3abBeZ/zpMl69JHoQ==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-111036-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@herrie.org,linux-arm-msm@vger.kernel.org];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER(0.00)[me@herrie.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:github.com@herrie.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[github.com@herrie.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF8276399FA

On 2026-06-03 15:57, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
>> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
>> (address, value) pairs that are written after PHY reset.
>> 
>> Unlike the existing "qcom,init-seq" property, the address field is
>> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
>> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
>> class hardware needs this range to programme pre-emphasis, HS driver
>> slope and CDR auto-reset bits the legacy msm_otg driver used to set
>> via platform data.
> 
> Are those register writes specific to the device or to the whole
> platform? In the latter case please extend the driver to write them.

Looking at every MSM8x60 reference kernel I could find (Qualcomm's own
msm8x60 board, HP TouchPad / APQ8060, and some HTC/Saumsung MSM8660
devices), the writes split into two groups:

Platform-level (same across all MSM8x60 hardware):
  - reg 0x36 bits 1+2: CDR auto-reset disabled, SE1 gating disabled
  - reg 0x32 bits [5:4]: pre-emphasis at 20%

Board-specific:
  - reg 0x32 bits [3:0]: HS driver slope — HP TouchPad uses 5, HTC
    devices use 1. This clearly depends on board layout (trace length,
    connector loading, etc.).

So the platform-level writes should move unconditionally into the driver
behind a match-data flag for the MSM8x60-class compatible, and only the
HS driver slope value belongs in DT.

> Also please note that writing raw register values is generally frowned
> upon in the upstream. It's not easy to follow those and not nice to
> modify. Instead, if some the values are required for the particular
> device, please add corresponding values to the DT using the
> human-oriented values rather than the register values.

Agreed. The old platform-data msm_otg driver already did exactly this
with named fields (hsdrvslope, pemp_level, cdr_autoreset, se1_gating).

I can drop qcom,vendor-init-seq entirely and replace it with a named
property — something like qcom,hs-driver-slope — for the one value that
genuinely varies per board.

> If you have questions regarding any of the bitfields, please ask here,
> we can try finding the data for those.

One thing I haven't been able to nail down: every HTC MSM8660 board also
writes 0x0C (bits 2 and 3) to ULPI register 0x31 via phy_init_seq, but
the HP TouchPad webOS kernel never sets that register through its named
platform fields — and USB works fine on the TouchPad without it. Do you
know what those two bits in 0x31 control? If they are needed on CI 45nm
PHY silicon but not on the APQ8060 PHY variant, I should probably leave
them out of the driver and note why.

I don't have any technical documentation for the S3 SoC family, except 
for the legacy kernels (HP, Samsung, HTC) and a bunch of various HP 
TouchPad variants.

Let me know what you expect and I'll write up a v2.

Thanks,
Herman


