Return-Path: <linux-arm-msm+bounces-91312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CGlBEmtfGkaOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 14:08:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F9BAE11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 14:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB2EC301A38C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEC02F1FDA;
	Fri, 30 Jan 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNTiLF2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiL2VFDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FE62D9EC8
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769778467; cv=none; b=jw1V+xW/nueqCEzgBuKOL5inokzETM1RLrc+GLAmmfdG1vA6PblXylDUYayzoHSTNW5enHHpcQN1k8vh2pDRaWFKuUvvsHFMr7yoo2XwLKBd7iZEDlsw5dwo66kqAwtKm048LvHD92UexOm3HES82YPForqCsTKb/cZRgQWiOGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769778467; c=relaxed/simple;
	bh=cZC6zDgi2m+OW7OyGNSJ2fOv4uOkrdjIc+vuM9pgHSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jL0ic+RJrT9K7yjjV7cVoBZCvmVM4bJvOp3gi0p/jmM5uQ58qnhqwUkR9/RkPJ6aw3ZoUvyfceJeYnh1Qo44QfYp8bDKGe/ZO0UUOUrWEw12j2gcMwqz43xJkZQpXR00ttMGJU3wLM1fBNN7MKAswM0vxe94v7n4G362myvANYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNTiLF2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiL2VFDw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UBiAb82295105
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 13:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YAvf1ivfxjBm5CzWbzwZLiUm2gpK7fQYbiI/A4Pfe/I=; b=nNTiLF2SAKAri9eq
	XDj7JusF37scsUKdhAu/9SG+iEfBM2wIZrbjzAOlThzrj7cyBmP1x6FwFLOGF5nf
	2LXRUnTFqh/nmuuwLRhBTAihBTSJqbXoU33UdLkCYAD2fDnO5idO9UXG71flCOCQ
	a/XZxw5eJrup1U9eEYw/D1z8l9d3llrC31QMtgYymROlqMTSK9Uya6ceFEm8dGoR
	SJ91fTwI1+DLqw9oh96jqGbZWrTUnbCE6N8A0bd+1vGY3Yo99COnorPw68jsuEw1
	mPJrYOUhvzk3BBfDMMiqlbZuBi8L6z9dAiDKLno1aQ0fnYcRRCFzMDQRoOvPLvSS
	UhpPew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p1x9b7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 13:07:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354490889b6so111329a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 05:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769778463; x=1770383263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YAvf1ivfxjBm5CzWbzwZLiUm2gpK7fQYbiI/A4Pfe/I=;
        b=BiL2VFDw96NtuIAkqw+/6UU2TmH2FaTJ2rVdLo+jGBZJjwrbQDrc4P0H0AHdVT+oBH
         ArrrOnzVngsOCCPiIMxuWQKNQjHCJxmvBHpWlRGuwR4lBmXZgS00x+Fx/+bphyCZsjE1
         gOysV+EN4YBHOdSRcqZi/ZgI2Dn3qg2zZknYBkLB0HyVMlYjBcDjeA9O6+uSLySpb2NP
         JGaBY7rAvl7sB8Rl3hUGDjrep2mCLp7rrmH05TVQqsnX6sL+snwmfeHM1ZcD9KWQaeC3
         8XEJmTR5AYTqAJq1K3jvLuwIsXILbeVuZgN4NgQyISdOvVdsnmYFr2Mg7YrYu26T+Vlt
         aSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769778463; x=1770383263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAvf1ivfxjBm5CzWbzwZLiUm2gpK7fQYbiI/A4Pfe/I=;
        b=TTpXz8wvLO6s6YS0FpK7zAOoIWYU8u4p+nn74/1yqx/EnMtqnxAqGRgStGhEWWtGXN
         gnJUu+ToJfwZdGZWx1IBV+MWHCGZjjHD7eBvPHzKoeB8FVxKMVK1URXZAUXsvoVcEAW0
         V01IRwkdYmUhzZem2F+GSdI84kJtUtAamU2X3Bq3qYSGAx7hre6mgX3mkgYllBWgqNRd
         rjH16PyxKG2SBRzO39B7mabyVyXhzZUHUf4h0nP00cbtLMK42DO5S46wjjFtvqqPCvNc
         FpCGI8w0O451FUQzP8sx6PmdX8BdUciyrzmmOG3KJ+oLUxqexrFZpdjTgEfhLdrtBNqC
         gK0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpCtiX1vObmWAPOsGdFUd8TbkGZiYOsInjwcDJuoI8xLrEcHSw+coPgvjLpyYFotsiy3YBGFnsyBmrJdYx@vger.kernel.org
X-Gm-Message-State: AOJu0YyrEqZ8ypAVZ1vn05pLY9Ls317yZ1nUUbqMaI954ZiQ0G6cZ/HO
	7Ps+ybjvIP2GWN1AWespFZ8D6n2jMxzi9OZ9XxRpizXDyDlgB2w0TtKZHPaYdoc47Y/7EmRtL6l
	vnzFfZQCWQl/l6MZtIQVPliS3k707KppMVVRcUduhGWHWbHtY4mPon4tfOOZHdVsecy0T
X-Gm-Gg: AZuq6aJKjXcNCN0VRMq+zzIyTv/Ph7U6OhDULW9YxIcwNV0G5UoIrscq52XWn+ZYlBd
	ferDvC7uyaKEmu0kDXm85cEuHgi+S5n+1RIlk/irbMZXsHrxio0WA1pyBoBDM3WMGq2YbOz3j5p
	m/xDHArEvdCd2TqIZR5gTZDLhn4OF/C22VUMrjk8hRdPuS5Q7Qj4WFD2JQZk018nw3WCj4L1T+Y
	9Xvz3/c00IzreksahUx7aRHvXEbc7CW9UNEcm8AJyE6zJadB/FtuqQNRAx/or2Y69pSyg6vwqi7
	8sJ3EA+kJDvRLOQl/mOxqMVAzod5V/ia+4f/Q9JuWYNNvFTmvIph+avgLMbCXkIQONYraYZqR5D
	bKFnPuCQA8PTChRdtaR+C7ZmfKDJrGMBOl0gLCPI=
X-Received: by 2002:a17:90a:fc4d:b0:339:a243:e96d with SMTP id 98e67ed59e1d1-3543b3ba948mr3031156a91.36.1769778463368;
        Fri, 30 Jan 2026 05:07:43 -0800 (PST)
X-Received: by 2002:a17:90a:fc4d:b0:339:a243:e96d with SMTP id 98e67ed59e1d1-3543b3ba948mr3031128a91.36.1769778462870;
        Fri, 30 Jan 2026 05:07:42 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6206386sm11413672a91.15.2026.01.30.05.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:07:42 -0800 (PST)
Message-ID: <abb1429e-6251-4827-f0e6-d4a6e4d9a43e@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 18:37:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sm8350-hdk: enable Venus core
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-7-d21861a9ea33@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-7-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: maOFO8h4o-p0F71NsIYvxy1zfiCWjhsQ
X-Proofpoint-ORIG-GUID: maOFO8h4o-p0F71NsIYvxy1zfiCWjhsQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwNyBTYWx0ZWRfX0bOJg/unK/7j
 ZnuaMsVQLHHYO7t53Ud6VoL8cyYnoZ6bzZ9vmOcOeeHc0XAGTIIgnXjx1qNsHTOZIWlrsTpiMD0
 PwmBn1DFWg3k0BSNUbTQqUlW4/CR/qUunvpHTlG1B1zaHTK83PcC5+VHblo4HaJ9gW5BpTU01ss
 zglSK6EklSAad/hHxAIjgO+0ue8OgxYoPJClmACCYR17MMdm/71jSBjf49YR/WaEtgbhPr391ka
 pnXaz008CFljROXLWmMLEEv+oV/1cRbT7YXNo+LdXywikAy1QOsiKWn719etumh8WhBM4O4ENz6
 oJpaCrHD6fEu8mgcOfmUpC27LRza3D16TLdZU4O2PLSODLT2FnM7rlH8qpNIPvRb0a6ylNEAD+W
 1ubihiLnUghMJy9p8rPquEH/8HPWZMhEeTpWzp9+geERvkM0YviyG80cWXfKWy4sbKF5RChC0fv
 jt+yYJMZIXZnO7smniQ==
X-Authority-Analysis: v=2.4 cv=G5cR0tk5 c=1 sm=1 tr=0 ts=697cad20 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8MjNe4RYkUGLIfEj70cA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91312-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A0F9BAE11
X-Rspamd-Action: no action



On 1/25/2026 9:03 PM, Dmitry Baryshkov wrote:
> Enable video en/decoder on the SM8350 HDK board. There is no need to
> specify the firmware as the driver will use the default one, provided by
> the linux-firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 5f975d009465..79f024fd47f9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -894,6 +894,10 @@ &usb_2_qmpphy {
>  	vdda-pll-supply = <&vreg_l5b_0p88>;
>  };
>  
> +&venus {
> +	status = "okay";
> +};

This should be enabled only after proper testing on the SoC.

Thanks,
Dikshita

> +
>  /* PINCTRL - additions to nodes defined in sm8350.dtsi */
>  
>  &tlmm {
> 

