Return-Path: <linux-arm-msm+bounces-56616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C56AAA7EAB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FFFB3A81A1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 05:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052BE131E49;
	Sat,  3 May 2025 05:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zcr9CJyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E5DCA52
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 05:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746251472; cv=none; b=GpZE06Z32kYtkW94OfOKtYY7UO4gAbTqsY6EmmieNZLNw1Bpb6NaO7lqUR9pR/5ch7o3mfSWOojdKuK8HGMNLTASpnc9c1Ku+hnVe3Z0k9m9T6r0Ii9fc6D7I23iS2dGKhLUPgmzfy6gdFvAcoHEEYFe80DfP21qaw8vy8dxUdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746251472; c=relaxed/simple;
	bh=AxK2Er7e4qbH+VJ2vhJbE6S+jLI7sAd0bDAU0Dmr3U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0AXS8FWMUFYPqtLej8tJPHBiqd6QyM2plxNDXbdxYKy5DbJ547GeIpwaVSP8sLwJvve6VxkYlWCxOpPVE/S9fr8Bl3Diy7zEElbj4Mf7ABrjrT0zude8YbYu2DoZr+dswwYBkg86+LXZO3g5kczqzwR2gD8EZ413tdtVzmr704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zcr9CJyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434RlhS007487
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 05:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z7RuyIdhrRBZm4S/CdQ9tNde
	Aw8FFfZxEFL41QTfBVQ=; b=Zcr9CJyDrovL8SU+zmNyOFN2y0XUSicLIlcRrmww
	0swuT9Shk998kPSUfnKsmAe+HaeJwIqaiSClW/rbfyLIb7mrX5ewaac10wQX1rnF
	OJmGmCC74sh2QahqMZdBzJ1WCFHLTyDzY6qDUyQE1Fji6o4dgBssr6/MGdp9xBxz
	2ZA0G/F/867wqKbebyknD18j6alG2aeuCwzERk2SPvFa7A7+qqqc6q5tcyYfkV1j
	mlxn9wuWHV1dX8ZYuDloNl7LqWKLMLsvJbdIEgFA3YP/vK+kaNi9/xmrRTXt1WQo
	mF+gttf71v7SGuWaZCxH8jlDGNAKVUD9Pm2rk1V3ZlBTGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg06td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 05:51:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so18955885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746251469; x=1746856269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7RuyIdhrRBZm4S/CdQ9tNdeAw8FFfZxEFL41QTfBVQ=;
        b=I4ioRq8Ij3d2lNNGUAEno2helfmXcSVmqhu3oC0HCnTiIx7vPwLFMH4SmYbhs8R3Zi
         QOaVxF4J5PdYm9oCuiI8rCNz+S8bFXoziiFL76seKAQAzWNFpAJTlbIQCXQTmzxJ/1VH
         4e418lmV7O9PkizsPrhN4vKPveV7naZpKxKQ8W9ueDHCvrUQhSmtLumTF8v4y2dG1oIZ
         A2GQkWVCXg6KTkC4JDshocqW70PqobCDzSqXwM/+WWzLnP/Ob6SfhgyXHJxp+iuq/4sR
         dGv2OuUqgncO7ZkiTnazcyuQNhdQbf36EmAB7P6NEhwmMZ5XEzopZt0Mc8c7VIVXfUsd
         gT6w==
X-Forwarded-Encrypted: i=1; AJvYcCXimCuiBnTtsIaGnXVkKizupyj/p7hvPRvT6EDR3nrcbkakCRU6N9ZRiOyR86brOTo7hbPnzRNOZ/jiC0WD@vger.kernel.org
X-Gm-Message-State: AOJu0YzfgyLo21ut2SnC9uxUhn8L3BQt7bqLb8gTp3P6hcKSIHMl6nlO
	nAR0DVw0/nQcWAnX+ZhlVlM7512z/0bXx5QPgh8j/sDUFcVVHWO2JZ9TXH/hJRU7D8DEQ6hTVdD
	jD7Ve69NgvcJH37miyIpdx+5RMeLp1ojf7cjCm8jsCv4mRpZCsqvq3fu7uQfjQQpv
X-Gm-Gg: ASbGncusvn6adgo2vVEmjv9CVD4cj8Z6bbSkUuVYZLmP1ll6rYexbZ1bOSkAnM/KaPU
	bVbV2WWKmKSHYeAPwHc2xDHDn/qhM0soHgPeDXIeShUnlgZG7K4iN9b46hsBBKuHVuWlzatEd+c
	0FpjapwMnkMv61T/+fo8h2EANqQjlbmIHl4MN5uF/ol/fGmKdCggItZBHvxCS88Nic/TE0qukBV
	bt5ljGAjndEnp00aiuXE3ZnUuWIe7f1dm2HA/Pxkf4+FaktyyEsKEf811d5+YP6eQaDn6hbGcOc
	I6ynVqcdQWxuIpjoKAgSCIhJxe+3u0decPivKR0pDooA4NLvFyBaHDpIJkHLm7S14zsWbsHdLgc
	=
X-Received: by 2002:a05:620a:8013:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7cae3a5a0dfmr5908985a.5.1746251469340;
        Fri, 02 May 2025 22:51:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU1mh7yhVDqrwrGX92lx5O39gpt1bwUkfkp+UAf/dF55RZM9Isaqsry40YdK6JtOnY5dhaeA==
X-Received: by 2002:a05:620a:8013:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7cae3a5a0dfmr5906785a.5.1746251468983;
        Fri, 02 May 2025 22:51:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f680dsm650283e87.220.2025.05.02.22.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:51:08 -0700 (PDT)
Date: Sat, 3 May 2025 08:51:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
Message-ID: <dc64ygn6pt5bvdgizc2qk2qnxn3on5nv7hes3hhc6qqmiumdfd@nxpfis6disof>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
 <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com>
 <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
X-Proofpoint-GUID: _rfzhwAxQYTRnUCM1iPJpbvzHiyIv-WW
X-Proofpoint-ORIG-GUID: _rfzhwAxQYTRnUCM1iPJpbvzHiyIv-WW
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6815aece cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=h8DH9cjr6Ktg_wdBaOkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NyBTYWx0ZWRfXyBHYFJegssiq
 VfUVn78yTb6e1IzngtnxmCVDtljzlx77ju+hO9gd3OGvzN4fheFxjNklB8F9/yHlD0MBOq8jKmT
 IfiYkmJ3CHwR69MK85EfB7aWUmKl2b6Ic1EIEVbcYOrNMXRPYnJ7R75qN312HtiE23KAXm/dDbk
 +tyy5HAFq2EIK/I6hY5Qf98nfI00wSh7fcTEzTlwFl3yvmHlLvgJWeOBN8s/VzMWf1zH8D7kpEP
 kD7nvl9LUvTv3SlTpvidmdAdQW09X+WUf8RYtSatsu5GfPNdBXP3Yair8vVFPFYQqf3RahcoDwL
 LliL+UoIUHyhtobOCaBg9TC4oCCzZWFGmd1oBXmbIV4FweiUvka+ykRuyuta/bNDM9183ysJFJz
 djdPeh96qeITerCTJUit098YSVt+xZDMSdkmLMSpRR3zPr1nyIS2IjVRpytOMH5yuhxBQB+v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030047

On Tue, Apr 29, 2025 at 04:07:24PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/28/2025 2:31 PM, Konrad Dybcio wrote:
> > On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
> > > Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
> > > DisplayPort and Display Clock Controller.
> > > 
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > 
> > > ---
> > 
> > [...]
> > 
> > > +				mdp_opp_table: opp-table {
> > > +					compatible = "operating-points-v2";
> > > +
> > 
> > The computer tells me there's also a 156 MHz rate @ SVS_D1
> > 
> > Maybe Abhinav could chime in whether we should add it or not
> > 
> 
> Yes I also see a 156Mhz for LOW_SVS_D1 but we had a similar entry even for
> sm8650 and did not publish it in the dt.
> 
> It was present till sm8450.dtsi but dropped in sm8550/sm8650 even though
> LOW_SVS_D1 is present even on those.
> 
> I think the reason could be that the displays being used on the reference
> boards will need a pixel clock of atleast >= low_svs and the MDP clock
> usually depends on the value of the DSI pixel clock (which has a fixed
> relationship to the byte clock) to maintain the data rate. So as a result
> perhaps even if we add it, for most displays this level will be unused.
> 
> If we end up using displays which are so small that the pixel clock
> requirement will be even lower than low_svs, we can add those.
> 
> OR as an alternative, we can leave this patch as it is and add the
> low_svs_d1 for all chipsets which support it together in another series that
> way it will have the full context of why we are adding it otherwise it will
> look odd again of why sm8550/sm8650 was left out but added in sm8750.

I think it's better to describe hardware accurately, even if the
particular entry ends up being unused. I'd vote for this option.

> > [...]
> > 
> > > +				mdss_dsi_opp_table: opp-table {
> > > +					compatible = "operating-points-v2";
> > > +
> > 
> > Similarly there's a 140.63 MHz rate at SVS_D1, but it seems odd
> > with the decimals
> 
> For this one, yes its true that LOW_SVS_D1 is 140.63Mhz for sm8750 but this
> voltage corner was somehow never used for DSI byte clock again I am thinking
> this is because for the display resolutions we use, we will always be >=
> low_svs so the low_svs_d1 will never hit even if we add it.

Please add all voltage/frequency corners. Think about low-res DP or
low-res, low-rate WB.

-- 
With best wishes
Dmitry

