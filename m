Return-Path: <linux-arm-msm+bounces-53060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC195A795A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 21:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E9716A3AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 19:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360CB1E1C3F;
	Wed,  2 Apr 2025 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjwq2uGF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7D1C861F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621025; cv=none; b=F2FSTvKV1ILEAucnr5B5EywDBAjClb5itIvar/T3SBYO3hzVMBRiAh/6ImvBtWj8iqvNWEEyqAVPabgm4e1bgQ3/GKkepyvm2HRE/V7ep24B49nZgArueXkiWJGF3rTk4/sIFe8quGCVVplgiCeDzCAGk8YrqCZaCt01ee8kHPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621025; c=relaxed/simple;
	bh=1E9NIKB6kiWWxGO5LFe//013qn2YvkEVBA0RtrkzOrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMEVn7V1+o9PkLTe7pSrcaGivGK+xSA1Pv356VaAl/XMlgL5ZdFdNdrHNIkeCwsh0nYtEm6IhFdmfGztrgLvASlPYRL75vwSP+9BWOO92/5ZX2aZW2lIpLySO8uMbaZlcmGudMf+nQKmXXXZYNpnKQyNTBPuDuuGpaMeuAWae0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjwq2uGF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532BjmdD014652
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Apr 2025 19:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zmUYkVYqvGzbPDQXyu/mUYb4
	7LYlnrBBpOgNv+07v8s=; b=jjwq2uGFX3im1U8tRkkH0D97x1TydXUWEqQVwtV1
	gsnsIRkjMTvH5GSU/zjcOSj8lJnANasDKqM39G0Fk5O6q9ZHecUvrxmIucamsGAd
	VQ16CGgzkPhQqQiFwLgoz0Kn7y/yFuxsfjtH9bn8v/k7RwWYjhcbDXxwD/U/evWg
	gnXUIiVd1RRBKFvJ6DXy0v9LXW1QqMgG2C8LkEgkXzBI4ht/RJqUxAfgoOPxAqxF
	yCCHbSFKQwVxDr4TFfpu4wOpx3WdALaqob9X1wEHaWOlTxLM+TqBRu+I6GQTzJWR
	MtaZwnzWgnGhc82YXAO/IySu3uZwCdpDYzy7saATvcB/fw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvmgsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 19:10:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7bb849aa5fbso25310485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 12:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743621021; x=1744225821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmUYkVYqvGzbPDQXyu/mUYb47LYlnrBBpOgNv+07v8s=;
        b=lcRnvBLg47xQe2vdEydxioNFXt3tzuWYTJnFLwjIZA5BzFzVvMwqjgd7kWOnmBkaeu
         3dRPW51LHcbR6FbuQ7+KF8tILftIWFcSa5v5lc0PLp93yueG61cqbiuwgOxE2hS26aKO
         B2VRBgZ4eGoey2YPH8NKlFDJxPm53Qq0E9hzf8Q6bhF0ripswzdyk1URBIC3RZEEsjUw
         qgySaVSa8eN+TfyKd3UPdl28LYIRU0/zlcbdoNrBDR6sGJP4MNDNsC1pTr9Zev2u8ZBs
         MFKKDhCnWkXSCbiLCV4aoRfplL22h5e5SPii/tgyFsDk20V/hIBj5N66kSOEYeKTo2rd
         iP5w==
X-Forwarded-Encrypted: i=1; AJvYcCVlY+Ss+5lWeQWLb57ckstVT0JSpmhZoyvymF05PiqtwKyd2DoJ+F2bzlTucPpnpO9MsNDOpUJEcsIL66jc@vger.kernel.org
X-Gm-Message-State: AOJu0YzQZC/jpz9LRrMxcpwJNCsWeq8DWMTbJyy1PWZSnAPmUVgSBHJ2
	CGaA1wuavjv7Mze8TFmh4uJMsLsDbEMu/j928adHyZVVhoKGGMiVZomcCPyPD1GB32HAGNYhm3M
	aIA8qNYAPK8d1sT/peSl+2p0Bjgv6HqRrMjJeWMVGOCrtK4JIijFUR93WUPV1d/zU
X-Gm-Gg: ASbGncsOEEAKJwU4ka9SDviKOocBT404O3OPGwCCWJHkR/uzMUsLAGdmydWuNKhlUID
	JaHKh329ZnmssrUzH47vRYrMxT5TKFf6lSAYjqwXZyh6kdjwsvtKG3lSRPTSZ0YMIZuuZXe9Xza
	2OometfD6U0ETwncmqyAXgy3n/aV5pXknk3zv2M2lZOkOS4EkTz2HtM0jbufiRWHYI4+5NFVfcn
	TQxEgbjAoIPi6wn3QINgM7zqKk/cCddfNU18fCsQqsv2m1ElPxsYJKwTm8BqJy4LEw1vOUhTFEQ
	2Ng0rtTKTMi28FPXmPrfceMaCiq4yX+IWtoCh2GtTugwdfXmWbs/u7v7OtbW+zF40AUZmAGkIfQ
	LnlE=
X-Received: by 2002:a05:620a:2685:b0:7c5:3b9d:61fa with SMTP id af79cd13be357-7c69072a6ffmr2450035985a.26.1743621021602;
        Wed, 02 Apr 2025 12:10:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL12WrxSm3dTTl0ltF+TFscnVQIRQop3TdWFVMRKTPWUPSA00Q+ercIZwKI0JKi3FN2ZJRbA==
X-Received: by 2002:a05:620a:2685:b0:7c5:3b9d:61fa with SMTP id af79cd13be357-7c69072a6ffmr2450032285a.26.1743621021206;
        Wed, 02 Apr 2025 12:10:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09591191sm1712994e87.193.2025.04.02.12.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:10:20 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:10:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s-oled: add edp
 panel
Message-ID: <a4wlwnhgxxzgarkbwtpwqsh42ksmp63xgqwewgatg43esc37zq@wc4bbkjvlpjn>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-3-ff33f4d0020f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-3-ff33f4d0020f@linaro.org>
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67ed8b9e cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=bmQPT5UhyNeoAJmEc28A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5vw0Ig15CdFuntptLQi6718HLGn8GzCo
X-Proofpoint-GUID: 5vw0Ig15CdFuntptLQi6718HLGn8GzCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=734 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020122

On Wed, Apr 02, 2025 at 03:36:34PM +0100, Christopher Obbard wrote:
> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

