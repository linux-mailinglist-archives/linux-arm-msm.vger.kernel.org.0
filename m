Return-Path: <linux-arm-msm+bounces-62123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B8EAE58E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 02:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0B6E1B681FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 00:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6457A172BB9;
	Tue, 24 Jun 2025 00:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhf4kfKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE6B6F06A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 00:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750726756; cv=none; b=CVCukCbO8JL/PjlpmFKM9Kot8Q0VoKlvKsABEjrHFHXNIcxpcZhVX4QddTB92UrXKzPc6LtGaxzx8K4J2mW8Em4+MmcwQ8ulFXOqn+xGW/VSbLPPqN2gcJ7DxHbISIWcCRa47uIpndYjeeuxIYeSZAdqRx9Ds8zaXzjEUW5tTiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750726756; c=relaxed/simple;
	bh=JYUAOGvUK29IFunmxLuYweJTMsA9TRZOorHO6S+oXwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VprA96LVUaVLEbeKvWUk2xluM7/RzunOoAbY1vK0kGRPojbhWT+kkeU3gTKhVGaYd8yq+603doauzHz0/ag5yrkPOYCCE1mrN4xrGRDTWOhTnHH/sataevtrwvMtcrOyPh8yCPpNviyCMsXORWd9W5bLX6KV4ef1IqIcb68y/fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhf4kfKW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NElXax026319
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 00:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AxLK5B4OfagnPv6t+o+jFPMN
	vAJ4a85Lwkz3DtkuD+A=; b=dhf4kfKW/Gs1mSBfdkIuPSPVaA5M2LoXT3ucxJ6K
	AZqIoHkY/sP//lo8+nPvscCs9GGqG9oGuAuB0TJLht/N0cn3/JQRsse19LhRUUDm
	Nk+0o4AUcLGANWfwmgSx6I6BYjJeoS5Y3YhzsnsuHlszNCq3s7UFdKgGQtAXsTv8
	80w69rTyQ1/FCY8WD2yqbOnr1xJ2kFZT2e9YTDHSvYQPhBFZ18BqbBQHF0y7EWlb
	sfzBYVV/3XyVvrVivm/ObEPq0kOagzwSEODqN42ugvacA6d5Pi7bv4mI5Wbijk4J
	dP7m1OvOMDAtz8S1tasTTiQ/LdCbVLOwwLFRdgzi2Lhc2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8ymsbfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 00:59:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0aa9cdecdso382355685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 17:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750726752; x=1751331552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxLK5B4OfagnPv6t+o+jFPMNvAJ4a85Lwkz3DtkuD+A=;
        b=itKFnt+lmQ4cy5m4h/Uhwr2Pfmv24EPeVVxJHu2V0NTyxFc7rZZBOFYTUpzpteSpA+
         HLW5X9cWLbilIPtqwl9K9kMsR9IGMx8uzD4VDZLOHahPzchWidLJGt0aKyT9Wh170SeK
         4ljkk4fDk4J6NnC2V6oYMaR/b6bUPrUXU6nbIWflg+i7IpIl5bi1XkWxcjvzwGnlq/GA
         AOIGqpSp3Wgxv8/T3PHdmyh5cavrhPQCXIspnc9twORc6Oc4hMzgBFfLQ127n1YoyZHq
         b+R7mnJWZECfsqVsBSDfj+dntAFO8HyOzvfHhRU7tw945d4WGc1BfTtc7uB33lHOzkFf
         JHtA==
X-Forwarded-Encrypted: i=1; AJvYcCVvy7kG8bJUncKa390KbSZQJMUiPFK0192Th2ZOLwiQAGJ7e/0c/xIblIi4OLI0T3oTsn3jKBnez7Or8ruY@vger.kernel.org
X-Gm-Message-State: AOJu0YyjMwAKIKgVyJdbtnf9+0kUd63iwxnjosDZmT0zJe7DDWUACnZP
	A/qLPmuDBfSl4vdm52n9vsSFb0oA4ZIDVWG2T64TvIwDGDJ721jFkKLbztks+LG2xSV/gbuTfRl
	Lq3B1oafRz9Ds+OOQHOsIgYeZrIHsek7kI8mu6epaXa3DC2ixgwmINBKBl0837bDagOew
X-Gm-Gg: ASbGncsb1TtBSZ3gXUp6PpS5qk5I22fV6mP3R5Hdi+PXn2rUEPq2H3KIlTYuChh6wbE
	c+C8vkFj+8xoBwOKXWp820r8nv8J4d8nSf82g0D+fPdr3UsamkdMxiSO7lAEshxzpu7t7V6whu5
	6gv38f15dWXNU9Ry+EDRFbJqiwRgpEbQ3ctWpZnuULyTKrK71TO31g1Zeb7JkvCni4tFvleYyXI
	P6/z0gPiMLPgz/FhK4b5yUL2CqqKfG6by/CV9dUhmLhWVJqpYidpW5npcT2CXmtS8vHn0kUxQUO
	UO2hPv/mA0xD4rnE6evGXkyic4kTkdE836uc8Aw+IaEtle4gfD7VgNuPHaqwPYsDoQ7yEKno5Iw
	H+QSul3jlvR0FNWn8EEbr7ei/JUICn0BGO+w=
X-Received: by 2002:a05:620a:a90b:b0:7d4:f7:3baa with SMTP id af79cd13be357-7d400f74702mr1750091985a.8.1750726751798;
        Mon, 23 Jun 2025 17:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbrdGvPGdMsxD7cM7pxk9ZTzDk39wxGR/2YWHHePKYKtmHmosEildSYIv+nX67voLtWmHHaA==
X-Received: by 2002:a05:620a:a90b:b0:7d4:f7:3baa with SMTP id af79cd13be357-7d400f74702mr1750088885a.8.1750726751378;
        Mon, 23 Jun 2025 17:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41d71cfsm1622121e87.243.2025.06.23.17.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 17:59:10 -0700 (PDT)
Date: Tue, 24 Jun 2025 03:59:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Start using rpmpd for power domains on MSM8974
Message-ID: <amfgwjgstu4hoxz4lo7fqrqz5fqtf3r7o6wqvrrjkcfubwrjyz@5i75peprq3wn>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAwNiBTYWx0ZWRfX0BJ8LaQmoH3F
 DWQRkKBntyigSEYPN+YXnFL2dynPTpVHYHzfRlIfR052BUMDhcGQAZ1SKCnbANMxkCmwjy82zq2
 Sdbo8xevIrqS2Y5YRPZrmDGae7x9bYWWP9JwO+oRHGHp33xEbfXOjDV3j/oK8Fufe2n/jmMZ9L6
 TDysGbajBoANT0WAncASVVreulmxxprg9YfSeSvrg6/mUu2ylKpiwehO3PCDzsf7K7it2qbjarA
 /JOMKi1Tw+L5RTuf9+Xuo3Uzl4pPbNJwOxacTTcS1RPB9hoSm2is3oKiy0hPZhcI9NT0JxjteLc
 PrNSwvM+1nFohwboPJ1tvLy6tZqBNU43ncAOWyLgtpg+9cKgAyqJtMh3cPEN8ZuRHhnewBMurml
 mNqzdgfX24XOu/3/PS27KmYA7zQ+K/QhpT9/2zryd1mbFJ0wgJv7KiogiPoDzzQvpzXBVFgj
X-Proofpoint-ORIG-GUID: XqbHtsio9IJsDw_KPAbsiv4qtmi6wiWv
X-Proofpoint-GUID: XqbHtsio9IJsDw_KPAbsiv4qtmi6wiWv
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=6859f861 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=GRKTxiLP57tiYEfkEIsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=893 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240006

On Sat, Jun 21, 2025 at 03:19:55PM +0200, Luca Weiss wrote:
> Switch over the ADSP PIL to use power-domains instead of a regulator,
> and have one commit switching over the MSM8974 SoC plus all the devices
> to use power-domains.
> 
> Note, that I'm aware that these changes are not backwards compatible and
> not really bisectable, but since it only affects the ADSP on these

Why? The cx-supply is handled unconditionally. A single-domain usecase
is also handled via a special code path. I think this might be
backwards-compatible, by the pure luck.

> pretty old boards, I say it's fine to have this. Get all the patches
> into the same release (6.17?) and then we're good again.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Luca Weiss (4):
>       dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain
>       remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8974
>       ARM: dts: qcom: msm8974: Sort header includes alphabetically
>       ARM: dts: qcom: msm8974: Start using rpmpd for power domains
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 18 ++------
>  .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
>  .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 12 ------
>  .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 ++++++++++++++++++++--
>  .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
>  .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
>  .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
>  ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
>  drivers/remoteproc/qcom_q6v5_pas.c                 |  2 +-
>  12 files changed, 56 insertions(+), 114 deletions(-)
> ---
> base-commit: 7fa2fb97cd28e1d9670da538095565b6fba83977
> change-id: 20250621-msm8974-rpmpd-switch-b19b166c02be
> 
> Best regards,
> -- 
> Luca Weiss <luca@lucaweiss.eu>
> 

-- 
With best wishes
Dmitry

