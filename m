Return-Path: <linux-arm-msm+bounces-97120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aSdQAVgtsmmzJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:04:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E6926C8EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC083303C284
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D84335F16A;
	Thu, 12 Mar 2026 03:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqwTe7No";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3w3KkA0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BEC1F7575
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284693; cv=none; b=k23hwMNMk0ffOdKV/VWBqBkGN/D1i2ckenMYQNvHefVxn5GIE62QKt5KJzriJCpfUabBvKnFX8Ie2G2foEjY+WxA0p8hFTGks6TB974azrVjhq8fbRrd/gFUeDmWbZRMhwZocaQ9Okmsp4pHltjvxVzoT7eG12pRUZsaOhlUBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284693; c=relaxed/simple;
	bh=i4JC0mS157YQqaa5OWBFA3oZU+lBY2cHuyaFa6pRMoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSFA1s859NWEjlrwr9IKh42EUNjUqKkDAJetVk29DeHlFEOmc/fmPd4D+aW+czcmnu8Ve/ie8r8Hu3bG++X9pmUY05kXaGKs6lPffzwHqnXEkdZ3g3PhuVICl2V2fbHX7zGWjnbwvNUI8lvTgCnuiCmyIpXpbveOtcuK9dGvFXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqwTe7No; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3w3KkA0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMoT93136575
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UbNMB3xidNUbC1rgxT40znJc
	HEbsjyTIhGg26A6Ciss=; b=AqwTe7NodPR1QVttRMof7/xFPAoDVHMLnoJmp7qC
	DiTw40AbWvknyqgEcBEn2ctsZo/F58BtK64lGiKGRAWjqFyvkUwvUoPbHQ8sq1Iy
	AqEyEz7s6hYVmTcfA0k6R8cEFlQgB78vRyYrzbmSX6SVY5IeB8R47URwrO/C9gPk
	DzJTnW8Q7fJ0XA6K9OWCwBO4g0vgNStS54/f/Bw10XAp8RZHFgKQzwgUS4+6yh6o
	bryEkJuLISEIIDqGYHk82Xuwbcl7ymHD9fm2oDXVySEvrg02FkmXdLcA7bssiEDS
	QvMt3q41N1He3TwXk9TFilXdLeQWUWKLJ8/4V906YlI7TQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w8nxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:04:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81be6f05so338395285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773284690; x=1773889490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UbNMB3xidNUbC1rgxT40znJcHEbsjyTIhGg26A6Ciss=;
        b=P3w3KkA0rbjjE++GWHKlXXNGlsXwQWNa0tP9VzphvjMAlg4BhG60VuYHgEJ5QHbVuJ
         QxyLWgXgucjcdps4JqkRDOQ6giTVFzvvec6BW7qzY2L4xVjfDAd6TE2g6iL36V70WQBQ
         F+qB3C3HLnWUS+gD0b3HG5JRNmtzoqiVZwT+3Vb/qiBMvSfUaAVQvEIQj5gDqd0W8zRI
         pd874SD89Hbn4YatrY98fLwKLpp7E6g26ebMKxJGFg/3KrV96b1LKbqoR7mYTLa/Ujat
         uz+DidEHgs+ucnfEoDbGdTVCbbWDwI6t8bkPv3xqukOWjbwdNk8cFNAnXmNOfC5PJU2w
         mAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773284690; x=1773889490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbNMB3xidNUbC1rgxT40znJcHEbsjyTIhGg26A6Ciss=;
        b=jhRwe5lZB7FDK4/ywgBpcHa45t3VJmxEndlmFXgl0kSOK0vaV27ldrFw4twtxxzg2/
         CNvploWdgxnOzrLAO1TZgMqY+CGvWg8XYUYD6ig8KiB1FpRjbBoAZZsV/P23+8m0wCbx
         gqtdsTEFq/mOQCFV3dDFfRMzwJMgx4JYloWo7RFvpQEGkPvX9uTeZdzvrupSUqr5dl4W
         6jb7479s5hO8keeaHb0iRzWV4KaChzjN3OmbwYPhnnQnxqSGXRXFmQpMyz7ZhnluLRCd
         mSIOCKciMY/m6OcWPnXPeCSkdBUvQxKZ1CF2DxPPNQHLk07zKKM/XrqrP12Tp7oR0aRp
         l3bg==
X-Forwarded-Encrypted: i=1; AJvYcCVAtXOlJUKTLVRvfwX+OJzNaYcTdYBc/38sP6fKL8Uk7CUfn9SSd3KKZSbaWkwtNvBNoQcDyNFgg/m/mqR0@vger.kernel.org
X-Gm-Message-State: AOJu0YzDE4zfaZ4KjCSlG3ZVQD5jpVH5r656GBVimbAIhnHIGlWeNtvD
	MZcfb1B5Pj7NMOH2hOlRONLqs0EnNFBYxcJRIkBNRlV/MMAtmdBXs+KKLtX4XbmKPNeqqn4IuR5
	IThUHkHLrHunOjFtFCixiKnxueZ5y+ULddBxtSp07I4G1lDvOPu1T+vSB/QKJaJ3BE1Yb
X-Gm-Gg: ATEYQzzLm331IAYSSlsfUeEJaynLs1lkcvlBA2c9p8J7u5w45/csRmpQcvOdK7sDufR
	BWYHv5YZXIuiCEUeHd0y8nm030J+dfvtj/Zco+eRVIbf2vE6gGp7KrRuhkQefxCp1mHrpc4E7N7
	BPMjNO67oxcXwFHNJ+Pwka8Gx+J6FJt+RBTh7dhGljnebnqipKFNchyeZZpHGftCAFS8JdAAqf7
	CraD/o0WRpQ+lGjz5fs7/ojzzFy0gB19pb2DUvKdChNZuZWOOfoYVwVcmE68iD/pKZlBcDxuxMj
	8Ct49zh/6NGIlDEnOxzkIzUr1RoOZA21Z9+kbaN2coC3uFCzdDBk+f/185AbGcdf6p6yv902mAQ
	9nDG1ZeEoYmhX7EEqqaheX12Nm977hzG4VF/Z23n5znXLleN0JSYlTlDFLz/GrS++b/CPYpiwL3
	1695Tk0iU8MZDbzf6wyEvYHyMeOTS2fjwscfA=
X-Received: by 2002:a05:620a:1a23:b0:8cb:4c23:3de2 with SMTP id af79cd13be357-8cda1ae225emr633770485a.76.1773284690360;
        Wed, 11 Mar 2026 20:04:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a23:b0:8cb:4c23:3de2 with SMTP id af79cd13be357-8cda1ae225emr633768585a.76.1773284689919;
        Wed, 11 Mar 2026 20:04:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366682sm677501e87.72.2026.03.11.20.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:04:47 -0700 (PDT)
Date: Thu, 12 Mar 2026 05:04:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
Message-ID: <igjdwtp7ox244c4iqh6t3ilqvxrh6ann23m2lo5m7daxncyffa@e6a34rl74kln>
References: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
 <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
 <wy46mrybpvnicmv2aljkyh6lu2gnzz4axl66r2efmfy6pr55b2@phsj7pghzd7r>
 <7aff8a49-ac47-4d93-8028-2710ba4eb2d7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aff8a49-ac47-4d93-8028-2710ba4eb2d7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yRZUGhx4XvJAXDPeKpNBSE2JdVwtUU-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMSBTYWx0ZWRfX595yA9gO8mNz
 w0AeQyyWqyGnna2Rkg8vDU0xQbZ6sX8u0M8g2+dHsoImGTdJ5z6Jb0FWibSGYS4EbFi3ukiBOh1
 uMIEDSslfYl7eBSZwWib+7TlPLaURmgnulNU56EKr7WULvXUGjcTDwwUTMHmN4vSe9zf+nTcOxZ
 kdSpzQ298eKqhvZWQCGBMuwAqTBdtleIOxFcqZk2vV7YUlLWAa0o656tCp9SRiNqEHXvPvuBSc1
 cpJhyDJdekUz35p/a50XkMjda8fzYnW8mb7mnyDePN7+y51YYv4ahjIw/AgqN2zw11EIjbV2eO3
 dq55XZblD9CbBii/TY9Vm35KyeuDNBtaLrmCU9anDdFln9lRV4Ey3B3qvMSbq1vqIND2FSJWN9s
 z2mv9WvlptfMo7TXULGDPKnX1rIfV2ZvmVEEmGFGvzgN8Lwq3PH9IrEggYXu/+NB2MiQFSKtKZ7
 +7vW1qS4Uza7MYY/9XQ==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b22d53 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2hhhMYGc9Wu5Qa5RKXcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yRZUGhx4XvJAXDPeKpNBSE2JdVwtUU-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120021
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
	TAGGED_FROM(0.00)[bounces-97120-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57E6926C8EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:06:08PM +0800, Hangtian Zhu wrote:
> 
> 
> On 3/11/2026 12:34, Dmitry Baryshkov wrote:
> > On Wed, Mar 11, 2026 at 11:11:45AM +0800, Hangtian Zhu wrote:
> >> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
> >>
> >> Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial
> > 
> > You can't disable these devices on the mezzanine, they are not a part of
> > it.
> > 
> >> mezzanine platform, pcie0 lines are moved from WCN6750 to QPS615 pcie
> > 
> > PCIe0. How re they moved? What triggers the move?
> Please refer to: https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com/
> On RB3 Gen2 industrial mezzanine, WCN6750 is not connected, instead TC9563 PCIe bridge is connected to PCIe0.

THis doesn't answer the question, what triggers the move? Is it done
automatically? Is there a pin that is sourced by the carrier board?
Is there something else?

> 
> > 
> >> bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
> >> platform.
> >>
> >> Depends-on: https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/
> > 
> > NAK. Don't invent non-standard tags.
> > 
> >>
> >> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
> >> ---
> >>  .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> > 
> 

-- 
With best wishes
Dmitry

