Return-Path: <linux-arm-msm+bounces-61230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09598AD8EE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BEE03BE63A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714521D5146;
	Fri, 13 Jun 2025 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GL+5lOzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE311A254C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823471; cv=none; b=SHlqV1EbNitxRuDCOXryQkY2PgV7g3g/zkBbQbValSseJtVJL9hc5auY1FLrPvXFuL2+70q7n58jxaO6OEMklSbRoIKP6etJZlJilkGJHEuVWtSL7q9Ej+0BHJwZKXEQQBfIt7Sdf+Ofuoexsu/64EMDH+MSKTORFNmbyRKvWMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823471; c=relaxed/simple;
	bh=s1I0hO2fQeu3Lx8bcn22vAaZJi9/VyHMaDvC/IBF9lk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FfWTTIz1PrhYlQKoX8Pil1YcOtFH+C8SIhBgCfDOFgZkqtGsMBYqfl+Ivb1+6+5QqxItboNWHD6dBhDjz6x26dhhmw7WQnCdzX0WaeRWPELqNGGjvrb9oLD9WlLcYQhTpc7H4MQmSPtDLAP68iKP33/gk/hZVTg9thAkFxJhmts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GL+5lOzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9JbNV015309
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c1wFDCTO6wUZuBHp8bagLi
	9pdo0bLajjZYPTJpMnvVc=; b=GL+5lOzZx29t+NI0x97M9y6xoeMsyuxDWoDRi7
	upcl9NPGwDOZg29FT23fG/qCaoEWyCVe1tn3XIThQcNznu9cjNdf5NKhUGWJZl3K
	5bU/PbMuRUjUV43rOQcMkBlU+iQUMYxWPtMts8XDnIRITu0h3JuZdM8e6tzfd5Mz
	1mBC8FXnKkX7wWX0RBQcXJlEUF+upq3N6hLpry1kCyplZi4M0ixMx0cIvi4LaR4I
	zuCQrTY+4oeEgXkWICV4tjSOkhl8mv57TaytsncHLsKlCi1+C05IneuR4IEN4Qxp
	9BiQouzi3reBmpaR3Zk1TvWDSbMZ0HH13nDTXe3fdrNGUNbQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 478h8krhqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:04:28 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-735abe7be85so1477214a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823468; x=1750428268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1wFDCTO6wUZuBHp8bagLi9pdo0bLajjZYPTJpMnvVc=;
        b=a8WSuVz1KMTWHYI6RZ6dTEBQCsQYvIefdYuBBH5daOm11Y2wgGaC44UvdbfA4S2vBe
         8drjoY1wj+MrBpAn+o3k7yXX/5tQ/5XLOoxDh5izaOkX/SRAMkjoXU8nX5cqXQMMxtMD
         suTkUWBIGF+muVRN9VwmbO8vIYOh5BeTUdsYzAdBwhMGNNieTtBsvzNcsNd9fUKZIWvx
         NBB8aAYSIxZZV0ls2ny+U94DYgbZATw2hwqN2VMskg0uo1jKVKbkVRWAWzPZIpF/j+mK
         o/aRuTyXWuvuxyGkRgBujAQnILLjk9VDRAcOLIH6TxdujLSMFB7MA8Zd+JfvDSBqbzbm
         Kagw==
X-Gm-Message-State: AOJu0Yw7wDNRMsv2hdpNDrv6mVJgFY1ov7s5nZiT2O8C06ojO22+lmoc
	CFDIbj4mJ2kjX48CSasAfA3TQCyQ0phaROwhgL6mrivyw40ysLcX3uudEPHTru0gZyxzCGm3g5/
	UK1GEAKEzhFmldGBorCGZwnKjMChsI9risRIqDKHtMXRQMnloRs39mcnvCcsGVV8Mcchz
X-Gm-Gg: ASbGncs4+edPhVQ5nXak0UPljko8uPJhLDNFV2J2My2C2TROkGuvpxmERa5xT/rX4uW
	DPdQJBqGsWPtDzeVzKss4e6NsSTLeq0G65GGgDZAK/2YBObEwgvedEpZ+BEPiCfL26z2EXU7Uha
	AEzbJVDMg3Yh9aQ8z3LTOu3WDzAyV7XCmoyANnwqVnlyCx87oZh3S1xRWNFIcUnT8xMRD25THrA
	qQcfaz/cy4yIm5+RL8ZADjPlHuUg2HugXaJDUexstYw8f0+6YzuIMHNA4dOkbugW9pe+ljJUUtu
	FZxkJ2pfzlogTJ0AeUjhPNSYA1WDjKQVlb52ABpi5cVioyGEPJ5Wv40RLkrbh9o1Ed7v+4mG3oT
	T
X-Received: by 2002:a05:6830:487c:b0:734:f8d1:6ab3 with SMTP id 46e09a7af769-73a331f2609mr462864a34.0.1749823465520;
        Fri, 13 Jun 2025 07:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHozzL2LNTR1LHU1fFwn8t/C97PjFxz4nDTKzvcOASqJNquAMm92SrwDHW3UYP8OhqMsL6aIQ==
X-Received: by 2002:a05:6830:487c:b0:734:f8d1:6ab3 with SMTP id 46e09a7af769-73a331f2609mr462772a34.0.1749823464346;
        Fri, 13 Jun 2025 07:04:24 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:23 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] media: venus: Add QCM2290 support with AR50_LITE core
Date: Fri, 13 Jun 2025 16:03:57 +0200
Message-Id: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c2R0sAaxg4OLZJz3iVq62CmEY2hJS37P
X-Proofpoint-GUID: c2R0sAaxg4OLZJz3iVq62CmEY2hJS37P
X-Authority-Analysis: v=2.4 cv=Pp2TbxM3 c=1 sm=1 tr=0 ts=684c2fec cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=8Ml_vZegNoZ2K-C0vxsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX/mvzXaSIOdlZ
 +2enpA5WbZZlpZhXvVzav2wLlDwTiFtd9auLlkMeMhpQRKy2ZrkMzuz1Oly/fvZBbG9X5SqtwSK
 AL80n9ZJ/nqG2/gpt7ipzAChzPMrQ1k8KRSFOxm9uQoFp7T3z/WY6N212k3y9TXdL+/WWiC7fwX
 OWkhC5TQWh9s/T5YkN7gX5u7yJpOTO/IyL/+KBAx/ZBcXbARAwWuLGzCA0K/IePJNaTrpK6ICvC
 ohvu80uLo9YqDOvT2T2eOOlWsyFr3KqL3YUOcE02nLLtLutIpgVO/x5Jk/k6zfXEmJnp6ilWwHq
 DbuHtvO4qmGRKXvAcz1/HycGsnwwIenijYZzwvZYpnJGk8AjlCuOZLzj0SJRjt/7VyaWvDrYO/s
 tjdcKNtYoDzLZBxHyuBLS78WBAMx3YalMScchiPWZ7lS7XTrVJh2MLPQXico4P92LZ9I6Lcp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130103


This patch series adds support for the Venus video decoder/encoder block
present on the Qualcomm QCM2290.

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding.

The series includes:
  • DT binding schema for qcom,qcm2290-venus
  • SoC integration via qcm2290.dtsi
  • Resource table definitions and frequency scaling
  • Platform capability registration for the AR50_LITE core

Decoding was verified on the QCOM RB1 platform using GStreamer with V4L2-based
decode plugins. The following pipelines were used for playback 1280x720 and
1920x1080 H.264, HVEC and VP9 videos from https://www.elecard.com/videos.

[H.264]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h264parse ! v4l2h264dec \
  ! videoconvert ! autovideosink

[H.265]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec \
  ! videoconvert ! autovideosink

[VP9]
gst-launch-1.0 filesrc location=videos/xxxxx.webm \
  ! matroskademus ! queue ! v4l2vp8dec \
  ! videoconvert ! autovideosink


---

Jorge Ramirez-Ortiz (5):
  dt-bindings: media: venus: Add qcm2290 dt schema
  arm64: dts: qcom: qcm2290: Add venus video node
  media: venus: vdec: AR50_LITE video core support
  media: venus: hfi_plat_v6_lite: Populate decode capabilities
  media: venus: core: Add qcm2290 DT compatible and resource data

---

