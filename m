Return-Path: <linux-arm-msm+bounces-110249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ2LE+RqGWrGwQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:31:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB566600D59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3B413045B18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5639C3BADA5;
	Fri, 29 May 2026 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwtJ9boA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ko9WEgGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B129351C0D
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050265; cv=none; b=XSV4U6Sjd2YCJdyOnccUSJqeAVIVJVrwds4Q2esRBerMhTYGx2d5m30mZ2o4pF++uDYGN6dno25aU/OV5rCAVW9pCHVRz738fBYQ/Aw+SslThJYg9g1vFnv7PnLa1wzvtLrQDZYP1F4V2k9XMlY6+Og/AzKaqy093d4KI95L0Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050265; c=relaxed/simple;
	bh=FO6h0QFaalhrqwRHTehgRq1wJKA0x2MacwpCuw0meww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1OiNuqEDLI9bo0RufLb/sLGnbq5MsKCCX/fsmRTGE4zMMne+Q7uovYF7dj0qRwIvrGpiORkiNkkCfMxNn1rRYIIX/HIQv2TdwaUVDWQs3CZuM2HyBf2ke6WYs/I/BORSmd6YOF9UUmEkIQExDrVCqQr/v2If6qD62xMgSsLTx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwtJ9boA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ko9WEgGm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T62GrI562513
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qVEh+5Wv+uAK+OT22qIaVzyM+YmVu8RQ0ljuue2efM4=; b=fwtJ9boAw/G1k6eT
	Kl5gtgBcFRORC+qViVEhLSKdLytMwPWtTRm6bWjZC0FE+XVLqHjtit1+hhRChcZQ
	hr8wuyCGK8Wdv0yfUjqmGMgDKUtwojb/IHyyHDrgSz82UBquuuPsPTbYDJO4phmG
	MfS/Yr20fxMZHwr3ZJRoLgkiwgMtpSrokrxMUAZ+BcwwsDYCbmT/NQlranX6UjcR
	02EK0ksFAhkj5VzKLtW9b+CF8m3D7RHoj0jkfXJVD9m5gpxAjUXBkwBQyIa6vWXu
	Ba+9yHzd1JvfhLhF+oowheXjJI/PcpJZ2YfMlnmIasKSox+qg5emM2oXExyZwoM9
	/HH3+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug33ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:24:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2beb9002a00so66764745ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 03:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780050263; x=1780655063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVEh+5Wv+uAK+OT22qIaVzyM+YmVu8RQ0ljuue2efM4=;
        b=ko9WEgGmv7VsAjGiOBCLMWM2D4NRoBD9zsPmd2HTi8hnpaWRgYONbRaNYesxhVYRD+
         2ROwIUsyXlQJbhEi4UZpoamnoJQH3Ha5P/V7rtO/Lgqy5AJBHDtGW1RNN5dAJJXSFabV
         zN90JwU+STLIyv5YVbNzXR0tPVhCK0na2QOf/R6B5dVxbOLexOZ70d/WxSXecE42P0jM
         PgE+fPCbZ6KkGURC6ICc3b9DSWDitGKXmr7qC8Y0TM9l75uOubUNfLWK3zCCVZle1dy4
         q8aR6VitblMxMaFV4GTyOKvYZrrsUyZMkJqy86Xn5kfHoqdx1ZUImlYml1ERl8Z6V4ga
         mhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050263; x=1780655063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVEh+5Wv+uAK+OT22qIaVzyM+YmVu8RQ0ljuue2efM4=;
        b=Z/COjM9OxwkPhOdJKxBTx1hCSywYiEbBWZbK7qA50D0+2u8/+UF7+9c38g8mYloBlC
         1OQpRL5o0/MJXBKABDy8ucwkuyDgqKPV2C0TwZlmKfPP/hsUa0fyheq5v5R+Ja5AgERH
         Sen1BWxL/CktOD5N2tTYD0lTcgQBTqd1V94xGDCsoq3rgT5tklYe34XHKIG/RhrdoKtd
         5GC5ugz/UapXEDTDo5pLcCIz0/LrYiE7yXGKS1FgYX6M7b0rd0IsdiGnrg1zmgytNZxl
         NBKB06Yz0aDWJUUK6JNKR7Tb0z21wXSvsiTCPVYEZWFk5Wev4yEyLw9yLKhFRohR6IRi
         7A/g==
X-Gm-Message-State: AOJu0Yybtk//y+d4+WES/KfjZ4onXA/VpiQYJEJdWPJG8zUhjbCVK6Mz
	RoE/ysEX63qaiyQYaqhwOjBgsBWK5UU7rblgwg7wwzK7C4w0tGqwUgQjsBdWRlSFBZluYhBU89i
	3QKLAoMgPhsxrB1CViyEdIV1tj4Ddd5BkHRk8/wfDUyKRZzFE9IZHis1c+s21CnDqX5ba
X-Gm-Gg: Acq92OEfubqfYP0W8RbW+VRJjB1yWltR0InRzqnCX/XsAOXX6OXiuo9EDzIF9pwjM2u
	nHzd1ocMu0dUsj0d6YFUPmtBgabQJ6V8MK5xhpPl5h13iZwjMYWR+S2clQbUonV2ieAbtpZOWFP
	wJH7aOS0I7iLezhdcwGVIAzA0v89ofGtraPvMa7nyB3mBlN4y+HnVvJuHH2tCp7E0ANUm46xqwZ
	0UxB5jjBuePhrErOtu7FHYK/HYETYJ0Oi1DHfHsiq5pb0LhZvxjngYOfbBAiyAkNphMurr57BXp
	tRQJmPiV6UMrqa7X6CGX6JB1ohRyGX2gtSLb3tnGWxX2ajg8/UF7KIv/JvxifefsBqaRA/CWyTK
	HeU4mgublNA0zZ08IxEApY1GjxHQN3SneFiRTnwAMg9K0JKegYrIio39TzSytO8o90mJkfXXNa3
	IMiJjH/4Q4+uoZnPT6W2l/nw==
X-Received: by 2002:a17:903:234f:b0:2bf:3126:44b6 with SMTP id d9443c01a7336-2bf312645c6mr197185ad.40.1780050262833;
        Fri, 29 May 2026 03:24:22 -0700 (PDT)
X-Received: by 2002:a17:903:234f:b0:2bf:3126:44b6 with SMTP id d9443c01a7336-2bf312645c6mr196825ad.40.1780050262324;
        Fri, 29 May 2026 03:24:22 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2381bsm15624835ad.62.2026.05.29.03.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:24:21 -0700 (PDT)
Message-ID: <2b237599-7cad-4a80-ac43-564ac4fbeed9@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:24:17 +0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwMyBTYWx0ZWRfX7ltutLeWOvDJ
 praLswFAICPUzVJ1CcRDlAu7OwzJ8Q4XA5lbykcvIoHNTFUkLMcbM9FTC3vkBDvJGn3qCzs2H/o
 b9ySEWSKYqa5gUBCSrVnYUvIXtt93d4K3ZU+BTBgwDaOCNrunght1hcH0DqJtJL+geZK3hHE7A3
 m7Rb/Kf+avx6yTzr4hMof3o7pEanYwnM+YfMKgyhuxK2z0MCPF4Xn0fBlq8WqSVF07g7iKPPnnz
 CWeyXenD4ELczTV1LHjRyWAV2CM4yAvsQZx0kwiQ54QLPAIARmQpWIkj0Wm2h2e0wMiVhPU9C07
 bq0crJLHqMzR+TWFZyRpGVCpfGH2YNB0lFh4oq2qtfV/CbK0dMfdd0yme0zUNIyg1qAfLnAyMBC
 cxo02VaEgEA9WyyBkHxBRuhrcDCunIXJOZvOcbUmOxLDmDW3k0n0NNJPtqQ33xPhCh4hht4MFqf
 BXwvQrZXYtRE9rPRx0w==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a196957 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hetpuf5w24yqYUOSKEEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: elr51H2eDCDX_cJdqhggTzagCUWSxrwc
X-Proofpoint-GUID: elr51H2eDCDX_cJdqhggTzagCUWSxrwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110249-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: BB566600D59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 7:35 PM, Jie Gan wrote:
> The CoreSight framework and userspace tools identify trace devices by
> their base address, which is not human-readable. The label property
> provides a stable, descriptive name for each TPDM and CTI device,
> allowing tools to refer to devices by name rather than address.
> 

Gentle ping.

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


