Return-Path: <linux-arm-msm+bounces-97621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jSnbD0FltGlrnQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:28:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4492894B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 695DC304F4A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 19:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911223DEAEE;
	Fri, 13 Mar 2026 19:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vq8XhnZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDNSsipM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72DB3C3459
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773430070; cv=none; b=BBoWvcF9waaIQEVI/+Ty6KBmmnNEqN3FzDQhQdSWsqg1XbV4WLLc6ds2CigUakRketikSRRhbzAsMHk0cYelDqIWDQOkKPb3v+gkqaEtqJF8HbLNQO2v6e+2KPIZ8PmvYk3QJY7VxGZkL80vgwh3fJvltkbzssms2eiF/aWJVcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773430070; c=relaxed/simple;
	bh=rKz6zJlCR7ITF7m2iyI0w+PyLtJ5s+0Gd/J2y9arA+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j39pNz42xmCdmAj/5adN64SNQQoW27tudM1gJ865J6oBOdupD3d1bCYOG2KTOEIwBAFTwY4u3+vL+VEA3VLorjWGjOnLZqkSyFdAthddSw9LMH0jYCzHAvMrmWKBzW6aOGeOmDZ4lkM4n0sbbcQ18XpLuk9M5Al4Y7Jd2Ur1r28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vq8XhnZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDNSsipM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DDNPUq792874
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qtj/UJdhKICdBz0n8e3V90EO
	SN2LnU2hBaq2dvS9HzQ=; b=Vq8XhnZpMXKdAHtVII0VRF42/U7t960S2JjaTdsD
	1fuSwNpQSpSbxbNqBqwZKntiSvOcWPVusf02K+BF2mohlIdyowKn8NJuA1yU5TML
	zY8yONJLJE88+eog2KyvqntOLRqd3D0skersybpNkfDWpXQ8FBX2uki+rm6WaZWC
	JS6EN3E77TgF+GJjW+zlrjDkR7jBy3YOxuyYgtn3aFi+EIiuBSYXdnpbwaOZU2L6
	hAdRsFRp/ODK/Vn00F4R55dlSDEtK/WBV5HBNWD0Jqo3BiBbE7fG2bayZhatSaQr
	ty70Ze554sUP4km/oXEnzdALhsMZgHtw9hpfotTMS/jqEg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt2kxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:27:48 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948df60cec6so4603995241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773430067; x=1774034867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qtj/UJdhKICdBz0n8e3V90EOSN2LnU2hBaq2dvS9HzQ=;
        b=hDNSsipMQ7HgnLHA14lDlj9ag12/czGUb+Yr0nRzlESpfQxi4qyb0spSd7sMP2swl7
         MSQwMV/V01ZlM1WviYt1SoMbbp0LrxtryBSPzrMWHuV6xmXa3x6UCmnSZMPTqXxPdqi5
         riBqcCI/v9qm4n5KOZq+RzMdcScNS/t6ZmPFzSP6Qy3CfaCNyr4UhZ8JtVUjWJDKrZ/I
         hIxgfcsbqXTjIT6A8O8nvFTTI+gR0kNOao3wAhcHjsvl5ULOx5xYF7nKN9Rfq8DeFD3m
         Ji5wpQk/tgqnsY/gfPCLMJH7SkGgLjWuJ8wnMsbwBDiq62OAFMJmGn4tHdZ7B/yj6ozk
         KqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773430067; x=1774034867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtj/UJdhKICdBz0n8e3V90EOSN2LnU2hBaq2dvS9HzQ=;
        b=oahurGYQvcEslPlXcDMOWiDNuxH9Ya5m4vF83vGAgq6EOOfum+POZiX++ri1OZUEq6
         pTqFhOTQTo4G3HuebasFRGcu1KitBZC9IzOlEOXaHgbOKUQnMRDn6N3LS6fDeAUxEeGC
         ytw688r+WU4svaVmzzbvdJmU8B608BgnUHSLnl/iF0sscFezHxd/rsXN8Ho5Wf0T8hfB
         GHGEOUVSJVW8RP+oLtFRMyKdfIHhP6gsnwpBfg3OnzB65fnDXZHZL1vudM+G8RGc8nx3
         WCxhTCt+6b5KzXDxGW+pveaR4OPfN1ccqeOs+K0ihTUeOgNlwDys0Eg1gjL9uZk3/JM8
         YZKg==
X-Forwarded-Encrypted: i=1; AJvYcCW3MLWkEnVVJl3e/bghLEI95VrHzhrYrRyc8lncZ7pDMCzgFBWIVKWC410IsxpmRk28/fzsynCYVL1ptUJf@vger.kernel.org
X-Gm-Message-State: AOJu0YzXtvaADJ4s7ml1K0peT996Z2+79Ugdxycl2Bu343q7DEiQMdya
	hlvunTzTtXVRNaQblvlhOKGwt6WIaJM5VZhxHS4UTJ70fkavjjT0O3FDT+K2OCdAiO/1gv3Kj2h
	lYRtOKqFvuWO20k6TSrh0tHqcHfiHIy3DvihDjEAhR0Vg4A7pidHrUobjWwOFKr/d06cw
X-Gm-Gg: ATEYQzyZc2TJ2dxGQrWKc/UWuDHZuJ5lvhPzCNX+gG0Xq46J9pI3AMMxfJvInlxYRmU
	pRoXv5f+cHPNjUjFoJ0YPTyD73R6BYVHQF3Qk5YcCLxNRQBPWtNmtpStShyatXHG1Prd167Kfqs
	q1OOQjqP7VTRFugtFJ3bj4rbnicpBseRVxHMDqMEMbEvpFvaEyVm2sBVA3fvrf4yZyq3l9M3zmd
	Ed+MyA3V8FmskyDO18n1i766VfATzV6MUoZyS805gVWcv0YjQuuQk/fnn/T/gPQ9wf8vVP+m5kK
	RcBKDo/o8lQAAmiq8W7IayHsD+Cw0VDXr4fneTmHwfUxr62D+v/1Q/gpaYGAksaQ2r3TCf1eF0z
	598vgvOmpzpQ5YlGed6lgdWQ0yQBwriXZfFJI3tpBPmbBgER49SRST63fuTUKVVD7OsqZ0xZLXi
	CgTDF9UCWbWDNNjBhFIuJvfy+qcySIqTBfjVQ=
X-Received: by 2002:a05:6102:304d:b0:5df:8f4:61e6 with SMTP id ada2fe7eead31-6020e59d4f6mr1853572137.32.1773430066951;
        Fri, 13 Mar 2026 12:27:46 -0700 (PDT)
X-Received: by 2002:a05:6102:304d:b0:5df:8f4:61e6 with SMTP id ada2fe7eead31-6020e59d4f6mr1853552137.32.1773430066362;
        Fri, 13 Mar 2026 12:27:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67db290esm16299201fa.17.2026.03.13.12.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:27:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 21:27:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kerigan Creighton <kerigancreighton@gmail.com>,
        linux-wireless@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        wcn36xx@lists.infradead.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] remoteproc: qcom_wcnss_iris: add support for
 WCN3610
Message-ID: <2pyi6yavgbf47amofaw44znotleankmmou2u7vzx2v2xc4hpye@6f4fcdk3hebn>
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
 <20260305003253.1022386-3-kerigancreighton@gmail.com>
 <20260305-crouching-sceptical-spoonbill-fe75fb@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-crouching-sceptical-spoonbill-fe75fb@quoll>
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b46534 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=D8mGTEjQazq80tWk8dIA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: DvAOhe9layYbUCRqhq8lAhdD6UUDnmxb
X-Proofpoint-ORIG-GUID: DvAOhe9layYbUCRqhq8lAhdD6UUDnmxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE1NSBTYWx0ZWRfX8QGIPrKvUCGE
 ReWRHC0dPTO4c22zKEGKCNEHc8dTODovlBptDhCwDQ1JfwSafGfdPFlc1TejfnlhBV41eOiRFmZ
 3TECgqAehP8RFiPsECIKaSo7jJ+w3w8yXhWMyvE3V3eruU0dwy3ZNXxyr0STVVCN44lbSAa//RD
 WI58+UOujKEgf9PzIp5GIjnrbJJTFbgp3SMO48p8oM5synNqiUEZwM+QQuZEWn36xwajujxU98g
 ZYUyDkVxDSfpOEXHJgl/kFN4P18gTmgIf/C8pAmwHj8ZmgoFwUlMqS+ASDIxg6g1bTRZHQ0R1r4
 pcoKnr/LvcftICO6NCB7kUWvqyxNLFeRLATN7/nuOrXMnOqoCSmbBinqucyY6T8I2k5IhJGVzwc
 Km3ifK7ZF2F3gC2Gl3TO89tT4wnqiA9x91bbGD8mLnFCI4gW9S24mKucsXt4AnAn0lXMC8koq6g
 DiCqKAWMRBuoqxcx+nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130155
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97621-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,lists.infradead.org,kernel.org,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC4492894B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 09:06:30AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 04, 2026 at 06:32:52PM -0600, Kerigan Creighton wrote:
> > Add a qcom,wcn3610 compatible string.
> > The WCN3610 shares the same register configuration as the
> > WCN3620, so its configuration is being reused.
> > 
> > Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >  - Move remoteproc compatible string addition to the middle of 
> >    the patch set.
> >  - Add Reviewed-by Dmitry (thanks!)
> > ---
> >  drivers/remoteproc/qcom_wcnss_iris.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
> > index 2b89b4db6c..e58b59355f 100644
> > --- a/drivers/remoteproc/qcom_wcnss_iris.c
> > +++ b/drivers/remoteproc/qcom_wcnss_iris.c
> > @@ -95,6 +95,7 @@ void qcom_iris_disable(struct qcom_iris *iris)
> >  }
> >  
> >  static const struct of_device_id iris_of_match[] = {
> > +	{ .compatible = "qcom,wcn3610", .data = &wcn3620_data },
> 
> So compatible with wcn3620? Why are you adding it in such case? Drop the
> change and express compatibility or explain lack of it in the bindings
> patch.

I'd say, keep the compatible. It's used in the next patch. But yes, it
might need some epxlanation.

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

