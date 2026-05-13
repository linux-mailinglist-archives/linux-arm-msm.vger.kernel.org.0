Return-Path: <linux-arm-msm+bounces-107354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBlGHISLBGqvLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:32:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB915351EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48973308282D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1899D421885;
	Wed, 13 May 2026 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaOAPn+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAzJPTLQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA93212FAD
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682282; cv=none; b=E3wlTZqy9fZN7XB9ypc0ZmKjQbWVyFbkOG36v0DRpJ4/czp52MQOgVfPfZ1zq2GZYPfdvFTIzbkC8D7ttE+sOFK7556tNmwMZkhsqVVP0Hne8GFiVrpmSZVBr9Sg6sqJervsqm09UKr2V2rqX52x6D+lnMITjLR1VWbCuto46lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682282; c=relaxed/simple;
	bh=v9DNVcgbp6AvN+3guy/5FOJyEoFIXSrq36l0ZPnSLU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/r9iJ/zoHE6qRnaRoVaSHNQufi89HUQUO6G1J0PkmqZiPmtnDB8WnduOhYYyck/iKQE3pG6dyFE+e6x5tZHERAeoqSz/ggDtaD6VEIaG8p73MFnm59tth5V1wYRnSZpiZ1OlVZao6Bs17AItL0EmKUYfHaOswdo+nwiC/qccfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DaOAPn+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAzJPTLQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8n96E2887823
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+mcP5MFy7RzNuC9vLmEtmub5
	kAChPr9XMnvsErhT83c=; b=DaOAPn+DOeblJ51Avd5Ur1liXcVibs5AnVxaRvR0
	Jvvuav8lFcqejdKoKFsa3PXChYS789s9Fyp44G8Y+N9sg5yQ8MyCROp3qZxRwIPr
	5Yo45Ju5TZHYzA8SGXIKdlIigz8ujijlwz2NAjJSSdujO818dbaPL6ijKay/5neQ
	OqJfwwVH9e31Gbb4tayVx3G42FOHZey2hQvKZAAI6hkwse4yZu14p/S8hw6hPywp
	4hMuYXAew/qTQif80owSphr0BxA3FZOmXJ1/ilPio0vdpUyt5wz5BAM9iapZlhsy
	z+5w1D0Ln9Hvm22ZAV+Ca1Cwy15+oMq2hjpIsIfc0QvWZQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gh95q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:24:40 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63308aa427fso1882316137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682279; x=1779287079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mcP5MFy7RzNuC9vLmEtmub5kAChPr9XMnvsErhT83c=;
        b=jAzJPTLQ6OF/uF0ZzNFvQnSiQPSz0TFMXnqhIkfLzzZvsUeVoICXd1oNsOY/tLNlLq
         DCW4Fnt090t9Mymahe8aXzIxIUtY+3VQ2KoNIVH4MhI4zNy416J+eSiEeS5itl9IDoKn
         e+UVjGizBeGcEgXjHg/GIQR08jj62voCHzY3/RuVOAPOxYKnScUsI+fmUokqaUyib1Z2
         9Pbk7rfklRIayNwb7xHpZKEz23vOTczsr9qNPSx3dIdqy8A9lw3sZIDDUUoNrYyWxvOh
         Pt0BhF3QvkwWvElSYtLv7SWzQqr1giX5zB0gyAgTRyVu43ySEb5+mOc14zx+xol44UPS
         qwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682279; x=1779287079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mcP5MFy7RzNuC9vLmEtmub5kAChPr9XMnvsErhT83c=;
        b=fA59wUsGOlJwTRzP2NRSsv2Wn4fTAXPrKVKnvaZgefFQoXyvOQPqg2afG3v1/3fyWL
         E4fO/2uA0pm8Ip15Yd+J3yLCs2rH13K2BXvKBz7mrsRf/w33mPQng9z0BjHnPpCO/xlo
         Gg8V10WQgwyD48G59EEIiUSrqOSSW9+poNnPEo6yOiFT9rXXbdlZ8tB50hTaB7rU8tA2
         3peTR5q2f1w+3pJpsf0pS5rG7c79JeRcyqKi2NLJ68ebHwRCsvzuIQ76qeJrBtcACqs1
         gA3k3mcfEBsWWBbLU3KCcev10MXXTS7gjzJ4uyhf+FSRp+axYV750kodTyqUOnFnXrYc
         9rlA==
X-Forwarded-Encrypted: i=1; AFNElJ+eA/qwOwoMPYCBS8N6jpAnW8EceZfK3aF+Z4uH+N3llH9V8KaV3oHLqmjtQbH0GHJysHF6fUZmwoQxjP0c@vger.kernel.org
X-Gm-Message-State: AOJu0YzTao3FPKrAiN240XgDthpSvO77fp84LQtOPieIUuRB3EEKpk75
	wWGCnufzhIrUJW0H4MyOwDZDm0HKPI8xvnSHO8vH2x4UsLQCGABD90B/m2U6yFj9SUcHLTjSKTF
	NyjW+nJvTWFD14U8nj15DFRxDcHgaweR9cmdlEfYcZOyl8owkbQ20Lnzb+wBdC8QAeW1F
X-Gm-Gg: Acq92OEiUK70c7t1QCA6ZJ6mrw9QJ2qrnFRALf+jEcgjEyFDg656of66JIK/0Euzs6u
	P2AWXNROHJEa0oZWR5QW+pw3n9yBu8uYUjxpXqFZ7Aj6TjrM4Gz+AnPm8zXnQtzy++KFcGdl7K2
	J/hUbAVy7RRsJoy0vMMi6vcXi1aUEgZov07e1r8IIuzV3mTL3uaQJLmATu5XO4BKH70iWI/c4Av
	FhceIhHxt0dSkmPch6QR/KZ56zFpA+4B1859oUsxgzMkE/Y1gI5jP392h4nsWkwkvGsXUab4c0H
	xnU3HWuP0yb1+Z12++Nk8CYp9wkNd16HxIisu8i7PNZgTayEFKJmqPCwRqmhS338ftIFLRlR84p
	Kwz6udTmEm1MA89r3dmwJq6sF5bz/nvAGtow8Pmte8lkCHTa2G5jJB4iRVGmDyTptuF7Cp6uuEj
	YjZ5nAP/JrKkIMY4YRquUZLHxXhMlLCDL/53c=
X-Received: by 2002:a05:6102:3907:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-63771e9aa85mr1645015137.11.1778682279069;
        Wed, 13 May 2026 07:24:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3907:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-63771e9aa85mr1644975137.11.1778682278513;
        Wed, 13 May 2026 07:24:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4198174e87.66.2026.05.13.07.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:24:37 -0700 (PDT)
Date: Wed, 13 May 2026 17:24:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
Message-ID: <mlkphm6papkmtyvpafrllev7vzk6rr44bbll25p7gdwbx7codp@rz6m3xd4gytt>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
X-Proofpoint-GUID: luXMWLKVf5Uqoo4S--cd1tr3WreRiijk
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a0489a8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zvxfrTDFQEmcjWDhNOoA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: luXMWLKVf5Uqoo4S--cd1tr3WreRiijk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX6c+67AARyEr5
 ibnJKAG9TPKCsT1UDrXJTi/Aq7VajHL3SVUADLOxg6BfxrgABvhrkwWDt9GeGqhEKK4LmOqBo4o
 Nk3SwEeRNRHs6ST1WZQToDzhObXDiMnGj24zFNWoU6L64kEPNQ6KBmpqhJ2rdZehzfTQw63qVPb
 n+yqqtiHkhG3T3tM+YPrZFGq1VQLYNYIAaxLRbuEeXnduIOyoblhRafygryDfE8GGST/7T75nfA
 XtXBtEHAQvBip3Isr02mOwLgYnbdECfCt9gqHtgsG3q+5ShiscwYfygkFZDK2A5avhVqaOssRHY
 vUWug33TP8Ta7tKS4GU60hFUoR592Fo14bmwbvDEAwRhvKOmNhuQ3wRXqNb9STipY/IHgq/Xw8E
 dHekhKX+/4OgDWseWA8zniGcIaeokocJhWQj3adhK0q5t0Bj8LlursI3VuDi+4NrnZfmrbJQBb/
 ddNCzdFQQEUkMKobtDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147
X-Rspamd-Queue-Id: 5AB915351EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107354-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:18:53PM +0300, Abel Vesa wrote:
> The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
> node. Add qhs_sdc1 to the provider node table and qsm_cfg links so
> SDCC1 interconnect paths can resolve to a provider node.
> 
> Bump the qsm_cfg link count to match the new entry.
> 
> Fixes: a39efc80ff50 ("interconnect: qcom: Add Eliza interconnect provider driver")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/eliza.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

