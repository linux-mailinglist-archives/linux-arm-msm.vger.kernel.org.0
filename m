Return-Path: <linux-arm-msm+bounces-88420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB0D102E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 01:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCA6C301E17F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 00:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB74156F45;
	Mon, 12 Jan 2026 00:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="dDn0ikv6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E09946C
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768177928; cv=none; b=VZuJKoaxRcKb97fqlEEJ9s5KytcWUjxpTYjnUye0wxvZNyvcgp+XVYHQ0AYezCpVbdwqFXacWzIrYtmt87ytg0q4Awh3c3DemqdDIWD1v9iH8kIsvHZ13hUkIuOgiHLqni4nCWgdmYTLuqiQyfIoMiNzlCo17V1VDyrbVMTOsYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768177928; c=relaxed/simple;
	bh=8gzBJppooeQtU+g5xNbrieOIvpiDVAC71d6bX/lP7EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6MlGTl7N9lQd9E3sBuc8FQQCuMz2sxxqP4syOi+mBKstSVfvM3KXk1dx6PC5Y1qVhf9WW85eKho/v2b3qQT2A315F4AoNGZb7fUpHFVtBEvuGCEdN8mpoPZ7/UAAOjF11jv4lyJLksZzYuTdhIo8fsUtCtokppq/BwbagrVHqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=dDn0ikv6; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <3dd54179-7a22-4596-a6ef-224530c4b2c6@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768177913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vavfNf4OtTyRqaocrBbCwcSk8G5Fokz4KSWP2S5bflc=;
	b=dDn0ikv6ex4iWbHXHQ8cy4lYD2lqqkfpgzCSZtHIAdbK9ttkumJ2ErjZVi5xo5AbL4SyO8
	8zUdkTbBmxQysSA6Yh7hBG45S9yWJ8BcTE+HRSowZ3H7xtEMzp6LgGnH9N1Eta/Ys49lUe
	OLXVRMC+yg+uCo8/V4ZEQqSNPuYlXojzDTZqfTfpOzqf8MLYZWCgQ0gO5hpdziNRGVtHe1
	lnYOXfJaYGm2qQ8CXR7x0c7FdtodKNtq1KDbtAWSNbjTgdX4N5SLgGAOABlTgUnp6C6Bkq
	C1A9eHC/oabP8HJCgfRhqn/Qq4UjEY8RGh+5n495puwrgHKen1lySiexhkx1jw==
Date: Sun, 11 Jan 2026 21:31:40 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for ECS LIVA QC710
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-6-val@packett.cool>
 <wyqml5ywfzwh3uulp4gzlfzx24kb2545w36pkpnz5g27xtnqoi@yywysi37tdor>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <wyqml5ywfzwh3uulp4gzlfzx24kb2545w36pkpnz5g27xtnqoi@yywysi37tdor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

[resent for the lists as plaintext, oops]

On 1/11/26 1:50 PM, Dmitry Baryshkov wrote:

> On Sun, Jan 11, 2026 at 05:35:12AM -0300, Val Packett wrote:
>> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.
>> [..]
>> +&dpu_intf1_out {
>> +	/delete-property/ remote-endpoint;
> Why? It should not be necessary.

It seemed to be implicated in annoying EPROBE_DEFER issues.. But you're 
right, it wasn't this after all.

>> +
>> +&pm6150_pon {
>> +	status = "disabled";
> Do you know, how is Power-On routed?
I think it's handled by the EC. Keeping this enabled doesn't make 
power-off work, and doesn't make the power button deliver events either.
>> +};
>> +
>> +&pm6150_rtc {
>> +	status = "okay";
> No need for qcom,uefi-rtc-info ?

Ack, will add it, the efivar is present of course.

Will send it for Aspire1 too..

>> [..]
>> +&usb_1_dwc3 {
>> +	dr_mode = "host";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	hub@1 {
>> +		compatible = "usb5e3,608";
>> +		reg = <1>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
> Are other ports routed somehow?

Port 001 is routed to the 3.0 Type-A port on the back, Port 002 to the 
2.0 Type-A on the side. Should all of that be modeled?


// re: Wi-Fi calibration, submitting that to ath10k now too (though the 
default one worked perfectly fine)

Thanks,
~val


