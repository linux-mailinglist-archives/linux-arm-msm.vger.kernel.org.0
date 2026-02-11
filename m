Return-Path: <linux-arm-msm+bounces-92568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGPMHfIdjGmNhAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 07:13:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4603121923
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 07:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E508C302710C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 06:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F02D3254BD;
	Wed, 11 Feb 2026 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6vinRvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJIxDVDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4499230F924
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770790350; cv=none; b=hhblUqzT29noiQNWJvTD15Eq+H+gEft0ciOxO7FesylTMrg9JbS8Nv/TZ/BoKU8dGI2iytoKvQOa6C0lOvQNJcLoJyxMkduuEQh7D9MntMrF09WRZh09nkL7t9Y4X0ZS1Gg1BQ5vEYG879gxWZ/n6bhp3839LPAPJwuhIGCnSq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770790350; c=relaxed/simple;
	bh=BGN2rhjhQfVk2QgMoMDwuUsHKAkkfQjTbSXUetjedKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfHbbNC4CAlrJbT4OXhGpBss49dCLFEoPEoOGLT64GHOMLZTOu7zzlcWSUOb9OSa3+bulgToTDqufaWiAwKW+XEKh63JuBB6sUZDN49U9E07zJFSnsNDhME//LBNzPRGcqUpQRpSwRRtqgB9ROxhCMu6nUt//k3X904AFAB1EJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6vinRvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJIxDVDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B2K9BX4129497
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 06:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j9khDJwC26k6b6vyvHB5IsQv
	yavqAsh5XUOPgKVhYWc=; b=B6vinRvGnC3BYq0BQO9TY0/3mqqtzKoWe4js/hS4
	OnTDuX96dd1X68PYUuQKLVEqWbOQatppcrg3Fva5F0Jlac9uYIIJR5gdXekD6qxN
	N/Ssns0oXdtnpPSXpL/nt8gPu7sPA5BzkgXjDeT13+9Ost7rQJy3o4vHZGujYBSR
	GTXjcC6Ozr8WRJZfcARtCqJnyh9IjpNmGAmOzsN9UOumfhwXV2kzJlyu2AX7NvQu
	w2fzCmxEewq2r0GEJOkxyUBwftXO/wWzHsQv7quwe6Yi8/CsmUXXMvNuLHngj+e1
	0KdHbSPO4pXfxTaeySKDBZEN2lnpfgRdhohnDq4cnLjJ3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8gvm0ja9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 06:12:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70a08daf3so415797985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 22:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770790343; x=1771395143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j9khDJwC26k6b6vyvHB5IsQvyavqAsh5XUOPgKVhYWc=;
        b=FJIxDVDWkNEHY1B8Z2MZjs7dqaiQQYPnb/SkRXJJQGzauvs4wtBHdFkVPgIhrTDUBz
         wa8P8u5G1hiYlLaRZdBWQ/aTC2QDxX3yUySzWZq9c5oOLJzkv2cfZx8J8dwAHDEn1wPK
         Tee+MuUAoqm9I6OhoFqkMdpBxKa3865VdMggUXnRrYDwgONHswuXKVQvBm3uTKY/opuk
         x1SMCr5brhtkvAzZYyRDlFjKstnzdkNim4Kms7s+WHheHYUP3Hw3mhhsrARVepwR3qWl
         mkpLLyBcKHIFJQRpA7sNsgISSOACgvaon3F+BRFnNQpqEZZyktn3E7pd7r8l4gdGbSct
         mRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770790343; x=1771395143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9khDJwC26k6b6vyvHB5IsQvyavqAsh5XUOPgKVhYWc=;
        b=aRlcxtHl2xzpSzqDJSF9NrKXZBYYKuxsbHIYY9ON39ZhHc8YcLOqfL34ghyLYzH0JN
         yDx7NhTjvu+Qd5isUZ/wy9OHnDZCChqDns0W5bcuWzPfokXd3WPdoAlZ+o+S6o8i8qeU
         rwwqaO0KcjblgK3LZOeiuNVqxqhASQSMYnEdtvRrirc0LietEWaLexVH9DMa5MwKYvu0
         VIhq4PgXbc00X3OhSvhcOmh8tpD+y+uwkj86K08ENw9fBRT8nNNlEHe+MVGV+JOE1FaE
         9fsV9NA/pmPnKBcTh5jaJFr07AYZipedGe8301YY+Mnm2mvQH5GRr1NYLfMbMJdrK2Xh
         ma9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK+szF+zXEbcj4uwGu9klIbrQnDG27ehlKn/J4NkpyMHsISiSJntCVd6i2Bstfpx/hrYBfADpZCbb9PiCL@vger.kernel.org
X-Gm-Message-State: AOJu0YzgZcWwLFzK0TO5qtWw+0vmRDz/X90rIWEKhmNN3dCtij/K+5rH
	RAIDrwii1eKNrQc2exMjdyEijpZJOyEJTMmc8w+K5JoPTZOrCNHDKdIXJFSD7OkrSiaZ2+vCXc1
	OrexOk7SmvBKObqIKgTMlnVbeCSewykpCEaPNRhP6zaqSde5EReY4p0kRK58V5GgrIebk
X-Gm-Gg: AZuq6aK+dF6aWyYIsjLIoGs2UMgdVINN+7S3SH1hIzkuhrUbNpxp5b0czFwK8aLuTYu
	IDHqva0ZOmJyl3Ayf7vY1fkQna445t4rHdULa+u6h7QeNH9dpXu0M5nPf0CUepSz9E2m78YCXic
	LUFSUl8IG7eFR55qxHToKcxyQaZkXUrQRhQ8TfCo+PPdlle0ABm/hELQ0JM2YFVgK/YwfJh7xVI
	cyYuSA1qDSuGrQSxgWOQChXXN++LDFoxU63VOnXhYStpjcAeA0D1+axo20HMyS+ZcIc27arjixr
	uYTMapUUsUluofaz8KL6vDeVWQxCcrrNJQy6GUejb5isooRtE2UMZIqDQSQeHD5eNZ2kdD1WBKA
	WuHp/2eKROgnyZuWTeURCpWke7ERSK7w+9yYbnSrQN6RsngSvHIHebPe8GUN7n5GuS+KZqr4Xsl
	fpNO9KRK576ZMMsSqwZS9UrknwhNsuBiRfDAg=
X-Received: by 2002:a05:620a:1789:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8caf238e3bemr2165204985a.70.1770790343577;
        Tue, 10 Feb 2026 22:12:23 -0800 (PST)
X-Received: by 2002:a05:620a:1789:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8caf238e3bemr2165203885a.70.1770790343112;
        Tue, 10 Feb 2026 22:12:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5df8sm1333581fa.29.2026.02.10.22.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 22:12:21 -0800 (PST)
Date: Wed, 11 Feb 2026 08:12:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2
 controller Micro-USB OTG
Message-ID: <2zztcabuf4hkixj445m3iiqdsmg7jju62e3fgupb6kaqirx5lq@2mhs5hcn3p7p>
References: <20260211052146.3760500-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211052146.3760500-1-akash.kumar@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ctiWUl4i c=1 sm=1 tr=0 ts=698c1dc8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KgnbEzuii_36Y5xDassA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA0OCBTYWx0ZWRfX/PPw1VbnAfrt
 KdOByGTWKiwIKwSoPyZYrE/9sPcNA4GNox6l4dbm7bYkh5ygr6u/YVrv4Z1vinOdSXkY45VOjgb
 zG91K+jMv8leI8IYw9VjKOKfqkpUKAgTeoPYGBhd76dHFQjtB7xVThZ10IQ0Tz9mhcn7ZWtXVWK
 P3B7Lmu5GmvP+t++fLIib6vLli+bbQowxJ5RH8o1/rN2MqP3A19RfPJSFRuhqvFtjPCL6dAE5YU
 yQSQYYKcmPNbluFAmX8ilgJM9iyWiJZSAtvKehe47Z2YpJciiEANkHOWX/1Yp6CHtVh2lWDhf4y
 FG0OP0Emad4IaULq0sa4DlA2x6l+JJSNXVBg9oGXJ2xKK7NysBx8O6gWpt81qzlsqSyQ1K1PgYL
 AcnwpSGPascsuaojciJ99+b8QWLpUiST1YPSiSHssmR0Roljt1m0bhoy0JZx8KmXwgKrNSn15af
 RcDTes7JrCbB6UlhyUA==
X-Proofpoint-GUID: vkiYGVnCNydHlHxaqcCqsWY8_1ZZRthf
X-Proofpoint-ORIG-GUID: vkiYGVnCNydHlHxaqcCqsWY8_1ZZRthf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92568-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4603121923
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:48:18AM +0530, Akash Kumar wrote:
> Enable the secondary USB controller (USB2) and its High-Speed PHY to
> support OTG functionality via a Micro-USB connector.
> 
> Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
> compatible to handle ID and VBUS detection. Link this connector to the
> DWC3 controller via OF graph ports to satisfy schema requirements and
> enable role switching.
> 
> Specific hardware configuration:
> - ID pin: TLMM 61
> - VBUS detection: PM7325 GPIO 9
> - VBUS supply: Fixed regulator controlled by TLMM 63
> - Define a gpio-usb-b-connector node for Micro-USB support, mapping the
>   ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
> - Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
>   supply VBUS to the connector.
> - Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
>   detection.
> - Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
>   VDDA 1.8V, VDDA 3.3V).
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
> v2: Fixed minor comments on v1: https://lore.kernel.org/all/ad294a50-027f-4caa-a9b4-e145f709b50a@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 64 ++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> +
> +		port@0 {
> +			reg = <0>;
> +			usb2_controller_ep: endpoint {

Nit: empty line between reg and endpoint. I'm sorry, I didn't notice it
beforehand.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +				remote-endpoint = <&usb2_connector_ep>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry

