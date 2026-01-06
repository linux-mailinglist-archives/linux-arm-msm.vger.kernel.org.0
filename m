Return-Path: <linux-arm-msm+bounces-87742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E59FBCFAA82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 20:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EE7631624AE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF1434E742;
	Tue,  6 Jan 2026 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4yvX6rb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFpStUAM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB1634DCE6
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 18:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724796; cv=none; b=FtXXwaNoz1yY/MVlo0eibpy3pz2Xbv/1xQc9pt3coS2gcD8q9DsbzkWcFpyDUGeCKh/3+ck81DfYOpTwbun4wfHdzLFOA5U7Ls6gXJf/VYldHxYiW3cwiv3HiHURcmgNbmDL8wpqzDooCW4DCWC3MJ1w2pFckMdmviSdIn3xNjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724796; c=relaxed/simple;
	bh=vKlsVUdQxCGhhqSHn+sFUyzsqvnvqu4sEaP/5KtcnlI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=rXYGMzASj8PBuZ2jHuf3RUKM4akV+y98aeLu5R1NKPSnReVsa/Bym55/kbzq2mLSDG0/d8rTqaIutt7ARo0Hc79JKaJz6z28KBsKHzZfb7gOJiNRWtCXM6uaKCsFIzavdohVSW8VEmeNeASGN7nQokbCZzBbxQs1f/E0MPPCyV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4yvX6rb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFpStUAM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Hiao44091260
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 18:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v3sc0Kk9a/EAyKJYmSpH3P
	jB2CQvRJNuX4XC9bOeKJQ=; b=d4yvX6rbLQKWhLvwcua0c++0/001fJQJZU1ox9
	QJlfmek6NG5CcmGO6L+FNjluFL7ACAzB5y3SY93C4Sbqomx2229A0p+pPwtaf/sT
	811LYiJHIpV8cVtcr85oqgKWlBAWNtV36lFBmHnvzHC0e6JEuN12QpCQFM+WldHk
	HmoXicV+fdM2IjVlIYtS89OtEYgeGQFvxGLmWtgZOIBg+lP3pshJg0Axd2nT3nPR
	1fGySrN4rBu+nz3+kDr2Lwc6iP+p4oOH7HmqFHVgDuR0docayYDMsWcCiOTjBvjW
	PDCgJZsq2Ldjnvzr7G2r+lc+cbLwS1/jWEvy+cEHWrEeemWA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun9k28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 18:39:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b0530846d3so503972eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767724793; x=1768329593; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3sc0Kk9a/EAyKJYmSpH3PjB2CQvRJNuX4XC9bOeKJQ=;
        b=aFpStUAMuO7eEzWMuW0L34J2Yni3VJBD1j5z7MGvN2yuZ/A/AaZHvcfAOYCrpwnwOo
         1sKl3pl6Kfah0/frUXl2Da+co6736+Lkk/da8Ci5d2jfsndbvy5jMtoN/co0S9e+jRv5
         gyu4SgtT4MWBWk1I+iuqIpDUZdUYqJZ3rr/krJYk0kPuRuWJV0dOxcq11cL71kdsaWoa
         Rxiin5FCBOQCcObvqZBcVURn74CIFUcVKh4g2hKZLK78l0frSloE2vtEWqskAhOFZR4Z
         Nayj9IU7RyxZp9v/VaAf8/K7wuIol/yiBiuB7DGFLSUGpBvV4klf8oI81FtRAso4oVbc
         KGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724793; x=1768329593;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3sc0Kk9a/EAyKJYmSpH3PjB2CQvRJNuX4XC9bOeKJQ=;
        b=OfgxXzV2qlAotZ2NtnheweQr4KRmFB3Xor2QvLzLyOs+mxGzS+G1+o/VgspECP4YsI
         PFl7NvjBW1Ru12dCQ+4MDXwD67qzwECcAcirNmdxL6ilJoXXjKgVF+T+rd1WzVG+RAkJ
         Y4p6qc98BNvw9PQdGPhefdIR+UgIIAkTqa+jb4jf0HvSe68VhVwLDGZfFlqQ8NBwhVES
         C9EFQod/jkaUHGOvFH1/grBcw/Mdp0mNW8Npd/iPihXpfUWHvz8JbCAQloTIwGYRlyTp
         UGzRe3jcSFBmp7QESADhNs/6Mrs5mlI92gyaF8NQNMQKCBDFJCEwH82f/S6nPZUKNPS+
         VrBw==
X-Gm-Message-State: AOJu0Yxhy1Dn39DMS3uw9Nrcgh+ebw58lShi4Ph5cRRTm4JsI3k5TREK
	LcXjeV/TegMaLLKQEkB7WPlKD4Y9pRhyhFLi99uSpeOgdkBbqgTDOnhkR2LvBcR4H3aITsB7MzQ
	+DGTu7pEVkxZgqP18njoAtfuZYBj+64yvPSPa5j9OIREBoygF+4/8G59jnHtRZcisAwcVU1e/Dw
	+/
X-Gm-Gg: AY/fxX7TF0zKCjLlz92pno3qJV82R9iyitCEOhSPcQAT3vJasK5UGun+jVbZFNK+Grr
	p7Ehvok6j6Toa43Dt0GgXMMgJ+t/6kmebxH2spjop0LiDd52KTXNIGvUF746g8EueOqfVYbDaPo
	F5Z2eLFw7KjKwNxn4ncIKpB/8vqiAM0bolE6EYOqfcw002q65eQSzFbKOUe6hzL4YGwwQoLgMPj
	p8GriAn2zZo/W5FxuKgY2jsdnDr+S7/HSYgyoJcMdvFFJL4LNfbC4t6+vUzCsFYDAOm7lE3ptt9
	vHk1UveCArkuzTBMAGstwU5UPEzWf122dyiJx7OS9td1X1yZ690RR7Dy4JcwC1UVN6qFDVHNmvp
	m5qwyezjOimfbpTWediYW7ztsz8F1ZectX1HTXnwo2SVCwQErnG7A9gEqfvmycQ0=
X-Received: by 2002:a05:7300:2d15:b0:2ae:50d5:bc0f with SMTP id 5a478bee46e88-2b16f91b85fmr2920008eec.26.1767724792789;
        Tue, 06 Jan 2026 10:39:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfhFREy9IapMkV7sWbkbBuBC8h4F8i4cfhoniI5uiyC+MoB2sNIwZdM7ceRADP+gPHbYRBqw==
X-Received: by 2002:a05:7300:2d15:b0:2ae:50d5:bc0f with SMTP id 5a478bee46e88-2b16f91b85fmr2919987eec.26.1767724792168;
        Tue, 06 Jan 2026 10:39:52 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706c503csm5359364eec.15.2026.01.06.10.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:39:51 -0800 (PST)
Message-ID: <8ada0f35-9663-4932-b7c1-53c00f3cdf92@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 11:39:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PULL]: Update firmware for Qualcomm AIC100
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MSBTYWx0ZWRfX+LbTXcicoaX+
 uYlDq2YXG+HUnGbnvj7jltDx3PdPA5maLkVEc1r98SU7kRWPK2CeExI8liCYavSDsxqmMn7j7Qc
 gCr1KR7ktbTFYcvUOqIAlr1Y83sTdN4bUmcKCUq7GvfDCJCytGpMpND9eCkHnJqYWATXhV7vPJu
 m/jmh01kh8v5ZTruJWXzAOCeJnxtX+KVJl3N+x+r/cDaxoagvGskGX4axnfl7Ch1YE/tUOCPC3c
 y7V1poskUB1xRKRkfEkTal+wnMmrdpBLKTRCnlhKLlsic1BKA5dOsdsR7YnPB/Dv/FL8Ei0cQNF
 LEz9HtQz4PIZrUN3FH/mLnjC1vYhCNlNBXfrWjNFluK+yEPIR3UMaelKWoQDLymjDMYe1O3zXq9
 i2tMdplnoK1/sadHjaaPC3c+g/ZnISs5v5JeNWDlaOG6qLAx1t+3yvnVCwFeliCQv+3zlTGRy/O
 qhxjETX9nsFgcSpLfkQ==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d56fa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=54DGScOwRhmUFBVweLsA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: WXn_tgkpoq48mTQR4A6tX0V72PYkoQBa
X-Proofpoint-ORIG-GUID: WXn_tgkpoq48mTQR4A6tX0V72PYkoQBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060161

The following changes since commit 61a76356fe7fc29479fef362abc1f47bb40eb52f:

   Merge branch 'upd-wcn6750' into 'main' (2026-01-06 15:37:35 +0000)

are available in the Git repository at:

   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_7

for you to fetch changes up to 3ff97fca3cccae8c68b14c3bfe9785f25287bf1a:

   qcom: Update aic100 firmware files (2026-01-06 11:25:03 -0700)

----------------------------------------------------------------
Jeff Hugo (1):
       qcom: Update aic100 firmware files

  qcom/aic100/fw1.bin | Bin 2180920 -> 2180920 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)

