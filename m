Return-Path: <linux-arm-msm+bounces-101267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEQrGf/czGm0XAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:53:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2D3771AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D47630EED65
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 08:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2273C1995;
	Wed,  1 Apr 2026 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7XzKVrV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ddg27gAl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF29F3AC0EC
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033173; cv=none; b=XaQyM8wLVCRwM1Hey8ecJXqKIkG59gBl5ptGNEtZCWL7hKBSYN7FfH2XOuBy+/lyXHN/nN/ytwl/L4DaP7KwQScOEcGmU6xy8e5D/vK84kGoZcfcRs0O5eVta/0oR8Qn1KJoyX7YS7bunTuUlVtMJ7DFzARJgwornHgUNcc8dvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033173; c=relaxed/simple;
	bh=lrucPphVTDTsDV59P2Uep9zvhUlx3+vvIARJ3BCWugc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4IKKMqDx9NUfq/X5liRlNpukbiUyx55fzdFA55Eex1D6+m4Nwsr77x7xrQa76mlvLFGXyLHhdMgHHwGxdVMJO7gWpCqdB/A+9gs1qNkXU68vnbI4n0xtrLBgOQceXWUOmqQAl5nkFyfn2+3mZ4fpuSnmdq/2B4PQrXEwnDsUBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7XzKVrV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ddg27gAl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318h2t01459498
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 08:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeYW5+xptUXLWkRdr2dqPLrdEHJM3AnZno/OO5vRIhI=; b=U7XzKVrV7+G8PHim
	83Gx5V9Xs9mUF5cjPSxKt3HKoWJfPBYkKzGJ4McgqJVysnRS75COA9Zq3fxd47P+
	LR85+YQRc207++p9uYmvveSY8qNDCe00ehB3MtsUdtg+boOr0eQJVEATm1YcksSR
	277QtaooaTs1XE0XuudKBioeS32RqwwVXnUW0nH1T7KjkYmqmr9QMHtjey4882hw
	gVt9UMhZiYzEEblwFAoJ1HCBdDrYsVzn9Uj006nk2IK/3vfogV/Sor1bi28d2+dv
	sQTZy9zCclYuHbj3vqRHVQun0MQfAycmnSwfphFuO23RHzCyDTARZ/pctCbpVSHC
	3FJOQw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg169m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 08:46:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a016b99579so11728546d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775033169; x=1775637969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UeYW5+xptUXLWkRdr2dqPLrdEHJM3AnZno/OO5vRIhI=;
        b=Ddg27gAlJDg1hHGRV/2aJ/+Rvnx5UpXZA/lSdkFqq97Hj8fFnKi26vWEQ+Hu+yErQY
         cEnrAJrc1Cr3ESKfJIhaIl8Q6Dd2Pw497lgDy/l1nQdADxYpGaCK6q682/B+fj4c3Rk0
         Z/vjfrld8XO4htDILllPITvEMGLbeY4sG2WBhhwkzDIz8elVU7DU9oh17FIbtHroA+Iw
         JYRkqqBIV0peX80aCDDzKguGbA1lAaNUg1jgPF40N2L8lU2lnXW6YnEY+vAfa2Vppxqp
         huNTVQmenP4qclN511TzRPPxz4BwPh8NIK4qIzRYcBloBUqg3xFymUcggcmGTjEcOfMR
         wQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033169; x=1775637969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UeYW5+xptUXLWkRdr2dqPLrdEHJM3AnZno/OO5vRIhI=;
        b=GmnwLwPSr+BcCYrys+RtSm1tji2ja55SxpjF7RMEAmSeojOII0zn1oaudH8GVsLpaY
         73jwwiOtZ6cWAgmG+T7fmjqeoVIHkdV+tHhCp97kzQPOwt6xoQsL07XpoSRQ77uPb2wQ
         MO27ALLGkKeKBCWWvhH0XH5gUzLpY5RFUGV57mUMrvtnKm5kKsshNb8QVIta4RqaFxEy
         pbwo1ggOPL4iTgORKkxzNbbMEX67YdHGqqmXafhSThg4K1fe2Lm05yDMjzop5dI7rH3I
         w9HC1leY765tWcI1gRakguFN/pq2ja+879LeEoU8nMC5G3iJWLQ+YA+7kkxswbU7nfGH
         C+4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbnNxZ91e9M8mSuKbH1rYAjBKE34hQB7LIO31LJeIu0GT2L1ka+p1r5ncPjol54er8H4qFm46eAhZ1D3ef@vger.kernel.org
X-Gm-Message-State: AOJu0YwNupwbvqBDNZXFsBJ+z90a3lMjaO9iLrCkaoeyLw0o/l7n54SD
	p1MiQxpxp9bSY/d2r8Tb8v+Rw6a0fWbFJ/YCJlR6On+VxIKLEN8p2hQ+SzhesX8GMLh4+6Cb6AU
	5sxNcRNcjvtpO3rIWPwp1hq6hPcwmDLzWEPnbAX+fIqss5Iv5EUH6+1qjLVtGzfXAXhI2
X-Gm-Gg: ATEYQzysKYsauY1wp8PKoxjDLN9aYIB9VHIIuNLFGzOOKZHP8EnAjaNke/eH58J7xZG
	DrhSvCOlEYsxIyksoB3Gg9QD2gpx/EhP1E0tGPLzbdCxFL89a0rsf/sv4ww+MbyRDPWCXHUx0rD
	Wyz//w/8nVxgMPYOUB6U00ArHoz5T/L6TiRG623QT+Cvi7jv6UD+mkBJ4THXeHeOHrSQ+gwwrRo
	WkCn5tghcLo3ExD2QzhktiVUbbtaXSKDwVDDXALrv+GejWX9Ta3Mpuk7GuIfGo45vrClR84GTQk
	40gBwTdStq1lQPvq7GPDxG+o4mw3z3S04+35iUmkQskOuNK1EKC6/ksJT5f/NXJ6reB6ZZVCX7L
	IwPSDMK3mi9cv3gpRT/vRUaMgt9zEs21l9yVXIk+fyBCFWtMQAG5JeoMWKOQF68tHQMZJ46s15i
	hsBd8=
X-Received: by 2002:a05:6214:1c46:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8a43404af75mr34157896d6.0.1775033169094;
        Wed, 01 Apr 2026 01:46:09 -0700 (PDT)
X-Received: by 2002:a05:6214:1c46:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8a43404af75mr34157466d6.0.1775033168669;
        Wed, 01 Apr 2026 01:46:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c2249fcbcsm37375066b.5.2026.04.01.01.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:46:07 -0700 (PDT)
Message-ID: <c01a99cc-77f4-4dbb-be53-5c0c91622c82@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:46:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/adreno: set cx_mmio regardless of if platform
 has LLCC
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-3-725801dbb12b@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-adreno-810-v1-3-725801dbb12b@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA3OCBTYWx0ZWRfX7kWtsjq7rd42
 Yce2rSO7+bo54azz44R+x3a4AUDagwqJnTrYuSJMOcUXPUcwQT4J6BTpn21//9TTzq0JjdHArjG
 1C+zF0UzAsg0wmSlIEy9KvloSWbTM90aGGYX5LkLhmMvlHy93DAf/s/oJPOjVgBkBHlYYnhlurE
 iql2SKgjZUVwNmg9hkFo8dT/FkhX5i2QqZl9vwoAIsrF6bXHjgPyighdH7nCEE6SNLaH1hjOym8
 tsINrIWOyQbodG7PJ/2PiwbLy7hd29zOYNj//6eYhAai3P9dQmzyquNlbxpvtPRAJBchDHttnzf
 +fr5gFPUOEA3hjqF1NxJcOPkuLprgRcVCx6OgdJJR9jBHiJuoneEb7+sPsVm0C39wS2Uxom9YfR
 HsZ4+g/EWnEAoy0uP0FSFpntDbc3jIIIb6B0etivS+7968nhY8OVsaI49rtiqVfa93/chURvZCK
 MDtw3PnfE7mcxZ+gvwg==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccdb52 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=k3NpOJoY7FANPw3bM2sA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: InCrxe3nIA_WKaj0YU0s0rqI4X5rU4P0
X-Proofpoint-ORIG-GUID: InCrxe3nIA_WKaj0YU0s0rqI4X5rU4P0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010078
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101267-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,pm.me:email];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFD2D3771AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 4:17 AM, Alexander Koskovich wrote:
> Platforms without a LLCC (e.g. milos) still need to be able to read and
> write to the cx_mem region. Previously if LLCC slices were unavailable
> the cx_mmio mapping was overwritten with ERR_PTR, causing a crash when
> the GMU later accessed cx_mem.
> 
> Move the cx_mmio mapping out of a6xx_llc_slices_init() into
> a6xx_gpu_init() so that cx_mem mapping is independent of LLCC.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

