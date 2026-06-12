Return-Path: <linux-arm-msm+bounces-112844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GyAMDPWhK2psAwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:06:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E8676DC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:06:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i7ltrF5a;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QHba5NFK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112844-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112844-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 643913001F9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15B33BD65A;
	Fri, 12 Jun 2026 06:06:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3623BBFD1
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:06:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781244399; cv=none; b=T8KtT8WAop7DVm3Gq4uIPfJosE61Ats/nAA82D4dnqYf4EXl2cyanaJ2VmFZpss93p2Olzi5iKQUzh8v7GEQpZ7/xc6IgD30DVJYGY6TTs9cLnnJBI4chBdxM+yq/mWM6mg6ltqHzi0pUv/1EDPXNU7xAkhx1q5B7lkbnfsSTUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781244399; c=relaxed/simple;
	bh=652p8nCF4Fqq5uW2hcUJZKspa2ScTlPVJUiJWXkkqGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCKtW6EJ4Kqjmo3UzB+CaiXHNxGTjUwOouGkO56fdtwSD6NE6qllQ8WGY+hnWapU+W/+ikdcKeSYt5iICaxg5P8kd6kthoXRYgW/Qcjb7ItyCg0aj5lD6q54ov6022ToXk1xGLwhn+vkDaIYM5bARxA/gQHmBwkvThYTjlIjtf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7ltrF5a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHba5NFK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39ScT2502681
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=22MR1tfVVoBCAuE+JGL1y0Rb
	6NIGN0fHw9GOcjIvqzY=; b=i7ltrF5aMWhNL8/n1mHfKAT6ycnju4cOiIx1M8tb
	O3ivCVco3WkWKpXx3cCy7SGNw0S4tiMv9ShUph5osMVWChuutumRAhdB5Wbu3qDQ
	JqnEclw00rw18g5VGPBoXT/BhIax9UDdizn0CghhsDbsJjAFAFLkle8ozIUyxby+
	5LPht84s3io6S6eCvpEbMbxLpXnCGSe3CIBVzi239FO2VU8kNLnYRUIrN2IOR7wR
	4XqJff8OH6hfoqUqtkgvvGD/iMaWbCdaoT7nqU4oiU90P9SjScWBt9fnDOSU3pfX
	KhlUzO3FmT1YjONZWVitaErCz3qn4afNbs7Wnzewx3wyRg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd2ey1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:06:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so675400241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781244390; x=1781849190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=22MR1tfVVoBCAuE+JGL1y0Rb6NIGN0fHw9GOcjIvqzY=;
        b=QHba5NFK/C+pO/C85teCPm/jCDD8041TmREGTcdrzu0MVGV8ryDHfTjY+aRpH12ReK
         yMVJptb5dX48JVpIJ9DKDACp6oop1msRlNhWn1vg8bl6Fnm1QJ1E9EJJkKP4zUyRwDD8
         0PWmrwJI9QXoE/TY28/ilkpkTB4+SVFoyhMZ3UF1SJyFw6HL63Y4Z13amnGANHBCynYJ
         FwZ50LDe5L8iXlm+hErlGEzjfn3hWV0KQ5M2tOBDnIcRpDiC2D0cWUm+/0KVOPnJNKXJ
         CAHGlS3QneXojcpRaEopG7ok/eyR+M+QqVR19IAWfixx/ZfzIyfNmnBrlW7BvS60nic2
         jj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781244390; x=1781849190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22MR1tfVVoBCAuE+JGL1y0Rb6NIGN0fHw9GOcjIvqzY=;
        b=WgPRiSp1BEseS1zyDIsQdG4pE7TmEb/9YrGWIrhtnBpiKGDUCrKUAM2jDLmYLBMxoT
         DiXfd8udjwcu8/L4zka5dIR6ZGvKiJKHzIIXsXy2csi02pN1b9Yr/nKxXtEdiYLG6gNw
         cFWYQubkUvgYyDOCfMDp4qr/Fb/CsHekNBUGS5eLO4FDS0o9Vo1fLxeSgb1b/dvqr+uZ
         BTW2jESZrNgBf38vB7nL7W3H/PZxOpeMeXbQDEOsgUzQIghhG7beZtUXVBUHIkhYVvgI
         s6gdCUcCCspB7CFWfRziNfMgGjiBWS84A3/stExwpBqm7DndpMV8WQO76mpqiwhA/ofe
         LfMA==
X-Forwarded-Encrypted: i=1; AFNElJ9nYRoIXqLgQMKV4ars0jC3xLSeyH8x2MbzZrHbDPe/8rlC0DsAAdI74pzR8nKqC1iGEiFYjxfydDr2KJsr@vger.kernel.org
X-Gm-Message-State: AOJu0YydhB4XrpRG4S4gOVdLOHMuBqn3XOYDTMqAVj4lfQcDHEOZ+hau
	RDXDB7KT99DHwF8PAYpUgg+SvykBHyNyseHQX2Pd/BdRM2p7t+P3BmA2tfK4NGHln0OagU8Gp0q
	RW8FGUPJY6RkflfFtYjnbvi5WwhlF2gCdYj+4A8ZZroLvlHQS57v3TeQRWCupgV7/1/qJ
X-Gm-Gg: Acq92OHuS0VvabWU0MgRIG/CwBp63b0jbnYzkEeioVKAi2w3Uq3Dh3j4w+P06f7Xz2v
	nmBIYX/QO3YKVHG9igz+KDsYXaB4aP6U7QyIiLTWu6eNN5+zJ8Sg87LHXsjntTXaw8F4LoOxjgl
	J6snhgiHMQo2xrfEUSy5ddKhNBjqg6lsN01QnXLDQhiFPW3wQKkvbdnrgl13dxJ6AeOek07na4a
	eheOFWtrbghzaft5EzFG01jvNOdgn9Dl8bzygPlLCvbIBNr5S+k690UYYXTEEFQp/4U++TM01LN
	DEL/r7YutwjC4yK1xLe+BU5GNrOCRj8Ara4bR0u+OUX78cJXAqyHvfisIGsrkkBtXHnxKZT1IsD
	WuDhK9D9teT6nZUkPpRlei8XOJUAFcUzvYjRp3XEHkyQ18NYCjlspLIfKzTH6DUBmE7bahUOlFK
	BUjgmH3U30xgyJeX5pr9w9QTc5itwiRUdvV4w=
X-Received: by 2002:a05:6102:26c5:b0:631:2624:e5ec with SMTP id ada2fe7eead31-71e88c3bebamr623755137.16.1781244390359;
        Thu, 11 Jun 2026 23:06:30 -0700 (PDT)
X-Received: by 2002:a05:6102:26c5:b0:631:2624:e5ec with SMTP id ada2fe7eead31-71e88c3bebamr623734137.16.1781244389778;
        Thu, 11 Jun 2026 23:06:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f547c3sm3685941fa.30.2026.06.11.23.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:06:28 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:06:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
Message-ID: <lv637wwosaruexyxiyafx5horratkrnywj7knjv3tlmmfgpmnk@a3hit2ll3p47>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
 <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
 <6a1fdadb-6a52-427c-b65d-70dbe80ccacc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a1fdadb-6a52-427c-b65d-70dbe80ccacc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Lvh3_W0eUn1ioknB25H-7iZRdv9D8Rnf
X-Proofpoint-GUID: Lvh3_W0eUn1ioknB25H-7iZRdv9D8Rnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1MyBTYWx0ZWRfX2IpinrXe51gp
 AGxOz1SMQfZs883pFLo6xYpmFpNspLUAyVtVRXsE9LwTBhmDHSmJv77+JqkL7BDUSfmCcdWZDn0
 WjqaREtyq7v9MUbPN0FrL5UvqPuuZDuFArfMnfPUUmV2a2JsHJnZyHKIxA1TqBgDo+nJbOQyXPU
 gB1Yw9xgihHWV64B5o8lTaSE/P0HVPLkx+EdAaE/RWXTwJjZQGkEqRpNlGyTvsRnEG2YLRW0uEp
 CzqsSxxQA6neVcdkVgT4AO1Y2a1WjNT4fwH+pZyb39TQLG3LyFfn5UVbTO40YOIB3pQU2plo7Xo
 zV7z9aVuhkiuYqI1lqRyMVzHrno0fHyFAKiGNot5lapGwFzABDGQmRhlIJmc2EqZ4ghqzC3UZmx
 Fg3rjzVJL8U51R3RCJZiqQGys4rvSrtX0Zp9mwW24m1U1e7bssm4OCM/Hbf7iiQ3/m6lfUd5aZ5
 V49+DtLOWNmKRLztNSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1MyBTYWx0ZWRfX9MgXzvZudFd2
 ob57LaAtoQsS77Iv1mmbPD/RTA7Wc3PefQq5IpZbdAeF4g3n0Lul9L65YnRYlVXRXx8GvFAaoOb
 9rj0GaEqhD7kzhHmJ/EJRtZjPsD0GQc=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2ba1e7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8MZ3zgF7xDDCLyIjzZkA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112844-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 389E8676DC8

On Thu, Jun 11, 2026 at 11:04:29AM +0200, Konrad Dybcio wrote:
> On 6/10/26 1:15 PM, Monish Chunara wrote:
> > From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> > 
> > Add support for SD card on Glymur SoC and enable the required pinctrl
> > configurations.
> > 
> > Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
> > Signed-off-by: Sachin <ssachin@qti.qualcomm.com>
> 
> Firstname Lastname?

It seems to be the full name.


-- 
With best wishes
Dmitry

