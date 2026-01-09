Return-Path: <linux-arm-msm+bounces-88295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2347AD0AC29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 15:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A645D3062916
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 14:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98E62D7DF3;
	Fri,  9 Jan 2026 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtZzburk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwQXO0sv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32753225408
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970492; cv=none; b=K/DcngM4H0BMMF7ZCzDWuP7ia4PAmktAJvu7mGNps4zuNCVLgVzJypzsHeQIrIF5HFqCjJpxalPvscbMjGa6oyFmHn1nmhInLdz1gPb4nJn6kblEKPTzqHZ+d4FZ2TuMS4IbMxCEEw7/2hUgsLG14+jJk7yeTZX3QY44RoxjmkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970492; c=relaxed/simple;
	bh=65HpubQvtgAVaKpRXIeI4MXqmukhMqeIic/gbTAZ+TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rc8mtHtwjuv2JseUfH9jvcIWsa+6Zc7qrYYP/oQDPztB8B7D3JJBByupOM03uZJ1JpdOB7LpOpdMRvcHBmZkg8exysA14FwHB1v3H3cFUbnvmCm19gKmHKS+QGwJWtrbcXRT16kyto3QketmyR+n0p5/YCOfPHRYaWgB9ifgEvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtZzburk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwQXO0sv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609ENgs43142604
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 14:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DbXG0aasXPGUnGXDYTML4NN/
	NB/Ii+CH8gVFuOhg7CY=; b=JtZzburk3BD4wZ/ArRr7Vp+iFrllvjWgKHFWk7Bl
	r3DA1PWYCuLWtTbMGYBFIbFvoiAxMhDcf1HsZe+Q2LEoSbhsWKzW0o9aSK4lQMSH
	k7MZmR+k6LPDL79JawYXvQSyiZYLu++ojjqgutOnV/QsnCSLjJJCbn7Nuf18cbAe
	8IQWJWZvTw8RcCpUyd0V/xxt8D7fA/lHqv1puUCveDk3rhTMgSeefVzrCmAc457R
	ths9qcISzoI/gCS/s5B/chzG1hr1Z+aZHYt2VkoBv6DYBQwXya188zsnth/VUbKM
	3neFEkLIvHsSMXi4fhFBR2Kkv2tjv6CPWwIg+cyBySfm4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j30hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 14:54:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bc4493d315so1027835785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 06:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767970489; x=1768575289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DbXG0aasXPGUnGXDYTML4NN/NB/Ii+CH8gVFuOhg7CY=;
        b=EwQXO0sv0PJp2q18A95EhN6ljKwaa+ANe8yEjRMnt5S7jjtBW7btSl90rt7g35VijN
         YZ3j9pSI/t/PSWmxvPgaCuN51F9zqcZa11bzguOZD1jbfk8PIRWQSEjxTOqA8ZjhnnPq
         MdD1mrzobIvt1d21JYEIT5HRKp0YpRGtHXdLpFbAEiP+3ObFbnlyruYNrbsj8UXhXyHO
         79A7gzVA2GE06OKfdI1JUxvclQOSwRoDTb46UFWhA3f9D+7fj/q8iDYs2gFIk0jTSrkA
         3HRcrqXpMnwdtZs0Kl/PM0b+JfMDiJiNGVi4aq3NhyPrJysRTQwmgOfLdhOvD/l4EscP
         0feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970489; x=1768575289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbXG0aasXPGUnGXDYTML4NN/NB/Ii+CH8gVFuOhg7CY=;
        b=jegwpsOp9wPE3tSUBvh32sY6SseH9R7RvP8a3lkJTa479z9UHL70xZflFp26GlGKeV
         MGr5jITcpGGtXvryJp6Cf5LILAdDk1Vb3vvpHCkZ771fsiwu3/iWbrfCLOpIFgq5rrkR
         63B4C0YDYjp7Ebl0qWNrz7H0pu5bSdwceQ9q6MzMQBh6VX/9HMeelusHVue9aoB6IL6T
         TSeqtLCez2A2nQAq8S6Aju6Y6S61XHw/dHcDSjPUKNRGx7ohlwYPQvy11LiLAuEngSi7
         kbgt5sOJfbNLcwwHk0/JVxif9TV10BBWwu7GNRGKpHUJyvsh1hoHGnK/SRS1GRBQsCMT
         rCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP4Cyjq+zcAtmIFeFwfJfRz9oCHWyHVg5upIE2lXFJfZRlwr+AQdM1jibn9nIBAjs05pK3zatBML2sM+FR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5k6lT8VwRgp7u2yq08Cf4Do+lqtiWeNKL5r9o7nZ53mYB46zL
	aJqLJPl/XXTxNpDs/WPj2uODESQ8G03nu3ktam7w6B7HgCEzyMzRkpt/ucc1JBH3rYaHpAVFPDe
	qjH7Z783g9QinObOH72X5lRGyTMlZ5tLtubCBQwn3+A7XJvsNu5nUizRmgKo59Q9SksyM
X-Gm-Gg: AY/fxX7q/QP3dC6erfzv8o5BLfKIO5GKoF3lk4y0wwsTiGEQWlgnJHZQSjDcXkl+SMs
	3PpD64Drfkg3kMF3jIOg0w9q2QU+4i/8OQiZaOfdPFzn6mnym92fNoyj5rAfKft2FtvoK/UbD4L
	Tpn3DbpsrDrDOXDD6qaeJeqIP5nINpSPNThZuLKUaysaLninx+k2W27yAcMw1G6BYyY0Zp6BAEh
	5rahrmR+8C2qEgI0DR6IeAg3vBqLwnCh57nBTIDURSxB7BwQZ/hkwogC5rRLV6TVz13z6o43IUC
	VQtgwY1reKQHNZkp0cxgFl+odk2laHMr3jjGqnEvFk+9CyYCAN62rYwgxNR/vaRXwooaCtzwZzl
	xD8WXi7QbpXeIx/Bw2WCf+gBHcYLCYmLaMY8iOrwnJZH9bbt3f/2S7v/jUop7dtJDJtQcQK4Myf
	YQBWVk+tVMZdZOI5odl+rzwq4=
X-Received: by 2002:a05:620a:4053:b0:8b2:9d6a:fb28 with SMTP id af79cd13be357-8c3894165b9mr1102758485a.82.1767970489380;
        Fri, 09 Jan 2026 06:54:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6JIVifjuxZ5bV+Yldq4m6ba2GmCDPmvlSe6V5Yo+jKfZB3inIPMHeSvgssKve17SchnYfYw==
X-Received: by 2002:a05:620a:4053:b0:8b2:9d6a:fb28 with SMTP id af79cd13be357-8c3894165b9mr1102755285a.82.1767970488869;
        Fri, 09 Jan 2026 06:54:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382fa2c6711sm17860281fa.42.2026.01.09.06.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:54:48 -0800 (PST)
Date: Fri, 9 Jan 2026 16:54:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: Add LPASS LPI TLMM
Message-ID: <mmxdlkfhrrucqfjaq7wtuwp3u37ukgcejwzxpy6omqfd6osght@hyy5dsnku3oa>
References: <20260109-qcom-sdm660-lpass-lpi-dts-v1-1-d3eb84f10a39@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-qcom-sdm660-lpass-lpi-dts-v1-1-d3eb84f10a39@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExMSBTYWx0ZWRfX55UfA0VYqYpy
 Qyf/UHrxyS/zI+6J4JyfIE++2idNh6nS1lpI8BoatrO/ovptDha5KDYxaq+6MeoZ+kcW46KnsPO
 M1P8GhlO3Dexp4/T4ckLBOqCs+LCPm38UBAk4t5sf4rzLVaEdT8SeL/ACGBILqhuCMWc6a2a1za
 QiYmLbXjiH4ErtP68mlxTVLY07lxuBUHgmW/B6vkIlfiXSrexEntDGNxIZ9VCyvWpRr0hJQLWoO
 6co8RKgRTPALf/MxkcZiFFZovbpGvQ3OSxeaovj3yK8DZE0FqEizDctRVOWwiJpiGMlpZEu4v17
 BtMfbKXBS1mVnK4vT0t2NrG0gKrxMMF3ybN8Rah+0rkJW6I7RH49tuVkMuJiHi4rBjQEOEfsYn6
 2rsSypitf4NDbsMoF5iPzTMNM+UmdGu6ObTazTuKrkxTiABO9puKXyAMPViPH+gaoMaHBNm9XD9
 7ocKjGInNymx7a3Kgmg==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696116ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=lg0203pJCZQmgAnDPmMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 5Oxi4yAJtQIzIvP5VRYCAwFqPHoVzrWP
X-Proofpoint-ORIG-GUID: 5Oxi4yAJtQIzIvP5VRYCAwFqPHoVzrWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090111

On Fri, Jan 09, 2026 at 05:03:59PM +0300, Nickolay Goppen wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The LPASS LPI TLMM pin controller controls pins for use by the analog
> and digital codecs, such as the PDM bus, the digital microphone pins,
> and the compander pins. Add it to support the codecs.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Co-developed-by: Nickolay Goppen <setotau@mainlining.org>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
> This is a patch introducing support SDM660 LPASS LPI driver support in
> the dts
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 73 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

