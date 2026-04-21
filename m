Return-Path: <linux-arm-msm+bounces-103968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA5fNcab52l9+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 17:46:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 378FD43CE8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 17:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F5BB302C15D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A272530CDAF;
	Tue, 21 Apr 2026 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJaRA4+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bax/ao/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C8B307AC6
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 15:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786196; cv=none; b=T5n6A1JWAMj2rYdY71qkR9CZXb/927yQ4V7jwHfBZDj7SZGvrn26LjyPII1uYG4aYpFvBwFfF24JYQF59RcCAOd1AaMN8pad3U0ozrfRFyCOBfsbNoQtWP0nrQHjUSWBk9i+soeSHRrjqR7dXpj8NaTKMxyKKk0SgWcpqfIlysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786196; c=relaxed/simple;
	bh=DELrGybNgDl8L2FX+JgpL3bq2IVDiMkx1kK6Sq3WZ5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eyqpu6KBhWDJ+/PRU+CWnTcxSvSmXp6K+08qrR+hEOhHK5QdCM/7+Imn5YX54ltp0QobQwGjiqXZAiK/Wo7v2ezez7e5a89hH8BzHudZ1He5MSa6eRWg7luSD0IkJFrXEfQxwAlkBnIhuKgxqoZPRhte0tMpKR+rI3UfAcunBA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJaRA4+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bax/ao/3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LDfaT61538545
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 15:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5HE/DGbc89CJzO8XqH4Y0bSW5WRIaeIl+JsFKEhiZ0=; b=mJaRA4+mTRDxf0z+
	9ue0/VE1CYRC4wymZqmhVsbJIRPaMQsxiJ4hQMLIn9pKTVe8AmJZ4YdaxrstGFAw
	MYXzt80peyGpMC3d3xBYPBOnsW1+iljhtanftdtEioH39CktTRXNcZ1uQTbheZ0+
	K96SEaBaWecO9xCBU30s9BDTeOcC9hIxTkkDBmDdeWRPBgInWTgXXvYvIUdeX+9D
	DY5CpVBeG7Qduw7s9iz9aCKAb/iL/GqRKV8j+0dWmhPgUmhe+iCy6H/8YM8sOtfr
	kthnWKbVnzgPJNHLWBqVMuE9k8HYKha3SnCkTwgu8SG688xYXZtPx0TwK3KqRYt4
	EPM5cg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4hahw9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 15:43:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9484dbd65a7so1714436241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776786190; x=1777390990; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5HE/DGbc89CJzO8XqH4Y0bSW5WRIaeIl+JsFKEhiZ0=;
        b=Bax/ao/3fH4m15oeDXiQS5M2At79JP1LFkB/tTGxsqxeoHbZAuOQyE4paucbPYAhnD
         QZQtcK1MJt09C73T1WkwovvTI9tIyPXfXetpkRPkNQLINGF4RIdvjVu4MEjYCw2q0Efe
         6Bjd/XTu8HxZcSR5lGS59hQt1IOqhw3hO7yfAMnMFqivGwIhh2txfhotgqnOn6AXP20E
         YfoMsXeNIlLHIuw8HnCcgJ46mWRURUaRssA+G8PCCdM4yjaXHnbzSQclG+g3m6/P1+77
         KbYxZ/GXerVs8HYIQPGoNl6mV5HlT+0ajchC0h068fnD00Ezf882BickQAwDZbKEwjb9
         Qf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786190; x=1777390990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5HE/DGbc89CJzO8XqH4Y0bSW5WRIaeIl+JsFKEhiZ0=;
        b=TqgKqjJ9RgEPopI7Q385qhFVCrJC4Q9R3NBlSQlrpnlWYYTq2zQjlEp9gbRToHCetO
         zJlwQgCCCc6GrQdedGDtfxqLGzXlzg2kV22MHxGPRSKsVIoggF1EgeDNBZ6j5qeELnsM
         EVQf+CmLayphcgjAIwKtKoSnUiOjJNzxOCvvZhZpVMqQruU/Sob7IBL/q1/nYiqunimy
         kBYpQlQ4bAkB6/OiEGH5omf1UB8RYmgdz1mnc9k+G3fcHTTLAofJlnFduFD1/wueNhRE
         dqms5DLkjUDR2lbyXaoUPWaOql8/J/nr5Wt0HvviUca0sHQuVIbBagdg1ByG58PbvpGw
         jXFg==
X-Forwarded-Encrypted: i=1; AFNElJ9EogzThW+1Lu1KilALEUlVwfvcjDJZmg2S19+SXFA5hIc9We1BVX2bgcbRHgMjYPKiE5M+2H6vG2HHYKix@vger.kernel.org
X-Gm-Message-State: AOJu0YzYYfJlO9NzSKZCFI8so07/9lQipkHxIga19HujljZIGU+QtFja
	wYrMDqisCG7pWup6MjwQGNHRaB2srRi9BvyhoDTrXhKkLB/u1fVFSgdUprmpTGXO0OG0BWr9bjd
	YwpwLlCZjbZw8yMj3dwMR0JxAIJb6gFv7fzZ6ZseY5cOJ5WeswlLkIoV22Scj7p3AQIQ3EMx4Ef
	PJ
X-Gm-Gg: AeBDievZ9PjCRS72a3/Ua+reeVa8IKdTXYop1TGHwmmpzweGdOi1xFzzQ8k6Xdb6lrW
	M/cFFERGGw8DJV4oo3UWX3P3E4zBX5TZqqtg2K0c8RKKJMPafiRR1zGHd4sOyXlPya/sm8HIuRP
	cGqe+Dcm+yzXb7jh2vDiB2C4dpXldnzsSSz666NrHFtME0v5w01l5hdILzslQq+q4Ask7MTdjjH
	z5VT5ETIBQepY7RDrO1C8oXKWgkf8KKr05URpsMP5kPG1m2vCaQRVtc4baKnhlYDiJXQzVSwWtR
	Rj7KtWomxUdslQO6tyrRGZ7/ySJDjDLKlUq2V9axaa2DxEFrCuXalvHvtsGy4Eoo6c+YDWX0X3c
	XVD5Uu6i5yu4+FxxSlyY9r48y3HgLtpLAKjTHxG6W8l1rg484OKe94M5HToSwobYQ4x7XYKLqJ/
	WbhgG9DbAjVcDXnWSDTj0D+p75+zvrS+npO0G0dZRvio+n+g==
X-Received: by 2002:a05:6102:d8a:b0:607:b901:5d71 with SMTP id ada2fe7eead31-616f7c5399dmr7434566137.24.1776786190158;
        Tue, 21 Apr 2026 08:43:10 -0700 (PDT)
X-Received: by 2002:a05:6102:d8a:b0:607:b901:5d71 with SMTP id ada2fe7eead31-616f7c5399dmr7434548137.24.1776786189586;
        Tue, 21 Apr 2026 08:43:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb724929sm30383761fa.32.2026.04.21.08.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:43:08 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:43:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] phy: qcom: edp: Add eDP/DP mode switch support
Message-ID: <omz64pyd63daz4cezabx6ckvtqocq5p4zgiwwdxrecyzdtfg4t@26ftjmqlj52c>
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
 <islxoe4wbqx5pl54difetdcl5lrqvfd5ysbaicxz5lv235sfmd@6hwrq3rmqx7c>
 <fffa03f6-82c5-4d87-9a41-19e6f82ec39b@oss.qualcomm.com>
 <vywmtt6p3itkrbnucahzvsh6hpwqbno7al5h5zrqdcf3cejyto@pr4of7o3zdeo>
 <f27b39fc-a6c5-4450-93bc-babb7d6dd9a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f27b39fc-a6c5-4450-93bc-babb7d6dd9a5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e79b10 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VqdVp4WgveevkikIt2YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: mF0DIYZlDEDFtNCKLpbax-YX-5gkBYhU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NiBTYWx0ZWRfX4Eac+9x+WVYt
 Z3NVaV4zpYvD5Le9hFZqPQhmXFtlcLU7SWrB7cwLuBqybdPuZ8yZfN5IsONWNdaftXc+6LsZWhz
 qvXQ/wXsJW1qzB9ZPNBZfm3EeI+78nHoXjnCMAPrIX1zUCt1g8WARZIrZN516z3PtTI+M8Xg8yc
 Ac0vtTDClh32VmFS8js0YX5um7nJ4hvZ2I3tvxCJtcQbvO+FFrKzvjLDA4XhJliDkZbRLyf60ib
 5Qa4ZszyiYLTWmu3ms3fEShqG0oJnuN1zz2QC6AKnnbjTlfnlqyh0cvbldVEAm3h1476zlcl0Yc
 +rAYpyAvEiQwbW5t9dDc9TaKhhuFmHxi/6GCcXO827pPWNAcGKwMxsOScZtt05STuHMk5Vr8z6L
 95ztYm+Fp5YnkDcN1+fkKLszO+tfYNEpKa2KvSwpacSjAB4dwUpPlP+Nlrk55LwnmcHWy2o+JYa
 CGoAJtxm9PG30cgEyFg==
X-Proofpoint-ORIG-GUID: mF0DIYZlDEDFtNCKLpbax-YX-5gkBYhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210156
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103968-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 378FD43CE8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 10:32:49AM +0800, Yongxing Mou wrote:
> 
> 
> On 4/21/2026 2:32 AM, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 08:47:09PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 3/20/2026 2:36 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Mar 02, 2026 at 04:28:29PM +0800, Yongxing Mou wrote:
> > > > > The eDP PHY supports both eDP&DP modes, each requires a different table.
> > > > > The current driver doesn't fully support every combo PHY mode and use
> > > > > either the eDP or DP table when enable the platform. In addition, some
> > > > > platforms mismatch between the mode and the table where DP mode uses
> > > > > the eDP table or eDP mode use the DP table.
> > > > > 
> > > > > Clean up and correct the tables for currently supported platforms based on
> > > > > the HPG specification.
> > > > > 
> > > > > Here lists the tables can be reused across current platforms.
> > > > > DP mode：
> > > > > 	-sa8775p/sc7280/sc8280xp/x1e80100
> > > > > 	-glymur
> > > > > eDP mode(low vdiff):
> > > > 
> > > > Separate question: should we extend phy_configure_dp_opts with the
> > > > low/high vdiff? Is there a point in providing the ability to toggle
> > > > between low vdiff and high vdiff?
> > > > 
> > > Emm ,i haven't found any platform using high vdiff so far, and I'm not clear
> > > in which cases switching between low and high vdiff would be needed.
> > 
> >  From my (maybe incorrect) understanding of eDP B.3, the high vs low
> > vdiff selection should be based on the cable length.
> > 
> Thanks for the explanation. Maybe we can add this when we really need it.
> > > 
> > > > > 	-glymur/sa8775p/sc8280xp/x1e80100
> > > > > 	-sc7280
> > > > 
> > > > I understand your wish to perform all the changes in a single patch, but
> > > > there is one problem with that. Consider this patch regresses one of the
> > > > platforms (I'm looking at Kodiak and SC8180X as they get the biggest set
> > > > of changes). It would be almost impossible to separate, which particular
> > > > change caused the regression. I'd suggest splitting this patch into a
> > > > set of more atomic changes. E.g. the AUX_CFG8 is definitely a separate
> > > > change. Writing swing / pre_emph tables on Kodiak and SC8180X is a
> > > > separate change (or two). Switching each of the platforms to the
> > > > corrected set of tables ideally also should come as a separate change,
> > > > so that in case of a regression the issue would be easier to identify.
> > > > 
> > > Thank for point this, will separate the change.
> > > I mostly overlooked SC8180X here, since I assumed it shares the same PHY as
> > > SC7280. However, they are using different PHY sub‑versions. Will add proper
> > > support for it in the next version.
> > 
> > Thanks!
> > 
> Emm, one more question.. Based on Konard's comments, should I split this
> patch, and send a new revision, or  post a new SC8180X patch on top of these
> two existing patches?

Please split this commit into logical chunks, as I wrote before. SC8180X
would be one of those patches.

> > > > > 
> > > > > Cc: stable@vger.kernel.org
> > > > > Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/phy/qualcomm/phy-qcom-edp.c | 90 ++++++++++++++++++++++---------------
> > > > >    1 file changed, 53 insertions(+), 37 deletions(-)

-- 
With best wishes
Dmitry

