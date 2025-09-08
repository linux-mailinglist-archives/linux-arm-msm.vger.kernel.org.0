Return-Path: <linux-arm-msm+bounces-72604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04861B4944A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB8B61639A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569CD217F27;
	Mon,  8 Sep 2025 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSA8mY1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46181FF603
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346751; cv=none; b=sx3Vts5ZN2er1UYm1YB6BoM+CKnh5KvYOtdaZy2oUH++vBvg9AnGNfTNU8LIoAe7oFvJi9rfEZIgjvXMzSzk31v52ARR2+Pt+Tqo7zyt5LtmnoFSQrj4wmd7c/2SFUcSSsf00OQqGKQVL503uUUk6OtTV7ZvgQDUc+D4tdWkQ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346751; c=relaxed/simple;
	bh=crak8uVuJijqzBSbLNMkfylAoCRgXBqUf7/pqgvGjC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OusdylCvctDvDWe5+7wkWLhNk74g3mhIKGViZzHvHXcsyzZ8yuSKT3y5NH9Me9QafUhPLT8d6ydKUa7lVzJI6f088ZZoP9SlQsNQOid75sTtesqnJU0J+zANI4jERYYa7K2g+bJyF2ySuZRLjeuYaSJVloc8/PjaUTVNe0ZTKg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSA8mY1/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889QF94017237
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvaveUZbWaKcPRnxcGEAhJIh2ZBs/hd5bj37QGB+6Sw=; b=QSA8mY1/fZDwh5os
	D4nFX3Tfy1FUurMgL1xsobRGqE6524+y2KwumrwfDgBRQiwDTHpKlKJAtcQ4LD2c
	rbu0k7n7XdV5lBBKmGYNAcdWYdOaOTfTALLXzO9Kz7kTn3b9LMUql+6WRiPqvTLI
	pthLIi3qo1YJpn8+lzmta/HubOdprMBqDOizVP2jhBEu34Kn8UuF3Z+EU5snSW3t
	o5vHEPGSHY2A5N3DJ8c72Rbu8ehOH7sI5n3gViAMsOOkhm7YkgE7xLvLbaLpUY65
	QupRCWN66bXpHxSwnYHpiDzILLtn+PE4DPykUhZvoP67bv/GukosgpH73s2m5AYd
	+nmRQg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws57dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:52:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8019bd7af43so121623385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346748; x=1757951548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KvaveUZbWaKcPRnxcGEAhJIh2ZBs/hd5bj37QGB+6Sw=;
        b=a53K3GxOk+D2jLXNdSo+a/jCj0QJZBFEgXq3JF7v5esAbOY8RZsF8IGuPSOZoHETnT
         FDfQq8oIp9ixitTvEdZwbqCiGuPnh5eeyxpfVQRW3HA/84gyo8IguzM7ZuCBvr+DvrEq
         CY95Nsh0bBC2L7Wv+GhuyLc5nb6/9LrI7aVEO+IhQJsipgb/KhIhy0JC3ugXSwoXY7nz
         d/0P4d4pp/L7cixbF0n5YzS0ayWn84mjrTPnMgjqBlY/rDY2wAyRhbdpouk61/MOjx5z
         kY5r4aSH/P7+8110fQydprnIwmRKZ2bVcgQu/K66HdWKEGrlaJFb8ICCcNHgpzmRVLDC
         7VIg==
X-Gm-Message-State: AOJu0Yz3lJlCcw/j6tFEsuMTTkTVVFs5Of0DN3oB/CJUV3Bstuk7yQv5
	TVU6dJJEFHkKs8/wrpq5RyQa3pXaoA4Dhv8rclPTk1qguMFVrfe/nKbGRC42jjqMORp4co1L9Q2
	f9jPKA/vmFIYswmOOfyi1uJNDYfXWeWJ6OVIfTGX9iRSiVMtLZawJnS+UYidKtZiuVscu
X-Gm-Gg: ASbGncu7H/9nOs9aHHfF837PSD3RT4rYf9WiQlu2nK51bXCJIov8EBlUKeH2JHpJAus
	NLqIHPFGaKLOzBenIxaM5ptZ3anFUTJV32lOruyszvi5UFLLBxo/CzbLQ1BvT0lm9Nh+4HpJxzh
	GdaSYXnsGWZUX9Dwtk1pHDuzMQByfAjQQ/JZYQw2v/BRH+hlBIGoD58/X+PDl/OFez9EZ2A1hRs
	mN+e0vCRJWjVECVX6A4eH3j8btm2t6RI4MsCX42kiSDyuc+SLxW6WO4vCaYYQ/rBOyAnm7I/lKr
	Se4ODh5imugfP4HRP5YKueu4sTbToMiXwVx1PVSLbllimWeyh87FBmtNFIkETus4xbOTur/VgiB
	Vll44QnPotihw33wAdV/dXw==
X-Received: by 2002:ac8:5f14:0:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b5f830417amr59537131cf.0.1757346747660;
        Mon, 08 Sep 2025 08:52:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK3tOhFb+I2RxDjGGDb5CGgqX9S5kfnJ1nlfonzI8GnlObtYu5ssVSg4l6gyQ2GQhEeZUzCA==
X-Received: by 2002:ac8:5f14:0:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b5f830417amr59536681cf.0.1757346746893;
        Mon, 08 Sep 2025 08:52:26 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0416842ffasm2093150366b.38.2025.09.08.08.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:52:26 -0700 (PDT)
Message-ID: <e0924039-285e-49c6-8929-0e62b3513147@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:52:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: qcs8300: Add Monaco EVK board
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
 <20250905192350.1223812-3-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905192350.1223812-3-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: X3TkktuhrAM6jxN33eX-zv2GlretgSjH
X-Proofpoint-GUID: X3TkktuhrAM6jxN33eX-zv2GlretgSjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8bNz1N/UG2Gb
 W6HsAzm79dj+GifwBOpdzKC5OfkEyg7GXZ/bXgw4tuipnayjwY6AaMA8tr2OPNimJAOgpNIlsQE
 +QJz31Kfk9skj/hroqZhBAiWc67ApRtNWAgvyWIhboRsRpv2Hg9TUQFcsisbJfLDHl0Fcv+4oLo
 k885G6mnaGg52uNp97Rn8A1y4+db+JcR1aydTOXiWnJFC5N8bnn5VLyKoA08Rt4T2DZVmi2G3wk
 HZf21zguWiBt4fv4YkmEO298P4Y00GaEY50XihUe8DgHDMtnY1Zy9IjJzrroOheS1ugQ3wlkbDw
 KlwgKr7ngxYpoPU/cS57bO/XLqKIiXGSFKsc52nBbE75Hx1x5GvkmUNsSyIQvNs3l5ywxO0ELce
 JTbmgCZp
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68befbbd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=IVo3xAofRzk1BSpusREA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/5/25 9:23 PM, Umang Chheda wrote:
> Monaco EVK is a single board computer, based on the Qualcomm
> QCS8300 SoC, with the following features :
>   - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
>     and eMMC.
>   - Audio/Video, Camera & Display ports.
>   - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD.
>   - PCIe ports.
>   - USB & UART ports.
> 
> On top of Monaco EVK board additional mezzanine boards can be
> stacked in future.
> 
> Add support for the following components :
>   - GPI (Generic Peripheral Interface) and QUPv3-0/1
>     controllers to facilitate DMA and peripheral communication.
>   - TCA9534 I/O expander via I2C to provide 8 additional GPIO
>     lines for extended I/O functionality.
>   - USB1 controller in device mode to support USB peripheral
>     operations. USB OTG mode will be enabled for USB1 controller
>     once the VBUS control based on ID pin is implemented in
>     hd3ss3220.c.
>   - Remoteproc subsystems for supported DSPs such as Audio DSP,
>     Compute DSP and Generic DSP, along with their corresponding
>     firmware.
>   - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
>     and other consumers.
>   - QCA8081 2.5G Ethernet PHY on port-0 and expose the
>     Ethernet MAC address via nvmem for network configuration.
>     It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
>   - Support for the Iris video codec.
> 
> Written with inputs from :
> Rakesh Kota <rakesh.kota@oss.qualcomm.com> - Regulators.
> Nirmesh Kumar Singh <nirmesh.Singh@oss.qualcomm.com> - GPIO expander.
> Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com> - GPI/QUP.
> Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com> - Ethernet.
> Monish Chunara <quic_mchunara@quicinc.com> - EEPROM.
> Vikash Garodia <quic_vgarodia@quicinc.com> - Iris Video codec.
> Swati Agarwal <swati.agarwal@oss.qualcomm.com> - USB.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

