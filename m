Return-Path: <linux-arm-msm+bounces-102320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOMVFZUx1mlZBwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:44:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B83BAD72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06D7C3015D22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 10:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE593B2FE3;
	Wed,  8 Apr 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUm0ulen";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvR66idM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93B139F192
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644948; cv=none; b=cgpyCurTg3hBaDVNCQGsChnr1V+XRwUVY91QzasGykoBYI5HUqnv92EjiQ26Chovb1j4+5bEh8WBQ9oqSO/Xbcigf5IcGRArSJnzw5O+eq73lHXS1de5lwtvA0fyQb5Dwj8ATPw0nFNcXba6AIw1Hdcr4fxEOwF6RAOfUPi4zoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644948; c=relaxed/simple;
	bh=pmyeGLntD58RGtxPkUD/mA1PEFM7O9ajEnmKlzst5u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgDWY64KxKY0DLGD8rPnVjhJYExPUe5Zp6bVfKxswVqYzfdwf5liTKhKOmBynHZPEa7glqWLGhMKGvW7ypUHlTHXf7A3DFYUhDGMLoeeA9XB4nHP8myA99UlhoDNZevkIvZ6ZDszfIXWH2f03Xg3G8rXmvH1GmpnuWtgDoCIu3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUm0ulen; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvR66idM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6386vsMA2450568
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 10:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGcotca1c9G9X0Wk47D2k1ldrS4xnK1R80n4tyPd6dU=; b=eUm0ulenZv7T07ga
	Wwy6Ix3TveFCCSsMuAD5Da+iSCArU1d4XZMDY3YzOqvwN+Q01S5PcZS99suFnLkY
	uC55j3Y23aXhs4SYlsETiqWufchXxm0Q6w1pvqMGrzssnogqXxuZjAH/EPIDBwfS
	9egdeM8EuxLoSiVqvPoaVtXSe5+Ilpou8Xjcr0i20lwUz8mdYoaUpTSa5OB0Txtc
	0IqDMhgK77ZCU2pDcuAt/BdSrrywoWKbj8anfZfAWAPUgKswHRp91B2LQyHOw/Rb
	7oDfVbq9pJN05kuC3Bwi2rhnpzNWKceggm2y/7jwKSELSRaURbdl56gQ8uDHoPBh
	Ot2kLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddae6aax6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 10:42:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb39de5c54so194134385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775644946; x=1776249746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGcotca1c9G9X0Wk47D2k1ldrS4xnK1R80n4tyPd6dU=;
        b=QvR66idMfJS7CgkyYPWDvXfhM0H5LTvMdbQy0QSKYSxcfiNjaKgIh6iGwECfLKp+vV
         reknD9RbusPrkQk2QQz4kLnm5eelVNi1ei4I/W7BP52B2qPwLoC1sPS61ml0rt+6Q2J6
         rIFgOV0vdTbx2wA/JgQf9UKenWv6/mIJxZaluoyw24IlKjJ1EI0bDtrO4rnoOihUOcGg
         bG+fdm80zIoLZj6mMsCterg8onHDzxcHdmg1hLz5YmXd5cj1QgtsQ72q59Eza29Zz57T
         npisJ7OaNuSj/vk8Mo/xYG1zhNKxVpMGrBarmEImzESVN4JwY0JroF3AIEfQP9pGeYp3
         R8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775644946; x=1776249746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGcotca1c9G9X0Wk47D2k1ldrS4xnK1R80n4tyPd6dU=;
        b=aRnTJeBrnF6WnxojKi9a3o6EG/N3o0MiWRWQ1rNOCTrkgqvay96d/SDOgpv3FfZZVe
         Yg50kYhOTes0T3xHIZTWNI81pjq9UzFYG7k8PwbYiNa6TbuDo5Y8r9yf7peqosxTE6LS
         z+3JjdurCIsoKqJsn/faaU3B2iNmCDvf2Tq4lmh0wytanecrr+dm3vnIRIqX5BER8lx4
         5PgnPqCJEac0VQEegh/qkWI1nFPlQOXY47x+H9iaRF4l3xE01ux7vzgR1KVmGQSb6VXN
         +oedONDDu4z1GG0QwtX/pC00E7pO6be1CW3IpjBBBXEZ2Rxe2BqxEMxCcI7k8aKQvzAQ
         gLqA==
X-Forwarded-Encrypted: i=1; AJvYcCUrymH+VrIbswMCIgewubbLPQwfnG9RK4rDNbZEK5+SSD7zi7DbPaLwi+LrRxEX0YHyVB3i1MKeEFOebipc@vger.kernel.org
X-Gm-Message-State: AOJu0YzA0v3k4OvwCwljkTQCi5WlyFrcJtKqLRU4nAIRWbvKRXs/RQBf
	f+CnfFzoIXbYwMorPz7Xnn7L4BK7bG3t3hNHhOW8kOR9mxrz0prngMq4DL9PeanjP6Y6vl0iSwc
	8re7qPL9rMXcWZrtPmmcjM/KvGrQH7Mt2K/iCkwvZQcZMZExvcYZ3inw8GRFIHXUlkrUs
X-Gm-Gg: AeBDievPppsgTWRyIHK8RO65ZRl45NfZc32M7pkCoTS5jjsx4BBvNR00bcH9zU3AZxi
	u+zlRyh/Beh9+1fDkljtVko5MmO0cTVdCv446vBULecgUmcb9dAnLUtDA/qWWIM6GZmj0opKSXM
	CtarD+DRqUqXjQdR0pHB0atXYbzoVDoIWWZ/w+ntt1eq8bvtuzYw7XeRvzMaVpeBlCkLNijLXUM
	CV/GFj6QC3XqszGowwf0OMgNFY9e+PkFIJLWtWJiaGFGdbshZC50aVxEaibESWbouRHmNH5mECI
	/4qEh7pGhCIbH9FYKONZR4SwLNC0OVwZXSdn7GvtQLa7KpxXkrVJNNNr+z/wPpCdsEvQ0qDatLs
	oOfjnpTfHPOb2oYN6ZR+EmXd7YNJUDBFTL6T2VfnaknzSDQQJ70edPe2L6srSoTOLb+s7SPJGsh
	GUF7E=
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr225687811cf.7.1775644945884;
        Wed, 08 Apr 2026 03:42:25 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr225687611cf.7.1775644945460;
        Wed, 08 Apr 2026 03:42:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec5dsm650018366b.15.2026.04.08.03.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:42:24 -0700 (PDT)
Message-ID: <e70839e2-a94a-418d-83c1-87336c558189@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:42:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5OCBTYWx0ZWRfXxalo4KBtdrvy
 DmjierVqXxIgmzSgVoRwpBVqcHCOxXz92bzp3LbFcQAX1wV9FoqyXwq9QURHdhQQ6lyWp1TGUVc
 PU5KmJEfFdvVp1ojospmdhrNiC6Ktw5rp2tFEx+82uBhyMpCUXZqNwUp9QjqEfQdZlOm7NXNsmc
 voXVcirw+7J8enba2am6IGm7mbpq1+Eum88kJUuQmYKGSxSDT8vTzAtf429rxKPzeMtnSSNZ4Q2
 Si31cv7Pr/LmBx/W0rqQiZLpgthHe8gvGnC1PBUoNNz7Ui0t0u/AKxRgCD6ZQR30kuAAl79624H
 ZNlVl2CW9wwBY2xcWFL+7oqp5jp4izdPwhH1eCay65bFOGsfyvACze92QKAqaR4F499qS+SptJb
 OqDL44SJBTI4ftzY6Izs7gkrmmyQnYxX5qYVbxWOijarFQH8WFDxSOcr4SWzDKIyxxytnK89oyG
 D9bhGhOL0qjyFRCKLTA==
X-Proofpoint-GUID: xKsBWbcQUAoCFSGMhByqYOIB30LquBkh
X-Proofpoint-ORIG-GUID: xKsBWbcQUAoCFSGMhByqYOIB30LquBkh
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69d63112 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HxVFgQzDQVkKW_O196YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102320-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 007B83BAD72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 11:28 AM, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

