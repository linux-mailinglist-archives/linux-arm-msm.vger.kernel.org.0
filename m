Return-Path: <linux-arm-msm+bounces-86100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0417BCD4C07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 07:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69E7830014EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 06:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F6A3242B8;
	Mon, 22 Dec 2025 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msKaCz3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/Of1mb9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956971FE44B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383228; cv=none; b=r3ws62Kv6DBndkM9FwEAeYA3/3SvnwvbtRglYVIT9rq62nE8iXPkwLN0Jb/v7bSw9irwqLNXAehV+uE5HrOLdzFQgjX7ewQHOjOU/JQzUUrPp1wkoWVvNezhhG4OeM//Q/VQRSLKuTUKKYisHtXtitCTT6BBGJnQvYlTRaue9dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383228; c=relaxed/simple;
	bh=sM3fOozHuPpr6amxiCgciZ8EEcSIgyw/5gFaYYONp6I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxYHK08s/P/ScD6ceSbt0lc4k+m6/uMCJduqSxmSZn4ucZCvoEmttfiAWsL0L9nnZW9SgC5alRdcb9pdBOpaw+Dv/GAYWzhfPBil/8XWiFlHd3CUKxQ4NADlZYwlH8Ls6xE1/Xk0J5w3OHNiCCXa6hkSKUJ4HkiZvDgcDIk0ZPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msKaCz3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/Of1mb9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLN1OAv3395346
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=EkfFwQ+7c9l0H1ZxajjVglkDWGPmhRMd4V6jMyk8BEw=; b=ms
	KaCz3jQt4ygKf2dOGdSe2zDL8IgtnaIBjpB6ZzGou6moXLZB0czObDNGanBZXpPS
	Afks8xu9I3PcrbuD76UEBlRTGOP5BP0TZUc8SaSHkaUUQkHYC0nTsSGwe0WFj3K/
	zkov0LZBsrwAu/RTCZZFNmIbwLzJOC8nZKhcmFd3QfINPy4EKstgKtv/02TpTnbh
	nose4i3cC6h9Regnf7ln6vDob+/XVVULOisY/IobZ1ImmecZv6Fj6wUQhD3NgtdT
	TBGYlvdHUY8Haar3eS3l4ZzgHj0iuRPPUkKVu3IYA2MvLXP2KT9Zj2+FrTTcXHhd
	BFvDVFH7IFHf7ZC2l06A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqkvfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:00:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso6919496b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 22:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383224; x=1766988024; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EkfFwQ+7c9l0H1ZxajjVglkDWGPmhRMd4V6jMyk8BEw=;
        b=j/Of1mb9LUz+8F2UKHX2M7z8tawFzPGOJvmdnri1/jBHr8sjnN4uB+wPo2QI7AP3QY
         RJGAjooOG4wHtntV3uuAVkv07KJ57Y7SHk5lAcymlcJZ9TS+iQhPz9SGvnNRSQWdxYZW
         Tx2Vrfr0glr0tn88zgm1aKPY04Od+QCnB6EYZ+edycHTo28odMMmpKLTx9EDRVx/zp9v
         fTjI8jb7UEdKVKKnD5yScdrX8ovh9Rj6zrpnVh00SMtpgejU3m4rACPC8EJgzLZfZe2G
         6f7YgBgw0+PvfGDJNFrvQ6a8/LPKHoguYij4SFwsXL0U67+ohwy7VAtzURJfkXzM3E86
         bIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383224; x=1766988024;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkfFwQ+7c9l0H1ZxajjVglkDWGPmhRMd4V6jMyk8BEw=;
        b=WA580ULU1/IrneliUR2zxYYV5SAWtfne8j8JOkPKQDPOgxvFbgS0WE9wvD+eeIltP3
         IuWtMP8Ptir3WKb8OgkZ9xueZENHjih3U2hQBbwVj6k0g4brfWAvSzIWnUvfOQFxcXwt
         0kL+hbn6vkOREE6cRhaCajKIb7479DTxUD/LARoWyVZ5wPzEr6qIUM/2n0Umi1HRunaa
         ENxeugoMeyO+eqE89G5lnz7QFQ0lU4UaoV/ZwuFhK22+Ji1XQ/yv3L5MujnEYVMtGa7R
         P5eXI76A65W8csmwlbIrji2LVBYL09xLT3H3BjP5TpLUltiVQfGbuY7saHuaSzofQph7
         lU2g==
X-Forwarded-Encrypted: i=1; AJvYcCV1Ml0DWYR7hIKJ8iRsSXZ4g02ix4v9kA9XvVDFY+ITonZH5IjgOEK06JRMSR2q4CJjGS66kCSZnuRLIHqC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/K6fck+y/9Smmfpm9a0stUJs+lBxnvG0tQYED9G0Gn7Xa7NqO
	7KFVcrjW3RrYOapxRvmhEK6nrpxZJUoDAV1D4VlNshJYt1k5b/58ygKvACd1jAFHS38Z/ycyysT
	BbHE0WC6zUo8EJiF74ohpmrGfB9zQW+mVLIZ9xXwrCvQQQ97hYNuluuEVINcwotrrLfZi
X-Gm-Gg: AY/fxX6zg5n6IZJDwYsqO6xwOx3CgQG8iatECvab4bfjXUMbI4/PemJ+HmLdJYBtNl4
	RNvE2brv2HydUHRjr0QlYm4ffDXDtdHPQYLXybMTU3M9B/O46UKQfbVEHecjJgLbN0p+YIgKSpp
	H0QCsf0cYKCm0c50u+1hrvsDsIS+D54gAundjziQNKVgVyYFhNjVhNX8QuWF2YjXKryZA8qbE76
	Ba2RWAS/UfpCoqjpAd+S4yCTLOuC34yyIG8DW87TFLAILjGDiZrzol6rFknS/sNesugvsUv0FAx
	r74NiImcLjSC/ArWAfQf16HAT9ngWxj22JqIx8EsRXJ3anFo4UtbTRZQOO0ldBbP8ofAwQhpxHI
	1f/J5VOruSL37H2b4y/uRZUhSsGTPbjQPkCyrg5wnfos=
X-Received: by 2002:a05:6a00:4295:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7ff648e71c8mr8362770b3a.15.1766383224280;
        Sun, 21 Dec 2025 22:00:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLdwWxLM+DGPgEyWM20tvgmySSHg8PLe+eOCrjv5WpxgqOKsjiH21ugO6FRbrcVGZZ9l73dA==
X-Received: by 2002:a05:6a00:4295:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7ff648e71c8mr8362749b3a.15.1766383223749;
        Sun, 21 Dec 2025 22:00:23 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cdaesm8987572b3a.63.2025.12.21.22.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:00:23 -0800 (PST)
Date: Mon, 22 Dec 2025 11:30:19 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: SMP boot issue during system resume
Message-ID: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: 4AP1b_T9o5SRW_KYGS8RQxzZiEy21bYJ
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=6948de79 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=AzHi_07Hxf6F1TnpHmwA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 4AP1b_T9o5SRW_KYGS8RQxzZiEy21bYJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfX+oyhK/APQ00p
 AxAG9y3GfvbG8wdg3daY0ai7L/X+t+7s04NscTSD3rbTU0P1e7EHB86dUG66DbKjZAH/JsQbC/o
 cVxOuBDG/EquRngMqtYOpxtlHV6XUHI52fIlfI4EPLXxwGSd+dF7Yhws9+WiJCBvGrkwJNK7ZJZ
 1Sy3CCFn8za5OHjWhtpht97YuIQrsc7luLJePjwGUNBs1ZSfXP+Js2dgLDs4gXdh2jpB4++HANh
 OxMmJ4UTbn1Z/Q5/yL2MkYLo0zKEIfOC5pZRmgDnFPw393OUnr0IKkLzWd3SwByE1eoCmU32g0l
 PS5xEDrNPOBz9l/4FtAcHY7lheO0gk905P+PRTVsNs4yQiKW1ktSDB1RDYFMGD4X3V88U9g4e4p
 SEQeiFYaR+x3jeaep3pCv4dt2oMLWdsr1vTV2tt+2OOHX4cXgnhGTAwIV7UhTfXFVHshCjzEGwc
 hcGB80UuD6wXrVZMX3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220052

Hi

We are seeing a SMP boot issue during system resume when CPUs are brought 
online via pm_sleep_enable_secondary_cpus()->thaw_secondary_cpus()->_cpu_up() 
on ARM64.

The _cpu_up() sets a global variable

secondary_data.task = idle;

and wait for the secondary CPU to come online. A 5 second timeout is
used here. If at all, the secondary CPU comes online after this timeout,
we expect it to loop in kernel via __secondary_too_slow(). However, this
depends on secondary_data.task value. Since we are bringing all disabled
cores, after timeout, we set this global variable to the next CPU idle
task and the late secondary CPU thinks the value is its idle task and
does not enter __secondary_too_slow().

An earlier attempt [1] to fix similar issue incrased the timout to 5
seconds. We could reproduce this issue in Linux guest where vCPU
scheduling latency can be higher under heavy load on the host.

I would like to seek your inputs on how we can improve the current
situation. We would like to avoid __secondary_too_slow() spin even when
the CPU comes late. This is probably not a desired behavior for other cases like 
Linux running bare metal or some guests. Having a Kconfig option or
kernel param might help here.

[1] https://lore.kernel.org/all/20190827151815.2160-1-will@kernel.org/

