Return-Path: <linux-arm-msm+bounces-110511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA0rAqIqHWozWAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:45:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E8B61A535
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 189BD3015485
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 06:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43AD376A12;
	Mon,  1 Jun 2026 06:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TU+FSvQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGldIADa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9E1376A0E
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 06:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296295; cv=none; b=doJOL8IQQ/RKFDGknQfgEVbxnkGA9I0gOREk0ZqLe1ZSq3cxqvUFIVba7H52DMFBV096AKSt29C2BEnHC1FpmqsJDS15V6wct1EYEvMFtyusWBjPiWc3F2COEljogQATvLdCQg4tC4KZBN06H7PB03ni05Hfw2Oo+RmY1x1RgmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296295; c=relaxed/simple;
	bh=y0ohOQUQsQjKkW0i8jiRyaPm1625hq/EctBCh4wmkjY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=igzJOM8lJTbqJhncKzb8I5ic9zwapOO/IFGhCBy6tXRmrnG3qbAjWhHTBOO0AUnj2ptn5wQwTykyGBKb19N/S2yHXVp+/k+eXcDOvmilxCtPAiaYRVWgbefuqgY8U/25sz2fcvimxmzSRCzYo5WAJno6ppJaCLdF+KHPt3/hQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TU+FSvQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGldIADa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VNSi3W3250706
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 06:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=; b=TU+FSvQT2edVb55V
	Nry2/mRwkVZb3mVd0wwM8wR76ihIHoEdAZZZN7x2kdQ+f3VcBMXjPd8oYnfluC0a
	1k75n5F1ZRr7SOwbZHq6JmarRR7aklFuF2kSLc/IheXzjgYP88mGh3cNgu8kpTWh
	5Y2vrsnXYghJOpKYstVqahN++SwR6/8WsESZaELCZKdGL0oqp9+rNdfBnIKGzmDt
	ObopznuiINieCCxjglsyKI56RT3hRYPqapeYDL2QKwuOj/6Y2ChquD2/QKeRWOPz
	FsZKQer/yYRTOULRB5xkWUT2dU22XXio/Y2y4ekSrqqzD0a6PBB3Hxzgjg92weoX
	yiVOjQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98e204-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 06:44:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c854c4b740cso3300218a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 23:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780296292; x=1780901092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=;
        b=TGldIADa+ckhM+Ta7BIKVHJBunq0m1GK8WKOh2elvXQMZj3PatDVkS96Y25+0BffOo
         zLLAy2MPajAdHLo2BW34o7/vjyjfQIaGKG2ICFIUD0McvCra0feptcqc90cNqXzSO6mp
         nFGptfg4pNruXJs6msMWASfDH3PkauRNJ/G9OnNkT31QLB0qkE1fxzNhKXCpss2IFhq6
         6VQQDfPw1L8UCUB8lP6FKWvZ7TzjXtHOr+ZA1MFg2LpDrxb+2X4cywhFA2rako06IZBM
         faJfEPhg8TsmhvkVyGkYloFFNZ0vM/vSgczJsc0BA4xp/Nk34w2A9ETxEaMbnckTcbWI
         dotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296292; x=1780901092;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=;
        b=HtWuSspwwm9WjILQXHFTSjhBvaXcf3dCtpDxZkQaaUll0LpiAwSZpD2bCGgGBWC7mc
         MF3RIAQ0WyT3I9NjzXmL42U4Sz68NNcAcfX+VCzzIm4LNd8f/sJEjM+2hpNztShVp7kY
         3zfDoRATGlSDtniYii6LJ8rcuTxrVp78ubhwZG3TmF9YS/DWbX7Mjy+oDrO71enYim9S
         4ckOwzk50A5hO9lrir1MtaFErO+PQpUkjSKOoBZMMykcfG3RUjahS8pd0bmghdcsVt+P
         WrxzY+KvkoMu0HOpHHgoD1w0YROKu46X+nlT7UF2TQs4wC6PSH7XEjyuSOsagauz/FFv
         /Mow==
X-Forwarded-Encrypted: i=1; AFNElJ8e9FSq83B2a3pQliaai4liKewDDQ9HtH/I658l2AI5vbXKvtRIhD5P1BZ7CfIJVQPUp2xTpOdSxHzWoqE4@vger.kernel.org
X-Gm-Message-State: AOJu0YxqksGGKmxGOgweOtsEEzKyg3kZAyhOX83jFyQbpJ5lAi+ud2AC
	/9LYRh5WPQ0Sjv5zY4IZO0wHyjkz8TWWYRVC/wtFqYE6eew94ljqGPjycm+iTaFFqDM2mAOsYvY
	NS77EyWcxJzK4NOZXf9c2hI5s11MLGYMsibBR/wEoB6MKPPOtm+GJGu1QFNQpMFQsJdit
X-Gm-Gg: Acq92OFVWiNrHMgeYYPDRhZWQnvgiK0jrVXyCzVV1cm8faCghYMyJqKQGTzXICWKTyw
	NqEUr0jULnNU42feflD1v0D+Rn7ndYE5GpUBZ2evkZLx17AO956UWdIoOetIrEBWmgbwSwYCU4P
	O3b1jdq0WvVjQ9kbaeoUsWYJvVpiOWlS1Ucz0QRrES8tIU670Nb50BXyiOxXaICEA/jWW7tAkil
	Ej/i7fOv54WVjOQtnzbtugJ39qlbUoQRje/iUt8SvXyKAY7F5Da5axfAEjKNUEy3kyz8zmkZjaj
	GYx8ExOa8xOMtMQD9DXUEtQ/e+G75q3Vxok3VbOpbnE31QLcZR0sl5EA5yLFFdMk3Ftv9Wj0cIC
	YcaPTdtHV59AAvdqvudzNa7GfdMAuEc67tVVfQCfGzWf/OaS1D3C1DduD4X7NOQ==
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr9977809637.17.1780296292517;
        Sun, 31 May 2026 23:44:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr9977746637.17.1780296291949;
        Sun, 31 May 2026 23:44:51 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423ea48bccsm4142372b3a.13.2026.05.31.23.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:44:51 -0700 (PDT)
Message-ID: <145b763d-49f1-4412-95de-76c22a81a728@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:14:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
 <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
Content-Language: en-US
In-Reply-To: <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1d2a65 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6icYdhiYefjo0O0wKhgA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 2Mflwe4nWNlmdm8VVXBqXCf8hFk6eAZY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NSBTYWx0ZWRfXwc79wJs11vNV
 U38r7J+GZvVVNy4Azp/HA26wUIx6Y7VOcanwvhLWkh9tTO/ZaMqXhLtKtsFr/UfwLl4PsWk1mmV
 /mbZX8eLqE7y11UqvjOVo57iutRgrI7SGCVgTnvC9NQ01P982ZBn2fd1se6mabkRoAHsRg+Yk0n
 DBjwuYuz+2X97pmBPSM8cRLzRzXnJ7TnwSa31bjUOPrP8Zm1xhn5GAEavG/Jdbab4OyEhjtsiR3
 fU4oDQybrVGE2nl1RgDU7MPBC34S3+eokxBjTgpjZ+kUj9ctONDai18f8oiFVN1lq2ym9XULJPI
 8ZoROFs29k+m6lSaEeue7jIvxY4cUD6P2gQAz21jo09RpqL6Gz9B+XPy8FMhJ8YbXFnHsRxbZF+
 n77MA8Ien6mVuqYBttCXWSy8UxD1vNd2Vtyf/b2kzHXGy663yqHgnXwtykFM/rvg+SewJBgpuOd
 RQeAXQLz6Ps1P658pEA==
X-Proofpoint-ORIG-GUID: 2Mflwe4nWNlmdm8VVXBqXCf8hFk6eAZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010065
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-110511-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75E8B61A535
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 30-05-2026 17:04, Krzysztof Kozlowski wrote:
>>    iommus:
>> +    minItems: 1
> No. Same feedback as before - you need to describe now the items if you
> claim that there is distinction. I already pointed this out to Qualcomm
> at least two or three times.

Thanks for the review. will fix it in v2 by adding per-item
descriptions under iommus.

Regards,
Nihal

