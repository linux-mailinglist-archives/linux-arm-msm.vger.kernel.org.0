Return-Path: <linux-arm-msm+bounces-83692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E57C90EED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 07:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B01D4E05F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 06:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0CC2D0618;
	Fri, 28 Nov 2025 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHYe7ClA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fW2kBW8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB02C236B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764310936; cv=none; b=etQJfKBgOjkwGuaYnQWe6KvLu2BpRLqYfasClmzVEqiRyDDflK/yisffidysMBSzfcYzY+736hHNBNCZ/Pgix6wrK4Vqc4UdfF60+JgNW/7BHfEFIdBylWJjAgEsi0y1MoIcGJqB59KLgMoadRfDic9yvL9uJwdnrygGyeDVl9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764310936; c=relaxed/simple;
	bh=BracIS+Xd6atAPw30XiCJB91DEGb12idVZhaKsfMj1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDH4CwRcipyqawIIE/oQFuNjYjfuGhy70Ogxtin6hHhdqBZvVIUP7Oz0OCNHhEQa3egbXf8dF97TIs/t+ZANeM4317jY91RLjP9k4jOBXexIiN8ddPpZSFszva5BA81crJnpdReeX4PO54ckOY2o8mva1jNmNGj5J6ryuC8WqkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHYe7ClA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fW2kBW8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS54DbT2699460
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 06:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXfC5bxB35EN6mnVCYtR6QZAZwZl0nfuVLSX/8xWrJo=; b=nHYe7ClAbOdDllCt
	2JxLWZ5iCUn9cVccaWSnkNQtIPX1BFfQL18cheIfcMjWtAe9sdOyMv4/WVIS21d5
	mdEDlxEzsXOs2EPyFDZGDe6jxlLTzsGcDMU8R2gd15zh9s9Z9un554Jxg9XxQyEa
	DlroxMEJy60PUxApPElErE9koZeOpTUpd8HWnPgwG6/KpBd+cx+2fhAwN40nziQG
	IAvNr2XkvaArYZvCv7dL6B9PH6kUkmS9Zm+Hej0BNik2chCZMto5Mc1BCxpXaarz
	/Y/lUu3rwvi8NIRg8ntksf+TJkPZWRdyAnWKh8+XKIbepekjcuh4hiFkw+PcXwDU
	7TOrpA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58ug614-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 06:22:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b895b520a2so1433656b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 22:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764310933; x=1764915733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXfC5bxB35EN6mnVCYtR6QZAZwZl0nfuVLSX/8xWrJo=;
        b=fW2kBW8GFQyk3YiKPSNp5Vav18VgYh5Xqxx3I6QHAeaC4M9g/uCOxCikUNALWYcv9u
         IjBkaT48y6DUcHL8SKuor4G+LfkR3/Nxllt/yZp8kla98hPLiNrB8gHP62cnHJ3G8NSJ
         qWQyI7Xwhf9VZXIBTJC8eYdiWplkBN6hV1l/ftrAZQLRhvUnI3WWC39tqI5GPI8i0hyn
         03eVPxpB84gYVaII0zuFahUU+W1qAb+rrBjz/m+L2ucBYMdw/XsekM4QJsDL6x37Fdzh
         oCX7xIbR8vj0ViA4RyBcX8W2srmliaddVhFUsncGJ+5mjDDcPDimYpIdveUVftn5hdPq
         CuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310933; x=1764915733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXfC5bxB35EN6mnVCYtR6QZAZwZl0nfuVLSX/8xWrJo=;
        b=YWIA4kVJ5WqHTU2JwoGy+WADd0YN2FNtGuIdVV/ehZc78iShIcrmEu0rtmOMY+w6il
         /FAefn7Gxrx6ljFt0vgEwSYuJmjTXDnE14C2M9qj/sWveNYxAi2SpwhoYEpmUglDYYlI
         2XJl2ByDeK4+TlDFCZq7LDpnRW2yz8hTXJVG+8AuGhn2g3ZVw5UKw301zc5SmSTu5onN
         oVD5odcA5Ra0fOQmt9//0Y9r/D2KrxbAt7HTyZnepXApMCb+Aa/CZWofV7NHHn8lMNud
         7TgBPMTzFyTIVL+LEH0ZXljQibb1gOjwyJ/h84gHNITF2E1FDmGV1Z/DZkDylidVN6Qc
         iaCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3qeoVw4ZuVbTt48J3MIrNlbL4xe+4E782JW1mJGQVFzMyA6oXA1EKHzMzkzkuir0+a1VRyT74gkiq+Wno@vger.kernel.org
X-Gm-Message-State: AOJu0YyfK9tAH5DPrdd2ER1f8hoy1fwlPe4EVGVdVOpwib+HltvQnCiT
	DzRh1UnAhblpvV9ONpZOcVaIKvgPtODp8pstNZNZCl/FVPozLIOtxDRTOhd2yvQ7anmZuhX3IRv
	Ik0gMCWnOaO5p7jZEe/ytOhUgLYdYfe8IHYal2P7JBAAu+PTy0G7vvVdwJBubnAW4JbWA
X-Gm-Gg: ASbGnctaEnmxZOX1maaxiwdp3kpmveLabfWTefFNTz649bMmBTVEk9l0eRsQY5jDiDJ
	gda4t35jHufLb8hzulFGzPTDpZwVS90knE1SCgyMqamfSom8EAe9pLmCFhPWp0SberDbk3PQLED
	Tpi10Em3sJSGcMSj1aMn3GEGClYIjojionEEiBUJcgHWQTVGnr1OvnkahtTRtzPAfP1zCUo2JXA
	sWnv933XJfTW5V3++XhrAQGWMxpSPFNLFC+rZwjD7Hg1v6YcWhD9emvzKWUmfg/cfx6WCCF2hhq
	uSC1g4DpAtPNVj2Z+IPpDEpOQNWzLFUkAdLptcbC15ipLBDp1DnF/P/wuhlM/cHnyK7OYiYiL4E
	G5SKgpTEHD1Vo1d24sUB7dJG8mCfnf5DUk/+1PkepdA==
X-Received: by 2002:a05:6a00:2407:b0:7bf:1a4b:1665 with SMTP id d2e1a72fcca58-7ca8926ec0amr14748327b3a.15.1764310933391;
        Thu, 27 Nov 2025 22:22:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO1liUQm+jpYlRcSQC7wCYR26ocA5dXrSjhrHaQRqRf3O3NL4JXaBUvC6b2Piipwj9zZ5PNg==
X-Received: by 2002:a05:6a00:2407:b0:7bf:1a4b:1665 with SMTP id d2e1a72fcca58-7ca8926ec0amr14748272b3a.15.1764310932697;
        Thu, 27 Nov 2025 22:22:12 -0800 (PST)
Received: from [192.168.1.4] ([49.204.106.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e6e6df9sm3720818b3a.39.2025.11.27.22.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 22:22:12 -0800 (PST)
Message-ID: <15a28ddc-9883-42d5-a008-b2ea22d8becc@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 11:52:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/12] i2c: qcom-geni: Isolate serial engine setup
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_shazhuss@quicinc.com
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-9-praveen.talari@oss.qualcomm.com>
 <ar5t2wdmxzvog7smlwbg3skg6ga35au6uiahfe3rlnmumlmpyr@572sf6ru6424>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ar5t2wdmxzvog7smlwbg3skg6ga35au6uiahfe3rlnmumlmpyr@572sf6ru6424>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -EZ0eskIMMTr3Usr1iPUW_BOKJRoxDv3
X-Authority-Analysis: v=2.4 cv=UKvQ3Sfy c=1 sm=1 tr=0 ts=69293f96 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=knFCEH6M0+SSkFC620ieTA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HUEr38yWfXq3XK2hY-kA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA0NCBTYWx0ZWRfXzkgaPU9gSSym
 mVjWGSv4NFO6f57Ao19nvt/gCdEBjzT+hqu+l81L/xkLvBNgOS3CrzdLVWhJoKUMagfK42MRJs6
 ed/8X+B1cnkkUD2elCB5BwhIOFD7LoS5Rc6eOyS40b2c7KBtkwTst4UkkFxOFlQbAUTYvRoqvM3
 eGcNCaNGwx40EByHPnkhHjB4BvyYhg7pIebKWo59Sf9GDS1DSGagmS9+e7wpOkO6blj3zCrBUQQ
 eQrzQGpdsrlg7O59kR/vyNyes6WMdFMj2j0LaqrJLIrm+f4PAfARbgOP2b68AggpP7i9eRUoT7J
 0y0lKd7cZ2hnJDm8DnkZXm0DCEEk5gs57osesgBDMA2pGcO+jzh4w2D7hIKkLKsu33hY5RJ/6xt
 hbt4bBP9cbsYrZy/Od2PbQdY8BAWOA==
X-Proofpoint-ORIG-GUID: -EZ0eskIMMTr3Usr1iPUW_BOKJRoxDv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280044

Hi Bjorn,

Thank you for review.

On 11/26/2025 9:00 PM, Bjorn Andersson wrote:
> On Sat, Nov 22, 2025 at 10:30:14AM +0530, Praveen Talari wrote:
>> Move serial engine configuration from probe to geni_i2c_init().
>>
>> Relocating the serial engine setup to a dedicated initialization function
>> enhances code clarity and simplifies future modifications.
> 
> Please enhance commit message clarity. I don't think "code clarity" is
> your most significant reason for this change, and "simplifies future
> modification" is completely vague.
> 
> Be specific, the reader of this commit message hasn't implemented the
> next set of commits, so they don't understand why this helps.
> 
> If the reason is that this simplifies the error handling around the
> resource acquisition in the next patches, write that.
> 
> If my guess is wrong and the sole reason for you change is that you
> don't like 179 lines long functions, then just say that.
> 

Moving the serial engine setup to geni_i2c_init() API for a cleaner
probe function and utilizes the PM runtime API to control resources 
instead of direct clock-related APIs for better resource management.

Enables reusability of the serial engine initialization in future use 
cases like hibernation and deep sleep features where hardware context is 
lost.

I hope the commit text above should be appropriate.

Thanks,
Praveen

> Regards,
> Bjorn
> 
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 148 ++++++++++++++---------------
>>   1 file changed, 73 insertions(+), 75 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 3a04016db2c3..4111afe2713e 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -976,10 +976,75 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
>>   	return ret;
>>   }
>>   
>> +static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>> +{
>> +	const struct geni_i2c_desc *desc = NULL;
>> +	u32 proto, tx_depth;
>> +	bool fifo_disable;
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(gi2c->se.dev);
>> +	if (ret < 0) {
>> +		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	proto = geni_se_read_proto(&gi2c->se);
>> +	if (proto == GENI_SE_INVALID_PROTO) {
>> +		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
>> +		if (ret) {
>> +			dev_err_probe(gi2c->se.dev, ret, "i2c firmware load failed ret: %d\n", ret);
>> +			goto err;
>> +		}
>> +	} else if (proto != GENI_SE_I2C) {
>> +		ret = dev_err_probe(gi2c->se.dev, -ENXIO, "Invalid proto %d\n", proto);
>> +		goto err;
>> +	}
>> +
>> +	desc = device_get_match_data(gi2c->se.dev);
>> +	if (desc && desc->no_dma_support)
>> +		fifo_disable = false;
>> +	else
>> +		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>> +
>> +	if (fifo_disable) {
>> +		/* FIFO is disabled, so we can only use GPI DMA */
>> +		gi2c->gpi_mode = true;
>> +		ret = setup_gpi_dma(gi2c);
>> +		if (ret)
>> +			goto err;
>> +
>> +		dev_dbg(gi2c->se.dev, "Using GPI DMA mode for I2C\n");
>> +	} else {
>> +		gi2c->gpi_mode = false;
>> +		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>> +
>> +		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
>> +		if (!tx_depth && desc)
>> +			tx_depth = desc->tx_fifo_depth;
>> +
>> +		if (!tx_depth) {
>> +			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
>> +					    "Invalid TX FIFO depth\n");
>> +			goto err;
>> +		}
>> +
>> +		gi2c->tx_wm = tx_depth - 1;
>> +		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
>> +		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
>> +				       PACKING_BYTES_PW, true, true, true);
>> +
>> +		dev_dbg(gi2c->se.dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>> +	}
>> +
>> +err:
>> +	pm_runtime_put(gi2c->se.dev);
>> +	return ret;
>> +}
>> +
>>   static int geni_i2c_probe(struct platform_device *pdev)
>>   {
>>   	struct geni_i2c_dev *gi2c;
>> -	u32 proto, tx_depth, fifo_disable;
>>   	int ret;
>>   	struct device *dev = &pdev->dev;
>>   	const struct geni_i2c_desc *desc = NULL;
>> @@ -1059,79 +1124,19 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = clk_prepare_enable(gi2c->core_clk);
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = geni_se_resources_on(&gi2c->se);
>> -	if (ret) {
>> -		dev_err_probe(dev, ret, "Error turning on resources\n");
>> -		goto err_clk;
>> -	}
>> -	proto = geni_se_read_proto(&gi2c->se);
>> -	if (proto == GENI_SE_INVALID_PROTO) {
>> -		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
>> -		if (ret) {
>> -			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
>> -			goto err_resources;
>> -		}
>> -	} else if (proto != GENI_SE_I2C) {
>> -		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
>> -		goto err_resources;
>> -	}
>> -
>> -	if (desc && desc->no_dma_support)
>> -		fifo_disable = false;
>> -	else
>> -		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>> -
>> -	if (fifo_disable) {
>> -		/* FIFO is disabled, so we can only use GPI DMA */
>> -		gi2c->gpi_mode = true;
>> -		ret = setup_gpi_dma(gi2c);
>> -		if (ret)
>> -			goto err_resources;
>> -
>> -		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
>> -	} else {
>> -		gi2c->gpi_mode = false;
>> -		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>> -
>> -		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
>> -		if (!tx_depth && desc)
>> -			tx_depth = desc->tx_fifo_depth;
>> -
>> -		if (!tx_depth) {
>> -			ret = dev_err_probe(dev, -EINVAL,
>> -					    "Invalid TX FIFO depth\n");
>> -			goto err_resources;
>> -		}
>> -
>> -		gi2c->tx_wm = tx_depth - 1;
>> -		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
>> -		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
>> -				       PACKING_BYTES_PW, true, true, true);
>> -
>> -		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>> -	}
>> -
>> -	clk_disable_unprepare(gi2c->core_clk);
>> -	ret = geni_se_resources_off(&gi2c->se);
>> -	if (ret) {
>> -		dev_err_probe(dev, ret, "Error turning off resources\n");
>> -		goto err_dma;
>> -	}
>> -
>> -	ret = geni_icc_disable(&gi2c->se);
>> -	if (ret)
>> -		goto err_dma;
>> -
>>   	gi2c->suspended = 1;
>>   	pm_runtime_set_suspended(gi2c->se.dev);
>>   	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
>>   	pm_runtime_use_autosuspend(gi2c->se.dev);
>>   	pm_runtime_enable(gi2c->se.dev);
>>   
>> +	ret =  geni_i2c_init(gi2c);
>> +	if (ret < 0) {
>> +		dev_err(gi2c->se.dev, "I2C init failed :%d\n", ret);
>> +		pm_runtime_disable(gi2c->se.dev);
>> +		goto err_dma;
>> +	}
>> +
>>   	ret = i2c_add_adapter(&gi2c->adap);
>>   	if (ret) {
>>   		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
>> @@ -1143,13 +1148,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   
>>   	return ret;
>>   
>> -err_resources:
>> -	geni_se_resources_off(&gi2c->se);
>> -err_clk:
>> -	clk_disable_unprepare(gi2c->core_clk);
>> -
>> -	return ret;
>> -
>>   err_dma:
>>   	release_gpi_dma(gi2c);
>>   
>> -- 
>> 2.34.1
>>

