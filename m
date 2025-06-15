Return-Path: <linux-arm-msm+bounces-61320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 438F2ADA1BE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 14:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DD5F7A56DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 12:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061DC266588;
	Sun, 15 Jun 2025 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMOBG+HU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B70A1ACED1
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749990538; cv=none; b=CzBDmtSTQCVE8RNt1a6zqNcTB1MmnvVsqSoHgI7xLcWMdQSRVY3ca3lUj3877NLma0FrCWS/WSLEtY09iMoPlV7JDAoiBGG1T2viDg6b2YAw+tuiQfLw1wNXv4QhtsCSplouRqefThD0RAb3O7x1BBf2bX1nX19M7TkOxWPLBds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749990538; c=relaxed/simple;
	bh=M45SIzuVU69TSU8N0h5Dos5aeC4gCWkcC+H5KqagCHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1rTrduQ61l3Vg/GTSeYKUKa9Q6jo+SKy9uyQCQcnvfKW2Xuepsepzzu9PeCXI6x1oFSdX6YCU/oVnf4S4pz66Q533yKYSHEJ+RQyD0KlJjV63TRuGwGsbMwGGakXeUtqB6R6bMpLeLuHRqBkcyghY7NfUJc3W3KUr+W9rIdeH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMOBG+HU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FBsaEK029360
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 12:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SYFjLzTPjEjy1T3L3ljYt4I9
	xb4e1sH2nbCAumXDDS0=; b=fMOBG+HUBqyJFEz2bxEbvI4cEQuhqdd125SlzlYk
	eBXaHMm37lN/9LIEq1SiZPxwossOho7HyeNa5cSN9tXnWz1ZKIYKDqWyXiHSH79W
	wq1Yvia0lKqiQHx1iDNCmx0n1HpdOarfz8wZ/4rCD+dSaQVKbbuLkektO8X6lSru
	0X9R7dIprCQj2EajA/TVS+VMGtPjzS++JFZ6OgYE9B3RARy7khadD6uLTRLiWZBB
	lxihEnRAR/qqZdJOSWEsPa5ryATYk3oi7GcaidnnWh2B3t8CrkrFvZALcf2Z0Df1
	hQ7ysB2elqk3/zv+5Og8p1B5UBxh/ocLdPVCixty/vIt1Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928m9tp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 12:28:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad8b4c92cso90291546d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 05:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749990534; x=1750595334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYFjLzTPjEjy1T3L3ljYt4I9xb4e1sH2nbCAumXDDS0=;
        b=gmA9pwmjErdpFYyYPRPyRLdh+BKKLdmBOHH7rkQhHMtB/c6GPLfHTPmuIh4YtuTlAJ
         ItrrxxOm0huVdR3Iq27MH6mSnbBXGqo6gFU7gWX2aJ3vHw+3iKPsj9KnejhgtVSHqMU0
         I1j21N6N1MgA5ObK3rKNVN1WjfOU4jiUfnWYwZd0MPrwwglrUY3gT6+wA1u5DQa0bJdH
         UuaC0BgtU49OMmcXAjmZZkAYS6v8r1BfWScNcvjibYxAA40WP6xpyZtXI7d67Gy7OG2c
         2d6V5Yis3Gfen3hsQ2i9dkZmsD08kiHju3htx3G45CzduaEVdvop/D2O2x8MTw8+VBZ+
         uQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYRDV5FIvnQcEah6fUE/KKDJVTW0SZSaSlbD+UfWPhg2R32YgR7xSvNsupe95FeMeH2u3XiWCYV+sBD00t@vger.kernel.org
X-Gm-Message-State: AOJu0YwpRHiLavTQb8KyLLzHw1HPZXijIwqGo/rrPZHIKADYW0+JbaO9
	INnXkx15UEnT5D1VqTt+G35ivNjoXTlL2PRZKGgJvXjRt41kHf4hHIpBtHlJzg1lsuGa5P43nix
	aV86Hrmo34ZhZnue/hBJT1PffMZZ504wNacapdGMec61AJImnELb15aNS/ooEymFiAUaA
X-Gm-Gg: ASbGnctFa8flTDrWjAFun7I2BoVBiLOpuNaUY0rdJ8sets8bjU3Z7h5IrKxSDJpgIJ6
	WYuUjY24sxQ1t2gQnzriOk4ihbAfoq03etwNnEcsI4yLuScFrFjGGVl9/tPs/VbmoI21nLKcbBz
	qS6zK3LK975gNJrFSJyJlQcmOpP4jqEmtPwpTaHtHhuX7izOiCFP+4YAqnrZGEmWlNjfIogPCcb
	eTTUG7GFaTFXYx/5eez+7wVxYQj2kfSeIlgR5EnUB8Y4ltvXxtyOHJAkspI+G7YzbH6zQVeC0RU
	RNOgGn4ilYy9YjDERLRz0lXTW0MAh3aUS+Mp7JEp+yDFH2pSUDFACTOpVGXSA/RxCFTk7FtF+Qn
	ESudKh2F2PbHOtR09LdxEMCo9KDK481WRvto=
X-Received: by 2002:a05:6214:f2d:b0:6fa:b03f:8a39 with SMTP id 6a1803df08f44-6fb477eccc2mr95349616d6.35.1749990533628;
        Sun, 15 Jun 2025 05:28:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFecrMlgiZHiVgQc0xoFYv6AZL3hQTMwvIvIFgGgIayhcp13yX0wnWr5kkUSjDSPZBYNKxgyA==
X-Received: by 2002:a05:6214:f2d:b0:6fa:b03f:8a39 with SMTP id 6a1803df08f44-6fb477eccc2mr95349196d6.35.1749990533090;
        Sun, 15 Jun 2025 05:28:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3304f19esm12034551fa.10.2025.06.15.05.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 05:28:51 -0700 (PDT)
Date: Sun, 15 Jun 2025 15:28:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Nikita Travkin <nikita@trvn.ru>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, maud_spierings@hotmail.com
Subject: Re: [PATCH v7 0/4] X1E Asus Zenbook A14 support
Message-ID: <dy6luu7uy4d7czpsd4fx3stcxmpbl3yykafreciqbpo6dvaqzc@dy7wvmrzevoq>
References: <20250614205718.93166-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614205718.93166-1-alex.vinarskis@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDA5MyBTYWx0ZWRfX5qsyRHL32Aog
 RoCNJpwaL5EoorC+vI+9J31IEkt438UHHSb6XMY20DJX+6d9YNgeImdT4abjB+j4Ka4PNTtnAVp
 yj8xIdF/AnezfnrbEgr8XvSNkpmJgY4sNEZCcGompH+KC1fCVzv5f7h6Y6MlfbtKu8kDPw+waOa
 mCtKrXdzdgePwf4rRymYZoKfcmkvnQMM+sAK9Ho/kvwJF8pfw8FzdmrtUCC+f/FxPWykSEzUUzA
 nWLj3H358SIzLi22Eq6AYF45xjKN3cuc1AaKefi0BLe2vrZmAWakRfImVAhGGAV3pDIsey4s769
 13kRZ7kwXd2S7wlUVJvgEA34fn6BN4z6q2crrWiCufIugd89r69Yecw/up0UF5lSH9KDGk0HiVH
 pggQ3lel+fEi7LmHdBz0V4Yv6ye4+h5nnEuwuAxoAwyyDgSBLQEedWsjQdiwFLV8A6hgTdv/
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=684ebc87 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8
 a=-kjG0GmE0fcV5XMtYfwA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: joyFHhiohpHrdSAREx_BIaKMJ0A2YQrc
X-Proofpoint-ORIG-GUID: joyFHhiohpHrdSAREx_BIaKMJ0A2YQrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506150093

On Sat, Jun 14, 2025 at 10:53:48PM +0200, Aleksandrs Vinarskis wrote:
> As requested, 1/4 was merged to linux-next by USB maintainers.
> Resending 4/4 rebased on top of latest linux-next. 2/4, 3/4 already
> landed.
> 
> 
> With this in mind, and taking into account that this patch was
> already reviewed some time ago, any possibility to still add 4/4 to
> 6.16?

No, 6.16 is in the -rc stage, which means no new material going in.

> 
> ---
> 
> Introduce support for the mentioned laptop.
> 
> Particular device exists in two model numbers:
> * UX3407QA: X1P-42-100 or X1-26-100 (as tested)
> * UX3407RA: X1E-78-100
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> When comparing device firmware between UX3407QA, UX3407RA, it seems
> that only ADSP firmware is different, CDSP and GPU firmware appears to
> be the same. (At least assuming the GPU firmware name in both cases is
> `qcdxkmsuc8380.mbn`). Since at least some blobs are different betweeen
> X1E and X1/X1P, define new firmware directory for `qcom/x1p42100`. This
> also makes it easier for distros to automatically extract firmware from
> Windows and place all blobs for the model under the same path. If/When
> firmware blobs make it to linux-firmware, same blobs can be easily
> symlinked between `qcom/x1e80100` and `qcom/x1p42100`.
> 
> NVMe SSD depends on [1]. USB Type-A over USB MP controller  depends on
> [2], or equivalent proposed solution.
> 
> Qualcomm FastConnect 6900 on UX3407QA did not work out of the box, and
> additionally required both newer firmware and patches to `board-2.bin`.
> I added a short how-to [3], as it is not exactly trivial.
> 
> ACPI dumps can be found on aarch64-laptops' github [4]. HWids on
> dtbloader's github [5].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20250319094544.3980357-1-quic_wenbyao@quicinc.com/
> [2] https://lore.kernel.org/all/20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com/
> [3] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14?tab=readme-ov-file#wcn688x-wifi
> [4] https://github.com/aarch64-laptops/build/pull/134/files
> [5] https://github.com/TravMurav/dtbloader/pull/4/files
> [6] https://lore.kernel.org/all/20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org/
> [7] https://lore.kernel.org/all/20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz/
> 
> Changes to v6:
> * _Only sending 4/4 as other patches are already applied_
> * Rebase 4/4 on `next-20250612`
> * Fixed zap_shader to &gpu_zap_shader
> Link to v6: https://lore.kernel.org/all/20250607200229.30538-1-alex.vinarskis@gmail.com/
> 
> Changes to v5:
> * _Only sending 4/4 as other patches are already applied_
> * Rebase 4/4 on `next-20250606`
> * Moved gpu enable from dtsi to respective dts as per discussion in [7]
> Link to v5: https://lore.kernel.org/all/20250523131605.6624-1-alex.vinarskis@gmail.com/
> 
> Changes to v4:
> * _Only sending 4/4 as other patches are already applied_
> * Rebase 4/4 on `for-next` of qcom tree, adjust makefile to generate el2 dtbs
> * Picked Konrad's R-by for 4/4
> * Droped 'qcom,x1e80100-dp' as per [6]
> Link to v4: https://lore.kernel.org/all/20250426130203.37659-1-alex.vinarskis@gmail.com/
> 
> Changes to v3:
> * Drop redundant comments
> * Drop incomplete wcn7850 as it is causing dt errors
> * Picked a-by
> Link to v3: https://lore.kernel.org/all/20250416232345.5240-1-alex.vinarskis@gmail.com/
> 
> Changes to v2:
> * Fix/re-add PS8833 as fallback
> * Add EC's i2c address
> * Add pwrseq for wcn6855, placeholder for wcn7850 until its tested
> * Rename x1-zenbook.dtsi to x1-asus-zenbook.dtsi
> Link to v2: https://lore.kernel.org/all/20250402084646.10098-1-alex.vinarskis@gmail.com/
> 
> Changes to v1:
> * Drop PS8833 variant, fallback to PS8830 as they behave the same
> * Drop wrong pcie6a_phy compatible revert
> * Drop redundant comments, fix order of properties in the device-tree
> * Fix device name bindings, express in model names instead of the soc
> * Fix GPU firmware name for UX3407QA
> * Fix model string, enclose variant in parenthesis
> * Added missing new lines before 'status = "okay";'
> * Updated cover letter to reflect some of the above changes
> * Left SPI10 disabled as it is unknown how/what for to use it as of now
> Link to v1: https://lore.kernel.org/all/20250331215720.19692-1-alex.vinarskis@gmail.com/
> 
> Aleksandrs Vinarskis (1):
>   arm64: dts: qcom: Add support for X1-based Asus Zenbook A14
> 
>  arch/arm64/boot/dts/qcom/Makefile             |    4 +
>  .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 1302 +++++++++++++++++
>  .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   37 +
>  .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |  141 ++
>  4 files changed, 1484 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

