Return-Path: <linux-arm-msm+bounces-113169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9Of3L1ztL2rHJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:17:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2826B68619F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:17:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R8asB7bj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a2gdFCCB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113169-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113169-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F7753080F8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF513E639E;
	Mon, 15 Jun 2026 12:12:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F63E5A27
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:12:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525548; cv=none; b=PWg38N+k/kAkbqPnLySoCSY7hwR8eQbVcpLQygQx7wlGWVFkvo2T7PM2UYrv5T1fTO9e9WI65Yqa5HwyEjRLSyR76PvvVyP9Hg4+n7z/GBiS/2y5aIdYHYKeE3LwcaHg7+micqL1vZbt7+I8uXqtUQBwBAoIA7LjjFpKDduuGBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525548; c=relaxed/simple;
	bh=+/7n2Rq1vOpj2Q8D7C+okfFDDw5hzhTjlFZrTWqulM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK49A3Gk6O26HieP6mLu0VkHN4YV/wtIrjpvW990DsFybTBvM4miWxbrFmKcUGlx+y3md757mwkVi53fOtxN0jzPjPZSsVA9l8GSZQEgWx8FXg3qYz+PULKL3yQ+QYsqi8JEqXYJhWRlHza9AzU9Uc4XzwGeDlOHGHMi2qj6l5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8asB7bj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2gdFCCB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAqn4i270645
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsKI60nJ3cRPMhSIVuZjFVkGFqOS9FdBjlayzytfzoQ=; b=R8asB7bjvkXSZB4M
	jmQagOrX7VJqHo3eIGNqgKXycJiY/adEKkIfYZhlQ2/1ZplgKUz0FZE3lSN4wEw9
	PDbiULJ2fUS6N4SOI6+ORmXphM5d21IIX8jrN6sOVdVSaN31E9kuemIkpQ3nFt3f
	HFCu3SiON9TfEV4RTrZXmCSDae3J5t91EGQYBn6apo7vg/trR1+ScdOpaxgxViXY
	G0Oz44rS83ab3DAcQQmleQPHLvIF+czEHmVQBDDaHzY6eMpZ43YOoROX+PZj7jO4
	K3rG0/AGYJMwvDtCpW8ZbSACUaBKiKZM/Oc06xDW8UOxF3Zoqjlal+fjbj80etXy
	pkv5uA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegurnwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:12:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so3680023a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525545; x=1782130345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BsKI60nJ3cRPMhSIVuZjFVkGFqOS9FdBjlayzytfzoQ=;
        b=a2gdFCCBe3fq1NT9F5bxp9TrGrcpFHQNaZk+li2T08VyGvyIEudjHpOkJTC6ZE5W6n
         /6HF0LZwDEwf/4tooeOln/kZq+gQ09FaP5Ne3MkipmFgJnuzukDCQLr3ZcPniZexVO5o
         11nlMmd2t9W8UUw5T9REsNpR0GX6z7Lnq7M9vPTVgk+GfKOlv3/fT0DolWJ/NlPwPUH/
         bC+tWjteDbLbKQP4B/h2ZGpzm1D3emMSDYwnmlZaj++x2wu3kCgZJArhr5LbTynBAYmd
         ohQxe3zfHF1bBdPcAc82GVnwM1V7Fj/V9yzQ2Cv7Rke+TbTjJZG9mFyY5sG0emOswsIm
         IRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525545; x=1782130345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsKI60nJ3cRPMhSIVuZjFVkGFqOS9FdBjlayzytfzoQ=;
        b=bKLCFQ5GlBvBtaD4XsZb/Fs/RF0VK4qs8y7j7w92tHdVrmwKZu2EwrsN/gIJDUax+I
         j05NjGdzuRoRMJw/0DPNd9Eui7DNS6lMCUAPmEopU8qoA0Qu4N33f3lh9+L7DnmMjpRV
         4L3bDrMgUB9zIWOAeLL7jC8ZFr8cbxc15QYnipxrk88T7YKsQ/KfV/dvcDQN8DZ23YMT
         Ol1I4IHtYyrdpenRNDnwpFysQ6uK0rmoWOZ1Xf0Erqaws9HICikQ+LRs+HE2Fzxceh6d
         D0r+Jaf7SY9SG2SQwV3SwkU3IKsOW7iN9CcSDlpAdcg4rhTNjSBTd2Ol+R7nNwXo9sZw
         MaIg==
X-Forwarded-Encrypted: i=1; AFNElJ/jMfO9TG/Rpi8giyE28g9khTST0+gEPKfY/EE5bouCiSm9RrbTZ5ncUNpDOguGqz9sFcxvzRjXkoTxiZhb@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmPb+5JEVxAxaGfIUIl/264dDShFwjiAFbF4CJ7YU2TDzmk3k
	dAS6lJx6BQX4W97PXJWcW0MiOE69JzVaI6PrzMtn7oNW0bNzQyMUPNLKFI0W31cWuPGgdZOU8VN
	uJVfsJKaR1JnyvJz0Bqfnh9x46H2V/rblBJxscWb0Nsd4qP2odhOj0GuaqKiw7iS0ufQ1LpXimI
	It
X-Gm-Gg: Acq92OHjvbYv9hADjJAtohLDPtD6fPfTJzUFgAVAuhxBlD+6qfOLHHKiaTtvZItcSPD
	6LJqt4iPiPG9YKuHUbZLY0L9rv2K0zQRztSWn7TgG2siqYu9oY7NUv/06HRiX8/2DSQ6/6ELlwO
	LU3gIKO89yAzwU1qctfny++eyZ6KV6u5txgfDoxupLkuiomje6RnIWjI1Rd/LR7unB8lWrOGnNL
	HU0WvIwLM1nX0Gt9xf0EQ5Y8tPsgcCZEx8PivYtuKLSady4tksmyn2zwDZqr1w1FEZ1JHoWqIWc
	pJFgO+d4dxXgZXKKe59BFggw68WcomESuAj97IcSMfYagU5SxCq2NkJgUCfISleTG9SqwtYo4hU
	xDzGkpuVzpZSPmwGA+if4WgtgqchYBgKIDhQiTRI1zEJitnhgTfyL
X-Received: by 2002:a17:90b:5205:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-37a1e0084cdmr9309408a91.5.1781525544112;
        Mon, 15 Jun 2026 05:12:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5205:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-37a1e0084cdmr9309346a91.5.1781525543224;
        Mon, 15 Jun 2026 05:12:23 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379c298c3d6sm8030534a91.0.2026.06.15.05.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:12:22 -0700 (PDT)
Message-ID: <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:42:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX29QD9WvShW83
 /LIJuoM8F2QyaleWyOyVPRXsn6pWW0UkkaXJ21dGgxlPGV88JFbcuaEZx34VVUA1vrtXz3b94ZE
 AImimzXqpHvFbxGCcWkcjAtlBBZE0m3zwemOunQpf2U7K7lcC1BTQXD3o+fkzVzYN3A1V5ohyp2
 +2K46sxUNK9SIPJcrX1v8y6N0dIYve6p7g9xU1bMQB3zrxe0jRVX9pXV8fnKAllpKp8eGV2znm+
 Fnfo7+p+MMc85hvGRW4U3C8vgVriiLbWqaAFxbbnOqrbKiLSPWoPnn8onEgq5c9x/g15zWKJiUk
 UvAWp3dyC+MqRWNDVFeNFBvf5aaLYFpa8pQiVeRW6MbW0WMP8gwPUhubHDR1a4Mq0QZKf+sQ/+4
 Rms2O491KCBVrbrPYecj3qcCtadH6v8jBWQAcMq5tEzTeaeYbGCJ1jGiKqF18njS4kKr4f0Gkgt
 mkZ8pAq0o232ryds9yQ==
X-Proofpoint-ORIG-GUID: -Y4eEfxiItheZXZz0yLMe7_sU0l9KCze
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a2fec29 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=DT6rP8QiwiOHS3JImSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfXy0/HuTwLukyT
 KOPklEMhpwy0Z6AyD4nmHEjPRT3L2byeuANbMYW+7fwkErqy1HyD28weozO4HpShPTXkz3tnD2D
 hZ55yLvjvPvKWlzvpnnHcnICaI/xkgI=
X-Proofpoint-GUID: -Y4eEfxiItheZXZz0yLMe7_sU0l9KCze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113169-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2826B68619F



On 6/15/2026 4:04 PM, Daniel Lezcano wrote:
> On 6/13/26 13:05, Gaurav Kohli wrote:
>>
>>
>> On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
>>> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>>>> Why? And where is this generic property defined? You cannot just
>>>>>>> sprinkle generic properties in random bindings.
>>>>>>>
>>>>>>
>>>>>> Ack, will add why part.
>>>>>> These names are matched with the thermal mitigation device 
>>>>>> identifiers
>>>>>> populated by remote firmware over QMI and define mitigation 
>>>>>> devices are
>>>>>> exposed as cooling devices.
>>>>>
>>>>> No, -names correspond to values passed via DT, not some remote 
>>>>> firmware.
>>>>> The remote firmware should give you interface which is explicit and 
>>>>> does
>>>>> not need such properties.
>>>>
>>>> thanks Krzysztof for review, We need tmd-names because of following 
>>>> reasons:
>>>>
>>>> Following Daniel's series [1], the thermal framework supports
>>>> mapping multiple cooling devices per remoteproc/device via indexed
>>>> cooling-cells.
>>>>
>>>> 1) The thermal framework's cooling-maps reference
>>>> cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
>>>> there's no way to know which index corresponds to which TMD, as 
>>>> firmware
>>>> may return tmd-names in any order.
>>>>
>>>> below are the changes post new thermal mapping changes:
>>>> DT: tmd-names = "cdsp_sw", "xyz";
>>>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>>>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
>>>
>>> names property are not to instruct drivers to register or not to
>>> register something.
>>>
>>> I don't understand the problem and explanation in the binding is
>>> basically non-existing.
>>>
>>> Remember that all lists and indices ARE FIXED, so driver knows exactly
>>> which index means what.
>>>
>>
>> thanks for review, shall i use driver data, which is basically pas 
>> data structure like below:
>>
>> static const struct qcom_pas_data {
>>      .crash_reason_smem = 601,
>>      .firmware_name = "cdsp.mdt",
>>      .tmd_names = (const char *[]){"xyz", NULL},
>>      .num_tmds = 1,
>>
>> Is something like above acceptable? and this will also help to filter 
>> tmd names as well?
> 
> 
> How the thermal framework will bind the thermal zone with the TMD ? 
> (node pointer, id) ?
> 

Hi Daniel,

thanks for review.

With id only, in this case instead of taking tmd names from device tree, 
qmi_tmd will take tmd name from pas_data(driver) and register with the 
cooling framework with id only. Please let us know if this looks fine.

thanks
Gaurav

