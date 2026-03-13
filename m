Return-Path: <linux-arm-msm+bounces-97608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO8bFHZPtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:55:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5818D2885A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 483BA3006209
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F92D3D6484;
	Fri, 13 Mar 2026 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bM03dwxr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VB8Ozwya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1352131E853
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424497; cv=none; b=UXxDmBvztCAK3TwIXh+RnrepZ20Svgy36kHFGi/Vs5ZMmbGUWmhX5rcuHe34krYlwSrWWsk5tsGbq8/Pwyci2ai1N6SQnCGtWAf0m3embtOdTdzKREJDssHGb4EMcGlyi2KmzwvU2fXc4k06GdFvftfeSRYOlfTX0DmZ4joTIW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424497; c=relaxed/simple;
	bh=Bp2M7sSZfRF+plmr7ty0KKNhjXKHyWfVTdsuLufilp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3rIe2YIPofXdY6h1m9Ot8jTOuwNmyzOvyRq48+v98G6k89TbEJctzJ+g/NLSTyHRuU+7YgGkmoMeG46+fiHj1Bqv88Y6+f936tMP04xzH7yACudsFGZJVaCs8bmw+RcGyIaS3J6qf2ijep6Kr1GWYRcVkSQi8zwvJZcFtHI46g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bM03dwxr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VB8Ozwya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCkXvk4140672
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cYu+P9LwBMsQaaLA3dtI/fDh
	5gGTPcAFuyKYQ49R2QU=; b=bM03dwxrTzkqFagZBCY1y1gq0ijLsMpkFkn6t17e
	Ii5cxNK+kXUsxi2EdKBAnCQIxaKGQKr/Qgeq+HjEyowZK13lnGbXkIzWhlFrog/l
	Jk9P13VDwanErtVKtvBRkvi3oTJMqhFurKMVMMIB+T/e3JljBAkSNvSqrptAaph5
	O7cnapOralMwKm18zQw4jpmR3Y98SpfRf09WyqjO24XreJH/rh8EOGDzVWUvlLIR
	pqjKt6Gwl2ts/aV5HRtUFzdXMl9TLL/h1Lgbw9C2Br80JR8RL615Upc/hJ9U11WS
	bFHaHx5Wz4933X/TVVwWkePaCWDQZPp77AJqcPrypGvweA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn2ankx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:54:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd849cd562so1504514185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773424494; x=1774029294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYu+P9LwBMsQaaLA3dtI/fDh5gGTPcAFuyKYQ49R2QU=;
        b=VB8OzwyaLyY070p9U9J9W5J+NB7LmHJsk6XSFSYz+eHiDvnKVH4lhdQql4nRlGqcy9
         wea7mYiEFP2k2GuMeojm3HMjEk1Sw6eXUDyVweD42g7HTYOnyp/0Fx6jXEqXEQ9mNq7T
         TLHf3ZBjPom8PkRUH5htH9osC0tKNtVtGaNDd9+ND4Av0U7hQ7L16kTP4TCs13CkqQbi
         ZdsFB8077DcDS/Sce8VsNrfi1rEM9Lh1AYzC1bf3jHHuKZ8AVsdFtsvF18ftGa0W/JGM
         9tJAJsgUB0LQu++p1tuhnkRTGHidmA7sC8FPx8SXrniKJZPFP3bUO5uFsOADEdDGdH6B
         IgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424494; x=1774029294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYu+P9LwBMsQaaLA3dtI/fDh5gGTPcAFuyKYQ49R2QU=;
        b=CbG7RrR/XyWIK/ymzrnn2CcgM/DiDnKts0o1jopwWOuHNtdIuqNdTMrvOjLI3hgl+R
         KvITj4plwTmGe94OwuyDg8NL17MgcpdOXyY0DysoQFnvLqluEi7wNbdnPyyIJXy2t0wG
         w3ozfN2pyo1DXl5LaRxtX37KRCxIXl/rYAD2r8k6Fo9LfiIi7P2dVb5mAV5drlSTFRKW
         reRw5vV7atux57mtOxUO3srJuPAsvGJDU/by7jxFvZ7vWb4okPxObHzOsZOnY6Ym1mUj
         PWkbtoOxQ0i0mnT4N3rjWMsNMUD/hvRWlMONk/vCpjGJ9aC9tna17PSK34cmkrrOVC4n
         Uvpg==
X-Forwarded-Encrypted: i=1; AJvYcCUwokWzkT1vOVwIW99YpDTyn4CNl9xqCnb1+gOXc65k2vrnKFtg2kKNegRqBOHxUZJE66AKyW6DZoU6+Yi7@vger.kernel.org
X-Gm-Message-State: AOJu0YxbjZ4MANlyDvxQwj7oIexxdRVXEwwsEs5lOzcdZEptxEAGfBrD
	ToPFJNWgTqbvUnLxuSeVlEqF2Ev2XKMfJD+bXhohs4iLRRfAf7SDAY8ltv5K3MmHjldXryVL49A
	+usGtyo146Mkc0dlHhL1FS3VYE3UQKZz30kK6ctcZfDe7YGKjeZWOxYuYjNSxBiWwWCfF
X-Gm-Gg: ATEYQzzDcCPBQzzOLf0IShAHIveAd9qSyIa6MuNdHpGi/z+S0vOcglVi50/7xTEDKir
	PcbACERaTVlg5en2VGh2mxsa0J+LSpUtaqu/McBwoI92pEhytkc10zGdIRrZESWdbfw3qCxmK9K
	pLLt4wMTBE+l6uJ9MILrCsNihzvlRst65A7NwCmIKENwADTjS1QmxwNje9eaSG1Qzv6BFrP1SX7
	Bz98zTWab6wc2sGFovB/XlFHqczfIDbVDO8oHhCsNWwM+/4udUG2eSRUklHONdDzc/EXBDBh1bS
	sbRLhUWfZPDQHnIwgSio+8IWJmkn31zV+T55lM0aIBdTA/NAXhAsvqhdFGn3u3u0qcsOsGVXvWh
	TKJ6gCnNxZ+FIyx9ctjmb9GQkHxdZRk0kyXFTQy+y6EbwGXLDwywsNL5dVRyv1YUuEMatceGBMt
	1D8WBhl5aXufJc8GLx255bUHph8TnWo5oq1fA=
X-Received: by 2002:a05:620a:4443:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cdb5bada99mr600402185a.59.1773424494385;
        Fri, 13 Mar 2026 10:54:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4443:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cdb5bada99mr600399485a.59.1773424493930;
        Fri, 13 Mar 2026 10:54:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm1676656e87.7.2026.03.13.10.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:54:52 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:54:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] media: iris: Add IRIS_BSE_HW_CLK handling in vpu3
 power on/off sequence
Message-ID: <k4ldvfvtwqn6pr65sjk5jhgqmkdy53klrifszmj7fsv5gzcf4c@23kt4sr7cba3>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-3-75fa80a0a9e3@oss.qualcomm.com>
 <owwpmly6i6djvocnd2co42x67a3xd27kxem7x4hl462n6t6dv4@hpjljecmrlho>
 <c023b313-ab57-4fcd-92ce-c3ef3be95256@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c023b313-ab57-4fcd-92ce-c3ef3be95256@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mr1qJ2CCmZ4kKgAYO6fmrIp0SRgVihC5
X-Proofpoint-GUID: mr1qJ2CCmZ4kKgAYO6fmrIp0SRgVihC5
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b44f6f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=RryONDYhwSCH4b1mebEA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE0MiBTYWx0ZWRfX288UrtrmLjX1
 Bf1e2iFABN2OWmae7qlZ/8dpwDvbaDh+yPynQ9zdePNk1rCoJg9WfvvjXaYUDe0MCoSaARg0nmK
 cnhaa+tweaN/wbVPwQI6hzeUujaoHF2jkK6ZS8CRArPS6BTYjaO6yqWq6Sw/4ioqZ89Jdxs9Eaf
 25dW5sgywoajF02kMjcuAL3Pygf/tJR3rc7KycAl1QoefmzOQ1j7OFmEQaJMb0r18bwNc+YMqyV
 JSMV38PgBFnqVmdHemYAC8vTnUeN/aM/1M0E3tStjGkgTtUWn8Ld+gQ+I9zDUHwukxH9tIZTv+E
 1/vaF0E06ml3S67iT/oG+RptMyl+bHOyNHlmMgQG8H6Tyfxu9vIKiVZkOedsuBv5x2Nv7ShAkEk
 ryx+rhXIqH2cqR7m1UZ/FP62geO/M5cvLyHxf014cMR7KB9MxpSGksMJHAJAJzAIg3bWsPUcP/N
 UjmKKXRvIVsKWTmi8tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130142
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97608-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5818D2885A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 03:14:37PM +0800, Wangao Wang wrote:
> 
> 
> On 2026/3/10 7:58, Dmitry Baryshkov wrote:
> > On Fri, Mar 06, 2026 at 04:44:31PM +0800, Wangao Wang wrote:
> > > On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
> > > the power on/off sequence.
> > > 
> > > The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
> > > of the video codec hardware responsible for bitstream-level processing. It
> > > is required to be enabled separately from the core clock to ensure proper
> > > codec operation.
> > 
> > As far as I can see, Purwa is a one-off. Why are we forcing support for
> > the platform (and for the BSE clock) into the generic code?
> > 
> > > 
> 
> So should I add a dedicated power on/off API for Purwa, and name it
> something like iris_vpu31_power_on_hw() / iris_vpu31_power_off_hw()?

Or iris_vpu_purwa_power_on/off.

-- 
With best wishes
Dmitry

