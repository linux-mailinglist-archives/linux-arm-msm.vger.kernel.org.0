Return-Path: <linux-arm-msm+bounces-65089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0BB066DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 21:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85CBA1AA846A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 19:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818FF2BF01E;
	Tue, 15 Jul 2025 19:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="WupBvgpC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9E2BF002;
	Tue, 15 Jul 2025 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752607799; cv=none; b=ZO9/83RvDlDXiKnmqtVturPLfn7S68AIHZUixiZf19IvH1jtcyQ5zmJMbfzeqkoHsl8zh01PkalThGIjH7LZOvIA9INHcGQiHxgGS90WivMlO+eOZS+nLIZvNJwL85E12it24MPGBJTzHy5xBq8IG0YpYnn1HJ6wLGFjkoC6JU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752607799; c=relaxed/simple;
	bh=1Pf1DfyZ6KKW5sKyBrJVdn7T7n9cJrgUCJWGc1dyuqQ=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=bDdwB/TtSZURUjMf3zhFhPU8OJt+vTIlvJ/Q3KahhZ0oTS9l6Vv5XOGzrEGW2FYsqQ9gQooLWRmXM6rAZ6yjipW7BXhOURxyWaPPX4A6WNrfaDxQ+K57toSX6vF1LI2an/Z/xrxQMLK9vUGBC/u/VnDk9auYFEMMHOQTXIbzXkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=WupBvgpC; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <3cc15a65-abb8-453a-8798-fb21225dc18a@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1752607784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nE8SfMFM7tsrQQDvgEdFB+ubz1FUL9eku1xoBzp2Jw4=;
	b=WupBvgpCLWgEm+oQSxQY5PQE7lge3oQlms6wTqhfrkcgbaREmAikKcc6y2FZPHSpCWx1BI
	SoCv565imSwIOikFT98W4iMv+IEVWuo4PIIs2jmVFc/bLoEFGL0t2sYCC1VfQoy2U9bNdH
	/ajleNQm1Ck/YYUdBX7+zf17pdDLBaRD9BlDWMaYLprUFqStjiET2c+BydLL/4V/CfBPRP
	rQsqNlQdGX2U11OASbOAEnKQIR7G9GIlCpMm7HEqdxw7QB7gagL148aeTiGWHC9WJS14S1
	4ohtxim21MOvSTaTWDVTM5goapmCpsM67HmgH5USisO41OdWQVtHT+d+WLJtZw==
Date: Tue, 15 Jul 2025 16:29:36 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: val@packett.cool
To: Val Packett <val@packett.cool>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add support for Dell Inspiron
 7441 / Latitude 7455
References: <20250706205723.9790-2-val@packett.cool>
 <20250706205723.9790-5-val@packett.cool>
 <301542db-2e0d-48ff-94d0-09acaa603ace@oss.qualcomm.com>
 <24b87877-8132-4cab-a0d7-f139bdc34d92@packett.cool>
In-Reply-To: <24b87877-8132-4cab-a0d7-f139bdc34d92@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 7/15/25 3:00 PM, Val Packett <val@packett.cool> wrote:
> 
> On 7/14/25 10:35 AM, Konrad Dybcio wrote:
> > On 7/6/25 10:50 PM, Val Packett wrote:
> >> +&usb_mp_dwc3 {
> >> +    phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
> >> +    phy-names = "usb2-0", "usb3-0";
> >> +};
> > Let's not override this, so that the driver can still put the
> > remaining ones to sleep cleanly

[..]

> So it seems like the other ones "don't exist" / have been shut down 
> completely by boot firmware(?)

Oh, oops - that actually happens because the PHYs are disabled in the DT.

Looking at other laptops, x1e80100-hp-omnibook-x14.dts has the same chunk
that changes usb_mp_dwc3 to only have two PHYs, while x1e80100-dell-xps13-9345.dts
lists both PHYs, but only one of them has a repeater attached, while the other
one is empty.

I'll do the XPS thing, sure.

