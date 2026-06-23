Return-Path: <linux-arm-msm+bounces-114139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K2aAI/ZVOmqS6QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:46:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E676B5E9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:46:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ddfRBVtW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OZkdQMlL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114139-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114139-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 405383037164
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6506F3CF692;
	Tue, 23 Jun 2026 09:43:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9333C769F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:43:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207839; cv=none; b=SyqMM24CUimAqVN2ZEKijqSEr/0/KdbtGoK+lN7ZorLqAAT6RR4rQANFChQT5cTh3U7rZdyhCkhVN0MycE5nFQgIYRht2r7NZ/fSqqDB/vFHLlmife8qK6aUrKLU9demxRe31UH1QofYL5gUMl88Akzd3Ott1D5n7JhKgqqJbBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207839; c=relaxed/simple;
	bh=IOBuSq9oFvtUO9jbGRB2Dd8enVgsrDIh743csuSYkr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dp5rOPvimdlKTf9DMqzac4w/0ckUyWrPM0Bulmd6IVZXxJiAdPUkAkw8JhBTWkFdt7+IPc+oP0w8uK+ZeaYbD9suDzFqYdvxqSpPyIe2/+g4GYCXlb8+l5cFzWsAf3+1/IqG95yf74NYzohvWgI0AGK9zXVaRbNJHrWEohgSmfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddfRBVtW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZkdQMlL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8UwDw3243887
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxrcxhyOuxd7GXZ23mY/VgyhqDmV2bO3uTTZnHP+KCc=; b=ddfRBVtWD6GZx5zA
	yAjlwzGMS8LestoOxc/dFUOEJUOxVi4imsislr0aW02QqDKKDUEUFgNTUCdxnqnO
	wYndztjTmtj0mHt+5WUXaBKx+rfqX6DZbWcHdkL0wt51Y+Plf+c4Rg9QnEqy/HvS
	EadVVykoRL4oNMihGQTIiTFEFZEQLPpXywF69ehEA9aAlKY3y3cxqSOM55IxSpSd
	or+NDZDCtSO7A4hyk3m/L53wy4dcqxeC4hqp5Vvtf5JorWdHeU0V3lTowRc3MR9o
	tFzDLZVoYrZqUyr3i7tJIbKKLyV235zG8lmfbHqoNx6EhkwD1nnjak6O7QZPoPkD
	MDkg8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygaka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:43:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178a632a12so1807871cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207836; x=1782812636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxrcxhyOuxd7GXZ23mY/VgyhqDmV2bO3uTTZnHP+KCc=;
        b=OZkdQMlLCwbarJVpGk8xUHs+2ny+szusxULGfjg6Ww/od5WEAm88c50EC4LI22LaOk
         d5y/IgjKbIjhaXyDSbrYWOq/NF4w8EdRKJH5QVm5/ndMuM3J9MS6+9lXNazk8WJMMyYo
         25A5JrS8XWKK83OoJ/pgo3ze9Bandsq37ofncsqjgpbJM9uWbiV18sPz2h5lgT1wongV
         Fdeg4761371Ngjj9geE4+gS87yg8N4MT0XYiESabZlqqWNp38e4yo8KXnvig1Oh0xzNQ
         uslJh3WATQibC6QWYZLL6k4YuCvrdAYkrzl5iXeAdM5ztqywjRwLQTa8taUi0WSgTf7j
         YCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207836; x=1782812636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxrcxhyOuxd7GXZ23mY/VgyhqDmV2bO3uTTZnHP+KCc=;
        b=FK9wDroFMLMBJe9CSgrosePaArnmyh60InJJHE64YbNl1MnHuAx6fQyodzWvX43bZI
         u7e4oyTf7U0Y/7JtOVMO4SHMcKF0uMnYU+UG+IOlHgAKxmh+YEGEdkT0J+7WHKhLfWuB
         w72YnB1Z809N/0jce+mXTWPfZQ3rVNVm9P5ywMH/v2uDGGiDXXCyAiLZOVTK+Hzmd58n
         HkfVPOiuCOA93LKjj3nplM6V/wo0eql2HkNR85KEiG4f6a1buOPZ4ltdbEtA9bdcmeLS
         MRyMTD83Obafl/WZGzIxCJ79eVQocWHws2rvi6bglFAH8EvEtwwr+yrDHlh7j62vN5Yj
         UZFA==
X-Forwarded-Encrypted: i=1; AFNElJ/QWoRzte3MrOK5EUgId1+VMWsDCcEVfRZjoaTRetcqYKNlh5plXqt4Pe3MWKF7LR/Yr00gGXR0GI4KoY1E@vger.kernel.org
X-Gm-Message-State: AOJu0YxRcb7SjO3eDDZbU3CGu/rCvW853LvcH2L4pRi6lX6Of5AT7Wxi
	OuZbefLezpeUds+Xw+3XJe4e7qDLIaECFGzbx8UDGNZYmS0BqK2ICfZspWXJzCTenx+jTQ1syHI
	Vp+mNP5tZZsHzUJPUIvD7DkJTqOirqD0VtxpzY4luDBPU7FAEHGkvg/gxrCWv1bxv6EuK
X-Gm-Gg: AfdE7cktS38EYp/8//01uuIKdTUWB74J1w/k1P9ZMn0Fs1pMl8J+KwGg9CudWrKZBNQ
	SudQFTrcxgotqjC9fn+f3IkIYpW2dn+QaIz/UQlU1tuMt8vjyPTF/b7j7dgBfz36ba1jfBh796k
	jiMKS6mlhMZdWogtvUTR60LU7NvEulvY8UTr9FpFnucwb4UpprfKhq1UnUOnm3/eyKLX03NEx8h
	BPMkZi2YAUvSjQg70PTvqMsdhVl4/ZRI7dJN/ZAsuFZnIl8apIP1U5wUi4vV/2Fh4aPWDVOQ5Sd
	VMH2QnRy/XNHYp+8PchvbmypDwGAUGeNkQIg0xaKgxHODSsk/JlXingkQU2HzM2r7+RnzNIlwZx
	xK9V1K/ey2GkxYB+6r4BjfVmbt2sKekUYfc4=
X-Received: by 2002:ac8:5dd4:0:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-519feded2ffmr149495161cf.4.1782207836471;
        Tue, 23 Jun 2026 02:43:56 -0700 (PDT)
X-Received: by 2002:ac8:5dd4:0:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-519feded2ffmr149494911cf.4.1782207836017;
        Tue, 23 Jun 2026 02:43:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be32083sm4445915a12.14.2026.06.23.02.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:43:54 -0700 (PDT)
Message-ID: <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Herman van Hazendonk <github.com@herrie.org>,
        Antony Kurniawan Soemardi <linux@smankusors.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX5g8QTKibU6ye
 PmcUsbNwN9jRKqso5Cquv6iHXj1MPrc5skEu3WvesTMj04tvNTmsR3zE20BSm5/r+ynjtEwveHn
 1n+2vGNniK4fEZO+xwxDvOCwi58vroDKivIYobYFEnNMTWDBgLE+u7r0aAGh7TK6P47lc/vOVt+
 ifkJSbwYAGExzQYxBYKdK+Mqj9IF0vUJCaNB/0nUCVZJ1P5rvST1my0QXjDd0lP3kXuzTQnyWHr
 vux7nFih8Ge5wwF6GH9OH5liGITwiJctt9IJVH1wghwFSqS8pAXpJ3rMhagWUv7ZY5VDGJH8u6W
 Otc2LepvKuI4VEX3Z8lPr8QJdFKWejH08qjBiQ91y37u2cKachMay5yjRiypcvKdROCh7Y082I0
 xAnLI4Pu5EZEnKJgYIB45V7ZzAgnA2wSqaoZRQNy4dgMk4UE9O8SgG/imXuUNTojTUft0SNO/gy
 cyaAh8qJ7HpRVp82ibw==
X-Proofpoint-GUID: L321G9r-uAAIzuPBEyYAOfLGLJ00PvKS
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a555d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P2uxe-tILJFHe8phFHYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX/FDqtZDkhpX6
 inT4L/qRD6SOBZy381qW/jsnSfMdGlbKrL1/ptdi2K3OOgGQY//+RF1h11MugDS5k6HF/zDWrB3
 qkGI0Gl+FBNT3xHPsxT+mCcjB05vXWs=
X-Proofpoint-ORIG-GUID: L321G9r-uAAIzuPBEyYAOfLGLJ00PvKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114139-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:linux@smankusors.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,iscas.ac.cn:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5E676B5E9C

On 6/23/26 8:05 AM, Pengpeng Hou wrote:
> The HFPLL enable helper waits for the lock bit but ignores the
> regmap_read_poll_timeout() result. The polling condition is also
> inconsistent with clk_hfpll_init(), which treats the lock bit being set
> as the locked state.
> 
> Wait for the lock bit to become set, return timeout errors from the
> helper, and propagate those errors through clk_hfpll_enable() and
> clk_hfpll_set_rate() instead of enabling the output unconditionally.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

This looks good on the surface.. 

+Herman, Anthony, Dmitry could you please give this a spin on 8x60?

Konrad

