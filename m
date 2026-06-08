Return-Path: <linux-arm-msm+bounces-111713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rqmOC0VtJmpnWQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:20:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9566537AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:20:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="jpcG/D0X";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EewQ8xe4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111713-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111713-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C0EA302254E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB1A2E718F;
	Mon,  8 Jun 2026 07:19:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA9B352024
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:19:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903186; cv=none; b=FGJsnyS081imSdiShlt4b5dzz238wdJKsXCmC9GoLxQIuBk73k++EvWHH3GU7Ec/4g5oKBN8MWhkVNroh9+a/yePXI7fevquVD4ng21zQ0IbJKfKnfVN11dGQoCi2XDxooLO0odUUsIsSWn0zEKVbomBEFv5A41iZ2tYocnST+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903186; c=relaxed/simple;
	bh=qD9e4KyK1fIzkRMHO6aMKPF96czRHshznS/0D0FaTMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzewmSSr7Koazt6V9vXbsjGy+hyegGK2aYKRrMGKNykKbzG85DsHEo1LDIIjELVhadRA+WlcgWKJnC2JMQ4KjVqIS7a+Xmj+55fiOi8BJQ+tvd1SEguvMY/+GnRYL0N3nASGuXuGlrYXD48ueiGVwSQ2zNMxH17pciQVZD3I7qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpcG/D0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EewQ8xe4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Okaj2382838
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TszHFZ7K4js/ZAFR2FtK66NQ
	PI9cujME4oGOjetByeg=; b=jpcG/D0X2/E/WrFN1uFBDKV/q4WUAZwxEvep5M1J
	j1BiCdduPfaq02JEUHAzRRGLIAwq7CjazfFRjN+HyM+LAM2dyysoT7hDLqIfAvXz
	9Nwg5sfFc+41cIR/o+5tI5fRue7n2BZoRBGGIh5VJLcSrlIjAnd39++ucNtF89fP
	bKfGg8DXlFg8BDDJFMlnFQDFUXh/JXj1VoZYWzUC8f/bcUENSh+7CQoCmrODHd/2
	YiSkB7eeV7/TuLUszkH9X6BWGlPIN4wX9gb26VtOQ97G5a10pPn7UCuS583WphJE
	jp469EdWpssWsVebwH5dn3ZN4TXUWvfxF6wbVymaoP7obQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cy078-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:19:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96391e58e62so5400051241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780903183; x=1781507983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TszHFZ7K4js/ZAFR2FtK66NQPI9cujME4oGOjetByeg=;
        b=EewQ8xe40CpZ8jV5y0H+pOuGV2J9Pf3kMDp16Eix0BSoIqyNFNy8NOzmt6X/ZjFx4E
         SRiBox+bnDB2hF5JEdoVn7IcqGjcphAr6E/cRJ0cOZasIGRcYuoGg/oLtAELPQlnuVFc
         1JDHbcmp85QDzyGxjWu5KltpYcZVW4gfcYJklw8fH4o0fC6MTPjuW6FI9bAZK06CsZ51
         QK0KCKnFkyPjEtJ6Wyta1E9WCNs0taLytdEEbOI7+NR9v1fGCrhQ5ekGLu4QgAIZx56h
         3qehLIZBTmBrbos1M6xoC/dTFwWfaIhT1w0ELWEUmPL0rY7xvtr7Spjjfz+MuaorOlmS
         Zr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903183; x=1781507983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TszHFZ7K4js/ZAFR2FtK66NQPI9cujME4oGOjetByeg=;
        b=qgQglB5hkh4BJ5V4hQ1375ePpKlaBWgbE/7NZadzu+6lIMmLXQEk2xuDBl/+o6TBFH
         FvKNmYoWl9CpnHcrukxPfyPiI03vE0gifB17q16o+U3m6AiWNVXEKDwXnKrtM64vbtaE
         jIYdv0vkM3z2+6uzyKUFaEWtGjP0VUjJztg4vEQjwOmq9EcKJGbSh2omtee3TIycUtww
         JMX0zAMZzUzyDBPq82M20v1+Sp8Fq8VKnHgxwLo4wc/7zB1xL3YHket904p3keGgLioV
         k10XX8WfHVoBiY2Dy34d0WBOqri2U9368lh1jpCgXj60j3VR7bIA5CIl5oHFCCuTF+cm
         PM0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9TCEslnzqt7ma4edPpRYkA0Yxz2LBQSrrWdhMCMCiXkSJG7xy4LD5v/M4GGjABzXJQyaoQ1GM+leMygnR8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsl59yRAFFEmrDnrSqVy3A2X2FLxuc/GUSCUZjei2oVqcmEJtx
	BOE+nJwUwDxKfO/fgX7y515hn4mXm2cFdkf3bEtf74JhxxgfYXBifsNHeFN+qlM+aU3cFbpGVCe
	zRPwh/x+KCP5EadaNs1GBD3o6ciqboxs+e6FwDzfl3Oks5/FoVj3GjA8DT5n3nYdgeNd4
X-Gm-Gg: Acq92OF83NoODNqDVzIxlPApIy3Okp8C4v5+he/9gQ2yaT4uVi1QHh98FytGHPLQqJa
	rCW9lmMMrvsLp0D58gTzuilCcHfUGy2WCDRW0hLy0grR1Qtj7T1vR4hV5U26wurzbAWIFOxTrJI
	ovA4q5JU9k0A/Acl7A0xXjYSFsROPHNrm6y8Tl5er/SUG/U0dgyLRfJ0TCtVhbzM+IorCTCDSsy
	Z8iFEDhogww/vCEOwZxic/6i7/sNhv7Zhu7/yyZAMIfH7+CsxsfhPyslySp8dBhnyTbgERE7l5o
	Nj9vofcbV+QjexnGjW+sgeSeqpOfOoo8jEPLs8C8mo2uBwmZgE85wDA2Zzz/4j+/rEZpC2DI9t0
	9+ztFgm8cA01WOFZjw+QZ5PrH3xNf5z44ZQ2VUmM2UR9U2wDrUjXj3/fKLmeABJ/W2b+F0fkqNN
	nKhIOHHLxPuFSPONHl7hGggAPfejmTJCi7bnB7i0m3S5N0Bw==
X-Received: by 2002:a05:6102:6204:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-7001b3c61d6mr2919819137.0.1780903182947;
        Mon, 08 Jun 2026 00:19:42 -0700 (PDT)
X-Received: by 2002:a05:6102:6204:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-7001b3c61d6mr2919793137.0.1780903182529;
        Mon, 08 Jun 2026 00:19:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcc7sm3605566e87.23.2026.06.08.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:19:41 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:19:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Message-ID: <dhtuvm4ejg456jy65kwbejdo2amrg2khaljlmurse4vkjok25p@rd6wd7tp4rwd>
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
 <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2NiBTYWx0ZWRfX84d5K0TzOrz7
 Omqr9FHVXyOQ68RG1apKS7Lv/vqSkEob3kLD6cazto9LjR9oF7xdTY8sQxH7JJ7//qTsqsz+3x5
 qm/pS11kLSnCzXwOuiVxaHNZyRWH3zSoIzD9GXaEIRX7fnYFq0qljQ72oVYWNKAHLdjax6Mos+i
 mv+1dvFSgHSnspvarQecRrngStsDK/TyNn5ipaYjn5ep0QoDnqDtY1HF2HHTd5XC1UVcNK3pyrz
 SHDw6QLc5w5W+uaeVISpepESM1EVQSFZ+nx/dNMHYNE8b1mR7BRuFmnnFoxgm82uA82rwyERFxH
 CU28ffDo6OgNa4AEaPE0N6iOAC3qa8dKWqq/SlhBddKHQ55couNZ3MCUpxfTu91D1UiG/xsLNZH
 bSZmcqtea2RF5sqKkTqXXhT0/A0MeiVUFM3opma0FQjC1jf6WaXsUfirKQ1K3XNuJkslaBwGoY2
 v6vNBw4+xBgwwaoQtSg==
X-Proofpoint-ORIG-GUID: 4cX6UzW7Cp4V1sTPAftdYPQp34auAaDY
X-Proofpoint-GUID: 4cX6UzW7Cp4V1sTPAftdYPQp34auAaDY
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a266d0f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=h5pAuauRZTFNeIU57NgA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111713-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF9566537AB

On Mon, Jun 08, 2026 at 12:31:42PM +0530, Nabige Aala wrote:
> Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
> the existing qcm2290 bindings to cover Shikra by adding fallback
> compatible chains for MDSS, DPU and DSI controller nodes rather
> than introducing a separate binding file.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml     |  4 ++++
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml        |  6 +++++-
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml       | 19 ++++++++++++-------
>  3 files changed, 21 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

