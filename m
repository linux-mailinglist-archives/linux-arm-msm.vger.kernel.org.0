Return-Path: <linux-arm-msm+bounces-105387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGKzIOt982mF4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:06:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3B4A553B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A01B30815FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9831D4657F2;
	Thu, 30 Apr 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdZSDabQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgxBw6pA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4346E42189D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564845; cv=none; b=EpVxI+1cNjRrozGTWDdaVp3zWB0GoESrrLu5br0XctD5u7EJjn30ShLJZqZMm4u5BfibZzbmhggJxwOchcNDXlq9Tv4ZUNJSD+pORXynoeqiCsXG5P7ncijpE1wNcexpEKzZc9tZ2sO0zSryVxcC9JmNGk1o4hBRFZtn9n1NEvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564845; c=relaxed/simple;
	bh=xDFMbAQ+d50N8pgekZjLKMPaEp6MjAtl9P7svWAapA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4tJp7OwKg36MhRmi9kjsNP4++P3vgXj7QPWhbinimYCKsH6G26LAEZtg01/Bl3pfNVj4NZl5DAJiQhjHN2117HkjPtpZPnm7QaqwIS84/KKkfRC4dTsZ49d42HASRyDxLi7278CfiV5muC8yTh2eE0SToan0dNNihAfp1XhQus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdZSDabQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgxBw6pA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UFDeVQ2907480
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bo0XjYVyRoPqt/BSUYkXnHD+Dx9SB7n3/A/Bv4qMvAM=; b=JdZSDabQSVy2HSk4
	jA0PlWQN3BWTa+veoBngTSg7G7w6oleXdt3AQAmfWPbosTR8Ctqmgh9oNB/4QA9m
	KBu9L+O2El47HP8RN/Jszb48ukvPBdteA8c7fTS7lTNufK5RhE2mrK8zQPcMyVoX
	BO28UVgwsKqlh3c1f/j7277/Sa3INrJISGAAufVpNg2+XlgTILwxpgjMezO1UfFj
	qcZfZDKXVLwx44WGviebfOflDpBjW79wtlYyfxEZENj8k8ch3pgNBdAzTxLLBCP1
	8lV7DUxYwmGpzb6KIMIxVcIzqSBMpRO4XXUn5PY63CvYl/f6IBpNw66bPy4y3psq
	eQ8yZw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pfb090-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:00:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-605a1faa7f3so91687137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777564842; x=1778169642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bo0XjYVyRoPqt/BSUYkXnHD+Dx9SB7n3/A/Bv4qMvAM=;
        b=PgxBw6pAof6RrpMqtXXkAkP8F5Sz+ETfMszR7nHi6hXMUyYUmoLfIzciXQpsxj1fBo
         yUxiO//kkomz3V7ax/CuzL0T2eAbYgEbV6bAmDxFKYtju9/rTwCiCTEUIB/aU/xDxmRJ
         RmBgR1e39QYUfHiphoDmhC9AB86SQv4tJFCfNhByQYnzDr0OTfxYqx005Nnago2I5fVk
         aqjeze/MTBg10GlReK+dsLXPy6BuPpL1v+66Uq790KU1pDlVS6EPXNYKksYeaB2t8SG+
         ZdzCu/PmIs9z+pWZgdcwsOW7i83fZ5hCbWTE4BzJL5KbifJTdomGVIWh3qtolsdk60yT
         ic8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564842; x=1778169642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bo0XjYVyRoPqt/BSUYkXnHD+Dx9SB7n3/A/Bv4qMvAM=;
        b=nhqWRVpX/Fi7NCVFb1epOSl2ecqjEvRJLFaNv0ke9vYlx15PdfXmUKtLgQRXQnp1OJ
         wGExDvZSjoTll+SwBW4KMRSyf+mLPaFGJFBHSxOBSDeiuNWkyKtnas40Jd4/F90fqd4N
         RM8r4HeA60PJEHAIzym3GMGf3md67wZY+kyrjmAfuOGIRnzXjtaoRrOrE9W1nEJhTKQA
         JZ4GN2sUgxZgBkUD9HeMMjzVsDfFwUYCO64eF8IR7TnSfa0HaizG5aBYcbTmYo9ol0sr
         e9OzgECfbOuMes0w2VHkV6RsXInjJeK8h9vJsr4FSc3hrpPmfpZOWymgyzSoPfEKi6tg
         HCIw==
X-Forwarded-Encrypted: i=1; AFNElJ9v8szn3lwpSGsd4PcDAHU7aefTExfiUjwWVJ403JkPQjMpRFM/qoMFOsVpj5AhIje1juX1HoeAAlYL96on@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0WHh/rObiazw9+Qp4CtZ9vAQkFMAUf21Jn5qNIEsO6/sPP4lh
	upRWz5Q83r6cXydl423qoZG2wOOqgYvadWBL5G/VQifSyA9evQs/fnpWRtisIrDDKnRarGqaIFn
	ZUDMXwZuehntErTozR4hnLaCy0ko3Fl69NyAQR0xuCYdbSowT9NevwkJMFEu4axx8F8sE
X-Gm-Gg: AeBDieuXK6ezAAds5iMwMlVhryUPn7E30XBh2dwA3UYkg1w8pUlgXwVBto6ktMraQmu
	S7Sio6KaTwtTorqheDU4MC4zYVjnTG8kOlpWNS62csVMn55DmgOqPx0bWrGRcnsgdqoseMMSIRV
	sF10oug73Cfkg4dF4szrsGtS2w6Hi0VGuTtOrlbQ+eanJowBZOksoCb8+D8Z4zkdyqwGvrsMRsy
	JRqEa2SBtlJ5zTmabMZvCL0nesUJFSQekNbuICrEQD2hIfZXqf0speb9GfvaHlyAHvDCNhep3QU
	/vaHCEBtCwwKDPbdODOjblVg61BEHoa3AxtojRIGo5MZQOatdUFXjrvl+auaNEbnyCo3iRIiUlt
	HrPaREYZtf6azCs+iUfARD2JY5qtVbhC8A3QhpmC7gXvGJiKgdfuOyswZ+ET5Ly6pGIHoloP0I8
	ulUeXXcwdycuREWA==
X-Received: by 2002:a05:6102:3a09:b0:610:2c3b:7d99 with SMTP id ada2fe7eead31-62ad52ccd30mr926078137.6.1777564842129;
        Thu, 30 Apr 2026 09:00:42 -0700 (PDT)
X-Received: by 2002:a05:6102:3a09:b0:610:2c3b:7d99 with SMTP id ada2fe7eead31-62ad52ccd30mr926058137.6.1777564841500;
        Thu, 30 Apr 2026 09:00:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe69f6d641sm13842966b.13.2026.04.30.09.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 09:00:40 -0700 (PDT)
Message-ID: <c6c7c9a5-3051-4add-86a5-722fed426a78@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 18:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
 <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE2NiBTYWx0ZWRfX5laL9vV6Sj+i
 DTOFzfNfmkY1UK0uqBlkxVXjKvv6D53KDkjKKnJ4lJiRocLmhepHDLDhvC7vqFj/bHCCU+9JWTH
 6v56+/L6MrUVPCa4ekumA2hJbPvOy427ftMMBBusEKZTg0BF1dRcrX7kj0GDaNhGQRT+B5m1LGH
 aGR6io7ULatljIGVJtpDlmi+a72/A3kM07o4X6bC27qbgCTmOn564XW/GMz+tWu8hOQZvMUb7xJ
 VXAIYDmnNuDEyCrJZ4GS+S+X6KqK5qkAfynq5U2c6WepWB6e/LXbF0PZbAmxh6KrYfPIep446ln
 KttVjOkzZ70a0EZ4ByXnq4JTcmD/qotbAMetsbxFGe7T2u2aknKQOAdojZXBlqZDUYs971nnB2Q
 Mf6QV04WoyeE8TWNLc3pm96UFyK0GSayUCkCs/XRWbmRAATi8me/CvzQpJ8+F5jJJ6huOXXIVxM
 7Yq8KAxyl61t7awxksg==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f37cab cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bdp5ZZDYhz2jdzQ5nI4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: C6uLg0GOxnNl7kk6tFJZoqagrMjlWTUQ
X-Proofpoint-GUID: C6uLg0GOxnNl7kk6tFJZoqagrMjlWTUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300166
X-Rspamd-Queue-Id: D1A3B4A553B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-105387-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 7:44 AM, Priyansh Jain wrote:
> The existing TSENS temperature read logic polls the valid bit and then
> reads the temperature register. When temperature reads are triggered
> at very short intervals, this can race with hardware updates and allow
> the temperature field to be read while it is still being updated.
> 
> In this case, the valid bit may already be asserted even though the
> temperature value is transitioning, resulting in an incorrect reading.
> 
> Hardware programming guidelines require the temperature value and the
> valid bit to be sampled atomically in the same read transaction. A
> reading is considered valid only if the valid bit is observed set in
> that same sample.
> 
> The guidelines further specify that software should attempt the
> temperature read up to three times to account for transient update
> windows. If none of the attempts observe a valid sample, a stable
> fallback value must be returned: if the first and second samples match,
> the second value is returned; otherwise, if the second and third
> samples match, the third value is returned.
> 
> Update the TSENS sensor read logic to implement atomic sampling along
> with the recommended retry-and-compare fallback behavior. This removes
> the race window and ensures deterministic temperature values in
> accordance with hardware requirements.
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> ---

[...]

> +/**
> + * tsens_read_temp - To read temperature from hw in deciCelsius.

"Retrieve temperature readings from the hardware"

> + * @s:     Pointer to sensor struct
> + * @field: Index into regmap_field array pointing to temperature data
> + * @temp: temperature in deciCelsius to be read from hardware
> + *
> + * This function handles temperature returned in ADC code or deciCelsius
> + * depending on IP version.
> + *
> + * Return: 0 on success, a negative errno will be returned in error cases
> + */
> +static int tsens_read_temp(const struct tsens_sensor *s, int field, int *temp)
> +{
> +	struct tsens_priv *priv = s->priv;
> +	int temp_val[3] = {0};
> +	unsigned int status = 0;

This should be a u32 to reflect this is a known-size register

> +	int ret = 0, i;

You can declare the iterator inside the loop

'ret' doesn't need to be initialized, as it's immediately overwritten

> +	int max_retry = 3;

This should be a constant, perhaps a #defined one, reused for the size
of temp_val

> +
> +	ret = regmap_field_read(priv->rf[field], &status);
> +	if (ret)
> +		return ret;
> +
> +	/* VER_0 doesn't have VALID bit */
> +	if (tsens_version(priv) == VER_0) {
> +		*temp = status;
> +		return ret;

Ret will always be a '0' here (and in below cases)

> +	}
> +
> +	for (i = 0; i < max_retry; i++) {
> +		temp_val[i] = status & priv->feat->last_temp_mask;
> +		if (status & priv->feat->valid_bit) {
> +			*temp = temp_val[i];
> +			return ret;
> +		}
> +		ret = regmap_field_read(priv->rf[field], &status);

Please add a \n above for readability> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (temp_val[0] == temp_val[1])
> +		*temp = temp_val[1];
> +	else if (temp_val[1] == temp_val[2])
> +		*temp = temp_val[2];
> +	else
> +		return -EAGAIN;

This deserves a comment. Your description in the commit message is good,
but the reasoning behind this logic is not obvious and will get lost in
time, as 'git blame' will be bloated by cleanups

Konrad

