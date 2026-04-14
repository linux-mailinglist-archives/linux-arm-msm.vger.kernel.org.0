Return-Path: <linux-arm-msm+bounces-103068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKdvCB/73WkRmAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:30:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A653F74C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCFC530053DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA2B3A1E89;
	Tue, 14 Apr 2026 08:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7Se93AD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNe1n/8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B2E3A3804
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155077; cv=none; b=Bt0JB7CMvu6u3B/JbdV0K2V4yhsLu5SCCgGOSwgJZCtoO6TNRvA8lRTGj8q/OPOFSrqa0m6Ao+s5O4Zg018vJ+HJ+52u3rJ7JcXKEJ6PSqw7qUDb4Qo0mUlHCc8QJIUKbImscV7GqOuCr1EkPjlrN7FTXL/ogGBPjKQE1FN5Rqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155077; c=relaxed/simple;
	bh=9IF9m1mKLVzcQNa7yd1qS+gKQCjkoMgglb99+nR4csA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuSrLnhNOPDIigr5rwlSFtMIdtnPnMQiz+V6YzJroDPXoEsBNzN+sTDmZlrPwGIU/+wDVP4aSyFYC6EYIvA4shC1j246YKZRxx+hvG+pxHCiNibZv1+WhsAB3Kvr0xYB7KifOsnkMAYp2M+SN0JboP/QZmzqBJyh7yYlqSy/qMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7Se93AD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNe1n/8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6jGYi2509959
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aIMSYQ0X7vND3I65jUYYSFUk
	nWvgiYPlHx2DQST0cP8=; b=R7Se93ADokkKnwQTqrzGYCGmgfCsHHcNAYh3ebmP
	rl9XNbnOZGCrsnG1yD4dluHBO9erC1T8klrNo3afg//7n2/QlYaIc0Jh+QFV/PzX
	FiqAgJBtWgKEtwz2CWviItqBD78GameoxWi1sOWR97B/WO9dDQwucrPOC2mFGh3x
	dv8Zm8syqY8F2N0cuWPTDjaaR/gYEpUy9bVMyD8E7PEwGDDqm4Jd54DNFjc89xTg
	pT8kBD1fiag2geFEbRVDstutB3VO4U7WQ1jKbk0fCZH0zMYlU5cSHLKf75P2kjOx
	4rXpLkua566QR3jOQI6CsuKOM3UbxHugQcFPybP2iTSPpg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867sr6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:24:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2eba42b8dso21158345ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155074; x=1776759874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aIMSYQ0X7vND3I65jUYYSFUknWvgiYPlHx2DQST0cP8=;
        b=HNe1n/8L2wh4sR4k5oIX9XuxtMFt9KJo603keulaYu7EeWYTW1oBHu3CRPQbuKqgfn
         XbGd5fFD9lwREjn5MtzKqSI2V8dbnQaC+4rr1P23LoLKSSFG0ndZiuyzXHZ5S4vvIMSM
         EDgEHVVy4siPhM4kQf7Pjsm6eEw3ms54uMfuz6hI/OSQZkSqcq7ArN/uNoWGbA3GFjSl
         dtHLlEoIRtpjgVoesIcjJ1Ogc5K3bc/cn6jvSNFn7Za4pFU72GXS6THTsYLrVVwCIMjF
         cmxci+Ev2jNQX7owcJuceAfAvDCjufciB8q7Ark4PTqsAGe7Rd1zDayD5DUQgeqE1jBS
         aygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155074; x=1776759874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIMSYQ0X7vND3I65jUYYSFUknWvgiYPlHx2DQST0cP8=;
        b=EkyAars/k9f1vyEC5Fg1FCj9oaeRJak+cWT8sulm1ztR1u8EldN0UHijcIMIYkSFEf
         MvaP/0bh7j5H1+6WZfg/6DClLuI9h+aF/hFzUH5leSecq9OBRO2OXvE3mDp5n0Rc9ct2
         DkwAD4gTa0xdq+HZ0yJI6aj9ifBGOD8rzvB+iUJjs2vzOXw8Pz7VYUZIO4i4tRGLJfWY
         uP/IoqdArgsRURu+BwzKeglFbCOXHURbz+g+RC/xRfZD4ptTZnuuT6ELQdkxnqokSL0x
         qj9oLPescanfZv7xlDlqmDNJf7ywTZvj1oni+0frsi+e9xsxBiGBy8TXL9v1FuAgqdf/
         iQ8w==
X-Forwarded-Encrypted: i=1; AFNElJ9GrEYxVq7ixfbZTwU8X59qyWq93OFqn2pRcRylGu/6UCHeaOFpJwnmlbSBRhN/nx/1LUXUbvOiPyzPhGYH@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFTJV2+oJ4dkBdOZrLq4lZtj7NSLQ6kgk1u6iGqREfoQ56VxZ
	LtUhl9B73raVLyneGCR8NOYXnVTCJjnL8qqP5ZBEBHaTmAhkwOIPBKcOGUOCTeoWWMmA/QxURhn
	hJpfmBV1UBTqMFGACNUv7L0h3hJ9ZNrhnsD92zegejDgwXw80Xh2vbkBv+K5jlylE595Z
X-Gm-Gg: AeBDiesm9H5P+GuKplrV3Smp5378A7zAO6Mvlb2szaMZp0pEAGflqNurOd8M5OADLKH
	iNfzdCMmNgHgCMabn/tn5tHhQk4EFYxg/L7nXHkpydBR2tVooy1siRD2IhXs12zrE4L/OyyoxTJ
	dAPoRVPXmzSwnw5A1dVz/MG5ER2VyQRxJzWzzsfUWhVOcaGkZSE/qLHDqgLjMh/ju5lZnFD0kKz
	jsrdu/r54SBvW+tfMXVlyA2BJwoRM5+K0HXinaPeKSk/o9X09/qqP9A1Xgs7qCcBClU9g2ZLARL
	1WDpQZyXriIX6cp+bY8RrfR3XFFLm3j2IjOfHPOhlsmBvdvOFMM9SJcU2RSV/C3Yaa0M9f9JNpv
	A9ogmG84GvKgDJH+Rj7fPydJ67E/pgc7PerBJcJx9GqD9xPYG
X-Received: by 2002:a17:902:d504:b0:2b4:5ff5:e51a with SMTP id d9443c01a7336-2b45ff5ed39mr67690055ad.19.1776155074128;
        Tue, 14 Apr 2026 01:24:34 -0700 (PDT)
X-Received: by 2002:a17:902:d504:b0:2b4:5ff5:e51a with SMTP id d9443c01a7336-2b45ff5ed39mr67689695ad.19.1776155073576;
        Tue, 14 Apr 2026 01:24:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dabcdesm146235985ad.2.2026.04.14.01.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:24:33 -0700 (PDT)
Date: Tue, 14 Apr 2026 13:54:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
Message-ID: <20260414082426.fhkgwpjth7a6hzxe@hu-mojha-hyd.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
 <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nm3l9ge4_Y8IOrJLB8l_t6cte_4xw1vY
X-Proofpoint-GUID: nm3l9ge4_Y8IOrJLB8l_t6cte_4xw1vY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NyBTYWx0ZWRfX2yh1KN/BtEVu
 rHJj+YGAS/G7IeltB7vsFnqICO1o4aEtQQlLG+CVY75eElSDmz8/4mQ/fB4kaTidkDgJmWM5VY4
 WTzaLKVWtOfMEyQw8qSp0bSlEA5XBsihOZ9eb0TFWXqxLmh/LiH5VZQHrveAvFcYIoNnolORdKo
 I6zE336sdQRiC8ZoMojm08xJNTkTE9zhEr04jhJxx4tRdssQQmuKOgkdqSB7S6sDbkq+A/p+sVE
 NYojOKRdDJEs7Bgugb46ozur/dDmmLFd1IZiPOjL9waWad2d9M4GgJkJ3Pu86rmbWtSPf3As1NX
 NxcCSARdKdr+x/T/RUakwQw9mwpDmYLN2V4/oY59lE3IuJCZESd36c/T8FsAvxdOi0vjqfxImIE
 IxV4heJD+a+jc6WFcfsllNmZ4t0EKxdKN2+Ynna6fz5q6AbZjEtYwhQ6weF2uk/RHeG0wj0BImu
 UU3Vj3UQEazy8zVpHfA==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69ddf9c3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=5-FrFs3OjuvqJegpMgEA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103068-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72A653F74C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 10:23:59AM +0200, Konrad Dybcio wrote:
> On 4/11/26 4:32 PM, Dmitry Baryshkov wrote:
> > On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
> >> The PDC has multiple DRV regions, each sized 0x10000, where each region
> >> serves a specific client in the system. Linux only needs access to the
> > 
> > Nit: there are other OS than Linux. Would you rather point out that
> > other DRV regions are to be used by ... what?
> 
> TZ, HYP, HLOS, CPUCP..

Thanks for pitching in..

> 
> I'm wondering if we can make use of the HYP one on e.g. Glymur, to
> parallelize accesses (and whether that would bring any practical
> benefit).

I mean, Ideally, It makes sense to utilize extra 0x10000 to use or just
to use the hypervisor one for Glymur.

 
> In the RPMH architecture, each "client" has their own (GPU, AOP, DISP,
> etc.). Then, each one of those clients may have an associates RSC
> (Resource State Coordinator) and/or anyOf BCM ("interconnect"), VRM
> ("regulator"), ARC ("RPMHPD") voting interfaces
> 

> Konrad

-- 
-Mukesh Ojha

