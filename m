Return-Path: <linux-arm-msm+bounces-113999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id afMdJxc3OWrIogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:22:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDE76AFCBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:22:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O9JgCR8Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T+8hf+0s;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113999-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113999-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3881D305C5CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D2C3B2FFD;
	Mon, 22 Jun 2026 13:18:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CFE3B52E4
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134326; cv=none; b=WBFjYL9xfISvxKAIXwrAuq7abCzd0J7fgOAD2DbvY+x+89Q/edaZeGgIWodgAyZ+fxS+k9jca5HLYzU2Sh+DNd7araEgiK2DdebcleBo0M9+NuzXnipS5hWiGEtr4MErZtlb5fWba/mCHswcXTEbh/WpTMVlVtzCdS7th1CD3v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134326; c=relaxed/simple;
	bh=ibXDE7QfYBh/Y3uVHmqj0Doeaz6ovE/rm9hnql1AQTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r6S8oeZ1Q1Eo44qAN/1ZQ99vexNWjeSAXpfcjP5t98+/IAQmFPSvljr5fkbs0bR9KNGfitwr3XNFZv0jSRVnL6CyjXybYtzxUJFoAFwtlxzV2k6bB9EDF0CW19VXpAK0LM/tO/DTH5e3DG15oOy3TLcd+jS2bNKljXPQH2MK3oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9JgCR8Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+8hf+0s; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGQku1364357
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYeFtj5+lSRAHCG4iElDvXo9CD9HgurpDRFCb9pO2Kw=; b=O9JgCR8ZWiKWEnRi
	C+q1nM+hqtK/JwkAn5RaB4E72a99WNc39oHf3XSBcwyPI81U1Szoj4MeVDEBgX+a
	SUX2yoL9ivwkcjDylal3C05ejjifHc8g4EESOchgbv0u5cFQrNAdrgA1N7mZ8ZAe
	PlqdYEZFlgEtHIxw23M3clzICYCkzbe5WQyg+4lJcY2U66A8QZnUlaCBgHINMF+I
	U553Ec5x3PKt9UZ7xL6VlrXFuHnb1pjUZNWBu0+42Zx6JYYYNJNiYeq+EoboSpSq
	bOEEXYRj576S8BTy0fkey6uNB89tkwbKbqtynlPpov5z57xvfkWgC6GUa3kUDlWQ
	ZUPa4A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5prad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c89de84f33so6579205137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134323; x=1782739123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYeFtj5+lSRAHCG4iElDvXo9CD9HgurpDRFCb9pO2Kw=;
        b=T+8hf+0sIa3+q661hBk+4iUtMtV1Rs+ThxjrUD6whqzU3gKf/mdv9n3uJ8pt3mqPNm
         rCOsUnvO0zHhNUDzLgRz/65Fwa/nNQBQkAs+wiyiJK8QE6fqQOAK/3ginsJG0dXJ3pEn
         uiUxZrVjeJWQs0N8CzLEKOBZmERhKq1mU8aiuXT/MbAoyEY+Pqf6GxrvIVfQ4FVvQpeu
         SfgCHGJvw4itagYXhmddbyFhFNEimVLppRIZtvRTeTX1739c1klSC8NQTda+5fEPGMXm
         gya9pu18pV3f28Y3kffkDdDtNT+I1B0K98f+U5h3Kuk0mj5FgpIq3VjtEAUqmg7+Oebq
         VAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134323; x=1782739123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QYeFtj5+lSRAHCG4iElDvXo9CD9HgurpDRFCb9pO2Kw=;
        b=YzWrOpGeCVJV9UHRZmPjdIO/yZjSMeSAuLGNe0PCGhcxb57dikeoi41A3vhZEo8+gc
         zXthqgvgxY0Dq/79w4h7h9nq2X3S6BWvYXd+mxDivatiIM4R8zv6R+RDADvexLFMM9sg
         4xtUnGFm4W9KlqtileHWA8A6ZJXUqOddDPHWvyYmdbdIupSJXwvSqyGDmg4Bts1viZEr
         vlgRNRTfr7fsQV52LrN44HimL+TISJrewaLNdO+p8PUqViPRGEpENryPquKk3lM1aANF
         JLxn+WL23XLnjC6CMzcuCq8R41BhkgaYee9xnRpw5M5KHTkw9Nnp2S7mK8vkIETPEZNF
         qaDg==
X-Forwarded-Encrypted: i=1; AFNElJ8sB552bXmsfnZzdyNsA3tgzmFs4fG4KDnLkfS9zua2SlNa4C5ffglJjVOlavdchH8cpfR1Lz1bUqidGsg/@vger.kernel.org
X-Gm-Message-State: AOJu0YyHp2P60gBKv/AOsPTCMzTxYJ+Lsu/j1FfNcQxAOuGDh8yw4NIZ
	QTdU9TfMEZvBb7LIYl0pbLxibl1KB6cYJ5uiAqSXth7HIh1Mqa27ka0/nSBImoo885xBOpFA39y
	2nlUDm6pjLDQ73RI0FgVFXffB29Rz2vHVNHySdJyfky5mLCafiwbMrasKsrqaglwG8TB8
X-Gm-Gg: AfdE7cl2Yw5g37Fj6yVhzpVXxuMPZcrZOPhJXHQDIM0jRKAIKJo45kieHrc4EWlp9PI
	1JmKlBdiXPDIfj+AMKrtKIsfj+urMX5DesuaVAO5k1lcwoLNe45tf7tvfy9+9k3jLzWDDsNjzQh
	L/qCyqmTaz7XwuRXURH46K3VwrdfYI6LNFGX48fYxyu+WaJ9xSZa79L+9sh5IMhXi4lD8fYIP+v
	9fXK/wdRiFvpkITtJZUP2NSsRsuLRl6kmiIxKuhSBDqWntAuQ/jUPyuQLBhbDcpTcFvLtSbURXy
	73vp4kq0VfGAMYeHAiAyL0ijIVJdsH0Tlq4sH90CVrLYwEYiwxGh9pSSXwGGGVr0vIU5fgY2979
	LujH8/B40J0kMzxhDK/bfbOjTZj+KZZnxPWjNLhZd
X-Received: by 2002:a05:6102:f0a:b0:631:4c79:b1d2 with SMTP id ada2fe7eead31-72a041bc004mr8846080137.25.1782134321137;
        Mon, 22 Jun 2026 06:18:41 -0700 (PDT)
X-Received: by 2002:a05:6102:f0a:b0:631:4c79:b1d2 with SMTP id ada2fe7eead31-72a041bc004mr8845877137.25.1782134319621;
        Mon, 22 Jun 2026 06:18:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm294083835e9.7.2026.06.22.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:18:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:18:12 +0200
Subject: [PATCH v4 4/8] crypto: qce - Fix CTR-AES for partial block
 requests
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-qce-fix-self-tests-v4-4-4f82ffa716c6@oss.qualcomm.com>
References: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
In-Reply-To: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3299;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0wfULYDcviuc8Q42MEg50uyXBEFkn0s1U0Ju00N6IK8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOTYeuPvPYicsboxDS+LCrLJ+00/S4sJ6UxwtU
 eaNzWBJfO6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk2HgAKCRAFnS7L/zaE
 wz50EAChNSKjVXTNHismiE0h+1JRQj8k9KP2HpSF1RJrqsSRILb3Lzx2iGd78DPp8td/wehXczu
 icOfWt2+3+TpfyA5H6Juy25M09YJcpc5sLVFwxLE8rzTZLcSZcjcmI3/jwI7z4XlKx/TaKEuDvF
 1KYZawB+MqWiyCD0ABb104W7g4RYRK5Nf1gYQUhAfAFoV50utrT/ImZ7Mpm7mHEEpqxOB5H6fMj
 4s/zJUQqWk1HdMtGLftsGE7PoZIVw4qFxOZkwRKzTmznaZaY1ayagmCpib6cdA87Pkwhg9rYdtA
 8p9jrTsTGq2KgB1iYxrku5lcvySkNXd6Pd3w8AxDYlLF+pgO+b1kCLAOKPqgJXWrxppeWkbHAiU
 Pn2ZrN8Sq5CyqbCE9kotTcPSmVR/9yi0ZFvM//7Aj4qbAtgEzNkS6wamK4d87+Gm71rURsah/jJ
 5yDn/RyrLBbYVl0Vs09iZ1aLNQ3huNwkXvszlRrIsvLWvrBASpDgdpeH4MiA1Qf5dmidcl54el6
 ocbkLpDT8IJGHs3luhuuOCgY8hDqr0tBOtpOo58KCsvgeok9iJ5nyCOjKTK8+TSLkazhalD2LCc
 fatDEpxBqHl7XP7okFPKHCQm54WtVXUv1pe3KtWFxfnu1OTBknRP6NX98NmvRvv6p9/RaGnAGoo
 frqYCvxBB+daqcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX+1pxNLWqtUUi
 F18+x0etPX3pigu9it2GrENzrkf9Z0RLHb8ZhM7vqMwpfWW0CjapJOwLIU1MJj5Lc+ZWXIX1NH8
 58XyrN07fH9gpCOIChbIsJ9fri1kxGX3qN89IxWpwrbJ51TE5dQVl2x8mXyIcLYUYj+R56gZ/Cc
 uTs1x/Htih5FiCmINkSz2WEeA993Aasnw7diRnM4EFl2IROHDbVo5a0+9+hMdDKRjtA9LCVxgOo
 Pv/YKQUBUqr1pU2uWujrEz8RYOLvjy0pxAFObQU3HPY/YNNkDaqbSNcQknLgv9XH8Sf7ZDQ55pF
 UEXQLJHMZGiIQ2MaRRyYbcxUHlFsFqPYQeCVjmKdb3zvDKJwMFHCJlYQvNLYC4r2EbTW6hV0/iG
 5RSX1PCjQ/S0LHb6cklRdnnTKcV1outdeuM2BbQe7k5SaKzwkVRZU4tjUsmG3eoMNBLacg4Swcm
 e6EGnQ8ElEdqVq1AwQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX3E5ZeVEbS0i+
 LeTWKi4aQgp2h82VKvo4mVGRTILXlsWDiFZwC3DkWJMGHxxdHgCSW6fJtBAbHvNi4lPtgFfV65w
 KjJ6qN+t7Q4m3N2UtkQ0jnN8Qq7FbCg=
X-Proofpoint-ORIG-GUID: -QXndSPaUWmeQAOOgS3P9KDwef1fIT5j
X-Proofpoint-GUID: -QXndSPaUWmeQAOOgS3P9KDwef1fIT5j
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a393634 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Y2NcAOke46LZopEJyX0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113999-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CDE76AFCBB

From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

In CTR mode, the IV acts as the initial counter block.
APer NIST SP 800-38A, after a CTR mode operation the next unused counter
value is:

IV_next = IV_in + ceil(cryptlen / AES_BLOCK_SIZE)

The skcipher requires req->iv to hold this updated counter on
completion, ensuring chained requests produce correct results.

Referring to Crypto6.0 documentation, Section 2.2.5 says:
"The count value increments automatically once per block of data (in
AES, a block is 16 bytes) based on the value in the
CRYPTO_ENCR_CNTR_MASK registers."

QCE increments internal counter register once per full 16-byte block(for
ctr-aes) is processed. In case of partial request length, the hardware
uses the current counter to generate keystreams but does not increment
the counter register afterwards. So the counter value written in
CRYPTO_ENCR_CNTRn_IVn later once read by software is one less than the
expected value.

Crypto selftest framework capture this scenario with test vector
4 comprising of a 499-byte payload (31 full blocks + 3 partial bytes).
Error:
[    5.606169] alg: skcipher: ctr-aes-qce encryption test failed (wrong output IV) on test vector 4, cfg="in-place (one sglist)"
[    5.606176] 00000000: e7 82 1d b8 53 11 ac 47 e2 7d 18 d6 71 0c a7 61
[    5.606192] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=-22)
Expected iv_out: 0x62 (iv_in + 32)
Obtained iv_out: 0x61 (iv_in + 31, partial block not counted)

To fix this, just increase the counter value for partial block requests
by 1 and for the full block size requests, don't take any action as
expected value is already returned by the hardware.

Cc: stable@vger.kernel.org
Fixes: 3e806a12d10a ("crypto: qce - update the skcipher IV")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index e1f69057607fac36e8b4bdb5dd9e62a2aabe5f50..35ddbe03cfcd75db7599a5754e4ff978f3528105 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -33,6 +33,7 @@ static void qce_skcipher_done(void *data)
 	struct qce_device *qce = tmpl->qce;
 	struct qce_result_dump *result_buf = qce->dma.result_buf;
 	enum dma_data_direction dir_src, dir_dst;
+	unsigned int blocks;
 	u32 status;
 	int error;
 	bool diff_dst;
@@ -56,7 +57,21 @@ static void qce_skcipher_done(void *data)
 	if (error < 0)
 		dev_dbg(qce->dev, "skcipher operation error (%x)\n", status);
 
-	memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	if (IS_CTR(rctx->flags)) {
+		/*
+		 * QCE hardware does not increment the counter for a partial
+		 * final block. Increment it in software so that iv_out
+		 * reflects the correct next counter value expected by the CTR
+		 * mode.
+		 */
+		blocks = DIV_ROUND_UP(rctx->cryptlen, AES_BLOCK_SIZE);
+
+		while (blocks--)
+			crypto_inc(rctx->iv, rctx->ivsize);
+	} else {
+		memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	}
+
 	qce->async_req_done(tmpl->qce, error);
 }
 

-- 
2.47.3


