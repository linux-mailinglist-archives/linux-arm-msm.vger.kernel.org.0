Return-Path: <linux-arm-msm+bounces-108078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAFJHjcmCmrAxAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 22:33:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC0A563C9B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 22:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29F17300F5C4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B936B2DEA8C;
	Sun, 17 May 2026 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFxVq2rj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGagUwDh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1401F09A5
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779050036; cv=none; b=cW+ZYsVqGZwUELn5K8xSe5ncZxCTM82AhCXZHgAq2J4pGxe+/sYEEz+UazW78frEsSkwh0N80B+zsx89dkgRSyMK3yCPW0w8+GbF0YRS5W2JYGSJco898mUmKwsUg7HJ7mEbwCtU6T1ySlDh0INfGt0AohvT2XKoAnnxaLTb8W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779050036; c=relaxed/simple;
	bh=YGCss1ExGt5tgdwH3q63DBMcADFrfxlrUUJkfoXuRf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlp0S+Jlp/l9LEdcx068E5GOFsqGyZcSb4MsNVXQ/IuIKmofnNaUcDBq2ZbvQYdITy9LvYW+ke5hmCDJeAgTE8U7SVZ6xhClnlPqul97jTV9Q5AhVCUYI1zcsOmeoRDRrdMRnANEX1vpsL3YTesGYwGHwOU7eKg1LhTSK1aIX2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFxVq2rj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGagUwDh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GNoVwt3234421
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZTaaCyVW+PIEY6rXUjwhEoqb
	vFtUUWW5PJEmQpA/Xbs=; b=GFxVq2rjk9n6qjJyBlKXerWjYCvY6ohM84mLDqBS
	BdoTyiLwZrRtN7HVqaA3OSeppymCVI1r3iUMOw9XN9iu32Xl4Zf7m9P6kwp0ysev
	mh7LlHVBRSU8pbGE10616BLlXyACUOSvFaQId6CUw9PJJfcfe8NBSDb/b5v0omi/
	uTUKyEURetSh0E87rAjP/2S2XMLmYn28Oe6AmXto2oMPFSoNuzfIRa31aQWvlUdv
	sgvFxfgJF78JuAV1h9edRb/YpEVC2Elz9QaspuvlRPEZ+gb2FmcqBeGL5kACM7Yh
	1o7oM6rEWKDwMDH8W49Pxbcli4/KaDvRMr/Yom0gzh17EQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvyujmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:33:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90da7efbd60so425286385a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 13:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779050034; x=1779654834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTaaCyVW+PIEY6rXUjwhEoqbvFtUUWW5PJEmQpA/Xbs=;
        b=dGagUwDhzy16tTGiwvMFxS4+D2UBwhocENbjp8PHGyHWVjU1SaBj3cIMNooYnaXqhD
         TcZ38cn/5ms6XxaApKXjTgbTCFLXcG0AXOlKUqbob1kX48/xd8OtPK9dukJfQavxl/+6
         IFTvvNmoID0B792drWNQed6x12tNgtLhWn1k4Fo7oBYdi4lo1SW48dLJirpxeVCl+J/E
         6MRsqnWPdyremnaxp0Hz19ndbCrZ+25HHPtTxl9dOZ7Qv58JiKwNxnh6K/QF0LcvdJ/r
         zFeTl3cwipxYXkzhHncAAa51QhOcvnt02/AqqB3WH0E2H11E4zvE2wLYMesMvb14qi96
         8krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779050034; x=1779654834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTaaCyVW+PIEY6rXUjwhEoqbvFtUUWW5PJEmQpA/Xbs=;
        b=IkpkPCFkcsTJzreqd/q1AJcWqXeZrIoNWMP8Kp4yH+KACi2z/KpIQoyPUfNYeQmNG0
         PBnBiKUYabY0BhbdQV54P0p11kGCPK/kMFe4lRMtCNEkej9X7gfetPm3bwUPyF8yPy41
         m/+GlhNERZiEnqTwDbVWVrFvvdCh77PJ5+qG0uMyLVKrTwzMIx7VtKap8u76xCRSazDs
         fUrj6kQUcuf6fNtL30xkQtHQwH22dGC1YKDA4j3FGy8eUkk6unO4Csj5hsMohDpbqFFF
         ZWu3klD9/ynEzYyWlQYGe8QUNRAq3tBnYg5YMNjXqSspQ7DEFqtVx7GVpDugyhxP6jOR
         pPyg==
X-Forwarded-Encrypted: i=1; AFNElJ9LCHjO/N6VzmX+ubLN4niUau7BO7S6PvObDZ5MxFTr9x17DIbeCfl4Xf5c4/fpIj2wbfcNhm8Dc0IKwnHF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7z2GwEUDMdm8JeMm6aC4htP3bXa45CYkptp0NjgfNNdzXPuh
	B2kIQHvyZVeQR2eOlP/B05pLgrQte28p2KIMAjMjBHHPbToi13z79b5RrfWjXoqWVn2RIfAvF2p
	U421bZYhllk4DLgLPqrErIdQBKeIwxH9erxHoBUhjMbQT9NbP4n+MBJtoyyiKiQnvmDFc
X-Gm-Gg: Acq92OE0/jau43xZQCT+hpYVOVCU82yfpImt0daWt3MuyXpYQPv2Kv6dlS0Mis1jBvM
	rU7SM+HIySReVcZC/VCHqvGwYDPCTf/2ztxNR5dcYJf6BTHTwUJRAE/6/e4gLjMMpXl9blDr9fY
	CjvSI4O7zyFgHY9910GNydvJf83jo268gr69ZvD/OF8jGEBBeT+3iUh/xyZESR9eQILo206spei
	nDz9ejlA2ke2O3vNwb0DT2hnWhJCew6IzErE1UR4LWjbfeMkmUwMoHJJZ5/6VDWFf2F5ukPuioe
	DMyozgG7VkOOUMh6X9jV7qlyGt6doo+QdOsxVTpBuKcirCIib39IGkI+OMd5MTof+HwQJDB9pO+
	WhOlv/yL+/OkLwAPBmFp3hcNEmvEEGR26O8d8ODlq5OPcEVciE5Cf67dQ6Ycxn4SImr9GH4zmoW
	L0fMZZFy6f7PKm+Ed9x3gMGDOG29DNNrCmk+K6OKFpFthAxQ==
X-Received: by 2002:a05:620a:390a:b0:8da:cfe6:c67c with SMTP id af79cd13be357-911ce71ae7cmr1874481185a.28.1779050033854;
        Sun, 17 May 2026 13:33:53 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:8da:cfe6:c67c with SMTP id af79cd13be357-911ce71ae7cmr1874478785a.28.1779050033471;
        Sun, 17 May 2026 13:33:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11ebb0sm2911625e87.36.2026.05.17.13.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 13:33:51 -0700 (PDT)
Date: Sun, 17 May 2026 23:33:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: azkali.limited@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8550: add UART11 node
Message-ID: <mt6hb3u5men4y5az7byjdxhhsuh222bialhfqjpnj54eqfqz6u@uelqemwl7dgy>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
 <20260517-pocketds-v3-4-d5910c801756@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-pocketds-v3-4-d5910c801756@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIyMiBTYWx0ZWRfX97ouBVlj3Sr2
 V95yVtaVJ5Ls9uolF4UY/6M/ZIilZhdAf5A9nwLyRpqNpXT5c/WSYKNPUs1KzsthMlZFOouHZt3
 j5DLc5ViJIaPxruOkcCq0vNknRjQVQ5JAa61cZmlqUW7QoeEmlEj+yU8doRCS+njoTPP5kupAum
 930zeX1GJiWntedkO3p11bxm+eZbwWMlFGnRvo6wiyxvPSI8XF69HV56Kc5rF0bptkgp0dRBNHC
 5EM79w29AWoI1ttDjYhanybQXHdBmO5XV/u5bb3wwzc48G5usKgjQRQ5hjMNwPX+eF+sBukxXgK
 57oVHBafr3AYFS1WB+Jcahc/QRwLS9w/1WE+F7eTFgz0CIFLLMZeqCiaoJeVlmAxYDTnaklzYNP
 Ib/xrho60XQTfA5k291gMbzqyKzVXNv2eCEK1KHhV0tnuFJ/glxxKYV0NuNzy3RFSICDMMTHc8U
 L8LIvjjTQWa3fuJZHJw==
X-Proofpoint-ORIG-GUID: 4VFgNJ8CF8xXejVPOXHmh7PzZ76LDjOB
X-Proofpoint-GUID: 4VFgNJ8CF8xXejVPOXHmh7PzZ76LDjOB
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a0a2632 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=JtKtZ5FLYQbQWUX-Rs8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170222
X-Rspamd-Queue-Id: DDC0A563C9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108078-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 08:14:23PM +0700, Alexandre Hamamdjian via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> Add the QUPv3_2 SE3 High Speed UART (UART11) controller node and its
> default pinctrl state to sm8550.dtsi, so boards can enable it through
> &uart11 instead of open-coding the controller in their own dts.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

This should come before the previous patch, otherwise building of the
kernel will be broken between those two.

-- 
With best wishes
Dmitry

