Return-Path: <linux-arm-msm+bounces-111171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TR7rERRKIWpwCgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:49:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6B63EA96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:49:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="gk wQ7pQ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="hKgd3/UY";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111171-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111171-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB7E130293C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 09:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007833D9045;
	Thu,  4 Jun 2026 09:37:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00AC3CB902
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 09:37:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780565831; cv=pass; b=RHglVkgrZSriIwBbTbnja2T9v1wkg74X08T+RbHN5FXw84sHfq3k5xQHKg3bIpjeVfK9DjMPZSMGdCkz+t9kTFkWDLhfbhI5vzHQJuNDY2fBUOp0j1VfFUpmpbfn6T9HehORj23zWQcOfZtlZ2bHK4AajKfn+Bi2Q8bNAgSIMRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780565831; c=relaxed/simple;
	bh=LKFmCuDQNLkJpDjv10PTCN7SoRI92sQX+juYlxXSmCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e66TU9sPm+iiWjaOJkGFpEFvZGKNt+oc3WW10XvZalG+/TI3coLjUzCCARRIZUdc4WRVRhMK+gC5FaQdkRqQ5vT7z/Cto5BMFm3jexbDg6kH3/E3gFpaWf0T7EWLLAoL5HoLJwLSciscjh1tWV+JlHkqtBzw56Ygz4zfquFl80U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gkwQ7pQG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKgd3/UY; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543vows1993483
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 09:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=LbH2Ej66t35eFH01LN7Yn1mCVFPgBbI2BNIp23nOi0I=; b=gk
	wQ7pQGrydVH4blqAd03q/e5Ae1bc6NbOQrmi8+rkuGoe4hzxNhqsJTwdZ7wdW/+N
	qDxXNeOTPUwizWZs2hH9w8/Dguipy6CaRuCRoLEcFNj16hvzbndv+YDWdp5V7tbO
	myZCEQ905ekyZ8KmSkGZ4nHoSkeaSZo90THNZ8f1Ow09YhZkoFIQTeHNfhZw9Vx4
	PFfg/aVoZC4rsLW1ANya/izCW3kjD78HPRL82MviYJ9f77AWmu3ujblBlbiwXYV0
	1gWu4CL/J3Nn8B9UV26DMYO+HnPLUwIs+kzQRLfroybnAOf5kfTrCEXsRYwhpABP
	B5FOeZZdPcS6JqR0hCZw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8ptyqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 09:37:07 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-440e399d049so466613fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 02:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780565827; cv=none;
        d=google.com; s=arc-20240605;
        b=dskvLnYaLMpUDxW32ue6hF33aEnwNOQQECCiFW0b/uzHBMpTWNrQiz/p30npgkjQDo
         c4vpAoqe+JCCRCyroSihtk0Qw/8VNofLW7maLZKtndiFCgY3CLcGEF7aSwzAx5gbL0OZ
         MgGc86WRN8a/RGcegfB5MQeJdfRaKHMbFUN0Z/2VhrbpvGIBVWFHjdU2JQv7TodzfcUi
         QfGGvES7IWvNJLhFGFKbAPi6kUXS0FvLDWOwpB28R6Q4feEgye2NdHUkyvZuAfi+K5h5
         4GEhEmiKbcCb6HVU5u0eQvbpe+MB5pw5edlp28shZB3+WIFqTL2CBgOxnL1U825cFaaZ
         IRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=LbH2Ej66t35eFH01LN7Yn1mCVFPgBbI2BNIp23nOi0I=;
        fh=3wFHKAP2lLI1uAK4K1wK/Yz929ykxpMEapAaYbNWq+U=;
        b=BYWzNZVKpdCd39ujzuCUyQYrRIAs7vKxoMBhTtW9GwcSyLRLMhro1WKLqcLvx1bDLf
         dtE8u2KCSwmO7ntt7vdmY7iSqla/+2Q2f4qVGzchohXsB68HX7xq6Byr9AWe3g+BoMBd
         p2TstXv/SC9t7luAVvuwZNg47hngwTEFQzpVJgVYucyNLCigetR92Shl7YvCFpeqdxm6
         xxwzluZQrnnb8Ns479iZycLpegpOM2dCshSoXnGBNOCMU7vtpLt+x7/7QhqUUchHl/IT
         Oqa+09FX1kxUDxsdFkqdW6mohH/2089+RlTGQK50J8SjEDiyvanIz669uf90G84ambkl
         t9Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780565827; x=1781170627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LbH2Ej66t35eFH01LN7Yn1mCVFPgBbI2BNIp23nOi0I=;
        b=hKgd3/UYOYkLn6Vt4jiCJoWhjU3CQEf++REHBScqG1MtabumpLwC9RKT1QDzSOVkzW
         5Hjej8nFe4FFnlmi3imAptcteDpfftBYMQqE/T+qGOFskaHDM6oW6metZC29PA1GadHC
         Mh00QfXDC4poTJJAqxGY/gmRGRm32+56z/BI6HRLa7mdBTFOcL7ntieksrsxudwfExJt
         kVEw+rr2a3ncxokBKwoRwPRQU3psljLRwWHeoQTqrSwVnpwr779e/7GNdrceGr2MKAyQ
         ko7Ai7QJp7wPy/t0aoxUvFxxQPVef7teClXNSmzsFYK0j/LEA4fjuLV7TW87WkK5/9p4
         80mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780565827; x=1781170627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LbH2Ej66t35eFH01LN7Yn1mCVFPgBbI2BNIp23nOi0I=;
        b=TD2o0quK4/NHUhxKjwP7JyKLLo1BJfbxlAQcMWeCfgpTZ1UDYNqrUrzXLw1SHHrP25
         B6ps//aO2kOoc14qogerej6R3tONMeFRxXrW4X1jCxw2vHjQ6smmUMCXenxVgf/ypiBi
         FonwWWn6HOYRc36mDumQ9JXbJ7gZFrGk0H9wViAEMB9nOk09bdSKoM7IjrYKo828jF32
         YNoBgLoXEGIGQlOfEKGVWq1kw5CkDDvi3X4CL9aW06oH26IOYKYhtFCcr40GMvkCcjDC
         wA6eR3JmA/UzV4NmytsQQDxFvqMffAlv9OV39fbBtTDRBX7m03TcDio1vt9PWUpzBP2Z
         WfeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+pJPirrODW8J7RbFE4WKraMZ0TzcsM5L4WRZWpc21Yu0wv+4BetFkW58Dj9Wa3J+EwT8dQ6EDmjdrciyM@vger.kernel.org
X-Gm-Message-State: AOJu0YwzaBd/OvLguK7x5pY6sahzBTg6NSmMQKByrMYr0S/J1YbXWZD7
	1AdKGp1MGS5MqCIvVqHl6U2RvtI4H5vPfe0OMfj9wYeOqAnHDpbovN+uDtl5BwbrDy0xGNACnVg
	fv0lwA42+KMxoi5kkOOa28iiqnweOdY9YKVbZzbKCGbIRep+wl3czkLSi5Da/qop+3gWgQE/+3H
	EfxfwA20sJ4DY+QuoUHr+YMoQwKaYsbpJqOiwer3KBn18=
X-Gm-Gg: Acq92OH8yyDo396K1x+gxs9cpIC+vZCbcwSC3kNXz3DcPZo/IdYt1gqRgxyBOS6aCJQ
	ZXOuQvyPUSBewA7fwzrMZ2dnB814Y7tDEKtsLygQsDIAj2z0Pp+ZrQfDq3Z3ETuK2FWvb0yJ82/
	rSE/ChDEWtkNvdXdhzKTrpSE8swuEwzbeREct+wOlbzvGVRQa6n4ALsiUzjxtQkzDG6blquCnYg
	s7O/QOsn8b5bBjxqQ==
X-Received: by 2002:a05:6870:d0d3:b0:43b:9922:9df2 with SMTP id 586e51a60fabf-440db7cf55cmr4593197fac.21.1780565827200;
        Thu, 04 Jun 2026 02:37:07 -0700 (PDT)
X-Received: by 2002:a05:6870:d0d3:b0:43b:9922:9df2 with SMTP id
 586e51a60fabf-440db7cf55cmr4593192fac.21.1780565826858; Thu, 04 Jun 2026
 02:37:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528093437.2519248-1-hch@lst.de> <20260528093437.2519248-2-hch@lst.de>
 <5f7f90d8-cb32-4ffb-8f1c-0722aafbe869@kernel.org> <20260529135045.GA10647@lst.de>
 <5f3ba603-a6ad-4cf2-9a54-aebc10273c59@kernel.org> <58cc76e7-2348-443d-a989-2a06e61178af@kernel.org>
 <20260601113831.GA25535@lst.de> <d7b08296-7f6e-4d89-ab3b-04e43d04929e@kernel.org>
 <CACSVV00k-fxW6+waHNqvmYcnVNDkRexoWWprFzfayZfqdyMuuA@mail.gmail.com>
 <CACSVV00dNWgpNVU5rB=Hmg+3oWF18yTyfKNr_tWesjoP1jMxwg@mail.gmail.com>
 <5e6948b3-d235-4b61-aed7-e8b4d0f5b452@kernel.org> <CACSVV02v0Fuc6=Rqyd89D-_tcSjEXuQmxz0+2-4aoRAEwJE4zg@mail.gmail.com>
 <b6f6323e-6f5b-4928-b474-bd2743eac3f2@kernel.org> <f027078c-6a55-463b-8938-95ede02dca3b@kernel.org>
 <29bd5886-15c7-462b-8a39-f2ff25269ddf@kernel.org>
In-Reply-To: <29bd5886-15c7-462b-8a39-f2ff25269ddf@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 02:36:55 -0700
X-Gm-Features: AVVi8CdLwF-PFxeKWBcz71YZzZxxEA0LQrJYMS3qkVqAqJLyt2EL9LT70o-g4fs
Message-ID: <CACSVV03Ez9uKw0WDm9G2HTfyXy8SLu9AFGGnY58z-GK+32DV3A@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: improve kmem_cache_alloc_bulk
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Brown <broonie@kernel.org>, Hao Li <hao.li@linux.dev>,
        Christoph Lameter <cl@gentwo.org>,
        David Rientjes <rientjes@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, io-uring@vger.kernel.org,
        kasan-dev@googlegroups.com, bpf@vger.kernel.org,
        netdev@vger.kernel.org,
        Alexander Lobakin <aleksander.lobakin@intel.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: pC1OA6D92CcIbNX4Z5MEwsPeYhN8dL_v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5MiBTYWx0ZWRfX8x8QLULnswAe
 lf/38Y/NgNZPiM+42ySwAl51qw2EXE9gtOt9vKZsXIgjF3MQ3XCmrz+r5EaXbHogU+NrO3OmplA
 +w3PCLa/n9SxP+Q65q5CBidnITVGJcXZn+gKPbGLxXo3UhEOfuM87XD0QBQbaDO+zXWOgckPGqq
 obLP+96v6XyNNPG0HeZ9gnRDELDy9BQjTViUieLfnXFjBnQgRBvT+VuS+sJty+3GQaDq3V5QSI/
 mBpSGXCwm8TfyWJD6E3gXQH5wi/91c0wJF7YNoyEFJ6XSJhVP7xual52BT+o4seOFIfY9HBZmDw
 owvQBNFbwfVMo9Bp6HPKBUiYm1syWvTuWUF9fZjoHVkiMJ2vduA+EXnNMVZJgk/ZQWjo2nlsqp+
 lE8Eiegga/orEElB1MGNuh4ouaaTaScKb43/t0OEO8PH8iyRmqY91tfDE+CdeJYiV6bJ8Q4G4dd
 6dpCtmqg7c2VD3WDgyQ==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a214743 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=G_pyjxEXS8sYRXXvRXQA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: pC1OA6D92CcIbNX4Z5MEwsPeYhN8dL_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111171-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vbabka@kernel.org,m:harry@kernel.org,m:hch@lst.de,m:akpm@linux-foundation.org,m:broonie@kernel.org,m:hao.li@linux.dev,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:io-uring@vger.kernel.org,m:kasan-dev@googlegroups.com,m:bpf@vger.kernel.org,m:netdev@vger.kernel.org,m:aleksander.lobakin@intel.com,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BD6B63EA96

On Thu, Jun 4, 2026 at 12:35=E2=80=AFAM Vlastimil Babka (SUSE)
<vbabka@kernel.org> wrote:
>
> On 6/4/26 09:10, Harry Yoo wrote:
> >
> >
> > On 6/4/26 1:22 AM, Vlastimil Babka (SUSE) wrote:
> >> On 6/3/26 13:13, Rob Clark wrote:
> >>> On Wed, Jun 3, 2026 at 2:17=E2=80=AFAM Vlastimil Babka (SUSE) <vbabka=
@kernel.org> wrote:
> >>>>
> >>>> We know p->pages is NULL in this case, right? Because it was allocat=
ed by
> >>>> vm_bind_job_create() using kzalloc().
> >>>> And the job can't be reused with a leftover value?
> >>>> (msm_iommu_pagetable_prealloc_cleanup doesn't set p->pages to zero).
> >>>> Or should we set p->pages to NULL here.
> >>>
> >>> Correct, the job is not reused.  But I suppose setting p->pages to
> >>> NULL would make things more obvious, so no objection to that.
> >>
> >> OK, did that, just in case. Thanks.
> >
> > The kvfree() -> kfree() part should probably be a separate patch
> > with Fixes: 830d68f2cb8a ("drm/msm: Fix pgtable prealloc error
> > path") and Cc: stable?
> >
> > ...as the commit landed v6.18.
>
> Hm right, but realistically, can there be so many pages necessary, that t=
he
> array to hold their pointers would be over what kmalloc() can provide?

Pretty unlikely.. IIRC kvmalloc won't fallback to vmalloc for anything
under PAGE_SIZE, so count=3D=3D512..  which is more than 10x what I've
seen in practice

BR,
-R

> >>> BR,
> >>> -R
> >>>
> >>>>> +
> >>>>>         p->pages =3D kvmalloc_objs(*p->pages, p->count);
> >>>>>         if (!p->pages)
> >>>>>                 return -ENOMEM;
> >>>>>
> >>>>>         ret =3D kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, p->coun=
t, p->pages);
> >>>>>         if (ret !=3D p->count) {
> >>>>> -               kfree(p->pages);
> >>>>> +               kvfree(p->pages);
> >>>>>                 p->pages =3D NULL;
> >>>>>                 p->count =3D ret;
> >>>>>                 return -ENOMEM;
> >
>

