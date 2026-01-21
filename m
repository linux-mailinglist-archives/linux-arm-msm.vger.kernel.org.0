Return-Path: <linux-arm-msm+bounces-89969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HX4Nx2fcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:40:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 795C65490D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1782D66A75E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4052047DD51;
	Wed, 21 Jan 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LM2d6Fxx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVJYOjb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E6C4611EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768987668; cv=none; b=NNN0tTAH5x1qPmNhMYBHTjL4fS4rRLYcYU2Yqg0/nsuVj5VoR+BPy4yTzZz8QmBtPuc80V4Gpv27ESemO+Dm1Jbz7dsG3nF1GyhDn9Dfk0wea7C1+wfUYbndygVlYX0LWAGdl6o381ID3KmFmAJcx4vgBi8njNcKgKhfkn/hY5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768987668; c=relaxed/simple;
	bh=jVikCgrbAARFvOLWKcBVO/0jPS0sYvT913oPwBGax74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmG7ipdH7kME/zQVx9HcEbEdEU+QucfLDAe48XWfYPgryl6qECOhEB6o2sNW6TXdDwp2oJW7SQz0BBm9apWhDfhsgGyd1PwZC0xPGIYdClaoJaAWZLnOOL9roZ1tAZgkB2kzeGPU+cEDxrEgH3DWRcRFCTDVth8TKsVu0JKdAMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LM2d6Fxx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVJYOjb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L37Bwi3991392
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ER8Nk/qw4IpwuEdI9yvhA7/i
	V2UE03ZGP2vUT86Ed9g=; b=LM2d6Fxx1Mc+aMfTEqWUDyoVZBLDyRtZIigdwtVL
	LFF1LujBWwY4MRiFTCSYipH2/+Yek3JPEB7tH+5ikEIfLUyn8l75w4+hA/F4FOdl
	oVkcJz54UAk9ocspqtM+/nnIxlcNwJzJ6/ysjEFWnXI6G0Y+K/H+eqTZCwl7WlBi
	RV+uux5Jz22GgZD8XTueCvGDxUWwzHwpq/B/SAC/0BLIqeVcDAPBgJJr7wKdfE42
	0CcXhytQTSoQ/I3Q0eUKmrvh6xUWPnYhyqHyi/OR3ZoWy/Y7WfXWjIZf6OCx1JTg
	VUkNjuihuYhP42ZkBGhGT4PlHNxKxIsBm7tP7Fp00MyBKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btpm41d2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:27:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a2ef071dso1897093285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768987658; x=1769592458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ER8Nk/qw4IpwuEdI9yvhA7/iV2UE03ZGP2vUT86Ed9g=;
        b=JVJYOjb1OFUYw1ZgJ+fo2rJdk4e01wH1hLAynqWf0IMybJ+o7Ijlwu/UqujmLFgQpz
         GuV6ybQw0GYSJdQ2t218A1CIjuxxwWSOEM2eVUesz1infcNvmhQzaDOblab4BoHUUZqN
         +kx+5qEZRaty3EkM0KrV0eF74xhiVWa28J3V/58KKJ780tH17+GmXKwjcMLnu2LjU18V
         89wtzEl8/7atTw3kKUvji6OpiDh2kfokz4hmz45SUYP/IqVLXnImiPu0802vaU5YRI8d
         GpVTrtd4hUK557msHKLM6qmgEhhl+8DBzn8UCACgqsp/Oxo4UzFANCgtgW+k2p0gtAmU
         MAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768987658; x=1769592458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ER8Nk/qw4IpwuEdI9yvhA7/iV2UE03ZGP2vUT86Ed9g=;
        b=UjygNTodQUHcNrrZtR8rvWQJv4a1247ZaO835aGA82j9tf1od62j4YSS32gD2HVe6w
         ZpiHiYEnDR6xvlw5I7A3zmny62cksZSLwf5r+hR9T/AIVrJXL8ek6EDVZnI4EH5CHw5O
         FyBfegaxUcPfmh4r8hVB0piyc2oBGrTs0cmmUD3hIcSt8+NnDMq4PA7IpqGFyUnnQTtT
         ISYaf4IvyZiNUIGWYBupSLV1gp3vlkVUyd/ZwX0uJ5RX+4YBFtieEJmWqVIBtYbhXUY1
         YAxGhNS6VIw7WlGuD114ySd8bvpUEv1GDoHM5FgJgnQKSQmgUJD2RAcTj1tk0yfx+Rmp
         H6+w==
X-Forwarded-Encrypted: i=1; AJvYcCXFJ+9Ah7Ko3kglOjjK6lzOp38FW38kvOn8z3aRzgdhULl//H17fHfGsOOsaDrV2LBng8Weo3bmz9fRirH4@vger.kernel.org
X-Gm-Message-State: AOJu0YyXGAOgS4OH6j51lLKnPjex6x3ocOM6e4doQY9G9CDEEIOUZwdx
	G3b1dXakHe0h3esA1B2I5sNIFU4A8NOEVuqfIrta0xRuuFa/oTPHScKzy99tJpWFKAQAzhK2owJ
	QnMUrKy3B2LpYBD0ka1mXwHRq68gILJiV8naYZ84YHloxsYadxvXC4wklIMFAmiusWoLv
X-Gm-Gg: AZuq6aKIzz6pdWcWU2PNcYQlWJxnzpBRBVVEk7s+OHz1B9r0GgmQTjGfHNmJye8yXEA
	TNK+HF1SrkGxXJ1H8pWQZuWUlimvbtoNS1e0D3c6ChjtXrNn9PQXV3xZ1QXCZ4lxqEq/LI899pm
	y7jNtlFP9LJNz7xQABmw27snG0WaKAIy8xPDMidh7wmXKh48XCwfCtMANuyvKREeCI8uCE+j/f1
	uAm5PloAVDTWYQcQ+61wPly2AtSyBzC8QONKpCVuOkmkWS+EKrpgnpF3fIJAsqRN9VnYswztHiy
	ABiOZq64pzZIaC30FuWpiSVOD/99oejrKU9svCZ+zcwdEtKpv0VdBV1+kkiJUuAFBTpylz9vtJx
	kBy2hpu11QO/Vk1FVMzgdD70GS26HITTcBdyIHVE9WEWNTue1MEbYTl3NInVai3PzcBtGE3Zfql
	UMSbPtz6l8YfqxDtAI815V1ME=
X-Received: by 2002:a05:620a:3947:b0:8c5:3495:87df with SMTP id af79cd13be357-8c6a691f35emr2407237185a.38.1768987658210;
        Wed, 21 Jan 2026 01:27:38 -0800 (PST)
X-Received: by 2002:a05:620a:3947:b0:8c5:3495:87df with SMTP id af79cd13be357-8c6a691f35emr2407234885a.38.1768987657770;
        Wed, 21 Jan 2026 01:27:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59dd401c189sm138888e87.46.2026.01.21.01.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:27:37 -0800 (PST)
Date: Wed, 21 Jan 2026 11:27:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
Message-ID: <sc57szhtetjs5b2xbudbib2dkaspek6eohviy5ab4po66e3oz4@zhlfb2c4avc3>
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
 <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
 <aXCXSt6_aTmoCnsh@FUE-ALEWI-WINX>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXCXSt6_aTmoCnsh@FUE-ALEWI-WINX>
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=69709c0b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=RU5IKuLUueXCn-6Zq9UA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yfidxSq2op0EQNn3AU-uymjDmxzso8w1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3OCBTYWx0ZWRfX4967wN8bZVO5
 pq6N6Dpn6+UYzAIDDk2i9inrk/AEiVyGIF/TQmejkBTVh2/c7mZl9W9KztPMbErnjMGa4kYeaOb
 Ben43944AwZZWbzjFjizh138+MdPCbzkkmIzhEj7oYxH80fQKFjudZYkPEu8AiE9M/qNua1Y4KB
 SKDJR0VR//97uV2vfMI/WlSeWbX1IcPLhsyMCkCQDkeETMWMW/o02ToynT9suMbyAjfZdTd+u7k
 DPQmABOWHy0oTwdmZ7wjmY1LJCMQx5EwCp965TrX/AChTOloh+ZKFN+/6MU/cMy48Bh2qm+GzPi
 +hqLHM/HfKE1EcQoSWNRIgcn5FqgZuXlGjvm0umGeY1UfyROidvaznHUHKsstEmzoFb70QdERjI
 xtI81NNe5bRgcQoz1R1SE1XnANRI5HvhZxbsXnzMKcmtgMkt/Nh9bCbKd6exkCMg2IWP6aT67gx
 tyhwh9QA2rXEXZAv+Rg==
X-Proofpoint-ORIG-GUID: yfidxSq2op0EQNn3AU-uymjDmxzso8w1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210078
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89969-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 795C65490D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 10:07:22AM +0100, Alexander Wilhelm wrote:
> On Wed, Jan 21, 2026 at 09:22:07AM +0100, David Heidelberg wrote:
> > On 19/11/2025 11:40, Alexander Wilhelm wrote:
> > > Currently, the QMI interface only works on little endian systems due to how
> > > it encodes and decodes data. Most QMI related data structures are defined
> > > in CPU native order and do not use endian specific types.
> > > 
> > > Add support for endian conversion of basic element types in the QMI
> > > encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
> > > ensure correct interpretation on big endian systems. These changes are
> > > required to allow QMI to operate correctly across architectures with
> > > different endianness.
> > > ---
> > 
> > Hello,
> > 
> > I recently (next-20260119) started receiving errors on Pixel 3:
> > 
> > [   21.158943] ipa 1e40000.ipa: received modem running event
> > [   21.164616] qmi_encode: Invalid data length
> > [   21.168930] qcom_q6v5_pas remoteproc-adsp: failed to send subsystem event
> > [   21.175844] qmi_encode: Invalid data length
> > [   21.180494] qcom_q6v5_pas remoteproc-cdsp: failed to send subsystem event
> > [   21.187467] qmi_encode: Invalid data length
> > [   21.191772] qcom-q6v5-mss 4080000.remoteproc: failed to send subsystem
> > event
> > [   21.199088] qmi_encode: Invalid data length
> > [   21.203360] qcom-q6v5-mss 4080000.remoteproc: failed to send subsystem
> > event
> > [   21.210636] remoteproc remoteproc0: remote processor 4080000.remoteproc
> > is now up
> > 
> > Since it's not well tested, I believe there could be problem with
> > configuration, but after reverting this series, no errors pop up.
> > 
> > I would believe maybe these errors was previously hidden, but just to be
> > sure asking here.
> 
> Hi David,
> 
> This is exactly the problem I was afraid of. When the endianness fixes for
> `ath12k` were rejected, I implemented them in the QMI subsystem instead. I only
> tested this with `ath11k` and `ath12k` drivers, both on little-endian and
> big-endian platforms. However, other devices, such as your modem, also rely on
> QMI, but were not tested.
> 
> The difference now is that, instead of using memcpy, basic elements like `u8`,
> `u16`, `u32`, and `u64` are handled explicitly in separate switch-cases. This
> raises the question of what exactly the modem and its corresponding driver are
> doing at this point. Could you please tell me which repository you are working
> on? I could not find `next-20260119` in either the `ath` or the `stable`
> repositories.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/?h=next-20260119


-- 
With best wishes
Dmitry

