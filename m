Return-Path: <linux-arm-msm+bounces-98790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LjkNbsXvGlEsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:35:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BDC2CDCA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2BEB3132922
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0703E7172;
	Thu, 19 Mar 2026 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ioBMm7Kp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJdI93gE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346853E6DF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934259; cv=none; b=Wmc8qd6H12zlpcqBZ6J51WvbYQqE37N9l5OKjMGjQkHR6Qf1C+EU49SusVWMBqYBkKi/g1FuBJ2yQsiZLM+VevizBoYL52s2d7lgYyt/cmYnSm23u8/MW95eSBA1Q+PtlZINdNTzUSnCch2MTseq7IbRY+tErimh6zMiLjKfudQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934259; c=relaxed/simple;
	bh=YSMTij5qLJWoQMRLFi5RDILjJ+GLHo6QCE5SPTFBYRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tgscut5yYeLOYjy0Iufy9/1IEh7lU1umyK0HPdLZWCGnNtFbdhVs+DjfXglWRzt175wSyVocw+91xZmUSPWioyzKwXEP0+EYDilNj8QxConE+zcdJYwySjB+jb+uMoK2EtvTDjc0wpmoQfNaXOOIG7Zyte4Se5a6wPKI66eQcbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ioBMm7Kp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJdI93gE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEW5Xq2981415
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7qDr/QzkkKfZPljDfvfL8j
	5LUyG5PbnV4OWI0F/OpHY=; b=ioBMm7KpBxs9Y6f/aQXfKpyZEAy2r3iEdlWFSq
	cq5wNT1tfnhZG/DkezARcqKpF52xqSjhdJxlZbmZhIiuv124SNWC1G3VAgAwrvui
	0gSQMsGQCkSmfSMzch225YJgEvo1dCd+RYzh/Rybz9x4MzK4uCvqWmM2lHoFmTkG
	5MbpyC6Pd8yccwBXYqUACltsqDfIUU3VzAXRqOy8PhV/ZdKm87FnIz9hlcSLzexx
	dnSsh+bhWvfsSY/jte8C4/KO+KPP7YhHe1Tq32hl0TTCkU8KNSHP6vbvxh0IyEAj
	hixGCYCv6SjonWPYpP6fdHAtT+NhzxNT0vdwxtJlYtsdur/Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0806nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:30:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60132c655bfso11393704137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773934256; x=1774539056; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qDr/QzkkKfZPljDfvfL8j5LUyG5PbnV4OWI0F/OpHY=;
        b=NJdI93gEUDkTCJTc3dee4o7XSACl9qBRN5rvUJLp1dytdSGHQdgE7lR5kHNGRJ8Gb3
         QFYMq5IG+ZjxIqT8hLQLqi2iVpk7FvandjSepkH6vIjBZD2mlveqtgMc3bakofktF+ey
         jbh0GG3UQUfVc+Gpylnr9BDgV0uTwSYvEW4YqhiDLoM7wt001601AOtpb6qtDkUlQbPM
         vp8nnVG05s6gONo5UMSHrTxndh4WrLEdFtIqQw4A+UmsUzbP52ir0TwFd85wFttY4JNY
         itL9lgavtuZLbw+HDDORLfZ6MGmkeM2BSL6SqEiRooO9s9arhiSPExs0grEAiACfaRLz
         3WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934256; x=1774539056;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qDr/QzkkKfZPljDfvfL8j5LUyG5PbnV4OWI0F/OpHY=;
        b=Ec6Vk2XiyhlDLWFPGjXQ6dSrXtPguu/NjGvtQYPWePycYTy/kwyjqY87a2Zg1DfXxo
         Dbx258z171dD33mYBZbi9DYPEMxoCOZ3/1NgB6jPm/u/KyOtnyoBrqwKGSm+J7NFKRTR
         4fpniftGeavu6VpTDIppW1vU7l0sVyn9yhFa/iHw0MDIBhxxRXsxtU7atwIuao/sbAnP
         A3spShuZdVosB/lsVU23QcWMu/ItUyOO51+zdwF5p/mogRddQkXIc6rlKFH7w6oMPh7L
         oFMX7Gm6ef4qZmi/SVSc9xOliVlxtKHdP3+zphPGQ5qap8CDILjfUVUj6zqUpOcFbWxS
         i/GA==
X-Gm-Message-State: AOJu0YyjqQalnOp8vM+rVlgw6fLxv+Zr680K/qhNEYSVD2HQd4ByZuM1
	nl0mDkAN1iDKa+OgUY8LXGpBnECeKQbGNR7wgwj/Ku1f4plVX3ff+rKsZP1ToMddE5zZkaVJ35j
	6N4LSZnr11P9BEpNYTcmBYfroTSCoaElHNwGkncpiZGtQjOZmwZzCilb4DzHxpS7t3gBmNHgR+s
	PL
X-Gm-Gg: ATEYQzwPLPeD1buKfPXgNI+gj4zYAtYDv0vlmyEWzMLqQfVwHAvNz1b669uEjke17xN
	WOF9kOXE401fKp4r+kOpl4Ef03QCd3PTdrtjNihtrfhzIv9tf46BOq12X3CJGesM0wGxVHavOvb
	gVPK8SJPkB2ao7/9OkHw9Z6/S4+jpKgjcAmD/dS+U4WUIb+/E3PFySyq2m1wk087henBlO5hxq7
	zFlDeeXTP9iYArRSbp2CUnNqUwz1VZ2bZWLkOncd3DnLDYw9bAuLbjkvwVeoTQuOfzuV7GVqld7
	fRnAmNY+1dd94iMUgDCeg792fqJM3yGGdEaB8KKBmC4HF8GHCAzClCFcxTqKTFoTBssHm3WeKY4
	YwCqPyGaJPWyMVcXtmHy6NejKc5M=
X-Received: by 2002:a05:6102:f85:b0:5ff:fac2:836e with SMTP id ada2fe7eead31-602956a84e6mr1960233137.4.1773934255546;
        Thu, 19 Mar 2026 08:30:55 -0700 (PDT)
X-Received: by 2002:a05:6102:f85:b0:5ff:fac2:836e with SMTP id ada2fe7eead31-602956a84e6mr1960194137.4.1773934254930;
        Thu, 19 Mar 2026 08:30:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0b9fdsm78590705e9.2.2026.03.19.08.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:30:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:30:48 +0200
Subject: [PATCH v5] arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad
 and touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-glymur-dts-crd-enable-kbd-tp-ts-v5-1-4a440594348b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKcWvGkC/43QUW/CIBAH8K/S8LwzQFuQPvk9lj0UOJVN2wq00
 Ri/+6BuSbPM6EvDEfq7/92VBPQOA2mKK/E4ueD6LhX1W0HMvu12CM6mmnDKBS2pgt3hchw92Bj
 AeAvYtfqA8KUtxAHy5ZoaarRcq4qSpAwet+48d3j/uNdh1J9oYmZ/Xng8jal1vD8jug0Ipj8eX
 WyKDs8R7u3ZmixzNUUx37MUK+c5pV9+87XWwhg0hHEYeh9BMKmFVZaW3DST+OM8ZPKImUI7AC2
 3NJ1RyZpmIk+zdyH2/jKvb2Jz+Jc3NTFgUAtMrhSqlWLTh7A6je0hj75Kn7nFxBcs489ZnljOp
 dSIlalF9YAtl2z5nC0TK4Sprd1i2oF9wFZL9oUlVIlNopAtKyul/lvC7Xb7BrZClOGoAgAA
X-Change-ID: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=5832;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YSMTij5qLJWoQMRLFi5RDILjJ+GLHo6QCE5SPTFBYRY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpvBar7vyS6YnR8y7enRoMOX0fyoD3ZoYoF9v2B
 AeSr0oymnGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabwWqwAKCRAbX0TJAJUV
 Vm0tD/46h8P1ZLUqx15xbo0hOFXj/CZHBlrLvwpF3E4rFlQuI2J+9fNxkq6ubRFFJKTFJWT0OkQ
 hswz9fEpLetopIKvKOOlKGF5RDISTXV/zDETyNXJegfDovkaEybx4HD1Rpa4TCuxVnrWztDxH6r
 QvyXc4dP59jQpU2T97webh7LdiVxLhH80E0VxNmjklek51T1jfrvei9/yfm7wn3KA1ap4xfOc1y
 n0D0LQVBap0KicDILcbcqTOhyhG+Y16dY3GihUukubSclY3n8lJUJUwFw8iaijzs88hLORJNR0V
 BFwjs+v+zgGMLl+LeN4apStc9nmtnvAP5Nb+69BByI5XNtqy/yeZ0XIKJNwV/Mgl4Vo7o+XkJec
 eWXIQDwORI9U7ol6znd21iOtCSEyIHboOny92km4QSY2RgLVT6HWDaTfdvD3zpaTdaBFn2ZjdNt
 qj6vGr1Kz0EvQiHwBOJOa3ZfFJB+1MZ5ITY0hNnN+ljCJJWwUxV+CHCQaJvjNoLZP8nmkyLtoo4
 F3+HagQy33qAQso8Y5rGShwUKBuohmPjYIH9Bt7FeqnQI//OJSsz7n8qpaFhqtkUTcigTBxU1wW
 9Klwny9GJKjIbCZuR8nkplnNE7aFEmUNmWe6mDlqNEnA18spueXF+/ksWLQmLImRvwEhjMjMCWf
 La8c3Q5urLR9wLQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=MYhhep/f c=1 sm=1 tr=0 ts=69bc16b1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BKRdnOoi8ktybqyubDMA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: YGMbzQMFUuXaoIXf1gmsVwvkWhSncjYR
X-Proofpoint-GUID: YGMbzQMFUuXaoIXf1gmsVwvkWhSncjYR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyMyBTYWx0ZWRfX3R6ESYSs089U
 VbScvdi44o0RQSQzZQgx1Cx8nMxjiTjofpyj/vFsqeMb7WCZKt7Ht8bMgz61nXOhMhhhC2JnH4R
 NFxyiIrMKXl5GkDLhD066QEH/M48RiBHRN+1p9mhWLLlKb2yqFoyZKO9iXgyLZBsv0r9L1lf+lF
 FxbLwF1myUHQ3z4tjPhSZZrmUWs9zoXrgOmCR2r+yBU6qyaWm94tmwpBxo1K9zR3o1KEhFVF3Gb
 LsNUbl+d/OGwy+lrx1oXehtxXm9ow+UQNvkuLOi9dsJSVYQ5VtKpa+u7wih8s8vI/xur0Yi8+IT
 5kV6Fs7HGVg4I4WTig3aYWGj/dS1Ale1O7iqqRKBJq9yP8JUZrpFkKo4aEFYvW1dBArGa0yZM86
 SZU8Fi5xuDqQlR3W0MeH5qPqfrcRo4c5u8kHGksiDO4Av0R9h8CbKqjAZWlIqGYkaz1/Jt0YK1t
 AKxHgnhV08uRK3K9S+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98790-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48BDC2CDCA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On CRD, the keyboard, trackpad and touchscreen are connected over I2C
and all share a 3.3V regulator.

So describe the regulator and each input device along with their
pinctrl states.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v5:
- Since this depends on Displat DT patchset and since that one
  had to be respun in order to drop the non-merging phy patch
  dependency, this one had to be respun as well so that the dependency
  tree is correct.
- Link to v4: https://patch.msgid.link/20260319-glymur-dts-crd-enable-kbd-tp-ts-v4-1-dfe67a134996@oss.qualcomm.com

Changes in v4:
- Rebased on next-20260318.
- Dropped all dependencies except the USB DT and Display DT patchesets,
  which are needed for this one to apply cleanly.
- Link to v3: https://patch.msgid.link/20260313-glymur-dts-crd-enable-kbd-tp-ts-v3-1-66c5ddfee97d@oss.qualcomm.com

Changes in v3:
- Picked up Dmitry's and Konrad's R-b tags.
- Drop the output-high and add bias-disable to the reset pin of the
  touchscreen default state.
- Link to v2: https://patch.msgid.link/20260312-glymur-dts-crd-enable-kbd-tp-ts-v2-1-2277bee4c564@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260311
- Re-ordered pinctrl properties in vreg_misc_3p3, as Konrad suggested.
- Dropped next level dependency patchset.
- Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-kbd-tp-ts-v1-1-56e03f769a76@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 117 ++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 38cdcf662ba7..5089ff7cdca3 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -13,6 +13,8 @@
 #include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
@@ -139,6 +141,23 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_misc_3p3: regulator-misc-3p3 {
+		 compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -446,6 +465,64 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "hid-over-i2c";
+		reg = <0x38>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 
@@ -626,6 +703,19 @@ key_vol_up_default: key-vol-up-default-state {
 	};
 };
 
+&pmh0110_f_e0_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		input-disable;
+		output-enable;
+		drive-push-pull;
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
 &pmk8850_rtc {
 	qcom,no-alarm;
 };
@@ -664,6 +754,33 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

---
base-commit: 54526d6c29ce58d5399cd4e2237d631266ebaaef
change-id: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
prerequisite-change-id:  20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v6
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
prerequisite-change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v6
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
prerequisite-patch-id: 346f2db0933c551a039f63b945f989a5c8320657
prerequisite-patch-id: 919020405b70d588fa4356a5cbfb44e67006102e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


