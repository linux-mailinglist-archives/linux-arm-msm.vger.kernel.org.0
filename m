Return-Path: <linux-arm-msm+bounces-112892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BdWFIwDCK2rrEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:23:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2696677C53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:23:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ahj9TDTG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SU9NCr3C;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112892-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112892-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BEB7302263E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576113750C4;
	Fri, 12 Jun 2026 08:23:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06B92DB791
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:23:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252601; cv=none; b=Xt09niB/E48RJTyUEmaSJL5oftfR5ZOIQme2iiJP4TY0BfYmnVr1xZPWlURfkxBxxhfWtpSagJfTchCwMWtEJtKP3KfUUPfrESnXPqEy0xcR+0yYryNQKDZmmFJpTiZdYaZfR+nbtmV/MSitfgHoGLNlRr9cwbIBlRdAoGFsM1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252601; c=relaxed/simple;
	bh=/Mo39LbuWvRhC9Hu0sdWS9GvhB+uezotcg/aCka+N3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrpAJOV3sOGHey07aGlUtfrxxB1SQVNaPqMwZ/B7jccjaJLNxaFcgE13MaJafIdpzwVXljaLxFtbXO6L3IDhPEpTki2i3TBUwQoHnaeQvEgt2u7gIPlcJCG1LSOzXTdXvnR7mmPMK9DmhE3UXPLn1P8T0IPxMZMk4Na4hfe2EIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahj9TDTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SU9NCr3C; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BbSR2548181
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9l+5o1r9S2xr00C2d7XO//P1
	yNID3+8R7CIuRwo4Aek=; b=ahj9TDTGVJV2NF+QoThvq+WdEYD7FRyB8Am7FKmz
	PFSCcQis8F+vYvEw0kvxJq4zn5bMg9GkQN7F43dbhPqXAS6NIzk/4X3b2x+BMiLQ
	xl4a6Y9RWsrfDAFfFhtCTe3aJeG819fsifCVlkJxcve3R23PBHSF5ymui4WD0FCN
	e4sR7BYGUdcbOFtWbbqWudT/g8veev394F0ecXG/hucQOrq5J2T8r7YNmF7jKiSw
	gQSjMM0K5ntME41jL2YIegjPmOvXtuDZMU3wQ1HjHppVUbTVpA6+b8i19IkQZRwU
	khwkfKu9vwDRmBHl2NB6PJUUynSNwB+ItXltpj8PmBnqKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29utbaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:23:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51787404d3eso13593041cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781252596; x=1781857396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9l+5o1r9S2xr00C2d7XO//P1yNID3+8R7CIuRwo4Aek=;
        b=SU9NCr3C6W5S3PlXTaSix8fLvf5c/EcNbusrOlKhPSxZQOTWMuISz4ltRFipjnaMon
         0vzDqfn8ucb7QaG7mur6ERwWlDGWWmlFISRoXSjgS9rRfkVS4ikFFdo7Fkp5+6i79Hn0
         IpfIdOQ9ZIfWJ4VF83eUf0Jjxig/D6YCZuhAOtMMpN+rVqlgPgOG877Suz6clCrmBXU4
         4A02b8eoX7RYTj2aYDA1iRtxIhlKEtO3arn7BNar8dYfCWp9h5l3Xm7wcNVaOaiSQeZz
         ezqypZkLOfNnJ7lF2qz8FjOA8tDSDpwK+4fgld4uijBc+Em/nKkVJh8yuM/v1/Ar5X3t
         huXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781252596; x=1781857396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9l+5o1r9S2xr00C2d7XO//P1yNID3+8R7CIuRwo4Aek=;
        b=kLC//lKE0Ji4BFAjy6V5EoVGbFj7b8in0VW8m4hctAyn0dekDShw+kQvIlOiqWJw2J
         yGURRuaXj2cU/yfQOyHXU8yXgxnswujRx9D/T+40dVMMrZKQ3hjHQci1C64XaKUIF4Qs
         7+UYmq8OwO94V6FCY5+M3bYJXR7P7YmghqK/mpJeO45c1x9eMezyh59v/mcXL47lOnh7
         UcKTRgMNf0044fz8zYgyaGdeIYKmIR5rS4DEQi5ojjLnBODQOIHvmJ9+Txx9px2zpYib
         zqINl9Bs4jYNtv5vh229vizz8aX25fCvIh1qdCh439XNpNneYGDzurNX2jY0LrKPh/OH
         e8AA==
X-Forwarded-Encrypted: i=1; AFNElJ+QL2Y2ep5S0a+Xcmu8+9tiCnMH1R+5qi+yBCEOZwNiFsk4M31E3wgn1A45kj3Av9xcQ72B8ZUEf3XpbQdk@vger.kernel.org
X-Gm-Message-State: AOJu0YwQibr5ZFj8JhkEkwE9gA3kWwCpGpgPF4LqoDUf2JtyGZmpNbNe
	bE0SzWgLHCDHMXj5MukSR0Ln/dONQf+25IHX2jjZ1qNFZBBH71hL6LKOnWWD9PeT6kFp0UXpNFc
	T3Om/s/QzP+iwAoSuHBHJ5LjVFCDI0p7YfSNzJymzvlK/9s8uGKbiCvQYE25kKoEWeMjJ
X-Gm-Gg: Acq92OHcctKZSshXvHLbCzIfGHfeH8/mCKgvFSX6w62HWWhGF7HBlDeLMFH53X1ncXZ
	3g2fvGrMX/N3+AhTj2bTyvo1SHLSU49lK6HHo3Y6nkWgfJVZIqdMm9IInyLqHAaKru88wFaV/Pm
	oy9Al2muskgidnzNLnY3u72sO6qQZKpddy45SqOxLWiX5MfHT6LLkw9yd2t+e+/iNLZA/Ng2Rb5
	GFWAbi/A+KdDWrWrVYgCznkLljhV2YWc9TzPE139w2fF+LQ8oUq8yK4oWzGCD/y6FFbPdjWdIOe
	f+zjcZCpCzW7L2s4/PvnL5cU2X36mkkVX362axmAtsV7pXGkIkrUscjtVQ6L9BljwBtNtNMX4pp
	2TK3QVr8MlfFe1dPnBx23FVfi2hrzDLBqMz3ZVWeEP117oXaoOaJTDGLhDFdGXUckLufFGDEG+Q
	p6oT1sBh3SJTf0KNirLpaUYGS+/vkL1UaRPX0=
X-Received: by 2002:a05:622a:24b:b0:517:87bc:9b47 with SMTP id d75a77b69052e-517fe4eee29mr20587891cf.39.1781252595936;
        Fri, 12 Jun 2026 01:23:15 -0700 (PDT)
X-Received: by 2002:a05:622a:24b:b0:517:87bc:9b47 with SMTP id d75a77b69052e-517fe4eee29mr20587561cf.39.1781252595548;
        Fri, 12 Jun 2026 01:23:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a063sm340215e87.26.2026.06.12.01.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:23:14 -0700 (PDT)
Date: Fri, 12 Jun 2026 11:23:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kancy2333@outlook.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Message-ID: <lm3yngkad2wcw3bfjcsfsmucsekmulhov4c7oygtp3e4f54fhl@lgj7gidpma57>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
 <tkgqorjdnvwcx4ddgi5m7j3g6wlawxnm5ugty6y33ftwxzbvv5@uxcai2sgglfs>
 <e7e6d38b-6d80-4c75-bfbf-eef49589ddbe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7e6d38b-6d80-4c75-bfbf-eef49589ddbe@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3NSBTYWx0ZWRfX0aejguS+0jaa
 vAFgwlQKW/gBYfqpzZXlrdiqQN4ulRndhFfK7yNeY6hmKRkVqK17uhiYblKaQYXYEG2hrBTwGrM
 TcMW68VKyFL2ketaEbIYyOJ1S79957Y=
X-Proofpoint-GUID: 16g4WO1qDfBKpfN9Jfg5VL_IlT_9gqkh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3NSBTYWx0ZWRfX5iEq8wPHlBKb
 a2YagBf0eRpc5RHvmicjmKUlKwvEp/IjHoTAXIuQOJTxA7BXPWlH3qXNgp3YSvzyYv8YKnLmyFR
 PJVkiFrBIRy2bAfzhT/XIQtXKuBPGPsAIsW3Fi3qAgb8GB1yfhreddssAtRX3LXKblwE39FFS3E
 3SmJPrY+zgblzpSJ7HGLBT0RXRq48ix6bsGx2V7zmdfZERuKWZKC0g/ekiC6ccsHW40atMkYy8v
 h8IL8oSFze4XOMhQNVg4symXwseFqzT0ySY5x/u1i8G+T2SRVABAc88KuANbWpe7aknEqe5VFOF
 aNArKuuednPG8kwMc2fp5WmYY8adb8Jxudw3QMFC8DOImt/63Bdsy6DTP/x3LCXLxmjLjokvgvk
 VfpbHGbpK4NZ0lYX4u7zhbUiZfm1JhZKWQnR0FMPgr5nRgzDefqLziIRcOUXDi3V5tx8ELJ103l
 4pXyVixHF4Nn8GM3mUw==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2bc1f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=MC-EAa16RIyZf_4PNl8A:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 16g4WO1qDfBKpfN9Jfg5VL_IlT_9gqkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112892-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,outlook.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2696677C53

On Fri, Jun 12, 2026 at 09:59:02AM +0200, Neil Armstrong wrote:
> On 6/12/26 09:57, Dmitry Baryshkov wrote:
> > On Wed, Jun 10, 2026 at 09:41:47AM +0200, Neil Armstrong wrote:
> > > Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
> > > is incompatible with the default SM8650 generic sound card.
> > 
> > Incompatible, how?
> 
> As explained on the cover letter, the WAS speakers are not connected
> on the same lines as the other devices handled by this card.

The cover letter isn't recorded in the Git history. Somebody looking at
the commit in a year should not have to look in the mail archive to
understand what is incompatible.


-- 
With best wishes
Dmitry

