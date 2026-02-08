Return-Path: <linux-arm-msm+bounces-92172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHuTGvQFiWnD1AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:53:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC58E10A489
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59AA93008D06
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 21:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3744929D291;
	Sun,  8 Feb 2026 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRCTTmf0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MP4kCyCL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0554B25C6EE
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770587633; cv=none; b=UPbEKt7qRX7zMq5OVXy5iFmjJmRE7skkXLIxYeHSY0jeMmwrC5zYtFwOnGmBeOAsmnHqpCOdP/gQcGJ7n57WQIXvn5CsBmwOBpGTQJDcI0tcJoGNemSl4ot44elhuD1TOe05/VgZBA09pbRZdXCB2W5Yikf5EaL5X2/4XJw+45k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770587633; c=relaxed/simple;
	bh=nKWhOgAm4rhSTouGp9zhk1GXi2FqnjY1gDzF6iVUUJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6UKfDH7WYEIurk1gRrMl/msrcfkzFn8kq6xtuOu8aI+qlGTZmsbHH7V8DM1ToCqbA+IXyxYBCt5295yjM5DAJIqpmMY5w2XmvSTs+26BxStyajEdgA2zMHxW9a3z9tlQXWaZKG2AygywHtENPYxXz2rDIf7wjLq7Iv+widpMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRCTTmf0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MP4kCyCL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6187t3eD675399
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Feb 2026 21:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L28/ER8pmhR0SVjJ+hvxhJzd
	drbv/nbW5M09/0RThCw=; b=GRCTTmf0UVqGJN+6zC5NRtq6SvCm3fhdNOAvl2y0
	xlhQFpmoTI1A9NVISSPEHpaBmh/WOqK27qEdmU78UWPqe9jlhGh0++UUa6WSYwhD
	YyEenHZ3n1gPAl9SQ055cgnuay7E2G7+7IIXNb+PkF71gi6nNmLSfnf6vzLugA4i
	GgOtWiBjrF2Y/gaEKaZ+Cmy+XLg8NaMpG7pMm1USJVbdA8h7GDHt9aVRDIxaqop0
	6UqxIZ1+75zuQ3mPTAvkdyUIONe84u4CZ3n0E8c80vpLgAt2wR95sDE5X8UfPEXw
	Ftpg+A5OpJyRrPQhk4J/9f3DVW9hEdZn0Wvw0YtclJecqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb530y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 21:53:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cff1da5so994004185a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 13:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770587631; x=1771192431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L28/ER8pmhR0SVjJ+hvxhJzddrbv/nbW5M09/0RThCw=;
        b=MP4kCyCLVOwyCwEKqGDp037muZq+TLBtK3IAUoyd1pfyPyVuOI2Bgy1hQ9UvBxBceA
         X+FNLTYwMtrajGXJn6X8eeVTFNgqkrIDAoGIf3bMg+TvTbX8Huxq1A9PFyl2nTMsra0o
         JXY4R2eww80iYuB00TePQNiZLLfQ/oouUJ/gVovLsxCjUdvCoqke34Q1UjVSXGOHtgWR
         4SX2uUF+NaR8aJ4sOfRKueKcJCcQO3frslXHmXsAK0C1xVUMPb2OFHMJsjo0rQQadZmJ
         ZDSmh3b76Vena1Pg/Fg4VT3aMMCnBnvDMb74k+EDg+V44M5dmL3DizxJHxOwZdYazwsh
         sUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770587631; x=1771192431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L28/ER8pmhR0SVjJ+hvxhJzddrbv/nbW5M09/0RThCw=;
        b=V/GmdSf8acCaGFplTUlR3ts6To9Elm8OrS5wSu5F3O74A9koxcN42Qlv6hkZKDtAKE
         yL6kPngR/svTyiX9HilfiZWf30cBAPD7ASuLDvGAGYybWDv5vqo9CQuLzm4LIXAkr1qT
         gH3rm43fcVYN1ctEVHIryYGw5AD/E8I8GVT2YI0T/3OfB5SnYBLWA8nhCixzehAyc3tl
         MUm5A8ksYr81RvEqlNkKmBR+RKDmRL3+a68v9K2mD2d0IJ0NjS5JItEcPgnQUDp/00vr
         Fh/Rz3WLhvLQ+VtbGqd7H9hjlaP+5lL0VCP7OCKfDQyt/PkXO08QlSNpNqOQuuzDAE9n
         uCgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7vixe7jXBrmgoJ/Zstuo10+VheESnovMAYCH11mCBykdIqTqD6Qcxf5GuVOjp4kb6eZXkTxRQDqjrbA8d@vger.kernel.org
X-Gm-Message-State: AOJu0YwB1R9wT7Vp1HP18ZjEkPSLt7dVm2RYNqLpgQfhLJGW9FadLWz3
	NSdgXZTUCIxq/YnDWTWFCejYpUvoqare3eOg+PVVY///wjXT37RohHea//T2RL0QX8XD+gMQ5Dm
	JNW1gcldM1BHbbNlkWhX5waLljfqV8d7VD5FdMm0jQhGRVXwlWgnS2ui3w5Bh/ygIDNpf
X-Gm-Gg: AZuq6aJindppv6B0KxA70E+6yh+uVTvG552/L9qrplCaHyTAkTvXkmeWeQCxZWuEsig
	B8tEimvCZ8/xwTpjA220RUl/LWtKBEVmiGeE/yhW2Fn//zQdXAl9xWEqHPMVPMF9owkNYKBmLF6
	GpP1yxF4h0Gwk76yZy5NM8DrN9cwJDpl1CiuYmTofM6p5Q8S/ekvyGNzjOP9eiYunkhfGUNP7QV
	jnAb25g/AUEajaYMzuIUEM2drKVw9p6pvdZvX+gpM1eKhfqacUw7f0aTFs2pr2m9PY0naQdUhb9
	TqKie+FK6ciaGv8DUxp+gWuJDtGKgEeXzLLkTWc9Swr6kKLkS9gi+s5pI0a5e2QOBcuHMHVchai
	/BEt8GT1+T/iCX7AEPuODLBhMXjDRR9LbPcBqFULieiT4qZmESD99j1j9+efnOfhTEA70tHuzNI
	IdDa8WAdnrhzc8sPkzHi+PSYc=
X-Received: by 2002:a05:620a:1720:b0:8b2:f962:79aa with SMTP id af79cd13be357-8caf1acde9emr1243418585a.72.1770587631266;
        Sun, 08 Feb 2026 13:53:51 -0800 (PST)
X-Received: by 2002:a05:620a:1720:b0:8b2:f962:79aa with SMTP id af79cd13be357-8caf1acde9emr1243416985a.72.1770587630826;
        Sun, 08 Feb 2026 13:53:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b640e959sm22645001fa.41.2026.02.08.13.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 13:53:49 -0800 (PST)
Date: Sun, 8 Feb 2026 23:53:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: geng.baoyuan@gmail.com
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal: qcom-spmi-temp-alarm: fix out-of-bounds when
 copying temp map
Message-ID: <dxihs7ysc5axoyxkyhniek4wdznckpfvf4wyz2reyflp6sopng@sz326kjj4hgr>
References: <20260209-fix-qcom-spmi-temp-alarm-oob-v1-1-3f1c67090e77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-fix-qcom-spmi-temp-alarm-oob-v1-1-3f1c67090e77@gmail.com>
X-Authority-Analysis: v=2.4 cv=QMBlhwLL c=1 sm=1 tr=0 ts=698905f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=nbVgSiXuatBSQgFMkcgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DOiUiQln7oRh5AGJMpZr9rf7q6YMUJ0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE4OSBTYWx0ZWRfX5Xo3zuZU7Y2L
 0iXcbco1E7mdubm12W2DZKs49IBYDUKISQGadgGG7fhnIMU6EOaQHFbJCHNUD4wiXY8S/sSh00Q
 tb78cnddA+T8M6QAFmErAHJxeFoEEOiQFUe1nnC7pna7met9a5F/tYSBH59R1B03Uc8rfxuihcM
 2PdLEdq/QkYBURHXIx2k+2kWfOIm4U1Ncy1GOsqJHoibCHXp7opEWb4Amsxlkw2bjnXmhGFcZeP
 I1MQhaFzVBPbqzMAyVbsOlHWmWZ+gFLSRmLTKSdnI3mP/KHKDLF68n3CoZ1Q4mLQNwGHZLoEcZV
 gQj0f2QXrdZFD6pPFIsItzEwnP8+KaxK4yGo0uSe/EEWN+9cdLMPSO+AmLCoYN42WriGJaoDFEj
 +McWtYmvcOKUxeiH2IAfZMzF8BwaRPuN86PkwZjc8plsoXIZ+wojKcb8QQ1bXSZC5v8qYRVXrY2
 9CZ04jX1WXW2++r6xnw==
X-Proofpoint-ORIG-GUID: DOiUiQln7oRh5AGJMpZr9rf7q6YMUJ0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602080189
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92172-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC58E10A489
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:16:05AM +0800, Baoyuan Geng via B4 Relay wrote:
> From: Baoyuan Geng <geng.baoyuan@gmail.com>
> 
> The way to index the pointer of array missed a dereference, fix it.
> 
> The bug is reported by KASAN[0].
> 
> [0]:
> ==================================================================
> BUG: KASAN: global-out-of-bounds in qpnp_tm_sync_thresholds+0x11c/0x1a4 [qcom_spmi_temp_alarm]
> Read of size 24 at addr ffffbb86e7685280 by task (udev-worker)/928
> 
> CPU: 6 UID: 0 PID: 928 Comm: (udev-worker) \
>     Not tainted 6.19.0-rc8-00185-g2687c848e578 #4 PREEMPT
> Hardware name: Thundercomm RUBIK Pi 3 (DT)
> Call trace:
>  show_stack+0x18/0x30 (C)
>  dump_stack_lvl+0x60/0x80
>  print_report+0x18c/0x4e0
>  kasan_report+0xac/0xf0
>  kasan_check_range+0xfc/0x1ac
>  __asan_memcpy+0x3c/0xa0
>  qpnp_tm_sync_thresholds+0x11c/0x1a4 [qcom_spmi_temp_alarm]
>  qpnp_tm_probe+0x390/0xb60 [qcom_spmi_temp_alarm]
>  platform_probe+0xc0/0x1f0
>  really_probe+0x190/0x604
>  __driver_probe_device+0x160/0x2c0
>  driver_probe_device+0x5c/0x2b8
>  __driver_attach+0x134/0x534
>  bus_for_each_dev+0xf4/0x180
>  driver_attach+0x3c/0x60
>  bus_add_driver+0x1f0/0x510
>  driver_register+0x154/0x39c
>  __platform_driver_register+0x58/0x84
>  qpnp_tm_driver_init+0x2c/0x1000 [qcom_spmi_temp_alarm]
>  do_one_initcall+0xd4/0x354
>  do_init_module+0x30c/0x8bc
>  load_module+0x3de0/0x5764
>  init_module_from_file+0x144/0x254
>  __arm64_sys_finit_module+0x338/0x710
>  invoke_syscall.constprop.0+0x64/0x220
>  do_el0_svc+0x144/0x200
>  el0_svc+0x38/0xb8
>  el0t_64_sync_handler+0xa0/0xe4
>  el0t_64_sync+0x198/0x19c
> 
> The buggy address belongs to the variable:
>  temp_map_gen2_v1+0x60/0xffffffffffff9de0 [qcom_spmi_temp_alarm]
> ==================================================================
> 
> Fixes: 703f13285a6c ("thermal/drivers/qcom-spmi-temp-alarm: Add temp alarm data struct based on HW subtype")
> Fixes: 1f835c6a4c84 ("thermal/drivers/qcom-spmi-temp-alarm: Prepare to support additional Temp Alarm subtypes")
> 
> Signed-off-by: Baoyuan Geng <geng.baoyuan@gmail.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

