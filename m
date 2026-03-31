Return-Path: <linux-arm-msm+bounces-100997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xMdkBdaQy2m6JAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:16:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A61366D6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01B6A3020EA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0023ED12A;
	Tue, 31 Mar 2026 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFS2Ljxg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPNj+DgC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3553ECBFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948560; cv=none; b=Af+GnBYjZrTi5TjTq9Dkz6PTo63+aEeKTJ1XJL6yWtzNX9pRNDof5pMh6+S7RP7BLSodvGZ0TWSqdTbutjmZoytYlk0OOInkV7UZv6xh6pm+F4xzme6CpF7lu0A0s+PPqVPP/sKA96XYjPBP/yJR0xhkXC6+SQ4ZgsM6M8oixyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948560; c=relaxed/simple;
	bh=IWT2TecODc4x35H2YiJq9hOwIc6t0CcR9UDNOFGnXdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QzAu3v7jn18I+OTpO3hKZPQ9wFZvwK9x2rlzU7sJFaQQH+mqZ5JKibF7rdQ+S437C+MX3c3KqnwKq8TMbsuIKYrtfn6bB3zUorZGtpdh8JONJwOJSEfiz0m6mOdgNreZDg9jKncd6+P3SGZwquD+6wGll7PeabmWglP+1kS+y2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFS2Ljxg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPNj+DgC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7qFOu431287
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yDhGoxfJDrPVZ5DvoY6PLLrq2voT5ShRIN2ZQa6XElc=; b=jFS2LjxgLgqDC6rZ
	KEgMTBykcnw1Otn2OZNBfwKrkh/rk6zd8SrrIlnRm3HDwa6P3fOZfrYkOIwFL3sd
	f/BZE6G+aoRVZnirNSu+eSLPKJn64NL9KV1k0laznYLEfiTTeS8lG2Sn+2EnNbsa
	Xt6qm0lLaLn6vc+yilSYgJoPOzXiMPPENZoBUTkH00FI/PxZdaTNX7ma+rJqPrNc
	l53p8vU0qmjYHxGbEkMmetRh6zk085OTLz3lKcIIEDQdAOuH+YjXD/C+sJjGG1DU
	ICzwSeBgAUKIjeEywZVGYZQY8t4cyhq9enV8qY0LbW/fC4Sm7IUW5QMfLIDgAvkA
	ehgmHQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhnf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:15:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c63f85c84so3654771b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948557; x=1775553357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yDhGoxfJDrPVZ5DvoY6PLLrq2voT5ShRIN2ZQa6XElc=;
        b=GPNj+DgCTRr7IOgzwioLQWZk0dfVTqg+5R1V6QRX20QwksJtOE6nrvjk87Guyc8eSp
         g0VuBEHYWQwQCWr2xjj4efPXZEk9AKmFZCpgrDNB1JWt/UWY0srctTDKcT0RaZJF4nNp
         g9jOCx5MQ887atWdi0OoFRYFahlxdJGDeNgbKtB6sY6YV1BWeQOGBVP9ZkCX8SXeqNGx
         XqNdvRwV3NDYYZpPbVmRMSYoWz5QPWTqZ86NXjvwbI1qWyzEKjBx0ikjAjjy0aIVzSxA
         jn++az0QfcmHhRVee8jO9NmI0HwRVYvhRHEq7oU5omy6NbT6ikEu2V2P996DitoVuOdJ
         fSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948557; x=1775553357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDhGoxfJDrPVZ5DvoY6PLLrq2voT5ShRIN2ZQa6XElc=;
        b=Zl0WNpIPn+uCWYSv62cVFZyReQbHmZQ44XSDRKxSbC9cWb+l/Qk4JnO22tDemKfM+P
         UcEY2mtV98ZKccsAR5KAJLf+k9zo8+KrY/DCEMgSx3A2paHmmF4hHSNjeWpHab8IG/Ic
         qmUc/81Q+Cvq9/9b29aVzg0gbMgr8IE8lTajv4tcxNh89jGe+tCCIW8/I8N+iieVRrx2
         V5JbinADmVAyhotjl65/HlI9DjaNpmJrEyYQcE/N77p+GAPAvLZqhraCxTkB22lT65kc
         kc6L9GOsmONs6RqxfO8QURLSa5KW/Sr/l9xGzonBkwY8kjd7r/XymkzacL8qoThOKX1+
         pqjw==
X-Forwarded-Encrypted: i=1; AJvYcCWbusO+/maKql0eYNI3Z9nT+aWeyEim4B46JjEqpj5ESXpZYgmDJoo+02FgMIOzORJfH57xl/kgCXkV1lN1@vger.kernel.org
X-Gm-Message-State: AOJu0YyBn6asjSQSH0StUr9Wdll+OVVXDfgoIEJdZDzSHNjsLQ5g4fFr
	kMKA4ixkIN9tEISKjllkuPGT5jL3REjoTCtBWHoHrE8xnfXKMiPP4DeagWKWfuyrp7Ltfs09hAH
	tktG9bFhRv2LwT45KSTx2sb8uJ7vxpR6QMYOKBMUfZaPdnhpxDT/lwo5aVtB70Udsa/SR
X-Gm-Gg: ATEYQzw4yWAOzlI1tjzCQ192vRH7XNgAFg2nnC2ZcMgNa9dHT0gsnV7gteHtXCy+mi5
	xm/P+JpNdb85oVSyIzTADyYDgR3aGOYc/eXyL3+yr7GSMRO1VcOqvw3uG7DK6V8X5DE+wKqq/pr
	U/CBxDQbbxtyLlayiSfsv0NhX4CnlEf+72HJcAP69kAE6+zwlffRE4L41n/6INIBhkZ/sAg95Z3
	Ji3OH84p4+m3E2gEskrbK19S526VCHuie6N7lf8bIzRDHXGFY2pFOOOGv7pF+UaFAKbqegimnv6
	+F17miCd609iGLU4E0C5zT7bfkJUc/4Da0z+M45199ru1Hnu9vOaj1zSGCeJ9SG+/isxsYfdm+b
	5jIEtUaVAzw2WaK68Wvz6T2BxtckbZ0ziasHSpvH7czGxxus77w==
X-Received: by 2002:a05:6a00:3e27:b0:82c:7767:5ba9 with SMTP id d2e1a72fcca58-82c95e5bc7fmr14865149b3a.26.1774948556611;
        Tue, 31 Mar 2026 02:15:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e27:b0:82c:7767:5ba9 with SMTP id d2e1a72fcca58-82c95e5bc7fmr14865121b3a.26.1774948556116;
        Tue, 31 Mar 2026 02:15:56 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d3a8esm10232286b3a.39.2026.03.31.02.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:15:55 -0700 (PDT)
Message-ID: <f346e3f0-9373-4b40-a5ca-cebec6c4da71@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:45:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb90cd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=u_wVa8N0Y7CGBYMdsxYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OCBTYWx0ZWRfX27RBrDx5FVyP
 cxVwhSJPNT2XD8Ss/fsT0XuHLQzOi3owyo6asPYKSUZpjLS55yiOnG7WtNSrCiSEc7doTyjrjoT
 sjtBU+Gths9tP33Io1pB1jxsrgBPej7bX/VjF7jyziVJbx34xee8TLxHTSszh9QVxRsVv6dRnmV
 McT0pWdxeUvBAqJu6COCrxfpcg+L7DJlfEk5d7z9Ag7eh+2oIUZK6LHqwkNy8TkyiixcgWbDabV
 EsTiM+inBTaN7hyqP/vOCguTXAd5qGYaEdSJO39jYVXT2kL0MdjCvF1DaClEtEb8ZAOS1+V0qv2
 7hqdxQ+NsQCYEWHXuDUllvmUitKiY4HdAbT+T50vsVkchrX/TzItt3F4LDP2eMX/wkWI/nbKQqN
 lkId1Bmm3g01CcPo1utes8nmMdp8sp8kubAhHxOf4V9Nv7RlERgnj0fWC7jdIujoYxTt8BDH/iM
 ox52kJhxrj5FebRmpGQ==
X-Proofpoint-GUID: na5RO43OSnNdya9lypBboa03fVXa7llr
X-Proofpoint-ORIG-GUID: na5RO43OSnNdya9lypBboa03fVXa7llr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100997-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B8A61366D6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 2:25 PM, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Drivers for SM8750 video cc had the same issue. It would be nice if new
> code is being built on top of UPSTREAM code, not downstream.
> ---
>  drivers/clk/qcom/videocc-glymur.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
> index bb3aae6b8396..ea20605dd1e5 100644
> --- a/drivers/clk/qcom/videocc-glymur.c
> +++ b/drivers/clk/qcom/videocc-glymur.c
> @@ -495,7 +495,7 @@ static struct qcom_cc_driver_data video_cc_glymur_driver_data = {
>  	.clk_regs_configure = clk_glymur_regs_configure,
>  };
>  
> -static struct qcom_cc_desc video_cc_glymur_desc = {
> +static const struct qcom_cc_desc video_cc_glymur_desc = {
>  	.config = &video_cc_glymur_regmap_config,
>  	.clks = video_cc_glymur_clocks,
>  	.num_clks = ARRAY_SIZE(video_cc_glymur_clocks),

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


