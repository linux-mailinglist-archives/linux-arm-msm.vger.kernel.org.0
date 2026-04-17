Return-Path: <linux-arm-msm+bounces-103570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFTNNQG34mnb9QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:41:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA4D41EEE3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C6FF30674D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 22:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9497B37EFED;
	Fri, 17 Apr 2026 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1229CIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKlJ3z6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A85237DEB4
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776465656; cv=none; b=JNXmiPv/lr+3b6SsG9ID2sC45EMVx4MJNVaURdx2fTQGUo9lsOzwOArPxNnm+4vTUjXxcL5PLONVnp6htsGPIoiHMlHbh7U7nmrjw549gE9glCdkY+HZRh6gbHeoih/z5jx4E9lQyTPS7cqXAo+th976HgPSPA9he97RdW3FMoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776465656; c=relaxed/simple;
	bh=4ACzj62JukNrS5IqRGpOlSv09z3gsRQiFGjKjqmCOJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQzEV/GeigEd1daUWUkMwEcJR2z9WX7mAfN4aGIgDs5PNNJV3ISDwOX8+AYK84QYHFMYTEupSPjQF1SqnxhUHdPjuS4Lb6hNgMEU0zqkFFZWFqcsmCG32wcZ5p5HkwYXUimFk/NBmbYs4CiQMn5qSztlYclqISvmTRAR2ZD2CMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1229CIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKlJ3z6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4cc2975097
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sclcRE1WdVYKamatXGxR8oVabV/AT2ae6fVVjlCcTRw=; b=b1229CIWRoe/9jVd
	X4pOBn+rgsp9hGs7aywt+AgCjhF9P+G6oT94D5XwDIruAIb8CbaTUReCw6CPQc1p
	DBLlP3frbhbys4t62NdlzUyZSY/UAyguh/xtt/wcIB0JQt2M8iDgCISHceZ2G8N2
	jQsVepRfD1n6+KQMensU/FwmkxdfO8wWVAtGAJEDBsffwyaW8SSbuvmouzy74I2U
	Q2wXVd8kJuyhdl2/CMHxWJSKMYutiaA/E7SHSKuWx4RW93r8dYT1jdmknQ836TUC
	3BYos5UFiS+Hi7TV1AzXsgJ1FeGBYkSsRq0Hy4GHbNwUoFCX+OUXeGrRkOdfIl3p
	Gj/YKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg7ru0q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:40:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso26431861cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776465650; x=1777070450; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sclcRE1WdVYKamatXGxR8oVabV/AT2ae6fVVjlCcTRw=;
        b=HKlJ3z6M1gJAsidUq+tsZqIU8PbVFWuqJItDkNs4d70D6VFxNFnlNZP1VB5ZmhwYCT
         j3mnrwBJ8lZQH57aA+1Gh1mkeR5f2rohUUeEproe9WHqGxEmDu9DG0qdwZvD3QVewItO
         oNx+8iAtBDwQCu012mG1QHL4nVheq2qxSx/KBaLUrtgzxbCiX0ZJF4TSmL0k0nECTrWi
         q/cwUK2n+ssxZKJwIDSnOnvrxLJv2+jkwRpLMHlejdpiHPVhZWRBkSy4dl6a40DmSTLa
         doPCW5Fh39L/laTMkhWrZY0HBH/ygJvCDXx7pTvohgxJyvJeQLkzCPx6wAsx62BhGE08
         m7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776465650; x=1777070450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sclcRE1WdVYKamatXGxR8oVabV/AT2ae6fVVjlCcTRw=;
        b=cB0WTrR42O05YH7t8rPEro4dZplfc76k52cCwC3Qv75tkd8H5mI9Pk/j3HaaO30KTk
         OBCkhOthK2DChOvnFuVBse3F86KIMiW3Pw41l+tcD2SH0nA/fNcjSBbDfvZGyyTRW6VJ
         /s6B39c62cKJbu4CewzErfO4X32R+MBwb5nnLUbK0NJPAQLmkTfZSYNMbOVLW/lr9eHO
         mHWE3TwfxEOYDmiacqIZmFHQFZ2IPxxLy9LAcRnQyJE/0hA7j+TzG5Vx/KTzrU6GlkyB
         QQvrphbSLUs6U4jZ/aFHBMr18ZLDNPMU75esz8vuleYXsHXnuFOKGU7E1E2t7YVyXhoQ
         JUAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TO35CG0hBDS76bFDFRL3Ldyll5Wd6I8EOVlcnzm0yWHoF3adiO+i9z7Vt3dM9/Gortj7F9q1wSM5yM8o9@vger.kernel.org
X-Gm-Message-State: AOJu0YylhquMdJIKsA3EW7i4Nr19kwYJt4UereVfnifR1bRt5GwS9oyF
	0i/OaehejOmOAimhYTMjrMQvCI/sCmxzU9wU6fJLqduwlEjswzKFccnvIW/gDHSG5CkjPFaqxlz
	PYVqnc6DUg2mER9l6PEY8RR0iP3zg4wmsigRLOYe/s1Z714R3Aq8NEQXzRsnKrRaYinQi
X-Gm-Gg: AeBDievWN1+1UZvniGOdVDcxpvNxeAN6+95lTVsOVTKGuuyCFMWfvuXINAFwyxmSkLD
	7h0+nubJFacj5LfS4QZ1yWrg+6VpVDgWtiWvI226AiraF9uQaHLDqgx9YJlw+VQ/n7eG/27Mgc1
	z4rF6Ozxwks7x0YqWCdyaraIZBCVo1LOZLpjexUB/nw7VRaEvMo/Rp0SYPU2quttWkDZQIZKkoV
	bZ59oSwHWPNmwnilo3y/Tp8jjLge2jZO3+hrmj4v3KcgbM73DZLVyG52bOqH4QKNmidB1mrIYiy
	mtLCkcHaJINs98lnbNiX3lnfIA3BlyWf/1qGn59TFZjoPaUXRj4nN5IZhohf7PCHJwdmbYQBeCZ
	g47Cd3k9sZdAnG+yajv25/QB+sTka8qfM9PiFisJZjpZX0AxOMxUMd2Y4A0DacitlCAtWB79nQF
	lD5eUuDFG1rvQZTiUkpvO29+5kZBf/MeCaIQMSXAgQcV2ELw==
X-Received: by 2002:ac8:5ccb:0:b0:50d:8080:2a7 with SMTP id d75a77b69052e-50e36b8577emr71385541cf.21.1776465650427;
        Fri, 17 Apr 2026 15:40:50 -0700 (PDT)
X-Received: by 2002:ac8:5ccb:0:b0:50d:8080:2a7 with SMTP id d75a77b69052e-50e36b8577emr71385141cf.21.1776465649919;
        Fri, 17 Apr 2026 15:40:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41abceab0sm459069e87.61.2026.04.17.15.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:40:48 -0700 (PDT)
Date: Sat, 18 Apr 2026 01:40:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable primary USB
 controller in host mode
Message-ID: <5l46jjjywvg2gtkrmazswyprj4vqlwbo54jpbnuh7scc6clesg@zxsnca6uzbev>
References: <20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1SGI5sbdEifV4YAzZLX52LCqsaCIKoQl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIyOCBTYWx0ZWRfX+3k8tjqJLcY6
 59m0PWLqaosYn25sA5AMXHPBIbYrR6E6La5W7qiJXGwKmDxzcLFrnqw8PQkVc8JSPv60pdi2Mt5
 f9abRLZ9rtet7fdxh2PiMP0hYsVS+S9xrdXRf/6i2yCxkggOuCmj8KrVIGTNIBRInm1C4BWw21j
 Soz47qzIUO+6K/ww8h1cyn0BsvkcbD4rbnwdtA/VAciYkAdcOwQe6ZOoKf6aOJy59tDelU79pqH
 O009pVHwXHw7te+qb21pbslB/1FSLRzEOrOzPtjkfEUI5C7PQra4V365OLcx1G/Cy2O31nUngbP
 rXmbBYO90yCzVQzgxG8ewh0CKSVvHy/vUGge4PW/cwH14rAyLYfMvNV3qXp0JIkKegSdBY7b5nU
 c7WXtkWZiB0BSrZvwR5fR2SHF7coMqcIgNJTa3uy/616XaxhCVwCA1nz9y44ZAf4yZzENA18yOY
 ZbgrC3I2WMMXsPO54Nw==
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=69e2b6f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hYANR6JDRRYnxUl_LGMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1SGI5sbdEifV4YAzZLX52LCqsaCIKoQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170228
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103570-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,oss.qualcomm.com:dkim,3d:email,qualcomm.com:dkim,qualcomm.com:email,0.0.0.2:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.4:email,0.0.0.47:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AA4D41EEE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 08:50:14PM +0530, Swati Agarwal wrote:
> Enable primary USB controller in host mode on monaco EVK Platform.
> 
> Primary USB controller is connected to a Genesys Logic USB HUB GL3590
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
> Primary USB Controller
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
> Mark the primary USB controller as host only capable and add the HD3SS3220
> Type-C port controller along with Type-c connector for controlling vbus
> supply.
> 
> In hardware, there are dip switches provided to operate between USB1 port 0
> and port 1 for primary Type-C USB controller. By default, switches will be
> off operating at USB0 port. After bootup to HLOS, it will be operated in
> USB1 port.

Why did you choose this configuration?

> Added support in the software for both HS and SS switches as
> usb1_hs_sel_switch and usb1_ss_sel_switch to avoid manually changing the
> dip switch position for USB1 port to function. Also, added usb1_hub_reset
> pin for USB1 hub to get detected after bootup as USB1 hub will be in
> inactive state before bootup.

Nit: imperative language, please.

> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/monaco-evk-common.dtsi      | 173 +++++++++++++++++-
>  1 file changed, 172 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
> index 12c847c03757..6316a8270f57 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
> @@ -23,6 +23,37 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	connector-1 {
> +		compatible = "usb-c-connector";
> +		label = "USB1-Type-C";
> +		data-role = "host";
> +		power-role = "source";
> +
> +		vbus-supply = <&usb1_vbus>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				usb1_con_hs_ep: endpoint {
> +					remote-endpoint = <&usb_hub_2_1>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb1_con_ss_ep: endpoint {
> +					remote-endpoint = <&hd3ss3220_1_in_ep>;
> +				};
> +
> +			};
> +		};
> +	};
> +
>  	connector-2 {
>  		compatible = "gpio-usb-b-connector", "usb-b-connector";
>  		label = "micro-USB";
> @@ -77,6 +108,15 @@ dp1_connector_in: endpoint {
>  		};
>  	};
>  
> +	usb1_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb1_vbus";
> +		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +	};
> +
>  	usb2_vbus: regulator-usb2-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "usb2_vbus";
> @@ -445,6 +485,39 @@ lt8713sx_dp1_out: endpoint {
>  			};
>  		};
>  	};
> +
> +	usb-typec@47 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x47>;
> +
> +		interrupts-extended = <&tlmm 45 IRQ_TYPE_EDGE_FALLING>;
> +
> +		id-gpios = <&tlmm 13 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&usb1_id>, <&usb1_intr>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hd3ss3220_1_in_ep: endpoint {
> +					remote-endpoint = <&usb1_con_ss_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				hd3ss3220_1_out_ep: endpoint {
> +					remote-endpoint = <&usb_hub_3_1>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &i2c1 {
> @@ -556,6 +629,13 @@ expander5: gpio@3d {
>  		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-0 = <&expander5_int>;
>  		pinctrl-names = "default";
> +
> +		gpio5-hog {
> +			gpio-hog;
> +			gpios = <5 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "usb1_ss_sel_switch";
> +		};
>  	};
>  
>  	expander6: gpio@3e {
> @@ -742,6 +822,28 @@ expander5_int: expander5-int-state {
>  		bias-pull-up;
>  	};
>  
> +	usb1_hub_reset: usb1-hub-reset-state {
> +		pins = "gpio7";
> +		function = "gpio";
> +		output-enable;
> +		output-high;
> +		bias-disable;
> +	};
> +
> +	usb1_id: usb1-id-state {
> +		pins = "gpio13";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
> +
> +	usb1_hs_sel_switch: usb1-hs-sel-switch-state {
> +		pins = "gpio14";
> +		function = "gpio";
> +		output-enable;
> +		output-high;
> +		bias-disable;
> +	};

Why do you use gpio-hog for SS switch, but then you use pinctrl for HS
switch?

> +
>  	expander1_int: expander1-int-state {
>  		pins = "gpio16";
>  		function = "gpio";
> @@ -784,6 +886,12 @@ expander3_int: expander3-int-state {
>  		bias-pull-up;
>  	};
>  
> +	usb1_intr: usb1-intr-state {
> +		pins = "gpio45";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
> +
>  	expander6_int:  expander6-int-state {
>  		pins = "gpio52";
>  		function = "gpio";
> @@ -863,9 +971,72 @@ &ufs_mem_phy {
>  };
>  
>  &usb_1 {
> -	dr_mode = "peripheral";
> +	dr_mode = "host";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb1_hub_reset &usb1_hs_sel_switch>;
>  
>  	status = "okay";
> +
> +	usb_hub_2_x: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <1>;
> +
> +		peer-hub = <&usb_hub_3_x>;
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
> +			port@4 {
> +				reg = <4>;
> +
> +				usb_hub_3_4: endpoint {
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &usb_1_hsphy {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

