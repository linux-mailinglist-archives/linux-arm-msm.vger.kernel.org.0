Return-Path: <linux-arm-msm+bounces-81007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE7C4699A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1336E3AF5F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C41309EF9;
	Mon, 10 Nov 2025 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MvnMhZxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctfAxeNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274AC2FFF8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777721; cv=none; b=UdyBSOc9CSedpTeaC4J8Pyj4soxQ4q5mwHx9gKrKgxz6ZJocqvTMBBVinBuEYdLAcOCN8B31c/EgmduPvqmXye9wKa7GyA6nxlpuyQRJVSQgQIvJ+13WV+jXdlMMPjQVu4Pe8KN5UkSZgy5jhUNL1SUyURUajzfn5KzvkctQjUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777721; c=relaxed/simple;
	bh=wvQv8x5QLsGOu8cOE9WdXI12O/iTMNRil3FtOPEraWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxEbyPbkU8FBoCwzDWFeD6VukvVmh39uK0RGRoC5ZMtcUneMu9C+avm+tWWFVfaV1TJYwjIfIqY5byPgmIGdqunIerl3i4/D273Okkcp3xdluKXgiHQ/oJahBdqNv7oFR44IHa7Tdjxi2/IZ5/WAf8JkXLX6VpLZQvFfWGKcPZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvnMhZxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctfAxeNS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9Erht2993141
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xvC5tylk1sHK0qkeaSY7kYE/
	Js6EfOGyj+3jgzqwPC8=; b=MvnMhZxl/iW4KuAs8Wm7Gw8jAuvAb8KfulrNlYNg
	EScblnQuteuG8Mra9hOdYcdbij+rPGyoUgdeWje1mgROtnvIS8haMsfs/IIOeofj
	3OtdieslBjRPqjtWo14eD8P6TMFhdWtbNd/dqoIpNzkRnBr1c0T+vOkK6oYuP/go
	hxUzbPEAKu5DoWc9l3WEkYoqAPjHidipz7IWNAhEQU2KvIZQhzJ5JWYI2YvSJyfM
	lmDYkHh8oOr0OiDS6ELrzOlRLKgpMxWtrVCGG4InRuCseYx8Tx/rdNxl0TkeFHg3
	M3whPPYegtzsIw8C6LYu+p865PVPDaqjGAQv7bu/Ht0B9w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88rj4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:28:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b99d6bd6cc9so2349007a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 04:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762777718; x=1763382518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xvC5tylk1sHK0qkeaSY7kYE/Js6EfOGyj+3jgzqwPC8=;
        b=ctfAxeNSfmkiP4URySTKfJJn5s4+45vFK6O3wA6TDYuyycuXZQtinC3e4TaCS/IKkn
         E9wh7B4+bddFgD/rxn7rRVKBQnav7X55FFUlXvZAQ2fN5njdTb1l2lOs4EmkAnbhYXYr
         qsu5bccrlUh+SxPuDalHPI2LPBxDcbzxr8iaesOwqnmuP/MAiXSAcYulLXvSUd7NZ9p+
         +A7v0YV9oHcLR4GmjgytQG8qA8QqjyRtzNjmSNe1WK1WZeii9uwjm7fpsr1jgnaDmPqx
         iChXXnXfH/YF+oe5LQQzlvNYbNg70BClomzUz3WRX33DQKfJLvlrrq5DOLBbxZjxfWHA
         NTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762777718; x=1763382518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvC5tylk1sHK0qkeaSY7kYE/Js6EfOGyj+3jgzqwPC8=;
        b=efMxEhZEbthXUwqWtxSOCft90X5NzLKkHEP9Dq/SWGHPBrpRreDXjUv+bNkZVFfG/P
         mPfmTGVCp3vrD+y2bN8vSw/XXBhd5bZjvN55HciUPIQRyjqQ7ZXZ3BoVNfOym8TJswlX
         XylEIwqjvkaxCzBRwraJ1xS4KgfuTXD3nGOvieEwyPkBGhWiLLFO0VIEtb/+fmzeJr6o
         BmoFhxUh/1NuXGC+RfXs3p7yrMqX+MTdVGLdtut5aWPc3YBoW9VY1OMnVOIx3lmQq2qg
         uBbS9hh5swaKNylmXH+muOKXKxDPncuMXYR27jiWX0hrjgckQAWOJ4BOfZOT2qEV0EII
         OW6g==
X-Forwarded-Encrypted: i=1; AJvYcCUgKIeJyCuXiW9N7/+E4CGK9U08Zo9YX40Be1/mEEWHEPFGX7Q7BFuHe/PdywKBQnoCs0OmEycqeBSq5/TC@vger.kernel.org
X-Gm-Message-State: AOJu0YwLXCiMar+/gh6pCq25zdyFjIhaQVZBoRie6rUfaiAf9Ehb+lpq
	Zt/6xJExniVSrhuNcXxIVulNlwm5GtinQdi+fNCraflZn33krBkp61G6QNVRxSV7zwsP7XrgKg6
	xHZ+18yMUynVkmotQOarO+wLAHezNRVFUHPZrIs4NAY+1dFF8c7kaTqZgneIXHbN+VOl5
X-Gm-Gg: ASbGncuMqxYMpJsX6xsvfOimQ3BvITyf2O0/9npwsyRtZ05leexmMGkn3FNXIiourV7
	bw+xD46GqEcaRQQKC5V2vmLuL2H6hUVlHccsjEq4OdvurSA/JImlPjTp/OEdp/GRhjXul6TaeXr
	tOshchWkHrcvcMUffb56F9BIWR3eUXhd8Ne3fJXsFYktP6Spwf22i2QNaZFroXr4ti6JTPpMPNt
	K1UYvICaN+lgbHdnziI1hQ4GqMrT1x74eHY0n4J9LJpMfKZc5/TBqPn74tqvnD/Ki3p0szKKWp+
	rL5L3c58d50PHu2MLRONogdehTUKAWHHy8ZvTAc6C83axiQ6IYNL0+Iykkdq/g2X5qKIRsFbR44
	0NGzkv5sE7Svllp5iWy2kjZ4KIA==
X-Received: by 2002:a17:903:2c03:b0:296:5ea8:ed7c with SMTP id d9443c01a7336-297e562e81emr111981345ad.17.1762777717521;
        Mon, 10 Nov 2025 04:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwNP3fxkUJGLqN8FHuaSG3OfyFaMMBHENbvYTPgP0pEg/sV6ty2vZFcY/LvfBaaJEc8EM4Tg==
X-Received: by 2002:a17:903:2c03:b0:296:5ea8:ed7c with SMTP id d9443c01a7336-297e562e81emr111980905ad.17.1762777716858;
        Mon, 10 Nov 2025 04:28:36 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93cebsm144992255ad.90.2025.11.10.04.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:28:36 -0800 (PST)
Date: Mon, 10 Nov 2025 17:58:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Message-ID: <20251110122824.5je5jfoanivl6xrh@hu-mojha-hyd.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
X-Proofpoint-GUID: QhgWDsSHDhsPJFSRVVAnJq6vUu28z5Bw
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=6911da76 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vzLQbmpfVAQOsT_rZiMA:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEwOSBTYWx0ZWRfX5IeUABS6a1ea
 2aSik34qUS53HBwYVF47x662hb3SsC2VaCC5HJYitmiuCYIYF9rc/MBYL7/YNM2pFObra8HmaQK
 zFU1zrXRKFkNiFO9TzDAzWD0R42K9ojlvEZXD11XSjMbO9Ryl9/ciFB8cxVflqSzgSlSs9cY2+m
 bgEot7AO9TySpupohghhF4XT59AepeScqW6gwmH+xCrlOtXn65+p2LvszTSNrreMyNUKKSx7mKb
 b9itgtp5fk/PtKvADe8pL5Z9FGFSjUOFeVlW4HZ3KLG8iL3SH+ga5jL+U2u7JGTLhMedlMoZ8YY
 cbiMDsYD16CHNuWLTqSC3stDl3ZVRqSrpC46bp4y84Zm3ZynH9uNjwFtIOyyaUJrvErYN1KgQs5
 Dh37VD16qL4j5TXH3f+695tpa1Axfg==
X-Proofpoint-ORIG-GUID: QhgWDsSHDhsPJFSRVVAnJq6vUu28z5Bw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100109

On Sun, Nov 09, 2025 at 08:07:22PM +0530, Shivendra Pratap wrote:
> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> 
> Add support for SYSTEM_RESET2 vendor-specific resets in
> qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
> "bootloader" will cause device to reboot and stop in the
> bootloader's fastboot mode. "edl" will cause device to reboot
> into "emergency download mode", which permits loading images via
> the Firehose protocol.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..cebdedd5d614b9efb6dfbee91dd67f3c3e322a38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -935,6 +935,13 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&psci {
> +	reboot-mode {
> +		mode-bootloader = <0x10001 0x2>;
> +		mode-edl = <0 0x1>;
> +	};
> +};
> +

Make sense for this as it leverages sc7280 and adding it there would not
have made sense.

Acked-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

>  &qup_uart7_cts {
>  	/*
>  	 * Configure a bias-bus-hold on CTS to lower power
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

