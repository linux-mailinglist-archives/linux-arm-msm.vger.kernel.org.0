Return-Path: <linux-arm-msm+bounces-86992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D618CE9F6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08BCE3025319
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401D62F9C3D;
	Tue, 30 Dec 2025 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzIHIFsV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cls+Jq3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC772F49F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767105920; cv=none; b=QcTtE0WO5A4O9vQjGw7rIBaJxQwJN5cFUniqWBX7RmvVM0F3ox1ZR05Mbkz9WvHgfNyhUvh1qSvdBCqiL7Hjs+C6+b1e8kvT7ZfLGvxduW6EzRAmFEWmbr6Q28pdUpphe0oltzeQqVGS+HP2sxtjAomneeu43yWYWyAFbc4hG4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767105920; c=relaxed/simple;
	bh=cyCmDnGm969XQXoNnboYDcSeh38i/QFyZvGJndndrJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0CLwvpEwgLzMJ0fVEgkISFKy9adSAfvOSWlhSnynUb4IDf6WwN64b44ItPj34zyV10IPhSKeYRe4KHgksIXNZBjSBjEWhPw0m2QmdEayuJYq70LpBqs4+fHEO6qAReY2PaiMqknPWoSM4G9uvGQfQ2I+yKoOpFMotC6Lyv8dkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzIHIFsV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cls+Jq3T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9iKnE2392639
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BtbGTz4z3tBXs1SB7ZTHxrta
	vgmb3rsvPP5BQ4tmjQ8=; b=RzIHIFsV2es0acFtC2j9bOiKHs/Kr6f8bcMGX2X1
	tAtSQZbu9INgPQUCBlIAOEMWGvOkZHO7NfBgDvXMO3zqrPOX+AZMXqCDP+nB/60j
	zjowi9n1zW+E7zRnrR25S5vr/HwtzUjDbB1PsZinA2ZLWpOGTWT+1Nr8n8WbhEdg
	G+/0uVc6+4puXoFVMmze7HNjX5+GltipjzRUGH7PYc9rhbsnKmsNo20igV+DxCTe
	rB7ynu7yUS7Cb7Qu9qU6wpqTk+qqGNx/9yBeNbWbHqUi5HKon/CqtorMKjDqprVR
	ZwgbBSp32FP3FKzdaD1pgT2grPSvZVigV2cq4c0OHt4bmg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1beh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:45:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f183e4cc7bso189478841cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767105914; x=1767710714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BtbGTz4z3tBXs1SB7ZTHxrtavgmb3rsvPP5BQ4tmjQ8=;
        b=Cls+Jq3Tbu/30R66LdOjYkJ2Pok4c9eV+CrbTqME8cgrD9H1uI4qNjnVff5jHFA3GR
         +D4FhMZT+WRCZnKjArjRVbKG+9b6z69QEXJbtc1pqqg6avxe6NG208g37J8al4d+2eZ/
         FHmFLBtsoRQhjj0wG4njYyDEblFeEbbPSEl9M1xACeT+D98Yw29ianPPGt8I5OX6o9kO
         MuZKtpUxGmfU+s8I9FnzN6kNbGGMwQNZO51/tjDWBUX/dEvkDsGy6nW+CfsF0olOgtME
         KpswcvxGPcdHCwi9Zw6+Ldm6hRGrvziveCut5pHCnnLctXTO0AnwMqcy5kZjgKyXq8yU
         oeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767105914; x=1767710714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtbGTz4z3tBXs1SB7ZTHxrtavgmb3rsvPP5BQ4tmjQ8=;
        b=D3dxhn3nrk+gbvY/089AhlAM+nGH5Bgm0gxm2ylZDj0BTh4waDia9pSHnLS4eNZwQu
         CjY0ycLxTRVj2jWjA1WrdaAJe0N+xIVrZNEdIACrMoKtnzYnY4e2QT2YC2wplndFVauM
         QxcYju/xgy6QEShwiyvyXKsEbsSMGmLFaAdBp9fG+OoQV9r8D7L2cjJOgA5c6Kyzhteb
         rZK69ihT9wGAtF2SJgyt0cq7KRTCp6kOJGpGcrAAUjihTEaEBeUCqo9Zb0O/NX8phwtW
         hMG58/D9fTNmfzkqrb55XSVH9JJ5b4dOqt0rQST7Vc8o4ebBQxUTrDiaJNWJPU49TbCo
         gPtg==
X-Forwarded-Encrypted: i=1; AJvYcCU4dXZrKnP1uPWv33l/TIsG+EhQNbEYWxVo2jQ1wECevMIb43KfYRwPV9l86AbQpppQyoFEDbB/j/E++i/r@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ia7q6z6e02YD4RI+710TZcWc7ZkcMOWsQ3O9mW8Tv6gjU+10
	MVgCfIP2N8flWriDYif98u55lCEoCxqAxrT9D23hlYnKjTPqyAeslAQFMIvoTTxgtLMIEaccP8l
	YEojygX7AGPjCvK4hFL1/b6SQ9PE1SFpEQ9XKX616Lm4HGXzc0oTdF2CPNwGENHqCAf4X
X-Gm-Gg: AY/fxX5ja4MTQ4SFM0XjRd9ukxPIlSTmzKZwvu93AexfZFIxhX/GvaPyYn9F61YshAa
	6At2iGFi8cR+/43ppKqCuF40yUI1r2ccQxHZbazqMCItTN5Qc4MnP1S8H+CKl96mwUo1ak5wRsq
	BeWv0V3SK2KUDrbhVzi//dZaw4OXGdQr7KcOi4vjrCnp8EQtfcshy+6nMSMF+taTQZaNZApU9W1
	7VJgXHaauynNp44D9a9dNoTXFQbC9Q5ZgOi655DA35BuPQkL0b/W159QdmW+E1olj57he+rYDnZ
	TLvzP9PAvJwCl3N2e3ZEc4h9sP+aWXWRZ2n0B8bCCPA7Teu98euNuwZ/Xuld4/sMe07z4xiTU0k
	zUsg0EKRdiNyhLAUPkGYdKrBVS3503gnDYki3iv0d1VdvZ9krcZNVpM1ZAbCW0OPYHgUPYHN+Xn
	pTRitcRUsGIONYnEc9fI+xjY8=
X-Received: by 2002:a05:622a:1b8f:b0:4f1:ba00:4cc6 with SMTP id d75a77b69052e-4f4abdcbd81mr542598961cf.79.1767105914411;
        Tue, 30 Dec 2025 06:45:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSOuHs5XIls1dFJC2cY0NtsblAHccF6WAmbn/yx2ubNFUZf9dLstfEiT+b3xoXpusvFkHUqw==
X-Received: by 2002:a05:622a:1b8f:b0:4f1:ba00:4cc6 with SMTP id d75a77b69052e-4f4abdcbd81mr542598231cf.79.1767105913813;
        Tue, 30 Dec 2025 06:45:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm96999781fa.19.2025.12.30.06.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:45:13 -0800 (PST)
Date: Tue, 30 Dec 2025 16:45:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <jby57ycrknqtjawed5urodwsq6gucrfyhkrb2uhwsoeif6qb4m@h3ra353ermps>
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-6-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230130227.3503590-6-tessolveupstream@gmail.com>
X-Proofpoint-ORIG-GUID: O16KgTkiI1t9rTlC_j--jTRiz7vpOnLE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEzMiBTYWx0ZWRfX2XuSMzGwVXSP
 dYxNyTnt+KlW4YlW/js0ROb7mIS0PAiWzvAFSeIoS7pWrnrlW2y1fY9H0pN17kIkK7yCd/2Bo7F
 GYqY3+dvDxRBNwpD/m6S3Esu1YWcc0ofJa6T4UGjNEMVpKPNJkP0W1tnIRt3Y8m4DbcFwCkJv16
 Sfwk7PQeGL4g+aRlcOvF86gp9deulDe0OgiMItDdAL8sdEN9xQwwE5+aWi9gN5yd9G0E+EBRVBR
 QHMV0oaNbl3TA7qqGTsfkDdQsDF84xpxF5w1OuEnAeRZHm14kkDNzaSGjcD0orQhPBweGE1eJhy
 Oq28wD7pmSDbfMyMX9G7nlZi1JBN1lahfli2+WTihNJ9DvfErqgF/nB7Y09KbS0A2VocuLZKMue
 s9XDDnB+TvTgJUq7PZJHn3Zz++vFm9qPs+P5tBsMoDHATkJ2Pqu6hO34NwAzad6Z0c8xNEVM1X6
 fD0gjin38RatgmMoQBw==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=6953e57b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6q-ckXwDscysDfU1ynwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: O16KgTkiI1t9rTlC_j--jTRiz7vpOnLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300132

On Tue, Dec 30, 2025 at 06:32:27PM +0530, Sudarshan Shetty wrote:
> Add the device tree for the QCS615-based Talos EVK platform. The
> platform is composed of a System-on-Module following the SMARC
> standard, and a Carrier Board.
> 
> The Carrier Board supports several display configurations, HDMI and
> LVDS. Both configurations use the same base hardware, with the display
> selection controlled by a DIP switch.
> 
> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
> can describe the HDMI display configurations.
> 
> The initial device tree includes support for:
> - CPU and memory
> - UART
> - GPIOs
> - Regulators
> - PMIC
> - Early console
> - AT24MAC602 EEPROM
> - MCP2515 SPI to CAN
> - ADV7535 DSI-to-HDMI bridge
> - DisplayPort interface
> - SN65DSI84ZXHR DSI-to-LVDS bridge
> - Wi-Fi/BT
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 126 ++++
>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 598 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
>  4 files changed, 867 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

