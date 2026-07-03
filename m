Return-Path: <linux-arm-msm+bounces-116355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +FtaJ0jXR2qlgAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE5B703F0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:37:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PvuuOkQ9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Sr+3B9XF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116355-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116355-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED40F302CB4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B9E285CA4;
	Fri,  3 Jul 2026 15:32:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E33233721
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:32:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092738; cv=none; b=RtA2CtOTrqz8cKxAk/SDBmssAfBBHu3Xqmb/m2UKc4cdTQX8YNbysgq6wJRzuweBzyArFORRViCDuMy6FZXVZ+bQ6vFnwMClILnnGbnd5Upo3IAb6XEdbAOio3Lxm0DMarGBO18ZT2tJfJ/JdhuRRCRXDWeK/8c/lMv5tw1V11A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092738; c=relaxed/simple;
	bh=QgII9ryv9JQCJcDtGueopEHukhohDkW/MVfV9fMe9Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scS/rUoRyKN5jfrZI5J5S6RfLc9Lngl6MuKD+EAaZ3Mh3rm5hW2M2LIrquMJyLkLqHHfWzh2v3Hl91SbkUa8MzTTqqfgHQQ30wUSkTjesIDAui7hwLssNjEh6In1pGzvt6El3gM0NUh6y+ZG2rshXzoFoTbKldTznk4RVQFh2Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvuuOkQ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sr+3B9XF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BOOld3109547
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7M4A5A2q632Eb9taEhCM1j2UptjxaJBaXty1useesM=; b=PvuuOkQ9jArDku98
	wI9EVQqMPtbkUAZlu34MQpj0+knqxy5mndEPC3FBq6dg0O0KfNo3YnW79t8Yojb4
	gVXee8ejfgDZ5iheGvhnMpGGSvRKHai8Q+4fTYBiF/pPNbmrVCIeGl/Bxe4nuGsm
	vJASGILm2isKIXB8Ets7LxlXzg8kERTLOx3Ca65IQzO/vqjDpQvhcuThnadQl0X6
	XbxkuttmZrhQQk7qctiwyRQA++zZqe+Y1AJOsXYwB+qZ/kNQYhoOz6CwhFueZoHY
	Frf4HKEzw1LYoJg1cllFhkacdjmpWs9sIkIvp9nplCWBuHD06BYhz8uVavRWayaq
	B6BikA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eybpah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:32:15 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48f5afc9692so608964b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783092734; x=1783697534; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7M4A5A2q632Eb9taEhCM1j2UptjxaJBaXty1useesM=;
        b=Sr+3B9XFZglOzEYS3Eju/vpOhnQX+Sfe54pCffUQ4qFjFpXPPgR04HpQY8UK7I670H
         hW6T/WIpCc3QMnNT9X6/TdHWgsFzT7ZddlzYYK1WvlxS4Srq3wlw+5QC0OcoL/lRDBZq
         j8/beSZWNo9UOW6/ZsbG7Ew7jrd3RR1b3Yz/NBa7dphsLmqKID9DN/FDn/Tj/tVaE/bL
         S9D5RyLz9bW+cPoucM1Wz/qMK5iE5RCkY07gtPJlpZqx33bAfgQ27ueEJ9l4sG2fRWu1
         yA44sTbEnW2m921IFmk40xUst3/rEClt4+a4PPi1mDrr1Ln9Hcqtf1r57tUuTsvdiFD+
         MYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092734; x=1783697534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U7M4A5A2q632Eb9taEhCM1j2UptjxaJBaXty1useesM=;
        b=GAHXGnKyHRIdHbfGKGxdvYuVvgsLBTNECBxoeiuMJ7RiUhuR1jTztXdA/sdJopTH7a
         fijBQm2yroNnltzgBOHnzvr0nGs0ybdSBY9fTkl0JOmA7QUvhurooaD8Uf032uxuf3xm
         z8TMoTX3jVdbqktY4zm3aya5IZcEl/JleTlHnuOpaZMLK67yaURzTO/GYXdZ3eUbjQQq
         lgN+uG1eO72JbSwMbcHdaXJQj5SKU59XmhOu/hi8SiAsrhZQWXvXBrgNbf5wkZnadtzy
         5kbeqo0FSnH6/l2MQVO1wQOE9IqkbGqa3qMSnEtRmc9FuaMr8RHOE0H38i93NNB7Q3JY
         5Qqw==
X-Forwarded-Encrypted: i=1; AFNElJ+IIWp3GMOSThLlBC9bBjogtOscpjeUTkDK3moOAF9exXcRU+oPkkW5ZLz3/xc2jqC6iYS2fFNtu/XoLAjK@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCsRW3fJvrZF74uhGKgIk3YQT+4I4UDQg3NzKKiJk/sk+EyOx
	a48XIsGLKpJEALt0MvXPZKBrcoVpt90sHvSuZyD8+k0A3AATeY3AFNJMzcQqlv1Bnql01b0/7BW
	VmGhZk2E56uEDbFdaO+tu2cW5vkpcnuEzFN5q9nc5sZAUAEqzAUaW82YEKWm7S+bRIwvb
X-Gm-Gg: AfdE7cmY+FJlxpT35C+i4lmFy8w2uts9Qo5rDyUfZvcWTx3Zl40bJhHix4O5fZ0xX33
	2VMbsL90zTM1GFVxcrWGSFQItpuEqqy3I3z1r/5UjCI4WypIANeQmsQ0pZDdDZlHRUCBrBWR9Hh
	kLaOrsRem1eglMCdhQrI9yc80yvgfEKhGBPShNeYBm7AYJhtpzEkfEy8PmBU+9OiYS2DVq+L6o1
	bSRevHFKodspKhcatgdLqY1Y+1+C9LT7/kABm9yBsmMQNN294yUJWloEt7jHPGMvejhlyUEsK/P
	MfNugqj/NJll2ls1Ck7YsAzeuaIHNhTbpKcar75vs99AsCwZuxwpn8YMUp/ivXGfkq+FWnQYSPb
	189kdL7wxIUXgNJqjFveibLSqTp7qr9f2vobMGkWlDBPxB9HUzDM8GHkLDZPuzh0t83ThlKAlap
	EDbhzLOPLb/f6IKOwYGv36aS+w
X-Received: by 2002:a05:6808:8412:b0:497:8ca:a8fc with SMTP id 5614622812f47-49708cab015mr5568052b6e.19.1783092734575;
        Fri, 03 Jul 2026 08:32:14 -0700 (PDT)
X-Received: by 2002:a05:6808:8412:b0:497:8ca:a8fc with SMTP id 5614622812f47-49708cab015mr5568021b6e.19.1783092734107;
        Fri, 03 Jul 2026 08:32:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae59a10sm3852541fa.33.2026.07.03.08.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:32:12 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:32:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <fku5jad6op5upobwvrphbqteg76zukbovsifzarizz4m3ofuka@gdpaxzzuraee>
References: <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
 <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
 <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
 <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
 <33c74e59-076a-4877-9e62-83a8ebbf2d54@oss.qualcomm.com>
 <20260703093035.q5xgljuigpt6zqt6@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703093035.q5xgljuigpt6zqt6@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MiBTYWx0ZWRfX16SG9QA9h94q
 /zYdA4+DzwnkcogAdzAjwiw8ajfoP8XFC/GgJsptoqpQjjfj0Xow9PfCZJpxNqCxKxa9HPCpoHo
 YvVyjLHPPhbdt5D9CXtIgMdz3EgdyrxLcRsER2gzPgH7/64iI1v+5wBWwfhRZhVRTft8RTwqhSy
 PEEalr5wsUtbcCatVDoToRQYr3KnNyeFhQy2+70Ng/5I7KdJe1IaTacbgQqKk2R1x3DjJMLs5Fk
 gvLZFBub9LKKFup3IqZcdFrVW4MXDt2qR9IH6EawBm/rkzzasSP9zHKsm6n6gFjxrqEbBm7p6RV
 vwW8ZpMOzK/aZdah905e6x4yFl0O10ffOScRYNpslKE6YGqkKB9sHtZCcVO6/JXbY6SgMx9MKhF
 Ko8yQgqUPcXRf3CjjTYcBVPBtm2jk2y5ZyjwA7ALPKD+mlmEXqORw7VD4zysK/DsmbN8NOaV0n9
 LvnbFqTobR07u5h+R3g==
X-Proofpoint-GUID: 2LIqDCw1qFvMfy7zXFp5A6Z-qGyala0l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MiBTYWx0ZWRfXyfG90osKqE4R
 MPys51lgVPfVaSmq+lAHXotI6sxdIDeHc/K3t4g2fHDUkYRoaX2VW1IAGgs8Zv/7/0ZWmlU3eEB
 SPrg/Eyf46gsJQcq50YguFVHMBAHYMI=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47d5ff cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eBmASph2dt7FLklNJeEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: 2LIqDCw1qFvMfy7zXFp5A6Z-qGyala0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116355-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:komal.bajaj@oss.qualcomm.com,m:robh@kernel.org,m:linux-phy@lists.infradead.org,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:olteanv@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DE5B703F0B

On Fri, Jul 03, 2026 at 03:00:35PM +0530, Rakesh Kota wrote:
> On Tue, Jun 30, 2026 at 03:50:16PM +0200, Konrad Dybcio wrote:
> > On 6/30/26 2:42 PM, Rakesh Kota wrote:
> > > On Sun, Jun 28, 2026 at 03:33:23PM +0300, Dmitry Baryshkov wrote:
> > >> On Thu, Jun 25, 2026 at 09:11:19PM +0530, Kamal Wadhwa wrote:
> > >>> On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> > >>>> On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> > >>>> <kamal.wadhwa@oss.qualcomm.com> wrote:
> > >>>>>
> > >>>>> On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > >>>>>> On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > >>>>>>> On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > >>>>>>>> On 13/05/2026 17:29, Rakesh Kota wrote:
> > >>>>>>>>> On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > >>>>>>>>>> On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > >>>>>>>>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > >>>>>>>>>>> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > >>>>>>>>>>> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > >>>>>>>>>>> --
> > >>>>>>>>>>>> +
> > >>>>>>>>>>>> +         pm4125_s2: s2 {
> > >>>>>>>>>>>> +                 regulator-min-microvolt = <1000000>;
> > >>>>>>>>>>>> +                 regulator-max-microvolt = <1200000>;
> > >>>>>>>>>>>> +         };
> > >>>>>>>>>>>
> > >>>>>>>>>>> Do these regulators need to explicitly define their input supply dependencies
> > >>>>>>>>>>> such as vdd_s2-supply?
> > >>>>>>>>>>>
> > >>>>>>>>>>> Without these properties, the regulator framework might be unaware that the
> > >>>>>>>>>>> PMIC regulators draw power from upstream supplies.
> > >>>>>>>>>>>
> > >>>>>>>>>>> If the kernel dynamically manages the upstream supply and its reference count
> > >>>>>>>>>>> drops to zero, could it be disabled, causing an unexpected power loss for
> > >>>>>>>>>>> downstream components?
> > >>>>>>>>>>
> > >>>>>>>>>> And this is a correct comment. Please provide missing supplies.
> > >>>>>>>>>>
> > >>>>>>>>> As per the Qualcomm system design, the parent-child supply relationship
> > >>>>>>>>> is managed by the RPM firmware, not the Linux regulator framework. The
> > >>>>>>>>> RPM ensures the parent supply is never disabled until all subsystem
> > >>>>>>>>> votes are cleared.
> > >>>>>>>>
> > >>>>>>>> How is this different from other, previous platforms?
> > >>>>>>>
> > >>>>>>> This is not different. In the previous platforms too this is taken care from the
> > >>>>>>> RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > >>>>>>> is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > >>>>>>> may have a RPM/RPMH regulator as a parent.
> > >>>>>>>
> > >>>>>>> Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > >>>>>>> internally voted by RPM/RPMH FW at proper voltage with required headroom
> > >>>>>>> calculated based on the active child rails. This was done for all the
> > >>>>>>> subsystems (including APPS) regulators.
> > >>>>>>>
> > >>>>>>> So no explicit handling from the APPS is required for parent supply.
> > >>>>>>
> > >>>>>> You are explaining the driver behaviour. But the question is about the
> > >>>>>> hardware description. If there is no difference, please add necessary
> > >>>>>> supplies back.
> > >>>>>
> > >>>>> I understand your concern about descibing the parent-child relation in the
> > >>>>> devicetree, and given that we have been almost always followed this for all
> > >>>>> the previous targets, it will expected of us to add them.
> > >>>>
> > >>>> Yes.
> > >>>>
> > >>>>>
> > >>>>> However, we want to avoid the unnecessary access to the parent from APPS.
> > >>>>
> > >>>> Why? What is the reason? Do we want to do the same for all the
> > >>>> platforms? Only for Shikra? Something else?
> > >>>>
> > >>>>> At the moment, I do not see a way to avoid that, if we add the parent
> > >>>>> regulators.
> > >>>>
> > >>>> That depend on the answer to the previous question. In the end, we can
> > >>>> make the driver ignore the parents by removing them from the regulator
> > >>>> desc.
> > >>>
> > >>> Ok, this seems like a good suggestion, so you mean its ok if we define the
> > >>> regulator desc's supply column with NULL? And only keep that in the DT?
> > >>>
> > >>> you mean like this?
> > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453
> > >>>
> > >>> (please let me know if i got that right. thanks)
> > >>
> > >> Yes. Don't forget to explain in the commit message, why you are doing
> > >> so.
> > > 
> > > Currently, Agatti uses the same PMIC, so we cannot set the driver
> > > supply name reference to NULL. Since it's an older target,
> > > we'll need to run a regression before making any driver-level changes.
> > > 
> > > Additionally, the child-to-parent regulator ganging differs between
> > > Shikra and Agatti:
> > > 
> > >  - On Agatti, l3 regulator is ganged with vdd_l13_l14_l15_l16
> > >  - On Shikra, l3 is ganged with vdd_l2_l3
> > 
> > Is it configurable on the PMIC level? I was under the impression the
> > supply maps are fixed in hardware.  Is there a chance the agatti
> > description is just wrong?
> 
> The supply ganging between child LDOs and parent supplies is not fixed
> at the PMIC hardware level — it varies per platform based on system
> design requirements. The same LDO can have a different parent supply on
> different SoCs.

It can have different power supplies, but the supply is provided through
a fixed pin of the PMIC. Please correct me if I'm wrong.

> I have verified the Agatti parent-child supply mappings and they are
> correct. The difference between Agatti and Shikra is a legitimate
> platform-level design difference, not an error in the Agatti DT.

There is an error in the DT. It uses fake PMIC supply names.

-- 
With best wishes
Dmitry

