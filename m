Return-Path: <linux-arm-msm+bounces-106846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HMIHJN6AWqMagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:43:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE6508AD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B8AC3002D02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 06:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7397342CB0;
	Mon, 11 May 2026 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0uxEY3r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LM48HGn4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE532D46A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481767; cv=none; b=MBgK3nJaYAGCg0WUXrWTWfZBwEhD4tc/hmp5BGGnHVQWGw+4hPflGBcUfzbn7x6Z7PD9cVGRpzdRoYGvNwus+xHZOYtJv+3u5OIWkgYXjv+Y7OkEhhWRqKz2VzxhxTfFs0nHwftnwK3HHxO3oPEgUZhffNQDR8CYwgL/6bFPeuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481767; c=relaxed/simple;
	bh=3XqwzWjL8/O02MIW6Dh4UFXLdxvPMXiwmmAncwmHwWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xs0oJm0Tfl3mZMo+NdRze69mAihi9Mc4XYl0Dh6nv5VSiiYMVZpLska1kzT6wkL7+zmM8yrB9WZVMFjKgJt8kIWdT9Y+XLtDy/x30O3dOjB03VxSo4Tsh6AaHGk1XSRSq2XnBvhWdBVRY65T6shXYzCnqnuqc9HWPsnYgmLJjSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0uxEY3r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LM48HGn4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B0tqmU1658517
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XqwzWjL8/O02MIW6Dh4UFXLdxvPMXiwmmAncwmHwWo=; b=k0uxEY3rw7cxRuAl
	Oqzp1U7gi2T+mb3KlyhWWsSkMSLTzD1KFPBMfGHlNE6YR0DVRVUXd0qn95L0U1x1
	yzrD7sdo/qMdqV3b0M0jW/0koJAHnqBMUg9xH/1SOPSTa7zgvWySanjCQVn57g+b
	+KgvZ7KcE9p3GAgFzVdCJwVbqybsXPWRQrEcE9GjAxPkymlcwrjAI7zRmDt7AqrS
	KH7IwzL3Lyk3S/HDgc5TYjyPJfhf8quh98Jvgmh9VSty31jKnxn0AfIWEM8/TOJh
	G5xyrqWCKd/yEvSk1Wly05/0jgM+tfiNpejGx2e3T3hv1cBoAJGRoUj5wClGM665
	kb0uCQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1uvsmypf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:42:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367c2d149efso2258184a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 23:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778481765; x=1779086565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XqwzWjL8/O02MIW6Dh4UFXLdxvPMXiwmmAncwmHwWo=;
        b=LM48HGn4n4d86CQpjQZVRSkBm9EMD7IqsxE3+WQMrgk+k3qU8en8fEHbb/tewdmx4M
         JgmvIVJSbDWf85pQbOC4nV0oNmcAl8Je7JQvgjMR/RvCUqYygQGuWRTjZgjzM6JIN3RH
         tRwy8C3XYNIrjT/WZFg0Q31bUSC6rgYcLnct3RZHRVX0BIYBsghYxKGrWm6DL9LNU8OO
         DuOD6Y5eUmS/lZOeeOZpCCsZ5Oq5fNVRnaVRpEiLrZ49So45PoFaM+eBVWDFU/jrIxPh
         V8uOFISJLnVlHYu3CTq304AugZk8KI4E+VKHSGMRfVvFfNwUkBWSoJSCeyHQsNi8RPpR
         pIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481765; x=1779086565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XqwzWjL8/O02MIW6Dh4UFXLdxvPMXiwmmAncwmHwWo=;
        b=e5S1B1ZBMQ+h5E77Za0WJYFZrQdKgCkOwg+Gkbkk4OADBJb2v5g60l//aYYgbaRaoP
         lF0OCYPbrl8RU93rl4dkIEe3t/SoRl8HeFVpWnebYZhFlXtYMtRvhWJeQZlHPtoEmkEr
         HHfU3B/oDiBakdVxbR6zyqeDKrckmGF4Uwl9XsaJSOPOgPmtV3F97oqZ/XgehBt46a1N
         k6C1THc1PcOahKj6lJLnUdhvi0H+HonbmPBQsgjvP2B9iuU7+//REvT8UNiItwGI2Q4g
         R+B7fk9/g3GY5bre+RSHMaSvnNKeiUMvwORDre+5EvIU0u8B3HtIlMPmq7I/dTPFVZy/
         tW/w==
X-Gm-Message-State: AOJu0YxcZCwt+ORwBGWRTiN8jf1OsZe+hyKLuozC7XUM4vfQwF4TK0ca
	7nTLX3NdKqFmXzljdfY7G+J7pruwrflyMM9Pf4mOJ3rm0H2KYOHdMfWBYxkcWS9HGw+lucbODQw
	k3kDtAZTpwkhisXO+vWD9HyyL0zkpCblOW0iL+kHGtD+M/C9HdQAqoyENPezA59TXKZLQiyaBcw
	Mi
X-Gm-Gg: Acq92OG8ICVJ/eNQmgO/810a5sUKV1PbJ4eN2aiCMM0wsjm8lu4YNpth7Xa/TGm16I4
	bna4J5OWECjeWekMJxGXX/hyl3qFJfyeNz15CsRSxQki7RqdubryWkIt3xlCTf7P+6xFF0gwEp2
	DrYcBOHAfQlqrAf+sgudaYKknrTOkq8qZWxwca5VMGuJAMDQyvDHJ/oH4V/KJy9u5HKlsaIc50O
	zR/D4mWp3hLgxkhWm6rUD1hC3oeW1x9/PHL1y/AfRx/XjoCMBmqiLgRhJ894i3DksUuIQmHdx6A
	/DxvR+mU8hlGZd2otqnYZhEvv0v2OTgoJJ+Gocx1asfqtviKTG+IRbF7ZHdQBx/KUdG8cUvuy+J
	kZZ4ODjbqc55mdFbHBgy4iOkA8vC19BX/gm/Tj2a6bmzUc/R51A==
X-Received: by 2002:a05:6a20:729b:b0:39c:4b84:d90f with SMTP id adf61e73a8af0-3aa5a9056d0mr24644482637.8.1778481764996;
        Sun, 10 May 2026 23:42:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:729b:b0:39c:4b84:d90f with SMTP id adf61e73a8af0-3aa5a9056d0mr24644458637.8.1778481764514;
        Sun, 10 May 2026 23:42:44 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267710262sm8157017a12.18.2026.05.10.23.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:42:44 -0700 (PDT)
Message-ID: <73e61b0b-e7f0-4baa-9beb-ccff801bba62@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:12:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: cmd-db: use C-style SPDX comment for source
 file
To: Mayur Kumar <kmayur809@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260510193840.59156-1-kmayur809@gmail.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <20260510193840.59156-1-kmayur809@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA3MiBTYWx0ZWRfX/on3k1HhkXNZ
 yCN5KGGaZqaWLeGBz9hNJU4vWCzYDYMp0qobW0P3bw/1fIpNs3SARCpxDtXzFpoU2CVe8CI/p7/
 Cm/slCRLWwCISBiSCSZpkhVFdowz/yEOWRN3u3Ekwg5BOmjElbwLnDTsuDA654zy63zA2zQONJM
 aVFCN09bgjVkPQmDkR5iGtTT5cZgDR8SsDI2CnrF133sRwxa0izsqgNranF0zzen6UZOKlaE9kv
 pWxpmqMwjKGScXDI3AMZb7e/7cIjogGL0CFU6ALkzqGo6Z67fRAC8XK4IKun135WdNdpR2Mhib5
 wOY2cXqVshih0JpYlNQOX8E6EfzhiQ0+2zzu31I34qPiQwkJkZsqcKWUT2+w7jadcx12XyxfYDN
 1aMR6NZ7pOMKyJH39kPvs5y3gaDkpM0okHW4ROgkbAsxxVM3hBZ5GnVBmGdo/uGz/0UKLRylExu
 21wtHnD3rw6ydSk0dxQ==
X-Authority-Analysis: v=2.4 cv=dujrzVg4 c=1 sm=1 tr=0 ts=6a017a65 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LfSoIOZOTzbbqTjowBkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: e8zDtqtlZaFUjU5xEY_1P6dkUYEfvQz3
X-Proofpoint-GUID: e8zDtqtlZaFUjU5xEY_1P6dkUYEfvQz3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110072
X-Rspamd-Queue-Id: 73CE6508AD0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106846-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 11-May-26 1:08 AM, Mayur Kumar wrote:
> checkpatch.pl reports an improper SPDX comment style for this file:
>
> WARNING: Improper SPDX comment style for 'drivers/soc/qcom/cmd-db.c',
> please use '//' instead
>
> Per Documentation/process/license-rules.rst, C source files must use the
> '// SPDX-License-Identifier: ...' form instead of the '/* ... */' form.
> Fix it.
>
> Signed-off-by: Mayur Kumar <kmayur809@gmail.com>

Reviewed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Thanks
Sneh


