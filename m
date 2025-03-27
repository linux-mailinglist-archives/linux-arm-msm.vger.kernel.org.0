Return-Path: <linux-arm-msm+bounces-52654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C9DA733DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DEAF3A97DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 14:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C46216E30;
	Thu, 27 Mar 2025 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsXpenhp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11C2215F42
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084299; cv=none; b=I7FnQERE+yCGXDpuUr1ha7UwqCrY3QCkpQIYIrs71nSbvheKXLUSahZdw0gbMnXrNz9Zidqs+194FqF3rs8eVDWseBlZoUA49iotqXiPi00sAUyXnNy52gL4YVtewZrtxUa1GfH5bh5T825ZCTtcUQ5bx1oitZkFqoCpnc9dpWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084299; c=relaxed/simple;
	bh=m+MQebCdoQen/iBMPXoz+KzcFef/ph4H4Nxtif+65TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgbocOH3yK4MWi/Thy2cNX+nR78yN7Jcckiv9GY9ahscSXZMg1y1WRxinpTSRXDOE9CkhycFKj/7WNtDG+GKorzXQsK+kLm9k5Fzy3h6uycJoZHMCIGTo2DMgo9nIm5ub5IY/n9EX+zX2oYbEjHgJt6TUUTn36WNHlr59nyqxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsXpenhp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jDvv021234
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B32z0nkKxR0pV2HsaLWigtDr
	aivyxIGGbTNez+3GvU0=; b=EsXpenhpNPJntw5TxhHhQ+qdXd3mhUo76dMPdZdJ
	p3Q943DknIbXFlB8z1tVo2NwKhFl8lnkHVkPkDzSvaTB5xzyfgpNXvLXEbwyxhbJ
	hKHI/enUgARl49i3dMd0Jo5TYpO5xhBYeqtAa6IYpqmmTDYf9GB7I30fvTkz6MAC
	N9NUDR0736KeDXn/j5AQIdCGLkktBlum7mSQHRGwGOOFLzgeyHu2ARH6Ds/WBgJh
	zHfFtCenR28HitgxWehb3Rz623D9E77p8dSJ5Txs8RrUK68Sl3TbP84xsfW59uDr
	8M5HWNbtdmGmOoOvpdY4R8gUMHQ3oxCmkB4T+LXKPW4KSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9pjm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:04:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff78so267680785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 07:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084296; x=1743689096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B32z0nkKxR0pV2HsaLWigtDraivyxIGGbTNez+3GvU0=;
        b=qY5TC8Uzug9hfUoWxuCepSy4utuGdzPBB8aI9/1Ux63kJG+vHnl3CwPicHR4LBfjho
         OQAMoRAKP2cw63T2ldbZUbc4iRe5rqOt3qehVf8O9nV45T58ZGz9jG42e3j8KR6XVPSI
         nUENhCPFK9rexks5wfV5kBEOgh3V29UWm4rlX6+fzB8jivouJzMCAjqQ2Ipta1oQpwe5
         La6fwDaihxTijljIMD0wEVcFkBnUfD7cmq3iVfTKC/1ACKRY+VMdZfKuSpm/pJ2kL+hi
         izN1uJbzd3nT/kO0R4u7+PXuZZR8rCg2nNdjn0fNV/5xEWu261y1xnS7tUBiZbANb4RA
         UrtA==
X-Forwarded-Encrypted: i=1; AJvYcCV7FN+rJei68nUDhAD+LDam0IZtW0QULs1/U65gJ/NdbItDKfS80I9yaal8EEpqnV7gzVzWPkT5C9EGv8Yd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsit6MTLX6s/bd0AiBjfCLJFB6P1uh5mneiMgdWjwue1YcCVmA
	y0POWjkwsclxUEdq+M+ZbSNVe5Lo9HWXMrZH/3CwuZ8Zj6ecZrzQyPjuYezo3xSw+CTdNhpKuTq
	b2KcIgFduQkO/O7mdvEfKBzhRSojpD3p71dHwngiHwL11kbG80Tm9E2nyMEbQOT+o
X-Gm-Gg: ASbGncu96tqFqvqHUpvn5qx1+pYjnH67iiZLxxUxG3ie5TtqwcVnnh0Bvy48PNFplV9
	4dghQoNYDgzAxdP/pqOJ5AEaBAF0mvMElcg8zvRC/5Hip8LQn0aTF0SQV9Fx25mXsGZpAt2iYkI
	6dMmM6ZNGYwoKRM611UG5j9SW4tRH//kNa5AhV4PW36E5LCsvMGJ58CCnr8MIbzhzFxmguKIhEC
	wb2Hm80G+LYCt/IXiqN3wAMBmljbtbrFQxrRATmtSMN0zgY9OD4rbzzmfX8EUiQRj/MhW2RCvWr
	GKexu3jGHdPQIMOkKR1NZctB0oUvx86JfcmGvFQPebIp9G/xRMKBIpssEeOZF895qGuveHuvGnt
	Ni0A=
X-Received: by 2002:a05:620a:4305:b0:7c5:d888:7098 with SMTP id af79cd13be357-7c5eda60226mr530561985a.44.1743084295429;
        Thu, 27 Mar 2025 07:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG0kR4BIcRTnYfbkvx20oj3Hp4oBV0sCjN6K2E8Rob51ffUn6DV3Ut2PgRJAWGiTjCP+ZraQ==
X-Received: by 2002:a05:620a:4305:b0:7c5:d888:7098 with SMTP id af79cd13be357-7c5eda60226mr530555885a.44.1743084294908;
        Thu, 27 Mar 2025 07:04:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7fe8b9sm25208831fa.58.2025.03.27.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:04:54 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:04:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dennis Gilmore <dgilmore@redhat.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
Message-ID: <ghqzw2wxunc7yg36epcsdydm74fkrecd7iyestbqiobbsfvmys@fxhv4cs5mfvx>
References: <20250327081427.19693-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327081427.19693-1-johan+linaro@kernel.org>
X-Proofpoint-GUID: _Un0VIUKITQrPtvmAezy9ryOTSRK0dZR
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e55b08 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=LP5Qa2lKvCmapEnZnZ4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: _Un0VIUKITQrPtvmAezy9ryOTSRK0dZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096

On Thu, Mar 27, 2025 at 09:14:27AM +0100, Johan Hovold wrote:
> Enable PCIe5 and the SDX62 modem present on some T14s.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> I don't have a modem in my T14s, but this is based on the work I did to
> enable the modem on the CRD reference design and the T14s schematics.
> 
> I'm hopping Dennis will be able to help out with testing.
> 
> Note that we may possibly need a new entry for SDX62 in the MHI driver
> device id table (mhi_pci_id_table) as well. The output of 'lspci -n'
> will tell.
> 
> Johan
> 
> 
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 

> @@ -1028,6 +1044,25 @@ &pcie4_phy {
>  	status = "okay";
>  };
>  
> +&pcie5 {
> +	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_wwan>;

As we now have a proper PCIe slot power controls, is anything preventing
us from using it for the modem?

> +
> +	pinctrl-0 = <&pcie5_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
-- 
With best wishes
Dmitry

