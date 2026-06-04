Return-Path: <linux-arm-msm+bounces-111175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id anq0FU9aIWplEwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 12:58:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D53E63F3ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 12:58:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ASCFsNoA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SsliazwD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111175-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111175-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4692305AA88
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 10:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B328F406297;
	Thu,  4 Jun 2026 10:45:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E74B40626D
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 10:45:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780569925; cv=none; b=LAd8QjiViZvMjq6eK+XbT58HWBA9X36LKFeQ2XOS0X3Euqjx3pOtvnCCfvon85MAwxDK7BayQ7n0tbbIdncazlUweqHtdCZHmJYDRlv18ei0SYeIK3Eukfm1Gb8YB2IWgSHZPJZ/Z9KCbMhs+P35cunG+k6gbPpL6xTp1CgRzZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780569925; c=relaxed/simple;
	bh=M8oUBwMoJrg18/xT45KX6GsBOIdZg94wj46SfP7dTMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3coHaTv7sioI7YDFOasfwQd1gzi5IADkDEWjDoWquRxcWlT0NJmjOiupxJDj11b7ECSTfzWcFvW5upQuJswxkbTv2izXBxvDApIkIXYE9Fa5X46eAzQGatc+1LiLv652JJxJjVu7gj9M9g7Iy2xSVOp3wynWG9ASk8RZbkm7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASCFsNoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SsliazwD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65473gER1476767
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 10:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M8oUBwMoJrg18/xT45KX6GsB
	OIdZg94wj46SfP7dTMM=; b=ASCFsNoAfwgAqepX7yt4vzpu0Mrf22IPQrntFazm
	kcRPZC4xF/sTwZRincntkeYYJxLGL4OWzvAkuxtp6r31I4CfDGXL12oo15l5l3Ic
	bjuLH6CoEH1vL2qJYJLkvY7bQ8t/2GaA+AvKIvAeZ1RsIYcpj4P2tkFhfKmYLKSF
	+LZ5bb4eZFZ5/UF5r+sWCXsT1L33djmSs5a4Q0T1JPSPBluYWITIa7HQQxOnr3Nc
	IS1oAquCBfplYbiLtq826mHF18waBICCWhyJtUzPlJLxOEOAS9hlN23F2ozhyodQ
	tWO/039CY6P9tDvYsOM0LGdv2wpdvnzN+VsqogJ3WkIhSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nvb6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 10:45:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0d0516ad7so7217655ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780569923; x=1781174723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M8oUBwMoJrg18/xT45KX6GsBOIdZg94wj46SfP7dTMM=;
        b=SsliazwD98CPtFwyXNayVUJ2z2XwwoHOcD6CTf5sM73xvWTAFCsMJRz91oa7q7JvWP
         8AEvXgpZKNxqcDE/nMIPMsmqif2c6oqNleEOOAO3W0uoOEpy9b7L1lBDanVlBaJ8pJzz
         ClhJ/g23HExrDlLLZdUceA/gWv2Zcol5TxheO/JzWmHwTnaOWT9NyKJGx3IWk4GjWoxB
         QcX8hOB7kwpkVdP/136dRaaPqfK6LGBElJFq7rcNmbeuU4NSzW4e+NHDtPWEK1g/yLyw
         52nJTqp26wqqrKMsPTHXB2MaQ5xjrYfzQlc7dY42Dx/0ZSjwJ4KUZGPuAta4N2zy1HFv
         BH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780569923; x=1781174723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8oUBwMoJrg18/xT45KX6GsBOIdZg94wj46SfP7dTMM=;
        b=C3Kz8pt4u9/oPjva7qPkEBQXEnWRUJZeplegbFAPnP30D6TDav81kVf0vBQ1dNItQV
         bpZyOgLCJALAAeCSbgT7CjX2QmV5LlmS1TnD9X/grWlOcWeuaNlzv7L1cT7PhO2cmAPc
         X0MEHpRPM2ezmDC0bd8cG6EIgH0N1NEGCZJU4mAbCQuGe1zbW/bIEo+sk6h6m/cHgBzN
         a/3QKjznFJ/pCqilHFVokOgltyINK5IQFzkow2sraPG+7SI5JHPMy9pNoK12V/YPaA7G
         IOC0C/OIzbW9dhoEeQveaKkaBb8H65HERpp34cnd69fOlkgZNOROqrwabBQRsohF2dA8
         jikQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h8MjmQ3wWj4yoPx1GAbI4a8qgQvS97FBiBXShvfDwqppcBNocAz0AbS2zyeqf4A5E850BSW+PulSkA4Bc@vger.kernel.org
X-Gm-Message-State: AOJu0YybkxdroUOta6+1FQfjvtt+yA70lcbD2Y8VA2dkVCUeckO7PIUp
	NF/qHS+eIyZjQraQvdNwFh4TVBzcwy8GeN17/8IRXZYMSHIbKtCJSGXEm17aqfgH7VgoHQITAbr
	+rZUm/iDWN+jdRpQL0XtdtWuiRAUzsG1ZG1q5tc1NU4iehodx1D8lniyct3YTD7fqHA70
X-Gm-Gg: Acq92OH5pcXCntMOhe7zI0a8HtOAvEOR1aCZmF3RCLq920GfAqFuoC7D1jVnZttQwXd
	VTnKoFHXeVomBqjATTWK1T0xvOSvhFna8A5+nTLkAJTNWFWJ24wB8hCgQys+JfDewJ6B834d2Q+
	ru8Odvc0j3Q3e2VqvAaKOnme2PdKqTIeCHNj79A1VgRcycTQNK3SApqhYVZEkM+RB6tUIj43XaH
	Xmo5QcdjFkIYl6BLykzs9417NYkNYEjmBs0GeCyT4i9zGwLyaPtflsVUHYAavW2v9uWAtDCAoFe
	X6jcE9yQXE1YGyVJbElVCFAaKJEQrcX0Q/ryTufSlFmv0GnxXZU3jy2STVtvjIqiTw6rQun394b
	IaFkcHBakY0a/B3wBnFfI1AQg45LVKeKlGvXfGtvGjOdqNnZZN7blXAOWUsLLZBMUFrSHngz7xA
	FCIXlXIAAPeC6rWvUKevZ87XweEonzGtty5XFOQl8C+EWCUgF2+t2IHDHMrdrdLA==
X-Received: by 2002:a17:903:1b64:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c163d85f20mr74272645ad.20.1780569923099;
        Thu, 04 Jun 2026 03:45:23 -0700 (PDT)
X-Received: by 2002:a17:903:1b64:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c163d85f20mr74272415ad.20.1780569922622;
        Thu, 04 Jun 2026 03:45:22 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm54701935ad.80.2026.06.04.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 03:45:22 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:15:16 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        mani@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Md Sadre Alam <md.alam@oss.qualcomm.com>, lakshmi.d@oss.qualcomm.com
Subject: Re: [PATCH v5] dma: qcom: bam_dma: Fix command element mask field
 for BAM v1.6.0+
Message-ID: <aiFXPPXtjCHj0Ged@hu-varada-blr.qualcomm.com>
References: <20260514-bam-fix-v5-1-58f6edb34969@oss.qualcomm.com>
 <agyeh4PZwG0Mu6Wx@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agyeh4PZwG0Mu6Wx@vaman>
X-Proofpoint-GUID: KxBUo2dAhW46ciT6L8OyPG039OVEm9RC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEwMiBTYWx0ZWRfXz3gAC0VLZ8OH
 UsssueJu83DVxX359dNSjVMmSfthYN08G4Bdwcvwken0KlxuhtGWFXw7h5fESJ/ovDn8K6dj9to
 lUbMOAbTReaqGHkJ0ncM7fN3L7Mtau4C5hCNrDV1VM38WKn5pPJxq7li2gjRiUmXlbZlrJAXGzD
 4Rxv2cXiZ6qw5AYDl57hV19Vm0kQ6det1won1yDQl6T94xKWh8yO7+hn7K6BQmqJU22JHPrqz0n
 f9Rbx9Vyyfys8u4eD+d8hEr0MDtaadbj+5mIzbdoezeHpMrd7qstMJ92WE8FXoR0Q/c3nwx/i0e
 D8GXzcaUyHHSGvV3mH/9VWMmqv4YLNCUG7qS54VBH2/r5vz8Evb3Bt4l4pdi4eLKC8558vnfLE6
 tMH1qa1SDoWr7WQzOBJbC9i188kS6H8jDJ3+4skluckFLhJ0FjS7WFlaomUaPyMt3WCDrMh5M66
 HB28Blfzf1Kw7BEjzpA==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a215743 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jG7jI5RKT-kwyRtthR8A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: KxBUo2dAhW46ciT6L8OyPG039OVEm9RC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111175-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:absahu@codeaurora.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:md.alam@oss.qualcomm.com,m:lakshmi.d@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D53E63F3ED

On Tue, May 19, 2026 at 11:01:51PM +0530, Vinod Koul wrote:
> On 14-05-26, 12:09, Varadarajan Narayanan wrote:
> > From: Md Sadre Alam <md.alam@oss.qualcomm.com>
> >
> > BAM version 1.6.0 and later changed the behavior of the mask field in
> > command elements for read operations. In newer BAM versions, the mask
> > field for read commands contains the upper 4 bits of the destination
> > address to support 36-bit addressing, while for write commands it
> > continues to function as a traditional write mask.
>
> But this changes behaviour for all versions. What happens to folks on older
> versions, wont this break for them, if not what am I missing

Md Alam,

Can you please respond to Vinod's query.

-Varada

[ . . . ]

