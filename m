Return-Path: <linux-arm-msm+bounces-85455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1468CC6C69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 933B1303C02C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 09:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389B833A013;
	Wed, 17 Dec 2025 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJxcfyeu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuuBOyNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CB5339873
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963367; cv=none; b=fV3rzLtKpgVzyBfwUQUE01yxJHJjmhnvIk2RL+8Wxd2NIiYnHdTteAH9IiqPivYYBObOAXNJBtDBmcHyOgPz5Od7oItCLycTKsEGXojazw9kHhJmmCH53CLfVH3iorr6Gd0mWhzzBQjQtwf+g4RpLWPP/M0qfzF3+ixc9T4Pb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963367; c=relaxed/simple;
	bh=EjENaxdW6lbGlLwV65HWRMJ4CDsz5CnlWW9WN/bo1gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cfyvi/u5dKzMUXQLFKQ3W7ZAASFGI+Vk67Z7WpE1DkJ5rBShZMFTrlR+LVZ9F/yDPtcIQMA+gbzBaca56bYmlvndMNPh3zeSZoYuaptbHWCK2GHd9lSCHlVBkFfGKmQqJ60Pe/GQ4j2RM8Z5HGU9pyjvCJHWlQ/R++Drqe63H5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJxcfyeu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuuBOyNB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3okM11564942
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VApM9a75be5yBxEpWhyZqdydIcBo5rRRrgOh8r2VHCg=; b=fJxcfyeupE+KBkwg
	8HsSWBvX6ByeFicZ5K+1ERHiE035LvuB5D9/oCYlSa4R6ihwK+gD+BrVl6wfMh5U
	eCyxMASjiA6YWECfmzooInwq9NkbD74Xeeg1jfxeqoY3pxkyug+0onNdw9gz5FSc
	1JMRypKejwtoqn6zYmmSUNrjAHl/K6UWf4yf+zhGmvkfXslD9NkFNOQ79p5+njpX
	5ALv8wekljt9jZkkiWaLzkxhfPwo5nhCNqroG2aKoi1oK++bCAC80UOj5GIhVQfX
	9r/eD7IplFYut5Djtz0z46lvamhvqVOmi5IY1SpdyNDtAflmuO0PwCzMCjrzhaCb
	YmW6nA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj10ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:22:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee27e24711so99104931cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 01:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765963363; x=1766568163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VApM9a75be5yBxEpWhyZqdydIcBo5rRRrgOh8r2VHCg=;
        b=XuuBOyNBOV5/FVHjxnOolKv27rWcG+pfM19nUFX3t+YWAZ+SbeSU0kauUHqoqRKjvd
         4XrNd9T9R0dUbNTHq81wzVjSqIc9icuWWsFHh4smwchvW037v2JVXtbf6gJlfaGCsLxp
         IKLPSkRsJ8+Eyo1lj4Lun8SqqpFowRWz1jBNc3Rt3Vw1VKz+bgm0kPqv63E7YyhgRxGK
         KTWMHsA6/aek15j6ktNrQen6DPjU/Gnftj01tOJ2P2vgUW7hTVvulqnfIRJTOA0Ct3Cl
         E3a56yKUOQYv5pmY4CGnAmbVPu/RlNzM1bPHukJyGG4EKsqCCWM8c3fnPos9V0joHlDC
         nLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963363; x=1766568163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VApM9a75be5yBxEpWhyZqdydIcBo5rRRrgOh8r2VHCg=;
        b=PFFq1/x0/hrYZyG1n+yFEluaBS/BqFsXMvp+7Ul3DWIQnhB3FkvCn22UGUm9UGBQPF
         Hqi6pehrDa4UnX3n3yavyIYJt5yzGcGSjLwfHTTaU6iVd8Axn+Fs5wS1NZ6E5KnPQPSY
         6YGH4X0H5Okq4mGphGNmTsjPnJBJHytxtCGuEjBDJ7Yt7nDyidfJRlpcLWg6JQWdCcQi
         EProWmwNWU5ppVvyhDpcuFXc2FjEvkh+2aGWZM+GR7FaPmar6+T8RmPzUEH8M3kqgCzh
         YFuspk6AhUAEoQCGIoxoIcIVDikxfE/81JlEDsgKJJgfYjmBEfeYEbsz5Wi4o7jUhJiH
         ITng==
X-Forwarded-Encrypted: i=1; AJvYcCWufptdnNlYYzPbJkiEl5oLTfz8YkC5nVFhOf39irzeXZ0v/SiiFx5vvDLuALhrc9TsC4QEYaJDVyw/9p7r@vger.kernel.org
X-Gm-Message-State: AOJu0YyorDRx+KRBWvVDG/VwTP4WcXHCB0GLRTaXSSU9p4P6h1TsEgE2
	XTV/tz5TEjGhMNt+CfZjHK3MjqBzqv5p6IO7PQ8TLd0pxLN/SgDnD5DybZCzVlPl57SEeEvNENQ
	kmhekOaBoUbcRuZFjAfU4rb/7dl1DExgq3yuP95nH/OA9/X27MttQwqpWQ2u+OJrA1G2k
X-Gm-Gg: AY/fxX5+M6wAjRzMzfPFATj7K6vTta0bXctciIWTA+aOykDyPhLwdn7EIiQp8/XDWFU
	SESTgAi3ewM4LJUi+6VGP4l+xj/Af53TLjhPj/znmSqmBxY4HKyVpa2gXNXPYjls7X/XyyXIeBT
	a7kxlzIsqLvXkSjzdCXUte1aoEOtFnO9io3InTBCQZF2EP/hm4dRDoC0yisZK1XNjmyhxHdzVdT
	WIEHiWQ7FXMqKQrAEkKGibYePjHMgncId5rPKO/WGKTcMkWvThnaRFCT6fGKK8yif7KeylH5m9K
	ljGaHAAUwJz7JUF6VWWYqaYBLIb+FgYXDRsUvcfZqYLo7sGep7V8nFmkyDA+6uQyT2XCbpbtTMX
	ym+qp0vw7cLdCEcv5b5TgGuArgJeALus8CAJ2
X-Received: by 2002:a05:622a:1f19:b0:4ec:f628:ea6c with SMTP id d75a77b69052e-4f1d05d59cbmr242214021cf.48.1765963363081;
        Wed, 17 Dec 2025 01:22:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI3b7d+/qT5rVGwUnNLudj4HqUEmDZPFToOEAewMOI/77utHiuI0w29s7lV5G/J1OIiI+rEw==
X-Received: by 2002:a05:622a:1f19:b0:4ec:f628:ea6c with SMTP id d75a77b69052e-4f1d05d59cbmr242213761cf.48.1765963362653;
        Wed, 17 Dec 2025 01:22:42 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:594b:272:c2fd:21e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ade7bf9sm3806668f8f.24.2025.12.17.01.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:22:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Preparations for camera support on Fairphone 4
Date: Wed, 17 Dec 2025 10:22:36 +0100
Message-ID: <176596335028.7296.6383434017089749301.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NCBTYWx0ZWRfX9AslO5Wqvq4f
 gy0TIgJxnws1X/aIJ8EHlmEXaoMxgU8P+TUMLANtrD5AbJyVb/jXThUFz1QGVJEvadG05VjTCFu
 H+ObIIUlLIr2azNklpYWCxoqPbv5sYHgbmZE1rJJahXnMIuwW5fsL3CQ7wEAuYIMxbIugwjbPxn
 h1xQqqUWZvaabb0bam/QPoVYbwZmsHET8lrCMj2m5TSJJJ6ZDCt9efHoJq0J3U3rryeFlgkkqjr
 3klA0+e7075Qsz5S4W+Zg2JFUca1WAUqFyoF94tkThz867BsJ/5ZlM33vzBngBBHpAjaxCXGC0/
 Lg68nKEaiXpn4tSo4ywk2OJGAEp3AUCmwUpdBHkGefFapLXXHiUZXULUO1qM0KPb2tVcIjM9gkU
 GFHGibskeVbg4jdvweg5lUsTYSbI4Q==
X-Proofpoint-ORIG-GUID: 5Ar2JeTatFc7Gb5zNKsIUUFTwpLVQicj
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=69427664 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ErV4QAY03Z9ma4_nCwAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 5Ar2JeTatFc7Gb5zNKsIUUFTwpLVQicj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170074


On Wed, 10 Dec 2025 10:05:26 +0900, Luca Weiss wrote:
> Start adding some camera-related parts which can easily be upstreamed.
> 
> This contains the EEPROMs, fixed-regulators and enabling the CCI pull-up
> voltage source.
> 
> 

Applied, thanks!

[1/4] dt-bindings: eeprom: at24: Add compatible for Giantec GT24P64A
      commit: 30116121412b1aef99899bacb51f7ccf2511f223

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

