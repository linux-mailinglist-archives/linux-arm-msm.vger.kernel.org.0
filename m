Return-Path: <linux-arm-msm+bounces-65987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4213AB0D1C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 08:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71BEB17DCC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 06:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD78F28A725;
	Tue, 22 Jul 2025 06:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muJLib7n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4563C1A29A
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753165511; cv=none; b=e3PVi6RDlMS7SzhRN0CDcjbg04RoeIYbFv3Vl2nH6oZKcJDujWvIBJspK/Xk6mvMlkrJp23qTVUGoG3hgeTuJwOiaPV1wvM8LLTirp6pWqB8NVmcGjjrqZo6w0pQ4un7nWb1zK+bn6Iu9iceBBDQEu+efSXrLYLdspEbiU5e+Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753165511; c=relaxed/simple;
	bh=oJK0JmA0A1gXhX3avAQiLoakpxN5GJYgh6uOBn6ZZpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvMiHR83rHUiNO8Zt53dXK3kW2AGmFbi7jIZQo+3fFKNhjA1cZcM+aNxT3wIZ2ev4DoSFLhlYsgu/ViONMwatLjTj7BXafekoSwqJ6iX8/VRZ2k6B1K/gKxz3pxZUxzapUgdEUVb/30p30oqqjIuF4ZsXqikHEwPPO42r0LDs34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muJLib7n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M2Ekwr016268
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yqILAblRLDHN6S0GRPwREGOQ
	6eJ0Uo/70xJXeUDARp8=; b=muJLib7nrme8p+VrsyysMmPObzBGMpDezUOhA+nb
	jWwtE5Rv5dI2q8pmgoqB3A0AvHoz7vBXKyaxe93sOI1zZCnS2A0k2GhMtjAL00ms
	2/I5PUqWoxj/PV53xOPBE2LfV9r8I0ACSGT0DohAQfq6gvas1ppuerIxU3gioq7A
	6P03EOfTwuMsiYSuZ5Kvk3nlocbwa2jWcupKJZZepvEEYemLKHLrFtEIOwCv03Iq
	dFHkFelGlzMlapEhaUUo7nji3IFs0zsvBk8Df1WVcnRsesMIyVoNIWHIksAjXKZ5
	NB9V/IvoSlSC4ePXL7auLLPlQw6wTalMGdS9MiP7d9n0zg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s0cjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:25:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e338e627f1so1564847585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 23:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753165508; x=1753770308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqILAblRLDHN6S0GRPwREGOQ6eJ0Uo/70xJXeUDARp8=;
        b=X3RQfOhd9ZpxfqO/gUo5Y3nvkJ05Vv0okndUi87+fKrv8UZT9xYYoFCrK9MnF59v6T
         ccei4eA2hn9MjUoe8NS6cLK6hdiXp4J7zmqd62SpAbEZfBAuGro3rrcXSqWAo8157pJH
         EpCUjKFCkFv3oBN09GS1xQFFqD4UsNZAxfcmZwfTR/ZKXvVK3khUpT5u9yAsnj0vRXxU
         hQICvEmIgG2p+m3SNSe8li/ZlKC7jouBkZD76Y5gbmDT81gEHksSZ8PpznpCmD9/1/I2
         yNpNdn6hcLZ8O+KAh+2mlUnf3WkAHTemzPjKmKIQFDQ7mzCIbCC2KXXHBCfU6OIW2F+1
         QDZg==
X-Forwarded-Encrypted: i=1; AJvYcCVwXeDJ/YvjaRFqSus62HSKouhYR+ga8Jb00yaSbYDkX1lfFLDoUSpwzFuIlV2Tu4xIla15xWCNgQ1a8a55@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwwlw7/dsYhJ4Xp1RrP3A5rIDhxegKLoTGOgKxY7NilspAZYb7
	ybCaLcCiGYwU3yS8j56enG3jtVFxXZNu4X89bHpMG1LApjNRTb38yHPuGnAF7d4fjh3BE1W0Qdg
	lyOOJ6M6tbpAdHoV6aBo4a1qYO1d5S9vYLYpwq1FPbwgAkWSPIm1STLEAE1Z7zaChYFDp
X-Gm-Gg: ASbGncvt6bhPWsVOERRZFdK+TU+HHNIfLBDtqh6GHVjD0KTW/jYlPiyRY+mmMaQ76yI
	w7RDb1tx6u+VkuND/Yqv9L1RP7C2NirHvg8/xWGUHczJqEqENNrpJp+E/VAWxIFVQpJ31c6Q/wz
	NCKPGuznjhCvrHOBfWYK3L2jC5B0qGCVvf4skQ1ZkpdpyckX36a6qKcbQYUlJKvMA5xr8eQk17n
	ThSGLfvDI26IkGEnrMXmRoau3XZ3SLG2asDepn5hniTuwbN48+CmOHoJ8hYd+OCFQWeWUFcV5Gy
	F/3smXkTCvDxpc1vhO6uxZkLQmVH6mnDFf08bUAZnd0eemm0tpZQZOBqEoEvLhQyQNoiaMAcO2g
	O6sKv2HwdHi6LD8uvo85d19HIT6W+Z2i25yFDzdgOLBdUo9lHoHNg
X-Received: by 2002:a05:620a:7181:b0:7e6:243d:e3c with SMTP id af79cd13be357-7e6243d3139mr57441285a.35.1753165508291;
        Mon, 21 Jul 2025 23:25:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPEoufn0Hs+RA2zP7PfRn6yClVi2ckcXVyA/hATBGSEOgw2HzSTorcYIUcwTOrFP3AAai2Lw==
X-Received: by 2002:a05:620a:7181:b0:7e6:243d:e3c with SMTP id af79cd13be357-7e6243d3139mr57439185a.35.1753165507863;
        Mon, 21 Jul 2025 23:25:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a4cd997fbsm7232e87.203.2025.07.21.23.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 23:25:07 -0700 (PDT)
Date: Tue, 22 Jul 2025 09:25:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Mike Titpon <mike.tipton@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V3 1/1] arm64: dts: qcom: qcs8300: Add EPSS l3
 interconnect provider node and CPUCP OPP tables to scale DDR/L3
Message-ID: <l6lwso53m3roxggh2dy44iaebrlfxy34mpu66kjlknxig6y7ir@5eklfdr346ab>
References: <20250722055039.135140-1-raviteja.laggyshetty@oss.qualcomm.com>
 <20250722055039.135140-2-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722055039.135140-2-raviteja.laggyshetty@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1MSBTYWx0ZWRfXzx1FfRcxds7S
 4nkUWR+AIVsVuIb/UH7R8maDGH1Lo4S/JPhmIwmCf+kUluRLZQgZ7A5x85XPrrE7CJWf97kVEHM
 i0qYj/Tb8HovAUySNZgVblkIYyXid773NkcCm3LJzc94jhlf2zsP5vamH+UYo8ikwvZ/m5OY+4L
 CKmYY0f79+AV84L8QefoGCq2nu5AHWYVm02HcE9tTMsA1RGhi1bQOZQZ5lKpF00jjl+yN3D2/Y3
 NjNOMnf11fxNIXekkLOLX/Vk5ymhBg8BSKDqdYtkH8d/RHjPitulSefy1CURilFo8pbxSio0Vfn
 Rm2I0AzoTx4F0b75PwKSKXqry0BcsJTNs2WbLiz99bVkjU/vhtSsGnjeeec/SUqHpIWqVvkYimO
 jO+rc3kmCM7ezl39yMVU5An3nD4/mwkLMClNPKus5sK0ZY7Cr1npMMUNM2II5mhKcABe20Pb
X-Proofpoint-ORIG-GUID: a7rL8ckHFDkm4IxUEXxy78G1xHgsmbOT
X-Proofpoint-GUID: a7rL8ckHFDkm4IxUEXxy78G1xHgsmbOT
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687f2ec5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=tFNSTuR40NsBDPEYOFkA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=986 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220051

On Tue, Jul 22, 2025 at 05:50:39AM +0000, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider node and OPP tables
> required to scale DDR and L3 per freq-domain on QCS8300 platform.
> As QCS8300 and SA8775P SoCs have same EPSS hardware, added SA8775P
> compatible as fallback for QCS8300 EPSS device node.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 301 ++++++++++++++++++++++++++
>  1 file changed, 301 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

