Return-Path: <linux-arm-msm+bounces-97574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMtuKuI2tGnTiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:10:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA4286B9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2B6B3284014
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07163B4EBC;
	Fri, 13 Mar 2026 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8Rj6Deq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h54S3c1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E25C379EF1
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417853; cv=none; b=RLj4XpPsVjWqSeGOcY2tNx9pyR8AfS93Pqj7hes/2U0HpB7kd3E8k2/WnfQUEe93Jcmo/RveFMqmvKPmJDL8cwNVpUB30y9mjlPNvmlU+U6G8qOE3do5Os1R6G+9NvoahUMVpcNyKx7Fhaqf76LN+2x7Nphfp6ozKe9ITrFKj0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417853; c=relaxed/simple;
	bh=rK8S3XcdOkJtTPmU3AL4lHebx836znNSJPDRkIryyNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKeGLPNrqcamWgaUECldsfldh8Xf8eQcCTWeyLm0xPtO7yReUanYquTuPxdv1g8tTIzFLtftYYGxzmlj38Hu1PsQzb8oKnbcRTVuN5cVEB9R6dAJ18RGkaIGqtC7tnpvODnGj3XG+dOryz2Ox1USzmRabp1XqJ9lLrAbT/n3a/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8Rj6Deq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h54S3c1N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXGtH437734
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoIt/c0c3o7wTtS+reA6lWhErdA4xTAVSkX0IZxKwL8=; b=d8Rj6Deqx87RQvwk
	Hb7YnElw+GX2/F6B8gyXuwmugHHhtBXDclq/DOQy2K2yllf3pybfkIV4BzWlpNum
	y8G+IxE+QG0j75U+7eUX6h8cOp1jy1f995i3W6+GBclKZ51XqGniPkmS9LFL4AFm
	Lz3aESXM7GcmeLai5LVhbdU8VcVBoRrRr4E26QadDZtZJpKVAd9wbhLHrOlUsp+E
	Hmz/9T+SxmugnXCJak0c0vDo1a+4oM1tq5fBVGc3ttiwmKgz1G/70IBqjMJNCBp/
	FpxWLmOF9AvKfLDUYGG4EmK0l1B+fTja+CE2XVR0UaC/OuiExP3oTfeenkekjsGJ
	G7QxIg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax83fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:04:11 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67bb5810407so34301958eaf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773417851; x=1774022651; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qoIt/c0c3o7wTtS+reA6lWhErdA4xTAVSkX0IZxKwL8=;
        b=h54S3c1NG05mLoBcf7N5P3CKbU77Gmk0tgCRyH7H+vmkjdcU+3Ue0xt3OdO7risKEL
         hHZGIC2MCyNb9OKyJZiT2oxhkN1z3PtOBS2+cWJguHbGWfTgZREKSsCUXLUZURMNem//
         /x3GDqv5TbFLsqseCT1uXP8sYcqN/VcIOPZltCLyUU6Og0L09HeRbtgssIsaRa0yTEEl
         tDaZYK9lbvZRyN393RmQ35/AdhDragkQU4SF6aDmkngIFFf5UvSO5tuMI080MUodpxD3
         3ygLM5ueWgjHtWGaPrgPlD9XnqMLnuD7Wa5vue1iMZerMiGacfW4/TRshLyek9qfPdqE
         NN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417851; x=1774022651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qoIt/c0c3o7wTtS+reA6lWhErdA4xTAVSkX0IZxKwL8=;
        b=TU4TxX6Yqw4LxWdNK/zjvpI9fP78iohq0uKVr9VpiUU0zR9eV6v38QYxoxfZZQaKXr
         9hR4WQjqTdMm0zGLIGzF/SijpPKGZbghOM9UrwfqkRyxOUIOJiFJ0ymGm+Hw2TsFtPrE
         izGdMj2oAXILs/aAIa0KWcxqdDnzyNijvLHmPMDIXvF5UiBoP774cBvgjMZ2EuiQlhT6
         QYPi/8PgDcYjn7lYSVH2J8BPcesLeNtZUigprUssMD4qHlhbc5TxSGV0ZtnAnc2TU8K8
         GQ41ILqvs7bq45b4TZNn4IfhvX3FUlsrO4kqboao3p5hP1gvcwiWauAoIh2u57MEjRNo
         7j0w==
X-Forwarded-Encrypted: i=1; AJvYcCW4szt/Sn/ztmlJqvnWqT1t/iRiWo38AZCqJZDbuBmSDVC/JwjRR4m+Oy2rsAVb5ny5Y60N5xNC76Jexg7O@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1SbfGuDIaHTLL++oDtvj3zw3fo3RQMKby2Ai5Dx6LpDBWKIlz
	Y/Z/vyRdkzHM46IaCq3JXYlRIBR5Q7QDjvkOpDox2eayuw6CUdjL0NYYtW1/IX5kcL8UsGsTIbR
	q5evrEcwMJr4KadpuHsOOt6AKCyzY1Yx2st+ckJcK/BkyT2k8bCSkoo6hJw5SZApSst+5
X-Gm-Gg: ATEYQzw6LBql+SxkeYViiNQcvrPjURB5gs50gBOFps3v8ci0UKjoW7v/0OsfhXiCLEk
	Bf9LBHfEEffYRUTfNEUhgSOUeiQA/SQBgamEZITshhYi1YttYLIqRmnBQca8FG++8vXT2NbZpZz
	egc6UMiV2rb99YM+aXsqG/4ecjIf4kt8lQWNgmsrarsyil4JgY78UasJOT1ertbvJF29le1eDw7
	q7Sc/iU71YZRLzaQ6nLcw+mitK/hAH83l1I1LP/sLEACXxEpFmu3vkMVzpSSFthcvyxQelePFUF
	Of/tOf9Lpwtpln2n6SUztmV2wu5wxW/b7Z9JOuOEcH/+LKc7F0tERehoNiECz47N+/RdPATOekI
	qKDhuBRouDtNMHTrlmgpGRckQmEPbuzNpT4BEOkhrT5Ry7tCtf6EtBxDqYPnPdp00glKJieRzEH
	sACKSIep9NNrvD58Pqq66I0OZRClAgMfwsjiQ=
X-Received: by 2002:a05:6820:448b:b0:67b:d301:862f with SMTP id 006d021491bc7-67bdaa5ceaemr1871689eaf.50.1773417850673;
        Fri, 13 Mar 2026 09:04:10 -0700 (PDT)
X-Received: by 2002:a05:6820:448b:b0:67b:d301:862f with SMTP id 006d021491bc7-67bdaa5ceaemr1871667eaf.50.1773417850160;
        Fri, 13 Mar 2026 09:04:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a96565ecbsm1475181fa.41.2026.03.13.09.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:04:08 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:04:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: support Bluetooth
 over both USB and UART
Message-ID: <liap5tu5lpmwprmvzcjutp5kyulq7lyddrhfyorokzomdwfzdu@zscyzbg5enzj>
References: <20260311090921.1892191-1-shuai.zhang@oss.qualcomm.com>
 <cffdb8ab-a293-4535-860c-378a4b8a3d33@oss.qualcomm.com>
 <97a3f3f2-e9e2-44ac-a682-0e0f0c100a45@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97a3f3f2-e9e2-44ac-a682-0e0f0c100a45@oss.qualcomm.com>
X-Proofpoint-GUID: -HflPrK8rgVzv6gbrZ3EzHNp_HNWEoC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfX7VmloUqGY+5f
 87Eln6Q1PE1xNX+rc424+cLgYMOUfUMWWhKlQOc08flVrh05nNqk1syMFjwLKIzTdlR93lcfejv
 h/rGrUdYxFePqVHot25ktOzFJJNNL6aNV3zHESicy/z1dLXTlHGvbIOQ3zI9PZVBWtLHfj6CjbB
 7bTv5XgHryfNkabvHFnvi8cnrXj9c3j+nvH/wZZxrgo5CJ1Vt2FhUxqqWOuD+cGe0Dobp6Qt4ip
 hFY1aMectL0DWE2DQJMyw/+EiyVPT7o90KrpXLQ8Wz05HiwSO+yABQDV+pjDOmhMGLWwtcj8xKI
 bNZ0UY3rdRR6erVXyjcml++c2VKsHeVkSQlQjPwiHM7juzZoA0wM5kBLZ6Lhw2YeWmvVu4eaHH5
 mBi/afBo8rMrv1FkbVGEqtyscVSVuyEoMHMiT8KWSYuh7raIhhbX2kUocax4xzhcbUzCJyeBbwe
 GD5Gzftp/wk2VTcZuSA==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b4357b cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1xRLyjFezCpYc6mQBXgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: -HflPrK8rgVzv6gbrZ3EzHNp_HNWEoC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130128
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97574-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 47CA4286B9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 02:37:39PM +0800, Shuai Zhang wrote:
> Hi Konrad
> 
> On 3/11/2026 9:07 PM, Konrad Dybcio wrote:
> > On 3/11/26 10:09 AM, Shuai Zhang wrote:
> > > When Bluetooth supports both USB and UART, the BT UART driver is
> > > always loaded, while USB is hot-pluggable. As a result, when Bluetooth
> > > is used over USB, the UART driver still be probed and drive BT_EN low,
> > > which causes the Bluetooth device on USB to be disconnected.
> > Is bluetooth connected over UART *and* USB simultaneously?
> BT uses either UART or USB, never both at the same time.
> 
> On platforms supporting both, the UART driver is always probed, while USB is
> hot‑pluggable.
> 
> As a result, when BT runs over USB, the UART driver still probes and pulls
> BT_EN low,
> 
> unintentionally powering off the USB BT device.

Could you please confirm if [1] would solve the problem?


[1] https://lore.kernel.org/r/20260224-pci-m2-e-v5-9-dd9b9501d33c@oss.qualcomm.com

> 
> > 
> > > Configure BT_EN as a GPIO hog so that it is controlled by the platform
> > What's "the platform"?
> 
> hamoa-evk
> 
> 

-- 
With best wishes
Dmitry

