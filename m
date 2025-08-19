Return-Path: <linux-arm-msm+bounces-69687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF739B2BC5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F38A77B4A4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4FA42056;
	Tue, 19 Aug 2025 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcujlAtZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794531771E
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594000; cv=none; b=g74g8inhUZUXhTuHbSLStuj5u7mXaD0nF7AjWU2IpQ1f4KJFl13s4cqJoYqUmFZvsnAEUbm7vN6+oV9nRSbWyjnWoIdx/Ryxe5KpJFAtWUWOtL7AfC+fwADa7jDy9WELqZ91FjE2QlfM2a6dp4cwoQ281eFzW37p9kSeT/hduRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594000; c=relaxed/simple;
	bh=Hh4zqDBDykKthP0a9Qkz/GP1EmZNegjzXgRnEmjrO48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dqc9FRNAu3Aq8FktSeOYDjkD8Kg3DJJ+VgS0L1BfuhEiD1thdhq13GwBiEIyaEVuHHOKbF9fi2PIMpui/DiSkkcq2GlPH2xUscCGA9VXy82yd5XdEYvWfwdVQqhs9lGOuD67VYacR1GIz7iWkTTNb6hC1himMOvCMqaRV2zk5Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcujlAtZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J8pSNr012136
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 08:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lF3KpHtHPJ+/F44JD02kWVd9YNd/W+c8w7yaqsK6GM=; b=fcujlAtZZIud4xK7
	tkWFi46svrxqPkKZyRDOwaCNQgHXp4Ax+tW/LgmByuwsrHgcQSUEDc5L2A+YgHkg
	8PHv2XlWSR/pnsuBA84WKDxfOGSNaAn8PQjMy5bnG+t3AouWhbxRu+qTkFNg+gjJ
	MrUpDb34kzoiNieIZSPuWD9niz9zSjr4KdBeS6s2iQo8aW7lD3roAeqKco8Y33XX
	d3ilFt7H1UbunKRh8in1iNKxXgz6qetg1e53Hl433mvj6oBYBrSNALIDlNhs2VdQ
	rZgIV579W/QI14NZUm3DkgixzQB65CaWb5i0xrkHiE61/hOtLwakYGbaJBRwY00G
	Yg5jsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ufxta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 08:59:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109ab1e1dso261237891cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755593997; x=1756198797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8lF3KpHtHPJ+/F44JD02kWVd9YNd/W+c8w7yaqsK6GM=;
        b=rsk/4W13L8npw1lYAOXU9hvpjj5lbUZ4U/u/LYbrmUI+Zso2oi/gGk5KarCR97yzge
         9ynk/kD40/vWlbBYN79QOIleG6haxW4X1OGnuReimSd1Ro/t1moddi+IdMe5bHKhYc5x
         /9Z1DDjE3MQvsJA/J9IGLq4amYFpKDsxs+fg3tBsVLrZ25vEIpasVZuM2v5ywUzlBkq0
         bj3i0SR1XCs6eG2mtYA+i/Ywnuezm8dnnnJJlmwq93oL67I240cQfpJynRc44XExcnKm
         cjW0gta9NmrSiApi35zMSVWpUobhgqW+Seac+UR3U8doi+ZxDE/MQPMzdhN15I5gSX7n
         aomQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8PVPOEGg2SERAu8Hp0WebOoYoUahdbLJHP8TqzJ48tNJFQYIbtEbYcFknl6e9ATmETbthSgjNilY2oFWN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0G/5/+QVlV1fdtuhzcO/WJicYhqnM02zwzz0fYyRyJcIUivFC
	os++CBpJ6DZbL6ECyq7A+7MU+ItvuHhujVtlQQvYKlwca2+zm0YripbUdEzDTSArs3K5Mf6owj/
	pP+ciMRbPl0h6k9M9BCyLdjNXwirsRxm3FUSzwMaMqp7+Cw7q9HWTP8XhaqnXaNYhCp7b
X-Gm-Gg: ASbGncvgvCplFU/Y7X22SinN0xBEgUly5D65BQgQtNMi1vPk4xsZ9OYumoBV0wSlQp8
	DdW+LTFJVbwC6BJuNoe9p/0jIvwOwL0V/1hc1OEGPSpufGJfzjLYXxZ0SZyVCpu69Ivs9iazGlV
	dmPJ5PaJ/p5wVWgnmYtOcVOVA4gFzdqHd/f2DEBJaioF4D3QYVRew7hgHBrjlSbNkRgsJd1+CbS
	Ep2bqaO8/+XQOkwAPlAu4SJ/FngbDpY9tKUjem2/ADhFpICS7/h6uf0OaiEbUQCV/s2g9Pydxgf
	bjIbcpqwExbcPQnocFen7/EgDLxT5wUOW+n9wyDE8eHjBYN38PvFwKpctbGgxYNmg+Y=
X-Received: by 2002:a05:622a:1aa0:b0:4b2:8ac4:f07b with SMTP id d75a77b69052e-4b28ac4fa75mr3985241cf.77.1755593997484;
        Tue, 19 Aug 2025 01:59:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3agWwtfi7Ws7maBTenpB2FNs804ZV1OVplC/ref6pFQ7oAEtBb3ow4VsePNm+lOViOGFM3g==
X-Received: by 2002:a05:622a:1aa0:b0:4b2:8ac4:f07b with SMTP id d75a77b69052e-4b28ac4fa75mr3985031cf.77.1755593997037;
        Tue, 19 Aug 2025 01:59:57 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cd044sm216696595e9.9.2025.08.19.01.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 01:59:56 -0700 (PDT)
Message-ID: <e0907e8d-19fa-4ad8-ba81-cb9ef4e78a10@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 09:59:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] ASoC: qcom: audioreach: add support for static
 calibration
To: Mark Brown <broonie@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818125055.1226708-4-srinivas.kandagatla@oss.qualcomm.com>
 <6d137f07-d37a-431b-ab38-5f3087d9b3b7@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6d137f07-d37a-431b-ab38-5f3087d9b3b7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a43d0e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=BXQ6yQkEz0_uBQHTnLUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: JslV254ubcLu65Uec-XgZw4xyvTjk7e7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfXztDEE/WyYtkM
 ITotDyiKKzXAjChUOo0aS+NcEHbIXqddztJwba2yk/izKuoVd45uJyjA55Vr1vtj0Ypky48kHE1
 DLDpL9qS32vA/8ElvRGqxMLgPfBrcDMPJF61BkgUPK7tuMYJcj/H8DmlCsm7H/s0GcB9V7FwQTz
 CaRLy2NcEqo5qqXZ4qGeiAEOym2WcZoyx/3yYGmo3UGOhAlCHrZN5G2zqHSOmdcIUG++a4bDIIF
 8EmCc+oEtJnUP0elblxIERacx223CN0I9Q/psbwFirJzwGdL2X4DmsSa+/qpaXxBdlKuellCBTY
 jsOSgPma3yaXXs73RhCbrWyV0pNn4bGF9QnNlypcdOdJyIZQWTlwoHng0Dnn1EDWs9QTIjT5f9R
 A1WetpFS
X-Proofpoint-GUID: JslV254ubcLu65Uec-XgZw4xyvTjk7e7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

Thanks Mark,
On 8/18/25 7:52 PM, Mark Brown wrote:
> On Mon, Aug 18, 2025 at 01:50:52PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> This change adds support for static calibration data via ASoC topology
>> file. This static calibration data could include binary blob of data
>> that is required by specific module and is not part of topology tokens.
> 
> This breaks an x86 allmodconfig build:
I think
 #include <linux/types.h>
is missing, Will fix this in next version.

--srini

> 
> In file included from <built-in>:1:
> ./usr/include/sound/snd_ar_tokens.h:243:2: error: unknown type name '__le32'
>   243 |         __le32 size;    /* size in bytes of the array, including all elements */
>       |         ^
> ./usr/include/sound/snd_ar_tokens.h:244:2: error: unknown type name '__le32'
>   244 |         __le32 type;    /* SND_SOC_AR_TPLG_MODULE_CFG_TYPE */
>       |         ^
> ./usr/include/sound/snd_ar_tokens.h:245:2: error: unknown type name '__le32'
>   245 |         __le32 priv[2]; /* Private data for future expansion */
>       |         ^
> ./usr/include/sound/snd_ar_tokens.h:246:2: error: unknown type name '__le32'
>   246 |         __le32 data[0]; /* config data */
>       |         ^
> 4 errors generated.


