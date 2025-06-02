Return-Path: <linux-arm-msm+bounces-60025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6602ACA957
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 08:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9595F3BC4FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 06:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3D71990D8;
	Mon,  2 Jun 2025 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7vtTMST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E087517A303
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844864; cv=none; b=EOyL+nLdSRPV59Gov73ZFmMHb0M7hs9XV9//z3LUZFbd8IL3PxnIgBymO+MgU54Wv85LWW6lruGLw1h4t1PhYhqUBaS93J/ipsibHId5RpFoetXc3YNv0edyFKqFz3eKUUutNegq0TT2+7vXhbPnzLEw/EVRjYKQ1oj5iVcJTmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844864; c=relaxed/simple;
	bh=yfDMLKTywq1rgMhTpI3zIvk32bTPAbLabXGgDUmWeVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2hatUfq/dMTSV54OyQdw1WC1wK/nY8T1UsIwEqtSG/NdYikUI1EeiY70bV0DnXdEH9Ie4yCfjp8TLpLlpFpGsQxQ38ajpug9awHSwl7ZsW0Tde7GVfzdw9yrZcvutjTOvLt1Q9rrRsvMakGBT8zwY9aB+SqHBLO/8LLdWgPnbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7vtTMST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551LvfwG030036
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Jun 2025 06:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=flmDUdRzTSdQ3XB1WaSuNgXC
	/xzzeHQUFd3cOSxNmi8=; b=V7vtTMSTMwAUZ9hMvxn/zls9XMsTDaNXheuveFRg
	WJkaCRzloXG/wxQ8s4VNzQHIlkphpx1KZActvR3PnZxIBCLCNPpMGw3+gMENCnzK
	AhmVVBOgnVIL21Njy5kQfLH8dMgn+yXmK7OxEiJiLYzn2Ddwl+1UkzNUoq9CX3LI
	4RGEJEMdG5OBLRpS5CIIQ+jWvY0+35az3kdD7k6Uw9N0vInNQRG44CmEN2UCfyfm
	xv8X+JfxrTpWxvzN9EdWFfUR5YE6xrwEiQopf+bUSyQ9RLp/17Ty+f26wIP78kCO
	sCex+YDtanz0SwHxQXnWhrMzcLEyYuOcqa3/P42TkYKRPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytsdugxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 06:14:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c92425a8b1so477187585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 23:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844860; x=1749449660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flmDUdRzTSdQ3XB1WaSuNgXC/xzzeHQUFd3cOSxNmi8=;
        b=XG8wULQC5UFZnF+AA8CjQeDMXQn1TlJBoact9FGkOQ/5yr8nAvs84pCZU8LI+OhWs7
         XFd7ny+S+yjmSSlHukz4G+kH+7kEKHmBYya/syxf4KbyHK13HjC0GVQJdc090vqRbJNY
         6I9bnTABx1tDrd4dlcbCYfFuMCX1+63RYYlRNJU8qkPuX3qpmGoElBzzS7r8kfwPLJln
         LAo8dY7LQ86OxzvvOGRHrNopibKXi37ftPgxe/mY4706EJ1kX2Pl3gyeXkt4cPBzs0vq
         pGOoWSLNQ83rU9c5Zfn4YSIuK0rq2JOqFz/obxc/XJYm6Vqbicy6bHhSxUl9Kl9ReYqK
         7m/g==
X-Forwarded-Encrypted: i=1; AJvYcCUF0EwZdKPtQcHfjLoMfXkoOiZ7MFc19FPQ4Al9mvIM7EWDuMHRw70sXWAbpmbZVp0iHoSNuPVhNN4Ps1sG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/pe9YnaukMLpripLyx5xJMsTGACyD5Rah2o8/SJD9SHVCM2eJ
	FjHbvJuyTF5MtMuaqQ52SRafvKcA7Z9SYP2Nt66jG26FFFAjqNnTADfex9lzkHVNIN6CSaTOV6u
	VjEUnhXII3ZjBV/yHVfXYErsZuVtDExPHKs47WwGFKgsP3BID0S3MMSl3ccHH7mGHLjRK
X-Gm-Gg: ASbGncvOP0PVMorOpeMzTYmAodkFYND/O1K4KodHAXR7EqdQ69vrx5CqoQpsQNncJLZ
	ZpT9WC1nwZZU5imCsl3eiOzOhB/7V5qqZas/Qe0BjFBKY7IOVwAboX8WG6EvnJdAquxrEkcNww9
	Hu7iuNf1XFl5Q8+IUMFVmDGSwJnovFuPf+CfkvMdc7AkD/t6QK1jUo5UkKqBfexkl3393/mQxDI
	O23a+WfYgHMdG6jjgf1aictxkdyH0yukwQR0xK3+mbymITK1XydIFc/0trox/Xq/w4W4fLolbCL
	0cnbIyR6Ap6+yi1eFtSZwMFt06r1mZDaViH9FyVLrhG9EpK08PuKqYUc/1f9O/P6xVs9vvzoeKE
	=
X-Received: by 2002:a05:620a:4488:b0:7ce:eb40:5abc with SMTP id af79cd13be357-7d0987d73f0mr2372748685a.21.1748844859764;
        Sun, 01 Jun 2025 23:14:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfa/HyjwuKIFtyqKUXOSM36DThgJJlHokJlZLC6wMsaXWoh8NnPBLRYAhqMEAaUk+Mohp66w==
X-Received: by 2002:a05:620a:4488:b0:7ce:eb40:5abc with SMTP id af79cd13be357-7d0987d73f0mr2372745685a.21.1748844859380;
        Sun, 01 Jun 2025 23:14:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d1d2sm1480413e87.7.2025.06.01.23.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:14:17 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:14:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: qcs615-ride: enable venus node
 to initialize video codec
Message-ID: <x27shu4eaqa4qc4mld5xryelyvhic7vneq4tetxy5j7zrxll6m@ssxg4jehdsyy>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-3-c0092ac616d0@quicinc.com>
 <qeuxv2mpnnsieygdwvsb63k4n53tnc6yekiv2wels4jjwwpxf3@wutnfkefi7yj>
 <05ccb3ce-1954-4a6c-8cfc-edc8313e9875@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05ccb3ce-1954-4a6c-8cfc-edc8313e9875@quicinc.com>
X-Proofpoint-ORIG-GUID: trotfMliJnM10BVaLxd3NGOtFYGcj3On
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1MiBTYWx0ZWRfX7IbJUFZWIh0F
 W57WkzzpvTJA9aZNyyM25Jw9aJvlkOe1Jn8CSMXszMwAhposyoH8QBRwidq3brdX2H258z9YhwD
 YUI4N78v55JrxncDz8oTYyWuwEXSRXse4J4bChZuWuieq1Td1gwnkUK58iLeOqp7aqyySAURsgq
 3rx8uBlH2/KQQr0yCv3IcpHEYYy61Y66q13ICKfdnC7ZoUPsZ22nJ20JCBH0QDdsNNHWIJEWi2E
 Ajdle04IeOKjSyiwynpIHcrzFBD6LIfmGgA8FOcoyEgYoXEpuNbtM8/wa9Jub2elnaEyQWwHO4r
 NdLeJDHTUipLepVSdvlSTsfWu5NB4cIrBRqblPZkNs0W5g+4n4DYQJlS0Nw+gVVAFWeKg5zu2FF
 wKlMBccShW4mmF/AMNIIbKy893G5lY2lX2gZucqVRk85ONCZv8G7WtAPTaCI/th2e1/gJCnl
X-Proofpoint-GUID: trotfMliJnM10BVaLxd3NGOtFYGcj3On
X-Authority-Analysis: v=2.4 cv=bYJrUPPB c=1 sm=1 tr=0 ts=683d413d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=QX4gbG5DAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=2kupvtxIihpKMtcpfgAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020052

On Sat, May 31, 2025 at 08:07:06AM +0800, Renjiang Han wrote:
> 
> On 5/31/2025 4:31 AM, Dmitry Baryshkov wrote:
> > On Fri, May 30, 2025 at 09:32:15AM +0530, Renjiang Han wrote:
> > > Enable the venus node to allow the video codec to start working properly
> > > by setting its status to "okay".
> > > 
> > > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > index 2b5aa3c66867676bda59ff82b902b6e4974126f8..0686f5c10bdaf7ba3f522e16acd2107d25742dd9 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > @@ -338,6 +338,10 @@ &ufs_mem_phy {
> > >   	status = "okay";
> > >   };
> > > +&venus {
> > > +	status = "okay";
> > Does QCS615 work with existing qcom/venus-5.4/venus.mbn or does it need
> > another VPU firmware?
> yes, QCS615 works with existing qcom/venus-5.4/venus.mbn.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> > 
> > > +};
> > > +
> > >   &watchdog {
> > >   	clocks = <&sleep_clk>;
> > >   };
> > > 
> > > -- 
> > > 2.34.1
> > > 
> -- 
> Best Regards,
> Renjiang
> 

-- 
With best wishes
Dmitry

