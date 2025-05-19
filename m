Return-Path: <linux-arm-msm+bounces-58380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52636ABB749
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E79E3B3F4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417A826A1B9;
	Mon, 19 May 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5LGzeTu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3C426A088
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643601; cv=none; b=L3hr2/jiTGM4SHm3cm6qBBjUkt8z5YkW3lemHXCLxE+R3Zog4whUHxpd7UP+VSQM3JaSYvy62ehBNjrJOQOPXWp/SAz/fYkUuWCb69oEoTRFHhhWYhMXifAD7mT4l4nus4qV0fZBQnDny0wUq7HHb2bOZFEHG8aCGoS+skhZ0oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643601; c=relaxed/simple;
	bh=SJyYt+2SrMmVPKFZbwfaLb4AriBRzje6mjLBDyBXo0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OqS3vF9IqfSN/hHvhekmeBEH6WNmd5ygJp+sXkaD05BnYQE+ybvOAWV9Bcn2X7LsX1OLXIIelTnPiSevK8Z5fJaAZ/+ZEOlowSAwRVEwztCDahuP/j5F+580dzY5pufD2nSYHCsCvZFpG0HLCQ/VWUuy9l+E78OVSHfbu6f04eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5LGzeTu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILhYhA031155
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0Z9VhpORTd5abbKb8LEy6Gb6HHnZT5sQNZa
	86+bNWuY=; b=L5LGzeTuOajVVNlMwYcskzXya/rwGuXmH7bl0bdTpBWM2ROEpIo
	vbCpgrh1D1fvLW/WTaB7/IDwTlWkHN8elLipDeWoxclucl2VAS0NhEB9HmDRMgNp
	irWSIGtxzpE02nCEjPx2+N5xbawId6fdsMZB5dgNLWTbx67K3hRcWc7G1plNoKiC
	2gXKe2mJpYJ8uiAxx3InJo4DMX+CSLwQ7NkfFynuvJwV8lYclsv2TyD2XgCJ7ydc
	2F9+eVN7FA0I916tdddpWJGy6uborAOr+sKSik67kqCDgKbrUdFFQruvzSEckXhN
	usvXTaS0g8Jdv9N0ogMjKj0PNltJ9CO4Qfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsumhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:33:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30e82e16f7fso2412857a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643594; x=1748248394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Z9VhpORTd5abbKb8LEy6Gb6HHnZT5sQNZa86+bNWuY=;
        b=pPcwkuct/4dp+eHer9DjZt+KshcZhm8lnI8Bq4vAomKdCG/2tAwMoLzjQ6N2T8ugVW
         i9WjciIiwY93CN4eGSFF88Wjf8EZdbBS5Iw3HZ9pcu8iaNk5WuyiNWsNi2Qc13QX5UQu
         ZdQCceIOKs20pVtlOIxe63QN/s+9sDS4ErNE1xJI/39oZhNTFk8jnZe0DpTWOMRxJKNo
         rBUtEqeLNIhyLpOq8nt6l0aHU0fh/I2emELTjbCZgRs9/wlh/g2tMFsPaVnnwo75YgrG
         qq2Ubu3CFP9t4OeYQN8oTTCvgZOnYAm/fabmZW4zQS3wUau2L3PyBuO9qnENsKaJ+Hxi
         3Thw==
X-Forwarded-Encrypted: i=1; AJvYcCVm52slZHdCN1m0WdeTc6fwyrdxP/cwQYeXMbrjbtpIokZ93MvNyx8l2lfr+mI7JtSlan65f0Pob1d9bFoG@vger.kernel.org
X-Gm-Message-State: AOJu0YwdDyANJS3dbwFl/DXtOg0P/Hsm7ptbvxOwBWItPe3e6SUmS2Uq
	8/JBU+K96zBvt4y2TQEqeokpZHZlevbEPK9/ournbQhC4rohaq0xF/dtRKGss4hQh7OGd3GvRL6
	T+HXUS6nM3ZuvocXgHlKKwrUTgHZ4jid3O2l3SOSHBn5UyWAAcVFGMydRGnxsnadmB89kqKO8MA
	MY4Hc=
X-Gm-Gg: ASbGnctvTNK3LJobL8DfA3c53D0Brg0WsCWKIgXzsDHjfFp1auN+okNi3fOO9M4+8Y1
	43SD9QlDPgOC4pabeKoEGks/0sg7WQLOH3tBGMkKuQ5V7Kq4eOw6iJKS8nYe+8HpRgQfQJ6ePZL
	EQwhChAb3DlmG79A8wybC1OE9KJdXg5BMqK7uAlK64GAjdHELttuR921dnJeRCtfn2CPB5eLB+I
	5gK19Uyl8LLvGfACXuABBQrd3SJJMw1iS2PwVUPK1uixQCr3Rm6g9LDiNwPsSCsJCy+k9WfsSr1
	3QQmSY+a8FIESHmOaFEMy6W/YtqPqMg4idhzQHAW7ztwNVYU
X-Received: by 2002:a17:90b:4b43:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30e7e770605mr19561728a91.13.1747643594434;
        Mon, 19 May 2025 01:33:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxqNIle8z40DmsVvDOBzsAjRCPJ9BoRy4c8Pjl4AIbG1xTCC1hNBrLuU83g02ddIa7W7uMFg==
X-Received: by 2002:a17:90b:4b43:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30e7e770605mr19561687a91.13.1747643594004;
        Mon, 19 May 2025 01:33:14 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e6af9d586sm7003887a91.11.2025.05.19.01.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:33:13 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH v1 0/2] Add sound card support for QCS9100 and QCS9075
Date: Mon, 19 May 2025 14:02:42 +0530
Message-Id: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IXNc0p7AXtjM3es_0edeqva8kcBWyQoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MCBTYWx0ZWRfX7M3F9Z4MCtdQ
 5tqRNdc04Qg6rMAQMcMRaPaSbTaZ5ZIpJPNr0iQlN2lbTJC8z/Sj1A3DGJC4XWtQl4m4VcZzpDb
 f23RyO2FNyv+eVoWzsSiHZr41AGjvIibcSSD89RrmjeE/zUF5Mwzwlkp75j38Fl2YF/y3nzXpdo
 XJ+/U/k092kQA5CrEyipxslnZtuDY3pe07hTK9cF9b5hmMhFZFjTnfmGXLut6aKXKlDx/aD5UBS
 1x5rwEBnI+LZ/auZkQLCS8i6jKFzoT6mNHDNhctbzAfHBO9yKfx+sBWcLuZvNjt7ot/Sdm+kgsX
 +WeNoIGT7ImyIhcOEskxmlW7PW5+wTsilnwEEBvfGYUtDvsZjYxY7Vh3vlQxsNdZrl3OPkrH0jc
 ytg8VHRQSNfx6ZScT8o+/VTa3nq6Y/7bZgfwsk0g3kI7GGqXbBGBsu9DkhThMf9tmb/97yCP
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682aeccc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=-EALBZLJ3Ef-HAATTx8A:9 a=zgiPjhLxNE0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: IXNc0p7AXtjM3es_0edeqva8kcBWyQoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=800 suspectscore=0 phishscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190080

This patchset adds support for sound card on Qualcomm QCS9100 and
QCS9075 boards.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,sm8250: Add QCS9100 and QCS9075 sound card
  ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 sound/soc/qcom/sc8280xp.c                                | 2 ++
 2 files changed, 4 insertions(+)


base-commit: 484803582c77061b470ac64a634f25f89715be3f
-- 
2.34.1


