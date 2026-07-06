Return-Path: <linux-arm-msm+bounces-116942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZ9iEKHXS2oJbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:28:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092171342C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:28:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hXZp1fbz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DumdEu9V;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116942-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116942-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22B38312721F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17527383306;
	Mon,  6 Jul 2026 15:46:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9218C3ACA54
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:46:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352794; cv=pass; b=BY/pk6/aZzdN4IS5n+68DuY0HI104CGJzcNTvMiUUfAXNNlfIXWwcYv/pJrJZp+VulXYm7OmScQ3hzBz0If+mFuN9WchYuEddQW52ICxl4Hl2rY96kE1bp3ro3FVxpkGeMsg475mRWXQ0wXjU+Me3xG1328AJL5CHK/6OtifsIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352794; c=relaxed/simple;
	bh=puuTOTVkj7WGu9o679YWetaI9S6eilJUeJleGSsUDsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O37d5xEHcQCrNvmWT2sCpSj1JN2zUcUr81ug6LWOlS2ZLOsHC8yDjbQQdQ1xbZuCPT3iTdtKn7Cx4RED4cQB0bXIm8Qv45f1jsGxkVwuSrj7ZcnVU/JmKlaPa63ROj9XkRgW/8r5aYrX8VGzzPiKIbScK5bl9w6kJqLOs/wJD4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXZp1fbz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DumdEu9V; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7L6990240
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=; b=hXZp1fbz4cz372gL
	swOx37jRUZyhMOJu11R2PHaveWDbkEDuxJtIIw4ZT8oFYwMMK0fEMQd5MDT2KCnP
	XASsVc0hrVC9REAWNI++Jh/oryw7S61DX6jKX1daudC2gs038daj+7xFQQgF988+
	JPH+iDKbsv8dnDthyUtGuJefBq/O8S5tEJ2U4eUOBxCenwg+6OzRVVzZt/AYtFjd
	mh0HyEE8+WxFz8efJ/yINBZoPcjRTpPy6IBmGwV/H+I5Jcx8dZIxnwVKGM4XVHhu
	9fArCoYwqx5Bk9VzTbzuv8X/36v6/sds5G9lYjuxWbzWAvoU9PWrdm/SDU7CBcMz
	tYON5Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gsk83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:46:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eac2620cb0so43875516d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352788; cv=none;
        d=google.com; s=arc-20260327;
        b=dVash5C2NLJQ/c8BlNSx7uuGDefFLl1+kRNHNJqBqJCExsFqd86yfqFblCI3UWWszD
         f2CTqdUVlciQ7qx4+M1AoNq5xy/5Oy6AII2g/hBhm/fnqYTQZc5bWEonJ+DQ+1aRQBQZ
         AlbqNB8z6tUIFSOHw++8SEeirefCHlC+bCIOZ379pb50LBBgrkoPb8Vrk3vgiORt3XO/
         iyXb7o70hc8Ryxrauv8yjLKXUCuRWIO4cpuY2qd5Z8lfk8odNRmf04YRSl3iSMYUA8iI
         WE5W6MJwhKoBcrRNdDGZxdRq0LdtdPjxLN60Rf2Oc6zgkgMUH9yvzvD3RP5Uvrp06J6q
         XFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=;
        fh=ib24tZPHuO+GqnKIu7K768+PakAfEj+tkXtwDuqBRa4=;
        b=VzNM7re8Om2ljJSyk/QDfO4FV7kNoQ7yG+s1T8+K4C835o/9U18udNQlyjyy3RJZNA
         T0ue5ZKqfueioeRUpcP3PYXwY0Y0fCwHc4v8yGUTSD1LLzsr+RBtPjPwWH0mBCFCVDK/
         CBWOS8BWPW0Fe2iOj9B0VH98Vn/IiIWEAHa039n/7Y6Os4VnG34AhEPMMdLA7CNvJ272
         vLAEVVLd4iKS3V8zSMeaYvusWA6BX/cst8p90xZwAYhLH2F73yaubhNwxvVU8Up0iPgn
         VPPgSsEUKL1GvIMmBK9Tlxp3GjTqCOBUIFBQMh8qLGNjQ0T/iM/S7iCSlki95OfTRgy5
         0znA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352788; x=1783957588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=;
        b=DumdEu9VXdDU4O5Rftvn74nYif5M8fLlS56teZJATqq21+9IUzSCo3o41sGtBwdW3y
         QLBYigbScrWzIKw1yjJA/s0t5LpJWK3AoR3KGbyOeFOQelN2YdSVQZ9ZlWZ0kzzaCXCv
         HaswCY7RQadrFIZOa6OrEq8LoMSOXjDGmxGkI1xZGJ/SlKTfifxisbZRUb6HQemVWQv3
         PC6gyWCZdlE+EI9hklbLOxBERM111RHPx0+5aDRVQ9tdIrhijqxymKoPuyEnEPhyIYwG
         QMd8bc9lKyPfAQX6tobPPoZgMgl0vUq21B+xygaghh6EPaoaEjqlCEm0SEnjNKu6ouFn
         rZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352788; x=1783957588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=;
        b=orqRbr5Rq7DCKArnM41D0e+ofmqSXZwCaJmslvFRjmNzKcR5Mq72j35f7rsgZqZPR3
         ng8kUBgQG+MXNLqsP4jIZb0gwLSPunot9RthGVNtdF+Da3mvQwgUL6nFKsGYsrY4n8/Y
         H6AHoGtrmQ59kyqHu4LI4Rc94aMh870amPjpUdrij3YOR+TTSxjb9JgoJkknuvRniFKZ
         0amgfeKSZ3NqP1Ds2bXaOLvCHOTcawQbj7M3gcxE1MNItp/5X8edthHTXq9W3aqtCpoH
         M7TC+AI5Td2kbhd5dGTcrF7JWi5r+PpoQVrSfBCb0PQ3hLIYzN1qH11LZv4ltFBOGGrS
         3adQ==
X-Forwarded-Encrypted: i=1; AHgh+Roivpfu5HOfFT9QuKX4HR8xOnTcMXnp6hByIjpni2FM1NZZhyWe6RCcdlGSfI7IunrQhbSXaIFcZ6I5hJnD@vger.kernel.org
X-Gm-Message-State: AOJu0YzB1K0Uxa4pfEmJblksFSx4X2E+J2O0lsuP9GvJaYk9OjW7CGQq
	Of+sw7P1FTKwnMn7Zq10qKNCb85fLyA/LOwvJzps7tPREGkE5yFGg+9i0RpBDtKJ6YRhWr6ntL5
	rJC8uQtu7Jfd/blw9lS84aysw4mY6yNtgZNb0EZNQdzxw2uMzj6A/w+U+xw6bG8vDgXbZJANJKl
	38C6IPSCQXcgmZFVmtltfC9RVOO9QQd0FILpbw06dvz3k=
X-Gm-Gg: AfdE7cnwq+WYKRuj4i+eHY/QaTpWJEdsoPK4wfwFdGZs8jqSQfWjtbzQ5fbMQ5gYvNn
	GZvhneweBQmjN+KaY+Fov9Wuo50QTMJvg5DXzA94v2jedxF4OXBxJ8TI2FSYh34DleENDQdNIXq
	caB0JzF5w+7+L8hFnmZ1/hrsX9PPkYzjYHhu5h2sLeFrnWz7XcU7CIJJnXvVSm5iOKgI1a
X-Received: by 2002:a05:6214:5003:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-8fcb3d3ee24mr12450676d6.29.1783352788231;
        Mon, 06 Jul 2026 08:46:28 -0700 (PDT)
X-Received: by 2002:a05:6214:5003:b0:8f3:e97:59b8 with SMTP id
 6a1803df08f44-8fcb3d3ee24mr12450156d6.29.1783352787606; Mon, 06 Jul 2026
 08:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be@epcas1p2.samsung.com>
 <20260624021912.632627-1-cw9316.lee@samsung.com>
In-Reply-To: <20260624021912.632627-1-cw9316.lee@samsung.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:46:16 +0200
X-Gm-Features: AVVi8CcBYSP5zyLpt00Q11yUujyWdz_mc32EjqBaIjLdlr5HgDzXa1HvKfgTjLk
Message-ID: <CAPx+jO9=7B4SYyKSwvGqx+zzMsJ+hhFUK_vmU-HNYQZfKv+bdQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: cqhci: Remove unused intmask parameter from cqhci_irq()
To: Chanwoo Lee <cw9316.lee@samsung.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Ritesh Harjani <ritesh.list@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Haibo Chen <haibo.chen@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER" <linux-mmc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: rcUpAEq5xaCXDCOMyoNaudpNHOQYPLZ2
X-Proofpoint-ORIG-GUID: rcUpAEq5xaCXDCOMyoNaudpNHOQYPLZ2
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bcdd7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=hD80L64hAAAA:8 a=EqBXy2bI2-3AcK8LOXQA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfXybKHbtIfUApK
 08C+p1SXD4En3BeBI0kKTtRQY/5AdDaRz2c4Sz+n4o1oUL+pQy62OdKtcwRBeNO0pWnegIinV+8
 DW5WedX2zMt3SKtiDOePyeuGmRVoUFIW3Mf1TlUIHkiApMb+M4zBwdg5hAq1WHmlLBQvzKgtsbu
 XdzXRuSiBaZpxdGTL5/57AcwxZKM4jenrlP0oFpsREuDlJDRZIqUY/7TvaA5Tn5QtymQiQ0SIJa
 qCj8m3KuvpkXvMvbblNfA+Tp2h24QDWRAoTjbACrZwV3jQPUD4vBtDp6EznYDiO19y24Tf9cGWg
 h2EkqnGDf9eg9ZpqbPLHu7XyzXSatt0xksgF7hxQpbXl/cXtTuQGZ2FvQiK4xoqIRudy4cw19CN
 mWrNsm8bk811xw7UfF4eBm7WDoxa5/5jRpslY+7eya/E355aqL+4d33g505rQHqlP4W/Sdt8cxK
 cUblFOEHsNjlfmPPqtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX4gymaRTDvA6O
 MyNma0SuBbXP+FwXsWDxCDNd20ileIFGEb2FnmtG7UpnEHjn5hZkaCYcsUEZBYQ/IBszzWYBdyl
 cBAh3i6Qp/xa1znKbadsv6G2uVGxQNA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-116942-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cw9316.lee@samsung.com,m:adrian.hunter@intel.com,m:quic_asutoshd@quicinc.com,m:ritesh.list@gmail.com,m:ulfh@kernel.org,m:chaotian.jing@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kamal.dasu@broadcom.com,m:alcooperx@gmail.com,m:bcm-kernel-feedback-list@broadcom.com,m:florian.fainelli@broadcom.com,m:haibo.chen@nxp.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:michal.simek@amd.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:linux-mmc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:riteshlist@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[intel.com,quicinc.com,gmail.com,kernel.org,mediatek.com,collabora.com,broadcom.com,nxp.com,pengutronix.de,amd.com,nvidia.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,samsung.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3092171342C

On Wed, Jun 24, 2026 at 4:20=E2=80=AFAM Chanwoo Lee <cw9316.lee@samsung.com=
> wrote:
>
> The intmask parameter of cqhci_irq() is never used within the function
> body. The function reads the CQHCI interrupt status directly via
> cqhci_readl() and processes interrupts independently of the SDHCI
> intmask value passed by callers.
>
> Signed-off-by: Chanwoo Lee <cw9316.lee@samsung.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/cqhci-core.c       | 3 +--
>  drivers/mmc/host/cqhci.h            | 3 +--
>  drivers/mmc/host/mtk-sd.c           | 2 +-
>  drivers/mmc/host/sdhci-brcmstb.c    | 2 +-
>  drivers/mmc/host/sdhci-esdhc-imx.c  | 2 +-
>  drivers/mmc/host/sdhci-msm.c        | 2 +-
>  drivers/mmc/host/sdhci-of-arasan.c  | 2 +-
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 2 +-
>  drivers/mmc/host/sdhci-pci-core.c   | 2 +-
>  drivers/mmc/host/sdhci-pci-gli.c    | 2 +-
>  drivers/mmc/host/sdhci-tegra.c      | 2 +-
>  drivers/mmc/host/sdhci_am654.c      | 2 +-
>  12 files changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.=
c
> index 178277d90c31..98ceb0b9a6d1 100644
> --- a/drivers/mmc/host/cqhci-core.c
> +++ b/drivers/mmc/host/cqhci-core.c
> @@ -819,8 +819,7 @@ static void cqhci_finish_mrq(struct mmc_host *mmc, un=
signed int tag)
>         mmc_cqe_request_done(mmc, mrq);
>  }
>
> -irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
> -                     int data_error)
> +irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_erro=
r)
>  {
>         u32 status;
>         unsigned long tag =3D 0, comp_status;
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index 3668856531c1..8fbbc48c3f85 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -315,8 +315,7 @@ static inline u32 cqhci_readl(struct cqhci_host *host=
, int reg)
>
>  struct platform_device;
>
> -irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
> -                     int data_error);
> +irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_erro=
r);
>  int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dm=
a64);
>  struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
>  int cqhci_deactivate(struct mmc_host *mmc);
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b2680cc054bd..01ea3adbdf3b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1805,7 +1805,7 @@ static irqreturn_t msdc_cmdq_irq(struct msdc_host *=
host, u32 intsts)
>                         cmd_err, dat_err, intsts);
>         }
>
> -       return cqhci_irq(mmc, 0, cmd_err, dat_err);
> +       return cqhci_irq(mmc, cmd_err, dat_err);
>  }
>
>  static irqreturn_t msdc_irq(int irq, void *dev_id)
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-br=
cmstb.c
> index 57e45951644e..1de2f05fd958 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -430,7 +430,7 @@ static u32 sdhci_brcmstb_cqhci_irq(struct sdhci_host =
*host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 18ecddd6df6f..d0fa83f67a80 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1503,7 +1503,7 @@ static u32 esdhc_cqhci_irq(struct sdhci_host *host,=
 u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 0882ce74e0c9..ceed47ccfda8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2165,7 +2165,7 @@ static u32 sdhci_msm_cqe_irq(struct sdhci_host *hos=
t, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>         return 0;
>  }
>
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-=
of-arasan.c
> index 785d3acb18c5..4ca73e7d799e 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -555,7 +555,7 @@ static u32 sdhci_arasan_cqhci_irq(struct sdhci_host *=
host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci=
-of-dwcmshc.c
> index eef53455b8ee..4c5fa6a6931d 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -624,7 +624,7 @@ static u32 dwcmshc_cqe_irq_handler(struct sdhci_host =
*host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-p=
ci-core.c
> index c347fac24515..b121d896a804 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -215,7 +215,7 @@ static u32 sdhci_cqhci_irq(struct sdhci_host *host, u=
32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pc=
i-gli.c
> index 6e4084407662..b55618566d65 100644
> --- a/drivers/mmc/host/sdhci-pci-gli.c
> +++ b/drivers/mmc/host/sdhci-pci-gli.c
> @@ -1760,7 +1760,7 @@ static u32 sdhci_gl9763e_cqhci_irq(struct sdhci_hos=
t *host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegr=
a.c
> index 820ce4dae58b..221e48b59f48 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1280,7 +1280,7 @@ static u32 sdhci_tegra_cqhci_irq(struct sdhci_host =
*host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am65=
4.c
> index d235b0aecfdb..2a27db2f558b 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -462,7 +462,7 @@ static u32 sdhci_am654_cqhci_irq(struct sdhci_host *h=
ost, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> --
> 2.43.0
>

