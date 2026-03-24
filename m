Return-Path: <linux-arm-msm+bounces-99623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOuWORdwwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:05:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 254B5306FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6640D302145B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B103E5EC3;
	Tue, 24 Mar 2026 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PA1cUVR3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnARYDoA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FEC18D658
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349440; cv=none; b=JvT1y7JE5AkX/MswF/7O2IkeQF5mHAed9CgnZUXq7yTU6TteYBLj3sD2G3Yk1OLfxw6lWJvzphZoBAfV2kf9vVrmV93U0sO+lFsno6UCjTsaY+jv94iwlCeMNDo8Did6upObXlVqLT8MBFVm/kxVy5V9wgt3UiJvmBfP2R1IZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349440; c=relaxed/simple;
	bh=W4mqx4IGbi0XyuNEpZsq84MGmhg7ANoyky+79AVy+Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6NJADFsUxbSeOGBFr4/hg6ECkkg4Yoi/81P28uXE5b693V8ioU3g0BukXR+4ISL5fPwxbnK0xNAEc4uytBjpygu+t+6TiHpgOgtsT0W7Om51QWvFPm7PahVaJKCUvC/TPrZethjxmsDu2aBC0LuSw8wy0l7aI9hctBoF1pD8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PA1cUVR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnARYDoA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xgmE2322873
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNjge6Nz49ll7u6MKOydj9vys950Bf2Wr0Hdbte7e70=; b=PA1cUVR3E3ay/DbG
	iK41uVo13xhYXuh0Jg7EtKluwaaXeacen3uiEMCedFfBLoCxqPXe3xlWBRVUlMZk
	ReOPgbOsWVaa1fFMA5T+bUUhoAK2UzsPn0E4WSrWWrpZ0WjyPXY/kaCJxKGeCc2K
	nT80MIlSlpTEnvGhIRSIuba1e1EfPtT/lwCAqXo3S+RNgafg9JWPLwfwOfWyzU4X
	8dMXMrKZrOfr+qt/yllwd2tzYiUemr2A3exoHTsNVNvoobWGYQWFx3o/Q7Iy2ivT
	yM9Exq6GdUgHOVMj0U1yoWD10W69akgTIyCyEKovaJj7gtOFnzHfRf4SbQZeQ8Q0
	6f2KEg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkereek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:50:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2d5e61f6so31779941cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349437; x=1774954237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNjge6Nz49ll7u6MKOydj9vys950Bf2Wr0Hdbte7e70=;
        b=hnARYDoA9S6uF8J/Py3XlVK/lt3vVJaAuadpiE/amZ2NfBVWL3vZUs71hpFOCwGn2T
         abX1GyA9+ajHAnUA7z9o7f80237zaXZR8qPHkPyCfRe5KtnI8BDALI+/FMnzyzoajolW
         5hKHxkq0UFKbcFvEA3cYn2rvMa5h0rSP7xioYECTV2WCTVbxqGGuYUIsWadC9ZBBJJhr
         Y9DdNvFxy+vjkQ3RJTMNMFn0d9xljaA/XPg+4cSqVz7yLkYDu9nEFBbiKWgfg+hH5Vvo
         8QJACqWUd4B7E0tWcfMFgep3c4agOq/I5/AiEoiqDwBCcskWTCiUfc95r9hWy7Wso6XD
         A3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349437; x=1774954237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNjge6Nz49ll7u6MKOydj9vys950Bf2Wr0Hdbte7e70=;
        b=PZ2JeVhjwI6KcgV2oTm8V2j1i3Duq3hwm/bG27q4mH06yQhgfm8eL5Ci/hI+lNJX+D
         YF7x4r1A78Z5Dl4c3oUD+sVtr1DnzhDyW21fbcAmEcHZ6v0zE4V3x/gRG4nabBAeVn9M
         RabQUSApkq0E3BabXHLNKLLrcKSAASascyWn9dcay/RmaDNVgI/D+jH+KGU0wRCKFSoo
         n0lWFAA3migfhBfFZ23A/pA7jgagPk1mBrSZtxmKlZEXwAghZQz375G935cA5Q8yKksE
         qOpgEqG5bVMgf3YREG81kpvmxL4VTp9NW/KAw11QG5N/ywmqOH4+01jkyJ6rsdMokpGw
         ubdw==
X-Gm-Message-State: AOJu0YyxQuWnJJ6FSYDo50zRjqtBAVidwtm6qfHfHy0YUL4RsGVXtRsF
	4XySk/CYf08seZk/5sGZm9TdjcCWS/XyHFjdifvQRzTdMFNmuM4NWYcEXgEdBYD6ourcDSDK/jZ
	DYIviOY3qBViPzTpz1jNesl+g2ny/oUnWNafws9U7DZhxI6Oo1YhkqIxiB+cmKaSGE96/
X-Gm-Gg: ATEYQzywDdmaLL/kgYXBj2Tn+WIT3sDFDLjrbj9ftWTMY2M0aKvpT0PypALUL09UW8m
	k5Qq8jb8sq9PRTK8kkUPM8l3oRjysiOAh44YlSsOKO/XPm/eaTuySyjUd/eV/JyFvnP6O67Mkyr
	EeqRdjG1s0aOPuZnhl6ymbBd56DUb5e3bKSpXRXmtlPb3xvuX93VK8Im3I+EasGMvwe9g0aC1lk
	8i94v6R5TkYd/TWp4hHjL3jvuKsOxhE4j70KvGphrNUYwlppIEY2HdlPx+nWmnwD7vun73tNv6+
	3czDZCbvyPBCoxXHL3nMq5Ed6EerscaT7lPazbDklO+/hXx7KfZ6aaWN9vLljB9AD4XQRXqEGPe
	EskwwkjoNoCu7LyRUBgQtsFAPnRnVFXo1jiLWg60XPjcryEfwACTsDxlxgazZQDX0pVW5V12mDZ
	yMk1k=
X-Received: by 2002:a05:622a:293:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b373d3484mr182867001cf.2.1774349437396;
        Tue, 24 Mar 2026 03:50:37 -0700 (PDT)
X-Received: by 2002:a05:622a:293:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b373d3484mr182866731cf.2.1774349436919;
        Tue, 24 Mar 2026 03:50:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2677970sm4562953a12.27.2026.03.24.03.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:50:36 -0700 (PDT)
Message-ID: <ed869f72-8ff2-4901-8b1f-273f2a635bdf@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:50:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/15] arm64: dts: qcom: sdm845-lg-common: Add uarts
 and Bluetooth
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-4-29d70ca1651c@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-4-29d70ca1651c@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rEOP7Sv_yXHGYG1732AOjC2NV26o-YEb
X-Proofpoint-ORIG-GUID: rEOP7Sv_yXHGYG1732AOjC2NV26o-YEb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX4iPjCOlTU9BY
 pja6iO/wo9NhNvHItqYwCYEgmeWc48OVVh4eQgxF3wdc9qH/b8UrkKUPLp7X9o0q2AFPvmjIcVa
 6XlQj1cHvd/70mzGReZiyC2ikWWPDfU53JDH2OKpo1ZK7PBVda3VUYuFuBeRVlRXJsXheO3MOoj
 exCcpJirhPa68hQhW3lkUkEgvHKXx69sYZQG4jvod5vm7J8FqtbIlWY7USlJu9J5IdbC7EpFM4x
 yVVlH1zvIjc20ciVDcqf3aJl5gJ2U7tqAxvNu2lSCt9DANFOQA0TwlyapgcypJ1Q7pDYIKut8i3
 cAX2I5WEweoNVK5OqZUZvX0GufCe0neYTaumsGwAqMlJvNzWUq4AJu23co0uFsYF9SUULAAe1fY
 SXksoPE0YjRzMGUAh/urlFGKr6hhWmp/LYptZ0GZpkc8qPVt5xrXeAW0pleD20T+peYCjfWkKDH
 Q7hh9a6nUOEMiNlSTmA==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c26c7d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Mq719mGqAAAA:8 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8 a=rV8w3nCtgW5a9bFugD0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=gOTWM5O2Sh7P_NUuVqe5:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99623-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 254B5306FC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 3:06 AM, Paul Sajna wrote:
> uart9 is debug serial on USB SBU1/2
> 
> UART RX is SBU1 and UART TX is SBU2 of the USB-C port).
> 1.8V Logic Level
> Tested using pololu usb07a https://www.pololu.com/product/2585
> and CH340 USB-UART
> 
> uart6 is bluetooth
> 
> Bluetooth: hci0: setting up wcn399x
> Bluetooth: hci0: QCA Product ID   :0x0000000a
> Bluetooth: hci0: QCA SOC Version  :0x40010214
> Bluetooth: hci0: QCA ROM Version  :0x00000201
> Bluetooth: hci0: QCA Patch Version:0x00000001
> Bluetooth: hci0: QCA controller version 0x02140201
> Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
> Bluetooth: hci0: QCA Downloading qca/judyln/crnv21.bin
> Bluetooth: hci0: QCA setup on UART is completed
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 09bfcef42402..e530a08f5e27 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -43,6 +43,14 @@ &adsp_pas {
>  	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
>  };
>  
> +&bluetooth {
> +	/*
> +	 * This path is relative to the qca/
> +	 * subdir under lib/firmware.
> +	 */
> +	firmware-name = "judyln/crnv21.bin";

What about the other board?

Konrad

