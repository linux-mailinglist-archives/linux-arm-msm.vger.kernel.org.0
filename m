Return-Path: <linux-arm-msm+bounces-51612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CBDA64CE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 12:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802583B1156
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 11:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4F5230BC7;
	Mon, 17 Mar 2025 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BptCu5eU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E6A23371D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211388; cv=none; b=NlX8GvuPCV3fvCTqsWW9RaDoFIxNZQPE6pPlaRpLOcn4x6rQIUnZ5Z10rsbJ7/dgKUSUmhjKi8BO5w52vUDpwzsjs9COb++BEiyPEW/5WAZoJYPs6aTEh6UCLMwXmUz5/npqg1jSMzgncv5s0efE3ZSHAmNtW3v2rqu0N29gPtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211388; c=relaxed/simple;
	bh=hhnKo1koZ9MWYz+6WoOpfnqo17O1obC3mtDDYd+spyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4Lliex8gZj4LWCKaOaSdmfWThj8F6c2tQQVpC4YdRcYnYoauqQGdbVmWYYB2GgnAcobd8jg+SqtBHuLJ0oCl4tVQk4ldzBkjCBkciBB8od/6V0kMcK/t062OOaeqVohOwmANEZQgM+JUCKdEpbbuw84HycPnBJ2MozTY2MWj3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BptCu5eU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HANLgK007922
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YeZNlDAPrPyW/cf3xKhRAbVY
	fLxCK2qS+SxQ2C/Ihu4=; b=BptCu5eUymlmh53PK+qVflr5BKD4O+VGHRMWbfD7
	OScxgW1oiy1sHIp3DG0v3lFTzeGmuABGbMRDZszUlCw6Z2Q2a1DnUmkEj/krUjfg
	LaOnWtSEkdsHQ9fqSIVQ7mpZ3nsAXS5N/6eAc3O69Gv/PRfPjcogCQUi9dccOQ4k
	3pBVt7YwNR/oXjQfwD+fULRVqX1/ua8CfhAG5Hq+bbDzThLgZYp96DMIHtluI0hy
	sg/WaYMYQcMqpSSsc/M8HB0VgI4n8MG0JzNESZq0KLTTmU6FFnideJHzXnN4tHr6
	kebfVYXLVgGm9g16VVj88otOgIVyyWY0B3qkwNIJrDCD5g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2qm4f4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:36:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8a04e1f91so131034296d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 04:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211385; x=1742816185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeZNlDAPrPyW/cf3xKhRAbVYfLxCK2qS+SxQ2C/Ihu4=;
        b=CQSwHUfI9fBh5wGhWMtI+mGaAir+n9H9F7Zr358ScqkYctFp4gi/12wocXLzi66Hd8
         ZeOaiHKdKLi5PlbGKMijO9gc8utVsaz6ETnuskRRrC1E39k7g/spwjWJXFvWs3oQYIur
         1I51LtLLTSk5jpZCwRpQXmilK9Tppz590bCb8shAhnewFw+CDOqeEqr6qY747dFOLTIZ
         P1JJzblAbPv3ALniWFKAsJ9tbce4294hpQ2O+wHBVTcQNxhcpd0JrSjK5AZTCIBZkSsI
         CzF1nKIXvQSfuQyN/0C6WXxsN15BHJNfq2tcbsqDqJr2g4xLbcmyNC1kG1xzkfEb2/nv
         RUNA==
X-Forwarded-Encrypted: i=1; AJvYcCVwfJxYEt3Pfz7/jvJlZdbYXNjFBb85V/b/EWs5bUwWuHBZTa9mZrrpUzGSi3j/5GNDBSLXa9nRyLKwzXa4@vger.kernel.org
X-Gm-Message-State: AOJu0YyE8ttBk4dJO1TVejfUmr1uwWIur2FgxHYqRvlDT5ffUmcv8Zj0
	uwREwheDwIpLsmd0iabSMMB255xSyvh9ZGB/qQ6hGYqSTVQTWWOdVRu4QoBKTCA3tr3R4EzqWfx
	FXvvdlYux7JZKcqwPQZHTfsJMDrRJM3HXBp/vFznSzQiygavdtZN2TNH7GELO9CJeEy9tVbYN
X-Gm-Gg: ASbGncvMXqM1f3cxrwHvO6n25FSa/cFc5N4SgSuT7QZlpbJ2/9XHoRN0xY3+70e81mR
	CLmSdJWOubwtF0WlnwgQIqvMpAECqW9/Pqkp4gT21D64j1guOx0cqzav0esANxTWUrts6Qb9+K9
	EdAK0wgcrpm4TGCGU6JkBnlIUTj7xbojxy6eZAC2bCDW0Mae0+hgPwP85tsoQPrF+IKNOd0aADt
	Y5j1zWXJwd9EJeTnZpXS9aV2MqYc4k+5q9RJrNB+ZKlqtg1SAuptY1L4p4kovkMpD0bErGOS2mL
	on5P2C4ujit0uANlwsBQnC6FApfWHOjQM5jF0dt4Car67C3gr4V1q1Id/fnPOR8t4Dq/F4eVGBm
	ULqw=
X-Received: by 2002:ac8:5a93:0:b0:474:f1b5:519c with SMTP id d75a77b69052e-476c81b8134mr199876971cf.32.1742211384881;
        Mon, 17 Mar 2025 04:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8Ff7NRDjIixgDbZiIssqIub1yFfmbmAPPXmx/TewABw8oOTS3ubLjWwHKqWclRI5IHUlYvA==
X-Received: by 2002:a05:6214:2626:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6eaeaad4dd7mr216862326d6.34.1742210994322;
        Mon, 17 Mar 2025 04:29:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1da7eesm15708061fa.100.2025.03.17.04.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:29:52 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:29:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: add support for video node
Message-ID: <vkwdmy4xabipnmetypzuem4xr2fijxb763hu5liohumtkfit7u@drhlzuo57y2w>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-3-5c807d33f7ae@quicinc.com>
 <3ec71075-b1ef-4366-b595-80fe41cd1e13@oss.qualcomm.com>
 <5qfe4gnjnttnpezj36rdsdbomghnz5ytj3hiecoingj7622o5a@h4tq4tzliwz4>
 <b9743d3a-d0bb-385f-f21e-6b0c0be37fae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9743d3a-d0bb-385f-f21e-6b0c0be37fae@quicinc.com>
X-Proofpoint-ORIG-GUID: KxE7lFczGDmzt1PTBldj6ZtwrQ47ZKTe
X-Proofpoint-GUID: KxE7lFczGDmzt1PTBldj6ZtwrQ47ZKTe
X-Authority-Analysis: v=2.4 cv=DLWP4zNb c=1 sm=1 tr=0 ts=67d8093a cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=xle-qd2Ai3CaSUjEJ3AA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170085

On Mon, Mar 17, 2025 at 11:30:16AM +0530, Vikash Garodia wrote:
> 
> On 3/16/2025 12:02 AM, Dmitry Baryshkov wrote:
> > On Sat, Mar 15, 2025 at 02:43:30PM +0100, Konrad Dybcio wrote:
> >> On 3/11/25 1:03 PM, Vikash Garodia wrote:
> >>> Video node enables video on Qualcomm SA8775P platform.
> >>>
> >>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 67 +++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 67 insertions(+)
> >>>


> >>
> >>> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> >>> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> >>> +			interconnect-names = "cpu-cfg",
> >>> +					     "video-mem";
> >>> +
> >>> +			firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> > 
> > Firmware-name should be a part of the board DT file rather than the SoC
> > DT.
> Given that video ip is independent of any board, remains same for any board
> variant of SA8775p, and again for the same reason, PIL, aspects of video driver
> was made out of probe, i would prefer to keep it in SOC. Again, this can be
> overridden in board specific variant DT, if any case arise, incase.

This file is also board-specific and will not be accepted by a board
fused to work with a particular set of CA keys. So, no. This needs to
go to the board DT file.


-- 
With best wishes
Dmitry

