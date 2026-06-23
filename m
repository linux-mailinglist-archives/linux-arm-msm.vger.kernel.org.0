Return-Path: <linux-arm-msm+bounces-114130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ax/nIFRPOmop5wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:18:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA616B5B75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:18:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A4mS7UH9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FTrE63RZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114130-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114130-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78C89302AC12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27775348C71;
	Tue, 23 Jun 2026 09:14:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D130E0E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:14:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206044; cv=none; b=E6Aq4O6ZCuRFgelP4bSOJ/3ObsVc0C/aFLMyu3F0nUScBTFe4c6NNoZ6HONXIBdKQw38aqrUD4hTOoeCBJPQIIUQ9NxwBw1rgHPr2zmTGQltRniZjN5aTWv38z/X+kdMoz5Jm34fzKBmf4S6oM3bkIw0HuMgLH74H2frF9Zlo40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206044; c=relaxed/simple;
	bh=cQKjFSMQE+XeYyiWc+t1WYLYYKCy4O9bStOxNKaGyvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J29sJGUSVbnlTpUJCdKvasc52pQwztl8eSG0XwJ3oqQY3b7cUpk0FeZlhibwyNgGr98WIb2nXaUL3zDvCsQ2d4spFUoi76ySrsFdvk+upNOINz3mBeTASTWHhtwB9BYxLdr+11wiQePIzAMTtufxPlcEqdzaaOjYbmiHHrRwkAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4mS7UH9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTrE63RZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6dasq3631915
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24B/vWc0OHfdLJwPCzXWYKyFsXHSMgBg7admOM5KrsU=; b=A4mS7UH9cMUAFje6
	A0r8LqRcNxoAq7P0nSPp7j7UH+rGGDrFJ6XHXWLsqzS+YWI3HvZiMZwWJqIkrA4I
	AoUVIo+2n0Qks0KtLcggUx9+rPxok5ME4EiHCtEk3HdOU+C8Lmt1GEyZNUEVXqSy
	5/P5OL7cE/GhGd8rVLAzZcGLTrIMJHqoMFRJze7Ct6AVBGTG+ccWCdIKO3/dnITf
	ElE4W8bwg7Kjx8ZgIM3IgyM9+8LgzyJljD54Q1/TLJj/VZjuxKGw8ouZpleqURJX
	RQToHzvomedlloJJZ8sdKpIPQZpqSpH2pw0tm+apD02wy8kNm07e9Bwfe8Frpqd5
	4KmKbw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvrpaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:14:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453031c57cso7602891b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782206041; x=1782810841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24B/vWc0OHfdLJwPCzXWYKyFsXHSMgBg7admOM5KrsU=;
        b=FTrE63RZTZXpWOmNB5p4G7awUJHn2DDWLB1S2RIeAGtDG9m06+eVvMCWB5Oug6Way6
         jcOEjD8FYkuuvADjHK8nesOsEJTJ8lTLV1S8SFYwSlJeVcqe/bcn/Uzv71AyaP2eVAFK
         mEXpQ5KaBOD2xSwVp80BFdJUU/RXGsAJaN+cXddqIj7tvNx61Xn81E5m3HEXJNVFxcoI
         y3Tmw3h9vU7gGdYLdxbqVfizlxOF+UpLrgON2arpGA6fF7nnfLAJFfRTNXiEXAKia3cf
         yk271TUgK80oWLPZNfId95M4Snr7VagYFpo/Ao2cND78ECxYfMXY36HmVfBtaLJl6fBJ
         kV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782206041; x=1782810841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24B/vWc0OHfdLJwPCzXWYKyFsXHSMgBg7admOM5KrsU=;
        b=sPUDC0gk4oVb1nzpju4+u3wjRtrRO3K5+v2x4aep0TlFd1TO0aGf6yBr8jKRX84FiW
         pyIPitDxZyUfsoNTW3qAaIAzrtYN8Uuh61jEf0A24N2JpFXntvVJ263FVASxt/1/2aaY
         df0shvqw4mUXFH58RRUjiNhcXvR48zkqQISmchw9+7gujt2KQ7FTjcDnu2l2pE4PUQji
         R4uN50Wv+5KjW2aZ6ZU7cl24frtdF7hbvLcokx7jhHlNfGTSicA2JVxvpe9F7GykbVZA
         U5BktyiDWKinsz6bg1puh2B/kDj+ZlbNrpjEP4GtEuH7WDuiS26VFxMQuqX9GIlSuHTx
         HaMg==
X-Forwarded-Encrypted: i=1; AFNElJ9KKcrkisJUNnHGmrQL0+8/J1z16J5iGiwzFj3+WGyIbLJ3tsOSdHFzKhedDH1ACMZO4gAAohkB3J9jFDKA@vger.kernel.org
X-Gm-Message-State: AOJu0YzaB0YjzJaLs1yLuBz7vPS6YR08W3oqSkP0B0M5oLY9wIjD7VRG
	Oxyi40FI2+p2TnKbxEhcVOIg1zqanQwl3jTYMCgFJYwKZmvOXC2iLo9oZHHF3nH8/OhbHD3zrUS
	9PB39BOgWuNMQaoamFSFrx8z2sMxUuXM0hgBIQILLf52p0iX//vGBm9ccddszg/Et1id8
X-Gm-Gg: AfdE7cnXJPeyL99UtWt3PT4LcuL/hlMVx5sJKpqik24kEyts6Re4/DiEmSxb7KHiFE+
	TP8mjIubFBAzhn/4hEujeMPqZz781QJvlovbHfIE055m/b1OriQcPbUaQ4d+23hu62owO0ouHOc
	v/o9pUzqbqfwqlTY3XA8BNFBHiwqO/W8hKbnOKWisl5siNPuzBpbNDbCLZBchKXYMkaT86D4k2W
	aeWyTNEMUJlZ5rfm5QWc34jZkEJbLpzOX2TYuB2WolSpdHYIOT9I3/QPwESM3f+TJH6ZjbYWobk
	1rIDSsX1kf8hfIjBSUwU+P+k12H987qN7v/AzUyax12FClTBzS5JcAlHLI/V+sRus26k36BdHv0
	tQEdvy/hoTCZt5rUAj+2spAMqYFgGFF4NeemEYBM9lbeS
X-Received: by 2002:a05:6a00:14c4:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-845970ff8e1mr1946831b3a.46.1782206040636;
        Tue, 23 Jun 2026 02:14:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c4:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-845970ff8e1mr1946786b3a.46.1782206040140;
        Tue, 23 Jun 2026 02:14:00 -0700 (PDT)
Received: from [172.20.10.7] ([106.192.20.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed3bd8sm9568565b3a.56.2026.06.23.02.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:13:59 -0700 (PDT)
Message-ID: <81f10859-b7b9-4a37-a260-b77e36f0267a@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:43:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add Qualcomm WSA885X I2C codec
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
 <20260611-straight-refined-beetle-e2c934@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260611-straight-refined-beetle-e2c934@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a4e59 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=GtHFPjVsJ1z6j8OeKiQY1g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=YAGGjYiUH1UqZGlMsp0A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3NCBTYWx0ZWRfX0k8Dp/ZBYIpY
 atGKmJKSpSP0dEOenQy5tM1NudCkFycoSUx1waaaAPL/na8o1iQoFdgu4opE3pQgAzLOtsJthNt
 o8p0MivGuuFY1V6X9NGr43UqivYY+Sc=
X-Proofpoint-ORIG-GUID: VOv_0iIr_ih_UM6QYvGM7R5fnR72xuVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3NCBTYWx0ZWRfX9DFTBKdYUz2T
 HVVC3xFo2RwWJcbIpUU9p+JRiFOSvzgRVcYHXHM+ku8BKfmN+ePQtOuEMq63h0kOAs25/cWNl7H
 txDTj9XVvGHOqXGecLvWRRRMBJFoxA4QuUTrah+pkUUJ3QUaovOWVZt9QwTNi7T8XlWyDbA7IYo
 vRvQaQsRle+ts+nCbDK/JJ9yxNMIMdsLWjTX1gMksxQzctWHpDJiPqVEJvEW+O0gWH1vWg6G6GC
 HtXYSTx/x5Z+6baLqU5x4PgE1rkT9+jLnjsZoelWl19Xn7nW8pxZApEhPcRkS67THUC+FHrjQtq
 YTDsa9L9RBjh90VmY9sQArR1jRIsdM1ynspRyoJC5xMpkL3gpEL0awu4VoFEa1Ulc1QWYH8brZr
 4LkB+WqyMUgofqqniYm9eqMYVyX+3ba/q2n0/1GR+pDO7Rayvvjp9Wpd2PsiY2kBBBnbCs3WBmo
 TDbIcdTqh84Shp9QRUA==
X-Proofpoint-GUID: VOv_0iIr_ih_UM6QYvGM7R5fnR72xuVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-114130-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 1CA616B5B75


On 6/11/2026 3:09 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 10, 2026 at 09:27:08PM +0530, Prasad Kumpatla wrote:
>> +};
>> +
>> +static void wsa885x_gpio_set(struct wsa885x_i2c_priv *wsa885x, bool val)
>> +{
>> +	if (!wsa885x || !wsa885x->sd_n)
> How wsa885x can be NULL?
>
> This wrapper is pointless. Avoid creating abstraction layers over single
> call to standard kernel interfaces.

Hi Krzysztof,

Thanks for reviewing and comments on patch.

Agree. The NULL check is unnecessary, and the helper does not add any 
meaningful abstraction.

I'll remove the wrapper and use the GPIO API directly in the next revision.

>
>> +		return;
>> +
>> +	gpiod_set_value_cansleep(wsa885x->sd_n, val);
>> +}
>> +
> ...
>
>> +
>> +static void wsa885x_gpio_powerdown(void *data)
>> +{
>> +	struct wsa885x_i2c_priv *wsa885x = data;
>> +
>> +	if (!wsa885x)
>> +		return;
> How is this possible?

No, I will remove all the unnecessary checks in the next version of patch.


>
>> +
>> +	wsa885x_gpio_set(wsa885x, true);
>> +}
>> +
> ...
>
>> +	if (count > 0) {
>> +		if (count % 2) {
>> +			dev_err(dev, "%s: Invalid number of elements in %s (%d)\n",
>> +				__func__, init_table_prop, count);
>> +			return -EINVAL;
>> +		}
>> +		if (count > WSA885X_INIT_TABLE_MAX_ITEMS) {
>> +			dev_err(dev, "%s: %s has too many elements (%d > %u)\n",
>> +				__func__, init_table_prop, count,
>> +				WSA885X_INIT_TABLE_MAX_ITEMS);
>> +			return -EINVAL;
>> +		}
>> +		wsa885x->init_table_size = count;
>> +
>> +		wsa885x->init_table = devm_kcalloc(dev, wsa885x->init_table_size,
>> +						   sizeof(*wsa885x->init_table), GFP_KERNEL);
>> +		if (!wsa885x->init_table)
>> +			return -ENOMEM;
>> +
>> +		if (device_property_read_u32_array(dev, init_table_prop,
>> +						   wsa885x->init_table,
>> +						   wsa885x->init_table_size)) {
>> +			dev_err(dev, "%s: Failed to read %s\n",
>> +				__func__, init_table_prop);
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	ret = device_property_read_u32(dev, "qcom,battery-config",
>> +				       &wsa885x->batt_conf);
>> +	if (ret) {
>> +		wsa885x->batt_conf = WSA885X_BATT_1S;
>> +	} else if (wsa885x->batt_conf != WSA885X_BATT_1S &&
>> +		   wsa885x->batt_conf != WSA885X_BATT_2S) {
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Invalid battery config %u (expected 1S or 2S)\n",
>> +				     wsa885x->batt_conf);
>> +	}
>> +
>> +	for (i = 0; i < WSA885X_SUPPLIES_NUM; i++)
>> +		wsa885x->supplies[i].supply = wsa885x_supply_name[i];
>> +
>> +	ret = devm_regulator_bulk_get(dev, WSA885X_SUPPLIES_NUM, wsa885x->supplies);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
>> +
>> +	ret = regulator_bulk_enable(WSA885X_SUPPLIES_NUM, wsa885x->supplies);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to enable regulators\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, wsa885x_regulator_disable, wsa885x);
> Why you cannot simply use devm_regulator_get_enable?
Ack, will use.
>
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
>> +
>> +	wsa885x->sd_n = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(wsa885x->sd_n))
>> +		return dev_err_probe(dev, PTR_ERR(wsa885x->sd_n),
>> +							 "Shutdown Control GPIO not found\n");
> Messed/misaligned indentation.
Ack, Will update
>
>> +
>> +	wsa885x_gpio_set(wsa885x, false);
>> +
>> +	ret = devm_add_action_or_reset(dev, wsa885x_gpio_powerdown, wsa885x);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
>> +
>> +	i2c_set_clientdata(client, wsa885x);
>> +
>> +	wsa885x->intr_pin = devm_gpiod_get(dev, "interrupt", GPIOD_IN);
>> +	if (IS_ERR(wsa885x->intr_pin))
>> +		return dev_err_probe(dev, PTR_ERR(wsa885x->intr_pin),
>> +							 "Interrupt GPIO not found\n");
>> +
>> +	ret = wsa885x_register_irq(wsa885x);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "wsa885x irq registration failed\n");
>> +
>> +	ret = devm_snd_soc_register_component(dev, component_driver,
>> +					      wsa885x_i2c_dai,
>> +					      ARRAY_SIZE(wsa885x_i2c_dai));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Codec component registration failed\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id wsa885x_i2c_dt_match[] = {
>> +	{
>> +		.compatible = "qcom,wsa885x-i2c",
>> +	},
>> +	{}
>> +};
>> +
>> +static const struct i2c_device_id wsa885x_id_i2c[] = {
>> +	{"wsa885x_i2c", 0},
> Used named initializers.
Ack, Will update
>
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(i2c, wsa885x_id_i2c);
>> +MODULE_DEVICE_TABLE(of, wsa885x_i2c_dt_match);
> Don't come with own coding style. Each above goes IMMEDIATELY after the table.

Agreed. I'll place each MODULE_DEVICE_TABLE() immediately after its 
associated table to match the existing kernel style.

Thanks,

Prasad


>
> Best regards,
> Krzysztof
>

