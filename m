Return-Path: <linux-arm-msm+bounces-102845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD3PMCwO22n88ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 05:14:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 311433E29A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 05:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F1B0301545F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 03:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E56834B438;
	Sun, 12 Apr 2026 03:14:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D8934D398;
	Sun, 12 Apr 2026 03:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775963685; cv=none; b=FAbhIiht91c9v1OKDKKntf1vqXAFsOvZ6SiUrIDuQrfTjBRyCMaprrFkkMCCnm0GcU96wR6txLQSm7R+4wZEWGu7BPfVvji0gxCbxdJkhnIfES3udtzwjv5RkWwK4vBHKq3Ngs/nffnekk4etcMtAsK7bJulvo3z2dFoBZGbmiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775963685; c=relaxed/simple;
	bh=NBnGa8Y5ZfMGz157HUN541gkN2QuG2e6uXEIffKC1DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJRFplhpEyiLW9YnH7/m0PchAESVTcBCOgSJjF3CpFJ7HW5dftwKLFf/LOoNQjsjVRW5lQU1Ud7JLjXo6CET3NYWOTILxuSFvI0py2lulS7NBct+ICEx28uutwfoaMs6bLt+iRK7QWusQ/NCH9l8BDSMFnrI9UKb3ofw97Lg+Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz11t1775963664tdee67bd5
X-QQ-Originating-IP: bNsMHvx8h0AWAaHlzp/e0O2W+JBeJAc8Vm/awbgHFZs=
Received: from [127.0.0.1] ( [116.234.85.158])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 12 Apr 2026 11:14:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13206485324748503954
Message-ID: <63630053AE2A689C+fc86c1c4-8daa-4af8-bf64-b432fc8dc1c0@radxa.com>
Date: Sun, 12 Apr 2026 11:14:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 USB 3.0 and HDMI ports
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
 <20260407-dragon-q6a-feat-fixes-v1-3-14aca49dde3d@radxa.com>
 <eb745e3f-4bc6-4713-97aa-1a1a584c9a9d@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <eb745e3f-4bc6-4713-97aa-1a1a584c9a9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MOccRU8JXEkkN2kOXqEMqc8aPeA1xwN6A2FCsEHzXvTo7SwdaS/07Gaj
	jGQnvNzQGpRNFtW7jTX3uWmc5laUMxjOakPqWm+dfMLDQ5VDwy4QRPw4OopFk7oEKoqa5Cm
	JUm1t3n0iTWjzwtj/znGPZrZs3YETB/5Go6JUEj0naEJZ34ZqjB6rNmHeMwnhTZkD4G6oEt
	TTMmqi4ZpXywOfPqUwkFQHvecIS6+yRjQOgE/SDQlmynOH2pOXzmUjBaeUu6+JHmMIbD4Bh
	GSvjRWBFW8S7YvF5ZTZf7/7YQOh97vmczm0J634hEbQZmG/+ZBEJvm8gwsdTBTABc678SOx
	gZlM7KcUsRzSQ54hr0Vbk+4Vi4JJy/BoKmaWj/byogPhfQZ2XTE2zbw1QXXL+dkmNg50mXT
	uX0Vqv1//lUIcYOvCV0+WrOy9matyWTtYp29AZx6srqmdyFNgW6qEiw0VaRb4I6yrIkYPlb
	dnkUz91hq2/MS+kxw+yXZB304aCLssH9xJJ3a6KTtVVW6S6xMWI7ru8z9kNfacKFT+ij/Yh
	EoOUQeSbeE0/wTkuQ0ebu+6Go/mT/+RSWlcNM4H1crz5qRJfwPmtSfC0bGzF54Tx3+99OR+
	ArfbyFD55FQAu0YUj/vSSRYga+tiOSVnSfSVboSFFXpHjt04ZdRM8c2Bs7EJAMiYqqBJnw7
	fOPIIiNZ2/M/i3e9cbcVOCx9j99H/m5UTm66f47o6bBaVL5dJRs+GEOb4LyqL3+IGLHnBs3
	4R5bLIhVMWSV4ulIfMVQrt7vIGCDrH1DeEwolZ6hwirv+u8f5zEGeq1iqHBMSHeHmjidxxM
	Pv8RtM2LenD7DxX10Wq7B78ioQOZ7gZttNJZ5Eoz6lpkm/PkO2Jfse5mKt82V2bxtxMBcuo
	iadosZDQiqxmbWbxNM+dUiLYdscB+9leLL3g8/7bti+1TIlQIIiu2gqfkMDMEIZXlepLX4Z
	lFuQIVmt1wmrIPcD4FN1Fvv82q7oN586p+Tb/19e7KwLTRe7RK3OdiX9vjP8/+Ul0Nm9rmi
	Wta3AwcHHPMZsrmQgE8I18Ck+Y7zI=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
	TAGGED_FROM(0.00)[bounces-102845-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_MUA_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 311433E29A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/2026 5:03 PM, Konrad Dybcio wrote:
> On 4/7/26 5:19 PM, Xilin Wu wrote:
>> This board doesn't feature a regular Type-C port. The usb_1_qmpphy's
> 
> I guess the receptacle on board is power-only?

Yes. The Type-C port is power only.

> 
>> RX1/TX1 pair is statically connected to the USB-A port, while its RX0/TX0
>> pair is connected to the RA620 DP-to-HDMI bridge.
>>
>> Add and enable the nodes for the features to work.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>> ---
>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 152 +++++++++++++++++++++
>>   1 file changed, 152 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> index c961d3ec625f..8d649b3a1cfa 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> @@ -111,6 +111,71 @@ usb2_3_connector: endpoint {
>>   		};
>>   	};
>>   
>> +	usb3_con: connector {
> 
> This label is unused

Ack. I will remove the label.

> 
>> +		compatible = "usb-a-connector";
> 
> No vbus-supply?

It's supplied by vcc_5v_peri. I'll add it in v2.

> 
> [...]
> 
>> +&mdss_dp {
>> +	sound-name-prefix = "Display Port0";
> 
> Hmmmmm.. other platforms call it "DisplayPort0" (without a space)..
> But I suppose this name needs to match UCM..
> 
> We'd also normally push this property to the SoC DTSI

Actually I don't think the name is used in UCM. I can rename it and push 
the property to SoC DTSI if necessary.

> 
> Konrad
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

