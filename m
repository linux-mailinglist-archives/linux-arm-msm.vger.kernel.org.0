Return-Path: <linux-arm-msm+bounces-111512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /GyoNL0WJGrF2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:46:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4436064D816
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:46:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="O39W/cMb";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bc9FdYUg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111512-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111512-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A53D93026884
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE1E3AEF58;
	Sat,  6 Jun 2026 12:46:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFDC3AE6E5
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:46:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749964; cv=none; b=VDpH4LwSaF/bSwsOqpBI5jOCTubScP3NSFIhMH6TXZfDG5VVyOvRNbLmHhOXZ1TV6rtZNgscNrYmxgGLJObPOaPMCsKsYz+su6mks1HD6L9tOPUcRkhjSGM/wsUnnja2hTl10lAf9Dk5tUXK6dJJt+GJ+GPTaOZbcE68Fc0Mppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749964; c=relaxed/simple;
	bh=pc8EHI9BMBuc7BjdgJHx1xQ9FLAmDHcccW4NFcZ24vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcHkQB7nTv4J4kR7wamlMI3ufC8Sk+g3HPDx2WRpnZfsB9GOgn/TEdQpMdeil5dgRoF3BeEAw3dJ9Gw6cR7tmFPUIEboPTzm8baDcnJ6JQHYxsBscG85PMwf86qScm0w8STWBWEJaOCWTDAEJ+pTMnRfnTLTxa2rS3sfJ4HHdbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O39W/cMb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bc9FdYUg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDQj41326979
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6sg4LNPX/0iFwJxDV4MhwcZf
	2oXBafEdAV38XLdgyTg=; b=O39W/cMbgPpbzRhatwGVYL/obWJp5emy3OG/yGNP
	7ePx2Oa7h9BdYayCcE9AFIqXW4C9adJ4Ej52LSLGEJDHZTGtfnCeKFnmTO+9U3VK
	8hJHWkkLoWsRcrATRKgrLYuW+j/+TfCDS2TfBwRvQeMbvbxm5E6LXdIa8PLCEjt6
	zjBW8lUyyQiO1fc1smz51jo89K7nG9vsLr0QQuAEKaii+vTu0+DDAohFjGZrI6fg
	qJ7KRbznt3Zf+T/+B0NJjU0Ct6l+QcefWoB+3DVnDlimL+O9y3S+B8gs2nqAv9XU
	ve+JCSPpUhUxZivj1wXZF7s5pjAbOr4uL3AzMAWp1qEALA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8ru9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:46:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96387f0ca7bso1094029241.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780749961; x=1781354761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6sg4LNPX/0iFwJxDV4MhwcZf2oXBafEdAV38XLdgyTg=;
        b=Bc9FdYUg+3d7BxZyz5npQ2qA7G1A9sRsSp+riyIHwFHLI6uqV6aanu6uI0Katekp5Z
         bJOSQkP4kUJ7SlT3qTVz6HpbUBwWjSGYL5ob3X1N6A7MoebySzGjgwXxUWkK+eLZYV11
         IDVr8m4EyWO64Wl9NoxvQiLC9Tw3NiufwZPiQSZmV5dsQXX2yBqMdWu3Fq8oOqaiw6Le
         ILPZdxDi3a6nz/VvA7qlf234fPxJJxPOkxgSr4oTxru6NMB3BSsuKRait60cmYhF0EB7
         RUQP+LLemFlbsBMdC9ZSlLJpiGf6bTztL+COYe+DCfXN6ehaU6FOwMfzwskHecFPfhEE
         PBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780749961; x=1781354761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sg4LNPX/0iFwJxDV4MhwcZf2oXBafEdAV38XLdgyTg=;
        b=lBe0hTzGOPvVTHCecxAbkWizu6pkhWgihTAcuXjN+xQ6ltjA+e6kclnsdWcyxC8jCi
         mfzAIr5FwojGV6oOrbDRaEA3xyuNeZz5+ssab2oL5BZvLVJVU9GR/G87m59txrs7VF+M
         pW71SY9CD105J/E+U4hUEIaUUHnyvJipxXZx3BPx78nzjZQDXJ6dXA8UVuSSbPy5+zK1
         OisuqSXoMMUmFHnYl92W3joQ0j/V0hNcW9/ApL/J4XYhGOsrRCHs64E/XtWGy7LJbD0Q
         ipc4S/VUq6ixE+LMwoCJ1b9vnZWPKzYZWH6fWUkgywoU7K/BNrbxBDotZdtT3f6sqLtM
         4C8g==
X-Forwarded-Encrypted: i=1; AFNElJ9YZ3Ah4aJUhJaWcOaXNeFm9QrWTcObwYkEN6KJxveYQyZwbOJNy5VuChtUKlEFBT2Gr5l4CP0n/mdsBP4i@vger.kernel.org
X-Gm-Message-State: AOJu0YwUC4U/K5gnHIBHytDNgL4X7MgJeNxeq1jGiKb3jz6i3NuR2B+I
	D+59KcvaQmh5qW7TcBh7cirtW8UUWvBbIWLGTjbj6jaeVRARTXhDEp03D4qS/QPPk2LGIrwbwZU
	wubHs8D/pD4rFSZCvnCTYLR2IjOOB3EWQoqOdAQXhXiMNOr1xzOQ4czBuxtlQGGXEdylN
X-Gm-Gg: Acq92OHO4NoGESp8b9RNxaWEe5AgbBDhmIDB1uvuasHctRD/b1q/UBmfWi+y8E9FLoZ
	4gnuJxY+60iS+OyNkCz9QMM6PcnOa+Y9xCvo+h5FSP8QlGcxTatku2ZvJFDlmoWEswJ+xFv3wyM
	ZhETsb4ONKyVzSttGcJcyHMQYBx7P7KSkinGitnke+Jec9kZhTMh8bCBEtpV83DxdjSMG9XIG6S
	mXU4mbZDoJXMZrPngCeHJ1tgnswJWricflNlxIyl1TkTxvSxcPcoYIpk19j9RF6mk2Qdr3WbEVo
	dJxZ0tnwPw6z23axMrivV/1fC2gLsYJHc9i9zB8KQ8eq+NsaJsbNVezqFglvu2yGBSl9YW5SzH6
	Sj24dvEaSdinPp9DUydrDqxNDYr3VTU6F1lDefkgTBkgnlWPB0XvDhI9qM30d3Wk7B1RDgs4zo8
	+24rcG7SwYuLj12ZNTh/xJ/5broW3SmdR24M45FXEkvrHFew==
X-Received: by 2002:a05:6102:c08:b0:62f:39a9:ae67 with SMTP id ada2fe7eead31-6fefa8ecab5mr3893482137.17.1780749961332;
        Sat, 06 Jun 2026 05:46:01 -0700 (PDT)
X-Received: by 2002:a05:6102:c08:b0:62f:39a9:ae67 with SMTP id ada2fe7eead31-6fefa8ecab5mr3893477137.17.1780749960954;
        Sat, 06 Jun 2026 05:46:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be2absm30620321fa.23.2026.06.06.05.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:45:59 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:45:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/10] arm64: dts: qcom: shikra: Add SMP2P nodes
Message-ID: <xzh75zc7mpbqkqwqze3btcrwt4355tnty6k3l6k763f2jx3t6f@ql5ml6hdxkzf>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-6-0fe3f8d9ec48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-shikra-dt-m1-v3-6-0fe3f8d9ec48@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lDiaGWmOW6Jm1RiXUnEDJtHgW0IUtMpk
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a24168a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YUvwHg7a0UAiIoF5iVoA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNyBTYWx0ZWRfXy+/nWy272mJ8
 oLXeIN7is98Pne7xg+K4BIxxJtwLh2kd7Md3CbIPXkwE8jAb+yn/XiMgaKJ7jNgrsRYp//L2lID
 24H8vTr7A2LqkWQ/p+k30c4Iw/CjUvYpExVqh6XuKatdk1xKz1cMKeuzSphvLN6HSdpUbsCo0iw
 nq6gJcRVJJyCgnQeeAf+Er8fhq2LNcdXJmMhwC5Yec9scBpriiavCK+AhFZSitpaYDMyJ9HKBTA
 imu/+I5i+67sGCv3rqRP46Z2wuE2CFUnEzM610its3D3zEPrlh7F7e83yo6cbwOKdSt8vELeD49
 nTxr/oU+cJDMt5wbd/lHV+9xfe8MdCXX+jxIvhhhjh6wQA2qbsSPlnP/hNzCuTuXkjkpKjxmQvi
 f9Db5Z4Qu8QZR1w1vbsb1qYu3lWfPbqjpDueOJxpWln/wMM9auxAvaPOHLpBBfK/mTEbfEGDuuw
 x1d4L4uOZCGrcKA9gKg==
X-Proofpoint-GUID: lDiaGWmOW6Jm1RiXUnEDJtHgW0IUtMpk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111512-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ql5ml6hdxkzf:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:vishnu.santhosh@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4436064D816

On Mon, Jun 01, 2026 at 06:25:08PM +0530, Komal Bajaj wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
> inter-processor signalling for remoteproc state management.
> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

