Return-Path: <linux-arm-msm+bounces-91924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P9yGZuRhGk43gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 13:48:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 850FBF2C82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 13:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D79DD30055FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 12:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FD03D4101;
	Thu,  5 Feb 2026 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0NtUHcw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2S+QOsi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A239E6DE
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295702; cv=none; b=I7qER8OOYjVx+oF8JqVVol+id2mQqNLEO28/2IHJd/YhW7owIfvjQdaTco9ZXdgxO7eRyfpzkuSiAWrjGd8ZWmyVVJ/cpye/3uh9nh4ZUpftPviA6pkO6wGCv+mn9ofZOydpHTMc9aORralIOOfC10ApK7vg+ytYq9REmM6GAAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295702; c=relaxed/simple;
	bh=R1CdOkY6GMZvyUbC/Hg0FEFK7M+mNUBaoS2H9i4Eorc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wu5j0CzbHwqbJ+2Mnst7WFftEac8/7wpOmLOibRdukTOD7+uo8YXjC6kJgcAXxokHql1Xukf9jtAfjzF/JvhhDQEB21+u0K1b2oiAD/PsF50naaEQix89xQaldSNCMeSZjeJOf62DpH1MdeaogNGaNhmCswsY+Y2Y+UPZ9hLfWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0NtUHcw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2S+QOsi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B4cre3078441
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 12:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=73cwzKzNoPuSUijQsd3G2VOl
	70mKQlo0JAzXFXp/6hY=; b=m0NtUHcwHYXrptDzKP0JU7nVwuV/2ioAd2fNh15w
	KIJyAl0M2DzM4ZkP95fU9bns9Nce6jHUPzwxzfHGdF1rihAJ0D4EbQZYV2vg9I/j
	5KrTGN+/xlxKPwTIMJ4Pt9AhJ3AJQW4YlKP73YuFF/q3HZycxC63TnExncrRiCuj
	LIaC4L9xt4coI4TS4zT8huI2pfb2Gjpi5PKm/wLa73h3slfBjE1PfN64qYL1Weki
	zJkhbfl56Qlo98+o2btqIJK/QCv89ioOhrS3rL/Ta1pYtPAz/BHhVtRv9cagO9K7
	HPst3GhF4fM0IS79HzEMqtNoZ/Cll7f3BF9F8+9rug2cfw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0t09b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 12:48:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89493622b50so17660796d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 04:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770295700; x=1770900500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=73cwzKzNoPuSUijQsd3G2VOl70mKQlo0JAzXFXp/6hY=;
        b=Q2S+QOsimGIYCx7ifd1I515l/ftKrZe/YvIUHDXrYSsemMx6Mqg7PBU4WbVs/GYFTY
         cO2++nPqMCYWRzBnKnMzsR1kpsb87L7LOuH+NXczyqYkfTfK2UwqsEh2M4C3SkMQU6QH
         gcQizKHWWrWp6quSpmm6+343qlNoN/A6AkYnf8kkzUGZc0IDauR9C24XQkxT8Rq5WFFz
         qy9EtbD/xxjpMlrTiUj1/TJS+n83gFkfmbMSRmlKoggF6HQ9oxYabBMaz4VwfHbrVJ3P
         km9Es8m0jx5cMgjvlxcwPPas9Hj+31OttyxZ4SMRBUaHyynD1OpT738OHOGNzU3X09ub
         8XbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770295700; x=1770900500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73cwzKzNoPuSUijQsd3G2VOl70mKQlo0JAzXFXp/6hY=;
        b=Shh6aq/L7x9jlreMd0PXdD2PbS3fpLx/VZXkYR4IN/3wL6cB5RE4Li81EpV8Ez5Fbj
         KTWxVTy6MwaQEbYnWh+fHOFOc1HuzCJxK0G6VYyjKG4lCNmLSFKl/uFNfvE8tr3bzRWq
         KdTJnpRQ6CAZam1KFIlGexTdMMyE8bcsvWqtMiDXl1S+rN8hUKVfKIPxUis70/U62kES
         Pp9c5Y7YqhB7uvxGUcbUnuFev2CRMYIqtVO4i97JvZwNvO86jM03Sl2C8D+d/K1gPXwG
         uLxAXMh7Wgkrvg78IYkTjZyKiPn+bZkqEktR0V59Ny1fMM7TDEKwhRhsKhv9+pzNW6LB
         oAVA==
X-Forwarded-Encrypted: i=1; AJvYcCURzaGSid0xMIcTsTgt7aTWvR6J0mgBplKonrhNabPAIeKPZVx4jyzQCJKRzZHGzDGQ2EvFXPYtQNUrO7eO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk8piEVFVB1jQTYb8BT4oUkWxiXlRWXkXpcAS9uvmx4zkkDI/0
	LxEC1Dntdnk14/78q2lN6g8NK5V0MAcM6EkMz0ePshY3YcYDu3pH+kX8yFH2Ihh9K5xdYCA+tB+
	KtfsoaY+9hRtvwYIQi7/nz2EJPTSht2ucxI3RgTB4CUNIEMLMjrhVlqFu3y6ByFTWgBbx
X-Gm-Gg: AZuq6aL2oUEtZ3L7Om8NLAI1pQhnmAn0ZwYoompsWe6vPL7BlspsNkNcdRdYNY2OBKp
	vFwdlVY/UlNIwZspopLwODwUc0OJMRN7NRPVF9Hnz5RfOTvw/AY5yB9ngX+A/8RUNAX3ylcXJln
	HiUJcEOgX7gGqw+SOPsVX/1kbxA1mriWF+/KM6F+CIkm4Thqd1UZYx4jJda5AoT91ozJNUX6thc
	7u05zZUHkbd16cfm9QLlnZitEoxFhlgPutZqIkZgZRSC2KX6rCBXrpf4e5++Mpo3vQUwODg3Q+o
	dmU5vexxLht0vsNj0b2TKkoEpeSNAw64TUFuWNxnaK5zVh1zfVL+YL8gOsITSK5tlxIlI4z0zWl
	3XF7UwLE2xhM3v0Ipk1VymT0eSnuJi3dSMk21n3A55eSBVg//jHeZWtcRZQWHQr97lamAtk1tJC
	snxIvm6gOWyFF46SwUOdEBpbw=
X-Received: by 2002:a05:6214:1c8b:b0:890:808f:c255 with SMTP id 6a1803df08f44-8952215989amr81969316d6.14.1770295700297;
        Thu, 05 Feb 2026 04:48:20 -0800 (PST)
X-Received: by 2002:a05:6214:1c8b:b0:890:808f:c255 with SMTP id 6a1803df08f44-8952215989amr81968676d6.14.1770295699660;
        Thu, 05 Feb 2026 04:48:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38691f6e30asm9790031fa.10.2026.02.05.04.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:48:18 -0800 (PST)
Date: Thu, 5 Feb 2026 14:48:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom,sm8250-videocc: account
 for the MX domain
Message-ID: <mlpe7ph27grv4bulvwlo5lbbsjmwqqfwc3rrfwfcu7tl7qltsu@xrtzonb2t44k>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
 <20260204-iris-venus-fix-sm8250-v3-1-70fa68e57f96@oss.qualcomm.com>
 <20260205-abiding-beautiful-locust-6ee1b5@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-abiding-beautiful-locust-6ee1b5@quoll>
X-Authority-Analysis: v=2.4 cv=WZMBqkhX c=1 sm=1 tr=0 ts=69849195 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=L1mSppDWdqrFMHu5o5oA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mCDq5pXZiYCL0iTRxXlCaEl1HaZJ3AS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA5NSBTYWx0ZWRfX24/tXzG2h19f
 lPz4QR3fBKT1SFCh7D7S3EYSta6WjxohSLiwLsbZPabUeb2WGJiFGgQQR+xAEK0nfKJi82nIvNQ
 sVH6pZw1z1njUP772fovKNrGVPRTLN6RM4dkgnICfeujRjTyh7EukItj+ZqxF32ZgS/EPRzOq9I
 WSsaUO3hb0Cl7rFsPOwppJekLGt827Fb68nqraaxPAc7qi6Ht4D6tTQ5wet0lj7sA94NGeOYEy9
 ZrrdGSPVtXLxyQtfL99zStYC5WHmaQdkH6mkSL6ScsscaOg2tLuT2yvaQgWmbhvKdOPVpO8DQNk
 YLO64YQT3bg/xoRlMAVxnYKHxuyGs9aWpQvZeeelaCRJXBpX3/bBzcUVO3rEP3Q0C5hya4+mZfq
 1FyHUbm+ymX3DAO5DxG6pew/DkDNuloV380ohriha35RH/9Au6DbIaJcZc8vpa3EcarIQlS/2f3
 eo22/69GWFrD7pVuFEg==
X-Proofpoint-ORIG-GUID: mCDq5pXZiYCL0iTRxXlCaEl1HaZJ3AS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91924-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 850FBF2C82
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:31:54PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 04, 2026 at 02:59:49AM +0200, Dmitry Baryshkov wrote:
> > To configure the video PLLs and enable the video GDSCs on SM8250,
> > platform, the MX rail must be ON along with MMCX. Split the bindings
> > file in order to provide separate file utilizing MMCX and MX power
> > domains.
> 
> ...
> 
> > +
> > +description: |
> > +  Qualcomm video clock control module provides the clocks, resets and power
> > +  domains on Qualcomm SoCs.
> > +
> > +  See also::
> 
> Only one ':', please. It was a mistake to introduce ::

Ack.

> 
> > +  clock-names:
> > +    items:
> > +      - const: iface
> > +      - const: bi_tcxo
> > +      - const: bi_tcxo_ao
> > +
> > +  power-domains:
> > +    items:
> > +      - description:
> > +          A phandle and PM domain specifier for the MMCX power domain.
> > +      - description:
> > +          A phandle and PM domain specifier for the MX power domain.
> 
> This is an ABI break, so please say in the commit what was not working
> or why this ABI break is really justified. Currently you just give a
> hint that it is needed for PLL configuration, but honestly - why would
> we care to configure PLL if everything was working correct before?

I must admit, I c&p'ed the commit message from [1] which was ack'ed by
Rob and accepted into the kernel. What is the difference?

[1] https://lore.kernel.org/all/20250530-videocc-pll-multi-pd-voting-v5-1-02303b3a582d@quicinc.com/

-- 
With best wishes
Dmitry

