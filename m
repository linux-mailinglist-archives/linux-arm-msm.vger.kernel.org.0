Return-Path: <linux-arm-msm+bounces-75166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC8BA0E69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1332E4A1DBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 17:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D883277C8F;
	Thu, 25 Sep 2025 17:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMaMk/ev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F1530C342
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758821435; cv=none; b=hxjp0TEG3RHzEx5qUS6/XTMjv90RXzjhZptcUER8WGiaWELk7DBEAItO+LFdd8pEZaSGbgRH+3k/l4mZrn+9WgA0Nf051DOQ64h5yIc7pUz4fHdg1Q1KzWUJs072GB2PTrbNRJzk1CIoHbnYo2GjnTwQwsMoCKuFTPwKxp5Cx3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758821435; c=relaxed/simple;
	bh=bYtKEqy8GmzRCmmjwfhzTlqnuEFLYRN+kmA2jlXWpYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRoJ1xIRK96B5okZGhOnwktYOUQfOAwMap6Yt1lA+XEDaR6++pNkchfckXqoTNYifTCWDwc+3l/r/SHgtmRoChzKysDEQ9xjIsYkPDhO85OrbqsC/JE9OQ6qn/TsvUMeFrV6aFOVNVWf3pLsNS8V2rhug/kluIRC74YFXqnE3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMaMk/ev; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P99l9L002127
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IrcWVl2lxQjL6dSDOHVU9fTC
	ulb0IJcdZ2CguJA/OXY=; b=FMaMk/evyJ3AtD8PixMWddPOkHK3/rLPUjoFUkYt
	HX2s4YBlto7Z1l++LKut4tzmXKDZoBtW6K0blnU6LEAbopfPV0LVwpQ/4nb+tUFY
	asdXa77Nccdtf6DCmYOgKr0brDovrQE0s9UfcBGkoMZjHeiWJ58IOtOfVsn00GZJ
	tjk8knJwcl8rwGze/7My4m9w9RW6VdmPulfI5DAkTow7kkvEg9v8XOPLacxaJwrb
	qLevMLioVs3QpHNBQVFDGqI/G6IKTvMo1Yk41AzRAnhp6u2LswBBD15pndddpWH2
	+4lpda3oqdOg3CTBVcsrM/fDNcxHnbAZ23OgDba37z2/1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98s0b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:30:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d6a82099cfso30939631cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758821431; x=1759426231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrcWVl2lxQjL6dSDOHVU9fTCulb0IJcdZ2CguJA/OXY=;
        b=nXLZwHI5erMkJK/BtfJnU2od8fV7t9WMc0tgtflkgdq/uHjKWSZ2sViMTH02HBkNdZ
         qFZF5p0GsRKcQY+GAZbiiV+l5knxKUP6PGua5fGZR2E2WYS2JIjDWnZlWCmEqstEtQLl
         gF6TVNwU1P4gzACbwVX4RO0L/SbmFzxL+8lQdqBrdUyDehSN7k+883JOhUe+Wykc5V0Z
         8WYCBkgu1xk87cj444OjZvuQ00vD1/4Zv5Si+zqA8tEGsjWCYS2dIOGWOQ0l2f/Dtkdw
         0IYoAosmwx42FmYZKrqkJWJAtraHng/Xc6sxKt+VgzuX7PrKUyHQOmucg2jbJHz2jrl8
         tJBA==
X-Forwarded-Encrypted: i=1; AJvYcCU6emxwIhbxR0RSfwKkE9tAdOCAZmUVIMsXFouWCCmoaDl54WkS6HgoLgaLlwFZ9S+KMkE2cu0ASQMqUBTz@vger.kernel.org
X-Gm-Message-State: AOJu0YzjNSqm5gK6yb41uWDu161rxlTFqcOgdC8F10osEDR0osBhnZW+
	0Vl+hqaHq5tmLB0nqs+1UzUXtxFPu7c06t5q2DnnS2BCIG3Gqxg2Vu6KOClvrY1qw4h6u+mErld
	nVX70+grTtUGiD7UvPK7YU6drXTx9CpVOLTVLbZ4c7Z8KZ31QxQ7Nwy37tjR+AgPDCdDj
X-Gm-Gg: ASbGncuGkETX6o1VTslThjFIeycZLyy9QXueZ1KdC8CUmeFtIMo1HHkyGlAqUzOf/Mc
	J+ZpBv+2iaslVvM+0fTcf14M20UKf8X7/s8WLkW267mfWDLC0kS0BERjsLaV65H3psUZSA+bVrX
	9otX5GTs9y/qaxpXkQNUx/Zxlhx817+fPouuWlz3f9MmOKl9POFGBJt7Iiyxw73ozqE6AnYL48w
	Png761HK++MtzYjp/LNyjO3bU2shhJdXwgGORYTU0yizXGmvzhgOsejSetALnhHHYcNIZjeyMy2
	W5XKC3RCLQCySJD1TGvZm6LLOSF8xEZADJGhOfN0ZEjDigqtUuP8foE/tcb49ke6ACC6ZFjF9AO
	uEf9G45vJv8cc8ZSPXL0ZW2QK3LVK8Sg45xHShuCg71W4kY/otw7f
X-Received: by 2002:ac8:57c9:0:b0:4c9:281c:c738 with SMTP id d75a77b69052e-4da4e09aceemr50194601cf.78.1758821430730;
        Thu, 25 Sep 2025 10:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIE30a/R0lZegEf5Kk+3sHpeakJmthyunQrUY0vjvg/x4qtToEYQjE12bF6d8PHIE5lfB1LA==
X-Received: by 2002:ac8:57c9:0:b0:4c9:281c:c738 with SMTP id d75a77b69052e-4da4e09aceemr50193761cf.78.1758821429946;
        Thu, 25 Sep 2025 10:30:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316ff5a86sm935617e87.132.2025.09.25.10.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 10:30:27 -0700 (PDT)
Date: Thu, 25 Sep 2025 20:30:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <taniya.das@qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH 00/24] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Message-ID: <b3xkzhwfmksknz3kzj273mtkzfesphjetfusnfgcwj4j24kj4e@3sc37anlhweb>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
X-Proofpoint-GUID: LzjEKFgqTsR0Njk_1oGo3Ujhyf-smLDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXzneqz2YG6n9L
 jnXcw0NFU2tJAVv9bUtDWtKsNi1xLQwsyxIWNvvT7v8EADL+RH9FZR6wZEczQZUle/sQiPwgnN3
 KTn2ujF9J6BQAX2sc+tIaiU5fKhACuFE1BAxf3f7YdN9RIPlHxvzAjhQus4ArjdK6R7hIfQgHpw
 hARc7h2Wfh93pRD6Xn+AwqXmg8XFmd6khjflof6o6d9BkT2enWBOHVWtBedb6J4HR2yDZZDvDH1
 P1UfeyGgOL/72rTpIgRPF+KuAnI779Ep3JDzvdQzTR0zZF87niQ472gFoNhayoRTVgmprTYWhvf
 KwUTog8ilt/r7Vs9GEc85yvkQv4zHreBfa3PUVDT0PNSfW+2qZVfWBCwRZ82zGt++LSFZAWRyHV
 COm1EMB6
X-Proofpoint-ORIG-GUID: LzjEKFgqTsR0Njk_1oGo3Ujhyf-smLDf
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d57c38 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=_QuE1zyTwyAq7hhy9skA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Thu, Sep 25, 2025 at 12:02:08PM +0530, Pankaj Patil wrote:
> Introduce dt-bindings and initial device tree support for Glymur, 
> Qualcomm's next-generation compute SoC and it's associated 
> Compute Reference Device (CRD) platform.
> 
> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
> 
> The base support enables booting to shell with rootfs on NVMe,
> demonstrating functionality for PCIe and NVMe subsystems.
> DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
> TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
> thermal management. The platform is capable of booting kernel at EL2
> with kvm-unit tests performed on it for sanity.
> 
> Features enabled in this patchset:
> 1. DCVS: CPU DCVS with scmi perf protocol
> 2. PCIe controller and PCIe PHY
> 3. NVMe storage support
> 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
> 5. Interrupt controller
> 6. TLMM (Top-Level Mode Multiplexer)
> 7. QUP Block
> 8. Reserved memory regions
> 9. PMIC support with regulators
> 10. CPU Power Domains
> 11. TSENS (Thermal Sensors)
> 12. Remoteproc - SOCCP, ADSP and CDSP
> 13. RPMH Regulators
> 14. USB 
> 
> Dependencies:
> 
> dt-bindings:
> 1. https://lore.kernel.org/all/20250918140249.2497794-1-pankaj.patil@oss.qualcomm.com/
> 2. https://lore.kernel.org/all/20250918141738.2524269-1-pankaj.patil@oss.qualcomm.com/
> 3. https://lore.kernel.org/all/20250919133439.965595-1-pankaj.patil@oss.qualcomm.com/
> 4. https://lore.kernel.org/all/20250919140952.1057737-1-pankaj.patil@oss.qualcomm.com/
> 5. https://lore.kernel.org/all/20250919141440.1068770-1-pankaj.patil@oss.qualcomm.com/
> 6. https://lore.kernel.org/all/20250919142325.1090059-1-pankaj.patil@oss.qualcomm.com/
> 7. https://lore.kernel.org/all/20250920113052.151370-1-pankaj.patil@oss.qualcomm.com/
> 8. https://lore.kernel.org/all/20250924-knp-pmic-binding-v1-1-b9cce48b8460@oss.qualcomm.com/
> 9. https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/T/#m46501fe9edb880fc11f69442eaf4d2855f7e4608
> 10. https://lore.kernel.org/linux-arm-msm/20250925002034.856692-1-sibi.sankar@oss.qualcomm.com/
> 11. https://lore.kernel.org/linux-arm-msm/20250924144831.336367-1-sibi.sankar@oss.qualcomm.com/

Please, don't list all the possible series. List only the patches which
define the bindings which are required to _build_ the dtb files and
which are not a part of linux-next. And also please include them into
`b4 prep --edit-deps` so that all the bots can pick them up.

> 
> rpmh-regulators:
> 1. https://lore.kernel.org/all/20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com/

This, for example, totally isn't a dependency for building the DT.

> 
> PMICs:
> 1. https://lore.kernel.org/linux-arm-msm/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com/ (Patch 8-11)
> 
> PMIC-Glink:
> 1. https://lore.kernel.org/all/20250919175025.2988948-1-anjelique.melendez@oss.qualcomm.com/
> 2. https://lore.kernel.org/all/20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com/
> 
> spmi/pinctrl:
> 1. https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com/
> 
> PCI:
> 1. https://lore.kernel.org/all/20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com/
> 
> Remoteproc:
> 1. https://lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
> 2. https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t
> 3. https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t
> 
> USB:
> 1. https://lore.kernel.org/all/20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com/T/#mb7879fdba16496554a53c3726d90f94b6063dd09
> 
> Linux-next based git tree containing all Glymur related patches is available at:
> https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/glymur?ref_type=heads
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
> Jyothi Kumar Seerapu (1):
>       arm64: dts: qcom: glymur: Add QUPv3 configuration for serial engines
> 
> Kamal Wadhwa (10):
>       arm64: dts: qcom: glymur-crd: Add RPMH regulator rails
>       arm64: dts: qcom: glymur: Add SPMI PMIC arbiter device
>       arm64: dts: qcom: Add PMCX0102 pmic dtsi
>       arm64: dts: qcom: Add SMB2370 pmic dtsi
>       arm64: dts: qcom: Update pmh0104 dtsi for Glymur CRD
>       arm64: dts: qcom: Update the pmh0110.dtsi for Glymur
>       arm64: dts: qcom: glymur: Add PMICs dtsi for CRD
>       arm64: boot: dts: glymur-crd: Add Volume down/up keys support
>       arm64: dts: qcom: glymur-crd: Avoid RTC probe failure
>       arm64: dts: qcom: glymur: Add PMIC glink node
> 
> Manaf Meethalavalappu Pallikunhi (1):
>       arm64: dts: qcom: glymur: Enable tsens and thermal zone nodes
> 
> Maulik Shah (1):
>       arm64: dts: qcom: glymur: Add cpu idle states
> 
> Pankaj Patil (3):
>       dt-bindings: arm: qcom: Document Glymur SoC and board
>       arm64: defconfig: Enable Glymur configs for boot to shell
>       arm64: dts: qcom: Introduce Glymur base dtsi and CRD dts
> 
> Prudhvi Yarlagadda (1):
>       arm64: dts: qcom: glymur: Add support for PCIe5
> 
> Qiang Yu (1):
>       arm64: dts: qcom: glymur-crd: Add power supply and sideband signal for pcie5
> 
> Sibi Sankar (3):
>       arm64: dts: qcom: glymur: Enable pdp0 mailbox
>       arm64: dts: qcom: glymur: Enable ipcc and aoss nodes
>       arm64: dts: qcom: glymur: Add remoteprocs
> 
> Taniya Das (2):
>       arm64: dts: qcom: glymur: Enable cpu dvfs for CPU scaling
>       arm64: dts: qcom: glymur: Add display clock controller device
> 
> Wesley Cheng (1):
>       arm64: dts: qcom: glymur: Add USB support
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
>  arch/arm64/boot/dts/qcom/Makefile               |    1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts         |  795 +++
>  arch/arm64/boot/dts/qcom/glymur-pmics.dtsi      |   19 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi            | 7445 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi          |  179 +
>  arch/arm64/boot/dts/qcom/pmh0104.dtsi           |   84 +
>  arch/arm64/boot/dts/qcom/pmh0110.dtsi           |   66 +-
>  arch/arm64/boot/dts/qcom/smb2370.dtsi           |   45 +
>  arch/arm64/configs/defconfig                    |    6 +
>  10 files changed, 8644 insertions(+), 1 deletion(-)
> ---
> base-commit: fdcd2cfdf0db0a8b8299de79302465f790edea27
> change-id: 20250923-v3_glymur_introduction-e22ae3c868a2
> 
> Best regards,
> -- 
> Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

