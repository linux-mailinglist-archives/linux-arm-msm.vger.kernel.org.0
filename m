Return-Path: <linux-arm-msm+bounces-108142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMs4Ca3aCmoq8wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:23:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A7A569A37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D9BD3006791
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B170F3E5567;
	Mon, 18 May 2026 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMwsjLAc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4iqGGJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477983E5594
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096235; cv=none; b=lkVRIvpy1ok6EPYHjmd7R358vNJHXcJaCj4FdSfJlgZKuQ9bXgetkrpqU2JNwq2MjhgLgqSCx310bZ26zm4+jYXtZ32WXv+4yP2KhPoIA7e+K+s92DR0jjgwXMqVdtYqo9OLLOe9OQ5PoJOQYIQZmXoJcrvb4D08wQZ2tauBqik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096235; c=relaxed/simple;
	bh=Qk1RF0j2fXjG7msuvwGgj9rC7w8Kju6hH5lAoje9jkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bp4dJ6N4+onvm6aERDfneomxGEpzOo3zoQgvkk+GI23TDzn+PpiA+qgm3laF9tQytg7iNGPll4vLf1r2zoTfwDCgkfX9/+08VqUOTWWCmNWhtm8TjjXt6oEiQRIiUHqaBdjFoZkjitVCM6t01nFTTIy6zfILSd7HmovVQBICRO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMwsjLAc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4iqGGJu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6SQwB463057
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fVCt1ewsqxmbeuzjGzYk2sS2AaB10qKy1b4
	MJjqJYiE=; b=HMwsjLAcugXMDyxpJMr/9FXNbLh994jKfq0EWIPzKGS3R2QpplB
	6BPFzGMY5LpNV4KgCl5SSCrQR+Y516SNU0vJHqH0sTnd4V8bQJ1bH6h8i0l22os9
	+RQE0bKYOauaURBSrJOyvYIunYBkOBTO++Qc10rvlbNTTOHicmDIyBq+z3AH35E6
	aKnXNl/NvbEVwCOG+bi+V638Fxsf4hrS8B04JE6IoAQ0agpNkkDKXxrpgJDOd8KQ
	5MSTzhEMw1GGVmmyBKgWWDBgYUDjxpOlCt+HM472LKGJ8/f5LOcMFXhAjlHETXjZ
	E/zPYsHlrvs88iiseyvvhRQa2kyj+xDOnzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6wpd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso57979121cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 02:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096233; x=1779701033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVCt1ewsqxmbeuzjGzYk2sS2AaB10qKy1b4MJjqJYiE=;
        b=S4iqGGJujZgyHCH7RMJB9AtVnJ43xmRj3G789fU6sTVPrSW0IO3OqaeUzzFCZTM+cg
         BrEEytmv/98+0HuDAi6BF8yBm7Thlk45VTbIWaGCh92l3Ii3h7ZfHj9c51W30i3DNNxZ
         xInbMrSX8woEvEKyLXpj7jhtjDt1Vl3b7vkeeiOlw8DSdnLYrLYwLmp2rYIVHfSKXBFY
         qhlLhbMc7QZeEmJiI+LsnRkFdK3vsVJo4PHDc2hf1EkMnQYHU7EUjYGEylDdET7fG6vE
         ojdZvYtoZNMRXyPcwOz7Tf1uXsFBgCrHL8DWtHnwwsxTO5ikKwdqt7LH+XWi/FPX0+yG
         Wr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096233; x=1779701033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVCt1ewsqxmbeuzjGzYk2sS2AaB10qKy1b4MJjqJYiE=;
        b=W2CBJ7lQkW5OykhXCfgSlKUC9TItySk5P+n340tuCx96zaW1FXM55xDeL6jGlpcvp9
         9a4mQ2zH+mZJiHVeFBoDn/lVEYqLkR4sYNNcas0vK/kJhHowBWtsFCRTDxp2iOcMmdjC
         L6ca97u+ueO5SBj+33oVNio80BaV76veqgamA/4ZiNxUMK9t+efGexuIhv7yI1AmedM5
         cM99KLnASdf4/vv87g9AGg93qy0vBGEgPG/YEvZ8xp6SSCfWZwQ6unF93Gb16KKVibC4
         1Ly/MENZSxGZJCMqLd5Dv2oOjSXHbsLBVqxEyq8BWoQ9IeFD3x7sWYmM1yqoyz4q63lu
         pxWg==
X-Forwarded-Encrypted: i=1; AFNElJ+awwst8CmlfJcFD7/xLnfIzc0bsGmgsouLv9ylw9ya2sFaXY9RqbyaQxH+ZzFajl4IYIiFjd5BSYBPCxrQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyTU9yw6BFCGKcYT8BTJgqyakBbaodm6lyUX4cWWUOZHdgoyE3b
	Fpx7mYpu5Eafw3F58Bm5q/MfEC6VrtWb0bF2PgnjyBc9kQb/yxHwfS0E6RRfG7/SS6JTxhD8R1m
	sAo6MdfyJowovIa5MiUOu5SxTrAB0SyU9HGP4eFxdDPmDHxwAq8oks3ofQ2nyLghjfe3n
X-Gm-Gg: Acq92OFCSfUh0kEO3WOLdT0Zix5vgyYMMmiNqa7mcO0tTG+VKNWLhkXZ89nvfVqMnGI
	IkZHis/1/864THqzAj56gJPH9itnSJSUgvLkk6+KeshSUHDNkcmZyOW28TBMRk0T0JS29GwrcEN
	xQfCeCTuQ960qTe0dWWrWnE3Fn1/CdIGAHVngRoBH9YpmKklIqC/ytKbnHlZKnlaMcf+s6ZkvQ0
	jOb80oOnqIz9WgFtVSNKmSo84Z6U8QaBYEMEYiUC9ZJBvJtE5aYZpH/IR5rRHMF2OEL8gHv9Hb0
	x2RpZgyTgh99NaQhWmYU3Vt+kjw7qHaYHERBJZUj4TYxcVSF2lfgs2zTidF5uCt3a8pQa5nXy41
	fV2HClQgU+qA+WigO0cUbRKLuBw1OVex/hZv6iQp5L/BeBTdyhf0qabU=
X-Received: by 2002:ac8:5996:0:b0:509:35d1:ca3c with SMTP id d75a77b69052e-5165a007384mr193942301cf.5.1779096232704;
        Mon, 18 May 2026 02:23:52 -0700 (PDT)
X-Received: by 2002:ac8:5996:0:b0:509:35d1:ca3c with SMTP id d75a77b69052e-5165a007384mr193941821cf.5.1779096232132;
        Mon, 18 May 2026 02:23:52 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm33265900f8f.26.2026.05.18.02.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:23:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/5] ASoC: qcom: q6asm-dai: fix error handling
Date: Mon, 18 May 2026 09:23:42 +0000
Message-ID: <20260518092347.3446946-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uZvqpXbNSopDOy0037pkf4SAnUZKiWQ7
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0adaa9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=k1xjn1CKF53Gohu9egMA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uZvqpXbNSopDOy0037pkf4SAnUZKiWQ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfXzSl5aZ9SCbk9
 CYCv+DtLNMs8g6c9tJNqkNGgTpMA2GKnl1kcU0or2nUewyk2XPmJVjYcipfhnugM8gs7HxxFqWI
 JFKV5Qh9Y+DabPNGXT2wQbgI9v5BukPph2DTrSN7BVm3ESXh7Hp3Qgl8pLEFbZHtNQIrJ3n8vYn
 txmSRpdcPEwFysaVuM9PSRF4+SSxm3/1UHlnAk21dTG3vguGi5J8df7wenGLnfG4M/POY4W5dyZ
 N184M9vx3exfX4NEMCdLw3tDpkCAn6JnoIgaLqSCaUf0FW046zaM97kXcySFWFzGzIuBZlsrCv4
 LAtwSIkEdzKq9UyQknCLKUzzbkdYNl68yO5vwWMwESKdEqaBga7x5RDUSHF5GgU7yQlb1jvGJsA
 czS1eqscN/wBmyj2vNvfJPU4lCSGxVX8felMqQ6jOyA+PeLEIACzgah9zvEWWj9aK5o7u62r05j
 vdWsaZfMOx5yNC99/EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180090
X-Rspamd-Queue-Id: B9A7A569A37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108142-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oldschoolsolutions.biz,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Here is the set of patches, that fixes one of the isssue reported by
Richard Acayan, while doing fix for the reported issue, found various
other issues in the existing code.

This set contains some of those cleanups along with few trivial coding
style patches which looked uncomfortable to read.

Patch 1 should be enough to fix the issue reported.

Tested this is on UNO-Q.

Thanks,
Srini


Srinivas Kandagatla (5):
  ASoC: qcom: q6asm-dai: do not set stream state in event and trigger
    callbacks
  ASoC: qcom: q6asm-dai: close stream only when running
  ASoC: qcom: q6asm-dai: fix error handling in prepare and set_params
  ASoC: qcom: q6asm-dai: remove unnecessary braces
  ASoC: qcom: q6asm-dai: use pointer type with kzalloc_obj()

 sound/soc/qcom/qdsp6/q6asm-dai.c | 48 +++++++++++++++++---------------
 1 file changed, 25 insertions(+), 23 deletions(-)

-- 
2.47.3


