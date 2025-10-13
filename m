Return-Path: <linux-arm-msm+bounces-76941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA49DBD1F8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D15FE3BDAFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BC92ECEAB;
	Mon, 13 Oct 2025 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lxtkn/Gj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5802264CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343317; cv=none; b=ePA2L3HtuagA+fCoPNpXdHubVe+YD7wcalQh+aWKAiq6gY5XFYd0PVg2MTp32KIVwGI9Ef1uHPBVhVIAzOlBoYUE9REOmxMn8pDkKQ5IKi8DL2zCZhSgVeqfx9+JXMxIxfx/dHBWh3x8BGn0NMxTWcAH4NmkD7owzpCXzm0PxjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343317; c=relaxed/simple;
	bh=UDNiuRHciTHENXoW3H+Y4cG7ha6QFPCjrMA11qh+a7g=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=jlYAYVN4RP+7oJ3++yJJVdCmjNfBLyUBq7v3sg17+SKQD25KmtqqFuTRf4pgL4uWVLqEOl92wsu8gt0OxjxPEVRtEyJT7imNFSWpLjjc5UXpZs80ntbfD33R2T6UrhOssGlIyzacZv8KCsAtVDwQWUfJvSFP3XiUBTHKNWJj/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lxtkn/Gj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D4qj00023426
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OmjY9D9cVuil1Jp7xNrdQS+H
	TpGdggwgMksMl4rh6Dg=; b=Lxtkn/Gj/YxXyTGYl/9yBR/u3E1b6YRb+e6NY8zu
	szFPQ6pX3Txu9V2j08fiXqyHMeWMJwnVVgYsN6t5S9CRzYSNSYW8UspMJZQOQrcx
	gQyKbKp9djnm8ReNT9RBCkL9QfayYDoTzFoR2p8x42ILXyg5vs36fMZWR9qqjZVA
	LlE24z/XlXpXwAA0z6mK+sGNLMto9SpBb6LqjnksvQf5cGWwfs32RNBP5zjzKgYn
	/6xowmZEP4vVyI1kOg7e+sHJ7234fkgPBdclu3PnRhNUhJalWfKfAwpadgW0bkuO
	KTv/VyoLE0QGXkUn0khIr9+t5ypvwatsB4BgoOf8/zDfVA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt0gen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:15:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8747323272dso23410966d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760343312; x=1760948112;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OmjY9D9cVuil1Jp7xNrdQS+HTpGdggwgMksMl4rh6Dg=;
        b=jVtAn2IFBPDro+xcMsY5S4AoETnLOGNnQ7nBp43pFWvZZQzbjLpxlDa7EqEYoW4/wJ
         n+QqaILUfbmXkQePaIAYY2vpuWduBwju8K7qDC61VpIv2xz/VUMjxxpFLNUY8+IDM3cu
         Amxqod4IUDscvHL9eDBmMtcHQH07HWXm24Zp4wzuvO83YQWaoPocFjXDrrHMd+KOT9H2
         Y0NbYy2MOLW/fmCHlGcTH0QscdP9gTn5uDSfFfVwkbjBYCbgFA8t7SuKW3kteIkJK463
         HMc/hsMZi2ritE+8C82DvI2KS1JjQSjAxaOl5R/+0lHPZ8iUQ1H/QuoRblPKTOLheUXS
         cInQ==
X-Gm-Message-State: AOJu0YyzZVoWqtEutqq1A2HTwhO763KXm+cyOVeI6UR3AJbxaH8+YHa7
	d7OY2cfqyfkAMXAmnbpJ562btvmTYzcHuwRQnHrCTBI+HsMHXkM2vl386G1x6lGUht1JenyfIGG
	BCv1k4ryqZI2poNyZbygrMvtYPAUv183fO8VPoMIFHPJTXm5B5wDXhtpjmko4Owbjr7pg
X-Gm-Gg: ASbGncs6fQu9ouGjvbOBiusYzyAtcZHDR2JxTP3r4DSy2DksUkMBRhptXtJzAoWKyGQ
	QQwqeUtXYGk7ihUYBkctXHldW2JTmZur2EfBBSAcPx/XAsqaeK0Uue+mdkOqBkxVcEXdVB1b0UA
	th4QbBqxi/MDrqQf1EjweK0peDnSP3GPPlZ5dFEoypvMR+ehhFhvF0iXELK4IsXhsPqsnqxdSzL
	05SBRkW61Y3YoSv5WSYdCEkB5IhJQDljkQZ+YGa0OpKeJ51L8R+G9qjrE2u/mZENoAkhmRwJH7r
	iaqwyRRTS6NChrMQ33MCa507WHoLtHsJSIglKJbMD6l0lB0IMbJcFRkD4kyH3eYo+m8EHqdidMz
	6kxJbfcmzYt3LkxjRHKWLeA==
X-Received: by 2002:a05:6214:5293:b0:830:4f29:a648 with SMTP id 6a1803df08f44-87b2ef56426mr190156896d6.6.1760343312443;
        Mon, 13 Oct 2025 01:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWN9TUiP9L1PngcZDktR1FONmHpUuUUh8sPFbC1MEyINUVTLX70UosEp/64j95AzjwijPaMA==
X-Received: by 2002:a05:6214:5293:b0:830:4f29:a648 with SMTP id 6a1803df08f44-87b2ef56426mr190156666d6.6.1760343311929;
        Mon, 13 Oct 2025 01:15:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f358sm8333942a12.10.2025.10.13.01.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 01:15:11 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------pxY94ReoyjunEHqT0j6EGWe1"
Message-ID: <0c8735f9-eac0-449c-aa95-b82cec0e6cb2@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 10:15:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: add system power domain SS3
 state
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012225950.15475-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251012225950.15475-1-val@packett.cool>
X-Proofpoint-ORIG-GUID: xjAyo4TFnUM4pWITYKby4GL4OLMK9gdI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXzJizEzvvxH9A
 wUGCDYNac5AJkBjiNqGOdKZZPyzFISotaxl4nsy2CeEY+DoEx1QVRPU74sBKDmfqwBIMlnRutjm
 OzX/iJrmfjMnJmL+0/v4BuNkmx14yck7jnJM7NI29/AYzhHe6C3PbLeI1ycnVVg/9ll2bae5g05
 EUEiF/MDgzNpFvWlKaSO8+YoAzDIE9UbSFJbTz/fz+bXp0pAtJzGcQSoXmAJrERZbUoImXZxawp
 svQpfwynBB4EI2H7ZpcdCkeNAwfv6U18Zhcrl08Nz7vVbvuL6dnXa1ZNYNM11+dbV9JLzRMrRwk
 esteoOUSW1ytsv3OMUvLN/ayek/5dlhItx8roUg9g99O8MBIJO5pCsIg+dh/nNQ80YQRpO1ASla
 V7HSb6p+XKalDsSmQZmBVnizQEIb1w==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ecb511 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=x6icFKpwvdMA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=S649r15P7wmwVG3cJHoA:9
 a=QEXdDO2ut3YA:10 a=8ls2GUBa6XCicvKWzpAA:9 a=B2y7HmGcmWMA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: xjAyo4TFnUM4pWITYKby4GL4OLMK9gdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

This is a multi-part message in MIME format.
--------------pxY94ReoyjunEHqT0j6EGWe1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/25 12:54 AM, Val Packett wrote:
> Add the same PSCI state as seen on other Oryon-based SoCs like SM8750
> and Glymur, seems to work fine on Hamoa as well.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Tested on a Dell Latitude 7455:
> 
> /sys/kernel/debug/pm_genpd/power-domain-system/idle_states:
> State          Time Spent(ms) Usage      Rejected   Above      Below
> S0             69476          23006      195        21562      0
> 
> Seems to mostly be used in system suspend, though I've occasionally seen
> the counter increment a little bit during runtime as well.
> ---

FWIW the exact same state is hardcoded to be present if you use
PSCI_SYSTEM_SUSPEND (which is mapped to `deep` in /sys/power/mem_sleep)

>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 3cf2568def3f..fab8104147bd 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -303,6 +303,14 @@ cluster_cl5: cluster-sleep-1 {
>  				exit-latency-us = <4000>;
>  				min-residency-us = <7000>;
>  			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <2800>;
> +				exit-latency-us = <4400>;
> +				min-residency-us = <10150>;

You seem to have copied these time numbers from 8750 as well, but
it's not a great idea, since they're tuned for getting a good perf/pwr
profile for a mobile phone

I attached an old patch I had laying around that described all three
states exposed in the windows DSDT (although I'm not sure if that's
exactly beneficial without additional tuning too)

+Mukesh please take a look

Konrad
--------------pxY94ReoyjunEHqT0j6EGWe1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-arm64-dts-qcom-x1e80100-Add-system-sleep-states.patch"
Content-Disposition: attachment;
 filename*0="0001-arm64-dts-qcom-x1e80100-Add-system-sleep-states.patch"
Content-Transfer-Encoding: base64

RnJvbSBkZjc0ZTBlNWY2NjliMTM2YTA4Zjc1ODY1MTc3MTQyM2I4YmU5YzYxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQGxp
bmFyby5vcmc+CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTY6MTY6NDEgKzAyMDAKU3ViamVj
dDogW1BBVENIXSBhcm02NDogZHRzOiBxY29tOiB4MWU4MDEwMDogQWRkIHN5c3RlbSBzbGVl
cCBzdGF0ZXMKCkFkZCB0aGUgbWlzc2luZyBzeXN0ZW0td2lkZSBzbGVlcCBzdGF0ZXMgYmFz
ZWQgb24gdGhlIGluZm9ybWF0aW9uCmZvdW5kIGluIHRoZSBEU0RULgoKRFJJUFMgaXMgYSBu
b24tb2J2aW91cyBuYW1lLCBidXQgaXQncyB0aGUgc3RhdGUgdGhhdCB0aGUgZGV2aWNlIGVu
dGVycwpmb3IgTW9kZXJuIFN0YW5kYnkgb24gV2luZG93cyAoc2VlIFsxXSwgWzJdKS4KClRo
ZSBlbnRyeSBsYXRlbmN5IG51bWJlcnMgKHdoaWNoIHdlcmUgbm90IHByb3ZpZGVkIGFueXdo
ZXJlKSBjb3VsZCB1c2UKc29tZSB0dW5pbmcsIGZvciBzdGFydGVycyBJIHNldCB0aGVtIGVx
dWFsIHRvIGV4aXQgbGF0ZW5jeSwgd2hpY2ggaXMKbm90IGFuIGVudGlyZWx5IHVucmVhc29u
YWJsZSBlc3RpbWF0ZS4uCgpbMV0gaHR0cHM6Ly9sZWFybi5taWNyb3NvZnQuY29tL2VuLXVz
L3dpbmRvd3MtaGFyZHdhcmUvZGVzaWduL2RldmljZS1leHBlcmllbmNlcy9wcmVwYXJlLWhh
cmR3YXJlLWZvci1tb2Rlcm4tc3RhbmRieQpbMl0gaHR0cHM6Ly9kbC5kZWxsLmNvbS9tYW51
YWxzL2FsbC1wcm9kdWN0cy9lc3VwcnRfc29sdXRpb25zX2ludC9lc3VwcnRfc29sdXRpb25z
X2ludF9zb2x1dGlvbnNfcmVzb3VyY2VzL2NsaWVudC1tb2JpbGUtc29sdXRpb24tcmVzb3Vy
Y2VzX3doaXRlLXBhcGVyczQ1X2VuLXVzLnBkZgpTaWduZWQtb2ZmLWJ5OiBLb25yYWQgRHli
Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0
cy9xY29tL3gxZTgwMTAwLmR0c2kgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20veDFlODAxMDAuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcWNvbS94MWU4MDEwMC5kdHNpCmluZGV4IGU4MGE0NTRmYjhkZi4u
YTM1YWI0ZjdjZGM5IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20veDFl
ODAxMDAuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20veDFlODAxMDAuZHRz
aQpAQCAtMzAyLDYgKzMwMiwzMyBAQCBDTFVTVEVSX0NMNTogY2x1c3Rlci1zbGVlcC0xIHsK
IAkJCQlleGl0LWxhdGVuY3ktdXMgPSA8MjUwMD47CiAJCQkJbWluLXJlc2lkZW5jeS11cyA9
IDw3MDAwPjsKIAkJCX07CisKKwkJCVNZU1RFTV9TTEVFUDA6IHN5c3RlbS1zbGVlcC0wIHsK
KwkJCQljb21wYXRpYmxlID0gImRvbWFpbi1pZGxlLXN0YXRlIjsKKwkJCQlpZGxlLXN0YXRl
LW5hbWUgPSAic3lzdGVtLXNsZWVwMCI7CisJCQkJYXJtLHBzY2ktc3VzcGVuZC1wYXJhbSA9
IDwweDAyMDAwMTU0PjsKKwkJCQllbnRyeS1sYXRlbmN5LXVzID0gPDUwMD47CisJCQkJZXhp
dC1sYXRlbmN5LXVzID0gPDUwMD47CisJCQkJbWluLXJlc2lkZW5jeS11cyA9IDw3NTAwPjsK
KwkJCX07CisKKwkJCVNZU1RFTV9TTEVFUDE6IHN5c3RlbS1zbGVlcC0xIHsKKwkJCQljb21w
YXRpYmxlID0gImRvbWFpbi1pZGxlLXN0YXRlIjsKKwkJCQlpZGxlLXN0YXRlLW5hbWUgPSAi
c3lzdGVtLXNsZWVwMSI7CisJCQkJYXJtLHBzY2ktc3VzcGVuZC1wYXJhbSA9IDwweDAyMDAw
MjU0PjsKKwkJCQllbnRyeS1sYXRlbmN5LXVzID0gPDMwMDA+OworCQkJCWV4aXQtbGF0ZW5j
eS11cyA9IDwzMDAwPjsKKwkJCQltaW4tcmVzaWRlbmN5LXVzID0gPDgwMDA+OworCQkJfTsK
KworCQkJU1lTVEVNX0RSSVBTOiBzeXN0ZW0tc2xlZXAtMiB7CisJCQkJY29tcGF0aWJsZSA9
ICJkb21haW4taWRsZS1zdGF0ZSI7CisJCQkJaWRsZS1zdGF0ZS1uYW1lID0gImRyaXBzIjsK
KwkJCQlhcm0scHNjaS1zdXNwZW5kLXBhcmFtID0gPDB4MDIwMGMzNTQ+OworCQkJCWVudHJ5
LWxhdGVuY3ktdXMgPSA8NTAwMD47CisJCQkJZXhpdC1sYXRlbmN5LXVzID0gPDUwMDA+Owor
CQkJCW1pbi1yZXNpZGVuY3ktdXMgPSA8OTAwMD47CisJCQl9OwogCQl9OwogCX07CiAKQEAg
LTQzNSw3ICs0NjIsOSBAQCBDTFVTVEVSX1BEMjogcG93ZXItZG9tYWluLWNwdS1jbHVzdGVy
MiB7CiAKIAkJU1lTVEVNX1BEOiBwb3dlci1kb21haW4tc3lzdGVtIHsKIAkJCSNwb3dlci1k
b21haW4tY2VsbHMgPSA8MD47Ci0JCQkvKiBUT0RPOiBzeXN0ZW0td2lkZSBpZGxlIHN0YXRl
cyAqLworCQkJZG9tYWluLWlkbGUtc3RhdGVzID0gPCZTWVNURU1fU0xFRVAwPiwKKwkJCQkJ
ICAgICA8JlNZU1RFTV9TTEVFUDE+LAorCQkJCQkgICAgIDwmU1lTVEVNX0RSSVBTPjsKIAkJ
fTsKIAl9OwogCi0tIAoyLjUxLjAKCg==

--------------pxY94ReoyjunEHqT0j6EGWe1--

