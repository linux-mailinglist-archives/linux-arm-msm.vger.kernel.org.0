Return-Path: <linux-arm-msm+bounces-107357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOFOENeMBGqvLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:38:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BFA5353A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16A6E3008C81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AD643E9CB;
	Wed, 13 May 2026 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clrZphC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6Bq21oE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7153101A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682696; cv=none; b=RJk4+YArL2ZA8cjjNxHaDwRt0AMyB4OrsdJqd7Qo02+jwZTIcJ0RsrbU73cR8pzVqL2PqQGvOEUQep71z/zf7ETmdvk8SZEHDFzOhSl1aTHucBE9Qt3b1XVq6J+BRDRUjzuhcYYGTbB4wF6DTJwS99LBkov92sWLbL7tAjdTqGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682696; c=relaxed/simple;
	bh=wUc9lMKXkCeotpgFm95ubkEbe9ZQWC+fBE/j+Hm0hDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVx5Jsw40bCXYor5jvWoq4W//sddJxHG7ID1ej0rIpmN6YoCNGmMNoerXOJy6zKOpd+JiboGGNzWlEaSHRzOsYk8woYq2Y4TVwiN7c2dvZjsVn5EDMNSISpzY3c0mdAWkSN0h4lBDQ3QvFVJ/5JSKBbtOmEmDbW49vm01KZEBu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clrZphC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6Bq21oE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wpof4159672
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lRuLzIXlukujnHHTg5x8pIPyqWqQhCl4lFaASY0Pd8=; b=clrZphC1X3MFyXIN
	AGBmOgAA0apGMkojnBUd0zElQPipNJCE8yCywlJL4G9ICNYp4eJPaQ9owhxfcxwL
	X3TfbzBBPO2H1710f/an80qFgb7aNQjNRqNyOLJtsrfDkyd6Vxnll3lU3LZDdcw2
	xH/Dk0roz+cMqEeWnAy/LoszF2YzNfLvZQlFZ5P4Q+z+lTb6RtCojfcMrrOPXnOG
	aP2ntd/21CVtIiwuAFqBe++LCUCT1bMtQf+k10dngWnotYsIlJX8QqfNcXFKqu8f
	2GPkkiZdJy+8YQ2ub1R9SSpZgIrASZvyG88dGf3uAHePTE26BgJjUexOPeQYT9c8
	IxsIQg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91s8yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:31:32 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e3a338673eso6137422a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682692; x=1779287492; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/lRuLzIXlukujnHHTg5x8pIPyqWqQhCl4lFaASY0Pd8=;
        b=X6Bq21oELhQ9BkY1DEhVYIc3y9cGSBirt88E2LfsmZaWSppWhm84R5TKBbjmnPiNNC
         4DfkrNNYyeHwfN+HCfFJfwQ0Ht7PAsnglEDAk/RLv5t9H7VGiLZ+3hPi3x9M1EQviF8+
         Jpgw3yOoaYagxjy2+1S8KIpguClCu6ZCqo5f0/MLalOwyCiwkPrue3XzsTPBnhZ2pAOD
         qfV0UaaAJLPGfFF6ZXuBSF67c3dy+L1Ol9FdyZa1EOPgBARfh8MzgbErq6BXktza/oTT
         c+8J8/m7FJqx6Dria8UH18wd/+oorxhG9fQQxPSbB1GhuFGyVEEc+KM91LHiyekHbzU0
         oMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682692; x=1779287492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/lRuLzIXlukujnHHTg5x8pIPyqWqQhCl4lFaASY0Pd8=;
        b=CBJHA/ln+7X+qtCVWuukBiP0aGOn7lH30Q31At8ndCM1GXxJfO4wjgwkUdwezFrqB6
         HrE+LF1B09FyD7mbbc30fboA5K7iV6kn6yrS7NXEolkIUOIHFq1tp6cS1u7QpAfahuYE
         1GUI8OBCuYYRfIk3zxiqEz8sHz6PtIH+Dme6I8PERXvC8TYPFJ8oX0X0TOq/k/38W92M
         4riOQeskS7E5iu10H7BrccVFfmOvFgPy3r7h1m73t9ScZVGqyLSLxa4x0hP7huM/ZK/q
         gNYJfp6hEjH8i61plmvUEaB95rJCMV7DPSgAcEmSztN+r8UwFlgQDoZqLq4mU8tBpKau
         YEFg==
X-Forwarded-Encrypted: i=1; AFNElJ89+HVKgLool7Xr/zeOQYym9FhQ3wT+LAQIb/k2uQ/jtI8OLda6KTOYb/ZO6QRrvU8IF319d2VbC9WsDYGd@vger.kernel.org
X-Gm-Message-State: AOJu0YxnPE6gJLT14kZIHC4uQARAadCjX+z5GBTT5T+qvr5jJtGQbQH5
	HUOf/BsFOfxTUI+KNeHejm8NHFDf/augeE/FJs3CEx4RTvSQrmXPU/Sqo0I7BzxE5jko/S+pMR1
	nbeyQhuyZWS9v2IfhKO9DItchVkEGEajEzYRC68ayc/XUoylD3zCUQMcBq2ZNMUG5uVOZixjBoH
	8j
X-Gm-Gg: Acq92OHwLEMGJclMBrVZXzSIG7XS1cn7NGRW7kMfnme/CDo+n34Ie+UWLOm3nBXljbC
	loAPpn2FNUm5qEq0kwjhKiPWSqzLyrgLWPoRBwAfSxbyWH7wHqCxKuqc10ZzK/GSECrGk8RIJbc
	BWfHC+EwUur6k6QzhZqH4glbqHZ3oOny9App2DE9MuJTImSFo2wo1iVtlJvYb7fSqkF0SxErucf
	BhkmluAXJepy3sihrcw/us1E3u1R12ZAdMAbkKimiAUBuezktL6mZYNo/dzOfPXidSXTzoWU3Hq
	2E0lSzCFXPnYiXLx0Q1kslc5qGoROhs36YtAQLmQT+1af3eEE9yAzudXBdmLLr4rRYaHgnrf6Zw
	xyBORmkKLdXSi2GJCgCWDoL02JYrYc3DTmhLFpF5AXLE2M6CIdlzCdwk/DDm7W9tMVkW9fv5HK9
	IGHmQIiqn+tkHxKhK/rvPXUpsZpwY1QznGM3o=
X-Received: by 2002:a05:6830:6e89:b0:7dc:cf5d:df17 with SMTP id 46e09a7af769-7e3bd3b5102mr3695428a34.18.1778682691689;
        Wed, 13 May 2026 07:31:31 -0700 (PDT)
X-Received: by 2002:a05:6830:6e89:b0:7dc:cf5d:df17 with SMTP id 46e09a7af769-7e3bd3b5102mr3695403a34.18.1778682691234;
        Wed, 13 May 2026 07:31:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9515087sm4106065e87.12.2026.05.13.07.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:31:30 -0700 (PDT)
Date: Wed, 13 May 2026 17:31:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Enable eud support
Message-ID: <rwf5xrib7dba5clavznhhmvyqbjejeujy6omotnheisu2ke7de@zpm6ea7f7f46>
References: <20260512091422.1395490-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512091422.1395490-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: HG1VfX8bWq3VejY6LJA2aCXVxfC8FVGz
X-Proofpoint-GUID: HG1VfX8bWq3VejY6LJA2aCXVxfC8FVGz
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a048b44 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=clN1VyBAevDfDM2Nx5IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0OSBTYWx0ZWRfX2DtbupQBuA+y
 voAUDGBVQ2UpJb3ZaIUHiSJiSRfRH9ZJrKIfqChno7DlCAb8un4PX5+J6G1uzzunHt33ucb3UPF
 LYQJIco5fJJz1jvDBbKDgF/Cf+yFUI+PG83gngRs25gqq7Pg9Wvs3MJ7iAKriismtbcvTpEeZVi
 OqHfrhcpG9iMupPzP94QAcfguSPSyYnkpbwi5k3+8+PahK3f0atIRPgLthKNbCEH9EqwA3Jv9Hz
 l+iPl3qDduJEH1vZYloG347NaX2YjQWjufYu1ryMwNxh1SfmPLnn44rfN2KXVLNoJjElGnNOI5U
 qvFIK+zeLqWwGd8bsBk5gWDE9pHx9fSVpTO4oCgz/b32FbQNkEVPFc/4kpgsjcfa+2s5GYshz8k
 YhB0D7jpeju7eLRYFTAMhXM/1NgBfaPOg/ggPEoq2CSPIKOF4mDT8uGObYCjJpnc5D/qX0UyWhw
 PxAELwSIIgjeNG56mOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130149
X-Rspamd-Queue-Id: 38BFA5353A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107357-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,0.0.0.0:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 02:39:26PM +0530, Akash Kumar wrote:
> Add the EUD controller node in lemans.dtsi and update the USB HS
> endpoint routing on lemans-evk to pass through EUD instead of linking
> the connector directly to usb_0_dwc3_hs.
> 
> Wire the OF graph endpoints between the connector, EUD and DWC3 HS
> controller to enable the EUD path on lemans EVK.
> 
> This change is part of series "Improve Qualcomm EUD driver and
> platform support" and has been validated on the Qualcomm Dragonwing platform
> (RB8 board), confirming successful OpenOCD connectivity to the EUD
> interface. For detailed usage instructions, refer to Qualcomm’s Linux
> kernel debugging guide:
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++--
>  arch/arm64/boot/dts/qcom/lemans.dtsi    | 26 +++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index c665db6a4595..96d316867c0e 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -55,7 +55,7 @@ port@0 {
>  				reg = <0>;
>  
>  				usb0_con_hs_ep: endpoint {
> -					remote-endpoint = <&usb_0_dwc3_hs>;
> +					remote-endpoint = <&eud_con>;
>  				};
>  			};
>  
> @@ -510,6 +510,14 @@ queue3 {
>  	};
>  };
>  
> +&eud_ep {
> +	remote-endpoint = <&usb_0_dwc3_hs>;
> +};

If this is a static binding, this should be a part of the lemans.dtsi.

> +
> +&eud_con {
> +	remote-endpoint = <&usb0_con_hs_ep>;
> +};
> +
>  &gpi_dma0 {
>  	status = "okay";
>  };
> @@ -985,7 +993,7 @@ &usb_0 {
>  };
>  
>  &usb_0_dwc3_hs {
> -	remote-endpoint = <&usb0_con_hs_ep>;
> +	remote-endpoint = <&eud_ep>;

The same, this should go to lemans.dtsi.

>  };
>  
>  &usb_0_dwc3_ss {
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index fe6e76351823..a8ab11681476 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4003,6 +4003,32 @@ opp-384000000 {
>  			};
>  		};
>  
> +		eud: eud@88e1000 {
> +			compatible = "qcom,sc7280-eud", "qcom,eud";

There should be a platform-specific compat too. The lemans.dtsi is
not sc7280.

> +			reg = <0 0x88e1000 0 0x2000>,
> +				<0 0x88e3000 0 0x1000>;

0x0 instead of just 0.

> +			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +			port@0 {
> +					reg = <0>;
> +
> +					eud_ep: endpoint {
> +					};
> +			};

Incorrect indentation.

> +
> +				port@1 {
> +					reg = <1>;
> +
> +					eud_con: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
>  		usb_0_hsphy: phy@88e4000 {
>  			compatible = "qcom,sa8775p-usb-hs-phy",
>  				     "qcom,usb-snps-hs-5nm-phy";
> -- 
> 2.43.0
> 
> base-commit: https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/
> change-id: Improve Qualcomm EUD driver and platform support

-- 
With best wishes
Dmitry

