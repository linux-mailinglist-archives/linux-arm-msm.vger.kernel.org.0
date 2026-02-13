Return-Path: <linux-arm-msm+bounces-92818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEoFAfJjj2n6QgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:48:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBE4138BD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97680304CCE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CCB329C73;
	Fri, 13 Feb 2026 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJruyAwI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fle45XP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2340256C6D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771004909; cv=none; b=tLsaeAOLay9igdNk+QshPxZBKjGZbfB53lNeCDGWwLwg9x8dzStpJNWPUBH8mlEvr5brckdaWpN2pItQs9FBvu1M1QrpBCjcVheLE9a5CQGXMLwPK7hgXQagLxZULtJVGIx9dHxkmtUPJGjJ1JHtH7z50NFMvp327ed1JYW8fSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771004909; c=relaxed/simple;
	bh=6wf6sSt/9JnzOize+YXAMw2jwR332gWu/KhY6ygh6JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGN8+a4JDF9AgM9PCpCKbv9PQCeuFnpePq7uJsNdpQIateLmV7nVsdMRD8y8KgKJO+dNenv6hViJattTl1IQAzQ/k9quE6NLZ6mcpcACJWunfx+tu+MNxX0clKML4ZZR7OoURXBi6rOOzum4+JHG70VPPXc+jqvMRWiFfShMflU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJruyAwI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fle45XP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DEfcLp2627965
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ci4/1s4SRwzvVN8iVjVKNvya
	xkNCsYgq6vzc61g86zw=; b=VJruyAwI39bB3rSxsI94dPs1lahghbuXBAcdBZBi
	VIzAmDDY347FkbOUnTFrlxW8CEOssOdltuoDLXteIKAjZsrcywAR5/JhhW6szvhf
	tsOT8QtS9HvLX9dkRxV6zQUE7A1IOeRZsROCq1POkd9ixY/E4Q0Iw1z4v69FEoFB
	toTtT3V+ds03X8Onxd/4k2wq4vYzTr49kUxeKeaZY9acjARC+4WW2l3FurVALzQG
	MihvtdccsDdVW8D6GxxA5QjtfnCQboJchyi55rmAkj1WIv2hb8VX5WQIfMFGLW4a
	aKG901K4MdXlpjKHW11qFlB0xZIrEUMsUT6C1mmpISY8mQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ygut8dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:48:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3ad1b81aso602841185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771004906; x=1771609706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci4/1s4SRwzvVN8iVjVKNvyaxkNCsYgq6vzc61g86zw=;
        b=fle45XP+I9hb6vqsW0FKXT2SiwB/ZuTcLt72CfatTwYxweOanQDqIfBXU1ZMFiCHHy
         85k+ebyxgG3JGj4cPUZBIfJSHIHi1KWwiSMpSQwOxH3FBUqJxQW+OqavtxdM6qwrSut3
         TgyYEdZDS07UP04xW3+rVY77ZjQqoL21xqn2zQYdKF1kP8n9sr+8ra/lr78oYsPWpgv1
         kkMixBVFO41lNUvsIjadH1WYFL9Yn5IxZ31tysgR2ZVsWrTn8O6Vsg1ICEvu7UU+rIFM
         FQ10q+u9FUVKeXFJcTCYW/Io1Dfhr1QLIYOvLgVt38o8BXTlzAHKUGYAuBsGx8SL9GpJ
         bqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771004906; x=1771609706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ci4/1s4SRwzvVN8iVjVKNvyaxkNCsYgq6vzc61g86zw=;
        b=X8zDUvykugCV9x8MsfpVs3DSFGO8EVTNb5eRG+pXFi/QJF1+7dz17Wo1N/Lc+HHsBR
         H7uIzlLcJklI1NCWasFxxs8aKN5bk031GgEljOUrf8iEYmi5/gq++Qt1ZbXcZbc01Th6
         RtqJmoFLgY91FtyNVP9R5SWr8Cl2j5C1FAxprc8UJBl+1VLYbvkjm30mhRXAt5/atXLV
         SjRvyzZjdiHX7eyfMdviveq36BQ/LNcsbjA9qS69RTwz5DHsOV9tMBZQq9lnabhx8nc5
         m8sxA3Q9AAByJ+kDvFUzga3AGQBAaiysYHEhemqIul7lOHABSvxIvDWJVQiNZXc2vB+F
         nYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp6yU5ZtHio6TWxd2lcRCG+UaNMmRMMncWkJ+Q8sel9Wig+HI620qEetUuPdK05zwFmV1tnSzwv0wOK9+P@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0S9sfIr8nwl1HFJEQk9MhveskezKZbYT5ARVGQL59EhSbRJUM
	QFZn7eaHciPHnXwEaYwNuTPJbcFxCuJGSYMgM6pouXrQCBnKtIjjcbSnTFUJQl1Itfh0xALMb9C
	gOT+Y0RuJ4K8mZZWkuFDrqvTB2o91ZEUWUPp4fPN3DHAJ44UBwdsgQ+/KH848iCC/ywmMswth6K
	je
X-Gm-Gg: AZuq6aK6xdsaC/HRGZgkRrTvJyQxtEJTYpVf8CzzETTVL7h6LSMGl+GrJHyPPa6eALX
	EYWkbWm9/THWTOu+0f44E/pnWQKgzZJjRKMyHF+F/kuxwy3AHkHgtmeyHL7cQ8nM0G8m7+pglGS
	z5LG6aztyJTJPxjwLB/cIg05MtgxcbbFFtZO3cmSWvAljXL4Z0iAjjkHLzvoAUujnfBjQBt36ts
	/g+aBDMsyhQn5ZK8NrRqT8F+hZlxJXpAWR1s/mdWba6XiezlKDOLx0qfITd9jU+BxbhGQGZrHax
	uKGexG/zCy7/5bjy6rq+Erz/q5TAoRTeMa42sI8WZD8adapmxEMBeVMvjcX2fupuv1uIHk/c+mf
	faPsLM+N1IIUqD/BuwNAdbqZaC7DdmUeGZx/9/Ks70H1+DWSkxP9l6I4zofhtwmzSL2wq4K1Cy1
	n1onl1Ni7Y4g6xMj64WzyJEjo2CByZ0bwVdrk=
X-Received: by 2002:a05:620a:1a9e:b0:8ca:d5cb:683e with SMTP id af79cd13be357-8cb4c025d13mr42184785a.75.1771004906092;
        Fri, 13 Feb 2026 09:48:26 -0800 (PST)
X-Received: by 2002:a05:620a:1a9e:b0:8ca:d5cb:683e with SMTP id af79cd13be357-8cb4c025d13mr42182185a.75.1771004905555;
        Fri, 13 Feb 2026 09:48:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a50c2sm1698630e87.45.2026.02.13.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:48:24 -0800 (PST)
Date: Fri, 13 Feb 2026 19:48:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Message-ID: <hi2znbyo5tunwi6du5ifxjci4xmjvfz5wrbikqs7yagpt2rhki@il4g5olkhkvw>
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
 <20260208-refgen-v1-2-87ca84fd78b3@oss.qualcomm.com>
 <jvitdcolh4naqjdahaajlzdctcmp3sy5odiheeqacps6pcbg5t@zx3jliileazg>
 <aY1KCLDDoQtLJ4F1@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY1KCLDDoQtLJ4F1@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-GUID: ledzIg6e6GXDSh21AxTbF1t-4WeiRyjO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzNyBTYWx0ZWRfX+ormW05Nes68
 1L/C5TNuNnEND+SwRx4Z1f3L4buPj5p+cpWeEq7xGkdDQFL2U1A0fx4OGY9DZdCnWC6moCSStSu
 bSqn8BwWNL5w+27Qtu1I0W6AhVTfZj6LHvXWlZ1oqq9mTXDLJw9ekSEUI2I/a2oBweWmefJipqY
 2Pu8dCEXOjd6e8Erveyzn9nx9acojGOdRELC7wSVGqGBOZy5huI7vt5xFFGBfXtHZoQsBA3RbKM
 FHA5me9B5oXy8bkdw/9JbBnsOkv81JcyJGjCfag7n6jRGFq1JgTKqBXYFN/aVvDTuMRjXM1RmUw
 mNSuk5cAFbPUSYy/hNUzm4mGYbV5rCNd3lp1qp3ppOfR4PtGkRITKfl8ueKeIpTUJZRTXtMb5Bv
 mdbCK4syJWcW2+OZzZOylP3zQLPW3SqWmotVjvUOfGPDJsAp+JQig755apgkm9pMPPAzAKcOLn1
 cq6NdrStlTcwOIyWsCw==
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=698f63eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=aF5tvdYZbIUOgtc3-ygA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ledzIg6e6GXDSh21AxTbF1t-4WeiRyjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92818-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CBE4138BD4
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 07:33:28PM -0800, Qiang Yu wrote:
> On Mon, Feb 09, 2026 at 03:15:24PM +0200, Dmitry Baryshkov wrote:
> > On Sun, Feb 08, 2026 at 08:49:40PM -0800, Qiang Yu wrote:
> > > The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
> > > two power supplies independent from the PHY's core and qref rails. Add
> > > support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
> > > glymur_qmp_phy_vreg_l list.
> > > 
> > > Update both Gen5x4 and Gen4x2 configurations to use the new supply list.
> > 
> > I'd ask for the DTSI patch too...
> >
> I will post dtsi patch after we get agreement on how to descibe refgen in
> dt-bindings.

Please include DT patches in future series, they help us understand your
changes.

> 
> - Qiang Yu
> > > 
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

