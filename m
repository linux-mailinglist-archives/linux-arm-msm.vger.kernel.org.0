Return-Path: <linux-arm-msm+bounces-115805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KUwIIH6VRWo+CgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 00:32:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D816F21CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 00:32:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XgAuYkQd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ybx6o8Om;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115805-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115805-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D19713044A7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 22:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265A5349CC0;
	Wed,  1 Jul 2026 22:30:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4539A070
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 22:30:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782945038; cv=none; b=pIkUnt9CDb8AIWdmY4X8h7ua2oS63aD+TaAKaJdAAf8g2Uq0AY38uTxy/P10fWvpf/g+oBnlywR326Jp4k/VsJsgsNZ6WJS49WZAL2t/AnN4aN4OGZKaWyn451S7cYK/DaZos2DGt6u+g4YGXplqTYxdS2qY4uE0iElNdaiFqYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782945038; c=relaxed/simple;
	bh=BatHVsoIz5Bb4R2VzzgLNRFahxG5VaPstv4ozAB8ids=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SoTaC1Icjz+GxDfkJwindQxhdKhEb+CY3Si4S7s6a4aPAL4yWQ2M53c39QpDoyvH4H8Vo1RYeQ/dv6jiaM8NlIMgcb9H8q8DOy6W/uXfaPLjnlZZJ0MFmRGKdJ0wHLEZAAv1Wbe7LMncI4E5TBDO81QsWgJs+orZTZZivbpdF/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgAuYkQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ybx6o8Om; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661LhMOK2358163
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 22:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oSade3cQuxhHGzrqmP0e10mU
	4F/ywazI9nk73rEtvd8=; b=XgAuYkQdSv+Rl1NPx7o6ur9YTG8bEnRO+2JsU6Yd
	WiZJ9XKR7lQ9O2fpAyplSZM6npnogUbW7yqAKoLx+vosoQssfsMPcUeso1hCIdm2
	Esa7RD0bgcBKKBs1+s2OOAlzv7HfsGHDZAC5iXeGPrSDaXrWbESJjv96VkLB5295
	ieEcE4TzrOsYSvxy96HeRyfSBQN5ImaWgudPP0iD8mQQb+Q1/PPEXlLV6Db5QU7J
	Zz0u79Afml7RcTunhyAq0GgKNyVsSxKeX3T/I3nYDTEDTmgr7jVgpDU/i6OwACyg
	ljxAXr2/lUcugAyIy0dpkXewzfv0U08xSQgvnZ6i7e6QCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0a2rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 22:30:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5939so154556485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 15:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782945035; x=1783549835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oSade3cQuxhHGzrqmP0e10mU4F/ywazI9nk73rEtvd8=;
        b=Ybx6o8OmaySrGttZvxLeASyNsYjed3AhrzzrlUaCL8/d3Ur1pXs1YxOa2TkOL9boP0
         iklfdFpc8Hj1lf9lxoO2rGiETwOiA6cz2wsKU45sJez+TI4fThuGqD10uiqBZF+EvwZL
         W9bo9RrmUu2o7oEryN3zTXLTKLoQHfHnrHSCb/PplbM9Nm4jtQCLDG4QqxA88Lc8P7bq
         Nk3igUvipeac1IKiBkkLOWTmqFPkzQpraa59navzyw6r8IO5YLn6yoRdG/+ED2PKP6Jn
         H+oT8A88F5lGTKlwCVTqZ/AKDVNYyQgrsFHWA3TYe2NmRPVgYRuqN1PVI4sNT8Xyc/bU
         7SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782945035; x=1783549835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSade3cQuxhHGzrqmP0e10mU4F/ywazI9nk73rEtvd8=;
        b=IB8jSqRoaM7Cq7xcWC+B4qIv/nXG2+cSkLZxsv+tgCtbyNhhgAp5JntYhpSJcwovZT
         W1EK+WaeEkW1/dIY7mvkulUJ8I3QnnKL1ot3VUNN/gPaz+hrSN7MDPUeMopCfiR6rFrb
         rHygUFtos2lvzmwHpfZGyyF0XWvabrDr2wEftmSqcjWJ3f3TaNCyoBZIXu1spFmGqhL4
         iZHyM7L5nNRKbFFyFxekjrbL6eVhXFBKrMZTiOmSfH9uzllwuj8R2lkTZvl8pnBQHaAT
         RwyTV9dZbqie807AI5wcKgfun2Mxw1qcgLiPRwjYIqBkjuV22AUd07KsMtc3xawx7v41
         bBBA==
X-Forwarded-Encrypted: i=1; AFNElJ/w1VaQz8XBJ5sC+FM8qt6m1IdQSL4biBJcWMmfZF7frmtvNhQyzyPNEy4dVYkvV/gABRkzcof7+7Ls84+l@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9pcfmTyhx7CKoA/nlDpuzW+2pVKax8B5WokuCO7figjLM/Ud
	sNxUmnBkew38LZtQ4vBxTMlKNFXCXXkFh9kynhX5a7/jRoFi/5/Rzbw7fAqBUqlAvt6CuJ7mws1
	D45P1L/s/2MoyUDIisNixWl6orCsnncYEIVT2RKl1wC7oGiIw16kiWCswhls8UtzLwJXb77ire/
	TU
X-Gm-Gg: AfdE7cl26e5tmzGsyN1LDp4ZtfrusabhlnNvYDKAmJ2eDYY0cpZmnw6NR/MPUEbSuLn
	mpRPRls8o2cv5/qh5L8SPI4JGHrtGcQZBfZe28UeaukbuSgvS5BYyXfsk83txeql4GI7mWYhdA1
	x9GLlj7FXjx2cQiEHbM6WRSfuaP4y9O73+7/FyBsdc6AbFyrOsj/nxMOGcp5jyHUAvXdYEYgcUd
	RdbyglYBCLvvlXdkj7GonGYIwVzOHn3dGZh5UIDhZS3VBGn+4nLzXF6ED1Rpav3He9LF7CQiFIS
	9HFFCHztfikhEhH2raWSZUvJX9ARZPyv1qwNEoVeF5qldTmdGXHAQhgmFPMiQJKiv+6ltgXPtvm
	PadkJVrmVyWwafDN3as+gAgSB/7XLTlla7CyS2OXKdb0bnzS7JaaGzoo4hGA3/prY5XYhjsfPfX
	Asu78pWqMaKxiyPwqANrxLjR/i
X-Received: by 2002:a05:620a:6883:b0:916:1a02:1965 with SMTP id af79cd13be357-92e784f1da5mr499405485a.50.1782945034413;
        Wed, 01 Jul 2026 15:30:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6883:b0:916:1a02:1965 with SMTP id af79cd13be357-92e784f1da5mr499399385a.50.1782945033926;
        Wed, 01 Jul 2026 15:30:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89e56d0sm273132e87.79.2026.07.01.15.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 15:30:32 -0700 (PDT)
Date: Thu, 2 Jul 2026 01:30:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v10 3/3] arm64: dts: qcom: glymur-crd: add Audio sound
 card node
Message-ID: <hyasmkyrzp7zpifgcux3ud7yk65gkm2g43lp4qk5vw64ee47my@noebqpjhb2s6>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260701163115.3701298-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701163115.3701298-4-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a45950b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Pwg7NeMGc8aFi0NltBcA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DkFdcRjY7Jg5KOou9VjQ9BuIF_N_Qd8R
X-Proofpoint-GUID: DkFdcRjY7Jg5KOou9VjQ9BuIF_N_Qd8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDI0MSBTYWx0ZWRfXxTg7IDED0bmz
 ZkPcP/hINQcg5lHP+eTo+L8vKOdu1p24BCcM1UHz+fgUNqXAdjDY6slCRYMUzkNm/lO98AOhZFx
 nCI/8zM81r/4S4tvIT7gnbvnn93aw2ABmYHv5I0dtZiqSMqmt6E9TJ9hXl1QC/ETQMaUof6l4qH
 kNShepBZPKrNMVYmA6WtagXFKZGK2p7aJNRS2N/ydtUqmttrQmm/mlbvLW5YQKGd5ax3FAZ7EjJ
 sfWsJ5MfCrDBTvfYcGiuLawKyOj5tI1A0IuaG8GcBX4fK9mmGFfJCeFK5TFbKE14y0dmsbQK4ZW
 wrpUX9oDfLg3bwtoyK5oTF1kuet8U1p2BiRI2weOg/Dh1G68Unt+DYEQJNB2zt2aadjdJ8IKmc/
 BL6f1My07z8SWOZ2jkzfpUDlo0nxL0wINmV9cToqpwyjRXdZvW238brW/hy9hQbnzxgW2Os9mLL
 LWXrxUWPFYMWDNLvxcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDI0MSBTYWx0ZWRfX7LB6cATmsRne
 D4yZjHr1a0VY9OOv+d/bzbdHHq42Qj2YKLk0BAGG3i+jlDlTVsV9LOl/A4qVQMXshpBeW0epyL9
 E+gLlr+YewKfby0K1akR1RvhacMvpmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010241
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115805-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,noebqpjhb2s6:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:prasad.kumpatla@oss.qualcomm.com,m:quic_srivasam@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1D816F21CE

On Wed, Jul 01, 2026 at 05:31:15PM +0100, Srinivas Kandagatla wrote:
> Add the sound card of Glymur-crd board with the routing for speakers.
> 
> Add device nodes for the sound support with WSA884x smart speakers
> and playback via speakers and recording via DMIC microphones.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

If you are sending it, your SoB should be the last one.

Other than that, LGTM.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 111 +++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 

-- 
With best wishes
Dmitry

