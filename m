Return-Path: <linux-arm-msm+bounces-102158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI6CG8z61GnDzQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 14:38:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 085613AE82A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 14:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D7F4302C365
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 12:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69173B38A8;
	Tue,  7 Apr 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6JbWyLV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dj2r4/Ds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006253B38B0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565422; cv=none; b=GyjldpDUa/O8N/y5aLzUDSLmOP0nKjRdwTTlS02hs6jnW0xIyAnQxK+ygEV5pXSynuY6jBaZve9m2Ekm26IIVVcKy7iqBMy8WcVXO6p5QrKrI47X+frhPWX/Ov02GZStxQ55u0Yj48fbpPojxgqhya0dKKjvpD8zNSETmnhBWek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565422; c=relaxed/simple;
	bh=vquRYLOrUHW7tvu5sc203JUilN7sMEjYaQHIGfNoktU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExNLZ3ik8YRRgrMkHPP1y3sKyJHoggTGt9ZRxR9cJgbMkAHAHDgVIg5box4D2YFLo6bNr2H5kUwQtaM34XJI1cs2BrXus2hHTlJy2Ioh/FyH38PmQEmu42locJ7/aNTUXxPAVYsqgrswC71ZYMCB113JZu/AC9BhHK6C5yYrngE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6JbWyLV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dj2r4/Ds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CHtKX2550794
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 12:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fKbLEisUGQyA9nyh12XrLZh2
	5e36h2PeJ/PNQD1AuOU=; b=B6JbWyLVE/+9JVi7bgTw7BPHxVARQ8kK+ZAL7tuP
	sf/0i2LgpRs7iydUvV09pzb01oPAScc7nLMLCbN3DnIdyLWftPwSZRuhqt9Vr8IF
	simnB05jbYdFSjRgVSlmiyWlV/3JC9H9KqONH9a90oFcFctSxs9IbMBrPWD+tAsL
	88pvLLBipaRxCE3M9ZZ0a/hWTBbOH5ImeOaDd0GZXIli5lWGmsDeVcsi3woA5Xip
	FKtEH3T1m4uPkzJe17Mtg578ODF9/F+ESwczYpPXeKk+uc20YbXWXNRQxzRGJPoz
	gDNJUhuMVEbo/YmBlICCf0yMUhZdJ3J5u2SjuG8M+DYJJw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmreaqnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 12:36:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso5250880a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 05:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775565418; x=1776170218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fKbLEisUGQyA9nyh12XrLZh25e36h2PeJ/PNQD1AuOU=;
        b=dj2r4/DszTO4VQviAgNdqNGH6iv2I88bSsYXWy9ED14Je+I0XYGm8go25afyyFMb7S
         5zvxQoeDAc0Ns+/KQdJj5IKkYo7wkjeJ5N6qIq1KLlbpkFJsPQP2beNNu/ScbNUXHdXw
         ZkXXdhFi6utlvi1grq8IxOB+KbwqkLrVVfgIPYxybeIBW6KD0h21ftYMYqnNkRKLLneA
         fRWy67aiBarBg5NG4BaGLFESouI3R9dM4Hm5SwdV3HnXNWpPOQbIOYs0wLQ9XNcst9UC
         0SugRvUsWGrKEQlTDmq6ZeHnugwrFqxItjMtL6qM6Quw/fph0InhNXne+7SLAlMRJH4o
         YVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775565418; x=1776170218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKbLEisUGQyA9nyh12XrLZh25e36h2PeJ/PNQD1AuOU=;
        b=N74ex42kzdaKRNczrW08adHhfGT1Wzn/gHX/GIMoQ/icNn4nfCN1pTvPWTRrgOvUN+
         zDo8OCQPUXRB1Rl/9PixCevxq9/nRYu8J99pblEWU978Lr+8Wc63r0yj9jSUyBabEg14
         emEkreAXdBgqV+O3yvNMBSLa32I4NLiLkzdbdn8IoSjJhUg0oXxgECtIJtyJIBwJ0hEs
         CNz2XszdEHZ1nA6q17fXR6dnCdWWQJCqCrT8OWNasnJtTuGYY3Alb+xJ7rBJMHW/TdG7
         gz7bqQgEEAMpZSUfSEcGh/VzsPtwVW8Q6gPklIK1EXFrcRPJGg/Xy0r7HxUidmXsS9Yf
         8utg==
X-Forwarded-Encrypted: i=1; AJvYcCXNEvDAsNqUH7+2AR5q2sBVJiGO8aw59qiQF1FlQJRfYhEsMQujFjL098F/XejhApyupsnmqIbrcexVzr5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxE3UrjppvBowzKe5TqvnzvR3jEQeTv4tXRMxyP4TOfL6RhYo4M
	WZbQfNqNiVUstuPZe525fFN8Rteu24vEmZKfC2diThEu5urlXr3EYh4v4/mULOYd5sGSeyZ2/d5
	qaHXsiYP58sVUUEEs2Hgsg7TxLOEIZbY4O/krvA0lxSfQLRlR6j550Xx0w61mCZI/+uvMGkxKet
	ab
X-Gm-Gg: AeBDieviriyxaP6uwZebAFvDGfvcIyYxaZ/mtxXFvsaMd3QYXwlerFVlG8Dsy6hhsyq
	A9pY40mMqXKy7q2aG07UnGJqGzADD+JG32yJJLiNbk3aOvHqQ/TkVrt3mtPRtkD5D1QRE4ZDDs0
	TzdylpE4NXX3WJqGIULN0RfegYZmBk2Dwb/w96TabTpvnEBgk5vkkjvojiKVm+yOhZXiBSqfqoi
	cH625wznRf9qrFB5Tk2xIvwi/EPRv1fgU1Lep3+KPEZNQ6f2RrE974k8z4jtno6ayJAv2aryDbb
	HVYAZSOSxPkyM6D6YK0B7jFKI8LPCub88DIGi/MB1D8coJ7CVVsEXbFG/LVR55qahIIp815r9fF
	dPyWKOO89tGAEpDKARdEifqT6spsmli2/FYe8UtaEPRNQa9N5OaU=
X-Received: by 2002:a17:90b:582b:b0:35c:1695:24a3 with SMTP id 98e67ed59e1d1-35de691b308mr16787084a91.23.1775565418455;
        Tue, 07 Apr 2026 05:36:58 -0700 (PDT)
X-Received: by 2002:a17:90b:582b:b0:35c:1695:24a3 with SMTP id 98e67ed59e1d1-35de691b308mr16787049a91.23.1775565417901;
        Tue, 07 Apr 2026 05:36:57 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de69fe54esm4851495a91.11.2026.04.07.05.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:36:57 -0700 (PDT)
Date: Tue, 7 Apr 2026 18:06:52 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <20260407123652.ogirwvx7n5shrf7u@hu-kamalw-hyd.qualcomm.com>
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
 <20260407-read-rpmh-v3-v3-3-34079f92691c@oss.qualcomm.com>
 <01f9d2d5-5480-4470-b593-eaf2f3908cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01f9d2d5-5480-4470-b593-eaf2f3908cfa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4fa6b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hjNyUS9LjWa9GQz47YsA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: x9Rstr4Q4jUVK4tFlO1EgoJtlYfXBA2x
X-Proofpoint-ORIG-GUID: x9Rstr4Q4jUVK4tFlO1EgoJtlYfXBA2x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDExOCBTYWx0ZWRfXyFj7AqHW3zOM
 evIfRNT7ZJ+Qls0vPuZsqOA7eHPn7qGkW88Lwja3+gvc+XiUn1LFgH8RILUYGI6WfWSF1GR1MBt
 jAsd8fqyJglqGL0o6d1Sq3650eq6cKpoJWtYA2wdU4aYA8aLBaeT0nPUP1cqqDgyA7evgzbj5W7
 AXaslozRCrQ/ZPL7u2ubBqO/24In70ALiVxqIxIgSCs/kScSLQjq/bDctrEiBiQlHFTAQcVdPu8
 g46tyZ31OgHdsjW9uMPz9Yt3rSXtl3KbkvFNH1zvth1aiSPNaZqQCUPZ0QQ/1xmweuwkJlCjA6O
 NiIV4K131EtxtNrderzosEZaDvNUNSJRpP/4Tt/2nqBvkGvguQwVrOVV3Tyi8sRO2+8qHIpZOfj
 zNz+Is85THN9WXPZvDgPhn5YQXSYFhhASawA3hFL1Rr4pCEfl01q6AOueI1Gpi97jkY7vJZZecL
 kQeK0ujGii/X8I6cZRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070118
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102158-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 085613AE82A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 01:16:41PM +0200, Konrad Dybcio wrote:
> On 4/7/26 6:43 AM, Kamal Wadhwa wrote:
> > Currently, during regulator registration, regulator framework sends an
> > unnecessary `min-microvolts` request for the rpmh-regulator device. This
> > happens because in current design, we do not have a way to readback the
> > voltage settings that was set during the bootloader stage.
> > 
> > Fix this by using the rpmh_read() API to read the regulator voltage
> > settings done during boot and make it available to regulator framework
> > from the very first read after the bootup.
> > 
> > Also use this API to read the status/mode/bypass settings as well. This
> > will provide the regulator framework a sense of the initial settings
> > done by bootloader and thus preventing any redundents writes for any
> > setting post bootup incase the same setting was already applied during
> > bootup.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > ---
> >  drivers/regulator/qcom-rpmh-regulator.c | 178 ++++++++++++++++++++++++++++++++
> >  1 file changed, 178 insertions(+)
> > 
> > diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> > index 85fbf10f74bb3393071bc65681356312f27b7527..8e1c576b718b595bbbff7f5fa76de84d4e90f3bb 100644
> > --- a/drivers/regulator/qcom-rpmh-regulator.c
> > +++ b/drivers/regulator/qcom-rpmh-regulator.c
> > @@ -61,8 +61,13 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
> >  };
> >  
> >  #define RPMH_REGULATOR_REG_VRM_VOLTAGE		0x0
> > +#define RPMH_REGULATOR_VOLTAGE_MASK		0x1FFF
> 
> GENMASK(12, 0)

will fix this in next reversion

> 
> > +
> >  #define RPMH_REGULATOR_REG_ENABLE		0x4
> > +#define RPMH_REGULATOR_ENABLE_MASK		0x1
> 
> BIT(0)

will fix this in next reversion

> 
> > +
> >  #define RPMH_REGULATOR_REG_VRM_MODE		0x8
> > +#define RPMH_REGULATOR_MODE_MASK		0x7
> 
> GENMASK(2, 0)

will fix this in next reversion

> 
> [...]
> 
> >  static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
> >  {
> >  	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> > +	int ret, uV = 0;
> > +
> > +	if (vreg->voltage_selector < 0) {
> 
> This assumes that the voltage selector can't change due to an
> intervention from say ADSP - is that true, as far as the _read() lets
> us know?
> 
> But I suppose we can't know about __every__ change since they could
> happen without a notification to HLOS and it's probably much saner to
> stick to what Linux believes is set on the hw..
> 
> [...]

We can only read the voltage_selector for APPS, we cannot know
what ADSP or other subsystem may have set on a shared rail. RPMH
firmware guarantees that voltage will be greater-or-equal to the
voltage requested from the APPS subsystem. We cannot know the actual
voltage set on the regulator using the rpmh_read() API.

eg - we may read a regulator as OFF/0V while the actual state of that
regulator may have been ON, due to a request from some other subsystem.

As we are currently relying on the cached value, (after this change)
we can still continue to do same, but only right after boot (when selector
is initialized to -ENOTRECOVERABLE) we are using the read API to know
what was set from APPS during bootloader stage.

> 
> > +	sts = cmd.data & RPMH_REGULATOR_ENABLE_MASK;
> > +	if (!sts) {
> > +		vreg->status = REGULATOR_STATUS_OFF;
> > +
> > +		return 0;
> > +	}
> > +
> > +	if (vreg->hw_data->regulator_type == XOB) {
> > +		vreg->status = sts ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
> 
> The 'else' case is unreachable, since you return early if !sts beforehand

Agree, will set to ON always, as we already checked for OFF.

> 
> 
> Otherwise LGTM
Thank you for quick review.

> 
> Konrad

Regards,
Kamal


