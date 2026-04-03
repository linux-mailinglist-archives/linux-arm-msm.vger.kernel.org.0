Return-Path: <linux-arm-msm+bounces-101737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEmxHcI00Gnm4gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:44:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C743F398839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE56B3032CED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 21:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F39303C9C;
	Fri,  3 Apr 2026 21:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4JLnZZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evJqvgBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2E03D47A6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775252627; cv=none; b=cDvUv/iwc5Ez8SyIh07Ba7Tgvcjsp7eQTyLUV5scypw4c1pBi/zn6Hqktpr1dqGobJIT2dGStnt+V9WohHQkONR9NmU3wxWHRhKS2jAq70d2lg/OQpseBB+UeZEDA6X0RV2hfnxSQ1CEja+zxn3A4PCBePjwqaBmNFWbSt/Fi4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775252627; c=relaxed/simple;
	bh=OFF6v2Tm8hDdh08ihTRIKiwBupTMoyMXaViy3Ci86Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzAyYfwaweeiVCFApCl9FLXIpp1BFk+hFTtFkcmd91pu0AdG7ydcI0YmBaMBWZEmrQFtzRfnZWrNKF8G0UsN7XjSBmXQwffeElWiygNg9jXa/YA188B7VWMMNIeFKg5xlStl9uaQkUSzW7P3hHDEiNltoy4uq56JHDGzjmt4pZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4JLnZZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evJqvgBu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EY5uP141947
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 21:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8hWwHkEju9qcG10U0dRTvfFp+qigcWHBY2/Jsxpypzo=; b=j4JLnZZTEnP017kR
	LsRGsZtw5vZcPvIUqI00H08MlKTYDy/chbV/JAizqvUWN5khx43+NW6aOrCa3NHW
	gDRno0STl9EuVED5tnoIxDUxF6lKXo0nkGBd0BGIggjWCGFI4kgLcIxYaeHXjYNv
	o5Lxw6gD9McJf5kagfqWJdQA5TmymXZI6X0aaGbJsmtdWUbcRcdnHZ/O66ryM5bX
	Ali/24m3wINWwvE25+OZfHOOnCSHCYJYVEK/bPvzUBNF+FThqmlKggo5OZ4pwIyy
	N2l17JGspIvan8LLpbVYNfnRn17EvnK9ET/wwPgEa/ChJMQcmQrHQtL4xkD11TaP
	KzNMBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y2et3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 21:43:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b6f869676so53013661cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775252624; x=1775857424; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8hWwHkEju9qcG10U0dRTvfFp+qigcWHBY2/Jsxpypzo=;
        b=evJqvgBuznGwN9Q90ntS1PechpVJlkWsJ0PIAfZGDw9MyIYrEoUR1/1UgZSQWxAMwe
         RC2efidhXEZgE1OOyQ64fM/Wb6IdT0W60Oj6DjLM8SL6ZE1iVQUTYmsU+825PkmyX8C2
         zS237V+22LtIJ8bR8Sust3boi16EtlCX/tVkGHbD/QHChYNEY26bP2B9WBh+wZ1ttuoq
         G3H726IhwOfc+Wc0Oyhj1qmOaONpx0tWkwsCSv2E7lrSYqp1wj+YWF/IxxeGHJmFyQs+
         GMM+gmGzLgbHubaEB0/Ih7mt9AqekGmDBLBES+59vhkEeinePxpOI1VHsL3PAUCDVSxe
         sN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252624; x=1775857424;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hWwHkEju9qcG10U0dRTvfFp+qigcWHBY2/Jsxpypzo=;
        b=NUVRb5INcf5zk6jf8Ui29PYbYO3/Dh/iuhGfaj86owqB+sW9U3DeQIrM8QcVub4zvF
         C6NOU0uewUMsKywA0Z5x1R6UGhsUZNejVc2sEBcUiI5rzVIlKO6ExJrEeYC81hK9zCgx
         1RmNxVGZWS74VsjBqsH+iAStdPcl4truYbHndLTZYVZYEPkEZAVJV9EqZuopQSH0NxfJ
         ONp7pO6VX4wRA2p10OK83jOh0+5HNYruOcSEnSp5X44etBw2gUgW/BstMWUhKfAHxxQ9
         1f6bX6isx7/9QxUJa8TCFtT8k44MRJ60qnw9HgYpM1BNmVYASjiNFERk962QHBT1sb37
         Bvug==
X-Forwarded-Encrypted: i=1; AJvYcCUyMeoPeYU0qfuwl+OzyAX1Hh4uHPV0a25gmBJoCmLbEvGFfqhStLquYNkIIgB9azN43y39AlABXj0Of8qj@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQot9b/Iad73rOQTG8JpTcH/MBXih4gdTigJ8IH0uZdYRMXzw
	MzPoKRbyzWQeUEoOR9BsfJTjrzzgsjPBg3yE40X8edce6gJWhEuTXP1i9HH/eg/n/lUzxn8ZGur
	Ik2AVDN/rKpluWWoGgmktiQZq3+abBzSXXckfKtuKiZrSa9ndAryQEKlHNqRAVl1EimKO
X-Gm-Gg: ATEYQzz7s541cYRdqFAi3ZLn9hrXL9r6ap4QN5lGdFBhxVN+U8JJELTXdOnHF+DiTN3
	IHtimsjpypAMCeaYsOjSyPgdxbSUrJnO7IrBx9lksOTkysJET6mDv4KipIG9zwe6GMnWeTa81/i
	NYz9BOeBrJj89emqc6zwRdTxBdB5cmp2okolVivIdxJc3zJWtnyZG5QVOtFqoK863COj0EjzzWE
	0ZOIZjXPIzTTh8QgYixo0T8lpuYb0j31pXIXpCXh5CO8pS6Yaj6isAHaJyNNBeMFSyGN0V6RqCy
	OdP/KD6f1hYR1Y2j8BDaUDC+KWEhPWDH0kpqqLGnRH6RxTwB2fmtrXKB8x/FutLvaeWf3QNavk2
	G97WDU7/6X91G8xccbvdnszWMiKi6rEw45OmXXKwUtkmu1Z2st2FBwDhXWvrkXa9anTCHk4WCQb
	DfVpPeTxAQtltxs0gZZqAx56gZcCuSxwvuCA0=
X-Received: by 2002:ac8:5a0d:0:b0:50b:4f56:f6ee with SMTP id d75a77b69052e-50d62a9e10fmr73729771cf.40.1775252623795;
        Fri, 03 Apr 2026 14:43:43 -0700 (PDT)
X-Received: by 2002:ac8:5a0d:0:b0:50b:4f56:f6ee with SMTP id d75a77b69052e-50d62a9e10fmr73729491cf.40.1775252623282;
        Fri, 03 Apr 2026 14:43:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd3274sm1690516e87.73.2026.04.03.14.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:43:41 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:43:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <w7efkvvqlvc23oj2aul3vsfw7nwywgdtyztwqucf5v4n76wujt@lqfnxom3yfrm>
References: <20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com>
 <20260403100753.3477925-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260403100753.3477925-3-swati.agarwal@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d03490 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0TGbrK1GKRQw7WEyVB0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: BWVHMY7bp6Hsx9NMuGowgUS5opFxUCh-
X-Proofpoint-GUID: BWVHMY7bp6Hsx9NMuGowgUS5opFxUCh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NCBTYWx0ZWRfX4Pu5p3PNqoOa
 /toXG+5YULDNDvF6KlEG1zgKlsV1skIq9xLeSQvChxbwAzJWx6YsrVQYSKQAMy4HsraPW4A/iKB
 JqN3fukKh18RWpQAdjpLZqrorhTE2Z8WUiAbqNX0W2/rOrF5TiYorwCXGqUh86xRZe/f2yHHAL0
 zGTQfqlhOCDZRZVAj8HDbQf7nldPav+LtUKY9v5IPte6hEp45ELz6lrFpceWhoKGanhNQqTVhGM
 RpbNke4Y07aCwGgUcOTMKb7M8GNpMDivZxNBg358NzraMJ0EgYMKeJ1PWKcMsWrAeQPJx9gwT7U
 DyWbJe/Ev7An3glZH+WUYTb/oSiOGwi7NBHyJCjHlziXneh+orri3wA+eJxZbaIiV/Vhi5pgTIf
 +lK45aim+sqMp80gF2MxzxDnM4GoVFX1eophEnDbblbe9hGnBkam5ypa7lj78WcF/U4Bi9QLODI
 aemHjr/Z+ZvE3yIrq6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030194
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101737-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.3:email,qualcomm.com:dkim,qualcomm.com:email,0.0.0.4:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C743F398839
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:37:53PM +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK Platform.
> 
> Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
> having 4 ports. The ports of hub that are present on lemans EVK standalone
> board are used as follows:-
> 1) port-1 is connected to HD3SS3220 Type-C port controller.
> 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
> for Bluetooth. This port is to be used only if user optionally replaces the
> WiFi card with the NFA765 chip which uses USB for Bluetooth.
> 
> Remaining 2 ports will become functional when the interface plus mezzanine
> board is stacked on top of corekit:
> 
> 3) port-2 is connected to another hub which is present on the mezz through
> which 4 type-A ports are connected.
> 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> connected.
> 
> Secondary USB Controller
>           ↓
> GL3590 USB Hub (4 ports)
>     |
>     |-- Port 1 → HD3SS3220 Type‑C Port Controller → USB‑C Connector
>     |
>     |-- Port 2 → Mezzanine USB Hub (when mezz attached)
>     |
>     |-- Port 3 → M.2 B‑Key Slot (when mezz attached)
>     |
>     |-- Port 4 → M.2 E‑Key Slot
>                          (Default: BT via UART;
>                           USB only if NFA765 module is installed)
> 
> Mark the second USB controller as host only capable and add the HD3SS3220
> Type-C port controller along with Type-C connector for controlling vbus
> supply.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 206 ++++++++++++++++++++++++
>  1 file changed, 206 insertions(+)
> 
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				usb1_con_sbu_ep: endpoint {
> +				};

If SBU isn't actually connected, you can ommit the port.

> +			};
> +		};
> +	};
> +
>  	connector-2 {
>  		compatible = "gpio-usb-b-connector", "usb-b-connector";
>  		label = "micro-USB";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb_hub_2_1: endpoint {
> +					remote-endpoint = <&usb1_con_hs_ep>;
> +				};
> +			};
> +
> +			/*
> +			 * Port-2 and port-3 are not connected to anything on corekit.
> +			 */

Then please don't list those.

> +			port@2 {
> +				reg = <2>;
> +
> +				usb_hub_2_2: endpoint {
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				usb_hub_2_3: endpoint {
> +				};
> +			};
> +
> +			/*
> +			 * Port-4 is connected to M.2 E key connector on corekit.
> +			 */
> +			port@4 {
> +				reg = <4>;
> +
> +				usb_hub_2_4: endpoint {
> +				};
> +			};
> +		};
> +	};
> +
> +	usb_hub_3_x: hub@2 {
> +		compatible = "usb5e3,625";
> +		reg = <2>;
> +
> +		peer-hub = <&usb_hub_2_x>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb_hub_3_1: endpoint {
> +					remote-endpoint = <&hd3ss3220_1_out_ep>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				usb_hub_3_2: endpoint {
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				usb_hub_3_3: endpoint {
> +				};
> +			};

The same here.

> +
> +			port@4 {
> +				reg = <4>;
> +
> +				usb_hub_3_4: endpoint {
> +				};
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry

