Return-Path: <linux-arm-msm+bounces-82858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE285C7A16B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8558C4EBBD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD64D346E72;
	Fri, 21 Nov 2025 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNkLkKft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYYcb6nj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B240346784
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763733921; cv=none; b=cReUpkeA0k8OcqegMToiEvA4Hl/t0n4ukDyp+oWIUhkA74DACpf8f66R+rTRpGKyEa4W42z/x8+nKxPbCEnzbkwvzIfbXctwq0FcCOan7k6v0ZPFZPCK57qf051HtpkM2yuNqvtoZ+HTjjC0WXrqc07DZJlFMZKnnINDaHQrB7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763733921; c=relaxed/simple;
	bh=68PnXc69UCyFtg6GEAXARqQQjQ2Dic9mmjK7WiX8SKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEdMnjWjEF7CuGN7BJym6d/QEYXYPHDdTOhBQTmn4aQiRrmxt5yVjvH70XFRJfZ4tDTBxQ8UkEJTNsiqMa61lycAeY1fae/gpbV3EG+tl+E/h5IElB5G9Qd+lLNy2rYjdY6rooN+nr2rrLV44VbhnzQtMGaYLJ1Hf9g9/T+9GG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNkLkKft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYYcb6nj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALAFweK2746323
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qaf5DRptIZQbru9+g9r5oqVEbW05dE2A+/lFcNwVwN4=; b=pNkLkKftTrJcb7/U
	AoRdeouXIFHSrymMO1FaKZTyfF+9htqqXlJ9PLJFopyC4k50++wVDi9Ps5WH3Ot4
	RSxqpsvFGBnWN9zroCwJB04RKRvKjKuHNEX0KXmrlEBvDV60Y/C3nkwiiKbwNWRn
	tHu8PmjVNDd4C0U9826q9nkU2WmvGpx2KkjygiZqp0T15MOPADKFUJbTcOjFcywZ
	Th1PS4WOtBBPzdkPKvYNl+p+IHV0HF5dxUX5ts9o/4zsv3vadyRYJpsCGUYitw4Z
	bDC3s8/cXFCx8GnlST7ymMfQHcPmW+wG9ug2tVcZuwa0m0NSF3GZoumPBT9T5R/0
	xTO/qg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajgeh1w41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:05:13 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-63f9c4e3701so2860954d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 06:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763733913; x=1764338713; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qaf5DRptIZQbru9+g9r5oqVEbW05dE2A+/lFcNwVwN4=;
        b=aYYcb6njfe7vHEZA6+cQAQWOR/va4GUze8RxEvPf2bxyDMuL9wftOiDPugkbVtvreR
         4yLplUr4LA/poce1yrAOw0GtSBE4Ym2W4NadCcQMz6vHb10jpaIJl3fTySoxCUButzo2
         NhGanz6BrLT1BppFxoItLtoWTaaxfMK4glrMQpXMkPAZACgsyOq08+8LoHrbBX26+lp8
         fe1pt0BeFvPem37lp+FsTnXN/gZw+Z7n9Q1Rick/0XHbICgppafeo8U9gYncAhpyfDsZ
         f5dRKueGSyI6Zia/TJi6CmYr+z6hTQOSKa+7MdbENfhcvOLyfF10KhwlFLlvo+2AcE0i
         cGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763733913; x=1764338713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qaf5DRptIZQbru9+g9r5oqVEbW05dE2A+/lFcNwVwN4=;
        b=cTydUDo8Vuq9iAzuK85azyKQxC+KArJqXEAuHC57kJ4TydqGh1kvtHT+NvcSuKDgmA
         TgqrnjVr4GRE3MXLvmK3oL9XjIGCW0slGM8koPHM3MlbInAB7ZlEVClIcgo6VJ6uM1jU
         stqNT8JZMX3ykbpaaIO2ebeJXcLGwprKziOszSsAPJXyEO3Xzevhku9ZAXZp8faClX6R
         tULXCJhQod6uw7uhaDteoboSwpy3jpSN2+ZxRDCz71ZNXlTIiKY8VqkJHTQoYVCyCZ36
         Tq/IUDzZeJweIwcda4WArziGDKsSdEnU1uA5UIQ+fQuM1JuAhdbO6Mzm+TN10czphb9Z
         PtQA==
X-Forwarded-Encrypted: i=1; AJvYcCVhkZAWjt8A+4fvSC16aaKX+YJcK7vXlXM3rucnzje9L9OoavAJu7KWE94XyaXAt9iReOW/zKNpV7A5Pubb@vger.kernel.org
X-Gm-Message-State: AOJu0YyVR2maskbsCfqaYSHlqQar2D4N/+nRvt9boRe7mlVLa0kmaxTN
	cw7nKYEFIxClBGmpXeT6jLK2ZBDBG0lCCNQ6m8ZgGuc7BvmB8sQYNO0MjW4BIF/Do/bDBUvibZT
	cqtw+XgDZCV763XLYFcXfslYMT9mqb9WIfoeFvNgqTK3Eal/BIhHRe9BbQ0iHXpZ8lUl/
X-Gm-Gg: ASbGncu2TTCQpFrH7XMD88P8vRsPdmy1nFgu2wz2JzQDWbocPuSFdBrWezCfN5v36Gc
	4yM9LnX/lE7p8KdlZKKchHLSbewsq6kWhWcKoyfYT+rCM2vnQeyCYR9DsF0FQqZAiQgqUiiPUZj
	u0wU9rCpm6Eni9Gakaoic0pZwvo/VcVaB/ozvxLRnhcqrCrVGvNHBHEdOaJIj8NvalHD42MVO4j
	epFNaUJGo6cAQUsPFS/ZhQJ340hKg6SSKT2WyH1o0+vxgThRQG+1nBTs+Kuah/G0U5qV6nqYTrm
	fJhILkWyeihTvVf0Y3ezvxx8NmDftAx28f6L7Tq6zm6wuZ6uUdZioIiNFZ9zYX/kVpD6oTOf7R4
	gInP9SmYsk1tYNT+cjIvuwzIIH5iwpS7VIz2PfkCWNAv1Je+n2HeYO6mT7sr3QmDrgzBzg2SgW+
	9+EtSROXqoxhxkFmHWorI+KKI=
X-Received: by 2002:a05:690e:1596:20b0:63f:9473:4749 with SMTP id 956f58d0204a3-64302b08cf9mr1207670d50.56.1763733913478;
        Fri, 21 Nov 2025 06:05:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGppYmqmjg85tb7as+vnEDGkkvnF45Ln0ar2bN/42BQHk6sTjweL/7Zyd/ipDSPuQ9GY2H5dg==
X-Received: by 2002:a05:690e:1596:20b0:63f:9473:4749 with SMTP id 956f58d0204a3-64302b08cf9mr1207628d50.56.1763733912963;
        Fri, 21 Nov 2025 06:05:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbcd137sm1652527e87.94.2025.11.21.06.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:05:07 -0800 (PST)
Date: Fri, 21 Nov 2025 16:05:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
        linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, m.facchin@arduino.cc,
        Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qrb2210: add dts for Arduino
 unoq
Message-ID: <eydthsrk7atlrbp5gwtc47snyiof5yknlzkuj3kwgaoymkqkih@xt5klwnsn32c>
References: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
 <20251120155825.121483-7-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120155825.121483-7-r.mereu.kernel@arduino.cc>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwMyBTYWx0ZWRfXwhNJeeo1sEl2
 cf4THJKokwJRKNTJxS3SV/HjxTJO4jkM563Xr6sdrjQ7LOu/UdYk8Jp3ag2AaAPt5ajBn3mS28B
 U9ZlYt4k4MdB8zFbCMlpX8TSZwG8pU+TAQfeK3HBWS/AIE2XdPDQE/STArcPrYjmmmF4a267W3C
 gL4LhfQWjdWphc/7VpL4AvSTl3uY3hNg4KKKHfPX26Eb3laMS/ubmrGG/z4hL39ddv7i41zPwvg
 s57dmkGqbE/Cdz60HLixjN2sybEDnKmWkSrn4cDkwrv4CHHsE8Gz2iPmhctdBFfbhcheSMX3/rZ
 tIH0x29ONahfZNxiLvWAzWEW2oNjqcDArHaOAz3DknV5/keIHAUgyIAGM3czodIbgE9o/FdbwVu
 sUbxBDLv+FNz2bjw5dYXIBSmozKwEQ==
X-Proofpoint-GUID: BaibxavBI8GcdhtHTUngczGu03kDJ8Ee
X-Authority-Analysis: v=2.4 cv=AubjHe9P c=1 sm=1 tr=0 ts=69207199 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AyA9t-mhxxp3BJy63IYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: BaibxavBI8GcdhtHTUngczGu03kDJ8Ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210103

On Thu, Nov 20, 2025 at 04:58:25PM +0100, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> Arduino UnoQ is a single-board computer combining Qualcomm
> Dragonwing™ QRB2210 microprocessor with STMicroelectronics STM32U585
> microcontroller.
> Support to a simply boot to shell environment includes:
> - UART, I2C, SPI
> - onboard LEDS
> - eMMC
> - WLAN and BT
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 459 ++++++++++++++++++
>  2 files changed, 460 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

