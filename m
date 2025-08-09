Return-Path: <linux-arm-msm+bounces-68188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6CB1F3BA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 11:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A057F173CC9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B800127FB35;
	Sat,  9 Aug 2025 09:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9acF1AV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1127587C
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754731621; cv=none; b=M+wJJoSiqviw6kbqNVbGPnQLfX84YDy7Gmplj6NatZoi+L8Wbo/ziI6CHt7UhfevqNsONJtJpvS40abpIwB404yYqOzIfs5WJHFUh2Q3Sjw5O+X/aSlRrrZ59B0OGy73ux6hftsejbCBkLN+GT6v4uINLy5ZAN7THQwh9BnSL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754731621; c=relaxed/simple;
	bh=T7tboWC5xtuyrDW3s626muWuhnmco34lDVGh/CoMmD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ikbx+DIdJmu9y5FDdm8sVEPe8G4sTS3L68kGm+KGzfa5CgGIiRc0REUVfmbMKs0D5mTnW7Q3nCNZCasNEq1NH+R8ZUfKNpRpIZqlW43Qf1d+h8RgPGk7FcSDNIGnlJ6gZHlbl9xj2JcGDwN3VnOqStO2gH2hF4TRL4kLpaTWuoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9acF1AV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794lamq023146
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 09:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0WTGJH2/X5+ynM87MTlCWOVw
	L56/kR02TEtFJ3cp2Ec=; b=n9acF1AV4CJ492lQcfaBSsDj0oUMIp4h0HI/aMlD
	9PjtJ9b3JyilYp6Y/JjceRGzXFmmJQli5DRpnQhKemevEwODvUKtaIlHxvg+pw/7
	7wVUEtBtXrg4IGgHB7HaDC2Z/2qC17IQeb6UmC/oO0jYRauUhDVGdXnGk5I9DimH
	iRcJj2Ir4Eb36qD9wiuoXjhUbes0r9nWoPyMECrNzfFcnkTcAh3iXdCNz7pONQVh
	KO2uySM1y1VtWkbzyr30vX6n4KCNDBrrIOi3pmnOC3MIq+hB0bQKw0wXQEPHdzQ4
	q8AcfuemFAwvQ4io8OZtU3u2++iVaaWsjEIac8rzZznaBw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9gakd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 09:26:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0add6d192so31934811cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 02:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754731618; x=1755336418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WTGJH2/X5+ynM87MTlCWOVwL56/kR02TEtFJ3cp2Ec=;
        b=TEdy4seEwiJ57am5Jy6+/rlafhHRjUHETx59LR18nRn4uz3bmcMKCmgLfw5ow9dD2D
         m6EN/i0wkIe2F26xj9YhrCZSaBgS5vweq8NHc1ybXByf7GzBEVvcJZRSGk+bmFtZBChZ
         jiMq6yeIpXdGmrsEXt276tcqmIx1ifS4njPH6GMXAnDwm4iF4Y1yo8Esm+K/xAcMWU+9
         NMSASs4KfLgdnDHh7l1hnKhGAQqSkrUNErmAgApa04qFSGq5+5sYfXRTl9sFa3vgEoec
         cdKj3gRbwoMRLgD0g1yo/m4ECzNTG2JAcZvJZ4uizmQDh1O3XZqF8UuDRWLrwpxRfLrA
         Rm8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhj1jtFqSq00eLtxScUr935IcvN+iv+f2vFGaxfe4bXOHqcjM+hFhJTWpA1c2q8JO9FxtC1VfKQOzg7n48@vger.kernel.org
X-Gm-Message-State: AOJu0YxyZ1/xfEP053vFp4FV2Z1t+D7dcI0qIv0PDKuXrqzxrRAICMxC
	pWQDGzBDx4/kjr+mTRU2J9t/V9yS/h4PRUE77DUxd5RX4UX0UXD6IwbswMF88UHCGKv3p3rLOHy
	udGtA1Tx6xRpewzU74Eg07HDh3ZwDOXQ1rLwHAAIuyZV1QtM3bU1Ah80YoQaYP66wcuIlOKPVjf
	WS
X-Gm-Gg: ASbGncuQRw0vAXslfVGrPI4KsKKQZDUFx6aIcsCGz5SZz/5+3MBnsPJeG6A6AV/yw+s
	/bdk2S20ImqVyLUSLJ92er1gtnYMxTq3zs0OVTGv6s5VTJBuZFwf7oREJxdayq1YjErWZTi3Fdl
	b/XZKzV8oWxCHJzzSCPtzDaoN1s1zxM3mZG4meoUTacVnRgeopGu5yIIY0i/plgEJykKcQYux7D
	+PH8JgedkD2AFqFtDHKbpinAL4Pdv/6ocHSjPgd51kSmum2n3xDsbh027EYPvsezmFkM+rdvlcq
	+gZ5eh5jvircdYvhY3ltPju3RdwH2XjLBeEgktaeBBrV7/seycLTtyBckL45gINte9sgCtu0G3J
	8yji9Kv6iy/toWRP7FcdXFadqyBbDnrNFN+DLpBx3XKwFMtErsY6P
X-Received: by 2002:a05:622a:1a9d:b0:4b0:699c:6083 with SMTP id d75a77b69052e-4b0aee3455amr77334951cf.54.1754731617710;
        Sat, 09 Aug 2025 02:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjB41i2CRfA5m9ojPwStfOn6feqjAz3XYsVpgrlnxVTxiq+h3z4Kw6kxYAr5H+O0CCQ4j4Jg==
X-Received: by 2002:a05:622a:1a9d:b0:4b0:699c:6083 with SMTP id d75a77b69052e-4b0aee3455amr77334781cf.54.1754731617174;
        Sat, 09 Aug 2025 02:26:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca2e9bsm3276386e87.123.2025.08.09.02.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:26:56 -0700 (PDT)
Date: Sat, 9 Aug 2025 12:26:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
Message-ID: <upuv35iaf27dbpr7dwxmmw7qd3ykszh62bbwxltwfexpwzgfvm@qpxeeoiv4zsg>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
 <eb42d052-1fe0-49a2-9a83-05c5a5b7394e@linaro.org>
 <63ce3c8b-51a3-45a7-a40e-330839d7dbf3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63ce3c8b-51a3-45a7-a40e-330839d7dbf3@linaro.org>
X-Proofpoint-GUID: 0pqkRd5Oi-WQaNgova1JCzi2jh1dpKgB
X-Proofpoint-ORIG-GUID: 0pqkRd5Oi-WQaNgova1JCzi2jh1dpKgB
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=68971463 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=rHuCzYw7AAAA:8 a=KKAkSRfTAAAA:8
 a=LMqgvOWI1VrB9Pf8dzIA:9 a=CjuIK1q_8ugA:10 a=ppdfHDQsi44A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=m_JjNGcxB5ZvlCAwQ5hH:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX/hn5X/GzKFwb
 dc/1sX/vvC6QfAtKMmTtbfUwsjKujOcnUq/BnRjQIotaBWR7mFl25Bl7KiDEA3RRtFAHtsIHAWm
 A7ITEb6klUTYXkHgXe9aYgjZ2+wZgalaJiJ9wS0upJwJjLEzY6TauK9Q4McSEJeVxY6NYrJoc+e
 n6llAULBGey8U5BugQmpelRx8RPFpuGmTSw5vJOvkD7x4nrvumQcBthsTLyyA6YTBge5MMSfZsy
 G4yJXGdTQpiOi+6Eebhf1j569aKDk0kCNHIRyDpWQo59BlUmVv+Jml9VuZPhG4icQ5T13FXhqxM
 sbSoBM/3KgwyZ2V8ayQkHhgujTgHuH804gfCS+hWbKtAg4S3jts5sW8X5eR2NBaJOj3i9SdRIk3
 eiq9l76L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036

On Thu, Aug 07, 2025 at 04:07:24PM +0100, Bryan O'Donoghue wrote:
> On 07/08/2025 15:17, Neil Armstrong wrote:
> > > 
> > > https://lore.kernel.org/linux-media/20250711-b4-linux-next-25-03-13-
> > > dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org
> > > 
> > > V2 of the CSIPHY above will incorporate feedback from Neil and
> > > yourself on adding endpoint@ to the PHY however I think we need to
> > > have a conversation about standards compliance at attaching two
> > > sensors to one CSIPHY without VCs or TDM.
> > 
> > The PHY is able to setup 2 lanes as clock and connect 2 sensors over the
> > 5 lanes available, like for example:
> > - lane0: cam0 data0
> > - lane1: cam0 data1
> > - lane2: cam1 data0
> > - lane3: cam1 clk
> > - lane4: cam0 clk
> > 
> > Any lane mapping is compliant. There some Meta slides about that at:
> > https://www.edge-ai-vision.com/wp-content/uploads/2024/09/T2R10_Kumaran-
> > Ayyalluseshagiri-Viswanathan_Meta_2024.pdf slide 13
> 
> Hmm so that would require splitting the CSIPHY between two CSI decoders
> which I'm not sure would work on our hardware, perhaps yes, perhaps no, or
> routing both sensors into the one CSI decoder and then separating the
> data-streams either in the driver or in user-space.

The RB5 board provides exactly this setup on the CSI0. It can be
switched between 4 lanes going to CSI0A and 2 (data) lanes going to
the CSI0A and 1 (data) lane going to the CSI0B connector.

> For such an esoteric setup I think my initial suggestion would be to push it
> into user-space, even assuming you have gotten the PHY to co-operate with
> having two simultaneous clock lanes per the above link.
> 
> Looking at the PHY regs, I guess you can set the bits but obviously the
> analogue component of the PHY can only really operate from the one clock
> lane....
> 
> Interesting.
> 
> ---
> bod
> 
> 

-- 
With best wishes
Dmitry

