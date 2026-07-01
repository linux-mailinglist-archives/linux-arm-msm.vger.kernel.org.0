Return-Path: <linux-arm-msm+bounces-115616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 99JqEOnWRGpX1woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:59:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B016EB61E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:59:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FaVAN2Y+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DO+Pc8y7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115616-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115616-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03ABE3024EBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518A73EFFC5;
	Wed,  1 Jul 2026 08:59:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26173EDE6C
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:59:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896357; cv=none; b=nffUZJ0bHAkBPvmS6Zlyg/n3VtMUIJ/fTi/sAlcI6e6CFQUGSW2SPTPNDoRravj2F2W0IJw4COV3HZZ1sMIhQQl1QK+cgFooUIRvfZLAi6IVJnL4fljLtZaClmitpM9XFtuVZzi80nvvIRgf1rl5+lspcfIyR9sPeC082vPmkQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896357; c=relaxed/simple;
	bh=vYhW6sp2VV3qy2pd5m+ykuHKAdjzoYeYYAcYIKeSnL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gX9LL1ob6JysMiBS8wYIffH4JjDPX2vfWpWrSsgwj2Jim98x2o4dQ8ZapQkDV2BuuoC1mWR8VpcBcjS249nXt4VDZAFiW0faxLTqrtVXjvf7yBU5fBWLLrszHKisywHNKzRi8QF1d4cYrwmWZ/mPAvyai4uXclGcsKKhYG9ctSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaVAN2Y+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DO+Pc8y7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G8Va410937
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dY4DQsLIWN155WO3Hf1JbtTF
	IG9I3zBKpW9XXTHmvwk=; b=FaVAN2Y+xPKmLXoLUyXMYC350Ng210RlU6vx1Un7
	FmCUvk/yIePvFjvrrTpjuKl/ONbmkE5uau2kgNKW0krAnwHTEYWqLUAKgYsAkzxZ
	60e+NzfL+VctU83Pqh+E8qP9uiQT9J8qT9icZrId1ZUohgoK1Ph2ZUaK2/aEam00
	QZZa2lQkklga54EWLulbqob9f+URu2DWKiULCGZMjaoZyJOGRWsWgCOwKYJ6MLMN
	e2rKr/mirjC572wrH7NDKKMq3odbc+ITqzegpbnTlP53DzghhNXg5+En203Jo4IL
	ONqQJwiwhv0aIK7whz9wvJxUjoguyhMlA0pZk0VaTHHkBg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfybqey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:59:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38096521198so818231a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782896354; x=1783501154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dY4DQsLIWN155WO3Hf1JbtTFIG9I3zBKpW9XXTHmvwk=;
        b=DO+Pc8y784mDXDGdKGJfoT6xYmkc/bTmb3nD2wasjiGkNBOgpO8j+2WLqYcpDl6WCC
         E/8gerkFIBUl/00oX4VtRJECK4AL4Z4vsAfXi8gDkZgQL6gNFHoCO+mTZrfH+ocvcQbW
         rIB4asYqjebGvTwKAIgoWVvluitMSZ73DpIBj+w9l4MwuV9BGBE3S0JfNm5gE9e/lLdx
         jbPYSANddO0BhyvNb504oKEQa6vynhyhnNMHTuXwRuznqp1Es4cMC6syZrzO8GGo0M3r
         lmHNJkv2QJv7sf5xrrb74wHmYf8o+w22Q5QlG7cOyhbNuLU+0W5EBu3JVeF/YG9qHLFb
         aTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782896354; x=1783501154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY4DQsLIWN155WO3Hf1JbtTFIG9I3zBKpW9XXTHmvwk=;
        b=L6XqR997owg5/aCbI+q4WhAWFhh/sdnX5FmQyIOAiSleyTY2/I3COVl8CkWvrO+idP
         QNAK6PTHxkHagKCFwqJ/utuhkAEuUPTuMubESgvYnFJ3qDsqMz5DbdG7EOYDIYBTEijG
         zxOuB4bSXV0N3Lim8JmNGnvVx+nff+mTyz3n66LehsqocKVFTZoxhLAbcxyuau27s7yv
         ZSYw6pP2hU1ihdbNW4d74doL2USxklTnwxki0REjJoVZGXBdvHuVRC5myICJg4Qw5XRN
         zvlXoPuKFkSOOHsFBr8kD9bS9Z+OHrEQE4vyNvyBVvmn17UXYL3Y1juVkmI2THoYqHZR
         V7hw==
X-Forwarded-Encrypted: i=1; AHgh+RrTRMwAcXQwr3Y3t953nhEwEg/55b8HcXH7jL9LVbeWt4zwekwW0C38jRwGlHnLvICBOX1O9I2bALgkvvZx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+CcvBzaykuTfAargZCJrxOAma7ciTKEP3mFZC9FTV3r0rGda
	JFPM5hTA9SkEyF51F/3zwUFKOpXDNNbcqAvrJG9BENdT2gy9SF83JRW6pjrE1+dh8336VgjXRtd
	sWgt6/ii7ymc0JA/VdzvJhSHuxffEh2Fsu1zHRyIwwtkeAmUBciFj0YZYqnB2yUIWm76u
X-Gm-Gg: AfdE7clTzn6jQeasex8GNae9EQ1vOPgDwbHZr4pgiAHkIX61vYAbwVGsWA3teJttYIx
	n9HPite0M9ke3mLVcxl1nE53YL5uabBSxQJe8pFbzNa0ZqRRXFeztTs41/VfuH0n0X8goLYVbRn
	jid3dC/YcXpFKI3IAbEZ/qVEHLcxRhQ4mA1Gu2Z/sDzlz/o2sE35nmvoW0JfBLEaWrpgZN2wPSC
	3st1T7dB3PbR1bC3doIZEXtlZFSMDCHaNi+xkBlcC1/1g+nVYXwq69SZCSgm7owBFJtvph7HFpP
	pb6saHf3kv97C397uZBzPx9OjkbK5XT/+Qjxq2dQKK0xF3yy01bndOH/si9I1Hq5aXbKF7mKiOB
	WVUSjGod5Y7e9IllW+FKoQ32vx1BjQyLY9Jqbv4o0TeFPHg==
X-Received: by 2002:a17:902:f711:b0:2ca:302:2a36 with SMTP id d9443c01a7336-2ca7e678096mr9412965ad.2.1782896353927;
        Wed, 01 Jul 2026 01:59:13 -0700 (PDT)
X-Received: by 2002:a17:902:f711:b0:2ca:302:2a36 with SMTP id d9443c01a7336-2ca7e678096mr9412865ad.2.1782896353497;
        Wed, 01 Jul 2026 01:59:13 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b8fcfsm28370085ad.64.2026.07.01.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:59:12 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:29:07 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: lemans-evk: Update SDHC storage
 support via overlays
Message-ID: <akTW29UMV9L/TK9D@hu-mchunara-hyd.qualcomm.com>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
 <fg4lxixp4fekhxbvisohgxoiaqya6gvuw5czflkk54kvr75xs4@nnze5nvbk2ix>
 <aaWh9ThZJK49Ex4o@hu-mchunara-hyd.qualcomm.com>
 <ioyvbf5wqfvu6ddl4ua2upow7wdw2xmdjszuoubh5cbsko2ovg@gilcelxn77di>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ioyvbf5wqfvu6ddl4ua2upow7wdw2xmdjszuoubh5cbsko2ovg@gilcelxn77di>
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a44d6e2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=yZ2IDrj3TD960BM_Nr8A:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: haXkuTXjQAVXnDP1C-ZNE5kFa0WVWWs1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MSBTYWx0ZWRfXzxT3LR0UsTeU
 hF8iK16tmHcEUBoX1zMsKkhQ8V9ow7H2bVMn2JkZYrDlO7zFJNJRii+oYGckVtoJOv4vcW9v57K
 gR6o054h+s9eq+BmsS28lOvzyuH+Fqw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MSBTYWx0ZWRfXxXnkoL3GqEmb
 Q0mlXtcxsHNH7u/AX1YtZ+cWTj2kWV5qhdPwZDZaOEq8T+AkDP+W5+Xy2T/7ZgqV1h6W5XqjjHT
 7IZtNu0y2d7viOk/8zLPxXFauRFjbLtQrtl9q6yeb5wHFApAeR1qS8T4LZoD6HQxJm49x5k986/
 NQwABBoKGVOslNmBCbkf++Ssi23MZYaAJA4xT9Oxgc1CkFH10sU7doTmj0fQH77gaVRy59LKCDU
 EXSFfAc9NJ46SYY8JsDW9vUfGF0O/pSglz8UH5tF6xiZgvHfttvrsxXYzwkPYJtPAw5ZOHS5urW
 Tp+72BD7mujbfZUhqfFnbuzvyedIwSG2D5qPMcinN3DntwMM4uEMLVB+ULIcyXgRygB/RKkIle9
 GuCHeCh7UZA+UVaKn7DzGtltOi+7F/QFfBZxGDXAtM9i46Vpj8SGdacn+J/2ZBHoUEQjyPPs527
 Jx4kSJo22Thp1LICwBA==
X-Proofpoint-GUID: haXkuTXjQAVXnDP1C-ZNE5kFa0WVWWs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115616-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,hu-mchunara-hyd.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6B016EB61E

On Thu, Mar 05, 2026 at 06:52:17AM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 08:13:01PM +0530, Monish Chunara wrote:
> > On Fri, Feb 27, 2026 at 10:07:33PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Feb 27, 2026 at 03:54:03PM +0530, Monish Chunara wrote:
> > > > This series updates the device tree configuration for the LeMans EVK
> > > > board to support dynamic selection between SD card and eMMC storage.
> > > > 
> > > > The LeMans EVK hardware supports either an SD card or eMMC, but the
> > > > interfaces are mutually exclusive as they share the same controller and
> > > > resources. Previously, SD card support was hardcoded in the main device
> > > > tree, preventing easy switching to eMMC.
> > > > 
> > > > This series refactors the SDHC configuration by:
> > > > 
> > > > 1. Moving the existing SD card configuration into a dedicated overlay.
> > > > 2. Adding a new overlay to support eMMC.
> > > > 3. Updating the common SDHC node in the SoC dtsi to include necessary
> > > > resources (clocks, register ranges) required by the eMMC configuration.
> > > > 
> > > > This allows the bootloader to apply the appropriate overlay based on the
> > > > desired storage medium.
> > > 
> > > Is there a default mode of operation / extension? If there is one,
> > > please define it in the base DT and override it in a single overlay
> > > rather than having two mutually exclusive overlays.
> > > 
> > 
> > The LeMans EVK has SD card slot onboard and eMMC support via a mezzanine card.
> > 
> > However, if SD card is configured to be a default case in plaform DT, some of
> > the properties like 'no-mmc' would conflict for eMMC use case which cannot be
> > deleted in an overlay file, and vice versa. To avoid such issues, definied
> > separate overlays for both which gets selected based on the actual connection on
> > the board.
> 
> What would be the result of not specifying the no-mmc in the base DT?
>

If 'no-mmc' is not specified for SD card use-case, then during boot-up, it
would unnecessarily attempt for eMMC and sdio paths which are not required and
can be optimized with this property. Hence it needs to be added for SD card
use-case.

If SD card is made default in SoC DT, these properties will conflict as per the
above explanation.

Regards,
Monish

