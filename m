Return-Path: <linux-arm-msm+bounces-108743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJvzN7arDWqP1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:40:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CB58DEC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B48EB30470D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025643DE451;
	Wed, 20 May 2026 12:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTA9WPbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BY4CKkUr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FCF3D6CDA
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280448; cv=none; b=aIJ5OW/WBzljRfkTxeor+2jYUxCqY0GmG2jcN8Y41raTQ5TCGZk6DIAZXN5LXt4XE8RjUkyQV6hnvQ4s07mnlTkUEUeUUuBlCzJVzkiuu8lOSPqVNH904AedEvZbU8e7iwriA+Da/8yrBytB7mJuEwUs/xFukQa4+usBGpx+BDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280448; c=relaxed/simple;
	bh=FaiYDWv5ktpOfI7FbTjcTMjQgLuV8H8NQfFgpojEVP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrruPbCWTEkiASH1PbljKlVghHd24VpuMK7N04pnl4ZTeSmVx24+GYYAcOi2Tob3GRY3Ny3xeMfN6Cjyrc0ceTmGo1UmNx2Lh8POSsAIbGcltVKSiDgUby/iHnOrfoGFjiBNP34xNdmlYef6PiX3zxUmnCI8yCwOIsnj7hyq2rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTA9WPbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BY4CKkUr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K70jFU629637
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sWlv1f+/kOxg4LIib9PaORtM
	K1pM/yQ62L4lr83A1ew=; b=pTA9WPbKFHaJ3i5vjoo097EkuO7KP9Oh+yMGs95k
	Yj6c2GeGk2jdInRXdfIk1M1pUTzFVfWSY9TH0JdwXh7FXM3Xy5TMUyJVF9AZj3X4
	yfm8H9/bg7Y6BgfQHTlNuIVWx5YkoVccRHLCj6gwk1p6G6e2x745Soeyo9/wOw0G
	fiWmYTwat2dhHEhxf1Pu58zLbcha+qDThXU3gZYw2HtGTq5O0rXvFxKXikZMJSZ+
	TLqM+AyVDhPR379c1B+QfdIzfghf/DxAFo9qzjSgMx3ZJCGlSVMUFd/M80NCZCDN
	qd+BY7HB7F3JbcU5TSSTdPsVmLAcHVM+1bHpsuWrFpwaZQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nvssr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:34:06 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d25cc8f5bso7842081241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280445; x=1779885245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sWlv1f+/kOxg4LIib9PaORtMK1pM/yQ62L4lr83A1ew=;
        b=BY4CKkUrUk1+WxrjlrDjTavjur4DNg4Cgwy1eXyzdDiVK2KcKuLtLRxlh3nf3AietZ
         X7q5x4fKHDU1TJdKxS3ynw5QiTX2LzqgKDeyf1ma+0kK+2b+m8GfjbajLcGSd1It58iX
         iWsZ0cSncfVa1jYy4ACHXOkDPjx7pNWr/sgPI0rH9KFZRN0t5knzYXbs+XGTuz90qTx7
         SQ7DfdxXUfITRrAn2RZBLvnklAGMlN20MYwZ/32OOhY4QvNVugd5ZKdxD023jdAkuyZc
         Z0sjKSEVWdY7HIUWK7B1IExF8qon44CGOzF5vOwKC+ZRF9vyhAHMkqkqUYwCQ7fdTaoh
         FAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280445; x=1779885245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWlv1f+/kOxg4LIib9PaORtMK1pM/yQ62L4lr83A1ew=;
        b=B84I5PNVKoLZ4n5akmiCzHiA3rYQZymIoEjgMZF6fmQVaFb19G2osrvuRx5H/NfcZd
         SbdH+No1/6YrwIcXWU8t5ulHTcr1GxfofTQudZ1I83QCb6Tg6B8B1RtYz+S5gYyU6ccc
         Awhc2htUjpZThkft/L/V5Z2unYwTm9OT9pELgfmJxQuK8u3W6BbeWdlNC3vA4ZRe0Vya
         KrbPtWDMoB4sVt9BbV2aGq9gN6S0HLLjy00EtCgfnpYm955zReHYk7cpfpgfqsFAKwdS
         f4dQNz5XTymk2RsTyR+ZZ+MX1PCtPCiTJwNNhMhO7twIOFJ9+Sl3dv9WwtLGiBf5dOwX
         JGww==
X-Forwarded-Encrypted: i=1; AFNElJ8DpHR98CA7UOfKXc4/Trxe3VzBEEqERjUMkdi3azfFqhVPE7zAZtMUNehYlMw7tqoS+qZfvV1uXMCS9ie6@vger.kernel.org
X-Gm-Message-State: AOJu0YwFfvR2mdiJ9ZSFvyUyd9LVd1uO/8ZNObCSg3zv3ozH8L1UegBX
	fp2CZuHCKcX7Ve1sJ48nkILH/VXUOiQ3GDQOUTGyEeS2g87Jvo5mdxJqy1BAYF8/v7iBKSY2qQ2
	i+3T90DJvjTapcGo2BHuv0c7SC9G0Ylk0Bv0csN9qPK0I2Taaid7g5LTWt8noUTMQ2qg1
X-Gm-Gg: Acq92OHqBN+SEVbyq8SE7VWuNt1+tkc5UZLiOKF3KVLC1lL9z4W+yEzcWiSCN1Ffc3i
	L/MWGJXmMTo6lAUKzhgexqGlNNfNEjsJuMRxhLFcVKt0aiXwuF3cyUqQuj+pAvQlj53lOegrwtt
	w92DTuzM4X4EtFUjB80wh21/5+L6H3IKx93XIwSC+kYFtahyGDodsU9bPlEnEz+BB/xWgALlj4w
	aG1i7wfmCD7oHZSjlJuOTtbUegfr0rj14QuLfyUcnkV9wRTBkNlm7bPjcVPN2h2aSsQvba23YNm
	zJw3Zc2djszz8Sc3uqLxzmakm/TpMlv76z42l65cNMsIUAJ+zJUXRoB+vJztg0qFdJIpwrKQ2V5
	cweL/IBMmLNbyetqwh37Po72wzABJl4vtQD2hbOqAswYbeYx0RrBcjP4+PDhP+0/yKi69MIDZAD
	atBKfXra1zfvuGt5yvuVtZNAwrfQit+Xldb00=
X-Received: by 2002:a05:6102:50a9:b0:631:2624:e5ec with SMTP id ada2fe7eead31-63a3eb8bb94mr12998997137.16.1779280445403;
        Wed, 20 May 2026 05:34:05 -0700 (PDT)
X-Received: by 2002:a05:6102:50a9:b0:631:2624:e5ec with SMTP id ada2fe7eead31-63a3eb8bb94mr12998977137.16.1779280444859;
        Wed, 20 May 2026 05:34:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c4fasm4905823e87.5.2026.05.20.05.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:34:03 -0700 (PDT)
Date: Wed, 20 May 2026 15:34:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add QCA2066
 M.2 WiFi/BT support
Message-ID: <jetl37zsfcs5kl4b7iarbngrdu4ebp7ag2cvpqvkku6tbl6r5n@qozh6n5fq7f3>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMSBTYWx0ZWRfX0OHWcgv21eD+
 JpK4YKlCbI9G/mm+URrlWKon2aLndfCOpr68NU/AgmOAGLe9ChVCHHIm7nxIlj9hEnZ5p2f0Iw+
 fdQOUV8cc96+XVemiFAGwErtD4SC2JBPZlvDgT8qiegvzXBFiHiSSdU9l8UBtq5vsuVqumR0hz1
 /4RUFFRYaRDOW/IqC+yCEUxSXHQ0ewD40jDkH51xLNK8bn++4Vga4b8+F57+j3zDjHe4nIR0bGj
 G36QzMqK5ScKsafTMSXSjiSd+flnRvZPtlYKpMmI6TnEtGSzNSlpH/XOLuMqc4VBPKzB7eMifaj
 0+DLOZ6MhDPMPS/3H8UUCZ1wO7VneV/2xOHxmY8usK0Jk9Om+ug1fo4hDhy60zbO0tgeLBy2SZE
 sekoMs5OabJ3fxEf1IglO8AYieti5n8AUYteOCPORfhTvl85BEEYsZVSJVhmKxEwNPSklDamyyz
 mBs5h78e0VAjyrwmELg==
X-Proofpoint-GUID: l0uG7sDRraYSt5PwLZ2I1Vd9nm4ICxq4
X-Proofpoint-ORIG-GUID: l0uG7sDRraYSt5PwLZ2I1Vd9nm4ICxq4
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0daa3e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=STQ2a8oQ04ts6E9hehUA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200121
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108743-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 841CB58DEC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 01:01:44PM +0200, Loic Poulain wrote:
> Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
> Arduino VENTUNO Q board. The module is interfaced via LGA and is
> compatible with the M.2 Key E.
> 
> Add wireless-lga-connector node using pcie-m2-e-connector binding,
> connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
> the Bluetooth interface.
> 
> Add pcie@1,0 downstream port node with pciclass,0604 compatible so
> the pci-pwrctrl driver can acquire the power sequencer and enable
> the M.2 slot before PCIe enumeration.
> 
> Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
> (gpio56/gpio55) used by the power sequencer.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 65 +++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index 93ed575817af1c5e903662c209ead629fe202ee2..6fcad77f320cb82eccb6f07244d185abfb1976d9 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -154,6 +154,39 @@ vreg_nvme: regulator-3p3-m2 {
>  		enable-active-high;
>  		startup-delay-us = <20000>;
>  	};
> +
> +	wireless-lga-connector {
> +		compatible = "pcie-m2-e-connector";

I think it was discussed that LGA can't be an actual M.2 E-key
connector.

> +		vpcie3v3-supply = <&vdc_3v3>;
> +		vpcie1v8-supply = <&vdc_1v8>;
> +		w-disable1-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&nfa725b_default_state>;
> +		pinctrl-names = "default";
> +

-- 
With best wishes
Dmitry

