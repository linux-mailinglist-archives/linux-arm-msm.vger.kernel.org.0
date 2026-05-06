Return-Path: <linux-arm-msm+bounces-106082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD56ETkD+2kbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:00:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC44D83C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1E0E301104E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62B93D524E;
	Wed,  6 May 2026 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zt7FxsSU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g61UVNp0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B903CCFA8
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058020; cv=none; b=bfZSdcz4v4rRFSI3Urj8r0M/bhz2COSw7Yu1MPIsLcbDe4TRASnR11jyuH52Gou3FsWhuGjImjsaBkK88Eu8deq8xzRPA3puARONpytRb5OPODIRj5HNi1PLKFbCX9PBXFIzwfErOITWjol9tm9FQicqABGwUVvbRKx8sUXJjrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058020; c=relaxed/simple;
	bh=xmdz3wYny25bQ8pJaqI66NFrQHZv/ik/IfwMuKW2aUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kov6rpsTrzBmFx6T6O3QnrEQorI4vzTOt2kVHPpjZfu9TxxKgG9UWeL6y4rzMp4jROf74tO6ZAtC1+mhmS1ZnYDQG1qbhmqEHOenok+uhtfe/eRDh516Gp32z1FXjaf5cXGLwc1LbM5w+B81pzAQlnc1ify+hAWo8M5XmyZQV2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zt7FxsSU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g61UVNp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466AP0n3475616
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 09:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HgD8iPcNnp+ceVCeWbCaeZ6AScKdSFlYVKn
	hoKhaiig=; b=Zt7FxsSUdJgjc6dcEgGSzNkPLnUIBfu1Mh0ZiupvlrWIvG8J8NH
	YFHDT56xJnc+yH5W1tCAqTzKNE9uPYSAAHDP8ZXY0ar7utWWTctL8Ez1u9l7869K
	jwhvtBI9eJKLmf8mDNxIhR5vydH2hU0sgmgCIEF72Nx37OSq9s/MzFe2Cf4Hc+lX
	57mXvYAbgYMUrsjb5Ru0tiePu8EOPMLULx9m/ZFeWxqkiN8R5v5ceRE5kQ2Eewoy
	aw1dtrZgjmq3xrBn9GUOJ09B+XnQ1UgS4pkl5G5UNb5C4QQAIhjG1XaA3ECELw2e
	Uexj12E2WoQQqhFL+tlv8RoK5QQRWCWp/aA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhsgv4h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:00:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9a6a853bso156396871cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058017; x=1778662817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HgD8iPcNnp+ceVCeWbCaeZ6AScKdSFlYVKnhoKhaiig=;
        b=g61UVNp0MquR6qf/vm6smNuwMgGWBEtkJxBH3TVcQaz6aNbwOEusNvq1m6JnFppHPI
         Bpl+Q/+/pnOkoMKlELT6jxS5NWQ0GsR1XrxIQgEY6QDAW3i6Ik6OZjmyTx0561c4uspY
         vFtrXd8RF9lLrC1f5RXJ2PxRF6MH0UmcTW32y3s3elDbTF5pK7XJ1tc3XfEUHtdS1WqJ
         ZheMRE0rfXqKxX1df/w6vN6ERJo2pA4D6bTmfAtWzI2Gnlww3Q8G3rFtnj254UEB/xyq
         1k345DqRLC4yG0YesmI3u+r8lZ4qJZxG4iHSCs27sykl2gdrMBS2VRP3KEZFxJHrKDCh
         oJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058017; x=1778662817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgD8iPcNnp+ceVCeWbCaeZ6AScKdSFlYVKnhoKhaiig=;
        b=LoJeUNQqVI4mvGN/rxsRVOw3BmBLig5M6cBJgjc9kFQSd5KCR80SbaeHRQ24D7odqA
         6FjOtJFUCrE6Ocyc/+j/fG/aU1+8iTheo9LvxXiKPyR/rHJOIP5zBbRHAR/Ue2qLOLUw
         hhPr2W3gEKV8imwWaIw0+sCmCpLpeLPGP4xUFNg6g5hctpUSad2l6p2t4QFcmdSJ0e80
         MVntSQCmzknJnwTkrik6a7cmM8FrCg3j09/Qt00bnw4SEC2MLEUOTlhZBUogV7hX1b2c
         VtXgotnuInwQ2ApJ1BgEgzN97qG50KEFTuaOnZpeXswEWSxbB+ipDDsP+eWUQ3YCZaEX
         TV2w==
X-Forwarded-Encrypted: i=1; AFNElJ/D1gq0K4xv4ghDE6w3jYPDBLTe/gUECVfMP6ZzMNb7LZ1Yk1Fb6jdKUAp+DlCc3B/P5S1UrTKFIFY9BJZo@vger.kernel.org
X-Gm-Message-State: AOJu0YwSm6frXKy2xZu7oJlxOEbxgp3PNlDYr9F2VH7b4pm1bitQx9kL
	j1DqLcdYPc0Y2pVSMOm/D8HcPTp1y5km30+Ihn4gUU2T3niyTLldDOl/y6mdaM9OHYr57SD42p/
	SUFNxobSDLgMNrikRxydlf8U3K7PExN43it+6eHw4yIeo1ttd71sr5nKx605Vrvstr/i9
X-Gm-Gg: AeBDiesmgUW9obtFAOlrjMPHm7IiUjjTPHqFtVVCIKoLqFFks/i4jQm2wII+2f8XPm1
	S5E0wA2oyLFlStVXbuOiIXxhmxoU2MbX5/SSm/O6T7CenyYVjEW2f1Z7wqh7iSYEPE3uJ5f9FGp
	Imr88xJN8ckBnMFwPAXKFHYg56BCQiL1cebUvGV68s7THzWt1oMBGeY/J8IIx7TpySrYtDw9XqZ
	J43lWT2XY+fMTgU7cFmKM7MSjzMzS4FcN3L5fwFwYf0kPMu5Uq7tjpdJRHc3Ihez71R4xesZMTb
	k6Q/pVbjAq7wwQeM7iDCB6XRpWGZn/IB5V5EytZN/LKU7cC8//27i1pqgrs3niH+FU78FvnkYsT
	r7IJ8/7XLbET5urH7PuTPyyQBIoUTb/tZr+hqumNzGaSMeFRyv++pLdjf7Isr
X-Received: by 2002:a05:622a:1145:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-51461fcec8cmr33664351cf.44.1778058016795;
        Wed, 06 May 2026 02:00:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1145:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-51461fcec8cmr33663211cf.44.1778058016075;
        Wed, 06 May 2026 02:00:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1cd7:fa68:b1e1:a93e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e539109b7sm29277525e9.15.2026.05.06.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:00:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: qcom: nord: remove duplicated pin function
Date: Wed,  6 May 2026 11:00:06 +0200
Message-ID: <20260506090006.10905-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ReUtKhVQ_mFxbh9UUDcZCxx8E1-3x9yr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NyBTYWx0ZWRfXyy9b0JGPAiou
 OnOmQE+PpAzTXvGo0hchuy9PFFJenmO3uf0OEg5olIRyeA6oxmz0JQNhhVL1Ao/fb0sHolUg80H
 ilu5G+9li6HMb6FoYH5A42PlUkUa0qyCZqRgip7yhwJd9ZgbxO/+PL5rFG3xS66QKVZan/nDDUS
 eMmEtOUq9gkKGP6T04VihVxi6ozg+tFJY3yj1jAYVMoE5R8ZeV/ihcBpPeHTSurLr93DFPq+Qna
 ULSCGstDuBE889lUEL7Ae8CevD1PAMaedB4pvtyq/y4WWa7UaiWXbuordSqkv7NAk/kdop0Vk2V
 YW2YPzAa26WaVZVlSjlbuCl9W67582CnfXQLlimH94C4FurD365xgBbas0HgmP1edIHgUHQD1ig
 O9pTOuW+yibEBs60qt5B9anop6b7EIKrp/saWXGmh7MC3CR7Yv0mi7K5qApjtTgh5r/4mgoIXLa
 1pV6YtSHxbMH+PM9Yuw==
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=69fb0322 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=qCAjmkS9BwcdIvOu7YsA:9 a=O8hF6Hzn-FEA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ReUtKhVQ_mFxbh9UUDcZCxx8E1-3x9yr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060087
X-Rspamd-Queue-Id: 3DEC44D83C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106082-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]

The qdss_cti function is initialized twice in the nord_functions array.
Remove the duplicate entry.

Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605061633.BJLI5voT-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-nord.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
index f14361101bf4..7c21306e77ff 100644
--- a/drivers/pinctrl/qcom/pinctrl-nord.c
+++ b/drivers/pinctrl/qcom/pinctrl-nord.c
@@ -1417,7 +1417,6 @@ static const struct pinfunction nord_functions[] = {
 	MSM_PIN_FUNCTION(prng_rosc0),
 	MSM_PIN_FUNCTION(prng_rosc1),
 	MSM_PIN_FUNCTION(pwrbrk_i_n),
-	MSM_PIN_FUNCTION(qdss_cti),
 	MSM_PIN_FUNCTION(qdss),
 	MSM_PIN_FUNCTION(qdss_cti),
 	MSM_PIN_FUNCTION(qspi),
-- 
2.47.3


