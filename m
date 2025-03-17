Return-Path: <linux-arm-msm+bounces-51639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5537CA659EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 18:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA1291887DFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 17:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BABE186E2D;
	Mon, 17 Mar 2025 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="mIegrplV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCFFDDC1;
	Mon, 17 Mar 2025 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231171; cv=none; b=qQ7dwDyarCHRCT4+t8VV0rrOpWJS8JMQuUnfOPrdFLAn6umwEfjjUtvYgCULPqULL07xMRmYtzfAa4AqPNrL54DerrhOF7kCWVUOGYfkhj76yFZbKRapUBOvh1Z4fr7CVIRtbp41T7D1XVZTUiNLxXmz7jPtljjXtdOLrwIGpcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231171; c=relaxed/simple;
	bh=/xD8O8G6gjRmTJ73yF65jTWKxhEEFN3wTExhtSMFRhI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RNZIfYD0w3u+jLIAmDHGNs31KZyf+X3bHfziG9u18KbDMLmaGxJsB+jC/JvlT6kqMg7rokwVSDpKTcNf1OIRsUthnPzPS1TvGOCq1Aa3qctjQfk1dIL8jDziraGDqEWtd+ufX+sjA/dN54QBIqAbIne88sIZsJ7AUV1jlsUkQvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=mIegrplV; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1742231167; bh=/xD8O8G6gjRmTJ73yF65jTWKxhEEFN3wTExhtSMFRhI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=mIegrplVdgdHTUn14JxVQOLSq22kkDxrDa4glErt2flUElW4g7RstSMEG/PaFczg4
	 drx2YhfPMQ+DAr1b1qCcC6zWxFo33mW8OVoXSxM2aTxkldNyIja3M1tv6FJXVM9/F/
	 /j1Vl9F/jD9k3HfIP/qWOILDeUw55URceDpVCSn0=
Message-ID: <92efa0ac-cdce-4ea2-ab08-b756dc755432@lucaweiss.eu>
Date: Mon, 17 Mar 2025 18:06:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] rpmsg: qcom_smd: Improve error handling for
 qcom_smd_parse_edge
From: Luca Weiss <luca@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240606-apcs-mboxes-v2-1-41b9e91effb6@z3ntu.xyz>
 <2827287.mvXUDI8C0e@g550jk>
Content-Language: en-US
In-Reply-To: <2827287.mvXUDI8C0e@g550jk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/24 12:06 PM, Luca Weiss wrote:
> On Donnerstag, 6. Juni 2024 21:01:36 MESZ Luca Weiss wrote:
>> When the mailbox driver has not probed yet, the error message "failed to
>> parse smd edge" is just going to confuse users, so improve the error
>> prints a bit.
>>
>> Cover the last remaining exits from qcom_smd_parse_edge with proper
>> error prints, especially the one for the mbox_chan deserved
>> dev_err_probe to handle EPROBE_DEFER nicely. And add one for ipc_regmap
>> also to be complete.
>>
>> With this done, we can remove the outer print completely.
> 
> Ping, looks like this is still pending.

Ping again, still pending.

Regards
Luca

> 
> Regards
> Luca
> 
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> ---
>> Changes in v2:
>> - Rebase on qcom for-next, drop dts patches which have been applied
>> - Improve error printing situation (Bjorn)
>> - Link to v1: https://lore.kernel.org/r/20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz
>> ---
>>   drivers/rpmsg/qcom_smd.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
>> index 43f601c84b4f..06e6ba653ea1 100644
>> --- a/drivers/rpmsg/qcom_smd.c
>> +++ b/drivers/rpmsg/qcom_smd.c
>> @@ -1369,7 +1369,8 @@ static int qcom_smd_parse_edge(struct device *dev,
>>   	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
>>   	if (IS_ERR(edge->mbox_chan)) {
>>   		if (PTR_ERR(edge->mbox_chan) != -ENODEV) {
>> -			ret = PTR_ERR(edge->mbox_chan);
>> +			ret = dev_err_probe(dev, PTR_ERR(edge->mbox_chan),
>> +					    "failed to acquire IPC mailbox\n");
>>   			goto put_node;
>>   		}
>>   
>> @@ -1386,6 +1387,7 @@ static int qcom_smd_parse_edge(struct device *dev,
>>   		of_node_put(syscon_np);
>>   		if (IS_ERR(edge->ipc_regmap)) {
>>   			ret = PTR_ERR(edge->ipc_regmap);
>> +			dev_err(dev, "failed to get regmap from syscon: %d\n", ret);
>>   			goto put_node;
>>   		}
>>   
>> @@ -1501,10 +1503,8 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
>>   	}
>>   
>>   	ret = qcom_smd_parse_edge(&edge->dev, node, edge);
>> -	if (ret) {
>> -		dev_err(&edge->dev, "failed to parse smd edge\n");
>> +	if (ret)
>>   		goto unregister_dev;
>> -	}
>>   
>>   	ret = qcom_smd_create_chrdev(edge);
>>   	if (ret) {
>>
>> ---
>> base-commit: 2c79712cc83b172ce26c3086ced1c1fae087d8fb
>> change-id: 20240423-apcs-mboxes-12ee6c01a5b3
>>
>> Best regards,
>>
> 
> 
> 
> 


