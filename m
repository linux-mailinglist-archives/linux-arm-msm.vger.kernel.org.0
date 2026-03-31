Return-Path: <linux-arm-msm+bounces-101047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHMsCamzy2kpKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:44:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBE2368FF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9403530CA7C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A93D3DBD76;
	Tue, 31 Mar 2026 11:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekael1d/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0rpR+0M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55A33D813E
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956889; cv=none; b=doXqNBVZOcg8itcafdxtEGkB1rV24JSbuwjgSPaA2p2mPjvdBLI0Emby/j40VJCkInRs7oDD1f7eoGs3/UcoFOd3Orm+MSZQQKAuaKZ4oDebYk5psImhWmE6sRSXFdGsE2ZPxyaXRMYdi2Drbmh6l2MMnIkUTp5YBei8ldY7qLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956889; c=relaxed/simple;
	bh=gyBFP/b/mLiJYrmBbkDNlvJj4Cb9GsLsJxV65G81sLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nbsh4R/mDEG9yqGd0tN1tL6K5mgF0pCvTGIODnME8NAuN3tM+0/CSmzbdsN/Hmy7xWTO8fXJWFlh/JCJ2Bgtcu8Gye5iLx5p6iv1pCz58buUXVSr3v4xUIj/q//UpPxMlC9RKt/xQea27HPHPt45QrECEDEJbo8kDskX1qGSoDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekael1d/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0rpR+0M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6mZ8A2391396
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyBFP/b/mLiJYrmBbkDNlvJj4Cb9GsLsJxV65G81sLU=; b=ekael1d/hRf/vJk3
	4oxbIMMsXyGWTlDhIMRytzUco+jyDnRboQckc0eEJ5H+xYGxtjnIFXuOK3G1OmIO
	Fy+9oWdSNb+QEk8zp3dJMbCwiQNfGBXAvTaLguSWkCkpQkwP0VRbExWguWU0RjPr
	RZN9uMQwA9bd5Di+GF38ivilr5wYzL96igaKicEaU0f7VZl5Mm3o9creSDWEV8/o
	jlKNlS1OsD2qU8UgQgb1Nm744ZC6nhcpaLlSdPtreldZsxObcpwmbs58Aqjf/tEg
	yGLX6p1/n29rvvIY3TXikMdI6TIXBADliSaO+vyBGbmxY+qvWsE94jxu5nowXDU+
	V30WMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7mawp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:34:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b31cff27fso51847291cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774956886; x=1775561686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyBFP/b/mLiJYrmBbkDNlvJj4Cb9GsLsJxV65G81sLU=;
        b=E0rpR+0MFMKEjQADVi919fktCvRlhfE7OO04hg5UHPqHg8aFtvSDbO/1nlDVqL4Qh3
         Uy2pNj3S0Eq+1opmlJDRigG3kjhtGY8b3MxvQ85fX9g7IukllkhC504NoxW4IBxcm/Bx
         cFJ5lz9zCe5ZzhaFB2KtOHSm2nNSoNYloXwLMNyn+oWmmVfWcBtQYPjpZNJfH1uIvPfm
         JbrhN9QP5ZadPgfbeXcJLo7EgG0Z0k3ERmLIpMkvDzJ6caW+k3E1/y1QKYQFQIfLUADs
         V2cFjAhoRVuQdSUcfvqjFehrgm4v7J0/UtIul14OqbcrRyh68Hh4xT+mWo+J2ZjLtCty
         RelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956886; x=1775561686;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyBFP/b/mLiJYrmBbkDNlvJj4Cb9GsLsJxV65G81sLU=;
        b=KmLqIr01derqIYEpLDfIe9iwD0tbAWngtf1SbFWXWEON8rubTAZIzxJcC73eqqOeJo
         Q2ZiifTxOgqgMnokdaOWyzbzxsMj30OQuHqTFVc6q8oFOBiWQLdnWfpx1zITPMyB582Y
         TbngrNW6LUzDi/jn0ikn98SRh7sQsM+j0YJeDfq53+Ws6+PCupmgTb4//gFToXYHmYVF
         jJDPnGikNUMdVZ1JRMtGs5q0Ylvmvt6lyo2axb0kcPmDEii706fc1nIxFRg6DmMzrA8X
         zfg4L5r1x7OQttHCsXuBXrx6A5LhZDq5jrWE6NYI0+zq2WIAfAjFqq+OxnNoF/kJiio7
         3VpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZlTqi+uTtogvWzrqnF0fopPKkQXxCcUqOgwDj/zYKZP/E2nD/ut550iaYVy0PWE95EFx3sVWP0qOqukth@vger.kernel.org
X-Gm-Message-State: AOJu0YxycNdpZRD5I+c7J/IzhEEv/UkWjFTRcjydKwIiQcGEhZyimwsL
	a2+UOErIU67rIgYQAVHxbEUlc7KXjQhLGD0LWJz3xnibwdLMy1ebS0QbXlSrbpdjfq+b4/qf8cr
	5zi4/Td05zwpuc/puev2Lmmrvo5YvdgsqhnfaKHP54z88jg4Lik/JVk77qKAhn/APIzdY
X-Gm-Gg: ATEYQzxSP7NhIcTEq2ZL+X+/SyOniANBM02xhG8rcMnnyI+9oRXVgn8tiBqHdSabnu0
	A7obmB2uy2W51UqhpP4smSw/yPNmrAQMpu+SclGWAbY69Xq8B+CD1Gj6q0DuA3J1933y7VjR4h0
	0T3N1j9jCA57ciDXYf1NUHSbd63DyIdgyATNarNLAfoC7w0WO3oM/Pxvj8II5kWP4tJ0K7xfIVD
	ZLtRBAhZHg11QygPbMu/EXOQ1hY4RpIQxK9XJv0zt1IAYyyBvDiQDoX4Q3VqcH/+9Opabm5Ok9j
	Br3EUA34xz7tN/kfX+ztBYuUiOsMBzfC+ybFjYFuapM+afWW/jAOd/lRV4fulL09ZoRHc5eQsIb
	28PvVVShJGAoIVPvq/le3nt98xGvfoJC269LM+5y8jL8ExOjZ
X-Received: by 2002:a05:622a:142:b0:50b:51a0:f745 with SMTP id d75a77b69052e-50ba380b9bbmr212931301cf.6.1774956885827;
        Tue, 31 Mar 2026 04:34:45 -0700 (PDT)
X-Received: by 2002:a05:622a:142:b0:50b:51a0:f745 with SMTP id d75a77b69052e-50ba380b9bbmr212930861cf.6.1774956885413;
        Tue, 31 Mar 2026 04:34:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4f5sm28283132f8f.19.2026.03.31.04.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 04:34:44 -0700 (PDT)
Message-ID: <66739d18-2c3d-49d9-b456-2e8c1b81385a@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:34:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ecd73358-70ee-4ddc-ab99-aecdf084c172@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <ecd73358-70ee-4ddc-ab99-aecdf084c172@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDExMiBTYWx0ZWRfXyweaSBv3wtIn
 PC4j3Kfby9ejUPgT1DB6fhcZ0UAzcc+TuCoalg1aS0IQs/l5jRVon6P49hEPLJxStvvSzQfPVvy
 ZlDRAP3pQSUtAor3AuDk2RNgIfl4x1K9eYAHs3V1Ndc4ZE7OuUbYkjkxqtgdVeiR5j56G4hArbZ
 skne9vijcTkhF6wLDooXN46U25OLwWxda+at9lOrwy1pgRGROzatRb4Qb+9D1vlItTuY1KMxI/t
 z9RrzXlPwVFFSvxwJAwA5B0GIxVkoCy/tqanEsT+OGK2dJXVC2+B5xriFtFCvtF/8GFGB/gn7XR
 7AbMBkAE8CkEwzFiqti6x8G8WKXGugbhCNtXAlyLou2m1Hl3iMlPYZbYRSOkHA+usIWlEFCLcpn
 uwt5sBEXOMDOskU2uEU7fWcg38ASbQqen6qymKETumpsYQwRoHDJrJ+wc/d0Y+xFNk/l99R+LHM
 9LeTAX9e+yiKxNUOcSw==
X-Proofpoint-GUID: YXsIuKREd3Gwly8jssGVRkXBO35uunDd
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cbb156 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=5A7uYVEyTbBfcqsGeEgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: YXsIuKREd3Gwly8jssGVRkXBO35uunDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101047-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CBE2368FF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 10:59, Konrad Dybcio wrote:
> You're free to contribute to the internal template that these drivers are
> based on

That's a very reversed logic. I don't use "internal template" because it
is the wrong approach and I am always advocating against it. I am
advocating on basing your work on UPSTREAM work.

Additionally, it's internal, not open-source. I could work on many
internal things, but they don't matter, I don't want to touch them, I
don't care about them. Actually, I imply that no one in open source
community should particularly care about internal stuff.

So no, the users of broken internal stuff need to fix that broken stuff.
Job of the community is not to dwell into internal Qualcomm templates...

Best regards,
Krzysztof

