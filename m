Return-Path: <linux-arm-msm+bounces-85469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC16CC7338
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B61830161E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730D236BCDD;
	Wed, 17 Dec 2025 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGvzl5Pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODNYZgZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C8236BCD5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966780; cv=none; b=XweUOVXVjkdKgoLqiL++IcdYTvEKskWy19Fr563ZosPsiyNTjkmZZcVMFKgocGMEUdiqu01r4XAKtVtP1ji+NO/Ad0+h5PnEX3NJFweLzKKTXp7e2gu1yxKAy4m7BoqlHUWyXjxhwDK3ccSP/kx0WMCSHJoL0T5DwhnZmvKVj5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966780; c=relaxed/simple;
	bh=H2HUEdByelPd3DGstmAvY3EnGJYF61WOJiosxlTLWYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eR7hwzKCiAZX5nHbfxdeMEDRtZlwxBvx3gPwcg5bXey7MmLdBMiiojwtFAEgmxgIS/hzW/hu3ZaBDfheJtjua+w5h5OiP9EI/qttBvq2fdM52Fhw9L7VxWqETGqxTxlhz6A8FkT3hp7KNH2HJVAj9Oy5aXskqqqICdPpFcpFzOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGvzl5Pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODNYZgZL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F4sP1501195
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCJOsubFh2Ey6aMXlYEvjCZIV8RNFY+9SFMKoPpsEXk=; b=mGvzl5Pe70ngBgop
	p5iW6vAB74OWSRrPIYe8Y5ZAjuTpfSX0MJSxPALl0AqsRHg0OFNUqjeEU/fKNpTb
	3oCXPpNdlqm8IT0f7AHFtGKB2FM/ToxHC7D85wO5Z4i7XCTGAtI+G0P8a2Ii6dXb
	iQfL6yp5EXppT7sj/O1lXEk9hSaSZcSSBMAKfvp9RzjhYLoEnLg6s+r5QZj92YpU
	XdXLWXsDOK6If6Y3AZH5vC2enqt6I9vtbEllkeU5UuoACCabE3aSP8xl4xIxn09v
	8crFxtJur1y0gQevoEAtw3xKOmqQ3dlA3fHrjSSilHabARH2F1P52VqRLj40SN0B
	OsWtfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkese06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:19:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed83a05863so17340351cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765966776; x=1766571576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCJOsubFh2Ey6aMXlYEvjCZIV8RNFY+9SFMKoPpsEXk=;
        b=ODNYZgZLYOqQa+osk6q6+WdiYU8bAjNJYV8cRUImhDBE+KnC4FrK9jILSfA5ZwwNl+
         QU8Xsxn3fG0RyzkiKIWtSmmfgCYCc0YkI+QiF+o+y8R1Qq2GjRDBtyNx0wXmLXO5iUgQ
         kgQsl5Jqve2UmdaQ8z7VNXfZoC/EtbiJSLySg9wIv8NPOa9cW+Kez75LTHU4Hq3o5XJn
         obntNSnJqHVcOg+MDT9zxwXMuBIj10oHRww3LXMwHbW2Y75q/yxv55c1GzcfA+lneXLi
         XTc+WmGaFDlcrlLbh1Bp3SWcnp7uFNyQH2MFic2S11n7vSBd/MXcEdmM5lbLLMr/8aGl
         8fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966776; x=1766571576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCJOsubFh2Ey6aMXlYEvjCZIV8RNFY+9SFMKoPpsEXk=;
        b=oaDu4NvkjMlR7QMym+BbRnNKWw5+krez0nVqFigpsK4IDwSFCWVB0cClOulbeiss2A
         RHXoexneP8ZWCDWP/iX2bxfLonZGwpoFtlDZg7ysVbwA4bYbw/6MaU0tmCD2SeW61V+G
         PFyn6DamypDnvL8tczqJjIZX+VKeqlBQSM83lm5y2AfDiZcxEEVb7FH6ME1j44feS95v
         TumRqzWBsatLiJRBeWCTbBtXuU9XR86JiPNaPZOKf1q4DIIQU0ioTkp6EJxaGNWSbDgQ
         yrN/Zl4Sznew2BCC9JgN4crIdh7TI71fEjWa6gbBfT1GmPnMWjUteeeIz7TBs3H1aQrx
         l2QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcIPL1iSjzqjJpFSRts84AJ9oguvH7RiWdYeGKZYq0jB94dlUuCaLP9E3mZK7q2CLOl1SLwhFPitUW0xA7@vger.kernel.org
X-Gm-Message-State: AOJu0YwhcK6n261phN2RBF+LGGFMIowqbNtYRHOj5sur6CUGYRAI9SFc
	eigXySytqvZa0Ipjm5SI9M1/PGbJk24lsP4v3cbuURlO5lQT9hrjGtBiDm3ZNe/txdwEUbyGUNm
	QrKK0IbRRiyfIp/JRxZfXn9/3bC4h4oG8eSzgb6V/CjfJYb3mDOi2Ju4Q/iQxn8sL9eq2
X-Gm-Gg: AY/fxX6afRETJPgA3mXyFtyfUvyy/CySGNhEjuQ6zYp0hJVSAcflFUIFtlJyXg0DF/g
	EWBQ82hIuBnoOb27/4nLFmuYQf3GCZ2txizQ2AmAX1yOlTOyqkuTkjCotSLu6UHCB13WylSSpUS
	QIbUHaJEiwaKp/RbI/SNMzxJq2jRnQRdPFd4ze6SBJKr+fqw80k7XqMoj5bUE7/bR8PH+BvEN6J
	zP70F3puHv6zc97hw9Y4tYErEP4o1G3GGsnUrpDv28EFe9h4iPbFjTi0f0lc0Qt2XslBrTGjazZ
	8cgEwNsyuhc8dMOeXZ49qaDj68icRzG2GrrYC1IhimXHVk1AUWihOGOtJkNdfhT0e/5djI/QRu4
	GgSI/DNHcwMlqxhVoY1tCrNZgtno7uU55v8ZYeAL7KLWfRSCJQt9XW4RDJU0PKtCbow==
X-Received: by 2002:a05:622a:610:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f1d0655504mr185869051cf.11.1765966776138;
        Wed, 17 Dec 2025 02:19:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEytVbtSpVSo48ryKH+7IV6CssJie3BvYk1HDT9tqApjXflZtE74dSCo7/caeEOy1Qtb3mPoQ==
X-Received: by 2002:a05:622a:610:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f1d0655504mr185868721cf.11.1765966774969;
        Wed, 17 Dec 2025 02:19:34 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4ea67esm2065361a12.7.2025.12.17.02.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:19:34 -0800 (PST)
Message-ID: <b7ae5cac-5eef-4a3c-a1a8-01b1d1b796cb@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 11:19:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ASoC: qcom: audioreach: Add support for VI Sense
 module
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20251217094602.55117-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251217094602.55117-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217094602.55117-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MiBTYWx0ZWRfX8gmGJ3s5K95I
 2ohdmZfUyWqCxnqy03fsWKDKeVFPAImwVhlk2vqK4kb+zFndEhbflhJV4S74uOwb/LE/PWJyT8L
 A3nJz0eVP2WwKlfi8WrzRojCItSMViNHudyuzc1nJAKa8m0sdSd2HXji/JmhKiXUiG5AfYOEyIS
 +eEmKY40hS3a36xhRmufp1DGJ4mfdamxYgFMa+zqno7PpKiI228kw3QIol/oVBWHJyky42HRY3e
 FPKba2UYbmJIjI3VrtDBiGuaWpZjBwVNwxiPyKBUdrTd6DtphTmtOem4pSBxUErkNoxPid7ThX9
 AgcNSsPdwapD8Wb/EHkaqC299vjjnH0ekRu4solFakc1bQtK1niEbZTm8fNCH01xO4JUICIPJ0r
 dXdLw9kMf40AAs+XaC/kx3aagIut4g==
X-Proofpoint-GUID: _uxi00M_MDttigWc8OfmN3xWQXTyvzeQ
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=694283b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mAryq9t2eioX0dlTFTQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _uxi00M_MDttigWc8OfmN3xWQXTyvzeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170082

On 12/17/25 10:46 AM, Krzysztof Kozlowski wrote:
> VI Sense module in ADSP is responsible for feedback loop for measuring
> current and voltage of amplifiers, necessary for proper calibration of
> Speaker Protection algorightms.  Implement parsing
> MODULE_ID_SPEAKER_PROTECTION_VI from Audioreach topology and sending it
> as command to the ADSP.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

[...]

> +	cm_cfg->cfg.num_channels = num_channels * 2;
> +	for (i = 0; i < num_channels; i++) {
> +		/*
> +		 * Map speakers into Vsense and then Isense of each channel.
> +		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
> +		 * [1, 2, 3, 4]
> +		 */
> +		cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] - 1) * 2 + 1;
> +		cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;

Fly-by review, I don't really know - can't (channel_map[i] - 1) underflow?

Konrad

