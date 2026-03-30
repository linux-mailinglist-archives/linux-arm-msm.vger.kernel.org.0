Return-Path: <linux-arm-msm+bounces-100879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD17HcHEymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:45:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC91935FE67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4B83302A197
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815393DEACB;
	Mon, 30 Mar 2026 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBU/Enpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z4pm9gfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183F03DEACD
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896243; cv=none; b=Fbp/aWFzQV2TD42GXfw/chsdaPuJ4DWbWAV9rczTcPjmKRfY6JnDQJsoAxcoPFQYSl+jkQ2BXDowcboijwVzrvUQK72LwoqHFXmJwwWlV2+8wRJQqAqsDye6g6iwM7DU4HwxF5iIGZyMVgNOAQ+voSwRf8PniA/JczegE6NcdEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896243; c=relaxed/simple;
	bh=7S74te/iaHvs9X36jFLbxBSxTSMIKGssJ56y7866vC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3niKP39KZZw3B87iBk2UcGXLKHav+8muZTcbcL6HNEQzlxnQ6/58ThMupfXb61J+SB7qJ9xGaeFHW8K/9Tlc0ZcHE9Kxd9+g08TVwt8chBbs5RFna8tFn8rnKCBCpiuMT9LQxgexbZqTT78LYs6viWgUs566V0IdDcw826ecSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBU/Enpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z4pm9gfG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UFN5EE3173912
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0/gLIt6Ee4AwsPWRgQM3o8gl
	QvL8D3oR5sRGXMhyo3U=; b=pBU/EnpxrbO1qAYrTV6alchWS6IZvUXDAdTWhucT
	EOgq3gPtzBW6x3pG6Yi6qlO0nXkcnNwo0yOT5uaYUOYuPSfxHVrlt4Wa9lG6Fbn3
	hmUpVdGXwitG0s4gOPr4hDEDzTmQXwVveuWqO/zrd+oE+4YBtuuGywLh/Ma2WfQw
	+qanVdZoa+5ImKEt3trvLXJ3sGpWdZwGEvcw4RmVN2U8HRkW29T25gJI0vNks/US
	W3iScwxsfQagjtuwhltkhEuQ1V35pkE4VObKuX0kPacVIJl+7b+/GCwy1a+A6w4a
	71HhP3JaYyTbHMu+k/Hf1bmIE/lNk0VSqm5vNR3zoi4Xhg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h201g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:44:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093787e2fdso239919051cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896239; x=1775501039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/gLIt6Ee4AwsPWRgQM3o8glQvL8D3oR5sRGXMhyo3U=;
        b=Z4pm9gfGFCCrqC8GnA/PVtd64Emw63wLvOS/+O6MVY3HN2luD088QjrWV66IxpL9r2
         iUakiRhf6QFSQt4AhMI0YJZyLti6OMnjcHKuSNcDcgpfkLPEeHS0NXrz3eaopTWJEiVF
         9/hSz6bmOxMgoC2vZQBipm5DuvtXnFlyaaf+rgH6SQ7BQq0aoBvq50ZgCyBKuIS+F9+E
         XY8MIugg6/ZaY1Ujwh04w35PXlsh8tBOmr3BwIZsF43Zor176/CejUoYO8UF1jV8g70g
         nqYCThjliqjj4ScSsVd4t4XqBjBJgu5Nj7IMPKNqUze8e7S2rn/EBR4RuaEa7YUyVqZ4
         53sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896239; x=1775501039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/gLIt6Ee4AwsPWRgQM3o8glQvL8D3oR5sRGXMhyo3U=;
        b=mg4+sf3jW/KcpBdi2EGkiy0XVdjcHLLRAk+ylRuwD4OOmJb4VJgU68pWkUS3bU0uDY
         d9G5z9B7Z3mpTyUPrzd1LKgvEEl/x8j7bRQa36tXLy+/WBmxcORfl8lxgXsfHfAaFrJE
         4EeZEI5z5cxH3wkY631XA0Q6F7CrUSO5/8MFWlPNRipopEQfutlXvxVyXuZglfjQCsfO
         fkHKsqdXX0jGlke1Hrb4bkbjCqPcog+PV3QFh+Uzwbv/4DGFLSmE+OScnqAvY1h6Pb+s
         2KvXpPxDTRwu7My9KFuO1YNZ/zUWooXW47j9EKNq3vBAbAkrJx01nzJF1ZK8lhV5RYnv
         UHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaehi/PBb4pZjQJqim/Rf/tml2E2aIFBfRvUIaobzupuI5xHJwzVcYnpBgpENaVvQgGYtDMvbBLMFndCNp@vger.kernel.org
X-Gm-Message-State: AOJu0YytKq2Gfk78X0rPeKJFcAtQKA6c0V/u+kW5lLYWaxEMA7Id1ZSp
	E8JNwtA8FJlyuZXUEV4eI95b1Ut5muU4BNLncygGlcRsuHxd4Spy8bhFwpcNGdR1myrandKUIuN
	qIB9l5TSnB24f6ZdeqVFSsEZgGQI5MAfR0nSxORaYLnJMeJNEHAtwLE2Jf/YxTMb6YcNV
X-Gm-Gg: ATEYQzx8tG3Tehggf7T/KayQ8M75fPdmfFFQn+z2DgvIOUusPmENQVdoXmPsB4LM3oJ
	B6kpSWF6NYVbsE4PfBFuNO5XBLtwPAsokakEa2K7PwWOprLMKk2dAGh0/V2hQPjGGGyqd2zxKk2
	mkyK+ke4r0vjGrQvKvA/DoqkwD/VoWsDJdAwjnm1txvCdpFYXseJmnOqPTR875pUDe+zZS852Ds
	aUxA0HApKlVrBrC/1aN4jRT4Cr6vzsegpRRSsUtzVTqwAJobk7EJ8yIyvlIIvp3i6YETqjf/Mdy
	SMD1xg3iJ5/ZGGDbd31MtRzFb1ljS9ywjnwQGoAC6K8ojIlgKjgDo+6q6HysVRupYmzo/e35kQO
	ZlHPvlvSMNtesjvktUCwd8Nh3Z0WdcbSjx6d2YRC5v6SE1ggor/Lv9zJUhldO+2nCm9DoWg1chW
	Pf/03+mQ9EWvX6E86PLIx1YY08M9O8eCrdozk=
X-Received: by 2002:a05:622a:4cb:b0:509:456e:a179 with SMTP id d75a77b69052e-50ba39524f7mr170166281cf.64.1774896239466;
        Mon, 30 Mar 2026 11:43:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4cb:b0:509:456e:a179 with SMTP id d75a77b69052e-50ba39524f7mr170165781cf.64.1774896238931;
        Mon, 30 Mar 2026 11:43:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4312sm1808455e87.16.2026.03.30.11.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:43:57 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:43:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/2] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
Message-ID: <gelqawu7bhlhx5n6bc4oy4b3xxaqjehmove77dah5rnwrnfdlh@vz3e2vgvj4c6>
References: <20260330165237.101045-1-mailingradian@gmail.com>
 <20260330165237.101045-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330165237.101045-2-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NSBTYWx0ZWRfX03836yKvmE+h
 g+2lJRaFr5HjhOYTG4dCH5I5ibsRHzh6QPxWlIoUU2Efo/9TSCkkpiwjTYfjBJZ8m2ETwy2xsMW
 Xes6zO5JrCj3EFOZCkcs1N+JDREypMJQh6xyTv9J1xEWzz6jjMFcq9i4hO6EILm+b7OOHixo/QX
 ZeILFBJ9owOHtOL7/xymZ31JykAZNe9Z6sue7uaxNE5reUeRs9QdksWigcUgeSSrrlEBsVwwYyq
 CC1YBEoUD6HjH1nI0aSG15X5OMCwmPU+X7K8IdPbSiXmvxc3e8wZ7+bGTHtd72HBgufZDB5m9EA
 iybrkI8ToYKdFm2LuQpUF4w9AVO8TquYWJnsofmGVmhdNdUqpKwVz+vD8jJpUG7mTGScDV0MKir
 ZKNSumorO6ZCUOPwT+YMHuz94+Nlcd8gZiXaEtyoPpdancRizdO/3TATeZ08HmMPr5LTzRrtUHi
 U6QT7kIKE3kr0kSQLig==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cac470 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=P_9oW8mKO7fl2W-26g4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: vGpjOvDCmiV0nZmDtFuQLQkEbyXjGzqK
X-Proofpoint-ORIG-GUID: vGpjOvDCmiV0nZmDtFuQLQkEbyXjGzqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300155
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100879-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC91935FE67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:52:36PM -0400, Richard Acayan wrote:
> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
> the first 6 CPUs are in the little cluster and the next 2 are in the big
> cluster. Define the clusters in the match data and define the different
> cluster configuration for SDM670.
> 
> Currently, this tolerates linking to any CPU in a given cluster.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/thermal/qcom/lmh.c | 54 ++++++++++++++++++++++++--------------
>  1 file changed, 34 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

