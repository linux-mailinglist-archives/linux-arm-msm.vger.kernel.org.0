Return-Path: <linux-arm-msm+bounces-113782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WAOzHm/4M2rMJwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:53:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801F6A0BAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:53:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fr4yZnyp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jDWl5XAB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113782-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113782-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76E073025B8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C17352C3F;
	Thu, 18 Jun 2026 13:53:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB433AFAFE
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:53:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781790819; cv=none; b=nIyo8ZPbDmFYYOLikB16+x6hnZreA0gjH1nhKvTTCaKyzi6BNXGGOgMgTkg1yhbvkF9/p+Ro5ySh8nl2KtDyuwU1qgFURRj8Yk3bCESfDlAzkbLwlXDTKtgCiskzQaDp3eZAFPVBeNsUNIyinw7PEyqV3z/EjiBeceKl25A+BNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781790819; c=relaxed/simple;
	bh=YexXBNpmnYxQOYftmqOU5AbU0jmyopm9YUYHVCseLMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHFjSp/1gEZMNtxGRCUPkiJd7eZ7urnc8iGlyTO0r8mENEjGHtwD1qy7zM7xbjDnZN9Bpk41CdvKs+umaRO0Y04HY8nJNtjArCUhJu11h1F3j9sFDz/QNnubFObvaLcp3eHbVfIoOTpP+kKtsfv2F7G6pfABDm7fJUwD+7IW6qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fr4yZnyp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDWl5XAB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IDrbHN1376506
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uas64FM+4sh9SshRHLFz3Gu9ZCdvqAdlS160bV7fnpc=; b=Fr4yZnyprS95rQZi
	3xt3uWeSHavkO9BfcZ3YPjtFNtBAMLOo6PaRWB9k/eIJgpUJLnkWANEASTI59VbQ
	2+wAEe0cIaoxHzI/UKHiUvPJKmep98/X/cgMvMYZbkTRepYe5+GfObEY7YIeAJwz
	2MDJ7dm+Issw6B+l/C5h8MG+qDW9I3ddeNkLmX5p5c30dgEpQXnOkzB0kuxRAg/A
	kRV62wTST1lOLsfzOJhlPt3OPaVLxFWkRoB5RvYDwefDQdyVY//suXQpAMM148lx
	NVrJjQg7qrk6Wpy+hcSz5lMLNMgx/7QVtyvTJpSz/h9xsXRO79ySeuAtKjk5iLBW
	FtbNMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evdn40y6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:53:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915737aaf0bso18791985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781790805; x=1782395605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uas64FM+4sh9SshRHLFz3Gu9ZCdvqAdlS160bV7fnpc=;
        b=jDWl5XABiuC5LUbETelDS0WT8urrIrQwzZaI6WelGeRknd0fVjCqd4fTMCuMIrMsT9
         9kgKKEg6KyAYIBT73Z02eWDHoQe4SfO91GxVVdB6KTAu/Y+yQ4f455QOIKUMrNICUsZI
         ek0dlwlxrF7VUf+xw+90tONofkMbix3y6VkIh3rmXUWejO9redR2PvFdls8YtPqAker1
         UDBPKNXRB0q6AJ7E7cZtjnGmglAZH/PzeGxaq2t+3ZwecVdVXAmRfC7QvO8H/aeLK7YJ
         9ef/vCdz4BeedKWePtMW1wSDj2kDnw/8WRemtBChtbEgqFWiYPw/4y8IHx54VkQUb59c
         2Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781790805; x=1782395605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uas64FM+4sh9SshRHLFz3Gu9ZCdvqAdlS160bV7fnpc=;
        b=LbQulkEyzJM8BzFlH6WfFQznj5gHLlWiPjvVo/01oSIFDYwFa0yYCF9bYQaRdZWOwh
         qOpCumLhz43vomfva0vAojwoEd8CcxNj+zKkM48+OPPuosLPU4nl4yvNXnMvFeNahcOA
         pSWCkAxR+rzMSUsJLGtrj9ejlzdsL21MGP8eScHt5JNV5vAVmCdfz7ZL8fhkBvs0MJAx
         Mk8KXHqXsoxTIGS8TGvwzIUSa+FLrF9aiNOYgqrDzm5nFqoMiTtCbjwzLy5s+YtIg9IZ
         7wvqNbaaFV5c1XSau0EpPxCVExR97pKzVgMRQoncu/H41oOFeAh3Lo5eKg8nq7Lz+Btv
         ppMw==
X-Gm-Message-State: AOJu0YwrV9LKWsfmCM433a5pbrj4DJRv/7VRV2OABiT2DMRbPQr7TcmF
	CWZ/Ps65NxceclPknPA9UhZpNTrBTvxPZqETRuG4J4lV+1qcfWnuMj3RYMtPU/svWx8FHFy7CtX
	K65wugpXdYGP+fSdrYMrb3yhJNiscrcsV2PyBuAg6qY15kAwxsQA0epT44B5GPuLmccly
X-Gm-Gg: AfdE7ck1gJjoyg5hhS9nh6YDyFkzYAr+6YbuTcnM7nKgT3Hgv8Dob5yAA6Su/qNj/df
	834DHgdEQS78+xC6dqc3SYK2IOL0IslSuHj4B0xo6QHVKUW4Z6Jjlgh04w0RJMtwcrjZr4X65qF
	xCqdq12brNBc08vOKVH2lTpbzPZh45mer9eQR+lMq2tonHyTVl4RRKc4/PIgCnXLXS77qVcfWLz
	+++lcUV1DbQLPWC5wQF2ayN4G+C6SZajegPVfxf6JNKFsSzTTmLrWaGV6MursRBlDY+NdDiUDrs
	JjTqvIHamP0/aGxikG69+b/myQPkPSg+ZeC+jfanNlKyOpdSh5PWTASgTAhrocSH3rjk46Rtav7
	e7yGoBqcwykJGj+Yx9dwLlXVnkkcs3HtsfNI=
X-Received: by 2002:a05:620a:3909:b0:915:54b2:582d with SMTP id af79cd13be357-91dbd00a095mr848681485a.8.1781790805514;
        Thu, 18 Jun 2026 06:53:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3909:b0:915:54b2:582d with SMTP id af79cd13be357-91dbd00a095mr848678585a.8.1781790805107;
        Thu, 18 Jun 2026 06:53:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6960f9cb62csm294872a12.21.2026.06.18.06.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:53:24 -0700 (PDT)
Message-ID: <62c91b74-ca1b-44be-8771-669aa686ddbe@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:53:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] remoteproc: qcom: fix sparse warnings for __iomem
 annotated mem_region
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430191253.4052025-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyOSBTYWx0ZWRfX7N2pnqY3z8s7
 JFeqUfv9rgYK/oXBcGaQN101dxAj9AZdumpJ6oH+j5h9WDdjJsDwWy1mWABMnnQnpt5mo3mNvSV
 vEMq6hbuvojM3WNrowuS/1RZyXsBKDJHbnARG/zxuJm4b55GHJ3mXb1USyD9cUQwQGb2VcbbEYl
 glFcf40FbRENe3jw1aritk43oJhAh4F0y3c7Rk+GyRLA5UidKrtRH5vT6kTSvs2pmdwXz/pmwEj
 xHXZpPM0yjTmuhabBrazn4iKgwuqUMFSTZ8Db9uh/Zhz7L0WjWCAEqN0RMTbQ1RrDsqKHP30HSI
 5W1Kncrubwmm/3kbB7NeEmlodn6thn7G3lzRS8gLyvkFn8nrD6VIftvunmwLud4EiHPtIjtvL+I
 vG3pNl6FLTGy9u1qodkrK/GqJ00Fd8HjbtEaJ7KGAmGqhc3qKNrXIUzL26OH7Xe4X53pRo3IAJZ
 9gt9AfacOMb348QhiEg==
X-Proofpoint-ORIG-GUID: lqtULNintFU6i3H0cbXa9QrkGIix_ooS
X-Authority-Analysis: v=2.4 cv=FN4rAeos c=1 sm=1 tr=0 ts=6a33f857 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=jR6w9rUPJl4JbJ96X0MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: lqtULNintFU6i3H0cbXa9QrkGIix_ooS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyOSBTYWx0ZWRfXztx0g/U4Ndf+
 u2wy7aJBOZl8mydOKEGcmo8CdlbXYYmff74Nr8ZQERRRQjJdFyjPnEq64d7K/zYkDiGydWhIhgr
 2qdloiCJI9kS5qzZS8QvrQrK6WR/ShA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113782-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1801F6A0BAC

On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> The firmware memory regions in qcom_adsp, qcom_pas and qcom_wcnss are
> mapped using devm_ioremap_wc() / devm_ioremap_resource_wc(), which
> return void __iomem *. However, the mem_region (and dtb_mem_region)
> fields in the respective driver structs were declared as plain void *,
> causing sparse to flag address space mismatches:
> 
> qcom_q6v5_adsp.c:639:26: warning: incorrect type in assignment (different address spaces)
> qcom_q6v5_adsp.c:639:26:    expected void *mem_region
> qcom_q6v5_adsp.c:639:26:    got void [noderef] __iomem *
> qcom_q6v5_pas.c:141:45: warning: incorrect type in argument 2 (different address spaces)
> qcom_q6v5_pas.c:141:45:    expected void const volatile [noderef] __iomem *src
> qcom_q6v5_pas.c:141:45:    got void *
> qcom_q6v5_pas.c:637:25: warning: incorrect type in assignment (different address spaces)
> qcom_q6v5_pas.c:637:25:    expected void *mem_region
> qcom_q6v5_pas.c:637:25:    got void [noderef] __iomem *
> qcom_q6v5_pas.c:654:29: warning: incorrect type in assignment (different address spaces)
> qcom_q6v5_pas.c:654:29:    expected void *dtb_mem_region
> qcom_q6v5_pas.c:654:29:    got void [noderef] __iomem *
> qcom_wcnss.c:540:27: warning: incorrect type in assignment (different address spaces)
> qcom_wcnss.c:540:27:    expected void *mem_region
> qcom_wcnss.c:540:27:    got void [noderef] __iomem *
> 
> Fix this by annotating the struct fields with __iomem to correctly
> reflect the address space of the underlying mapping.
> 
> These regions are subsequently passed to qcom_mdt_load(),
> qcom_mdt_load_no_init() and qcom_mdt_pas_load(), all of which take
> void * and use plain memcpy()/memset() internally to write firmware
> segments into the region. This is intentional and safe: the mappings
> are write-combining (WC), which on arm64 permits bulk CPU stores
> without requiring the memcpy_toio()/memset_io() accessors. Changing
> the MDT loader API to accept void __iomem * would be a more invasive
> change and would affect callers.

Zooming out a bit more, should we even be ioremapping these regions
in the first place? Are they not just RAM/Normal Memory in arm parlance?

Would switching to devm_memremap(, MEMREMAP_WC) (like we do in RMTFS
today) be an even better solution here?

Konrad

