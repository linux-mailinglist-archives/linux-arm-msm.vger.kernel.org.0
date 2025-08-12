Return-Path: <linux-arm-msm+bounces-68750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FD4B2251E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C5E43B05B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B501F0995;
	Tue, 12 Aug 2025 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqQ5FNNm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B4D1C1AB4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996420; cv=none; b=txj1ood0GyBSJvJNkIQQ164WR0sv9ymJfDMXLrPlG4VxDYKDGj++p2xAdH6WIBJYPgcobVe0Ilt3Ru3CdXv8RROdsCHk4fAxEeU258oK7O2aEXow6yaLRe155fT/g/sAEsnExO3qYYQQ+KD7+brgORRZ134xkCcrnv6Gp+WeqHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996420; c=relaxed/simple;
	bh=877/LB5hEo/Tk9VjW20Rf7ElmChEz02j8+kgdbdRLfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/mtWZaJ8fFwlr1VL/pi2FEl0wGihmActipgWNSbz3SJ78N7uh1u3P1FrHY4o8aDN7NuBODaw/HvDALEKRAbR+N19j/Rtp9y8rByddOrCKTBjEfJsfOv9qZpOl1SlWY3oIRYQeOpImSvBMh7UxVJajpLD/lMTOOfv16oPukfrvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqQ5FNNm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvf16020372
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sYKDUmKgY/cIJ0QE0wtE6aKD
	wx9772ZZbTFluaBLWww=; b=XqQ5FNNm79lXCGW/dPVpAB6D+LmJrWVxIt1U7E/w
	aVUPj3yAo4UP3Hcq3mT0ZJMVA8fRvTxBI55A4Kb5wIOJAvAK5bEHWvHvs/3CMUhf
	oBT99kZguGZSVfPH6j3ozAgr8SrcNK7zB11f8pk61h2kXArlmi5HYdrHHKNShZka
	ThzEuEwuq2nafEGxfrv5Tw7hHvH8RRfb297BsWnoNfnkyE8TeZAHbdKvB3s1RETM
	3AlLzrZ5uA1KTO9C7L1S8wAjRlY1xqvUbkAZVXkL5kAsrYBuuesYIve8acEH95w4
	rXQ/q+resU+MtiY5w7oUZqgJ9ru5g/IlbbF4Rg9qXXxQRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx6104-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 11:00:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b0ca325530so18794841cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754996410; x=1755601210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYKDUmKgY/cIJ0QE0wtE6aKDwx9772ZZbTFluaBLWww=;
        b=iD8Sii/EmAdO7CSuH6RQM+yhws6vmJ5T4vAzhN5pEGau34syyzTm5zgSS50BxzhQbm
         WIypq2McD8ybMlEpH+ZfWc+apIvNSY5XxgPFHaljPsPAh6LORE0PniZrNhR8fBXxBVqh
         pSIFDj2Zo5uzQQSXoRAI3EAaubAGGCauXq+UqjJxXFmJDqPz5bbjizVvJaJGCm/UFBwe
         X2ejDDd6LkzrCngmy8cuFR3GwRFgumo9vKMjJKYS5USGerj+505ecQp0pG3dFPnZb/0/
         uBd8/MKVzAsWQHFy79aPiE+PqB2eU1j9LJi2sBp0IJoxvi2W4IjM5S6CvSXuihYljWRz
         Yqng==
X-Forwarded-Encrypted: i=1; AJvYcCU83opO9ZSaxKMUksrTewhje2uxhmQNnN8wriEAkWPZsorRieRojujvW6aOsKZvk6it/vKk7khyPj7s0fRd@vger.kernel.org
X-Gm-Message-State: AOJu0YyKSFn2iUA9UHNU2n7yy2i8me4HXhhkuSqvOsV2/LFtIwhvMFKA
	xzINJESGKlrnnYj9uF3rVDznswFixnMP3M5PkyykLNRLCtys1MZTizZ/o/NekQubK8C9B95TErk
	KlcED/TDv9qp4ZtDg9mipttuowWsY4A0+fpM/3Dw0zzoyXAnmek2XP1sKlmXhj26LJW+G8dvWIq
	yP
X-Gm-Gg: ASbGncuKBdXihhwjeFInA4RpzHCTtEVn/qE6eGj+oCCV96oapHyGUM1zXDM/l6K781J
	Gp4s9FSLZlOheHrdT1OHzjEF+GWDS7ek73U4aDH4YT6YIq800oZqY18BWtgnS70Mn6QTJY3eKak
	M3xsMji6iOCUiCkO6xLEbwghNamIwva4izj3+dV7AfimW90WbnU9bb/4GpSfHW/2qh+0rmyK9K9
	yXRrqSivJuheGYqBUIIGNQC7F/rnDPC9jowPfqQ2lOgWqeOjNemLS2BfqEzFLSZErBigok1tocm
	4MixIGV7HFbH1sB23/Sg9hBJzpRQzio5QTsYLdl0sJ614MOkx2B7RCllfoc5tdUgxwBzIzVJSQv
	vw843DYClbN0FbaOX1LoBUniqx9pXAaKBze7coxZJGyOTjDPHqpNw
X-Received: by 2002:ac8:5a41:0:b0:4b0:9dd8:724e with SMTP id d75a77b69052e-4b0aed424f7mr182024951cf.20.1754996409893;
        Tue, 12 Aug 2025 04:00:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK+PS2Km6eFiBdg8brjdDEzx18v2Lf6FOZGJ4lOZ/y8LWgI14SjtnyDV1G/jfYIdki6K5MAw==
X-Received: by 2002:ac8:5a41:0:b0:4b0:9dd8:724e with SMTP id d75a77b69052e-4b0aed424f7mr182024401cf.20.1754996409157;
        Tue, 12 Aug 2025 04:00:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8949e698sm4863138e87.72.2025.08.12.04.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 04:00:08 -0700 (PDT)
Date: Tue, 12 Aug 2025 14:00:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] arm64: dts: qcom: sm8750-mtp: Add WiFi and
 Bluetooth
Message-ID: <ibitgekdjsktpvr6zmouuhgzcbfjfeuv4l4zsl6vszv4hauug5@one6zo6gdykb>
References: <20250811131055.154233-2-krzysztof.kozlowski@linaro.org>
 <l6u4y3suv3dpylexbiiznhcuyanlc4ouizhzj2cchblaf6o4wg@fe4laxrioaj5>
 <481985cb-fa84-4b09-9b95-948ee70b557a@linaro.org>
 <k7mw7rj7cno3con2t57nps23y7evd3da6gahyl5gnrxss7e3s4@qncnuekxr7lb>
 <f7704cc1-95b4-4860-86ea-96ec18f61c8a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7704cc1-95b4-4860-86ea-96ec18f61c8a@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX+cwWhX+2BPrq
 E3+lsbFJRKc47k/tEbklaUmQS1g5OVTvwlDqUtxJvP7BP1hhEDulz/GLF9KrUKQYoXiDdvEYI89
 D3b1TZKxiom3t2W+WOVLn6uOUB3B4LKRhZtqI+VJhmBK41RFNlgxQXeOwtRcaGExjuQ/7EDnet9
 pIhNo/p2CLsw3EBipwBaKUSd6xpL1lnkSjE/AlPBygrcmM0tCqJBiMcUvRie2xnVdAsrMJJ5Dt2
 Aibs+SgdKbj7mTnZpLh0n+x/2xaB56/B5VF9knwPFXk91I1Id/griHgI5EFJvE1yjulWHUHsIBc
 FbPtBlmZ1NxLfp667fiqkMqz1QMLVqKudmovXez6NmEZaVSXYzDPSE+QuvCxtrtjVr9mEHspdo8
 7Yi3Q4Vd
X-Proofpoint-GUID: E9ve1Vj3lByt98ryQhbXqjPcQqiat4Nz
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b1ec1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=lbISek1RY3kVFRfJcvkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: E9ve1Vj3lByt98ryQhbXqjPcQqiat4Nz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On Mon, Aug 11, 2025 at 04:40:09PM +0200, Krzysztof Kozlowski wrote:
> On 11/08/2025 16:33, Dmitry Baryshkov wrote:
> > On Mon, Aug 11, 2025 at 04:25:47PM +0200, Krzysztof Kozlowski wrote:
> >> On 11/08/2025 16:22, Dmitry Baryshkov wrote:
> >>> On Mon, Aug 11, 2025 at 03:10:56PM +0200, Krzysztof Kozlowski wrote:
> >>>> MTP8750 rev 2.0 (power grid v8) boards come as two different variants
> >>>> with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
> >>>> supported by the kernel, but WCN786x is not.  Both of the board variants
> >>>> are considered newest revisions and the difference is only in MCN
> >>>> numbers and internal codenames.
> >>>
> >>> Are they soldered on board, installed via add-on cards or installed via
> >>> M.2 slot?
> >>
> >> This is MTP, so same answer as other MTPs - these are replaceable parts,
> >> just like you can replace display or modem.
> >>
> >>>
> >>> Are they going to be somewhat compatible (e.g. on the BT side?)
> >>
> >> No clue, you need to ask Qualcomm people - it's their hardware.
> > 
> > And you (hopefully) have access to the docs.
> 
> 
> No, fought with that for 1 year, got some basic docs only. It is very
> difficult to get any access to these docs. I assume you mean the MTP board.
> 
> If you mean Bluetooth or WiFi - I have 0 access there.

I mean WiFi / BT. Then you can ask Jeff or a corresponding BT maintainer
to provide necessary details. You make it sound as if you are not a part
of the system. You are. You can talk to necessary people within
Qualcomm.

-- 
With best wishes
Dmitry

