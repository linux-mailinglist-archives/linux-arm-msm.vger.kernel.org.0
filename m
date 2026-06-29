Return-Path: <linux-arm-msm+bounces-114836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1o65HtIBQmrnyQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:25:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C81486D603E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:25:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ptWIoWy1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B4oqMNE1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114836-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114836-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B3793018773
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C735E2EA72A;
	Mon, 29 Jun 2026 05:25:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FA02DFF04
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:25:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710715; cv=none; b=sb3K/UNP4agTbNhBK6h6hrjC/pYY5YsmwlRz98HpundzkMbPdad6hF1AJncrHVFRmNlDK1MG2eKBm4DrhyiqnXHfMMZU5cBrXR694YNjdHJReOzoBfnYbmFHcI3RMrAhyb5kpM2q9NtkRGxE6PtiEfBk1FL9UexjNqQf8dRCsTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710715; c=relaxed/simple;
	bh=3fsySZNJTDVB4JSAuMEOgU7jkxjFmNSkojHyrgfoseY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYU2n96cdJisqlxGgACirtL5WFopPj0kOX5BrSUqgVpZ0afpm5gUW3lp3D5O/OVDJ8VvkhfL8AlioLhOxZTd6SaSc/9FU4d6CSuz6k4fSR+G16I/nK7BFv89CHUnRUTwwX8+PbvJUS5+h6tbi6bLOnBmBCv7b3kz3X7AWcfV7FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptWIoWy1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4oqMNE1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHpq1771381
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/UWnySdbWNtKsfc3NsH11bLgfeExMa8Kg3noHbEtSI=; b=ptWIoWy1mds5fetW
	T5B91igL5n+EqJgN8loLr08SSzqtQCgUZL5hqrPGpQckV4+n8chDJ990hs7663H9
	fVYmj9pG5hFjaHPEWEVvKJ4BC6hKIEEzSaPY+R1Zm4alA9mufr1EEqf0dORO4Chn
	jApUD1CA21jyNu1RXbmnqP+g/zGB/4ghg0HV2Z4zDkcBaEdyIUizUvO4MwgfX+Ec
	K05k2fDZN1W1AbNpCMce3CMR1b6aKWTtoFGym0anSDVpce69iETMSG92fHeE0jVF
	nHB1ZHO+SWJUwTUJ5/VizjYgldQhQwobQOKI+06CW5Pl7AP+LY01139jBgmWBLSc
	78xOlA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumjdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:25:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c42d96713so1808865eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710713; x=1783315513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/UWnySdbWNtKsfc3NsH11bLgfeExMa8Kg3noHbEtSI=;
        b=B4oqMNE1B0XP5PmzkpbemehvhKBtFfZ/sJzzzrf2KieZjpA/Bq+ZAWii3hHC9Ri/J5
         567MHDI6qJR4NnPS3qR8G2y7gLo3WCdAFmtiJ7VIGvlDcVHV3JTXF3k4BJc1hRaW3Jj/
         w3gUiUHOZ6kpDqbQa9+QDDfByWtwIdwo0PPIal1R9Sbqj8senml/W1xtRO3YBdMyDlmh
         xIOfkRu3Ba5c/HEtqUQuTwT2FDf63H7xibz9HWgXC0IbUuDhf49nbSu6pMfBPH7/DFep
         dGNbQ+Dw44NMmKuoeuc5iBtgWKfC9oOcta3PFpM+0x12ikDD9TScDMaXlkLwfgR4SZPy
         pLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710713; x=1783315513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/UWnySdbWNtKsfc3NsH11bLgfeExMa8Kg3noHbEtSI=;
        b=rHCEc8txOZWcWjvtt3DIB/hKLEzmJCzn15MKAgMI0AEYUd0yg+ElwKsC6Hw5hocvRU
         Y/NI7REN5+Ic9pCAuePiZQ2lyNuKL8S25dSEtxoRrXB8pOnbYrCVyrreAjV134a3JA+g
         yCvoZ7LFYjHDfo0ZMKxt/pqJNJntIxRS+5rxns+cUZrPgl+UB3x0zQ232PbD4Zb/VUDv
         wmUGg4DLQzpvFLPSXil591HARXPG9m6lcf4aozNlVIkUfRdPj36p0MYf3gVV9PREs6Lc
         WKGLxrVrZrSJZ6VC4d/nFO6xDlDKiNgrz1loLh1eCDEFelCMYd326lJx3rWNLhC8DovV
         fFeg==
X-Forwarded-Encrypted: i=1; AHgh+Rq17k9/34qdXrA2j6WSHy1m/WpI8feufLHzRaOP8hWAQac7RBZjEPI42sM93ejj8nQFv6+FZy0AzJ/pNgMg@vger.kernel.org
X-Gm-Message-State: AOJu0YxcvXS1OCsJkTr0sRNMfs2Wvcuec0hcoGRIQiur6c/YYAQIlYq1
	nM/arycVoovy1V643mWr0nCOcCA8uD9cP61BYnBCYxZ9x2WRRrX3N4HeyPpqeQOBGhOw3FnZwdo
	MS/aBJGTUZnp9sH+35qGbk9ppi5wlc2LnrzhyCK/UHWPqgl+EpX6s3VA9I+v6Sud+Gk/X
X-Gm-Gg: AfdE7cldKYbMnAP6ALQsgGlsM2g1uaK4tLVlPj1E8rCZ4rU9KXO4SrSbTrHPQdosDEM
	Nfk434AiCf0CA75cm/CDp3EInY6tJcVHNu2SY8/MqkZ/OY100T8/cWaKyhqMIba4rDsA98ADFku
	wt0BKOnnWhhAAbinq5RucZV9V7dlStEKBw/481yXJ/a2bzgo32b3WCBBnjpm1KpXD0Qm1YeQTCK
	FTBnsdlUS/S30RXoKDsyK+XR2L2nQrWlLRjIyCODZ1KjYGck3Bw/fjvgF5E2+4zaOZUHX9wofYX
	jHfBLsvHdx1L1+mWosxNFRdK/mjEXmRtbxduwLIQ0txc/QuH2etWYXvueULKYTi/QhhGIFrTId8
	jAamn1yIenJQP3Uyxsomsc5gZoaZCYtE9JLZtyoOcB09rUxCiqg==
X-Received: by 2002:a05:693c:2d8c:b0:304:c9f1:a0f6 with SMTP id 5a478bee46e88-30c850ac4c9mr14824174eec.33.1782710713395;
        Sun, 28 Jun 2026 22:25:13 -0700 (PDT)
X-Received: by 2002:a05:693c:2d8c:b0:304:c9f1:a0f6 with SMTP id 5a478bee46e88-30c850ac4c9mr14824148eec.33.1782710712902;
        Sun, 28 Jun 2026 22:25:12 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca5e601sm40256750eec.25.2026.06.28.22.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:25:12 -0700 (PDT)
Message-ID: <2f24a5d5-05ff-405f-aaa5-090762a33863@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] arm64: dts: qcom: shikra: Add soundwire and macro
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-5-mohammad.rafi.shaik@oss.qualcomm.com>
 <2c615e8f-674c-4def-b789-6e9c445a2241@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <2c615e8f-674c-4def-b789-6e9c445a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8y0ffpDBOLF_Ye8-ZfIezIvF7tCSPM8o
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a4201b9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oy-t22pWcpDjRAVjGbQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 8y0ffpDBOLF_Ye8-ZfIezIvF7tCSPM8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX7IK41UzzCoF+
 wmGcUoF+L52xNgjmPKXhwI7gXklMRMQ3YVfha4kYdI05oGhsAbnQWOqycY4lLczKqdhmPpMPSMN
 uwXn4Xz52VE1B9n0Rv5qcXi8pqjrGzQ/eMCEGKI3Yr3lKeRsCTW3QP/l0PtY8PLDO6KtWO223v3
 xldHyH0o6uKOJrGWQ3sTMovn/QomlxVX9FEUBycj1Q6TGkZ0s49Uk5VVD9toFy1iEQjus8VN4ZA
 O0FI4hNs4EIw9z1G8yzp0iOQSbZvWUM60n8pgwPUPeMXsnKXfJjkfGVULAux4yoQESt87HZUDcK
 bKNrRB4I86PI9deol7QOvsVIVopj/XkYuLaXg+gp8dz/H5BYV7hZr/5+xoE4i4vM9BdAWIlRoUT
 EOp0BCP+jh4UDGkD9CAJJwqOlYRkGs6sywLlLMEZL7QlVc+i13fArneM9HKs0w98IBHOkDSpkAy
 +IUddyU+gOtyaVnYzZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX3IiYRh0kUJOD
 MLnq33ZgzmiOIkyQjK2yHBa7PPrjILRUsz7Uyzjb5kNeSPGYwfauOBmpAHoSIxvqe433ueMNATU
 +nmDg42XSIpQO8WzG5GfNyLwBPDcXXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114836-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C81486D603E



On 6/25/2026 5:15 PM, Konrad Dybcio wrote:
> On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
>> Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
>> DMIC and SWR pinctrl states required by the audio data path.
>>
>> Keep these nodes disabled in shikra.dtsi so board dts files can selectively
>> enable and configure them.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> Just a couple style nits:
> 

Ack,

> [...]
> 
>> +		rxmacro: codec@a040000 {
>> +			compatible = "qcom,shikra-lpass-rx-macro";
>> +			reg = <0x0 0x0a040000 0x0 0x1000>;
>> +
>> +			pinctrl-0 = <&rx_swr_active>;
>> +			pinctrl-names = "default";
> 
> Let's move this down.. maybe above all the #cells
> 

sure will fix in next revision.

>> +
>> +			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
>> +				<&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,
> 
> Please align all <s
> 

Ack,

>> +				 <&vamacro>;
>> +			clock-names = "mclk",
>> +				      "npl",
>> +				      "fsgen";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +			status = "disabled";
> 
> Let's keep a \n before 'status', everywhere
>

Sure, will fix in next revision.

Thanks & regards,
Rafi.


> Konrad


