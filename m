Return-Path: <linux-arm-msm+bounces-71917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A35B426E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 18:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F1891BA54AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 16:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BAB2EA740;
	Wed,  3 Sep 2025 16:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrtsH0fi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB35A2E2DD0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916924; cv=none; b=KOeQt0W4NZAh6kwNOCvP1K5IY5kDtoYeQ4UQh0/C6w2PBoi0/jSYAWljJQ+EWNBF21XQ7Jy1rmyYZn1M2dFUlDHz7UpHCzujWX4JprPNS7swrCLIU3FjcPf5kD85ZLvEKW7eZ7N4vB9/6oME06fMt+CXK59FwNOMZdBRrXjJrgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916924; c=relaxed/simple;
	bh=h4uzpxwbZv5GjsKYDvvfHvKOFpa5oECNqTN6Yy9bj4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9QQmHrc6h12CiVK6Xb9aAVaDn4RRN4nS1YwLGV8YnTXCo+bpG4WgGLiKxUDHYVq0xzRyN2dvBUFQwRDhVEFVWjHaZnTz6vpAc3qIg3d8cl/Vmv2FVDjs1NCQvBrCj67RVg6gI32ASJA2HhWs1siy4mi1QXqLy2xZkhM201y0q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrtsH0fi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwqiR005251
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 16:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3W8v279knRH3OWhUMa8czqjX5zZ7UZx/tVNRcDruII4=; b=BrtsH0fiD+ApJV97
	Y0r9qpTkipdek14wqYg/qYx6vUcKC5WywT42WJk+qpFhicqfMW0Y953Ef1q8HRtR
	3XUl31g0QSVQDhyUNDwOg5IEN4A5+JfyL6cqV8MYQQCsbWtXYEeqtWCbo+GbldCq
	FMpRJ5ISzRilwhIo6oBI1IyaWHYhqd+7YxC0pzCm+w37ldRAbgEK0ej6Bxw9d2lv
	1eW/FOyx7Lr6LamPW/hK3uH1vcUBcFWk0pT3HtSVBnoKqELJPgLJihXSsopen1cg
	lLsOzVMyEvFI+vf5kZe0dN/cbkmP2fBxMkmK+EJqj0jdQ9krQW7iqAqtHqw3OvOL
	2sKAfg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjmbqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 16:28:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7725c995dd0so69713b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916920; x=1757521720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3W8v279knRH3OWhUMa8czqjX5zZ7UZx/tVNRcDruII4=;
        b=qKza5lUBXyDSARK/GSxEZbRcPcxBKhN1hVZrnJp16ofdm4zOFI6htDOksRIK5xKVzh
         9x/HHzA9KAEVPeXnOIdeEtmFGeLX3L61gcfYlOJckybaWadR1CWvNGgmY+Y8OGEKEiov
         kC5+bwS+EuhRacYozVsxQkRLlAPEduSfS62HYA1v9l7QpuMKMSGq1rrGtem2LbQuCg0U
         DZ03ndGKYbNni+l45SymleQNG0rSEEas129raatVUX4+HOhBgKrZNd9rWS+1BvRPN/7O
         oUWYz8WQHm6O1N6E9RwCrPmFk6vK/ynBfYxcYvlTHJaaSQdCOIujEcgNvl1hN4+4Zjku
         JqSA==
X-Forwarded-Encrypted: i=1; AJvYcCV6uvWm0enMGh5FRHlaMtYr/Jiq1fd3S1ZmE862B2UM4eQUAkNrZGNRPMv/z34ZJOGLdAMJpEpfoNkngBBN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw5GSoWU8KcEpgrmqrdooauBI6FflHfKuxg4um1AI1iTggQFhT
	Qcf9e3mcn3E7qTMGQu7wHsgu8gQUY5K5Q0l/MNP2nNT3DlfGFt+ss0c/R3f8NnDvDEkr11D09A+
	bblA82EJM7iOxLeJc0YlTDlHpfr+u2criNh9MD/flSVbK38c1Tcj+2mnwZMLHlmdgRWGL
X-Gm-Gg: ASbGncsfATlti/X5CuSpIHwcPVc+cbpn1wV/haoS2CUR325w2E5Pd7tGi6r+5VGTjKo
	AhRZrntuYhmX6KVZzFKIHhWnLcWll72Ekr2oVlLRMyGv/qj2kpG2Rg4ZG6bjhw6zX0lMDrEfT7j
	9xDGtgHcmQgVyn44rYDp78K8DRAcuIYC1o9wStlQ90Yho0KMCz/dl88qNeUamZ/vRKUesbq0g+w
	BpJnDhv04qK0hgi6c7PucVdPqzmJjsv4TuOGKnqaCyX2QceHjQe46eUoeyhrsuDQuk1DqY0PwpT
	pZCvky9p0xBBR0xMkv5l8HR2VafSySn6vxhZ7xi0GdIe1QpYwgXWu9BaLm2ZHj1kCWHh
X-Received: by 2002:a05:6a00:2314:b0:772:bb4:a1c8 with SMTP id d2e1a72fcca58-7723e387c08mr16394830b3a.23.1756916920263;
        Wed, 03 Sep 2025 09:28:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxMR7hBz3AXIbxT3k+26DZmNA55+biuruOPc4EMsmI//RROhDkSqh0Pri4+DqMIllJh0FwlQ==
X-Received: by 2002:a05:6a00:2314:b0:772:bb4:a1c8 with SMTP id d2e1a72fcca58-7723e387c08mr16394797b3a.23.1756916919720;
        Wed, 03 Sep 2025 09:28:39 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725ad1e086sm9459942b3a.20.2025.09.03.09.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:28:39 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:58:33 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: lemans: Add SDHC controller and
 SDC pin configuration
Message-ID: <aLhssUQa7tvUfu2j@hu-wasimn-hyd.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-2-08016e0d3ce5@oss.qualcomm.com>
 <rxd4js6hb5ccejge2i2fp2syqlzdghqs75hb5ufqrhvpwubjyz@zwumzc7wphjx>
 <c82d44af-d107-4e84-b5ae-eeb624bc03af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c82d44af-d107-4e84-b5ae-eeb624bc03af@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b86cb9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Jh9KyP6SycQYY5kWdYcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ayINgg3zXCBQRqZKp8vGpf-vSRTRYFum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXxzdTBetqpRsW
 t4DAgyJAp8BDX18pMIeuPWqjizeeEwLwEP0ACPoGFJrv8mtcot0FAjgj4tS2XNla6gSftbuYsJx
 2SJcZZSB4ZWS4Y/5nPTUkHcVSm89HxKqV1ohN4+PwyHNgFRrWkJTS88V/tMhGHd7DOuDQ7JPAZV
 2KvjJF3rtDigX/8YdN2QsZWzHL8RAWO7uqc7VLf4x9cIzHIMTHdLasi6XVxuEyZpFwCdxYXCAxL
 c7dOcNMye342PB4Ij4nGRN1txMpD8ZEFcewfXSthc5+s30e6aNhfmq3h+0r/z2JHckTqp5KfCbY
 EMyX2odmrVLrytbchDoVMiOyohK/UiUWPQCbPnrB5DpknbBrWESO8fsCGFJHcWCGRepojeLB7yX
 eWEq3x52
X-Proofpoint-ORIG-GUID: ayINgg3zXCBQRqZKp8vGpf-vSRTRYFum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Wed, Sep 03, 2025 at 06:12:59PM +0200, Konrad Dybcio wrote:
> On 8/27/25 3:20 AM, Dmitry Baryshkov wrote:
> > On Tue, Aug 26, 2025 at 11:51:01PM +0530, Wasim Nazir wrote:
> >> From: Monish Chunara <quic_mchunara@quicinc.com>
> >>
> >> Introduce the SDHC v5 controller node for the Lemans platform.
> >> This controller supports either eMMC or SD-card, but only one
> >> can be active at a time. SD-card is the preferred configuration
> >> on Lemans targets, so describe this controller.
> >>
> >> Define the SDC interface pins including clk, cmd, and data lines
> >> to enable proper communication with the SDHC controller.
> >>
> >> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> >> Co-developed-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> >> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/lemans.dtsi | 70 ++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 70 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >> index 99a566b42ef2..a5a3cdba47f3 100644
> >> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >> @@ -3834,6 +3834,36 @@ apss_tpdm2_out: endpoint {
> >>  			};
> >>  		};
> >>  
> >> +		sdhc: mmc@87c4000 {
> >> +			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
> >> +			reg = <0x0 0x087c4000 0x0 0x1000>;
> >> +
> >> +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-names = "hc_irq", "pwr_irq";
> >> +
> >> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> >> +				 <&gcc GCC_SDCC1_APPS_CLK>;
> >> +			clock-names = "iface", "core";
> >> +
> >> +			interconnects = <&aggre1_noc MASTER_SDC 0 &mc_virt SLAVE_EBI1 0>,
> >> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDC1 0>;
> >> +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
> >> +
> >> +			iommus = <&apps_smmu 0x0 0x0>;
> >> +			dma-coherent;
> >> +
> >> +			resets = <&gcc GCC_SDCC1_BCR>;
> >> +
> >> +			no-sdio;
> >> +			no-mmc;
> >> +			bus-width = <4>;
> > 
> > This is the board configuration, it should be defined in the EVK DTS.
> 
> Unless the controller is actually incapable of doing non-SDCards
> 
> But from the limited information I can find, this one should be able
> to do both
> 

It’s doable, but the bus width differs when this controller is used for
eMMC, which is supported on the Mezz board. So, it’s cleaner to define
only what’s needed for each specific usecase on the board.

-- 
Regards,
Wasim

