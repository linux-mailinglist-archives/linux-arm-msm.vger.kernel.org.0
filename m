Return-Path: <linux-arm-msm+bounces-94279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN2VOuQmoGk6fwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:56:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEFA1A4B1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2356A3003357
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA9832AAD3;
	Thu, 26 Feb 2026 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwomh1lb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnbqNlU3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5AE328243
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103394; cv=none; b=O56LWmMUYtyQ7H+a9qRhStmBJuc+Vll6SB/edfgBuxe6vXybDeSOHuUIMCls+UjHcUkOmuJmztQdFhwcGXUb9h3wc80kDDt+iGrRiLaPi+KTi4getr2Vm0q152bEF/+ayW72V5LsJPh5pHh/hztOXxih9e9BQqhPFrfjLwR5CN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103394; c=relaxed/simple;
	bh=/FXuKXy7jMK9q38e5D+e5mA6B8BRyxkdxQTbtCL6vtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzY8Gw8KqWVFSyyCg3P2H9C1lyHUOAGJnnOnviFJB1t2E1R9wKXjLxkpA9ZBxQ5TRXxSRJbrmVNf4ZGaRSnSAViWS+7G/7vgcrcxooU83UosH8R4lKfLT1JxJBbUMDtVq8f1VvLLANYuipRU5mlqDSR7qb9o0NSp+CZf1Tu+xDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwomh1lb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JnbqNlU3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKqSD339793
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8kE4qU+GVTOAZ+Ag1Onil2K/s8LSRBaWIjephAuyxDU=; b=fwomh1lbiPjQm1dr
	s6puFpJxIhNly1kr8wUAjBDDI17guul77yDV9LkucR71wK4nZkeT0iDsAjh1qjwT
	jzGlYt2LF5AJFA1t4X/Wo8lVgpokhBBh/0FuQtSgwHxbednhCH9XPR/DWyzJ8RfY
	Tr/QGwXwrQOxpNWLSEDw4rzpxBvR7/Yu6yppObVhwKf2va9F0xzGV/JlXnXc189W
	5uhDx/+4IBXfBCjnfKMdV2XvrkMN0kWHMTi0wyRNZvZkvxEJi5M9hpu2HClIw9Kr
	7FVhXquT/AD4+U9WM95oajexD198Ga20z1or5beGleM33LQO8YL/bWZnGoQpY/+y
	G+GeyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0svxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:56:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71156fe09so458382085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772103391; x=1772708191; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8kE4qU+GVTOAZ+Ag1Onil2K/s8LSRBaWIjephAuyxDU=;
        b=JnbqNlU3OoxcpXiAgGIQgEooCA7cAp77Pghy4ITxWzLMQi5OwuseV3610dz912E6eA
         2GTdnZPSx6aK4xMwmn/gYbZiWJCUHdrKXncTMDZpz/K/dQ6H3MJLQsutTQGd+Q1F36k4
         2L5TVYFmeXjqH3qcdAVTb9s3u1zsF9Zo9Gwvos8nL4C+nD9bl1JburxMeHImvtDo6ozT
         qF+g2/qXd82bIou9LAurgi2xE2EMNat++tHOylK6wHIlywG4G6wSj0/qrL2JiHR0Gp2R
         Iikc5svE96lQq68FfhO2AOGbkqo5/r3XHjAMYZTk/Y6+OTEBMgak0aKZ3NRdQ5u01sxA
         ykTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772103391; x=1772708191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kE4qU+GVTOAZ+Ag1Onil2K/s8LSRBaWIjephAuyxDU=;
        b=LJlNGmC/jjV+aP4N6QCg/ZrIH7zgEZ/AJiwltbLYsUtiuozbvK8uydgm8OQugenWLI
         naHtRVEKXJ8gLDtvD/IfP95lAkQvoqjhcSLywIx3jAUVNlTdtihGIMECUTq6hfFFoe7x
         DTKYlbzqA8nmUnM2t2LeYQP9j2qCOF56JQCaUQ61jAb+rjILMX2v5Ms8aQUZ8g+uVOaH
         c2rRBcm8LW66rPcwEtCJVnDIQi6boeoMRT0gXG/hdTSo/IwMwAMpWHmcl9OiZClcWXnN
         n3TsWsJAm2WvobEwnic+DB/hqt9wB5nfPCyq8OC6oCls2TEbqwW6Sa1sodYnzhH63vxf
         3bpg==
X-Forwarded-Encrypted: i=1; AJvYcCXDW5TPrglDZYo5ZGFo5l0WHle4kfBwt6OVpC1zt6r3BeJ20lMWEUTQb3voirGG8xLLKarb7rpVy21Y8BYo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ij7Uq4QOdI6gZem6adnIDCcEXzEz/J8fCR5596u9ym7roY1Q
	ppPUK/N0ro/4H2V/+YjstRRF9IJ2/RlQ/l9hOzIXqFgMB55i4opOyYCA1NRTdFkVITFMRlIp81U
	cIkK9S2YVfz6FNzvdqeb6hXOsEKEPr1b4Pziz/Dt66vTlobX9uV4omog2Xl41xOZMtjiL
X-Gm-Gg: ATEYQzwFap2Vzquof15xriDqUuWPAJ8IEBGJZMIwgwcTfVU/f5GxwnQsyx/OVDyKlA8
	O03/VBg5a8q+YEjIbpQeWUTBnl4sO7CtDanN4sTXU4zyVpe6SM8Kg4nPlBGmSOUEPOHz+uMbzZR
	bm1qRKdGbYc8yhTIWaK6Au1pOy60WN9e5FmEw4Tosq6gt61F1jDjQ5k0uYU9dLgNwTr19FRrp0U
	qpcN3JhpCXVfiCIRS21Wh5lzDJlG9kfhweXkT9Rlc4FbdFtmHzCh05hWb9X8aUQoWJTR4nHqhUK
	55F4+BMOL+WNAEbyY/ead4yrOrdxIC+UMjAdQ9WP2TlA5pEsQL2K9ydBoRl/0z9ogdw7PZrVNlX
	WKTsJApuQ8p8sju4w/TZq61SjB0X8BhcL4kH0VU+KIJkz6+r1XVvfqhgQ/KRqkyGXbfpUlNhQPg
	SNMiXe51yB3WZ93DIt1cPXUFAqSuhevFns1R0=
X-Received: by 2002:a05:620a:2956:b0:8c6:e224:926d with SMTP id af79cd13be357-8cbbcf2da6bmr478127085a.16.1772103390878;
        Thu, 26 Feb 2026 02:56:30 -0800 (PST)
X-Received: by 2002:a05:620a:2956:b0:8c6:e224:926d with SMTP id af79cd13be357-8cbbcf2da6bmr478122985a.16.1772103390355;
        Thu, 26 Feb 2026 02:56:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a0350bdsm698159e87.2.2026.02.26.02.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:56:29 -0800 (PST)
Date: Thu, 26 Feb 2026 12:56:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Message-ID: <rwsaypiovv3xtw5pfxw5rksmqetv4mogu4yy7yrm7gfknezmuw@bh6v5q2zeuiy>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-2-mitltlatltl@gmail.com>
 <20260225-analytic-economic-parrot-4c3a45@quoll>
 <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
 <CAH2e8h7T3Qy1f=-34SK+q=n9TRYOtzyxY8R6yKZJZGr_f+UMZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h7T3Qy1f=-34SK+q=n9TRYOtzyxY8R6yKZJZGr_f+UMZg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5OSBTYWx0ZWRfX/EZ1Zx/+NdJM
 z6VFWbET6ygoj4iVP026dpOavsXllwbg6qQmRZONP4Jg6GZ9CHHCrk9a6t9LEfvsFGFRttHU6Cy
 tJQajLfAAFJ1XRz1d5YgiFbIw0PP2gK6Kt6XO5JKNumRLqH0nFMtChWEILXzghpCoO3edkNMQ2d
 +FPDK0AdM8uBSqKk3O0RTSEewJNzLMbsewthA4kuGuK5mWbNJHdUtjOKkiQ1RH/YVRFK91mLlke
 FXP1emNMujTtrjWi5syTQBAGbzTu+FVAeZtKvJSj4CYQwWRYVGFGkAX89IeEq5JB0GY0GXpglBG
 xaQo2158eXuEgTvp7d3GeLHXWGYlU0qAyQxw410Ht9T4tYJjGVF1DzJf15R3KGMjon97uX55ueR
 gkY7OH0Pbbff4kBWGdPD00Z3hey+X4wu8ZwSpEp6zIxBK6jxD9CtOSxZNLJqOznH4MgDX+ejmXt
 gC4aRqQL4KmVxL2jz8A==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=69a026df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=H-TpH9_BN8MYRBI9SD8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kK1j_V9F7F3JgXqyhKuediAE3cpa-7rT
X-Proofpoint-GUID: kK1j_V9F7F3JgXqyhKuediAE3cpa-7rT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94279-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AFEFA1A4B1E
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 06:44:02PM +0800, Pengyu Luo wrote:
> On Wed, Feb 25, 2026 at 7:02 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 2/25/26 11:24 AM, Krzysztof Kozlowski wrote:
> > > On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
> > >> Document DSI PHY on SC8280XP Platform.
> > >>
> > >> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > >> ---
> > >>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > >> index 9a9a6c4ab..9223af1f4 100644
> > >> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > >> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > >> @@ -23,6 +23,7 @@ properties:
> > >>                - qcom,sa8775p-dsi-phy-5nm
> > >>                - qcom,sar2130p-dsi-phy-5nm
> > >>                - qcom,sc7280-dsi-phy-7nm
> > >> +              - qcom,sc8280xp-dsi-phy-5nm
> > >
> > > Your other commit claims it is compatible with sa8775p, just like some
> > > other devices here.
> >
> > If that helps, they do have the same values for the REVISION_ID registers
> >
> 
> Thanks for confirming this,I will add this to the commit message and
> fallback to sa8775 then.
> 
> I am curious, do the PHY QUIRKs in dsi_phy_7nm.c reflect PHY revision?

Yes

> I notice
>             REG_DSI_7nm_PHY_CMN_REVISION_ID0       QUIRK
> SM8250:     0x00000014                               4.1
> SM8650:     0x00000025                               5.2
> SC8280XP:   0x00000024                               4.2
> SM8750:     0x00000027                               7.0(*)
> 
> (*) SM8750 is 7.2 in the downstream.

Please change SM8750 to 7.2 (and SM8150 to 4.0 FWIW).

> 
> Best wishes,
> Pengyu

-- 
With best wishes
Dmitry

