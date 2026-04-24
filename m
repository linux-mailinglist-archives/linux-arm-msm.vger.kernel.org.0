Return-Path: <linux-arm-msm+bounces-104466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOOFLNhj62mtMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:36:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF845E7FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C28C03010909
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD1C3CEB93;
	Fri, 24 Apr 2026 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQSqf75W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZtkjNCG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4043CE4BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777034117; cv=none; b=TVc5e9s0BOH0ZFAo9IpxxhBEo15u34yDKgCfJSVd6yh4xD3ywbBbbjiA44Yh4ycdITq61kX0wueYScHzSVGBYfZGd9AkrlN8JUjkYRwlI5pG+VN1eXe0fqG5CUPDOWTduavm7X8tnOl6Ud04jLs2rY048iayxwNDYGidVljm1u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777034117; c=relaxed/simple;
	bh=tyS4dM8LDNnjVVaEUlU+wgHkXPDXwJ911Mb1Xht0n/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFBldaqwsQCpI/C709140GEHbFhZYHsWhSARd8AXjWwhjk4DoIfTiZYcfEQ62XMuLBGAZBscOGdcynKnLt1dAheZKkqGaKRAxbSmSBa9AUuZ3MxIXvQx1F4Tjapb1BtlwTffM3DR2cOMfWy9KYYWfIe2ja9ooF7/0WVRYuEFqmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQSqf75W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZtkjNCG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9HKQm518371
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mS4jEj5hZGL48AN8abxXOvPH
	Yt2uU4n95DP/sU04rQo=; b=NQSqf75WiCRo4qQuvxaVG5Ww5gse30bh8kfLc/Kd
	qFuuCHlxq5tpJCRFxEJnauDt02h08GI8K7TnylqMrtuej82r70N8yBDo+529sPl2
	AXFFJOAwMP3P91M1nafWxcp8Ro1T6MhBqGrEViVulqo6Gf8k0cR3dyZfwF3wHula
	yNPbld1kPWSnNQyiwEt7kHoHSsG3Gr4LRentlmE2qK82ZQMbHLuV9Ioy25bpDlPB
	Px56zS1AOwOnbv07ZTkf7jecNZXZljvUMcxG6BsnPT6TTOrUd3wefs/OFmR+PxRy
	+p4w6xht8aIqkjhhTYaB2ZDNStPHzJ7hZHvqRAQzGkMWHg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnj7qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:35:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so6833280eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777034114; x=1777638914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mS4jEj5hZGL48AN8abxXOvPHYt2uU4n95DP/sU04rQo=;
        b=GZtkjNCGbgdaX5IjvGNul/n8kpDWHD2f+xNUdjeTZKBfhHOSa9bdNLYct9tjCkgTgS
         oeCeKSubX4Dr0RaQhB4kcF4UYbohtaWP/88FQxmYtB/YtItQHRu/BlVdOilqzaKCbtsu
         fmgYKVJfByT+KEed4OhQBXawItOzfLGC0mTAAUIMkXnBdQMdS9a/U/dt1jlF5+ma9i2d
         ii/ioesJGS09xehiYSysdYdlO4U+itc6meeaguW8W0/HOrcS1gpouP+6nokkeEazszwL
         ns32FOL0bojQ8vSOw9xSYyNo3/S9KQrrF3K0NAWntRcwGvaqoNpCk5qYN609q6zHhHRh
         17Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777034114; x=1777638914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mS4jEj5hZGL48AN8abxXOvPHYt2uU4n95DP/sU04rQo=;
        b=d6YgfGAnSLwu/rUQHZMkDWogLRoXUxlO3+nRyxC12k5fw0vxxVAr01tP+UgyCMgY6v
         c5e5eeJIERaplpVOZLckX1FmVvGGGKW1OazWudJbsjTqscTNYjEf75uWCKdbRPY7rOES
         dBbAYRk+PCy2eMOWSNqItqta6EU3AKGlxU8qNTdSkKRU7OL3DalZ9H8Z4m5ERi0XwnWP
         nmeVS/kFrglCtR6fakN9A46tsoEnbN/KEHjY48ojumWn6Z4YBTP2bvTnEOo0Wn8QXLLg
         EUy0s06haBoDDSXqghI6bDWCdGaCpilBBsvxH7t5ttm0I1GOzibCZniWR9BxNavFVDE0
         ZGnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WwHEV6gQPYouHaL+SCjBsta+qg8tkYseer/HwXoVk5brJk5XMSC7flMbVkLsTY1mrihqbqC5mHei+8ydZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxTpW5dtSSD+NtC7zvPxodeiN/ghZidlY9eavu8CMqUghJlUaZR
	MK1wm0fuGvkU8oNT6dJ+JjjiJ0KVy9raAArBzecoUTHQO1XPoUBP2ppJGn0vv+Y9i9m6oafs4uh
	ucqRkLrgQioCTjh0LkYtiNWD2xHnWSaMB6a/we0OWfxqSKzl2ia5XRBsUXk2OqmP0oHe4
X-Gm-Gg: AeBDietTxDOI0sZGR+hgVYI26UJrxWqAOmahlnHLgqQbitOMFk3Jn1EjbqDxwiIF+Hu
	obcyu3IYHHlJO38iGot7cn1+0OLeJcKtUCr6cYDvY/av16A7vn7kfwF+FIA6AANnKsvpnYWg2h2
	6w60hgokAITh7DkFFMs5d+mtj1taWvRUSouzcZd9gLGA107M/9qovcJKnolu9djzAJWDR2DqJZy
	hx0AVWnCsCeE4AfXZ1R0luX8NLL6WmeNQlbYLiN0rR80QytYpc5GSH0gxnYK39WrYrgSS7NcIEr
	tvbHXAPmW3pO49hRklHVrDs54A/5AsJPxMCB8NpP4BhjKSyBHDGjJor7FcE321hIWcAXv1xyDIC
	XRlFtmZGg10KccL1y4mFGrh9SD0wXdq3JB/FLjlAFC/vXYPFGGXOZqQJWzmq99oOb5zk9qo6n90
	8=
X-Received: by 2002:a05:7300:dc8e:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2e42c348309mr12197813eec.3.1777034113888;
        Fri, 24 Apr 2026 05:35:13 -0700 (PDT)
X-Received: by 2002:a05:7300:dc8e:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2e42c348309mr12197803eec.3.1777034113302;
        Fri, 24 Apr 2026 05:35:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e536e54562sm31403500eec.0.2026.04.24.05.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 05:35:12 -0700 (PDT)
Date: Fri, 24 Apr 2026 20:35:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: Add compatible for Qualcomm Nord SoC
Message-ID: <aetjehmqLd_pLtDE@QCOM-aGQu4IUr3Y>
References: <20260420060524.1248432-1-shengchao.guo@oss.qualcomm.com>
 <20260421-spotted-fiery-crab-4defd7@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-spotted-fiery-crab-4defd7@quoll>
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb6382 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5KkZDER7cISFanajhDQA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfX9S2F/16DMDBK
 IuNWMZNP5DJ63mO/Me+3WGfLD4K3k/QBxLrre1KrJG0AZyfcGukCU+X8YLpICl4piVSIZjsi1cL
 UTXLQHzMA3ffOuIVYfJkheWmV3bNVHHGegsCWaD/xnubSg/pT6lVwu4O3xILyAjR/lK0Fbd3DSh
 NupfppR+WQJ9SfYiuKoWKGKixhdliMp58061afWa2DPflXXw6cTM/pOc/Km+WDYIzLXvbbrtL1b
 WkK7+FGf/WsLWgAOjOZFWr34WuHjhVLJh+uvfXtNrER6VebnQT0nUomz8PAC9BF8B2Ht+vFlTbs
 wPW8UXuIx5+RxRWphUuJmpfPdFIagvw4Lk9SPWbW6tVNtCqsvKa9EY0LybZ+pqKQmttLj1M+wtu
 bu75I9KNOLqa4w6PErygJ+GAZBheOOMJ0pnkFx52SDinmEwvE1Y6bvAkdrxpMGpizldLNI6rUnC
 Fru8LD2q99OdyITmXVg==
X-Proofpoint-ORIG-GUID: zhC3CKCFcpXDm7I3GziSyy9M5EMFXIzv
X-Proofpoint-GUID: zhC3CKCFcpXDm7I3GziSyy9M5EMFXIzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240117
X-Rspamd-Queue-Id: B1FF845E7FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104466-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 21, 2026 at 12:34:33PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 20, 2026 at 02:05:24PM +0800, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Document compatibles for QUP GENI UART controller on Nord SoC with
> > fallback on SA8255P compatibles.
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../bindings/serial/qcom,sa8255p-geni-uart.yaml     | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you, Krzysztof!

As explained to Rob [1], I would like to send a new version by using
'sa8797p' instead of 'nord-auto' in the compatible strings. I intend
to keep your review tag, but please let me know if you want to withdraw
the tag.

Shawn

[1] https://lore.kernel.org/all/aeowYpvA6MegAX6w@QCOM-aGQu4IUr3Y/

