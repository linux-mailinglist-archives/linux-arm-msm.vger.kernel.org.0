Return-Path: <linux-arm-msm+bounces-112059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cakkLEXQJ2rx2gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:35:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A48CA65DD57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:35:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LxpRCKyS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C10KizJI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112059-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112059-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5ED56308C62D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8170B3ED3A5;
	Tue,  9 Jun 2026 08:17:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2AE3D3CF4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:17:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993051; cv=none; b=VSv3aD0SF/W/olv9mgX+0eb2Dtv79DwKNa/d9fENtB9/vlGLbJ8F2N8GJaUfyP4r3KzW7aGiTpOQrnoOXfMqg4fIfPl0FjW5D3A5V/B+PNJhSTFrcd5VyU8W1VzzlcHcIZdsNHTCTwa1isYyMWutjg70b9RHp/xkaPkdeRoUBt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993051; c=relaxed/simple;
	bh=uQm6s70m59A3ZS0k7qVGOuINJm4UcVMZ64aEEQVkb5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrqO0Iip9g2FnQv2ulhQOE3+wMwiF+5z/2tNTURiLufAVrsSfWQYUrTKPXRCHiPX/a4A6PswHKa9xpOI1aWIdSlAacfiyNwl54P6trmgk+rl/zx1tgkwrzIViQBGFmIW3rEyq1NSppNud+Yx74qkSEf1xUwjp9iPYXrTKyXOLxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxpRCKyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C10KizJI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rfEG2034872
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTkKKYwFiIEURTm1w+ARkuT6eNO4BWc0Cd3iyEr2PXA=; b=LxpRCKySf8Mfd5SF
	6mfSWm+N2eFCA5hgMr9wPauwkmvjBlaSZs0fCgqdnQRRPmzK/vI4zSaoMRzXa/4L
	JuqkOURKE0vrkwSf3g62iOp9KZDa+ycBrWc4sO5AvGTLXMD1ZMXKPxNSiPuszwZT
	OXuifKq8p9lfzGBRlcKAV9wjU+Sr38yh+Gz+soigW1qxwcif4/kic9ehS+htXy5E
	nTiD7/DbN4cv0lSgfRZ4A0dUIEbR6KpPzjdpB8JHW7EneieUYArYxf7XZDA27jbA
	FtNCkWGHBjbetWCO0kYxzv4qLAyXZ4eVjFxm8W3yib8p8WSNA5cCD2WwQvVVBLXK
	g3+oeQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeear6kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:17:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517a00fbac6so54504831cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780993048; x=1781597848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTkKKYwFiIEURTm1w+ARkuT6eNO4BWc0Cd3iyEr2PXA=;
        b=C10KizJIS42ILXCfOQC8BJSFWHp3Fproz3SNUkKsNUGqnChcBwLLWeWj0boQOl8Tsr
         MvRPwmgW4stzny/s4YcW+cNZDkRGoXqMJdrYCTxJal8AN+JeVE3DfiFZL8mU0fbFznh0
         lD2l7CzbvxTVCsVW+ERUcHZrDhm1KgNajvTorSaxv6OAk9dsK7AHgwGwqveCyu8qSjDe
         KV2O3Hj1xEvrSuQ8rLwuRAh86zXSKYai8j8G68UtnqtEWGFVjGpVjw+WMdkTXH5gd8iH
         b3FchqEHBjTWYz9g5h6EVdsk9IYO7OfuDbgtJ0P31E9DAv4XQ1zec2ITcEYd+G0/bUY4
         eyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993048; x=1781597848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTkKKYwFiIEURTm1w+ARkuT6eNO4BWc0Cd3iyEr2PXA=;
        b=hh53U+Gsq/21DNkaHOVwzVJL33mBQC+OCwEuMhbfsomUAuK2tM5rir7Px7oV8iEWh0
         BUEXxhxvrkQhrj/U7gD2wUjXgrTOKu12v81/pay6dwLEujveqni9Q307tJmN0oIoUBuk
         tKvQWDH0QSnMIcT3JLYjQSGYToCO9iq0qEFZK9bsX+Po1Jnq6bl36OtueR0h+NSV6lL8
         wSM7pwA3UIXBToI82q9lY083UpS9XyctV8DYRXdPeDJ3jovKaiM45Qu/Lnaj8TfYr4Sd
         I6dVE8TbGrhfiI8hUNv0hvEPirB9rT1171y3aRP+63Eh4Y7Cr4mc8g9KypzEuSUIMSCh
         KuFg==
X-Forwarded-Encrypted: i=1; AFNElJ/R2pFYmUJf2Cs6njXKBnW6L/Gr3W4D5513Gm4g9ujOQctDXWQvGBZzX/jXdP98b21+WpWDQJXWIdBuXfNl@vger.kernel.org
X-Gm-Message-State: AOJu0YzAoUHPV0J5+x3fIKFNGv6SK5tSbLIzC7LcTic5k4oOv3K1vkQ8
	mIpbdzfHS56/z/P/Z9WnpZ6yRlZwsFzr+64NuPDWPvrBu+kEpHGdqseaN8dQPxGgZ4KoJV9rnzC
	ICc6qfkAKZ0HZ5+0IMB/4YjilcE6Zk8dahcFNNSv/eeeoqbRlmeRsrvHZD5mJuDwPlzP0
X-Gm-Gg: Acq92OHY+YvJdj5yfWQAuFSW2y5McW2nu6BWLzGNmp29R+bJAiJxBTumu6mi4mDqxUr
	nhWzkrig8maja2H4i+f1sd2iVI0+FS1pXuU418meaGCKRcw7poKLWQ3C/6FcmcwzSkdBU5BXNzd
	c5CjL7X9bUnXxNTSp7LVZtga/+hRqtGbXSwpzBXcTU0hL9oNG6rBwk77TvmbTP+JMOM5hAsg1qT
	rnF4mIfNmypMyiNQbTrPlE4YjyGELoKCO8Pzl2w1AXcDgw0ucMOKdXwIQaxhz6LsRKxLrd2HzDG
	pWP15J+nAMNnOrhhfYE/M+LVaLXFNyUgsG9Bxqa+Z7tDIVsko1XW4f4SWcBoXVY55n5IQQwoiAM
	jm4ISscReWcShlreqzxf0ZlRRhoRCWB2IS3+EL+UD0xgIzGwFXTK7MP/Cbdg=
X-Received: by 2002:ac8:5d0c:0:b0:516:dcfc:ebc3 with SMTP id d75a77b69052e-51795c52ac0mr280768891cf.30.1780993047952;
        Tue, 09 Jun 2026 01:17:27 -0700 (PDT)
X-Received: by 2002:ac8:5d0c:0:b0:516:dcfc:ebc3 with SMTP id d75a77b69052e-51795c52ac0mr280768521cf.30.1780993047458;
        Tue, 09 Jun 2026 01:17:27 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf054e02b43sm973508466b.40.2026.06.09.01.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:17:26 -0700 (PDT)
Message-ID: <7bcddc82-f46f-4366-a4cb-453a213f8bd4@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 09:17:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: soundwire: qcom: add
 qcom,swr-master-ee-val property
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xNnH4wEWrnLuEhN0hZEAtHJZ8yJigcpH
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27cc18 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=A9yZ0FjQ5avCatc7oRUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NyBTYWx0ZWRfX01zSAb/YCyV0
 BSye4t70SLeIobubzOU/cgLotpga67/fmtGTEaR/9W5SxoO1tq7OHezlcsB9tM4WBwM9V7tt0JG
 CaAf/hn3fjfuzaGCqDljpX7bI4JbDkq2BdA4iw2syR57XNdbxfo9SMeWVUH5DykizECUf+0V1Q1
 o8oBNLRA3j+vZjcsMJwFe9ZdZtn7AhGpyKPUyR/3D+zzIgq1gPUa4UafV/H/CpnL305MZXv42Gk
 xlHT29uIbVuUwlOKV0HVskblKuo8V5+Lawjqvx5k3y7W83nJ/6LTru464gYR7cY+0Uo+/QoCivv
 6OpL2gPQ1JHc84ro4NJuWvF1nPqAWge5ZsEOhiYeC4VDH5ZXHXOwC6OBuYuQ5p9LOAFzLHsoHSF
 Cld+IMtlwFxiHGNBard+1KcuaJ3GKMACByZtzxBKV7edvsLZawvUu7pS+dLCp/qnO7cHaKQroXZ
 +EQYT1kmzZiYGjovXLQ==
X-Proofpoint-GUID: xNnH4wEWrnLuEhN0hZEAtHJZ8yJigcpH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112059-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A48CA65DD57



On 6/8/26 6:53 PM, Mohammad Rafi Shaik wrote:
> Add documentation for the qcom,swr-master-ee-val Device Tree property
> used by Qualcomm SoundWire masters to describe the execution-environment
> value for interrupt routing.
> 
> This property allows platform DTs to specify the EE value used to direct

this sounds wrong, this should never be platform specific, this is SoC
specific.

> SoundWire master interrupts to the appropriate CPU target.

Why should this come from DT, driver should be able to make a choice
based on SoC compatible string.



--srini


> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soundwire/qcom,soundwire.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> index 9447a2f37..5b06cc1a5 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> @@ -215,6 +215,12 @@ properties:
>            maximum: 4
>          - const: 0xff
>  
> +  qcom,swr-master-ee-val:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      Execution-environment value used to route SoundWire master
> +      interrupts to CPU0 or CPU1.
> +
>    label:
>      maxItems: 1
>  


