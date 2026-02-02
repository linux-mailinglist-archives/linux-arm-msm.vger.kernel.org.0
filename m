Return-Path: <linux-arm-msm+bounces-91448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPbcHDlugGl38AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:28:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CC2CA1F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A506302BDCC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 09:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CD62D3EF2;
	Mon,  2 Feb 2026 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckk8JNm/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+1AiP1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED112D060D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770024300; cv=none; b=QNi5epX567iMOV8FFVblb7s2a4VLsQJVEqCACNMuOAhg/iQKhnEoyUku0P/iSwVk6siPSr/WPACxknUBSoSc5+l99C2ae7NahBMIv7BF5zTjZFp2AF7NSKpyv5XW8s3fV1DMb7oPMcT5yQFZV9w66bvvjqUso3b7X0i7uEcu1VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770024300; c=relaxed/simple;
	bh=9n4kY4nyBNYg3GXmH5gj2SV8YneBpm+0ylmQISyn0FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNlC67/crj+KbS24lWvTx3LXykhmjUDWt2L5oTFX/5EK/yIfcwJthEmm9+mocFj7t/KEJNitFLO1DtPy038G7K7b0+IKVxd5Ds8pgGjkfGSy/T824TZlovJBvL9Bd/NbAy22I2AJ+nu05DB8M/HvnbsekxZi7WDJkMJr7Qky+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckk8JNm/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+1AiP1N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61282V971192166
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 09:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QNsD0DtK2zs66gdOefBn5zJI
	74oEZ65Y8EMNGDp6FrE=; b=ckk8JNm/8eKKQaJJoztPdWL2lCyq6D1qwAtCtGnf
	H9X2FJOXJABf7x6djd0BpH49tt7VKk+UNPfGJXFa/iwFYfBKw6eo8vmnQbs/JbnJ
	PyHT9NSgJYb7WN1bhZNviwr9aoebSIPiNY5YrU/C9DbRL8Z/0Wqirq3sFAqDuxxJ
	AGo+MYZ77Dse1kibTiJfLnOjlgZnlZzJw5UeoFwVfI9AAw8qOP6YdkKlja1wPc6c
	r+ZyFx2zdYyKRLem46UaidSReiwehmkkedUX6CLaLa1BOBEsnKbSgfqyQ11IdiC8
	bDyJ6QB0aQ0lidQrHUbGa6Bp2PMWOBEtHAh6QnycN3wSHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4vv2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 09:24:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a289856eso1559698085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 01:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770024297; x=1770629097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QNsD0DtK2zs66gdOefBn5zJI74oEZ65Y8EMNGDp6FrE=;
        b=D+1AiP1NOCndymF2jBKscHE2FfiGZRNIV8KbOjapfYSCA3CyAlNkWLH+T+Tikikt3v
         A8amvk0ieLBgRcYfar7P6y+zXomQczAi7BobfSRj8U30d/iKiQdcmZSt54t6lzSNRxdZ
         dcaZ0jvpH5fy0MIOGKB5K1PMan1y4QSwAYH/K8B0PQatvdz+rPZgTF8rllqJCt9i5LeL
         Ae36lgwO6OUISCPXBNkrt90tkc4S7SW0rlYqRxCuUZC9tsu3n5eZLO+0rxJ1K+hcy66i
         zRlcxOH+eR8168VqBy90oZLdCN9JUCrJmHDiYY8/g+p3CCRW48zFL391F9FgFrjoqOBH
         rGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770024297; x=1770629097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNsD0DtK2zs66gdOefBn5zJI74oEZ65Y8EMNGDp6FrE=;
        b=tkKuUhUZKIoGrBz6GS9LT25Nbo+mINIh8/76qJ6hLB88LZ0kVnPiNGyLDyvIc6Mh+A
         xCznDPpqpSX4gCkuo8ay/ugBZP1h/VFEh6HxusCBacYOKUymHszn0Dfr7gkL5/1xIyjF
         HF4m1d26B14rDLguClcfek13NkSWSA4AM9YVTHW2toXW2LJVKPEELPklM2YOxh0f4qrA
         MUYauFvtnSR5eLtm0K0ryFM9iDWT8gkXzCYQaK2yWTudGjkuLstCMFhJh/x0WpeewwKw
         UVifZgpU+XlkGCyhTRthERmxzW/gr9oTPgPgSZewQoIZw3u1tu4uL4PMYRynm5w5nJMQ
         eEtg==
X-Forwarded-Encrypted: i=1; AJvYcCUCNdwmBYMVEXOFycdMI+N3zxkgF2jkFiFhogq3UHJD9RJzfTX/OyfgGLLATqvW2IDBo2Rzn/6vwrklk9Pp@vger.kernel.org
X-Gm-Message-State: AOJu0YwnCIA9ypFecY8KgxNDWDhU0EM88EnA3r8t00tMvPDO/9Of/0MF
	OG4qZbGylLRzOlBhkrbTKDqVUIAph7ddTKolCTAMjGji6FLRejMg2UOgt0bQ3gRGGFqao6iI1tG
	MulTNyjrMLQqAItuFn5IIgSF7fzUZuG0JY4llcgJl8cdweneCpy+/C892IjLVfPk9GiOK
X-Gm-Gg: AZuq6aIIQ6RdI93DWh7ONGdh0P/eXrXxMnJII7L294GUSF8Sgd1koZdRfZnm0uHVsx0
	wQNkW9nLFKA/XsK4c/oc3m9xfyfFyflDvmQIe0Ec2YQkmfdtOiul6339R5Z0CvE7J5fdJHr1zxi
	2Ul3y3cfsZNwjCB873Ee0NamBLrRDFcFUNiLMHLDbfPs4VH8FJ0NL+PHpfnMhVceecXlAOaSokH
	U07zVVK/uuPtK+sWauqj2eGpFQCTrquj2T8vM25yEPB/2iMLlxkI2mmGbQWRIu6iX6FSKsiwkTy
	Mnlxp9JXQHzM+ANo8Z+qqUqbAMre+5q1oWzGAUk+TTJHPINZmwYxeKb0AjcCJgmZ3lGA5kDViHJ
	IeHG4UAsuH1S5KKVm3egzttke/2W8fS4Qt8wENAUNvQE9da9Mgbjm/8+Vz3xD1liAWJODscYO42
	+3NMrX8rFUJZQHtpImfIaTjlU=
X-Received: by 2002:a05:620a:8528:b0:8c7:e8c1:ea05 with SMTP id af79cd13be357-8c7e8c1fd45mr1403084885a.7.1770024296838;
        Mon, 02 Feb 2026 01:24:56 -0800 (PST)
X-Received: by 2002:a05:620a:8528:b0:8c7:e8c1:ea05 with SMTP id af79cd13be357-8c7e8c1fd45mr1403083385a.7.1770024296365;
        Mon, 02 Feb 2026 01:24:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2d2bsm3423967e87.51.2026.02.02.01.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:24:55 -0800 (PST)
Date: Mon, 2 Feb 2026 11:24:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/5] media: qcom: flip the switch between Venus and
 Iris drivers
Message-ID: <pd4slkxwj7q4jrxaxd4xhbzoygxvlnjxjeylqi36pzwy57lion@la65rc7u2fyf>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <f8179247-80ed-4bf0-85d8-53441f0d9311@oss.qualcomm.com>
 <249f2097-8676-4fcb-8570-1ec8c0e946fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <249f2097-8676-4fcb-8570-1ec8c0e946fa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ud4cFyPpr_AWFdV_JfX-Kc2Fl2JoDiSs
X-Proofpoint-GUID: Ud4cFyPpr_AWFdV_JfX-Kc2Fl2JoDiSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4MCBTYWx0ZWRfX98BW4wBZ7PdA
 qz5klF5kQRUkHIOYwy4/6CnyEhh7Cb1cMMbc4T5OPV6mdsFGc5e41n3c1iVwIEUIok7cJJPDBoq
 2ax/fvmbjGoZDtWJQZvx2oLdaunxGcMershHC+ZCM/5qAqMnGkxrYcHj2MDXP/rB2QOgumRygZr
 Xa2didrKjyk9s1Jrv57NS11fPehdYkkvv5x/KaaySmoDlZfXo6pUrUoERqHqh1ZNKDGyHxPZAA2
 83Nyr6XFStDCBIw5VnzjOgHnM6X4jpbHb6WCCIS8AV+AzGsm6uWstoz2tATQJv9TUTj9F/pQgU8
 YxzdTZ68Ww+i+vm3I042KQj/qzZDNZSquFrdj2IALb+XOlB3ohjVjg+qlbO+B684SoxmM1G4763
 nv+CAdhb5hAodTQ2sHItTOl/212fwBeMCJ55UQQ8dzKpZ7LtVJDmUA2svcPXgZwQcVLRz08WdBR
 LZg9R94CODmUhfFHLRA==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69806d69 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=9x2bN_ryx89G4Jrs3UoA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91448-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3CC2CA1F3
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 12:12:01PM +0530, Vikash Garodia wrote:
> 
> On 2/2/2026 12:00 PM, Vikash Garodia wrote:
> > 
> > On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
> > > As the Venus and Iris drivers are close to the "feature parity" for the
> > > common platforms (SC7280, SM8250), in order to get more attention to
> > > squashing bugs from the Iris driver, flip the switch and default to the
> > > Iris driver if both are enabled. The Iris driver has several
> > > regressions, but hopefully they can be fixed through the development
> > > cycle by the respective team. Also it is better to fail the test than
> > > crash the device (which Venus driver does a lot).
> > > 
> > > Note: then intention is to land this in 6.21, which might let us to
> > > drop those platforms from the Venus driver in 6.22+.
> > > 
> > > Testing methodology: fluster test-suite, single-threaded mode, SM8250
> > > device (RB5).
> > 
> > Fluster results for SC7280 is regressing, which we were discussing in
> > earlier version of this series, need to be fixed. All tests were failing
> > but one for h265 decode.
> 
> I see the patch (#4/5) to increase the size, please add the fluster report
> on sc7280.

From the cover letter:

   For SC7280, the results match the SM8250 ones.

Anyway, the relevant part:

|Test|GStreamer-H.265-V4L2-Gst1.0|
|TOTAL|133/147|
|TOTAL TIME|82.276s|

|-|-|
|Profile|GStreamer-H.265-V4L2-Gst1.0|
|MAIN|132/135|
|MAIN_10|0/11|
|MAIN_STILL_PICTURE|1/1|


# GLOBAL SUMMARY
|TOTALS|GStreamer-H.265-V4L2-Gst1.0|
|-|-|
|TOTAL|133/147|
|TOTAL TIME|82.276s|
|-|-|
|Profile|GStreamer-H.265-V4L2-Gst1.0|
|MAIN|132/135|
|MAIN_10|0/11|
|MAIN_STILL_PICTURE|1/1|
|-|-|



> 
> > 
> > Regards,
> > Vikash
> > 
> 

-- 
With best wishes
Dmitry

