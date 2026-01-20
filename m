Return-Path: <linux-arm-msm+bounces-89903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BMSD1EHcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:53:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1C4D4D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDA29A28EBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7893D3D34B5;
	Tue, 20 Jan 2026 22:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UfzsJA2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANQJJnpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CF62FBE0F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947515; cv=none; b=sxRkzhsRDQIia2vOHF5CMLJqbFyey0zAAekU6hL92Jb9u+MGXMT1PAh/FsQtzRPJp8Wzd2WWZvUk12vc+FABv5yGqY5tnOxNT4Ovx0Iw/erxg/XdErV/N/1wGYNrhw+B3bF+ZuhOGYBXgoSR118BMc4xmWmxqm1wRyqXCItSkbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947515; c=relaxed/simple;
	bh=X0xq+2x0cuDFdLEDtHl2/w8L8r2rHmGx6ypFfG9ToiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orHRTswkARCxRCTbMe5VWD2o/ptPWBoWEgD6gc8bujfK86eby0+B0BmEDcSjZHu0IQQDIX34ZQVmDzr/snmulblnJj0dcYnfxG8B1e7bMpksJrgBnxVnhIKd8XfD8znwft2YiQWRSaiRm2kn5mEP8iUME0ge1/ejThKIr2uDdho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfzsJA2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANQJJnpe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KEmhH3428514
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=syt2oTWmuBZkZ6H9zV1EYBqf
	BC4eRoEyR3BUJW+lFds=; b=UfzsJA2XmfeOYPWwu9ew4T3lWVUOsiZt3EjBAohe
	atRv/C7tZyupkyBQPAu4PrTDUSW8TghW/7tN673j1VybbKmf+EhXZ1ITKKs0AdY4
	AtD8drZVvn1fgVa5783nPlHQ2nZ97NOqoMEALq53hXK2bN5FAkRzna0U9oNyIL/P
	l0BiDzkXxvlHMg6tC8dfPEMsvKcLdTqNpTwCTdptWgLbg3Cg35utFEa4wKSzPx3S
	YHab/kNvIkBfIpJ8aMDRninj+/LXa3fFSEcfYd5P1B/uHBI7yhb1Ap+dfUHI+Hox
	DgXm4FHo0C73v5Igfb5oqm2wVfwPukCkvEHRhZdri6pepg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4ps2wxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:18:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so1734256385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947508; x=1769552308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=syt2oTWmuBZkZ6H9zV1EYBqfBC4eRoEyR3BUJW+lFds=;
        b=ANQJJnpegkeOVbP59SBjyzhEnLUhGUsLCSc6HyFNfIJ04osICBBsHHSazxdDnKvsvI
         2kvtH4kdPNmEsB/uordtA+eoCQTDhvK//5QJucKC15ooJ7nOxR/xYDvug+MFasq16l/H
         sw/ETEJkE+Kl6tAHH+WTwMkITzx8if8G+c/CQyEnfr+4YZWbgo3ZNhfZd4ojLI5DLRBq
         0QP079Ry1zaC1fa0VVWTgV2b6nFFoh5WBS3Il4TaV/0ltkRh6Y3E4r/pHkramAfjZHzj
         3Nfrfj6CwQQuxx/UlG9L1F2Ob8ZnHzrsJibytQOUUjq1+cKf3+qYRjC+/0oJyxBneJwv
         YCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947508; x=1769552308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syt2oTWmuBZkZ6H9zV1EYBqfBC4eRoEyR3BUJW+lFds=;
        b=U9pqaAzSU4w5QJ31mvaFyecTGZl7EJ/RhyqWDnpgJqhU3snK1ugvIw9UV4SADhoiOO
         Yk0VwS/lvDHdGN9dgwTHKkAXd9ZLGTa0TPVbCzD4ql6fFm3fFv3G6msXZQb4JpQLE8Zv
         PZkuiOXkclKT6isufwdr5L/JEQxBp75e3W/Kd70n+jHYXBBCW5XiI6HgajQ9GekvOwoQ
         Hc1QnK0r8CcQblJoLQX3C5Ice2FFFGb21uV+M6x0irvGp9vkn7VoggrpvLgoJn0LCLdr
         6lHVNtq/ImHlMd8nxmEOd7BGm0FQBQQAXtC7KkROtRpVY5OxbpaW1LdEqoGTjX8UzC4P
         wwIw==
X-Forwarded-Encrypted: i=1; AJvYcCWwZ2sYMffufhoerh6dXQnzF0Z/LeptHT2UfpnllJ3Uhcc4Inw8cU8eX2pZDL8jGzq+F4Pkf0gWjjypIWaD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj/4XKywQxt3b6QnuqjfEYHRYKhewCaSuuJzNyzm83cYgzG4Cc
	gjYRvP1MQ+hJ8ToxMYYHZdxXBCVKuRT5SK0Sui2/34Zw0MDaz2Lom4pAcgjpmwIFtZ5J9mjvz+z
	6A1opOE7WSWgHZzW+q+EMMQCxBE0BL6emjNgdSmRG3anfkyKQ6DIw327ChfpBEmw+nLvo
X-Gm-Gg: AY/fxX5fEBDBYsCMK2kUria8iSqns03iI0Pf51rmZZdaa2Vyj8Yo2BCxSW4+w4/8buR
	BNDI6j/QvXjpQ2sFZf6EzOh5qsvmZwUC/2OqVRuZaFGZHEiF1pftVbkzaYpBEe0jPh9bPPhK1Xm
	PhTfheWOhqnefTF4RemwZlfN6Kg3rpash9/cXZo81tqycWImN3k/0aOjqZdCD5H5CNqod7zhNKM
	u1tIpnxDHeRKu5V8+ehGOCx/vDUStFmHFN0xS1PJ6WxZZhFWzEFOHCh1i9ErQr6qYKKKQcf9LWr
	5C6djTcDxU47yYe6xJygU2/muRsrCa4Z+3/AJfs/5/XkOCsTVVYk7t2tKLXBmfXvhsK0Lu8apE0
	Py0X0Mi/caCuBrfaNOQC2uE5JShUwURbjvtMr1ePpPR7FlmN/kneZ4mMR1IWlI8zr3h8wXQVzBf
	zQRo6RUQBKXU6cuGurUOYPNi8=
X-Received: by 2002:a05:620a:199a:b0:8b2:7608:1ee0 with SMTP id af79cd13be357-8c6cce504a7mr418063185a.71.1768947508058;
        Tue, 20 Jan 2026 14:18:28 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:8b2:7608:1ee0 with SMTP id af79cd13be357-8c6cce504a7mr418059585a.71.1768947507636;
        Tue, 20 Jan 2026 14:18:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3544c0sm4305916e87.44.2026.01.20.14.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:18:26 -0800 (PST)
Date: Wed, 21 Jan 2026 00:18:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <3hdaz7x3t66bwqrcwny6iuuk2zzit7pcqev5ri3gawftsfxtru@fhlcf3xbchar>
References: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
 <20260120103312.2174727-5-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120103312.2174727-5-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nxGIsXSaTy7SzuU3x4IETNC4UCDBOEtf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NSBTYWx0ZWRfXyOfXMjObdRGQ
 oD83z6Fm1WL2Y9QKXNVREZe6lTwGcASPizMqUL1P7NSTH3QB1by6Ky35nJHy14XghdlyCpxDOON
 GMwZ3/TgdKg46x6+VOerUZCgeeYArqNQclLnVbdz+V93J58VssYKbhiooBJ4/FDaTYCN11leTLu
 9WKUWCKUeFch1aQTXgBPgP+V+46jcGB+rtmgXeH5QNO2/TqZYI39qHlUOiSxfS772ibEUQd9PHg
 oxCiTLcAQ9E5CiPlWwCtOx1kbW0AF1vRxnWRKe3nFY4ywUuE6PLI64voFiUjWO4YQvlQLKGr5Wq
 E5Aq0fQg713kkISpizVgG56Ki8Vz4vP0d9L9vR/7FN0oyQG/x7CNWVRe1Y3tAHEk9tROHiljbLX
 yeot/T7OFAnsJpAmv2CDcrD5LhWBNR2HojLnQfuKadQHIeI9qnJiLh74kOG3monU3xA9UKBS/Er
 hhPrOgJq4SPRyNJDDag==
X-Authority-Analysis: v=2.4 cv=PdfyRyhd c=1 sm=1 tr=0 ts=696fff34 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DB3wwMCoT05eveMYl1AA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nxGIsXSaTy7SzuU3x4IETNC4UCDBOEtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200185
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89903-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:dkim,0.0.0.47:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BB1C4D4D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 04:03:12PM +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK Platform.
> 
> Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
> having 4 ports The ports of hub that are present on lemans EVK standalone
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
> Mark the second USB controller as host only capable and add the HD3SS3220
> Type-C port controller along with Type-c connector for controlling vbus
> supply.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 209 ++++++++++++++++++++++++
>  1 file changed, 209 insertions(+)
> 
> @@ -536,6 +585,32 @@ hd3ss3220_0_out_ep: endpoint {
>  			};
>  		};
>  	};
> +
> +	usb-typec@47 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x47>;
> +
> +		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
> +
> +		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
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

This wasn't tested against bindings. Why?

> +		};
> +	};
> +
>  };
>  
>  &i2c18 {

-- 
With best wishes
Dmitry

