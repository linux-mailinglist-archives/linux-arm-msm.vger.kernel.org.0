Return-Path: <linux-arm-msm+bounces-117898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DHHQNAxYT2pKewIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:13:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 889B372E19F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:13:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R0FIk1WH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R20XTesd;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117898-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117898-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0FC43029B39
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783823EB11B;
	Thu,  9 Jul 2026 08:12:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30EA3EA962
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:12:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584769; cv=none; b=a06yuTBt1YL8xOzQ4+uIyg/MMQ8GKiw43BVDQkGOSeozX2z87yQ6LpshhKYr05xOEFapwEcBPwzn2Rrxx83OYeX1uWGwL7Sjfr3tyTAed0TSIXEIvTRuzlDF5wwIstAtJjQDvmKIDzt31mBMqXsRUhJRCydt6zPdG4DplbOaYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584769; c=relaxed/simple;
	bh=niKygPrLJDSVAAD++px275RNa9zTNKh6KuMMtjoQ10Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g5TQDHdl73IhUz+whGEBJlNjmsc3vkNucKeLv4Y1sBx1fJcwY6BcqxmIco/ZgjQQB79Nh7j7fUo3X8rRZ9MtJ7NM7dsaUeOiouV4b6ez6pTbt/k4mOCFibTKB4jqS7r9IcTdruUU3Ea9jeb4zlNBHvOBTbSWQ76fffN3U8cOL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0FIk1WH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R20XTesd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960F1K749620
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NnyUzY7/I91
	fQnA2ocfZbXoRwelCNf8o4yij2RikmG0=; b=R0FIk1WHWr9AfzcZCDwPs0mY+eZ
	BQ6DKnYMTR0161gxj4edxcGmSp1c/l90F1Yli3GHyaUaH0IKmb8pwkM+waAI3Js0
	KJYz+4rOz2XnITBMLRE5kvpqor3qjwCq5ApsQE+oZ+wfH9WfCWEBeMWmYEU6poRk
	FRLvGu4l+AS6ck9i6oLbVBVYD7nMFuKzDcTlJyJSwUwp+B8ATv7ZRtuaGFKpzW2l
	CXclkbWQ9A25Obyo49HNq17p4s9mUzRygUJSE3hTZT4arDSsT/fUnKouYkUZPWbl
	poEd04g2k3x0vHjSbaDBr/fnSZod4bHl3IiJ5FsSQ5/y69wB1ca9CYeG4cA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft2d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:12:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8475eda5f7eso367501b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584765; x=1784189565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnyUzY7/I91fQnA2ocfZbXoRwelCNf8o4yij2RikmG0=;
        b=R20XTesdTBH3Usq8OxPzX/CpySdpJSQ+v/ha65CFZ4QhKsynuMNJPK06z8fXXa47E9
         43GEgxshiC7Zn3eJ1dirQ/MDVA1nxZQol4s9gPeuHiKASAJxMKkp8+DDfehJ3TutPSD5
         zeUYeY3Yky5u+7g2d5wzgFsBGRUuF7SmmdqGx9F6YxI2t3Wd+O1s6QY8zRNhYp6HQLBk
         b3n7fVPK+VMUjF2bjhPFNZdJ1L/eILayTwBd/21DOXXA+RnFv8QpD/8hBSsbj2MRzpED
         p5n/ZC7AKVR5y01kLcQZYBc9NtJXRQuEIv89BI/Z+UitXgqeunmElJYCyVobJqEmgeu0
         JQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584765; x=1784189565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NnyUzY7/I91fQnA2ocfZbXoRwelCNf8o4yij2RikmG0=;
        b=FsJHelkNP2ewzz+i1uBA9Rs5Sa6qlqDbdg9qyxwqqvbhkXxecCmaShDZis+qY/Rt70
         U26bvu3cxuF+fxAuHIXSpx7tbXjos41IR1WGH7tGobmjKXuU+FTa9Y5KfTn3Oucs1xfy
         3iowSe0pK95bg+S8tMtRIDL0LlV+MoUdVng6nlgEPY4GvtcW81YY9oeSvnoPBTPLLVtg
         4joxJPgC3PMYkOuVlD7C+Y8is0CQa0Qr0qjqyRUT94CaDa1SAGu6ytqfw8jTSqUnZAYi
         1dTjsZYSG52j1JArKMF2/T5Gpu1ETs6APGpbL2QuOs0cK70PbNA/m6L7/YPHjSfzBoDl
         d9og==
X-Forwarded-Encrypted: i=1; AHgh+RotoOV2PQXxSZvA72EZIJ/N5NveLd+6gf3RZfqpBpvP0pvo/jf6K0I2sMnaF3iEKKizuuu+66yDKoAeyKXj@vger.kernel.org
X-Gm-Message-State: AOJu0YxUtr2N0KDp1C+Pw6AtWZ+ciZrl1XpbX0gX49hIFjms83XMQfGw
	bSJ6es3COwAJ9yaEJQZCYhegO9PKwU6umcrGr3gB5dgdTHGEfu4lefihAj1C3x+woSPBKGKvciI
	z+XyopDe93DFt3ZnEsjMHnRG/CGV4AJwPImhj7aDS4nf4IImUsHd6u6ilnYgaOYIjEWtW
X-Gm-Gg: AfdE7cmXY75hca9EbUocBPcC19F/PhvkZniZkDpuGGPY1Qwq8iBcPlXS/RLQ/62CmQd
	z5FlvEVJLBk/Vh3c/P6DtxOdMc62jMPNOT03GVLkQAULdQaYYB2vazrUojgz0ZqAalPGTn5qnMI
	gmwDfA7BvvthpHMQw2v2kOlfIFKbW5JC342eX5Fz6BXFBlrIrhrvu73R0Ix8lmMzu+GTZkVg/Qc
	sxf+brHN0nQ7hVTOXyT+wtpOIE2cTQ/TSoyRsS2+YbYvoeHSDo0qY7Juu9neQe3YMn64LerHmiU
	yOHmfSAvVq2HCu74evS62ykexvZHEqjjQljnhqHncfUz2YFeuj704V10wrRtOdRDhhvsPhypCvZ
	Xa330Nuiacl1ciPjNkf63mE3pZ4husL6RHlQfI9Nq4KZ6kYOtRS4Iv6z60WOJNw==
X-Received: by 2002:a05:6a00:7702:b0:848:5c3a:14a6 with SMTP id d2e1a72fcca58-8485c3a1a3amr1077851b3a.6.1783584764643;
        Thu, 09 Jul 2026 01:12:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:7702:b0:848:5c3a:14a6 with SMTP id d2e1a72fcca58-8485c3a1a3amr1077840b3a.6.1783584764224;
        Thu, 09 Jul 2026 01:12:44 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84848939b38sm1937292b3a.10.2026.07.09.01.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:12:43 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        brgl@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/3] power: sequencing: pcie-m2: Enable USB/UART BT coexistence on Hamoa EVK
Date: Thu,  9 Jul 2026 13:42:38 +0530
Message-Id: <20260709081238.421905-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <drwgkj27gdstulk47cev2nxs6icienfa6vb3tu2uc2gqkbeedh@duj252fcm3bz>
References: <drwgkj27gdstulk47cev2nxs6icienfa6vb3tu2uc2gqkbeedh@duj252fcm3bz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NiBTYWx0ZWRfX1QF1KZsMFefV
 UTmCaskVNO+frWDZw3E05nUn12zNZPXv4VrwT7EDtc1LRBKMs6YTL8VJj2Kbxvjfbjh/N48/bcp
 LQqKKJAYXiG1LGv+IWeu90JG1QaBpCOYzTg7YtYjsC7/UHd7hxP47ikzV8xPQrFZkfJ7X9uOexl
 WinT8+wevOoflXgXvCBsGZUEn5hY+hhX5Kwv0eg93g4dCRuKMyIyYBiQUqhJZuPDAvLsv3Lp4Gs
 F6I3pSiDbrc6Dal2+zSMD4h/4QMwy6r/SDAMhN8k7/XhP0oVoGSr/gyJYYMnSg/OOVbyDo8ziIV
 k1m5tDoMjEwpk0lYvlffqKqeGxdtS/XExr+S9taGfJNuFN65oDk7G3uD7jIZgPLEeg0dtzeCMCx
 Yf0rwHvg7zJ01rOJTCe+r/rB98EkW5GxU3PXzb57uDZwwrbwTHPaeZUoSmxt+Ol0hwEQn8umOR4
 uMPNFK/cmpZxepV2zGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NiBTYWx0ZWRfX3ZO7NWlegJ2H
 Nmdq3tDw7H7o9JGYedNRuqIePo53yQOMgx7usnk+SHEHFCCibhbed10G+8engM5GkcNTXEsKL8i
 XHCh68qgR4zzvnUjJcteVHF/y5EVIfg=
X-Proofpoint-ORIG-GUID: W4O9bq8hDWugov7lDyAxRSeBxY_7jB4l
X-Proofpoint-GUID: W4O9bq8hDWugov7lDyAxRSeBxY_7jB4l
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f57fd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=XXUDAU8s_W5M1BeKZ3IA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117898-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 889B372E19F

On Thu, 9 Jul 2026, Dmitry Baryshkov wrote:
> What are the dependencies between patches?

Patches 2 and 3 are ordered: patch 2 narrows the table to UART-only
sub-IDs, which patch 3 depends on.

Patch 1 functionally depends on patches 2 and 3: USB M.2 BT will not
work on the Hamoa EVK without them.

-- 
Best Regards,
Wei Deng

