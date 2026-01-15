Return-Path: <linux-arm-msm+bounces-89154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F4104D23310
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EB9830D1856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFA2333730;
	Thu, 15 Jan 2026 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERbyeOQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bR1mqKbr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AED0331209
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465747; cv=none; b=iqpLglE8eBIEGaiVhkpXOIM0eAGSmsfrRpJBsW9scMl+lSXlR7GXlmRIu8GuFqkbah1+s0/V/Y5vS5piJpOEZnFb3/TjAEz6r1/54EHSMUz+zAhoaNz41Gdb64QOWMBXcnfbpN/JCJyG6aLmDtJ1l0pNA771vctBqwR5r/lTTaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465747; c=relaxed/simple;
	bh=gyR4yEil+LqEWMhoqcY6Ididt7Bne1pv7XO5AVuN7Fo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AkG3tXUhY8OaFl2Ytey2PXA6/psmFo+rugCyZ1FRSe+kgZlhT5zE0dKR4Mc/QbwptVF0YlKJHXKMbztBlYTNqUIBjNG+JkThw0/IUotQA6Jqy/f/10gOpy8WTvxSdhFsSR+/llrLHGyOU6963+MzHeORu6Eib3Nv/FBJ0omGV+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERbyeOQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bR1mqKbr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6gI8d1172623
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8wi0sGLhxJVBWYng52GyE/X8QfV6jCwL+3c
	zaujsZWs=; b=ERbyeOQraVp3bYKkwM9mHfgiFOq/Q8cm95J0RTeZTfZ3y+2KoYm
	c0EsFrd+j+NkRi0NaANa7BGEJXhfLKwla0G8X71Erf0QPrHWzdQGCOIRJZG7FWjX
	NY8mPaqFT9LNAz1ZLkvrjXpwrhNWwEbxxQ5uUD76H05U7H2TuEnHARSO3YjDTFIN
	ODUI9/GHY90VnliOse/tHQBc71vPzx1ZgPdbsxIeZW37xGuf+FvRQilJTy4NtZQu
	Oe3cGD23VIC0lZmNe6hFO0lmSCmeGqDsCAmkP2fWV8fKiA02LMMGOH2K9SwB9eBM
	dEh3wMQYDVUQGFvA+FjOQWyyOdTdB6L9mrg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84a6d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34a9bb41009so726654a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 00:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768465744; x=1769070544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wi0sGLhxJVBWYng52GyE/X8QfV6jCwL+3czaujsZWs=;
        b=bR1mqKbr5MxcFTVB2BibwA9W2VLTy0uUk/GXrCFxFDjFaPet9uaNNKcnvVU1ofPZDk
         WaIpGxIa34ZlGfN/pJP3dpeVWZWV73Wnzk0fN9OZ3fRKWUCCFB/RHp/Hi6moKgfYg+tU
         ESNc9iO9N1PWagW/OoCHIbBxZiAMxhrDh04bJfcpZJBu8wHnymOhCikc7XanzSJn3c76
         rXkbUnfdvvg3ebj8e8M5gWOlDFIAyolcq5UmjCoG4cqAe02TNqaIgWqmfoFcVBHK/cPG
         PkouTXohgm4bjKyY14SWRSpwZhtcFPF7n0+yiqwkm8j+A9SdHR11ql33ThYIvJxQ2AD3
         zPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465744; x=1769070544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wi0sGLhxJVBWYng52GyE/X8QfV6jCwL+3czaujsZWs=;
        b=bCnIdVQDs6XmYTiJmYhxmN+MSkKMN8D+ENUq3DTbVtpX44M8keNmvsh19EcgTkqi+0
         KJwnwetsJIbqwD+i2hnQwpkpH67tQgMm02OME+wuSWgKdXLT9YdcClFsRgSVTD7Xfy1i
         eYVExIAwKciPGtVd5ZVp5lTo13Cay14l/5a+gXf8Pjzof9oHMo7UVxn/lYgV6ycFWJSI
         OGdP8MORG4KfOMx9MJqDxtCKvMfTWMniU4rp9UjGWwiLWFphqRBIFw9njwIZ9mH4I2a8
         OCAP3e8gUmcKrn7SfWA/rFeWxgQmvseiDWni8c0W+WI4INbjy9GL3uCkffXqpeekXchH
         TfBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8kqXKVJiUnQ21v4sqvlqjtETYra5ejxhpkwywYT0WQGHX6YcEQyLd9f9gj4C+dBg4INfpH0qMlglTJGF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhly4OA7BvCdR/N29d8bA20SVESjdwvg+FuvcpyumjcojrH0g3
	8FuAg8PehuElAoEFwVXAycQyg6QW59WjWZoLhqG1wz7iEIZSYFxgh/DN+hni5dtnvehbYmrJZvK
	c+XIMSvIAW7GrSEmIv9TaM/9K+LY+wFMEC/NML46QxX9s5Du9sD7jS0l8YoAvJcoZDSHF
X-Gm-Gg: AY/fxX4SVMkCufgDzL7MXp0gLwsHD/pXAsapCrvMSl2IR2v5EuWtpO/W27m6s8PmuZD
	bVzxJjgt37fU2IFw+cqC6riZGjihR1ozp1bngFNfL2bUNVLQne828QEgdLkzIEDpr+m//Ho36Xh
	DRfhe2iuHgesyU8EdQWKhabLk0IsWEbZ54g3P996itwdjSujgdqsFz0v7ETWYYb6XMzHW8tH3C0
	ZwGx6oPetY38UqaecE+srHu5DitpqinEtDPuUX6GJ0vf7esI/932gYQcowmBSVaBDa/dOEfbjvz
	SQIU1LZWL7ViXx1yLJp/NGLhJRVtOYlen1kEbdBx3Ry0yOGL5nUqMrWEoip6/pYFaWgTr8JhAKX
	6joQ1RC4D84DaD9hin3mZiuJ7q8n/uljdsVLB3Mo/
X-Received: by 2002:a05:6a20:7f89:b0:347:9ae1:cffb with SMTP id adf61e73a8af0-38bed0d2c3bmr5834708637.24.1768465744453;
        Thu, 15 Jan 2026 00:29:04 -0800 (PST)
X-Received: by 2002:a05:6a20:7f89:b0:347:9ae1:cffb with SMTP id adf61e73a8af0-38bed0d2c3bmr5834682637.24.1768465743922;
        Thu, 15 Jan 2026 00:29:03 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e69d1e7sm1773296b3a.58.2026.01.15.00.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:29:03 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, thierry.escande@linaro.org,
        abelvesa@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        ekansh.gupta@oss.qualcomm.com
Subject: [PATCH v2 0/4] Add missing bug fixes
Date: Thu, 15 Jan 2026 16:28:47 +0800
Message-Id: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfXz1U5ZdhNJMqp
 Q/VLygOw1/AH6fDWYx6SdZPXFqH74eCKN4cgc3FFknYVEwzY+1Xvg2i+gRNEq1cVD+jge+E6IeX
 22qwL0094IEyod2qAgErg1V8iRe2o8koVxzGYsiesPznuTWdQalSm8yaA4cuUkIZesCWpjydX48
 5TF33aCXUzZhvzBYMKUNWYEp0Cu2rynrLQCa8j0ko09Y60Df1uNDSKVwwG/DgAqywq4uWHDxiGN
 o8ty1dxatnbWX9EwfdePPelwSwFByPiBLceil//UoFiEhhWeO4gXl78lmFyhcleYhDhEpoDYkES
 2JOAVc6LK7pecZx+LaK7lByNgtLBPYGwR8hZ56scVT3+Up4/UeArsYeZKIy65nYrH+XagS7PSqu
 Vl1SaHqhqhEWV5rqxUOhaQ235kfVZQmZAHnNznc6qoSmkft5VwnTmLOfzpEStVwHUmuRipLVLhc
 3Jr2Gl6PZSzfxZQGhlQ==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968a551 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gfRWkJ0A9WzxxLvKSxYA:9 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 23d9lsVzfkLmupdQrQjgL02v8uJ1wpOS
X-Proofpoint-ORIG-GUID: 23d9lsVzfkLmupdQrQjgL02v8uJ1wpOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150057

Add missing bug fixes in memory areas. This patch series carries
following fixes:
- Add proper checks to fastrpc_buf_free to avoid potential issues.
- Add multiple fixes for remote heap which is used by Audio PD.
Patch [v1]: https://lore.kernel.org/all/20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com/

Changes in v2:
  - Remove the if check outside fastrpc_buf_free
  - Store the spinlock pointer in the struct fastrpc_buf instead
  - Allocate entire reserved memory to audio PD through remote heap

Ekansh Gupta (3):
  misc: fastrpc: Add NULL check to fastrpc_buf_free to prevent crash
  misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
  misc: fastrpc: Remove buffer from list prior to unmap operation

Jianping Li (1):
  misc: fastrpc: Allocate entire reserved memory for Audio PD in probe

 drivers/misc/fastrpc.c | 135 ++++++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 64 deletions(-)

-- 
2.43.0


