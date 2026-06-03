Return-Path: <linux-arm-msm+bounces-110989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8qp8H7s1IGqDygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:10:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5196386C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:10:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KFGZv6Pw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IQ04PDYc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110989-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110989-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3E9330107CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9136339AD51;
	Wed,  3 Jun 2026 14:04:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4453451B2
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:04:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495465; cv=none; b=HYefOcMSXJ2mTFRwEd548bjfuXnHUeoyBaSz92c27AkgtoiHS+P3zquA6bLMt9Rhq0jpwDA2UtCrh//dtutmoCmV5LEXaOJNKD8eh+aZJG9fKqfJN9gh1XaKf2Hv5bYucexTl9/1St6L5XH0FlPlD0jOHJQkPD/Qr+emdcS4qIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495465; c=relaxed/simple;
	bh=xYkbXhu7MDhbg/KOcFclCa+1Zm4Y9NpS4pWis5ZBpkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=johEpYnD3Hve/Fe57/bXKL69PaxVuOaeX5sLvWy8i3HMrAqmeaYwNoqoUO+f1KgrVzCIPC/6DaaYgP2LtLQBIJlgUP/bbKyFJvgJJD8XmIsxRbDYOX5HkxMO6lIzeFWq+4ndKciJPZG/hzEDC73+c+9uQT6R3OnfelXWMk/jb84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFGZv6Pw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQ04PDYc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CJ9NJ1200538
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 14:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOMKa2J8SL3wZtOufHuOjFi4CgBpP5AYCYvYXdxBH2Y=; b=KFGZv6PwieYvHGIJ
	U2qQ3s3X4/PejNKI/Xd5OxgGLEAHRrKdqc+bbVd2VcG1hA4Ucvi9nxXEp4xBDxLv
	VJ/y1L34uzYZllelJEuxGiF2WkYEjQ5elrjfo+ygImnct/qwxPA8/3FJbEeFafIX
	dYhDiY8VhhqcDWqMzBTv8L8Oue+LhmY+UVVuXMEBtopVLbFTaVkBjuOgJiIwVi9O
	5dfNLcO6W5EzSeAGLFT15uOvkWZEBgt2Li4/DLPXxgjLDecItNs3K5J36UkW5dfx
	zBjzwnVCyuP74+nsx9xz2UdEGf+MCwF6q+9U8fJosedgn+G6N0Y9ZauML5cA62yj
	Z3Foig==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw2b9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:04:19 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4853eb6fc29so2107884b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780495459; x=1781100259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOMKa2J8SL3wZtOufHuOjFi4CgBpP5AYCYvYXdxBH2Y=;
        b=IQ04PDYc5NneEttXLZcQ831lruqg1X1PRaJ7ycpOsDONUBt5A5EyV9Ndyupy6iGl5z
         gxeDQ2e5TNznKtEOCeXqf8SCSLxkr2qLep6qF+upaNQcBKyMvc5nTAFGGLJQGgnHtt6P
         JJyEqZfI5r9u3TJrUZWfXo57cTKKz5M8VCbUcMbMGfvRWs8heHW0shXkofRqDsvbI/GY
         8xr0d4vDXtsIeY4IgOI7Vi9eMPIuJ8qp/5ru0V/lBctYVGQljb2P1kkMgb7TDFy2nwIe
         JS+8uHGWH1JlLPrP3CTlZgBEBzvHkI4BJWIH6IIzpOkcE0GZIKIh6Wd1kIkcpvr6iapR
         j7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495459; x=1781100259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOMKa2J8SL3wZtOufHuOjFi4CgBpP5AYCYvYXdxBH2Y=;
        b=Y4fp4U8MkL7aRD1C1eqEKz0Qy12GWp5kUHRxDFYrr2Vv18Cg5IghIVi6N8tkOtahP2
         pJyOobrjyZom9KEZ0Bo9h2YHsTCl795G6IwKWwnPn5AZeKhvvOx/RsgcFNOFcZegeHFJ
         eeHCWkKpjR4CoomDArfyE28MavN5Ns7XKuPrsl66J2WkYDfXnT8/MliDNqSMo+eQ0IlU
         DuENGj6hC1Y23CF3hCYaXUraTrCBX05/dp5a6iCWmtDRAgGE2yiGDPPBihOZCJXaTu21
         2s5phEhvtQHptzIfbXu0pd3j50Ajeo2o8354HU3Z/s9gvZ8AMO53frmwWTbEMmEqTf/D
         Ejeg==
X-Forwarded-Encrypted: i=1; AFNElJ85NhT1Kaco9ipzqlNgEnV7YFgcrJWAqDlRJmTADz0ouL9uYQVtmJLQBzrsqLLwthVcRZ1PYfXJQf83rzLl@vger.kernel.org
X-Gm-Message-State: AOJu0YzOyGoHw9lt948kPKWYkczd5WhgZywJcx48qXNdLFCUKnf7kS5r
	T9OSTU9ZKEILn6hAW56XAG/ZAxCiTyJTWLB2FQZJKw9P31daZtwKEwZl7MgCKK7nt2RsXNHABEF
	3UieWVVJHUx5tA6NfUIzTK/a5Jj0K2HJMdUYzqSV4T+tNQnm8GbZG7sCWSreqqtnqYfY1
X-Gm-Gg: Acq92OHgrmTsilJeO7Ck7xUTA0wF49B70omwVq2i4L1CdJdk/x/GadNi2bYktWAa+5u
	zsrUv+9sQ+uF6Fw96/0dutoEMuB/2NssX0eAuv44nvcwbZGEqycb3y0MZ31auP8lWRvmJZYKBo5
	CIX9mt39f4oscCWmQ+Daz6eFQVtLyJwtveVvNgourX79g6sFsMOxdeyH9DrqeWjAhAPYFQ7H0pN
	clcsAvOXP37iabMA9i/Sw4J9Nbhxxpr9Lt/uafXAL2w/Z37XQMzwbG265mpeUVq/mmyrCYA+OiC
	Yh4JbO6M1ypiAeAHxuONOFC9eGjc9rNGTg3htMCDGUjqio34tfOVXnO4U/DKrrZ+39hUyyoHpZ4
	4GowLuBzCtr/5kV3k7LXuRJxas5LeVRZlwU8IH3nJmruPkG3hB7uyk8os55/BoRAzB5ldJC2F1u
	kbdwZf6YDG9Xo=
X-Received: by 2002:a05:6808:2219:b0:486:4ae9:f9b6 with SMTP id 5614622812f47-486574df950mr1368418b6e.6.1780495459005;
        Wed, 03 Jun 2026 07:04:19 -0700 (PDT)
X-Received: by 2002:a05:6808:2219:b0:486:4ae9:f9b6 with SMTP id 5614622812f47-486574df950mr1368391b6e.6.1780495458579;
        Wed, 03 Jun 2026 07:04:18 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm1200920a12.21.2026.06.03.07.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 07:04:17 -0700 (PDT)
Message-ID: <7c33cf4d-4281-4e26-b1cf-fb6635b01b72@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 16:03:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
To: Qian Zhang <qian.zhang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rR2ue398PNZ3wxvudL6ziXluVfknF1_h
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a203463 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=e5wiE9tdTxe0cX7xfckA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNSBTYWx0ZWRfX26vbLmDGor05
 dx7r5H70RhBU4jZ6VsEPuNC4guDaghEj6fCdbsiKy3gz03Q9WhCetGsry+Fh8pzIBC4QwvzN77y
 MmaQZNCw2S8+vJyUicMWDiY42346e+zH7xlBE+uqNKWKyM60D1cKWpMiwJPhtPwAuxoW8pg0g4Z
 fJte2KSqWlfobk2WWgdTpnjAjkOkGI+6Q3431DFUUyx854LUtkjxePd8fhxATg7wpfm6NNKvE4A
 ru+XwLP+yow7vKcglXM08x8TNiTYbK6o0SzbQwHRPJu5teSLPomMO1ozQNw1gxViT7KhZKesli5
 qSoA5/7qw2JQm97PmmX7cQuDj+n/k1elsJiyMsgp4F3OrYB0z7e8/Tw5gt52j0CHUDl0QwNcbpe
 ulDseJ/RT0th313aTt53j2EIKK/eDfXhCRY4n2QT4WpRC95E95iZ4v2dBmQ0gzmUCibLSbptGH+
 VKIAQ3KOYAA6rBq/xww==
X-Proofpoint-GUID: rR2ue398PNZ3wxvudL6ziXluVfknF1_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110989-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:qian.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A5196386C5



On 31-May-26 09:14, Qian Zhang wrote:
> Add support for the QCNFA725B M.2 WiFi module (WCN6855-based) connected
> to PCIe0 on the Arduino VENTUNO Q board. The following DT nodes are
> required:
> 
> - qcom,wcn6855-pmu: manages GPIO56 (wlan_en) through the
>   pwrseq-qcom-wcn power sequencer, and exposes the WCN6855 internal
>   LDO regulators consumed by the wifi@0 node.
> 
> - rfkill-gpio: exposes GPIO54 to the rfkill subsystem for RF state
>   management.
> 
> - wifi@0: describes the WCN6855 endpoint on the PCI tree.
> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> ---

[...]

> +	rfkill-wlan {
> +		compatible = "rfkill-gpio";
> +		label = "wlan";
> +		radio-type = "wlan";
> +		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlrfkill_default_state>;

property-n
property-names

in this order, please, everywhere

[...]

> +		vddio-supply    = <&vdc_3v3>;

Just one space before the equal sign and one space after

[...]

> +		pci@1,0 {

pcie@

[...]

> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio56";
> +		function = "gpio";
> +		output-low;

The driver that you pass a reference to GPIO56 already controls
the output state, drop output-low

Konrad

