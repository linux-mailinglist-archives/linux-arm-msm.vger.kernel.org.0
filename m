Return-Path: <linux-arm-msm+bounces-107355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNrNIXWLBGqvLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:32:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB25351CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 837443059121
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2890C3FE374;
	Wed, 13 May 2026 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARVeGKW8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QU+mntWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443440FD98
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682465; cv=none; b=XYXJlQ4CUXKc8K2s8K8gjebT44BhLI5ZUSfWMhIaq7HhLd7DNuDYsYWIvCBk5PKQ2nieDD5YwXSIvm+cFWM8fIAFqCk6Xq0A48NZgscfNLDZ5wxWccQeX5ZJVENNPiYdzAeZIbfa+As21CW81iT9tv9rtwlxNO1WzGE7pzu+hl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682465; c=relaxed/simple;
	bh=SxDZpMxhiKrgSusg12vnsvU0n1cgiERm8M4RRozXgYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJlPDFFrwA+gI19HG9RpAn2QknUELhNskh/Bon+/LjV2f8GGucYA6OpR/yodhlT0rB7DI/hwd4Cf9O2lAKJIpuzlq5dP6YsBasjDsdNyXrM65CrLpfltL6r5KwtPpv4nwIyARw93EWZKQcWoBbKVdTFMWFnzfzb4kKvAS5Netis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARVeGKW8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QU+mntWl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWDIs2321248
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2x9/ObHkNHrSVs9ZLhkJp/z2KvggBQnqlMrwElvtFI=; b=ARVeGKW8PX1r3rvD
	KQdKkQyliQXBLS9zH0X5xDJ6vPWk6GP8eNa0TM/0DfB7W79XW3u+Y+KxOKzJHAQe
	GAV6YMnQDn3QEZ9EjMYJgGd2KJEs64dXitRXlT5XwRL3fioYGDGDlVd/IT3vrLA+
	1Kz3lW25e9Q47GsJC9+jN6pzC7zsAgqrf+QaYtQYstBegKUrZnsk5IDshPvAXcxM
	hLi5VqmwEiJqCpDR9LgU1Jkx29nhzmIOir6EclgUgdY99/ub+GMF+AH+sUuMYCW/
	7UYvBF6SzgDGoEBOaen87brv2CFATa1TFeBod+f1AErvdE9ketadkFtd4oXZ8Dok
	Pqhfxg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguadkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:27:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6314daf0053so2411337137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682462; x=1779287262; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E2x9/ObHkNHrSVs9ZLhkJp/z2KvggBQnqlMrwElvtFI=;
        b=QU+mntWlOp6PMKvwr4x+DjPzQ5tmJrk0HlwE559G9in0eUKJoVeg3jJIR/+dcfeVMZ
         1yE6Kp1Mhk8KTsJORooeflF97lhgYGk+KPxhjjehGethISh3TPu4u31X+TAw4mnCQ+h6
         B9w8x9Ynr4PbE+xUDGzq3q3e2Pk8SyVHMRAckR0U8TeyvoARwptxZdMeRTnN4HXUYF9C
         CwCYpVvQFz9im6sn1oT4aGsofRHkKhFiGzRtZEPy+O5SNF59aXotu4JhMJ6OJtSjasGU
         P03tqgzsbX3HBUzDmvQjdmKH3i+CucYAyvkK2yQ+eriOTkFWcoGJLjCroNQ7JlRClK8U
         5gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682462; x=1779287262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2x9/ObHkNHrSVs9ZLhkJp/z2KvggBQnqlMrwElvtFI=;
        b=g9lTgTez2g2U8Nc5BGK+EfvGLhwEv3gi0yLpeySlG5eUfWWgnTzY5ivk6EkLVG9h9E
         0/tvR5awatfVYBPdyZZdsJWIVasnSmpw3EMPbI0sZFHvVTEaFlbZDJCTF4F8ZmWn5Uq+
         RkTEBlhaXdE2uyBBFnqQpfQi0Y/86UtIL8ah/Fn6ucE34WnWjUu5gb4eLsexs6bmS4YS
         Q31ucYHZ3QC56KGh0lL89x8HRizKGILn0nJIHI+KWYPPYZHilip1nEAWsT4cw8LCfCgY
         D4LxclyDoq2I495pQbLjjJw7nj56qg2P/SG2+AI6JTS8z7WKnFrv3rJKMLtD07P+QpPh
         2iWA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZD0u82UGGyPtnpj1kwrxgfcZDUexWJCT8kAid6mh1cspNp0uOX3mc8jrVjwZyqOm7Tj8Lq20UZ5Y+LtM1@vger.kernel.org
X-Gm-Message-State: AOJu0YxuvYoUAXiBlzLMvzGcYTB3xlTNH6djXiOU2ucNrQrdB7A/RnGd
	lp6HQziZAlyifWT4c5Z+ROiTeb22erq6mplz4iOpWOas38ZiqqsM55C9Ve+W/JTp616HWlZ5wWO
	ctHbCI3t90W18+AkgJtr3KY2W8vuDQfB9iYnba2X17JVHlP8zTHRH0rYsUtuyVAbS4bqX
X-Gm-Gg: Acq92OHoJkk5nHl3NkPKQ2W3Ayoc2+93SFLTEwS0eIA9k6aQFWXClulbVnxnyBnM+qZ
	WVvAMxm/iBgz9hQqceHyCDxa6nLnYNi8NsFp3ukjNk6PZL/0kgScn/XnZyYc5qRE7NgWlinqbLO
	PgsVhPPQ6mTFd7giT2+3mvyTBJoz5qm5y8WCLCSuj+VBP6Aj93V9U4fZbCruhkoX5dyAFfdDKZq
	nr4DZothcANd6/5toi9JoInAFk2J/2+QlKCEkFAHe1/0Y6sP3uiNwe4cwzJ6p/KWDVIHDc24nZc
	C2OA/7QEuYu01q5DW6frApzKfR3zYGgWAAFYYIp7fP2P3YrZdQxQ/QpS+v8qnaWGrnbpQnnb/cs
	IepDBEz9qoeI63r+frIAPDrs7kzk3NKwjo5kP9afVB3/s9tW+r1g6QVh3rHlMI7wvcEuGUy3MCr
	xloZw3Jk05wjBLKyIZPTnrNGRozN3au+HGXgE=
X-Received: by 2002:a05:6102:6041:b0:633:c6c4:b328 with SMTP id ada2fe7eead31-637a6f3ba12mr1163658137.5.1778682461793;
        Wed, 13 May 2026 07:27:41 -0700 (PDT)
X-Received: by 2002:a05:6102:6041:b0:633:c6c4:b328 with SMTP id ada2fe7eead31-637a6f3ba12mr1163636137.5.1778682461219;
        Wed, 13 May 2026 07:27:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d2cfsm4203946e87.25.2026.05.13.07.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:27:38 -0700 (PDT)
Date: Wed, 13 May 2026 17:27:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Message-ID: <e6ufvm45w4v4nzdxcnzby4wbqof7eyvy6asffqpamb3twhwde2@jhl4yin72lyp>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-2-e5437c39b7f8@oss.qualcomm.com>
 <84949728-7d0a-4ce9-f37c-8200ef792baf@linux.intel.com>
 <58b7b983-b717-49c7-9019-8862fd47695a@oss.qualcomm.com>
 <a29448e5-2998-6555-4ae4-a10f69c4e2b1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a29448e5-2998-6555-4ae4-a10f69c4e2b1@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a048a5e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=LygiS4vl0DVuJfOiXdsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: FCGd226gV1DXsNwCCTb8lL2k5su1gPKh
X-Proofpoint-ORIG-GUID: FCGd226gV1DXsNwCCTb8lL2k5su1gPKh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX8P5gI6FzGyh3
 p/UMo4VG7yvGuJkRR+icl1maIb+Hks9G3hcTDJntzWQgRNleJ/YnltzzwAdYvpcvJuUuysjgnSn
 45o5I/ml4QCqRizV5pb2I96RAuKhZh8FkTubRlynYj14Zkg1WIUcmsBmt7di+0NWcosWm3RQTDV
 3qpfkzGj0X3WeM0NN8KX/VZXZdELDbvP74m9jpby3rbGqSzc38CxOI8rmzPUYzRLNBiibgDVQ6p
 gSnIWEgBE8jDx5LLQfSaPQ9V2AKRZTvL9O5oHmMjAHDc0itSSAjYHSt2TS4lk+4/VDBoB/dMEXm
 c34JtNsMMKhs5EWj0C54rkzSj0KNUuVRmeQRnbvkyhVg+I2dXkFZNvP0HBu6YXAu09u+OMlotwQ
 Jy8WGJDL7V1exNUgujzW1MIdOG4DBtzL7sK9bzQrg6SWzImsBWoc7J23CjZSCAHoEM3Wv2QAFix
 BRu1i5/BRwNdf64BboQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130147
X-Rspamd-Queue-Id: 90FB25351CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107355-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:07:42PM +0300, Ilpo Järvinen wrote:
> On Tue, 12 May 2026, Anvesh Jain P wrote:
> 
> > 
> > 
> > On 5/11/2026 7:40 PM, Ilpo Järvinen wrote:
> > > On Mon, 11 May 2026, Anvesh Jain P wrote:
> > > 
> > >> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > >>
> > >> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> > >> reference boards. It handles fan control, temperature sensors, access
> > >> to EC state changes and supports reporting suspend entry/exit to the
> > >> EC.
> > >>
> > >> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > >> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > >> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> > >> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> > > 
> > > Thanks for the update.
> > > 
> > > Patch 2 applied to the review-ilpo-next branch.
> > >
> > 
> > Thank you!
> > 
> > Will you be taking care of merging the bindings changes (patch 1/6) as well?
> 
> If the bindings and dts changes go separate ways, DT linters won't be 
> happy so the bindings and dts changes should go in through the same tree.
> 
> As such, I only too the platform drivers patch. All this should come 
> together in linux-next once all patches are in some tree (and obviously 
> eventually in Linus' tree as well).

I think it's more typical to take bindings together with the driver.
Consider a more generic case of the bindings describing a PMIC or some
other common device which gets used by two different kinds of platforms.
Which of the DT users will pick the bindings?

-- 
With best wishes
Dmitry

