Return-Path: <linux-arm-msm+bounces-118285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d2H4JSbuUGqf8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:05:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0922D73B0D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:05:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Vx8pK+3c;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hXWvrwLk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118285-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118285-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEC4A3030263
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C93F42B732;
	Fri, 10 Jul 2026 13:00:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2582E1DFFD
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:00:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688439; cv=none; b=h+4AhiWD82RuOVrqj31v3NvnzMz1WCJVdwqv2vJNcrT5gvjFi0L2Q6UilotMa96bL2AJZ3aBKOeoI/qqElbBL8F+tbA14elXNe+j1H9uyqzRuL/6odD2mMcRE0imFMRmeBkKyPeI3KXLCzOJkrUpWUNR+brbwj+aoiqC8uS4kaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688439; c=relaxed/simple;
	bh=PrNrM8/okdfhabmkkRQ5vM/7921V7k7ByYh92noXh+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9z5kKziZbrx3sLIq1V5+zlzaVnh07WcwAi2PIgBThKnPpfrHcmEWiHzxU6gRSFwHKm6GbL129OFvCspqV1gs/DRoU3UlHt/5Uzgq2KPDhzlRM7p0hcUXcqXQGDtMzFxhk6c24jKrNfQIn3KOxU2Z9//oJNIOTJf12AW6n3G+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vx8pK+3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXWvrwLk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAnO3Y617208
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdHm7FctCqZHTZdrOgpFMdnXhT467pb+jETmtivbD+U=; b=Vx8pK+3c7lDMMc85
	0e69atEm1LwPSHwT6NNhJcA4B0MCeKv3pjtz+mEf3Rajw1uv4+ea6GYtJiqqMIMG
	ax0pSLNq1Olt+Ua9CvjupZ5EVMjmtg9P8buvBtf60JGSw1dLJRIYUDdbAlf5Q9dX
	WdvkEuwu3NtC070GEC8tv45BGzUoxgybnEdOKx+g/t+xk9S+yYCbadu9rNcjJCMm
	jG+nbxzBShpe2gvV79lZ2lxA3ZPsjshkcWUI/BJdlSojkMixJa/VIXyo5cOODL5o
	2zkoCS4kgXTB+Ukgezt1zRDAeRi5zrPGJppbKldS8fCyD9E3pYoE3s1vD5gxF2An
	+wt4wQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n1x43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:00:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbcdd9a269so24753e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688435; x=1784293235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdHm7FctCqZHTZdrOgpFMdnXhT467pb+jETmtivbD+U=;
        b=hXWvrwLkXQy9U0EHit1pf31SvhW5pZ0bBaxRW/+AbAlo9WAuykKB5kJmMJm/sKoCVx
         r2iRdruaLhs9NfZicGJhsD8ys7sqiAK/JU5QA+8GDGbfhlYIo2xAPy9BYwkj1V+90GZW
         if6sVnbqPyvG5yTqXOqDvZT8fRGDeicLnDs9hgzMPcFpLQ5GvuhuK5XqABj79LMjM40p
         2siOyJfQKnljx1DHTomPDikmx9iC9XO5pZ8YBt54WbO7z4RBhTsTVjl23uyhIj1CHmUy
         OPWE8RZmorase5GGIvmrxlJxyJTjtQyNiux3rGaYQzWbe6K/elJyYajTFx11xyip/C+H
         svDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688435; x=1784293235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdHm7FctCqZHTZdrOgpFMdnXhT467pb+jETmtivbD+U=;
        b=i4YuZFPYtwlaHgAh21PrqI0RglNSm49xw2efLj1tJWO3Zz1Ci273h/moTWV8mKhCkD
         x5tIo0Fnyzz0BUMKbxyjr4xnVZkF3qbq7kk2fH892JuP1HM4hRD6+IslK1UqQRjgcPQJ
         NDlRDquTg/i6fpmCZ+JqOTMJhXAsswrGNNgJ+FgCKcBcPzumx4IUBLZne5YWovlIOhPa
         wAM8p1sfkM0cZdje9rFLNpJi+NHeSgds/R9/0r4z2IUuZKQrzaI8D2E+vaeLZBd6wgr0
         0+Veb1lELJNmPrc8eRH2FYQdokLM4Npbkz6/SntQoQiaJVVKqWxdAY4CANHJFy1LSiDA
         VR/g==
X-Gm-Message-State: AOJu0Ywlu7bv3Me6MZFUcWnFusKF3XH7l0AyUDJMdl2Z3YUpOGlS1/l3
	99E0TAXAScdWoQX1MtuE2N2ic8ii8ozwk30CMoPGe7Kej5Z+ENgFW9rM1DHkrbD0oOQ729fbkRJ
	dLoNXvqsEz9Bwx0E+l+vKmVwX4FtK1bbn/Gl4TSqs6ZrX80XRimL3FCft5yRQgrYeeuQ6
X-Gm-Gg: AfdE7cn/rc4JlHwmxIyJhCuH9b1fK7d8UkB7Ft+eCA0iLWQA7bFUM3EIm2fwGggjpXC
	HEgnykgIc11MvyDrGgLFlHwbsFUEXghJw8iw3yP2q8SgjmSV88dvTkD2RLVPLsWwyoC+n3qbfpI
	7Sk+r05v1jQojBsFWzvXwJumzy/uJPdb/zsEShsJ1bB5Y9QAgLilJV+GmCKtcILrHYY/OH1NPMt
	nxsMwIE/LRqAljwjrFwTyueGCuayRkfhH8PhElD8sowGvEcqkQk5r/AmH0Bqeayp7dWPeEHVwbr
	2s18+I0JsGXuxEvW2WygUMOMQyCojHwJ07firuQXCz9HDKSXJFftXoeRrwSdwLUObiMwCvxVMLu
	6lPY3AZYoYR2k4wYJFTFqSjFYV9bcowN131k=
X-Received: by 2002:a05:6122:390f:b0:5bd:b5ce:23ba with SMTP id 71dfb90a1353d-5bf861698edmr1887997e0c.2.1783688430385;
        Fri, 10 Jul 2026 06:00:30 -0700 (PDT)
X-Received: by 2002:a05:6122:390f:b0:5bd:b5ce:23ba with SMTP id 71dfb90a1353d-5bf861698edmr1887989e0c.2.1783688429954;
        Fri, 10 Jul 2026 06:00:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa5c4csm598195e87.57.2026.07.10.06.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:00:29 -0700 (PDT)
Message-ID: <984287fd-b1e0-4dec-806c-19e9243f9b28@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:00:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
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
 <20260710-shikra_adc_support-v3-2-ddc840fca0a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-2-ddc840fca0a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX+OxqckdkJisV
 JKuPGbPhF6yYKGJ4e0e2Vqd46sHfhQC+h4Y6tx3n4o9Mf6rZKXj59JnxB0Ipa8S6FqZF5mu15V/
 kEr7Dj6EUklafvXX12aNP0s9OOYT0IY=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50ecf3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pqOYGSlSd9M5UrVTkMYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: s9gYcyXqHEbk9SAuwBdFnxtf43-i7foE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX8CRuO9mitk0B
 Tbp6PvbPU8eHrUDUakAyaYqAY2B4YTHV0YJOJCMfYKRTEWyYgS7s6sfDvkZjaunDQHFbCVVW6Wq
 4tu87eXeczBqU+ZoIDbPGfu8AeoGmVlEpKFxVK2AN9JpjStYBI2UpJRXJLJiFlKL0IXbWMkT/0d
 qte42A3Q/g6H0EznycbnQaZ+rDYS9BZkffn7/XrhbgDN5/bqQsaXLfyKn9XJjOqYnlVtKGDeYpp
 KJdSENLBlEQr6cvkkNXhLb2E2YwjfAmUiV1llMUCELpa6QMuo95dPUByFQwLJVdZLa8e4zKXha0
 To7JACBK+EpPok/rSa5/dkikK5AlCZTW8rxglf4RL5zyxKIijM8gjEsvn/lo76Js1WlHTayKU/R
 +5L4QKymIRSZhf6hzJaeH48gfaMTnDl+ioIukhYT/9kF7/hqSE9djAaCrzJVwlSJHFNTdSd8L0S
 WfSQVIPCZ4s6RaJMXRw==
X-Proofpoint-GUID: s9gYcyXqHEbk9SAuwBdFnxtf43-i7foE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118285-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0922D73B0D5

On 7/10/26 8:52 AM, Jishnu Prakash wrote:
> Add temperature alarm node along with thermal zone used
> for PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8005.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> index 0f0ab2da8305..e6f188cefffe 100644
> --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> @@ -4,6 +4,34 @@
>  #include <dt-bindings/spmi/spmi.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
> +/ {
> +	thermal-zones {
> +		pm8005-thermal {
> +			thermal-sensors = <&pm8005_tz>;
> +
> +			trips {
> +				pm8005_trip0: trip0 {
> +					temperature = <105000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pm8005_trip1: trip1 {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pm8005_trip2: trip2 {
> +					temperature = <145000>;
> +					hysteresis = <0>;
> +					type = "passive";

hot/critical?

Konrad

