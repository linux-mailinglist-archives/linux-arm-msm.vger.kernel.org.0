Return-Path: <linux-arm-msm+bounces-115808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VzSGI9ehRWqbDAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 01:25:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15C6F246F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 01:25:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=heeBx074;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BXjMtCR5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115808-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115808-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9303D303281D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 23:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DFA35C1BC;
	Wed,  1 Jul 2026 23:24:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B9635E1D7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 23:24:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948284; cv=none; b=d8RikJNx2mR2ynGZTGyx5CeFD7bw7wRawtYNeuxvFMC8Xu8EPHfgFjpBB3q1JuZFiFq2jMwTgtLgIL2l+/LJrvvLeC0eQv7arDLrF4PAxkDDdTuUn5As2Scx5U+d/v060c8Xjvs+RiM0gR/I7oLfYKx+UmLexd2ovJnoa59j5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948284; c=relaxed/simple;
	bh=FX83Gh0fEBrmx8X3MdUZiAluFH2SpLb4shTVWYrTpp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=td3XBLDXkaaRVHbL36Vi+q7LCzcfN5Bc7BWJqxVL4xXhIEHfh3PVPqjW46X/+dCY02GhfUB0wF3p43dd6FtUB5p9BJUBo1dDO0i4/69KMT/TigwtBUmzlvDpiooNJ/mDuJrWEKHZJzaKQ6pwGCu1Dy5fm7q6impyghFL76jfKyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=heeBx074; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXjMtCR5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661LhkYn2358689
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 23:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2hvamgifKm2sB1fXIHK+rOhS
	pe4bd4g/AfutVumANqE=; b=heeBx074q+C6T0fma3VVv/HtU86WHMgVL3fU3vbr
	s24kfBFWwTWWO6IzCF+GEBmkRyGQEtEMsAmtCxHEWbqJFXTBORzIAoHdnbR/5LX2
	hcui7NXaqSskHLoptSSC+wq4L4Er9FavGF5lqZ6U7plGNK5vQbRjMCAaSbHRrBxN
	BiFfKnOqUQ8jmZMQ9iABb5H/dfeBANcD4Wae5poBpkeMpfxwlSMPRl3eO8BkofIC
	hArXmMc8h4SeX4RNfDnB5FnHXB3zK/i9yIV4aSRk4m1DK/qFFkDUSwx8ozbo43rA
	vt7veqTUn8AaFwKLCLsNkwZ0yneXD82rk9jlVl6H+W3CrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0a799-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 23:24:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92da6f3cc81so149925785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782948278; x=1783553078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hvamgifKm2sB1fXIHK+rOhSpe4bd4g/AfutVumANqE=;
        b=BXjMtCR5UY48WPpxl94vsq9jam4a8YqO79XxMxEqEFco7B381RPiVp/Jsnhhb9uJnB
         v9oOc093cyfNuFhjGIukUrgQwNxyozy4Q0i4Nx/kcJ3eiYnXzMdVztL8FefEv3D9ahcE
         wO7Aih/wxyDQf5PPBkp3J+tFAKiiWRkaZYTHLy3CoxVwMEDYWgorCmO4FwN3bFoQEqio
         ge8OvBMS4zdkS+SWS4it/DL+UKDLLAAMQKrVqFUp/M68Cu7KUhBmsqM7JBGxMCbIqD/J
         WTUqX7Px4tXRK4HkH5jQWDvpkqHJM0S/f7ZT58PsqVKO2BTGHZwd5lkmh5Evj745eRF/
         PbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782948278; x=1783553078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hvamgifKm2sB1fXIHK+rOhSpe4bd4g/AfutVumANqE=;
        b=ifvoExf4vP+wOadLep4Y7G/4Jnh3wp9hKXenaCKnObT92ZDOEOEhyDhikX56oO9qTv
         HQeSjSh1uO8wv4yfBN/ZKOKGdwLnATDmMvGRokxphkVa7aGQcksda6TxM/STSQias0gK
         S/WK+9e6nZ86BWLqNHyGDPU9WrmeHF9eipWgEkWAISdfySUfkMCMvikO3nu5su0Fi1CN
         i3oLSY46vzvzTs4CRTevppEYseElkB5aLHh+6502rxHxgR6ig7kJt/BKCSiU247QThQ5
         EpYqGfLirkPuhMPQoASC4THn+CSrpnBx5cUMWvonvpRMCnBL1sbgA71RaGjkK3UsIiNW
         E4Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/qW0Nr/kpsILuWBPBbGo2syK6+VBF2t7DnITQfV6N86SmaN4x7bo7vD0qCA5yOU2XUZ2DdCYDj6eQZxY4t@vger.kernel.org
X-Gm-Message-State: AOJu0YxQTMNWFxpE9jyPYpMLi2198pD/46EGTdnloke8bhkT6GkDC7W2
	z+/5cyOOnYf07uclpmArkhZum/iq9O/d88uBBWAISHmuC4Ry6uA+MI0bBclbz7925IytUrZTMw0
	dVq0GDI2XCwaq6qsLF8PwrR2W5T2BW08248a5tc0x0GL4Au/fCdCq30OGbUcymajPHFhy
X-Gm-Gg: AfdE7cnABaXTlk49zvbItZ/5nPkRcdbMIdfzSKEbiAKXqi4HOUtHjGVLneR2gCa6log
	Lrj3laZicMqnWTRs4phZwysljIs3KpuCRbe/aMqWxWsLEMpjlT2DpGViuI9BXwE53k8Z9N5jjn2
	tLD8VzYOuMjyhRbWXF1sHQQtQ2DLJcHvIJFnaWTKf/E7XteOut9Y/YFsVOWqP2nGgr0I8rXVnOp
	d/vCixSOHKrSK5FhhJnL5TpCc7SGMGOiKrNQgKLxyw7d+cNk05J1wdJfdlV8z+QxHd8WDfYCtjw
	8jmZKjGca7cldtjmNSwjlO8/peb46xf/artdU4eqPdAHKRd3LlbtNi/JX8lRDD0MBp/2p0veWg3
	7mN94XnDrz9y1mvUEavJjJ90nqoZf9+78bvgzJMGuqR+t1moWHaa5aBYppEs5tOcQCGjlxYlYMm
	/Rfcu3PH+s/3SplCTUeCWP+HCP
X-Received: by 2002:a05:620a:46ac:b0:92d:6961:9519 with SMTP id af79cd13be357-92e7b0139camr436520985a.8.1782948278317;
        Wed, 01 Jul 2026 16:24:38 -0700 (PDT)
X-Received: by 2002:a05:620a:46ac:b0:92d:6961:9519 with SMTP id af79cd13be357-92e7b0139camr436515785a.8.1782948277685;
        Wed, 01 Jul 2026 16:24:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec8991b0dsm320333e87.15.2026.07.01.16.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 16:24:35 -0700 (PDT)
Date: Thu, 2 Jul 2026 02:24:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
Message-ID: <vodejww4dwqanw55dsyhinaxx4damkh3mpi22g7zaaabz57khz@o6njpo34yrlc>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
 <20260701165051.4122259-5-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701165051.4122259-5-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a45a1b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=uS2ns290GtotmmKbczwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: xl5nJPK3lbFYqy8BeN1dubQhIUEYO3bc
X-Proofpoint-GUID: xl5nJPK3lbFYqy8BeN1dubQhIUEYO3bc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDI1MCBTYWx0ZWRfX+osjpKq0Toyk
 CwHH8yni9CwsRsjdQoBkSyYsKz1UHh0uHiXRvUuT48Zl6kly8u5v7YFc4VoxOyg+6SlU1/MG3fw
 Tj8THs840i5RIm/a7N9sTH0T/n2KS4JldOin6aasKIzQ6fb/GX+VR4Y2vausg0M/3V8hLmfqfjT
 J8SlCP05F238FUrboPtmHJl/Xv6fwfh/XGEU1JbVJEkwxA+8/UTs3v+JB3eVDz5eZ3WUL/T1hc5
 3f7TubUhjpImI00dSPNyULgrIlwmLyMLUXzQmmQCw3vABdXIerbk8L8QTGh5DsZptBa53ndV0zO
 cA3yy0UjjLx1i+xIR9frDot99FWOdl96D2c3/emJ67AICZ0XHmBoI2cr98Z17mONHa1kFj4OZuH
 NnNLfsukRzAvkDmewdVEF6EUrQTDN7s/qm0c4Ck0TxwGmSfLJijzOgKzbN6Ncaai8B9sd9qxlQe
 /U5uYg7dgGszm8B7llA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDI1MCBTYWx0ZWRfX19CRrMwAfMGY
 CrTnUI0yn3q3sElSARdQtv5mocycDu2RHXlHaFFw0HaOIBvRzmN/MnKc+ksT51+64Smc/3LVgTY
 c9nm4QyBmbWbIifA48YgOmhjG7ernZU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010250
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115808-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,o6njpo34yrlc:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C15C6F246F

On Wed, Jul 01, 2026 at 10:20:51PM +0530, Krishna Kurapati wrote:
> Add init sequence and phy configuration for the Super Speed port on Shikra
> SoC. Also since Shikra uses 3 resets, add support for the third reset and
> configure Shikra platform data to use 3 resets.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 53 ++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

