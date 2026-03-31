Return-Path: <linux-arm-msm+bounces-101042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIKXMeOuy2kpKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:24:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5ED368AFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23165305DA95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B253C9EDF;
	Tue, 31 Mar 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlYLGFFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xl7+X6K/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A083B19C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956125; cv=none; b=JNJ+1OGF3vapWhvq7dVoiAjSu+WH1vq5q9dEayX5SxRD7OEETAqgSv535o3tBAlR1qOIc6eYT0ooqv0DiAqJhmQvfiHMXzoHdCyE1gnhSuthncgs6a6yKK7GCL7Nnhz5Rj7V8GZ4FrSOLTtNGk+Vk3XEMeUu9y1ZN0UGTIpwb54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956125; c=relaxed/simple;
	bh=9P/usWztxWWHG+07j6bm6BpWeT7+v5FTANhElbZehpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUQlV1rzK9EOAMcuivYHKfhwPu2D+qZPtISKgqwN2ApzNlra3Gm9VLK+FKWBV86nICVGOQYd1Pu8GGmSmKTysu6coi7SUqzVWqLoxH8BpnjtuN1RKzPkzJ4WkyZxnZ4kb1QKmDQs/mb2YXYczwY+/2j1e4EqhVmhEQFD7U5UG6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LlYLGFFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xl7+X6K/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBCEkk1841164
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bRj9HWhptdTu03knw6N59eAK
	dBJYVTdEtizj9gAPARk=; b=LlYLGFFd+54tR63WAyA1eLPR7moFRD6ye4qSyBaV
	JF4BQvmM2GE/l9DECqK7EYxEsTJaL4uruWLrEa3rJkRzrWPQyo+VqMGABerKfRk8
	8OjotDCsebY6CRd/VDgZimK31iUwEHduy9L7tW5UX5SC8ijUdAuWyTokiCkY/SOl
	Ks3oNCK4SC4TQviF11S+zGNZNLQ8ojYrSU/UJKx7wzprcn8AsML0Z/ZhzGqYvxNE
	HXoSTWhf1oYf9StJuW8ZS2mQQ49eoBpHiEPqGBrxNPvQ3HonZ8zw8DxRJB8bJqpn
	rwr1DswNg/22NOjn3UzHnEQ1dalYKqb5yDNawvfXxMoG8A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsjsrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:21:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c3b8880ca9so3909815eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774956115; x=1775560915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bRj9HWhptdTu03knw6N59eAKdBJYVTdEtizj9gAPARk=;
        b=Xl7+X6K/4vdmgKVt+KliCjEib/hqcfApY6st/Bltbw0kDY/MsyN4eHNgXWjS7TVrdc
         IvXfGn6j4+1TmSTk9eHon/jspkiNZKQQ3bKMtjAEAlL3eImM59c+a8bQZqvpmj+1z1PE
         iZuntutIGN0ib2tGHF8FJ0zIB0LT5SBNyS3jkbw481ZxzlHyQasAlqWS/IkJXmCf14wx
         UvbGPgsMbLcokAupX+WDFxucc4w28X4AX36eRGIvjF5sioWY7vgLRQkUUFqZlSLuqi+U
         q5LHflp6yp3/TFrrw4RtIlZS4gMbkeaOGxpM2hVK6WzxPyIV1FJnkdW80CbogcCqCPTp
         7frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956115; x=1775560915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRj9HWhptdTu03knw6N59eAKdBJYVTdEtizj9gAPARk=;
        b=NwFCMKp9oBrpdYpPBBW9XHy68CYMor+qmYY+BxgqSj0hb+utA+zA9LheXLFXtg5YZ4
         N7Pd3JJXtzRS5F9qlpcckM216GhdP1g/+WXcGpkUigXE8zsMHh/6hBRwhujerWbV5b+M
         amkYJBiHDYTi1OTKxSLs4d4a2LhWk84wPlHZ+Cue0Yo130wRCXAjltpMKm96lZzbnaMW
         a0pzkvnBg80qXUfCoWyYyf0ItxiXJhQSAUqn/T1hs780grpBZ7j9hcGi1aD3H/u46jy0
         PPj6PhDxhIkZM+pKY2ExDt6XlwUHlqEqgKSk3v7G1zpq9Cc4dAQqXSRXWcilK4X2Z5mE
         hamA==
X-Forwarded-Encrypted: i=1; AJvYcCWgjyrQMYahQxIl4wbyuz37gqykfQKggqOwU/6Sw2dCJhB+2dGmZLw5gGO7LREn95fqWH/2JzXJfszO+IKY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/6Qc/bK1+2OwYGln434n5/6aIhq9SlTAwtxmHoxm5meXwU1ZO
	zaI3dQbhO8TTEIXCYDDUE9SSDEqgmVlgcXqUDR/KAIYtrUeXZv6BwZcwAyLqpdKEbOr94mQve0F
	XTzJv2DL8VDgsyDjP5XRsZ4+eUMsuFh3Ll274USNnl1kG8/Upx8UPCSXMXIQt92nlH4tP
X-Gm-Gg: ATEYQzz3KydNvDDm5cXId4yVjWIR1coHX0W6zTvHVp/9LsVbgFTXIP1vZtlTgWUN7Jw
	b0Zd0DfnsUmLAyp4WQJcW/fB/jaRu8Gi0tCLl8nDHvqqlTfj1orLxKJqxUn6F2472Cp1DEvOQl0
	1dZR5/fNQB1D1PzWWLRGXYWR6etN53l2hs8huMw9TJy/h+0SOSCD0IpAsRacw8+WtcF4BU23Mno
	QCuqKCy/b6p7bNYmDCAKUzIyiW02RSeUyEu2h6CtQj+4CKMRMJwZuTLux8lOBoCiQPvXUQ4psJu
	oZMx/rBEPj7PcJPRYmJ6HxvYI50CqLvN1Z7+S9q6effCQX3KqvNmTjrrCGc91ZJ1dWev0IGx/YP
	7qMmvxlcXZJruAMPpyV2U3UPPlJpXMObWsfIwvJf/nzcctzVl+cs4fpdcq1+0/axI
X-Received: by 2002:a05:7300:d512:b0:2c0:d46d:cfc2 with SMTP id 5a478bee46e88-2c185e365b2mr8275320eec.23.1774956115054;
        Tue, 31 Mar 2026 04:21:55 -0700 (PDT)
X-Received: by 2002:a05:7300:d512:b0:2c0:d46d:cfc2 with SMTP id 5a478bee46e88-2c185e365b2mr8275305eec.23.1774956114515;
        Tue, 31 Mar 2026 04:21:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b399bsm9547037eec.17.2026.03.31.04.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:21:54 -0700 (PDT)
Date: Tue, 31 Mar 2026 19:21:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Add missing space before closing
 bracket
Message-ID: <acuuTRgZ4T7b1xGE@QCOM-aGQu4IUr3Y>
References: <20260306145607.1394878-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306145607.1394878-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: TmJIjNKEuqIP3GaSmnHxHSxq25cbRcYO
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cbae54 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VxBamrIxFdMkSKUz2D4A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: TmJIjNKEuqIP3GaSmnHxHSxq25cbRcYO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDExMCBTYWx0ZWRfXwr6GYgipu0CF
 JyHCUDHG1boxQP/bDgP9C1ybv/ZjrlG71wWeB4CQo/lm/e++emTeW6K7C/yXMc0yV2P9vC2abgu
 pgVSgDiW2XVw9C+AXHzPTEpDvZD7joqymmuEopvHSVWK9mzLMKe8gx9IjdNenKnzjBMvhxTXdMo
 MDBR0523holHqM0fKvC5wYK4eFYgfJXC8+0ZHupQPiR8UkMQoTc1qK8D0OZiGSZIuwwDLy7dFZe
 1CNP2gKogzDZE5dWsb8w0taOBXTPJuPG0JWpmfSlyXX/91Rj/7fSW3B8rIgMB0k31kM0u1yUFdG
 gGY0EqZOM16LFhyO4GnZZFnvS1Jna6D4KRm0mFQud/4jMm9YcHr+zX5akpDESnwJkE6tADqxfj8
 uje1YJlsRoIznwE05UFkyuWd6dh7fgU5Z2AjsN6JEJIQxs/XTeeGPpN2/YKld/Brhw25PjnFgBm
 h7M9EI2mWK71xLXlOIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310110
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101042-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E5ED368AFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 06, 2026 at 10:56:07PM +0800, Shawn Guo wrote:
> Add missing space before closing curly bracket for qcom_q6v5_mss and
> qcom_q6v5_pas driver of_match[] lines, so that all qcom remoteproc
> drivers are consistent on the common coding style.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c |  26 +++---
>  drivers/remoteproc/qcom_q6v5_pas.c | 138 ++++++++++++++---------------
>  2 files changed, 82 insertions(+), 82 deletions(-)

Hi Bjorn,

I have to admit that I'm a bit paranoid on these minor coding style
things.  Let me know if you think such cosmetic changes are unnecessary
churn.

Shawn

