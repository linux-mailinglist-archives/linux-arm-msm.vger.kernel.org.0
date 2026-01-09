Return-Path: <linux-arm-msm+bounces-88277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 619ABD0A527
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED59D3027819
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 12:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A07732BF21;
	Fri,  9 Jan 2026 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOkMavDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eveh3GqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1B1A58D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963307; cv=none; b=ds5tI9Rg6hHAPN89Os++Wws9UL+YZHBle3c2qLQtfJ154DD8RPMmDT6g4JQBk50u0awQz8YhcEX5pfk91m3Q6DLo8/ay3RoKvZVQeticyoOHpHtfhgR7bG29KAJlNRuloVfcbQXHSVvgsa//sgw0i4GIf4Piont0OayWZWb/AdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963307; c=relaxed/simple;
	bh=IsKJY6UKcwyTcGnbD3v2Mwxip28/KfYG+xk9JYABqno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u34lurhyPO6esbcHpOhjYTUcTWWy18Ro9momUuksDg1Ks3Sy5WOS6taJTUvRTdW05waaxx8+5CeAF9xZWolyzfIOlVwicJwvVbxiDyK97sJnx1PCVVs2mR2ZRwTXpwz+TWrEkA5myUAMgtDcFDweUtD+eFi7J63aKyhRJLzYdeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOkMavDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eveh3GqQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098VFFU3728380
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 12:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HAMlf10dDH8UsuNOSmeeKYL7
	tO/vHKpfeZ6M0LpWbqM=; b=iOkMavDUZOwNeewFWdm8hM/EcRqkV0w5uK6QprZZ
	Q/jR5GF8W40Pdy4u2riu8XVhmVjRP3IuTDm1wv+04C65Mmoz7ITmNHKx/+jYvbkE
	jp23EBmbA9WnUZK228jAxQ1lb22lMbthJySxeIVbHtE0qjJvVSxXpgPBn33OAZyL
	T+FGd+1MCRlkptguckgaiuonqiLgJWvIX2QNI80YDsOqYwK7KVtYPfZHuxmPXsl7
	5Rq5eLgScCaKa99y1ACR9R6zirUCm+7ww5nGmAATrIAaQowHuWEF7e0jQN7QwRHp
	MeqBDCiaRp6x5e7NwIXb1HTfEsTnNkhbApaoOE4SOiRuyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkj356-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 12:55:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea3d12fcso986216785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 04:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767963305; x=1768568105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HAMlf10dDH8UsuNOSmeeKYL7tO/vHKpfeZ6M0LpWbqM=;
        b=eveh3GqQGrY3+BWquY4wM1yc9FuifjxFnBwBRyNloD/ImBq7n69gltQnzhyKSQoipR
         AYr512FOYeIkUN4XZORuW95PugmKIBW87S4HndKUDHAZpI1g1bbAmd0yx9CMtGxCT1+T
         83ygDxVcS1BAFBuL/BFPjSYB1Ch1nxRCSl6A2GuBz2rpHH0x72bZaDkSYYTJBbWX2CY8
         bBJCSuWDfivD/9fnKKsr4YegyIpcSOvo0KS1K3V0/GyDsEeCeLiXh8MM7f9/Fdh8d29V
         +ot4IqqdbnaEqIp95zlmQHXUfMPpujLr2aN4KQ/OOF36tUrAJUEJTdM6GFKTYMx7h4i7
         z5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963305; x=1768568105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAMlf10dDH8UsuNOSmeeKYL7tO/vHKpfeZ6M0LpWbqM=;
        b=jvF+Z3hlfM97oM1ATQrtFIdK580MsFzp447ObiXg1u6+MdMYyZMr8D0e+v5Cyh+7l2
         J8BKb1IgnrvLtzQ51iI9yYuEa/t27pg5ewizAizpuPZoLnntOYm7UjrH03Mi2tqn/JJT
         Ng1ZmE/x2Xjpc+AUxsfDnOKpQ6rOcitLQWWImLjaOuHWqQF26gJcBc93TSZbm4bzPu9E
         jLPbETqkME4aJjNp8628S2qZzHsWudOJ6xKrsqK5YfKiDZpu1ffuiMDu7gzdcqa62DiL
         Yjz2nlz1RHr3+5CdbDGjYJWWjveXHyODO7ipsXfu63FRkwUXhHB5BTslQDtN8ks16+oO
         ntuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3L4JLA2L714NhtU8GrpjF+uPTnCuxmiaryNT7OwTd9vbiBhLC5IoZ7bLoc5Jq7T92eQPEfqOftweKH5HX@vger.kernel.org
X-Gm-Message-State: AOJu0YxuAZPDBamMI1G4tbOir+Fa4goeOVxgVGRVfQsnmdTQHmT8v4NW
	mE7vkrtH+dIE/8l9uHFaTBpZYupRx9gZ/JwTDDjQbMI8PbVOYW3WjHSmtGGDvvERQcmppwLavrr
	3LC1N0o08Uv3K+D4WwPaZSdwlC88qnfHAJ8zbpd3q6Z0pWYu4yPIn24kpStrwDA76rytZ
X-Gm-Gg: AY/fxX7Hczj52peZya3c8+8S6JlWVvOL7BK1nWK87vf+8AAEIw0N6WRyrHU6u47JZiF
	nFdGvj/b9aMZGr8lpDxCEf3zGWwY9Fo76Idnc/5Kllvd8MaqzPb+Zikfe8y8Rjm31v3DosXSL1b
	+pb5bP2I0NhHZtiY1ohWt2j8nVhk3HhkReFX8KlbFD94wgKDyqdvRA0WeY4Aihi6cELHw33WpbI
	AKzvHF2mTe/lng+npGSNsal3kSq9Rjy6aMTTewBLOKd4yCiLUog7FaciQls3J0jCfnvRUGIlGtN
	GoJ5teISEh0j5JYwy/52YIsR35NgLIVXpnDNeRLLBkLXUHPBnkuKG+Ce6Y77jnQrNf9KO1B9xTr
	E+lT/ksx2eGRHTGhKKt/64AsD8EaQZ184nsjpDPdJ8x7E72Q8rmwRZFBdwO/pe05o3AKwcTmQZa
	cI8Rhx+gMqCQ1/c0a0CDonEXY=
X-Received: by 2002:a05:620a:2a01:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8c389417b88mr1355652985a.74.1767963304757;
        Fri, 09 Jan 2026 04:55:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ1F5xnTtmEN9GO7NV7cQWCi5ltEqUSpktZ61b5iogKZ/Ck2+d8SQT5C9QQzhLxVrsEx0O4A==
X-Received: by 2002:a05:620a:2a01:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8c389417b88mr1355649685a.74.1767963304219;
        Fri, 09 Jan 2026 04:55:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea522sm2772194e87.3.2026.01.09.04.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:55:03 -0800 (PST)
Date: Fri, 9 Jan 2026 14:55:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org
Subject: Re: [PATCH 3/4] phy: qcom: qmp-usb-legacy: Fix possible NULL-deref
 on early runtime suspend
Message-ID: <wggkdgz2zhnifc4ceirgi2qkeqfcip2rexklji3jmucmre7zd2@srnl2zqx4ju2>
References: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
 <20260108154944.211886-4-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108154944.211886-4-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960faa9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CI25CYPn75et82rp3EYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: dYhvCc5vrUeMLY22HwwlppdqfBqXv8pl
X-Proofpoint-ORIG-GUID: dYhvCc5vrUeMLY22HwwlppdqfBqXv8pl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NSBTYWx0ZWRfX5BfUujtlU2jH
 oeCLB8eqKUFJeAMEq3GbUypw+D12DKd2Kqw8fSO/DaqTioeHPklDu49FVQRHeSWz/Hy3uQqfv7H
 Yzf0so5ejMJwdU6/2RibbSXKAHcpZagexWy7ZS3qL4lF5DWLr0SfVIeScLEkPm2CQnF4kRr3OxR
 XZCDl+nv8dnKsN6r0BWzQtWcPbsB7QjHW+MmCOvCFr06IH2dxhRYeJ55DksowmbGgWh1j3inCth
 VEGMewjJ6h4bB39055Xd1SnnfgEukoMT1mEsVIjRFWUyaN79A+AAPnIi7//XD/myhMXapVyyLQ7
 RRAJRMpU6o68mENOxwMEHENR6+usVqK9VZn3xkIzFSLYWDS8tIE5e4F+gF2FLbbpimPMGpfpuaK
 qbmAqPxWf+JY+MfuCe2IGgmZG7rV42DDCu2sdqSiVy32kfAFamEJz+TprXF2WyRgRr0ltRbhTIB
 Bkc+O+ptRXDSuQTOW/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090095

On Thu, Jan 08, 2026 at 04:49:43PM +0100, Loic Poulain wrote:
> There is a small window where the runtime suspend callback may run
> after pm_runtime_enable() and before pm_runtime_forbid(). In this
> case, a crash occurs because runtime suspend/resume dereferences
> qmp->phy pointer, which is not yet initialized:
>         `if (!qmp->phy->init_count) {`
> 
> Similarly to other qcom phy drivers, introduce a qmp->phy_initialized
> variable that can be used to avoid relying on the possibly uninitialized
> phy pointer.

I think these two sets of changes should be split into two different
commits.

> 
> Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent the window
> where an unnecessary runtime suspend can occur.
> 
> Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

