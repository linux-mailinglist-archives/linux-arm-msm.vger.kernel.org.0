Return-Path: <linux-arm-msm+bounces-108080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEaSNgoyCmpvxgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 23:24:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B6563FCE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 23:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41DAA3019F1F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 21:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9372EC0B0;
	Sun, 17 May 2026 21:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="EVV/mulT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531ED2EC0A6
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779053063; cv=none; b=h2t1Egt2fTCCzKCkCYhFbCsPlbpKNhCmALrVKw2dT0DvN1uDQST7gPAebJo+QDnAKRGXR9wm90hBKusvag/YdQ0n7AYgxn5UWH63vOd7eoXOAfNYSAlFq80vreRXSW7VKgqn+xoiWOcOC0MiM0OAOgVftVC2pEf/ASqJ57nazT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779053063; c=relaxed/simple;
	bh=B7jPCLJ/AY3VdwjS9DGLe3moJCZhMvixpnCqSqOJ+CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbXrDxcD4XMvqEf71fwP9gctAi6iDBQSP5fWSld6JkDtRkuVq7nN0H31gsGrRtXgWJzHxHrm0DcsHyQHLZc48PE3x1VdDkAuo+d8CdN7Qj+l0r5S/Ma/XeHWnVeO2JbGdvvWrMwHUoNdsuMLh3PBbMz3hD2b0B4Vi9qAd+CWCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=EVV/mulT; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5102582e237so18060001cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779053059; x=1779657859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fhKtdJnZR9ambe1a43m0SWf2eTjnb6OKaQaqgQaWMmI=;
        b=EVV/mulTcFBvrxcQvBexA0JxmfKuv+4hp+wg6A+cBU2CRWP0SEBn572wCn/AXsMyMR
         jE4eEtzYGzNO8yca15TDn/+5MZa2mjR2wg1tK96V3mQG4oTfXGSar/8JEBu+twXo2Oxz
         I8V5KVhpC36n/+1VNu1ZI6JJiHJr4fMpKNDvw+AFk3IUuNcRdrf/vhs+J/3acwkwJAAT
         NMZ9bURAltQNRb8LtNIC6bs91BQCqsOBujeIwaQCPy5Iak2l1ZnoyjDKdXtgAOe6EWS7
         qp8K8xPwbszYVG/rSNFsIUk4uZpxc2svPkp4XNduQClWHyUEoVWT4ihkTYwsUJ/kbGok
         /TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779053059; x=1779657859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhKtdJnZR9ambe1a43m0SWf2eTjnb6OKaQaqgQaWMmI=;
        b=jfdyrd58+SFrTfEQhZK5/l6qo0ISWzS9Tm2VZ1uWdAKqLTNkg0Ve1IykdZoOAlPBJg
         U2KcmPAWv5Ja2RJYAZpIdg8EZitI3qb7ZvG/GRTwQv3rAQH1CaOIdz66vPLIOP6jK0kf
         L3sO4crejWfKqojD48pbznil1aONfUexYLIXjRKW5XmaL0Zq2gH8Vj5bStAAx71IE+L3
         sAe+Addv0Vt17Z1aLiHf+boNRHRRdjGYK63FXh3Ey8BjHr2MY96ZtRxjJO5p2s7+izs2
         KaU6ksUTi2/0yPeiGzOMwyzE0ISfg4FjuYq4x8aysrkkZBUpDKvUly2bL0arvhrZxa+e
         Cl3A==
X-Gm-Message-State: AOJu0YzYZHxaNmax0M7dsYTue108M4j7X8g9Mc0jNNbStFLP3WszlEkt
	xBKiL3/cmu5mzStCzc6PXRSDOOWmQ2XA/TFQYJrcpBhgPO1Tdw5G04+Y2GLi3NFR7VM=
X-Gm-Gg: Acq92OGeBemZqrcEnBbXsPBT9T0KAuMqOKI1rUB+nCThuHhrsIXU+G3JxoWPMcaG7lB
	JGC1lI/iBZ8XVp1cI54dtTzoUMRiMck62v+LtjIY1DGPQQ2Gtkf+4FexF7zWj8qI9K8oEy5FRZW
	kWmp1Uwl2VrKrrCSG7LmWF8xd8GgjDWioa1h+JOcCNaIJm9iQXUTKGBIuqIJKRH2zdwXKb5qjC+
	L0sGbQaIGOwN4kOvK6Pt5oyzuVO+YaZmXwCJx2aRTlQUCA3ryeQX9kXY/wSWtDbu8WA+Rq/E/+V
	OT1nrwNxP7dseh4MyCbYRy5LKibVjjflHgKxPZQH3WkUqGA+iQIxUfLmE+7BVIDIbgMmU1E4nLB
	W3x/8iOTzDyADeIdG4lG6OPxhQsfmKDy1NaqGfkJRyyKO27N/gcF4mNUby5qLy/J7z2Nir3mh4M
	3OAAcBpXpXpDoppsDQYdQgEdUlLcAvA6UCZows1K6qGu91eYXpLhAvuGSXpjEFiUpcAOVLM1M3q
	TypTR2J3lL5y6w=
X-Received: by 2002:a05:620a:a8f:b0:911:e1ab:a3c0 with SMTP id af79cd13be357-911e1aba5e4mr1370917285a.60.1779053059232;
        Sun, 17 May 2026 14:24:19 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bab32bd0sm1282821385a.14.2026.05.17.14.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 14:24:18 -0700 (PDT)
Message-ID: <9576f728-f66b-401c-865f-a85f272b109c@riscstar.com>
Date: Sun, 17 May 2026 16:24:17 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stanislav Zaikin <zstaseg@gmail.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 428B6563FCE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108080-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 5/17/26 9:56 AM, Dmitry Baryshkov wrote:
> For most of the platforms the IPA uses qcom,gsi-loader set to "self" and
> requires a corresponding memory region. Move those properties to the
> SoC DTSI files, handling the outcasts (mostly from the Kodiak world) on
> a per-device bases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

It looks like the *only* platforms that delete the
memory-region property are in patch 6.  Only three
(old platforms) use the modem to load.

The entire series looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>





> ---
> Dmitry Baryshkov (7):
>        arm64: dts: qcom: sdm845: consolidate IPA properties
>        arm64: dts: qcom: sm6350: consolidate IPA properties
>        arm64: dts: qcom: sm8350: consolidate IPA properties
>        arm64: dts: qcom: sm8550: consolidate IPA properties
>        arm64: dts: qcom: sm8650: consolidate IPA properties
>        arm64: dts: qcom: kodiak: consolidate IPA properties
>        ARM: dts: qcom: sdx55: consolidate IPA properties
> 
>   arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts                     | 2 --
>   arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts         | 2 --
>   arch/arm/boot/dts/qcom/qcom-sdx55.dtsi                        | 3 +++
>   arch/arm64/boot/dts/qcom/kodiak.dtsi                          | 3 +++
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            | 3 +--
>   arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 --
>   arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 3 +--
>   arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++++
>   arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++++
>   arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 4 ++++
>   arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi        | 2 ++
>   arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi                | 3 ---
>   arch/arm64/boot/dts/qcom/sdm845-mtp.dts                       | 2 --
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi           | 2 --
>   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts       | 2 --
>   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts             | 2 --
>   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi  | 2 --
>   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts            | 2 --
>   arch/arm64/boot/dts/qcom/sdm845.dtsi                          | 3 +++
>   arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts    | 2 --
>   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts          | 2 --
>   arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts              | 3 +--
>   arch/arm64/boot/dts/qcom/sm6350.dtsi                          | 3 +++
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts             | 3 +--
>   arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts            | 3 ---
>   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts          | 2 --
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts                       | 5 ++---
>   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts    | 2 --
>   arch/arm64/boot/dts/qcom/sm8350-mtp.dts                       | 2 --
>   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi       | 3 +--
>   arch/arm64/boot/dts/qcom/sm8350.dtsi                          | 3 +++
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                       | 3 +--
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts                       | 3 +--
>   arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 3 +++
>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts                       | 3 +--
>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts                       | 3 +--
>   arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 3 +++
>   37 files changed, 46 insertions(+), 55 deletions(-)
> ---
> base-commit: 230cbc83bec52234e456f33a01f400f78bfac0f9
> change-id: 20260516-ipa-loader-403567adc3dc
> 
> Best regards,
> --
> With best wishes
> Dmitry
> 


