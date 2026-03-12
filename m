Return-Path: <linux-arm-msm+bounces-97272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCggJxzpsmljQwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 17:26:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0357A2758F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 17:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 185A4312CC2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631933EDAC0;
	Thu, 12 Mar 2026 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEOXKyyY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA5B377016;
	Thu, 12 Mar 2026 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332481; cv=none; b=MJ6CFT8zsaV+qdhPhCaZTF/lhw+OOOyMzd1G6mPx4XcDvi3dHeS+shnKwrYRyNvl58r2uq9rtFbGVzA5BT88QAg+HLWwBDdnmeuTo4rgpAO4TwGfGui45F9Jy19jIX+c/HXYBzUmfSKtPTXtgANtenTH6AQnbgZmRNC+B8jLvkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332481; c=relaxed/simple;
	bh=E0tzcZpn2M5zDMTbuEGhMbwdcnWTA9+Yo32dgdGl5hE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oi+rPezFHiHWO6ZuN7RNiOTLJ6imAXO+EC91lUoyntaWIm1KEretNjgl88WvDDkZf3+U1GlscTb1LTyUtv/LEsv6WGvORIof83GhnOkvaYUKVfEnEkc4QuL7pdfT33FAxUT13C95U4FwzRRL8Vj3oNmC5GAexsrfKXc9VI9Nihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEOXKyyY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B51DC4CEF7;
	Thu, 12 Mar 2026 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773332481;
	bh=E0tzcZpn2M5zDMTbuEGhMbwdcnWTA9+Yo32dgdGl5hE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dEOXKyyYqmInnVErJ/xccwlmYQjLB4P6TpcaYbZS1/+qgLk95IbuzxQbZ2muAoDCV
	 Iv/L/JpyOHSFvq0ctI08ZfesgPDRXUx/iw1XIM6enA1H5ftT/sYaTEsBs/viIH+YOG
	 8PWvOue01HC8vFL1Y5JWtX+76qCTVSj75IwkZHFLunsGuJwNa7SCC2SdNVJ8ImTi15
	 hxLNWaNn2nNfnh5HF63s5Pxmvcf9JJDeXi1qZw3X6d3KiaA9Se00Ow5iQC1q6xp+iq
	 07ev+o7HGmCcFmU4CcT2U4j1uP38ETAuLvwAYmJHc2yhPDYLuL0uGa2C1SfpUtWRkh
	 /kFvXOXjEZjcA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Mukesh
 Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya
 <viken.dadhaniya@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Praveen
 Talari <praveen.talari@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
 chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
 chiluka.harish@oss.qualcomm.com
Subject: Re: [PATCH v6 00/13] Enable I2C on SA8255p Qualcomm platforms
In-Reply-To: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:21:18 +0100
Message-ID: <873425m329.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97272-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkorpershoek@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0357A2758F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Praveen,

Thank you for the series.

On Fri, Feb 27, 2026 at 11:45, Praveen Talari <praveen.talari@oss.qualcomm.com> wrote:

> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
>
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
>
> The SCMI performance protocol manages I2C frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate..
>
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
>
> Praveen Talari (13):
>   soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC
>     path optional
>   soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
>   soc: qcom: geni-se: Introduce helper API for resource initialization
>   soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and
>     geni_se_clks_on()
>   soc: qcom: geni-se: Add resources activation/deactivation helpers
>   soc: qcom: geni-se: Introduce helper API for attaching power domains
>   soc: qcom: geni-se: Introduce helper APIs for performance control
>   dt-bindings: i2c: Describe SA8255p
>   i2c: qcom-geni: Isolate serial engine setup
>   i2c: qcom-geni: Move resource initialization to separate function
>   i2c: qcom-geni: Use resources helper APIs in runtime PM functions
>   i2c: qcom-geni: Store of_device_id data in driver private struct
>   i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms

I did some basic testing on the Ride SX (SA8775P) board with this
series using base:
commit 80234b5ab240 ("Merge tag 'rproc-v7.0-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux")

/ # i2cdetect -l
i2c-11  i2c             Geni-I2C                                I2C adapter
i2c-18  i2c             Geni-I2C                                I2C adapter
/ # i2cdetect -F 11
Functionalities implemented by bus #11
I2C                              yes
SMBus quick command              no
SMBus send byte                  yes
SMBus receive byte               yes
SMBus write byte                 yes
SMBus read byte                  yes
SMBus write word                 yes
SMBus read word                  yes
SMBus process call               yes
SMBus block write                yes
SMBus block read                 no
SMBus block process call         no
SMBus PEC                        yes
I2C block write                  yes
I2C block read                   yes
/ # i2cdetect -F 18
Functionalities implemented by bus #18
I2C                              yes
SMBus quick command              no
SMBus send byte                  yes
SMBus receive byte               yes
SMBus write byte                 yes
SMBus read byte                  yes
SMBus write word                 yes
SMBus read word                  yes
SMBus process call               yes
SMBus block write                yes
SMBus block read                 no
SMBus block process call         no
SMBus PEC                        yes
I2C block write                  yes
I2C block read                   yes

Note that I used a downstream device tree which has both
i2c11 (i2c@a90000) and i2c18(i2c@890000) enabled.

The sources for that dts can be found here:
https://gitlab.com/mkorpershoek-rh/downstream-dtbs/-/tree/8775-upstream-i2c/qcom?ref_type=heads

If this is considered useful testing, feel free to add:

Tested-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

> ---
> v3->v4
> - Added a new patch(4/13) to handle core clk as part of
>   geni_se_clks_off/on().
>
>  .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   |  64 ++++
>  drivers/i2c/busses/i2c-qcom-geni.c            | 324 +++++++++---------
>  drivers/soc/qcom/qcom-geni-se.c               | 270 ++++++++++++++-
>  include/linux/soc/qcom/geni-se.h              |  19 +
>  4 files changed, 491 insertions(+), 186 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
>
>
> base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
> -- 
> 2.34.1

