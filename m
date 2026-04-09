Return-Path: <linux-arm-msm+bounces-102402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WqKOB0Mf12mpKwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 05:38:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 952A03C60B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 05:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 966413009B27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 03:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8220635F5F2;
	Thu,  9 Apr 2026 03:38:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168B836EA88;
	Thu,  9 Apr 2026 03:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775705916; cv=none; b=GBXuX4JYNLA6fyMsdwan2Wck4gJL327PCCSTyfYINDRhOVKPPdTPS6aCdoE0DHPyA2UAcQ0AGJuR6L7euLcLfYWUiyufvmyl/BMfuTXhFvRSOpdOZ+ke5qoFJmR0dBZmi6oLW+rDEikMkOwmdVtGhX1HoYt7oj2brs1dHAStJno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775705916; c=relaxed/simple;
	bh=7ZaP9NkRkWLdMBflMdtwe5RQ841zx1ocFIAddg6aAVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdBwVCWklYd+MSnTPGCmi9RF4CS9tziln2zhA3oCSzmc0BRMP2FgpnbOr3cBybWGho1V/AKcHDbRres8U2fmeMPOB+cJ9EN70AhzsMqilbc4qOkLFT2VOgetG47jPFvteUGiOKTbv5wkGtzc3Hw2QBHKb38q4mnHISggU6oWD9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz15t1775705904t9a202183
X-QQ-Originating-IP: PmTtFjzxIQBcV5ccTjIByOzcOk/vF6+qiUAw0476RDA=
Received: from [127.0.0.1] ( [116.234.85.158])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Apr 2026 11:38:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7767451530965859162
Message-ID: <F2AA47AD7B29E14D+c0b3cd58-7194-4918-85cb-ae9dd2775255@radxa.com>
Date: Thu, 9 Apr 2026 11:38:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 UFS controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-2-14aca49dde3d@radxa.com>
 <bb21b9b3-7432-401a-a0d0-1b1970f27770@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <bb21b9b3-7432-401a-a0d0-1b1970f27770@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OVAgSpUT8SOPb0DzvlBbKuCxkTa4Vl+WvlS9qgkZPgn/VxTZ7qGn+0UV
	pWdAzPZot4b026yuomnw++RYoj0VOY8svW3Wbf7pDehO8p3qhQ5Pw4aJxU40wd2/8KZc6s0
	FJOgY27dGqcpjxFVObo+HBC1w2HyzSLOmZVNOnRdx7t32tJ8NqK3wM/Boc8VBntm4ZkfLhq
	S1d2ae+ddB8JAIQs0DQp7V+40WmWohqcb1huiCOHKNvWhhFTcgGSN1BCyk5VtnDnNxdxtnd
	ntHtoLPG/ZS6uo6Xb1rmHWZJPJnny/qoOZlukxFZLM3xy8s1UlTcZMum21Kfv0YYpxIGuqk
	cyxNuGXN1M/linX0CAuP0nmRqNXLUhQ1ZVXn9a0iO8Osh/nytCkgAmmLrrzGBJwp0giLHnK
	4W6wVI9wWlQC3ar0PKj+HKqhoDl8DyHzx0tu52GSGXKoCDBGsx3BUprJ25sxfCc2RVbxc0Q
	7AiBegKfX82yop/wcQkR/659oGT1VIehUQ7QrrqLGTJ7mitPKC9ZT4DG+6/A1R+mXYkCv31
	W93rweygAZjeWFvxXjJsJlq+nfgnt3F4LnXS4VjdKpejbemaR6Pq0DeffYD6WVjZMEumX9e
	e06rP7E20/EqsarmDeKch7/88auGHF9HYSc5OAch0P2RiyHkSFOP/DTzgpLVtc89K/mscXc
	f1CTb0B+5BGQyipaozrkXU2wQmudi7PEys2Ud+SqSG5yvuS6LwMEci8ivj3Gar6nra8PeAv
	l3NhWddNbndefEgqfZi1YYAGblu1aAuxTCwNj9tSQpvHfOYZE1TFnGxkhCIND4v+UTo96Ec
	TSiip/e6dYEEJFOrAkfVVZPhptcLv3+i1KOHCZzivl2q/fO/0J6ZXIgS5etsnJOxXAjVUkA
	DzGYN3kjyMaKJ3qtNJ7pp3muUX2DzlZ1X2V9fu8JP+UqN3WP0dW5Qek0va5nQScfsVwMbEX
	ygiIMMJ05JSvFWi8+Oi5ob+LoMrs5d/itTRjCY1wsbDVCwfb1l9t2N8qNWPJZBaENN68sff
	KVq/0Eww==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102402-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.848];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_MUA_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid]
X-Rspamd-Queue-Id: 952A03C60B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/2026 4:59 PM, Konrad Dybcio wrote:
> On 4/7/26 5:19 PM, Xilin Wu wrote:
>> Add and enable UFS related nodes for this board.
>>
>> Note that UFS Gear-4 Rate-B is unstable due to board and UFS module design
>> limitations. UFS on this board is stable when working at Gear-4 Rate-A.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>> ---
>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 23 ++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> index bb5a42b038f1..c961d3ec625f 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> @@ -959,6 +959,29 @@ &uart5 {
>>   	status = "okay";
>>   };
>>   
>> +&ufs_mem_hc {
>> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
>> +	vcc-supply = <&vreg_l7b_2p96>;
>> +	vcc-max-microamp = <800000>;
>> +	vccq-supply = <&vreg_l9b_1p2>;
>> +	vccq-max-microamp = <900000>;
>> +	vccq2-supply = <&vreg_l9b_1p2>;
>> +	vccq2-max-microamp = <1300000>;
>> +
>> +	/* Gear-4 Rate-B is unstable due to board */
>> +	/* and UFS module design limitations */
> 
> /* it's a bit weird to add two single-line */
> /* comments near one another for a single paragraph */

Ack. I'll change the comment to single-line in v2.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

