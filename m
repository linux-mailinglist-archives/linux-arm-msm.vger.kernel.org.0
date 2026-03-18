Return-Path: <linux-arm-msm+bounces-98439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBPAKjCNumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:32:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8DF2BAD59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24B0F300B99D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBFC3C277C;
	Wed, 18 Mar 2026 11:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtiejN80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UiUZHOxQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9154342CA7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833516; cv=none; b=taSN4y4UWkb0hME+uqu+/59AZvjBmSN0x6G97+cUcY/NoP7nogWPdbzyoRL1Cu6aFlJCiBJs9CX28OqajXZ/dB7QFjSi5F/Dwn+RDJUpaJq3CLiDSui7v4R8AiLpDfYpz4IZpsH8emlyGVY8R0lqG5eJmC91bTyDd4yBdxZ1hqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833516; c=relaxed/simple;
	bh=8+i4NJEDvkGlnLwW1MGUNI8BKp71hpc17Dao5R9ojiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ez8zAvq/hV5e52drUQ16Cmxcesn2nnkrXzKZJANMsDvLHEQ6q9PQ/Yg9wXRHx1uVpbzqjpIm5efs1PukTJSrwdCftk9rfpuVp22gyaWO9bjUxW3isNWQC3Ppv2gixCsDGE+D/j7s4jLkq5InGZDdNM2pAGGCXEe4oCQvjKuB9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtiejN80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UiUZHOxQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6ZQf62878341
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLC8IJ041M587lqPxE4O1+B1gM84vZJXiCGzihxtKdU=; b=LtiejN80cRFwaa1w
	nCTC5EdgKeVaDZlblHkX1hXs+Y73YrzqdgNWwmNfECRxZ+oO0vQ9agHhfJ4PGsvE
	udBN12/G/0d+Ombk0udk1HmldMfgcDmDbL2atWiZp4DQgiz3ibw8UbY8HVKmugm2
	hGxUgQGlVvloEjL5LsKK4AakXaa1tUwhR1rOFgplFhEN6CbDOJIIbGvbTFjqCJ/z
	sQBdqYIOWN3nfEArpqNP0D+GbnjaC7Ob/+0lQwWuY983i/ECTS41FDbbbDnGHtaT
	9hdxx7oPziH5wT6U/YGqz+S+MHzfunAdlDHp3nj1Afrl2Hajpo6PWx3jjaCrvAyx
	cuIxSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr18vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:31:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad5fec175so327299455ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833513; x=1774438313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLC8IJ041M587lqPxE4O1+B1gM84vZJXiCGzihxtKdU=;
        b=UiUZHOxQbGTyjgrlvPhD4tKGOeGNEYwI0c/6IqWvYB5FObLT/qF0tewEt/YKL6tiO9
         SCygSdq3rjOYNzlHJHc/VZBWgzM79P1hj4foWo9fKzMlBO7G8k8s+x+uZo+xmx95+dik
         Ky90ZOAn1jzUiItwj9x9YPs27TZGwAKVfvH8V6Te2homDmMbfAkM8Zm8vkUOj7lCPKEP
         F4IIDjfZ6GqSmJ+wdX6t3Rd78PfBNqU3vIYcX6lfyf2jZeIh06Hl+4Tsz/xqVBpbZRBH
         tYHxVUhN/zJUAppdOjq/csziy1m6AldBpoGLU7sq6XIOU09lzVAL159/YEc1uG6ZGp5I
         daIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833513; x=1774438313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLC8IJ041M587lqPxE4O1+B1gM84vZJXiCGzihxtKdU=;
        b=BbEikJwRYUy/CqLKNmqnJLXmFl9GvabtbrKUUn58SqkXzr+f07ELXa3FKfWblGgPJ/
         OfeT1ectjJh90pKxKxxj3muosjLVUEa6F8aUUoYh6IjFWRxmZsgu/i6O3cueizlWPt6C
         O34F3vFHHb1A+OCCaqPKPJUJ+2DeEINtxQlEY6VcnRhENJc0+hiesmd+t9tGNimAdl8O
         0DoiRfwRvA0abIpuKe9PHRJJrKXWREjI3Z9+N23+zRH+phJzTCnZ6kGDMLePWrGl/jhH
         nvG4ifmQj0nJ/6AhGqYCX8+VThB4v+E0OrVIAUTF5wmQOoPtHAdJT+geHrd4qJA5YSJM
         zcMg==
X-Forwarded-Encrypted: i=1; AJvYcCUOA5kP7q4TU44SXhrdslJp62pRGdF1egkuVByCehWVEwYChtXN5P+B2TinZ/1LOc5xwLRdcAuOMTq7wY3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwTnvqP7Iy+2VQyUi7+T6makYxhslxuE4W0xGUs45aXJY9Z2lSV
	DRQWNJBuI5Cq79uPKBF5dx9V8F7xZFYPu4cNmJWFNFaPaZ+TfaQ804O3EENKPythBP/jjd8hXw2
	Q56SXIlUCP7sgkZgfoCisedAkVmlSFh8ZFjuEwrseZHwsxoiu53h1umpWN00lJrZNh9TN
X-Gm-Gg: ATEYQzy10/PnqS87xHwoIotOk0++aNLPIgQVkftVWsYZXeF8Z9rCyDpX0lPzODChsNx
	AswI/jq4+euiXDOBYJRRuTFX6n2fgZEiGTZlwGPAGoQrMpjr4Wf4oYMLykEtVNusCma0dST1GHx
	uQUUjNaRJE8/r7uEX8kCNYCBvKWwhXV6LMDDNAHijTAjOhcyOsyN2T3w5tqY/Nl66L/ybo4lF9X
	JRESw7W2Vs1ZSEgOveAcD3UJtXi22zxqgDVuJeg4ZzzpLF76npHF8bwYLcfY9Euegs307iBBX6/
	ZNVc3scGMcZU6BBt7oSY6yb7zr287o1pUzJI48RaGxkj9YoL8BzFVoiHod1fSRM1TB7KC+244Zk
	p6Og69V2hPXcMQi58602i+A2mqk0VAaeMZu1ecs9ixWLxW2AX4wYTIA==
X-Received: by 2002:a17:903:41d2:b0:2b0:5cee:c405 with SMTP id d9443c01a7336-2b06e4420bemr29829025ad.52.1773833513367;
        Wed, 18 Mar 2026 04:31:53 -0700 (PDT)
X-Received: by 2002:a17:903:41d2:b0:2b0:5cee:c405 with SMTP id d9443c01a7336-2b06e4420bemr29828785ad.52.1773833512776;
        Wed, 18 Mar 2026 04:31:52 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef3d1sm22058745ad.38.2026.03.18.04.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:31:52 -0700 (PDT)
Message-ID: <26a7ab08-783e-469a-8741-bee6ddf51c81@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 17:01:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] media: qcom: iris: split HFI session ops from core
 ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-4-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-4-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69ba8d2a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-nPLP38iecPz0NBfkI8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: aBlP86OPRqGEO5Ba-qfoH4xb7ohrHsBl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NyBTYWx0ZWRfXzaQTw5QyDQJN
 zmJQ/ksK04Jz0hux6X1K7PJMRSbXExOGyPmTv9njgW2e2sonQzEzeb3IsdeNUve2SrsdKNR8294
 NRNNZA82sDfGVF9XTSjeHCpAn8J5ZWAFTmiujUGDdAThlQy97/Smug4ZPRHgJYtPVXdQXvRJpeq
 o4Yl5GSOgcfGeLeWeHRiq7AjRCxqqY26gS8hE95PJpO2tFWpfjRMYSrzZXbZllXNvpLWX1I0lTi
 h3+EL4eFyB387cofcqu43SrAajWhj5w97l7ljzK5LWQqWa+1TA3JsM4d9YOcO9zUSNBPZZ6xVcy
 TJT7qmlWl7yA2thyF8ZMDBqa6pDnvt3LnEGyuPBSwUB3X0Whb1KOS11BxyLoW64kWL9A5ULxfIX
 M6SSnDo3Jtk3hTDI4GeyyypzvJl0l/3R2+rPMgFzaXB7emQvEEy03Viu4eM+HZSDpBY2w68lCRj
 S/3re8fShglE/sTXVvQ==
X-Proofpoint-GUID: aBlP86OPRqGEO5Ba-qfoH4xb7ohrHsBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98439-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F8DF2BAD59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> Calling HFI instance-specific ops should not require double indirection
> through the core ops. Split instance-specific ops to a separate struct,
> keep a pointer to it in struct iris_inst and set it directly in the
> get_instance function.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


