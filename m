Return-Path: <linux-arm-msm+bounces-46757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F7A25B6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95F113AA8C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976F7205E2E;
	Mon,  3 Feb 2025 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQHt8V/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F8F205ADE
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590658; cv=none; b=oZQ1p160EG8n/1bZcauu+70sYqwy2KhaE5xOhCu7vTOKJ39sbKHWqoWRRp2tMLaPXKNm8PkzAzB9c/6VybK5TMUu+xXW5g3cnVfsMIw7Q8+o3Smh+vz9zXwerAGdXebYZTdNiNSQXhYvcWQIinFGM+DNe8a1uylHox2UiV6vaSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590658; c=relaxed/simple;
	bh=/utc3UxctpVRJmC1Nm8/3vJ/7Oef900YhfJJ0iAdfvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7l2FuOziuwfyQbZyPfrH2IVDU7uQ+BPRECrCpaniEy5VJURahIdIuVmfrVO6D4rDbVg4KySwduEFk/HLBPtd/9Ib2u9B+wZNR1wTbcTwmWRxkYXz0uHZ4vp948+zPhgJRZzDySNe32T2F69/rvfnTj1BMpl1vyOqllSvxm+u7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQHt8V/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135kZNu006247
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 13:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i9dKRVRH0tsWqZoRlMIfUf+WF9bijGx40ODTB/g1OW8=; b=HQHt8V/Do0FmzM8Q
	AL+iq+m/Dqqe6CtydD3yEFC/haEvp2tpTbqewN7Jw7qNQzH0CTcavB8aQC4TBJt4
	qg3F/nqRFp7vGUxSipYOstS24T+usrnlNSehM4PC6Ix9Iv2vR9M8uHTrTlKkGxuz
	yvwYJYqC7QYoh/0mFRkq62C8XW2JgJGJXl3HVwm6AwEkiVpGADHQVWVRgy8N+6VW
	CyWeTfEfMKHAmjDPaqiaZ81hA4opCeNyW4BDM3eSQx7Ub8/QmQWtTVObZKSeyq0V
	+KM2BU9cji58blXvJ81QrFQn5IVzLghiE75xvDFfFgldEZfja0/gUJ05PsesqZ8F
	PFh+/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqxw18rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 13:50:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f499dd80so30072885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 05:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590655; x=1739195455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9dKRVRH0tsWqZoRlMIfUf+WF9bijGx40ODTB/g1OW8=;
        b=ZputJVJIvNrv2z4ppMjWKoNaVMFIw5lC4fdwgm4mIbMcpyFlCi15FYEE0koXwrULRg
         N0+1zabJXpX966MC1P0huKlqBqvOuG2m13A/X4AKac2DWI/AF5awt3CCbFPrMUJmKxsy
         +FsVwxJWVz+80x2JYzZsaxJyiKVdfU8rn0hOGM42geIzRivkaNL6CGa5UOX07WvANTYk
         4i6MBZzcA/ZZJ3nUGqYxDxaazbDWfGiKCQ84KeS1Grqga/C+hGRdjQV17x4JnpgoQ8AT
         ZSr94TCqgHY/CZ24M9BsfZhe0ViabmR7m/dx0x59VscECYxwmvnhEprLLE8+6hvzfAYF
         4Ehw==
X-Forwarded-Encrypted: i=1; AJvYcCVhLmVMl5DmGAS2SWRsFVKG234GHMGBhOBZpdOF95h1IoSLe+LaOnAGC57c1ncF7qxHUOPbrdPUPhvn5oV2@vger.kernel.org
X-Gm-Message-State: AOJu0YxKj/CRK18gIuqeF3o6fKqYU25iZzK6JoO/5p1l+6RIINGsj08O
	3xmJrOcSzyz1iqLvHp9sQwozDSNjdO1SIyoNup6/7ZexXra4RUxJKBKfVaOv81c9frfJheOix/+
	UG4t/mj6m18HbnJDxS7dTeVsuyAAixIK5Ikt+b/58tysrrPURr7IZLeIXs/jbdn3+
X-Gm-Gg: ASbGnctb3SxFbrDa5Em4DFyIFIGdggM3A+EmepeAB4W4IyFlpqt3ZLhE6HWDMyFX8HC
	Mmv2armOjHwPIPbCSqDCbMdKcWIC37687n7K0qvK+8x6csVQ5WZPvaIp3wkOxtMMtOZq76mDfQp
	3QbswI1idKkO469wtPKWmfM3kswiGjGjhnAocWIw+iu/z7s6Iu9+tSu0V4O3snZloyM1reVmNM7
	ljdlDPGvt/Gq9HUDrCX8E+lQsdymKNpgbmjeLptyGYYlbyLYmcSAGCQVC3vlIZauoZ+y9yIXxpP
	GiJ5yn1i2fr1883M+Put4qFO1fG4X6lPqgmpGbjdjZiN6z6bNyITIBjsnfo=
X-Received: by 2002:a05:620a:198c:b0:7b6:d26e:9d76 with SMTP id af79cd13be357-7bffcd9d8c0mr1246577185a.14.1738590654962;
        Mon, 03 Feb 2025 05:50:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY6jvMc+LTupwBqTCiNsviQpArJF4m3TtQX8HBbARSwDbXva4ZNsyY1mUxcrQtNhsMgtu6jA==
X-Received: by 2002:a05:620a:198c:b0:7b6:d26e:9d76 with SMTP id af79cd13be357-7bffcd9d8c0mr1246575285a.14.1738590654639;
        Mon, 03 Feb 2025 05:50:54 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a3244csm759209066b.146.2025.02.03.05.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:50:54 -0800 (PST)
Message-ID: <a6fe746c-c5e2-4c39-afa8-46b225256cb9@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:50:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
 <20250202-rb1-bt-v3-6-6797a4467ced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250202-rb1-bt-v3-6-6797a4467ced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZiLMR_GoRyByfOhh7bf6s-jJe5ai49hI
X-Proofpoint-GUID: ZiLMR_GoRyByfOhh7bf6s-jJe5ai49hI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030102

On 2.02.2025 1:16 PM, Dmitry Baryshkov wrote:
> Add support for the onboard WCN3950 BT/WiFi chip. Corresponding firmware
> has been merged to linux-firmware and should be available in the next
> release.
> 
> Bluetooth: hci0: setting up wcn399x
> Bluetooth: hci0: QCA Product ID   :0x0000000f
> Bluetooth: hci0: QCA SOC Version  :0x40070120
> Bluetooth: hci0: QCA ROM Version  :0x00000102
> Bluetooth: hci0: QCA Patch Version:0x00000001
> Bluetooth: hci0: QCA controller version 0x01200102
> Bluetooth: hci0: QCA Downloading qca/cmbtfw12.tlv
> Bluetooth: hci0: QCA Downloading qca/cmnv12.bin
> Bluetooth: hci0: QCA setup on UART is completed
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +&uart3 {
> +	/delete-property/ interrupts;
> +	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
> +	pinctrl-0 = <&uart3_default>;
> +	pinctrl-1 = <&uart3_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";

As you're going to resend, please add a newline before status

Konrad

