Return-Path: <linux-arm-msm+bounces-51839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F9A67ED7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A1D6188ABD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 21:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811682063CB;
	Tue, 18 Mar 2025 21:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opfCFub+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DDE1DF240
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742333802; cv=none; b=IWFrYIHMNyfUCV6OxB6rfyD/Ax5qEF1sg71rkmZtiRF7k8VlM292tzlogUXJp8bYceBhFpRhwmbF64+1Eab+yb7LqbuIwCdcfYWjAygwqReYr3uRBzHpE0sWdgFEYMqHFRUIod2pm53b/BcH4FfH5m8yYC60NXv11FK47EUUElg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742333802; c=relaxed/simple;
	bh=tMitTEqQw4Kms3E3oLuanNeRnAwfAUaWFSBpeuDWX5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kygnnzeekXR6+1/IWWCydBSXlfxEdoEcxFPhwwaDt1GFj4Ey4IXgawkUKCVTc5O4RmApKTMIijX+AXQeIy40pvMrG66KUa34t68jP7tGrbyxEfrecvhvVodFUgL1Bighi4vKJk3DiN/QKVNetY5YwTSnkH0ZxwjrlVMAaGuzGbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opfCFub+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IL2n7J001597
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y2vcgzW1emQX/7iFJLX2wg5r
	EcXOlkERAyCkxjphyso=; b=opfCFub+SeAlKpeinR8f9Uuk3HLK48q1OGZdyYH3
	f3hz6vwZ2UPXbobD+ZcDDtizUHdN9bgRlz22P940riZbtQwOqSkKmZw1PmiLGrqW
	mEHKs/Sv1BjPac4DDHqFmMrt0jFl4sOPRAeNkZW3e128D75MyUt5Mv0YQgdAgQBv
	6bYdO16uLKmlzBJJ4CKWZzZyIUYW0IcPXjzGjyFgilSr+NjVtfC85dnvHv8pHpKb
	cuP8Si2JEZTJ5icOX4hu8gP+aeaPsGZ6du4bQuUGvYxhzxl3/NDfpEBlJxsvmXRV
	98hWkAHngN9gYBIFf6kYAszIsxzZveNRDjXta/rTDV/bdg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uu1jps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:36:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a3ff7e81so1129565885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742333797; x=1742938597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2vcgzW1emQX/7iFJLX2wg5rEcXOlkERAyCkxjphyso=;
        b=CeEaRhzBSaIrFOG5cklCD4z6CbnNBFaP2OaMySuFXQhCAVkk4kFxdHW8M2ymqfZZiM
         VrJfq2u5DXgDLipNPReMXkoGVH/31f7Er8sxYPDlpIzICcPpa1bmvk57vQr105xlCTYY
         gygDOKCDnkKGP7RV+WDn7XB7vwXB/pmWlGJkdsVneVbpWyEel7TRsFZ/3sJ5vrLNjGAC
         KQHPL+52T/n/XS0FCMEhOMc/IYVrQDZS3Ooo6mPmH5eRRLe8fWBC3aEvzbvC9flvkMXn
         HTUGZW4KfjxVRzxDJ9iRoXMKwRUEUGQO78HE03A5FXrunmWiZBhuSG+De8xSQA92SDBf
         uUKg==
X-Forwarded-Encrypted: i=1; AJvYcCVdZ5qK1nBHqN4MkEX2kpZY259xWcEieQeBi3Tsw3xcEaOMixUZRJlgGSDVZ5k/tZxMCUuMElyB9M/a8u5N@vger.kernel.org
X-Gm-Message-State: AOJu0YzSb2Rd4s3xChYFvp+GHBW7cWbNMXlNDoW/9ei74hFnBXIaSB/n
	ehqRgPoItzlTg2Wtx0XOVXPRcr22/tUQ8tuQvRhSxZcKw2ufST3Ui7UKrDQ/i3UIZSvJrePYAa0
	yasDoZv50meTSb1hVgNaFLfd+Z+dxCHuqbqrkLKuXhy/3u/f3DD6gjihkWuu3yISQ
X-Gm-Gg: ASbGnctg1kP+NhMZ6n8hEuO/Pb5UsOiuWTGBKpZKeb8YttYeqPl3al/ECck1siOFCEw
	1bRlu3Y0UfQZJxcLhReg4Jy/pI8BgfdPvi+vCgbMx/gHSbMtsTVmzRzDq5sAAvEY9OUqio55Dj8
	xyieTz1dP0rAejA8MsH81wZIRBQsF9XjIEB+Mz0J8zdjFsxaiUBU3GHJuHkxkXh8ZsM/WCX9+px
	w5Y6R4ZiKF40iYkFFaFONjtyLx/aJldU9DBwdvZzQdtknrKrPKFDVmNZohDn0K36L5Z24ywqS0s
	BR5gsNpGSvAP7mF9NdYoiFnjI5mcTHUTtrHsc+vBDjxRrZ/v7YhYMWtx6vrMKMGwLTAZRLaq8Cq
	Ihms=
X-Received: by 2002:a05:620a:2a11:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7c5a8396c44mr35133985a.23.1742333797670;
        Tue, 18 Mar 2025 14:36:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/vmeLV1QqNZOMnRz1Pxtv/XOfA8xE0/NtFtVMXjjnCWpm8PwSrKmdkweulpjAZxtvhFClTw==
X-Received: by 2002:a05:620a:2a11:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7c5a8396c44mr35131185a.23.1742333797372;
        Tue, 18 Mar 2025 14:36:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864e43sm1821851e87.145.2025.03.18.14.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 14:36:35 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:36:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wse@tuxedocomputers.com, cs@tuxedocomputers.com
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
Message-ID: <l77iickvroov7crzg6s2i7nq3kakqgdtbqki74stavqkiwyjfs@rv2oegbwogxi>
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com>
 <5hvghahezqms6x4pi3acgaujyhiql6mzl2xhzph5phhki2yiyq@oi3xjatj7r64>
 <129bf442-2505-41c8-9254-ad7cacefab89@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <129bf442-2505-41c8-9254-ad7cacefab89@tuxedocomputers.com>
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d9e766 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=prfVWYIJzO_NFut4FmcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mT6s3oV7K1rYJz5BP8y6BAL21l_MqrzY
X-Proofpoint-ORIG-GUID: mT6s3oV7K1rYJz5BP8y6BAL21l_MqrzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180156

On Tue, Mar 18, 2025 at 04:24:27PM +0100, Georg Gottleuber wrote:
> Am 07.03.25 um 07:45 schrieb Dmitry Baryshkov:
> [...]
> >>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> >>> new file mode 100644
> >>> index 000000000000..86bdec4a2dd8
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> >>
> >>> +&gpu {
> >>> +       status = "okay";
> >>> +
> >>> +       zap-shader {
> >>> +               firmware-name = "qcom/a740_zap.mbn";
> >>
> >> Are the laptop's OEM key/security fuses not blown?
> > 
> > Can this laptop use "qcom/x1e80100/gen70500_zap.mbn" which is already a
> > part of linux-firmware?
> 
> It seems so.
> 
> Because there were no logs about loading zap.mbn, I activated dyndbg
> (dyndbg="file drivers/base/firmware_loader/main.c +fmp"). See attachment
> for dmesg output. But GUI freezes after sddm login.

Does it happen only with this ZAP or does it happen with the ZAP from
WIndows too? Can you run some simple GPU workload, like kmscube from the
console?

> 
> Best regards,
> Georg



-- 
With best wishes
Dmitry

