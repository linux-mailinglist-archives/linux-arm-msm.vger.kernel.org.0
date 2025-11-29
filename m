Return-Path: <linux-arm-msm+bounces-83816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C94C93612
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 02:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 14C6434A192
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 01:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DF81D47B4;
	Sat, 29 Nov 2025 01:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJsFdQlj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qxf1piQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726FD137930
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764379966; cv=none; b=Hn5n537q8qXcsZU6+ik8sDpqOiTnNVPnYSrfWscXbjA7ddcpZYydkSlcZO5jZgYnY/sBExBnz7dQkdTWLmiHdVPljFdpXCn1XBV1Scz+9xk7WG+QF5QAZS2oSA7JmSULLVwELcqS1DsB4Nm8dGaHeGXZshmnOuYjguR7fl7D2AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764379966; c=relaxed/simple;
	bh=zvIjdznBdu1ZZVzjsvnLy93MnhNu63QJrHUu9sii3Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuV2jewvdMLHsPJW7MV2OP1Ncqt4jhhYHjk4QB/M7M6aVzDVxaifDjNftQ27e8BEDAwN7SRkUMJxo+2qc46tJGhyPMD6mFb2bjGHonMvoE/K3hzDxeJCnnI9be0zLMZcmz9qeDotQ/CSDakBoDw6RZP5wLHMdrGQ4Pn2kkTqJkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJsFdQlj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qxf1piQc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASNF4rQ1195786
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hoSEq3IHmBLFm4CC3oj+c91u
	/X8tntw/x0t/GIsqQlk=; b=UJsFdQljQDOSVV9fkaprFQ8pxVhmavhJahyuIPCU
	eaHvQLtdxLm6kbwvAxGMCM7GNmg6b4biFyJEwNFk4rwmJMZVRJou7r8Ccg3bnnfS
	9Rh6CyyCZMYa7tvwuk3tQsAm6f6KIzMQfgJFZ8dW+Yo/U4i/GhirWSIe7FhpGhAx
	0Mplsq+/sOHP6Lrav3faax3Nzf3/DCs2fwO42QimyMXiF/z2CfedI98SU11XY6jW
	ic4mQzfeBe8XFKVqxMJvvawJLUn+2efBeOiJqgrSejQqYOcJqO1LM7gM6kX45JYb
	FlRoapGy3DP4HpllcSAC4FzLxOdiuq2V+k8uVmnjyJKaIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqbd29fge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:32:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-880444afa2cso27617026d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 17:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764379963; x=1764984763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hoSEq3IHmBLFm4CC3oj+c91u/X8tntw/x0t/GIsqQlk=;
        b=Qxf1piQcrJxrnpStRHRTuZrg5i/ScR/C+KobfGrJ20Zllshs3vvkSMGMR1cn6G57PF
         UC47mnwpYeds3Rj/W0eOM+I03N2q89F6t6BPadWOsS8/ANi5tIw2mGbOVQyfk1kepV1c
         FtFWfMV9uDh9EtUL29CWl3kMcmRXlGUaPEz/5GDmMtxxD5hfEBQQIqZdoetRJ2uOx6du
         bYuThXSXhxnJMkOg7TQ3c7PK9iNUX48Y1b58vAauGlj1mKq/YEkY1xVnrnhjnCmanqOo
         ZKhtzONBgkrfeTm2Bz2yH3a4n+sgrnqelSlqzc7bKmzyN71+cOVooSvbF6lWW/eSCcfv
         mP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764379963; x=1764984763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoSEq3IHmBLFm4CC3oj+c91u/X8tntw/x0t/GIsqQlk=;
        b=k9WJjlkGeYkAErv15fxH7gevzXbtb43MBG7XZ7In8esrBfOEcOA78nHWZiJ5ON5mxZ
         QhKvicPXgu38oiqwwpsVO6fARsax1LbrK9j7ADinmZ4agaqM0torh1nUY8ol8TbFAceS
         X6kh4HdT0/H6qXAIIFjrhlhwp2yBxx8pGhbH5L/OMh26p6gLYRlL5txtPIJhd5qYh6jw
         pg0tuwMXoB0nyEllSuwrLpCmtnOmMMmEu9+X266x38yDhjxMvF2Zu2qxETPDA+e4+Bk2
         KsIkWrXajUWk9meJqQRnek4MjmeycgZEcecU/IMCOE+NegtHKsdpc1wR5/tgUqz++37d
         KERg==
X-Forwarded-Encrypted: i=1; AJvYcCWigLGqD3NB1o+XM6AjCKrRqJjja+KDrZhQdmZRrXJj5qcYx2eSgyxsGH0Sf71yE+iHfrnSzvasncCcX7pa@vger.kernel.org
X-Gm-Message-State: AOJu0YyidUdBsH+k/YhkvbrkI2eC4FWYq3DSurfaGh1IsJL1WyVagqkM
	TUjmFCGrTu2ebgFxmuz0nYNBeIQak++Z+s2o2AV8t66qZh14OVvsv9MhYY2bvzhrLg/Fh4uTKWa
	cfyTYZsDQoyoD53Ed8E1G5dAJ5oawU+gqHS3luYAPjDqQylEGQtCdFJrG+mu2mc8mS9Kb
X-Gm-Gg: ASbGncuZhHHmxEdeYqN6Yb8++pbzhnqfuEWNx1zhir4rX3vRVoRrJJTF4pFqE0kinkg
	Qm7PtVwe/PxOSyP8eP0njLTPAMt8M7/HbNJCrjVmIbUEs1FF+0avYDJUpRnptSknGUTnWtukbYm
	iy1pZSiPOzrZp2GhCUV/CALFmdHWNu/GMHwnnl1o9lehipad+oXKC5bmuHGU9cZd2PFBt9hbzVf
	sDeuHrAbWDgJp3zRe7f99kKsRoHfT46EARGw6tL6GoGXdJ9hH5wgnDAztPICpucD4kzKESKZPRS
	f4De8s8FLmSbORR2hwl5ub2ahlqJrzmy3G2zR+i4irq9T9NtZOsoyOa7NPVP7eTXYP+mt2vKcgn
	qPY+38cmpZe/2ZPrsZxOI+Xcjn9OwOZfPddqiL1qsf3htJj1/3BJo9FpsL9e2LoHxeS3uHu5+aW
	mRRjynA1RtbbEGvhzk04QE/T4=
X-Received: by 2002:a05:620a:7104:b0:8b2:6606:edaf with SMTP id af79cd13be357-8b4ebd6a937mr2432840985a.37.1764379962583;
        Fri, 28 Nov 2025 17:32:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWvzdzE7YyN6oTLZfh4hy4cQzmISW9HLizlmpd+yym5WgSYJDQxP4XBIZvwg4EwDFqE4o/Mg==
X-Received: by 2002:a05:620a:7104:b0:8b2:6606:edaf with SMTP id af79cd13be357-8b4ebd6a937mr2432838785a.37.1764379962103;
        Fri, 28 Nov 2025 17:32:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b0565sm1584882e87.32.2025.11.28.17.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 17:32:41 -0800 (PST)
Date: Sat, 29 Nov 2025 03:32:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] arm64: dts: qcom: lemans-evk: Add OTG support for
 primary USB controller
Message-ID: <fn6xeubhprujdz4gaeh5edpuy4rsgnjxne23g5vsexmbb5ycxq@pajui632powh>
References: <20251128102507.3206169-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128102507.3206169-1-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=692a4d3b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rGjjdaST-h-79XUvT8oA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: v6YedB-28OD7Nw1Eu5Bp4rQyME9UgoPH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAxMCBTYWx0ZWRfX3sidf8sJACYu
 q4qYCWd1Zph/GrU8K8P8cdteYsIdxcnFogr1sYN2eU0A0fKUEdT34oX5qmt0aCx/a/2MJmYrvP5
 Rip24+O0OXIP1k/yFzQdsylal6acONx8ntP5DG/VKJVz6YKSy1Yunz5yygrp3jfp8HpnYoiTA1S
 WUTp+KcbCce40hTvxQhnk8/Sc4n5/Ld/H+quYsg3Q53/YONUjxFFN/PDQqimb5VynAgTCh/Kf/h
 F7Uwib9G90xTFjne8EjIMGmMX+Z2IIEibxDmBkIflsHfyGeYC9ZyB8CkrtKY560eDD+jXDgtMEb
 oG283jbqck+ajuezqwefz1a+NRyKZ2EH5KKLxK3wN1iIiXeG936w5ctVTf1lQNIlPUm1HCVprpV
 /zKnF/SvAghEVo8aB8q+nxD2tqa+Ag==
X-Proofpoint-GUID: v6YedB-28OD7Nw1Eu5Bp4rQyME9UgoPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290010

On Fri, Nov 28, 2025 at 03:55:07PM +0530, Krishna Kurapati wrote:
> Enable OTG support for primary USB controller on EVK Platform. Add
> HD3SS3220 Type-C port controller present between Type-C port and SoC
> that provides role switch notifications to controller.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v7:
> - Renamed hd3ss3220@67 to usb-typec@67
> - Compile tested since its only node name change
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

