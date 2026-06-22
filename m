Return-Path: <linux-arm-msm+bounces-114047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PkVtNlxaOWr8qwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:53:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFEF6B0DFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:53:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kFkUdldc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EM1dpGWP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114047-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114047-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1AD83009B33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D91360EC0;
	Mon, 22 Jun 2026 15:51:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF58264A97
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:50:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143460; cv=none; b=hrlVN+oxdRa/m6WjVLe0xfMSVa+98zdDxaUoWp/havd6GBGCPIe2GgMxrY/WKe8fPCniR1U8L2s7xi+uk2RZP7vgEcwT0KcdHfDMwBGrg4zBlS/pY0GMpdof0n7U5cWghPVMZirPmjxNWKoQlywlYYrr2bhFrFCXkqpdcppSjmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143460; c=relaxed/simple;
	bh=YUr/EDfqhlUBd7GzzTUmu31ihTNj2fyZnm0Q69R8Wps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbadcxMemEDQj6rXOGe7EcuRkxmwNP0/eEd/ZSkvOPLFwZ7pzcF3UeRyjBvaOAxUq+jeZSbxxR4vP2dIuxiazak4XNwk73IcKYSIhdFO9eGax/6IqE58TMVKOeFeN6lKVjDq3n3tZbPh8/R38FdmKIQt3kLg4lAa8tW9caUIY1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFkUdldc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EM1dpGWP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFX7ao1591653
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LFwruN8t4Ou5IEqGe/3xdJLo
	az/ZKII1FGmDkOw7dSI=; b=kFkUdldciq4Pv/mNc/7fEJgG5CJgyUc5E501BjRy
	QVChqFDfp9cmjuCE7V/1/lkwA+6yahBjjbpVlbk166+T9Hvbah9MOObcz/zhKEEJ
	QRLQVzcVQkjLOlBa8V7ncZwA2SdknX6/RN0HNSt4qS3S0fO1D/Xi2Uarx1YtjEd2
	59lh3LRdizkNcAmJt3q2g4hsd9QY4VkSP6iNr7zsJYjPUvhDU2ufURc9xRp7OB9U
	05edcEfQG2qOurJFkc9WKx6f7SxqebIi//zAaAX4wrVNW+nv+xrWCSOEemAQyIEY
	ltMeGeNCP8CWILZ5M1Nk4eJrJZSQSuVojYSQ9Cp6GhZUQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n40kwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:50:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6a997c400so39895ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782143457; x=1782748257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LFwruN8t4Ou5IEqGe/3xdJLoaz/ZKII1FGmDkOw7dSI=;
        b=EM1dpGWPp3L3V38d4yeMFivl2E0l/dw1A3PrFCGCEzUSvgtTGuRz6F37XgbYf/9Aaw
         6M7IRWLr09OPEob5AXcefo9zIFRJL8N1BAte/JCQWh8CIxK8uKAb3A/onQGTPnE1DiaR
         aKl0qbZvl6cm1dOEMAliz4gvVDmXqiHTFergTZoEPNHhx6QOAJuQKXXPgfDvcCbu46bn
         L+dhxW1LTxeX71VOnvAZqNTq44OPv1sXSCZCt98B2bbC63icj8Hl9Xy1vXG/NpPk+AUR
         ohq8I3HMUDfVhLgNpiQWB7lwLJ/79QxN/xJJf0/Aqc7+RlGitPXfzsaX6JA4QuEbSBhA
         HOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143457; x=1782748257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFwruN8t4Ou5IEqGe/3xdJLoaz/ZKII1FGmDkOw7dSI=;
        b=TjNmVgbAK+X1EcGRTpFbpOm/cMedHmkmzwFvmg2rRn+TXA+uBHy3D+WlpFj0IBnrtg
         x8CTbpdNMw//ukZecpxvcZfEK0OaC4hywZmLgtgbPaDnntTj2gqYRcVHxG5InKKpNXoA
         EiHGsRsMQ84CWYGbbI7cIJnQA0ULhTHoRG6XQq3kbwDmbv8zwg6edME8Zd5Uq0/u+sb5
         5UBK7RuBAWg6hhqcrw+CGlPYk7gWIX89826sx+gkpTWs0dxMqIg0T13cSjaZftWxgpoi
         MQLnPsBzX5dhoWemD2v9JVFaHXVy62+ppkZBKqIgibW7zTn+27lcuosB8QEUxeRArrwn
         1Tsg==
X-Forwarded-Encrypted: i=1; AHgh+RojFEGHNhF/ZfAMK5pBCnGOPDkS+iz8/FmFI4u1r3aUvlArR7QuT2KPN2aAxJceOcBD0J7+kuv3EwcFLJA0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxo4EPLA3/iRLi27vv79u1S8IDsIFzYlcevTeqSmhV51jtTGYe
	r9u5jS28sPYASjxPG936fy5m7/hI4jfPfBiQVFB+6YN7pKAcVq0S7wbT+RdAQhAQ/r1X5rgZeNw
	WMwJAwH70S/7fWneHB+s1vck8+OcH3IjyAI7DAl98FESSd/JsOqi0MyHLyMEZJGZV35lK
X-Gm-Gg: AfdE7clsiEJXsUm4L2BndPGrg2BRToAleLAew6xysk8cog2U8fg8T4FIL1QLvLBvypd
	jRuBtt2FWuIiRVcIXjw5IL5IXPh47l38I0dMqTn7BZgXhJozNxWg7xQZFlp3ym6zYyc/NSElREW
	YX5+g7wFPDyTGMRJBgzTYA/tYSiKelNlTGiCtr5TE+OjO+MQPUu2+w3mE7GyV/5OC+YRo08+pCc
	vPl4zumcAMHPilwEU6Wj5JD4uSQ6XUWrvjFgjeuwW2/ZIKKku4cMB5AoT/jsruCeagY3WKS+yX4
	xskiplGbG3jqSVB6HaQClv+8QPqZajiVNepqhXIMugXqYx4k4TNoBB2aVA44rjf9QspPrXJH8vt
	2FcBvNzKeC0+RWk+OPO4jpAM4Wp2zhIBYythO4Q==
X-Received: by 2002:a17:903:28e:b0:2c0:af11:5cef with SMTP id d9443c01a7336-2c7c3edc1d4mr152105ad.15.1782143456959;
        Mon, 22 Jun 2026 08:50:56 -0700 (PDT)
X-Received: by 2002:a17:903:28e:b0:2c0:af11:5cef with SMTP id d9443c01a7336-2c7c3edc1d4mr151835ad.15.1782143456343;
        Mon, 22 Jun 2026 08:50:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe441sm83075755ad.62.2026.06.22.08.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:50:55 -0700 (PDT)
Date: Mon, 22 Jun 2026 21:20:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/6] remoteproc: qcom: fix sparse warnings for __iomem
 annotated mem_region
Message-ID: <20260622155050.yvgffdapdjb5f4fh@hu-mojha-hyd.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-2-mukesh.ojha@oss.qualcomm.com>
 <62c91b74-ca1b-44be-8771-669aa686ddbe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62c91b74-ca1b-44be-8771-669aa686ddbe@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1NyBTYWx0ZWRfX8d8nAukoyVQ6
 MzbGp5P4A9NNdAoZbkuJND9IajGZJykXoxQfPCDVYKQHF90OKtKwuuUPDC6uuKxgMHNL5NILbci
 BjBj9VcmFDiyq9+pHg3sGMfbxnUZtl8=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3959e2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Leim0v9d-cC2b6exvXIA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: BKOl480a2add5hOIE636jpyP_mLv98Ad
X-Proofpoint-GUID: BKOl480a2add5hOIE636jpyP_mLv98Ad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1NyBTYWx0ZWRfX9Ar0fpqOyAla
 U0BpZXaoxKCEw67AlbE4uPtjyoh2eNxRZxPswjXXw7enxmfzWjG5n1xAc1OgaNaourvBxn9w5Bo
 rcjAVze8fjCy9o5KhnjeMmrtEJnC/QdQcS0Zfy5Okj9uPV5/WqGLFbnsHXvp8EsDP/jtT+n/EhV
 yf1uaacN9lKGiq3B0ldoyKMw9dxKPCUnNvzNvQasTp9SmmSmtjN0z+Dh4iimJXvgQzPjhmZ8O/k
 836a9qSQvfM9+xntTjUQv4sJ4M91YTLj9Ma2ivoVpnX7XNMBdxKbAc554MPugrZZ2mEE7kusrDN
 Fe0bRnTboBb3OSp1hNLzbNraLoy3uGwuQKD4VQwL980k2HVl/Dey9bFQ8QXqsjbVHDXwhzC3ODL
 7hW3H0uvapPsXukVYlnXRyoBmrY24T10yb425B9Uwj6zV057sreNqNsrNJHe+UAR4B9hzolt6fq
 fkfdepJVts2cJIWZ9Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-114047-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EFEF6B0DFB

On Thu, Jun 18, 2026 at 03:53:22PM +0200, Konrad Dybcio wrote:
> On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> > The firmware memory regions in qcom_adsp, qcom_pas and qcom_wcnss are
> > mapped using devm_ioremap_wc() / devm_ioremap_resource_wc(), which
> > return void __iomem *. However, the mem_region (and dtb_mem_region)
> > fields in the respective driver structs were declared as plain void *,
> > causing sparse to flag address space mismatches:
> > 
> > qcom_q6v5_adsp.c:639:26: warning: incorrect type in assignment (different address spaces)
> > qcom_q6v5_adsp.c:639:26:    expected void *mem_region
> > qcom_q6v5_adsp.c:639:26:    got void [noderef] __iomem *
> > qcom_q6v5_pas.c:141:45: warning: incorrect type in argument 2 (different address spaces)
> > qcom_q6v5_pas.c:141:45:    expected void const volatile [noderef] __iomem *src
> > qcom_q6v5_pas.c:141:45:    got void *
> > qcom_q6v5_pas.c:637:25: warning: incorrect type in assignment (different address spaces)
> > qcom_q6v5_pas.c:637:25:    expected void *mem_region
> > qcom_q6v5_pas.c:637:25:    got void [noderef] __iomem *
> > qcom_q6v5_pas.c:654:29: warning: incorrect type in assignment (different address spaces)
> > qcom_q6v5_pas.c:654:29:    expected void *dtb_mem_region
> > qcom_q6v5_pas.c:654:29:    got void [noderef] __iomem *
> > qcom_wcnss.c:540:27: warning: incorrect type in assignment (different address spaces)
> > qcom_wcnss.c:540:27:    expected void *mem_region
> > qcom_wcnss.c:540:27:    got void [noderef] __iomem *
> > 
> > Fix this by annotating the struct fields with __iomem to correctly
> > reflect the address space of the underlying mapping.
> > 
> > These regions are subsequently passed to qcom_mdt_load(),
> > qcom_mdt_load_no_init() and qcom_mdt_pas_load(), all of which take
> > void * and use plain memcpy()/memset() internally to write firmware
> > segments into the region. This is intentional and safe: the mappings
> > are write-combining (WC), which on arm64 permits bulk CPU stores
> > without requiring the memcpy_toio()/memset_io() accessors. Changing
> > the MDT loader API to accept void __iomem * would be a more invasive
> > change and would affect callers.
> 
> Zooming out a bit more, should we even be ioremapping these regions
> in the first place? Are they not just RAM/Normal Memory in arm parlance?

Yes, ioremap may not be required. Don't know why it was kept in the
initial implementation, as for most Qualcomm SoCs this is going to be
normal RAM and not SRAM or something, while other implementations like
qcom_q6v5_mss still use memremap with MEMREMAP_WC.

> 
> Would switching to devm_memremap(, MEMREMAP_WC) (like we do in RMTFS
> today) be an even better solution here?

This looks fine and I do not see any immediate impact; however, I would
like to hear from Bjorn on this, if there is any history..

-- 
-Mukesh Ojha

