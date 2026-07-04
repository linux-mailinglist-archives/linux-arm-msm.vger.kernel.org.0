Return-Path: <linux-arm-msm+bounces-116445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lDGGNXRSSGoBpAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:23:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCD706432
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:23:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dNBGEHVN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=icNq5PrJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116445-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116445-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85A1F303308B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC0D1F3BA4;
	Sat,  4 Jul 2026 00:21:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE3A12E1DC
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:21:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124475; cv=none; b=NzeJPGsc+ufvX4xsj5viUyeuXKxe4/ZPrYGA4fQ0+ssuUnN2O6f/ch6AiSLKZVBnRk0fXltaJdv48CLjl2Uz2YT8DJI77nYXsUC04kaA9/kabviHPHxRwdF+5Fd4+IpW37Qtv0lkHvRhzRHWH5kTw+ps+81k4TQTe0+f2l6/ciQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124475; c=relaxed/simple;
	bh=OkBZtEQrFq9mYM8uJFu4I9I3b9DddqlnSjpwJ6+aags=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHwTrqlTAM5gZl+fwFzqFE2jb8ceavtyf/aZ/ZDNmfA7viDoxdQqzdEFPD5f/z73iACjtuYYM2T4oooD079JPdnvfcS0TyhfhXBzD9hEi/bmu+ezOOkmXugT2dH+nD3GNOsjft5WMQu+IermSHBnaQROvNgjcR1ANul6A1p6M3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNBGEHVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icNq5PrJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZ3N1029416
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KecK7PxPE3CXCxkRqv9TgBWx
	1h6mEwwz36ausN+cJqA=; b=dNBGEHVNuU4eLELy7Mt+tty3ancPewilp4rMayOQ
	HTbrzr7RhHf4S2gUZED0QI0ota+O3JfPtBkOsiPmfUJ4uL1dpImzDEnjYgwuLYFC
	rcFxIYeFlFKapoHFA7lKqpOWjYJuJjstxOo0mEsRzFXq5evIXRZOop54FaKbYZ/0
	V8xIXnig+jfV9qUa6EhVmy/qjGRw98oJeabG+oXzqwS6NXeTvsYSv7nOFhUcflJe
	XsW3w8P3Ch389+PwvfIkpQswFoUTvgmXt+kIUI9iWC1OBEKWKQ4xxQbWxL5809cL
	z1hHkkxLMyH2aO2sxerKpMX33dYm5+PK2l/Sa7FKMvI6BA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcm29j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:21:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55f0613cso77673085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124471; x=1783729271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KecK7PxPE3CXCxkRqv9TgBWx1h6mEwwz36ausN+cJqA=;
        b=icNq5PrJWo8wd3LgMgGev76PoQz8UYxLvNcWVps6qmPc/XgsHEQzRq8C/jNwSE3McS
         IFsZTb9iyw5BoA4QDRsCFAY21vNdE1ilROuTqqks7iiz2/P3YrWe5z9RcjLn0CAm78Uh
         qx8ocKxw5HZaMl3d8UKa/rTVzIagqM54XUmcvsgM/0UsOV8WRmVfxpaEX/7UZX/LfiHM
         1JtGB2yIaMUvArZ5R5F6RFTmFeNePtPprhM7Lmfxut+776jsXyU3H6Uen9DQmdXE6wj+
         C7ufv73kmQv9Bt88Y5SZDMruEj6aPAgYukCZt5/IUAy4oGKapZI8bxnxFUsPl65Q6wQK
         hq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124471; x=1783729271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KecK7PxPE3CXCxkRqv9TgBWx1h6mEwwz36ausN+cJqA=;
        b=MfqiZdN2dCYCTGKHtFwBYyuzp0lagb3uHoKzmI71ObaiouNgFgisAbPzS4q58LpvR4
         JG/5nKvUrcqERzam9q0kNdGJ4wdbKiimc3tZutU/sQoOrVef0heWLMSuzoUnIX3RPlp0
         JXeny0703mpSdyp1nXnXn+1u02cHTYscpL5MX/hLgAdNKsdUobBCzpFYxdo579KZgaSY
         U/5RtRAtT2mYsy6tV7AWQHqQQDyGj3BPx9VSnN72peTKAyYF2Dt91xcWAMdXyfQJ7qrC
         Xb7cC+v8HDUf/hCADR4xIzwVVSsRg7l2PRw/Dnouw6B1m7fjCw2I2dJAXSCRcSVDyLMD
         et9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9WJG5RmNO7UvfmkGqfpYq9zU9APZCY1tfuDhaJFMatz6FZVVyVakistUT+UzDxdiFxDci8TDcgqiRgmoUn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2jjuNx+VzbexmuzJIx5Ol3zT5/uf0nLXkBJClKMyYnaxPOEZ4
	pyQN3GOszwdmy76Hw+RlWr8VwclSKqHok0LtTjQnD4pRBtmyYQ6Rtq7QdwW9zBM/2U/nQzWGaur
	Wvka7XUu5I+tXA/GXn5YHXPiBQADHh/IfCtRF5cESxknIUFx4byLOg1jAbglTyK6UPx9L
X-Gm-Gg: AfdE7cmNB0RYO07AlQF60TzepvpH5Wq7qBvQYdz5GPpW/X+mKy5IY+kMP/OoUBdXGV+
	ZCwSnTwLDNZ63mWcik0fLMeeXqp6lN5YWl0hAowbqEZVVuCKsuXytuGPow0Hm+iJcerDOtKkzlL
	ftAZUUXI1i3zCFf5uDw5xM69TB8LzhuZOv2jmqBTQaNfLmgj0ppq0n70hoXr3FE6sJWA2fhE6eh
	ub3oKT2Ijo8X5+VTidRICH64jQvQZi4ybvkmNiesnpcSbhBtLhCPiLxFqFKmsW09FIelC29g40c
	/6tabx80IV09qnoxotRli0o8vvZbfIVlFWN+TrDsKLm3JJynPY6QmFofAZ3Z4Ugxf5i6PXsjLsY
	ZF0uqey3GaZ1NauEmtDh4Q05HuCIHRnbl2+1ZSKXXsHmd2NWHaqeyRZacJjTX6/++DnlAf+aceF
	H43kRQ77+qOFpQk/I7LxzO1282
X-Received: by 2002:a05:620a:2620:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92e9a3467f8mr236923485a.13.1783124470706;
        Fri, 03 Jul 2026 17:21:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2620:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92e9a3467f8mr236920685a.13.1783124470249;
        Fri, 03 Jul 2026 17:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb4a6sm848643e87.38.2026.07.03.17.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:21:07 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:21:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 14/19] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
Message-ID: <ko4cwdgbjoqo73vljlplsfeohe77qkxp4zj4xthtsefddlzi3v@rp35hvxwz3t6>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-GUID: rnWqvKsUYKmv_VUGcx7fpiUnXrFlN6NI
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a4851f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=GABpISGgAy3S5f3vv6IA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: rnWqvKsUYKmv_VUGcx7fpiUnXrFlN6NI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX7HnpsuqSKT7Q
 2qLqiurBfUzNuEFyb8FXsAemavdQUkD5UirWr2BGcS8j3gPwt9E1XYbyJwHbTYhIajrpOEAJGM9
 B+yDy4uzt//eY1AmZZZAuDILgLmuj/BgGa4EtYh0KrF15KkHLBsv3faAz3takbUSAZN32nRRAnA
 cPf4T5hJ36Yr+Pxncp4gS/ZtWn+mkMXYW4HmpTiXNRasIput/QDD0n6pG7aSZk3hgnM68hmJTqX
 oCz+75qj34/do31MKIOdp2YOosEUkjOLZPBIvAjd5QsnZXpz/xWaZf31cpRxFSL7sCb3b1C61VS
 V0aie7tRoVRx1GNrG+7ZtK05UISM5ygFHxOCaGmc+cWgljXUZiHr+nnyFr12Q0bdejRotaN/VDQ
 fy1umAnU84QYiw9uDs7Z23XHyE3Ab2h8snDSzw0socVhC+UcuCHbbSd/KDniqR2REuCK2Ceodvt
 IVLbsu4P+pS7sYWMYxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX17PuStSebV9W
 MPPFNyvjSTT7JK+ofifGQi9IcfASgCFxF/lf4+5NEBbYza41QwjGnptLOHCfrp90ghGHTVX8twp
 Db0hoAgjwYEcNDSZeF74pfY1scW6M80=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116445-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33FCD706432

On Fri, Jul 03, 2026 at 12:01:36AM +0530, Imran Shaik wrote:
> Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
> similar to other critical clocks, since marking it as CLK_IS_CRITICAL
> causes the clock framework to invoke clk_pm_runtime_get() during prepare,
> which prevents the associated power domains from collapsing.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

