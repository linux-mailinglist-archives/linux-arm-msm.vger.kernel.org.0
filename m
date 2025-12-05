Return-Path: <linux-arm-msm+bounces-84501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD80CA8462
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 16:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1A6333F9EFF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 15:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6656C34D3B5;
	Fri,  5 Dec 2025 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jt3/1u5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kh2h7a3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B4832B9B5
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947312; cv=none; b=ThtZD9roxqavVfrXztoHo7x06x0n1pn72BD9d93CqrSxxSihh1MjaAlQxtZPWWHA2wENGAK8xkpzG0/ezZH9rXTOKUuB5KI+hCeLrgivLxDo3Lhu6Db+8JezLz4ecCUrAoxKbqMxQdeUkkcagrm/BX+matYdIlI62JNCEP6KvKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947312; c=relaxed/simple;
	bh=PArCrlXxLaseY6SrjNYTk5/snsyyR1dlCwkDqHrKn9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUTFwQU/uanYffP0V9LpWaiBR40/WcAfHJuUCeK8zodOGth7D8JENngy6mHZ/j8w8MsKTMyqFS2tlqArpIXPbAL9DFV7+Lyjemwew8h611amVy/1fwB+gWH6Nf17vKxeEkzCvrXjeOmLs8cibanBGnGuPwpXl7GRrddHLt75dHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jt3/1u5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kh2h7a3j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5CpjWS231161
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 15:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVCH5wvioZe9kiwYzabc8L4MQj09OxUaUi86lSa920E=; b=jt3/1u5kKCzP4Psw
	FkLq7End7Q2EaWwe7mYLbUkcfR/HuCS3D8FsSyvootdGigvyy9fjaW3Wp8jfHLpZ
	Z4RsExXhPOp8tJIKZzW2Hpp1Ccm8Jqp7F0WDReedNeUibVuCIsQHJly6nOBpWZhu
	wwe1sdXTmoYWCHJZPKa9rIjSx/GfXu3VppWgm2OOTbtjqgBlV0HMLD8vgFiuHdAK
	5jW4O6B8pYTSoncuW9RtYZnlRDGiKDWsJVw/3YN7FiFNHMSJw9jdnsu4biYvzOAZ
	e5Ne99yzxSeUSif/D4O9ty2CNGg9avsvdNR26LZHRi45N//1PkjsMfMYhImMleXU
	OuXaYg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auys7gax6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 15:08:25 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4510650af52so3031101b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 07:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764947305; x=1765552105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVCH5wvioZe9kiwYzabc8L4MQj09OxUaUi86lSa920E=;
        b=Kh2h7a3jIoPzVlkAwqp6ZVbXMBbMPvw7EqnUsgmF/K1rNnqzl4H9X5A0xYkZ4ks8zH
         8gd20WyWyoJEzgS8YfBlBb5cDdp0Emh0LpicCtCqYhifOmY5SAhYsO+p4k6fqWAero29
         Pg+G+pEmaspO34OJAwiQjM4Twh0rQ1xh2FKNAPcxednoE56ipBxAz8wrSlifcqFSShJh
         hRZuFXxgc8Avt37jvHteVbJRwctx6JKc7LLxb217/zncOFoOiD0jN5GaqtFqRqHTyaXu
         Ly4XsD5TXOT4Y3Nl9qSVC9u08XLjbZ9V4AjeENI95ia1mAMFw5IR61Y1XM1Mw+XCIGwd
         Ci8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764947305; x=1765552105;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVCH5wvioZe9kiwYzabc8L4MQj09OxUaUi86lSa920E=;
        b=eh6g3E1VwA1L2n74tz/GN5xyJFptcDnLwJeQ1XPfRiC06uwiq9HfUMUEKTgeoaIjqh
         hm0645DudTfEbvs1NjMYE6ZnXmOS8728QvJA2lwBSDKIRMvPZRGjeogURFXD/CnfzSt/
         eWMAuJ7RIubJ9cOLEdm56hI+fi9ARWMhxArqw8dkNgLgrJ/UCDpPxSj2XMsEgLklam76
         mIlKeW/QVpGbX6vJU454EsRuMNVWnPhZm9L2ImP6vztqUnqU66/QDj/OiMtLFIEpS7j3
         pdOEUUrmcBSnpXPaCIrJedzKMgsNAiCnmR3BHBUvWUhECEobX4owcBcSV9HgIs87fEe/
         tHNg==
X-Gm-Message-State: AOJu0YwFce10VyRImQ6Bs2PvcY54W4e3whlLfuQQhXWUoUCIUawsmxfl
	rvNjYFrs4farZj+kVIerESZj0DtHuhKzTQu2/WeYTokTkbippB1rhKXiPhbeMvDoOQjoxE9XqlE
	GNw9txR7kR3+xpESrdXaq20lsRe63RDlSkP5p/M8gylxE98bs0HFg821Bpvn/ALWSnGMt
X-Gm-Gg: ASbGncsmLfVj9/wxc2clNFzT0h54+gh2qTJLT+37VlyC0MUZCrmnDG/ndtOW3dIBaZA
	8JEhotjPKHaPs/NyA3E7N2NgSA8O1gV6Np+5FXlOp97Rx8KbaP6FFA5cuiIh6pOGLAGBCFHx1NH
	i3AEc7oW1SL60RDmnYgPOdsbW62cGWK0zx36xcmdUcMFG/GdXdvzdRVGjTEDtQZJBYoMZFRfYQs
	krQOkgN3vkzr4edeoBVFjECgM5+0TZOX9Rfs0cduFxNflRRprSCdgFXmIX/ker2pRM3dJowxPuI
	78B9NO0nXArjj43H7mQVdx7hMes8wyyRuEpE4ggeGU2GqAaa7CVHIYxHLR+eOqi46gIW0Hqab9n
	O8iBpZj9iVmk4zVsHd+UGch+o5eCufTuVIAEQ5BLaBV8HBy1oPrdp/2CfiyQNdlT/umnR/Q==
X-Received: by 2002:a05:6808:1927:b0:44f:f73c:d779 with SMTP id 5614622812f47-45379eaa3aamr3805857b6e.57.1764947304920;
        Fri, 05 Dec 2025 07:08:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETLiy/34xkKwIyuudaaUwJxiY+2SHi6tv4ZnQaCOh/kwQ2rd9DBrDLuwAeduheHE0MduqITg==
X-Received: by 2002:a05:6808:1927:b0:44f:f73c:d779 with SMTP id 5614622812f47-45379eaa3aamr3805832b6e.57.1764947304500;
        Fri, 05 Dec 2025 07:08:24 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f50b510088sm3526487fac.11.2025.12.05.07.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 07:08:24 -0800 (PST)
Message-ID: <73508b26-bc71-4661-bf2d-cfce0eb1df13@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 07:08:21 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: qcom-ep: Add support for firmware-managed PCIe
 Endpoint
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        quic_vbadigan@quicinc.com, quic_shazhuss@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, Rama Krishna <quic_ramkri@quicinc.com>,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Nitesh Gupta <quic_nitegupt@quicinc.com>
References: <20251203-firmware_managed_ep-v1-0-295977600fa5@oss.qualcomm.com>
 <20251203-firmware_managed_ep-v1-2-295977600fa5@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251203-firmware_managed_ep-v1-2-295977600fa5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEwOSBTYWx0ZWRfXzHhjtOwZu7JP
 MrCpT0mSQOfUVZbB7tv/lpepHBKiPVVEV8Jfe7RaKuRsRtVN1v60paHx91mJgSEFAfjxYfjq19K
 WbEw5BBkB/sdEBfuUVnzl9GDJzTV/DzRRydmFWSPDTzWx5fFrXPpYljPUSo44TGbu3MVK6iInjM
 ZqfbTNq30CJPUebf6MUNF/HhWvXJ1LK2wTBQiEjBzQ9d51T9kc0RK7Eb6M2dSjAj3N0h8nKQsa6
 sSDLzG57C3gNcw7XAqwn9CHR58eqXQ1k7HormRqZZhYVqXkZe1cPz2gHipxyX1LjvhiD6OEFB8q
 h1MBE8pe+LoQ2jZuiVmC+rKuRCwtLadsFfUwELLlRHVGoVTcm9/gFlITCNm0GP5UwrlyhkV4ym1
 kowc4R/ecdn6S17YiNnB5DJpa5PCaw==
X-Proofpoint-ORIG-GUID: rdGPW45Ld4MsPLU0V2MnZEqBD_YQSYEy
X-Proofpoint-GUID: rdGPW45Ld4MsPLU0V2MnZEqBD_YQSYEy
X-Authority-Analysis: v=2.4 cv=GtVPO01C c=1 sm=1 tr=0 ts=6932f569 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=YnIKxIlAgHF9ygR4tIEA:9
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050109

On 12/3/2025 5:26 AM, Mrinmay Sarkar wrote:
> Some Qualcomm platforms use firmware to manage PCIe resources such as
> clocks, resets, and PHY through the SCMI interface. In these cases,
> the Linux driver should not perform resource enable or disable
> operations directly. Additionally, runtime PM support has been enabled
> to ensure proper power state transitions.
> 
> This commit introduces a `firmware_managed` flag in the Endpoint

please review:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

"Describe your changes in imperative mood"


