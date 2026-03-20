Return-Path: <linux-arm-msm+bounces-98929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOgeHhlJvWlr8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:18:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B9B2DAD52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D28D301372B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A06D3B38A3;
	Fri, 20 Mar 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHKcB61j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKfkaNg4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25E23803CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012692; cv=none; b=BsCI8gIITHJ2LcNtcAziqLwTIxpZcxDj5txutfaSWRAgqxMdNIQqOQYUfGH32ruDPMcnBncK31KDZIiN9bq5IiAg9wzZH/ddqEShMLQnyT6ZM54tc+5ACfHY05vKd6/h2BBgCqr/5+XKuB74EGmfXShfcDzJTBsh1ccWzPRcvGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012692; c=relaxed/simple;
	bh=GFtPOIS2d3ylVKkbDZTigEDzxkx3dmQGhTmUhaceH9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5tkqhIi1Hd5+bi+kMcSnyOi5Ict4z0jkKI5RXC9y8YJVZzBfSRQvJxURaFEKHZG9XfJSRRfSPO+uV5DCcTWYc8C2SHLcfFH+upozRecyoXc6sdvJnLE7NjkU9bS8wfUcmDCeEqY8IQl+j7RiB15U92+qlJLcSQSZf/zC71950Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHKcB61j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKfkaNg4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KA7cLG3347646
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 13:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nN+EpZcfjM4UEYkobqRL5eWDhWbXf0Ts9cWhVsyvUK8=; b=DHKcB61jHehqeBur
	ss7vEYVwG5/86QEBhdc5juXAPznv6NDzswrrwyitGdWZY4seY8+/omgW0UhALkVM
	KUT/Mpkk5vL6xY4TvchmS/CR/4c9yU8SbB+och1eilD+Qo1N+7LRcMSJIJFy//Wh
	TSBaNIxnHhmJbeyLYXv74rew620b19Knd5zW/Ey0ForBmo53M1xE0JKHDwRkVkPT
	9cUH5tPyJAPqztFLviX561xyipwrj35theXNHy+sVE2bqlxp5xjTDw1H4v0g39sT
	+W2Rd4KqxtIGImrOLhd2yeP+5hcNs8819L/z9l9Y2RXPOoRf7E3Q9gYV9jq3yO7k
	rQxsDg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1479rdp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 13:18:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c738b1f630eso7376859a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774012690; x=1774617490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nN+EpZcfjM4UEYkobqRL5eWDhWbXf0Ts9cWhVsyvUK8=;
        b=QKfkaNg4DNPeOmwvjiGfEUTitMe5CcUgoAKAqrG/mf82FU/fO+BrRGpeC6HcWdaU71
         FUobN0E9X5waTYRFrpYvThY4+gUjmkBTmdEDlLdvd+21qPjRo1gHcQM8NF0F2TVqZ/VY
         LBzT6NTYQRBS6wqeAPDXCSLIc9nfmyyAo1ZO1EGUhfwenF1lpAki5s1cKZAZcHb7YifQ
         8suFVNrkeIvYVsUkMcvfeKkASYAdx4Hpjch4U5bXT0TcL6nwMXtfipzp2uo+KcertUMj
         O8TqmQ7V9Bz9Hm96uSvJM09lRKDuXgiqQyLssexD/UN+P5qKULPePOjdwQtgHLNQYXfu
         JWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774012690; x=1774617490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nN+EpZcfjM4UEYkobqRL5eWDhWbXf0Ts9cWhVsyvUK8=;
        b=U+vjXEs0oP3bL++XzkAORBg98Obh0RLDbA0IyU9LmRDo+pgTPw0Tq9K+2TRXg1vq4Q
         /zF6NEKZlBs4vOvaxZdBis5QJh+bkxzXFbi7l5dqM7Wdbtw6Ud+XMK1KbpM54ZU1apCb
         ybAbINj8Kg9El0Ai7nVauTPnmg1hWrHG+C8VdbkpEeiSlH7rW8IIFQB/E1mxeVD+68Bu
         tHUva1oRs0awKpdgmdxolA/DizyomJt5s/5BdpZJ4EMAXTedrmTLq3tOyfCrvVlZH9Yr
         ejRmg5R0cWz/rLCHbfpgA3tNDV+Oq1FGWKSUBJ0bSSA8sqS5H6urCvlLIUy9c6rUOL3c
         AyAg==
X-Forwarded-Encrypted: i=1; AJvYcCUtZEy0aGwVNJzr3YYZ+WBaCNCu0dzzMtGVMKwmgIImGsdf/M7UXgXRC8v8MoKGjyVrey0zR1zh6KbEf3KH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo1PhIVZRIA29dJ+CbRHSLH6FGLSvVd0PdH4wBjpVNV54Bt8Dl
	H7nsHLYot6KxwqNahMuo1PyhWeKJhbR0robnKj8F0Vpwhfravobj2TbQhJOHVlOCjLr8Mt9KMvf
	oJx0KQ2SQwEHzsFjn6gkomP4i6vZnyt+d735Ko3GEdL2fMo8A/gRMToZquTwkwkltovb8
X-Gm-Gg: ATEYQzwwInr2Vb6dQ9PeIxhSROrwKiD5NzNEib3p+RI8DsTKVzHacRWz+j+01N/6TER
	+7M+XuAjMlwNs9HWrd/XEWr9LZBKFYvLyKpFMDUCnSxko5yTg9N7W8ye69JCE2M/zb4pKblEWX+
	EaUv9qyD2TmLI/ze4zAmKWf0oNt4M7sACKUdXE+STrRGdGJFt2bkIFq5enXlRqUybNJLbLOgCHa
	lQ6YH1t6oUVAoux6wGdNgf0ZsV+zQso7QAefZjRGJ8NtF9obGwH9B2Va2NuKqLk89rZwYCZHrWv
	cVuaDuE9Y+7C3IafsmL6048FsUxiFh75NoZuV3gfdkdN7TYiWFGohFJ03gNNEEx3IaW1PX/Nlfn
	e54RKF7DxLpQQz76kcJFxdr2Fw0bQbRWukoGT51XLlHrz/O61buQohI8p
X-Received: by 2002:a05:6a21:3295:b0:398:8766:4d0a with SMTP id adf61e73a8af0-39bce9c06d7mr2867291637.19.1774012689406;
        Fri, 20 Mar 2026 06:18:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:3295:b0:398:8766:4d0a with SMTP id adf61e73a8af0-39bce9c06d7mr2867236637.19.1774012688756;
        Fri, 20 Mar 2026 06:18:08 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74487b5b8csm1872880a12.31.2026.03.20.06.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 06:18:08 -0700 (PDT)
Message-ID: <bf9196ae-d03e-435c-9e57-ca053a4a19b1@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 18:48:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mani@kernel.org, thomas.kopp@microchip.com, mailhol@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com>
 <20260316131950.859748-4-viken.dadhaniya@oss.qualcomm.com>
 <20260316-garrulous-saluki-of-advertising-b0a726-mkl@pengutronix.de>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260316-garrulous-saluki-of-advertising-b0a726-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eddsCWjCMicaHnvMzMw5kHl_KFCZeXYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDEwNSBTYWx0ZWRfX9U2NOu9ymo7x
 c67/kEbOKeYJ1fG+7BIsf30YEQAbvgXsSQs62qLBcibjlIgiG4IQgaABY/4QV0EAQeDWP2iKIGv
 vyfxwp80JfNQhZtwSxfEhROoBK6TJOl+eX0ajAhhARxG2GoIlmRJwjyNeIFDd4PXkw3Eck5oWS9
 skLtx2wa6kqN/HIllMVjupaXTKiryTyEenGbXo/Lm+N5OkIilW4JWwqbNZzxGydI4vrYd0FKAiK
 5A+fOIN6vv3SXevLsu4RJyonxTPxMm1fs1X6AMDp/wLlWO/MS3IwvcyyPx/SSbL1LezbevgLP78
 SGfPotU87nWFD8mlu5id961IV5VMUQJVp8lOeUjHqT9w5SpOITF2KTKp1oxIHnjZCSi6GLW3P7e
 RPInm3o6kuf01Gph64/KwPocFA7bWsaFTnhqKKXzGGOUaaWjoJx6Gp5sYrWviw37n3p9pOSxP5E
 Ykzos8Ce6UoYf33ShXw==
X-Proofpoint-ORIG-GUID: eddsCWjCMicaHnvMzMw5kHl_KFCZeXYM
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69bd4912 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=cGBE/nqsz5+qsjWdF/9VHQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LcWsMGrysshWCZgQONgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98929-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77B9B2DAD52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/2026 6:59 PM, Marc Kleine-Budde wrote:
> On 16.03.2026 18:49:50, Viken Dadhaniya wrote:
>> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
>> The controller is connected via SPI3 and uses a 40 MHz oscillator.
>>
>> The setup was tested with CAN-FD loopback and actual data transfer
>> using an external PCAN-USB FD adapter.
> 
> IIRC a board DT update should go independent of the driver update.

Sure, I will send the device tree changes separately.

> 
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>> v1 -> v2:
>>
>> - Drop the gpio-hog property.
>> - Add the microchip,xstbyen property to enable transceiver standby control.
>>
>> v1 Link: https://lore.kernel.org/all/20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com/
>> ---
>> ---
>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 22 ++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index e3d2f01881ae..245961722f84 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -44,6 +44,14 @@ chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>>
>> +	clocks {
>> +		mcp2518fd_osc: can-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <40000000>;
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +
>>  	dp-connector {
>>  		compatible = "dp-connector";
>>  		label = "DP";
>> @@ -1151,6 +1159,20 @@ platform {
>>  	};
>>  };
>>
>> +&spi3 {
>> +	status = "okay";
>> +
>> +	can@0 {
>> +		compatible = "microchip,mcp2518fd";
>> +		reg = <0>;
>> +		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
>> +		clocks = <&mcp2518fd_osc>;
>> +		spi-max-frequency = <10000000>;
> 
> Why do you limit the frequency to 10 MHz? Is this a HW limitation?
> 
> With a 40 MHz clock the chip supports up to 17 MHz (not 20 MHz due to
> the erratum).

The 10 MHz was overly conservative. Testing on this board shows:

  spi-max-frequency = <14000000>: actual SCK = 12.8 MHz  => OK
  spi-max-frequency = <15000000>: actual SCK = 15.0 MHz  => FAIL

Any SCK >= 14.7 MHz fails to initialize the MCP251xFD on this board,
so 12.8 MHz is the highest reliable SCK within the erratum limit of
17 MHz.

Will update to spi-max-frequency = <14000000>.

> 
> Marc
> 

