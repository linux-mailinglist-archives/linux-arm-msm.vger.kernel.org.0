Return-Path: <linux-arm-msm+bounces-103598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDYVJCOt42lTJwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 18:11:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8BE421886
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 18:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87FFB30103BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 16:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC715309F00;
	Sat, 18 Apr 2026 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDmBt9WM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOZdOUid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A1B3002D1
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776528669; cv=none; b=V34Gy5pTvrgVHygADXiSz+NITXPfufVY/ARBst/hS/RozS+q2DMJaZnswHTbozmFwYQeBDn5BkK+vRIRpSNTY0Sg4Q7prRG04hJ2wTsogukRpjDNPA1Oj5mZFOhIFORT0OfUQB5T91eXYpP93forGcYJCbl4/DUTqSQRwbipo8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776528669; c=relaxed/simple;
	bh=UEnZF331CsgXJwwFeI3HufONJrEKbDvBmT7uOVLUG0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOoehln+qBRUbWX3PdIJHaDie2W34oIDUZXTs9Hjz0bFbQvt9fTOVIwaXP3D5/RIqwia+Qt+2Z6w7pK9p1NR2u1v1y1lJRt3yXC54CWbGLwH+KSzSj71arAVDqbyh5hrXR9dKxAWYTOs3IwfUYcDlC+7KGTmLYUybGzAWywrSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDmBt9WM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOZdOUid; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4mEaT2567696
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FYJXR7Vj/iJOr5VO40dA1IKT
	kKe0B9u9fRBgsMHKSoE=; b=LDmBt9WMbGw9sw/2KlRhymVsKj/mgG40TZDP/8NY
	5JVyk11bzWAjDzWlw9fa4odGrr3KJOVF1mPB2BZ9UO8+b6CBuIj3+N+UoVDYRklT
	A0HVZ75AlqcYJZlI9qyIfaVYwlIkLv758dyG6WUS0qgIfleTyao/3wi0hpZNguCM
	+oU2fUDQe2hpUeSEperQbnImKkcWh2TYVa1jveov17Uu5MdOt3QoDoehRmU+nHuz
	CSPjEPRxYusObVIut1hv2dk5acmkQtcsPmOQYkFiKyN+MAwtLWoijjnQ9tYz1otk
	Q6Oqkz7Zmzdlj+JRy9X1IupD/WLx3TiHXKp4pd/8W37K3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388h0pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:11:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso47804831cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776528666; x=1777133466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FYJXR7Vj/iJOr5VO40dA1IKTkKe0B9u9fRBgsMHKSoE=;
        b=EOZdOUidQGCgh5DgnMchCvQtGrdPSkuNUpXww+zp16KuSHZadF0nGpSUJRp3kemX8c
         vhNugLKLBUn6Sl6zhrCo1No1niQqJ3fopXI1hg93d+bCmLEEjIRcbDec5lCGJTPhQozA
         M/T85pPyC0rZurjdR/sqRc2JphQ+pyBNyPByetQ5KIZW0FejBYZrwQk/MvjPT4+Ba3xu
         VR5jlQjy62Vp8ibGxDk0qMOpKGXbLVXDwXg4mShIdxB09uP7NQjFmHbBukuIT90Jw/CN
         sxc/Rziu5S2qZ3tkM74jiQ9O4qmS5Jq770QGbmou6HSXxGMuq9FiIv7WMyHYUVFf6QVo
         mt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776528666; x=1777133466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYJXR7Vj/iJOr5VO40dA1IKTkKe0B9u9fRBgsMHKSoE=;
        b=RpY73nQNfEor+2ah2mapJx6q2GtL0VyWY28a9V6H83BXC9go88O27dubfPinS2f2rS
         FqSkKE+ntzRduwpPIe97UbW5iSdXfIVnk5KmPShJUnJDqRrc+V/bvC52cfp6dM6E0wa6
         MgdMxi2rDxu0Cumc4SArj6zMBqe1i6HIG0ZqWk7RDqXGpad5xvVHjx1Veb+DOX1CbuZo
         sY7vZAHaw573wHH4QG213TMut7cEkZy7dRCtlp6EF2b+1usEuOv2oohoKJzYsiaol4dz
         7B/z5zcA+X6SpLBY4Ajx+PIIMl70VGop4DOA35m2I9EW4rLPsVzNDlIoAVcPhMkr0DcX
         Fmhw==
X-Forwarded-Encrypted: i=1; AFNElJ9AwLFxaibrCzW8jmro9Odw7anto8EjZdVSFrlSLtn60oBCE4Q9j3BpxJynmm5BBCiE0tz+z1s8ZEudlQKg@vger.kernel.org
X-Gm-Message-State: AOJu0YxsAWEYpe9WcPCcqY9383JjyIqhcbyNqVWwDSH6N3VSo3xx35DV
	kmZslJ1nvyc8XF+TpPl+J4VswLbN1AQzeDSxi95IySGLifHyZwsCEE2xf7mWgIoYOGaKmVv9bpj
	s1uknoxd7xY52osxQZ1RCP7zDmpnkHcIF4IAovB1mgvYNK4OHoP09lJQ7QH3133jEbkEI8SHMgt
	Ns
X-Gm-Gg: AeBDiesN0WIXyySy7KGzHCjY8Jk+NoTHFTk5NNNMn0ihG7Zm6vFBRzHFq6YDGAlqYn6
	l0rEvO6PPBO9UL4JJdS6aAE/ObP2K6PWRmkMeSxQYcgVSPjLsOjyxdbslVOMep07i4v0eKw9P8/
	AI5wYYSo68X9R1gJC640+DXvr8M3iMWHAYKqQvkUGMiGUMZYvZLzSuxbakQk18h2S01iGOyw03Y
	E/grp7+/3VMBpINjBuB0jh77sgqxIq7xcwToLMNRRIO6FXGx1np18Ous071PCayOm7/CoYEue6E
	fna7nuVTrxbiV9zbW2hVV1dNzUCtX2PiU/fQysSt5ciK2tkkS+CUNRGmV2lGmn5/QuVMG531vBE
	0YOm2bG94lSbTSkMEE9UwU/MWQ51q0upTN2RhdQ8oySmq82zCxAqSN3zoOObL/LuRMOyhqA2Kv/
	mCoQ49H/XpI83COPft71qc0GOCsJA/ExM82uqKwpQTJwABsg==
X-Received: by 2002:ac8:7d4e:0:b0:50d:a5e8:39f5 with SMTP id d75a77b69052e-50e36b5bae8mr106235741cf.27.1776528665891;
        Sat, 18 Apr 2026 09:11:05 -0700 (PDT)
X-Received: by 2002:ac8:7d4e:0:b0:50d:a5e8:39f5 with SMTP id d75a77b69052e-50e36b5bae8mr106235441cf.27.1776528665507;
        Sat, 18 Apr 2026 09:11:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c88adsm1464383e87.35.2026.04.18.09.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:11:04 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:11:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Message-ID: <rnpbdbjlpx6wemeuzsm33njmnihhli6mvjzhwu4m64vpgbxait@7pnk2rdt2djk>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
 <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
 <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
 <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e3ad1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=wxLWbCv9AAAA:8
 a=wPxmQtTReXDiQBvha_gA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: g5-p1Y87h18-MBXGZGalBbSzKTOiH-ZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2MSBTYWx0ZWRfX/WWw/ZYRCHwC
 H0vPzAXKmmYLO743uHWKx8v/h4pzrx7w/xWvhKAMbzLsYTMLv+APL01/Gr3yBjyinXI9lJSZhWs
 vRiUXuEztKczHpIY7Kq/8MKvdqTReJCQ0lSjHoBbnzRF3Us5PDLZh898lL5WfH52RdNg+bRconh
 KhF2kLyp6r7mIfA70WM+D0kAulaIrSaMevzYO7DTJfLkvTjfPxmNRPhz0fwIyvZhvgRxWNCzKnJ
 B0kL/HMSSTLCtChanZP0GoOVOAUFxYA49N162JVQ/A1IdbmpV5Kd+G91mg90R5ckVXbRmXJBSjJ
 Kp2xw0nbt/UoQefNi/pjS9xZaCxHHkilZup+Gmym4QJEVTsxSwG+5+t1dY50/mEbPzgKYHNEW5f
 vnbtteX3jU7XTasTkkXkFBYz+C+6aILxWxSlMI9+HLe4VXP6d+uqJA8YovKjT+cuGyFb8yCmkv4
 yl24II5/miRFV/UNOSA==
X-Proofpoint-ORIG-GUID: g5-p1Y87h18-MBXGZGalBbSzKTOiH-ZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180161
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103598-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[smankusors.com,kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A8BE421886
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 03:49:33PM +0200, Konrad Dybcio wrote:
> On 4/15/26 5:20 PM, Antony Kurniawan Soemardi wrote:
> > On 4/14/2026 3:07 PM, Konrad Dybcio wrote:
> >> On 4/14/26 10:06 AM, Konrad Dybcio wrote:
> >>> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> >>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> >>>>
> >>>> msm8960 uses the same clock descriptor as apq8064 but lacked the
> >>>
> >>> This doesn't quite seem to be the case, some fields differ and
> >>> apq8064 additionally has:
> >>>
> >>> QCOM_RPM_PM8821_SMPS1
> >>> QCOM_RPM_PM8821_SMPS2
> >>> QCOM_RPM_PM8821_LDO1
> >>> QCOM_RPM_VDDMIN_GPIO
> >>
> >> Ah hmm, the MFD driver seems to provide *all* RPM resources..
> > 
> > What I meant by "clock descriptor" in the commit message was
> > specifically the subset corresponding to RPM managed clocks. From what I
> > can tell based on downstream code, msm8960 and apq8064 seem to share the
> > same set of RPM clocks, even though the overall resource lists differ.
> > 
> > Is that understanding correct?
> 
> If that's struct msm_rpm_map_data on msm-3.x, then I see that 8x60 has:
> 
> +MSM_RPM_MAP(PLL_4, PLL_4, 1),
> +MSM_RPM_MAP(SMI_CLK, SMI_CLK, 1),
> 
> While 8960 has:
> -MSM_RPM_MAP(QDSS_CLK, QDSS_CLK, 1),

You are comparing 8x60 to 8960, while it should be 8960 to 8064.

I see that there are differences, but the QDSS is the same.

-- 
With best wishes
Dmitry

