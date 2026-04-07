Return-Path: <linux-arm-msm+bounces-102054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN4zLW2N1Gn+vAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:51:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9453A9C14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D434F3005319
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 04:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCBF2857C7;
	Tue,  7 Apr 2026 04:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcYnMJUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGEH7FTK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6502AD3D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 04:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775537512; cv=none; b=NYqUTsjpahMCLRDsZ+IaLfjt9vQxstV0Lbf1aARoNyGwzV8Y5p6ioCCjOZBzZ894OWdolaPvl+L6rGT+rrmeTs/pHZWDCBXp+7nffKDIHLqLCp0i3AesTpILhvwrPFtQ5QIFNioQSd5zBhHhH9YXbrr4jtm3Q5zug35WkKO3aH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775537512; c=relaxed/simple;
	bh=JImeoPHMGf0IVYSERGGMZZdY/yzjHUq7/ohF5/kvN40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0+xT0V73byB5/lZxkSSwHdrQ0+eWh83pKmykIk1kT8cS+qPBnkgSfzwOkuZaIYCbeJzuFkmp9R33ibA0pT0MZKS/dV0alUTVznW47eMhWhGA/7EYt1uqtiK69DDkU8Eamff89iA2+ErYKbj3ZpuN4P1G6BFJMCvSo1mIvG+wbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcYnMJUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGEH7FTK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQHLA1405987
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 04:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+WU8CaS6wHy/T+N6F9lCKXka
	stJ2Hwl0WkpvmDbvI5Q=; b=mcYnMJUExznEhhvCbBRTkazLXYjATDc/1xUGOqLG
	ia5k7Csyu35SxZ9BPbAOa3NTebxrmQ0wbKo9OaKe1g/UoEFQ66wF6eC3IHrBeliX
	F53TL51X+oY2Bok+KOGoFAOOqaal7JJqpQiEF8ZnIjorE8qJ79F1/OIn5t0GO0Pk
	pAcJDb0eacOiY/cW78PAqCWJ+1Rqlh2ChySvvdsIbLrC//txvkuJh6sdYRS0WEsu
	nit33s2qkpN/lu14GmJLBMnKEIiNMJhMaGwflNIzNLNKesUZ0/G3P0rY2lJGvSm3
	Okd65ihGFUh1WYfFoR/J95jRgeUtxAVNvP8/PE5/vGyLEA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmras2sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:51:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24a00d12cso50497835ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 21:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775537510; x=1776142310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+WU8CaS6wHy/T+N6F9lCKXkastJ2Hwl0WkpvmDbvI5Q=;
        b=GGEH7FTKHggxnl7GszfYPCY+U90ip6RBf2KwAzXpilYU3Fz73HDzJKn9uXudfhRV1K
         0VGNx+SIIMDlgM9vbY/+PFGag0YCq+WBaUlbhAYfE5eJKCL9S2uf79jRaEDyJhLcyHnQ
         bs3hmazrybcsEbXxm4D6YMKO3AtSWchUxoLlqQUK3ZTuHs5xtpOR+xUffPBD+37y8DEx
         WQCZ4EKk+5kTw5FbDdqu0isrLFgDrbSAr3xqSAYXEVo3sKSaW7d9LtAtnDeTdIhkfAlZ
         BZehU71m/7146cKp2bNSCXwzOoRiNFLppnG9DxQzCeHa2EglBPuRjbe834+sxjgrDg6y
         XOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775537510; x=1776142310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WU8CaS6wHy/T+N6F9lCKXkastJ2Hwl0WkpvmDbvI5Q=;
        b=nR6r0/wbLYjhNby3C9Fqkne1F5NqLuq0jOi8kHBogSqY+lUCCbMsGHpIp8i/wk9M8a
         /Ax0ZfVgd+J0HkdZvxhAWSVgJaV5Y6en75/LxqKXmYLUiv0AWyYZA42xH+jb/wwp/uW6
         PtsNiDyOpLmbxBrWHZAZqmH9EXnROrc0ZrBP9q70yI5xvPHBSSR2RemJ1sLE9gqBLz8U
         EcDiOSBJZ314x4RgyPhIOjHkTdpHD/I8lPBhpYkdBWDyl/bLcW1WxWvE3hmR/bxmy7rc
         G9PDx+Qyf9ZKZCPYizNRHjvE4oiBbiffeGc21DiqXx2ulc7umzmd/Kg1TrO210RWmu4U
         NTmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOiV9GEcPgKfhz04EHt4OGMnCckiSF1/f+sEGdrL6FUK5yJ3qtPDbYXtkvHghkBCXfnE3JxWoDKSouh4Sm@vger.kernel.org
X-Gm-Message-State: AOJu0YwVVThgxKROxUR2D9HKGArdq8gkO2j1LdX9QasVB+5BdByXYOfr
	3gQdPHHAixeWAsQ23DmNR1R2AeW04LTe30ZDt55U1HM6je7XRmuR4Xp51kFlzs0yiZ+H1DSdceJ
	HZAIL1/kIrJW0CFZwWU5LxY6R5GkgkRHtZvDzeRGN1nAR9uYvGiyUE4I+O5QgVPkLe14DUJ/KBR
	xZ
X-Gm-Gg: AeBDieuEcwmimWHRVuEyuRIuc3vJZ0kf+lgRtkcTgArHqqTROWv3S45jdLkR/+qmQ11
	9zjMW/T4Ph6GQg7HO/aVVawy3FpGszAcCkgdzG+mYvIGLAqMH7T1+ISU5rkvoC4e1Q0sCzyj//s
	ApoWl49aCxy7zOrdJXAC1J6KS/ZcSWuhKStml57SNKnki3PnwtoLW8mncrjY9x/Lpwecw4wF5Rb
	dXHZhS0Jx7FofPSIbyggCUtdo4cOWK9OkQgBXuWghyQPfgf0h+LtCF4CnsjZVG5OCAe+Labz8TR
	6JgK+9YfCA6sHiC0X36DICxcNNjACmRiA97f/oACgdevQ0xB/n/QItQogWm96AesFZNELC6N4pJ
	3kRn4rLF+/ouGP6LPxo+Tq+u1Q8uo21ZYyz/2p7IAlLmeRKelKMQ=
X-Received: by 2002:a17:902:e743:b0:2b2:4df2:1e69 with SMTP id d9443c01a7336-2b28164d43emr153579925ad.4.1775537510150;
        Mon, 06 Apr 2026 21:51:50 -0700 (PDT)
X-Received: by 2002:a17:902:e743:b0:2b2:4df2:1e69 with SMTP id d9443c01a7336-2b28164d43emr153579735ad.4.1775537509671;
        Mon, 06 Apr 2026 21:51:49 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm157791045ad.3.2026.04.06.21.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 21:51:49 -0700 (PDT)
Date: Tue, 7 Apr 2026 10:21:44 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] regulator: qcom-rpmh: Support RPMH address reads and
 use it for rpmh-regulators
Message-ID: <20260407045144.azg7gqqrvu4ksqr5@hu-kamalw-hyd.qualcomm.com>
References: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
 <rjm2lu2uhhchoy65dczujd26g4sivfwcexopqipyel7bqqpk2a@7dikjbhqlpy6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rjm2lu2uhhchoy65dczujd26g4sivfwcexopqipyel7bqqpk2a@7dikjbhqlpy6>
X-Proofpoint-ORIG-GUID: V9dwCQPfTPmc1JscMyfAIVEyvcfh2MdF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0MyBTYWx0ZWRfX7gnpnQ1/nJEo
 6k6U6v0tKRIiVuzPZyVF/AqdE1ZQ8HZzeqpO1lK/7PveRUW4Ew4kqOT/MKhYypjs9jUIdPLu5Hy
 gMb1w+9qOnPPxDeWzsB+1inNYvQFn6puFq9o28u8lTGG8QZhcZ2DLY+T+gKT9BaZFhQ653NIYnE
 KEiLPt91kqkNOYHzmNXlLfPHzghYajXHn78WqpzQ7EM1w1sS44e8HdotafKPd5vD7LX7FU+wZbd
 RMimKE5LqwHZrn/7JgzCRehbFWncW3dUVSm2V6m8WoonRNKlgrlXXA9ilE2aoOntYVr0E/k6Tpt
 HIklzLCkBEpI2dd4MpxEPx/tZu8t4aKAL42tkep3zyzwASVX32JnQER0n3EgXNOB9yhyPns8T8s
 qP2672cNj/8K/NuENqZPlvhfrt05Vrc8BEfGMk1GprJC6ZfsQ31YtBou9ZSAqIktrNAnc1py+iF
 45gJxA2/bpvxwKazu4g==
X-Proofpoint-GUID: V9dwCQPfTPmc1JscMyfAIVEyvcfh2MdF
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d48d67 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=--fTQJTxseFUXu2p0JIA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070043
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102054-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,hu-kamalw-hyd.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD9453A9C14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 04:58:26AM +0300, Dmitry Baryshkov wrote:
> On Tue, Apr 07, 2026 at 03:44:57AM +0530, Kamal Wadhwa wrote:
> > This patch series adds a new `rpmh_read()` API to allow reading RPMH
> > addresses. Using this API enhances the RPMH regulator driver by adding
> > new `get_status()` callback to reflect the regulator status and also
> > readback the voltage/bypass/mode settings as they have been applied by
> > APPS during the bootloader stage, so regulator framework can get them
> > via `get_mode`, `get_bypass` & `get_voltage_selector` callbacks during
> > regulator registration.
> > 
> > This is needed because currently regulator framework does a unnecessary
> > write with `min-microvolt` DT setting for all the RPMH regulators during
> > regulator registration, because the first time after boot the value is
> > seen as -ENOTRECOVERABLE, as there is no option to read these regulator
> > settings.
> > 
> > With this change this unnecessary write can be avoided and regulator
> > framework gets a sense of the initial state set during the bootloader
> > stage for all regulator settings.
> > 
> > NOTE - During discussion on the v2 series - PATCH 3/4, reviewer had
> > inquired about possible need for the use of the sync_state() to handle the
> > "multiple" client case - for maintaining the regulator settings till all
> > the clients are probed.
> > 
> > This case was not covered in my previous series and had originally planned
> > to do that series seperately. But after the discussion decided to merge
> > the 2 series as it seemed this would be a better approach. But after
> > working on sync_state change. I realized a basic issue with using
> > sync_state() for regulators - that its per-driver and not per-regulator
> > resource. But we needed a sync_state callback for each regulator seperately.
> > 
> > I had been experimenting with few ideas but seems its going to need more
> > time for me to close on the eqvivalent solution that has per-regulator
> > sync_state or something to that effect. So I thought to close on this 
> > series and attend to that seperately.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > ---
> > Changes in v3:
> 
> If this is v3, why is not marked as such?

I'm so sorry! i have fixed version and sent again (ignore this series)
link - https://lore.kernel.org/all/20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com/

