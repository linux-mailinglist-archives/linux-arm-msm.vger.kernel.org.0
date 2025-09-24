Return-Path: <linux-arm-msm+bounces-74784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F616B9CB47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF9F4423963
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3631822422E;
	Wed, 24 Sep 2025 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yj3FZfxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EDB189
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757606; cv=none; b=Bj3TRNW6AseJ/n23jeYpTu6cvaj6ClfAuDwQhBO7BoRsAsaGuuPxSzQJ7C+YliBRTm7mMS0e6RclyQKsS6El0xigoeNDm3sRohTt1AwKUjT0gRFpM8gkLkd8gWFKVytjHZS3i2ISzInY2YNqZhG0QfUfiv2zsFIB0fHuQKyAoYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757606; c=relaxed/simple;
	bh=j+o1N+A6cz4DNX+PHP8QLZuXZ4/y6YVjvv721Z3nnPY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OOjsbUJ1hz2F12vHZmHaT7RaPYikcK/lqMgrXCIC0lxUarF6Aj8mP319i7vIJtZoXa3gq/Ta66RxqptTmDgIelwwSUIbUAfyGuaVR3ntj7C+0hpQtjXlYP5F0TY6CldALufhinErB69a9pQ3rj4v7uaneVqZAVdGyYz45Y3OUOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yj3FZfxJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCq7nX020897
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dkr9LBIM7L/Tb1+wbxP+5Z
	hY7imalm4QZNmOXTdv8NY=; b=Yj3FZfxJh/3w0j8KbM2OpeHpueRIM/67jVCOnE
	tHudpFDdhzm0G0Ip0xDdRIV36cY2vLgX6H9/zDyAgxMMEWeDAnLLkcgwY2Y5TGPx
	D3RutdbNl2bp1msAqrCSJtzj1Zdb6k1H6MfozpqaxvkZxKU6aq2tCZP6O9SIG/fP
	bIcOE3MxswB7z8bI+rg44W16etGp/ewW/4MkD/xdbiI/GgcH6XFamLGOzmLUBNXF
	mDRJgE3wTZwcZAIJQPQM5N4AYIsgw8fcduqQjslbo8YtKmpaQLcXgbwkOfT98oCK
	zBpwUphMxh4Gqkn3DSd1uInBG1G/Dwyb1KZsaA4L2WZoe85Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy9y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:46:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244570600a1so3490735ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757603; x=1759362403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dkr9LBIM7L/Tb1+wbxP+5ZhY7imalm4QZNmOXTdv8NY=;
        b=NFDEXInMDEv4z6yhYZu0H0ApO5t0/2br3L2hfPvwu+W4HEcezf1rJTwkXjWssHkO4r
         xpVK5C6fnuhZZYl7nAsRO2FbFCkWnCnqo0xIjymuZh7+uTNI/QFlb++zRuLVgGmJmKEx
         lbzyCBiIoz47zgjcGiojfh45vCjmIz35CE5rpRxw6q5QgyJ5VPomh6YuzSkFx8WAFmDd
         UXpyzfDUSjFt+N6y1XOAEUu2DtxHkt2RauZUyw6mwaJzg9MwMkvtY6a1OcJCzCRWWAt/
         /jTAEhJtsE/4d2i6Ni0abvowTGk9nKVeqrNrL4ZHGH501lD8nO1ohLmgFcnFXdlRSf+W
         ooeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI9Y0rnYUN631Fwg/iif4k6wYSS7SKM5jjlHFivft7lbTcwakewv1eAKYwknfH9YfXLDSddi0vgELRh//u@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMjMurjXku/3MT14wesyFMMMl9vyoHwTbOJuGCm5KeooXb4oH
	HVwz6+tTkXxLp5ZqbmJ/RZnwnX5/qRaPJFE2DP+3uYnYf4WWlaA6DOhmkHmmOMF/jSV/yWjZWsh
	DIq+wOThIuWUe35ykip3TuJUcBunBFXj4vCm7mbJ6Dq+BflpgGUxRxFG1LtI1kNDD8QMk
X-Gm-Gg: ASbGncvTSbxIF21iMBtIV7JQkv2fpzNO5PQ39FlcdmHHfz3N8T2/525WF1AE8St3pbp
	3C7ydHITk64Uxrv5x0pOvp4fJfzZQk7US1RfCey3rrxYknDkOijeJTQx0msaHyRiQX9CJH+JrBM
	noKGIXUoFbC4hittPajBo73R3ZmyMye79KnomVHB2IB241fP6q1CqBU+CzTbx42oogyvGDOIver
	JUEoLt02VsuxqYBLDUMiisi8mCnuBlof8PMD0ggRTDKtZrPMrEZULyxdfWGYZ2kFGhiLwh9rjD0
	qkRthuox1Vkk3puVUNwbJq3DqV/OeNbQpGak9utmTLqUIiWy1OdqAuRHRlG9VN7zOdH7KQVW895
	tgYOEUais53QAUBk=
X-Received: by 2002:a17:902:ec85:b0:272:56e:e296 with SMTP id d9443c01a7336-27ed72a466dmr8014915ad.30.1758757602807;
        Wed, 24 Sep 2025 16:46:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMymjaREBsLIvKLNW+Q7vB6DhWGdnvzEkvxiVNd5Mt8P3KBP//WZcxe7JlYHiq3FZD3j2kVQ==
X-Received: by 2002:a17:902:ec85:b0:272:56e:e296 with SMTP id d9443c01a7336-27ed72a466dmr8014695ad.30.1758757602323;
        Wed, 24 Sep 2025 16:46:42 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69959e1sm4318405ad.103.2025.09.24.16.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:46:42 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] Add ADSP and CDSP support on Kaanapali SoC
Date: Wed, 24 Sep 2025 16:46:35 -0700
Message-Id: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANuC1GgC/x3MQQ6CQAxA0auQrm1CAUW8inFRhiKNcZy0xpAQ7
 m51+Rb/b+BiKg6XagOTj7q+coAOFaSF811QpzA0dXOsBzrjIxec2d9WEjJ1/XDqu4mohSiKyaz
 r/3a9hUd2wdE4p+X3eEYmBvv+BUpq7sZ2AAAA
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757601; l=1302;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=j+o1N+A6cz4DNX+PHP8QLZuXZ4/y6YVjvv721Z3nnPY=;
 b=EmWcrgX4X8FINHrxR1Fmsl/nVUiOel88JAClsPVDeVGdbyZfFBF/h8NWT/Ts00OBJxkBCt8/r
 1LCxMua0IJBC6ABjjncQERh3jKdNcEX02B1At/cAu63tz98ftIfJ7bR
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: 1Y9v4vZGxqJ54e3sk0ZUWrIRPVf1LZC1
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d482e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cuHX0V8jOqVKnLf0s2oA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 1Y9v4vZGxqJ54e3sk0ZUWrIRPVf1LZC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX/zB1qYebOOWr
 kGu9fpTLerROgvB1UZ2ew06h/otRLPzJMM+vsiELoFkG1VP6qwfuuuubcwcpfeF5DqQ+jCYsazi
 r9OzUijLiYljmz5j4gf6BEursysoCCzEBu9aadzcwFpwKxG5ymoZz/kOZox6aOFHsN9GCctCotz
 Vct48u4iGokVCct1j5QfTpU17onLm5JMJA9p1ngZWK8F4fj4sZpyB+gKxvr1aP9RdGzA9wAzJ77
 f9WXOebusx798JYaNKTssKyWyTwBjj+CR1g9Va2OzorIexJC9zKg1pHRkzN3nexSC1+UcUuCb/k
 HfF+XKkpFVZzEoOMT5iPu1O1JZ5LkPsFzIh6BaFlJYXB0yGeaQwL4UArDfYUUbazcznkb7WdeBE
 XN9ud84p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

Introduces support for new DSP IOVA formatting and hardware-specific
configuration required to enable ADSP and CDSP functionality on the
Kaanapali SoC.

Add support for a new IOVA formatting scheme by adding an `iova_format
flag to the DSP driver. This flag standardizes the placement of the stream
ID (SID) within the physical address, which is required for DSPs to operate
correctly on Kaanapali. DSP currently supports 32-bit IOVA
(32-bit PA + 4-bit SID) for both Q6 and user DMA (uDMA) access. This is
being upgraded to 34-bit PA + 4-bit SID due to a hardware revision in CDSP
for Kaanapali SoC, which expands the DMA addressable range. To support CDSP
operation, the series updates the DMA mask configuration to reflect the
expanded DMA addressable range.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Kumari Pallavi (2):
      misc: fastrpc: Add support for new DSP IOVA formatting
      misc: fastrpc: Update dma_mask for CDSP support on Kaanapali SoC

 drivers/misc/fastrpc.c | 86 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 10 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-knp-fastrpc-a1479674d113

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


