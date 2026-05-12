Return-Path: <linux-arm-msm+bounces-107127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BKLKGhTA2pq4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:20:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 241945248D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59B5230BFCA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A3A3C9896;
	Tue, 12 May 2026 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTuxMx0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMomlbs+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE153B83EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778602499; cv=none; b=I4UGCJ4wbcxE1FW2ZfvkivXlJin9vqnPBtR8pKk3Lh26OgBEKzv+7Cq3r/a39+9HhsZ5YbdVwPIh2kTRtS51r5Gl6/pDQ7Jy94eqS8ywfiT+LV4EoQALLh+aoGnjd2NpvqE7Ho0A8zgBa6OqY8ITJwMePk4l3GHP6W9m/XHopbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778602499; c=relaxed/simple;
	bh=nOcHWv6QRS+ZGxGDWNYh2zAFerYWBeSjlTs2oBQGdw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBBfS88W5DRJl2Rb/brr821N9EdpcBLkZZeSBC4yq3UiY/tR9kSj6C3cu76HTdqKzctsFJQR/C/LZScWoGsz92hg7ITB9GY8G4Gxu1xfC9bFtMY47a6KiEyKDfpUzbAUfKp93/PeQKgCK5+bo/vxW9a5QM6RVie35oIQaiOv5fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTuxMx0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMomlbs+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5MsU591849
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dearZrYdES8kldFVf7isD4SpduWQxApzD6N2MFZnRNE=; b=GTuxMx0dzEzVi0oi
	355AdHSL1hNFcMHDkJ9/94Dt+X6CoZ8K0GBaioGeYh00BXK0GZ0LVzsK7qzbbn6d
	jHEIT+ImCe2/kVS5UYAJ35/OVcoJIjqQtxnMHV/7Nx+B5upJXGAEwRpyo4eKd1pY
	uMAJtU/9tv9H6ZAlNTn+Jv0JqU9jzyraw31Nv9BL74RLL5zu+pCQBi4cpiOVYx0Q
	/FWVCoX0jou9+RBNVbwgOimibZDgrG5kWCgSISvkza8uZgsck4XmKtcII6TZCv+M
	sTe/KhPLfhyzxCm6bSYIAHmtpOU+Mk+wHYwMu5AuJDvNjc/XXBT5NlOBFFGHoRoK
	bxS2pA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319s8qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:14:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f2d983d109so7645245eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778602494; x=1779207294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dearZrYdES8kldFVf7isD4SpduWQxApzD6N2MFZnRNE=;
        b=iMomlbs+kP7ozvha7FxN5itFbr3x9rQ/2Xnlz9Im1qLLg/VY5Pl0NRS3GqH2bdBIvs
         81QOXD/lmngpfk3vJ6mcSV+JHCAYH0FWcj6nYu11mpHxLnBKbKLnhWpMeHJ5HJvtm8MO
         GW+IQTuaEtQkm5TDIzw7dF6GOHouJUaVpy2bugLZa0JNM3l9hkecIsAUMSG6bXSTN2w7
         7Yhxmq9n2h0lEf7WMtyd+rn55epHpPYCrMIEIvZ8aQoypDULZUM80MmK4M/gQese1Hw9
         DyXZRhXkucztyCjLN2uEuZMcgN0MgW1BqaVea/a6jitYmS7l1d4Vxfdxp1nCCG3k3QkU
         icGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778602494; x=1779207294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dearZrYdES8kldFVf7isD4SpduWQxApzD6N2MFZnRNE=;
        b=igjZASZth4vVvnpE4VxixpVygNpYQHfr3W0rWk7BXpPYfWgzYjlpm2OsEEESfSFMi6
         AJrh0cLzkqXwWfnyFtK/p0R0eGWD4crHhPtQkoay6jqnEIM+gG9WwUM4lwYdUcdl0L7i
         02muNpGOl3uCzR68PpQBIcn/H5mtFSm6i8vD5P9ENEDMG4HoeeK63zeMGn4EVZiPuTHX
         jHJ24ZQh4oM5J1akpsRcUwf2DNmUPShuE8ivAms4O9vWCKmV5Kud+6Dq25oNp4BWU6Vh
         ghN9MyvdQMu2kgdEpSA8vt/oVAbu2b7RZ24CI2Z75pEzR96+lciG81Id7WGrlYEwZvk2
         28Mw==
X-Forwarded-Encrypted: i=1; AFNElJ8wzY4fifXhx9ZcuBE94B2EIk7ZRaHSCsrmR8Z7ny+gBAlnVKfenhpa9DhduOIdG/yph7w0gF+FMNuSanGV@vger.kernel.org
X-Gm-Message-State: AOJu0YwPnm+tOmzeh2oLk4BoBNDPGBWp/hj4ljunwKDhVgQwwrBRp+vd
	d4xnejHWvfd+k9WlaNlNkSlgIlBZ8DMARHCwFCSo2Clnnd5k+7CmeneyKymWEXoUGPnwS6MoGYk
	k4DqygWx02IpIJ2yZPChPP6nP2P2nOVrfRUqmms69obwH4UECUyJ5QwTXh7m04qxsyRfO
X-Gm-Gg: Acq92OErQYdzVUkgNLTX7+j7M0XJ6o1SNHv3yeHV1cSeV7bNpoyOW5DvuHJocP9pIpg
	RZ5xYdEyVvdDpCBxPsYCww4mY1QhJeRU6yKJAOBreOTtw/6yIobG429Td5Wd3ah3t6qwEpXYBFU
	wrsKJvZNqDFyxnPQ6rdybigh3LJI5AuMuy1JkzuXhJg5Bp9Zn5xoHGrpCL6595dUfkYU1lv8Zo2
	BmFPm0dbLK/igHF0g6H+5dWqppxzdBtY+MbotDRVb1x5A+8HWROpO8RTjoHBlEsc0/uiB9+wPzZ
	8NL8LpiDlmoiatrjj8myRM2Xw2HOCdZOM+PRQO5hhkJYVxYdX68L6lTRL7hcxW8zjfaRaoAz0C5
	yv7Dwe8mZMpRBmpQu9fFTXsbfzYi7p8Q9vEAmmA7q6csh/jOrtll8r4Dz6MxZ0X7cTF/xdW7Kc1
	o=
X-Received: by 2002:a05:7300:478e:b0:2dd:405f:89b3 with SMTP id 5a478bee46e88-2f858348089mr11196199eec.0.1778602494242;
        Tue, 12 May 2026 09:14:54 -0700 (PDT)
X-Received: by 2002:a05:7300:478e:b0:2dd:405f:89b3 with SMTP id 5a478bee46e88-2f858348089mr11196174eec.0.1778602493662;
        Tue, 12 May 2026 09:14:53 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafcdsm23156644eec.6.2026.05.12.09.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 09:14:53 -0700 (PDT)
Message-ID: <f37a917a-6bbe-4321-be11-2aa59c15f85c@oss.qualcomm.com>
Date: Tue, 12 May 2026 10:14:52 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] accel/qaic: kcalloc + kzalloc to kzalloc
To: Rosen Penev <rosenp@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
 <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260401220643.12802-1-rosenp@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260401220643.12802-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE2OCBTYWx0ZWRfX69XKEvkBJK2U
 n7SVO5d4FcZrtpedfx3SILFhY0uIJOyLJ/I0ceJXeBXpdg3heQL7PpxX0tphjPguGt61zAnorU2
 bYcGmaHzYKfyg8HFlfmPuzD02ku4Ckwy1XTcCea4GigHp/I+2Hz7tOoCDVh/hCb4jOCuvlBn/SD
 XqgIuendt7u1+zv3ERfvXE8hFDv/831jblgvH3pBHC2ePZ3u9SM+j3avb5zYPybC6rSCZmEurvm
 uQjiVoJ+A3RkSIMfNxCDYjSfpnTDctEZJ+kwWZAoGcJlIAfXz2/4M7iF6khaQetzClne6020rLu
 7JeWS7JqyuRYQBUEvskdYn+Z5lLKhekt6wrgR/70k2Gw51FBuSjVqAw7TmTaRhnZg7Z4f6VW88M
 oKMaB6TkHKEjpKN3X91aY1lH8J97twpjPxYCyDS7yq+HCjtjyBpJzJwQQ/25gM6mEhOMZYn86Jr
 U6yRp37ihtLIXFwwlBw==
X-Proofpoint-GUID: S3091Ai-7sTYllZlc-bV82bdJwBl_zWq
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a0351ff cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1lcS69py3Ix-9TsBHUMA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: S3091Ai-7sTYllZlc-bV82bdJwBl_zWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120168
X-Rspamd-Queue-Id: 241945248D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107127-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/1/2026 4:06 PM, Rosen Penev wrote:
> Consolidate the two-element allocation into a single allocation using a
> flexible array member. This reduces memory fragmentation and simplifies
> the error path by eliminating the need to check for allocation failure
> between the two allocations.
> 
> Add __counted_by for runtime bounds checking.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

