Return-Path: <linux-arm-msm+bounces-113462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K9NbKNWmMWpPowUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:41:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03259694FEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:41:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="D+fjcKc/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ECk65HiQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113462-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113462-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1271330120C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 19:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF413DFC88;
	Tue, 16 Jun 2026 19:41:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742F53CF943
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 19:41:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781638865; cv=none; b=XgPDS3b1dNddmVj0obRSzvKsvo5PTLGyebo3vVqZ3QRkBHWUS3x5yobsgkuwkFL6XyTv60HmGUQUf+d66fwZH02CJYenJhM8gva4Pgg4MindYa+BI2y7nSdm+3/KVFM+NwCICSdYgDkh2Yka5XSic434OgA0lQL2Q3f6Hm/sxwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781638865; c=relaxed/simple;
	bh=B2hR+bURmRb4PJ7gNBtKoGW9dYPPdu/+oY5IxF3NI1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwRQdrG0yoYli4GDqa9/Dj3NnK24vdEQkvMZqohIABt0a6msfimTVOnYmJJjqG0swEh72t9Jmu2IYKUK5LOnROPyLKC1dNgAJA138YZcJFRhqtrEQWFCND1M8SN/JsZFoac/Yxj0qz4Q0jF4EV1xr0XbyUgWQkk/mrrYnLsu+Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+fjcKc/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECk65HiQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIORwu397035
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 19:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJE6juJXrAOTycGAzZRvBROMXZe5ee5HGfivbSaWOLg=; b=D+fjcKc/HTBSpNvQ
	dn1aUCnv4/4gYrHonSYpW4J+P0YvhEQn3yQx8D1M82AKii2gRaVAlpVR2JyRlf2T
	N/oUzT6zI0gMfpksOXpFBZOZXbopaJHLxIdqU/PKlR0f6hO+BRN7mKxYCzsvdqxK
	qIKzdSyYcMHAeIdJlJhiWtz9jNH4hES27C6TCyDAFo8aJOe95tBqBvbPcEaFVRPc
	joEfQOrsbrMiRPwHoc1YbkNVaej8khLQQtUUEG65fnWtIGdhXSeDv3DQ9AGYtigk
	JTyhN8RrGDHmdme0BrELsch6GRrL8mmMw0D4q8RAM/sb7y16iLKT6L8LLlI+uHwj
	HVDExA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52v5je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 19:41:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-918622c3c7bso787048885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781638863; x=1782243663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJE6juJXrAOTycGAzZRvBROMXZe5ee5HGfivbSaWOLg=;
        b=ECk65HiQLyGtUiMAuLCGlsfxH2ofLPYm2CzXk8skFgV4sf2Mi4Wa+d2oO74LRyOK6k
         LNSFfBEv7pwm3QyKhDNDwB+pm+S3ThFHBBK8Z6CXtNho0s2gzWcwJ/jhWSUgX+LHSvXH
         AfKdop1ry8YtGuQJ5pFugaIIgtvNrSXTZJp9PD+IyYT8SzSKCsOE7ej2vFxl6I5FU81d
         g3u4bNlkCHl4wA8Sbntmphs8ZaAZkN4jibAzrZQUDH769lDGDVnlh15v7b1eH89JCW9J
         0xV86/kOiRwaMuoAdq2s4zlSPSoHnrUt09WznxD5dCsniuF77PDFdI5mPXFbGpcr/4wi
         1kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781638863; x=1782243663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJE6juJXrAOTycGAzZRvBROMXZe5ee5HGfivbSaWOLg=;
        b=iYGjtoHArom4NDpLW/OyKZZXdvDwaO44XyhLJwe7R/BEh2j7+oUygvfLeaxS9k0ykP
         DX21jLBsXTd0XS/1L7hLXp3KoWIyl73K8Xyzzxt28iHS2cwJ6D6czVMcQNuAOhJW2SkI
         5bIQT3LUDCKsAFHUFCI9yiGJ3CD2FeQ+EvreIIlcv4ov6MOmck5yab7lEA1m9c9ROMZy
         AQLQIxSxARdnvpZb0tvETFxf0USkpKEe4P2hkkCo9i9hSobxwF4wa7rNJw2t0T6J7YQV
         DoRvUSLisLpZgK4SWNxnCddVB614Jf6zM9L495lA3dGyHm/CWc3xCzVNeiLJRBQNq5RC
         NrAg==
X-Forwarded-Encrypted: i=1; AFNElJ9qIezf1HRMH3dsVDC/FNcaeoi/S1oIjxE+lG50vtIpD+tcs9VXRxRr5RA4pzKylzuSCcEUyoO23DxBhpOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzovynERfZ4lvcFK8YgVN3S87ZoISWFa7U0XzuPHpBdXbjiKDHj
	V9gPMP5bzmjvoAb9izkhEpwGEXtEvF5Fi1xqw4HwyXBuH8KjI0cQXOG2S0KA7+gSgY/Kj7U9U3Y
	iaHQGeYFYn9drN/Zst7roqf6/A1AafH6hoC2mJ5YKckCs9TQ5X+xlBNceM24kjG/m+Cj/
X-Gm-Gg: Acq92OF1Ips6kqGRatOHkLRfZ4d1xOw7LnNFnF3sNDMr1Sa3Y25POxOeBtBzUQvMBBk
	ASqxCQvNmnbbL050ScWctmHktKE94Qw9rppO0RNcJnISmEgXF9ONPCPJAINP0s09g4LHqszxoQC
	8XmAUBTOx3QhV3M9hExFhkAg0BkR51dwDIuK5O7n6M0S8D7oOMYt0JNwKN4nn51M6Ci2HtAqi6E
	OVPmuis7ROPbNbIN0AGPfHu0E08Ai06NXroi526tjRu8x1b0g4IAk/wPpt6csToPEMeLxErOHB8
	hI+k7cVfGWCDBGB2XpNc2rKujlattjGa+b8B0ex3AWG/pE4zBDupNJFCBqYJdWaz2Zj/95dTqBE
	CGnnrWDjawBax6PhBBVUmwbEVYKSJbIp8GerY6/U1cUqRyCcZ
X-Received: by 2002:a05:620a:258e:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-91d8eb91c37mr198743985a.54.1781638862575;
        Tue, 16 Jun 2026 12:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:258e:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-91d8eb91c37mr198736685a.54.1781638862055;
        Tue, 16 Jun 2026 12:41:02 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm101047675e9.11.2026.06.16.12.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:41:01 -0700 (PDT)
Message-ID: <b9423112-9b22-4128-a00e-6c60e5423db9@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 20:41:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock
 IDs
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwMCBTYWx0ZWRfX5fhoWpQ4meZT
 NVZl+oT0At5oNrsFqZVD/dOUp0Oc/MOvMo6Oo4POcJq2QOINl26nyiNcAu2guIGVubt0OVgTdMn
 duovuz7ZfC060rowxq8xqyh0+Zor/EI=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a31a6cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=yzDfqMvfRze0HbsUX0EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwMCBTYWx0ZWRfX52TZsLgR0SEz
 dsN6mmAYXfqVAsz1sSpsxfyAqGSdjsl4X52DQ/BY3B06Uma+Pe+ajiMTU6WF2JAZzeU2J0J/qFd
 LgXOK50uE5Ws0v26HReQNOb4FLaN5fYG3mp9NTOPTbBDKsRPkZyZG7Qycl+b16ZNhG8dkgqndME
 s/TkmYWYWpnByt9liBAX22pinx2ld6c/yY2Rh2nYdP1/hJGM0Lq9vvyek8V1Efz/Z/Y9Dsyxvgl
 y/2mNRif0WYLsyEvL+lcYD3++VeEEMeX0m2Er6dl8z/AfXXqfg61RAPnjv7joeFlLrWMEfrVdLW
 nEMvfUa9Vx5iskmyPdFYlLwtnXPfiJwVoMmMjhrJgEbEVfNmomS44ep/Im45xmWlrtxtLNtWxCE
 HkWczZ+XqW0wZg0vjvlzVx5NCFRXh9pUbTqVy62KvP4LjXEOh1iegRIvn2k1o58KjzKRKfB7yG3
 fnJ/Akj8/xOkpzp+SvA==
X-Proofpoint-ORIG-GUID: H_96z072wwT9geH7pth9QuMJmUdx4jEs
X-Proofpoint-GUID: H_96z072wwT9geH7pth9QuMJmUdx4jEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113462-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[thundersoft.com,gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:drake@endlessm.com,m:katsuhiro@katsuster.net,m:matteomartelli3@gmail.com,m:zhoubinbin@loongson.cn,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:rosh@debian.org,m:neil.armstrong@linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 03259694FEB



On 6/6/26 7:58 PM, Hongyang Zhao wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Add the missing MCLK ids for the q6prm DSP interface.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

please add your signed-off here

for more info take a look at
Documentation/process/submitting-patches.rst

> ---
>  sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
>  sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48ab00..51b131fa9531 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
>  	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
>  	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index a988a32086fe..6917e70bcb8a 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -52,6 +52,17 @@
>  /* Clock ID for QUINARY MI2S OSR CLK  */
>  #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
>  
> +/* Clock ID for MCLK1 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_1                                 0x300
> +/* Clock ID for MCLK2 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_2                                 0x301
> +/* Clock ID for MCLK3 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_3                                 0x302
> +/* Clock ID for MCLK4 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_4                                 0x303
> +/* Clock ID for MCLK5 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x304
> +
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
>  
> 


