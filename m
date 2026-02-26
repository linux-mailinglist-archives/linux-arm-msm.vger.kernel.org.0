Return-Path: <linux-arm-msm+bounces-94237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBsYAUD0n2kyfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 08:20:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4E41A1C54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 08:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E71B13012829
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BDD38E125;
	Thu, 26 Feb 2026 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTFWwLnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkYJIlv6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EB838BF87
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090425; cv=none; b=eXqLxJ64Veetg7M6IhMY6nZvV+gNPoJ37hji8lku3yHLLtKO+FAPEeLWzlOA60xN7wU3FxuoKwpMZO3Ti+0JdQ/fvosiJjlZ4qwXm7b26GLGkFXkRM6bPM2SB70R+Ibmcyf/6fK0VllmAhoXgNJ+u31Bm3NleTLR4z0eH80T4pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090425; c=relaxed/simple;
	bh=NX1q0YIwIDIBod4zBMuz6cN7+56ua5lfz/lw6/gneYM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AAlGAgzW+r/wAjXcjEuliYDl3FalnQAXkfBLslKwqdev0+WEWURUhrY39g0rMG4pJwIfr2Q9XZmirkjTUYAvimJbcrGHvvCH0YU8ZsAh8jFEgl+4ubXuzpRiNW5IbCFYFMWq/8kNFwvsJ1YqTzPIQc9iP4CtEXX0WkhKEdgAr1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTFWwLnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkYJIlv6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VkAi1280858
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 07:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uLoU54AaeC8QyX1TAF9QPbqh4JmXg8/ZE3JffoY4dU4=; b=mTFWwLnc5U+i6NVO
	M6O2v+0OnfAQ0pPDnIxu4PzA0fx4HefohDnQA+Y1jJOGeHmdjYvYkAvTeYhqZtH4
	I2CcBMzOw+6hn2NOtnYIIamreKQ4fbBbp3vj7UYVdbvU7DOSiVWpH5ArQmxBP+G1
	QwyofrdbBG/tGhpJQuh6AaT2VcoFtRIVR+ccI1fUm4lA4Bs9gz1kZ4vGPyKYci4e
	/tmQWwPWprrEzzhzezH4diezo/nK87ns2sHNZgIs2Uhxj2h6cnKUVL8aAKG1In9O
	6zluPc0smlvHXypr8AB+0YUQJwOx+wEd6H6kRu5GWCioxH41B8MO4lPdieZdJWOA
	3SRO5Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39kp3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 07:20:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3591c9cb81eso1745550a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 23:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772090423; x=1772695223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLoU54AaeC8QyX1TAF9QPbqh4JmXg8/ZE3JffoY4dU4=;
        b=WkYJIlv61AY7/Qj8UHeMN2OGeU6Ck86ftEDBxBdW18orGCGz7LpbtR108WTuLwFCax
         EeLcj/BX4eVppADS83TObUj11frBztWW6FsVYZ59cHrm/J6vkhO/Tefw1bZ7xBzRPLGm
         4l77E/vbR6gcp291QYRUgv7Jpj0+eJ6CCIScEIsxXVCg7ZqvB1btm35jGrdiltkN9q8u
         4hpXEPMjFYUDrl4yUjPWlVg0+sw8FAxhhYcOoXjz1jhdfULwLSmFfsRiqPFpQtoI188c
         ji4a9FUiVroagDFzIApgXEyBtjnxsJEiOzXc+9eQlqBssowQDEsQqJJKzjxwfsfVJpPl
         xIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772090423; x=1772695223;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uLoU54AaeC8QyX1TAF9QPbqh4JmXg8/ZE3JffoY4dU4=;
        b=aYt6zjytMVB0BfR6FrgKkVs5CIFddAHpUZfyN6P8zj/ZdGdhhdPIQKBw7inR85mJ5g
         /wmnYC/V/zewmOm8bA6bve4Ri3SRBlHtjlxaERMHN0FklLKECHj8FVDSbovD08ipb4sd
         n2O8bkj696axeDcc9MgKfly8dwcp2uo3pmLHYw+uU6R1Eh1o1kKvx5Zy03JsA0xEXjqT
         ns1hnCcGdraS//K8Q5kEwWtb8xKytclHa9tDFQT/8cfZ08uB2gjHbMaowLnUKv/eHCM+
         HnIZptoFfKOwZMEjQrJZ7s27JTBCVjFY+Bq7SidJiDTIZiIIguzGbsYa/fsNuh9QoydI
         ZuNg==
X-Forwarded-Encrypted: i=1; AJvYcCWX3JXIRd4gLpihQpfLIVF9UAeTtFIhYhzXjSRTvCrzdLHgW7GLWKzm2ttY1vpZhPaARA1EREsiIsT+Oha+@vger.kernel.org
X-Gm-Message-State: AOJu0YxbqVHYYIlVHxKT7PV/bj6gYEosu/oabPkRZDirNYs+BrcUqo6p
	zugnMbPnwkvsa14kqsMCj39/8Pxm+RTNDofWr8fwBd9mupxF8znDrqX+6Kevu3Ly7NibpePX6H9
	meYhOzVhuCLrFYM/lVyBGw/+8eglXGx+W5TopkZt+8M3MTgUgyBo7t3VcnuustqQFYyXn
X-Gm-Gg: ATEYQzwa04PMaZwouo/abgbJSELt0wnYN1RfdBQAXOz5SC0k8NMd+Kth+1/QH9eVA5L
	W6n7+IAl8kHlKkzZjZl7WewPxs9FwEXz6b3/3ikrxySExsMR0GPIm4qm9mO9sAAd92Cwo4tN46w
	axE9EsJzl4o5W9oWik14P1KKVaBi1kea0pW3cRyJPsNQYRO3ms1cyVWVGVAolkANdkwZa3bov8K
	v2hfLFK9HBMxRQMqZe9rGJ14EAxOuimd1EK7Ze2F7VHP3EJiQORDpLOe3u96rWnGFpCDcGe5yAo
	9q4QYaUl6LcKvXgR3ZCAwIh7T5UQZvONcGnLUN6P262QjnROwseZ/BqmjUkrsFpavxAFecJ7TDC
	YYh2oyuiZT+Zgeo2z69lBg0M=
X-Received: by 2002:a17:90a:c2cf:b0:356:1edc:b6e with SMTP id 98e67ed59e1d1-35928a6c00amr2606814a91.8.1772090422589;
        Wed, 25 Feb 2026 23:20:22 -0800 (PST)
X-Received: by 2002:a17:90a:c2cf:b0:356:1edc:b6e with SMTP id 98e67ed59e1d1-35928a6c00amr2606784a91.8.1772090421872;
        Wed, 25 Feb 2026 23:20:21 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:8fe5:3076:521d:50c0:367d:1d7b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm1099694a91.8.2026.02.25.23.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:20:21 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: kwilczynski@kernel.org, Daniel Hodges <git@danielhodges.dev>
Cc: kishon@kernel.org, bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260206200529.10784-1-git@danielhodges.dev>
References: <20260206200529.10784-1-git@danielhodges.dev>
Subject: Re: [PATCH] PCI: epf-mhi: return 0 on success instead of positive
 jiffies
Message-Id: <177209041798.86372.5318911333192648470.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 12:50:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2NCBTYWx0ZWRfX4ozem7SVXMgk
 ty95iEXgUcwQfCFm9Cb8focO+oC5+Qnx0bSfvWOosvYACucUbf/EVK4omPCUcJc7mbTVwFfxnpu
 cg8gI5NhitnJRUQty099yDRMIDJ+r3ep8YDLxeI8LgSQBBOg6BieM/EMEcCuZ8Ulr99S79HbOFS
 cCk/1FsPnF70N8oeJQpVkXuHPqnISy8H3bB1uLTE5DnBiYGPYx56rrINBTV2AIBwtVNNxDaaPaM
 ycxUyo8mnm9TbEyS/734fiX5oQW6CrQ2R7fjoIRz1JtyVFUbFO83qNo7cKvM+a73hthT7KpPa6F
 izk6LN8QoDS2vEqldw5jk+mGrb9rlOwdJbX7tY6Z0W8yytJQQzRplzJBnofJsw8v+vzGdFLd3Bw
 65rmxrIQ1T7u/PUpG2UXhU9oNqeEJ8fmIkMR2N+T54aPZn+E3Zupp5y4nSBjAczZ3Kq0fK50TbO
 /gOqqByrtSozzUxEvPg==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699ff437 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=kPnkl4ryUGSNtqIeIPIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: rnVWpe431IDTtKOqaJROayNahIAnETtK
X-Proofpoint-ORIG-GUID: rnVWpe431IDTtKOqaJROayNahIAnETtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94237-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F4E41A1C54
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 15:05:29 -0500, Daniel Hodges wrote:
> wait_for_completion_timeout() returns the number of jiffies remaining
> on success (positive value) or 0 on timeout. The pci_epf_mhi_edma_read()
> and pci_epf_mhi_edma_write() functions use the return value directly as
> their own return value, only converting timeout (0) to -ETIMEDOUT.
> 
> On success, they return the positive jiffies value. The callers in
> drivers/bus/mhi/ep/ring.c check for errors with "if (ret < 0)" for
> read_sync and "if (ret)" for write_sync. This causes write_sync success
> cases to be incorrectly treated as errors since the positive jiffies
> value is non-zero.
> 
> [...]

Applied, thanks!

[1/1] PCI: epf-mhi: return 0 on success instead of positive jiffies
      commit: f6797680fe312ae6d32a773eb4d33400f24555c2

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


