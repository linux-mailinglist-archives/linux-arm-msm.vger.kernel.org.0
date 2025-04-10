Return-Path: <linux-arm-msm+bounces-53753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A93A83730
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 05:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41251B62A75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 03:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304D91F0991;
	Thu, 10 Apr 2025 03:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I5p11Y35"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF0E1F03EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744255381; cv=none; b=SzPhvrEsr3Anx1Oqh9QYC8TkBig/IHQPKtEofeapyTcBTbUzVhTE7Vp1gNE5RSE9wEYEMneA4dtT3y/jlKfXsrsJZ2ti14hxPm7VU1MMgrfIWcSsZTnY4HP0uVthBefYtBi4H+1dN7+dBQM3aRpq/zFzCz6LzNA/cQEnheQfQck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744255381; c=relaxed/simple;
	bh=qPeh0Ja4yEU1rTr9eUKX8gtlUq67HRNq5YbB4fNpeqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KaOMlB83d63b78oQKi/441Z5O8WlTnDwjcC/s5VR6/Bk1+etDAIAw87/ZedbwKfyNwsJaaZBtYt8Yf+6oFIXTSA8fNrguE67TQI/IwcHSzmBOeJm9vUeKRXjKt5hvLEXxfv1StDABfuBxRZP8ZhSSeQmukba9vSXHwND9jR3xa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5p11Y35; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539Hpna8015866
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pfANK38r2/Y0veNUeTUAv/nE
	G8v1dA3z5o6Mox8qnqo=; b=I5p11Y35E3uk4R+AslEb/sZe87E9qPzIOb9grMUy
	Q9vDG4rbEC6+ZZGjaVVMvUg5QdTvkpP4qsX9g9GMymYOJ5AO45WLI50Sgqj+it0G
	kr/imzKJHfVmBDD/9qSyTjASDo4UyanuKPW9QhmzKO6XZLvhUuWjm6lOiwD+Ecid
	YwdWQYEK6deJBbafAp2j1gotiX+NUdNYbS68TyLByWCLS6bE/vtACHIRPuNaJqCX
	ikEC9NU9/N2+i3kfMxvZqD8MW3nMeFwNrGCRhWUVUKwmoPVe/EklmrToEI695tvJ
	OMXLjeYxeZuVyPGXRqggt0aWzyT0wpJC69b7+5Jaj2RIPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2wdx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:22:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0a3ff7e81so76698285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 20:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744255377; x=1744860177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfANK38r2/Y0veNUeTUAv/nEG8v1dA3z5o6Mox8qnqo=;
        b=XFYfmNQsZGpnAZwitpswAIWQ2R3GNE0r8/4VsTxjCHZVdY0WsAmit3ZLwR+eR/Saht
         NRMbupNp+IxH3Bb2QDloqOGdHpgok9xj1bDaEYqu4bmHbStYI3sRoYCjpKcZMnYMEbdT
         Vjz7D2uH2CtQ6N3niVYShBbxHF4TZTuMuzPXMfqMpf6U8S/FN3vetcsfiJu96JnpTcCZ
         ZASTXqzD5dopktsjYCWHAF0QTmH2GbrP1unT4hAEE43JNwMtbcydN3Uak31PSf0d2vFu
         1VcmevTiND1+x1WUNcTahpyWbWzb7b1aF7XkhBWhraSo+86iV3kcqfmNKCcoHM25EnJ0
         D1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWE3KvRy5wAJ81Gp3a8jaxZC8zUJGeUoHjWESJM4GCgYV+TRPfKxGQFuYJv9+kE7gZGGQjR1gqFbqQ1s6Yb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6/FTf2zXAdnrcs3I+Z83VE0lRv96DHO5rt7UdIMKv/AX58Wa9
	+S/7Sj7iNb+AXGd+2O0bTexmyDT7JURklGCp1buTC0g7ccRhWd/utyTdB+qkhQFH6lqhX7qhiCm
	ZqJAq9FxsmL2V5HM00LK/R5ysFCEjZHUz4FSczPrJLJ2wU9eMGU9BkjWyv81/NEus
X-Gm-Gg: ASbGnctTTr3E0WNdH1CpNbpjZyckC9jXsF8k61v0mqtpsmGO9rcKyLF/WYAAFx4v9Nl
	NeSEWr2uCuaYUUBIWpJbfgAM9Yrzd2Qpo6+OpFlIxiIfhgGV5+mk39crNmMUY3n65I/w8vVroiu
	wKO0/gGYTAJZSQtlctqDAty9Z6OKZ3SwcSJmpk2g7IWQs343CwjMgAt+MwE7iaX3xq/WybXfRBn
	1bvD8PhtEfiEJpds6wga2uH8tfq34NWbDFdkGjvhjiTxHMhytDvo55nM80x9yuuvEt1+oZ7/SMW
	rrr8bbG2P18Hr3dHpUfmP3+z+dB6/km7Relm6QEnGxcrRy5D+k9z6Lhf53ZJg9Ds7K9W19qFSiY
	=
X-Received: by 2002:a05:620a:4011:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7c7a81b6b63mr131506785a.37.1744255377668;
        Wed, 09 Apr 2025 20:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvdPKTSB3sqkRdmy4+rKmOaEHDNl9nfoJyk2DFMvWHYvIaySZUI2uhQyy+e3BTNZL0wgeEFg==
X-Received: by 2002:a05:620a:4011:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7c7a81b6b63mr131496485a.37.1744255375618;
        Wed, 09 Apr 2025 20:22:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d4ebbsm3476721fa.73.2025.04.09.20.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:22:54 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:22:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <fvbfsvx4ibixnvdh7ujt3kaybjqj3fdla4k5sx6lguegepxipg@ci5nmq36irpr>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lYziSKQekXLUqMiSm-Uf6lyMziIr8O-7
X-Proofpoint-GUID: lYziSKQekXLUqMiSm-Uf6lyMziIr8O-7
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f73992 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RKJlQbLL0f_VtHaaO3gA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=518 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100023

On Wed, Apr 09, 2025 at 10:48:17AM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/Kconfig              |  10 +
>  drivers/phy/qualcomm/Makefile             |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 325 ++++++++++++++++++++++++++++++
>  3 files changed, 336 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

