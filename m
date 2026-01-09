Return-Path: <linux-arm-msm+bounces-88219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D3BD07DE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A9603053A20
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E74350A1F;
	Fri,  9 Jan 2026 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTFN+ebc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7oSfhhl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226BD34EEF1
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947916; cv=none; b=k6jFxQAEy1QcVZwIf8kDLI0fWeE7X63c1ZWlp2xMF0Axc5EU1TYb3Z7rt1GYKsNRWhLVRrUiudp6SUZ3I0p7C1Bd6L7NuH4KK/vVhTyIrC/3q6J16IBSqnGjKcV6gfY7i9kj1gCB9LLBVuKoLXAf5poVM7copp4col6pIm3F7K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947916; c=relaxed/simple;
	bh=PBQBOzRjL2NHgo2npRZ6aldMj8oft2zSHPHWqwLZNqs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KcD+YyZ+fSomV9a3+Ta4/B8WQPw5Z0DCoHmgN8rlAzZFqtHtFhJb3lqXE8WIPPb2ORUkqEbXTRkWM52kRpBxYGG0vOeXI4NdL4GCdRsWKelRg8jxf/hOWMbdqxuBjzZdw+UVV6jpCJnvXEKiYZ7069LVRbyAQUkFusnNkhZBpl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTFN+ebc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7oSfhhl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60952kq23542136
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 08:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ab9wCYRkmov4ycBmObTVv+xkLNr5lZZSiXR
	gMeIKMe8=; b=YTFN+ebchL/FAJkmfL6/p4an5Fruo9Nwi/vxyT5ow/TMJH3iObi
	GCzcEdl6xBfszxT5qN2kcEKiPseExgopt2EXU79jYz+fOZQhzsJuTL04gocqVRt3
	CjIl8PT5fqzntdLp1ojzxHnptjG78IgXElBZgDD120pz0vnwHGAGdwL7YmidcerF
	xxZNm9o15HNaVHtkg5QCEdS/MP4NWSfSB4yuV2mOeY89VEvdMLqecAS45n4mexjt
	Eo2LapRC77qOC+RurgQtXZYGX0ulqO/k2iMoD/qhBnIZVPxMaDRvKhJIGTb/qeBw
	NABziYK/KMse6ty1lGSmZErUwFiaOT21+2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b0jtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 08:38:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22ab98226so790923885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767947911; x=1768552711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ab9wCYRkmov4ycBmObTVv+xkLNr5lZZSiXRgMeIKMe8=;
        b=Y7oSfhhl6G+45qGg0Ccu8UyAmnsrz2O4MIynYMnINaWJcZWfF5gYMVwW90X3FCMKSr
         4AMcbDaHuQOrkhtqSEc2hmsIhDZreuIf1HCucnEXw3QiOstH6eNSwTBy0NKPX5fFnILM
         ORVIFdFC+xpd+99Rg96MMGafnzeCn/67QlD1IcSPn9KFVUXHeI72jcm7N/rcetcMVWM8
         xL1nQ4oTHMo127otzfnPo/yx4tCcyshU6AkhPZ+k5BPE3KYEG8Pyz2ebX4mi9wY7824c
         wFHWPu5Skgar/H1O81/2fsPMCfThdiYxogb02uwRbeJRAftLjxfLv/ihpPiV0dOlZnHZ
         cS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767947911; x=1768552711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ab9wCYRkmov4ycBmObTVv+xkLNr5lZZSiXRgMeIKMe8=;
        b=Q78Tmy2PXgIMmQ1VqJmEJvIgM71ZvAlXeMJExOAwVBlYYMS/NM2goSW3K5K2Lb1sAR
         Ks/WmHkE9OrqhxaqppqY0uvlhL8l82wd+uZ/uS8CxWQrkvcij9GnrvbSyA3H9z71Lfsj
         jl8G5zfT+1hgrb/xC6Ex9oWYr/dSwEPIsk9wF428cCl2E3xDmp+TDeuraMiMEUeNT+N6
         NN04UakDyRCsEeRs4/HfdvelIAQAZPwBfDxCHGbe5R8Gy2S+dvfiIPNjMePgqts6gzGl
         QJtuSLoDIF5GEIelp4YvWT0Kwvvu8t/O4bv5MY+fTluiS4JcHvRYGHA5A/nvSrx00Mrs
         Oivw==
X-Gm-Message-State: AOJu0Yz27W6Ng9Px0RPWgaIQ2shj1/QeLTaBUs5vPMBRZXVkJkMvkvQz
	D2cLC0zctn7mWid8WtY+ZZprcqC0IepuMgSzlUPUCni85YgNRM7n0q9YBFRYlyheWBkQtOLSWZ7
	GuENIrq1czfma7Q5goZOksTBttOnVwC0AY44wGTX/7t3jMy7Fw3ruFzrGJRizuAaUuG81
X-Gm-Gg: AY/fxX41fKrYauriLgicecflKFdzLt0WwDGXKE+RC2Axy3S/T4NXRfVUYVvJcNrK0kG
	d5WNKmPqke8Fy3iXynBfzzcxnmrzOISO12/O90TyJcWLOu8zHN4MlVsCjT62lb0sdB7aftROQjy
	ep3kzTbh09vSNNnKQaplJ7W3WHd6zs7mxpF4rYcM1T31i8xeBmJVMb7qDZ679vJqdms5ScjfLnr
	ipWTlxsXwFR0OtqjBEIyXR3xjQI6ormFJSW4htdTrgxD8hwJDQncW2X3UUsrlyERcFjaAKNyLX5
	M8xfgIs/jntBbl+JMZmBkCRJ0UtNAn2wm4OOR2FdKzIcm1npR7aRCQOgTXMo6MElln8tEythzmG
	zjJVCToI6Sgwa7p4fVtNhvKHLnkjKPEFevbgVHRHg7pZyzamNGnBiAVrRlv6seA0OdJ0=
X-Received: by 2002:a05:620a:f07:b0:8b2:e70c:427a with SMTP id af79cd13be357-8c3893f25c2mr1163409085a.44.1767947911478;
        Fri, 09 Jan 2026 00:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmvZp6qYc6nvl7QjoP23G7Tn8tnuiGzqnKjzAsBMKfKV8jYCRV9KKhnZzaf4a45tyoLt4qww==
X-Received: by 2002:a05:620a:f07:b0:8b2:e70c:427a with SMTP id af79cd13be357-8c3893f25c2mr1163407685a.44.1767947911053;
        Fri, 09 Jan 2026 00:38:31 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f530c35sm771262185a.40.2026.01.09.00.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:38:30 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: [PATCH 0/2] drm/msm: fix mismatch between power and frequency
Date: Fri,  9 Jan 2026 16:38:06 +0800
Message-Id: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2MCBTYWx0ZWRfX2r31Mce/dwq6
 yEAH8R7mAOHq3IqiZYJsEDPkuJ9ZvWQvlxNTCk/r/ih+zsSKJpY2WABDQPThvDVph+B3CqXKAfW
 hm9fZQXjXXCdbD+fy4qIgVvPzU+8IW4m/uGldMqHysUZrhE7Yfs31XS7WT3sm7F0lLkWWVBre4B
 iWYgFudu0MMP8Oi7Nzlw34n23fLS0VzQj+Cvzz4jiDNvUR4icberwmIPA+PbFVEDIuwNYa5Q1Fg
 cBemlaGqwjBgO4nXXyhrY6/Pm+L8UAH5Nv7Nh9gR2trOcFvrdB6orQEtqd0BF79Ua9/hBL56zCC
 /FUwlRJMLgNqm/L8omUjAYwpXOHQuAWgopym+5dfzAIaDmMkZ5QBChr3T/TDJI+iSou38pNnS7Y
 SjSModiXiQOaRt7OvB0s1BOPn20kBW1+CM6rglovfdJ3+0Zjh9+CUDVBvohCIFMvT1tIRVwagBw
 yT6H5l8VIcbbtySQCgg==
X-Proofpoint-ORIG-GUID: 0CcvtEC2FpSn1EqOvWPEMHs0f_C82qXw
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=6960be88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dKC2B17Pv8Kfw1TXKb0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0CcvtEC2FpSn1EqOvWPEMHs0f_C82qXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090060

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
the MMCX rail to MIN_SVS while the core clock frequency remains at its
original (highest) rate. When runtime resume re-enables the clock, this
may result in a mismatch between the rail voltage and the clock rate.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Yuanjie Yang (2):
  drm/msm/dpu: fix mismatch between power and frequency
  drm/msm/dpu: use max_freq replace max_core_clk_rate

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 22 ++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
 2 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.34.1


