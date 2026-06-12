Return-Path: <linux-arm-msm+bounces-112836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qCz7MuBWK2oy7QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:46:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F2675FCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:46:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PleeoCWD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ul405Cs6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112836-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112836-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD63A30028BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2501A2C04;
	Fri, 12 Jun 2026 00:46:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9FE78F4A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:46:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781225181; cv=none; b=pH2Sz45iuiyLH6e2dcFlrTsj4oPY2RZO6OS0Bii7MkepodF2cZX0E3jdycx9ikmTE2uwLED7AZu3AX81UF7VddFoUSdDOkdtTA1jVvo84sFWPWYJM1AKcjGT1xunvDinRxr2drpA6QU6QyYQYb4rsZiY1YUiLkdo5s+MNydJZdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781225181; c=relaxed/simple;
	bh=CgR3ArNe+tYqJJfpR5MFvMm/yvP7sCuoeNCRZdpU7Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYCFkgbcH6rwkLOWPJT+bxiRCxQalzbkm1jVHG2ibGFaXIUNubNV5s9wRy5qcatR22SlJC82CYEbfVvd6V5dIKJrrJahMwnUwKYrWuQOfdAtDFoIefDixo6+CJED+RNI4CdGYO9YxoWZYYU2hJrMHuOVl0zQLIFbI1Gry1HzKg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PleeoCWD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ul405Cs6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMSc1v1912178
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3PR2d/GM2GQGUIHcUp7nZawz
	l3LdM6jTMdV+KzfrJ2s=; b=PleeoCWDm95kOFNTcbzUBR2mjSYk7dZe11CS31If
	Z6PgcSImYjEQCjhrHIdT/VccYFCpFf25Dtj8vIAK9/RoclhtkQreuhRmYz6XCZ/I
	3q3eaMB8cxN+uHDsWx87fyNmlzutWkFO9TvedkOXQ/+sBbh4tjLrtgEeHIDsMM5z
	LwpczBmzkjJ0OzKIeOsTTawi7H1D0Ad5qLMaR1vLpK+vm/PVTOT9FXz8LJRc9cbL
	zzjBL7EeUoHf/bb8+UZxrHWBxgyfNbXBKdTD0ouv2K1uW5oAYRImcqBpjXSrxro8
	PSu7hq48/AltE+lQlNvTlvC2hkFuuuTe19rk2AJCDxmvGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7hphs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:46:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51768072950so4814771cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781225178; x=1781829978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3PR2d/GM2GQGUIHcUp7nZawzl3LdM6jTMdV+KzfrJ2s=;
        b=Ul405Cs67rb/SjUTLqygBC2A/iwPZys0pOUBKtQOZNr2lCO5K/nNWFsdrsMMb5fZOp
         YBoN0GGmIItMZn2FDOfbBajFYbuw/z4jtlRzbyOmHonvc+ddMMtjrFVraYS0FakRe5c0
         G5OPywdQFoVcd8+yhMqjetc2X41RPQeIja1TfLiCbEmVEkNHNKZPIXlTK3B/vsMO/kBh
         W6SyTv+CZBm6Lc0fsAz7S2YXLaswPfobKejoELtfyI5pn3bUgBWjs9vq9AZIVc9EHAPp
         kZulKuHJ/3TxIdG/Q3Y+YEpj1sQCuAExDaBKlXtKef1oDmQSAj/T9hiW7c8GEm0IU12f
         sEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781225178; x=1781829978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PR2d/GM2GQGUIHcUp7nZawzl3LdM6jTMdV+KzfrJ2s=;
        b=ONdvfzCyfLqoG/sxY8vg3HarGx6DYTxWGObE7XrDYceOPhK7v9+iVIP6238M7wmhfk
         abjI9VqJK+vnqWTqMlrtiiamfOs4750EnZb3zhRHOtwAGxqXTjO9iwNcjJJcQn9+Smxf
         GLJcn6OmTwKk1qvzcMBYAAM4MAaF/Rj3Hl8zdswoV9Zczijp1zTM9BO2B1KFgBMV6kyn
         BjckRZ3pBAmL0WGegDq2lUXdK8sA8odFW9DA5QGM6fjmrKZcDpRIhRrKp7YPRouq4Kgd
         4XqS6n4oqUPiUEoMe5aUNP+qeBAbqfIVsZpIK382ohwdgUcqcRRnISoK7W9qU4cDg+ZO
         k/mg==
X-Forwarded-Encrypted: i=1; AFNElJ+gCHqK5HJp/EiqZwGLrPCs6OuT8trT/WRkhLZz0GgUYp2a3VtksOuyj2Ex/7IbDF7olb0z7oIKA912GMVt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxed46aXUXV2ifWyvvy1GiaHP9RPFV/edKz2QLBqnoc5huUdHyL
	KzD/WquAs8y+pPKrp00hCGD11gAk/nhR45cHfpPVoxM/Z/OklDZAr5XpeVrViCjcv08nURA9ci1
	BcYRAUBZDbsVDbHtiTmPmgxg969pwwkw8ua8CFBnNLk6IqPjAeYVDsfgb00Oy7wEi7Go2
X-Gm-Gg: Acq92OHjaRmCvklSc2nmpU8+AkyG+6eoP6vSgAn6VBlPDZ7mYMkSdxK6+MdwRV4Jsoi
	wXUPDi9EU5Vz19nLQ3XTQnE29ybzVK2Nvkj9L1PELImO2cADgHYistYU+fwUqHRa/H412QdHMox
	VXmZZ5e+prDZVcQyoQJjyUpK4RY+hIwQ3nmefM65sNEqQ4pj2zWN6XckXo8xWCdYGjiP1QyYilB
	D+6Z364mTdTvyf9lyAJ7SC5iAB4u9zOPw1YawTNFS7QbDXmdUR4VNQLd1hvdAyv1ZScqMi+PdDi
	qs6lAgfzqDm93TNEXFR5mjukZ4g5L/YN2CstJfSQHQUoVXboHHKzgRcONWPF+I0IXU0LjKZes31
	KdpTm8Hun2JfsUphfwvJ33ea1G2TSdSrGHAq/EhMIyLb5hw+uYlZy4Ccu2qwfs89Nh4ZSlHHYPr
	Vw7QSmZVVBuUb3iuM7QdBfyhziUbCCDYJrvkg=
X-Received: by 2002:a05:622a:64b:b0:516:e031:9343 with SMTP id d75a77b69052e-517fe4cf2f6mr7857071cf.11.1781225178530;
        Thu, 11 Jun 2026 17:46:18 -0700 (PDT)
X-Received: by 2002:a05:622a:64b:b0:516:e031:9343 with SMTP id d75a77b69052e-517fe4cf2f6mr7856711cf.11.1781225178076;
        Thu, 11 Jun 2026 17:46:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1715d4sm66310e87.34.2026.06.11.17.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:46:16 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:46:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver
Message-ID: <l4xvfhfusaaqr4hbixdab2mwk54ecerba34k3qcx5jy22sll7h@p43osebniotz>
References: <20260611-qcom-arm64-defconfig-bam-dmux-v1-1-599190f17fc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-qcom-arm64-defconfig-bam-dmux-v1-1-599190f17fc9@oss.qualcomm.com>
X-Proofpoint-GUID: 2INbttg4yW70RN5KOIGh6ncLiUJAkGwR
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2b56db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Agt8DVA8ThVRTL2vFZIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwNCBTYWx0ZWRfX4v4TM4AdJ0Th
 aVah/7crOmYhsyIUXotHIGRni67uJSYUyP0HcXCmqn6vIo/Kzw1h65C/JbEKWUvR2fMgW/eOiCD
 qfhBCfImX8k5y1JKaPJRU1zyxcixhiqXa+drtsIEgLIWX6wYETjpgmAYXMB4Gd/i65o8spDZMQd
 3cTjNBiFoCrOnnLyNU6qufz6Fi/ibuY9oYCPpg0GqeA0LQ+0SZnAwkAL5xQ85Y7pvNnv421TSla
 EcZK6iXqLeOleCwc0qIJDn1Gv5Gdcf1Gv5XotUcPluTAO1Dku3d1gzGucEjW/hQ2YANvIKB82F6
 H6rtr8+dS7xadPBUAgJPgNyEbWI/ujquGLgjQY7rOVstLx4SCnpLP2/WJNLlhsmToV1VYMP9HTk
 9hugPJwQiJ5Q2S58AiVxWJzEA3+MwRgGx9/vi/6Es6cVqbf4SjMmSWBrsv1OsRMNzSW8/iotsMc
 vnaHTR2/+S/cLXOfCuQ==
X-Proofpoint-ORIG-GUID: 2INbttg4yW70RN5KOIGh6ncLiUJAkGwR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwNCBTYWx0ZWRfXyVpbSv5bmSzM
 D9t9mZtjlNXm2mDz4lZXtnJXt8uJD/zQRevBqmYlVg+vz5Z290/f7iNfnv1w1D6EgcXPIGBQWC+
 SEATRibJ2YLh0OFBr5fpOLyHukJS4Zk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112836-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,p43osebniotz:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vishnu.santhosh@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 645F2675FCE

On Thu, Jun 11, 2026 at 12:10:10PM +0530, Vishnu Santhosh wrote:
> Enable the BAM Data Multiplexer WWAN driver as a module to support
> modem data channels on Qualcomm Shikra SoC. The driver is also used
> by other platforms with A2 BAM hardware such as MSM8916 and MSM8939.
> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

