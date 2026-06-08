Return-Path: <linux-arm-msm+bounces-111734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z2nSDMd6JmqFXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:18:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F008653EDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:18:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RXOJd87q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SQhI6Kq4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111734-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111734-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5483A31A16BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE9E3A7D73;
	Mon,  8 Jun 2026 08:07:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC8B3A6EE9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:07:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906048; cv=none; b=jYGHNKzkPVp1eBd2EpLN+RTMTyLF5TphYqV8EwrElEn2fa5l86BNt5r0jvHxtyniMNXXw++7l/sda4mBokYLwzjYuDzJhzsMqJfxdumeJGqhzvKt+a70I4lxujh0FfjqeufNJiHCudLQtI49NESMDs61N/QBkuAIOOcNkD88FBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906048; c=relaxed/simple;
	bh=34m7SfVQVZbxNJAO7Dmf5tlGcddqxPWguftSDeuhdKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sC3T4JMnglrC/A5ipA2FS35HTKMcRA7VGCDDexz1Db2F48Su9P8bY1nMUnizkddo/XIiLZJgRD2JbMiwm3AVWOFOg0GXqQENtt3MDYvR+R5H3XXncbCchd7StQ60b2Tp5TrQj2jK8wJkbSE54p8UM80lF9vWdgY7rQbvZrs+iF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXOJd87q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQhI6Kq4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PTWF2808216
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PjcRkdjiGy7fLYr8yh6M+jv8Y8SIt/ntNkKHV25fvcA=; b=RXOJd87qybAhc8dK
	O7mOV04BJx4I6xY9wkKP+gKp6LjWLHiwIYawpvcvgZmXf9w3qdHtPXMghMlqSPob
	F7ycHkoFfyV+oBXseXqdaf6Q9UTNMdcwqyrtuTwOAeN25i3INZKQ6XfgbfuVzf5+
	ZvrlSbBRpHlF1wULEzA5Yg5P0rg6J8bYxzGWImmNt24BMvTTRfMmvda6GGNDNurq
	+AAZ6Q9eKB3qx76gwjVSutBLJ0jVevPy13zb5qoT7ZlPk9AoOFw3O4UkKFr6U5PT
	IjlqodlIgPGaCVZq7UZaP6KVIZkSSGsuYrmwSSUUtpXKnGJxxET/jl5DpuGJU0dd
	fQCFRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w6r19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:07:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915a4ca0a4aso131824185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780906045; x=1781510845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PjcRkdjiGy7fLYr8yh6M+jv8Y8SIt/ntNkKHV25fvcA=;
        b=SQhI6Kq4cQmIFitb8H2g80D3moebARtqjVDV9bDm19qpy7bnDOfMWHJ+Aqlj6FpibI
         6zF6sPUqiczywv3cm9CtTgkXOHMoSmANn2uKyOmitjeaRBwpDiQT3BR7jVITLCYHyIhs
         oXRtuxkfr4uVUeYYF9Uw8LoDtDHEdfADXKwx0jDHN6bfYhEG9yBamArnvlg9ZAD9Lmiy
         lR+ALyb9SaBhrnzpLGB6WATZuYjz6jKoIbvyuJrhQfYlxcQdrMeE0L4y+zOCWT/FEJIl
         JGYoQFC/M50qwQCsogozvmr9/Y6jklXrS6jFPnA5IrgWSLc0jg7oV5Ivt4Y0N2H2Sjcr
         5qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906045; x=1781510845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjcRkdjiGy7fLYr8yh6M+jv8Y8SIt/ntNkKHV25fvcA=;
        b=q/exLy65cixV12HlV14b/FZsynHvjpq790fWHlfHHT4T/08DB434EwhJg+gmISK5mu
         5/U7W4/9hxDICqvHyJAla7n2MUhnvo/uxBVINnlWWiHNhju/MC39c3w5vn7GOITLtHhu
         c+UZ5bmNXGD0FFiMuc2u7CqR5rEter67D+HZD9Y9DaxC+i7WV6NDX3O7wTtH4q6Rps7u
         FFJp+K0vjkCjq4vYSrBp9Ao2IgaIcOR9/q72cuFXi9plQVhswXN1eEKwNJ5mjNf6GyLH
         p0bjxbCVx8ZbmpGCNoSxD8h+MfEUbGy0SsECbusyiJP83yAw6Yt+vBw7gCskJABTB1p1
         o6xA==
X-Forwarded-Encrypted: i=1; AFNElJ//yMe6ERMkN6vxH+BeurHm3SluNsYRhfEXxckNY7EqCWODZF+5HKBBVHjFeSxyMLH2qqlvB5FCB59t8sqe@vger.kernel.org
X-Gm-Message-State: AOJu0YxkznNNdqUr1fLY1F6hORfC+0znG0kdnpAzF51DcoHcK06CVZ1+
	EHwqwlYcyXwaUqXYJ+aaw8MEeLzxradhH2uUnQ8pB65NLPyzXpWVuBB7RwHkbFZjj1BDXm7bhkk
	QnL43PHi9CzOLUHXHHx622znAzclOvJmBBJovWZSK4lcc64T6EyTJAT4I8xE7O3gvlfgN
X-Gm-Gg: Acq92OHdHS9+SuSsxI5NTXBdVsUFI9ALKT49cXq4Tsx/XRprNhq33O6K1C2v6W50C+S
	zfT/TO1xbAq5vQgyUwEXlePrX1b+ukqCz8Hh9ZbKGM4VUYLzwaqypASjmNAcuOGMvb9cOqhCR5F
	uDPYVMKHtBeqtNIEupZ6BtkLu3HlIptsnScXSyb9z9IaQ80CbawqGCpo9+oDQPYxIrG0/U6Lzvp
	QZsoJcAjxwHkK7MWWCCxOf0VO0ecVL9Z+1LOWy/wBiMFRMDTHJliVL2B5Swpk9HR+m11ISB3N10
	3tqBnn8qnCIwegls3aAs+dwA7eqAfkiWO6RK7epmcvuanXO3QI0m7XvA15q6u+iSmRCAtbAk2pX
	rAoe7pm4eIoVfyhjfsBfpTHGUaV5UwrSDNp3mljI7Rb3HDNv9P8vrryKM
X-Received: by 2002:a05:620a:4607:b0:915:86a4:667b with SMTP id af79cd13be357-915a9de9b69mr1410041285a.6.1780906045327;
        Mon, 08 Jun 2026 01:07:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4607:b0:915:86a4:667b with SMTP id af79cd13be357-915a9de9b69mr1410038585a.6.1780906044944;
        Mon, 08 Jun 2026 01:07:24 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm6634023a12.17.2026.06.08.01.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:07:24 -0700 (PDT)
Message-ID: <c0033210-7fba-49de-aeac-1ab0d6219c8a@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:07:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix gcc clock specifier for
 usb_mp_qmpphy nodes
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e1AnExJkwr1RQTiM90dsqQcioFKXBF6Y
X-Proofpoint-GUID: e1AnExJkwr1RQTiM90dsqQcioFKXBF6Y
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a26783e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Ic1KOHRaER9q49jtsWgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MyBTYWx0ZWRfXwOw8guWt9xNg
 b6B6wZkr6ipww0gQ2vNq+gsdJmpVVZvBp59b8HUXsbD4JEEpI1mxx9ZgVmv68C5DA4+mEEDOYYf
 mwdM5Eg7BLMhaIZEPMBrNgrIDt8MxT2qQSqQL28CoGxfqyNOhH5kt+ssnC2K6ZQ0Jc8p5AT0BTR
 JkoQbS2WlW72gr1mjflJhYsgUCvPj7HL01r4UKhB4yF5zb9jEgyJTi0RP9B+RTZKMqOWrZziMly
 2l1LAde6x9t8ziDXONldkNgzy0IziPlM17fa5oaAwQGWcpqGfh+Ek891q7SSeyH2J9lEwC9eZko
 MdSIunotemNlAXzZI+A/XM83mBfm7HDwBjTbxNWbCeF4MTHEYGIZr/HbeVA7K548qn62c9LQTm3
 mGb5kN6aXv2XXIz5RjJhvp/o6iHzOugqeGhNKm9Q45H56j4jtVUA+ZSUKxHtAiae/+zL35DxCYW
 yYKr2NRJs7YuVXlkGIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111734-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:gopikrishna.garmidi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wesley.cheng@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F008653EDE

On 6/2/26 6:51 PM, Gopikrishna Garmidi wrote:
> usb_mp_qmpphy0 and usb_mp_qmpphy1 have #clock-cells set to 0 so they take
> no specifier. Drop the erroneous QMP_USB43DP_USB3_PIPE_CLK argument.
> 
> This fixes the following dtbs_check warning:
> clock-controller@100000 (qcom,glymur-gcc): clocks: [[59, 0], ..... [0]]
> is too long
> from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
> 
> Fixes: 4eee57dd4df9f ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

