Return-Path: <linux-arm-msm+bounces-82847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DF1C7926E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6200434A46D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C15F343D71;
	Fri, 21 Nov 2025 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2KN3cvp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMdR+f8o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D61533E34E
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763730681; cv=none; b=OPwRVvBFKdOdb21Xxk40rEyep8m5dmUII8bwDVjTM7y+3p5tTG8TpcCp1aI0rsS3mh4PuCXCJlLu2pfDz9JYM24ToL0QTQM6rZ+STep5gruVkP8hfqcKuqM0zxMCA6hNxeH3ZKRJp1LEi1Iu/6J0dajOc42OxqKV96lKL/dJzJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763730681; c=relaxed/simple;
	bh=1lTijskp9+Z5rD21dC5C7i96wfqr65644kYWsfFGAGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jp/HjhQU4ndkOZIsUPmYccllRYcTTT7Y9PozaCu4F7UZUdqZUJa/W4TPTSsm8G2t2J7KF5lkqU9Duz9FpmgS29ijTA0q3lC753AvH0v3qzxkaFddkjocQx5fxokkKb2rbJqz53jrHY+L/hhsbuIyRgqJ4XLmvd1iUiIqs9YgUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2KN3cvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMdR+f8o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL7qrSN1390836
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BYy2kQw2rfOuxsttFwc2/pXTNz+kGCGAVHuOX7BZezc=; b=C2KN3cvpfpcVuwJ7
	h1J+vH2NFPNy4SkliyS8kZCocV00s9XV7OXMrb2XZXGPWJVQLx/RfUaMyudUyn5o
	RDQP1VmcCzbaV8hg+F/dzEsMwVcLZ/qBNrQh5JSkSiGlZ1g5KErLgC4ztUUBm1uV
	72yZUQZd1W7rxKMYxnn5h8IRAqSgsyzqKVEWq/AO8DSsJ7ghwabeViF40yxO6yBJ
	vwHddmYK4783L41HFNdeila9U04dR0umQ2354Lh5rm/3X4Ul/0obFooDIHWrvcgP
	36Ci2AjAkqNuezAS3n+UcAmZT2pIW/xfl/eDd6Q8Tk74JbTb/pFwuJDpkhM6ORMV
	5+ChlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb532jks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:11:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b23a64f334so531337885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 05:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763730677; x=1764335477; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BYy2kQw2rfOuxsttFwc2/pXTNz+kGCGAVHuOX7BZezc=;
        b=MMdR+f8o2n+PMhpetXC+u+GqAFx1os7QwLiYD81a5oLBTq5j9PRCtMohbkAIHFHTRC
         +SCqaerkbWIxTi11lrNLtH4SR/QbG0C+yFGCcfBi4siwYwigZ/SNblLV1/cWZzj8NAcH
         nWxVCKBtDHbZtHmZgYfdwSDTNBqnlTkygjpCSpzkGhDLlK55+DY4OMU0u7hjDQnzXS+a
         97GsLV30CORY7SeSaHhDNctFsBRD4s0m8cJ+oxkWmqAPZe/3f2hEGrSTEztbiL6S3NZL
         pg7gm7LMmTUMGk7yIgW2cUXs2qsqSOAgbkr87XysAb+y+QWJpHzOuy8Bmg7FZqbNB0j4
         Cn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763730677; x=1764335477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYy2kQw2rfOuxsttFwc2/pXTNz+kGCGAVHuOX7BZezc=;
        b=H5Ra7NuKrG9VtN3mI394m9qc2Ldj5LIxEYSNTCok1ebP8LV5FYJvmW1JRR0BLDCehg
         pShj4Vm0+e8blLqUfsif71YbPYHcnNGwFlpMJkfORm9O5RxZooGaJ8AqRvqx9E8qML2k
         rQA2RzJY0/XfIBkZdrOanIqSyDC2B9V2XYOHXW2Pk21p08OBmvCc06sryk3EKRzuyAFS
         14R6WU5mOilMYkffbnYkDoiMn3hvAuarkE/8LdScoZFLmfWP9pm/kW3fjMgSwHfgDcDX
         DtBEaFIJ6ROSskdn9xrmV5Gd9FyQz4SLtT143/UYcSHBOYwU8bboTH1K/8l0tkziKO2q
         t2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlmJ3fjwdVAu6hQMSCcb45eYSS7A5H6QIIH4UfXMGoojKsqaScgt+hk32C629Xacpj8kLVAAha/hHE2rpC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7e8n8BSgbFGUTun2o+Vla0OLPhTPXPpcwEz3LItwWfYEnlSN6
	yFgvg/dYiykwoGenBGdjXIdoiK3AqgnvKTEfhZWEneddZYIuOulu/SNExovCWZH4prf2CM5d31L
	9JbxxGHKkNg+WUCa2y6xlg+GCWfrGPrSC3cVj3crHUGe8pCtkLqy0yE+ok3cTnrYvK65f
X-Gm-Gg: ASbGncvOVWCyMeca/SqN2w35q6USg07fHr4Xtig44HMNA+pjxivuDsLAmcl4AyrxZXu
	DXnloqMuIOVVuJl9ZqPgoWoNJXmBbWDL0ZiH3JcHbr1XX/L7CV1HhJj0AxAzvaCpr0QZesr0xdT
	AreDpUkUiShOFMl/RsfAW82G6iq7V8MmKJPV2OZAN4N5CRhN/KfKfXbOJkOLyNP4cqqn2LzaHea
	egc1KmKx7b+anEGAnGDH+dlqXogljXifMurVeMXbyMhcan7VbwDH/ZRpc1x25YK3SXZ3aRSaQSk
	unc3WF9bbqmE6iDzszx3RgCyYPZO863IvcYzbl9Jr7TDbgpFkinsP1OraLXr8nYxd/XkvsJLdJ5
	izzbR8eow29Ay57ag1f58ok3qHjeFBouTSiImkisPXYckfL3+J0edmGJmfh1eQZm/hb6T32TsVy
	O0F2ah+Iw3w0tJP4HnviLIRXg=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b33d210524mr213656085a.38.1763730677454;
        Fri, 21 Nov 2025 05:11:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpzUtTh/9dZw4mq0FPQDe3bbDxRD/Xd4X7XwVazYfAQDqIcRYqRmbX6vhT/6BS43dyZzE7OQ==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b33d210524mr213650485a.38.1763730676923;
        Fri, 21 Nov 2025 05:11:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b63acbsm11110301fa.21.2025.11.21.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:11:16 -0800 (PST)
Date: Fri, 21 Nov 2025 15:11:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rudraksha Gupta <guptarud@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8960: expressatt: Add Magnetometer
Message-ID: <5clxuhy7tprkfxkonzmucfm3d74brk37zjw7lbdj3m2kqail6z@gjoy4pdtaotw>
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
 <20251119-expressatt_nfc_accel_magn_light-v1-3-636f16f05cf4@gmail.com>
 <161da2d4-3306-4251-addb-cc9822a112c0@oss.qualcomm.com>
 <573b2293-7b39-4c68-a51b-ecd5b62b0ec1@gmail.com>
 <340f121f-e217-40fd-9a84-68896d15fa65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <340f121f-e217-40fd-9a84-68896d15fa65@oss.qualcomm.com>
X-Proofpoint-GUID: CYz4LDP1NyW3pZxnKIJjS8RbXIOXqlkv
X-Proofpoint-ORIG-GUID: CYz4LDP1NyW3pZxnKIJjS8RbXIOXqlkv
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=692064f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=2dWhQ9a6AAAA:20 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=rlwsiYw20X8JTfAuXFQA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5NyBTYWx0ZWRfX2g9Gs14Qofun
 dbr3ydhv9jhe0C85Q7sVSc0ralNQY1CgJsH4wVySVCHEjWJkULTWal4bzigFINk8qd6p9wDdMCo
 Cq3DpP0m0nSX8U7AoCSPa/HrADz9KU/rcix6iC1ouWO+zgvVZ94UZWqJL6ZO7vy7UG+Eey+eyVK
 9FjSWvNP3b0f7xeA5yJ1RFpfk7y3bh2m02ycQOoo77tiqRmZAwnGx8nbSFyhpYtVc6MU239OzKI
 Z8tyiBTyosurs475F+u34KLnb+hMfRSP8dtppgk52pEY3R6D7XwhDuTIf9lI7iqbFbN+ga6pK0O
 Uc1AEO19AOI2n0DdyZQWnKj6kCdH5YoNsf/EpogW7zke5pfCyAbTtPpBVC4gIjmXUGDm1SGs9NK
 h6He6M+E8h+7qU6Iry+Nj7nthKQ9qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210097

On Fri, Nov 21, 2025 at 01:54:22PM +0100, Konrad Dybcio wrote:
> On 11/21/25 12:35 PM, Rudraksha Gupta wrote:
> >>> +        iovdd-supply = <&pm8921_lvs4>;
> >>> +
> >>> +        // TODO: Figure out Mount Matrix
> >> pmOS wiki has this:
> >>
> >> https://github.com/SiddharthManthan/accelerometer-mount-matrix-generator/blob/master/rotation_matrix.py
> >>
> >> but for accelerometers.. shouldn't be too different, I would assume
> > 
> > Unfortunately this seems to generate a broken matrix for me for the accelerometer. Downstream is also useless here as I believe Android does something slightly different.
> > 
> > I have been trying to upstream the pinephone pro's accelerometer and magnetometer as well ( https://lore.kernel.org/all/20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com/ ), but I'm just not sure if what I'm doing is right. I think the easiest solution for me right now is to get the screen working and use GUI programs to figure out if the mount matrix is right. If you have other suggestions, please let me know. I'm all ears.
> > 
> > But since I have your attention for now, I had a couple questions on trying to get the screen to work:
> > 
> > - The pipeline is MDP4 <-> DSI <-> Panel, right? Any information you can give me so that I can try to get this working faster?
> 
> Yes that's the pipeline
> 
> Unless the MDP4 driver is missing something (which it may as well, all
> hw since ~2013 has moved on to MDP5/DPU), you should just be required to
> come up with a panel driver (DSI init sequences, poking at regulators,
> reset GPIO(s) etc.)

For MDP4 I mostly test LVDS and HDMI output, my DSI4 devices, Nexus7 is
not that usable for testing. Last time I checked it, it was working.

> 
> > - Is IOMMU broken? It seems like I can use APQ8064's implementation, but that's broken since at least 5.10. Should this be reported, and if so where?
> 
> I don't know, this platform uses its own arcane driver.. +Dmitry?
> If you have a bug report, please send it to linux-arm-msm

It seemed to work for the minimal test cases (mainly around display).
Please send bug reports to this ML, cc iommu@lists.linux.dev

> 
> > - I see Adreno 2xx, but seems like there is not Adreno 225 DTS compatible? Any insight here?
> 
> Adreno is a separate HW block, you can/should get software rendering to
> work first

Jonathan Marek had, if I'm not mistaken, A225 implemented, but likely
not contributed upstream. You can try asking him.

-- 
With best wishes
Dmitry

