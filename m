Return-Path: <linux-arm-msm+bounces-103258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDafMoNc32n1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:38:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7BC402ACC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 319D73171DC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D4B3368A0;
	Wed, 15 Apr 2026 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NF3NoOib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5badwL6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558AD3246EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245327; cv=none; b=gtbqV4y5dGA+y7YTeL566hvH/k182YUFwbIPFPMVJXJ/YdSnsV47cQ2+d5ElHmMJezcSAi1Ynu/e0+Y4WyOdTZsQlkfclLHsD0yH2ut08Mt/+lJT6K/Y+f1havT5hWUBUGdBViNWdekfnIbnVF76yGgrD2b4OCmSsGOlEzZ1Zi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245327; c=relaxed/simple;
	bh=2M5+CsIlZRmP5Rp+ialR6inz9ixaMSwGSxDK7V3i1vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSvQtF+Aq/00jTcUHiEi0G1s9Uo72piuWy5CuwWC9iCQUnVNKteNpVhdIeTvzH7ocVuwwsqaCVzTMDpd8JqAXrw56yvHPiDl8suAFXmG9QBDb02qRqpKwKlyLPoT/YMQvFOWOFk3sxgh/Z9JZGy4LNmCN7Uox+F+OP5WC4dioRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NF3NoOib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5badwL6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7ijo62593176
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3M8LPszBnttqtBPzt5SqKBHeS1QcNQU5Hd5dp/o0B5I=; b=NF3NoOibaplmMS5p
	bcfH2nexAkbkvpLWKTBjpjcFWU1//E1dtwHqAY94YEkPXSRw6tOenC3tVNXBITCo
	GnjyuQWbIBDBsIPrrVc3ydotCYLZtX7nP7Sm3Lal1dGh09IuQqGM4hXNR+6QBeyy
	dGj34qWbeuY6Wm2/asTdApstMiHomDMCkXuW42iRdLaa7iBMt76obKF/qRkmxQid
	kz9TJhwAg+Dk49iYLmvs3yR9dtvWPv+HZm6NaxmsgXlC6W+aglvAj0NFuAvurwLH
	vVK4crWvDvRJMspLRMHDdAEts0IzihdtsGU5R2V/KCQXiHlSx0YytWXOXJa3XIYC
	PMVGiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw02yx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:28:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b27636835so12979941cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776245324; x=1776850124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3M8LPszBnttqtBPzt5SqKBHeS1QcNQU5Hd5dp/o0B5I=;
        b=Q5badwL6x3WaxvMV0uDuhFSbf4ZJwjQHOXpa3iIqwTZOcKdLz0VjyoBT4m5ozNJjEq
         SgeSF5JUnmeazSRh7VjAZ7Al9Hq2m5/H3fPe2sf5leMi2jFNQfRKTS16U2VAV370AxSz
         xT+v0xOlnrrv/s2fSN7MAPeVioiXNltLjArGkP5L6QhssepGoxTbrmCmNzc+3PnLxBPO
         DuWglQ+33YQe0QMnv4bnTWIVd92tO3uB5fJ6XL11lCS6fWEtxRbMITQckGmWDVexSrOU
         Up2goNCXzoB/PbfMe3OxHVhkXOnDq1XcRSxHx2EKAzXDKOkFXAcb54oXr4Yj+crYRhTe
         gjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245324; x=1776850124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3M8LPszBnttqtBPzt5SqKBHeS1QcNQU5Hd5dp/o0B5I=;
        b=AdoQZ3FHMZ4UPRA4/nVH6TyJMScJm1scu382UbSK+nDECKmx+Oheyhjy3f09kiaIBb
         oeLwnk+n4++t5JxEcUL2Hua4TJsLlDgtz1WIkrmEXczsZjqDuHQ1S1CK2QIDgioQ/LB7
         TFoSaq3+q4U0Nr5/y6QTBFPw/0mF7wnVDj/IiI7r+X7arS3IeAjQk7TBdkgWdLJ27Y9K
         9WGvds0612R3DPHv5huiUhvXCHufxMUZ9lJS6FQR6+6OOvwcD8z5eBXI8/w3jqdy92vp
         WUE2qxel6YZKuCpQvrCcKyaJNmaT4fpIioeux1a1xBPrZ4HtmYTCHKfqFtFSff+NsK+n
         0GSg==
X-Forwarded-Encrypted: i=1; AFNElJ9v4MEysKh62B7J4j4n8d1fGL5S2kLiWQSQQPE6pWccrCxhd73I1zrzWzpN8XJWYYMbTVSuPW/uJZdn5L+c@vger.kernel.org
X-Gm-Message-State: AOJu0YwqFW3dqSJy99sh4OXbZufhKSpNtYC0SqunnedBi7cx9PZftR2p
	Mhi7rhX4ZYddiDffokVj9DoDhsgrvs9Zmkzd5BvPGiiYfHfItnrGFZG/HBm8qCrMNGkEibmjWEF
	ljY2ih9QmXKzA7Ces7UfigxH1kUNoVkz43lmrYrOODiWB74YZwcjoQc6/XdgPJABry4fo
X-Gm-Gg: AeBDieuTwIiGyIEu8OmBwPdtoaPhNOrxecF0J7Pog67x5hZZ68IjfMXPrIZTOvZGeFD
	zwcq9WWBLbXVUIciWy1ySXSEB9ohAj9VtjDtRVJsW9bRYjnQYnqH5edgcbJB3oKXtwCYR9XOsb3
	taN7sMnbXH2C7bU+2a2eEziNvpAlcAVzvjSGp6cFy0yh8jTtWGKhlXgTisQzDPBnqDTM33z58jK
	wQ98YT4VTgLeZiiziScluOTLQboA6P5jkEkrZv0hWSS3UNqouuODS85/EzoKfumA3XIkKcAfxpA
	grkcr/xFgNvCxMve5ppq3svacJg/J8cbTWaK/gvENxUiK6URdBJx0IgPn2yKBQGRZyXzdbTmuHp
	W9Ww7Tr1sBSoVdjearyJbHKRSra9Zop9pTPVGdQbP9NUT5IfSuSTPP+yWKomi8R/YFteH5NTSuH
	vqY9ycJXZmBZWriw==
X-Received: by 2002:a05:622a:18a1:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e1a7ccf1amr15897721cf.8.1776245324430;
        Wed, 15 Apr 2026 02:28:44 -0700 (PDT)
X-Received: by 2002:a05:622a:18a1:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e1a7ccf1amr15897551cf.8.1776245323940;
        Wed, 15 Apr 2026 02:28:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1780b9c2dsm37412866b.59.2026.04.15.02.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:28:43 -0700 (PDT)
Message-ID: <7d25970d-c2e8-432e-b69f-0da99271b581@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:28:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] ARM: dts: qcom: msm8960: add RPM clock controller
 and fix USB clocks
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-5-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-5-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I_VTemLOeijyonDB3k6qLMtMIf4CzTio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4NSBTYWx0ZWRfX/Q1umQKRcSiW
 2W6/AlQvh18vvaqHlj3eeE85XVVNpkItSt6FYa1+/bI8c3tjyKPl4IeQnH40UmWMdXxVafrrF0E
 XqfUPMv9g5fLrQz0dVgdVAQzWWlcLWg4MxUkfGPKqsEugqvLeaOYuiaHAirr13lb45awb5rRGGk
 SXWEvTvd9Icv1kQIVh4wGLGvFPYD0J+CV/pbFoT8x4OC3c766TptFnYWqUjj66e33phJas+SKrj
 bddVZeI9aE//pyCqqibWNTpeNiHf9FNUUl5+TZobfazhrx0BfdHi3zIOBiHngCyuy3umR2G/AmP
 rR7zT57egcUwqyTGzJx37dC16e+Pe+HNLgCsUEAcS/fLkWHuYAv465CfW7ZuASbqir46HyEpfq5
 8V7X/Mzl5j2oCigiW5S7do1vlQzbPXucGOK7owz5GFirhjymoRSX5Fw7b2zJMj80R2AMWgGlXN2
 NUQzOOJajWdHxEX5rxA==
X-Proofpoint-ORIG-GUID: I_VTemLOeijyonDB3k6qLMtMIf4CzTio
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df5a4d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=wxLWbCv9AAAA:8 a=1PKY5ISNgj2KPwyAcZcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150085
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103258-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.1.165.224:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smankusors.com:email,0.190.188.32:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.7.161.32:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B7BC402ACC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The RPM clock controller manages clocks shared between the application
> processor and the RPM firmware, including fabric and bus clocks required
> by several peripherals.
> 
> With the RPM clock controller now available in the device tree, the USB
> controller must explicitly declare its dependency on
> RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> would consider it unused and disable it, breaking USB functionality.
> 
> This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> clock. The XCVR clock is in fact used for PHY/reset handling rather than
> as the main core clock.
> 
> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index fd28401cebb5..1d5e97b6aa4b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -5,6 +5,7 @@
>  #include <dt-bindings/clock/qcom,gcc-msm8960.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>  #include <dt-bindings/clock/qcom,lcc-msm8960.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/mfd/qcom-rpm.h>
>  #include <dt-bindings/soc/qcom,gsbi.h>
>  
> @@ -98,6 +99,13 @@ rpm: rpm@108000 {
>  			interrupt-names = "ack",
>  					  "err",
>  					  "wakeup";
> +
> +			rpmcc: clock-controller {
> +				compatible = "qcom,rpmcc-msm8960", "qcom,rpmcc";
> +				#clock-cells = <1>;
> +				clocks = <&pxo_board>, <&cxo_board>;
> +				clock-names = "pxo", "cxo";

nit: one a line would be preferred

> +			};
>  		};
>  
>  		ssbi: ssbi@500000 {
> @@ -507,8 +515,12 @@ usb1: usb@12500000 {
>  			reg = <0x12500000 0x200>,
>  			      <0x12500200 0x200>;
>  			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> -			clock-names = "core", "iface";
> +			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,

I still have mixed feelings whether this should be a clock or an
interconnect resource..

Some internal data tells me this is used by:

* USB
* SDCC
* GSBI
* INTC
* APSS?
* BAM DMA

or anything that is adjacent to SPS. I think any/all clients vote either
zero/off or 64 MHz, on MSM8960. It seems to be an IP that wasn't really
used for a long time (and a long time ago, at that), so it's difficult to
judge.

I see that the list above is roughy in line with where msm-3.x attaches
the votes (also for QSEECOM and friends).. 

+Dmitry, would you know more?

Konrad

