Return-Path: <linux-arm-msm+bounces-56940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5757AAC365
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40880502D02
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 12:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC8527EC9D;
	Tue,  6 May 2025 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3J1lOd7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529B627C16B
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533303; cv=none; b=Q+zj19KN1cH86VHKY1EOaulRbwCYVQO7J0pRWRg4fF/bg7Lp+E4bhpKh2ByXdtGaXi4XzMhuGejw2RX1vW9U7zwlB95F+Fwg6xGUAwkL4IiMxhYOvw7nCQOf2vwlOxgGfPJNw5wK7r6LvVVoAIU5k8RFoPKTSE+pZkGWuBwD3yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533303; c=relaxed/simple;
	bh=DdbmmhonCetUBZsFTlekD4aubGPPFIJ9ItkmtXG5bpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9EyWwC54lUwvRISgnJS6071X7S/3cPqHZ+O6SwvHlxRzUDBhhEpSu/nus014/yrhWGEQoQ3a+4oNtGwM1nCa3H30b9PATGFQJgvyMUWkV/JHuCGrZxcaMz+tbRCssQFbQtnvFMoI+IBvJSIemQk8eS8dBtfiEu4wSetU+HaIfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3J1lOd7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468JKZA007904
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 May 2025 12:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GD4lMZs5a3pKzd5cggQ3wq6Y
	VdqPYIs1t4O/gynZcKE=; b=E3J1lOd7/umRoIoyHPXx+HWv+BhAjFG2wgSGRs3h
	4REjvf6kVGrZ4z/9aFucBCebJg+hkZWhWeKtJ/pvf+eXKNYW8Mz+Hn3TVzzCPHVr
	GpAiYsTReVbH0TfZbMWJ79HPUWDamy+npijq06Fp5wgSIAVsSq6mriISUQUf0wxh
	FAbhD38u1N9kQRyH1+3iWKXX8pau6ucut1uB5RlTSn4ARqo4fSLlpfn7HFPpdpzz
	LGTFLLo+ghwWRLGOLbyHoktz6neYZZJ4G3o/ZGxEy5OYD8PShvIehuJJkEBe/smm
	Qeg54HJborZn1OskGXcRmpjNSxsuhHjqpLVx+sXsCKbWiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep7pts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 12:08:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990721so286497185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 05:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746533300; x=1747138100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD4lMZs5a3pKzd5cggQ3wq6YVdqPYIs1t4O/gynZcKE=;
        b=cjQRBg7EkA1RP+MhScAOUIe6LXgc2mN9pjhbKGg1SV719RsHd7u1HP0/fqNSyR1brM
         0usuvfQlSQK4RbgfpWpBlFjr1x/yDdq45z7iOTeXz5b0msdZK7uCTw/D5VSjaUhFltpN
         E2HRJkOTx7vnIA5A+6n2n3DaIsW6UNL5DUs20wW5haqsdElcPOf28La4BRUK51+dewHp
         CGIlW55/kriBj28iUcDYbKjamZZ5VMJxrFoWNW/t/RuzntKmdZV+Zh36UUu4hNvWNGY3
         vX1Bwj9gTvE/r4Ai1frusoB4qNyOlar/bwfHN/2jRcQZl7FHs2qOQI58VBkXDAVqQtnz
         65DQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3L23PPocK5Vfm/Hpi/GRoEqRH3fXtMEDnGdg33CVnhFRRv22M+vmTCGg9LOa3FALZa84ctNmzC99rBT74@vger.kernel.org
X-Gm-Message-State: AOJu0YyWBh3KDmiugha+wDVxlyy56ZF1Qmxz5EANuRY9FGfddQmUqwTw
	7md9EhOZ5AxASbfp8/s7E2HQvC7FJbZHk2Xpb12b0Zbz5TnKttVF+EW1r45CuhAwLhotaRKETU7
	hhMx2iz3+aoTsy9o/XCfOuxg9wfz9Xlc0i2Q45bYitgk8aBlb2OgBe4qS1cunDaqdpCt2OWKA
X-Gm-Gg: ASbGncuvmtcmhuhG6wIy9GbN/Z4nZ3QF1JQTEtPAfL4GEIoHDv8QpvhCT/iuHq/OVY8
	IgIIWV6XwoIT0F84AOS6cgN9+9sbTRf7mz47wG4dOgAw3Ogp+Fcusd1ID1FEyk61N83C3hWoZag
	HkTL7Z+QYmIrDYnWR+AZuyiSY4S/1un5M7FiALyOXyO77zInu7M4HfFDc6zkFh4eUb5m4xl0lHZ
	YzkhUiSVrlj8DAJwpfAr/NdR++/hYFh+llPImFFkMvi/y8pMHQv1rt67ewNpbp94Du1rQyt0N8i
	aT+7b0vP2dUCI2pDeLxv5+wmJjD8EZo3EAA/hMi+6js53tcP/hzLcEvRV8D9Ybe46dSB4zMvFy8
	=
X-Received: by 2002:a05:620a:4629:b0:7ca:df98:2f6 with SMTP id af79cd13be357-7caf09bf07emr524576785a.43.1746533300195;
        Tue, 06 May 2025 05:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz6fgxkf8GCZyugOKLOyYO6nxMMiDaVer/gkboErci2Inurno93UgLLdfrFIxkKoZ4FWDdkg==
X-Received: by 2002:a05:620a:4629:b0:7ca:df98:2f6 with SMTP id af79cd13be357-7caf09bf07emr524572085a.43.1746533299797;
        Tue, 06 May 2025 05:08:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32028b38e2csm19391601fa.13.2025.05.06.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:08:18 -0700 (PDT)
Date: Tue, 6 May 2025 15:08:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <vr3q2c47ht5iebf7nvy3qywoxlquwma3p2tffswrefpmxqy24h@wrfecu6mcqcn>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-5-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229152332.3068172-5-quic_wasimn@quicinc.com>
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6819fbb5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=q-whWVftEaYGax-JpAIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5P9y0POq9IGNS_Ur2984nHb4i8yx0mV_
X-Proofpoint-GUID: 5P9y0POq9IGNS_Ur2984nHb4i8yx0mV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExNyBTYWx0ZWRfX0MklaHr0MwWE
 l7Kvl8KzKStQiMW3WgVqCBaTiHpwR9uV28UCxBmPQXaaho+G9NLCTjrJ0uRcqZM80WiQgvi8G4Z
 cfwUZ+lqNU9u/h/aKbAV/r+nyV7O8tuerOJne7J7lUF5Nu5eX8KAjcVGAn8l4rbkKm6hGfvGQwN
 rH7inW8sFeufEiqPXji6DDuSvyUpViTfdjDJ/t3W9PZYYu3EOhb3//WhNorlMZxzgiVSWDKsxOF
 ArWtKInEionbI5S3gcxny6YmMZi3QbBx3nvMMva4Dli7Rvw4k/Jmna50/iXe1N3EUHnJ9+GTU31
 owR+ykuxPc1Gnv5NFpheUQstyEZEFbE5AMgynAWN8V2ixtwRKnTvM6vWyYyIsuy2kplo5FmWlUN
 m8pJfyoJy6G4hgL0yvHlozE1iIh74zEkEWj2SViCsMRImkMWPI9N2BKpJwx7i0Ry1V2PAsYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=798 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060117

On Sun, Dec 29, 2024 at 08:53:30PM +0530, Wasim Nazir wrote:
> Add initial device tree support for the RB8 board
> based on Qualcomm's QCS9075 SoC.
> 
> Basic changes are supported for boot to shell.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 281 +++++++++++++++++++++++
>  2 files changed, 282 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> 

For the next submission please include at least the UFS support. The
board is pretty useless without the actual storage support.

-- 
With best wishes
Dmitry

