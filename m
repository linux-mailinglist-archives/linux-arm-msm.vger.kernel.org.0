Return-Path: <linux-arm-msm+bounces-91563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBmhHfoKgWkCDwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 21:37:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D61D1272
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 21:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51128300373C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 20:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696753033C7;
	Mon,  2 Feb 2026 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6WKG7OJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5+AgDD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126982D028A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 20:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064593; cv=none; b=EJg4ifzvW3KnSczkhPY30lNwgK3ZCKWip8tAfDAEusabacp424ODDDJ1vHs75+rFRbqUD+DqIszL+FvldzJpbGIOMYjUsfWQowab5aSXOlI0tyVfcInVp/3VpVq6F0WBAZO8JEEEiS4WeI9VSwW6dcl6NOFdUqG0aIg/GH8sAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064593; c=relaxed/simple;
	bh=cFAedMFN/XZ3dKYVnc/Dk3TOJBd26XbUVgj0LnwonIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUznKKXYTZhWR8dbbV+/rcg9EM25clYn/it/7Fkhh0sP4h6pbFQp7bPtcUtz9Q86hh6ww4CnVxe0L9866zTo7obXpNXkH3wok3SfXJNW3hpm0foQk0zlluJMXCLZ6eizTqiL9BaShI9O641evRMfCIuFL8A4i+9hErODy3i+b3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6WKG7OJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5+AgDD7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JEtV43916180
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 20:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbwJSPgt7gA53ZZR3Ht+lc0M
	HdennY+KJOsIXiBPlfQ=; b=b6WKG7OJCih5/90LNxwb83RuHxnzDYCvyAD3wzd2
	B4dwoe6z7v1jQykQAX5BtdUdFhms+H5K9j8c1ZOsfkrSRQEj6h56C21/KX/jpQC1
	Vhx3T0C/rq7f5/TO1RGAENTM6S5f1RsH0OIsQAoHV8Ie+BkBiuWk5IYcVz14eHTw
	NidojeiMHO0pSsybwLG0lL0VXf0tTKT8meHJwpmZ2jNCOImW1zUIhSou+n2cwRRo
	XcmTfGsXP4B8looyBOcPQEVqunermAWESBq8jYhvY1ElabkH6WK+TJXeDNLKqHuN
	YwAFp5AgaxnIzi81LVvh2G9Qn+JRlnNmauZVhnwiH6NJHw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmhrvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 20:36:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50336ebabe0so5187881cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 12:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770064589; x=1770669389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbwJSPgt7gA53ZZR3Ht+lc0MHdennY+KJOsIXiBPlfQ=;
        b=b5+AgDD7eHZa8oXfv7D8oHKd73RR8K43zqDR5Gd7TwshluLgXxEc66sz+G59e48698
         O0DCMQgLwivl6FW7BEfOjypozMo6g/F/ME8ag6RByvZsq9pOHLlhR96QBixat1vyQ07E
         RGBYmnGEfOaaChQi/MDSLtb7ljWun15RAMdekAt6Ig2Kx+c27Sgj3HZ2Te+DQhfjjZ0Z
         d8ITM75OSnkiODNeWvo1MxQcria1PJ9NjhNa3wogdjBEbHPi3uJoejTQSIDSITnH14YT
         LQMwqsBcCiRbL6Z7SCkTXsqkP1xSP9xflVp1Czk3xDIQ4p5AaluwjdH06XwGN6TLYYB7
         PqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064589; x=1770669389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbwJSPgt7gA53ZZR3Ht+lc0MHdennY+KJOsIXiBPlfQ=;
        b=s3L44a8ceZIcgwWQvYbmCoDwDWTJex5Q5gBelQq+lNnGC09wUX8YgkUnNK2oTM/vk5
         yfGjVQ6JwF3HyuPgi04YvESamKCQWccpheNcCIIW1b44nI+nLkLihATztfqzMbjonWaU
         cHJOXil17uuvgUCOV6uaTR7r/DMsKalXW8Jdrq2OjnUued3HGJLCA8UabU1ns6tsYE/H
         RcwBFd3bQOav0Asj105I7bPfTd906fX75UtK1q2jmsYrurycDDqzn19zgFmnb+kwQbma
         lavh22nUtjLMNGsJTML0plwDl0fpoSMwCUlWUUGUBGuKSJ53Mz4JaolKFCU8HY56ZkFB
         MsLg==
X-Forwarded-Encrypted: i=1; AJvYcCXTwtjBkvrYudwwRodgq8xQWxwKgYBsV5gYqIVQQGEt212vuTUj3QGspX+S++B/Eb3JhP2dD75lO4hHmXJN@vger.kernel.org
X-Gm-Message-State: AOJu0YxgQTk/6ZJmxQSGFrQD4ElM4fsiyXUbO1tweBhm5JcTM7cqaKWh
	+1LKbwfCyUcbLror8VuYRxsDjn4othAM1Igo5aLlWt4V9NJHH9jrEq+Tcry35mMo3nLaOx/CPIh
	3PIy/Qt7vQnYBc/DlL7UJ/KW6BPr675XE/ua6DKgCLpjP05mvOi0PFGjdZH2bkyw2uS8B
X-Gm-Gg: AZuq6aIzYTlVuZuH2+oOZ7O04CbzYEVBRhAmirod08mzCBXSy/NALf7F5fIIRIEn7Et
	UEdQwecFOLpLuP7ykTUDhBz0vxH20LGxyYNMtpSf2avis6aiIfJkLAwi56dDScCLFd1azLDLWdp
	MjVeA3yUHphln5Pp455zufDABE75c5mQeqWxm3HUZwWLIo1rGLlGNF8OaI/WGB0zasLpYoftKIl
	SRQiVRA6Inc74AR+XV9XcWSBQgREb5c0rce55oDf82fBBMuWAZp+zmY1VXAv9mPbYGcuOBV1dy/
	44qhlPLs/EriOX8wmKcQPhYdg8eVs+l1rEAqiiCYTHVDZTTOYYrTQmAKflD8hoPWzuYefbBLUz+
	o6jISW7+TBStS6hek4PQK9Xo04EhOhNOi7PX4rezzQvHNQZzhF3TS7h+cXefTNpfHCqmoqAi6HR
	S670CRaED1/NcDRWV/R0HYP/U=
X-Received: by 2002:a05:620a:444e:b0:8c7:79d:f91b with SMTP id af79cd13be357-8ca2032ed87mr95560485a.6.1770064589437;
        Mon, 02 Feb 2026 12:36:29 -0800 (PST)
X-Received: by 2002:a05:620a:444e:b0:8c7:79d:f91b with SMTP id af79cd13be357-8ca2032ed87mr95556585a.6.1770064588970;
        Mon, 02 Feb 2026 12:36:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c43e36sm31363081fa.8.2026.02.02.12.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:36:28 -0800 (PST)
Date: Mon, 2 Feb 2026 22:36:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: qcom: videocc-glymur: Add video clock
 controller driver for Glymur
Message-ID: <3y4m3c2qf6ysvkt3cqkatzklwbmxkoxmxyxfu2tu5r5jpcejsw@dqf2kp7rur3f>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
 <20260202-glymur_videocc-v2-4-8f7d8b4d8edd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-glymur_videocc-v2-4-8f7d8b4d8edd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=69810acd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: dQzgH4GyzNYXUnztn_DcAIOtDMCGarPG
X-Proofpoint-ORIG-GUID: dQzgH4GyzNYXUnztn_DcAIOtDMCGarPG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE2MSBTYWx0ZWRfXyWTyjANME/2s
 rBq0nWeTOlLha5d0gtypZuWczj1V8PFrZgb7LmtcDTSKlxVVxU03Nb1X02BIiT+vy10l7+Zz9o5
 flTWtO39gPxLb67gjynniEw7vJDmpDPaLp5W3acp7Zqhy6w3rGKltlReILOUk8eWo0B9xnwTJ3R
 eGw1QEyvSOgp/0izf3kyh1VL2RS3Aq3qkWaL3dYjB2tOki4spqb5006KdQMIGRXXY2a4VeowJ59
 OeXQcc6jxvpFXdAnoyJ6JQp3qEiw77jB93Sz3D4HihoSJ1zfBL34Qae4bAVrqyWVb0W3Wn0wogS
 pgKi7nU0rXuyhUKWaNhIv7pXo5Yee32tNR4Q2WOVhqyH8e+iu8Fp8pQgYnyws4mVjSn6cCQsSR4
 9NGyR2JkFS4LsfOkuCvc7EXebP5inDgJEPjwp9vT/66hY3gIL/bGrOkOUuziqbnwGEiZLYYhPbg
 o00jE4MfQlUQGcf9gHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91563-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4D61D1272
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 04:26:53PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |   9 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-glymur.c | 533 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 543 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

