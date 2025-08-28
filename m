Return-Path: <linux-arm-msm+bounces-71058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FE8B392A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 06:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A9BD7C394B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 04:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2441D264F96;
	Thu, 28 Aug 2025 04:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9abfwZt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC8264A97
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756356085; cv=none; b=IcyuWro5+qsLejgKpAf6V07IwnzAMEdphdpd11bFC49dbeFYhvW4TREb3iPqeizgR9x2thHpiDROqnvnGurdPuaHL9qdN34HTszVCNL5fLC628X/9iGXVDeyaOZ0uZ+Bow+yN8Yd+Jtj60Hz89m789ZBDv+qdwaeG+hFNYMVPpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756356085; c=relaxed/simple;
	bh=KEPGQ36iJNY4la2Vtsyl5h73b+KhTwqD1OvCFddUR30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8djV2Ig0rwIhDptFsPTSxbFCQ/C3aX8p4q/RLC1T3cgKw3qvmDUybEz8Hmee9ToSryA8XHkm6rjpMFkU2LF3x1xlYAgWw8B+4jy8n/zeaF2TIfRFe2M4wibe0PmJhhW1z6bMineq0aHgCPkvqYn73gFLS6OL3xg0QYA7tKBLQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9abfwZt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGgHbQ029088
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rSvxM+2fP76lLQdAFLs9nvAo
	o+WJU2TUDWvQs9kUilg=; b=O9abfwZtQNubHbT5lPWZgaJXhv0wtq9GAmoY3jJi
	EJk9sokHYwqpnUzyT2M8SGgXTLxMqd/w/2hOgF4HROS2rrlMUZxPiC4/XVGazQNC
	LTY3VmOUQzqtguhxBq2mHgYJnB/QhnPxzbLo86cpGnmL4qUyW/gf2QHAeMuouSOH
	gqk0dJmnRZobv2ElzCXQdzsqMmWs88f5V+0G0/wl+FctAZiHSQVlkKZUGD/chUuI
	6srcpO3GmnWn6M+eTmISwlraX44ZXe2xJAYfYXW/SlVoejdlyLoxuEVNHdLNajIc
	AXvpegoSgQGmsA5DSK0f7qsTTPSrlnViRI1XvJvTZlfAcg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umf2g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:41:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70db892e7b2so12593916d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 21:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756356081; x=1756960881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSvxM+2fP76lLQdAFLs9nvAoo+WJU2TUDWvQs9kUilg=;
        b=pltGZ/BL6s2CMVHhTkcY11x7hEPCVZLuVCvNCjyPevKJPfR33JLnOjJbDxMYQqcdU8
         xsDqxe6i0otcB/FLn9vnvPUXIhBCjpFzddewWvjaW/hvU+bfmmDHRAbPSPUsnYdQ4s06
         DhLxKsp5wUacDmEhFokjd8BqolLYLwSy1aJbBo9pg4OfIsAfdeOQBXNJ3Uau/RrkEbYr
         CRM3qW7QRfZSxNuS9eypRB2jm1Q0rKOuUsthbgluzzRED4nlIakAqDkFaXk5bIMWx4ND
         /3hTX5NwNuRJizV/SH29dBDwrWLIfSa5KgNqWFeBUvcptqyNFrm62IwTqm65d8IwWxux
         nqQA==
X-Forwarded-Encrypted: i=1; AJvYcCV4cetlYm03SoHV4iYSSSp6yB+wfkeTmvxC3r0e6LV0UDvtmMbr+OtpzMtcYD9SjxIJJIGSyZLL2/XW67cv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3gW8kpW9A1BoGDdbRxDIzCBsDUODo4tp1X9ggFafbdrWMc8q9
	r/MdqC3J5230M3fSPuVoT8xzc3F37/LW8AugSHINWjVgekR4Dkla9oo3dP2JfCqWthkyrMxOCVa
	VtUeoPdQUNZwu8aL8NJC3oryTc9l5kWiUd8+lhKVQSVW3z2rPHAr+7oy9E9EoNcHDp8X1
X-Gm-Gg: ASbGncuLO9T/YmtrZivserDEaRGaidkiMkjXEEDgoLOnd0l6g0uFxFMIXB9ZT2RFY1d
	Lz1EW40hveJvQmkz8E0mANX07h1LjcXf7mvIfd+ouEkdxQRKPcHgs2SFvM1L0w4uPmM9Bh64/fg
	g6tp4t9DPrQZ5g7KVKtZbGEtilcPAFS0tlwTNMQACxz7vhPowJl/vH4Tb323oweJiQkn5koxMal
	ByWcQ164x7XYkOKXod4TdoLuOi2/DAikZaG1LAfVSJ4VmAolP+RNRGS4bSHbfl7/45xYR4zzOWW
	6EkryUIDfrawjViyVh4ArxqKkTrMOLZCru7tSiPJXtIJCkPu1vf8goqWfD0vve+NEMUmHwiZDei
	z/VKnTzgSm7h1IoLrLTrl9hvBKeR8QubarMMrnFMD81Ezbt5asw2l
X-Received: by 2002:a05:6214:268a:b0:70d:6de2:50c7 with SMTP id 6a1803df08f44-70d971ed072mr268768616d6.52.1756356081203;
        Wed, 27 Aug 2025 21:41:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0BRxMG/COFp1TgX3a+AyHbVN7DWuZI4IOa0jOW27XlSiJaXNy+HkuW6nAZGxiL5O+zhzVSA==
X-Received: by 2002:a05:6214:268a:b0:70d:6de2:50c7 with SMTP id 6a1803df08f44-70d971ed072mr268768496d6.52.1756356080597;
        Wed, 27 Aug 2025 21:41:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e20e98fsm29438851fa.12.2025.08.27.21.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 21:41:18 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:41:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fange Zhang <fange.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiangxu.yin@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Li Liu <li.liu@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <zoogyjua4l6e2bgsvxx7w26n6v2hwnp2pvkizzzsds3c6cgaag@2bvqdl2z5ds6>
References: <20250827-add-display-support-for-qcs615-platform-v7-0-917c3de8f9ca@oss.qualcomm.com>
 <20250827-add-display-support-for-qcs615-platform-v7-2-917c3de8f9ca@oss.qualcomm.com>
 <yutyrfb73wbxlweoq3mc6ezyqr56snzmznw3k6mcbc56fpfayg@3h5jwymlo3ol>
 <0c2a4877-d63b-4650-b7d4-a06a2730c73c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c2a4877-d63b-4650-b7d4-a06a2730c73c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68afddf2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DN4yNuRjLBB3QJd4LzgA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX18W3ObOO9e5U
 tXjyuVdUAmZftxaMB9RZPdfYpN3iwgdPxKa6n1SUMj7ttavLZv8Hfth0qa2Qkhxu1AfSWTnjM/a
 6oo7GmFhkNyWHeEB7DhAYZIkGcKw/eHgImUWX+2g8T7Slo1Qff+/BfkYZSQHTWeE+Fy35qul48E
 n90zZ1jfsXVbhnUk9H305LW38rH2kNNtDOxJoL0P9GP36i/QQGrX7Pwn7XlbfD/GBWhLJYllICT
 R9VN9uzQuiKSWD9e3PifpgC8T34ix077021tuAoy+cazpKVWSSEZ8ehHD57QvPPd3g0xRlzm38Z
 CIOvZ9MwHcHCXCUO4ht3R8kkewRI1DCMNXZkuhAwNzbKeKGmiq/H5LF+M1i4lSdr0YmOtofiJOf
 ukqXaQFD
X-Proofpoint-GUID: KeDUTdjkdU5q464d7VCKbNGhkoJrQyLc
X-Proofpoint-ORIG-GUID: KeDUTdjkdU5q464d7VCKbNGhkoJrQyLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Thu, Aug 28, 2025 at 10:57:41AM +0800, Fange Zhang wrote:
> 
> 
> On 8/28/2025 4:01 AM, Dmitry Baryshkov wrote:
> > On Wed, Aug 27, 2025 at 09:08:39PM +0800, Fange Zhang wrote:
> > > From: Li Liu <li.liu@oss.qualcomm.com>
> > > 
> > > Add display MDSS and DSI configuration for QCS615 RIDE board.
> > > QCS615 has a DP port, and DP support will be added in a later patch.
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Li Liu <li.liu@oss.qualcomm.com>
> > > Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 150 +++++++++++++++++++++++++++++++
> > >   1 file changed, 150 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > index e663343df75d59481786192cde647017a83c4191..f6e0c82cf85459d8989332497ded8b6ea3670c76 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > @@ -39,6 +39,76 @@ xo_board_clk: xo-board-clk {
> > >   		};
> > >   	};
> > > +	dp-dsi0-connector {
> > > +		compatible = "dp-connector";
> > > +		label = "DSI0";
> > > +		type = "mini";
> > > +
> > > +		port {
> > > +			dp_dsi0_connector_in: endpoint {
> > > +				remote-endpoint = <&dsi2dp_bridge_out>;
> > > +			};
> > > +		};
> > > +	};
> > > +
> > > +	vreg_12p0: vreg-12p0-regulator {
> > 
> > I should be more carefull when doing reviews. I thought that it was
> > pointed out already and didn't some of the obvious things...
> > 
> > First of all, the nodes are sorted. By the name, not by the label.
> > Second, there are already regulators in this file. Why are the new nodes
> > not following the existing pattern and why are they not placed at a
> > proper place?
> 
> Initially, we referred to https://patchwork.kernel.org/project/linux-arm-msm/patch/20250604071851.1438612-3-quic_amakhija@quicinc.com/
> as a reference, but its node ordering seems a bit unconventional.
> 
> Would this revised ordering be acceptable?
> 
> ...
> + dp-dsi0-connector
> 
> vreg_conn_1p8: regulator-conn-1p8
> vreg_conn_pa: regulator-conn-pa
> regulator-usb2-vbus

So... Existing regulator nodes have the name of 'regulator-foo-bar'.

> 
> + vreg_12p0: vreg-12p0-regulator
> + vreg_1p0: vreg-1p0-regulator
> + vreg_1p8: vreg-1p8-regulator
> + vreg_3p0: vreg-3p0-regulator
> + vreg_5p0: vreg-5p0-regulator

While yours use 'vreg-baz-regulator'. Why? Don't blindly c&p data from
other platforms.

> wcn6855-pmu
> ...
> 
> > 
> > 
> > [.... skipped all defined regulators ...]
> > 
> > > +	};
> > > +
> > >   	vreg_conn_1p8: regulator-conn-1p8 {
> > 
> > Tadam! It's even a part of the patch.
> > 
> > >   		compatible = "regulator-fixed";
> > >   		regulator-name = "vreg_conn_1p8";
> > 
> 

-- 
With best wishes
Dmitry

