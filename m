Return-Path: <linux-arm-msm+bounces-100896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLKKEInRymmsAQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:39:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C62FE36089B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9FE9301BA8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EBD39B4A3;
	Mon, 30 Mar 2026 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozLdK5hb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agBiTFJj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345139BFEF
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774899556; cv=none; b=A0SrnifZIjLatZk/cN9hlvH4+e2wOn0zpWVMCCEn650GbEtMCBq+UxF6u4UHFnUhgrXUUG5RLbbJuHzNorv0azOYMqAMwUTgFUnAcDhW+9D2rpMTJh1lnRrxDJJ8jZRhpkUyzx/QUJNDKjk1ZEjP6v5e39g/C6KLeBtbdGjBDgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774899556; c=relaxed/simple;
	bh=oFytcoXIiR8Opsk3w+JvaLgCTxxpDh1YFywjXAt9ZJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCArbTuxSEDkV1HJwh6ODnshv+jFqh1ronQFcTAA/9bYf8nPbiU9xhBo25zb2PUCV4pb5pAybbPcsvkDiy0B5v056Fp02yms0cptxWmx1LWOqzTl6QUkrESdhdu49sNxjMwt03PfWkU5glpo8lyiyhP1kDn26l8GG4S2vG79XHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozLdK5hb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agBiTFJj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UIYHBS703474
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+34cAjsx8bqZcK2OkX0asGC0
	QUBSB0eVNVg2SXT/ntk=; b=ozLdK5hbRe0J/retiIb5TPOC868uoqZHr2IQJ9fL
	WdmtH7fVwbeLsAcTMgpcl3GGvM0aRjCTfPNLrT6b/mpzZL/lL1F5/Mfi1640T0qY
	k77f71kn484ZiR/P0Yd8dMsb+YshgLoh8am/RkRV3GmaYe9WAWT1VpcRFAxASmWX
	6ZH40ifh7mNVYUlicNt6YpykDGKrdU9GcLv55e4tU7iSGWJhSnMLERfz4X2uVAWI
	DF2pUkMubT7xFOeOeYcXEFceEX5FPkKWrO35uzQ3ydW232+LQahI2sz1ZpQMUHoP
	6i2LdmzD4QkHHyKeWrX/jlBJTth26VPB/dLaWiqsrZvUnw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sanspgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:39:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so159241141cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774899554; x=1775504354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+34cAjsx8bqZcK2OkX0asGC0QUBSB0eVNVg2SXT/ntk=;
        b=agBiTFJjf1TxCaN7XxfgN7fA0lhULaPzA2cZTJbqCMBZ3yH/y3LSMa6g+KtwOvJ1LG
         DcONJG+7mlX4DrPWEYbGR5ISiGGWnIYsmfoFy7BrzHcNtpKxetCChYl8HgDU8UEsYZ9p
         ghmrKGTg8WL5AlJWvjkFYW72cDZ90jBE66/LA7H5EMSxOm/WgBaHSzVFqa2K+OycAy9/
         1AGhxhn18b/IbRNpJDmMwuWbgYiqPQvvd+oocW6sziNg6SyCkio5xoOVcAmXjOulL+ts
         Tz+qL4Gtn+7AFH2BTSHUkJUbTQUkbLSIa6A55ISTBBvouLz94IUGAkPeSAAtZpNNDsji
         T5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899554; x=1775504354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+34cAjsx8bqZcK2OkX0asGC0QUBSB0eVNVg2SXT/ntk=;
        b=a1K/CwfsYTPJEjiJL/0XxJ1XsBCRMuwQKalQhgcgqLptyK58vEh2QP14h/uB0FbdY2
         84SN73AKcthfwby9cc2ABqaEMJ5Q358vH71frobZ5W4ChvhH226FPfMvbkkbi3igjkIn
         RbBIFJUDe+zYF+uMQdRjxqzyHO3bVWCTMCIda40iOVvAun4pJ0TiMarkazh7mW3Zwqob
         jLF1ZaoE8R2zauIIyIAjvVNqJfU8hzIrA14G1O/P3lJ8BasUnxUUW1rKzTkdMGbceI9C
         2LJGRHuBatGbzYqROyWXV0SvQO4sumlV3/AjwfdkF39UyUWCiPe27KzM5cmWcI3mrsf+
         UWYw==
X-Forwarded-Encrypted: i=1; AJvYcCXwEUZZwaqzz7sWgwhiQS/OTExmrZAwIUlqNNl5x+TGgsmO3+QrGgnog87Ol2i1gLr8Dmf70+4861hYrMu6@vger.kernel.org
X-Gm-Message-State: AOJu0YyjysZW05/OfNaqiDiRvRPxVEIDuxSOsDN41n/ykXpkqlRymhBA
	UkZJ3zVUbZXDarfR/srhVUoLxeDidOGcpNvvomwTEZRG/qu0LOzyHbA8EmJQHhSZwQNuu1+M6cV
	uwi4K2XL6yHL2NdtH8yM+FO/0XbusnxafVI1Jve+/EGd/PSjkMIfSt6+q64LxHpAu5qPB
X-Gm-Gg: ATEYQzyFQPu+j7N0e064NCYj+91CWOWUaYCsUtP+qTroyLQ7jFX7BX1va442YDGtagM
	MNCsKLdEs9rtr8xTjYUcuOncCo5QajECSmsH6XWXlYJvDMxJ3AuHP5cocs5mpdr2xL/0dRkKC6W
	cETR2v88IjNfovtf2n78EP+DeSnHebHwaGs4IZtQOABtZm/NfLIeLos24KLa80tz0/PIlkR96kV
	vTSTSDisvNE6xIESvJ3BF3F7+8IrqPGQ349RssKfIYVpQRwbXMXW5F4wYG+94x6M+Pno00bnZBo
	3Mi7X555yeGQPWv060nILlHlVOD8FvfUcsa+B4/gga5Qojg9zlI6AOupTvv42k7Ik9VTE+r81ut
	25L/16BVzk21Snt4zgzweAHvMYNupZ4aJRJ4vcRlWgNNlQAVftgCjJ+AKFtWh8Kq6AYQCfY2y5A
	Fs+KQBism/BP+3VOxTs9bHX3GSp9mrLJr1l64=
X-Received: by 2002:a05:622a:15d0:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50ba391db58mr184558801cf.45.1774899553831;
        Mon, 30 Mar 2026 12:39:13 -0700 (PDT)
X-Received: by 2002:a05:622a:15d0:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50ba391db58mr184558421cf.45.1774899553358;
        Mon, 30 Mar 2026 12:39:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b144f4eesm1848348e87.57.2026.03.30.12.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:39:12 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:39:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: display/msm: qcm2290-mdss: Fix missing
 ranges in example
Message-ID: <yjow6vpqb5cxyhnvepa3humyhgnea4vrttlpdvzvh57ubbet5k@vuqpytq2qq7q>
References: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
 <177488647743.633011.6769674149013868210.b4-ty@kernel.org>
 <wsf7oet6r7d55i7f6cdwgor4cqu3hzgqcv3r6lmyfsoivzgzls@v5z7bbea6fxe>
 <05610919-fde5-4cde-92b6-a35c93e84547@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05610919-fde5-4cde-92b6-a35c93e84547@kernel.org>
X-Proofpoint-GUID: ANthimUP3p2b5Ayc0sVTk7yBmI7TFcKP
X-Proofpoint-ORIG-GUID: ANthimUP3p2b5Ayc0sVTk7yBmI7TFcKP
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69cad162 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=vZIQzkT8WsM8uZE4rHEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE2MyBTYWx0ZWRfX/gXioMa+FLJv
 EIAeZvy69scXZBlLCmkDTePNLGiHgpTq90DBdxK8iM0sjiUt7qIL22l/dqPVYQOFNUkzH7db5YO
 mDDtpTmXg/drdeeVK/NpYPtUgIW8NdBqwFtMfqtc3ejVc9bIBOq1VoKZBWlefxSBLsV2RqVPrqN
 ORhTrdo2gKqupt6BgDMLqIQF90QQybjQ3vPpiFxl3bNhgkxwXgaH9fbTyGzq8Gt3el/Z1H3jEnr
 /kcOslw948o7zNaG7aABbgt1tNW4ETkHQO8RFY6JuUZ3P0IKbeJnlb9/rUoZFenAoAn68ll3r5T
 D+Vy5Yzo5zdQ+TZ0fr8X9b/X9Lv0/SB6WbVOIga6f5Or8JDX6O1w481jQOMBhCJoGcQ/R3joFT7
 dlj67qZ7+ga2F6vsEXpZm7tMKojDYq7Or77ZUYUuJ6V0NMKyHm1Ok3z2kzgHBdBam9Ec8WE95D1
 HQl66s7CBiYX9I5K00g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300163
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100896-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,5e00000:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C62FE36089B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 08:55:04PM +0200, Krzysztof Kozlowski wrote:
> On 30/03/2026 20:50, Dmitry Baryshkov wrote:
> > On Mon, Mar 30, 2026 at 11:01:21AM -0500, Bjorn Andersson wrote:
> >>
> >> On Wed, 25 Mar 2026 13:22:10 +0100, Krzysztof Kozlowski wrote:
> >>> Device node has children with MMIO addressing, so must have ranges:
> >>>
> >>>   msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000 (qcom,qcm2290-mdss): 'ranges' is a required property
> >>>
> >>>
> >>
> >> Applied, thanks!
> >>
> >> [1/1] dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example
> >>       commit: 88bdac5443e5269bb39c4968d5ee0becbffe3f82
> > 
> > Hmm? I don't really mind, but...
> > 
> 
> Please read changelog in original patch. I was also mentioning this on
> msm IRC (although not towards you), so this is not done silently.

Okay.

-- 
With best wishes
Dmitry

