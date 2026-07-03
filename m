Return-Path: <linux-arm-msm+bounces-116430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TvPKGQVLSGqEogAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:51:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F13FC7062A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:51:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ISLzcZ3Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h9hDIR8H;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116430-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116430-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70DBD303F479
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 23:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D687B318EDA;
	Fri,  3 Jul 2026 23:51:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9553731F9A0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 23:51:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122690; cv=none; b=YgKAaDVTmdzaFvPwgEgkT+9Hhl8+GdUJP1kK9uboa+KicqytkmnkyCTyR0ITq29mpY3oNtAF4x+z/pGTQ9HAtxnjgNICc2OmKX/0jmrsB5RMm7/4bMYCELxqFYtc8qyyqvKDmuZb3mz5dxpx1UAnnMpE5yzHlFTE2F4HD0M2Moo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122690; c=relaxed/simple;
	bh=DXDmv3z9XWEDZtDR0RVBhsTnIBWRy2dBrp+wHjh3Dqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnq6gbp9nXtG10Zg7TlIqvGd2mFFlauJmHnupQOCtg5stwDV/v88GSltK8Q9C6cfi6A59zv0dpC5F9pigUOAG0ydBO8ysKoXH4acrGjhzUsPypeR2hRDlQdBPiee3n7yhPqfMVg44vI4R/V1YAEk6MVr6v0su7K0HEJmaxkx+PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISLzcZ3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9hDIR8H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQFxt891520
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 23:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lAbDu3LgCPMIYNcgxgciKMjI
	K90fDsLAl1e42QECwAo=; b=ISLzcZ3ZH5GEtDNtgsEq2EjH1yP/cxtU0eZDzyCV
	bRAdMmF9E0Nrs7PIqQ2kc2dAipsBWCgbFiPk21PgH5FEjtciCj7e2xby4Y8cjJ26
	h62nDeBwyN9fLoTmiNpEBGYEqQndcKxIvqDIZWAn/3H70s7C4issU9dbv/oEA9Qz
	GXqtpEGHhskJ42SZFAXaUnNUgaIgHWr8oOn9QKrRb6dXkpENW3ufntQGXFyIn2yZ
	yMNbWPwvpSFaRVZAnadHiFYGaFtxHlrPFYWNJjaZR07YJs+URY4kfxMGRxhs7Ny7
	7WVFL2VrcT8FxBWd5jHjMe1WdYfnTC/2B8zUlFABeXijnQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j03cr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 23:51:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e623b0e95so84649785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783122688; x=1783727488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lAbDu3LgCPMIYNcgxgciKMjIK90fDsLAl1e42QECwAo=;
        b=h9hDIR8Hz9QtiVbcWk0eKl78IgeknkMVE2JfKz0m30LJAqnzgEQpCir+fsocbIFOKE
         uan3lr74I2ZHlUWqFk0H2nP1Px+2sG46bV+lUQQere251TjdpyvhTsEnU/s9RLRX+4Vh
         WThtBwTqDfaS3E4OfLtd948t04Y13ML2urrZLsPZP/Om82Ob1V6g858tjGOO5BMYm5Ps
         K3O8OkmE6KqKERy3QbazPGFQJ1YIpyOr5flSmQ04iSd2tNjrfFtKhgcwKWhLkkTEdark
         DtqP1PLKlkBttdprMPRjwlHUPV80IV4P9dWIq3AlzQU3MjjVymY5UWbA7bdet+Up442g
         i/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783122688; x=1783727488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAbDu3LgCPMIYNcgxgciKMjIK90fDsLAl1e42QECwAo=;
        b=Q7kZs8799fWarqiRJ85thRT6vpSQKSnrlnqHypxi8RpJ7caZrzda2SvdKNtv7wWkKA
         VIpgyR+E+ET31In2Z0ZPd1qfyYKGVOkJ0q4WD98Q81U+XFVsnEEhWv85Say3PFXW/ncd
         rZSrXR57MVCpyFg2/9gOTt3pD8dnAhq9pobG7JE134njUpvPFZBfJkwMuYNfD77H2JuQ
         evV63U6GDADYSSVGZX1eVJoTmgipDR5EPWZjN7l1XThJof5B0+DkeuQHzfR0EE5gHalS
         t3j7M4WiTYlrLATd3PRqCq6wXULQjGf+8HE6SUMyeVd4lnjG67AOrJQTIZPk7ts+zoVk
         wJCA==
X-Forwarded-Encrypted: i=1; AFNElJ8GVlSx/L14GwPywhYYnUonbew9ir3efJvO0ijE2MHtcs+o68HLHxaQWBBUDwDt17ESDLYIGU40vW1VHFKF@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzVPJtATz5XrDEn6tGFiIknxt8kQeZpFojFDsCuz/IziZ3nkR
	0fFz1da8ZMB3xnSa4sdBBpLBY1RnerMM4q79EovKEkHt0dD8+OJcwUkQ7mqh+5O2kyNJ3+5ctFV
	GFzN1kSlal9Mk2rrSHvPQhSo739BGUZe844zD8+NHRiGJkiBRMIyBeMhDznMp9Vo2x3Zd
X-Gm-Gg: AfdE7cknllZR/yIzQL0XduE5CB+3xwNu/yfMKFF7jF2SoK2kwtYz4385D2MCs436Gjl
	5w8bsAZOH0BfL25yR7qnHsbaNDj4cMsoK/rnZ4Rq3l1mK/8i1O2C+BhSY7zIJpGH4JXLzHFQVF/
	dj4FJSvfN8NjfNa2ux1LppPLfSJs1dMsjkqpieJ9SFAY5QFyLfscoQzshDCLD5z7P28q9T1Z6n9
	S5Qa/aTYgAzAn/lKIvypLMHCSAeWFAts/oJ5efXkBdLmonJsP42yOeZHcvZOc1NRZZMfKNZtICT
	aPIwKgcz9+S35Uh/xQPRhjhFd0ZvrsptnN+K0JjKI643nfPLwqIm+MJRkCYH8ThTUqGf7TcR5ft
	COtrib4S4fdsM/kXgLyX+1UDurTwzEdAT4EM4GlTWjy+0ReCKCmyDyD3PBkwk3mTXgq2ERjEMEF
	ZuNn6itqnbxZC3vdYl+YGz1zVN
X-Received: by 2002:ac8:5907:0:b0:51a:8c97:938c with SMTP id d75a77b69052e-51c4c3615b8mr22471861cf.67.1783122687794;
        Fri, 03 Jul 2026 16:51:27 -0700 (PDT)
X-Received: by 2002:ac8:5907:0:b0:51a:8c97:938c with SMTP id d75a77b69052e-51c4c3615b8mr22471551cf.67.1783122687298;
        Fri, 03 Jul 2026 16:51:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5e87sm5234101fa.22.2026.07.03.16.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:51:24 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:51:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add missing properties to
 usb controller
Message-ID: <ht6l2idd2ph6xr6ycfg52255vz3f4dhniwdt7coa63jx2ex7ba@56unlus7aalt>
References: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: xCQ05N9vDs9UctFG3cDm9aPdh9CnpKYL
X-Proofpoint-ORIG-GUID: xCQ05N9vDs9UctFG3cDm9aPdh9CnpKYL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MSBTYWx0ZWRfX1LFYpqnuIobi
 iZMqoMPvj4nuks35FPPlKLcAzQ2hViXKkWbanH3RB3bFAbKM+Fa0xNWR09zUIphwawDQ8B3Ppmq
 Dwgfe2TBlziAunDYq/ft4A36bppDjDY=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a484b00 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Upnonq9QU9DbzT9GOcsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MSBTYWx0ZWRfXwVAaXGlmplX2
 mZvwM9fURAWhUWTSd5+ZFElbbOU5gS/1ko/rwOYa2DOQSXtSy2l2bTRVtJiz/5TbHqgDL6ovWGq
 TLzKhDMp+YCwhlSw08qLn1ZEmMViekmSHFYVGiWLnBJaBjIie9JOx1ml21LwJoYvrC6NT485Pa6
 Lslg2qXIjL59xXHZ2GZOD4loemnwi0rUp4b9H57juxJQu1xLU45+CbF1/HWIh54lIdinwEmURyX
 YQtvd2yT2BWsKKVLa8KzMhWjdDmYaiIxE9/kkKQYFI6D5egfmUvdQ2QKLhkLIPvsu5btbZoKD1H
 Ky2UJjKG6pjhQnxUZVV1VNT5KeKU9lG1IBfEa48p73ZJiWREbiJUQ/VC29h1pT6UVl+DbKbJKcv
 O5rIsIMBGYz0VP7ap/0/9VjKp2VHmwzg6QRNK5o9hPOFw1BBcM7ciYK1gn6fOgOpiam7X8DQAlS
 1Ys1gBsH/hPS5TIQmsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030241
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116430-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,56unlus7aalt:mid];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F13FC7062A0

On Fri, Jul 03, 2026 at 12:14:40AM +0530, Krishna Kurapati wrote:
> USB controller on Kaanapali SoC is capable of switching role betwen device
> and host and also is a wakeup capable device. Add usb-role-switch and
> wakeup-source properties to the controller node accordingly.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

