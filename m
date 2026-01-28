Return-Path: <linux-arm-msm+bounces-90999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD7gJSH6eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:59:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAECA0F16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A88BE300F5C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1534C32C92B;
	Wed, 28 Jan 2026 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOXzYu3f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFoL5Ct7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D8F2F0C76
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601567; cv=none; b=W2XvXjeoLxkPODV+pqhokSOffI/l6sHua3Bk0KhovheLOcO/mm6XtNy0SHlKNPacJQ0byefX4sEjfBuGH+1tP5TodGIwGPSm7Zh/YtH2bn3DnrJ8ZvgSjeJe4OBK9XVDlprcBE10p+cCT0LCYVVjKNQuBVh6kuOXmT9EKXdVDvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601567; c=relaxed/simple;
	bh=SYQoPJ6JYYdYxM/Rn7ulmBHaIS5buLZU01Hgl5sJzU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdJtnczgxiLeMMEH8oDHpknNhzhmTelM23Q1+AqxVJFrU12t2YfmiPOfh+5UuBvby0IMxmbH3cnybhPeI4AP94lcJWY1s9iaHQ22kZTi7wjKZmfRYLMMZzYSEQV/dyqZz3KyDbfjzgcQTKQ1DxT4j3nqDI5eS9tmPhoTHTRzK/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOXzYu3f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFoL5Ct7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S928Hn3921044
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k8MvrjK1B4cEJ2EG2R4IRfjxLQHfQ2EXpGbKRiP2keE=; b=MOXzYu3fG2aPiAi2
	IyqIMmYKv6AD78/5usr63r61TZTTDF49r1uTuJliHU7vop1XrpsObuAbbGZOZPed
	ijV2KzbJM8W9BMC3K0pDxAEpoQz7GQWbOLGMv6WkhW0BVwAwaBu/oNkpEOsSWZuC
	rRuJkqiLGwOovucTlKU+PqJwY7pdjbwo3s25FM3S820d1CP6jC/9xGHqrroUqAV9
	jDO2FjvD0jAOhpcD1hlZZo/zBRhfF2LcMODHFAouXbBkBC6RQ0vcmvIx2+rqM3UF
	doxW5tGawQLGbaV/yEq+vcIU2m3cmVwmcXahzEPfwxRIRg+njF6YlgRAGUE5xnIp
	0tWMew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by211b7js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:59:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-890072346c2so16805916d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769601564; x=1770206364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8MvrjK1B4cEJ2EG2R4IRfjxLQHfQ2EXpGbKRiP2keE=;
        b=DFoL5Ct7oZP+YS1slYvn26y4fOCFzEvw9Awv28IYFEdNOHfumr9FMtBPuM7wSIJz/n
         IlDa+ctiLubx4Q8f2Nvm+DmKM30NxCtq1BuK57ip0j/rujqHZ+eLxlI+Gsw22Q748yZQ
         GK0aGMPbxPDzRLkSRY60Z0GpoSqADPjy3CdDQmsES/78ffC9EUd9NZsTLmiQ98Qw56aM
         rh+iGZuPTbGSuz7oXCILm4sfRe3UUoiO7gUl27X5Bnz3sGitDgAl/pwUL3o9WKP57NsM
         SwCF3eYJA7Dov+DnAQwm9CL75vmPl/8o/qrWYirjVRq/KPl/uUyNVx9nYlLDypQqn/g6
         KSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769601564; x=1770206364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8MvrjK1B4cEJ2EG2R4IRfjxLQHfQ2EXpGbKRiP2keE=;
        b=GCiQq7ieRcQasRM91v5gY2HloxzYvDcfsYiQWLjvgjgy6/MMc0dG6inB5Ii2j22wEK
         8NCpmjSpmkA2Syh84BE2hDu2dLJZy+XEBWyrs1CXBU+OQjqHATHBF2hY2hv6IyzYR1+o
         0AiX26dnS7y7+Vd4bhL1jFIJZ9M8wGu5qXj4Aa3hFdjbWCJKvprvGWScS6C59n5jHLYV
         eDck86TR5sR9zr/4zF3z2awUM1/oxRwAlBVLoz1/SMcPt83DB9vSKjf6QFbp6d2KrlyN
         tA0jvZXmVqUvoGf1Jbe5QrGp9w3N0ee6CUIKZ3+bsPAGvuhZZ7j2M9brvHVCMpqP+KIq
         hYUw==
X-Forwarded-Encrypted: i=1; AJvYcCV+/5STW2EmdHnTbRD2uWVMUFG5WylOP/gH55ZIO1XZ7UsrrPku0FawXY7EbPC9rngViRpE/jj+VzYmrA45@vger.kernel.org
X-Gm-Message-State: AOJu0YzsTvHRKvumPrSMq55wfLK7HUf5QFgSxPl+MKKL0B+B096rP5u0
	cc0DDTwWM3aY1r368Ff0ZBt6WE27JM41DCXQNODflqP/mv7hEIvmGFwxWOxE9IOgHxxj8uZjUZt
	Gg9n4LOk/UB7wA7xRR1gVgPM+6P0WXZKw9Tu0ASrkSNCnmrl1spbA6sXnrQp8cTB6rfFZ
X-Gm-Gg: AZuq6aK6awHxKSThW3bztCVVFgMLWKyhDRzIwnex0iZswDcILiNWkd5xLtYphGq1G2F
	c51mLZCe7fEeJtEFlcsyTQNGmxAJdDQzW2ZSehLAY0ufLBWk3Q4jf/1AjdxGzX+v4koIgCDxUye
	VZyCjfnliBV9ZkXagagDmiwHUG10nUW1j83Bj+mWoi8O+Pcsz2h+cqnBsIkeVUzcHHjEiART5R5
	4EqW0hi8La1Lq0Wf4ST5GEuVMaeSUsD5E0uXe1f2LT9Q0FsbH1VrI/UVH6P5w1jbDsGbCcYiGwu
	Vym7w9IFMOzFjS3U3puv9KeQ346G4P+PvveXCqXQAnhv421d2xUTEEJZfLY3o5eJquOu3s/nhYG
	MaqqtzHH4hJgC5DriEtlRXVeJDq5EL23gGxc+/A3izj0HvIzTs1iKO0h+abo7qWdq9iE=
X-Received: by 2002:a05:6214:4789:b0:890:7084:c6b4 with SMTP id 6a1803df08f44-894d78404a4mr12141276d6.3.1769601564111;
        Wed, 28 Jan 2026 03:59:24 -0800 (PST)
X-Received: by 2002:a05:6214:4789:b0:890:7084:c6b4 with SMTP id 6a1803df08f44-894d78404a4mr12140996d6.3.1769601563673;
        Wed, 28 Jan 2026 03:59:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4453094sm1407219a12.14.2026.01.28.03.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:59:21 -0800 (PST)
Message-ID: <169f7c2b-51cb-468d-a492-3b880ef1bd2e@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:59:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/3] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260114100043.1310164-1-tessolveupstream@gmail.com>
 <20260114100043.1310164-4-tessolveupstream@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260114100043.1310164-4-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NyBTYWx0ZWRfX5R/16XFnXnQP
 QjltjxgarvNMgS4DEtaPlLaH2qGnE8gaYeNKbckuZ6rccezbOTsH3ZoVg1XXc8qD7lT1YNxxTxz
 WEhQbFKlM1QTbrW85KDoAlxMmxOv6oSAcHJpkN6P2mUfa/Qkcb1lZRO5rRJ+b/gCttvWmUC+bKL
 nRsfyGBV9445c2Ae73qFrGN3k+SG3VzGdd9UZejkXr5nR7mre0tfNmXiExkUS6LuxDQtLqqJ/3Q
 BkJgCVThV5ozzT0fiNF4bM7vO7v5LcADD5zo7QUOB/qg/IBZalzTHhI5Bxd2cjqpGoNNq4JZHQi
 Ub2k5doTzHRyhEFgmXilGE2tLIhUxWRgByX1WCRaldpO5j7DRJm+SHYMtiInchI/gidEyi9nQ4D
 2G9C7dv8fa+puW2X+5YVoD0cUy77hEfKRzLYdWQmazWzISNWacPxFLczlCVsctcN1l6YPJDqy3W
 hkWbR3w4l28jxG9gqlA==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=6979fa1d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=6q-ckXwDscysDfU1ynwA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: UYwcbwZcQM_2LqAp2CejMW-u8Qfc8dqO
X-Proofpoint-ORIG-GUID: UYwcbwZcQM_2LqAp2CejMW-u8Qfc8dqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-90999-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDAECA0F16
X-Rspamd-Action: no action

On 1/14/26 11:00 AM, Sudarshan Shetty wrote:
> Add the device tree for the QCS615-based Talos EVK platform. The
> platform is composed of a System-on-Module following the SMARC
> standard, and a Carrier Board.
> 
> The Carrier Board supports several display configurations, HDMI and
> LVDS. Both configurations use the same base hardware, with the display
> selection controlled by a DIP switch.
> 
> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
> can describe the HDMI display configurations.
> 
> The initial device tree includes support for:
> - CPU and memory
> - UART
> - GPIOs
> - Regulators
> - PMIC
> - Early console
> - AT24MAC602 EEPROM
> - MCP2515 SPI to CAN
> - ADV7535 DSI-to-HDMI bridge
> - DisplayPort interface
> - SN65DSI84ZXHR DSI-to-LVDS bridge
> - Wi-Fi/BT
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---

[...]

> +	wifi_reg_en_pins_state: wifi-reg-en-pins-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		output-high;
> +		bias-pull-up;
> +	};
> +
> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio84";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-pull-down;
> +		output-low;
> +	};

The output-low/high properties should be unnecessary since the
drivers that requests the connected GPIOs control their state

otherwise, I think it's time to finally close in on this..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

