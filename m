Return-Path: <linux-arm-msm+bounces-93321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gITONg8NlmmNZQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 20:03:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2B158DF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 20:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F089530036D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 19:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4568E2BE7DB;
	Wed, 18 Feb 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWh8gHf/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnsK3sDI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8946346781
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771441359; cv=none; b=JV1oGIcRFxfD/IvjpiEPab3xqhkaAbywWUKkOVYl/PAFAefYrsSPJkg2C0K559hU+uGgd+xnlFIeD2TBz71Lshm1hdDafjlwxe0rbndr+5GG6v77MsgUE9e6jUFpyA47/4d0G7SA/X1BGqkvsUX4/L1BFxheEUJwSyY59EY4vps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771441359; c=relaxed/simple;
	bh=NPAOoz43RYhuDi9jjIeNQ9/kIJzQjAIj9Y0mBLlSD+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKPGTRg+3tLPV+P2nr3ybQDiKZQO6DkLPVBW2mVqSbeziO9zjLVm70Tg/d2PCp+9PlPbaPlZSB8rKYa20DquSOmTFu0MWE+iz9mjYh2qln4b6lHvUZ94Qwo/zfP1Fb5Ir4AYKjjK9xIuLOBtYcjJTYnkijxYATgG0Z+NirQL5gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWh8gHf/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnsK3sDI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IE2XM92782076
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 19:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tHJCzh7NaOhxkRn2RI+46rfm
	nRfRQdY+S86XdtOBNuk=; b=IWh8gHf/bIW7MG4nqxZcUTRpJ4wN11XMgDqdO86W
	mCWK5iJFRJLHXMZk2jBWKYS34q8kA/J4ENiUHX1rYBCYEtiIJh2/k7PnRu6GT5t5
	Gc3Kfh3wwCGZDjFcVV4Bck0wpze3EJSQAiLEPozL8Um7v9fYneaeri1cYoKNz+q8
	rS0FFCCjKtBhVrv2jhMG96TG2AHXSQdFnj2YXb0t4olSXAJ4kn2XPxpgvDKaHQyG
	E7bzODZKzjXdSet+/PCabyidlYK+LhRH41B6RhH6euUi6JW1xKcyt/DZGUfzEOym
	qBgxb59ixfFO4OOe7Vuqc8TOP2cc2KHDfufedbDACG7x/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd3ahank4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 19:02:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aaf2f3bef6so1050465ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771441356; x=1772046156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tHJCzh7NaOhxkRn2RI+46rfmnRfRQdY+S86XdtOBNuk=;
        b=MnsK3sDI9oQa12V3+AzhLDoQ1oHq2URe4aPpRsSTSCCL776zRhUzt47lAiJ8wBDLt8
         X4Ach+/Y6O1VGQILNJ1zqNKb/jEK0fLA/9KncEBfpkZFAyAReRsCiZQAY2aVirdf0XVG
         kfSp6NbXMa7HP2pzmDVtTA3yZu6Mxl8YauEocVvfHQBJqmqaV8tEfejwGrSdMi8ZM9Jp
         7b7U9dl1hnL4gWFH6ZHe0PBnupUScCQLXf/Nw5fmxrgwz5jN/mGIOSnE5BazHo61Yi4O
         sA2vNBH86rXyKV52hg3Ax9f8ZsWtVVgAvHpLw5ON3RMSdTSxEVl4LDJx2FLC3B1YIDkE
         rXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771441356; x=1772046156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHJCzh7NaOhxkRn2RI+46rfmnRfRQdY+S86XdtOBNuk=;
        b=tS7/15In0Yhkv7vvDfbfcyBAiVbhwE3fqYYUJktTp8RUcTGMw0tNeSgGnjY4A+17kl
         nKedgBYe66QjkNTIUk+IRUDYbn9E+hnMwjtTguBA5qrtNJRd8Y8DBrngcZqeVk6KVoQo
         F1DA/VD6yHhngcz3y5XrSezxfAiBDNdrXywq+6NKzm+FI8P93yrYEWeQ0TpdfkfSsVFL
         7906nreCYx1U7ZEULIuFD2IRLxPveCAezR+X53XrHrU6Vff1koBFwEN6E8nTJWlkOVc3
         cOHFUYuwmA0Dsw8DPr5Fki+x6BVUr5yc/EOZvptXbXVfnpBRd8ieVlI/e4AnkCy6hbFY
         Wncg==
X-Forwarded-Encrypted: i=1; AJvYcCVw81xjtL/L/Q1URq8nnypFwiifPq+PzNxhEEdVoefKlArmH7pYweulJSsjo6sdCOKJogsEKl6csyQQUYFR@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ3XZWF6qPJ8Gf8n29hyfdeTj4SuxaRohEKAalVIGeQyqKE/iN
	1ePK5utxm6/rqmDBcEQf/iTN1lVjN/BGHRemXawuu0ecpn3G+R5WCO5ZkbuHNjhViw4REigCVUi
	lsYaqPEshKKfuDqQZWlpaEYsX29wYgai3e3kop0y9/Udk9JHOp3Db/XQrjHHpjGwbOa4O
X-Gm-Gg: AZuq6aKJ+eKYV8Ry7MwNZax3/xMKv/yKLp1i2hxVnbMovjazphwoavTfESR87ZNRknV
	Hl1eOZWvNEIcLFfb+xzJGB2IQ+WbQ6vRAWhdENPg3K4PmVzF30aT25Ga/wBeJggBKWEEVwc3oPU
	N2y87sDeZNx8VzDZa8UtkmawqtvpJpetS7ygn0dQrj47t77huA5HJV3qK5yNGjVlTHNaE0+6nma
	EeIeCCFFDGISfS5+VlNC52/nfDKUDsoRTJbOT3Fsy4N6arPIrT3n+RKKB2J4ZAbY/kUaZ9kLoS6
	JehoF6FFWVUwAtbgNDnQL6TDTngmiTu0sQiGYumkA63kUGXvfF8PhYHcZrsOKyQa+YMvR+LPIpN
	Pj+Ovmsxg70e6MQuUrrjU9O/lTH968p5GnU2TGLSVxq/la/q7ZCXZRPMpsgk=
X-Received: by 2002:a17:903:2391:b0:2a9:4700:2a94 with SMTP id d9443c01a7336-2ad1740bc3emr158534185ad.10.1771441356210;
        Wed, 18 Feb 2026 11:02:36 -0800 (PST)
X-Received: by 2002:a17:903:2391:b0:2a9:4700:2a94 with SMTP id d9443c01a7336-2ad1740bc3emr158533685ad.10.1771441355474;
        Wed, 18 Feb 2026 11:02:35 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aadc7f8sm137306585ad.66.2026.02.18.11.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:02:34 -0800 (PST)
Date: Thu, 19 Feb 2026 00:32:27 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aZYMwyEQD9RPQnjs@hu-arakshit-hyd.qualcomm.com>
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
 <20260211-enable-ufs-ice-clock-scaling-v5-2-221c520a1f2e@oss.qualcomm.com>
 <bfbe04db-bf64-418b-a75a-88879bf0bf2d@oss.qualcomm.com>
 <aY7MidG/Kcrs83O9@hu-arakshit-hyd.qualcomm.com>
 <3ecb8d08-64cb-4fe1-bebd-1532dc5a86af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ecb8d08-64cb-4fe1-bebd-1532dc5a86af@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Zo3g6t7G c=1 sm=1 tr=0 ts=69960ccd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=JfTRIjoQZr9pu4DAOa4A:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE2MiBTYWx0ZWRfXzLZAohNmja3X
 gQ+N3w/vyZMDtgpse8MaVz+v0z8CrGXeuDD+IN2VnQM5OCZLcApaKKGAbOwMJ/Tkmreo3BElqqq
 u3PDM0i3KUl4pkR5AhZc0DrOlK6gO50jPvfXC+dLTjnsdTz7pFbNOReEqgBwEVkPArpIWqO+QWg
 SpZ2a+O/cx5rWWi9bnpzgXQ6KD1hwxqGsIjKdfMAQKUjBeq7xHMmlha5etf2uTpTWvOY871D5wP
 eKUiroQpjeSKG3uJBdAKdqJcGpm8mEejpC4i1zpQbjB2xF0Z/J6rfu23cSudqClSH8sE5pTYv6V
 92OrzK0nvljwnQIC7t5mga48PytPxge8DcbpEFdqCBNoAQOnMGimbiy0HQVPoK5dr5+W5VR9tTs
 j2H4ytzttKavi03wbSVdYJmgt4OscWuLyn8lcTr1v4WjkunmqglQD9OMbm8lbV5vNVsrMMIffN9
 MpAyKCpAK7zM1oiG0Pw==
X-Proofpoint-ORIG-GUID: YiFO1w9O4tMr0ZXHWeVC2os0HsSarUPN
X-Proofpoint-GUID: YiFO1w9O4tMr0ZXHWeVC2os0HsSarUPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180162
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93321-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 33D2B158DF0
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 01:18:57PM +0100, Konrad Dybcio wrote:
> On 2/13/26 8:02 AM, Abhinaba Rakshit wrote:
> > On Thu, Feb 12, 2026 at 12:30:00PM +0100, Konrad Dybcio wrote:
> >> On 2/11/26 10:47 AM, Abhinaba Rakshit wrote:
> >>> Register optional operation-points-v2 table for ICE device
> >>> and aquire its minimum and maximum frequency during ICE
> >>> device probe.
> 
> [...]
> 
> >>> +	if (!ice->has_opp)
> >>> +		return -EOPNOTSUPP;
> >>> +
> >>> +	/* Clamp the freq to max if target_freq is beyond supported frequencies */
> >>> +	if (ice->max_freq && target_freq >= ice->max_freq) {
> >>> +		ice_freq = ice->max_freq;
> >>> +		goto scale_clock;
> >>> +	}
> >>> +
> >>> +	/* Clamp the freq to min if target_freq is below supported frequencies */
> >>> +	if (ice->min_freq && target_freq <= ice->min_freq) {
> >>> +		ice_freq = ice->min_freq;
> >>> +		goto scale_clock;
> >>> +	}
> >>
> >> The OPP framework won't let you overclock the ICE if this is what these checks
> >> are about. Plus the clk framework will perform rounding for you too
> > 
> > Right, maybe I can just add a check for 0 freq just to ensure the export API is
> > not miss used.
> > Something shown below:
> > 
> > if (!target_freq)
> >     return -EINVAL;
> > 
> > However, my main concern was for the corner cases, where:
> > (target_freq > max && ROUND_CEIL)
> > and
> > (target_freq < min && ROUND_FLOOR)
> > In both the cases, the OPP APIs will fail and the clock remains unchanged.
> 
> I would argue that's expected behavior, if the requested rate can not
> be achieved, the "set_rate"-like function should fail
> 
> > Hence, I added the checks to make the API as generic/robust as possible.
> 
> AFAICT we generally set storage_ctrl_rate == ice_clk_rate with some slight
> play, but the latter never goes above the FMAX of the former
> 
> For the second case, I'm not sure it's valid. For "find lowest rate" I would
> expect find_freq_*ceil*(rate=0). For other cases of scale-down I would expect
> that we want to keep the clock at >= (or ideally == )storage_ctrl_clk anyway
> so I'm not sure _floor() is useful

Clear, I guess, the idea is to ensure ice-clk <= storage-clk in case of scale_up
and ice-clk >= storage-clk in case of scale_down.

Best would be to use, _floor for scale_up and _ceil for scale_down.
 
> > 
> > Please let me know, your thoughts.
> > 
> >>> +
> >>> +	switch (flags) {
> >>
> >> Are you going to use these flags? Currently they're dead code
> > 
> > I agree, currently they are not used.
> > However, since its an export API, I want to keep the rounding FLAGS
> > support as it a common to have rounding flags in clock scaling APIs,
> > and to support any future use-cases as well.
> 
> I think you have a bit of a misconception - yes, this is an export API and
> should be designed with the consumers in mind, but then it's consumed by
> in-tree modules only ("what's not on the list doesn't exist"), so it's actually
> generally *discouraged* (with varying levels of emphasis) to add any code that
> is not immediately useful, as these functions can be updated at any point in
> time down the line

Sure, understood
Will make sure to update in next patchset and make use of rounding flags.

Abhinaba Rakshit

