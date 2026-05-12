Return-Path: <linux-arm-msm+bounces-107129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C1yL8xTA2pD4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:22:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 734AC52495D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B309C305E63D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AA63CE090;
	Tue, 12 May 2026 16:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6lhApsU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDzRcl/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B11372057
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778602887; cv=none; b=pqdRRvzB26C4dx8G0IRuHPN+QONNCAqVM7UArwfaxtXf9uRmKf2pzh6BQSiJ3kJRDGsOfZzLIk7SqZ3Q/gvJH+t4ryVsfibD1jlmBMnfT4OG6e1Gr+cQDU72DCYyNYezbe4jpvK3+ABK9SJtX0PGzii9geEpLq287kp+skfqXN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778602887; c=relaxed/simple;
	bh=W8EalF2KkcceF4p6dRKK5F8ZTk64dxzj5Z1Pf8+6dEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uue3asVNROpmQL+xIbxEUmZnXW/WD3LcNOPt2owVupFIBfG6V2Gl7jERTKIDlG2o8Yw7A0/qloaPII5avQ1QgwJ+4szDZsDaTC4Ing3uNOFV2soodbuwuJWY+Lt2nq8Q4SSuFgmxzd8KLJfXikmgNo4Hp3aSJv9HwTTZRIakid0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6lhApsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDzRcl/N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCL9Ij545386
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EFl7j0YKunj2Vbw126li5xqaN5v5D/S65Q3oNJTH0o4=; b=C6lhApsUTArwqNAV
	x0Cuo7+aRf5TO78dnjCnLGJDdF/4BAKGX+8/dlcyWrumNGQgJW5caJN9jmzS+oSk
	rxLRQzgDVNMVAp6292QK3rbL8CvE/5YKCk6cCYCa6vCsNnBt9vSLQy2Piv813FPK
	ErG7G5O6CzkC6yVJIRl5bQpOyJua+EQnnGEp4Gs2DI7F4Iw1HToCQ7QHN10hoFpP
	FQShhatWaE37ozMBWDP7ubUJwum7yn3CLKSgok2txbBgnhlseN/zKBAXmsWTpkDj
	FIARs9stoletv4+cy3Fc4w/uSsZZxs7jy/2+v6IV0wU5BF0ksO1AqpdMWA8V2DjA
	5ibRAA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444srxps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:21:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f1383b7439so4872426eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778602884; x=1779207684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EFl7j0YKunj2Vbw126li5xqaN5v5D/S65Q3oNJTH0o4=;
        b=gDzRcl/NtMcPKHnzyQ7EB8gprYKJfQuLrevtOViHOAx2O7RPcfGMyPOG1ycrzOGjcy
         PyuGU6s0S+c/v8XWy2MckO2yepSJ2de0yYH7LN0IIwERgjaFEQmCRpqyNfZpjJOO4weI
         J7cDqmV9tUuDdMNVKLK4JSNfeqrnI8Q3fAaWfDLZPiC0VzN8k8+eq1N9tQI/5asBdBlf
         AbF/qSByjKe88Hlp5dj0rSbdI/QXPhZlZnZCNLMKveF1rFS1FSM3+lgW9txvU4B42vOw
         qCWBgWlG3fV8w7AxgcCnsAI9pvKJVsY7chKNZROFCoGBjf1Qggbr8EN4MJ+83DfS/ptX
         h4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778602884; x=1779207684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFl7j0YKunj2Vbw126li5xqaN5v5D/S65Q3oNJTH0o4=;
        b=q3oYL14c46Neo9mfqsv6Pc0VXBgN5HN3z1B5q2+jEIieoyiv0vwfpc/jaskZaisADe
         eSwWl7Z0labZe4+y5OvhxBbEuKxU4kwWVxpovPjTEKRhUdB3fmA2fc12qmyrbaeoE2k+
         R3JptjAv7MJTVIXPdAQw90TEX1oeWP3MOmLJOlnND0tWXeYunEv1RkrDpki4pEofJL/O
         h6qmSnTMZ+qb9X+hZiVdGBbAdwXpAp5+rQ/THiNxg4i6+SY/4/TLESzSpwl95+JBVw+k
         fVqorHmG57/OwNoQ6rGrNIuZzrSISRvoHEmkY69q5CNLznamCO1rMkY7lJQfHGExF5fm
         RfdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8nINJ8RwapNEpPfsdmOQU4yN9imS3AOxtq5ytbYb6+Yk4yGM9MAeTF5cnJGV4xlQKZwVNmfsUcLjTydpT@vger.kernel.org
X-Gm-Message-State: AOJu0YyYdQZobQtei5YZaCO0dcLgxl+SHoCVkoTX3GIoiJGDYyxKSjhX
	pCWQT6mKnVWCKAktHifHHYWLTou4ZF+/+UgMJJSQVUOdmOFsVuKqmi5wR2R6Dp8tGkONn0fKJMS
	+5/NKY90J1RKWYDnYzkXted5jPVBS0EWJM1mkf0VtO8ZpeH2DDb/R6/Gtc5sWLLGGtAmM
X-Gm-Gg: Acq92OE+KhTAJB+Pm+RJnB00+IyPGsgiHfgs5PPMRcmc4/qGY/fCVTPUkF+I73U7UZC
	6XWQy9cQUKqjHOulJdgcbwWuNEhgbLVYrQ69XkbxnhpM958NVX7M1IaTLmcP8DeKMKa6dv4CdrW
	sT0Lk6IZ5nT7sJoNLvtrg2jen7uclKgRt9p5vY5vJrEspHZywxPe3258xXm5E+DYnCoyO7wY24R
	9LMgCwbBMl33LGCTgyKDLws1azI/lFD7eRPAbGwWZi080Not/3YGj/sHpiD9bsqJ+MReEnPIvr8
	7cHjaYPV8yuuqc8HVUUAIK0P+7+Md641QU1THgJdIBXo4a0dO7VNA4+cKJkistSOPvCG614w4Pi
	2iOtdFQGLASHNFT+a6kAPjRRegDiDwO0vl2T71bl69giXrRi/oxutApNf9N+UxEbBGkw/Mmi/9r
	o=
X-Received: by 2002:a05:7022:458f:b0:12a:6abf:ab1c with SMTP id a92af1059eb24-1333b1b9466mr2440514c88.11.1778602884400;
        Tue, 12 May 2026 09:21:24 -0700 (PDT)
X-Received: by 2002:a05:7022:458f:b0:12a:6abf:ab1c with SMTP id a92af1059eb24-1333b1b9466mr2440476c88.11.1778602883547;
        Tue, 12 May 2026 09:21:23 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132781103e7sm23886722c88.1.2026.05.12.09.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 09:21:23 -0700 (PDT)
Message-ID: <8f2eb932-f70b-40d1-a5f8-6430fc735f71@oss.qualcomm.com>
Date: Tue, 12 May 2026 10:21:21 -0600
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
X-Proofpoint-GUID: 2R4UVfRX-T_-V6Zx5ivU4cQMvhrzQM4i
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a035385 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=1lcS69py3Ix-9TsBHUMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 2R4UVfRX-T_-V6Zx5ivU4cQMvhrzQM4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3MCBTYWx0ZWRfXybY5+vmp7GAl
 OLES3wszqJKYmtXUhkT7HIdtWmfnLY5syMI27R1vHoO7zGRVrKSCihwPnGcK/jzk66IVkSU4Q91
 4S9kbxKeM6nJfcPET5RQqSnhPD/ATVQTqEVQYjQ64G9uQZMZMRuPtE1dRyd++Q8A3wZxaQGhcH5
 XiSl4i4cizU5liMG805M+mb8bC3fWyL0Cl0dz2rF9HLy6TxJlSH8eKwNoAnfR4hjATntWK6LMv5
 Mg4B5/ciHL6kzYWQTaQiOF5nqagBL2EMC42he+5FDoJUIcxZbkpOgREXDdoBOCG7rBsl7y2oK+y
 6iLPJNRufAd/qbo7m6Awai/Gp5zVkXo7xJ9rg94/am8jJz6z8Ey2/lmzsEAHFs+POw5wz0nQAdm
 e2wrCHcfGcUciFuKxGTgkBkOPsrHpEHfmmg8t/GZkcTKYZ8vq+JHL9ur5qR7l2MUIJiSrYOc3Iy
 dJgkX2WUwIe53W0yVfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120170
X-Rspamd-Queue-Id: 734AC52495D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107129-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
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

Applied to drm-misc-next

-Jeff

