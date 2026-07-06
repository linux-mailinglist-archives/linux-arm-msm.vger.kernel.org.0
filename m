Return-Path: <linux-arm-msm+bounces-116972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dL94B1f4S2pkdwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:47:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 727AE714A73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:47:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tu7MeVVr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bGbsV6ei;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116972-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116972-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 167E233E6009
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C772ECD3A;
	Mon,  6 Jul 2026 17:03:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8EB672
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 17:03:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357405; cv=none; b=uzk39lcN4JEsnZk6ikjijvqLuGmeiGgS0wqnqdbHrcXn8NIVB8iolvTa9eZl92yi+3YFirQl5ZXgN1yteGIWexw7kZtZU6J5yjua1O4VK7H38bIidnc/eeCqfxNjkm/VMNUTJ1xLOtYPr6WOZMiVmStCf1NHRuwc2OemDEj8xJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357405; c=relaxed/simple;
	bh=r8dr8IOcfwg+4aJ5OP62vUJ51fIC4sI6eTxM/L8hnk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMgtGF/Gn9HRFCuLsGiL+2HlrRNqqOI878fVY5BUA8jRzsZX8tQgEKFyVHEaey0LluUi+XlWrh0YhaVidRsAdbhvbkOxcdtCAlccZF59wotjIeWNhy/q+JhYnaiCwmx1HgoKT6UP9gBCJKjV8he6Nm77VJC2G48wEXttH41d6Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tu7MeVVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGbsV6ei; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FEwas825579
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 17:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TA5xENm3BPzH4HkN/s4HznkDy9RVKhTBp0zdzzCIVNs=; b=Tu7MeVVrAugFsCM/
	xPF7t41ayaUL90CDOqxaGRHihK9UHaRDskqS+JB9IsvA53cIQFCobztUcV8c+UQF
	2RRulqTD6p6UtXhStUX/Eh/f2MK35rrmgmf1mP7tQXZPRiFETNt9jnl9zEJQ4Qg8
	khIN9aWlMWrhnl5fsy7X1prLb/wInie7UFXty9UPQW5ct8D3n8dd81M8ZXf/TXTy
	C39T3Bm1z0sJaImrivoTO8rHCGCEhizPrbQDeFwRUk310NuGoi1KKhSRrwa8coft
	OPBlowCrW26XAWT+h+r17HeGcPhxJjIQRs/ymVIrS69sizm5U0wa0FQ3x9L4zh3/
	/6vt/w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8abr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 17:03:22 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb7c0ec591so3854891a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357402; x=1783962202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TA5xENm3BPzH4HkN/s4HznkDy9RVKhTBp0zdzzCIVNs=;
        b=bGbsV6ei+BTTFcEd5kkOIFQ6MsXHtx7dbLDdGnL/7d3fGwbfrA49zhNnlYbISxxzCQ
         IHnIJjOFR28NC3OWmX4BVLkqC9hr7bgAqaJWP3Akazs5ZUendAecx9vs6jJIqhSOC1HB
         6uvdQAd3VFz+42ZcS2fLi4PJ4jdlXuv0SIm8YmaIOOdfQkHiKui2GG1llDAUM5uU31IN
         ckNcxkNVISTUUKCYq/9WckJBwJ917tvS4x8GanDa85dynXoIBSRYnN0VQXJwsJlynieO
         awfru+2UU5zEVMAn4Xl1wInNl7Zh5ol0J01wHKBc+N2zMGQMA664bl0Ib9tD7Ancs02p
         2/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357402; x=1783962202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA5xENm3BPzH4HkN/s4HznkDy9RVKhTBp0zdzzCIVNs=;
        b=K4JdRxqUU3wLlqrdbAUvXpRcIuhi/As6mBY2UgdqwBUU92Ce1uvsk+3CNVmImR/JXV
         d+gXzO860yNt6G9WEGuET54/ZIxYfWd3UHfcyfmPcfAg17imUHbr6xfQHxCPW+NBspwk
         Fd9R/d0OCZfa1s9jzNQopWk3QWPNTccBom72MLNAwl+Q+r1zhEYd1HqUyzYZW8PAEgcM
         hEt2TOz9tJPnFruZl1BP7ggotDRVrCs0BQB/DvtReh+Bb8jXOQgp8SHe9aGGvNoe9jo6
         re6PJ11y51wPT5O5DhVs2pstvNc7mH0t2MkD65wF4H1NHcpa1ur/NPVaV4CP+7/01dsR
         HJQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9s9D7yD28npQ5mSB5sK8bREL7bPU00B7wmw8PnD+alETB3qXmYp9rKZRD92Egw6hRs0UhCT6sJlYCwUGx/@vger.kernel.org
X-Gm-Message-State: AOJu0YwF+grlh0GF/STvSezwNLUB0yaFFG3m6ILYlvZv5iHo45rTbmLK
	wJjHKgWB74vTQNLWY7mWT5FxOpTbyTIbFbD6Es4asujC/cLHQEf0cVUQzMhKLolysaWx+/AnmyW
	TDoG9+yCNM6NNska5NrJH2Xf54AJYViGIv7A1ycMmE9hiG2jnoE4zdJ+EY3TJXE7preCi
X-Gm-Gg: AfdE7cnyBPyTKSyAGJ6VmY/k/ANCPA9xifHACk3AwvP9DAVHybOHd7TJ1MkL/noR/Pj
	4AiyK7aUqA68uSRAfghgULpZf/on2UOvyWqRVSe5TAZwPes4cZoThIR3F6yEf8bqJ2K9NrH9A1H
	QJJcrnwuVvbb/t95LjwJHU8ROyzSFhUdHvovjqM9lhW5oeNz7fqx7T5mzxkxj5Chtjx/djaFphz
	nS6F3PQ8MB2SD0sr09SHeHqnUzAXt2F9IGQmCK0zTB7Mq1x4iphDyAmn6gHb0EUXFKWu2v0c8WS
	3yAUwQc5m7iG2WsS0z+3BqI1y7kZBfAEqwcoM/Lpt8trNv0iHLg9oUVhvRSKPWJZiGqNEF5FxuY
	9JyZq7i2ENeW2FBwn70w93n6ud8e2hzW1mII+OOS6rIg0Uwe39mnu5eU7U9i94HGWRkTgzTMhaQ
	==
X-Received: by 2002:a4a:e909:0:b0:6a1:9a9f:7be5 with SMTP id 006d021491bc7-6a35531fb57mr834941eaf.10.1783357401947;
        Mon, 06 Jul 2026 10:03:21 -0700 (PDT)
X-Received: by 2002:a4a:e909:0:b0:6a1:9a9f:7be5 with SMTP id 006d021491bc7-6a35531fb57mr834897eaf.10.1783357401401;
        Mon, 06 Jul 2026 10:03:21 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdabda3sm302109075e9.5.2026.07.06.10.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:03:19 -0700 (PDT)
Message-ID: <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:03:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MiBTYWx0ZWRfX1PZ7GJzE8RFF
 vJK1mnzwIasqyKO7GXCvWcXLvJjZf0b2HxVmf7QLIViWvaYibB8bdnBp+Yqr+zlNi3N9HpkF7as
 adXk+nHpGZs/c73x23p9+p8DGTBcKjw=
X-Proofpoint-GUID: SFCvbni3QElZTVJnGfPgJXj5jEWiKacS
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bdfda cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JlQGkihngbUv9gwkSFUA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: SFCvbni3QElZTVJnGfPgJXj5jEWiKacS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MiBTYWx0ZWRfXzLjLkoB9cElc
 f05MXh5WglykAJ90MfeEdi7ObVYZEIhTZUmJ4WxPLh6CASqoCg+wgGSZVJCcmAsSuSAn3Rn9Yg8
 Mctp0snYf9h7TWKH+Pmzk2rqXBkcPsPQAT5kxfvXsKjfSLIH67BpUDwlQw04dJWLFW0Y0hgLfSg
 eGCgmxH/7Mjvip3FZBc4YOfSBPrjllkeJnR+hF1SGHZBMRYnMuqNRw2rdysBXThVIeEfthTxQc7
 LpGSGPb93rZu8togK89ktAkxQYmGoEGyJTtaKvCFB/BIjRNr4DFJCi9/LcFyLXqzQDWTfPVnWBf
 Hxfw2QIUt+nUqc1DvZi41hZmmQx46w0XU+VLPnRadgLdEwxqb5AfEUyyq1TgYpsXuVzvjvLGviw
 toak1fzbh0xmlFhe/nlpGSJTX3lDR7X5ANq7xaD79/y58gX8Nw7ZKDqgC33TJDXLN5/JItawV7A
 3Il04muUil30+A0/f+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116972-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 727AE714A73

On 7/3/26 17:42, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
>>
>>
>> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
>>> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>>>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>>>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>>>
>>>> Qualcomm remote processors expose thermal mitigation endpoints
>>>> through QMI. These endpoints can be registered with the thermal
>>>> framework via the `#cooling-cells` property on the remoteproc node.
>>>>
>>>> The QMI TMD protocol identifies devices using string names (for example,
>>>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>>>> `#cooling-cells = <3>` requires numeric device id in the form:
>>>>
>>>>     <&phandle device_id min_state max_state>
>>>>
>>>> Define common TMD device index constants shared across currently
>>>> supported platforms. If a future target requires a different mapping,
>>>> additional target-specific constants can be introduced while preserving
>>>> existing DT ABI.
>>>>
>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> ---
>>>>    MAINTAINERS                                 |  1 +
>>>>    include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
>>>>    2 files changed, 21 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 57656ec0e9d5..ffd85fd1dd80 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -3410,6 +3410,7 @@ F:	drivers/firmware/qcom/
>>>>    F:	drivers/soc/qcom/
>>>>    F:	drivers/watchdog/gunyah_wdt.c
>>>>    F:	include/dt-bindings/arm/qcom,ids.h
>>>> +F:	include/dt-bindings/firmware/qcom,qmi-tmd.h
>>>>    F:	include/dt-bindings/firmware/qcom,scm.h
>>>>    F:	include/dt-bindings/soc/qcom*
>>>>    F:	include/linux/firmware/qcom
>>>> diff --git a/include/dt-bindings/firmware/qcom,qmi-tmd.h b/include/dt-bindings/firmware/qcom,qmi-tmd.h
>>>> new file mode 100644
>>>> index 000000000000..73efecef0f3c
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/firmware/qcom,qmi-tmd.h
>>>> @@ -0,0 +1,20 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>>>> +/*
>>>> + * Qualcomm QMI TMD (Thermal Mitigation Device) cooling device indices
>>>> + *
>>>> + * These indices are used in device tree cooling-maps to reference
>>>> + * specific TMD devices provided by remote processors via QMI.
>>>> + *
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +#ifndef _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
>>>> +#define _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
>>>> +
>>>> +/* CDSP thermal mitigation device id */
>>>> +#define QCOM_CDSP_TMD_CDSP_SW	0
>>>> +
>>>> +/* Modem thermal mitigation device id */
>>>> +#define QCOM_MODEM_TMD_PA	0
>>>> +#define QCOM_MODEM_TMD_MODEM	1
>>>
>>> What about the dozens other ones that Dmitry's laptop reports?Ri
>>>
>>
>> Thanks for the review, Konrad.
>>
>> We are only defining constants for the TMD devices that are actually used
>> for thermal mitigation on the platforms supported by this series.
> 
> Why are you using only those TMD devices?
> 
>> More constants can be added as needed.
> 
> Kodiak is one of the supported platforms.

What would be the benefit of having more than thirteen cooling devices 
declared in the thermal framework and having only a couple of them 
mapped in a thermal zone ?

I agree there are more TMDs but if they are unused for the moment, why 
do we need to add them ? Can we do that incrementally ?

> Running the same tool produces:
> 
> TMD service: instance=0x00 (modem) node=0 port=20
>    29 mitigation device(s):
>      [ 0] pa                       max_mitigation_level=3
>      [ 1] pa_fr1                   max_mitigation_level=3
>      [ 2] modem                    max_mitigation_level=3
>      [ 3] cpuv_restriction_cold    max_mitigation_level=1
>      [ 4] modem_current            max_mitigation_level=3
>      [ 5] vbatt_low                max_mitigation_level=3
>      [ 6] charge_state             max_mitigation_level=3
>      [ 7] modem_skin               max_mitigation_level=3
>      [ 8] modem_bw                 max_mitigation_level=5
>      [ 9] mmw0                     max_mitigation_level=3
>      [10] mmw1                     max_mitigation_level=3
>      [11] mmw2                     max_mitigation_level=3
>      [12] mmw3                     max_mitigation_level=3
>      [13] mmw_skin0                max_mitigation_level=3
>      [14] mmw_skin1                max_mitigation_level=3
>      [15] mmw_skin2                max_mitigation_level=3
>      [16] mmw_skin3                max_mitigation_level=3
>      [17] mmw_skin0_dsc            max_mitigation_level=15
>      [18] mmw_skin1_dsc            max_mitigation_level=15
>      [19] mmw_skin2_dsc            max_mitigation_level=15
>      [20] mmw_skin3_dsc            max_mitigation_level=15
>      [21] wlan                     max_mitigation_level=4
>      [22] wlan_bw                  max_mitigation_level=1
>      [23] modem_skin_lte_dsc       max_mitigation_level=255
>      [24] modem_skin_nr_dsc        max_mitigation_level=255
>      [25] pa_dsc                   max_mitigation_level=255
>      [26] pa_fr1_dsc               max_mitigation_level=255
>      [27] modem_bw_backoff         max_mitigation_level=255
>      [28] cpr_cold                 max_mitigation_level=3
> 
> TMD service: instance=0x01 (adsp) node=5 port=8
>    1 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x43 (cdsp) node=10 port=9
>    3 mitigation device(s):
>      [ 0] cpuv_restriction_cold    max_mitigation_level=1
>      [ 1] cdsp_hw                  max_mitigation_level=1
>      [ 2] cdsp_sw                  max_mitigation_level=7
> 
> 
>>
>>> https://lore.kernel.org/linux-arm-msm/4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k/
>>>
>>> Konrad
>>
> 


