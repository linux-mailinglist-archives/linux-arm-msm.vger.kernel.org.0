Return-Path: <linux-arm-msm+bounces-118433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M9QZNRm9UWqeIAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 05:48:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9874037E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 05:48:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U39rOvfh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RTxkVKBt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118433-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118433-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0D57301FA5D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 03:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3CD1FD4;
	Sat, 11 Jul 2026 03:48:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040F578F2E
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 03:48:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783741718; cv=none; b=XttMZWJat17+yYLrZzocLMvIr5P7bPrIg7kgRqPph6NSRBSYW0SrMymZmh4I2sCckgid4brYjzuVatqxF+5zH8/OzWhRzkeByWl/1hE+dsnu4SPhVMB1eESrnzyjSML+N1Z0oA7JZ6YKBvfWCDUIaak+wB5EnOyT7Tf6zYulr7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783741718; c=relaxed/simple;
	bh=Ei1ZcO1wvdACPMG6sL/wGcRy+ehAtulyMYsMK34GiK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZr5ml4afwLOVVxe9/yFBRGEEhv+ta9UNC57wUrmvUxL/Fblt4vVazWlAfOwqveerth0L0TvYBTOyQYTaiH6FmYWc+gc3kT2VQESOEwMCVxmR1xFiyuBs24fzn+6pFyILid3m1NqqgNwy/8EgJmZ1y2ou3Lxxkm08oVAsAoMc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U39rOvfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTxkVKBt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B3mNdr2804492
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 03:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWp3h9IfShwVVthOqsYFNWjXLlqI8l6BavhKygxu5/o=; b=U39rOvfhQnVrppQC
	LgDFYjY6PRHuxRL7tkS1RfhyuqJ/jK5ZyWvyzkKHcqeHvIQQviS2NCPrGurQ4hlo
	wVsR8eLCg/rKguI59y175ymYubPvFEUzyfM1Y0jYKGv4lbd3HSPf0UCMMGhBNgoS
	DHlZJEoV5Sd7e+MpfZFsrG/3W+3hDJNZ31AiTpg+e61MG4nLgMTELK8KRdfWvrCg
	iPEiocigDg6hxwfu5L89LlQk6CJKcFW541WtmGAPZ99EVtNtKK0fk2jY1Xl5SXmy
	0ah8heVsCKuh7gNyg7QDj1Jx5LnMa4/U5ElSeYQAseXThYlw22P88t2J3VnCPu4v
	apGcDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe73g05f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 03:48:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso31757075ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 20:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783741715; x=1784346515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWp3h9IfShwVVthOqsYFNWjXLlqI8l6BavhKygxu5/o=;
        b=RTxkVKBtSBfQ++fdlc86ESdaFVi6g1V37oXQvLbDjG3Br6Hg9DY7hNcVGq4sC7o4OT
         t4LiiUS8PAsr2/x7j9q3PnTPh9pbjGg0XDGDnYeC04ZnLixjZHUD3JsVyc2Y3HpmS4/K
         sh2PUptXs0ldqh4TN2mH9Gn68b6ANksXngEFkRWqKQV/FLhuaYtTvB6B9B/8kVCpPQ4m
         G4nY/WAWAOYOj3r+1nQSmgjaCRT7jfFgvaYa+BycEC9WtYN8PwRDGRUzFFSIJfsvQiG4
         9n5gI7v3XnF+KbeG5rXXTVIRB8cD2W+2CXcAt95nKu3o6mL1a6iKUkNrk4LSkqdBlGza
         j8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783741715; x=1784346515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWp3h9IfShwVVthOqsYFNWjXLlqI8l6BavhKygxu5/o=;
        b=LCKC6KW8lxhfn76jqEDih7p547MQXgbMSWDGOPDjbkQ2itRv/puvEExOGz1r5JsSUb
         O1U7w5Tu0I6ogFvMprMkhN35xpxEHJTOye0SI9+8BVy4mu0WgdwJJh+HFmDfx6UcMiaB
         vnUlkC/w4sg1LaGiPzIaStiTV2BdC/9JTzK8tw+w7PmIMqFpxfhkF5X3gVQTVpanzBMd
         hIpI6kYbkttcUOR/90X1z6SAwsSa4a+WGDpvOqzjMDjF7W84sVqp08ah23hQWOAd1ZT8
         PAa67FePpKebDOGxiymWvdpt7T500TFdxBqJk5qHMWPJk2SyN2BmU31dwRRZHv2DqVs8
         m4QQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdgkGY0OWF61EqLdank5UIGKVvEn8JXVaqSEwCae70EdE2V/XTARW3JBueu22GYVmxHvhhbXEYT3LTx7aO@vger.kernel.org
X-Gm-Message-State: AOJu0YyS1zM33NIt/rtGOpKBSfuO2usS2x9CTwm+cfP4uC71Grcwouyt
	qXxms75z3EtX/zacCWRlRI10VbhD4m3atU9AAKoFunFlJPdKX5idE3sQfGWd1xGV1du4A/Bhddg
	yT80hgHInpVSuy4du/I99diBXD7P2Gm5nxirt6NAZns3NLoL637ppf1mEV7S9Co2hxFkHW6tgu5
	vU
X-Gm-Gg: AfdE7ck+ORHC5Msc3tE6h4yLnPVJGG1mN2pO7OZCOJyhiFJjc3W04D1IeSWk+itOG9T
	Mxf/Wx5U4Zi77dSI6WLk1ttyx6KCheacDieUlUbRQET5x3qXyBG3rLI9/w6tby/rriNiY+RB9hG
	FdIIZDfLgW6CIkHPuxvykltHbqaAO2pcAl1L/ahHWECwJ5OgCZDzAxJAW4sipGtYR8YQdDoPGEd
	P84Uz5RblWtuO9D1s9Ml7gA0o8JHrXQFOMMlN5XuklgPmK79waAcRahE3cRvrYbcuDnnpAZoOYQ
	per9S8CMjkhW7Iy4T6sFQPgXV89ah2l/88uRG5L4oghwWS3y1HzmfAIzGvL6lIP/GCvRpc37uAj
	az0han/cZ0845eGFRo4uvtmWHjOJYvm0RuTBoIOj+6F6KF5E=
X-Received: by 2002:a17:90b:3908:b0:384:a641:3fe with SMTP id 98e67ed59e1d1-38dc7737215mr1569960a91.21.1783741714678;
        Fri, 10 Jul 2026 20:48:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3908:b0:384:a641:3fe with SMTP id 98e67ed59e1d1-38dc7737215mr1569933a91.21.1783741714165;
        Fri, 10 Jul 2026 20:48:34 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.151.85])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm48880829eec.30.2026.07.10.20.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 20:48:33 -0700 (PDT)
Message-ID: <6b67c5e8-202e-42a1-a3fe-04a6d60e6083@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:18:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <aip3_fyE8tMtJZIW@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bDvthC93ytILxmvG9w9UQk2dGH1isoJA
X-Proofpoint-ORIG-GUID: bDvthC93ytILxmvG9w9UQk2dGH1isoJA
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a51bd13 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ziBI+Y3eO/H+UwYWWny9Hg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qCRXIqyDeEQ_VX0ZX7wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAzMiBTYWx0ZWRfX0GBbE923EAs/
 huEe/zavOJqQZ40bMjesCeQx0m233jXwYwQ0xcDYdLCLIlDzZsL+Kf1FLYF9SxpUVSxqOL+FMdj
 V0OJdmPReWA2sBtD+lCRt/xC5G+WMommh4JUftf7y7bzAIifnDInUEcYX7gB1ejZ/gl0Zfqq4Fn
 yFva9MyIZHT2f+21rSduLIp7YR0SPRYqs0u0PcOzsegJIjywh4IGvxv3ROAsOyMBCcy9dL6frVR
 y5Nl9m0oMStDtEu/HUG7cFJTVZO1dQaBg7Tc/CJjhWwMnMXQrjIiq30jTdYC7Olvu99PgLVC0i1
 I6k9cZS9s7CQjZ8nCk8oURMzoK6P+hPOVo7bgajgQExXdCT95Ke5pdpJd+AJRIwhN5IpDXmfd06
 aCN3WogMNQlfhzn2sTX0OuMySIV/pmNywRRxrjsrfiwBH77HMVN/8wAkXPV3ABT4ZQZwqCCArH9
 vRqowLYUVcXRJI8MMYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAzMiBTYWx0ZWRfXxyZb5KSJ/Mci
 zCxBCR4N90TmEk+e7eqFS2ujN3gQiY2NQhiOEZITUAgNKX/VmmREXLiKcacNzFF15PbLR4RrkXA
 WrnZ2qBuWJQSsjECMAY/JFYFZOY0sEs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110032
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118433-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29B9874037E


On 11-06-2026 02:25 pm, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
>> Add required nodes to enable the upstream BAM-DMUX WWAN driver on
>> Qualcomm Shikra SoC.
>>
>> The SMSM (Shared Memory State Machine) node provides the power
>> control signaling between the AP and modem for BAM-DMUX. The
>> BAM DMA controller node describes the A2 modem BAM hardware as a
>> standard DMA controller. The BAM-DMUX node references the DMA
>> channels and the pc/pc-ack interrupt lines from the modem SMSM
>> entry for power control signaling.
>>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> I'm quite surprised to see this 15+ years(?) old hardware block being
> brought back to a new SoC. Is Shikra not using IPA?
>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..3e59d5f6323c0d857f376316faa26c503e67f6bc 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -17,6 +17,23 @@ / {
>>   	#address-cells = <2>;
>>   	#size-cells = <2>;
>>   
>> +	bam_dmux: bam-dmux {
>> +		compatible = "qcom,bam-dmux";
>> +
>> +		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
>> +				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
>> +		interrupt-names = "pc",
>> +				  "pc-ack";
>> +
>> +		qcom,smem-states = <&apps_smsm 1>,
>> +				   <&apps_smsm 11>;
>> +		qcom,smem-state-names = "pc",
>> +					"pc-ack";
>> +
>> +		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
>> +		dma-names = "tx", "rx";
>> +	};
> This should be a child node of the modem remoteproc. See msm8916.dtsi
> for example.
>
>> +
>>   	clocks {
>>   		xo_board: xo-board {
>>   			compatible = "fixed-clock";
>> @@ -314,6 +331,28 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
>>   		};
>>   	};
>>   
>> +	smsm {
>> +		compatible = "qcom,smsm";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		mboxes = <0>, <&apcs_glb 13>;
>> +
>> +		apps_smsm: apps@0 {
>> +			reg = <0>;
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		modem_smsm: modem@1 {
>> +			reg = <1>;
>> +			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
>> +
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +
>>   	soc: soc@0 {
>>   		compatible = "simple-bus";
>>   
>> @@ -640,6 +679,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>>   			};
>>   		};
>>   
>> +		bam_dmux_dma: dma-controller@6044000 {
>> +			compatible = "qcom,bam-v1.7.0";
>> +			reg = <0x0 0x06044000 0x0 0x19000>;
>> +			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
>> +			#dma-cells = <1>;
>> +			qcom,ee = <0>;
>> +
>> +			num-channels = <6>;
>> +			qcom,num-ees = <1>;
>> +			qcom,powered-remotely;
>> +		};
>> +
>>   		sram@c11e000 {
>>   			compatible = "qcom,shikra-imem", "mmio-sram";
>>   			reg = <0x0 0x0c11e000 0x0 0x1000>;
>>
>> ---
>> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
>> change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
>> prerequisite-message-id: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
>> prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
>> prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
>> prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
>> prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
>> prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
>>
> If the DT isn't merged yet, you can also just squash that into the
> existing series that adds the modem remoteproc.
>
> Thanks,
> Stephan

Since the existing series is already in a stable state, the author
does not want to add any more patches to it. Therefore, I will
update the current patch with the DT changes you suggested and
submit a separate patch to incorporate the corresponding driver
changes.


Thanks,
Vishnu


