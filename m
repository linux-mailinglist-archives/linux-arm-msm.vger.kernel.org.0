Return-Path: <linux-arm-msm+bounces-110242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHWpEPhgGWrDvwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:48:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DAE6002EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCC66300C000
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB171E1DE5;
	Fri, 29 May 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyN9kRIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhPZlD73"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD20E341ADD
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047945; cv=none; b=bxIrlvaJL3zAA9xMHPXAFAVyQ+CRr7E0EU3v4xvKv/bSVYcPVDj3ULXub99XyelOedlR0P01DQbFI76fkFvHXI64xnV7R4RRJ1mAO3A3CztxqrDykYwgrOqlUUky9sdDLKh6zvcS4zOT2bbfXL1sRkzH3E23EgU9MhyxRmWmPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047945; c=relaxed/simple;
	bh=4d0rimpxQUNcM63dGzxewjxyF1i/4vDxt4Z/QMTInVA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FjkSlUU3tkFCMFrt5L/7wuMCR01qAJKExa1P53MkC5ndJZNISYS+u7fX+dPWvk846ExlUDBPg5koeoSiO+qLrTG7pRB0CU8NYM66/8Z/WEnCLAP1GqKJXbxQk+baDaS5JJTTQ3gfM6WMsqp6gBBJllEZqr9CfZS8PebFcEWv3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyN9kRIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhPZlD73; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6AA8f1932259
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uz667M+0GzNu3DQdktJc+dlcwqwGLPErXGT+hqHNISM=; b=pyN9kRIT9v8vFNST
	oXxTDt7sJgih08c7g4Y6N1DueLiFLz+c0bHxNGB72KGOUJnDUk7Bk2MWgOBKjcem
	XG597OsBMgVMlfYXK+1R60Wjcm+VllBQwG5jIQ7nlSkBZPsvd/Fl+9z3lJEXcG2s
	OjZLv14M4rfGAtLGSINniwHHuaSMmV5WVTlfQw4EyVx5eJdAkX6BIdQ6N3wm0WVG
	2VOPwJujgoeNbHR5lvzKDtiB4uhW3+0KA8BgQuSyZO0Mi3gHAdbxUKg88LZQvFSd
	fOpRkdrIdOJAdB8ItCgB68SM/sxOoW5KXxlNDmC1NOsW5eC1nYi0Icl6USfUHkxO
	u34hWw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eesxabu24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:45:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so13104812a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 02:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780047941; x=1780652741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uz667M+0GzNu3DQdktJc+dlcwqwGLPErXGT+hqHNISM=;
        b=BhPZlD738DWlgMNi03LwbenlcwV9GWDI7AGCgUeMIMhlXj6dkOMgHxn/20G34OabLB
         Jemb2j0vRKvVkHEhRPXACs8ljDyaa7ppR6TLVvylLRGzockUDTtgBp4Q8LXN4xKG23rU
         +zU9ngYlZXoqqeSzewYk2EzKRoOb4KOS+x+A4fmczea86aXxV/bwyo/VcevznsXP+C1s
         gVMWT4gB6u41yj7CDf/4wueHXkvK0iR2ZDJMVxnEjtDv9MoHityl6oo/BfxnzWdlDlA1
         8xAfGah8ARqvdFmPtUKt79MQ/c0WsbkwrZempth3VeRwN7/xdGjTI946CjTS0KR9Lcje
         8rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047941; x=1780652741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uz667M+0GzNu3DQdktJc+dlcwqwGLPErXGT+hqHNISM=;
        b=VqiB3CK/G8UNZ1+rzIRVGHVcgoNk7d4t/TfQYmGqwGn7REn/gfE0Jv4qA+lV7dcAEI
         Ne+wmCMYpOsOVb5VpJGs6/kH/QFyUUIVquXIYjI/mThaQ3GNBw/lYtXCzY1PCvUHFnDy
         VNM8RiHf3jsnf24p1rqXmG8RcmB8YGlffN7vjwDKF06K79E2eBhRUc0OycqgQI8W5hnC
         eB2Pr8Z5+8CpZ5xEsjoRFPK/yoEXTiEnZnSxeLkxod/+qQh3pIwGvay8unQ0yvWG+hrv
         HBRNO+Saiz5VXpoy0v8Gul+L2aK+qLzIuKNIGSGUstoqUd3g6YCFHbetozVtlYLspEjm
         /SCA==
X-Forwarded-Encrypted: i=1; AFNElJ8Kn7Ry2sjvRWprURBhmw3sQ+OsVyzraLm1Bk6tvQ5C9QtRf/y8O0OuMTtnCQd/hWnIGjok3LU3ju4v2cW9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1WrxNacYh41oJhEuB9BesfuYX2Mu2OvwOye6LgV7ONrbBRYVQ
	04jhB/PaVUVZ4l9mYwQeIT7bd6EJcs8GSoi0bizAVCTctUuQTGM4LyM9n0M3AMc3yQ0oq19G1fT
	dK0USrr0gDEUKAG7lRc9KQrOfzhBNzNAUmbpnun6V2P7h2AN54G3D4fv7TVxUhcMXNCOK
X-Gm-Gg: Acq92OG5WBZtv/YHQm8gW106QOMMl3V4DOyIyPte8HgA/GxEf4nIAmjGuYXcl+6UAmE
	JD+SvOoEUcdnJFQm5fYT7ZkVgQy105Rj1oByObsT+THw/9zjkzH0QA/dGdN5qUFwtJGGYnd2xw7
	T7mgQC/EK4QT+M07gVxDVrPbWzrvkhqKYZOw/m9fwNrXMAX0IdugkQ0gS/fgLqMSLxk7X4bS/lD
	Tx2SD++29LMszscawK3iBXlCOCK6T2LsYCVKHcVIoPMwwrcaRJyct0a0KyEMgiEU9g3XE6Qndp8
	GBYq2XyTAaMbnSyjsuDfrEhr/73xluFavQz/CZ3SuNYl3fA7rKi4JQexP0MnK5seOkbu/0kBSHQ
	v3bbOvpgwkVaobsXMMmNO6Uarlt7zAREZWQRfkL5F/HEv7KuESQvp4iItBxj4J6DHGuXAbGuKCL
	m8Z7LDlaADXkmi9bul1Wo814IGgGs=
X-Received: by 2002:a17:90a:c88e:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-36bbcd5b0bdmr2738460a91.10.1780047941291;
        Fri, 29 May 2026 02:45:41 -0700 (PDT)
X-Received: by 2002:a17:90a:c88e:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-36bbcd5b0bdmr2738429a91.10.1780047940781;
        Fri, 29 May 2026 02:45:40 -0700 (PDT)
Received: from [10.249.20.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0c341dasm1644114a91.15.2026.05.29.02.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:45:40 -0700 (PDT)
Message-ID: <ce5f261a-8c39-4fca-a267-31bea6fc1e85@oss.qualcomm.com>
Date: Fri, 29 May 2026 17:45:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <keD2FYytnyM7Tuz-kCdnzVBtv7rq_24Kr2dEKBfOpBjqQnmRFqksX-dY7IE8TlIB4ke44GBSYStsHtoa0x4DJQ==@protonmail.internalid>
 <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
 <dd93b5b9-ac3c-4fc1-bb54-a68ce6d477c7@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <dd93b5b9-ac3c-4fc1-bb54-a68ce6d477c7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GxU7uhR170CXi8qCEAYE1vbb3CSPLPHD
X-Proofpoint-ORIG-GUID: GxU7uhR170CXi8qCEAYE1vbb3CSPLPHD
X-Authority-Analysis: v=2.4 cv=ZdIt8MVA c=1 sm=1 tr=0 ts=6a196045 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2yV_Bs2KBFBxzfrgXuIA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5NSBTYWx0ZWRfX/yy1jMvk5koT
 neB8xdcVNdIpgwLJhaKBbj/q1AJ7JGy6wpSpYJuIeY4WNcPMNZqpprAy5fQAlahDKm9MSCiKzUa
 q3nseNAMM1/QzUd0ErZwJlWEZgK9MHA6sZxVe14UHtcrXcZVo0B0fmGQmONVBQRWAIz3SF9Zp4D
 VmuGtrz88/GtxtXEun2lsgV99GAgK7qN2wYDm0ZP1dQ2xO+KlivyC5pobgQ3jgHKCk0ONRyGtxk
 BNJLlMKgGA+2vTQjpcKuuUsDvf8Ob97TMB6TAeVWxXfZCCFoxogggQgDLxNfX8eXvbb44F2jwuc
 JbewS/n02SEoAJH+yPTN2xfwLyCnlyEo89s0BwPecGlpWV9TwuDbDED6VP3CxCQb/Veaak2PRel
 nSAkl0Qt/HsmDGt5z+JjzCBfd6CiQN3c87JmFIAKVqCansYn/qq5VBCSP1HkQwz2jdCH0p1/q2s
 /qDvjRsEt3Eh7Rsshpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110242-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99DAE6002EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/5/29 17:15, Bryan O'Donoghue wrote:
> 
> Ehy why are camcc patches prerequisites for vidc ?
> 
> I'll drop all of that stuff since you don't depend on it and and you 
> don't actually want to be gated by it.
> 
> ---
> bod

Only the last two patches of this series, which are the DT patches, 
depend on videocc. Please drop them. The driver is good to go.

-- 
Best Regards,
Wangao


