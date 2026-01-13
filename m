Return-Path: <linux-arm-msm+bounces-88861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84084D1ABC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4500130221AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6834B36A01E;
	Tue, 13 Jan 2026 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ea8KCsDd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpjCuary"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09564329C74
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326656; cv=none; b=I8mVS9RPTQOk8zBvbhwer5S3Zhh67Mr6jKiR/ma1yTBBkcVUqMA+bThTxNX7zTpkOUHWAkiVorQ1nOPxBlFevHTI4R62i7ozFva5k1wguQtYbGqVNEwd0AcFneohoDz3Jv8uialwvm+l90CAW6q1+7yHQgUQqOoNQSV1H5HSrC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326656; c=relaxed/simple;
	bh=ZXH0T84umdfNTTuYP+C3ZdMkYZlSA7aD+zTERAEMBQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWvjtCExVbDXX1hFqjicFLhYoD3gIPmOne60EngNZt/9UVByvsR9XpvRjjafNQ/R6vrf9evapxq/5LMLivCt5Clb7YMcPcGQhZtA4d+wFl5KrI3oBaf3dPi0JeihBupkmv70dCvxC72yImemhhwibXRo5eBAAF+WnT7yx+uSRYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ea8KCsDd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpjCuary; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DC1e8d2866013
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+nx1JdmlmHKfLHOTytgyRX/URrhFuUnuW3QKi0a/REM=; b=Ea8KCsDdOUOyivvw
	b7BHqx5cs7m3geyGy8TfFEl3Wtz1jbeyQw99ZptpClYsW7IQY+KkKdW5w+f0TGBV
	LY8pHJ91SBy2kYLAi/ZB4celQKh323YYxv9/bWZKYrw9x94cRu+XxY2eQ2+Zq37l
	fV2iVlXcOrOssyypyzS9zOw/oLq5UWZIVN1RGHaIZWxsefg2nk94pN3GHW9c2BkC
	5sf/dk4nBebszvYON5XT8qQesTZceru6bONeq7oweKtSfNKj7YFswSSPmnIEB46s
	/aNUQnlEW9gHQa0VAvlVBf4sLnEtikCBeXrBkcN31KiwqfxYan5Jk+wFtdsTYeXv
	BBOO9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjhag4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:50:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e235d4d2so3046745785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768326653; x=1768931453; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+nx1JdmlmHKfLHOTytgyRX/URrhFuUnuW3QKi0a/REM=;
        b=GpjCuary/FY9v8MEic7ZEdiTD00YsRXH7iutrKrRARYNIxdMJhgRm4Wa0ph7ebDsex
         l3NPyrcBXdbu0zP/Bm2Yzv0gDaSd7DPx1slSWoiMySpO3LTz+gH1oeNleecok2glMpwm
         TCBKNpQCNReJrp9gOko8gTFXHJEH5H1SqTD7Pgrx6d4Ramqw4ZXugZ5YAr/yY4v+ki58
         otv1d93C1hZImaKsgNN3MjQDZ0F+TYaONG4+ulpxGA+hHx0xDXkwZXfWKA0hnNbmPYSf
         T188iHcyrQJI3RCMz+tJ/LrDlBCivaZ4BJCXJIRBQ6n0s3KsFRlm+Wn378xcIgOsHk8x
         1Z0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326653; x=1768931453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nx1JdmlmHKfLHOTytgyRX/URrhFuUnuW3QKi0a/REM=;
        b=hnLFPiSoz6RrtgvON3nZ7CGatB18Dmp6SoWD8A2wQxFc7+hjzegzavPC74102393hz
         uWDNIPDrSM6Xj/1sTDFASkLgmvIbFszVATT9k2eOYIyar6lp3Wjt4SZU7KTwJKosTuKm
         qTf7iEtZFsMI+ucBLsqbDcKCH+1rItezw15Qtt5cj2mBf09nph9q8erxU20XKSkSoyt9
         mBr+PywDyMgkoro8VED8suzRgv/7eMA/4sg8CM9tdm5Q+Zeojqz3uU0VIHfwmmUOrdSm
         IiiR+rzaKBnZVyx/3dLTxTOaZbuc5VCAMvmQL6NJYlAIFy25nTB9EeLEGuX1+EE458Z7
         voWA==
X-Forwarded-Encrypted: i=1; AJvYcCUOBpXNzHZiY/kD2LlxpxiF/vzX6pJrM3PTjmVvQpWaCtooYucyACAoTbqCS4ffxGocjejJLDq6Z4vFKbRu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9uwdHmJaIsh52DKhzwRMWB0C1OIhrBLZ6k9aWBVHfcqSPzUB6
	ZuD8tfF7JtBe/lxEtfLKPX6JPYDZpfEgaNObErYK9/VIDNuSBc+oOLckidVO9k6yM1o/Xf+rpW6
	XFjBZhcVx/aMfu5zqTlkbmIJSuy/aEISll9Z2DzkW+32sXfk+eUEuD/CmaRDwiphP7kB0
X-Gm-Gg: AY/fxX5nsjwl+x4+aYHgqJDTPSypjf9eKdaET1YZa+tQIbAZNc8jlDfwFDs7eEh5oG/
	mZsBM6xehey2uqj7nz4eIaQYlRfWSQNmB72RJw6QqzAFyych9Y2cGHzRZrP0tRUhaHHxtRE9ncI
	zX6PaAov+pqhIjbo4Lzb9r9zvFo1AcAmT9TbP6XxQuySrcBavHeN55QncTQ8HmTK134FUgu1oaL
	HukgQoAXHfrGFwmPjXfEudDD86dtlQf4qxiFUFdYXobEgVMjKp6D8o4v+Yqf1FvVYYD6O9UHhm8
	Tx9Race1ZO819gr6kuK82vGcjcsgxFSlAtdpFQm+ZYSmqZFTx1o1lseHI6X85kkprBw/9tkBa6W
	1I+LjytdBChRFS4mZ0i+fTAR94UzckmmFEkC3OHXHL05t/5GnulBlZ/4cQoH5FTlmyBvG3nQl77
	Nxy11rqVh4/uw4TnQZJxZDvPI=
X-Received: by 2002:a05:620a:458c:b0:8ba:419f:c79e with SMTP id af79cd13be357-8c52fbe2692mr4954585a.55.1768326653370;
        Tue, 13 Jan 2026 09:50:53 -0800 (PST)
X-Received: by 2002:a05:620a:458c:b0:8ba:419f:c79e with SMTP id af79cd13be357-8c52fbe2692mr4950085a.55.1768326652878;
        Tue, 13 Jan 2026 09:50:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7c2dda17sm3781105e87.15.2026.01.13.09.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:50:52 -0800 (PST)
Date: Tue, 13 Jan 2026 19:50:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: YijieYang <yijie.yang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
Message-ID: <cjp7sppitjxu4utsag3dqn4k3hvfsczcnv3h32uwjotwidklin@xmxbe3jqmovs>
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
 <20260113102822.590677-3-yijie.yang@oss.qualcomm.com>
 <nfhjbfqflsrye7hqbtgwr5hwkwdtq5z4tbvnta7lk7p7jtvhl4@zbttn6coc7br>
 <7050d5e6-ddcc-4ccf-99b6-0888318c5d7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7050d5e6-ddcc-4ccf-99b6-0888318c5d7f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0OSBTYWx0ZWRfX8UYnU5WrXLb7
 Yj/gmqsPSh48t972s/27TRzAecwY+fYML4aVhJbiVYPDxo/8AEhSCu9iEVN6ZL9G27y/n2BlXgU
 Lbh2dikoW/WSKtIovZQafOo3c38p62ugB7QMxiFkiOdKkOaxR+pGPPnPk+p00uxGHx9Rmdh1Vh7
 VQSoxecQkUmD81tJKs5hMm+q3aqHxxml0RSmNRRo9eMoktR2LvFG6uu788XeVuZkuUdrdIdCZ8K
 K659fDikI7DI83UjcbRfILpNJ5ZtmzJlqyAQs5UV9KnwiNawNq1z6xIrY0iJFFTJhx0Eb42f7xR
 mKE+dzgOvWcuMZ5AKbzV2Jqvna2EaeWgoK3MUr78bSgc9akhs8q+XQu1ilBniT7EiaEu25LEbYP
 Hd8iIQ2ojvOx0UV4zJeBWga7e8DYE3ZZEI8ZN5BKFyHIjI7KYUSjVkTB7JOtsruPOlbJkR/imal
 bP0m6307rlouuZDJUGQ==
X-Proofpoint-GUID: 0zrEhO9knUAdYCrotCtavx6lN9Sorn2L
X-Proofpoint-ORIG-GUID: 0zrEhO9knUAdYCrotCtavx6lN9Sorn2L
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=696685fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SL0Ma1YKNNxVB4j_2zQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130149

On Tue, Jan 13, 2026 at 12:29:43PM +0100, Konrad Dybcio wrote:
> On 1/13/26 11:47 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 13, 2026 at 06:28:15PM +0800, YijieYang wrote:
> >> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> >>
> >> The PURWA-IOT-SOM is a compact computing module that integrates a System
> >> on Chip (SoC) — specifically the x1p42100 — along with essential
> >> components optimized for IoT applications. It is designed to be mounted on
> >> carrier boards, enabling the development of complete embedded systems.
> >>
> >> Make the following peripherals on the SOM enabled:
> >> - Regulators on the SOM
> >> - Reserved memory regions
> >> - PCIe3, PCIe4, PCIe5, PCIe6a
> >> - USB0 through USB6 and their PHYs
> >> - ADSP, CDSP
> >> - Graphic
> >>
> >> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> >> ---
> >>  .../qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi}   | 11 +++++------
> >>  1 file changed, 5 insertions(+), 6 deletions(-)
> >>  copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi} (99%)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> >> similarity index 99%
> >> copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> >> copy to arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> >> index b8e3e04a6fbd..fb90beb1096f 100644
> >> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> >> @@ -3,11 +3,14 @@
> >>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>   */
> >>  
> >> -#include "hamoa.dtsi"
> >> +#include "purwa.dtsi"
> >>  #include "hamoa-pmics.dtsi"
> >>  #include <dt-bindings/gpio/gpio.h>
> >>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >>  
> >> +/delete-node/ &pmc8380_6;
> >> +/delete-node/ &pmc8380_6_thermal;
> >> +
> >>  / {
> >>  	reserved-memory {
> >>  		linux,cma {
> >> @@ -378,16 +381,12 @@ vreg_l3j_0p8: ldo3 {
> >>  	};
> >>  };
> >>  
> >> -&iris {
> >> -	status = "okay";
> >> -};
> > 
> > Why?
> 
> Purwa has a slightly different Iris hw version (8.1.2 on Hamoa, 8.1.11 on Purwa)
> which I would assume is slighly weaker, plus there's probably a freqtbl change
> 
> Let's take this as-is and enable it later

=> commit message, please.

> 
> +Vikash, Dikshita this seems like a really low-hanging fruit, could you take
> a look at Purwa support in Iris?
> 
> Konrad

-- 
With best wishes
Dmitry

