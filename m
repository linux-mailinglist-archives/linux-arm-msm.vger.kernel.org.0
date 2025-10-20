Return-Path: <linux-arm-msm+bounces-77972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E88BF0876
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D10018914CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C422D2F5A03;
	Mon, 20 Oct 2025 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tb4ojMzl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944F01E9919;
	Mon, 20 Oct 2025 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760956027; cv=none; b=eqvz7loWg4a9t+XpGr5Tv6FMhfHHa24ocpkhGUS7ssOjbxnbm8+Y/fRFhmkM31prSv/ze/NegGDdi3BGqdWCzOTgoTwTDPmkJKQNID3xtz3WE2Pv8x1ROyBV2EINe3Vo/CxoaomayEptPBM3nnZqeVgnr6E5rZmMGQyy0/T2n/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760956027; c=relaxed/simple;
	bh=Jb2vczdvJZ30sqpX69uX4UTMD12+zS5XZrvzjN8zcW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7WGbzsNhGcpkSYNijUzFNvQAx5+G2oKEsNBsWYCdfKOkcudrIzCgxdGEXAbPofnEb2SLrViQNb2m2wyOMF/rMPdqOEci30QWKKCsnBNxpBiJmPj1WmHqRq+bPmdRumz182x3YS0KvTibr6gifgd/WGScQRbiClFwpWEbbQeDQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tb4ojMzl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021F1C4CEF9;
	Mon, 20 Oct 2025 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760956027;
	bh=Jb2vczdvJZ30sqpX69uX4UTMD12+zS5XZrvzjN8zcW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tb4ojMzlQcybZ1U6ULmbtJ1ZkZuar/a2L7zNXg+LiSuz0JYy1B1HKrz6v4ggAq3GF
	 eV4F52Bx5nmejgminQ7tP5VwrfjeVUHaylZlqM5s/KPGFuG+mQFCF05wo1O7+yN4tC
	 JA5eUjJUitmEcKfYWSXTJia+onQmCUZbfw6PWrwkckXEFkJ47rOkhoTDHSwYuL47ui
	 //lRXHQyHiDwhDMnYG8SHTKv8JCWsDvJZkUTYO+TwTX436WdBNy1FhoBw9RB/ml+vH
	 Y/bzm6tK4agz+ddLGX+MYVMknfH5bbVl8XsZqjlU/QX4ddlTXnsJ1vqQGzbiLSARlk
	 SPFjlHloDYYBg==
Message-ID: <24f3ef36-7d37-4b48-b882-4c3d1a04dabb@kernel.org>
Date: Mon, 20 Oct 2025 12:27:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] clk: qcom: Update TCSR clock driver for Kaanapali
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-5-29b02b818782@oss.qualcomm.com>
 <c9e27a9e-2274-4b1f-9953-ca012ba2615f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <c9e27a9e-2274-4b1f-9953-ca012ba2615f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2025 12:11, Aiqun(Maria) Yu wrote:
> On 9/25/2025 6:58 AM, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> The TCSR clock controller found on Kaanapali provides refclks for PCIE, USB
>> and UFS. Update the SM8750 driver to fix the offsets for the clocks.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/tcsrcc-sm8750.c | 34 ++++++++++++++++++++++++++++++++--
>>  1 file changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
>> index 242e320986ef..f905f3824d7e 100644
>> --- a/drivers/clk/qcom/tcsrcc-sm8750.c
>> +++ b/drivers/clk/qcom/tcsrcc-sm8750.c
>> @@ -100,21 +100,51 @@ static const struct regmap_config tcsr_cc_sm8750_regmap_config = {
>>  	.fast_io = true,
>>  };
>>  
>> +static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.max_register = 0x18,
>> +	.fast_io = true,
>> +};
>> +
>>  static const struct qcom_cc_desc tcsr_cc_sm8750_desc = {
>>  	.config = &tcsr_cc_sm8750_regmap_config,
>>  	.clks = tcsr_cc_sm8750_clocks,
>>  	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
>>  };
>>  
>> +static const struct qcom_cc_desc tcsr_cc_kaanapali_desc = {
>> +	.config = &tcsr_cc_kaanapali_regmap_config,
>> +	.clks = tcsr_cc_sm8750_clocks,
>> +	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
>> +};
>> +
>>  static const struct of_device_id tcsr_cc_sm8750_match_table[] = {
>> -	{ .compatible = "qcom,sm8750-tcsr" },
>> +	{ .compatible = "qcom,kaanapali-tcsr", .data = &tcsr_cc_kaanapali_desc},
>> +	{ .compatible = "qcom,sm8750-tcsr", .data = &tcsr_cc_sm8750_desc},
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, tcsr_cc_sm8750_match_table);
>>  
>>  static int tcsr_cc_sm8750_probe(struct platform_device *pdev)
>>  {
>> -	return qcom_cc_probe(pdev, &tcsr_cc_sm8750_desc);
>> +	const struct qcom_cc_desc *desc;
>> +
>> +	desc = device_get_match_data(&pdev->dev);
>> +
>> +	if (device_is_compatible(&pdev->dev, "qcom,kaanapali-tcsr")) {
>> +		tcsr_ufs_clkref_en.halt_reg = 0x10;
>> +		tcsr_ufs_clkref_en.clkr.enable_reg = 0x10;
>> +
>> +		tcsr_usb2_clkref_en.halt_reg = 0x18;
>> +		tcsr_usb2_clkref_en.clkr.enable_reg = 0x18;
>> +
>> +		tcsr_usb3_clkref_en.halt_reg = 0x8;
>> +		tcsr_usb3_clkref_en.clkr.enable_reg = 0x8;
>> +	}
>> +
>> +	return qcom_cc_probe(pdev, desc);
>>  }
>>  
>>  static struct platform_driver tcsr_cc_sm8750_driver = {
>>
> Remind to review the change.
> 

Please relax, and help out by reviewing other patches on the mailing
lists in order to relieve the burden of maintainers and move your
patches higher up the list. You can actually "remind" by performing
detailed and honest review.



Best regards,
Krzysztof

