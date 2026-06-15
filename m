Return-Path: <linux-arm-msm+bounces-113150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fLPIK1rNL2omGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:00:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30668539C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:00:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Dl5VIgMe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M84Uaqea;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113150-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113150-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B02CC3014C5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EA73A8734;
	Mon, 15 Jun 2026 10:00:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B229518EB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:00:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517648; cv=none; b=QOHAwFMjHQt2kn+hA6YtgVDR6fz37Xrdcm+zgScFFu5AVBYVXwY5h71WJ2AxhC1JLgE+yXR37TfOmcDptQKrg36sMR2cMcrd8hldA/qeavkXqKoO8KwpfA1ql8u77bAWIFg48GlpSm+Xn8aqgkKqUTivuK+8UyLaJxTWaRw9KKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517648; c=relaxed/simple;
	bh=DZlwvNFhOczSN15iV3ZhEhqrNk3Z2FnJ3q8czGO+XvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyNrryMMqV8vAt1q368BnGA8isfh2+TunjMP7Jx6E9Zm+W1c0ymrTQz1LZztCc05twp9ISYnSo1u+C8gs6OBVsWaDgaEWc8BLi7wu1H7a/itQyY20oY2eMFKwcCxfAEBZwyZY/22L7SQjSHBEZLsjziLdEi49LnDPECTvCyTVfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dl5VIgMe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M84Uaqea; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F9OQK5101506
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AIOFqjx25h1fmAVRqpund2U9aeEiVKZYsg80qRzviI=; b=Dl5VIgMe8zt0RvuC
	Mp0Aiu7J+1B8czhXacbZfIPdBD1gOUrDMvq+fzMZ1Yg5iCIu6KSYHPK037kAvZiO
	br3PCfXR57OHKQl+tcfqKQLHXKgmzyJOyyvCHnR3Zwe29JGM7oAe1lm+Z2G6cU3N
	4atN3XTZUW/V3qbmmy4Af4Cqk69uKyK+AcOiRTK+IbzHysKSo3S8TGKsYy1JEORU
	a2mGXvoNnujvKr/X5rwcW/ZoWwqkyzEB+SK6qtZz9rsgZKoyXVphwBz+g3AwlFoH
	eQG4/foq858KFROP4m8STRRHfZduyRvRVvBeXv9DvqnWX4Yw4744yxkzeLSU4BCk
	XGyOqw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter204cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:00:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2c98c1be2so24044165ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781517646; x=1782122446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AIOFqjx25h1fmAVRqpund2U9aeEiVKZYsg80qRzviI=;
        b=M84UaqeaCWTbVnxD1m8Wf3SCTlJ5ZpuidCa9DV8TPFe69GyFuV+6Mvqj6TNUjnlDE8
         kmYj1fukbH/93XieXVFS57gOoZI7reLe8R9dR74dFfUCXtNfyG1RAYgQfXsXvR+eZUNM
         B3/+63+o8WRS4NaY3f1hKX2sh5HcL9A3L9LWMbC36cMgZioa0RVaw0kujCeDedHAXEcj
         ibGvvRX/LyOLUamnrVFsk1MO7w4AvmCt3lMi/OGA9wCZD2b5bjxNoIo/a3jusN4MJHbr
         oDf6POsZshnS2v35VvQk8jZff8yPel2e95Be2EvoKqj+m6tdTePZyKdKd6NCklHmYCFl
         SQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517646; x=1782122446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AIOFqjx25h1fmAVRqpund2U9aeEiVKZYsg80qRzviI=;
        b=LmLydTzT47X2cxKbqSmpO/gs9VCnZNy9Mz0TKgrWBrxcwpGbDam93Bke0Ie5T6/Vws
         /TD1vEwCGAKc0wGN5KFJzJJ8/hHBHFDDMb2e973cHOtu1z/OPNM4aZCRN/hbKLYS8Z+3
         lEsht+FSK0/SAr2oFOCdA+FAHnF0WaNFTQPOdJsSvS0fNdsITVyZ9IJmzlod4yzDS0l4
         JEYXE7fGf0W3d2YUFolS0KI12pP7IpB4gHoI8zkIclDvx+9jTzcW38VM2ks6gOyD7hp4
         KQs455BhcHmubf+I19mxLmTmbxZSeJfJAXKQzNxELAcB+jXfjK/eJ60PlFTirY+x8AUH
         4bGw==
X-Forwarded-Encrypted: i=1; AFNElJ9knpqkuYrfuHZnOI+iMNqajpDmRZBaq+j0sSywh4taMFwQm9U5hp7pgtQ8C85mItRihx+dRIW64p4mV53j@vger.kernel.org
X-Gm-Message-State: AOJu0YwPyWR1PCXhK67rYB+P2eGHxFL56pqZmO4I5CXJpHz3km8RyS57
	MAn/K0cUbBuAjBAE28hE8mQApG92lBVLMcTFHM1M3cDBE4P/TfYQSQafO3brd/IIPE9N2k0aw5s
	sRWdIbgVbeh+TpgqXib10mYSdfgP/ZqNQnWvPlNJrgVOgNIFE+ITqWmoQ+GPPFOJf49WK
X-Gm-Gg: Acq92OFNAea2T1YoySs52Z2Q2Xj69c/aLOc5xyWrJAa9XBYcU7TUQ9aqmZgm2jEZ6M0
	PWSKZX7hw0YbMXjoiAtGJIw3J+3rQcveekchmpmOtnj4HIghAi3pSiLD/Koq20r9qnZEcZzQRko
	amN9/3+2Lam0AuHXVgPgA2nqn1mR50sA9kkx1j3y55ycp3AYkeLM9MZZZdDNB20NZAwa7+Qw17z
	0FPEnUx675DikUf+s4VhJajyjfGc42OsnhOGNIwn2l0qijGT4wAJ9pLyVq/k4dkvW8llqs9CGoT
	OXl3jGPTt7PU66GJgoe0VABT4fVhXBD3ZqlPiOcmES2Q/hwwvmFKk769FFyjX7Kh6QXZ0VqDne6
	JMVP2lgYVP9lD5TNsOYboOR3qVxsQVKUtfkg5wXODoE+558n9JRA19xUBvOpl
X-Received: by 2002:a17:902:e783:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c4134ec05dmr144412465ad.21.1781517645633;
        Mon, 15 Jun 2026 03:00:45 -0700 (PDT)
X-Received: by 2002:a17:902:e783:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c4134ec05dmr144411645ad.21.1781517644854;
        Mon, 15 Jun 2026 03:00:44 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ce89sm97213885ad.57.2026.06.15.03.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:00:44 -0700 (PDT)
Message-ID: <a99367df-7010-470d-bec7-0024b0bb63ad@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 15:30:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <e6567656-8745-4f07-9636-7779d32ccbcf@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <e6567656-8745-4f07-9636-7779d32ccbcf@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEwNSBTYWx0ZWRfX0k+aII4Lpiq6
 bi4cGGU+UKQx4Rt14cNrmXm2ffEM7Hkgv/Z54OEH0Q7lwpkmfuUaQdb0d/30oOFMe21pJkM9Ra+
 iaCCKH7LnZ4QvRcDDhsvXUbX4NjE+q4=
X-Proofpoint-GUID: d6C5HMepm55KFEiChGPphCzhyRKuhqAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEwNSBTYWx0ZWRfXxgev+33DHi3k
 HxUJatE1wOTZweqhbyxhLvW0CvvzvUhliiZhTLiwK1bOgsLSNtF+2HdPs48wxISxs9FSZh+pmR1
 sS+HMgyPUKDJmuN8UGYuvz8rdflPoVPBkxirJqBfl9plzKhOK5qP1dJyJpaWg6lUKhFTG87YBzA
 gnugMoLclyltahd9FWVyBJ6GBKlB7vrhYvLfMLpJeXf7d6dztJtI4FWipr2rbVgPd1bwrzxarsb
 /BJFL3cClPiH/0c80JAonBLE7kzVZpgOf2XHmeZZ/PsVSWNvmZt/7Hx1+fkU3a+dTLvtV2tAj1C
 HGUw5tXswIgvd7bqLNN1cWLlsLjrm8bl4if7jFbrs4B6+H2TGu9u2WTHiAuD+4gn6bD0/pybMwp
 vdxd3/2oE9ve2BfzVU/umLksgtcex4NCVpeOYfCXLDLwI8dUSKdyZaNZhj98aHrEdWV+56x6NK/
 HZzVE1YMMDpfzJmQvqg==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a2fcd4e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=2pCuibHp1YRUK2peGzAA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: d6C5HMepm55KFEiChGPphCzhyRKuhqAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-113150-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E30668539C



On 6/8/2026 5:31 PM, Mark Brown wrote:
> On Mon, Jun 08, 2026 at 08:00:10AM +0530, Mohammad Rafi Shaik wrote:
>> Add support for MI2S clock control within q6apm-lpass DAIs, including
>> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
> 
>> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
>> +{
>> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>> +	struct clk *sysclk;
>> +	bool *enabled;
> 
> Neither sysclk nor enabled are initialised by default...
> 
Yes right, Thanks for pointing out.

I will initialize sysclk and enabled to NULL and add an explicit error
return in the default case of the switch statement to handle invalid 
clock IDs safely.

>> +	switch (clk_id) {
> 
>> +	case LPAIF_MI2S_ECLK:
>> +		sysclk = dai_data->priv[dai->id].eclk;
>> +		enabled = &dai_data->priv[dai->id].eclk_enabled;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (sysclk) {
> 
> ...but we just fall through the switch statement if the clock ID is
> invalid and use the values.
> 

ack,

will fix this in next version.

>> +	for_each_child_of_node(dev->of_node, node) {
> 
>> +			if (IS_ERR(priv->mclk)) {
>> +				if (PTR_ERR(priv->mclk) == -EPROBE_DEFER)
>> +					return dev_err_probe(dev, PTR_ERR(priv->mclk),
>> +							     "unable to get mi2s mclk\n");
>> +				priv->mclk = NULL;
>> +			}
> 
> Do we need to drop any OF references on early return?


Yes, an of_node_put(node) is required before the early return to avoid a 
reference leak.

I will update the code to use for_each_child_of_node_scoped() to handle 
the cleanup automatically, or explicitly call of_node_put() before 
returning.

Thanks & Regards,
Rafi.


