Return-Path: <linux-arm-msm+bounces-116431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +pbfKhFLSGqGogAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:51:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF8E7062A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:51:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eHLwx3pI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B86ywHyv;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116431-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116431-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD395303F46E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 23:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103F5330B0B;
	Fri,  3 Jul 2026 23:51:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C627B323417
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 23:51:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122703; cv=none; b=G0kg7VPc8Jc2ZFAXjP/d5gGfO2nLSqM9wyFeti6qiBS1BnrqyE4sHklZm+kObYvXfaKTbzH5IaSR0lSxd6+zwomACbWppV8GM7R3JsuaSq1Hfn5zrrUPTSNGv6UyWx9WrOP+5GNov4ODBODnfxFzORFStmux3yu/zPGrrWaBaA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122703; c=relaxed/simple;
	bh=EbP2c34m00LQsXjfm8+3/VGxcynlauA+XFUp4EypS5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nL9g3gWb0lRB16opZq/dHTgASYL8R9tQL7lA/tU+LknuF6CT/YzxQsIIOsYsCcXBQe+EAyXowWvuVj3vZaGHOdkr5Fb+pmusTDB8yqBmW9YBxvKJhBNKFIZVHi7HRaFAhVLZdYLmInmoEdy8L1SJ94/d+JUrk9QNApMoQEp3Zgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHLwx3pI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B86ywHyv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPJpZ1039327
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 23:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B4Q67iGHGclszaDZD6EJN7g3
	ErD13T0IW9ELkfR2bKA=; b=eHLwx3pIeA7saAohTieIP1Jbl+DKOlg+7oSotk9T
	+Nag6yniyRHYzCGEfs8T+4KXbeDmebWmOibcL2honlXLcIiolORMYakNgq8Z1u8w
	DN2moLZtMRVRU+T9yvCkVs77VQ3mgTuyC8nvGqwJS99hy4kHwymE1J9OZFhpGXxD
	Kh7IysctXCP6aQfWb1KoAQApsd+ycXFwA2urmR+diviWTr3aBQj6PFdQI7cp8MEU
	kPJ55TH4kFfqx53MPqlUKiuPS1SAy9JVZOeh9G21cxgJPG+Ef3iaxuHxiI40Alhl
	8CKNatP3ogm6WTOLmkizdzk8rAl0f2eMQkksYDOKMzHszg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84anp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 23:51:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e73fc29bfso145141185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 16:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783122700; x=1783727500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4Q67iGHGclszaDZD6EJN7g3ErD13T0IW9ELkfR2bKA=;
        b=B86ywHyvJetXF5ctHyfFh2J8tBbuwJngcLKZ5leR+Sv5RfCBhIg0wqJdSf8u3JDN9Q
         /jBmeJ+aFdWI0E36IaQikS4y7pAJ5DIqKoob47KziRUsskHtnQnlrnQrFSKJXSUd3I/Y
         PtfxoIlZnPtrSpi/R3nUZJzbGc6nHVOCj7rM78N0oKtt1PjqsQ3EcP5PZ2rp48GLD/y+
         2KRKpCGpaOGcJT5UzKltrxKbvzy7NVnOu6yDJ+pOqCfja66Pmuk9qk/J3aeZ8YWuXr/f
         NNrjDTCnGYYFJP13MvKRMdSp+rRSwFk6Fphpmcj31n3wdtdCJf6UOKSzBQ0DO7L8prZ+
         NXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783122700; x=1783727500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4Q67iGHGclszaDZD6EJN7g3ErD13T0IW9ELkfR2bKA=;
        b=S2E8R1XM9S02heRsKEKhgsVEgVlHEBkE+tob/xR3s9clXfpLpve4mK6Fik+Ude0JOC
         k+sNY77gHkaNihgYHBOLPabs7iekYuhJ3pbVjrK0EUoYwLzqe30QtpLTPzYL3FdScQ4o
         GYjgTxvHVz92XX3iXYPoR1uTk/XxAqlqnqNbfe+rjW2S0ckQlBw8l5E0BxqmS5H6xM/6
         8JaXweDLP4aSngB73nGXbdIRje6qfTbMFHegx2H96a1kpzSUfpTsi/4nxL+fP0Yu9lQZ
         ooJg4ZrAhlVuilJJvi1m2KUCbqU1vI0vPuTwWigNB1ZZnFcWeWwsFSSqmqGD7IJwvy7U
         WiFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3YiGFFpdu/OwoDQ9xLk0JlISniS/R3V65RjgpV8UnMBv9GGXAjlD4uK8Fsfd2pdgKZu1ndXrR89TnSqt8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2tLmfj752xz8Kk/74WuyPiS2gGs5n/2jQYM6eE5Wc/gzqWH1S
	ab2Sfhr+77RAIMTNLre9an74A53q/zbbDexknYesSJ4nIqxaYbvoUYwP6JlaWgNq7s/iuPBlpJ6
	tSTbRFHUMpkOoyoXNEKDNObRPJE8SmKJdJ3Fet+aXzuYtBM4B5Lgo4V1yq5Jfx13+bzJq
X-Gm-Gg: AfdE7clrKnUG9TclgJ+F/b9/2vm/Uic44WRwt/KYpgb8sRFG4IP7CQhQy/YPfJK4pEH
	UXtku8sv84yJIgEZzhsfqW6Xd1P/HnXXgSSRhRNwfLHWvfsDMDwxQbS/VWtVdvnZh031HvwAjgF
	o61qcZcr9RqGYqmFdU+dBp1sLGGAfSvvl7u5pqeCY46AEz4YZ3PZypYOILOtRaz0IrjbYqe0O0j
	96f7EPT1BMfF8dUr1YjdXNr5uKO0u8BXER4wKPhm+Xb87OOVqRU9xz9sZMqizMAgpr7soZOjZQH
	PrHD6kxgVl0k0zmjwmc0XlWrHtaIstFO0OTNgd1E065o8m9QYPGOGh4oHZTwR3pUTMhIj2ScDcr
	SzJ/3s3ygrIwG7ktCCtHPnsL5VOO/mXNaIH90tHrQLjwD2o/Ly4f0VrVQhyBgkqa4WFhrChgrIe
	GyR8wCkh/psE3CixIbxeqZA50Z
X-Received: by 2002:a05:620a:2629:b0:92e:675e:8ede with SMTP id af79cd13be357-92e9a362180mr224156285a.13.1783122700186;
        Fri, 03 Jul 2026 16:51:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2629:b0:92e:675e:8ede with SMTP id af79cd13be357-92e9a362180mr224154285a.13.1783122699811;
        Fri, 03 Jul 2026 16:51:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5d1dsm5770601fa.27.2026.07.03.16.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:51:37 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:51:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add wakeup-source property to
 usb controller
Message-ID: <ggyv6ipv2risdpv25nsqfzrj7zbydu4no4j5msf5cx75tdrfeb@rnwlgvki6wpx>
References: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: Dyp5SWdAOplXsr5YRRJakdKEdPcHsg81
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MSBTYWx0ZWRfX2RjARLcgZlat
 i5uayQxBmGlHFoHl1tKCH5LaVal7HrKwFHNG+AaefqUreexxF2HHJuAFs2665mltGLjPCmZbCWh
 iyaw7JLFm090rSDJviAuo+62yRqT1Zo=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a484b0d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=W5a9TBUDmymgAInc3kQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MSBTYWx0ZWRfX4Hk6/vB/QW5I
 dAVnNEfAg8zt1I24fCvGFkobQUUjoIR1jVBYobMAZE5X8vJWAWs6PfBJ91i9vfh1j64MGRtBIH8
 YBdsIxqbEq9/TvL+pbdLs6cUMtnCDfqjru/nvpcQF72KKL1l6hGx8cQCk2xPT6duAUKazrzCmGh
 +sjHxgMDd9y5y0JVPg09VBD39845dJWaOUrPGB7USPNYOzsjuh+3n3VUCkCfhcYEsjeOwtRPYRQ
 7RalQbUZFwitYmf6xYG5/5I46v/fDbkYnO/VBGAbU2mA9QVw/bH+YKxm718lJblL1XYd3HXSA3q
 1xMDkYwIBe3Fj5PTyJKsCaWHo0JBJ+hOVso3HbccHQ6bkhEprm3brTfO+zQRBowV2SYat7Ig1V0
 8JQy56d9W4CMnfP6Nc06pSmY6ZKzsl8TlsWnvMAL7lXVgkmNYr7F1ppBQXEEXhjzb3ypZEPkcvx
 I6xOdgsXY8BCaOGxbEg==
X-Proofpoint-ORIG-GUID: Dyp5SWdAOplXsr5YRRJakdKEdPcHsg81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
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
	TAGGED_FROM(0.00)[bounces-116431-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 5DF8E7062A8

On Fri, Jul 03, 2026 at 12:15:11AM +0530, Krishna Kurapati wrote:
> USB controller on SM8750 can be configured as a wakeup capable device.
> Add wakeup-source property indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

