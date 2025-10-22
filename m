Return-Path: <linux-arm-msm+bounces-78392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AF1BFD8CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBBFE3B3FAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1541D20ADD6;
	Wed, 22 Oct 2025 17:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcfC7PHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A9227A123
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153279; cv=none; b=mTzi1GgAVYLKQLv8udq0hRFnuQxaOnibAJ0o3LpNGYsFdMjQnRdy4kPizGKtnN4A9DNi4z/k7HVSX7i3Z+X/+urm7lMCW4/idnwsUVlgSukzXXZn3Mlj3BcTo103g2PEusjdFsi47ifklKxqlXg8yb8YbJmv5kk6/spa7zhUAWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153279; c=relaxed/simple;
	bh=W0hYyw+FFxFPIcjLI6cLC2huES89KHfpD4J6D4BemPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDp0VYwnagIS+3q5U4QTwIklIm1UbObP0MC2MX3xTpDJ+FzQGH4jIOhxKdtVWIWgg/IeIDEGIGy+EamY2UtSxeeUUfhwJbVQT08k7IXYINGd+F0nvnAY75bbtS4cz0gYdSSEyZdDXEnOToDURyOAsPLDzZU7ro5WwcXc44UNBIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcfC7PHn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MBW0qF027617
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3n7GuKanrjFBNn+S6EEEj55UDKDMqVUCfv5KZTHI70M=; b=dcfC7PHnQ57SVoYy
	5d1E8fYZT5HTzt8RzOBJJnKF8vDcrQ7Az7FqhBpcmiN9++w6o6jpWN202ZEPKQvX
	px/aEbaUC2xuV+9jl25QCCp1xq3+/xN1GxA5TkiUwsYtjadptpbvu09aLxJai31Q
	ZQJK0ijKHwRvgtrfPByQvk1ypRK/nGw7/OgUKU8Hv24IdZiRO8HCfUdG+96tgS1w
	1YGptPzr5X/OWZz7iejg0kiLzIJky5sx2KV5XC1iEPybkjJhJn6Nq5iy0z2Z7X8x
	3wHfMo7DU6VicCs8kndTmKr9Daanju4X+P20sD47KoszzHnP3wTKDP6tOaT/7R43
	KwJ+gA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j5dfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:14:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e89d7946a1so4141931cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761153275; x=1761758075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3n7GuKanrjFBNn+S6EEEj55UDKDMqVUCfv5KZTHI70M=;
        b=k9PPEbxg4dQoR2fG8xeHzf253CIqY9tIMAktFbu72baim2iFDzO/ZkmsREhmj6YUtT
         s9qxyQfwO8sf1eqSBhdKVbvShu4m8hgthnu0NULKjsTPgzU9dz+YybaWCORQCBtUWJUX
         xyV172EoZ1nxm03rlZG9HuyXDnpQp7U1c5lvMus4m+9UI0wd7Eh6TEg/ACOgegD2wvs4
         xqV9UTXAWF9CfJULoD5axs3Kpu+bZasAB9I2Qt46IWjCjENinok15KlpvmCPSZjnie5F
         JsqSxYR8wnyleqP5h1kRIfQFC7l9C/rCO1HDhcz+iWI2sVoFwGV0AeMgvxzVbeLv69yW
         jsDA==
X-Gm-Message-State: AOJu0Yy2Ea3FhhgGsOAwCye6UFO6ZlXJlRWeEHgPQa8QV30A7SNQGoeZ
	jukq8TgnZJ5LomclirAPHful1VN8NXQvJqQJ970PV5+UPOeZaWrNIe9Ce1ME3G9M+2pY812OzWB
	SwNo3O9HEJ7/mKGqdeGyYT1WYkp0sHqRG3EEmVIEQb2QCaNonCqMhQSdVqySDxBJZFJle
X-Gm-Gg: ASbGncvfD+/w4xAByNUNKC8E7KqEGH/s/9mkWOAvpOPpPThWu8c+Xa+ghjA0ClJ5Kpa
	3uzNnHy+yHTD+jmm2isvaHpnZwVnZcX95/8mIR9pWUqkqjerI5c3KbgIoRu3fGDxX/lK28iAtdd
	wIL2MVFywaIg100fvaUfR1sVj4qTK/Rxph9xNRRcjmotmPylkS8r1rhptzKatUCb/RPEd8NWro5
	uu/RbGrAhtcs9qRiAknjJb0Ncc0M4zkBseTW1WSxz38bAYJDUihxyFWC5FM+4ZH686jZK4LXptr
	RQ+1MtBSTqQVnG3ICsD30cZTTsUJevr03pdBtuLUrvBV6Seo89aZYUiQ2U2qOxLDvuW0kWeV0hP
	oq4L/G9vMeRlA6lj0mRW/F7VyMbXV4VrJfUsbN4i1mce/HBi/P23uNB/R
X-Received: by 2002:a05:622a:1492:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4e89d2cb636mr181110551cf.6.1761153275271;
        Wed, 22 Oct 2025 10:14:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElUs2ccLws+09dJCicur/nb+FwFaszJn1D/TePDNT/7C+eYSqLSDOVvQDTj/XCFdnCKCnLTw==
X-Received: by 2002:a05:622a:1492:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4e89d2cb636mr181110211cf.6.1761153274818;
        Wed, 22 Oct 2025 10:14:34 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb0365e1sm1394344166b.48.2025.10.22.10.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:14:34 -0700 (PDT)
Message-ID: <280f1e92-36a1-450b-b6df-b36c3aed3c1c@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:14:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] backlight: qcom-wled: fix unbalanced ovp irq enable
To: foss@joelselvaraj.com, Lee Jones <lee@kernel.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v2-1-7ff115b4ffe7@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v2-1-7ff115b4ffe7@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX81SQVg8Ize2T
 NwhfQG83rndHMXOZehPZ96sEnz36Ps+w4VK3uMx+sHJvBgaDHWUCuNrH/D0C/ihqbteZRwmx7KB
 5RsIk6eFuMIEu0wY4o5dyZbofRhxxPKpMRu2b3YRrEJaJVHtCCrJpjSwOT37cr+K+K96VhcjSw3
 Xq7f5iopwTB4XnSY8SM8qyfuV92tI0rf7yEDt4hFeNC4/FoW153yhe7vUpL1DVIkeJ2kJD1vi7h
 TmNPXHOLJ5Zib/+lGbZJTrPTzvqNpLL9Pr9Xia0cvuvYdi1U+jOr9JYyNDF46A8MwnMd+g0vpgh
 UF1K+nknp/zU9I+doGF0Q9CPkL8S5r2O8g8XANNNYp2I8ctNRur8iPTA5Eu6djS8/OZHs0NJQ3C
 yMJfrxEwHO2DblIhmi/kyr3L1rUqaA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f910fc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WFa1dZBpAAAA:8 a=pW9aVPEJbd2O5lHr0_EA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-GUID: qDKnNGW0dEpJNuZtEi4OmvOa7wXe9J2c
X-Proofpoint-ORIG-GUID: qDKnNGW0dEpJNuZtEi4OmvOa7wXe9J2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On 10/21/25 8:53 PM, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> In Xiaomi Poco F1 and at least few other devices, the qcom wled driver
> triggers unbalanced ovp irq enable warning like the following during
> boot up.
> 
> [    1.151677] ------------[ cut here ]------------
> [    1.151680] Unbalanced enable for IRQ 176
> [    1.151693] WARNING: CPU: 0 PID: 160 at kernel/irq/manage.c:774 __enable_irq+0x50/0x80
> [    1.151710] Modules linked in:
> [    1.151717] CPU: 0 PID: 160 Comm: kworker/0:11 Not tainted 5.17.0-sdm845 #4
> [    1.151724] Hardware name: Xiaomi Pocophone F1 (DT)
> [    1.151728] Workqueue: events wled_ovp_work
> ...<snip>...
> [    1.151833] Call trace:
> [    1.151836]  __enable_irq+0x50/0x80
> [    1.151841]  enable_irq+0x48/0xa0
> [    1.151846]  wled_ovp_work+0x18/0x24
> [    1.151850]  process_one_work+0x1d0/0x350
> [    1.151858]  worker_thread+0x13c/0x460
> [    1.151862]  kthread+0x110/0x114
> [    1.151868]  ret_from_fork+0x10/0x20
> [    1.151876] ---[ end trace 0000000000000000 ]---
> 
> Fix it by storing and checking the state of ovp irq before enabling and
> disabling it.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---
> I was able to debug the issue a little further. This happens mainly because
> devm_request_threaded_irq already enables the ovp irq during probe. Then ovp
> work gets scheduled when update_status happens and in turn enables the irq again.
> Tracking the status makes it easy to avoid the double irq enable. But I am
> open to try a different approach if there is any suggestion.

Would reverting this change and adding (| IRQF_NO_AUTOEN) to that call
fix it?

Konrad

