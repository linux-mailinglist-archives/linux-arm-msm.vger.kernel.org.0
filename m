Return-Path: <linux-arm-msm+bounces-119264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CDROCW6LV2qNWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:30:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B575EB10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:30:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NLsNtj67;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ef8QC93k;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119264-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119264-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F3A5300B1C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9D747A0B0;
	Wed, 15 Jul 2026 13:29:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A7472791
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122187; cv=none; b=N8fNtldSFvByg/ICAKCfnV1lIFPYym0Z2n5QihBidLV04p5R91ETjgfnSIhHgI/QryqmLo0IDEyDCpQmYnZc/ZhHoZ9HsybhLTbDXYsxKawzP1XylcwMlSMI7nq7NvHMt21QL6zu8p0zz/yLftvNcVd9r2o25H4ZQz9TYhOb0Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122187; c=relaxed/simple;
	bh=TI/gyrgYyEz8i0ey4itqHCNeDUaKAi+EuBFY1yy/AZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDuhM5gFsR0Le4wUvM/cxnjM7mhpl73Xw42SiKXlVUtVtsMIQ9zl64t1KJMVLwMhA7jmr/OPiTOTMk/PBTpGVZ0mB3/YNrO61MjvitsAfbzzCGta+Y2E3a5nybqndCH7WBIDwAeie+AXxPNf4cZ4pHjW1LraZugMMBK/RV4p8EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLsNtj67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ef8QC93k; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBccMm3766625
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzZOrKAt4LK+OFMk1yB3XTUxJCJnJ6As+g+ylKMvyqI=; b=NLsNtj67uCMfZOie
	zFAh0G+4gmh25fIN/IwmMgpL8jbwInCC8AqR9uk294dzjSqLCMu0DcMjKJteuFG9
	6XQLBfCoIKKCaSJpqOAfq5zkqa29nXytiCfh1Fw9M3Gc0Igc2bDWrC9h68Qg7rw0
	EvDzHLbZzIVLtrXYbMd+MqCcSU12qxZaSKn1yD9fOILk9Tmjrgto0ULUkC7K2TNm
	V8EXlYSldb0oHSu7m2uh/cStJ5xvQ/AZnfmYGzpRC1LoBQ//lpUzVDGFx2yGWq6j
	VJS6HB+YpJ34LynyN5u/ifD0tHYPlGrRjAI1at2wKX86FCh7d13daA8qwPFL+Mdd
	GwG7cw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558syy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f18c4d1f82so111908706d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122182; x=1784726982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzZOrKAt4LK+OFMk1yB3XTUxJCJnJ6As+g+ylKMvyqI=;
        b=Ef8QC93ku2G6Eg+75aCshR9vCB7wGZYiMUlMPQrskKbIXQBtv62ZeaiQN/9h3HzSdq
         mP/DbC+rw3qREUKV6xpRSYLYeT3BilnzAlnSWpKXnNDj3lkcoPgx5d0o0LB6qGfistDv
         +q/ndeGnGsl9JojtcDjC14cJMzVdSOKGHJZ+1bVgt8jstRsvNSF3GNQ1ictek26GMnio
         ubUm72Q1Tm27UEuJJB+S2K4UpVLlkBqLBnTNwcUnAtGwxxqfh7frGDmhJ2AhkQC1FbHc
         djTJqpVbaQUyGfm86/IoWCEaJOw/0gMxZV7sYDLWVhP68Y5+loglZE6vuicZ7fXhkSFN
         3bWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122182; x=1784726982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzZOrKAt4LK+OFMk1yB3XTUxJCJnJ6As+g+ylKMvyqI=;
        b=ArgpRtCC6VV6/6LFm/u3yVVECnwzIYQ3chdig83ubtf6/ydZC5a38smO8WZ19tqdgs
         ZALSExl5rfFCrCC3qvasAJQbw1dha8MmuJRyTPIQHdq4ZXkHPzShR1RridjgFA9cz+9z
         HyHMxJeZkbD+Ny2l39+FetP4AJRlVlbniPdSVTklgooJUN/FTIwCT78Oa7y8zlqiMro5
         vpM3FxTbUHtDm1owgX07UWaYVL41EqSVmPGXIpeSjm454tD8C1kXR7ol+Ta2is2gBz6v
         A7qux5yfMHbWxh++f67lxI/qWoKK2H6UQNsHFnkuMgNxw/UAtkpmrL5efCtf+qbwQWzc
         goTg==
X-Forwarded-Encrypted: i=1; AHgh+RoiCYx9SA/OQypuvfLVM8hVFzUwGhHu7WwSeqOyftJBkwQMZqCeabqdIzoazFQShTRE+2/8tPHVLDLX+3fA@vger.kernel.org
X-Gm-Message-State: AOJu0YzXeeWKQI40PMtRqKUL9JXNsry1NT4fLIPHhS+a/h5vQ7T8vxO3
	eISekELO9aQtIRXX5iSNO8gfJiK3hFjA4PkIkaxaSVFR8gkOstBciFqq4sAm4BoB2joV3H/N15O
	SSzqBD2CDqQ37oXfU8yclGTE8s49nncylHWBEIMDHBxwRjsI5RqXeM0F0PAL/vU7qadaO
X-Gm-Gg: AfdE7cm/pAzVxazLy2xzzKVmjJWuEorbz8tJGWk/c8eI6nCNYZ8t8ys6XpgJakakylI
	VbZxmjXHo+jOFQlHv63CnE9vjwIyRhF4YObVGRCbBF3fmdXYdGtSyogLm48i2SaqbPkk1EUDD76
	1jBjB/qluOTdez2zxydZe+vJwARTJWYgHXbYMLU7TFuw7tjKIB0ioiXjVST1c/VeCEOiVn9H6sm
	XpTOFVWiCyL8Hegsrl7X1QtAJJjkacQ02iQweRsu0f9cD1IVTVYNWWoAS7ZFUU66j1Z8Eb2EoVg
	KFdOTsaubcV+ycJYplrZkHoEqQnJgTOAsXOJu41M6BVbkttmdkIYywlws2gxZYNmkgaDv8V6R3L
	5Oy2kTfPRzrefrRs=
X-Received: by 2002:a05:622a:1115:b0:51c:1132:c7f7 with SMTP id d75a77b69052e-51e4effb2a9mr27156011cf.29.1784122181592;
        Wed, 15 Jul 2026 06:29:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1115:b0:51c:1132:c7f7 with SMTP id d75a77b69052e-51e4effb2a9mr27155431cf.29.1784122180848;
        Wed, 15 Jul 2026 06:29:40 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm16945760f8f.14.2026.07.15.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 16:29:16 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: glymur: Add CX power domain to
 GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-fix-gcc-cx-scaling-v3-3-72eb5adad156@oss.qualcomm.com>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TI/gyrgYyEz8i0ey4itqHCNeDUaKAi+EuBFY1yy/AZk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqV4s2f5gUaCvhgvRPOTTAzerKP68tO0AzBGf87
 kuHHMb0HFOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaleLNgAKCRAbX0TJAJUV
 VhNDD/wKtmNqexfsK16cK8uJ0dSTT/q3Nr8z1KEyNnoErCJ/kLJNbeIxT8tQUm5KUFrg7mXYK+N
 xN3S2CNSBkAqF4nH487Ii6ZqE3xY6o+PpvWlFK9o8zfdh1ZLvKCOP3nEGkClkWtJGGnWy/DJfI6
 DVU6IL+oWzcUNxQrvLEFI4Pk0ksMRzPOnAKlpgAs0nHVJeeGyMGP7akXzcBJEohH1TgtjMMTjBG
 ibsmg9hWpTeKaZNSjPXyE8MtsBz8yXhDGxurNH9sAcfWyHOabjYfbU4AJ5mmsUkHGcx3zHT/vXp
 y58RHnL3/xpaNzOfed0ekcrchQE1/bBNGb2HhQLS+sxLQwNvAweKA5gZv7nB/t/5W3xDnAz/MCA
 LyIgRCoEt5Lon4J+Gm/stD9D2cNgJzGqoYonmANDZeWbk1IBgb4cXRlp7jlLAV51oa/mcaFPnL3
 3b3YLzvIf0csdYxSp0fCRTv4OPYBwCIYx3P0gob5/677TfESudx63mgF3b2rC82h8ocIeRZHZci
 zqv8XawD2pF394LRR9jceOv25uc02W8T+wPKhkEZZDPq4t0KowJsiz7iOBckRvD8z60+/qG+O94
 U0IogF1e+Ogo49BJHqK35SHbO9IK81P3/DWBjCp6l9l3fIHuTmKwj9rClsTXMsf8ltSxIKjZa0V
 X+JTmIT6o/8ZBLQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: JHN9bC-0Yer8eMrZjmktsL8jbxw5BKgu
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a578b46 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX+Y+g+oXVc1Kw
 dVSGsfS15vQnw3QfJ7IP+TTgRN6oxEZZ6e2dzVxjlEGBA+yTOpX3IIJMPyq+jvyTe5o4dP4TFT7
 ylBWd0I5kAq0hm30qJUZJ+rQoScXQz1l/tVm36LHHScK/EbczsXXLHu8tZ6+z3d8uRh/B9xksy4
 5Lnhygy9aop8jpxkeU8/gXrVTDbmzazrhAYHOTyS/DRNDYfeeOpuTNBVyluqBi3bYsEksL513Gc
 o5HgWhBZXIjZHQ8VCqEdrYIBd8w/bjT9urwa0At9zo2+eusQiCtB97GbIZ3K/aIdj/M1zGENOmu
 UNdVVPlgvWJIW7G6BTeyvgOTT6RLdNFdm495a8/Jjh9S3RY07ACB0W4PUXlOpR3b3+EoGuNzCoY
 WJhHpCemKR8zSRgLzwBPoG1O/svTxBVIayAVI2jYel8VEAKWh1zGt2ZO1mKQKdh9HPwhRAS24B2
 O5R/ac55j6oEVLYdINA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX3B1s5Wq3ADqC
 gbfNNoHypK5mpdHcxYRdiljTheoUZstxOBCrSj3eblSS8SXCcJG4kGrL0kJYBtmr282XLZSXD2A
 Zs2hrQhUYB/ZgNk6SchuoZ5asapwl98=
X-Proofpoint-ORIG-GUID: JHN9bC-0Yer8eMrZjmktsL8jbxw5BKgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119264-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:maulik.shah@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bmasney@redhat.com,m:krzk@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:abelvesa@kernel.org,m:abel.vesa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B53B575EB10
X-Rspamd-Action: no action

The GCC GDSCs on Glymur are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..db2d5cd3d98b 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -829,6 +829,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0


