Return-Path: <linux-arm-msm+bounces-116492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JifEBuf9SGrFxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 14:34:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6441707A1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 14:34:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NxwSLxln;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dAjpIz61;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116492-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116492-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4179301AF5A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 12:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A05349CFC;
	Sat,  4 Jul 2026 12:33:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547FE38E8A8
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 12:33:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783168396; cv=none; b=oVGqWBhZs8Yz3tZkWQuR7trxmHKUNraUG8QXCnc/EZzCGdGS7u4VSPBmYMGqCM/FY9K4eSstHYBByhZSUCeyXGDEfgQtQdGQyXPaXDAlSViQ0ulLarrcsGqQXuKEeNHwaTjBgVu1vk1XqOknJpcU/BBHtWBlIkar7Wstj7CAkis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783168396; c=relaxed/simple;
	bh=ZqLIdjiIL4PaEbHPy9ZDj4gnrcQqTesCsBp7hGwIhYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXb9J6ROvYOpkPcG7cPFvPf0TjicUpQ6vGB53Tp8KEVZZHzyq1j/Corr1A9TPNWRo+jv2Q2L36O4Y4ap63l0KzDIZNhwB5wx54u6rB5PWU8ifbh2yEzDDJd+5nIBtt3uHm+8xaRHFPq1oEc/sBFBQuWM8rp8zukbzKFVyOFGHuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxwSLxln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAjpIz61; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6646hjwN2302194
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 12:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7l+w1LkFRue1ZQFudjsniOqbsa/avBSZQtqmMh9NKg=; b=NxwSLxlnSUC+g1lR
	7NVdxQqrD2X5yEP9GceoXfoUjZh44a4vGxUoQ8nhE390jEYQSfUgen9jyHzUGs2O
	D5Bl7af9JbE0T9NtOGr0BWCOaaI/RPPDRqSAZ7ibwp8/GjX8JJKrJ5IUoBJ/STIc
	+byoJEJ2LJJmEaI7i3sGeBmcuG4zYZaRNqHV3Fsai3x4XZzu6f2irzrW+JvBADal
	b5PT7fNps+909/4cB/5uNGhJBY20GRg74igOXJGhxGlzsszkWnqmmQQK+isRhf31
	R2Lcit6DPc0dptb0CaKNoy4YmEUg73b2VE0vlpNyqpNIjBPTuI2dbAMqlqCfDgFB
	5JyiQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sry1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 12:33:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f946461so147870485a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783168392; x=1783773192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n7l+w1LkFRue1ZQFudjsniOqbsa/avBSZQtqmMh9NKg=;
        b=dAjpIz61viQQyRrlNsw/I+ankT8iHVgb2aWrCNZrdecMj3v21cfowC2JhZY+QK3RZE
         n7DBEXQn6u42svyDOec9i1ZWfIlSamiCxUJP4pPCyYpwda/8jXEMLMkobuWvsdb8Vdru
         BQSSy6Lma4sATD+2HDjiSLAtYOy7MOq3asNiF5Fk/Wfc7bk4u/OFoL3CUI/8hVJpG7KR
         Jcjp0+Ukf5In4CPET7svUiPQo6atK9bs4YECmDxftExhyJGcR1CCXnLHVYQrIp84GxYn
         2DnvtgPqVbu011GJmufLMIxCHoPJ4J613wNTpXOArXWh4VFIlzblZRcR2azeXWshhnSP
         tVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783168392; x=1783773192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7l+w1LkFRue1ZQFudjsniOqbsa/avBSZQtqmMh9NKg=;
        b=ljIqoe6HYwil7rQ8ptpEM9lWrX8dOwSOCbAH1L9Xgx2Zs8nqfNwjUydURSGXnMvO5V
         edCCdDz08OOy8iCw5RFNFDWNGcJyYG7RdOExqQy6mcI6qpZIg1JRYjBkiAua4ujN+kHm
         xCSC/m7CcMohCA2kUYVUVwX1bOkTS+Fhj9EPkrRGR+n8Pm9IUEMl3jwenjsG0OVgkyCX
         JKPzKsz3Hm6sq/LAolgnLGWMkBMrYEXKMXf/jOZaJb2sDx2I5DknwzUxPiBRLz0r8XLI
         hsYDkL0CdK8p2i/nDbEq/AsfysVVFVuJTeNoJAXXr+spXlIXRdDnwKuBGlvIC1MZKFpX
         7DOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZjGGZojBA271UCjbG7jVvrXS6+6V9ZEAPhHZ9iv3xhL7bG0/gPNCpvZN/gvXK5o56qEV3civ/ay4/Sx+w@vger.kernel.org
X-Gm-Message-State: AOJu0YycXYx7XOGB2v9J++dK5A3YeUzYh1wsmNSA1i9SsGsbyNKI+u8J
	KTgtQeS5kfE4WORI44rFaBvYiDwjrDvbiSg4lS/Yz0ngIEWCb0h9/0CJzPqtDBHo/svahPSxqbe
	YLBKbFORJ6gLHVjoKMzJzN+EM31XWcu6VLh1NQQOPs+zCyxz+ihNXcMqwZhJh5JcoLYDF
X-Gm-Gg: AfdE7cl3OwiqXZnc6lT8mIOcPXWlkeqYo0youXkzmJajMUcbAVUeUAaPoF7TerbW1/p
	HyN/12IflZNOF2A4sXJpRbeRF2bP2/3YBRY2bI2NNwygDnjhTtBQmVfgiOlcQHImVt/7UZ/ZaKc
	Zr7f12zvL4vxv7/xUlZ2XMt7DY3TuJwDc3jmEiUz1CQ0oImc9AGak6bxlpfPenzENL1olTQjGi/
	pTY3lw9PsaLAyZ4rzgOTQE9S8IYl0hwd6nrllTrcaEwB5mku9fvYDflmO/RZ7WI4lK67I2WPqE+
	7YaobHQtNOW/+gC3PWvZ6BNsIkXAiTJo/OgIvCMlmT+HfxBX5MUMVVHDUl3DTnhjzuM353JMmDj
	Fuae2Hu55c8upHYPMFILZSvpiwmD9LEfZb6dajs9rNyUPcx7rQ0OKxsqJpy3WZFqEqSS9LBNbzk
	XctXcrofsRQUqEL/slx80VN07K
X-Received: by 2002:a05:620a:4398:b0:915:9d08:94e1 with SMTP id af79cd13be357-92e9a43b335mr448897985a.46.1783168392439;
        Sat, 04 Jul 2026 05:33:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:915:9d08:94e1 with SMTP id af79cd13be357-92e9a43b335mr448892785a.46.1783168391916;
        Sat, 04 Jul 2026 05:33:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4aba9ef2sm8519151fa.0.2026.07.04.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 05:33:10 -0700 (PDT)
Date: Sat, 4 Jul 2026 15:33:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
Message-ID: <qqdaoc4tacx3dlh6bp43gu56w44cezkm345iconc7iqngircxm@hoywvq57otpm>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
 <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
 <ca8f3731-3f23-45f5-82ed-ba1a65514b95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca8f3731-3f23-45f5-82ed-ba1a65514b95@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDEyNiBTYWx0ZWRfX+YD9Dh1oXxu7
 AE7s3oV1XaTn6shGb0gH/boFQzp8Co/6Xg800p2a2+YK5VJssU2GXyYOShTYWkBtrM2TYjmm4B8
 grxOX6IbVeA06e4qjNFaoJXXC4IJ6oU=
X-Proofpoint-ORIG-GUID: 7ZuDinSmjloS_aOpND04l17S9aW52Hrd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDEyNiBTYWx0ZWRfX1YhP2O4d2Q+A
 VkFqUi/wZAPAasczHCE4KfR3IcGf9XFFH2BOOCNYztcPS5w3xNUJLiFkX2B9tq+75NnvrqDzKwb
 Yx7liTjWTKF+dfrjy2ZH9wdivZceZWPJmiVMUkpw80z3vtun+uhFleGD3Spv8R7wUFESnQYjHD7
 S6s+NKfY/fuApQeTHEU2T1yjDUiPvtkYza3NnOkbdog9ridwxOG1qz8BAy0oVk8kXdbCDBn4jPx
 q+EQ8Aqu0tw708xxxx/2aditl9HXhr+bBSyNZMXTryNZPLTj6eSSncoJHpjuQzNvSBfkd6kvDMi
 slIn8ocv3cobo2xJLTIWVFKGtndFAfGHmk/oZjPZzMS2XwD7cWR5VYuf34mGZYrXnqjaxdn1Rvh
 nDaPCrPCW7AwMggJDffXAdMmi80Aj4Q12TfkiCTWu0Xsp2KCwPK8kaeNwA9c7prHdVHVyZFZP7k
 dZ29ToYoNw5h8Kux2Pg==
X-Proofpoint-GUID: 7ZuDinSmjloS_aOpND04l17S9aW52Hrd
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a48fd89 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=CvX1hmVerT4HThdZ_8QA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116492-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aastha.pandey@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,hoywvq57otpm:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6441707A1D

On Sat, Jul 04, 2026 at 01:56:30PM +0530, Aastha Pandey wrote:
> will update why part in commit message.

A. I should not
Q. Should I top-post on the mailing lists?

> 
> On 7/4/2026 4:41 AM, Dmitry Baryshkov wrote:
> > On Sat, Jul 04, 2026 at 02:04:32AM +0530, Akhil P Oommen wrote:
> > > From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> > > 
> > > Unlike the CPU, the GPU does not throttle its speed automatically when it
> > > reaches high temperatures.
> > > 
> > > Set up GPU cooling by throttling the GPU speed
> > > when reaching 115°C.
> > 
> > Nit: 72 chars. It looks really strange to see two paragraphs with
> > different line wrapping.
> > 
> > > 
> > > Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
> > >   1 file changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> > > index 34261221664b..eeeaa369d3a7 100644
> > > --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> > > @@ -2510,6 +2510,7 @@ cpuss0-critical {
> > >   		};
> > >   		gpuss-thermal {
> > > +			polling-delay-passive = <10>;
> > 
> > Why?
> > 
> > >   			thermal-sensors = <&tsens0 6>;
> > >   			trips {
> > 
> 
> -- 
> Thanks & Regards,
> Aastha Pandey
> 

-- 
With best wishes
Dmitry

