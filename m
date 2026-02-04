Return-Path: <linux-arm-msm+bounces-91757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOG5Bdqygmn/YAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:45:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69475E0F8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93DC4303C29D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82782D7393;
	Wed,  4 Feb 2026 02:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NER02KUj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MkmBLyp4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89190273809
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770173093; cv=none; b=sDdJEjnOVwGbctPKujZApiNC7yX0KOFl4/5iQXp/NcZdDTbDXJrWSYvKAI/kb1tXrOcKLzB0awQIMkk1kpbTm9boZ4aJihR8SIfo6A1u/ZFpTns4M5ISbMwySX17KQ0OStNypSaawZsU3eRkfSPXFLe0hW3MQTajvo9xclcfoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770173093; c=relaxed/simple;
	bh=URSzt4e31IWtDehdEwM8TtFL1y1HXZAdRA2GJR4mqEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTI/d1GOKs/jOQHJU0xStPrp4gHgngReTg5+m3JI5DgEK2UNkNM4JulHyJP2jZTreqya1fnPCfjLDYF0uBDnPNEqlT3RocKWOLRhqOso7qnbkTB7xj3bsL9r2ElYOcVyPxUh7TW75mPBGy8cAaYPBtq22TgBxnk5amERG9jqrlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NER02KUj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MkmBLyp4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Im2ou2055095
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PXkXd0BW+NaXrKZqC+f14ycv
	r1b/HmaY15QlzENtKsQ=; b=NER02KUjODtiw4oi+uVa1Tyecf7N0HblURCLPzcN
	nh3CKR//I2lN2UCW+gHLpP3c61sPCtC6GM9fEcBURHei2DAU15Rm0Rs5H/u4imPV
	Xh2OuKpjSqRtoEXUTV1kSB6SNusR+ggtpkIFG2Ip1u9wktrTnsEBwBsP9+S6ClHS
	KRug7vBf5kc43wJE7WjKZr/rTycuXTllTollQQpVw6G1OpaY9GF7x3a5GcFUTqEJ
	pPrYJkFybeI0xurdOcZ4cZnUGcQv5Y1JNm6r+ylWuGJwX8o7poorX9b/hiXZAU+w
	/RtCwzuVX4qEI7qQHuq+XrycMhMmxzcIVO1CWO6GuBigHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exkb2q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:44:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c882774f0dso486973385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770173091; x=1770777891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PXkXd0BW+NaXrKZqC+f14ycvr1b/HmaY15QlzENtKsQ=;
        b=MkmBLyp4Xrykzfp0ueE3nm0ZUSRGC3mIvS8MAnHzaiosw0EOeLnA1wKjyf6OOdBYkx
         vAoSkbLzT6ecel2zvgKjNmrhrx5dP+yC1TiV4FRxvmeV2Oobf+R6sv9glJUJsRQWeaWg
         ocKLZkFidbVznmjusDJljKaDwaeQQFnKKFq4kHxNAE/SSJkWLgrVgebIVugQRt95akga
         PFlJqVfjaVM/Mz2de6aUs8RTMz34VSCeQWXMC5raycf2oAGGJu0JVmNk7bw8DDfON1JN
         v1OjgSuPqw3zCRZqxuq4O5TQZp9bBlvbnHs1oDuYkT9oUiipPTo+1a9RvXVs64Em6uaS
         yKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173091; x=1770777891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXkXd0BW+NaXrKZqC+f14ycvr1b/HmaY15QlzENtKsQ=;
        b=DO0geIMs+lqTpitdDRApvrMpbL8WnkgLqB+iSk7T6yfmTiCfJx9tHIOnhj1Y9T/4Zy
         WtN2KLtXziXummnX8s70HLmSeDQVZSVvCwfy+uhI7O2Sk6wtlIJvG4/+Z9zlcLo1YhLC
         W9j/2WF+awJBAtEY8Z1AusVCxQFRoAEGvQotKwkMLF3oloN5O5ynjGipBr4SG3CaB2xw
         +SrVssj4kYHjwzCiJZPPd5kzEHymnRhMOMLpshaWe3nE6qQUgRTVy1CGsRbqVdMvLKZM
         wpvJ+1jUnVw2l6H+MD103jgIRjPwA7TKCwBGmkZXkRxK+M8wBk7KwnuoachJz16BoZ4t
         uqXg==
X-Forwarded-Encrypted: i=1; AJvYcCXNCWuCtearROyTvXMgf/dBQKFmAsp4gYZS9e/P6twudtD28dCS95Pl/raFezC5yey2/kIt5eLBWEbdPDI2@vger.kernel.org
X-Gm-Message-State: AOJu0YxgSkGiSbfYHUqUzPmhANk7z1gOk7q2BP+6e8ufocx/ZTLa4thE
	6gFMehhP4Bx/I5kNgwLmMexQV2u8482gGDv0UCoFfCOP3z+nDJYCtU20yujKALwxM5ekS6y4Evs
	UZg5SxhZyNOPHLSW61aXH7UKzUoYTgIc1G6EyZ0s7o08peY5K3yw752dpjsuIki4l4Z8H
X-Gm-Gg: AZuq6aJOqosuFN9hRTNVEgTSfJB5Zk1qH2t2z1agMPRqjSQIeVSDt/TbW7ZHBuaNg3p
	wPj2EWGVaaEC7RAP/OWYPyxxd3qQ3rLgDUC5OtfGKRHVsPKnS6s57NmD7lWOh47QqJg+tE6b/Vw
	Imcal5VkgVAKGqMfaqj/1Pwp4vTCKeiDQzugweozHt2Eh+Fx7xgxYEPnz9KN3ZdgleQca12neAH
	+gxE6wad8ZJ4muHlvjA+OMbLpvcOeCX+GWevDYzSJf9DZclXn/QXh4UHGo0wRdOGqGtJsbQrz4Y
	EwBDebTntE/8Oa4md1hKuLTXzXsWDlwBY7+PW6Q4lwRlW74PnyuXBbgJyDuf4IBjjhZDUFBQOD3
	XVcFXguMz4JYLpfsXNY+QtqP3duONe/hoMkfA/fH5VMP5e6iKb52dyD7lbozC4dj/BicUbY1epk
	GLLLVIUESP2bA59u98vaLALpc=
X-Received: by 2002:a05:620a:448e:b0:8c6:a734:7d8a with SMTP id af79cd13be357-8ca2f839d28mr210952585a.4.1770173090732;
        Tue, 03 Feb 2026 18:44:50 -0800 (PST)
X-Received: by 2002:a05:620a:448e:b0:8c6:a734:7d8a with SMTP id af79cd13be357-8ca2f839d28mr210951185a.4.1770173090298;
        Tue, 03 Feb 2026 18:44:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e388278bdsm280134e87.81.2026.02.03.18.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:44:49 -0800 (PST)
Date: Wed, 4 Feb 2026 04:44:48 +0200
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
Message-ID: <cumctdilwq4nknp2yvix3sjlxbrecun22dbiwwuxnhahn6cdhg@7swcvpcc2syb>
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
 <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
 <7b9fec28-2272-4ff7-9575-76e72cecada5@oss.qualcomm.com>
 <l2ib5kalse4nop6e6ak5xronejxusnprl4qgz2wxvdw7wpzw6e@aa6fn35id4we>
 <ca86ca83-1951-433a-9903-a95dd4be23b0@oss.qualcomm.com>
 <cx3yjz2nrwe6iwqorx537qzoz4qc3yefpln5ed7z3ocgeqlwq3@arj7auyyfutl>
 <800555e0-47ca-4d2f-8193-aeef76cdfcec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <800555e0-47ca-4d2f-8193-aeef76cdfcec@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNyBTYWx0ZWRfX/pJN7Abz9o/A
 SRmGqgjXH9MUEoLMx+aTgTP9LA5pFYn1wUri4lDlqiWE+B5SeIbTI2hEpmLF1ZCzvlVoiFuluG5
 D1scKe4Pk6i2Wl1FyEFxX9lF+796guR5Y3x9i10yhMQtbP5+SbHXLd6IMq6hIwxDi/w+IH1UIup
 ddel39gsFs2udnKXMupM2rkf8HFXegvHjdb12P3CQA4m0sPJwCyMcB1IBgsAMHXd4CZReI4lpG6
 GT2Vz4zCDSxxHOKU3lK7E9ce/oMoC+LR6a3jTpGxXe4gXcvbDi0h2NFzDyvDdtuW7watScA4eWD
 5/xQuOLsu29a/3g9TCT7Q+ztsUS4IlOg/7j2xASrCrAidbITmeuWrsZ8b2JpZDqtR9kr5Yo5hSI
 e2qI28SBkUALxfxkBqfEfjOjK5DL0n0IAVLamSsEosBxodOaBnirESv+5tUXW3X4USub/1akhxw
 IRzUCXlayGEaY8auzeQ==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=6982b2a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zKM82OUwgC45EebPwgwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Wl4Q-S4-XqA6jZyjevoQrF7H5k1XnDss
X-Proofpoint-GUID: Wl4Q-S4-XqA6jZyjevoQrF7H5k1XnDss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91757-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69475E0F8D
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 10:33:53AM +0800, Mengshi Wu wrote:
> Hi,
> 
> On 1/30/2026 10:31 AM, Dmitry Baryshkov wrote:
> > On Wed, Jan 28, 2026 at 11:17:49AM +0800, Mengshi Wu wrote:
> >> Hi, 
> >>
> >> On 1/27/2026 11:06 PM, Dmitry Baryshkov wrote:
> >>> On Tue, Jan 27, 2026 at 10:32:58AM +0800, Mengshi Wu wrote:
> >>>>
> >>>>
> >>>> On 1/27/2026 1:51 AM, Dmitry Baryshkov wrote:
> >>>>> On Tue, Jan 27, 2026 at 12:24:44AM +0800, Mengshi Wu wrote:
> >>>>>> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
> >>>>>> data structures to enable Hands-Free Profile (HFP) hardware
> >>>>>> offload support on these Qualcomm Bluetooth chipsets.
> >>>>>>
> >>>>>> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  drivers/bluetooth/hci_qca.c | 3 ++-
> >>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>
> >>>>> Any other chips which would benefit from this flag? If you are setting
> >>>>> it for WCN6855, I'd assume that it also applies to WCN7850. Should it be
> >>>>> set for WCN6750?
> >>>>>
> >>>>
> >>>> Thanks for the reminder. This should also apply to WCN7850. WCN6750 is not
> >>>> considered at this time.
> >>>
> >>> What does it mean? It either supports HFP ofload, or not. Does it?
> >>>
> >>
> >> We have not yet enabled the WCN6750 hardware offload feature from the
> >> software side. Other chips will support this feature subsequently. If
> >> I add the flag too early, it may be kind of misleading since the feature
> >> is not really ready yet.
> > 
> > By the software side do you mean BT firmware or something else?
> > 
> Yes, firmware. And we will update firmware later to support this feature.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

