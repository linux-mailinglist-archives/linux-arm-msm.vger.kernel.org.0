Return-Path: <linux-arm-msm+bounces-109830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAx9JIueFWr9WgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:22:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C7C5D6552
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31395301CE1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7E73DF00F;
	Tue, 26 May 2026 13:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLPvP3SW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+29IWrF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690C43D16FD
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801156; cv=none; b=lg+kBMlDqFmy9uuAE/xOdkfrzsvD00QcwAT1BnPdf1MOKBwstbVZX9E4BQoYZfmeLCwaKI5WtzsFGzwLHS/Had6RWjvkU0V3vsiDsRGTKNGDGf5/DvrnmFhEbe3YbzkcEh9awoBDNiJNjCdnteZIiKhVJqa8/RBaOfpNwNrfVyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801156; c=relaxed/simple;
	bh=VhU5lAS4LQFsAitWBLKALDCa2KGV/IuRNjV2ufL1+Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1Ul2ZIgvIyeDw6akKJIYjPzQZMJn5sx45HpbeMwkNQSMtTtcfy4OegGeoaYRCRiBYC0aKlidy0rRPn6hXjjqkedOfrx/zCRarTKQwjsS0cnpk9M4vWYQMDIU1okBKKtJ8C++53Udk8FhxAIkrCfHngaBQRlIOZziDOMQKwQsjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLPvP3SW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+29IWrF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsiSC3797184
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOwFZ9kDwgjLO7jINUmrnJta/iSMqgv39m3ThSw3Gbw=; b=pLPvP3SWl7h1o8mM
	tOhqbnNrVM7bvHDo5Nxb4tCTfR/NEe6DsTx+sQiemiVOY7QT8yU+HLIl9L12Afnh
	TfN1i96lvlq5VThGo2TQmVgs3tgUWy5qxdVdys+xWhOZkrXQJp89dHeilGiLjNFt
	UfGjQkHiLw29M0/rthjODbl3CSffSQQ3BJ54YnFno6MFZ4IgUOO/G+BVFYMBtnM9
	0BmKjf8Zgb/fJyQoGazpgmhHk1vB2XRssXM1zTQcZHEjT9BFJFQZT93tdMEbIyTw
	EqfN9JARInHCTxtJ3sVTzW4uu7TMC8S54wIYPHEEBYjgAg9ClUiIMIsB7AH0F2+o
	b7fRnQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2mggw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:12:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so17065603241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801153; x=1780405953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOwFZ9kDwgjLO7jINUmrnJta/iSMqgv39m3ThSw3Gbw=;
        b=j+29IWrFNdDmAA0zInecWVQvuTOompcUepgdyqZ3zjOcx/fiWwigWhjDEG8SfvkRvu
         iB4bNntIAKI+vaXEyPZIZ9GMjwrAB0EDZOVFn4RXlhIdjz0Dp6llLQpNZFwrKHYoTIaw
         uWod0qtAim7nyU6BBR+dAtuVflMpwHshyMew9U4VJynXgqDzBK1BaJQOjLOgeOBZsGb+
         WrCYxlPKQRjNW9tuuabP7Sfum6fB8S6svURlEiqGY0HsOKPeVj8x/U3AeXawEZASZAFn
         Z8T9ZRqeoc1athDPKhVVvG1hUG5JICCnfcauY6Ghd/TAPxhHuYQ4UO6ILFasMvV1+TwJ
         Y5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801153; x=1780405953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOwFZ9kDwgjLO7jINUmrnJta/iSMqgv39m3ThSw3Gbw=;
        b=XHyVr35sf0HGqclLvDzblJlcSSlXBh61XEpyI8ERTzycc6qlgm+gtmDWwJhvFCfCJJ
         bj4RZkkquQXHR9yDoRCpCUs06BgtXKxuKLLwmeuLSL4wfupHOK6LbvwgfM/9Beo+uIiR
         jiSoto+Sm9gl4lKXPhsTds3h2HY6zeSnP4UlD0A7SiQEUH+lt0r+GgGof62B/iUi63ON
         kyv40tTxy3dnJ+jE8GDu5HyCmnGP1B210+mL7xZNzBu3+viOzkcUznHoj3HgvUwwhshD
         e13YFG/jJRmC+SRBjmnh/rXbHHYyCCxXLETgTY5hD0iYBqfL2+FnODnaS8ZQ3TSaaPAL
         XM8g==
X-Gm-Message-State: AOJu0YxYvRPDJlV+k2l8YhTNGa2mAFdwfWcZ7Bac8XyRHmrnRq0za8BQ
	TIQppksOjiKvgfEHeVzxrcHYFIl/0AyeASAaCvNmbLG7Igws75cAzpaVDKpRY4xxb3mguqHqEWX
	WDGFtSPfQHEO2WBu8QHJ9otxNdenYp0ID00RP7vsmRe+s4dNg9kB13ENj9sKNfpDhBJrh
X-Gm-Gg: Acq92OFcRBWs36FukDWlNGhjR1ziR77W9jrpqQs4XgZkhNBN779U6mgi1XAL06U2mou
	sAJKXt01UhFRSQKn9AqhA4Rp4tcWQvtMJwKT9b0dClVDv9fXNIIikghhUOE+rkDv5dvXJCP/bLD
	RzzWBTjCYUKpcjpYw60zMq6HwV5YOHr7GK4aA+B9QPsubEFqUqGMjdk38CJDhhKL+vVrnmdA6LD
	vCEeXnGaxUNrRqcf2ym3RJf2h8e8W5RKw5H60gbYiZnICZbruVBa2RGc3xRZyvApl09EO2OkQgX
	262UfZ0DYw/8seLx3+mRoh16tgKF1lU1rJ0BWE+HHlAkVBuRxWzlfystiWgMAfTrIivNPW88hja
	qzq2Tdky0Toa8aX26Us4OdM4PQmto2WXRifrgsfSywkQg35fNb2jEo5AazxK5G8Y5a838T/Bq5K
	73fgXWSA==
X-Received: by 2002:a05:6102:2926:b0:632:eef7:4b7f with SMTP id ada2fe7eead31-67c8d071383mr9240000137.22.1779801153478;
        Tue, 26 May 2026 06:12:33 -0700 (PDT)
X-Received: by 2002:a05:6102:2926:b0:632:eef7:4b7f with SMTP id ada2fe7eead31-67c8d071383mr9239948137.22.1779801152945;
        Tue, 26 May 2026 06:12:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1? ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49059cc9a91sm70577445e9.1.2026.05.26.06.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 06:12:32 -0700 (PDT)
Message-ID: <3584c4eb-1d9e-468f-bd30-9b5d91c865af@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:12:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ
 with ADC_TM auxiliary driver
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
 <20260526-gen3_adc_tm-v2-1-702fbac919ac@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260526-gen3_adc_tm-v2-1-702fbac919ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3V15LWTIR_xb-8J4_siV5eIEqTDBMDGd
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a159c42 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=IW_paQoX8PhNCENOWI4A:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 3V15LWTIR_xb-8J4_siV5eIEqTDBMDGd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfXybsgcyqNq7fd
 i4lVaLY87IV0k8P+tIGudEo0SaCKgu3NTt4f7dCrZ/EskAac6FFb3+G3J5kT5XYP2ljbe4FxMKP
 sfLLGEcYHasJADOP6Lu49ZjR8QfIobVDNSYFsr6MHnln49w+8PF9cs/nw2CBwkDMGQll9XAQJSp
 oY00FEpjg8TbYXQmlgAnbsAjXazv6naa0ybK5rqa2F1ZOkIeGyjdOZjM7AoSNy8nvrXRQKdt9EP
 Mz/WI6w9F6a6nF8fyUznq+T+yZbck7drSpHV7VSkhXA+LXvOOIgp7s8bDwBRBG/aiEIyy7Mxn8n
 CrO7IFo7auVYq3l+AdF4RpgDt5CgfFmeb8vAmG3gCI0xJVnCNV1Pw9a6Y34Kzd247ZmOaoGYIqS
 V7XT1bN6CW3EnJoxjs32FlXcqjH+JVmlRl5DjwABCFXLJn1fqM0bE9HGP63+9Ey9sAh1Pfl81R2
 kBhJ2aF+8EeJDDmdBcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109830-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96C7C5D6552
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Andy, Johnathan,

On 5/26/26 12:56, Jishnu Prakash wrote:
> The SDAM0 IRQ can be triggered for both EOC (end of conversion) events for
> immediate ADC reads done in this driver and for threshold violation events,
> based on ADC_TM thresholds configured from the auxiliary ADC_TM driver on
> TM channels on the first SDAM.
> 
> At present, this interrupt is handled only in the ISR in the main ADC driver.
> When the ISR is triggered for an ADC_TM event, this driver notifies the ADC_TM
> driver by calling a notifier callback exposed from it for this purpose.
> 
> To simplify the interrupt handling in both drivers, share the interrupt between
> the drivers. With this, ADC_TM interrupts on SDAM0 will be handled directly in
> the ADC_TM driver, so remove the notifier callback and all TM interrupt
> handling in the main ADC ISR.

Given the nature of these changes reworking how is handled the interrupt 
to share it properly with the TM sensor and the dependency of patch 2 on 
this one, I think it makes sense to merge these two patches through the 
thermal tree. Are you fine with that ?

