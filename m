Return-Path: <linux-arm-msm+bounces-78213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B8BF8B40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 22:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE74819C42F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 20:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5D627702E;
	Tue, 21 Oct 2025 20:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBV30zSU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB4F23EA9B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 20:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761078121; cv=none; b=u/N3qZSU8mM4IOw/icZhvI+Lu05J826AdFfoMrbnOP37Dpbj/RGbvlbY39MRp0WCX+BnCRKp2T3fA7vCjhgl3Vcq2tuCrojaHE7aQL6qiLwIPXca+mGpZz9KXl0mul22Tz6wMTqd+DGZPe7gFKNiZzhd3zrUWfUOe8U1ScYvG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761078121; c=relaxed/simple;
	bh=mEZXhTwzQ6zamixvVZuTYhTDWMuXgP7sdkSYV/2gvAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHNNJuEVK19kExyXGYuXBZtpa3+Pn67vlycrWxN9pQtco6WQytVaAJtCx7F/QgMZpChIDae/HTYvJqqMQ4WgJ5Jdan4oB5FMwbRUuz/7VdbxbmEPlYr5V3PO6p3W1H5ySBe/PZbHRQRvQgcKymrrmxjsYLmjRS8PJRzLFQ+3yRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBV30zSU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEUlj1029608
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 20:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eM8vsS1Fj2EgGJzHKnEsypCDm1Za4pqWpIHUVJFKPDk=; b=hBV30zSUakfpmIbx
	5/HlyYtqhz4d70KQwHniE9dhqdldMs7St0cNT5qfSmx2HxK13EMW5fCQxDSgD88Q
	OOdJGLedLJTLrD/8ROvetPWsHmS7HeV2S4Z8HRrfmE2ZHZlyO1KLbUQ3obTsssQe
	troOM3BUgjUE9n2KPS1duTW1OD1HjVG1xM+YCxUg7qLUH43SvreytEOiauMjrU6z
	NXg8eKiZwKhZAvsajQbOpSP2tTLz8jsoM21Xsa3xvePZJtSeCb6Jnjc1i0yto6t9
	i2Q6bZtmzR9XWvTXbzsc6LpfYcuvZkk5n+UBZp4FgJ2lHNTVFDhXl1Tx6zH83pbB
	3OWN5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wswnvg3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 20:21:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8b8db4a35so8703481cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 13:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761078117; x=1761682917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eM8vsS1Fj2EgGJzHKnEsypCDm1Za4pqWpIHUVJFKPDk=;
        b=O8gVUjD9SVrvU4Ym5J74+LEkOO8yrAL0t3WRrsXSVK2kTnb30swMdrPPUioczz9hvk
         ZCc5a325d/E3GQtu7KOkvA7DIkvFfpL22dwKTbWtZ+eh68l4+lDWWE21Oo9md6YXDRfa
         4mV1jHQJ6sLP+El6jVzNx4NCkP8Vcs4B/5jaB+N2UBpFFgfxcCdmzbZiyFMX2Bq2WwfF
         3jeDOCdXsfhQhYroRHT8F38YhZqnxk/e5nxi9vzOrPgq7rWmxLbKPtV02kWNHGwVeVkF
         B+kToRH96Kp4egpehXhpQfiY3SX0VM8mVOgCFo5+XUzQViYzoMri+io0suYvGnAboetu
         nPYg==
X-Forwarded-Encrypted: i=1; AJvYcCVfFryC69s/7jy+sxqSwnERZwWwHSn4m/CgrKfVaxQ+IDDHSPV7U9L5lvqinNmMrX6ytie34EY+kqHC26a0@vger.kernel.org
X-Gm-Message-State: AOJu0YwIUystEm0jBWUvrEOgn6tFoB1QejF8yGYPcHR7FMbvrVvpVDVQ
	ivhwXBK0nQTrM+wdhMxBqQqRb27cWpAnjL/lG9xQOgmL2FN6Dv5ePeYIxDJyDrmKVX2x26pfITl
	kvOrs/XqQfvBxg6uqXOXz23KIYbfeJmf0DrA9SCFZ+wk2Z4EXYpWd21cUpeTcUCwIQKuD
X-Gm-Gg: ASbGnctloP/dDXcLQtSec+ZyQUGNx0vFEUqWEtSWiVi0HRQwhmEhpHkqt3ZJMfbgvNb
	YDP1l7hI9Mof8g+2jWuowLeK6Fi9GWqXKQEKEnuq1iBioCDyPqg6scrxr+tH6x1rPmNRdHBFyKs
	jN/u2EBMKEDyR/U18gEvoMT6WsbiWnn2wiwcUZRm6mYXxN6sl+UI+jN0z3XjShER6mrn83hcnNp
	5wpnIKfI/a/UpXULbE9DMep0WmPeVIy1JhK/rtx3RPmIHhm7hLCFyGoc/3bg25tEUEbWzPxao4z
	datxw1JWHbykTgUmSC43/A4YwYy6vMtRwo2A4ddgeURr5oVdEb7w3vee8vk5UIiYcpXmK+NS1aV
	ebA91Bj18isztdUWPdCfXfUn6fQ==
X-Received: by 2002:ac8:5d56:0:b0:4e8:9a7d:90eb with SMTP id d75a77b69052e-4e8c1ab2c39mr118226701cf.38.1761078117494;
        Tue, 21 Oct 2025 13:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHixFYbK42Dq8yGad0erFEwbVWJxy1epl4bH074jwzXpoHLLA1EBx5YyFLZLspcYCGSJAFyvA==
X-Received: by 2002:ac8:5d56:0:b0:4e8:9a7d:90eb with SMTP id d75a77b69052e-4e8c1ab2c39mr118226431cf.38.1761078116987;
        Tue, 21 Oct 2025 13:21:56 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c56sm22096646f8f.18.2025.10.21.13.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 13:21:55 -0700 (PDT)
Message-ID: <29d6d523-020a-4eb3-80da-b83e7797d2a2@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 21:21:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] ASoC: qcom: x1e80100: Add sound card support for
 Dell XPS13 9345
To: Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251021-dell-xps13-9345-enable-audio-v1-0-6f3f6bbd977b@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251021-dell-xps13-9345-enable-audio-v1-0-6f3f6bbd977b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T44Bep8ydMEV5stb_XO5_nINR-V9ImyF
X-Authority-Analysis: v=2.4 cv=Maxhep/f c=1 sm=1 tr=0 ts=68f7eb66 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=5VL5Wpq1lgPoopIZa9UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: T44Bep8ydMEV5stb_XO5_nINR-V9ImyF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfXzxfVO0aepW7J
 3g6CbGXIH1lKlwhBAMjW2TbS5etSSLod+QNiGsTyAfEnMdCtAWVF26y6J+FQc5dpIqaL8tQ+kSu
 RF4TNMiC+jku2RrieCdx6xVb+S2MtqYb0Pb3Ms+o5y5QR6In+d6bdiaMMErj060gTYCRH9Omra8
 KIPQlZIhjqvTv82pxxEberm+lpEbrjNyUbSDjtkG1YHVnFwZi0AetzrhSE6tBHksCQdg7L8eBbP
 UBqRhEx79/Smb8xstzLiKoF5go/I2hyJtzgts/6e8J2hhg1SzXKq0FKDtBsorgNjSWwNSmxWmx5
 sq1+NVePfAtu2ojD2ZUEcr8YjHDrZg2OvNlTa3Q/W/ohute37ueA/NO5BUIoek0Fp9Bwu5VbCTo
 GD1ieG6aOiuwSJn5IsuSWs/KgV6xtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

Thanks Abel for sending this one out.

On 10/21/25 2:50 PM, Abel Vesa wrote:
> The current X Elite driver for sound card is mapping the channels from
> left to right on all X Elite based laptops. The Dell XPS13 9345 seems to
> be the one-off when the speakers/tweeters are mapped starting from right
> to left.
> 
> So rework the driver to bring in a swapped mapping for 4 channels setups
> and use it with the dedicated XPS13 compatible.
> 
> The devicetree node is included for proof-of-concept purposes.
> 
> Sending this as an RFC since it probably will need more discussion
> before settling on the approach on how to handle this properly on future
> devices.
We have few options here, one is the way that you have done, other way
is to add a mixer control in the machine driver which should allow xps
ucm to select correct channel map.
This should also allow bit more flexibility incase any other machines
have different wiring of tweeters and main speakers.

--srini

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (2):
>       ASoC: dt-bindings: qcom,sm8250: Add Dell XPS13 9345 sound card
>       ASoC: qcom: x1e80100: Add Dell XPS13 9345 support
> 
> Sibi Sankar (1):
>       arm64: dts: qcom: x1e80100-dell-xps13-9345: Add Left/Right Speakers and Tweeter
> 
>  .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
>  .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 139 +++++++++++++++++++++
>  sound/soc/qcom/x1e80100.c                          |  49 +++++++-
>  3 files changed, 184 insertions(+), 5 deletions(-)
> ---
> base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
> change-id: 20251021-dell-xps13-9345-enable-audio-799bfbd7e7ed
> 
> Best regards,


