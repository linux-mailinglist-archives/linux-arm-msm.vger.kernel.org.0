Return-Path: <linux-arm-msm+bounces-100788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKJKH31iymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:46:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E696B35A799
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D0973028C08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BA63C8715;
	Mon, 30 Mar 2026 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIkJbBz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmoXuNBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2933C73FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871046; cv=none; b=lgosGnfJMWA83DXGNOI5ZWq5AkkTEP2/TNIS07YYNNKrqXBGeAxu3/OS6TMSeopGOsgo1nEwGgLlaihQU0p2Y9GK0t9o7XX6aRdsU57phOWpHQbeCJKrJjEs6RR++4ycj5GvX0+jhxqpZ54vougi1n4Au40kkxxKp3pLMtO3GYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871046; c=relaxed/simple;
	bh=rDDAI35LwY4vdXtKXtWrH9zP1Q0+G4S6xmDfjJPBWzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4PgUTNLKyo7lMwzAFWQms3dKxBNq4D0gt30lypFV0vHanFNLYlhzsFNEMIwL4dN5etjsO+wnPvthD+D7FnUtXjmMeZxXv/cD2mWbyHuvbXFENm2olvHkuv1Pp4kb1ewHR/aDFtex/CJVXbDMzZKzz6OBvCyyKG22Yf0B5HsJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIkJbBz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmoXuNBD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U78Ts04161962
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r6RhkK89kHSOIpO38YTi9tc2
	C368dXy4c8JlsfP3zbY=; b=HIkJbBz0ieHVIoGCufLPm64hoN0fXYu20kQJOVtF
	AmId9raNPnNU7EVev2gFirfDlHZ7dKyStwIkMWVuL+Ok8wZdsSr58K/fbwtSIlC7
	AVwi2NFc9CEDBvJ/FxbXXOY6te7RiuTCZZVRLzCsfXVsoNMtPJwFfB5jQU1eRjXP
	3z2FuFl1hJR7b1QkoXPEsym/SR6bdH5uaFcrGuB6eu4e7SjP+12Q3mSLfUsneREE
	8tCi2orf5r3nsjtHPma02fH/VvvOoDjUrYuw8JwZgqDF25BJM+s/9mgLp0EXSzly
	cbB6BFLsMCObTPkS6Kd/iNRIl7e3EKETNWN6UmGGLlgjVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7mhas1y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:44:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091327215dso88525541cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774871044; x=1775475844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r6RhkK89kHSOIpO38YTi9tc2C368dXy4c8JlsfP3zbY=;
        b=kmoXuNBDfbw2rb8k7jhU4mKSHwOnP7XqiF8MsgiMmXVm7xtQf7iFrnHvuOqNwFXzg+
         lguZR9wOEGv15eQlFiMhPEirnCh4FlX+9WWsDOA5ybtLAmIYQ8rXc5wuMlOIvz1URXdE
         NKlCTdEl4bxDONXeoZt+EodFK13tvpiMx/Yu1R7vTY8RwKJ3qyuM8iGmdm84I6SOc4Dz
         y7QrjQZD3o3d0zXS1VU9OI2UE6LbrHt5Zhm34+v6fuCLPes2PFoAfp7ovHQABLsSyEj+
         gQx9MIpnuGD6NAboDGXHL/pMdrGG9/lxmS4oqfP1Tw59PnF0d1kBDaKE6FxUXuogVZUh
         VnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774871044; x=1775475844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6RhkK89kHSOIpO38YTi9tc2C368dXy4c8JlsfP3zbY=;
        b=PlVTflFv43JNJy0QhPdj/4DhcQLuVMUFgZL0jupOMuXOF+gvNyWD3GqsZgM63jIMJw
         Nih0hV94w8ge5juj1ueUpxhmisq+svMDX7bHHx12aEu/E2zuUbJh1ueof87LYToTLy+2
         wRL0MBc9RRtBherBJylzmx8egAjLHtmdfTwXGRDcCmLfOXFGARru48N7vKIQPbcmm8nW
         3pwzkxjBBbOyUELju+OyEIPzemKFfZgWA5E68beJljCW1YEoVEwd2Z/rAJEDKI7Hvukx
         0Khpe+qoP8WgC5lG6Eqd9riV9j9Vhbp0K8rmRLQHdImxzMI+ZEL9/0xmduwoIcwFbeOa
         AnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+5ZyxOYhiefvC63XvCOoEfEVdXG/j2dYEnH2pWkopsPbNPLjZuyxWlPMz+a73T31+Rrtr2+ojOZi0WcXM@vger.kernel.org
X-Gm-Message-State: AOJu0YxKXQY4gnqNIRRYf9AXq0mwa7HGKTe1y930rLFFbp7MDjaSblEO
	a5nVye6AW8Nr3IvyGuMxuE+80U9Z3RxyZVA+A9bvrrxYGe3tgIi1YVygpWBpylKn26tFk1zk8e4
	jv3Q+w9+d+bhgJXtybP7E10+D31P3hu/0nuzLLA/yY2RqtrwsJIVXTyFo2sUjPLN+4rK/
X-Gm-Gg: ATEYQzz4BYJlCPf9ttQaDkuoNiC825MkPJQX6ZnS8+tdU4phdoy+E2zZlw7MAvbXiwE
	iwS8L9B6MG5XUAcIURIeMUs1rv6q02JeRwfXAwmeGowXd0ycHmZgRqAcXHFS/GTW34kvcrvn3Yn
	6KxyKofu+ykCQaTLqy9RVQsxIrlWZjxE/MQXkJwNOS0x3Ys2svI+5HOvSbm+NBOpbPeROlSWj1X
	2fei2lLstI/bhfI5os7wdjmLxtfTpFnEomAR0Z4zIv5IIor2F67f9bq0waP5+yz2aie/gTjN3A2
	SZutWPVb+zn6kKnzCOewCMD361Ipr6WtHBX7sE5RMxd2afMX7Dh8JiurGiexEuLeyknnDjRs23/
	9cuDwHsDqZte5IpbtDuL5Wm+pckmPzuIPnUyNSA667jMv+BxK2pHLg4gAx/XEUx9oZB3fuKUGF1
	CRkzn/5D9Wsb6fsiBewZT7S9xoJsbnwY/BlIU=
X-Received: by 2002:a05:622a:114f:b0:50b:54f5:f769 with SMTP id d75a77b69052e-50ba38098aemr169211621cf.14.1774871043725;
        Mon, 30 Mar 2026 04:44:03 -0700 (PDT)
X-Received: by 2002:a05:622a:114f:b0:50b:54f5:f769 with SMTP id d75a77b69052e-50ba38098aemr169211341cf.14.1774871043306;
        Mon, 30 Mar 2026 04:44:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403e64sm1613119e87.30.2026.03.30.04.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:44:00 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:43:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 2/4] usb: misc: onboard_usb_hub: Add Genesys Logic
 GL3590 hub support
Message-ID: <yuefg36ebldf3te554fwb6jo5h7gwa5csvubzqhhypbjnyxi22@lhfs2x27mtdg>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318040644.3591478-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318040644.3591478-3-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MSBTYWx0ZWRfX0nPJz7i4TRhv
 b+uVM9JD6lb93NzvqrWRfCKTugztbeMBsNytkoKZA88nfgaxSvOIZrrGct+2ftryli9vEAYwQFs
 rsmUNvZ6XPyFRj8oiI9p6gKCWHF2PORA793o+LYPmqWX3e1+Y599fWbdyJLg5DHGWHVlWXdNsYx
 KVy4BxE8oC6VtdMxhyplKRYryi9hGf5lnSn55RFwRT54XdWjyDhcmUw3jrocntMu8YuMP0Oi7i7
 +VXX0zbpZwt1XAic0sEKwi8H0+QGmpplqmwgde9XJt/uTPa0I11/bU03+XbGjqlaEC2QXG6ztrH
 oYicJCsPB/790yG4JFkt3UnCE4DzS61xlzLMC8IuXXV2qZHLbdV8NGmuCG4TXBf4BAJzLR9UEi4
 W/rTz79r/FONw8eN1gQodnIMX1W3PJB2DUCPAUZPZHiqUvKxSR9VBj8tKLf+S9QJiT9JOld+q97
 7wsnD78eB5+r1BzYGrQ==
X-Authority-Analysis: v=2.4 cv=Fbw6BZ+6 c=1 sm=1 tr=0 ts=69ca6204 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=X_ZM2WFtZuAqk53pdE0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: pR26HS2IMCuKBvL4fpz9SLXMC_rmDBon
X-Proofpoint-GUID: pR26HS2IMCuKBvL4fpz9SLXMC_rmDBon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300091
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100788-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E696B35A799
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:36:42AM +0530, Swati Agarwal wrote:
> Add support for the GL3590 4 ports USB3.2 hub.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 1 +
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

