Return-Path: <linux-arm-msm+bounces-93501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EKrNFxbmGkNGwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:02:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6B167A53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92AC63001FB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 13:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A9C330662;
	Fri, 20 Feb 2026 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFrL94H4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+lfRd3X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DB322B83
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771592530; cv=none; b=sAwKfr6q/S6wlN8SnI2mCeqiSg5ir/ZBxdV4xQQHhDerzmFdl6odS+IQjTTI0RN/vxvhzNhl7UE2g6h7boXK54kMlniVmetzrwOlL0PkWCUSnugvGShmXpWE3+Pkr9xOdyE/Oxv8Nv+3mY1mVcEHD/pCOkYUyefR4TtVSFxwz8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771592530; c=relaxed/simple;
	bh=jjiZekOWQAI0H2IL4fEIk9IiBZnrG/WEjlYmYNSVUXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=misov2WH1Y8XNmNEdVHpyCMXiWelTUwU+LwMKRzxqx9/dkMGlvUGkw1eTn2ZdmcMcabA1yrrgPhu11211TaNLcUAqeaIc8QHJOc0WAtgqOTbX2vy9wMJtRFwPr0xlUZHDCDf/eivEQddK6BmaLp4nud86OUWTXvouH1GxAuNd9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFrL94H4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+lfRd3X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rp2T2552606
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 13:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CzWESu2uFKsGs95jb7f+KQXQWBws/czIlkrDZWRZm8Y=; b=gFrL94H487pzY4lC
	AmSW4F7XSq8t9OJLj+pDk9wQsT9YIuRkNskaVGM1HqZREiquWCiOIVnFs3iEw5uQ
	nWByS9rCtA6uk3hjoqzAS9/etrHFO3V/79q40uShA3mLxkrvofCLQxQUK+oF7378
	2RbATDBnEz5SVzswR0UC2+XO/EpQwLaCcUXx5p+L/aaHCGkF/qXyNufgnhKOCA+T
	eOMa8OhBH35SgpnnH8s94UliJb/+IVCbhAZ01cR6/bI2RroNVdckZnIfg33xDapz
	neKHiBaLkBnBN3YqLRJ05SVCTA4GqWXWVMzw/tWU48Bdpu8+IZPo7ixY5+DxED5V
	dd2hSw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh7t12qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 13:02:08 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-662bf85cdc4so2097027eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771592528; x=1772197328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzWESu2uFKsGs95jb7f+KQXQWBws/czIlkrDZWRZm8Y=;
        b=O+lfRd3XO0fYMkzv3BKkz/NGB0bbHY44H9H+FJqmxnYPQ92eeHA9cvKVg+Ph9vqqW+
         a7cG7EtL/OBP03RjeFwCKZEpuGGQsTGCPntRoE32cO8OQ7eocAut+HAuaoIQ5X9F/TYZ
         vUetSru3qTlhYopjs1RI6jA09OEO2LJ3kPGglr/x/PXo6Vfkz2Jt8vZi4PgTHiKCPvhs
         fx/zdQC3U1/RP19hx9rFNGSMDNxtN1GQhoa2sqKz7Uul9P6w0unJqJzxLWj/5r4jiIe6
         1DOL7cBkDFQ7fJE5ecY+k8k48Sfb2w5GoAx0UWOVU8NCIQIDaHBcKw1CEoL29SbytmhN
         alHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771592528; x=1772197328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzWESu2uFKsGs95jb7f+KQXQWBws/czIlkrDZWRZm8Y=;
        b=g/4TQecvykNkZgRLYH/mA65fqwn2k5vR3/j5zkSFM9EhdAQYDD5EMwMSrothuAqHh0
         yasPLT+jlDr/7mgr6p4bpV9ByTkXSXBMjazMzbFQzxiuECOWJl4XDSzf7Kyo+BaEehdD
         fhJgbCdzGI2mmHIG0QEMMdYnSRqc+3kRcNeeujWeKK48dKOv7drGu1FRnYRyT9rb/XId
         rZvEApBBckN7cEeAGcD+5O1FTg590NnyHp2deyktxp+QxFqZId/Zf+W+N097IM2qccDx
         cS5LzZPJhAaj6xMiitOCZ02oGaEX8B81pVMsOAfE+J8v5wmDfBjPlVd26EnJx0L26VCQ
         +/PQ==
X-Gm-Message-State: AOJu0YzAf2lJAkEPcayRKH6XZX21L/YQUtJZi7ymWcJGGfWg87iG3aBn
	PwLwDKQNkgyScHAMAWipP0GN2cxJhPovT/j9SofOl1aOeYY6vmSP+X1wHr7EaM31IPW1tKZb9rV
	5wQ1wp681mN+WwJ917DSKJcbZygCqK8DHGpU78bH3GamLLvm8YdKZbL9qF5ZWGIE+tlEn
X-Gm-Gg: AZuq6aIRnn3wGkyOikoP/M/fFztS97L/DKo6vV4mM1JG9aEcpz3Vv1JWVoGXyRskxyv
	P78Zn1Spvb6yIuY6++TzZEDYqzd4AFTaZcH8QJnbQ1DM5ZOnF7nejn9iym/RThYoCNSsfIHs/jl
	JQuxfBFPud/lG5vKwuwoASmJNLEv9wjOxgLeZdsqdwVYB9ejNk+01r+3y9Ct1/PyOYyNo4fxMbQ
	rkScD6mOPTCEhXFgoXFmS0rEhaOtwLwdzl+sWVZJFVSm2+CWiQkrcTm9afV7a9x0uZUzOnj8hap
	bjFkgSf6BEZVr9gyBpPqSUNaROta7b0JxlhkAXsowIQ6BOo1P1OB2BMFtS8pawGLBqMfGBBwYNC
	EjLeS/KKOwzP9KeRGdmhozfksZs9NxujN1jvOzsi+bl3WdIpkM5aK7oUMqkRpvFt7QQ3VRX/9mh
	XsBAs=
X-Received: by 2002:a05:6820:c018:b0:663:4ae9:23aa with SMTP id 006d021491bc7-67722c5a7a4mr6830821eaf.2.1771592527869;
        Fri, 20 Feb 2026 05:02:07 -0800 (PST)
X-Received: by 2002:a05:6820:c018:b0:663:4ae9:23aa with SMTP id 006d021491bc7-67722c5a7a4mr6830806eaf.2.1771592527336;
        Fri, 20 Feb 2026 05:02:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e38f5sm4749119a12.19.2026.02.20.05.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 05:02:05 -0800 (PST)
Message-ID: <7dddf37b-c8f9-4cc2-bd3f-1bff5cc398d1@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 14:02:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa/x1: fix idle exit latency
To: Daniel J Blueman <daniel@quora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260220124626.8611-1-daniel@quora.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260220124626.8611-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CC0XNba8t8GecFtoysICdUzQnVj4bX99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDExMyBTYWx0ZWRfX9hN3EGp+ek3x
 DmUbn85KMsSQ3Et/bJd9Ll0HzVqT4PWq7kTqq6yX55g2CQk8OnRIuR/qKCK1kGMkIXfK0HstEVO
 6a/yEa8+i3xPowV69IulhRgn+R63Ck5tkZGzWg+3F4mRD53PymLds5HHVG4T0Q/SHJUak2NzM0U
 Vh3aOhDvmQzRibIJTVCxD7wKR4F26wrNJW5mvlGiDMCxy/DOt/PAP/XimhNWTQX3vR5xhzqm3mk
 FLymS0zXzlawdYEdOojoH41Bq47Z3b2uPwXTwSI5Tidv6hadsufySrlK6oUGmKAxt/VXoA05RbR
 XligTlTAVSYIGw5tHdv8X64qIGa1u7UPIjb85FWihLtvtF9FO7QLpXOAF1Qe42hMUBTXKTg45jk
 sbMlH9LYClMbxYeiQqHy+hEjY1puQxIbZ8w1JjZyoQOXoJBC7tpS+pzy7LizKgeH+2wZtwwNXl1
 yaUwAcm7qMCw93QmIow==
X-Authority-Analysis: v=2.4 cv=PcTyRyhd c=1 sm=1 tr=0 ts=69985b50 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Wy8xLuAV8_BPkXRswWEA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: CC0XNba8t8GecFtoysICdUzQnVj4bX99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out,quora.org:query timed out];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93501-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[stable.vger.kernel.org:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quora.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40C6B167A53
X-Rspamd-Action: no action

On 2/20/26 1:44 PM, Daniel J Blueman wrote:
> Designs based on the Qualcomm X1 Hamoa reference platform report:
> driver: Idle state 1 target residency too low
> 
> This is because the declared X1 idle entry plus exit latency of 680us
> exceeds the declared minimum 600us residency time:
>   entry-latency-us = <180>;
>   exit-latency-us = <500>;
>   min-residency-us = <600>;
> 
> Fix this to be 320us so the sum of the entry and exit latencies matches
> the downstream 500us exit latency, as directed by Maulik.
> 
> Tested on a Lenovo Yoga Slim 7x with Qualcomm X1E-80-100.
> 
> Fixes: 2e65616ef07f ("arm64: dts: qcom: x1e80100: Update C4/C5 residency/exit numbers")
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: stable@vger.kernel.org

Konrad

