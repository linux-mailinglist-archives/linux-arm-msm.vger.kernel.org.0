Return-Path: <linux-arm-msm+bounces-111559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JnwxF5ZIJWoTGAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 12:31:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C284F64FBEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 12:31:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YUS4sxft;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bP7kLg+E;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111559-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111559-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE9863029786
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 10:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5B7328B7B;
	Sun,  7 Jun 2026 10:30:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5F329E7E
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 10:30:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780828213; cv=none; b=P/majG0yvP3HkqhDpkINJyk7fQwoWBBJbZQeTjTAn1HEvZeoO+tKEdUPNnY4JgTUsJ9q5Un3I5vIj0eElogH2ythqF51TgTUyYlqdBkCs+y0kKkosXhwzFKHqxiCZRAB2V+UICCsl/7qNpBPrcl/1rfePOyAw1HMR6pBOP9QbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780828213; c=relaxed/simple;
	bh=zUlU+FKCAPmT6i082BqHIl/+eTJQaBXimRlgvIK2VYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKnKhcuf4Ee8e6t9MB6uyig0tqrgskisgIuWKpJIKfH5nUVTF9YK/xRZRumTA3quqk6hLOAfkqy7rCHCeJOuzws5kYX7Wfv5TD6qlazy24b+UGx4+3zVdQsPw3nZHFmPdSPcYBeKg4vvvc9paKziaR/GbgDuof9et2Fk1J14UbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUS4sxft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bP7kLg+E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6579P16A241779
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 10:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RsyqRj4yeF8EzF3oAom759oVpvrvl97v3DGVkUjIWU=; b=YUS4sxftiCRt5g3Y
	Fz8c796DgFs7CdFiOy0IJ2zDmqWXVM/Ly1JwOb5lrvuZw6Xu3LRWKh9i24QnF158
	Gx7xiRQU5xtNBGuGWASFKWFswKJyZZ0zwbe2ndLmrpdwvT5Xu7f9LhgvvA/YZmWP
	WuXcl00hMsYMAb+NTtHy+pldaQs7wKbkOuw5yItfw1s1P9Tb9Jdr83cMPMZvwD92
	MPSg2ik1eHE2Z5X7RzqkMzBRhCrlRyMKmjN2mTIt+1h36UUi5CrEBhBCUjwV2Dux
	OSVzSn84RdXQJX2pinn/kFxlUH9vXo4qr2FMx4YFED9f+OhuUXtXW1oFOWKdCI44
	YRdn3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrbmbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 10:30:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177bddf6e0so84200731cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780828209; x=1781433009; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5RsyqRj4yeF8EzF3oAom759oVpvrvl97v3DGVkUjIWU=;
        b=bP7kLg+Eu/aEahRBmp+BOMe1Anl8dLKrj2lIRDf+deTxOzHYQYdfLtCPKPcuIMcFEK
         wZbTEtYuNbluHez6ZIWgtsD+0DK8F8lgg3ZBUVF8uO/343djM8ANNf9hQ7wjWmpibmWL
         mcc4gNsFTjnqcJabG/JoNxovsBimkpoR6RGEUordKWTudzwJrac7dDWuDr9acX6MdyWX
         sI1c5x9YLB/ByAp9OOGBb4nunptk9yjIa5RfUHNiUntH5XmwwzYdCyZz9rSFy/Yp1VjY
         /nBxo3XRv+O0jv6Pj2wwInyhtsSNCSRQI1RUiM4AWOo4hyxGP5nfhsxuVAzLEAE/vD7u
         hCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780828209; x=1781433009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RsyqRj4yeF8EzF3oAom759oVpvrvl97v3DGVkUjIWU=;
        b=mSWjjf4w9DLqu2X9UUbQWoYtzoq0XDtzmASo18CdYJSBXX5LQ8gWAPXZQILMoTw3Xu
         pOrZ224LLRRL1H7fOY25HJuztbd10aGQAXTPd+oPuCHmDuKmaM7s9H+9iiN5RnzikRoL
         h+PVCV48TRa+EinJDZzGBToL9DCnb5DqPSF86dTdjpu/sfTVvDVF+/HGL7nW7bLj3lIa
         rEITgQuGEnR1TSN+HZJyzmObYUutrylWtoNoT0oWzZ6jVWoPIzJRqUmHuu0nTY1umVf2
         62JTgE333fSG/YJsfusSi4tH4F/Qrc7MOXpCBpTrZkmFM/OQW0ED8y4oasdKy9+juijM
         MWoA==
X-Forwarded-Encrypted: i=1; AFNElJ/tzws/vxd7volMAn7fA81dJyLkl2dtudSYcPyGJCBJirncqlZYGpfo1esrKKYVZTZCk6AfhGRCqTlkqJhO@vger.kernel.org
X-Gm-Message-State: AOJu0YxMMg4KLMfmjqCTvYwsW5qY+MJDwHyfH6dQcOZxxMXsFarvGd6Z
	7Qln2okNDQBBqZvaZAF1Gl4Uocp8aJVjuQ/3j0nask0LHbNUMkiohh4tpcocDXAcF1P9PZpd3cs
	MUTSRQTcEhoBP34GG/qqpZlNB/mOIQO5maEneMiZQsid1qtkZUt+I3VJfZnAS/HH45I6g
X-Gm-Gg: Acq92OEzYIhS1ndWvKuyXTLRZEhnYjH+8uW4Gr9+F19a7SZFJT6YJ3Uixqw/8KbGilt
	BFil2GFMIZcJjZ7giWuPOfSyyaafY4SrEBN7Twgpu/qmdWyB3SqQ9DQ82TEHkydlwOHe8jZwr1j
	doVb8PimT7CxEYXY6Q1WYtPxB5DJx2ytCUm+NBH0F2YbFsmj7lJ5U3JHtvtLZobAaozf2pHJeK0
	j24vazA9IGodCNG0NFzKnPSp69JTARQigIa2l0qpqrudKNngPL6zPFo19ZhZzgZdbx5NnXxkbDP
	expm8JDLd9gyQw48pUBU1MJDAFLtwhE9o05fHz7aQT3bSd4Syp9m7COmByBq55dSPjfOQv/2nkZ
	VD2LObWNtpgncB6S8U8hHDjzXgNMo0NTcEPvIAWpwbvITz0Q+/4+xYmvwn4eCMnVQKWHc/puRZV
	gJ/QShxlQKLTb4JG5TPEZ/R3jVWWDn+GmakJpf8egUcBsQxg==
X-Received: by 2002:a05:622a:17c7:b0:50f:f030:920d with SMTP id d75a77b69052e-5179881c7d5mr99141841cf.30.1780828209404;
        Sun, 07 Jun 2026 03:30:09 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50f:f030:920d with SMTP id d75a77b69052e-5179881c7d5mr99141361cf.30.1780828208967;
        Sun, 07 Jun 2026 03:30:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac092dfcsm37044801fa.16.2026.06.07.03.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 03:30:06 -0700 (PDT)
Date: Sun, 7 Jun 2026 13:30:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Brian Masney <bmasney@redhat.com>, Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwMiBTYWx0ZWRfXxDHVxlsOXjs1
 Ageih94ngBR0ro0p2B3+pqQNVRxS0K5PX4ELd1k0cG8u02/s2BgIu6pqLG3UIukOF6KuTmuMdR7
 gT8hZTVoTf3nyKYkg/JA+/fojMJE6QsjtQvFgcDP66zKO76JLaU+d3U+9QWeVf0k1CJOyG+vq0W
 3GEE13dOJ8f5OyR1S2vSLipjWdY5+mnzZrJ4xHpI2OPFU3GuCyD8cYaIt2YkhajpqIet5w+rYYJ
 Xs6z7EHy6M/iG7WUmL2N198wD2LeZQf7LxLrdZ3U7QXXhRW6jy0drL/jxrYjosHipNf48e78X+s
 i3UbxKFRYh1vfA5vZOpsG+cPJGjxWptWV4QbqHy+tT3GYsAFCedl51g7ialkGISwHsTnXNpAvyL
 9DM1GB+b1AWounf64iEdUXBZuhvWBQwUvBCAnY0bhj40RhyWqiHEDGCQ/rqUHtE7v5eceBlQIU2
 mlvO9YqOnl/4O7NHbeg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a254832 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=i8ejakjM7bfyIBltOq0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: a5nRUrNZHr48sc1lDgy5FfEcXQHGlKOE
X-Proofpoint-ORIG-GUID: a5nRUrNZHr48sc1lDgy5FfEcXQHGlKOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111559-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,o257r3t6p5aa:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C284F64FBEC

On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
> 
> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> > On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> > > Several qcom clk providers currently have a sync_state helper set to
> > > icc_sync_state(). With an upcoming change to the clk framework, if
> > > sync_state is not defined for the device, then the clk framework sets it
> > > to clk_sync_state().
> > > [..]
> > > @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> > >   }
> > >   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> > > +void qcom_cc_sync_state(struct device *dev)
> > > +{
> > > +	icc_sync_state(dev);
> > Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> > internals. You might need to set drvdata to desc.
> 
> Hmm…
> 
> Currently icc_sync_state does not seem to use the dev argument at all.
> 
> How would something get messed up, now or whenever icc_sync_state changes?
> o.0

Yes :-(

-- 
With best wishes
Dmitry

