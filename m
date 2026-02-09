Return-Path: <linux-arm-msm+bounces-92347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ixx7CF4bimnJHAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:37:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40240113197
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23DC4301588A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 17:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A12B3816E1;
	Mon,  9 Feb 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCi+EnSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBRWvG3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F15838171F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770658647; cv=none; b=bOEaNoYcmh+Hvp7Q6S43Dq2zWULhbNmcwXIHlVIhJ4qVbO6VDjean6ULF48zA8ApccAR3M0AsG/1HawtsqHxjp9qaAXARpoaDV4XocxHgslVWW42Dfve6itIcG5yqwVJh3vr7gW4Bsmg5Bption60b52WfMLCKEpntFBxkkiPVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770658647; c=relaxed/simple;
	bh=ruAb+YJnPiGKrRfp5hfmrNCENht6oLYwyWb0jNuqtBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmHxxf5MiAkHlzMYH/hbHzVqWKYSPceK69Dmha3QbmL1Gr5O9tJglJtbZNGsUUCOTqfic4nFojX8etCkshxzNC/PD+cI+gEf5KzQ4nJf1K3QTyx/EoteWFpMYY70v0dA9h8iHWmyyUPz8omlmqlk9gpeuYL58OlOdK1PWe15eMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCi+EnSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBRWvG3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619GpuPp1171945
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 17:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sD9YwJRjBNvLNizTHttUH+m/zd+VkP3M8QIGPSJul7Y=; b=HCi+EnShNxLBNRo3
	AsfKUZ4LPYmhr25kXLmnTtYgzVy/58ew78bMdpSWxt2vBCoQ0f8zULku4ESinljA
	xJ6HAavAYvdJ0kdaVYp7EPMUt7929U1ZghQ11i65a4NDyH3VwQTJtPH7gU2Wa3fO
	CP1xbZeTx4eCjSee9f+wYn1Igc82iytxNMj73WAow62kfr2V38Fm2F6M0UoI4o8z
	by7ALFIKE34ksMnprbQEtBr4iSqd1y3d17f5oQrQtF5AGMskqfb/FtsWhg/2eLUW
	8jNRD7/DHYz4/wLT6DCJio3/+JRTYvlNT7OXUwfwbB2lBK3j7DOoEI9KDIj/fM3e
	AEgAqw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7kftr57e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 17:37:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12721cd1a2aso3193187c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770658645; x=1771263445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sD9YwJRjBNvLNizTHttUH+m/zd+VkP3M8QIGPSJul7Y=;
        b=BBRWvG3QgYvUqJOKB0AOGT/MO1xM7+XjE5FZtIappgwsgzyV4NGhmBR1yh9VR9I0+j
         NqxPyK9d+BJAxyR+fR/RUQ1B2Op/O/Ey/AD0zoCOTzyHgECPUYgPrmA1SjxFe8/30Gze
         kjnGVV5saXjeXShYG2GYoFxq9cFMoOumWcQf1Yr7MlyZKKuCeQCHn3klhzEDdrO34fIV
         GYv+ZVwHb1yybPc63snsJg04isebXpI0PBizECFTKZtx0LW18Cvrtin23dKvNj4U8/aH
         1L38rj/GXv2wusj9f93M7dQNYGvfLJAEjzUlV8xfxhqx++HlT+yJhCMqoLow4m4c7DQ7
         TX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770658645; x=1771263445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sD9YwJRjBNvLNizTHttUH+m/zd+VkP3M8QIGPSJul7Y=;
        b=GBMW6R1GQq5jtQROeIhS2wrSSIZ1oRG5bCAnIb7G0KurYvqUwpe+M5snXyvGZ4O8au
         17E3DteWaYspr5w3ZAH5XTf750574/l6bArzDfGgP7dmpeDHM7PP9e84blpzrjNgkW8x
         CK4J/a2lhKM4zt7wQnyRgIObRvLgKfY+NXOtUR2Luo+cV90FgWB7uhyj55UfutC0LgnW
         FsNSXpz6KZybeAxjTYWd0dmUiWHIEUo79yc0U20JIah5oCANYTfMLySnWvpxiw33/nNu
         eVPN+TWcmXEfp9VvvJU0oSp3KqLUvS/FOo33DwdDPsbqYFwwnnWJ3EWcCXWcjaZ6oo1c
         sVXA==
X-Gm-Message-State: AOJu0Yxab1OE4/yV0QzbprQrUIcsbOcmOE4D2vNVy6RO1zyPfxtowhBu
	Sb6vTtHGDAs9izEp12dLFBs3YL27Ls9QowCrdsJIjcSN54sD90uXWOcRjdp9lFQRLt3hKcHqwv3
	ay5BBbqZyI0XGHtjPyJJKABZbCQsO477X9yGbufjFRY+xvcqGdOait9SuPC6VEh3EymMp
X-Gm-Gg: AZuq6aKzikwriRMyoWBmU/TJ5+ImXRFlUomG7K0BAW/Ym/hq9e3Jdfg9tsdIcxb4DOF
	dXU5GQOsecwnVB0lIAOH+lIkbMLQLZOyk9h0xLI7WN+P/Mm2v4nlkqer24K7N3NE2aT0JegJwAw
	O6tnm5SwAwH3t3J0enzgppWcvFMTWZrNkk3l51yddG7mp/+U9BfmCuub0T12qMGpLX0KckDyv8V
	g+amwDJppPlxOoGokLYZ40ha16odQtdpGyuP90+1jAzs16IOlwFGphg/Ov9vx08Maherg+yHdEa
	xXD9XTWNZ8VkvmCh3OLp/Zx29shQIzMPpN8S3ToGepGzBEDThBcu+oMsZNdforUnM+8tXi7QsPO
	P8ajtNlpIzo9Z7Gr+7TDGSHzYUPZmFOZ6CtlyiYY=
X-Received: by 2002:a05:7022:910:b0:123:3461:99be with SMTP id a92af1059eb24-127040153ffmr7020804c88.21.1770658644867;
        Mon, 09 Feb 2026 09:37:24 -0800 (PST)
X-Received: by 2002:a05:7022:910:b0:123:3461:99be with SMTP id a92af1059eb24-127040153ffmr7020799c88.21.1770658644269;
        Mon, 09 Feb 2026 09:37:24 -0800 (PST)
Received: from [192.168.1.133] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm10759398c88.8.2026.02.09.09.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 09:37:23 -0800 (PST)
Message-ID: <0fd2cff2-176e-419d-9e11-a98150266fee@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:37:22 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] usb: misc: qcom_eud: add host mode coordination
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-7-elson.serrao@oss.qualcomm.com>
 <f8169943-f986-4e9d-9d3b-a470e57f5e6a@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <f8169943-f986-4e9d-9d3b-a470e57f5e6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE0OCBTYWx0ZWRfX2/hDyczk8LAz
 tynfwiiIowJvxH1nu+cmaQU0OQwl5dJ/O0u/E5adSKf4JK4XIPh6ugpYmAVjhjA5mNTJgG5bcZ/
 m9SMsWzhJGPBztKTH5wKSV1zQGS+JjLehmYsA7HNapHscyo4/hJEAkaTk1MGFDdichyH/smeeB6
 IFBKhzvHBg5V3LFCT2mjgiGBR9HlM+rgYOSJMridNDS5ElKkZJrCiqU/VctKZMfKIzi+0gZU5Av
 XdTWic3hRt7sOs7ZIoLOQNFHwDZhNi+ws5TLaz092VHv4lLCtQcC1q6QmHKZoSfGlhDXoY+IWNZ
 WNl7WQqFwjZDeSEmerOWQiit16ENmBPCkmTN1DjZVv5eYziKy7ZFswPf3mJUitb//MIyAvpnCMy
 Vm6O9r/PYd7dHano825EgwvHzkchQ81rWTTsHm9cCmL6bmh5yk+506N9sorx5bbUHK7W/FR/+3L
 76lU7ea3+5ZaKgKNIvw==
X-Proofpoint-ORIG-GUID: m1WCjI4Kslck9kipOJXoEWH1-54uo_Qa
X-Authority-Analysis: v=2.4 cv=XfuEDY55 c=1 sm=1 tr=0 ts=698a1b55 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6af5tV_Bv1u5mitncRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: m1WCjI4Kslck9kipOJXoEWH1-54uo_Qa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92347-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40240113197
X-Rspamd-Action: no action



On 2/4/2026 5:29 AM, Konrad Dybcio wrote:
> On 1/27/26 12:38 AM, Elson Serrao wrote:
>> EUD functions by presenting itself as a USB device to the host PC for
>> debugging, making it incompatible in USB host mode configurations.
>> Enabling EUD, when in host mode can also cause the USB controller to
>> misbehave as the EUD hub can only have one upstream facing port.
> 
> Perhaps that's a silly idea, but would the device itself see
> the debug hub, being able to essentially self-debug in a way?
> 

This isn’t supported by the current hardware topology.

When EUD is enabled, it enumerates as a USB device to an external host via its
upstream-facing port, while the SoC USB controller sits behind the hub’s
downstream-facing port. As a result, the controller cannot enumerate or
interact with the EUD device itself, and host mode is mutually exclusive with
EUD debug on this path.

Thanks
Elson

> [...]
> 
>> @@ -162,32 +165,66 @@ static ssize_t enable_store(struct device *dev,
>>  		const char *buf, size_t count)
>>  {
>>  	struct eud_chip *chip = dev_get_drvdata(dev);
>> +	struct eud_path *path;
>>  	bool enable;
>>  	int ret;
>>  
>>  	if (kstrtobool(buf, &enable))
>>  		return -EINVAL;
>>  
>> +	mutex_lock(&chip->state_lock);
> 
> If you use guard(mutex)(&chip->state-lock), you can waive all these
> conditional mutex_unlock additions
> 
>> +
>>  	/* Skip operation if already in desired state */
>> -	if (chip->enabled == enable)
>> +	if (chip->enabled == enable) {
>> +		mutex_unlock(&chip->state_lock);
>>  		return count;
>> +	}
>> +
>> +	/*
>> +	 * Handle double-disable scenario: User is disabling EUD that was already
>> +	 * disabled due to host mode. Since the hardware is already disabled, we
>> +	 * only need to clear the host-disabled flag to prevent unwanted re-enabling
>> +	 * when exiting host mode. This respects the user's explicit disable request.
>> +	 */
>> +	if (!enable && chip->eud_disabled_for_host) {
>> +		chip->eud_disabled_for_host = false;
>> +		chip->enabled = false;
>> +		mutex_unlock(&chip->state_lock);
>> +		return count;
>> +	}
>>  
>>  	if (enable) {
>> +		/*
>> +		 * EUD functions by presenting itself as a USB device to the host PC for
>> +		 * debugging, making it incompatible in USB host mode configuration.
>> +		 * Prevent enabling EUD in this configuration to avoid hardware conflicts.
>> +		 */
>> +		path = chip->paths[chip->port_idx];
>> +		if (path && path->curr_role == USB_ROLE_HOST) {
>> +			dev_err(chip->dev, "EUD not usable in host mode configuration\n");
> 
> "in USB host mode"?
> 
> [...]
> 
>> +	/*
>> +	 * EUD must be disabled when USB operates in host mode. EUD functions by
>> +	 * presenting itself as a USB device to the host PC for debugging, making
>> +	 * it incompatible in host mode configuration.
> 			   ^ with
> 
> Otherwise the logic looks good, I think this may be desired default
> behavior (so that the user doesn't have to constantly keep re-enabling
> EUD)
> 
> Konrad

