Return-Path: <linux-arm-msm+bounces-93899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJBlJag/nWlUNwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:05:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA951824AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAAAE305BBA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5412BEC30;
	Tue, 24 Feb 2026 06:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjgEqSiF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gX0CBTFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEAD2C3757
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771913108; cv=none; b=Ggn3V3xnUD1FQpefFV4ZTdn0Sl9E/CBeK7mCDwcDcoMs0PRoH57gb7lcLzbigh17PwbSDw8nOW+P3lsTxfn4dXVLDrBA+y68XxOceAna6TIuruwCz1xz+g+skCqBh4uEVO8LF1ONzjDA5qagSoE5rliYEDv9Kw/k1YEjIqJf/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771913108; c=relaxed/simple;
	bh=tmlOBNIx6GaJo3q2xA8Zdnm/kyuMfv76Y4W0G4JVQ28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSiR7IGb2/lBvtrunxr76snSPt+nKE7LuvlxyyQaYes6f4HgkGZ3BVytXN04fmx4QU8v6bofnLOhZ8FSfgDtp3cRP/hh80x56oLja2qZAsQespOQ7/uLW1epGcFB0W7prXPH9e2DUXEukEdDhXB369LdkNMzU7fWqmAHh9s7i9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjgEqSiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gX0CBTFX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4MKOk696443
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	400n8UlGxKWMvQgVzOhbEHQE+dOY8q+Q1Wtf/D3r27M=; b=kjgEqSiFTTk71J4H
	6WTR9tGQYgiVfo9y7E89cmut7HmBvuPbT8oeKbiUnusFD9PPohBPaSgII1m/0onW
	K/pNFDal7DUrRlYyoSapzqCYHXTnCEZs43LHQ8ZmhC7qGcMCQxi4wD+bg02JnvSo
	OdrXWoDXVtq1dF8W+FweNRRV9hQ4UFIXyhqSL6Zk81KvGQkAAIQTQoHR04KUQkyp
	0wRz7tZF/qg68rrYGCh8YTqm295VcXOOZ71YqSTPrQjZ1no/1ZzGwt+/g7Vvdk+K
	Asbvh9rkmGQJXCve5XTtCfTmulVX6R2r1NFhzTLufUs+QHcVnFZqfNS74hKlIPSy
	dWII4Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9sys5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:05:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad3f8367bso60088235ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771913104; x=1772517904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=400n8UlGxKWMvQgVzOhbEHQE+dOY8q+Q1Wtf/D3r27M=;
        b=gX0CBTFX3UnwB4wb2/DYjtHgCgjpCaFDZQ5VwmIk+sSD9pqEJAVFp+em+wU7gA48ot
         DHoEtZ3IH7HzJxebcjx7vrL0v3YgoDP37+B/J5TWDKdjTaCIzSw6OWMSqj3Kif+64Jzw
         jX4NGh9sbCxOmyh/eY12VC+13KFQsRx/5RAtZabwJG4Qat11n7mzw8AkgoQkCzyawRkg
         A1XcgiuUiYE39//SdUy2L6+Nlo7/fXFp2e243nKzOc2xEA6Xu+k1BkjqpJdgv4sCb3tm
         GyFnZA5ihna2vVmYvsOxGI92Cos/xw+dpnUdXEMmwQMDmgW+FD39yQMKdUjBR4If/8Fi
         016w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913104; x=1772517904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=400n8UlGxKWMvQgVzOhbEHQE+dOY8q+Q1Wtf/D3r27M=;
        b=jSpmUWC4rT49eityhUuqKB/VGm4id9rqCUIbW+GYI9gveAj9/fubt3JD8xsX45+lg6
         r2u9jjdj5zs+XWl9Aug9NYPACi9Wdb286TLGETyFbpqPXzyuCaPS6AiUvdWMWqHN9Iq/
         pCjZdiLclcCOsYjrsRwaDRVciOvEnpeUHJlfiyrCBY8AA+Em6UkGmffLjSkr2c2S7jvu
         4brGJxlmHIfVWR6JxgW1maEFrIY077XhvQH5QVTXQPjuzv3oxpZI6k9vqyIWuyF5iXMv
         I6ZlOvDT2A4Xi7vSN/fvM2cowC5E4sji+4fTL6qQvBIRKNG0Q9qtQzfI1nxJUOIwb6w8
         SpNw==
X-Forwarded-Encrypted: i=1; AJvYcCVduDO3ufH0w52PsLWQrOyUE/nYV+iogvjfA3LYFgKOGT4EVfNymO+AUVLpt+JsQXvvIEsD63xluaza/hLp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzma8GmSu4jcblehHKEO/Wq1mmTZBqk2QLkzKXSmSD9KC0LyG9Z
	ZEf+jEsvPhaDb3wzm5pPWW+NqCRwBXtYdb8SqxJmR3+1KF8nefmAbmtGDgkksOV8cAKZt+Py6zE
	nW0nuiBrTpvzqy6nJkEq6hbkzQ8Vqeyx6zrBFOkSd0e41j5xOESMOFNwQBnfxgXHJk56D
X-Gm-Gg: ATEYQzwtTW3ji6KvsnX7bK/KEHjDv/TB43OwetnCsxPqSzUbZmhCydQVbGJ9aAKNCNK
	/eUJ9XFtT6JbKIS4AhSoasXQoWPpfMX2BspX78nE4T5DYJs9T6wafwMe+SlinfQDtm7BYCW4RAQ
	6NIcW8AcAyIrBA/EeiT9BrWPfVmnhcCuYo979zgwEz9SUxyLJUwWohlNOwIHbcU2LjIfToAmcQB
	JZj4QquhVFpTjCz9XXIJOvKMQjtu1MMvgAF9ThBpdDWtrYnmRjmhA23VORDvG/1NZYMqN8naQ1H
	Xpg+8aJh7Khvj+ggvCUuTCvWmxZbat34pyPqJoPjMyDdVFWMyr83f2XFKtxvUOVIOnnZRwan0kC
	Z88o4B4GPXqhEact76I8OeWL+HQemMhu3m9X1Rl2FPJmel2uc3hSXdFBUsR6tkybCKqHOh2ElI0
	xP5QQl8v3xTg==
X-Received: by 2002:a17:902:da8c:b0:2aa:cfee:a483 with SMTP id d9443c01a7336-2ad74574a20mr104914985ad.52.1771913103642;
        Mon, 23 Feb 2026 22:05:03 -0800 (PST)
X-Received: by 2002:a17:902:da8c:b0:2aa:cfee:a483 with SMTP id d9443c01a7336-2ad74574a20mr104914625ad.52.1771913103034;
        Mon, 23 Feb 2026 22:05:03 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e17esm92142965ad.51.2026.02.23.22.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 22:05:02 -0800 (PST)
Message-ID: <13f9e693-9426-42d5-acc2-eada40d95953@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:04:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/3] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260217103749.1249718-1-tessolveupstream@gmail.com>
 <20260217103749.1249718-4-tessolveupstream@gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260217103749.1249718-4-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699d3f91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=1n-8aqYjKN0-IYhjqIYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1MCBTYWx0ZWRfX/hbLAKAnzPeG
 i2b+4bHtYig0fun0FbRKjm+h+eUKHR7g0ddfsZvytUd2hFZSYyt2v2TGMQWMa8eRF7Y1rwP6qlZ
 lXF5DVhXSoMEoA9gUThxnlO5MDwFk3WQ/F1LhMsDWYtzn1uXjQK7SarUYxdjpOJJzOd5fDQ/A5C
 9AZ+8PGGiel5WWJIQRUJJy1EUuf3bdtXKb82vVGhpGiXyTw8nxBwztcVqVQtQqPLf7qyFFbMx/T
 FCWUyyB+lzySjZ4X0l41/uqkYUG+ekJuq7CUQOsGaIv+8fJGfL1UywdavCbkToRiHgp5kmPFBlB
 ne7q1QFhR+4EcvBFEUpSm9l80MjiV/20Km4UZsSOI8Qj2gnX8u+KX3eYXV4TsqA7PZRGRfUp2zd
 Hu3ptVBVuc7GmYwhPGz09fG9egrblXoj1wp8uPAZQxFGwOciEuaaAHo4EQvW/rf91uGOWwIAlar
 5hn6/sq/6gJsExLlovg==
X-Proofpoint-ORIG-GUID: MWSQBDJr7-q2Q6Eug1OdfTlmIaobeeZt
X-Proofpoint-GUID: MWSQBDJr7-q2Q6Eug1OdfTlmIaobeeZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93899-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DA951824AF
X-Rspamd-Action: no action



On 2/17/2026 6:37 PM, Sudarshan Shetty wrote:
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
> According to the hardware design and vendor guidance, the WiFi PA
> supplies VDD_PA_A and VDD_PA_B only need to be enabled at the same time
> as asserting WLAN_EN.
> 
> On this platform, WiFi enablement is controlled via the WLAN_EN GPIO
> (GPIO84), which also drives the VDD_PA_A and VDD_PA_B power enables.
> Remove the VDD_PA_A and VDD_PA_B regulator nodes from the device tree
> and rely on WLAN_EN to enable WiFi functionality.
> 
> Add talos-evk-usb1-peripheral.dtso overlay to enable USB0 peripheral
> (EDL) mode. The base DTS will keep USB0 host-only due to hardware
> routing through the EDL DIP switch, and the overlay switches the
> configuration for device-mode operation.
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
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   6 +
>   .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 131 ++++
>   arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 614 ++++++++++++++++++
>   .../dts/qcom/talos-evk-usb1-peripheral.dtso   |  10 +
>   arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
>   5 files changed, 900 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 76cf0115a00a..9b18ec342eae 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -324,6 +324,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +talos-evk-usb1-peripheral-dtbs := talos-evk.dtb talos-evk-usb1-peripheral.dtbo
> +dtb-$(CONFIG_ARCH_QCOM) += talos-evk-usb1-peripheral.dtb
> +talos-evk-lvds-auo,g133han01-dtbs	:= \
> +	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>   x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> new file mode 100644
> index 000000000000..884df2d4f4e1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso

Found warnings with command:
make -j99 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y W=1 
qcom/talos-evk-lvds-auo,g133han01.dtb

   DTC [C] arch/arm64/boot/dts/qcom/talos-evk.dtb
   DTC     arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtbo
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso:71.3-16: 
Warning (reg_format): /fragment@2/__overlay__/bridge@2c:reg: property 
has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso:65.25-67.4: 
Warning (unit_address_vs_reg): /fragment@2/__overlay__/bridge@3d: node 
has a unit name, but no reg or ranges property
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtbo: Warning 
(pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtbo: Warning 
(pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtbo: Warning 
(simple_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtbo: Warning 
(i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtbo: Warning 
(spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso:69.25-105.4: 
Warning (avoid_default_addr_size): /fragment@2/__overlay__/bridge@2c: 
Relying on default #address-cells value
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso:69.25-105.4: 
Warning (avoid_default_addr_size): /fragment@2/__overlay__/bridge@2c: 
Relying on default #size-cells value
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtbo: Warning 
(avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtbo: Warning 
(unique_unit_address_if_enabled): Failed prerequisite 
'avoid_default_addr_size'
arch/arm64/boot/dts/qcom/talos.dtsi:1964.20-1999.5: Warning 
(simple_bus_reg): /soc@0/gmu@506a000: simple-bus unit address format 
error, expected "506d000"
arch/arm64/boot/dts/qcom/talos.dtsi:4441.27-4504.6: Warning 
(avoid_unnecessary_addr_size): 
/soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary 
#address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" 
or "ranges" property
   also defined at arch/arm64/boot/dts/qcom/talos-evk-som.dtsi:350.12-353.3
/local/mnt/workspace/virtualWorkspace/code/qcom-linux/linus-branch/arch/arm64/boot/dts/qcom/talos-evk.dtb: 
psci: 'reboot-mode' does not match any of the regexes: '^power-domain-', 
'pinctrl-[0-9]+'
         from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
/local/mnt/workspace/virtualWorkspace/code/qcom-linux/linus-branch/arch/arm64/boot/dts/qcom/talos-evk.dtb: 
clock-controller@100000: 'clock-names' is a required property
         from schema $id: 
http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
/local/mnt/workspace/virtualWorkspace/code/qcom-linux/linus-branch/arch/arm64/boot/dts/qcom/talos-evk.dtb: 
remoteproc@8300000: Unevaluated properties are not allowed ('cooling' 
was unexpected)
         from schema $id: 
http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
arch/arm64/boot/dts/qcom/talos-evk.dtb: 
/soc@0/remoteproc@8300000/cooling: failed to match any schema with 
compatible: ['qcom,qmi-cooling-cdsp']
   OVL [C] arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb
/local/mnt/workspace/virtualWorkspace/code/qcom-linux/linus-branch/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: 
backlight: gpios: [[71, 59, 0], [71, 115, 0]] is too long
         from schema $id: 
http://devicetree.org/schemas/leds/backlight/gpio-backlight.yaml#
/local/mnt/workspace/virtualWorkspace/code/qcom-linux/linus-branch/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: 
psci: 'reboot-mode' does not match any of the regexes: '^power-domain-', 
'pinctrl-[0-9]+'
         from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
/local/mnt/workspace/virtualWorkspace/code/qcom-linux/linus-branch/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: 
clock-controller@100000: 'clock-names' is a required property
         from schema $id: 
http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
/local/mnt/workspace/virtualWorkspace/code/qcom-linux/linus-branch/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: 
remoteproc@8300000: Unevaluated properties are not allowed ('cooling' 
was unexpected)
         from schema $id: 
http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: 
/soc@0/remoteproc@8300000/cooling: failed to match any schema with 
compatible: ['qcom,qmi-cooling-cdsp']

Thanks,
Jie

> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
> +			<&tlmm 115 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +	};
> +
> +	panel-lvds {
> +		compatible = "auo,g133han01";
> +		power-supply = <&vreg_v3p3>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* LVDS A (Odd pixels) */
> +			port@0 {
> +				reg = <0>;
> +				dual-lvds-odd-pixels;
> +
> +				lvds_panel_out_a: endpoint {
> +					remote-endpoint = <&sn65dsi84_out_a>;
> +				};
> +			};
> +
> +			/* LVDS B (Even pixels) */
> +			port@1 {
> +				reg = <1>;
> +				dual-lvds-even-pixels;
> +
> +				lvds_panel_out_b: endpoint {
> +					remote-endpoint = <&sn65dsi84_out_b>;
> +				};
> +			};
> +		};
> +	};
> +
> +	vreg_v3p3: regulator-v3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&hdmi_connector {
> +	status = "disabled";
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	hdmi_bridge: bridge@3d {
> +		status = "disabled";
> +	};
> +
> +	lvds_bridge: bridge@2c {
> +		compatible = "ti,sn65dsi84";
> +		reg = <0x2c>;
> +		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				sn65dsi84_in: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				sn65dsi84_out_a: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					remote-endpoint = <&lvds_panel_out_a>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				sn65dsi84_out_b: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					remote-endpoint = <&lvds_panel_out_b>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&sn65dsi84_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&tlmm {
> +	lcd_bklt_en: lcd-bklt-en-state {
> +		pins = "gpio115";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	lcd_bklt_pwm: lcd-bklt-pwm-state {
> +		pins = "gpio59";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> new file mode 100644
> index 000000000000..e57dc370c4e4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> @@ -0,0 +1,614 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "talos.dtsi"
> +#include "pm8150.dtsi"
> +/ {
> +	aliases {
> +		i2c1 = &i2c1;
> +		i2c5 = &i2c5;
> +		mmc0 = &sdhc_1;
> +		serial0 = &uart0;
> +		serial1 = &uart7;
> +		spi6 = &spi6;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		can_osc: can-oscillator {
> +			compatible = "fixed-clock";
> +			clock-frequency = <20000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32764>;
> +			#clock-cells = <0>;
> +		};
> +
> +		xo_board_clk: xo-board-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB2_VBUS";
> +		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb2_en>;
> +		pinctrl-names = "default";
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	vreg_conn_1p8: regulator-conn-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_conn_pa: regulator-conn-pa {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_pa";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_v3p3_can: regulator-v3p3-can {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v3p3-can";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v5p0_can: regulator-v5p0-can {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v5p0-can";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> +		pinctrl-names = "default";
> +
> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		wlan-enable-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply = <&vreg_conn_pa>;
> +		vddaon-supply = <&vreg_s5a>;
> +		vddpmu-supply = <&vreg_conn_1p8>;
> +		vddpmumx-supply = <&vreg_conn_1p8>;
> +		vddpmucx-supply = <&vreg_conn_pa>;
> +		vddrfa0p95-supply = <&vreg_s5a>;
> +		vddrfa1p3-supply = <&vreg_s6a>;
> +		vddrfa1p9-supply = <&vreg_l15a>;
> +		vddpcie1p3-supply = <&vreg_s6a>;
> +		vddpcie1p9-supply = <&vreg_l15a>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p7: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p7";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vreg_s3a: smps3 {
> +			regulator-name = "vreg_s3a";
> +			regulator-min-microvolt = <600000>;
> +			regulator-max-microvolt = <650000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s4a: smps4 {
> +			regulator-name = "vreg_s4a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1829000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5a: smps5 {
> +			regulator-name = "vreg_s5a";
> +			regulator-min-microvolt = <1896000>;
> +			regulator-max-microvolt = <2040000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s6a: smps6 {
> +			regulator-name = "vreg_s6a";
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1404000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1a: ldo1 {
> +			regulator-name = "vreg_l1a";
> +			regulator-min-microvolt = <488000>;
> +			regulator-max-microvolt = <852000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2a: ldo2 {
> +			regulator-name = "vreg_l2a";
> +			regulator-min-microvolt = <1650000>;
> +			regulator-max-microvolt = <3100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3a: ldo3 {
> +			regulator-name = "vreg_l3a";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1248000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5a: ldo5 {
> +			regulator-name = "vreg_l5a";
> +			regulator-min-microvolt = <875000>;
> +			regulator-max-microvolt = <975000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a: ldo7 {
> +			regulator-name = "vreg_l7a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8a: ldo8 {
> +			regulator-name = "vreg_l8a";
> +			regulator-min-microvolt = <1150000>;
> +			regulator-max-microvolt = <1350000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10a: ldo10 {
> +			regulator-name = "vreg_l10a";
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11a: ldo11 {
> +			regulator-name = "vreg_l11a";
> +			regulator-min-microvolt = <1232000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12a: ldo12 {
> +			regulator-name = "vreg_l12a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1890000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13a: ldo13 {
> +			regulator-name = "vreg_l13a";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3230000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15a: ldo15 {
> +			regulator-name = "vreg_l15a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16a: ldo16 {
> +			regulator-name = "vreg_l16a";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17a: ldo17 {
> +			regulator-name = "vreg_l17a";
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	eeprom@57 {
> +		compatible = "atmel,24c02";
> +		reg = <0x57>;
> +		pagesize = <16>;
> +	};
> +
> +	eeprom@5f {
> +		compatible = "atmel,24mac602";
> +		reg = <0x5f>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +	remote-endpoint = <&dp0_connector_in>;
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_phy {
> +	vcca-supply = <&vreg_l5a>;
> +	status = "okay";
> +};
> +
> +&pcie {
> +	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&pcie_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&pcie_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,calibration-variant = "QC_QCS615_Ride";
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
> +&pm8150_gpios {
> +	usb2_en: usb2-en-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		output-enable;
> +		power-source = <0>;
> +	};
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs615/adsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs615/cdsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&sdhc_1 {
> +	pinctrl-0 = <&sdc1_state_on>;
> +	pinctrl-1 = <&sdc1_state_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	vmmc-supply = <&vreg_l17a>;
> +	vqmmc-supply = <&vreg_s4a>;
> +
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +
> +	status = "okay";
> +};
> +
> +&spi6 {
> +	status = "okay";
> +
> +	can@0 {
> +		compatible = "microchip,mcp2515";
> +		reg = <0>;
> +		clocks = <&can_osc>;
> +		interrupts-extended = <&tlmm 87 IRQ_TYPE_LEVEL_LOW>;
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&vreg_v3p3_can>;
> +		xceiver-supply = <&vreg_v5p0_can>;
> +	};
> +};
> +
> +&tlmm {
> +	bt_en_state: bt-en-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		bias-pull-down;
> +	};
> +
> +	pcie_default_state: pcie-default-state {
> +		clkreq-pins {
> +			pins = "gpio90";
> +			function = "pcie_clk_req";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio89";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio100";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
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
> +		bias-pull-up;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart7 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn6855-bt";
> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +	};
> +};
> +
> +/*
> + * USB0 routing and EDL mode:
> + *
> + * The USB0 controller’s HS differential pair is switched (manually)
> + * between the Micro-USB port for EDL/ADB and the on-board USB 3.0 hub.
> + *
> + * During EDL (Emergency Download) mode, the HS lines are explicitly
> + * routed to the Micro-USB port to allow the SoC to enter device mode
> + * for flashing.
> + *
> + * After EDL the switch is normally toggled so the HS lines stay
> + * connected to the hub’s Type-A downstream ports, leaving no electrical
> + * path to the Micro-USB connector — therefore USB0 runs host-only in
> + * normal runtime and device mode must not be advertised.
> + *
> + * USB0 is configured host-only in the base device tree; a separate
> + * device-tree overlay enables the Micro-USB peripheral configuration for
> + * ADB. For ADB to work during normal runtime the DIP switch SW1 must be
> + * manually toggled to the off position (reconnecting the HS pair to the
> + * Micro-USB port).
> + */
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy_2 {
> +	vdda-phy-supply = <&vreg_l11a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l17a>;
> +	vcc-max-microamp = <600000>;
> +	vccq2-supply = <&vreg_s4a>;
> +	vccq2-max-microamp = <600000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&venus {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso b/arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
> new file mode 100644
> index 000000000000..2f4630a6ba66
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +&usb_1_dwc3 {
> +        dr_mode = "peripheral";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
> new file mode 100644
> index 000000000000..af100e22beee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "talos-evk-som.dtsi"
> +
> +/ {
> +	model = "Qualcomm QCS615 IQ 615 EVK";
> +	compatible = "qcom,talos-evk", "qcom,qcs615", "qcom,sm6150";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		mmc1 = &sdhc_2;
> +	};
> +
> +	dp0-connector {
> +		compatible = "dp-connector";
> +		label = "DP0";
> +		type = "full-size";
> +
> +		hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss_dp0_out>;
> +			};
> +		};
> +	};
> +
> +	hdmi_connector: hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "d";
> +
> +		port {
> +			hdmi_con_out: endpoint {
> +			remote-endpoint = <&adv7535_out>;
> +			};
> +		};
> +	};
> +
> +	vreg_v1p8_out: regulator-v1p8-out {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v1p8-out";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vreg_v5p0_out>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v3p3_out: regulator-v3p3-out {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v3p3-out";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vreg_v5p0_out>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v5p0_out: regulator-v5p0-out {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v5p0-out";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		/* Powered by system 20V rail (USBC_VBUS_IN) */
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	hdmi_bridge: bridge@3d {
> +		compatible = "adi,adv7535";
> +		reg = <0x3d>;
> +		avdd-supply = <&vreg_v1p8_out>;
> +		dvdd-supply = <&vreg_v1p8_out>;
> +		pvdd-supply = <&vreg_v1p8_out>;
> +		a2vdd-supply = <&vreg_v1p8_out>;
> +		v3p3-supply = <&vreg_v3p3_out>;
> +		interrupts-extended = <&tlmm 26 IRQ_TYPE_LEVEL_LOW>;
> +		adi,dsi-lanes = <4>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				adv7535_in: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				adv7535_out: endpoint {
> +					remote-endpoint = <&hdmi_con_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&adv7535_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	pinctrl-0 = <&sdc2_state_on>;
> +	pinctrl-1 = <&sdc2_state_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	bus-width = <4>;
> +	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
> +
> +	vmmc-supply = <&vreg_l10a>;
> +	vqmmc-supply = <&vreg_s4a>;
> +
> +	status = "okay";
> +};


