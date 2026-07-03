Return-Path: <linux-arm-msm+bounces-116356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bj9/EILYR2rogAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:42:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4D3703F6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:42:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HS+QXMBg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Lf/VWm2o";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116356-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116356-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B75D0301D96A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C6E40B372;
	Fri,  3 Jul 2026 15:42:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24133277C9E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:42:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093370; cv=none; b=LnVUKNpyBIXFbb4mcdejCG6n1uy0uMwXxpcga+u76y3ESjwEb0zUmAizyL8BiDGFietfN6uMxx5tiLJEWkAJJvwi7uhuzzDPMv2rH4mCiE0QwPb0e8FoztnCC6H6hIKZTfXDlHc11rlo/n2nEUUGdsclKyN61ScctXOlMMS2q3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093370; c=relaxed/simple;
	bh=dGpqlOqSR01XHv3OV+Dnkr1uupemNZ2RhLc1o8MWR6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kwi41LVCROFL5XPlJDJz7jhbTJakxbYzH51vs1CzskSmmC6DRWGc3/Hpw1EXBRbUCyFHVJi/VsWqUaj1fBzr2VbZflCrsfnbRF2nUYTiVHhcugNPflGTPl8Vb0cV/kzq3yKccSJK8l5+pZqkFGa1zodLn+rr2LbigNytGjR5Ucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HS+QXMBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lf/VWm2o; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2wCm3772892
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/uhlRmvz/WQjjbKiBFfgMn1G
	5ciXJwRFCcXq2LAY/Kg=; b=HS+QXMBgorYfQjx4nRPZii7yBz4DHXo1HQ2Sy2Ro
	rrmh9xWGHf8+peR+g7CzGfBd5iWLeAdPj7nvLE2Wxd4DKpC66uGuT6RyDVbiYagH
	mxbiKKOj0pA/0Y8aVS974AuJbvmz4t4BWDaLhSfFbh0NsjtQ8AGswe41W6fK/2/R
	F1Kcm56cpSK+imcs4mWRW5mAMSNSGPLDzVUoFOduRNBhrguhdl15uuc+0WoN04Lm
	YHNy9gNtwbmuaBvvng0B1A2TroJUwvLGSqILXgbPzlSEOov/5NB7sOfiruBB4Lec
	MwpjLwuiKJ/GWPpc19essRL1vnvF3AMoPez5pbDopGH3oQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b0397qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:42:48 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ab036818efso189489e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783093367; x=1783698167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/uhlRmvz/WQjjbKiBFfgMn1G5ciXJwRFCcXq2LAY/Kg=;
        b=Lf/VWm2oyr1p06nhaEDvq10SNZkgr74dP7N58zP7Ql5zKelTAs0rrHsmk5orCAnnu6
         FYXIN4DU8GrHYPkOzK5LZlpD1iv7wXFOfk+BRIdN6cNSOvKIFScmi6YoD8AvFXOPCBK7
         QTrqN6UJjO0GOXAoogqYThLfTzzbNy4mhG2kl0JjK3SzTuX0ZBPDE/JhH6op0TZVdAhS
         FKfqoSySSYSwjIl/Gl8EiAeY2ascVh+q7EcOCuaG22bYTbWTL7ImNC3x0rkW52BHFnf7
         qQEVJe+xARQISJ96Jvb/t4tHWaBF8gWmrk4CoKnp8A6tN6mEBamGa/zoTK629mxaIJbT
         XAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093367; x=1783698167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uhlRmvz/WQjjbKiBFfgMn1G5ciXJwRFCcXq2LAY/Kg=;
        b=H1y04aXdKP5RJGQY57j9Pf58/OO7XY7+vJuu/8oCbhLqICXdpwHs3w9f5GlKG5sdGY
         bQMxHQncuSObaruBH7j73cW+iabLDcguax++qlQ7V/fns3Esj/SbPs75Wz/8ISyoAEBT
         bG3Rnzf+i/GjOogitkEutVl99MIeRssGnJKCIhUd56t18JtYY4K2AeaGj00iYvavBvbM
         9fdNP8DTVF6V6/xTfnBpoZKlKHEE5PU3oDX7EQgR57IrmXMZivad5FyaKJ4wUIrWAWoD
         mnD+FlfwlNHzEu8EDlpDWHhKh1TJqOexWgVCDUkSkHteWStvov5wbUKv2t+w7Ktxc/c8
         fs4A==
X-Forwarded-Encrypted: i=1; AHgh+Rr+2ZhBbIA972Y3H+Hz8vd1+j1Q1el1GVqbd5woBv4xAS3JCV5iMhHb9pWV7IeVVOdW6gDI9qtZkEI5MH0a@vger.kernel.org
X-Gm-Message-State: AOJu0YzcBMb6tePONKtP9Iuywz2DYbjUbkA8p/EWsow8kydR2Mf31E1u
	iQ1i+SszqfD+HGIDwLvEQrvTVg6fhDWabh0FWZ+XbBooJ2fNi+45g5AjaQKkInOk4rCVILPivpM
	Dm3w9zLlYZwCUS3BLhXMYmsO8PIVazPo5ank3OQh6LziL8gWxSfVOGS0Bpsbiszh7cskc
X-Gm-Gg: AfdE7cmsAr2B5Hn2I5qHqj5YBu8Y3WrPQ9g/9LMHrx54lKxys5DMNb5IIyF0pTHhZym
	ma7wFl1BOsND1o/zn+fgek0b1S01oOvJIL9zSw+iXIG1/qM0NJ3MgfFnrJobq3FpPzXvTCCg58j
	z/Pevhkfb247gE82s1aq2D/eGui66lvs2UhepznlOivHxFeU69JOyjRWn1gsCDpGLOIfBKY1ygl
	L3IY/lYuyhkWhG6zAqlR5Ol4qT21wL+0htGnZAxM0W2Qf2sqUXHDHUtjQaAKM/jUENvl66S6GGz
	309JAIvI/hX3bM3u5BUAR6BklYEvM6LNrL0XQj2eZ1pxJE8wKMWA/eUwWA86kphUR1LDwaIwwQJ
	dwtiXzS9BAjgmxtUKU+BMXriHqVsEbno725ELzsAmslbcmpAVOysOegd0FT3UdK4sdNK8Df/hyt
	TX7Q9zNvot9XReD90RbuLJ9s6w
X-Received: by 2002:a05:6122:3a0c:b0:5bd:95ab:fcf7 with SMTP id 71dfb90a1353d-5be0fecac1cmr95840e0c.0.1783093367290;
        Fri, 03 Jul 2026 08:42:47 -0700 (PDT)
X-Received: by 2002:a05:6122:3a0c:b0:5bd:95ab:fcf7 with SMTP id 71dfb90a1353d-5be0fecac1cmr95816e0c.0.1783093366681;
        Fri, 03 Jul 2026 08:42:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb768sm565664e87.52.2026.07.03.08.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:42:45 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:42:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD
 device type constants
Message-ID: <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1NiBTYWx0ZWRfX+QcUOgR+FhlN
 M9TXIysSH1tCfuW1KSlgo7Ntm8uVTrQ0g6gVhgbCq1KxiJFa1hQCcZL/F+fiGP5GtZAUWxMZbQ5
 +cjTQvOaFO8OPXxtuS8omzrbNgoePgo=
X-Proofpoint-GUID: 2oc7ESgMAEk1_DKbNRgnauQYP_wPjxz6
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47d878 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0Hel9obb22bScKhzErkA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1NiBTYWx0ZWRfXwNqVF3C4mp69
 5I6ufcDWZ8mU1e+JynDjRFUoDkm5SDgQIwvdbslrFMVdcOX+p/2ZsHM48b7iI05wkMLntj1KDxK
 mGFvXwiY74yVu0eTW2xf6ENdn7VxgycoWMFelbE8T/bWu1TN+ilGvjDRr2XRMCUSTpPY2t+QYKR
 ls7Op/Che/IqRVfiKB2OgMWwjCAhus7DqH7HFToPTPx38fgnL4Chfo8ehqpXdc/GZ5SJSAEvZ9w
 mJ6BFWEF2IswozHx86FU+zwqF/XxreMXfOlTPZIl2QLBIJsVBws37Jxn13ZlsUYBIOwglzDHubw
 gtgUjJKDoxTDxh1Ofh8FvKo+ynvlWRK++PvLq5ZemKhlV5Zt5wPjFhfVTOz4vGxwBJLP7irSrEK
 yxFgOEv/LpdLVwRZygSLBoRgz2+rgyr1bAKyPiu6CFlk5hadVw8v/9OEIbR+Cfe650+hIHivQUb
 SkcNwojWR8IHeml7RSQ==
X-Proofpoint-ORIG-GUID: 2oc7ESgMAEk1_DKbNRgnauQYP_wPjxz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030156
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116356-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC4D3703F6A

On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
> 
> 
> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> > On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> > > Add Device Tree binding constants for Qualcomm Thermal Mitigation
> > > Device (TMD) types used by remoteproc-backed thermal cooling devices.
> > > 
> > > Qualcomm remote processors expose thermal mitigation endpoints
> > > through QMI. These endpoints can be registered with the thermal
> > > framework via the `#cooling-cells` property on the remoteproc node.
> > > 
> > > The QMI TMD protocol identifies devices using string names (for example,
> > > "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> > > `#cooling-cells = <3>` requires numeric device id in the form:
> > > 
> > >    <&phandle device_id min_state max_state>
> > > 
> > > Define common TMD device index constants shared across currently
> > > supported platforms. If a future target requires a different mapping,
> > > additional target-specific constants can be introduced while preserving
> > > existing DT ABI.
> > > 
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > ---
> > >   MAINTAINERS                                 |  1 +
> > >   include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
> > >   2 files changed, 21 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 57656ec0e9d5..ffd85fd1dd80 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -3410,6 +3410,7 @@ F:	drivers/firmware/qcom/
> > >   F:	drivers/soc/qcom/
> > >   F:	drivers/watchdog/gunyah_wdt.c
> > >   F:	include/dt-bindings/arm/qcom,ids.h
> > > +F:	include/dt-bindings/firmware/qcom,qmi-tmd.h
> > >   F:	include/dt-bindings/firmware/qcom,scm.h
> > >   F:	include/dt-bindings/soc/qcom*
> > >   F:	include/linux/firmware/qcom
> > > diff --git a/include/dt-bindings/firmware/qcom,qmi-tmd.h b/include/dt-bindings/firmware/qcom,qmi-tmd.h
> > > new file mode 100644
> > > index 000000000000..73efecef0f3c
> > > --- /dev/null
> > > +++ b/include/dt-bindings/firmware/qcom,qmi-tmd.h
> > > @@ -0,0 +1,20 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > > +/*
> > > + * Qualcomm QMI TMD (Thermal Mitigation Device) cooling device indices
> > > + *
> > > + * These indices are used in device tree cooling-maps to reference
> > > + * specific TMD devices provided by remote processors via QMI.
> > > + *
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > + */
> > > +#ifndef _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
> > > +#define _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
> > > +
> > > +/* CDSP thermal mitigation device id */
> > > +#define QCOM_CDSP_TMD_CDSP_SW	0
> > > +
> > > +/* Modem thermal mitigation device id */
> > > +#define QCOM_MODEM_TMD_PA	0
> > > +#define QCOM_MODEM_TMD_MODEM	1
> > 
> > What about the dozens other ones that Dmitry's laptop reports?Ri
> > 
> 
> Thanks for the review, Konrad.
> 
> We are only defining constants for the TMD devices that are actually used
> for thermal mitigation on the platforms supported by this series.

Why are you using only those TMD devices?

> More constants can be added as needed.

Kodiak is one of the supported platforms.

Running the same tool produces:

TMD service: instance=0x00 (modem) node=0 port=20
  29 mitigation device(s):
    [ 0] pa                       max_mitigation_level=3
    [ 1] pa_fr1                   max_mitigation_level=3
    [ 2] modem                    max_mitigation_level=3
    [ 3] cpuv_restriction_cold    max_mitigation_level=1
    [ 4] modem_current            max_mitigation_level=3
    [ 5] vbatt_low                max_mitigation_level=3
    [ 6] charge_state             max_mitigation_level=3
    [ 7] modem_skin               max_mitigation_level=3
    [ 8] modem_bw                 max_mitigation_level=5
    [ 9] mmw0                     max_mitigation_level=3
    [10] mmw1                     max_mitigation_level=3
    [11] mmw2                     max_mitigation_level=3
    [12] mmw3                     max_mitigation_level=3
    [13] mmw_skin0                max_mitigation_level=3
    [14] mmw_skin1                max_mitigation_level=3
    [15] mmw_skin2                max_mitigation_level=3
    [16] mmw_skin3                max_mitigation_level=3
    [17] mmw_skin0_dsc            max_mitigation_level=15
    [18] mmw_skin1_dsc            max_mitigation_level=15
    [19] mmw_skin2_dsc            max_mitigation_level=15
    [20] mmw_skin3_dsc            max_mitigation_level=15
    [21] wlan                     max_mitigation_level=4
    [22] wlan_bw                  max_mitigation_level=1
    [23] modem_skin_lte_dsc       max_mitigation_level=255
    [24] modem_skin_nr_dsc        max_mitigation_level=255
    [25] pa_dsc                   max_mitigation_level=255
    [26] pa_fr1_dsc               max_mitigation_level=255
    [27] modem_bw_backoff         max_mitigation_level=255
    [28] cpr_cold                 max_mitigation_level=3

TMD service: instance=0x01 (adsp) node=5 port=8
  1 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1

TMD service: instance=0x43 (cdsp) node=10 port=9
  3 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1
    [ 1] cdsp_hw                  max_mitigation_level=1
    [ 2] cdsp_sw                  max_mitigation_level=7


> 
> > https://lore.kernel.org/linux-arm-msm/4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k/
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry

