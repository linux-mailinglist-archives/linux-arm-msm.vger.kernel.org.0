Return-Path: <linux-arm-msm+bounces-51838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54897A67EC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42040883654
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 21:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54896202C40;
	Tue, 18 Mar 2025 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RplT5hpA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9FF1C6FF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742333621; cv=none; b=jry6HwbzA9NF/Jcak8gqH0XozxoimBgD85qL1Tae7DOOiPnrFqsDmXxd8FC4ZUYR1C93lSsOVBLV7AC/3MDh692DIP8sUmwvFK1P/7/wP8EUdukhfWdtk9Fdfsk6aUG/mGcOPlfd958P+CB9krMhwiHvHFgZRcl0ucxipG0g6cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742333621; c=relaxed/simple;
	bh=sqeXeuHnI3RYiSCIQdMV5BB625+N1u5xK1q7i3iLlrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G03xD5u6bP2l2E2kDYzi2XKdbkgmpndruGmyN/kAwVWO0qWVp3KnGXtWhe57s8E8DpejNlk8Z9BOXYO6R76Q40+fflZMISudixFjwD6otbD2XYGqoQ7Bz3e6+LNwyi5ru0XHnxREnoNQrUDlqLGe4oSOfk3uTKQ2N3DiGtpYJTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RplT5hpA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHsJwj015132
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AUCKkaO6TDmVZC2pTS2bRWbz
	Hyx0XdlYmxeuzuTp2IU=; b=RplT5hpArVosKjvz8ezf/j2kA8MMa0cEy20OEhuK
	azMa1rpDYQh149Bb5odx6Qx7Z97d6vxDXMAAA1+21vnfaLp7LUOjSsD9mw/wCLPW
	zRMdszsra/TaNN765TYR+3SNeI/mB/UHBFkxdlfZXMV2Cf5/6OwQ1h7w/EkVxziT
	tVEaGXRIhzGITZxVTMGtjYcs/pbObdZe5LWH2NbN8ujk9ROnDDYB28Qir1zEkoM2
	z6O80UaAnw/TdhUi6o0G6tgHUyTRx3u6GoTPOIjpMtAdfHBL/4zJvdD1kQPU0anY
	N/7740a/0Ntc2GGDJXwZzBrvNT+g9WlysKmu6GjJBX8fVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdmwrfd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:33:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3b8b95029so882654785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742333618; x=1742938418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUCKkaO6TDmVZC2pTS2bRWbzHyx0XdlYmxeuzuTp2IU=;
        b=hbo6wwYnQyRetOtR9E+35gL6XwtSs8YJ10guO/KxoiCjQqGZcQux+CPBiK/Tri9khl
         v3DDcn9CKZDEPFAf78rc4W57N0KqfZYAL/DocS+9cjTQKvkBBd7TQnMB+DvTIFECQjI9
         srH7xYphJXJ2pZE9nOtIfOIlnNJW43JVcTFRo4ZWwuYTirCjvJBqf9hXaNIqfc7kbEkA
         x1jS0tlPS6MaxxUcySJXqrP9cOjRPkIFEWIKic19J3QCEsTJefw8Mc5qjIK7RhWHlBNH
         dnQIj6M1ZAfS0HGE77pxIZb4dIM77DtP6mD8zPFF+2UiYr2Rtw0GCg/UYFKeAu4RSkUh
         yIjA==
X-Forwarded-Encrypted: i=1; AJvYcCWUorwNnmgLaeUmNTodNMbwPSLnREMJDCVU8ObXojhWLFkMK+9Ap350iQQFeM4yfluN0mvHajbc2ZXatA2E@vger.kernel.org
X-Gm-Message-State: AOJu0YwRyQwpTrU9qT8IeQJE0UOnQr4f7OkYxG9X04ITGmL03dGvaI3h
	29zu/Gsax40e7YzyEgdBdycRLB3X3TLhLcyD2XNygYA/c2m1W3QE9mmJtkjqeZqihpmn0/QuNDe
	wvJLCKA1SsRquojXgFGESitwrJvNKwAu4sb4RNKIRvyuWPNhT+KrPcwXM4FO3BTFf
X-Gm-Gg: ASbGncswGaiqG4guCf+xovkXCNNggsLwMOxuaX97FtQktYhPfr9Jd+T2tUsrokubxpm
	puDX3ZGzVLl/nffdFIQAvwOJZda5FjwRZz8jPnvMXuSZaI70om03RStKIWR1G8XCfMCGQGbKNvb
	tNTWUkKz7EpHSBIE3kJJX6v7XBU4yeETSdHnRe9hRYM0mplBHiZFZ75S7xJe9h44y4ya1bpUroc
	vwhO6hItLiPbUB8MRDLzfWZHZtmIBZLpyUqZZofKjPQ9sCHjizoNDE/SUKmM/XwIbEFdJ61BhoZ
	KFCPO+1nKehvo3udYEC0OTpFGRd44b2mHdK+Trl+Hg41Ejy/UkIFbUY9ZOaYQkqEuFnTYd/vYN1
	mieI=
X-Received: by 2002:a05:620a:4085:b0:7c5:5909:18d8 with SMTP id af79cd13be357-7c5a838f559mr31445885a.14.1742333617933;
        Tue, 18 Mar 2025 14:33:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbNLU06o7v9da0xIANAr1cICtJz+PFbBxgZQ+APOPFsWUarKUtHkA+4idb15eiF4e+aXcIyw==
X-Received: by 2002:a05:620a:4085:b0:7c5:5909:18d8 with SMTP id af79cd13be357-7c5a838f559mr31443785a.14.1742333617654;
        Tue, 18 Mar 2025 14:33:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1dc0dfsm20865471fa.105.2025.03.18.14.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 14:33:36 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:33:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: msm8998-yoshino: Add QUSB2PHY VDD
 supply
Message-ID: <4xozday3kuwlp76hqs5ohabmhucb5v5as5mni7wrp25nzhhqqt@3vdii2qnyicp>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
 <20250318-topic-more_dt_bindings_fixes-v1-8-cb36882ea9cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-8-cb36882ea9cc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _x2EqKM9gzLQYtnh6PYcmnc8LD1DYYK6
X-Authority-Analysis: v=2.4 cv=ReKQC0tv c=1 sm=1 tr=0 ts=67d9e6b2 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=czvDKQ4P4fPyK2hnz74A:9 a=CjuIK1q_8ugA:10 a=PkAOt9_mmfBkvtOLxIEI:22
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _x2EqKM9gzLQYtnh6PYcmnc8LD1DYYK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=706 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180156

On Tue, Mar 18, 2025 at 07:35:21PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Set the supply as required by bindings, to silence the warning:
> 
> 'vdd-supply' is a required property
> 
> The value is inferred from MTP schematics, but it shouldn't change
> between boards due to specific electrical characteristics.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

