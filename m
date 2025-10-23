Return-Path: <linux-arm-msm+bounces-78532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C43C0075E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3394F19C50BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4320B30C613;
	Thu, 23 Oct 2025 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mL0wYE2d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2554B30BB85
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215166; cv=none; b=Xktew6w5XmgW3tBKAE/+lI6pjOm/gE/CZRz/VQQkl7jBvXTpLe3rxoFwc+FXRWxumXvuNiDCK/+pnkjSwIf0+zNnUXzH5UjwpMnuAwnpVpgd85CotufiGW2iv8XpxTRJU1YzAP6CA7PDv4hH3haA3XFdEarbnvL8sFYKRqlc6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215166; c=relaxed/simple;
	bh=xt8g4CkWUD5tNFuL4e7DXexZmzatqrNobgpEMGthfEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nq75pCGV28ktUeWwwAG8GX5yPZuIoh8hM0U1U1zhxqVV5D60XugG2czqIA6oOc/G6hNsut+4JvRtRrVT+XiMd5SY1r9aqe/Uz7yqE8eePNKRSEweF6R/8MeFDi7TILkJenwkK+9yRcQmypsjyxeD9joCnaMJZeBowwNhRH6YMk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mL0wYE2d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7CXcf011737
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wOyEzaoN+qW
	t6Jznp1azFKuIlaKA4mByl9VN5wTmOWM=; b=mL0wYE2dcg3zdMHZJBAlTA5hiNW
	WInhjP9s87NGQ1G5Tt2JpEJ93atbSoKMrUh/hm+FdnmewN75ZajdVAMStWEp9fN8
	h/EqX/W54xH0Ynk2DWQvb1L04F+XCwIdtFb/I71I/KfdtWzy3Qauyjre8V4zcOju
	Ae6JzHitP2u9k0SOCjaF0uNbmtU9idsukrZG7vygW0jesgxMLzAKFnimUSeweHGL
	H2cOiv63Hfn8O/K2scPzCmjF3UwEXCFWMG59cNvmQ5up9oGjXZtKlr0D4PNH2Pzo
	Uyaq3N4LaV+PHd7YKx2Yxk+bNUkqPoKDuNoQSl0a1vzHAcNS44/CaNixVcw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524a74u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e89265668fso19225081cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215162; x=1761819962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOyEzaoN+qWt6Jznp1azFKuIlaKA4mByl9VN5wTmOWM=;
        b=sOfxERuFg11w7nVXYBgcooYh5SWY5cLhCjF4ttRGKx9E247gr3n3YKyf7psAR/CeQg
         JfIL1R7OPSx/MKulhgntoaeNdUC1xsqo3r5LXfU2Bh4vlnTO2DQE8Fh0nAyTitS0G+84
         4IgeTpf2I2GeZQASLXiGI0g7R8AbMaYdK08eKsiojyoOEYtuXCoTYQZ4zHgFvYvZUk4d
         aH/uwiCH6BfiU8xdSOZmqKXIiCTtI9hL+65MGxIh6sKV84+ejZp303LqB0tSq1owkr1F
         7oOBfl3xe3SHGyb1+CwlJn2+XXmRrWlU7AuKLvHy2iiwm4wFazios8V0NDD73/VpE8wZ
         0sdw==
X-Forwarded-Encrypted: i=1; AJvYcCXKvch4FIKclzVe7LQUBcQjh3cTliWME+a0Xun+wey/pxvZVoEM9U6ZKSoJSX8hra+OQOqLFwMdP2qVOBB0@vger.kernel.org
X-Gm-Message-State: AOJu0YxqquIanbxbpd7rJGafz1pMfvdiB85f3l3azwWe7TkBcIVu3r5G
	a3AsBHiOmflpBleVIDGvSKO3VWnsFMVtxf9ancopbRfYNRl3oNHNMImK9JpTGZqo1DFIVZkI700
	TXAoaXfGIYqUo2zHmqwb8nbqgTwQx6rDit+AQf2NxDTb7McxxEjE4BBg1P9t5Ho2XCYYo/zQ23l
	Oz
X-Gm-Gg: ASbGnctOsfFZxrHIH0NvhPSKhoLZh7n06YXDC7RWe+nBsqRRtzTi40Ubm21FR1Q/duy
	0hU5NaZywgH7JlC1rgWm8gGylnhIpi+zYbyDSDX7WFDB1Tr6xQpvk3+sWRXRZ8GWIrFxUSIFlQz
	sBzk1JY6CQH0e/sE1feR5s82y9vgaijFwaa6qdpmZ7xthvzbxxbUg7V6MxAZRJpDiEjkZDcB2Z5
	kYWlNoZuJoQO//gKGqHJTd+8nYt3DoOUA4JH8Jvk409k0o5BxY4TWjboAhTJpZjuBoNCAqdeXt/
	H+z5btKseF2PxhJN6tgUBOlBl5C3LFl7+sEXEzahyvl5wiiP9qNkxlMzhAGzCtuR0io4ykoDzbu
	RKAFgIaGtieoI
X-Received: by 2002:ac8:5a88:0:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4e89d1f1d58mr292503581cf.17.1761215161953;
        Thu, 23 Oct 2025 03:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUSOijjLnGfv14M5wyZrvWbp/YZECNCLSsoRITcid+nA4Im70rZl0l1Vk5yeIEAGTdk6BjIQ==
X-Received: by 2002:ac8:5a88:0:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4e89d1f1d58mr292503311cf.17.1761215161436;
        Thu, 23 Oct 2025 03:26:01 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>,
        Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 05/20] ASoC: qcom: q6asm: handle the responses after closing
Date: Thu, 23 Oct 2025 11:24:29 +0100
Message-ID: <20251023102444.88158-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX7ZQDh6RHNH/q
 gW4nhs1xYvZbzmO/ZmElWjAIPnTqv+UygVk0PVdK+y3R9Kuk2RROJxfA55t4JAjKwxwAvGbpe1T
 KPoUAA2e/TUEObyaeQFKCnZUIWBoMxwoBgT1xvMATcuQPeHax4YnvdI6HvQn2PGprr8kBVPfjMu
 5gFkfUT+M5nk7Hbb+EUgZF+lYyhTLjoLWdLU8lVrqq2Uwdj7qmg4EzAO+OsIL1WI9WSqvn+c/2N
 Zv1AuVCwxZeoAYsp80juYWHuZS+SoOeLOMsEsy/5Ve5KPpAgqnw5AKt4taG685hP2APdgmmupVi
 LjU+pa5ekLquUU0r3vWIg+A8+IYoxf3QmDJ2AKFokgAUc5wOg5uSbu21uqvMy/SZg9i+Tw9M7ci
 YXVaDXo0CTvsb1NsBFqFeXQo02U7Uw==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa02bb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yqanLTD2VdNSX0FXSJEA:9 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Xo_rd9qlEdMLHTI6Zq3HBM6WO60adPmw
X-Proofpoint-ORIG-GUID: Xo_rd9qlEdMLHTI6Zq3HBM6WO60adPmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

For record path, multiple read requests are queued to dsp in advance.
However when data stream is closed, the pending read requests are rejected
by the dsp and a response is sent to the driver, this case is not handled
in the driver resulting in errors like below

q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp

This is same for both write and eos.

Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
ASM_DATA_CMD_WRITE_V2 as expected response.

Reported-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 67e9ca18883c..4c3315d4e27d 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -638,6 +638,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			client_event = ASM_CLIENT_EVENT_CMD_OUT_FLUSH_DONE;
 			break;
 		case ASM_STREAM_CMD_OPEN_WRITE_V3:
+		case ASM_DATA_CMD_WRITE_V2:
 		case ASM_STREAM_CMD_OPEN_READ_V3:
 		case ASM_STREAM_CMD_OPEN_READWRITE_V2:
 		case ASM_STREAM_CMD_SET_ENCDEC_PARAM:
@@ -654,6 +655,10 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 				goto done;
 			}
 			break;
+		case ASM_DATA_CMD_EOS:
+		case ASM_DATA_CMD_READ_V2:
+			/* response as result of close stream */
+			break;
 		default:
 			dev_err(ac->dev, "command[0x%x] not expecting rsp\n",
 				result->opcode);
-- 
2.51.0


