Return-Path: <linux-arm-msm+bounces-103159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFgEHW9a3mmLCAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:17:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4213FB9C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52A9530329AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 15:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A3E3E958D;
	Tue, 14 Apr 2026 15:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbYhIVGT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBqx4iQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AB1358375
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179775; cv=none; b=SlX1SUkFNgAq5bXDT2v9GuJWD6cD4WvOvC0s0b9wXSwPT2QCOUEazHoi7Q0aPcLqZyUXDL9AfCvDcV6bcjCoAOudyC7wUSM3DBy2PrIwYScPzZwRrigGg61YUmMY9Qbyma/xmKyHkbjfQuMJJKl38vs6T4h6ldate9v684xKHUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179775; c=relaxed/simple;
	bh=GudSgVh5zGLUJIOGCDbMHamjSv/lulJ9mtwapINd6Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paURDUe4VwBoFnqgLjNpWM8OGAJ+V26iELUwi8PtA0c3rZWDlSSKu6iJC7tQq7+mvE92wW3xlSUJvMWoM6RfFWQ5GMjQkfVjYueuqCMjt0OMxO9e2MwkNqBIE0NeSiGJ61II3ih+vqtxpA85ZyoRM6h4/o465bImYS5VZ/COlik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbYhIVGT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBqx4iQu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBLGAK3505294
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y2iIaBupa1ZFZoZaC493mfOp
	0zJnBLl7xcKpovJeqPw=; b=QbYhIVGT6CYES30c+BcksIQO4IoTyS0q0AE9Rgk6
	jbF6f6NtPvwVCgHojdo7aoSf1LxqwpLYwszQZsO0f58ixnO5TKRVjtSK0ZIzlqGM
	xgjj45B4VmaZn2fWZFTWWs5SYbKO8qJWJbqrmtY1G4Wydv+J/eq82EqAaxclu6Tp
	NHsqDvrc3HlYb2mQy0zNogC4ZW/qGFAIDnpguGH2lAbaH6RAJbt7mR0RD7PGIJ9j
	rWkJUvYlLfYYYgi5prNfhOK1qUYhfY3NmW40K0yRv4AH3KRp2J0aTz5nmH+XbPbG
	TIsPM7Ynj4n5uVAa/SGOQBWNbo6B6wQCs3Bcsx6KlUEGug==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870kb2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:16:13 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46f083f82c7so9346112b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776179773; x=1776784573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2iIaBupa1ZFZoZaC493mfOp0zJnBLl7xcKpovJeqPw=;
        b=LBqx4iQuXCnI8twknCEBE7pSQP1fRPck3EGnISjBNe3e20JzPc/VxFFw8W13XtzFpT
         gxTN9NpS29FGSu0z9peEKrdSOPjDxc8/8qMKKc8bTsgTkTC7RRv4uVfAkxpl8/CWJXYb
         zdBWh/TTY9izpggStAL6ncxt9LhhpnTkitgF4VM65LDirPFT3oLv/Tk2gu1r7j+VNLn5
         kXVDWh4wdGEkeq0SOgYVUxFwExyAgL3mQC1V+uT/8G8wJ9Nauj+kfzXFWdCzHU/9KzSD
         a2KhKKZQNEl5A8j8GMd8B9k13j+x1CVzyfNXzTR31b370OAEd/RyGYtceywZWEzIz2OX
         zk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179773; x=1776784573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2iIaBupa1ZFZoZaC493mfOp0zJnBLl7xcKpovJeqPw=;
        b=eBqRIueV50VfLkMtQaetodReuuPB5YGLiB01csTuKiVfRKMCSUGYSct2dEGB5bMBLl
         hhQ/u/xEbz9sa2NZKjAj5AGFAhsd1VP+VkPyTbhh30kW+diDzuSy6+7J8E1+FQowjATI
         5JSHO/KtUryKS3ZiR8E+Bk78g5PZdVsP2SbfrN6Hc+favuohYKy1ZaM5GqnkSFq6ROHm
         CIlM8H2DmAVMmG2tjf6/sLdCDFHfDy3FYstPOu2GA/zidu2J8QaHIkFLAzM3H4y0mgcU
         OQziHz83xI2KLP8hCwrunio1HDIxYL31LlgSpOn969cfUT2K+IA2Eu6bMyU7jaN4fRnj
         Ya9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+PAdsxlBep32emxCyGfvX1auNFWBs/fzDMXdAQzJmJJrm4UBEWMxSzd+pLPyra+Ju4QlawvFzIt/5l/XN+@vger.kernel.org
X-Gm-Message-State: AOJu0YwPNWHEzsCqgVA0RwlrWu5aMykTBfcS9Iiw6Qz/On6doPppodJY
	TmYoSBd9pJu9Eo+IAHWHIVmdNrozL9FDjE/zN7uyAzLKW1ui9W96jLPhLB+NratjCvanwBwIpKM
	+ROSbhO+1WMmdyq/YH5n/xni4R+GFeoCzLCH91IqCzl3nN9QAYcRBqLfqiBRY/O7Mt2IQ
X-Gm-Gg: AeBDievdZllo01zxdlZAppvl+dVvfno/xWS67FeSOZpB9JVpoBEJQ4AA/eq76LllTua
	bVgUL/qVFmBEWWBE1Pd71/qUOd+/jCaaozG+c1OkD/8lFkEe4EMBPQBrFX3SMSCNHYNaVmSheyN
	aRasLMTtKQKBM2TZz1VhxkBNfWr4Yr3O4326NGPRM9Qor0llMb3Mt6uEvbZZ5XdbGHZwWJJ8xrg
	NVWT/blyd+Rdmh3QW61VLjohB1qHttr15xq72IoUn8RxenyPqAsmHDpctmSOkoTORcYNxSTSp0E
	xDSNN9gnWGAExYB96gHh53VNkAWNG6RtKJ/dKWxC1HrcN3mkVTdI/Kl9iD7ZdzJpbTGh1u9eHFb
	CXb289YdIbHJfJlhr8fFboBYZ1Fb9Ku2NRHfK2vR90V870Tw67t0qpKb5pFrt2Y7Wht3jrGp57R
	dfpCa6wB86l5DmNVBYuMRLAINxBe2xjgyVxuQ0HjOObsILKQ==
X-Received: by 2002:a05:6808:f14:b0:467:f56b:5267 with SMTP id 5614622812f47-4772a866badmr9869330b6e.10.1776179772787;
        Tue, 14 Apr 2026 08:16:12 -0700 (PDT)
X-Received: by 2002:a05:6808:f14:b0:467:f56b:5267 with SMTP id 5614622812f47-4772a866badmr9869302b6e.10.1776179772241;
        Tue, 14 Apr 2026 08:16:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40006d23dsm1131145e87.25.2026.04.14.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:16:11 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:16:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 03/11] media: iris: Add context bank hooks for platform
 specific initialization
Message-ID: <3vuensoscjzsjuh7c5e3jff5cej66iwboiau7vhnpvtmqevexf@ouox5cize3fn>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MyBTYWx0ZWRfX+jeqxu2aRHZQ
 vFBosQIo/KiARiDJhW56CqVU88lhKj7ImXM5vVkTaZul2zDm6RuOvs9DwY4P2X8itO1ZS9GzpJY
 pheQUfAkTioppcX1Li4XtZXi244J38YdyLl6Ta34s8NsfY0/8I4Fsy4Z6MmmY496gnZQg2ajBUO
 JYPHzW1icLSHOERqAKlvPQpksA1HA10ZluI8QxB5kj/CD33HTXCEBarVYOq5xpcW5zDxdTqJ9cE
 QC8c982DFgAcsY3U6xkLpoU84n6OHDIKTgozuJrezaSL+eDys45boj/qwNL5FEr+9nOIVgGV0D3
 a9xHgaLsUpZOng0cuVzFC7GIweLT4osrrJiwZR85vE8K+c+XuSAcMz3uJTm5aD7cCUA5KgpMQ27
 QrDrYmGmY1Cr3Kmu0rYTM1hYE6Izbjz8ikW/rgT2pET2khUy92A+mNukcuWeTzHIbGIi2veEy9i
 5hS4+GzSH8Rgkxw4MEA==
X-Proofpoint-ORIG-GUID: tsAcUIxnfMV46HBtvneSWuZdlIdcUOhR
X-Proofpoint-GUID: tsAcUIxnfMV46HBtvneSWuZdlIdcUOhR
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de5a3d cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Y-W-850UrnaCaRLArZcA:9 a=CjuIK1q_8ugA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140143
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
	TAGGED_FROM(0.00)[bounces-103159-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A4213FB9C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:29:59AM +0530, Vishnu Reddy wrote:
> Add init and deinit hooks in the platform data for context bank setup.
> These hooks allow platform specific code to initialize and tear down
> context banks.
> 
> The Glymur platform requires a dedicated firmware context bank device
> which is mapped to the firmware stream ID to load the firmware.

Change the order of paragraphs. You should start with the definition of
the problem rather than putting the cart before the horse and starting
from the solution.

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

