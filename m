Return-Path: <linux-arm-msm+bounces-111486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cY2vFMsFJGpg1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:34:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2AE64D394
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:34:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z0ERLxio;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aCWu5irg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111486-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111486-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2A603010C07
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B143390CBF;
	Sat,  6 Jun 2026 11:33:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62B638AC7E
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:33:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745598; cv=none; b=NtEJVDKLKfhA6oeUo9pgyxCU9P0W4k0pVQIzUGLl9GXiFsquKFThDn1h42nVMPBi7WieRwYAhKPxZVxpUMvnGfMGP8PRhSj/5Z1fb38fGZiKqiHOAMVkgq2bSO21UeSPD3mOdwaWUGmEH3JFtpRSavsSJEyHKiGnByIFiM9Xq1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745598; c=relaxed/simple;
	bh=G1TLb38XWfS4xZxB7h4mOgN2KQ7uuD/Hep8vHnneZEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TT783SkYBJ76voBJZb9scdUksGXCrP4VNsR3rEH6CZrqoXjMU0kLA6jIZV3d3XqZvi9AacMBdedujcLtOKjoCsdZhhwLnAj1YXDvAv33Cz5ncozFcuL5ZlBLcJcJqQWLv2s55TKK2BnXhc8QUQQlN7EXgQvlpwXuEXMOyrPEtZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0ERLxio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCWu5irg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGicl1301979
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nYbMhkKS6xw9b2c9donMphON
	nCoJY7folpJd2kFJroc=; b=Z0ERLxioWIz/zi7VhO2xm61p7BALWaRPRNpMVJ7A
	J9Du6k8ZBIvt8+6ZHgBJu3GYNvrZ+y49g/+3TdlwGds0Uyp3QmPNBYdzRNzwDfEp
	pSVqY4FtUGdlKKVSXz4zv8owFvhfN1Eg2humX4VRjIMbVPJfQKwRhmCHWb3oHZ0i
	XDuTAkq7bfdeAF08LkNdNk2GM/ZnT+nhUJb7m139uTkCGcItL8rdBGCaJDsOqLAS
	/ImCoYz1SJcnYLa53JDE92yBYIJ0TqbLll0f2EDLZQhbKrofCXWfjw4eBNV6XGlZ
	jVRlIbP9zirPDXBA4FPUOhgwrFdMUMIc2gg8lfIn9FS4Hg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx68ubk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:33:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ab02fb3054so1938207e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745595; x=1781350395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nYbMhkKS6xw9b2c9donMphONnCoJY7folpJd2kFJroc=;
        b=aCWu5irg9byI3wvYzEWQzOic5VXnf6L/cOSHTxFA/eHPxh/RPkFeD0EFsRpXa6523p
         mie4JrWgdrX9gewLkwiSsrOaDrOPjRk7V/kDQ9QAhL0hWHpeW6oOa9sPiMJe0snLo3JC
         /EwvPNgdrqyIvM3Gdffyn+v+HbQGM2i2wLdMOXJWeBk7iN8XPe902mWZj8xKNojEvw/K
         6AFe6LlWrPj2rYY+RdzefGt/Ipq6nAnLqRctZZwYJiIUVEMht33IOt+L6ZO1jb+m699+
         E3CtDv7k626xQmzGZyfhrj/Ns08DmWGmwCyPE/W4rS+QQlpgpI0og8lyOqOlmKn9xlhJ
         tQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745595; x=1781350395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYbMhkKS6xw9b2c9donMphONnCoJY7folpJd2kFJroc=;
        b=CDyrxSDbAdwqFZhW6ZC5UXtHT5xfIe7jNimUo+u18YILYNKSXtVeAZmIUGr/NIHlMN
         JfrOdwDaF6Jb/BJXVyCFPSeCgMa48KX648oNuhRGlTO1FJiiWYQ90rDm/lPzz6dp4YP7
         Z6cpgrY+xpRvqpxPLySUnT9N+ZMdMhk96ZKqdvhNe9GTumTT+HDaPzJJSARQ2tc9wa3s
         MDhK61A1t/ASMp2E0VsomAyYtw6aH40xxtW9bHHvvGGjgtuxfwJ34LyT1GNYn1SfXmnz
         JUG9d2bNdrp5kIW/1Hyl2tcehY+sTvzI8nzup71u7siYcyuCO1j12JfLx6LsSv0k9kRw
         fKgA==
X-Forwarded-Encrypted: i=1; AFNElJ/gnUAT3T7llKdyHy/I4rnTTxzZU6XLAL1wSivvRcPJr90Z71yTv84FSOYY6XdLdqORwz0ussktefIpfj+2@vger.kernel.org
X-Gm-Message-State: AOJu0YzzWPzkkVBVpHNKgZTsK2UsOQFQLeibdXVfIEM7AVs/Agku5vPd
	Mx/nqDs5pZr1xVcoREcxfqH3bICk1wyWOwwTAO9Pa1hUUzQ3H6jQHWbfTzLPankP40VzKWiqxKJ
	hMftrc4TYCiCF5ubU2TcPMxzpUCHFSpLVsjOHfkimL0si577NsG1X/ilyvgKIILZMmkxJ
X-Gm-Gg: Acq92OHI7aZLrp6b6JOZnOIFg72EIJ2LmI6YG0BQbBP9EEwofjVn53Qm6xqyDV7qp85
	1tjeafIVOBLrSGDChCGOnfqpGkqgWAG1jFVTZgCG3n2cEw9i3nK43oIkoron4bVLcODNGqugz13
	v7P8yh29mGYoXW/Ozii0tnaENb7ffktETMfzXr5SCC3ODuWoyNkJX8AHiZXIcX9wKtDn6eqy4Sa
	TRjmM3BUKvAv1W+gpR/DbGXM9YtcG8twC2OmsZDsJV9M9z4IWxHrSkEsnNhEUHvWJzI2ynhHW76
	EwFQo9Ta5lyD8jMkKJ52njd2xnH6h8YCuru5mjvhueCumMG/O4u8LRXzwDMiemmN3i64eXmIzin
	Yklb12wc+wS6nZvVeFihmwmu14SF29yv1BVuDaFAL/96MjTKRETD38DBmgroNqTHjKPVLWuszTj
	H6y5s0vz/QRMfaP4DRxULTQSHhs7HUU56waSa/cTZGy5RSWg==
X-Received: by 2002:a05:6102:580f:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-6fedea4018cmr3391445137.0.1780745595204;
        Sat, 06 Jun 2026 04:33:15 -0700 (PDT)
X-Received: by 2002:a05:6102:580f:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-6fedea4018cmr3391441137.0.1780745594788;
        Sat, 06 Jun 2026 04:33:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9903e9sm2375975e87.69.2026.06.06.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:33:12 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:33:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
Message-ID: <s6txrbldkuwamd2p62mg7atfyxurtsf6hmh4ryi4cufwbugymy@tqk4hkntpuje>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a24057b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VucFcp5vOwudSFc8DKcA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNSBTYWx0ZWRfX4s0inpyQvFCv
 /TSveDnWPKs4zgWuWETt9X2KR1CxPhJpm3/ULm2Qm9c9VzqNBc90CfApZsdRD7gGSyOtws62sKx
 6eR6szo+i+zIwpRhJwg8bp0Qe1ZKSrCLqEx6FEO35wuOwaKVLPQnRen5CSY9r3hJt3HfK9J/4zo
 /j1TzcFmPJkoYSm3Xdk9OZDv6pIEnYnw2uZFj//povblvcBX+qDIc07oNzOHeQ7bpcnu7m/XJ7E
 FY497aeSwV3TyT2LR4wM+JiF7lVhQ03nfkuqu+OXC2KYkH2ERT96DhlVL1TcM+cw7ykqJ9lRvLL
 ocfFg6ikiPTfogvvh3Lp8PujuOpRvSKbwkdK9NY5K4psSCu9iFqGq0WAdE8nBnNiZTA4OvIu/C+
 l7G2MQYU4RzszDx25vNVpDw/vjLXsAjfiLGG7SD/ytnVVx9GWlyB2kuX6jxi8YDLLQFm6VOrW8f
 4XFy8q7lzEKEJFBizgA==
X-Proofpoint-GUID: 06NDCu-YKbBNfywmKaQs2WiUT5PndI2w
X-Proofpoint-ORIG-GUID: 06NDCu-YKbBNfywmKaQs2WiUT5PndI2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111486-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,tqk4hkntpuje:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D2AE64D394

On Thu, Jun 04, 2026 at 10:56:19AM +0530, Imran Shaik wrote:
> Add support for Display clock controller and GPU clock controller nodes
> on Qualcomm Shikra SoCs.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

