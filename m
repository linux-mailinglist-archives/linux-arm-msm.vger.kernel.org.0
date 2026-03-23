Return-Path: <linux-arm-msm+bounces-99231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF3ZN6EzwWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:35:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AF92F1FCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E43130649DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F071A39DBC0;
	Mon, 23 Mar 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DG8DuTeg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1txus+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031A39FCB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268965; cv=none; b=BtCrUJyxSBTbQLVbBa+RuZK9O2qzTmxcZvFsPuNf0e8wa5WIUMJSjE2AksCA8rQoxr0ZJeXisBSIjh+bOS/H5s5dYBLMEHKEguAuXPkBxz9nSgQItevmRWCGHiUP7SdZuZJmHsrpXy/PfHcUXyN55fvBdfE4c3JVHG7gT5iTD2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268965; c=relaxed/simple;
	bh=64m52hPC5N/MnkLtjidKUoR5KRP7JyUvrc2mIPo9bK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFESiEK/UzkXsDj/y8bHvs/nxSjQyo9mYzfS+LHmM5LXPLg2QxSdefWFRAG14iL/HY3DO/QO8p5L24L5Vdzfk0qUm3wq5H9Gj7o1g8GepJk0YIHXtSROYmMwjdaWTDp1AVirxVb+kFiWxT6uyhdUUeRwPhAbJ6rZJKF6I/FFORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DG8DuTeg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1txus+5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7Vtam3529248
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ICXSKOx1B6e1+BhpexWUhl5Z782Ljz3yp9i3g6g7UL4=; b=DG8DuTegZX0YBl7M
	DSU+RlxRl2hL6gjAnuijqMqLRuqatjAokJrEMTzdoWbrCOAXWs/xI59Gq1yNpIw4
	ZDGor3JT02PqknNcgJBoWlaECBtLX8orQ7uT6JZpCtyRWrDPo/fWg/pm/9cLM9gF
	uO3y81BcelN7WhmA0iUTUUXEWykLn+k5a1VLVRnlB2WO4X3fWAZTRUFYB8GL1Fu8
	EbUaE6F3BpjTIfHBdeg5YJcnnTejrNrZrUdB1l0PPI29wR9tFJ132dnYZoaoD7Jn
	RijR3+zz2stCLgbGjauqzeqcf+BU13pLR8463VFzD0/Xmh1KdFk4xH42cO0mfDmE
	leKdEw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8k87x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:29:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a9d3073bso1452810b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268963; x=1774873763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICXSKOx1B6e1+BhpexWUhl5Z782Ljz3yp9i3g6g7UL4=;
        b=S1txus+5+u102Jq8bXjD+F2NOBKbyXZiWWpj1VUkS/c9P2n8TBV9++VlfP9vh9eIrB
         Dxcr/PIzBCCHwIaJ2ua/qv6zouk1RHZUORLcoPdvsC0DX94BuZGT5QtNYbeOIWYcv2kj
         2y4oMg6OsiXC9mU2PppsedkCWBGSvyAeDPThtHZoj/t5fcmVSASNd5OVwmC/XqhFoZmR
         N3U/8UOwrYdgcNgkB0cBOgQUsHrSeFJI329hIIH2ibrRK4toBUFKOipYAWko14vnM5Tv
         nqzlwzhoAm+tLx5Uagw5CvSsRQnJbCN7+p6JLXrxqflyCap1KUNin+JYAZRws1OJIsdX
         bb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268963; x=1774873763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICXSKOx1B6e1+BhpexWUhl5Z782Ljz3yp9i3g6g7UL4=;
        b=h9X2pT23Xqz/WWgTko5yaF0zJ5hWmWu9IWNfyqL4kEZtxUZ0+Q1d0YX8n2a7X9mTPe
         gViIyphbzF9CwurezROW5Oc3ZPELOu4eyZRNoXMJD4kFKhpMTvDg29a2yR3C6GwKYiPa
         bukTyV7Uo5ACtzEYvR5o1OHnLJ7ddt8kQ0iuf8orpgeVmwTlTqiO6bGeC/jTmgIr39zl
         JouUZZqYaUVG6ZWc6gNNiy33qAOGBt3rLZrVTS7KN1GsMw1bTVgh5f4Hn6ogkYwrKno4
         6kkE5ZBhcFTGGdlWwHjg5D7s+AYK9iric7TdamFNUWLtEirCulqdytAeFOlZJU9mI4cM
         PmuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnVFPO7RiMLJSaZrvtKUZ65wc82P+sjkISVhze9FJtPHhWN7i5KhJEMgZcsRm9np9Mt9Gaag7TFZZOcrl9@vger.kernel.org
X-Gm-Message-State: AOJu0YzF2t8IzL4aaa3h8JBHjGB6tJoFlsHrUUbfcKUkTJcYPcdDcM6G
	EMo6g+akIvqFPVScqlOGsaCvtie+12+w8oYC8pE1k0wR7+NDIg6v7Df5sBXAlr4ETnvnpBnQXc3
	KN9TlYei0Xi7aFo4AqtTJHKmK1jFZux6tB5VoIvTyrg5g1hKkkpTLSWo/s7xTLWZE1wJv
X-Gm-Gg: ATEYQzz81NmmBLqMeDVCer3Cr9f8E5pRBqdye/DKL9Q5xd+qI788bqc+hKDhn/tP0Wb
	n723LWXtHn5rBYggIoN462MrnEgbW/JX/kL+KatRDHzA4jkw/CIdk1yyyBPmNAAIcNbAgtbgS5I
	yWv7avbcjrpUXsKm65bq3hHiaJ9vXMqycA8dHq6NRmCeBKEf493BJIAJuhGbFqBL92K7e5tBXJU
	X1y8cLcWhhpsxEiTv6zX9926h/XC3kwH6kYmAXCMHCoOkTxj8ryimxsfWDjgfWHUl5rOETfDe8e
	kx+kw6d0JlYoU+GI2HmjFga9HeTrvCkwASX976vg/fxRiB5ZFNqMtH6TjfM5U9VCVNSGJWM4esb
	Oe0yXoncc8KBAgtiqw5QAaQHrdqDQryc/hn01Pw8Bu/z/3UOcgeCfjA==
X-Received: by 2002:a05:6a00:9505:b0:81b:c2b5:31a with SMTP id d2e1a72fcca58-82a8c397f53mr11082122b3a.53.1774268963312;
        Mon, 23 Mar 2026 05:29:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:9505:b0:81b:c2b5:31a with SMTP id d2e1a72fcca58-82a8c397f53mr11082093b3a.53.1774268962779;
        Mon, 23 Mar 2026 05:29:22 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b042204f8sm11519692b3a.59.2026.03.23.05.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:29:22 -0700 (PDT)
Message-ID: <19d4fd0c-b1c1-8caf-703b-649b19902f92@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:59:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 08/11] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-8-55a9566ebf60@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-8-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfXx/2TEaGFRyA/
 2VYCmx4Uuu68QdJj2yTeVvVO2PqvK+QIFb4fTc2V4Cdn6wcHHd8f+2jLmuloeZa5umHTZDGUCWV
 K6VIIsq+faDYVo4m7dEVynHUDI7NkVEJTx0J7H1KloBVLBE1CDtSxuGTm1M1ZNwzua/fNqwI46p
 3dGAMecrt2rU4BLIwBLMIP5Au1pFtD68UqIHkgUHCZqZ5Yhxs/VQbiEWACUAdN+fooMHmSzAFbx
 IvCQlEApoXP2sR1tCgD/n3ObAmyDdrmKELMtZNZOporiEgwvPJYsFluXYjhauf0wgBZNul3325f
 sdIsoEYx75rYWTPU7eFNwj7Po6JukWEFdIHT0DWo5lsNWDfPJ5AGaOE/MQaPQfBq78PSLCVUAzI
 q10UqsS0X6qZPOocbcyH14kR3cte+t/N1QA+Q0ss/ro9XvoixYG8lUGWOdkkqdPXEOCVX6rFf/Q
 22FgehdZnLhbmFVDmCQ==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c13224 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ATcjf3gZzKgDnsL-OLQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: WztwgGtmlDLIqf8A4wzxMAyp9GXHWGEa
X-Proofpoint-GUID: WztwgGtmlDLIqf8A4wzxMAyp9GXHWGEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99231-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46AF92F1FCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> Having firmware-related fields in platform data results in the tying
> platform data to the HFI firmware data rather than the actual hardware.
> For example, SM8450 uses Gen2 firmware, so currently its platform data
> should be placed next to the other gen2 platforms, although it has the
> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> hardware-specific platform data is also close to those devices.
> 
> Split firmware data to a separate struct, separating hardware-related
> data from the firmware interfaces.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

