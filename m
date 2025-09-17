Return-Path: <linux-arm-msm+bounces-73960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E036B8055F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 17:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 177861C814CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DB4330D50;
	Wed, 17 Sep 2025 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="Kr+SmylE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082AA32E756;
	Wed, 17 Sep 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120911; cv=none; b=MY9rUnCZkWHc7K+nPqWJmorNEwh0icOJ0klTETqEmIpccJmWELO07u5cND6VD42SdckNOytD5I2tZBQQ83rZ1smFJbfY4O3xVmYwv1WZLWaCTQElEeKBT96COtyBFEHQ3t/044ujcU+V+K7mfNuybGqcQROesKKXK8IIDLtWse8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120911; c=relaxed/simple;
	bh=nJA8GDTU8VBse67HgpuXXx2PRQZBrnDPF8MjpbI7u/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBXocLnhHSG5ucUTx0fb3Mzi5C4HZaFeUbz6lKeSWxB4LazCLsqsNecg0TX4eTxpnEhJObOzBFVG1GtwFnv4cEMZZQUuQGdXglQzyx/Bg4fOFKkhFb0jpifxV1SZ9L8sgVD4vyxgWk/oLiw4NmhBRjbMfH5ir4YB8t/Le1xvEcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=Kr+SmylE; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lr//MT3EvIZWtAnrp9YlJUSITHvIatxfg7SqJqzZ7kk=; b=Kr+SmylEfF+MJMWOSPBbWNMKYr
	yuRnejpuyr871uTaZv+METHqtUEcbcuqSEt8SHgBDulqYpcCrUkcDLpggI7zl90F3tRG8sxxFURnm
	FKNNlGCuv5646s7BXRtrcNLxq6lGOqC1WF48duEkhJLnS15I7N1ESnSVMhcBF0k/ccCs=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1uytYd-000000000nG-2HQ1;
	Wed, 17 Sep 2025 17:54:55 +0300
Message-ID: <ac2d419d-a1b4-4b3f-a07a-4f5d047901aa@minlexx.ru>
Date: Wed, 17 Sep 2025 17:54:55 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] arm64: dts: qcom: sdm845-lg-judyln: Add fb_panel
 dimensions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Paul Sajna <sajattack@postmarketos.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Amir Dahan <system64fumo@protonmail.com>,
 Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-9-5e16e60263af@postmarketos.org>
 <de1a7ecb-924d-4ed2-8034-721b8dce69d4@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <de1a7ecb-924d-4ed2-8034-721b8dce69d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.09.2025 16:59, Konrad Dybcio wrote:
> On 9/17/25 3:09 AM, Paul Sajna wrote:
>> Add display dimensions for proper scaling
>>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>> index e84b45ed82fd13850ea7ec1f34ddac5b59fc1434..8c1692f86e6ceea7b718361965e78f95d39373bb 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>> @@ -23,6 +23,13 @@ framebuffer@9d400000 {
>>   			format = "a8r8g8b8";
>>   			lab-supply = <&lab>;
>>   			ibb-supply = <&ibb>;
>> +
>> +			panel = <&fb_panel>;
>> +
>> +			fb_panel: fb-panel {
>> +				width-mm = <65>;
>> +				height-mm = <140>;
> 
> It'd be nicer if you moved these properties to the actual panel
> node (the DSI one) and referenced that one instead (I think that
> should work)
> 
> Konrad
> 

Hi!

First of all this code doesn't work well for upstream, because it causes
errors with dtbs checks like:

   framebuffer@9d400000 (simple-framebuffer): 'fb-panel' does not match 
any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'

^^ The subnode is not allowed by bindings.

The whole reasoning for this little hack is that the upstream
recommended approach to solve the "unknown DPI" for framebuffer issue
is to put width-mm, height-mm into real panel node and and reference it
in simple-fb node - sonds very nice in theory, but also doesn't work
well in practice, and explanation why will take a bit longer, please
bear with me for a minute.

If we do as recommended, device tree structure will look like this:

  framebuffer@9d400000 {
      ...
      panel = <&display_panel>;
  };

  soc@0 {
      ....

      mdss {
          ...
          dsi0 {
              ...
              display_panel: panel@0 {
                  reg = <0>;
                  compatible = "lg,sw49410";
                  ...
                  width-mm = <65>;
                  height-mm = <140>;
              };
          ...

Then, to my understanding, due to how fw-devlink works, the panel=<&..>
link from simplefb node to display_panel node creates a probe-time
dependency, so that the whole display stack probes first: MDSS, DSI
controller, maybe even Adreno GPU, *AND* panel all probe first, thus
making the mere existence of simple-framebuffer pointless.

Additionally, simple-framebuffer probes succesfully after that,
creating "second GPU" entry in as /dev/dri/card1 making it look like
system has 2 GPUS, which confuses almost every window manager in
userspace later. Normally, if simplefb probes first, it gets unloaded
and replaced by MDSS and does not cause any chaos. In the end the whole
situation looks even more silly than the fake panel subnode hack.

Therefore for upstream I'd recommend to just drop any fb-panel hacks and
to not use panel=<&...> with reference to real panel either.

It would all be much much easier if we could just specify width-mm/
height-mm directly in simplefb node, but DT maintainers rejected that idea.

---
Regards,
Alexey Minnekhanov

