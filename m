Return-Path: <linux-arm-msm+bounces-102280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHkTMi8a1mkxBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:04:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7A3B9932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B46B3029041
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606EE3B0ACE;
	Wed,  8 Apr 2026 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYtO2rbx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qn20aqs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFA33AD519
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639013; cv=none; b=qVThERIXUR5KbN1TBjO32cy5LSj4oKLwYGHy0Wil7ssdlsKceHyem9CJ6mP+lwyudT/4zAWwfnGynBGV41FHxm4Y0XvSyuW96cZl++VA+HF5Z+QtMLbh+0nazTneqw+QQJ25SSLeuLWqiS2QWyclmvvRFMr41S3eODOrRZSbiHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639013; c=relaxed/simple;
	bh=qtAPjHtFy1QC303UWp4Zog2Y2bK1zbLKgGJf+EO/B7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFTPTtNVzoQpxwJWNFcjYLmBQS/4ORGiPNCuZpsWoubSz+MFWb7xkWO/bVAPv4nMMMjEKz1RwJAbtwWA2AJu9v894zVrsKreSdTJxeqHYHat4vbqK8sJ6kuE6MPLFxNvzgW/GBPN9jxbOxDv4J4aRfZ0Q8lnJpxyRdFXp+dXU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYtO2rbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qn20aqs3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387VRfE1259200
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	05pPQWXmaZE21YSX9k5MuQB/rWL2A7Kfjn7tOONZ45I=; b=DYtO2rbxtHz2pFF5
	PIngN4TlEZHpKonzDXkr+1s2VI8Jst/07SYylqihmDycwXxO/Hed1+Ldc/cTNasL
	eUWYgAt4ACycPM25rKAoW+2smJqf9JRRsVTiN/h4KS0V8UIk8SPdLXsc4YVfatkC
	cLH/IiPKTfqqMbzXjUTLmzH5KUPTGDay4DUk7q4c67NGHeK5m4lKruEl2kgffxnw
	pY5kts+4SfeCa8kbN073I6R/3znaINUHOhWnIYjtnFdifHPPSMzOOk9JT2LFQsyX
	qaZP5MtZdOTnpCOZMCXbgUKX6DmPt6BMe7a2J/hgJCWP2684E/qKFyUu9Aeifgib
	cpsVuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttsrn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:03:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d63aeaaedaso118974485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639004; x=1776243804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05pPQWXmaZE21YSX9k5MuQB/rWL2A7Kfjn7tOONZ45I=;
        b=Qn20aqs3JJpqPa7t+03mk0eGP89+wpMqTjRk/4GCbbwkUHRtv3hfLf1/MWAJi8Ultm
         ASxfPEnNKREbGbo+cjHbuhYrxn78U2IVKCMr3KPXQgspPW1d4piYYpfXcAR6HG/AIV+x
         oy/mr0oF4sBX9Bsh0b2CC8R/7+tmgHysTJzoo3pZgg0t8m1/zFFUB4dmueaBxy380OV1
         MlOHX1d1TqyE6qXTYw3gRhg/tCs9kEDl0mKh1uxQIzAJVlmJyrTgpLIGICGmhZKSohxU
         XS3bpWa3tWbmyAFWlb2BP7uH7JHEKQH/pdiF3dPgPrrSn4S4tGvKkl97JlSrwzCJzHx5
         Y2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639004; x=1776243804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05pPQWXmaZE21YSX9k5MuQB/rWL2A7Kfjn7tOONZ45I=;
        b=EvvwfFqvZbROSzjMrOW9iEpSoCfjfr24tzl8dTEubLZcFwsKDo9jkeNFtjjrgzyY8j
         xbmGmnWwiczfYp/c5YRVSx6vY9asjKYIp/muD3rSoD1AAVBy5Ncw51rNbpCzExZvLtYL
         fprS+XZQXjouyan98REG+wETMSkUNUvDCC735Jx+awc+pQA2dVTbsfhlC0PBsC6CpnIv
         iShj2tKdFsnh3M6Q7XDQf++g2WXXXPgM15FGuP35pPJZI0JidF3AtPeFh51uAQhtHTta
         p95JueAvINv3RabTMQm3j51bLDbIYXf4EHSMHxQMK7wQAGXcXc6voKtg95v3gTkg73Hf
         5D5w==
X-Gm-Message-State: AOJu0YzsEimg8gRfhzAFkXa5yQ37WRAXNJD6xFIUlwYhgWBy6+RquWL1
	FrS6tGOd7hrX6XizxRkJmVn0E1+k3gcJuS4h3jnKAB98K/3jhKDSpNFGGq0I0PTd7z97ks0NdB1
	RFy0/4U4bbbWsaXaqdfMYl9rd/J68n0Yq7ZHt6YhGj/zVn4y98ZnGvTa4Oi/DJ28t+RBCJvk6Qi
	rv
X-Gm-Gg: AeBDiesH1CmhSe7HTC6sgzCxZwqu4qKi/GGOfIlUPLVgxjKa37MjwPRV+kyKBNKMKEP
	BbJ00KoewW3cta5f6NEHHrHfCSLTDuknvWA1pS5XxuSzSXqPhm5z9OP11ErN+wIXDlppNin14Zk
	dZ6jT4+7JlkdU4R7RAfZXANccgT7m8NoHg704cqQrnPJ6Ig1GkjTeIxCxT/1s8CXPnaExrHLRuG
	3S3/lrC4ZSY0SN6BX+crQR4rLIb22XyaxeR1Sdwu8Rhxs90Rh9mapBbByd/FY4qLYOvO29ObgOb
	Eh/TCizy17BncZCuROEfxi3pc5jp0aazG6bWj3SNBX5iBLFg/Nnarkj1vhKdHkHJ2T4LLP1fwUR
	BZbkcaBt/V9H1l46bTy5f7MMLKfivgQCrjAoXMrAYlsBpkGjnbr5pHwAy4gAu9y3Up3YQegU03R
	5MYiE=
X-Received: by 2002:a05:620a:7103:b0:8cf:d5ca:adde with SMTP id af79cd13be357-8d41bcd66b4mr2065923185a.8.1775639004167;
        Wed, 08 Apr 2026 02:03:24 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8cf:d5ca:adde with SMTP id af79cd13be357-8d41bcd66b4mr2065920285a.8.1775639003741;
        Wed, 08 Apr 2026 02:03:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e06479211sm4714624a12.0.2026.04.08.02.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:03:21 -0700 (PDT)
Message-ID: <eb745e3f-4bc6-4713-97aa-1a1a584c9a9d@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:03:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 USB 3.0 and HDMI ports
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-3-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-3-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 30GBq371oyRj2T1_8bdx8VujsaiPaSQx
X-Proofpoint-GUID: 30GBq371oyRj2T1_8bdx8VujsaiPaSQx
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d619dd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ksxQWNrZAAAA:8 a=t79OCOewZTQouAeCdlwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfXwoeVdfdSatjw
 AP3PCpemOzEB16HKNCNmRykt6ZvvipJdlJ8Y8z8K0l/eHlvdcgMtpoiOQ2gfs6lACIU1HWBctxr
 lY4aPkUqA0+57oPJ4XTbQnCda74JsOCG8s4k6ncWIs9url3bNprUChVB1fx9QqeEOlF/Be0EnnJ
 H43pGwoTHqOnbRe+TNaMYm2k53gX/suYqGOEZwSNmMrTo0KISOFEfFTOudyiq6U2VAwAEDGGdLX
 mcWVXOmK1Bc4L50bdG+h6fftwaaPPtmgD4LST6MUJgVsJMRB/XyJSVp8toHda9pD4QI0Kdgxsaf
 bO8Hc5LrrphE5wnAfO/lerl+ufZXNFY6wsuOpps6ltWmHx64EyZty0HS9OpDaakWEDkAb5MJEvF
 iJcZyxBAVLgMeLLlutaPQqKgWyMheJaW10bZ+Xf8D5/QUDlfUAG9w5uAAkx5YxVNVwv5FgGv9pb
 iq/+0kyNL8ZVEM3NzIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102280-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,radxa.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7B7A3B9932
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 5:19 PM, Xilin Wu wrote:
> This board doesn't feature a regular Type-C port. The usb_1_qmpphy's

I guess the receptacle on board is power-only?

> RX1/TX1 pair is statically connected to the USB-A port, while its RX0/TX0
> pair is connected to the RA620 DP-to-HDMI bridge.
> 
> Add and enable the nodes for the features to work.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 152 +++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index c961d3ec625f..8d649b3a1cfa 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -111,6 +111,71 @@ usb2_3_connector: endpoint {
>  		};
>  	};
>  
> +	usb3_con: connector {

This label is unused

> +		compatible = "usb-a-connector";

No vbus-supply?

[...]

> +&mdss_dp {
> +	sound-name-prefix = "Display Port0";

Hmmmmm.. other platforms call it "DisplayPort0" (without a space)..
But I suppose this name needs to match UCM..

We'd also normally push this property to the SoC DTSI

Konrad

