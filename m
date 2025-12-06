Return-Path: <linux-arm-msm+bounces-84540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E43CA9EF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 03:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E20C33019B66
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 02:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038BD28750F;
	Sat,  6 Dec 2025 02:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nwt2V0Jl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0NIGQMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744A2836BE
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 02:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764988841; cv=none; b=X6MMAFtQ6KbNwLt9GL3Vc7aexSDjsoz+Y0jkEIrLLis3qu1ZqwtL5WMgzrc1OjuZ23nLXawdEPJY5dUgPo7XSn8h8SbhqQEjPoYnCx75ydrVBsPw6K04p0NbODDLv9Xzpg7z2TOyJVbSPa2iDIdt0+pwFNXxHHmwQDozw+fWPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764988841; c=relaxed/simple;
	bh=UEudNkOqKnQxTOo2kWGhnv4gL8mMzGxKtEabvS2Zrxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIoe+uZlKmFr7GzdWG5lCGvt1BZnBloIxEVXSLFylGXeRwhzdGY2utZreqBhobRyTtIegV1X5kOoB0ZXtD/MjZKlx9eIg7rj+LDr9kbCNN+ZBjJu9B1JKRR8bxGUSff+4OIEwGgYu3aH9qduAARkBjM1KC8b6roZTRQ2WllIAPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nwt2V0Jl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0NIGQMz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBGE71075447
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 02:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9lWvPo9lxGmYe1+B/sGbC4hq
	evBv9lyQkJgO56gdc0c=; b=Nwt2V0Jlxzac63s9YAF6rRGKM+Y3RaU5FAxPirMa
	0oiWwjoceGcxt208gETDGVyigI46AF0Z8xWcpFsIsoCFMQ/8mS18H5tnfaawheIV
	b2JuaZ8gJdnGs4ur6NrhS8sxO9C2OVHaJmNPrtbt+13mwdJBw5G70VKF0eCeovlI
	03H1sc1obeJHq8wXU4HQmI0X5BKNJ1FlRia5G4IUhd9A7ualfTMqaAhup8HJs9Lb
	NhVoKIVgQkrwWWg6MuvU1r0iM8R+4LSHaA2RCRKICW3oRqFk8VddexWesvRcT/kZ
	SNSqrrMXwMilY7cptmwJJMLb1vOKBJ/DXX71eM7Sp6ewcw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ngst3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:40:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88249865db8so60528776d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 18:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764988835; x=1765593635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9lWvPo9lxGmYe1+B/sGbC4hqevBv9lyQkJgO56gdc0c=;
        b=A0NIGQMzAt6d/O62zST92CH0zfqgGisvBAnlzkI4x3mdsjMLNl/+gmpKDnSnaTYQ6Y
         xaImbPuanTV2Y49GZPQIR658QeOMCQ7RdKoN/eXEKCIA2bDH0Oqu5Sj9VK1J3EWasZ+x
         a86Y0E/VuH5sNmIBoIF0WLJ8DncpTRvKcRPtXIO2BEjn6e09xIfCHbhCpP2ozBrTH1+C
         J6i5qUIaik64pWGgvVN8jD59ynTm2EiMkrXnfoHO9TOH5kopWt1IPDf/gKKO0FuUGY/e
         NURoB7s2CV7nIOFei8U7iMFmCljNCqk7dp+tD4+DmdH2lRZYskhzVX5rJmmxu0JVGfuw
         65MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764988835; x=1765593635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lWvPo9lxGmYe1+B/sGbC4hqevBv9lyQkJgO56gdc0c=;
        b=mXSupfeHjhvlYrIPr0GlYqpi/kGBA2qdBjEMoozN8znbRrKsYMOlbGicI9NJ8/47eo
         vBZozkHt6kf8L5fPqeihcSKf3XBNElk2B2W80LkuutnzzVFiSvVr89D463K6KAcc4Ndx
         pYZ8bSopA10xAZyqGcVsW2xNCJoys6uFZPc7F6GjdvlIL4TS2Ty4jGAgkSHpXD72/gzf
         EXSZ7HWLW5fbMNJaD3h2KAO18dQKUhyX7sojB9wwpF8tuSi2qpLsGv9N2WmfcB2mm8u0
         pxWiXbrDUr+8VQ96EKmt1nMLZ5Uao7mrL/m9WZI6DfACjXCb2SJyMtA+yuDlrO8SGWQd
         fpUA==
X-Forwarded-Encrypted: i=1; AJvYcCUOeLEBpkVlshMntd3VJokHrRoeuJLeW2vD63WU6bUwdBIdBlwMcMfdG7UAxLe4dykqoPeDAJMm9HUWA1xZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+5EasyVzIJdZDSJBw4h1q+WjMmm8KSjDVsedPWcI2r2Dl1PCP
	2LMPJyHISy4CUoH7sOwRX3hxeqv40Puln6Uo8Iulsnxo2RPUiTsx168K7p23hBM7lnXRFXZF5O6
	Od9gPovR7QAgcjlKk5gzypvEZ1nlZTStMg1kSFl8yTV4/R+iG887YVOMkfCqaHKU5DTML
X-Gm-Gg: ASbGncsOnm8Ih+RlaJ06PiKZIQrwp6fpjYdkxd6xHKbOtRJRx3qoUSMHEE6/FDryMYD
	HOoRBG6qFXk1bBbOFreiOSw44/q/Mr9Js4LGM/KdM0/6BznV9eQIleH7O68h6j7aAgbOaReIcgn
	MgujHn+nSK+oLY4ev7tQxEl6zVT0V44c1Wr+JmPeg7jfwUAZ4SKakbfFTPNifZ4seVNECPIqD4s
	bZmprE6DfXK02c7xtqjItcb7f2NCbpSsOIj2wwTEcKEt6dIDBYFh1u/4fUeJJDby9qWr7NAmEq4
	XWNzDYjxCOeuJmaFO6tMrZrBTpjkhIQ6so5Ij302wTy5GEz0zuYbDMdLpKr3beSfoBfX7XA4eqm
	bWE/MwvByMxya4edYqZuyR0QmPQzfrBdZGWkCSO+Bhhk5ZzWXBe5g2auevs6UsOvUyBJnwPpIzZ
	pDZ7Xmm7VciIxbYVrQaoS6rcE=
X-Received: by 2002:a05:6214:3d9e:b0:882:7571:c024 with SMTP id 6a1803df08f44-8883d0389a8mr22283236d6.27.1764988835283;
        Fri, 05 Dec 2025 18:40:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0lzD4U8rUHjx65w4GtZMro6dmyWy4oQ0BaxqPMeZHLqrX+i21YgYCfYKXDOq9uymPOfTcrA==
X-Received: by 2002:a05:6214:3d9e:b0:882:7571:c024 with SMTP id 6a1803df08f44-8883d0389a8mr22282886d6.27.1764988834757;
        Fri, 05 Dec 2025 18:40:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6fe6beccsm18630141fa.2.2025.12.05.18.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:40:32 -0800 (PST)
Date: Sat, 6 Dec 2025 04:40:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Introduce Kaanapali SoC
Message-ID: <mi52ztn46bjbvcebq7fddntedjvbtvuhjnuin4mq3h45mxihdv@r6opshdsmlbs>
References: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
 <20251204-knp-dts-v2-3-596d8398c6d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-knp-dts-v2-3-596d8398c6d3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hhclx87e4bx3qccJUWMKdgfQyowA0zL_
X-Proofpoint-GUID: hhclx87e4bx3qccJUWMKdgfQyowA0zL_
X-Authority-Analysis: v=2.4 cv=DrNbOW/+ c=1 sm=1 tr=0 ts=693397a3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8NlrwkMwniVS5tDy--IA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxOSBTYWx0ZWRfX6dJkiF3eYG8T
 zR7JYg3To3sVg513a2GiNdkR++AODh8+j1ezAQnX514lqLzyaocMHM26awwnCz0cjC6/M8/bRSN
 shRVqAHMaxg99TD8TveOp88236UKTOQw3xGNL3hh8ydCfTipc7//XsNnq9nXSfkEx/6fTMk4l/g
 QQ8idpIZQQORt9LRWUvTIm5oHAR9GkNJzoOG59v3OWj2FlJhwCRgrycQjoLipm2Mz0LSWpn6Un6
 sFLU6EpWvyXfRyg6bH3pnJbAn2FpyBpOqQkU4virQ6kqkF49XEzH1npBfeq5s98Rhk8GIMNfMSL
 Xas0MlZT+oYzTL+Lih9DLSaW1QiUW1zayEUDp64k2KYlyX4ddztMAIk8ThsXIx2DEfH/HHV9ULi
 XMGDCIc1Gah7rT89Sk2snk767VRtig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060019

On Thu, Dec 04, 2025 at 10:31:21PM -0800, Jingyi Wang wrote:
> Kaanapali is Snapdragon SoC from Qualcomm.
> 
> Features added in this patch:
> - CPUs with PSCI idle states and cpufreq
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect with CPU BWMONs
> - QuP with UART
> - SMMU
> - RPMhPD
> - UFS with Inline Crypto Engine
> - LLCC
> - Watchdog
> - SD Card
> - PCIe
> 
> Written with help from Raviteja Laggyshetty (added interconnect nodes),
> Taniya Das (added Clock Controllers and cpufreq), Jishnu Prakash
> (added RPMhPD), Nitin Rawat (added UFS), Gaurav Kashyap (added ICE),
> Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
> 
> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1606 +++++++++++++++++++++++++++++++
>  1 file changed, 1606 insertions(+)

> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		pdp_mem: pdp_region@81300000 {

No underscores in node names

> +			reg = <0x0 0x81300000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		aop_cmd_db_mem: aop-cmd-db@81c60000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x81c60000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		smem_mem: smem@81d00000 {
> +			compatible = "qcom,smem";
> +			reg = <0x0 0x81d00000 0x0 0x200000>;
> +			hwlocks = <&tcsr_mutex 3>;
> +			no-map;
> +		};
> +
> +		pdp_ns_shared_mem: pdp_ns_shared_region@81f00000 {

And here

> +			reg = <0x0 0x81f00000 0x0 0x100000>;
> +			no-map;
> +		};
> +

-- 
With best wishes
Dmitry

