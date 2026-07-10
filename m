Return-Path: <linux-arm-msm+bounces-118273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bEq9MHblUGpj8AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:28:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E7873AC6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:28:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="AFKuD/aQ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VygyrRBs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118273-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118273-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5E0A30214FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A901C421EF4;
	Fri, 10 Jul 2026 12:28:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FCE408014
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:28:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686506; cv=none; b=IvoCLP/RmqxWi5+JIIhN8v9/CfZcgXbScvDvWKThzSkmYQS+2+AEhYWTUv938jTBXGCL0vePnOSTAd94L+x73goUlUSu6x4dLl4wV+QuwEczvJToTBGN2CPr/89wKocVoFOH/VjocXkR9/YHoqiWjPqio7jB+Gq15GMJAvzuNpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686506; c=relaxed/simple;
	bh=x2yLChwyDBlhoPwQp2bdOLo9LLSk9T4KgY8wi9Fdf0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/xKAgZRN0Fv2lSaa0KGKaYK0X2/22UbRbVAu2JRDe/0dXAZsEut/+MYIl83S8uVE0JZ540+iPGnWwPW3AwtM/zBu+FRHggLrac+eciMfx1XR2W5oadBptXsoX2yrP70n66jJ4aRWH4s4V5lJP5Z9Su244xB6GD51uDUNDKHum4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFKuD/aQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VygyrRBs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmo3l569590
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pdrLWzgNx+QR5fQ2eGSJkfqM
	qM4R10g9Ep491Uwct/c=; b=AFKuD/aQoo6Ty4FYZvx24pIjl0tOpgFnkWeAidru
	dTo64hal/o7ehck4z3Sg7bLE85+AknoBrZ/AUB1ckdECFnyvW5KpqCrHFJThls4F
	uESqDesfQDfchrxgdjLuiI6pVNn1+C6LFts+QH/zFNz6Dd9Y4z3qKxQ8R5XXjfsC
	7vu0KbbIEqTQTK+4rTRWC/8XRPzMbXb0MTWweUQxW9kPhdf390WTtfnoDLr7mfkJ
	DcA9dxECg7vvXWvbLtLL6Pjsg/Cb97/iWgqGNqPXqaD09FDlgcTXQj+BpfvxJIZQ
	O4D52EU5FdFA63bquIVAef5+nWCR8WrrpaAYqXt4HDSh0A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8kxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:28:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737435677d8so904987137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783686503; x=1784291303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pdrLWzgNx+QR5fQ2eGSJkfqMqM4R10g9Ep491Uwct/c=;
        b=VygyrRBsfLJry6B8NFQcA+rg3hoEWA85qEjK5nfW1QrKagr+RWINhgw2IsljTU2r4c
         hvnPIYk2vDUhmn4UrRpnogT33smTQtbVZe/urRNIb9XdQ1WTL3BSZqIYmOceoP9VUaWJ
         WPRijpo+BDvNsLWIUDWpt9o787a6YaxpdLXr+1qot5EmMXig7zhXH4vZL0Ljpi9u6pv6
         xzv91T8Opbuc1saSMLHomtm/ltMch/kGhJH+60oH9/X/JMkprhP4idFJ+NDx6ccA7zvB
         w9qT0Q/ebRIQelv8WE0h6q4qtwZ27QJ24wHAZfA9CzZ3rOY2hAePPDiMDotNaPN2Hc58
         nG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686503; x=1784291303;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdrLWzgNx+QR5fQ2eGSJkfqMqM4R10g9Ep491Uwct/c=;
        b=I8SOyNKARmzlq1v6xvH1oJNz4941HJbMiblpMZWU1JEAFGtkgRwniZz+6pnatt8Riw
         CXjwIB5BpoLW3MOGHxVwrz1l0CJhb5Z7Oby6aOJLToN8kEtC6A6bSScdq+AkmoBbjzp3
         VidveKgfboWwiNKaX6CqPa3AxDOb/S7REi+7dR+jsMugU1pV60z/FO6Z3bkszF+r8VIR
         3k160/X0CrH0ohgJJsNFmXK0ugYUfyoDE4/7ASVzZ3UdjOYJ+J1t0Co530H1IahLxmJv
         MO+bxOtMf/3//q6enarwXxc4roUpjqG0UXkaqhe9kM7NmyO15XnhjUiki1+8n92HW9WN
         nOMg==
X-Forwarded-Encrypted: i=1; AHgh+RrSrvCTJp9U2ndUtuFyq3q3c245NAvFh1rLXyo9+BEUSYCBUlIRGAh5rGPv0ReBRM+FzEne0cZwepn0bigZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbDoE69JtaVA1WmNwLCE53Ju86ApSXbxx+qRxuenjsjJJdHxZ
	5reXLxxagAGAkRLLrL3aVOSrVHWKl0K5r3UdhIvxqf28Ca736QdfXL9f5qyV0L/yjkcO9yeJcqZ
	NnGCf2s9qjouwG1o8RlC6t7kKB8DQa+UCmC88hdNeyW99p8Zn6yK8wEIQI2+VZQBLg1aDTiZGLQ
	ZK
X-Gm-Gg: AfdE7ckKwDcK0IYG9WXkHMvhltP5p4V3cLIMYms+xqh9ruYzD5jSECXYHv8x2nEWkbR
	aL3mIZwl99RRxvumeeWBNT6LZ5wAwxVmYQ7s2smEmp/2yV+O+/YY5rcavr4LC6e+fcGzXeAI/Im
	1P3gJqnDJC60aReNSNYxZpNVQO/G/83a0uQAfjVRlNRW7lcxnj7c0s2m/zscVYY4Ha2lSLv67/X
	gFgW0TYOyUY4oW7wVpmHu0aVgtc8OEPX5wScBU1YKJr1hoTBcscAoLa2eAIBvCL/+zcfoQ6Iwvh
	maasCeMpuzY1i0bVfbCbKmaJteIUHD2QuQ4YzCJBuV2KMy9Y4L1Kw1Jb8tOm83gDovh4ZdmdwRg
	TglJEE0h0/yQTPYoY6zfqz66zrqeomsxin1W3uqLENKQxtece82n4TbAgo7W5kqig8SEJ+mFl6d
	/cP9wwGWpPqnC20pkkY4h5Mggi
X-Received: by 2002:a05:6102:508e:b0:739:15ef:cdfb with SMTP id ada2fe7eead31-744dff7d21emr7063858137.5.1783686503106;
        Fri, 10 Jul 2026 05:28:23 -0700 (PDT)
X-Received: by 2002:a05:6102:508e:b0:739:15ef:cdfb with SMTP id ada2fe7eead31-744dff7d21emr7063826137.5.1783686502597;
        Fri, 10 Jul 2026 05:28:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4a297sm582454e87.7.2026.07.10.05.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:28:21 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:28:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
References: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
 <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50e567 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=xQqxz70HCiEPHx7muvEA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: PIB5xx3gnUMLkDWVQcHWJxmfTJWtUROJ
X-Proofpoint-GUID: PIB5xx3gnUMLkDWVQcHWJxmfTJWtUROJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNCBTYWx0ZWRfX7Dk8EVVSK6hw
 cbf8rLf7kkQ63nD+HaN4d2zFS9NMbtUXm2VY1xT22xjt0fDwqTbznpt9mhD00TTN+yEtjdqxwPT
 XJ3/+6KKoI3/RjGa4XnsS7VFIHmCJV8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNCBTYWx0ZWRfXyMgzYUL3GlQ7
 xTB+U4zcXZrzgIodQR0JutPCIMKaNiMHoRGw+wqJq74whFr3wLQCy7BcL8pD4i3NcTMrvj2r3Fo
 dkIxn83pM5164zi/rUH81ZBfPXdN2eGwK7kv9j0AAkb1XtxjRy+vwbfaOstV85CHyfBOtyO27FJ
 GWRdI848IoIk+ZnQONkPmchEdhquvyXmzRX31tnxEr3xGYCD/Hjvrj16saqgPLKc79o3tKJqGKY
 ajNOvEWrfZyO3tO4iNZtp2kLB+WVLTgcoDtjzyTs7J6NrG/H7NfGQltHkZDbaBgJnEZDRimEusW
 2sWNuUeQiWO+hPsVdEkhVJ/au9tSefm9HDs6Pihn1+jK0xAhxVnGHDnzt9hUVqEXKkU41BJJlZe
 WGuaT7LQeTic5/2ao+vSSNopJ5pVlUiX5/9l24vOr7kmJ4XLop2ZJWU+7PNYKkqrkh9Nw54Vv2h
 NOBXnvzhh1A7p4VTy2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118273-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59E7873AC6D

On Thu, Jul 09, 2026 at 08:16:21PM +0200, Konrad Dybcio wrote:
> On 7/9/26 9:33 AM, Dmitry Baryshkov wrote:
> > On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
> >> On 08/07/2026 13:19, Konrad Dybcio wrote:
> >>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
> >>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
> >>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
> >>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
> >>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
> >>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
> >>> [...]
> >>>
> >>>> OK, I can see how this thread is confusing.
> >>>>
> >>>> The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
> >>>>
> >>>> Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
> >>>>
> >>>> OTOH we_want_ to make the top-level binding into a bus, we've discussed that several times.
> >>>>
> >>>> To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
> >>>>
> >>>> Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
> >>>>
> >>>> That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.
> >>> I think this needlessly increases the amount of combinations we'll
> >>> have to keep supporting down the line (with a ton of compatibility
> >>> boilerplate code)
> >>>
> >>> Konrad
> >>
> >> Fine.
> >>
> >> Lets drop the bus idea then. I'm happy to close the conversation as
> >> peer-nodes.
> > 
> > It think, this would close the path for upgrading existing platforms to
> > split the driver / bindings. If all IFE / PHY / etc. are subnodes of the
> > CAMSS, it is easy to play backwards compatibility tricks and
> > reinstantiate devices on the fly, pick up only certain resources, etc.
> > 
> > If they are sibling nodes, it becomes much more complicated.
> > 
> > I might be wrong here. Maybe we really should try a simple (heh)
> > experiment. We have your series which adds CSI PHY as a first class
> > citizen. And we have existing platforms where CSI PHYs were packed into
> > the camss node (and camss driver FWIW).
> > 
> > Which way of representing device nodes makes it easier to migrate
> > existing platform to the CSI PHY driver, while keeping compatibility
> > with old DTs (yeah, ABI, old DTs must continue to work)?
> 
> Quite frankly, I don't consider the existing (meganode) description
> any valid, and would vote to rip it the second a replacement is
> available. But once, not N times.

Rip without providing backwards compatibility?

One of the options would be to follow the 'venus/iris' approach: land
new set of component drivers, which target new platforms and provide
minimal support for one old platform (maybe via autoapplied DT overlay
or other similar techniques). Then continue migrating and phasing out
camss driver for old platforms, while adding support for new blocks in
the new set of drivers and ripping support from the camss driver after
some migration time.

> This is not to blame any of the original implementers, this might
> have seemed like the right idea for the tiny subsystem on msm8916.

Maybe...


-- 
With best wishes
Dmitry

