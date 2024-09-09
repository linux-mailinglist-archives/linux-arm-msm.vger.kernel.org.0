Return-Path: <linux-arm-msm+bounces-31370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E9F972321
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 22:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0418EB22F34
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 20:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061331531E6;
	Mon,  9 Sep 2024 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGSsTNC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C3C1F95E;
	Mon,  9 Sep 2024 20:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725912315; cv=none; b=PKIPmXP/5O0aBhumgWVsm1M3xV+KFqios3ouNcc6ux6g/4oQcJIrLgKZYwUgCe6cqGcO6XvXXG1fAAwkxAKrCxnlbjBYNFzf18DfmhtHvfyNUSmoy2vH+5mbWCUlxXYxFqLc6cc1VvWl6whFFb+DEtxSe6NPL8fOcMtBUn9AZmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725912315; c=relaxed/simple;
	bh=WAjFmHe8CHpD+UbXJ0yMn429XuMtyhYznyF+ycDlMRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpxTyjWYe2gwZCAbO686Ur/Q+uCiHyjwUr/ltxlFFhkaF/kPv/UuL+yoPaxSOZt9cPv+S1cExzeiX7ivMHuzX2GY0ZQwH6dSZEuCLNJMd7BynkDeMoKMdE6vHaLFPl59vufOPQvF39rcDkPjD9GnxfpqybajbfcHCrE1dDiOw08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGSsTNC6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E0AC4CEC5;
	Mon,  9 Sep 2024 20:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725912315;
	bh=WAjFmHe8CHpD+UbXJ0yMn429XuMtyhYznyF+ycDlMRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AGSsTNC6StWvz0ciGaK9NhvO6Zgb/AHhG3iN5H4Gcg2fff0kUgsFNiC1JEFMw+0ac
	 sIbKL8bZkT1gox4K75CFXdgCAN8l1eu7EdnvnIVO81i8oaPqHauh5dCePJAcTTcgRx
	 PU/BsIt5GDNCB9MUTRRuDP0LN7skFUjfdKNf1DzR+f/GJKZoIfPvJ6i7NoY65OqAGD
	 GNdMeVOlsla18fAI5ZxdDwQrkOZfWrj7QzWDhuDYVO8iTG5IA9ftmjOKISzL++eA3l
	 jxcFvZcNXak3fhomT/hHB+KhlL1YO32qMPYUJZ2KLBioDso3sdHZ7XZo+NcDkQG8OT
	 6lBMCziXzyUJA==
Message-ID: <734452da-6a3e-4063-ab42-607ac8dd10ac@kernel.org>
Date: Mon, 9 Sep 2024 22:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: Add coresight nodes for x1e80100
To: Jie Gan <quic_jiegan@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, Yushan Li <quic_yushli@quicinc.com>
References: <20240905103825.2154633-1-quic_jiegan@quicinc.com>
 <20240905103825.2154633-2-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240905103825.2154633-2-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.09.2024 12:38 PM, Jie Gan wrote:
> Add following coresight components for x1e80100 platform.
> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
> TPDM, TPDA and TMC ETF.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> Tested-by: Yushan Li <quic_yushli@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1516 ++++++++++++++++++++++++
>  1 file changed, 1516 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 74b694e74705..9d6f3098e144 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -305,6 +305,19 @@ CLUSTER_CL5: cluster-sleep-1 {
>  		};
>  	};
>  
> +	dummy-sink {
> +		compatible = "arm,coresight-dummy-sink";
> +
> +		in-ports {
> +			port {
> +				eud_in: endpoint {
> +					remote-endpoint =
> +					<&swao_rep_out1>;

Don't be scared to keep the lines 100-long, easier to read that way

[...]

> +		tpda@10004000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10004000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					qdss_tpda_out: endpoint {
> +						remote-endpoint =
> +						<&funnel0_in6>;
> +					};
> +				};
> +			};
> +
> +			in-ports {

'i' < 'o', please sort things alphabetically if there's no other sorting key
as per Documentation/devicetree/bindings/dts-coding-style.rst

[...]

> +		tpda@10c2b000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10c2b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					dlct1_tpda_out: endpoint {
> +						remote-endpoint =
> +						<&dlct1_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@4 {
> +					reg = <4>;
> +					dlct1_tpda_in4: endpoint {

Please keep a new line between the last property (reg here) and the
following subnode

I was able to confirm that this patch doesn't break booting on the
Surface laptop anymore.

Konrad

