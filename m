Return-Path: <linux-arm-msm+bounces-92945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLDpNyoSk2mL1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:48:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 576BA143721
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4411A300B982
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211112222AA;
	Mon, 16 Feb 2026 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeZiya4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qt+uSNo3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DC1A23A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771246120; cv=none; b=YrTTiVIF6pT4ZFzV0GOMlQFGankW6+Q0hQo8wEu1YTPYOnJkUFl4KWDxB+P9PE7tOhwVUan142grO/0MXxIb9yb1PP7TjjKAZp6hPz+Veivq1Xdc14T/Tv/jmdfn08+hG7s9g/bkllEWUU7NY0xKSKHQrPU4I62xajIY/090gno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771246120; c=relaxed/simple;
	bh=FopIntENjY+GEQfEd3Ie+E+cfwzshAxs33Nh8q04coU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mU6ush5ove3w+JqiLlUMv/Q/QoMe2T740Yu5HNJ27DT9Ay5a79C2V5rG6AzUc1T4LStPaSfASbtX57COQR5kD+0kMnvKn0SK7gQKRHtDK+2OcBK0u6d3VHEwKUKv/G3JxvdHDE9HHZLtMTSVMUUTTq0Ok1Fj9VliU8xajNvA/Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeZiya4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qt+uSNo3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GB8Zsf1582941
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwm05FI3e3NX0ebgAX9OH6TMIb9jFbuqyHKt4YLbX/M=; b=MeZiya4rHdRK0MLE
	zDNuiviKMPm30djNTJQnthOUPobj58P6DT2jjS6wBj3jyEJWyKxphRpwuT87D5fE
	6CintDvLkv6o/UeocGg44+W+KAZMa3Opvfav48cmX9t2Z/ocM7CvutDcgMVJXy4V
	9VAJe1nmfqR79dcIwUIkpG7sn0XKDYEyYY+DYT7+X1u9bCGPFHALO8wD1ErqYRIU
	YDMVQDREEEkBLN3I6jUHuhYaC0HSU+7KHqsp0bMdrZhoDMFZ9yPRDnixNiSKYJLs
	b/9vF89IUFnNmsDumK9boLT2jL9lQD+D2ufXoOxnb0R0Y9iOGVf6qsG58Yw2N9Cy
	WXwA5g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9hmjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:48:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50698374e33so28267951cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 04:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771246117; x=1771850917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwm05FI3e3NX0ebgAX9OH6TMIb9jFbuqyHKt4YLbX/M=;
        b=Qt+uSNo3fiUBkLO0BpssoMT/tKKbbgA9FK/boVaV6SX08em2lA0XBWUTnD+pvdSKVg
         qwbUV0IBaIVoahioyqXUhAGUbMCmafz/LCS3v5mKf8+i6Vjwo5xSPaLjhPepCy6amlRM
         vbJxcvV2vwkliwHWC7BBF+tAzIDlFHJ0DTR9ndQi7jggtdQRCjKSvIjPgORCT2nLi7TH
         mNm6wyhq4eIRXYT62UtXaqombxfpmP0PgjH0Ss5iBeypniSRyEPSiZ/dcO1SzJ4Zvb7M
         RnZDxR7gHEvWFhC7p0DDFvt9rFV+rdOsBvvoFeQOT/rh0xXlOFu8uP/b3kmFU4CmIf4s
         lmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771246117; x=1771850917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwm05FI3e3NX0ebgAX9OH6TMIb9jFbuqyHKt4YLbX/M=;
        b=mfnEJ+QTZsn96LWFR3Chi7Is2LKbjo1qAHPUmoz9d1gysc1DJQgekJ2Vc0fVF2AQF+
         4ulg6nnwawZzillZYljAFqoAPC1lwkMT1GJQW+MM7OwUMPvqg7H/vVHm2LB1UR9ma9DM
         7Bg+VWrXgYl6nQrAxXaaLa28zSk2ADys0DIVyM37MWyCqIdwVB2Vn1IcxXuNikhaAO68
         QS+Bn88ngEVWiK13ITJYzUtOlJajvPlD3/nYg8r0k/ea1IPEnlfKBntWyFOIIIZC908p
         I9nKK6lp4nOGz637eyv2PMgyGHmomS11x+7JN4MRWS92fbw0PqDcGHylXlc2b3rhdGp0
         YgKA==
X-Gm-Message-State: AOJu0YwMHqywgjsObI46KeBGfUn0bfudv5PVZnx63NJMNQU5iKgw5av4
	gLgmy5E3D6Vc6ZifJM0jCfFh5VZceH00o6I3Y+IUiWWr84ZbG06ralDw6VPvQK0vmls5Omc204W
	bEw3mMbcbA1thoexLJdTfWqA+wYGyMnwJZjBzHZ9mbxe7OjKUzInwBh6OFVeNbuLeAWc8
X-Gm-Gg: AZuq6aKmFoo/iPxjeZtPNRw+6S5q/lIZ6lI0zao7a0EjbQsnOfSOzI6ZQ8SYNyQcCdU
	WBO/BdYfKHpoVXJhappo5qNyE8h5PpJ6L86/+jPGsEU9qg9CP2kk0zn8h3hNwj5mxRNOYz6dqyH
	KiV0J7WJAsSUfsBt/OJBF3hyfgsfKZOn8PzH7MMexmi07e/+lwyzysDYUgPl4QQNixZfK+fDVzH
	IsoKtJ36l/qZfEhrAdz7u5TICLa1scqb2qDjfRlqkIA4FI7JRGT1O1egrIEBIB9JhOQTSa8Rkq6
	SAnvPwadJFEEjs8nJfwjS4RcWt+ZEyplcC6lsjv8V32Dz3QGYWuxJZzDO4aqdaXIfSfPH2VzX/E
	i3MJOArf8V6dgyNyL5i3OFOrEQ9dUrTY4c3qbmLOUnwgltYG2YUCLmLOdH/T0oCtCe0jw0FmTrh
	jfmT4=
X-Received: by 2002:a05:622a:130d:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-506a6b2acc8mr106731211cf.10.1771246117097;
        Mon, 16 Feb 2026 04:48:37 -0800 (PST)
X-Received: by 2002:a05:622a:130d:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-506a6b2acc8mr106730971cf.10.1771246116584;
        Mon, 16 Feb 2026 04:48:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f0b55sm1828771a12.23.2026.02.16.04.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 04:48:35 -0800 (PST)
Message-ID: <4fbc3ceb-ac69-4c62-8493-e216f352a64e@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 13:48:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4W5wUVMMqNyDay6_MGFZMRXYxmWoaYm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwOCBTYWx0ZWRfXyJXIHM9S0HTJ
 fUuIlXz1usqRWIQY7uL/d62qvYsxVJLbW02o4fnKkPzWqkrM93OMkcsO6K0nwGUBQPtWq4nr1RV
 CN2NorIfuSeqXgA7009cGOLEji/+9/bpvoTRfvKwfO6Y3Zx882ehbf3Uaq7labouQZ4FQs375sj
 muw2NfiPmxMe7t+grkRm7xfN0MVjA/hclrP4m1apxe8C+FMGS7iBII9CrLH9hi3yDr+NemSfufy
 SNIu8YTPVg1rA+NT+hEoqorC3WYZkF1O9dFMNbP1U3mwLNpORnvHJ6Ww+VsgWM5k2d8a1nwupCC
 m3/1CVck0KqDO+z1wRIokjV0VqIdZ0L6jiFJblprXdJJWSlJXJY2arLR3ZswYtl5ZtgEDSAaDUp
 cvOaZxR2ZXAym0aaFFXMT9oVL9Bb9A/8S55fjqGFybI9yt48MYFcHPmulL8kkr/xRKa9cxeKRdD
 IsBRKOxBMEwleoGt6MQ==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=69931225 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=k6EWo2rcp4jYI08GLI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4W5wUVMMqNyDay6_MGFZMRXYxmWoaYm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92945-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 576BA143721
X-Rspamd-Action: no action

On 2/12/26 9:43 PM, Bjorn Andersson wrote:
> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> interface.
> 
> The Renesas chip is powered by two regulators controlled through PM7250B
> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> The Genesys chip power is always-on, but the reset pin is controlled
> through TLMM GPIO 162.
> 
> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> allow it to be brought out of reset and discovered. Then describe the
> two peers of the USB hub, with its reset GPIO, to allow this to be
> brought out of reset.
> 
> The USB Type-A connectors are not described, as they are in no regard
> controlled by the operating system.

Nice, for a change ;)

[...]

> +
> +	usb_hub_reset_state: usb-hub-reset-state {
> +		pins = "gpio162";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;

Straying away from the main topic, I find these newlines in the middle
excessive

Konrad

