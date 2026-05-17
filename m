Return-Path: <linux-arm-msm+bounces-108044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKClAgnYCWossQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:00:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5D9561D28
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C7F8300A7D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F453090DE;
	Sun, 17 May 2026 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ue91FZub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMtiz+2v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8248D405C2A
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030022; cv=none; b=shILnrAdm1XIP66vctn3ulJXuJpbcxf2CI7gMzzBT98OzYyDJwNfFmGfUbz2A5IBmnXu0wtxx22vczuwWVyPp0k+yoc5HoJjubLnNU+UdM4Gdogodxnet0Z1m8J6/rqA3aZunhVtOf06vxQkgaxhvOfld6mjmU58gwXaqjHGmXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030022; c=relaxed/simple;
	bh=8vjcL8OdQ5tgtJDoUFXe1PLh6azSB7d62dFmx2Xf4E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rosoIhci69ZcJkn1Efp5+hxpkb59ahGqaonislKw875VudvzCjMmhHSIv4mB1sB6KRqlUJZC4+7jzUAMKwvD5K/r3nPyR4llF/orESYEeYqzeEZNCjVauzg3k0JRXF5352K+oKxCQ+svNuoedlnqITR51yi1CLXmtjbjGfVODws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ue91FZub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMtiz+2v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GHUML71146717
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2fZr1KKIxC9P7aZKgWLBg6WfF9TW7hamnvrwR9wTjI=; b=Ue91FZubwWaq7lvP
	BCgmsycPl2No1NZY5uN3ghSvoPK1en2WqpUE1/Rm2CpJqbelOpOpOuZhmm3GeQmP
	hzsu+zMij4FnCpwbnImsG2kcaGfgHJOXphKtjztJWnR42K17VmrWJOZ1hbOG2h8t
	C7OKSUjFL4z/DcLteovBuQiIKlmUAQcQa+5+OFDePcki6+D06SJN21tyMfX5WIcp
	3zGnBwdT6ume9CxK5knmyMD1NL34zZEw3rLJ86bpleFuCo8FKX8LKQr3eoe51Ka/
	GCm+CyKf6ho5kSf/jfjzIffrERm+T2saY0XGKOU66GZkPoX+zADVVb93lqppCMtZ
	WU8TQw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqu1ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:00:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso19536491cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779030019; x=1779634819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2fZr1KKIxC9P7aZKgWLBg6WfF9TW7hamnvrwR9wTjI=;
        b=iMtiz+2vneqUzVyrm2p/TrJcDbTfQ641fhbAvWk0SOdicPTK/zNMs8GKJCKjaE/g4x
         pKRI4WxFuhsmrEXAajJiG/IhWBaAQcc3MYi812sSujGqqb5IKGP3JCgDzpB2Uv9VxW8y
         npQAP4zcYbf4fezS7ShR8IvUpw9xk+Hv4gKNvDsERvifbhbjHtfwvPp3WjuKCVyGyK3Z
         gDBqo4ve9nYVuhmEWFN+szTExB2Pvlipf+6J+iT2XRx30fRi6Ei/a8LKJRIwzaq9Jd1K
         3YP0KhQ8RaEN7qx5NjDshlMDb3jGvLBud2eHJ6xam56/TwdUM4qGMPowLsgljuFpdCVw
         5F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779030019; x=1779634819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2fZr1KKIxC9P7aZKgWLBg6WfF9TW7hamnvrwR9wTjI=;
        b=CNB4K+nNB5ajXw5qJ2RJ8Hu1vggoPRAqsfhVvdopcEvDO8V9twoUfZpxXwjpyNmfuo
         OfvSn0e+gUV0i/74hg0/8p1DOw0nj0Z/6TaTkw/0MOJPDa63PHkJNKVLy361Bvh+/+18
         uzEjbtVdG0kTNgv7Z2ynjsripN6rlULDuVPYmX9qcRmh6GgOzNcFUVuWYMpquK5wC3WH
         QejcmUYsgs736HWUxDsRxgOjVu6qqzAoWbhcnEr+x/+e+2AYqlaBm5+pJNjRC2Bv2K5M
         YT8seXaMRi3aJkpaY1//zPs7g8zS+7sHC2frw5vSN3kqVe4KVoUgNLXdfT0wVZUaqd70
         4wIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xbsfCP6W06jTy5oEsiDjN1Baj85bWqNJx271785KUa/wNc73JGyu4et47TBLTOrbskNn2KT5mPZ6x6jZT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu5EruOKNxrXuej0Wymd7nZfBt7v6Aj//B+HBO+AcsUg0yVjmx
	allZ6iZCOX3YJSbzRNOgdyWmXn03zQlqENx1CC0B8l2bu4edOohaQHTmiP2bzyAmHw6HRPJZPoX
	7aydHZcGketx+6w/416MyFJ/Dz3Yx3xavR09Ek9a04aVafc8/c4zj3KPCHC06FkURGo/r
X-Gm-Gg: Acq92OErzOUe6B0vAoHf9f1wb6DOsLMVdeKuJJX/0e9Zmg5HoVmrpY36zOsIL+h5KQE
	IY1/vvwD400DdAUJ1CzkVZLpLPDPW3tj/hgJEB6BLUt1ph8EoalhdcyrCK32yWAvS1Doyqj3UKp
	8s5oetrjksu4UQl6RwpdJ9QSvFdkNqii+F9CWagsB+p5M9h2z43H7b6zYlqC0HTk13PuIjMqS16
	rnVNhGqhhODG47UQZlumRLXfPKjdcPBWYK1lD2GBeAoFio/SAioEAnacJk/ZZYXaeRa6G36Krtc
	NPAn5kBO7OIrKrRz+SPzcVAz77KPuisNFiIFgqJCPDzwbx5QuRRfa/QAl9UiBcmyWEWq3wRhyJE
	O6y115CNqYO/Q322RrZChXB2y3ae4Rn4pXUUDAj7zrsAT+jxnNkXNInNq8/dsthZAZj13pEQOJr
	Ci2uQy6x+p
X-Received: by 2002:a05:622a:859c:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-516415a0ad1mr143174111cf.14.1779030018758;
        Sun, 17 May 2026 08:00:18 -0700 (PDT)
X-Received: by 2002:a05:622a:859c:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-516415a0ad1mr143173351cf.14.1779030018171;
        Sun, 17 May 2026 08:00:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3e20:6c07:e6b8:6153? ([2a05:6e02:1041:c10:3e20:6c07:e6b8:6153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm193354695e9.14.2026.05.17.08.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 08:00:17 -0700 (PDT)
Message-ID: <938b5e46-fc82-4d6c-8207-6ec2b2495a26@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:00:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: qcom: fix typo in comment
To: Jinseok Kim <always.starving0@gmail.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, skhan@linuxfoundation.org,
        me@brighamcampbell.com, jkoolstra@xs4all.nl,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20260516152324.1863-1-always.starving0@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260516152324.1863-1-always.starving0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fNbWisHyPVc9aWjxRYg5dP1eQ3rompfI
X-Proofpoint-ORIG-GUID: fNbWisHyPVc9aWjxRYg5dP1eQ3rompfI
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a09d803 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=hEL-7WqZ2Qmr7oYnmoIA:9 a=QEXdDO2ut3YA:10 a=lbjUW56U394A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MSBTYWx0ZWRfX7LlvN4ieLOv4
 bJ6rgz66dxrkBncoE1PgfWtu4jEv3XxF5O+A1ryhVPbij9jD463NKk0FoTdYN09ZP6bwlDitvGv
 k+C1LrkIpmI7n9zWZfxV7dQ5CKuKmD74VaeR75HoPPeosLrvi9vB5oIL5D46NmZsNHdddft/y5K
 Q+lZ9W5OxV8Uku7yIhBNWmIxZO1UhLBqw/QgfoksHpDdcVgn4v9z9nByt5FutYdDtS+oifPl0Rr
 M82bEgYRkrWG/ZDLod/1ltJKRW52rivswoUDumiJDIKGM1jI6JaJXTDi2jTWnZFA4twqlrp5rrk
 CUQiOd6JPnK+kjU8BOIpPWaEAkCp0DNmeXV0aThug1LiNTS1MbAt4NcGNpxuvXrIMjzJMyzfjDa
 gXpkEwtofQMhber+TkieK5oAQnW59ThoLMcDppHhKIgl7v4emubN5Vspmz0+eefLi69a/+sdDXL
 U6nQVLpsqjBo6SzhL5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170161
X-Rspamd-Queue-Id: BC5D9561D28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108044-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,arm.com,linuxfoundation.org,brighamcampbell.com,xs4all.nl,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/16/26 17:23, Jinseok Kim wrote:
> Fix a typo in the struct tsens_irq_data comment.
> Replace "uppper" with "upper".
> 
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---

Applied, thanks

