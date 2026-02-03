Return-Path: <linux-arm-msm+bounces-91719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCQIOWk5gmmVQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 19:07:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC28DD51B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 19:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 799433001A5A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 18:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4416361642;
	Tue,  3 Feb 2026 18:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4X/6foU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8u0Z7D/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53A31B10F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142023; cv=none; b=sGtsquC4lwyhIa3WZwKlPp++ABeQtvTGrObcLrT3Jj9uJOarpkyc088ZKwW6sJoRJu69IQhHBheDkiQm5bbiqjGUp5ZEUgYZTPGyckF0Z8rYaM2aQSNrSWzK+GCTTUXjZanePb6Zl3EaGTRnfUcsYlMfY7YMYK6IWw2zk6K9aX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142023; c=relaxed/simple;
	bh=Q/+saX2dF9dO51xaj0JnNN82Vqc+y84TzTdCSjhEW3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esWAaiPXRR8YI5OZ7y4sH+RC8QZ76pcLZ/Gs/EgxWQ8lUkvj5HD7PRm/qR1mni64UnTEiu3+fY5mj4OSMxsQ8sxDLz3g33d3yFzxrTSA7k/83dygWqW3JfbkrtZRbvykyBs6Z5RzRXJ6zP5GzQlod+aWZRg98Ku/Cw24O5/J/5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4X/6foU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8u0Z7D/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613CABSu1191821
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 18:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mcru2SsTTBFu/p4JgHEtdY+0
	gyS9G4cGC93a2klc6V0=; b=H4X/6foUI72OyuIGrBrp+EPm8oobd58GqamDbcCC
	giV7WZyeuA22zo1K/FMTn9y2DiG/CabxV5GSQYC416BeP/HQHbRRvicryafqse0t
	9ecafA3qaQ7cx1xlm6xsCmR+tm/A4q0vLBjAWtsTFV5Y5wWQTv6ap6g5oNLIoyAm
	i3lU5A37/ww5gp2vx/OOkpUGm9zOLuWv0JKUiqJ1y9FeMHatmYBXCCYBQYSnAwXT
	DJxCXQinvEnPOXvxhfWobPRJ8faRMs+kxbrDs55JcRShzgF1Ok83BAkR7yNdsQes
	jF/PQqGorrh94Q7CV4PuaKbwwW5B5Z/eUamL5jzhlV+HWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gsr15k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:07:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso2600143185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 10:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770142020; x=1770746820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mcru2SsTTBFu/p4JgHEtdY+0gyS9G4cGC93a2klc6V0=;
        b=i8u0Z7D/D3/8gf+mpHMwQG+mO/gn6v/F6XwhQZWuxeA1+82/SeVBgsXv9yUtXgUWUK
         CN7hH/UY4MkAPicEg+yZ+KJg0nLi0m8KLfLEZQmquAj8zlLfM1+YhZRdb/KSrDR0bshR
         P+TDQzZEIhkYatBLveRr4Z+D8Ny+n45w56sTUuuRxcOZx5GnLYSU2XYpZdNspCFUEH40
         9eauZNvAGm5xwLlO+fyizPCy65ubucUrn7jUH+SFiaTEzuyCANcclPvsfIteP4dl/2yC
         SDSWHZg8ZrznQhHTfaaiVhq4DOdF+1m+vhvl0cIsTMzOyZ/v8YJG0M0HON44LvUTC89T
         YB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142020; x=1770746820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcru2SsTTBFu/p4JgHEtdY+0gyS9G4cGC93a2klc6V0=;
        b=eiXSd3oOemed4BYYF0WhmVwGwNb+JQJn4zYwNA5qbuxqrGph446aXZqgNs86YSzr8o
         TLHtrGZ4L2ZaRVsYj5/jOH/dPq9oDh8TxobWoM41bhyCbspO/TOE98hke+2iVytg6DMn
         driDXUBIjKFPlz2bNb04BrnssvuGIMGxwGtP2LvPMPTSxPOqQ+D0S5o1tnCKVVPBKyeu
         bahI5GlfivP07vL9Uy2p3s2WXMwio2c2+ct2lZTMHsQtOd5+LdmduTqnJ8KyjGYdl5Rs
         yXAXTfKSK0hg2SEdYhErqwpV//UZ7V2vqghL7XBNrJfu6ZgyZjnuX5XlO5NzTNHPaSM7
         mfOw==
X-Forwarded-Encrypted: i=1; AJvYcCVHi2rLLA8rRfMqqg/HZSnXJAEeujfYkBaOf/qnHbaUhNDNNF1/BFwYKZkIzJ1N48xCklzsALmfeAhyw+3X@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6lYhIceCouRvyCfcVXT+5u5JaKXhxAifP9SJXJ07Qh5K6Ozyy
	Su20eZ40Lus7UBlAjmKMabfWLPCdVGqta0pGO8JZc6ZuKHMcRvxZIw4H8UjMiSq6EH89ICc8FfO
	ihhfVRLmf0XOu7wF2zdHvrNBPodYR8CLKNsYfnjslUd31iio17JpHfPttyytB0ueB5dhi
X-Gm-Gg: AZuq6aIdCUZlz3nVuuVNhYE5oUs+C3Lu7KPMGlX3xVR8LCS/NVsncxAMkNWJLlg21+j
	Aql78LMB1GcJfbso2mVVY0L+9Kg+96rHelCl3BLBiK7MuFgRJwR+lsdPVuvXgE2cbqILyJCDHYD
	1ENv4wGnq49cnB8I9TB85YOCnjhBna1lsdboKcfNOZekBZ9nCMCtgsVigtB5GJ4FRfbUXqpVEbF
	GyWrgkPUZLN7eL5bdUYTiIfXN6jg4/wPGgTbZkxdpr6OSBc+rn6y1pnj73ymB8bSUuoM0BYNJOC
	2h6EOsIw9sEEnxtQ4TpaeEZ/4Smk4+N8cm1MLyYb+hHk39BIyYl0tGjJkAgVS/agr01PBknUGJs
	xZ6sTWysivXwFKAVgOp0094cg1O7VWCZ2got5SASIJcerI4hBYg07BTKuAhNe2GlA9NejI1smp9
	iLNcK6wi5MzQEL5e3ReEfTQkc=
X-Received: by 2002:a05:620a:1902:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8ca2f83c03fmr56961285a.30.1770142020200;
        Tue, 03 Feb 2026 10:07:00 -0800 (PST)
X-Received: by 2002:a05:620a:1902:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8ca2f83c03fmr56955185a.30.1770142019512;
        Tue, 03 Feb 2026 10:06:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38691f6e90bsm408491fa.8.2026.02.03.10.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 10:06:57 -0800 (PST)
Date: Tue, 3 Feb 2026 20:06:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch nodes
Message-ID: <aciylkjxh3u5jxyklyj5tzzlidl7a7kf6nnqkmk2kg4bwi5b7d@2rrabtmfe5r6>
References: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=A+9h/qWG c=1 sm=1 tr=0 ts=69823945 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u-mDUw0qBS5sdDMJZvIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: NjQxM-x9PtxNYJo4TX2Cz9yrex_6fybA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE0NCBTYWx0ZWRfX1cw5iC0NT3e9
 aSYDkLjJLLXTZMTpOVP04cunq/J8yb0trV25bb1ya3RJCnJJX+ThjaHCyn2XY/lYA4vGNuBNNZw
 WCPfc7pZpIBn2+AoA4y9fhb4TzEJx/UdpuD39r5yYGHfeWhcfijLyzmDqKwcU8SUORG7ReHQN24
 AKFtayYK9OO89R+ssEfC9tzkDbVuCsGI5u1WKVCERrnMbkSyFHbBXSW0RfuVOI4Rs8RlZ7MLTX0
 9tTGcizImtrbCKCMASPVQxq7zUcATux6zNwmK4eZiV+Z1L3u0UsBmR27khBAfSskY6DaJdZTvP5
 PBA27RueyNBSGpDqJPJWV2NMfhmvmIjk9/wIBWIOgvNKRGu5l1VCrjl77ZCAVqYlV2M4KwcUrJx
 MGAXZKzXFWEXMX+7E9fGvnBAiQLT4fz5aYSOfJjMSBMqgAt7VpNOPcC668VLxDLecA3OMTegh4S
 iY/aHg0NyXUf2sNmX3w==
X-Proofpoint-GUID: NjQxM-x9PtxNYJo4TX2Cz9yrex_6fybA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91719-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CC28DD51B
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:01:27AM +0530, Sushrut Shree Trivedi wrote:
> Add nodes for the two additional TC9563 PCIe switches present on the
> QCOM RB3Gen2 Industrial Mezzanine platform.
> 
> One of the TC9563 is connected directly to the PCIe0 root-port while
> the second TC9563 switch is connected in cascade fashion to another
> already available TC9563 switch on PCIe1 via the former's downstream
> port (DSP). The final PCIe hierarchy on the Industrial Mezz platform
> would look something like below:
> 
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

The b4 tool should have warned you about this. Why was it ignored? Where
is the changelog?

> - Link to v1: https://lore.kernel.org/r/20260131-industrial-mezzanine-pcie-v1-0-b3c2905dd768@oss.qualcomm.com
> 
> ---
> Sushrut Shree Trivedi (2):
>       arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
>       arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1
> 
>  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 234 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  12 +-
>  2 files changed, 240 insertions(+), 6 deletions(-)
> ---
> base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
> change-id: 20260131-industrial-mezzanine-pcie-75dd851f5b04
> 
> Best regards,
> -- 
> Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

