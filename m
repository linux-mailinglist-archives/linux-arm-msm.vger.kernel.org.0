Return-Path: <linux-arm-msm+bounces-101993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ia9tLygJ1Gk1qQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:27:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E93A6992
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D114302084E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 19:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C48A390988;
	Mon,  6 Apr 2026 19:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkVsGjP1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWXse0VE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CA031F9A6
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503652; cv=none; b=GacepYalQlKLkSn3Vzw+jZmOauXlzwHhZbK76F+VeexKgmeXnTjoDmEpdA7KqNzyQoK4aliqH4b1uqoInSR8+BENv609Hea3uhfj1bwh8qSQx19EewA47PvLBt37jN1NsrjYW8R9MIv/5WfF4rLLJuQ1WO+r0K1HHBfwq+BIX4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503652; c=relaxed/simple;
	bh=YpKg78k9g17RGqBonjvseVXzFGYAPpTjuho1F8e/Gk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvyudjE7kYuGCeDdFX73vQJezBUp2MDfsVq6pl+yrUgSuEjrcKeARMLhBHyRXplv4avXiif4TVs6ZsJ5NduPDi4Ib/Zvw7UpFYNsrgYiuOcfupa+GQfE/2loBK+dNIDN3ZY8tyBlXSEB13ffAhrCVAbcIbKOzi3f5O1ZtfTZ1KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkVsGjP1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWXse0VE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636Ig59a2203360
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 19:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kcO/fqqHmUCgJe8Nz0+pajqD
	r+nZpWXwsojat+Hfj4M=; b=fkVsGjP1ftkIDKthDN0dugfv3K161RZ6w5PxRfUf
	DgueNu8Rofrt/pKjz9KSiAEDVq3yNPcY/TxpKdjeehhmfU68gj2Wxi7w9KUk9ZGg
	ywjEIF4QwBLo0FvLfsFWt8bUXWf+UNQDuiZjn1Gka21AcICTN3z7tS2aGW+Q7ssa
	bn9ObAfshCx4Onr1k1CSJSX7Ppko/eKtUwviMjFimhbphNoIC+np0kI4gOyqBRfx
	DOZBPaQmYdYGToHntKPGA98loY/rQmJi31xpOgJn+bwfM5rH/ZPc6BQpVBCN6PYy
	A0tWRpS3H0BkmbGr6jHSjpA6PoSaTq44u0aQ9HclDLzkLg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcf2arx6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:27:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093a985e21so122897861cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 12:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775503649; x=1776108449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcO/fqqHmUCgJe8Nz0+pajqDr+nZpWXwsojat+Hfj4M=;
        b=aWXse0VEZsKVITCOfedGNT869fTApdgIjaS51PJVhwe+obWny/6RxjvPBEYL5WiFRS
         Gd1cgQI5VyYr8oL2h6XdT3B0gsGelnRZU+Ne+TpZECtdRLpo2lyA2yBz1igPm9ztRQwv
         l5oRBYk7DEqJ5jIXaNoojKDk26BXwjFMBhDQXtsyTGScAqepu98Z4L97NJRholxw9FSV
         oo+RdLjr5rrM3JeE6+87w0INItdIVnRg5gbs+CZNNMPqqJrcNeVBYzFxILugIKgTw3qC
         uJhKOulzUtXjLkmc5NuBpW6uit9oqh+5oPCdq9sDSmNawA9iB49QlrlHvbbgS5ocE2iw
         i/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503649; x=1776108449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcO/fqqHmUCgJe8Nz0+pajqDr+nZpWXwsojat+Hfj4M=;
        b=RTmqC66bg4AMQrv00dAENWyAyzKmbJOy58HjKRyqRzpqggoN2TDvLUU85eOzurH+Ni
         zRzlm8hEwQL5LT/QWCoWDdRfmwdmaI/fvCHuCt9JQKiHCNIERRCRz67bGrcZJtpggoyK
         j93SkHsn/3dje21xt2Hu2V+Kk7ACn3fEAwNym9ySFgqPk8uaCaGkVRy8Qx0NWd38H99M
         e8dcAMf36UJf4Jm7W50/TXi3HhWGLBbn4N4lxpv4sNVOhv8M/WsFNKWXvqQWo1ELwQtd
         WmYJJvDzCmi2E2d7UNgUcOyRPTHGBUtLVqU9RD10rnDCydvJvC7Igl4pPcAgB7A/Q1d5
         Tx6w==
X-Forwarded-Encrypted: i=1; AJvYcCX7z2ZFv5XqCxFZgFWRcdk4Df7tbQyXKZGNGJjZ7vJGmdDS+v3c3kw2BVCVLYyQK2YtV/dxP2kYrr1MPXA0@vger.kernel.org
X-Gm-Message-State: AOJu0YzW1fqw+YTUNB4FkQe2MI4SGRg7F4rPCDOoTHw3zZ1VuOMyJ5rk
	eOvYfg17XXHG980ekzav2NpP/D4VpjHDHp2px4/4IsH1SO9p+STuqiguYc8Hd3YrPv1DJCtCvrF
	OZG6RpnmKlz/xJv1l2bOIi6NNRRwyjaoZzHgFXfYo89MNnWvi1w50On5LPZcISjWCOZnv
X-Gm-Gg: AeBDietS6U/DgCOhWrG33YKrI4tgmbVGWCoRD20sRxoLUctHVK1c00Bb+fROU9NYmT0
	LyQuJgMIhMdfCRBVl82N0G1sThG/vjbTIjovsnAiptCHnxI5lguMz1wjNoYFvielqm+bxjqxqKY
	pFKiJXa5VzOWhbB06ifp2tmAx2YPfOyu4jFGbnJqn7VwGw14SUPTzCaCqhrg3h9QqTNJl1Amc79
	AMjHyFrWpGQ1eNTVylyVswHEYGlqEN2xUY/aM4iT76iOZip3/pQSsZv1O/I5/uwOMGqCxYaZOY3
	452OimB/US36N4PoGrHSZWBwfI6BU8auFJqRuznDLTVXB6koGwPPE52tBE3hZtE4BQi6O01iAyM
	NDF20GpBarK0sIC7M10txhV9PwleweYl3KytopgljX0ZK36dEhend0FVguxBAbhBF6jj1m1yJET
	DzY9aatW0+eUQRu6GsFxxg/+VpSXiylJtq0N4=
X-Received: by 2002:ac8:7e91:0:b0:4ff:c08a:52c4 with SMTP id d75a77b69052e-50d62772eb2mr215609921cf.18.1775503649134;
        Mon, 06 Apr 2026 12:27:29 -0700 (PDT)
X-Received: by 2002:ac8:7e91:0:b0:4ff:c08a:52c4 with SMTP id d75a77b69052e-50d62772eb2mr215609621cf.18.1775503648625;
        Mon, 06 Apr 2026 12:27:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6094sm3644119e87.47.2026.04.06.12.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:27:27 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:27:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
Message-ID: <i5zcd6ovkxbfm533cq4c5jtnxdxdd4yfsa4vavsf4s34ydjboq@4snhfwpqxlmv>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406174613.3388987-2-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: o4Ei9sGIGu22WuBpgQWT-2GZaQ1lIizQ
X-Authority-Analysis: v=2.4 cv=A5Nh/qWG c=1 sm=1 tr=0 ts=69d40922 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=edOAiv4QBLOMXHKBau0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MSBTYWx0ZWRfXw+6mqJbznlsJ
 xBXzGvV6HmJdDm1VlehTbdFo4SCF9S8KKNxIPq17jfOKrnU1NNBNc2D2uciO+sBWcbYN2bRDCY8
 Tzd/I+JKGUiBCdh+K5iMuwPnG1nAcn3LUPa5vAHB1nZVgtifhAjicCQ2a4bM6k1RfGAnMzbInPm
 iBFgkhwEFE9Mg0lcb+EkwcnekixWBCqe+EAUQnf82HOp2ONYmDPgyPIXK+o2575cUehIlHrp2fg
 z/1r/dWYLPmgUlYCq6vXLVAqmAdqBcZzKzL5vQprxONQ0Ms6udlJQgfsgN4418JSz613T61KOUk
 BtfgwZBG+yfJv3wZYzfpgBTE5Cuz5FMlev62xnbZDl+RjqPG/tNGbNn4qHUEPgI+tPtR5A4VOwK
 DugOapRp+qePN6/hdmPD5dDiOvcTR3sXbcvxdZMreqDWt6OnkKbzPgW8ubO/l4qZNBe3hd3AmRl
 tHI/42ujz1/lD/AiXpg==
X-Proofpoint-ORIG-GUID: o4Ei9sGIGu22WuBpgQWT-2GZaQ1lIizQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060191
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101993-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA5E93A6992
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 11:16:11PM +0530, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Add the base USB devicetree definitions for Kaanapali platform. The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 154 ++++++++++++++++++++++++
>  1 file changed, 154 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

