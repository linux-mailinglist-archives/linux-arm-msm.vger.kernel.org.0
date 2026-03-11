Return-Path: <linux-arm-msm+bounces-96796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIjBMSLGsGnTmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:32:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2892725A5AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6C4E3138EB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D42365A19;
	Wed, 11 Mar 2026 01:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9m4Efsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O96O4I7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32D2D0617
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773192733; cv=none; b=ozsBf8r9aLCU7eH7NrWUSpa1QSjUAEQ49t6Uu+TLKsUWRhPMOfcXzBUlwLY1TwfLYgl9S48NP9QZ4dPbI7/5V6CbxQsmmUAZawlSRnJjCgfrY2fcqbnlHivyee8zZ5sgs9bwAIJkQwj3JSo8/sNow0GYKumnQHEhPFXMO2mvDv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773192733; c=relaxed/simple;
	bh=62McvjnrRf38byDSx8kuXLQIr1z2+8msCgGQAJ8XYQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6hq8WmkvL/ashUIkkVzPUQdGZ95PpMH+HT+scvbkYdkvt88Nf1uJlFQNIOGO96io0wek8AiRmoSSWqdK/0YVxu7dPF6wzy046SmnUAY0KcRg7SKQeHCcikKAHvN0krIl4qgnm0j63RmINVs6nUBnWakmgmRXN13POn2R/BTBL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9m4Efsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O96O4I7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIccGr3760404
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6jr313rzYSza0mek6eX7tJDZ
	hZe4DMTE5zhNfkpkyYU=; b=P9m4Efsyvb8Z7O4tvL8SHvbUds2vJEs7uIQu3mRP
	F80XwKJIUmneNpTtsXDVjxrP0NJu0tR2VvX9hnuqJ+B3reTDZhw8kMb3RouyEpBR
	Gtp3axZFmJqcZ8Stj2JAnvtci7EjHDkeHjKknfcxKiXN61Fm1rZVzrKyKrkfNg5z
	u8fPV3Y0h87SjAFjmykFSwdfOJ7Yc60/70Zkz0NndYR0gEIFWfJZ5ZNznaX1vnTr
	YL5uibVIDtSfWZOP4/71VGSffU/V7oyFWsH0WEkDazky09ZsVBUUy2fzGAaKaVsO
	UaEwp0LP9LQF/U7VBER2qbOER7fCwM5e8SE+6XVjxznhvg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ujppf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:32:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd781c0d90so264874985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 18:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773192730; x=1773797530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6jr313rzYSza0mek6eX7tJDZhZe4DMTE5zhNfkpkyYU=;
        b=O96O4I7sDem6HSuWSMJfNaizZr+4MbqPmBIf8Qv4zWGBnXmm+LxTOgs+qdiIVKndAq
         hcgV63Np4IZEQ+Vq5/xcP2Q0JpiUvQqP1KpCyVHqaAngrcULt9RIwrAm7X4po5t30+Dp
         uDcGqlIdMr7D0oEc/XytzWgoLhF/Gpn5Nw+GhC4+XTg2cVu1NhDgs1hxwkJZ7WO4b/Lt
         C5OJK1s59r+7wm5r+k8R3Nb9tjy8cVvawwyOoR34GhiqHqSzZb/5wwA1089SAiAPFHHP
         PCzLHp341PE1zU0mWHRWxgv6nKRlyCq+rte68O9F12wS1Z/ZoeTnYuHnaH5z6Uzj9So9
         QXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192730; x=1773797530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jr313rzYSza0mek6eX7tJDZhZe4DMTE5zhNfkpkyYU=;
        b=iU1eQ0tcYYrTC9kuFSHuWwepNvOlacfRiw0apDYvoHRUdm4KGA0w4YAxlPhrKZDbCM
         WrrkNYQy3LkeZFh6nlpbrMtYRivQLS23vdeBX9NseHkvHGIiGjGPrcahnLNL1sSKzsoL
         BEYdx9fq7SklWFB6UeS0ig6IiCl6FrUQrg7UhHhp/CpDjqoKutd8V0iP7KNrMBqI7602
         hfWw294UL/k6azZ4lsNYXyJew/8mMdMLPPHh/qN2M4+o1UPTkFFgZhHVfCXOWF3yeg00
         lQgZlODO9xQGnmMUE+lg49FmVnX90sRy8n1VPHbIX3zPtTXm7BLE87rxKqq64VnjkwGg
         92Cw==
X-Forwarded-Encrypted: i=1; AJvYcCX0OLN6fJgz9S8RQtnmS1Nxarw2VYCVgKHIQ/ajeWq1pVeNSiS8HiD2KEDGBK/Wko/bqHDx8zqZlK9OP+Nv@vger.kernel.org
X-Gm-Message-State: AOJu0YxsgGAWtEAJqmGBIx4EmbFXAtfyo7DXB45cYzqurKO/QqWgDsoE
	B1lbj4CfUP1VbFijtyERfXJvfbuzsZV5YfV2wdhNcboatq4KvTK32NZntiTWHx11dzMoY7PRJ9x
	ueZ1wQDqQGfb/cGgc8v7XORgN9KWrzcvBngOD7pLyJDblOzWgYiC1ln/PX4jqX5t89IBc
X-Gm-Gg: ATEYQzxQa1RxrNAbsNYLGS5ulM9DECsF7fFifyfe/6/sXnGMCVpUJi+ZLwnoZLb6p5A
	1sPhfAi1ajKzjVgu5ihPPNIN2dZ5Jlev0vrHGfffmEwNdo7YaPoximkQRQyARd29BBa2ElLhVXo
	4kuPjWp7i0dIE/+cPW+Q9zyS2VTsAE00O9G5AJ/tFxm3gskupcVR+Hyok5Mnkk38fjkPMxTu/4y
	hmyG0Y+7XcPzxPM2zx27URRhP8qwpMHa2Ao0XM5yMVKr8IWseCveHL2ZHKUzsJwC6rhnjqgLX5U
	22tko/69qYWQjzYOD0SQYjPd3woGRnpso7fUw+nr1oMNva71hF3XYlaxLDNNT7jbtlLqxNxk1UZ
	NYtESd89QCJ3PumpyUETDJU4G3mw385bAj6oCimSEezs4HK5Q0dHIma8HNPPwGp9kB9S2E+f3NC
	lSyFaMElI8b/tkDCEYPuayJ88NYl1yASF9RZU=
X-Received: by 2002:a05:620a:890b:b0:8cd:9584:6340 with SMTP id af79cd13be357-8cd95847345mr207206985a.43.1773192730121;
        Tue, 10 Mar 2026 18:32:10 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:8cd:9584:6340 with SMTP id af79cd13be357-8cd95847345mr207205685a.43.1773192729682;
        Tue, 10 Mar 2026 18:32:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33e51sm129141e87.14.2026.03.10.18.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:32:08 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:32:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup
 ownership
Message-ID: <2kqcac7xsvdoqrsgttxdud2avzn6bmeqq47tk4xd2uy7dt6gje@q37enph6wcda>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gm3R2T2SCEr_x3Ph69Dtik1xX9K9OIen
X-Proofpoint-GUID: gm3R2T2SCEr_x3Ph69Dtik1xX9K9OIen
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0c61b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ubSMT9RlIHTlT3bI7wkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMCBTYWx0ZWRfX79SEYJqZkyBb
 ZBhXUVHWcDkGgLDyf079lTX2Z2OmQyA5agITdeMEMfYSbkeAUlrjGYt300b3IN4eAfWJozvtNAS
 rWQiCJWvBQEcCcbAyjWJpeEQ8Xjjc5JtbrFH+5Wf9ZkHyIpEPK3lqO5UVhK8TsSbHN54xzRb/c3
 Jz8oOvU5YV20WE45KKGKodXcIGnv11VOCnHQJ257lgXeRWV/U76SRhPWbwlTPfQYOOQfJxW3T5t
 ozUYb3x0U25Gdk7OiWfS/y2jx1I/0y8NoVtsP1tQ32Q0+fT4Q+8CRMOa+u5q/wXur431E6s38wL
 nkEBy8lIYe2JgnZ1MeKruWi/xkGz/tPJu3aydjeaiUiiSNLrhOZ7E084Ev3moKE4xyPQpZUMJ/1
 ibL4OOzwlfaLvE7IjnqPPTtKB5JjYxBBFkngHoZ4mmd/zSnPvjgNbI3/Q4J0yved9mW9No6Qgf7
 0cvj8YGyuhC8+a6KLSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110010
X-Rspamd-Queue-Id: 2892725A5AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96796-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:09:04PM -0500, Bjorn Andersson wrote:
> PDR and SSR callbacks are registred from the controller probe function,
> but currently released from the child device's remove function.
> 
> In the next commit the controller probe function will be modified such
> that the error path will unregister the child device, resulting in a
> double free of these resources.

I'd just say that the foo_remove() should (only) be unwinding what was
done in foo_probe().

With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

