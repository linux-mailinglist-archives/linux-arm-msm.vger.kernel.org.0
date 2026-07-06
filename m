Return-Path: <linux-arm-msm+bounces-116656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OU3TGddYS2oxPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:27:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4D470D858
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:27:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZlZDOFDV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UU3OKxH7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116656-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116656-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59A87326145C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1938E4C77BB;
	Mon,  6 Jul 2026 06:52:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAB547DD72
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:52:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320751; cv=none; b=JvAJaSf2U6ZAkedT7So1gGT3frB/EgxxB0kWKocc4siP49z/n9iDI5poDk27YZohRD48jzaa24v0Lr0b5kZH4HiBnkIvEufFhHC1MNjI6X1CddagMGQ4hnqnP4yBr5GQdCjQogx7gY85rE4XIJup2i9atSsK3ynkNC+Qd8dWiF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320751; c=relaxed/simple;
	bh=qqmxe3ntthYAlQ7k/vISA8CLGMvMEMLypBSimLw/F3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWCjyuIxLbKvoDZK49Sk9Sn0Ew9KtwggAhvxfHrfX4MBycjEtW1L6dxnFxCQuSeMcOytZn9AffeEtC/jMgDMwSj22gdk6exS0MwXoMJSKK5kbkAgCchsNASW9pYNoEC5M3EqrlWHkaf7CEqCILk/6f/T4yVbI3aSU/Ci/0/dI48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZlZDOFDV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UU3OKxH7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641jSq3402390
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yduyzXVW89HhFsw9dnAqLvcq
	vsISzOjplnij5DJTHWc=; b=ZlZDOFDVmf0HznMEY9kgq3erv0DgPIjglO7YLCYX
	Iye2x6pZ3d9RdjlXdccH7dSB5kySTiElJZVEdJYBganaFk9G40gmL5bVkr7BY4ij
	uVFiwWEErMx4nTe2/ulipIR/iZkzPe5MKizrlxnxzMcXuRraZbOVF1dyCjpbjGcy
	7W8UrrSx/asaQb2a/OtvpTNgSa3niGxIO9VjZmqd35gLeDq3ZY5n+JNfwRDwZPbk
	d77E7IBXfp005EGSfLa9eQC/09LhNHl+pvThEo57DQ0gMrdoCNl1/aUcaouMesBC
	fV7kMXDjLrJt7AZP1LGpG/GqSpdyzr98CuxZ4B67feK2HA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgmr6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:52:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3810fcd9adbso4080571a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320740; x=1783925540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yduyzXVW89HhFsw9dnAqLvcqvsISzOjplnij5DJTHWc=;
        b=UU3OKxH7ccPpsB+EnYzQbUGc1ZxqwIrDSmd5y4kd2+PVuvgW48WRNEeleYqp7/QPSj
         XWC0H1WyLoPcgAK0aMaH7yXHSSfFZXOir9DPJFOTHUp1ooN2zjTv572HQE1jxppNLlcQ
         wyV5v4GOsnB6ZM4gcwRYtQzlidZmjJROoSjRV4uwvDpeChUSn1MflKQrytk94w6fEzwg
         +TMFAKI/msHnQha4LNs0jl+MxSjJLh+N90WdWMtvsLIIs+EhTKdD4FbHCihXyDNcibWZ
         DfHFVc+zM/5BoEFvtZMPAUUcE6K9sKNpZX/gkj0bvMJnTX2gMTg56uCwVZMjDttl4swC
         U+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320740; x=1783925540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yduyzXVW89HhFsw9dnAqLvcqvsISzOjplnij5DJTHWc=;
        b=Nsle4e2oxAMnCDvP8QtuZdT0ljovsefVDwGXVcPjY/ZaLJTd408uU+5uSWKpgvcwxO
         bRuZ/RpdHKZLry90AHB26TmLs82C5FVa8VxM17helVwRajKouTyuP7+wZpGB20uwwtGz
         EvAVALVtvn60Oo8s2iiIKo/wfUpmZoD4uRB8vJvt6o5/bM7BbrkmYnvejk8TauQKXTtt
         v0+pCtPpsYmhhax0JR2KYkrwP1F3l1hekwNXs2nzr1w+X5ZMClm7FbRTDE4u+pF+8o25
         vVNZqK5u51ukxg1KzUtmqHoHai4ssZvfI855fB1fi5n2QEoN10AxGRNB8YPAwFoW1a1u
         42rg==
X-Forwarded-Encrypted: i=1; AHgh+RoFn/zgcF3PdlKIaNf/IuIwfddFBOEKoNXpG4mJFb/dgV8jiFxXIHWDK9QBD3v5MXNnXSvEc+3+QpddS5ic@vger.kernel.org
X-Gm-Message-State: AOJu0YyECmHMR+lpokEnJ0rEHsO/QIcSHqVcvooXmhHe/Dku7DPzGQfY
	uI342RAQ1/ztfALeWkTzkJ2IwVZjkzu4ke5V4qcXXwlMmVRkubazqt7MDmgEu84QBhfqW3Udz84
	u45nJ44IC1MNhFfep9T68mHibA0Mxdv0HobojwGKinxmzvC1KsmhpU99xIjW/P72FElk6
X-Gm-Gg: AfdE7ckU0J+Namf6lYjZPhLgY5ch/d3Kr/shP+/uJ4GDbo2C0T9Uh7CIXFIiE8bfnMU
	VaL/OcCmiYa7/JlCWmX3lyaArr0WdeE5vdM/0dkRAbMfJ0qD/yIiIzirorI+/v612N8+EVO4Hsi
	RBYXf72+/BjxQ4qT/zOZ4lh+H/U6s4Ep9rhOaevsWa+QuSRM31yeRRRduA7JvrtP4mJOkXyHLtv
	Mxwg4pTI22xyxq6nEa/KuspotwkXIl4dN4yeorYze6B9xu9u+rYCu/zQgCYLyMwGM39dqk+V3cm
	qE7tkHORxRKN1CRJSv5U1S4QPXTMc1q6ad7qpyD0s5xQkKuZQ41O5OJOVhq1rLf1cjeEJn5Abgi
	SaO12em/fl0+e6H5KeZwkfXkTc6TZDcZcKu5EXO2yEJAOlYidhuqLU7BU0vvx
X-Received: by 2002:a17:90b:2687:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-3829f4f060cmr8881303a91.27.1783320740096;
        Sun, 05 Jul 2026 23:52:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2687:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-3829f4f060cmr8881270a91.27.1783320739649;
        Sun, 05 Jul 2026 23:52:19 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f4453996csm25684997eec.17.2026.07.05.23.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:52:19 -0700 (PDT)
Date: Sun, 5 Jul 2026 23:52:17 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <aktQoeo_0IGRU9ti@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
 <akra6zR_Z5_D0xi8@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akra6zR_Z5_D0xi8@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NiBTYWx0ZWRfX1I4xcksI/zbY
 l9iy0+FPHG7tdEXSmfrWWfyUQj3jcoSNSr3CIwz5/cTlS43anYNG3GnmaCr6ykBpr/I69PP0lQ8
 Hdg1aQ7DbPrxlk7pj9WU2JHPbxLahmU=
X-Proofpoint-ORIG-GUID: R2p_oar4tLBbi2jOrg2RQze-QrrdirfN
X-Proofpoint-GUID: R2p_oar4tLBbi2jOrg2RQze-QrrdirfN
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4b50a4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=e9sLxXvMBOhUzl4J0l0A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NiBTYWx0ZWRfX5uQyXwB7OQOv
 RL1E11VgpYXAgNzu+xT2PPxYbA2rRrS2d7zoDS0q6kXRzNjLTgUKmsNsqu7meZNIG4HDyDnGxYT
 dBkm9wUHYikautMW6DWhNSxwN8h4sPVqjK09AwAa7GqdcORGNznfmI/f2vISZORqwgt+hs6Xosk
 18O/jEoOt5El1DC1se/DkFVIbUz7NxqmEo+CM0apzp7gDhUcJ1GqmY7NR60cUsPXH+pdewDU7SU
 EmKC5iF/ItJE3vVyz+3Y91DtbRQ0wO72bjHG0+k/cBuilu4qxbWRQ3X/i3El4VocE1tRL/S1lIs
 u7RiN1pNq5y2t78lHBN7f9+DHXuCsYjMcqZJLd8v4eahbscjt1xejgoFk+LOjH1yBrjKc3HVyxs
 Pd9/nVPIwwMvYvuEGJg3/KOUN2V2XNAkNgLsjD+AQ2KNrgvG1PjF/pM9u0f57mjrfdt+7EVKCHJ
 a/2tENZguNph+DEoysw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116656-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hu-anancv-lv.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B4D470D858

On Sun, Jul 05, 2026 at 05:41:18PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 03, 2026 at 05:31:13AM -0700, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> > The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> > USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> This sounds like a good description of the SoCCP, excellent start of the
> commit message.
> 
> > It provides a solution for control-plane processing, reducing per-subsystem
> > microcontroller reinvention.
> 
> But, not only did the first sentence come to a full stop, this sentence
> is also trying to describe the purpose of the SoCCP - but the scope
> doesn't seem to overlap, so this seems to hint that there's more to it
> than what was first established...
> 
> Please fix.
> 
> > Add PAS loader for SoCCP on Glymur DT.
> 
> And once you have established the problem description across multiple
> sentences, break the paragraph to give the reader some
> breathing/thinking room, before documenting the "user-visible change" of
> the patch.
> 
> Regards,
> Bjorn

ACK, will improve this commit message as well.

Best,
Ananthu

