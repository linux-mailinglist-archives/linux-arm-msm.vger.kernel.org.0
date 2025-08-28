Return-Path: <linux-arm-msm+bounces-71103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760BB39ADB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 13:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3208D3BDF2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 11:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B2E30DD12;
	Thu, 28 Aug 2025 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HK8d0J5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08C730BF4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756378909; cv=none; b=KksT/Y7Yg58uLPQIK9DmzjFF1VzVcmbD/N+VyCTKEAYnAT3wHucyK9mZl51c03jVD6X16LLlRT4F9DNabLElM86G/Cv+EHtj67bqOaAikt97G7TFqdyj2kBgrFb5E4t95leIcrmnASHWimQfYu1itqaFt1yDDs9rlyHv07MuCN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756378909; c=relaxed/simple;
	bh=rIzLB0jFaq1zyL507dHxGg8FNAjcdbbEzFoAW2xyOKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBSbZuUJrdaWZ/odhi6O2ry0EsZIZqPc0BPmytDyL5BdMgylgiB+6bY4nzRVVi5h64gfHDT37WVnDiVnxun2zfSrn21LQuue509sI2xOq2RARj+b4mHk9F2XrQJ+PjhI+CcibKSkgLEtITnUPMk2vFilwiGFkEjxmiGp5SMXbeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HK8d0J5S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S645pO027576
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 11:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1me16EcnSUCukrxgcHBWrSlm
	42EZs4yV1yoRTh2A1HU=; b=HK8d0J5SfxyHcQDCuMJTR8s0YB5CO628d/x+4e9p
	Gb3feT4nnT8gyJOQPUrDxyF6pIOpAZA49r23YKY50Kr5gUdHZCJDUh7gbeACD4Ez
	M5+6iQEUI4zVZbMSqVG4tCLaDgUck7oo3EnmlncVlSP65zznzQRe6eBdHgFubwyA
	MAyOavOeDZ4FXsS+d3B0r1d9BiycLkjzjeevAgVfi2NFSTAbk729p6J/2Wfco/Rw
	Cj9e1tWxit+P5cwvEPCwJJ9W6k/+HUtJq3L65nLoYLnXt1m0hECglQLTdoCfkDEo
	0MVaIVt4DriEe77MzVWSVjHh8ZorfKYa9qrL9rLA3f6Oog==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16xyt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 11:01:47 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-53b175b20f2so322519e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756378906; x=1756983706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1me16EcnSUCukrxgcHBWrSlm42EZs4yV1yoRTh2A1HU=;
        b=COWwugRGGqgxN0PLgsqzd/TV2/vqbsA74lZXcoJT+fUmfyuzKQwxr8XGNxntdKQ7jM
         WwjOd/W9fLRwbNoeu/wAd4P7bruRUoPc/Mar0/OVm18DSMPHSvJShZAaUfgunT2N94hY
         +f5L/sexpHymD2yABnZFwAS/gDX/NWCS0BfFcYTN0rfzvsmzhDKb3N+Lmcq/2tjBbSOI
         Vg4e/ml3HsJqrELL/kZ8bsfTd5uldqq19gRkf8qkkBI/sd32riOfbLipNzLKljb1DggE
         vfuY+tnfq2Xhp39vpVH42cwshXKG8utEi4JxlD/UGL4doY5lf/F2uitOjzSKw2kFWfxX
         C8pw==
X-Forwarded-Encrypted: i=1; AJvYcCX2biMR2DsxPqvQLVzZwYBBxW0ALhAQjxjCPWUnXFzFz764E49fItM7hkVO93tiHg2Lv+/XH8VxmUSVkj0n@vger.kernel.org
X-Gm-Message-State: AOJu0YwQlVtuBvBiMdwHfY3fb6JuDR7N6DjoR3ZdWI1u7EC+9TREWqKn
	6kOnM/SGGu8pSU0uPak4oBB/PwRNoLdWCx7NbqdejnbMhv6JGgSoW5P+I86t5FJWwsEudQyGUG4
	iUc+XElVpkDyPRzLQNc3DaRH/xFKqTkVysSv1C0/l42zcl9kMkwJPBAmF6TcLgqg3CkVj
X-Gm-Gg: ASbGncvs0QG3X+xkSHzk13nV7b2bQZxWnAVUVqzteV5c8vZ3rHnTrQUjLkmL1kNYi9m
	MKGC8QIkKAvE18xAtqTBa+Kq1GZ2H2d0eIMrdImuWsdpcgV7RUwelMf4T3KNdfifX4SyxSflgEE
	eEXWDw0uXcrnm0wEvQOVm+86skZ+ufNwj3B8OJ6rcUNXKtLhQi8DGf3FJCrwxaq+UZAHBdazH0D
	7NYGPOIlFaADzM8SIsvxHsdSTLDW5X5qHhI3KBthvpenCr4cbe+9+O+7zNm3j4hJsa8XsqTCmCC
	1LDFIZ1X/0nnuAQ9HOtXb//z1xaYIoMwQeTWvJ/AnNki32Ofn5WLlME2a9I2tPYiHdpjgv5tDtT
	E8lpuAnUIdacsdupBM3CZakx1gzXvYejWSO7ghvK/MkcBTp3sPMVp
X-Received: by 2002:a05:6102:3306:b0:4fd:35ca:6df5 with SMTP id ada2fe7eead31-51d0cbe884fmr6423698137.7.1756378905251;
        Thu, 28 Aug 2025 04:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc+jb+s9qKPN/JCnUMGGuKVIUQOhVIj0EszZaiGONB7yq9VeiWgb02Pqf+jRkNnzG8OrY8vg==
X-Received: by 2002:a05:6102:3306:b0:4fd:35ca:6df5 with SMTP id ada2fe7eead31-51d0cbe884fmr6423646137.7.1756378904346;
        Thu, 28 Aug 2025 04:01:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bb19sm3189208e87.73.2025.08.28.04.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 04:01:43 -0700 (PDT)
Date: Thu, 28 Aug 2025 14:01:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
Cc: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Vishal Kumar Pal <quic_vispal@quicinc.com>,
        krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH 3/5] arm64: dts: qcom: lemans-evk: Extend peripheral and
 subsystem support
Message-ID: <sqntqb4mce34vkiogrr5ze4jhgfsy4cprmmfease4e2ljiq25u@uobfvzzotj3w>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com>
 <kycmxk3qag7uigoiitzcxcak22cewdv253fazgaidjcnzgzlkz@htrh22msxteq>
 <25ea5786-1005-43e0-8985-04182d018aa0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25ea5786-1005-43e0-8985-04182d018aa0@quicinc.com>
X-Proofpoint-GUID: VyATk4bdbdwx_VTlHFHF7UDICNJSP_p6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX3Acog9aRBuWq
 Jm0b7GTw6GuwjcvTfYyIXef2z0gAbcV7LlAQQ0PMXJy9jU79zTxLRqpO7apAlbQurKs5few2SNK
 qryr0EwnpEP9SGAFdDE4AbtpQhnIf6j06E//dp73b2iAvxMJ1H0TbGeOFD5RW9W0Az4r4UXkp2z
 XhaTk19HQt8htgwWP3LsCinx9K7Zg3ncF08T2hjsKw2/Msym3IbMlEcmS6yYsLOA4nbROYQmQwT
 V+fkEhb6n9+Hjpu+POMW0nPVhhQKGN03+XvFvMIqUAla31iaNL3/1v8DHxuse3XXIQQ2ZvI2x6Y
 LGJZ6+Cv90eQWICBrqKVT0K2bTlaoS9Ya0dAjqXLvMt7S53cYDX+lYBojKYJCyV+hdtnEKfmt+U
 cFb92O1+
X-Proofpoint-ORIG-GUID: VyATk4bdbdwx_VTlHFHF7UDICNJSP_p6
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b0371b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bO8WyBFqmgISiikzXHoA:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

On Thu, Aug 28, 2025 at 12:05:21PM +0530, Sushrut Shree Trivedi wrote:
> 
> On 8/27/2025 7:05 AM, Dmitry Baryshkov wrote:
> > On Tue, Aug 26, 2025 at 11:51:02PM +0530, Wasim Nazir wrote:
> > > Enhance the Qualcomm Lemans EVK board file to support essential
> > > peripherals and improve overall hardware capabilities, as
> > > outlined below:
> > >    - Enable GPI (Generic Peripheral Interface) DMA-0/1/2 and QUPv3-0/2
> > >      controllers to facilitate DMA and peripheral communication.
> > >    - Add support for PCIe-0/1, including required regulators and PHYs,
> > >      to enable high-speed external device connectivity.
> > >    - Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> > >      GPIO lines for extended I/O functionality.
> > >    - Enable the USB0 controller in device mode to support USB peripheral
> > >      operations.
> > >    - Activate remoteproc subsystems for supported DSPs such as Audio DSP,
> > >      Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> > >      firmware.
> > >    - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
> > >      and other consumers.
> > >    - Enable the QCA8081 2.5G Ethernet PHY on port-0 and expose the
> > >      Ethernet MAC address via nvmem for network configuration.
> > >      It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
> > >    - Add support for the Iris video decoder, including the required
> > >      firmware, to enable video decoding capabilities.
> > >    - Enable SD-card slot on SDHC.
> > > 
> > > Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > > Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > > Co-developed-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > > Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > > Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > > Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > > Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > > Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > > Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> > > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > > Co-developed-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> > > Signed-off-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> > > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/lemans-evk.dts | 387 ++++++++++++++++++++++++++++++++
> > >   1 file changed, 387 insertions(+)
> > > 
> > >   	status = "okay";
> > >   };
> > > @@ -323,14 +505,196 @@ &mdss0_dp1_phy {
> > >   	status = "okay";
> > >   };
> > > +&pcie0 {
> > > +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > > +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> > I think Mani has been asking lately to define these GPIOs inside the
> > port rather than in the host controller.
> 
> Hi Dmitry,
> 
> For moving these to the port requires changes in the sa8775p.dtsi to change
> phys property from controller node to port node.
> 
> Mani is asking to add these for newer platforms like QCS8300 not for
> existing one's.

Ack, thanks for the explanation.

The rest of the quetions are unanswered.

-- 
With best wishes
Dmitry

