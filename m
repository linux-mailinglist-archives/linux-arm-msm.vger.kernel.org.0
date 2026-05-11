Return-Path: <linux-arm-msm+bounces-106853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC5xLBWRAWrTeQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:19:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B174F509FC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B42B3016D11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D303B9DA1;
	Mon, 11 May 2026 08:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUyy+gJS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZIwegDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915FE313E00
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487446; cv=none; b=dL7pk5rsSFKD1UZzVZge7xm81Vf1YWBBZDLIywAa3nCsjfCRI2bA0CFQLH3H0PPwixKyGsXhgcvYac2WVHrQD5tHUavrOvnECD8SkS6RbD1xCPkgQDQWxdF4GWV5yOMSPC30ghJUjPfQx2c4fGj0YM7v6FmeDgKLw2pPXei3aeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487446; c=relaxed/simple;
	bh=aU6bBrDHmv6UBF7zIJHRhguL7uDUb+/D3mcgwsbvang=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0jAND9tJT63CzL6TLeY0N4F4CSwgdfqr/WK6+XNC95/M6q9IeC4h0YuowvNsBUTdK+spByqNA+51Ntdjd68+iz1vh7Sah0Gx+xHEQsFxce7cNQUixaAQ7xri/OhRHJhCXOXAgIaPjJly8phu5NRNk/yUbSYSiBdTO2XaxGIL/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUyy+gJS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZIwegDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7tZrh794634
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o4cw/D5H9MhKZ1YsCTLjT31xjxLlszhJhwuoO/W+uxE=; b=FUyy+gJSS3kUwpn6
	2q9SW+qCOzCedTO18T8gndf9wmRUdBDmP9565TDl1IeJZ1vWH8PPq1y3XDQlh+RA
	CK07OyW3yL5asBNZuF7XAWGvTmQOlrRjxKaTjbRd8kzPIQwypAaH41A10g39X0ky
	KEjixajvaW3SmpDdGZj6RC0/z2pKcjVkuzZb4OYz+WpNtLZiblQ4YUD1kzBT8BDr
	BB6AAACrE6qRj5RZb0J6BCoOLJAQYbYKWQRviIWhdCTb92aqJe32xP0uusdoFNfc
	BqpoYTgr+J8qUFuGkUHcnFnhprtjKVDpikuSDTrgxmQviRBQLdhqV8DOcuQ+5EDh
	BZWVkg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dksuavk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:17:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba6fe41283so48698745ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 01:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778487434; x=1779092234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4cw/D5H9MhKZ1YsCTLjT31xjxLlszhJhwuoO/W+uxE=;
        b=XZIwegDEIl3v+RbJiiEYQXrh8A/WfgBl8INM/IrkW/vksS8iC63XqwnK0wLe79J020
         MkiAgNOjOEq503MPCKmo8UBm70ebVpqay2bZi3ADG/9U1jwPbPTH3NyHRneEug6yYt0S
         9/t1c0/7vghLRKpIRi7jyWJkQn8wTakJBvDh8SMtMr265u2SGam+1ttjLyfBTCsUsGO/
         EP3r8qkktLAnkqp/xF+QWON+xnSxrGe5ubPWhu8dsOFJqBUweSGuqNP7ku03XFaE2s9W
         c1b1KlbyPABW4lksB+gOtgPI8SZTw+HsJwfbE6z6hdS3fwLxRdHrs6N028+UXrIbMGJY
         yR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487434; x=1779092234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4cw/D5H9MhKZ1YsCTLjT31xjxLlszhJhwuoO/W+uxE=;
        b=LpdsMu98WekM6RqPnISbuOGMulsDZd0QR4hgzd7LfhjU3IugqXIYH9f4J3eY+KXtnM
         IwehPF9ycCZ2Z8A4LZQAtchzeSStyZX9vpLRDmM388ndvf4fcr2qZX6wsSYPir88URYq
         GDIC58QQpR6aR8CtcQOmih+5xSGB/R5PBqZCypTm0eaJ1NWyKP+ePXoFeUhsb8EgXab9
         199Im/dbMjGqOWZJOmYbiY8YxR4JkpAUezUiuTo3GV+qmXIrdEyWhkrQcwXMnAOK+Orj
         M67jdFmHt5xe6BcPS7sCIFAf7KXUzCfR3ZbSPnoo8g3or3TcDTEaTWOB8IJx99keF+F2
         5npQ==
X-Gm-Message-State: AOJu0YwktZdeSR+9/5+L25rKZoGxmzf1wcws71nI/JvCaRLPlUT4pj7W
	t/dlRBbw2YcncHfL3vRGfJetqg2JblkzdJQ0Vp6PgYxctLuGE39e9gm0ZxO+lbPRFcc59w3aumC
	jTJvYAp8rrsH0CjG/3dBjq3H0VlmqS4gjIfM3aRqinrQV7gtlz39x2iF1gSF91IW4Zati
X-Gm-Gg: Acq92OHO2ga+GeD7M2AgDjhl/O2jNvif6JVrpjikrrQ3w/56BIPe7xSGgbjzn2rkoFp
	KsLDiFQImB4pSFO7TJ5YEI/r1K3LzslWluBbkRtmXKKY4eoe0+5kMuClvZ8Gg065lgmSaz8oJFO
	L10mANR6HyCizRscKTET4D5i/9SodUfYUtWUfFZd/jDOBhccyvrUuw2xljpx3XaLUDzFz0SP3Dy
	RltgFQJOa5dBinN4g6D/uqt4w9wEGP7Up1oYShc6KbNvN6Q3TMOZJHWFlttXAbRD0lq/JaAjWQO
	93Xb8FiEIhmm0xRXDqqPgEJKDypvpQ2Kf7s3oTajtTC5ABdZm75aqJcu2hor/lzo163dt8rVDJy
	NzGX/59r593/d2ONv/vkJmqWTTuHjS7M7f1NJn7zBDzwGMOplNB4xWKa29pPm5zs+nfSLLdg0fF
	lroX8HV14O7A==
X-Received: by 2002:a17:902:f083:b0:2ba:6ed6:aa35 with SMTP id d9443c01a7336-2ba798c27fdmr152641525ad.19.1778487433677;
        Mon, 11 May 2026 01:17:13 -0700 (PDT)
X-Received: by 2002:a17:902:f083:b0:2ba:6ed6:aa35 with SMTP id d9443c01a7336-2ba798c27fdmr152641315ad.19.1778487433163;
        Mon, 11 May 2026 01:17:13 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35eb3sm95994275ad.41.2026.05.11.01.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 01:17:12 -0700 (PDT)
Message-ID: <6dd0c0f4-9c40-4e7c-ba4c-e6e86f1fc95a@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:17:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: Add label properties to
 CoreSight devices
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DU2NzAQg4JriRXBP8UomToHIChb7tILr
X-Authority-Analysis: v=2.4 cv=d93FDxjE c=1 sm=1 tr=0 ts=6a01908a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hetpuf5w24yqYUOSKEEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: DU2NzAQg4JriRXBP8UomToHIChb7tILr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5MCBTYWx0ZWRfX9D3/EztCYGbV
 PwRopa5KCUwWq3zNQMJHb1ITb1r3qHwqFkfgd5lmy3UifbGCUUQGYTfZGwy9WC3I/nYZ4BnLTV7
 gaZ3uwcJbR0dd3ziaZ71ZPHxpdlH4DfX2yECAfHPrGggYUZtAM7Tjq5dxbw1NcZ/iRsMvUHQQXA
 FNE1mEtmWpotpEtVtxKbSeITHl8nRmDD6c+2HvSxev956wsREcdMG1obdP4muK5ufHPxIfOcCWe
 kbCi46DQqZCGi9kYf2br/CShmzcFD+4M/1/nZaF077LLXDmoP0An6GRoR//R/laiUNvIjr1rfIf
 qw28dJQ6cKdRefol6K0FC3TJykhNioiE2v+Nq9GPsStruDmzgbMZW7PFqGhh+Tq1DfvQN3sqAhx
 7GCD2EZ8glaJRe1rARv8AAUtYCOzw+0laoBpm3OiehvU8SAEUl0xQi/noKbNj9z8hRFnhlUgNDt
 Q4cZwEG1YR9RKi949zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110090
X-Rspamd-Queue-Id: B174F509FC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,qemuarm64:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106853-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 4/14/2026 7:35 PM, Jie Gan wrote:
> The CoreSight framework and userspace tools identify trace devices by
> their base address, which is not human-readable. The label property
> provides a stable, descriptive name for each TPDM and CTI device,
> allowing tools to refer to devices by name rather than address.
> 
> This series adds label properties to TPDM and CTI nodes across seven
> Qualcomm platforms:
> lemans
> talos
> monaco
> kodiak
> kaanapali
> sm8750
> hamoa
> 
> With the change, we will have a sysfs node for each Coresight device:
> root@qemuarm64:/sys/bus/coresight/devices/tpdm0# cat label
> tpdm_spdm
> 


Gentle reminder.


> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v2:
> - fix the extra tab format issue in patch 6 (sm8750).
> - Link to v1: https://lore.kernel.org/r/20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com
> 
> ---
> Jie Gan (7):
>        arm64: dts: qcom: lemans: Add label properties to CoreSight devices
>        arm64: dts: qcom: talos: Add label properties to CoreSight devices
>        arm64: dts: qcom: monaco: Add label properties to CoreSight devices
>        arm64: dts: qcom: kodiak: Add label properties to CoreSight devices
>        arm64: dts: qcom: kaanapali: Add label properties to CoreSight devices
>        arm64: dts: qcom: sm8750: Add label properties to CoreSight devices
>        arm64: dts: qcom: hamoa: Add label properties to CoreSight devices
> 
>   arch/arm64/boot/dts/qcom/hamoa.dtsi     | 30 +++++++++++++++++
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 35 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/kodiak.dtsi    | 12 +++++++
>   arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 ++++++++
>   arch/arm64/boot/dts/qcom/monaco.dtsi    | 29 ++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8750.dtsi    | 27 +++++++++++++++
>   arch/arm64/boot/dts/qcom/talos.dtsi     | 59 +++++++++++++++++++++++++++++++++
>   7 files changed, 206 insertions(+)
> ---
> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> change-id: 20260409-add-label-to-coresight-device-b17a2ba6030e
> 
> Best regards,


