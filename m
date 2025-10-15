Return-Path: <linux-arm-msm+bounces-77400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D81ACBDEB63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167E219C4839
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CCE2288CB;
	Wed, 15 Oct 2025 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHotCi92"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A8D21CC6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534296; cv=none; b=uKNTlVu+k7A3Pd4/YEqi55X/+hKkT6XBarc9rL2/RezouzK8j2een662uIhvOP0PpgZRe0ullUChdoIhNBnmOxEG/HD3QikJfd3PfuXIE2LxgMsob1OxYahLPw7c1CiB5K9vP4/GVyhO3DkzFLpyPAFuADR3zZby1gqYTjTUla4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534296; c=relaxed/simple;
	bh=WgksRNnJLD6BqxUz9vyEhSOn1ol4D8nCWHkD1yAbE7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1rGa1xtGCFQTMtYgKZ/B4bYi+QvyQFVb/tyvr/qDn/2LAj/cfw9Vk0vTfFxf7TX45ELTBt4T3j9ULnvq7IzVEiyT9Fg/w13Kc7t/1BUacJtkzKZYl5oPRjHy5Jw0oiQBVsBmOSTqUWFDU7zfIcDv6e6bLZMNDFel2npDtp1wyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHotCi92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FBBZd1015803
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zlyb2ILEilB
	Be+0NeB1eqEutKyYbzy1mNlFgAEnueiM=; b=mHotCi92zo5HlrF8sjm2M+zlov3
	+GAmrSaRqX0Y7OZNSJK2VkFOPBl05IvyywGfNPM1b2NJq2VyzmzFzFXygJsmmqPP
	UrhXQDhnPV/EOI4nosDwKDIT98hdR5DXr/scSJDmZ1y23C0c1boLLSSWGD9BcyLm
	d8i2zvuOmQ56sOt/lmVSc9CRioKNi9IKqkJZ2cXu5GCCTqitx+FJal+FzBqZAO3n
	iT1j5cU7XgJnb+o8E1lXJQ1Yhcu2HKFopSgEhfsiA4oEWH35bLVZPdwRy+EE4hoE
	3rydXYHleeHwzOZfv/hJdgEg6FHmLetz6FCtPEc0CPjATA7jz21ekFlJR7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5mkwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88ef355f7a3so65417585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534293; x=1761139093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlyb2ILEilBBe+0NeB1eqEutKyYbzy1mNlFgAEnueiM=;
        b=HGO8nIuYFhg+/RvFkwQfaUVK+jgei083hcNecbMhXJByTeOTvKpn0Z9HImSK7I4dv7
         BojRBMV8d8vFD4clcLY5ofDBCfTu0aeSN0xBq+JU7x6jAZgaod8jD52LTyugivpK6WdC
         WXHXQ9IMRdSqrDC5G9Knx47ruIE2lio0JqLokqTv0WZg9grTN0JLNTsYEflZ4gKoUx1T
         fqaxfJGEbhaxrbiz1eS639+Ab0dUPb6f8JjKW2P0WfK+cpcVKr3LUKSwdQG/Zmyz6DgF
         WMhJsRDi9yEkJH/QGpXv7tkHN+MjUSRWhYzWRXLndhTTRhgKwfH2v5tQeHmagbHZeV0S
         fGZA==
X-Forwarded-Encrypted: i=1; AJvYcCUuz+i8mHh6FJBMa1em6ZZ+B65JpCefKDc/1Ba/PhTtomz1XkasewzhOAl/0330zWU9uU5FWKhfEK+tfFPa@vger.kernel.org
X-Gm-Message-State: AOJu0YyvSDOQAzlEPDAGptzf/p/vzdksf1fZnDTEkEgiVZiC/1xvmKw8
	Hux+QKzIEdSWRB55BP54Qf2sVHDFEx0Bd+1ug1fLwVKEHC7MCIXrsL85kAAhi5zyikAt69cpJV7
	OIHr8Uh4EEx3uQIx7fWL7F+x8a2zsEI7fyH7mJJx/Ebn94xcIteS/tkAsrJwHqzD8BWz9
X-Gm-Gg: ASbGncvGnb5vzzlTO6UaRpfNwLDe60/FYF4sXVLinaoS4uMOrXBFRE7ihzz6r89rzJy
	ydP3fPcMxX9dWzyX+i5Vd2qGIMOBd80Gaqa3vTCkO8lhFL10PcWuEDM0/eSriQVNiAIiQuBH7a6
	HNb4d93pZArOsKH2HwqZU8TIBUSdIowCZ2Q8gOPvI6CV9eD2L6Des3FNahpoNOA01WwmbHUdgBZ
	DLiR8nTikh+lHzKoqcQzIo0bueMMV1E2rXd1RNjOqH1bXSm7VbAfbk3L0NwmEq/mDeAU46yfbAi
	8LIpigWCBBWD+JBKK9ACpeY4Qa2umS/GfIX5cwUbkZbu8BnuN/8Eqw==
X-Received: by 2002:ac8:5d0e:0:b0:4e8:8de5:fbb2 with SMTP id d75a77b69052e-4e88de600b0mr9882171cf.70.1760534292438;
        Wed, 15 Oct 2025 06:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGifIQbCESc9SGhY2SMFQxwvgmX8sW9h2/sx0PYFUmxrzn6ej7nKB9DswF8DGHPCO6IAfidCg==
X-Received: by 2002:ac8:5d0e:0:b0:4e8:8de5:fbb2 with SMTP id d75a77b69052e-4e88de600b0mr9881381cf.70.1760534291735;
        Wed, 15 Oct 2025 06:18:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after closing
Date: Wed, 15 Oct 2025 14:17:35 +0100
Message-ID: <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ARgE7ToCQa9dXzaqr1NvrtKT70H6j1By
X-Proofpoint-ORIG-GUID: ARgE7ToCQa9dXzaqr1NvrtKT70H6j1By
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX3clOzqPEtTmh
 tSWNb7HwKimHtrFD76lEAQgcUIC2/Htlmr4cOom8+6bjyObalHhPJeFlJ73fpR2IOCRQcIIt5/o
 w89pRIZOdYmQFHWQieptFT3/kTSQE2I+VvbahHgJBAoirFaC8x05MYp5iyluMsOAape7jivGMsn
 DLal3B5f0KoTnIyMZ9UmKofzC0KE9esENjSmm6dMV3OGacKVV5ppngc+qJNHwufX2PYMUVXDIa4
 RUQ863oXmeugJao0JiFZ4vJRum0+iN6PCTAyb4yx79c9NEaFjEkPVsUYMFq/3s8SGRqbfp0opFd
 yIA/LEVl63TOJF03wiGvI+41aoRXKlZVSN7WAiP9XFX4Y7i8R/Azo4ZludFXuYiw1EIyzwptqnT
 CgqJQzbElqCIqeODmCzjkAvNfMRbdg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ef9f15 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=yqanLTD2VdNSX0FXSJEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

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
---
 sound/soc/qcom/qdsp6/q6asm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 06a802f9dba5..371389c8fa7a 100644
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


