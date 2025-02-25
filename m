Return-Path: <linux-arm-msm+bounces-49309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C5A440AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 14:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6E04425302
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F423A26989B;
	Tue, 25 Feb 2025 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fd9Qrxgk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815326868B
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740489712; cv=none; b=kI08B4+sBocBgBdWm/NkaI4Wj5/QuCrTHNO5wXAmrN835I/lh97OBE9rjlUnPsSGo+0vsfY8Q4De6VgAfXb8Q2T7BgukOpHtN8zaBuHxiwKFows/oprW2vUmmlIHaWqUCAZjT5+6t3igK75NmN5xnpkjHr9sWKFrhNGJ/0c/Xww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740489712; c=relaxed/simple;
	bh=OpbzeKkRseA7inZVXOnlUwbCIzsHXlbkxgmG5l4Zwig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKmjW5YFb1uwf8zh9TmD3Vzf7GvWtUZSCGPyligGnj0JbUWtbZ5CL2X2H7YW+JoeiZZu6QjeEBJvPVYbJKLSR1OlppPsOZwiB7x87DUy8x6T1oXwXWHbM9RQ5Zk9EEVZimFE+WGWi/6W1rf5218q24Jii7pPJtHk2z1mKP2bK5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fd9Qrxgk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PB68LP010199
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHtRyNjcOSVP/X/SiQO9BwjBFj2Ol265XSaU4JsAGS4=; b=fd9QrxgkIXPu0joi
	ufsVtuT41EQz+S4oUzFwaBrP2XXiUQucdBdOdpO4Gip0g6kMGe0Xkjk86ZbhCSUC
	6zVxanSN11+/NYFGTw5HpWzDldgxtgX57C4WHkWqujZNTygJOZZK3cZYdyeGQ6zj
	Oh3o8AWhbfyAlWQyk6mUgODOZIhPBulQBL15HkO86WdkKvNjNm8O2zNIi/i3rE2a
	PhUj1qSqEraZRCRySqOul3phEIR/DNrQgKHuH6MUR44mo4AJK7YCWGWAfQj/FvK+
	kBEZHLoBPA+B7SFdcmlaSXgaHaK1UI15//38Dt/EEuhOIkcckAnU9eUbSIeSYKBm
	Tec9lg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6nu105c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:21:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e4546f8c47so12435806d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 05:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740489708; x=1741094508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHtRyNjcOSVP/X/SiQO9BwjBFj2Ol265XSaU4JsAGS4=;
        b=KeotTGE5Bj+c4BZgvU1VPadHM5oDS6qQwe0/e082Ox+QNCaLnYWZQkAiZ4UUTQT4In
         /n/4JjuhbAO4WluZUgm0oRcJv2AhAongCbfm9imfi52htgrjdlT6/2se00XcA7fysBHd
         U4N1jVfhq7i3mGUMbixnhs7n8qz2CV+F73qBCR57yOS+pez6roAC5/zOLailimLzwVJe
         aYbZqoCtv0qvos5/6LgQOyYlQVdKBOABmu4n2xFVJ1+m1Ykr4yMC+XAXVkVFszSwZ5mE
         HeZhaM/8pL4UPZUPNHoETAbRfqF5y56JGCPKCAXebWtFidw4VlnoiVJroOU/cr7iAEPJ
         PCAg==
X-Gm-Message-State: AOJu0YxV+e1dp0IFvbjkmd7ILfTyKe1hgy9IIMqaO9F8yhSl79CikIPA
	6ew09pYNJRqOuyTOaAmccuM2UAYaDZmzQSi/Bbzraut52s6P3Wqn0K9JFiD0C4TO3ub86U7N7wg
	wPdzxHg6a5+i/yx9gxmSqqpnhmly9J34F1IOs/eyFWpccQwL3MUxz5LA279C2ojNp
X-Gm-Gg: ASbGnct8nLpVec++mVLa8qV6ADnJ18JkAsj2kXwGlkMm2I/ksH3pkze/R3p3hgLGiEh
	ml+NcFIqWqRgEhpQNPft12vU003dhKH7KhC4IKqEHJJqu6dU0hVZomw95U9V0nziAEcrrV1YPsa
	CyO+9iT7OC8JJeSKhHwKMOhgd3tqIObr8baIO7/vz1qemJ8e0LOHDC802F51que34KrBixcDkeG
	x4DH3TgiojGZeYimAtHWOX+N5p8tkOFEFLuWi4Ufp0a8xhz5wMnn4zZvFSV6pGwAZBX38RHWh5e
	wfAaXd3eeuwT7uNEu0c4EGhQrQEACcBB6VA+xUm/b/JAXlN4LoqPTjS2yMLQ/cGoiitYLQ==
X-Received: by 2002:a05:6214:e64:b0:6d8:b169:dcd1 with SMTP id 6a1803df08f44-6e6ae9ffd9bmr79440126d6.11.1740489708167;
        Tue, 25 Feb 2025 05:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGrIYl5tf/TCu42Wwk/SIStx0cn1EJs1IKMD2u2nNw8qNKzZ1EcWUmCmlg+83ihivsS6EQzQ==
X-Received: by 2002:a05:6214:e64:b0:6d8:b169:dcd1 with SMTP id 6a1803df08f44-6e6ae9ffd9bmr79439996d6.11.1740489707762;
        Tue, 25 Feb 2025 05:21:47 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdbf55sm142080666b.15.2025.02.25.05.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:21:47 -0800 (PST)
Message-ID: <bb447c8e-e64a-44bd-8b45-f161199397ae@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:21:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8250: Add support for Lenovo
 Xiaoxin Pad Pro 2021
To: David Wronek <david@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20250217-lenovo-j716f-v1-0-b749cf4f6cd7@mainlining.org>
 <20250217-lenovo-j716f-v1-2-b749cf4f6cd7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250217-lenovo-j716f-v1-2-b749cf4f6cd7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t8CyEurhJvD5p_Nm1WfXCRCpN-ZrVBqP
X-Proofpoint-GUID: t8CyEurhJvD5p_Nm1WfXCRCpN-ZrVBqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250092

On 17.02.2025 12:32 PM, David Wronek wrote:
> Add the initial devicetree for the Lenovo Xiaoxin Pad Pro 2021 Android
> tablet with the following features:
> 
> - Wi-Fi and Bluetooth (QCA6390)
> - Detachable keyboard & touchpad accessory (Connected to an MCU)
> - Fuel gauge (TI BQ27541)
> - USB
> - UFS
> - Buttons
> - Remoteprocs
> - simple-framebuffer
> 
> Signed-off-by: David Wronek <david@mainlining.org>
> ---

[...]

> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&volume_up_n>;

property-n
property-names

please (file-wide)

[...]

> +&i2c1 {
> +	clock-frequency = <1000000>;
> +	status = "okay";

Please add a newline before status (file-wide)
> +
> +	touchpad@60 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x60>;
> +
> +		vdd-supply = <&vreg_l16a_3p3>;
> +		vddl-supply = <&vreg_l8c_1p8>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended

also please align the property order with x1e80100-crd.dtsi

[...]

> +&i2c4 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* onsemi NB7VPQ904M USB redriver @ 19 */
> +	/* CS35L41 audio amp @ 40 */
> +	/* CS35L41 audio amp @ 41 */
> +	/* CS35L41 audio amp @ 42 */
> +	/* CS35L41 audio amp @ 43 */

All of them have a driver nowadays, should be trivial to hook up :)

[...]

> +&i2c15 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* SMB1390 charger @ 10 */
> +	/* ES7210 audio ADC @ 40 */
> +	/* FSA4480 USB audio switch @ 43 */

FSA4480 also has a driver

Konrad

