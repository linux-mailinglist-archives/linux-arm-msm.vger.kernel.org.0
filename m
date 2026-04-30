Return-Path: <linux-arm-msm+bounces-105388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHwVIC9+82nH4QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:07:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9FD4A5586
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EA8C30A71C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6F1451068;
	Thu, 30 Apr 2026 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JT42bx2i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UG3U6WUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63704363085
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564902; cv=none; b=EW09hqJSqm5XHjeIyjetHl+SK588W1IJLsNgrYUJYuhzZTFWgH6cuPo5pcwaEYFsxlHjhBoFAcvA6csQCuRxpPpDxhHlNbbaJs4thU5DxVlS7d04zWb+u6Ea+ZhH5d51EcX3uzQvc+2lytcL/xLdz7bsVWZyRCt/Wh2+dC1YfLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564902; c=relaxed/simple;
	bh=g2BCyt6Cw4IH3IKr003s/zobpkp44bDYU4lkEV/rArs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gm46YRTEp31Xdm1T/OIW3kCsNlhuDalmD05R/gSxyJrFfD5eTgmidzoPw9GK8z8uts4FtOSOTZSpI1uJzjSDEl4KJjjhnFlmV/3/vD2q8CEiZ4mPDkz5MhRUhN546hSrmSrGCwUAPU0c7JisfYx6WBalHZhWcbwgZxKxWP4qtWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JT42bx2i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UG3U6WUA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDNei82480915
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2BCyt6Cw4IH3IKr003s/zobpkp44bDYU4lkEV/rArs=; b=JT42bx2iYKaCOBgN
	JIaCZGDOh/N8nE7NV92anmvf9vJvhBwpWZvptDFMdtuJp/8jHKyZp7XMjk2vBDQr
	IaPwNwvE81YKSBwTjGBhMuG0Nso6TgCkUnnG2lkMgeohACLN+kGpw2sB40yPr0fW
	ETvLVhKiB/mZJO7bn92V0ZRBD+fqlToaatE8ZkVIf9ynvUZjSlTXnBkYP93BK61U
	3h3rzQypKu6WTbq5H3wU5p613fyYf/3hjB4DNxs5d4KTsaOyYVWJ86h1MEJLOH15
	rfdFtXO+7TkSLJ4lT8BE5BAAHFPLWEJE1hKkmM3GjtyD5EPsxfiJi+XERqK4yMrM
	YEBxUg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7x6gsd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:01:40 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4bb770b3bso381868a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777564900; x=1778169700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2BCyt6Cw4IH3IKr003s/zobpkp44bDYU4lkEV/rArs=;
        b=UG3U6WUAABq5u7u5tV+rUAwZZQf/+i0sk0AZQrGtFCvZQB04qtv2goElfrfmRXVwDE
         CqXmWJb5JBzmdJG4fzK+E/jKymOWG1ZKUyrJ3ZVLv3EctZdcuB51D7HotAMODzwU1FFn
         Qq7Dj4VMg5b6AbuOm2u+/+BM30GMPzX4uNBBiIgRlDD5FX0X5ym0SIfi2pvJkiD2hbjF
         CsE4Fq7duxxhJ1LKQgxHxR3JiXd5eD3s1uzrtILBoNiMj3nPGCUrsQ7gM1KF9TWsYOv4
         ifGUIlicmBs30UIVSKhLgbkHVnaNhs1rbO545TyfB4MyihgOChcrN5HLwHwafDYnaabf
         lzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564900; x=1778169700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2BCyt6Cw4IH3IKr003s/zobpkp44bDYU4lkEV/rArs=;
        b=SAW9H/AuCaLi6OZY+HlWyGLeUiC6GJKICAKkZ72OV2O5B++wXe0hIi3zfy46ivpNy/
         tK0JGtjGD6/joVUJF1sjsulP/S32t76MN/gTgHWw7SPiojOeR/pHS7nfzz3tCnAQ5woY
         9U7hCQlpJYZOX58OToNnsIOxbsKnFUnsRa54PkHa+Sjvi/cLhUUnvhZy8DdqD+fTJVHz
         vU3gOGXZ+oNcaSEYg54jzZgVa6jNyf0kMpv3GXcmvr+LxVjfmUyocFsm/y3ladJb+qCU
         LlHigILQ4XyZPXI40y2gzRbe8e2zxrhVAWpd8hP5nTh7BamvpTLgjRwaTJE+V6FdJr7c
         v2YA==
X-Forwarded-Encrypted: i=1; AFNElJ8nEEc23BRD5p4EXVpwsdjhUdvRlBbYoxP7qsJkQUbl+HryDK/fk9W1Fr+RmMM9gw71UF76Li+g4pZ5cNEK@vger.kernel.org
X-Gm-Message-State: AOJu0YzNV9Bi6m8hrIHiazmnu46rgkn7ak9PoSaUxkmtDcw0CyobbC+t
	qTSttGj9ngkvf8JAHQfzzBC9IcFM2Z/hMwMNRHAWwCsuj+gRv6YkLg2dZHZKzF8HC18xtrHTCxz
	LkvfUPmkWx18rwnqhqgAjGyjALOZNzdpBOontoK6TYKTarNfx3GGnO5SXtkldzu4A9Zjm
X-Gm-Gg: AeBDietBxrHG64vJ+jQvN2tKyaLadEfUdaNLXVrB7zgfAvW6ADZEJlEJQE5LJZnY5sh
	sT5o4Y/2rO/yo/6J7xo/FWNKUHhfhhNO+wsyZZR6wr3Oj0EQVNiVghJQJnf7CboDkBNTtrUIOf0
	vRyn8/RTGMpOJFx/b42qDFlG9lIn0xH/83cecdBJQyS6YKo3hfth7bdN+6/ZtJQGGoG4I9OQUDu
	JsBZ1gOWmloen6Z2OxHYVY/g4JJGQmlkDhXUn8fXrIhPnoDHh0yzIZtcH8HL08x4FN0mgeQTx1C
	cc4MAnGbmzaWP5rILuqJduGulmKq+3XoTVs3GyxdCh0LfRPZs+XUUpKgilcFo0BV/l9vcq7dd8I
	vy6EvTectBNbrqNxS2OL7HRmLrGaIbrkg0dtGTiMGwNwSrzCe5T4/LTgrBHFYeeMeEVKs+IvrPQ
	e6kooniEUDlxtFkw==
X-Received: by 2002:a05:6830:2546:b0:7db:dc9e:f17e with SMTP id 46e09a7af769-7deba3533demr1465604a34.5.1777564899767;
        Thu, 30 Apr 2026 09:01:39 -0700 (PDT)
X-Received: by 2002:a05:6830:2546:b0:7db:dc9e:f17e with SMTP id 46e09a7af769-7deba3533demr1465447a34.5.1777564897702;
        Thu, 30 Apr 2026 09:01:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe675cc435sm15483566b.0.2026.04.30.09.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 09:01:36 -0700 (PDT)
Message-ID: <3443efce-7887-4acb-b154-b1f812ce44ac@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 18:01:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: tsens: widen temperature limits to
 match hardware range
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
 <20260430054422.2461150-3-priyansh.jain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430054422.2461150-3-priyansh.jain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ismg_rRCuC53I0VvwoTECge3RiRc-9W9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE2NiBTYWx0ZWRfX6p0hv36G2uoU
 9GVcz5Dsrm20qH3TVx2LQPGLv1DoebAfGHb2nVK7lyBMRSnvBllxf99zdpQwxewEaRRQbGpSAtx
 LhUeiJNIN/3fIlVxUPp2mlO4rmdHJ8MEUvbsAADzqz312xAJCZ5LwUBxYtTnPmpPsIJv6i49PYj
 kR+VVY1XKYMQ6JJ+k7eFsNEVJ0rnboRHUQZ05yolnysoWIf5/zArQheYE4LxVl0PxVQTR3S4v2A
 YLcsjZ1SZ5PafGoOQT5EHOLUumjEF1CXIyHWz2ldshJ+YZHLODXGFaNv+UPmuN+z8YfRVc64lzv
 z/Py1+F7P209Cd9epO5+4HSqdABZls8MHcc18ylYpuWBQZ8tikQwo38UuZyB9+ZncLShS28EU2r
 QCGDoRF/idHL+qX/TeMYOT5SCtlQhaVOYBbF14UYRNpKHOp+ybWw/4Pn2xwCvKawd+y50nP0pQd
 n1Lb0UzFv3CkU6vTdfg==
X-Authority-Analysis: v=2.4 cv=XoTK/1F9 c=1 sm=1 tr=0 ts=69f37ce4 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=G6nGOk2YJiK-_vFp-roA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: ismg_rRCuC53I0VvwoTECge3RiRc-9W9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300166
X-Rspamd-Queue-Id: 7C9FD4A5586
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-105388-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 7:44 AM, Priyansh Jain wrote:
> The TSENS v2 software driver currently clamps trip_min_temp and
> trip_max_temp to -40°C and 120°C respectively. However, the
> TSENS v2 hardware temperature threshold registers support a wider
> programmable range from -204°C to +204°C.

Does this hold true for all tsens_v2 implementations, starting with
the ancient msm8996 and msm8953?

Konrad

