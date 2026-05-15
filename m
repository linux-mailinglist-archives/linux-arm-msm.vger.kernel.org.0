Return-Path: <linux-arm-msm+bounces-107749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Me9Or3nBmoHowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:30:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CAE54C706
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6B473080B25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C2242B72E;
	Fri, 15 May 2026 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o//Pe859";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKIyRx74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E661043E48B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836312; cv=none; b=nW4OSeA3DSqNJ0A2OiOfqRViPvx3dzORFxYM3DuqPptWSloDXMvgsfjUVAy0XfC5zGtvT2oMs0BVDBz4UT37WhstVfpHle6GpLfxjBkEij9yIV7+PD4niEuUty74VuB6QpHDym6L9qMFNV9r0qcbU1sjba3w1Fwyxyd5q1WCxog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836312; c=relaxed/simple;
	bh=Ehv1K388Xxi/A/0B5uHgP1DqNXgDD8A3i80hN0+I+Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTbnK25yJg83EcXK06Is4P4xyiixH0qVsqiXiTePkqhoWBSywswKmUJ0jffM8+4Z0w+kHbbzl1qGZQnSPqDRD03Dh4TGo3c6tGbkk9HijaGiK8XViD+KP7/lpMEShtzNO9HmQKD+hpPgsdMABmJ9E4i5tYZvqPcsYOVqj1dyV7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o//Pe859; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKIyRx74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F2jM8X1714884
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vy9dgknhGdv/h9XGHNsuSVZmmq5FUcM/liisQwRaMQ=; b=o//Pe8590wsZcsSr
	Rf/b2RAMKeDbUaJaVpJCSk/h8JhADGwVAKfx29labBfaeJnFSx893frqHfCthe6I
	18nn0rz1NsBXoQxk4C4MhfEu1hyKhkTY3qLqgYr7TwHG7zMXdU3Qf6O9WI+BOuF5
	AVgpWmBCFoK9n+9q6M9LIelUSOLaIiPh3SELch5pyqzVJIzdVPi0hMow1VfqKMJL
	bVSKWJHDndW81qHR7aHWNfSgHhwnxVOItf2bsT4pJuFH4053+DgBGUUmdgysU2ve
	Q+P82/GN8jl+XgadbGtQREUj+wXztCqLrD7JyACdXPoWINn6v8GfeK0HHA64ucXa
	CanV5w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxsb29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:11:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63126f42441so634680137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836309; x=1779441109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vy9dgknhGdv/h9XGHNsuSVZmmq5FUcM/liisQwRaMQ=;
        b=aKIyRx74IUQ6ktSOEjtMDsO+Ui36IjB7pAG8CWmLbAFKgtk4BY2+3PnHEnAUJJS0Gs
         zvXVIKa4ktrmRtVpsxJH/ni1xWq+yy0BdJX8y5mWlBqTyLE52aChbwhwnyE/8F/nqqF8
         fM+jKfBb7vdVAoLIGOtS0YTLeusqFf3v280QMFCCaeK7Y2eqtQlwAkfKy80VqPsYxO2O
         W8WLUDE4NLX6fAJM3nCQ4/AJWjG253cwHrfeRUdxiad+nIWxZ2tivBI4y64/xq1HYSve
         sg1TwAllmVQTnk85ujVsUQ552ibeXtc6FWXpO/g+bW6eCKB8UY3LMiiMimLYZcBBrZuN
         iLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836309; x=1779441109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vy9dgknhGdv/h9XGHNsuSVZmmq5FUcM/liisQwRaMQ=;
        b=okaOajOjQrp7GeiwJgHVcL7O9VK7epspJ1Q4nG/rhBF9+jNXxZFk1egumIEc47rfxX
         wBa48S13UwVVoNx7iv5E7RyYpbUQilTHPN3drvuxdZsY8IAFYxBIakMMTl0b7LZU12pT
         GFkg5fr8oMEqwVOL/hbUJhJfCTZNUkZv9LKqej6EEEri0qfPPMjgYcy8oDj5gmJctglu
         6eoA87UhHJz2m5y/hB67OA/zSJ3Fhss7BNjynGQG/Fc2plT4lBCS/c4VkpQq362mgvQj
         tTgqxekqDAW4Ledy1U9aHXM1cl54cbEEwkevlFLCPNPfU0B6VLkSUoiia8dysAMmaiR8
         P5mw==
X-Forwarded-Encrypted: i=1; AFNElJ9DPl3H9G1My2CoyqDiiCHIgkZ6uyAchQs5AL6ZUUQbR4pdbgi09xnYRTsCehhAjJABNBaYKigxQx30r09D@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxkIGX/A6/ct7rXUPAOFsWAzOAV3Ye+oeEhSd4nXln9poCad7
	9hhT0njkiP4C6kln11FvkDXZDC3nreNx2O+tJ7gVtKC3OK3kmdJ6FqlKVtTPff7KFgfB4p1YMnQ
	NemDrbyxrC5R41xjPkRwSyLv18ndKVIuSS+Tp4uYIqStMMJecRvfjfbsD5AM4WNKqg+5z
X-Gm-Gg: Acq92OHlJrk5OOTAUbE4g3620RiCB0l8dJ1e0+H+bsDzziCVNCGOWnzUqikPkp1vxPr
	ImSK+J0N2MKWXxBA4Wv0sCJYOXP6extgP3IWJeV47iuEKzXieBoKd7BF15PNxgCbyvqmYBdF5TI
	O2SuSN92l68KBDxi/ZIVc0BfnaVzB6gcb3vusTPe9KDmhCZspp9lKaCbkj4TOtZO5QYTPzlCvhq
	FpfQ1YkQFNxOce0sZwHNCOpbWwNvdxFggbAcx6K1mkkrOQItVT18U3LOH7fyCcHUCz/OV4KVzjb
	wqjqdIBvW44y4ybulMugqdYMamsewoSuatzpoxGAnGkTQpkTCXnW+uD/jQuRpawmGzxxDuyFAkK
	g4MhRcH3fvEuSv8QHl3zoShn9PRitxArBlhflAP2zMki9aselxGli6sj5Jh3CtVn4IYnsqSOTJd
	WbUzQ=
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr380376137.3.1778836309228;
        Fri, 15 May 2026 02:11:49 -0700 (PDT)
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr380358137.3.1778836308646;
        Fri, 15 May 2026 02:11:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd099dsm195966566b.8.2026.05.15.02.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:11:47 -0700 (PDT)
Message-ID: <fcadec07-589e-42d9-8581-5a31a42518e5@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:11:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: allow mode-switch events to
 reach the QMP Combo PHY
To: Saurabh.Anand.saurabh.anand@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, corbet@lwn.net, mchehab+huawei@kernel.org,
        masahiroy@kernel.org, nathan@kernel.org, nsc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com
References: <20260515071448.1845500-1-saurabh.anand@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515071448.1845500-1-saurabh.anand@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a06e356 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RmqWY1QcMqzIjky8fzcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: J4rkrrCOVsxtARXYCCOnv3JcihofnTru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MiBTYWx0ZWRfX5hpEIk6Yq9N3
 WxN1+kplqpMJGRR5xIB7elskNIJ+2ln+anK20z1ZJshiNWTlIqwzGY2U9FAMGJLvJjajoF2RtaB
 JJ22ipPndE3VcUSg43tpoh7kX+IEASz6k1ZzRCYNAPOFnqGxInOLvTe1oFErGq4EHvrJpIllWur
 DzdNWN3QsfhwzdPcvYo7XGWohjOnOXDxZMOH86eFmvcpczWHf7SNFwP/rDYIDXH2Y6blZ+6A9RA
 DLIw/3pE0bC+SVE+eQbxnnSbPGbKk5Jh9tXBjb1PUDGq0caCWvTEYIsK6NPhtumfwWfmGxDeanv
 Z/XPP0MYKCkqW1CmBYvfEod6lqaVu1xHicKUyOtmcf+sLXguRgpsvswIkXO6hlbUafvgTp5Tkbl
 NMu5v5F48edRDGTvk3gVy6FMSR5UEjybtix3lu0n0txgKPnUzGXPtQ8Fb+XrUe0l0v7E+bufbfi
 nIpecRjB4kIDShBnASg==
X-Proofpoint-GUID: J4rkrrCOVsxtARXYCCOnv3JcihofnTru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150092
X-Rspamd-Queue-Id: E9CAE54C706
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107749-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 9:14 AM, Saurabh.Anand.saurabh.anand@oss.qualcomm.com wrote:
> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> 
> Allow mode-switch events to reach the QMP Combo PHY to support
> setting the QMP Combo PHY in DP 4Lanes Altmode.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> ---

Please fix your sender name for future patches (it merged your name
and email)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

