Return-Path: <linux-arm-msm+bounces-72537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1BAB488BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 11:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6DC13B73CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 09:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70A72F3631;
	Mon,  8 Sep 2025 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcActATR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C02F7AA1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324393; cv=none; b=nZ+6Nuz+gcKBDN/sznGLJNkEVuC4ri3xnELVWwOZQTUzMn43ha48148p3PwZA/YBlkBsfoIWAiRlc12PlGUrOVmL79ofT/qC+juMlEWewJDEazE+wjerLf6VvMKQja4dqv4a0O/nVA1iUXsVBFAtxG2OCxuXNic6rHYnaNAop/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324393; c=relaxed/simple;
	bh=gKuIl47UOtpCFx0MmxO2U2tss6DrKT87XmzqoLKEi0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZkDDPicbUGfn93j5+zpmkOAcQ8QCzG9ejqpjo9txJ5lem6yd47FU81w0qi+McJW6k08a4YQo2b2S0cbzhnrM3E3iz7qoHUNOl8pNhzs5v3a5ea8+JuNp+oUFvWbYat2hy9+xr5KrhYAwmFAB44iz4ei6DHtx0NIFN9Vpk01pmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcActATR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58895M2S013584
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 09:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	veUZKzGV5RVIn21nOgmhArWZXfr3Vm5aURD7be3Q04k=; b=kcActATRy/YmG/oM
	v41uIWypgasfnaH13qR1G2udWqNB/39HAwbTE1pvl/Lh+iVznXU0uGOo6qZAEU4m
	E0sWsSA7qRgrihSPHidpjModRVRhpxkmY36jNEU11rJhUnL0Jo/djwyhIYg85IJs
	jS01UNSQCSIIJH9mKL/11VIlBw5KbRA18+rer6KTBP8v5h0EAA9ILR3JJxPraHRR
	p7Ddp88abc2LHNk0G6ErmFeKW+/azh77unHFx73z3KsmvAKyyjsvoMtiG6EOUb+t
	3IxR5VwrjbETzT/GGhyrwrdUWV+aGW2IeQ4JYlCIFE8E5TpgIgnK5F7NXPsJJd3P
	FfDDzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws47ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:39:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3aac677e1so38062981cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324389; x=1757929189;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veUZKzGV5RVIn21nOgmhArWZXfr3Vm5aURD7be3Q04k=;
        b=rew52nHBCt1qdDe5g8sbcc2YQol7XEdAowyjYnTxCqjtWf5BkZmOjjJYW8hiGuwOGB
         U+hEYKAdW0hbupDg631/IYDFrTJV/o2KxzwJMRDSEOxXHNck/b0YnK3uwdEXazTu3NEi
         qbv9uTDoeE0Ex1jtx6X7ZYCvCPWZdQptsk4LKjW+jdlA1vGsNREHXW1o8Nd2KECCKEl9
         nPzzbdOfKOiSdslUdheGL2yQd9C5AzvRcmIKSmdDMltXfk+8PMk3dDjrUSj8xlExAhOy
         2iMeuTyBsVSCvxitENBGDqEe0IusvYYQtDYMVXO+bBKj1nRRHuVWj7rVlLPWLYyVijLw
         dAdA==
X-Forwarded-Encrypted: i=1; AJvYcCWzM6sIz9isAvCT7wkSQYWOoAvaG/RtOy1biBRfUfM6LQa2yUQqJXGWLeuShp7whveYpN3IYdCErFPMWhX5@vger.kernel.org
X-Gm-Message-State: AOJu0YydqMJj6XHsDXPMXPREp3YK+RxPxs+3JlSdm1Ecyrp1OKKGGfKz
	NOjp971SI3Do0HPpabBmsr68p8Juo3tWoJoAogfsE+tb4Y1cVgsDZj2sugKpMK5wtxvDssuGFoM
	72dvDSfzyGc+eCBZjvhTwlN6vQgub7oOoDlA4zq3YcQAOBbZBo6ufBChTiX9wx/Lmis2l
X-Gm-Gg: ASbGncvZtUgZduXNfn7GZ6w8iXtj4nRxDomXXqDt82Yhoki42CzcQmVl38FyDoiaaXI
	5ybFfe/NI9fTshiuQu0wphDW+01IFLP1xXm/BVfTgXf9CA9iMgFqW0FP7Du3sCAX5x62n+bfma1
	CWDSRLlVAu8AhUtKAxozXZAth8TaoYWVkzIGn9K9QZwX7tZcizhG3phLT+x8JOar6vwJWjEBFi+
	eGMN7w4o+VdvJ6rEgYOubEoi9fgddBBfmqbMGFCkRi7ZHu7o947fNTzzaUFDtH/1szHpoXfMV6f
	Rt8k5mQLVXqoaRk+n8Qu8YP4VBEtoWcgslWrrbWQurQ87TWfCJ2ZB/kMtBetavT2FspEuHw1p1q
	Ize6maoUKE1SO2MDty3EptlAmK0dmiWnwcTf30pQCRzF9ky1BtkfX
X-Received: by 2002:a05:622a:24f:b0:4b5:e72d:dbc6 with SMTP id d75a77b69052e-4b5f846fc73mr78826171cf.72.1757324389120;
        Mon, 08 Sep 2025 02:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy1mrw36Xw8dyInvC+DMbqIM2PRIu/aziD0n/i6SMiCO8OR2jo73OLVrZzBTqj9rG+/JMhUw==
X-Received: by 2002:a05:622a:24f:b0:4b5:e72d:dbc6 with SMTP id d75a77b69052e-4b5f846fc73mr78825941cf.72.1757324388614;
        Mon, 08 Sep 2025 02:39:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abc1798sm3486986e87.57.2025.09.08.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 02:39:47 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:39:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Message-ID: <xzw26v6aqutgau3zwm3njblf2qw2em53n45ju2yhhfh7uhyxbz@6kqvink2chld>
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
 <a38df652-54c0-4216-9aa5-c8d32599c8f7@oldschoolsolutions.biz>
 <c66fe361-74c9-4471-b371-353ca582bb3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c66fe361-74c9-4471-b371-353ca582bb3b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: P5SLPpqxgoHcfTW4tQfAyDpQJPUQTGMt
X-Proofpoint-GUID: P5SLPpqxgoHcfTW4tQfAyDpQJPUQTGMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXzNCVSwcjWZpP
 B213Rj4Ao9rJTdSVMZS24a5QA3B5dDmY9hRSDetsxmUx3Ci4QdzMwH+CFW3m05yOFuecLL/4vCs
 wyxtlap7BXFrr6vJ5Lj6OUiOIzIvgxz4JLb5v3VoKipfWdrsm6K6AvlwZzx0ScOZepxnVxo/3qO
 wz0takAM5i3BM9zc7LD94Fym/Y1Cofw+8clZ1wy84UCJzK8aiuesxkaofzBk308TaIfmJQRy81Z
 fwJdM5uFAhHFZJsxysrRRYVTf7xCIM5oUfYPykbFNG974+8q036C0tPt6DNZmCQautE+QtDKJZw
 BNTyLMfAqp7kpv27a+iERmjVp+2QiHUktvby6eWc5k34kqZ0TW9Hkri4y14WbAjz3Ctl/oUFZDI
 7KDdNUta
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bea467 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=4LzuJVVA2EB8z9vYX0EA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On Mon, Sep 08, 2025 at 09:16:29AM +0200, Konrad Dybcio wrote:
> On 9/6/25 10:41 AM, Jens Glathe wrote:
> > On 21.08.25 15:53, Neil Armstrong wrote:
> >> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> >> connected to the third QMP Combo PHY 4 lanes.
> >>
> > [...]
> >>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
> >>   1 file changed, 44 insertions(+)
> > [...]
> >> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >> index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
> >> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > [...]
> >> +&mdss_dp2 {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&mdss_dp2_out {
> >> +    data-lanes = <0 1 2 3>;
> >> +};
> >> +
> > 
> > Hi Neil,
> > 
> > shouldn't mdss_dp2_out also have the link-frequencies property?
> > 
> > +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > 
> > Or is it something the bridge already negotiates?
> 
> No, it seems like our driver falls back to HBR2 (54xx) ever since the
> driver has been made aware of this property:
> 
> commit 381518a1677c49742a85f51e8f0e89f4b9b7d297
> Author: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Date:   Tue Dec 27 09:45:02 2022 -0800
> 
>     drm/msm/dp: Add capability to parser and retrieve max DP link supported rate from link-frequencies property of dp_out endpoint
> 
> Dmitry, is there any reason not to allow HBR3 by default? Is our dp
> controller/driver not smart enough not to advertise rates it can't
> support, during negotiation?

I don't remember the exact details. If I remmber correctly, there were
cases where using HBR3 resulted in a less stable signal than falling
back to HBR2.

-- 
With best wishes
Dmitry

