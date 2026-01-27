Return-Path: <linux-arm-msm+bounces-90804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MArGHSXXeGmUtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:17:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 174DE96844
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7E003078E92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7537363C76;
	Tue, 27 Jan 2026 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IeStlwHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DcphQKsb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FC35DCEE
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526397; cv=none; b=Lu+1gg7QZ5PmQJNoG7QUrfW1oznms0BvzKXFw1s4lz4tVh5GtxPSDkeKtx2NinexRZyDRFS2VFLNFc5JjsozRnoVbQue1ASqDZI70Jb41polz3+qU2aEG/m34k8ZjKZCr3Z/BqFt9CkUaW6EeYxBd/57cQSDEZKSOrLNIkEWMhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526397; c=relaxed/simple;
	bh=rF+wBZLJGVog8Mr0p18tKHa9iByVNTlYEwMH0NsBhaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PccaMPbpdvak8WucMKkVgpCWQtMvQ8Fwi5EWT2qVzRhPPPjlly74Mz2tTyQkXe4xA0mXOI2ZBH1b2fUxJ3xFD6/1bRFat23ICK8UFVmqqc7w5uUiqhYXDLdnayMzpEi4ZzF5PH80B5LVOEcsQ3Sw5olQJMgVImN1QCWUANUZodA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IeStlwHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DcphQKsb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60REZeUO1065897
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XCIIqC8A64YwinXZNYsAm37j
	XP/MVxvMN1I6jJF4pp8=; b=IeStlwHV3Qj+wq/beLnDnQ003WIseP8c/DTeiwp/
	nM4Xiy8CzOXNSAH8+ixIUtkd5M9mgo/6qMhZ/tzUb46aWaLkSMbzrCZKcTmNjAty
	dCyOslKKT+S1x6x2QqsFLhwK0rJVwVa8MwQuUeS4DLSitIJ4g41xo3WWmMX+RAB2
	haD4o2qg+5O8lIc3UUQBNg6fXYnK4h3DHvYcj9lKWmGF6I8jDzQhNkFFgtvdnIHD
	MlCGno/a/dXGIjbbBVC0GqLAUQn3KxTQEcFrs4cpgAdXsBZO0/iPSTaMVrbMc75t
	UfIpicru36LXLhT/5W3AVTxT494ZZPv6yUAJfylHaxck+A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxy8x03ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:06:35 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9411b2335f4so19830515241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769526395; x=1770131195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCIIqC8A64YwinXZNYsAm37jXP/MVxvMN1I6jJF4pp8=;
        b=DcphQKsbJuGtALZDFmr5qv/YxDStFru6bvCSEpQjSwjMuwBmz+E1loHBEWcYu+Ci9L
         LhyXJJ5BaZseM67UL8/IbFTy3zGcBHhdOT87i2UYj5CnDfx1n+UZceTrHHa2bhWNXn/o
         NXKhOwIPa0fTqurCNSkYz1XH+cUMRYCAL8vN6yNkT067zRuTFWZt2jf6cD/YMkOkpBrU
         hM/upDp5WySzgy/jTT5ozQX5d176GSg1AqbgfhBQhDHJEB9tKREXUL/K2+4GoCuMtKXJ
         TaqJI3LVL1s73utKmpJcjNlzFH91tvabjsrGJzOYNdiFf9kDBy539Kenruid0FHZFDgb
         3k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526395; x=1770131195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCIIqC8A64YwinXZNYsAm37jXP/MVxvMN1I6jJF4pp8=;
        b=DNUZh+2Zwo+ETh/KQ5R64NEJGjTfCFfPPzPxNzaMfjdHSBye8wWuYnbsw/v2Ji2GEa
         pV9nJ4AO/3xm0ZkKAEO0rqegU/xZn2A6P1Y5/3rYH/qRYh2Z/HwAAPieGXCOvVte52SU
         Yb4BSQ8SOIkK5/VVeUQ9WZRsF60CVNKVIWx9HUgzyh/mi28soAdlp9oFb7i2uIYW7PhB
         9GJTQbxpyS+7zUnqMofaoATvIhIqBaODLFiULS8ZnKhhfaGMnAB9f890YrA5ApbfDMPU
         Cb2J9KCv5njMLhLdsqHbzdgXZ4MYtsvazLVS4TWgkyHutDLtwcOAs7p+mVeGcowlCiip
         frBA==
X-Forwarded-Encrypted: i=1; AJvYcCVgrQOkdhvYFmzfsTTHyO22jpE0ycj+tPOirKOx8E9iHew8rya/gZrnZcRGSOEj7lm6fOwDOJrddVOO481N@vger.kernel.org
X-Gm-Message-State: AOJu0YxJDBePeIN9dBO1wnDd3x/qZBzwqZFjoMYCHota9sNhFMUYfa0K
	WhhXIqy9dfSSNwau4cl6fkXUmP9q/YafOd5eZUrrZmzH5gdLj6v11QuuRma1oDTbutVtyyyH0xm
	IdTspexIa/+D4DNctqeyJWZ62g2zCW2JmGP87tcNWVW0+5tCAgc5QjM3lYEGBnV4N4b/l
X-Gm-Gg: AZuq6aKd4zlGsuv25JW7MUfgJZ0P28dsdlVJRZdOgdUEPGYMQQw/SAaZEERl71u8RzG
	OxQjuMtk4S2hzTiKNLcWsn1ilL7GqdzFyMgPNAQ+o3bnzfSBreKz9OpfGlkEJpgD5hVDE2+nx6y
	8heXsp8tdiK9pAnMbcWL3uroymwZs6I1bCaV1ON3MKAhspCEnWTA6D2m0BR3XA3+R0fGl0SIkRG
	RpDVlGETxpR0CzC0F7fC5jXaXPhDuzTg12sj7USLwtLUj1PtMY2tHJH+wOwG3QVHF7UeeChzJBk
	0HGJ/jwhAgBlrIlugwAYqF6KUu9frNTcNeY83t+dLHHpChXV2H4p4QJjz9QqjSrdzrXXKJf7re3
	qB7bGDqOrDJ+PCAHmt1x9mNdIPWmcTQ4eHdy0fUPA+RTfuWtih/tBmY8ewG+BWfVWBuD0++dwpz
	FrJhp5Ea6TDwWlIN2xolYypOY=
X-Received: by 2002:a05:6102:3f07:b0:5f1:ba4d:8946 with SMTP id ada2fe7eead31-5f7235f5e95mr798108137.4.1769526394674;
        Tue, 27 Jan 2026 07:06:34 -0800 (PST)
X-Received: by 2002:a05:6102:3f07:b0:5f1:ba4d:8946 with SMTP id ada2fe7eead31-5f7235f5e95mr797628137.4.1769526388866;
        Tue, 27 Jan 2026 07:06:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48ec121sm3463815e87.42.2026.01.27.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:06:28 -0800 (PST)
Date: Tue, 27 Jan 2026 17:06:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Enable HFP hardware offload
 for WCN6855
Message-ID: <l2ib5kalse4nop6e6ak5xronejxusnprl4qgz2wxvdw7wpzw6e@aa6fn35id4we>
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
 <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
 <7b9fec28-2272-4ff7-9575-76e72cecada5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b9fec28-2272-4ff7-9575-76e72cecada5@oss.qualcomm.com>
X-Proofpoint-GUID: TKCifrFL3w73Oiq6j4KwD1SAP1pOGGH-
X-Authority-Analysis: v=2.4 cv=OcWVzxTY c=1 sm=1 tr=0 ts=6978d47b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=h7lLkuc-r4rZPDWG9ycA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: TKCifrFL3w73Oiq6j4KwD1SAP1pOGGH-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMyBTYWx0ZWRfX/A2eWDnbMLEF
 emRLETG9YmIeQjqdomwwZ3lI6gnc5Fs2yvCXyyW9MZ6qDqwgdqwLlN9sMAnnnvz+SPEkWFpSG5r
 za14SCbHoqZpVR0ZT41dkKJp2OxJ4im6UODHqjMv41UD6vEVLxcyVjBHh2s0eUTrMn1LCcTHYH4
 HDKr08XIfN+5wTwuxB5XnNR+I+z9rnsEhuAiyjtq89yJedt3E+44z3yvg8W9nMgaz3HdYuNU3Ly
 pLEPfHVNsXJEROWGkfR+4KYvQhs8aMUX9uQHqILV1GCrIIwowu5Ju4AZemg3gC9XdPrkLly4cma
 EAhOy8zyHULEPPz15/AB+F65j3E9aT+G4Uctl9MbM3rs5bk43uvpeWc6yIVmKMVO4Hcbooyh+hN
 udbCWHBQ8J410aIgEwA0isoCvGF5HnivFP7bEfdEFtJdfbZJ17eKNTXwEfRfhytTaJX8EEUd056
 aHZlrVgmcXBXCXkMHzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90804-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 174DE96844
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:32:58AM +0800, Mengshi Wu wrote:
> 
> 
> On 1/27/2026 1:51 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 12:24:44AM +0800, Mengshi Wu wrote:
> >> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
> >> data structures to enable Hands-Free Profile (HFP) hardware
> >> offload support on these Qualcomm Bluetooth chipsets.
> >>
> >> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> >> ---
> >>  drivers/bluetooth/hci_qca.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> > 
> > Any other chips which would benefit from this flag? If you are setting
> > it for WCN6855, I'd assume that it also applies to WCN7850. Should it be
> > set for WCN6750?
> > 
> 
> Thanks for the reminder. This should also apply to WCN7850. WCN6750 is not
> considered at this time.

What does it mean? It either supports HFP ofload, or not. Does it?

-- 
With best wishes
Dmitry

