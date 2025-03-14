Return-Path: <linux-arm-msm+bounces-51447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6F3A616F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FA351B6056A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A7A7603F;
	Fri, 14 Mar 2025 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vkg2oNws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF033B1A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741971630; cv=none; b=c56k54lnOgb7bIsH3NDlxSC+vSXmfKoiucU7XoZImNKVYP4CayGBNC3P72QpLFZEhiC+2o0vT+oVNGmpBmlZf1Q9HsCrRQ77FGm6Ggps4um3rrX44+/2uv3ixBHlQM3oyx45Nwte0plsxFSwd7wbe1xIiiu76fbrlbH9STcKQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741971630; c=relaxed/simple;
	bh=qEkVU5iHr/g+7SVo4A4rC2mUoGzIB16b3ce0OZc1l9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZXFxv35Hwvh1R7o4CRxChs1NrAb5z6DbqyiwmZAKPdGvCX8T6MDTuMT7HY0YmP/dzr9cTEAfi7htSjX4SFPa11oK6c7aYxDWgDy6gYVVM+CXbuJrMi0tBfzBk5buxZAo97B6y8/2XVdowDX2JE5Kec64/dA+z5U1zhfJ9ZM4sJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vkg2oNws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E80DSe022209
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vj80ZitApyxnsoDCCb/FGtnDuHwIs7XmDAt2lhrvDG4=; b=Vkg2oNwsSosCvSbh
	QFti8bEokE+IR5cahTdbUw0/QeAZGqifmVOCA+fSjLlg77anwwC4E57dMNmj0Dc2
	xK5fR9WtgA2t7HD90OorO53rm4wbjBFQeGACdyxRbxt2Jor+3vLWhGt0a4F7ltyz
	uDtATJWe9QUBiYPvUrlzgBnT2pk7oN5pSxirXFCrjzkFwRzQshP9leUThRBkLyuG
	ZVE9Wtp4OgFdoCtPcw1OMkRuA9zaawuAYDj2WCugjvoemTAY9+c9+n6H3n2EAZW/
	LwXbm6sk6KVdfnWrWnG5ftYzjXzsNqtptJY/IoD6Tg1qx9c/Up2fUcWKIp8qKRwH
	qpbWIQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07mv0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:00:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225ab228a37so32601995ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 10:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741971627; x=1742576427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj80ZitApyxnsoDCCb/FGtnDuHwIs7XmDAt2lhrvDG4=;
        b=dmB4SVxPOJWTNq2YqPnKN0Cfv00aNTRDc0mVxiu+Voz587NBh3ZFTrwxSMOi5s0eQV
         7NRm7aauqPbsuuDEENti9tojHGwp09m9C/JOI8k1N8oUNXHij5d1TEWI1wLLUGyb//my
         xMYtoBfSyHbwH2XQgFqc/CSg0m4zSxeP4oOMlbctQqqxFveEvNVkRiaTdSEGx5Yfx+or
         9UsO+qd8QS2do+FRqH8Vfq7EhYu9lTQOtcjj8tPBCnH2ilQpJr7FT6rs6D8WVxo+y9+2
         4o5wTwTXtC8o9NqxcIqqSlV7+27lbdXs9mQDGZwjbuPqe5f7xhgAKFdN2O4puu5dTLCR
         6gOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnzlwmJDmq1M/KJZq7ejs9ZrMguumuegxdLSODoLgSthXYLmxJPI3UqxdGrZ8m/w1A0d1vhPQWxfnDi+4r@vger.kernel.org
X-Gm-Message-State: AOJu0YzPooyXlwRcQK57Z3WS3yM0q+HD7Pj121sb51luXQKplmZu8C1Q
	PGjGRs95kf92H8AeS43WuBMpk8ZRFdOISd+w101JguylZNEaMRCoYQcquUqpkBA+JMaQcaVohv9
	yTbEEaflbUn5pwVxEOjPgnWMwzCx1XQW+8uCdITJkvzBSID1N8fv8q1vw6VQv2xMF
X-Gm-Gg: ASbGnctqUnNIDxmjT3owKNraaD45yNywg3nViFuIFg1sYADi99XmhgjTnNfkJocW1nJ
	iSYlQ1/impJs80sTmkcrR94QMqZje3FklFVaFcjHMrEo87Y+NzHVuk2gm4hMxqgQmMPvodpAiAP
	t7QPdQpraXyJHUH0zf+N1uYfuUBkC9B3bfFu6BC8X/FURDOQXzWSfOnhRg1wAK22B2TvfT71Gpe
	jmiPXOiOepEPIEWpMy47q0X7YIFSRELO6K4q7ZwT1AdFj/B9O47zq6Ap45mPpB+o2TpWQeaJgA6
	yfULKcB7RHqg0kKYofxGPi/7LE4xSvhjcUpbd+HqVamuYFjCTZSD6zvzqGSAh3f9YQ==
X-Received: by 2002:a17:902:d542:b0:223:58ff:c722 with SMTP id d9443c01a7336-225e0a75b3fmr50537635ad.28.1741971626470;
        Fri, 14 Mar 2025 10:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgaTrqJvv3hrH5zwdalhsLolvqrISTAGweaj7t70Pd1LstxRhICYIFHsdLjBTzxckLK/Z9NQ==
X-Received: by 2002:a17:902:d542:b0:223:58ff:c722 with SMTP id d9443c01a7336-225e0a75b3fmr50537025ad.28.1741971626026;
        Fri, 14 Mar 2025 10:00:26 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbed72sm30782835ad.197.2025.03.14.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:00:25 -0700 (PDT)
Message-ID: <ceedce0e-4294-4ff8-aa70-d2a077b4034d@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:00:24 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Remove redundant 'flush_workqueue()' calls
To: Chen Ni <nichen@iscas.ac.cn>, quic_carlv@quicinc.com, ogabbay@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250312073404.1429992-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250312073404.1429992-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ox-DwaiuAtK0xSa0_jIify8ou4Dhxa37
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d460ac cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=jdnOPd7pnXj7N3RGrIQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ox-DwaiuAtK0xSa0_jIify8ou4Dhxa37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=831
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140133

On 3/12/2025 1:34 AM, Chen Ni wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> @@
> expression E;
> @@
> - flush_workqueue(E);
>    destroy_workqueue(E);
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

