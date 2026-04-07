Return-Path: <linux-arm-msm+bounces-102035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFP5Icxk1GmStgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 03:58:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA43A8D5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 03:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53B57300DF5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 01:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6C326B2CE;
	Tue,  7 Apr 2026 01:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNUnajur";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AgEywPh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E46F266576
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 01:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775527113; cv=none; b=Iz9GYuqn2X3s6cnIGVpzHt+IYFGG5VKyCzBU6d7H7DYdlu9acofqjCCofdvgFwXiv7PU4EHzzQ+FNqfnBeqXrbCYH5rEK0kOyKvUFXn6ntwkdRzKGLOO1daFp+bM2/x7594qsn6Dokc/DKyiR0k1aSu0qfz8ectunNBOxQw4Q6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775527113; c=relaxed/simple;
	bh=xRA63l+YvubJ6GvzA/avo3PwSsog7GW6Zxtz+XranXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBcLMddZ7Q9Rep25IWiY1EaiiIU63ibcBx2+OXdTppy3weYZZaQWieyys2/OV1xNnEYZj6voclvQoRqJcKTaxeXWBSQyvBbpgNRsJ6xeFBHpEovCbovji/SpA1Khojb7vT/j2D7Oy/JeoukLkfUNGGkZOC0GAJZo3NjJRf8gVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNUnajur; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AgEywPh/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LRnXN2009393
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 01:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oJP1nBLyx3Zg6LR86IBxxjjg
	AxuPf/p+kUwxaAYOtII=; b=nNUnajurJUiTjkdjppDdzr6HvbrOIk7iYUpBRxBq
	e8IATHPS6lZGUwuaW3RCjh9GlcfPRygtbGTpWoN/QH+gggfdM4znWRUqSq2pAIFP
	Prm0ng5jwG69wBU52soIPE+nd8OIfWm56IDagq9TLFUQFFXNOeC4xeeRRqyGOxjW
	FTyNuBjb/TvRH1W50FPKqx+cXwwAjDZ18CLImsqR9SlTSDjPVZLuSSwsfDSjGFvj
	XQZB+5wCx0Yy2JHbdLY6YYBZ3F8xLQ0LBDQFVENK01ugenY++hTZeQ2B3Eg0096Z
	ppQIoOhFgoBn2quvdqL/qw790Hya8tV/cZQJx8JbTJgKGg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrrjbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 01:58:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da529ff48so3612761cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 18:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775527110; x=1776131910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJP1nBLyx3Zg6LR86IBxxjjgAxuPf/p+kUwxaAYOtII=;
        b=AgEywPh/CcdDkPSlcHbcb4PECrb29WBOY1D4FhNzyT6gcPpFkqPtwyoXwj+AIsc7iz
         Tc48L4ejc7N+IGHx94RAq0o/HM5YTS9UdJoTS0gER58VbtY8zDNfZwzuSr6lAmYdos+a
         s1suXOohFC4JMU5Ia6bRejwQcwHsC3VZlnwlU45PlyWk1IibLWPiO/QSfebAO4HisTW1
         ta0c0xcxOZCsCQ8NjGGbDeeCOcpxxnDejKoNwKALrVbne8KjRbD3OTM4EGyCP3nwB5/B
         zfQt31qkkWVp+MmE0Kc3CkAIcpnsQd1pf1x6kbsqyRxcciOGBLnTn57JiZHSWFvPqBOx
         Zj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775527110; x=1776131910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJP1nBLyx3Zg6LR86IBxxjjgAxuPf/p+kUwxaAYOtII=;
        b=K01GsNdFYyiiTavboAuDabwRFGg20vXI4CzSyilkUwnA/Z1jqC9JuNad0869tcWd7g
         aCtv3RWgpCNSZ7qEfR7QUmN/99fUkqEaPGXVC5MApepu0VcNx8Bn5rRmKg7jnaoBPqd0
         Lr2lBfJMmh/HLM4AOl3B/pfTHUlUw1ExgtiDdI0YrM4N4iONoyj/SMaywXz0RLkr+zxk
         zdh7svH8aiIxW0tRyjIf9l7YX2EnVsnvIKnSwhTN/cMYKZgP/xHejGU0SDBvJPLzfXGl
         YEJcu427iP7kIa4pSzuhYFXAy6rXtdoU/2PuEF6o7DRM7OVCW7/QvscnacXbumaA+KWh
         q7+w==
X-Forwarded-Encrypted: i=1; AJvYcCU11ac47pGp3scIQ9nhh0D94HhRLWPYwz4kUkJRT68Xptgw3IPlbN/BmtyTp/UZ//Ad4jRy/XwxqtZv26DF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj54crc4FItTIG7xAz/hS82EgSEavV55FiYA8EIU7uvTgnttfT
	ZNYr/cV+U1ZE+Ofq22u+w9JIWAj/WnRGQ5O8qqETrzyeR6OVutwfRzijPm/qpHzz7fc0q+QH+SW
	dG1BFb8auApIbhAaMRVAh0GHqtGe0BrlBUhGJA+18blDs7NqWQk5MxJspRW93TdikEOZg
X-Gm-Gg: AeBDietMNmsqDFUs/rulRtd4GexzGmaH0IuSI7Wj7lbNECosjg1dHPI87Y08TB1+N41
	AUyCkGkMGGW8lYfoAOHnJU7iV8UZhXcWDM00XTk+G1ripIkIwzzMR5RP7DV+V5rULmVWN4N9mEv
	r1bgj8RNPVMxp/8wlxbzQJg9obDew+oIuUPKAinljzy1SCduxfgudGf/lCV+UI0crSy5LBUgxLc
	pk4Vf/SDhsJiM//pp5zCFuYZ3Lx8t1clWwOOoPWVhnAOHi+IU0kbfKLJseL2mB/koPiIChZ2JTZ
	oPSfpWXt5VZUWvd0W+euxzXA6V0MH8NEtLgjC6hlj3NzQeCqxApTqAB6OvTXXOIRuOvUJZmmBo4
	aBXTfV5q0X53xIijARuu4JfkA9JkBp5Db37MzRIgUbpIQxPZVxcSfz1p5FE29Wxq1hszq6UySFj
	FjthU8NDMWX32jgeX9cgxi/6uPJHBSWe0h594=
X-Received: by 2002:a05:622a:a788:b0:509:10dd:2c88 with SMTP id d75a77b69052e-50d62aff28cmr181060461cf.49.1775527109680;
        Mon, 06 Apr 2026 18:58:29 -0700 (PDT)
X-Received: by 2002:a05:622a:a788:b0:509:10dd:2c88 with SMTP id d75a77b69052e-50d62aff28cmr181060181cf.49.1775527109190;
        Mon, 06 Apr 2026 18:58:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm3688042e87.62.2026.04.06.18.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 18:58:27 -0700 (PDT)
Date: Tue, 7 Apr 2026 04:58:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] regulator: qcom-rpmh: Support RPMH address reads and
 use it for rpmh-regulators
Message-ID: <rjm2lu2uhhchoy65dczujd26g4sivfwcexopqipyel7bqqpk2a@7dikjbhqlpy6>
References: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAxNyBTYWx0ZWRfX42PrV3Fq2SfN
 WZY+xrmBzP32oKyKxqqHfiIu2PWrTVRs+ZnX/FribLba7OX29J+M4wkRC9/NPGpQOnvq0cUOJBQ
 mVNTh+dZCewxb4in4D+AHyyLoMxeYIoP2aKnjRAktJRea1QiIayBq7lpFpLvBQx3kY8xXIEDMZy
 65A7Ikz6FkW8DK0YSVfC0ekBS3WAYyUL7+xUj/SOXXIDsGT+98EvK6LI/l5UlQAwqIuFUrhk9oc
 ySfswG9xAC4UBf+C3kcaDgXncVgpL/VVI126fIi/B4srYU2Lk6f8r1wV7PTB1Jid1buCvzubLWN
 xoEYlJgdjfEK9BVbiY+GWfnLt2cGkazcAyehq+arXlmILBOfDf56BxpVsb6n3qcmMzwS7Ce9ejb
 Lvw0oUXSAAYTPnbVTtbKu1VVPb9uxvR4btPtPPkqiuTE0YNsmw7mxu+z15nbIaAD3FcrxA+uXZC
 WEAWP5ryrDuc4GM/d0g==
X-Proofpoint-GUID: VvFww5oi76tMHJDG5TIMRZki_6bV5UBb
X-Proofpoint-ORIG-GUID: VvFww5oi76tMHJDG5TIMRZki_6bV5UBb
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d464c6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=y5og755XXklFIaZqE9cA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070017
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-102035-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8FA43A8D5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 03:44:57AM +0530, Kamal Wadhwa wrote:
> This patch series adds a new `rpmh_read()` API to allow reading RPMH
> addresses. Using this API enhances the RPMH regulator driver by adding
> new `get_status()` callback to reflect the regulator status and also
> readback the voltage/bypass/mode settings as they have been applied by
> APPS during the bootloader stage, so regulator framework can get them
> via `get_mode`, `get_bypass` & `get_voltage_selector` callbacks during
> regulator registration.
> 
> This is needed because currently regulator framework does a unnecessary
> write with `min-microvolt` DT setting for all the RPMH regulators during
> regulator registration, because the first time after boot the value is
> seen as -ENOTRECOVERABLE, as there is no option to read these regulator
> settings.
> 
> With this change this unnecessary write can be avoided and regulator
> framework gets a sense of the initial state set during the bootloader
> stage for all regulator settings.
> 
> NOTE - During discussion on the v2 series - PATCH 3/4, reviewer had
> inquired about possible need for the use of the sync_state() to handle the
> "multiple" client case - for maintaining the regulator settings till all
> the clients are probed.
> 
> This case was not covered in my previous series and had originally planned
> to do that series seperately. But after the discussion decided to merge
> the 2 series as it seemed this would be a better approach. But after
> working on sync_state change. I realized a basic issue with using
> sync_state() for regulators - that its per-driver and not per-regulator
> resource. But we needed a sync_state callback for each regulator seperately.
> 
> I had been experimenting with few ideas but seems its going to need more
> time for me to close on the eqvivalent solution that has per-regulator
> sync_state or something to that effect. So I thought to close on this 
> series and attend to that seperately.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
> Changes in v3:

If this is v3, why is not marked as such?

> - Removed "bypass_supported" as that is not needed for regulators
>   that don't have set_bypass implemented, as pointed by Dmitry.
> - Handled the corner case where the mode/bypass setting is read 0, but
>   its unclear if the register has been set to 0 or its un-accessed.
> - Dropped `convert_mode_to_status()` and use the `regulator_mode_to_status()`
>   instead.
> - Refactored some code to simplify the `status` update after every
>   enable/mode/bypass setting change.
> - Corrected subject line of all patches to have `regulator: qcom-rpmh:`
>   for all the `qcom-rpmh-regulator.c` file changes, as pointed by Bjorn.
> - Re-ordered the series to have the `rpmh.c` driver patches first and
>   than `qcom-rpmh-regulator.c` driver patches as asked by Bjorn.
> - In the BOB5 bypass fix patch (PATCH 1/4 in previous series), added
>   the fixes commit#, as it was missed earlier.
> - In the rpmh driver change(PATCH 2/4 in previous series), modified
>   commit wording and removed linked as suggested by reviewer.
> - Fixed kernel test robot issues and other formatting issues in
>   PATCH 3/4 of last series.
> - Corrected the checkpatch error fix PATCH 4/4 to keep to only
>   one error in comment section which existed prior to this
>   series.
> - Link to v2: https://lore.kernel.org/all/20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com/
> 
> Changes in v2:
> - Fixed the BOB bypass mode handling (existing issue in current driver).
>   This was needed for `get_status()` implementation.
> - Implemented `get_status()` callback.
> - Callbacks for `is_enabled()` & `get_mode()` will now be used as-is
>   ie. v1 changes reverted.
> - Bootstapped the read values for `mode` and `status` in probe, based on
>   comments recieved from reviewer.
> - Callback for `get_voltage_sel()` has been modified to handle cases
>   where read voltage is out-of-range defined in the regulator DT settings,
>   this is needed to ensure backward compatibilty. Regulator probes may
>   fail otherwise for some older targets.
> - This patch is rebased & tested on:
>   https://lore.kernel.org/all/176070318151.57631.15443673679580823321.b4-ty@kernel.org/
>   to avoid any merge issues.
> - Fixed code style issues reported by checkpatch.pl script.
> - Link to v1: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> ---
> Kamal Wadhwa (3):
>       regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode handling
>       regulator: qcom-rpmh: readback voltage/bypass/mode/status set during bootup
>       regulator: qcom-rpmh: Fix coding style issues
> 
> Maulik Shah (1):
>       soc: qcom: rpmh: Add support to read back resource settings
> 
>  drivers/regulator/qcom-rpmh-regulator.c | 186 +++++++++++++++++++++++++++++++-
>  drivers/soc/qcom/rpmh-rsc.c             |  13 ++-
>  drivers/soc/qcom/rpmh.c                 |  47 +++++++-
>  include/soc/qcom/rpmh.h                 |   5 +
>  include/soc/qcom/tcs.h                  |   2 +
>  5 files changed, 245 insertions(+), 8 deletions(-)
> ---
> base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
> change-id: 20260407-read-rpmh-v3-821188eae030
> 
> Best regards,
> -- 
> Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

