Return-Path: <linux-arm-msm+bounces-90011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FBqHrbJcGkNZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:42:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62856F4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F71E98A3C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69E1481ABE;
	Wed, 21 Jan 2026 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYYiK6ka";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKerUNaU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF07481AA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998932; cv=none; b=eR9z0EtBVTTJAbHz+5QgODHEbsZnObPhA0FCvDehKqWHtjjSZKI6Dg7vxHEcuGB9ow7P091pq+HybH7D6AgGpDE9jXQjQMFAg9zUPC0ZT2uObn0jQrlosqCWWBEwdWMr4uhLAwnVryD0mDEovoqgYYuAlqMXjdhuLqu5wcZxjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998932; c=relaxed/simple;
	bh=h34ySUt7IUAXhK4MOCBmmFEFiud5ljRdIBQwuM1QZW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdCmS7ItIrJzGHKh2vErhJTUgw+/R+h68eckvtT/pOce4zzWr6C9oxqAn46I6GhWmnJdh6CKzqebCN3gQR9g2PSKyZ1qkWCv19dilzIZimuw+IXL18fcTmsvMAAKoWkVC/KafQSsJPnEe/de4kr2/6X+pJJDy9yvINA0LpDfilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYYiK6ka; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKerUNaU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9gD07824882
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IENr8EZgkddRqNwXjLecpZCkK+Z5t+JF9r6TEeUXnzo=; b=IYYiK6kakciS1dV0
	Nsnf/jJukFoiJsVrzQogAoLYFuTHtWGCJbeuVeJaK2XLXbSVDB+RM5X5U15gNk0o
	KVfK6QTuNjAVSgpy/0HSnDwi8gJ1qCSWjhs01ZD64TWOY+vjKtLXT00f7hZSdOET
	ZOudXm+fvSJNCluUDMl0dZBQjNbkIAd/D6H3wwSHTAfkPQGqb7fizP3RShj7zwi3
	8t3KzWo+7Alzd8tHKA5pvshSmJ0zyY064QjYwEFekqOjv6B+Jps/hMMbR/D2cXi5
	7CB28gbfJER/cyuyo9jHNPXDbpzVZyFSEhpWbA3iLiI6BgG81mIVuFsupd6MTsbU
	TJ+dtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e3w95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:35:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52de12a65so165587485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 04:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768998929; x=1769603729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IENr8EZgkddRqNwXjLecpZCkK+Z5t+JF9r6TEeUXnzo=;
        b=RKerUNaUdycuwxWLBePENgtgbwXjwuZYirxUtFNVj8zB3iLSwtYo7+qqiY4hwlnkID
         aXzvCqwW4aagvN5zMNi6/BFUS/xcyoiDD6l8BgPTLbg8Nq1dyYVfaYyZ0S7T1QPf+ivf
         NW/ooRN3cFHFcCzkvLW44xiN/lM1W5HgKnlWeOJqkh6VmW/uCq7WOGWoxbgI9bjgIxxE
         Va//+w/Zzkuy/GoYL9lBQ2vMAQuOXMrQKLjUrm8DURzSO8sb+ix6Bpad1V5MPITm3kpJ
         0i+NS9DQSSPb3X+bv3oRhEEq+PYiuZeyMyc5DrXNkXFMfOWbraEo7sn76WKIyh3fCK3m
         /azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768998929; x=1769603729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IENr8EZgkddRqNwXjLecpZCkK+Z5t+JF9r6TEeUXnzo=;
        b=RkP1/glndHu5u55P7hEHY97TZWoaAFgV+bY0ET4cjiyZkqhON/hKUqh5YSvgurSFwo
         BaSilWtyOWqMi8e8MMjoPSNiOj6yjOneQ6cltreDlOOgk0Y1aF+W/YG8wqyDKUq4Bn70
         vXu1tlHgsgfh6zbyrx+bgUcZPsjbQKMWFgNzmoXRXOQVE24vdIMwxO1j3Pvlwo+36Y+L
         3SOS4rlUjrB6SIOIYLoRAkpTIwiSuHFXihUybh+96MYCpY030m9Nh/Hkj/egN7JejQcD
         ee6RkGfsDNo2ANBy7nsV1AST8g/g8//HVZO+4GrwJEYkX8StjL+EFPAOtobTBYSG7GA7
         mO8A==
X-Forwarded-Encrypted: i=1; AJvYcCUdPSW/393gE6YX8DAbGYyeR+vUlarxNd0oDDoN9OTBmZej3RrvUK6sfq6YyVmHVaIJM/2pzNjZb9Q4Y+ph@vger.kernel.org
X-Gm-Message-State: AOJu0YwoJ8+MjqrVGgGxd4zK/ny7rr4f7s/w/3Ds3b5lBBmvapRdz70H
	Jgmw/bDwEj4FjVksL0HBK5MCM62xZG8MmE4hta98Hq0/q7n7KTEpRknGFp1JHWZA5LJgZBWvKKK
	nIXXt3lHuAdqKHTQGBfIKBWdlbyI4SAlEwupWewm4eqTZ+jbRiXPhGpS7y54zWNmWyLdVsj5aAl
	yW
X-Gm-Gg: AZuq6aKDNtAExoqveMe9U8hMfEgQRYHZHS7e8V4zcaFi1h2j/oRmHU+YmTj4TYPIdFG
	UEaxRy1luSrjHa12oufWDgjPKBpliyl8YgZ1dRvr3bku0yCSTbVM1vm17sr1JpndP0Hye2oclrj
	6hgae1pjpZDns6R7XTrJ8Oxn/PVDQvCVB+2KZxhmiZVyeVKjzY2C89gziIIPCUTeKF3Aby4Zose
	xB7LNmeZoG19sVAKGbAvVv+ed7pzwy6U/7/wqIGrbwwttynGgWi62R46aW3BQWAuSohIF8E6fWq
	n/RMukVvv6dWPwB/tra+O7uuRfwDLQBSebsFOVDpLa3BLLAsMNRwkSCUxXpVT1GQCkIBmjGwiri
	VzYgz8cnvpUttnmo+MseU+UJSdH9PLtDoq6/0jtJAsdyumNmop78+fkD7oHgex+2hf2M=
X-Received: by 2002:a05:620a:711c:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6ca3a8fcdmr670596685a.1.1768998928895;
        Wed, 21 Jan 2026 04:35:28 -0800 (PST)
X-Received: by 2002:a05:620a:711c:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6ca3a8fcdmr670593385a.1.1768998928472;
        Wed, 21 Jan 2026 04:35:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1526713466b.52.2026.01.21.04.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 04:35:28 -0800 (PST)
Message-ID: <a0a227f8-8a5a-42a9-acdf-19c055cbf9db@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 13:35:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sdm660: add common Xiaomi
 SDM636/SDM660 include file
To: Gianluca Boiano <morf3089@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, david@ixit.cz
References: <20260120180052.1031231-1-morf3089@gmail.com>
 <20260120180052.1031231-3-morf3089@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120180052.1031231-3-morf3089@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=6970c811 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=DyjDVKHP6fFwDWIGmFEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: L54BV1jkTsuNJPtez-JlPpKo3ujA3GcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX6cjQinmNMYYZ
 A1q30BeXz6MsUMpwzft6u+zBuEM58Pra1CNIgwsL447tDCtV2Vjzg6oZKxe7BbItwrAbT+6A2d4
 yCdrVudyUvjCYdNANgo5P0COtH6UjkpkH7k831akJtemdvlL7MdBBXxyWf8hrolUo1RsI8P10Pl
 YLVlZRYLLYVTm0BtUzY0pj5v7vhqL0oreNTxUY8fbgKvVLvDL7Fr1quzooJ6doWFUQ5S15DE55S
 UQX+OxrrGxW2A4zyvfZxY7t8xwmUdl23gdOvioZl9Df0CgDuHXAA5o0CcQj/wap19+lnOoV5BQi
 l6l4EKnofGkweDXf2wKq+dPT9v0hISL9ZpbPzg8QmtgE2rxLOs/WgAgx4j6XEG1cKJTg5G6E8u9
 muhoMceuKZnBey05pl3BQcFSbYZ6m9gY2WAkm0bjoqN0rhWCBHK/5GZvhVVepK8tgpPXzt3jwo7
 iBt5iMjpyYp10sYCsqw==
X-Proofpoint-GUID: L54BV1jkTsuNJPtez-JlPpKo3ujA3GcC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90011-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF62856F4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/20/26 7:00 PM, Gianluca Boiano wrote:
> Create a shared device tree include file for Xiaomi smartphones and tablets
> based on Qualcomm SDM636/SDM660 SoCs. This reduces code duplication when
> adding new Xiaomi devices and ensures consistent configuration across the
> family.
> 
> The common dtsi includes:
> - PM660/PM660L PMIC configuration with volume/power buttons
> - Serial console (blsp1_uart2, blsp2_uart1)
> - Hall effect sensor (disabled by default)
> - USB (qusb2phy0, usb3) in peripheral mode
> - SD card (sdhc_2) pinctrl and supplies
> - eMMC (sdhc_1) with HS400 support
> - Backlight (pm660l_wled)
> - Framebuffer memory reservation
> - WiFi (wcn3990)
> - Bluetooth (wcn3990)
> 
> Also refactor sdm660-xiaomi-lavender.dts to use the new common include,
> removing duplicated code.
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---
>  .../boot/dts/qcom/sdm660-xiaomi-common.dtsi   | 214 ++++++++++++++++++
>  .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 144 +-----------

Try adding this to your gitconfig:

[diff]
	renameLimit = 999999
	algorithm = histogram
	renames = copies


>  2 files changed, 219 insertions(+), 139 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm660-xiaomi-common.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-common.dtsi
> new file mode 100644
> index 000000000000..37ce675089fb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-common.dtsi
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Common devicetree for Xiaomi SDM636/SDM660 devices
> + *
> + * Copyright (c) 2020, Alexey Minnekhanov <alexey.min@gmail.com>
> + * Copyright (c) 2022, Gianluca Boiano <morf3089@gmail.com>

At this point in the series, I'm not sure your copyright is valid
since you're just shuffling code around. The year is odd too.

I noticed that Dang's copyright from the lavender dtsi is missing too

Konrad

