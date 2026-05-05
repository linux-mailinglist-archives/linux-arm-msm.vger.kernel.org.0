Return-Path: <linux-arm-msm+bounces-105957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEj+D5Hi+WmlEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:29:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A94D64CD79D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A57C13054FF4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5789B428485;
	Tue,  5 May 2026 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbABQrPT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4EHJE14"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD7D4279F2
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984097; cv=none; b=bZCltwU5SrsHoVZtFJb/+jEsoHLOYJW50atRHBZkG65tMho68sKza4PO/Wfls0hHaLQ89ye51jREPfSVCCFrjIKfgShVmds4lHYynbhr2NhTF1ki6jp3iGkQFkk74n2dOtI/7UkIHCaKd7nma5hg/1OsThGzMisj3NfuAhiF6GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984097; c=relaxed/simple;
	bh=QVSB9zeW1cVzDZImJhmHKrMSkvonZyQf+Q0wWptgK30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQgyHzCg03EIlB5ttijBwyDrja0M2vktEUnotqF6rViBBrlHB9REdGuxttvLwmeBON8AjWQAJYqVzMfTFJNjbVHOHgzgknJlerPfeNEByjaTPB1Owau82HDvuveqTxPt9LjzCQVssPxhd5SFAzVthH5xuU+a6RstpGVy1mZl8jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbABQrPT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4EHJE14; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645B6kam3091762
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 12:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ioGBgPg0meuZmu17V+uTlq0
	kyQl/5OzhCXSdlo9Zp0=; b=WbABQrPT3PY4U20cAxhjIVRutXNGLPDsFseVBz9V
	8o4pvRnRhbRbvn/qEOoOpo0JKGMrgvdLh0pWYQIXDXctRKVFfarsgY9k9oG9fKdM
	MPaXH5lZt6XRGEMppR9SMtzweevlyFKYJPjCRY6ppQDi1Hm/hxRQ1eEy7r7wFwaw
	66jhGJl7bY0fKpWE+bcpX71mUNLcKg/1bExz5hv1ltpKVyz1JlIYkBbV9ZGRhKTh
	4QImP+IIBoinege0FcsfkaDZYKaVpPdlfnRoRVixuoN14LcBEfY2V4mojg9i7l79
	fsyF10qEd8qqvMIoB3K/tKBj3pLhnh/82DdeoE3Hfn5Y5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct07tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:28:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so121524461cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777984094; x=1778588894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ioGBgPg0meuZmu17V+uTlq0kyQl/5OzhCXSdlo9Zp0=;
        b=E4EHJE14+iwX23lQr6DKri9VOe5FpGUI0APT6JDpXN53n2J0GhmVxmpgqL5uZYAQm8
         oTTLukA6n7aK6N+z42gLnzHKTEcYmJ2/r4EF4CC36yUODT7GDjH8UHS2+5rfYU3zSG+g
         XXVlC4TN+QqSbpZrsN3El7gA7wNZxVxgoTRzFpky9Cqglsu/7ZwxE+oYQCL3YtxCXNp1
         /7/awFtB3eUuTGaatfiBxPLvTM/y6MTSCCahXSd1stBb5B45uI5JUD0s3PvMurax4z76
         dqjje00hAyoYwGVg4djYwUdIjMagLZRwny/FGh0lG+P29dxx3cqKFmGtJCZ/96Fy0rtW
         FTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984094; x=1778588894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ioGBgPg0meuZmu17V+uTlq0kyQl/5OzhCXSdlo9Zp0=;
        b=qHIVqNDWwStyNgLfDax4xTILlvVHI34oG3I+SFMr2frfWfmkeB3JpSIdglDeZ9Hwfu
         PxI2GPJ+oyr5OzR1qN4myij6ErA1GeeqfdWbafvYTinjV/KgiFsCCin5FhUkhEaWPwIx
         J1suN/s6Z8q5gZ2SoJHS/Xq5yq4r6tttYTbXZbiYZTK5RvXWXzSI37iQuUtabaT0ST3N
         Sv092weik8CBHhBkijL8E8f7mxXJRXHnsevuiBzhVuGz+d8yRtM04QcqGIk6oeTAOouN
         X+5uhVN7pTgtg3j09OeJMmFkn1MxMmGEDQsPLQvMxqm2sApOTDnR8VW4oPbgE4OWPsJs
         oaEw==
X-Forwarded-Encrypted: i=1; AFNElJ865UP7GxIhFw+E36v8nuINIA198FAITMIiHNY8fqKcx1Yd+FLnrktYojTcZzBpm2vYEL+YuZQL39GlnIZt@vger.kernel.org
X-Gm-Message-State: AOJu0YyLwvZlFOud5i1pzstsg+Fbe367AHWMbGOrhmpzGoeFVnejtDLN
	2LieACMb0Y1Me2zwgph9nXllVEvHS0B7P5q2FHZ+vC60d1RO+ps4xe9nUmhChZykBhdyYF1U8oE
	8Y/qG0BXiQNg/XBHNL+EwypTp7WDTPSCTkkhKBCGywApQr7fHJRX3vuHOjLYKS22JU52e
X-Gm-Gg: AeBDiesTjYtpsh4GZ0MCGVEVtDjZWTS4D80cMU6uAq3oCgxON7ceEPgorRDK0bZa/Fd
	0CwypynecLyt3hfznzuUtDYt7uKLYEM9phtMS4LEix4Ak14qhw6pTgTUW30mpphh0CmrPCIl080
	CgZoi6P+BvREqfA/jOHI6ENCS0MPsGkx/mbDDtr+Hz5dp1ePmqfhC8xE0ySF5nHlFSZFBaTOvXk
	GU/mapZWNj86MXTPnWpvJ5eOUJRPc4qeX9ijecWw1weJqey8FsltOeN8SYbrtdCo2o3y2Uwdd+7
	T2+ml6rbo3ttoEA/5sYOPCJhHrXt1fTpYyQ4qFA5gpITS8Y3bX1XCY/1O3HKVMquySAin6Wxn5p
	AR6MV2Ub73zj4zuPn8fwxlc5z+554bO6nCPOdV+rYTK1ONfXLZBxAXekDo9ob2N0fv6Yp3QlJE1
	1oTZI2bvkB/onpOvDd9vjnGbDhxFryuaev+V+awesilgYYnA==
X-Received: by 2002:a05:622a:199d:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-5104be2d0abmr204278401cf.15.1777984094394;
        Tue, 05 May 2026 05:28:14 -0700 (PDT)
X-Received: by 2002:a05:622a:199d:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-5104be2d0abmr204277971cf.15.1777984093941;
        Tue, 05 May 2026 05:28:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346ccdsm3833837e87.72.2026.05.05.05.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:28:12 -0700 (PDT)
Date: Tue, 5 May 2026 15:28:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: Move MODULE_DEVICE_TABLE next to the table
 itself
Message-ID: <et542nhqmxzs3vii53inljlfhvs2g7p57etntggrx6q47vig2a@ixtxrribjjsc>
References: <20260505102854.186925-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505102854.186925-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: x0135fbN_L4EcXGfvw1tgjaoHm-g0xaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExOCBTYWx0ZWRfX1aNj1HvL790L
 VgvvEUertrYZTTfoMKBgJ9aL2S6icYdpI1GjhF4FfJ0yHhh7Rb4IKLklnoLZkitlo8kfOyr3aVB
 4O/SLnq1UbcqjrsQCvNLHIN+Z8oIX7TkOs/g2j/UI8dEt3y3XxcfzriBn9SVHLkXCo+LWugUh2o
 OgfwTCpzkCghIsmOO6rhjEvhxAsJ7Js2i1U4vtReZgUhYyqhX+5PBmG9m2aIXPz/lNtp0fTJ6ha
 kcu6ujCxXgCWG3/UfqtL78vz52RL6om/2kTBCsWBi9gnSZzjl61zBf67LEhe8steDxo4pByqRtj
 hV+72QZ3TL6BG61hUAhhPfIO5G3k7jZSSTUKx73tMLf/bubyjPklSRgV7/XsvxZm8u7A2HNeY+k
 MMyJWXdYhrYBNQI2KQACtjBoM0/+P+fQ+kgqI1BVaONT2yvSsg3PP8X9VFS+oBtkn8cBGp0Ji1A
 l+YVFaNzyDO1EGNj/Vg==
X-Proofpoint-ORIG-GUID: x0135fbN_L4EcXGfvw1tgjaoHm-g0xaQ
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69f9e25f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=kQAhAZ4d5FSSWymYSLQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050118
X-Rspamd-Queue-Id: A94D64CD79D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105957-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, May 05, 2026 at 12:28:55PM +0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/msm8953.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

