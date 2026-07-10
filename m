Return-Path: <linux-arm-msm+bounces-118284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jlNMCmjuUGq/8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:06:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC76473B11D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:06:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PuhQXC6G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Du8s2foW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118284-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118284-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7BAD3051DCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C91342B308;
	Fri, 10 Jul 2026 13:00:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C3018BC3D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:00:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688416; cv=none; b=MW8A6de200CEeI7AGshDNx8gNfu+2nj2ig5avc7pEzO9rCl8gpdWrZqYN6v4HoqLkQ4X2V4jekKCZECBinHeC0+a7JhcVddK30bXJ9bnqf6oy1ByQkFbhm4sYwqTpbpMGauoqETLZfWBbxcK3l7+bsSUgNgsc8+UcnnTA4JzEBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688416; c=relaxed/simple;
	bh=PmXeuS+A/v+x53Qb+qL+JvhuBQ1sFDSeRb4adax00Ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LA8Q7553zWgBdQ1Gva/4DuY/O0NejYfw2UtczSqaNje2Xq4rwMDFQgW3orQh+jeg7p3Uo8M6kVGsvidbFimbPjR7zca3+pF/aTgmB6aK7Ga5c3vJ28qDHNrz5Q+wNkAotimn7fxxfgjWwPlyQ5l0mlqB9kEVVTUgj7KMKyODTf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuhQXC6G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Du8s2foW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmV7E605110
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9Beo4a6GfwyHuZZh9Hbzb5Kq0VxcvFZ/EiNXB2jbIo=; b=PuhQXC6Gk6j6LRq5
	9Q+/MFiOjZajkX1qKNGTTDTIOjgf2432sOZ1ATBzTmIfXZ++iuMUHsyqnuvVjUQw
	GVrLogYnX6bKbVVd4HisZuB+eLryn733JdqcCcOs4CUfJjyy1PpcDhEuNb/qoyX2
	4Ja4UUo2VEsULIry5GC8yNb2XCypGtGWZj+bntp/bmBM5WyZHlv+PkVPn4yf7Nfh
	2OF1Z6rIlxanYzzu1SlB6AHURbnVrc8pvgfFyV5gtFzTk/65JutbJUxilmotq8VC
	8lc+U8B+i0UgWBF0akU87z+nfpaLC4hQLF1yegfp+WzOPbIEOzPKirCshqMqqzBk
	7zOt7w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanweajcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:00:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e8e83314abso3164526d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688407; x=1784293207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9Beo4a6GfwyHuZZh9Hbzb5Kq0VxcvFZ/EiNXB2jbIo=;
        b=Du8s2foWU4nrsZY89l0Pg2YybfzBD24M9nHF6hyjFLLI/nnzaVG5zMeNyn9HGRQTqy
         9W/3JUy7fZXPEOcPfbGktFeWAZzNUWREx++JZ0XkSPe3ddJMIqbVNE5tTMg/XGUQqrIT
         daoO/P41GSIzPYNm7756MX8t6JZPx4pNR1TQH8DjeeJXXvkfxyNfyU8fAwfxk7ebL9hr
         Qa25Sl6WwX+TldXO0YI3iiQo/X0JqA+I7paBvT2DLorm2Uxen3BSyRuiBldcMoA1sfg8
         SGWMbkp3Zwm4MJVoBAqSC4Zj+oEEUDuu2H+eYh6mpHBDXazE1RSfXU/bQbTp2LvfnExV
         sH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688407; x=1784293207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9Beo4a6GfwyHuZZh9Hbzb5Kq0VxcvFZ/EiNXB2jbIo=;
        b=NnJTZoC7Pnku/DbN7OG6/I9ppWZluYPkRgIriqxejCfRcVaHSomFczx6waiiW/XtHV
         1Bb1eJqOkBcbuNEpd+S60VuJCVtZxnSjkUBEMq5DpbHj16gIZXICUoJm8L0uk5TQvdZY
         BPDG0NyrvspF36/ofsdMsTmx3lqlPSxEtHr5qqlaFphT99ZIz4VIXiTV66TOeStXPQnF
         Je4ggam1pkZ5xSw3H8GT26U+xtXWD6VkXjp0wXJ52D3lkykPUcc6gsBVTN7LHlpEzN6R
         7+8bWZrTPUmybc5HIr7Vscf7fpyGehiJMDBj7xvYbVSfYBEj2aRgqXjYthBqJSz08ROq
         TCrw==
X-Gm-Message-State: AOJu0Yxy5reOK1E4naBdt/ksx8QQS6fFong4Rtldy6h6JC7MndM1fDjl
	PlomoF2Yo2pEV7l/r5ZAepesd0XyovmCyDW/3erCS56zsbFOeOiV6k4MMuo7FXTq/JGA+oiNKj9
	NNRnhfBdMFLehFzMti0x1bORIoq+NNZFBkba6v+olVYWjCQfZNCjaW/k1yhPMX7y+N3Be
X-Gm-Gg: AfdE7cnD3NhAT2eEEo3wmB3HnQmknDwoZ+fvVwXgjNQbtme162RFGpy4MxX0hvRUn3l
	GzcOy585pIGSkF4reip8EPNym2b4B9uEOv9vBCl/0YMHJTSrv7WPROOnCDZF8GlXNFJh/Q1whru
	0vQGkNE/aXYoqbdQ4cLL/BB8BlNOZ4DtCKnPL8jvnrhVuBsIfTugMcRXIz5d0yZOxSE1eHunFGE
	ifkp+f3zREDPF+xttkMxbVE73WdGDdkO4r5UsNGLipBqzJugo6lNGfBEoJswcLrzIbEF3Lh1t1F
	AliUWwG22PPiN6/fB+BXSpwf4OLUZEF1gn7fNIplTnECmy6emq4RYINOgEm2bZuqUsWBtOf3Lc/
	C/9gK16YeAzr1Qv8WgrlxRQOJ5h6VFiq1N5A=
X-Received: by 2002:a05:6214:5f08:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-8fec73525f1mr108514166d6.5.1783688406511;
        Fri, 10 Jul 2026 06:00:06 -0700 (PDT)
X-Received: by 2002:a05:6214:5f08:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-8fec73525f1mr108513496d6.5.1783688405829;
        Fri, 10 Jul 2026 06:00:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm10646911a12.3.2026.07.10.06.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:00:04 -0700 (PDT)
Message-ID: <97d0233e-75fe-451f-a190-ee0797d2b551@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:00:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
 <20260710-shikra_adc_support-v3-1-ddc840fca0a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-1-ddc840fca0a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50ecd9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SXoWBDIS_OCUn4CpEIoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX7Nui7iEaTi4z
 Vmz+zGErmoXyW6Wb2QXSsZPdngdfjYj4Rjm/NOwZf2KREmsPG2H8/8HzY8u/emafBXLwh8N3u3I
 00dgMrdAPS0mw3u/WQ9R54cx/NaFQ1d4QW2nclftfNW2PpSh5dJ/Ysmij3b3H3p4ZOi9IrTG7rj
 u8vkXzGIWlUPVVqCk4/uFGudIpTH41xEZwFQIyaaPchENLzmWu8eq/1MofOsRoLngWDcOpz4PvX
 q+wWEUBoc49GNwriZ8DEV1MEfVHfMI+0yvVDLg5ZZr7bxKNrWIYW6/Cw/3XodUY6pPsVkK62jZ2
 Ix1BQAPC9NDzz8Dh3r9MAa6KzQVJfvQq0up1/25NYKZlbBdTUr3hOHRK2Fs4BVPZLymWL6Hl7QM
 6gC0XCYxdhc3IlRimZ6uNqAxXf+KbCmLUnBF6+5CdhKx6WfWx5ZtD2UyHXiEi+k2bI6WTdZckV4
 qot5mKo4HUGtmvjK0lQ==
X-Proofpoint-ORIG-GUID: QhznjrabI8vxCzev4LP0OCGY8f7-mvxw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX6w+5RxIVNm3i
 FO9mTFqYv/ceLhcNqqi16Hyp43RjyHjP+E/9+/D7Lb25ktJKN4EEclyfTRTU+aPaxOY4Rb9sT6t
 DCw1nICGy/7Pr+6mmxvgZj65wXfybZw=
X-Proofpoint-GUID: QhznjrabI8vxCzev4LP0OCGY8f7-mvxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118284-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC76473B11D

On 7/10/26 8:52 AM, Jishnu Prakash wrote:
> Add VADC node with some channels under it, for voltage and
> temperature readings. Add temperature alarm node, used for
> PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

[...]

> +		pm4125_adc: adc@3100 {
> +			compatible = "qcom,spmi-adc5";
> +			reg = <0x3100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +
> +			/* Channel nodes */

This comment is mildly useful but OK

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


