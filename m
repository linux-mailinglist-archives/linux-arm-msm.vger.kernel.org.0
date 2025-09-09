Return-Path: <linux-arm-msm+bounces-72879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F64FB50972
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 01:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30D2A1C21F53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 23:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101AE292B44;
	Tue,  9 Sep 2025 23:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B07KJqz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69751223337
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 23:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757462293; cv=none; b=B1Iz/4wDbKLD+OEjmIlD+M1RtrkRmtNqzs8uo02jtKMyl/ZlVZkZBiGwNsg38PxM81icEXSah2TiBTu+JQXCLK27EcAe66dNFNsBmbHqeVIxm/4pxqxlwmhmmWylMRQPOl9cfGL6lg4hLIIKXLOi2Kj8Jh3n9+VWqx6ubZSaWys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757462293; c=relaxed/simple;
	bh=fe7Tr8F9drQOnFSUuKLuzNZswkmtaijTbbG1u6UrfTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9Z4lVkjwUB1nHq/94VS+jElxBGjb1ipBTOItw6HO0vWTHp2Ut4jkIouIawpPOziSFHe7UhO76PCrF6SAsmjNKVLkXNStSe+3FKR9h0nhkCXHPbuVSMwWvKdGrH4SLzLPBFdlf/S+aFW7Rn5hPzOzfXSIiJc0aL4hxZM9/IL+38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B07KJqz7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HUWqm020091
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 23:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BTLfkdmSnXwPfhf6JaLsw/cB
	ZJCDHQaerobrECuqh7I=; b=B07KJqz772Ekiebqkp4BJPj+PnmNyQFPYeAE8AvK
	BqZsy/mET0tSovK8PcmO647bz077pjf4fRRFvkMaSgXNgST+DFXP4oVqJ5K7SzxC
	efzj7zDnZjCpKpTJZbk4JGO0NrXcLRs5SFuyaItdLHRnurBpPaNEgujJUNkYVEl6
	gbDugvBCbl/sHlaV8Cj1E482PV40HKTVXbiOK3ppk+s7JBrJhyXr9LQHsQ/+J2Zo
	7BK3NxOhxK+Uo68GwEDQDAOeqaCapWT8GcpxOPNyleP1k3wkwnW9jCkQiR3ZJQGm
	Zlm73u8Da6x+F7nSzMZ0n/5/SgsPk4kBQkr/ndaQYyV34A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2617d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 23:58:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-726aec6cf9fso203935046d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 16:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757462290; x=1758067090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTLfkdmSnXwPfhf6JaLsw/cBZJCDHQaerobrECuqh7I=;
        b=v+gIjIIfO4GXlhjuZ8Fmqq198PVoL2UDfPz7xNh1Wep1wnN6crNC7gmrrnoZWQ9hpq
         RNudmJoxxwJ9k9Ei9auxli3Ej9zI+cIxzYnuEZmrCjPiygVO8/AZjgKr0z92R+ie7gw/
         qxYX/96lLTgDjQM0OOZCNlOEwgc2fTpy1/eKUyVUaGV6rzEbeme5WCJXRgkRGQrhKRAm
         IUuztHaQi+8kYzZF36WdA7kvArPC5JH1XV3WFsRwwS1gmiUDhFEKeX/jaLZ2mF83/Xzp
         8LO7ZAOt+wFtFh+nk5wWWvkgCzIbSQ2XLQgPplDM0vQgDuqTJ6n9lvf+XMXR/0wNT1/2
         WCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS4uHdOiJZ/+w+pvvfa1ElZe0bWDlxx+MY46Xv7G07QvQODrbvdam/gtvfZ3sB8E9FWdMduRI+62FAdnKL@vger.kernel.org
X-Gm-Message-State: AOJu0YxiaBm5YLgFWyQFhvH8b2YiSf7j2Ack2o5nE4/JDmVb5aDMawV4
	5deuMuVyFzbOLIB6d+H3BcK1L1nZz7z7ZOYb0ntGdhL7S7ZpbCMvcpslxAC/cSkx06bQc+RUyqS
	74dj46j4RO2rmtm89Fe7vaxYYDbrfsY/R1sR5d0rR75mukdFvXzDqC88IDOZpspbwLaPh
X-Gm-Gg: ASbGncvPquls2NH/MdViGuXJeahhVU3rsBRUV6ehR5LzzVcURpAWhSk4VqKbfH5wx7C
	OvXrGktCj/OJtUuvYMioD86x1BQynFkH9qpB4mJ8igkh6p02F/p5i5VFPoMtvVl2TdQWPJa3/LA
	gAKTu6Im8dua2LSbPdoVRBRuThnmoExwFNfImNqV++1msI/4+Ln/e0eBxbc0fFXxRJLFIQd7jDw
	c8rM4h++5P23h5Y+/6ir7WkDwRpzrmUCLaCTtBMyOTazYFiCw8bN/aXxMBzAc1I3+Azdf+uc75L
	vgsJ9KYxOcZxpJZZ0wsrKn9BK4+r+Ev6hlgYE2x8VNVm7UKHbIeWM1O2EMrFcq0SVsYsnprzW0q
	//QAXks1mtXIkVkcdZMmpqnfQsoSClbWjmkJ5latD5otruSEXwq0a
X-Received: by 2002:a05:6214:300b:b0:72a:4781:68bc with SMTP id 6a1803df08f44-7393f986de9mr142154076d6.51.1757462290483;
        Tue, 09 Sep 2025 16:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiKNC2l10D22DB5gczvPewShZ2x/WB8v5Th1kURt3OI/11b/Mje9eWmxCIFjoP8p2aZpkQeQ==
X-Received: by 2002:a05:6214:300b:b0:72a:4781:68bc with SMTP id 6a1803df08f44-7393f986de9mr142153946d6.51.1757462289908;
        Tue, 09 Sep 2025 16:58:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50bfda3sm42505471fa.62.2025.09.09.16.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 16:58:07 -0700 (PDT)
Date: Wed, 10 Sep 2025 02:58:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable Adreno 623 GPU
Message-ID: <uk3dkufxok7sgjizgvppcd6oh23fae6sglilqzhytl7pf4rkbw@5qf6yn2wivrm>
References: <20250909-monaco-evk-gpu-v1-1-e14938780411@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-monaco-evk-gpu-v1-1-e14938780411@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c0bf13 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=aDqWJWFMxCdyT5shlmgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: C9dGVdQB04hAm_2amhMpUpP-WGIut9Q9
X-Proofpoint-GUID: C9dGVdQB04hAm_2amhMpUpP-WGIut9Q9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX9y5vP0stMdG2
 oMKU/KNG0yPSo43ZucJKhdCZ5lZYm5sVsipkTOfG47ioc8PsnPKHrXtfnkzjRxntqOIkcw/qKnT
 baIFmJTbU70PzrtBEFds6KHqdlqf0ypapv0RKymtgmkhObD7OQ9cgefuQ470ByR15bh6LsBQv+n
 QSi5+ZqCMKRjzGlw4IsROjglSPzFVx7317jmY23Uh7fCkOzEZS2mWJF0ljIFkbpGB2DnjjManul
 yevI2KzxfQ2W59ElihfAL5Tc5elOjDjt8RT7U/Q7AEUd/F15J2GGwCOpZzf0ztU85CT+LAp/1aF
 QPE1/EUcYQipdfSRzEytp5jSqo4EVrLkek6ORpkjr2uJYnbUPyQGMN4fGHwxiwh91uotkJpsv/R
 dg4eLXuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On Tue, Sep 09, 2025 at 09:16:59PM +0530, Akhil P Oommen wrote:
> Enable GPU for monaco-evk platform and provide path for zap
> shader.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

