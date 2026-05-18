Return-Path: <linux-arm-msm+bounces-108233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBUaNpo4C2qWEwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:04:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 541BA570901
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3237C3004592
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D5F480943;
	Mon, 18 May 2026 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDO9gHtX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmRwxocr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4253A3F20F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119580; cv=none; b=QYkCzLGAsWod4jnF2enRX8zAmeiyIofMVt8TpvRb+L01472XeDOfJl0VyQXSmFhue1eONSQ4hjzKl2Tv8r3VBi78zwGT2jskjaHNMMvVWbArqdtNr0j79iVm97naJFQJP/fw7GXtN7XcNl0ibJVwObmntgdMxKgIODJyatAQF/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119580; c=relaxed/simple;
	bh=kV7wA03t3xolDsZur1Y4hsiu+lY9W9WaJm5yxNmK5Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILKzWG/x4dThNtNW6l+iTPeu2v4QaQiwf6NiKx0gKRKxwBYuVOmF/zc0gQO3tOL9bPGSB7Z/r8BZj/pwfvvLdEs1JHbx6+cqo6B+fhdsORPqnb85eJrcmF9z8bmrKgLQfZaq1ruRAJvA1LQQLA3ybFWtzoQnbW8Vg22OWF/1PE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDO9gHtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmRwxocr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICLBDB1890385
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 15:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csR+wJpOLyPA3FCSrAWppws3sLkeJRysSK8h3qz+NAM=; b=KDO9gHtXEixHeMmG
	bumNm3ZDsHLjuZnYBvOTQTXPPSuc/28CGNelObvbJBJr+Nr7lU9YrXE2aeorvxjF
	oFQOu6D2NMTW5YPQ4AI62/WPQt9Cnhd8vgV7haghtzE7WLop9aGqNOwYucNBQ692
	R/f1zHpdLLedMNYgPZbdTtyuv+IVH+KMXwNNs3EMLvuyeyZbrEs2Kt5tagpOhZnt
	6WQtikJjsnrqeV6mRnt0epm6Ti49DpvVdTmFCR9pqQrMzBI32uLnwz06kXdajOV8
	inem7w10KbtVHwzOyew6jMMqJ58/jOq9MRBlVbCXU6Ojt3XApm0tJR7adKIztl0F
	ve5AtQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82pw0tpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 15:52:54 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13537722193so8584429c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779119574; x=1779724374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csR+wJpOLyPA3FCSrAWppws3sLkeJRysSK8h3qz+NAM=;
        b=CmRwxocryRWW3ckPbibELGcXqga3V4D3FBg4rTTdjnbC15FS7G+gLzJPBCfiy/skrI
         rlciFvyqI8m7gnKFNkbcPJ0yVudleQRecmYKixDusXVLvj8Wczi54G6OW1PX03+LFxBC
         eDc4Z24zF3QmxejfXHCBswe99TnrPSCKNmLdRehkaYspt3SIkm8FrGmg3y88bSWuEH+r
         Mdoo98dm1Py6myRRQ6sYdYVLCjc9EHdCUT92yXyxgIMcSBcF4sI/LJtJ4rBILsXEp9XN
         +UJkOH9YyCwB+dAdyDdrpBgAu/LNGNiHohIhrnO814GhSsgwuilbT3QbHR5vCOPJIpb8
         bY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119574; x=1779724374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csR+wJpOLyPA3FCSrAWppws3sLkeJRysSK8h3qz+NAM=;
        b=esLBXsfkCYQUU56kfgjXNnQu9EkqTwZb2c3AExCm78OrxlWHmQcfzlPT9A876vfeUA
         7CfiLm9SDn434Ow84MrLU0DRP6/qGP8JG9vdFdzUTjguVdlFpt2elSgljLWheeC2+IMK
         rJL6oYDxUWHbSBZCuL8Iiqb/YSTheXi/GSiL7+QBoaXY0raSdAUQzCYMux9ZlvZTz5Py
         leBfwx/24eNwxlLCczkjxNN+6R0r6F8yAAx6ydSubp1l6BpY0+DW9A3f4DwxbrLx80FY
         RXfKqspr4zIrzlNvXOtN4VdB2QdncB0+lBzhvd8+Gp4BRpjE6hfBx2uTIs7X6i2Gz16S
         oYZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zvkdK7sjetRBwzHa/EBWswH7e7K864Zxw8oMVM6KLoczEpd4kO8p5J3XnpJmmmx8PlI22dLY7wBs/UjQy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwxe268UKlHo5UlceAPYwfH09pP8mR3WomrVb4E7RBDDPCEj9g
	b2X2+V5SUgiF2ybWWXFhPyobZ7KXUJ0bTr4T/xHZiC10fYX22pk7BPYgymXx2CEyI3bkQkTVH7m
	2KfSq3YHCgzdY69NesHHCOCZc8gSRdyU/k6MLlN3KBdUzmVG04k4NVMjF/SalFk9mnIJN
X-Gm-Gg: Acq92OF1QWW9wHFeFCXVaM25MhZ5z1wTdcsju/0B1rI73jjC9C8aXeys6K5Yl8xklwo
	sIVy8wVG1xeb2JXvozvChvAEj8dnsfa9j+TtX3vIzxDAkZEqNcSsybogB/7zyfGZxj8c4OXgB1w
	/P64MeLt4BsMvJbfbKB1/gKzFvXNiLLYODQhZMlvQuajxWu37RaGsj3FS3sQuvC0rXMIKXo2rlQ
	aXtKuqMvjca0mJNanoLWtPVGBPk1nfoSi1g1hW6pZ8mXVy1u1g+pyX14ui8yl/lEC9dCDo1xebi
	XgFg9KCY3eTClw2n2EM8eRDwkWZp/vflZM3z7sskYsrFJ48rf74tsVW2TipwSmKSORf7rPqKvrZ
	vm9hs1mOVW+t6aOIWnoqAzGVsLkji0AnOy5bs5bXXE5MIpAD/ijqMTw==
X-Received: by 2002:a05:7022:ff42:b0:134:cbed:2b35 with SMTP id a92af1059eb24-13504517534mr7018456c88.18.1779119574039;
        Mon, 18 May 2026 08:52:54 -0700 (PDT)
X-Received: by 2002:a05:7022:ff42:b0:134:cbed:2b35 with SMTP id a92af1059eb24-13504517534mr7018436c88.18.1779119573402;
        Mon, 18 May 2026 08:52:53 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.110.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2352f2sm20239854c88.10.2026.05.18.08.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 08:52:53 -0700 (PDT)
Message-ID: <3b415d4c-7d09-4ddf-847b-b5a3d94aa5e3@oss.qualcomm.com>
Date: Mon, 18 May 2026 21:22:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260512-add-tracepoints-for-qcom-geni-spi-v2-0-3b184068ecf9@oss.qualcomm.com>
 <20260512-add-tracepoints-for-qcom-geni-spi-v2-1-3b184068ecf9@oss.qualcomm.com>
 <a713082f-e84e-403a-af1d-c6fa0c5d8613@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <a713082f-e84e-403a-af1d-c6fa0c5d8613@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6AAM0SF c=1 sm=1 tr=0 ts=6a0b35d6 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZQCjlrEJpO1bLG4YfcUt8w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=rWy7ofVw4T7H4fDcE_kA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE1NiBTYWx0ZWRfX+YIumcplFnqT
 ObR4DCPEklsDiPtzOMBYKjDagSRWOVNmOYBsKMJ1RzQSDd2LlH/1vy4f78FdeUNmx5R9vy/TE4v
 QBovI2Gf9DDBz/zm1tUbv34RPcuvNfXuzR+P8KwP1IkiiWqn5sd8IQ423Bp49NbEDvHJ7j8a1XT
 lpf9QYC8M0hZ+SsZCRw9J0tyciIJmVs5KZjldINO9/UelPr9Cf1ReOHAbOGatY8uuA6HVQVKwKR
 RYmNL+iudS3uV4HwgB+QncWgOwG4WpD/KzzxIwaMlyafOlEJp8UeOnjZ5GhYjaudGksGlx5l8MA
 wVR5wDjWSAJi0UQocJnl8PADF80YNKg51i7m5OZF5IvBe+bUbAj8Ku82u7UEnPKm3C0GJdGvQaf
 OuJIjRyiPjDAXxw27EZ5otq/HRRaXXEzZ2BtDO03EqPJL9TkFg5Q46PXxcRV+oBJ+nbh5Vq9z8E
 1r5Jn+e4lRLO+RF0nDQ==
X-Proofpoint-GUID: aCa1BdpJ2aq1VbN3TAQ7SArvxbWKnUYi
X-Proofpoint-ORIG-GUID: aCa1BdpJ2aq1VbN3TAQ7SArvxbWKnUYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180156
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108233-lists,linux-arm-msm=lfdr.de];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 541BA570901
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

On 18-05-2026 19:37, Mark Brown wrote:
> On Tue, May 12, 2026 at 11:42:52AM +0530, Praveen Talari wrote:
>
>> +TRACE_EVENT(geni_spi_fifo_params,
>> +	    TP_PROTO(struct device *dev, u8 cs, u32 mode,
>> +		     u32 mode_changed, bool cs_changed),
>> +	    TP_ARGS(dev, cs, mode, mode_changed, cs_changed),
>> +
>> +	    TP_STRUCT__entry(__string(name, dev_name(dev))
>> +			     __field(u8, cs)
>> +			     __field(u32, mode)
>> +			     __field(u32, mode_changed)
>> +			     __field(bool, cs_changed)
> These don't really seem like FIFO parameters?  I see that's the name of
> the function where we log this but they're more just generic bus status
> things.
I agree with you.

Can i use below name or any suggestions?

+TRACE_EVENT(geni_spi_setup_params

Thanks,

Praveen Talari


