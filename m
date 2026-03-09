Return-Path: <linux-arm-msm+bounces-96250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLHNFjO7rmmxIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:21:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A5C238B4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6569530945C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F473B52F6;
	Mon,  9 Mar 2026 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKKrBhiI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/35yXaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B788D3B3BE7
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058126; cv=none; b=nz6XbK1hvN3micvPu0e0ERye6zxbAwbtMIjq7GPCjWX7ysB14h6HpG7YGmCSjwanYPSgVy2zdu7PNyeuO1zzkKwE8diV21WIhJcBGONbZBpjnTCMvW2lwJv73XtVeOuOYIwB90SQf0Se9QWTU4kZeSP08NSAiNLnLkpTkoMay6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058126; c=relaxed/simple;
	bh=1sn78LttMrRMUezN4gisx8QGKM/WL0hmkjnpTYU7Iwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DruiUPqtEspGvZXkNmUIktm14eD559pE3VV3wicPkYON7iXochf6LT9GzedTsxzH7rpW7W3NxFKov+KmCP8jCFNOBelZIyxnMAyyTHbaj31L6s0eDDFSqafDU3vzj1HrXOqPfPaUjNyH5ZiJ0aIDTOA9UzDxDXhiq8IG9WbSpn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKKrBhiI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/35yXaW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298E0YO2661747
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	biU6qmm1Qc3frwDzjn9znEgNWGd+TV/qjx80ORgvkWA=; b=fKKrBhiItcTGd1HD
	2aebwXqvtmlgU3+i0JI/P+BsaHa9C7v49gbykOE1NiN5VFH0g4dCfufAoFNh/HnZ
	93WLK/KjRpDZGYbqlKmsEuqB9yFzDPNjXZoR/LsoJEaJfvmJDZ9mybaH67VyfGNs
	Gm53T75tt71p9mf96p4K1mhVHPP/svN4ygjCgmqjMFcwbn95YPlosp6jEl6RZDcV
	N34rfbaBt6+Yp/R1IlwMs+va7KcZdL7J++e/wLpgDuHFV2AY1vsE61ta3unxC+5u
	qfr2TJZ4sWrKitupVvPAqqeLQ9/ev/WpepiWov8rZRsOlCqV2Ji1RNc6w1kMqypG
	a65zOQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpnkpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:08:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9484dbd65a7so18924147241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773058122; x=1773662922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biU6qmm1Qc3frwDzjn9znEgNWGd+TV/qjx80ORgvkWA=;
        b=b/35yXaWUrgriRIiGPI7Vu+Xc59kh524+O9MUJ5iGrVn8FOwxuqeYcTYlyi3DvC4wA
         SFWnm3BLcKAkK8kXBwL+sCJefC53c8RBHCOAnsbxAJQS6qmXFKhwR9j8sLkNeiWDgpD7
         RPJX1pBlIa9S9Y2Q3FdI5DE1g5iUocjky3IVpbPnj+2AIfCPTQZmAoekxCCvExIB6CAO
         w0BereRRgrLyOYulUWH2p6NbXmnWoGjnDTjpx/5fwvA52vaPMdASzy5+ud07mArstwa2
         U1hOPt3MDjh93ABa5kKtkplxqmzADIgrhD+mJQEjEbPLSnn4498kgXGerweF9b6gCSV8
         2cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058122; x=1773662922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=biU6qmm1Qc3frwDzjn9znEgNWGd+TV/qjx80ORgvkWA=;
        b=es6bdg49WB1WOO2evNAmNfa+Pt6soS9OYosMIYFAR7S+dMO9uM/froip5WMuIdhDVw
         JRCuFbBpo8VOvoU3vEqmFM700Qu35JpOVocfp+sKopb8MaKkgB9ReOW83gFywhGh7xx/
         /z+nFUiKFjU3+1TJiVumEgbHa1QKR2U9hJ11qKaE72TeWfD3oDvrvyT/tq6V1qtIu/tg
         bTB5fTo+BVNMX6u3GziYMAaazTi7B/rFVS3KWmIN9RsyL/1OnLStZDe/Gu34LCcC2UzG
         GzD8FIP1v2KIk9g56w3PoXe9hlLlAKy4hnEaoYpBayH+44cUC3MJugEOA9cwxGX2S/HR
         RECg==
X-Forwarded-Encrypted: i=1; AJvYcCX4oHN76VHaPq7NeCCKbKkB+qKQxEvEEw4J4U+D5QAyVFiPMeq/vIDjQJBkLk2treTgWvetUFBt4pEKTDBA@vger.kernel.org
X-Gm-Message-State: AOJu0YwzgFGRL03CRxtMP52bX+OHIzIYRcMsEs9rWh+L6S5lNOuLHckC
	KnoMw+qqmih+PEXH727WG6DrbTtF8aq5b5K/+C+xiG+nYMiT7oRCo3w3Tf4QtTIrKzBavpGfh9t
	VvUm/bQWvNlwYEDGDm0E6fuFqjRWBc+DWvxR92WE2Um9IMsALPo5C6cPR+9cx+ufo2rlh
X-Gm-Gg: ATEYQzzBSaq5XZmhyk0qQsKqyXkMX13UFYCp3RhxpkE5md8dmZhBGtkwXMnG1veK39+
	POmElIvIAMuh9bTTgggbHZvlW2KGyRszu4alqbvyKc9azYp0SaD1CJj7nyTkmfj/xwJ2nkeHjj1
	toOY2IGucy7rBCKnD9thW4HmV8H3tHKVe4JZsqZIfX+qQBmA4v8nu4pugIYb6LC1vN1wQg15Civ
	93W/ImVUI8arhyYdpzGc/zwG/dbFMXwtXEcVU1Hy1n0FLTldsnYmcPD7o55rMh1fxTzVBDPQRdd
	7c69t5HBT/X0Xd8uyw1PZCg1otWDExX9kDPBE2svqfwjJMJwOurPxPZdB5Oi1cBatHUms/nvqKZ
	sLpKmyzoM4mVu6C7EmraDw4yGOtsMow==
X-Received: by 2002:a05:6102:a4b:b0:5f5:514f:4e59 with SMTP id ada2fe7eead31-5ffe61835e6mr4225429137.27.1773058121944;
        Mon, 09 Mar 2026 05:08:41 -0700 (PDT)
X-Received: by 2002:a05:6102:a4b:b0:5f5:514f:4e59 with SMTP id ada2fe7eead31-5ffe61835e6mr4225402137.27.1773058121350;
        Mon, 09 Mar 2026 05:08:41 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853916624dsm107826075e9.6.2026.03.09.05.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:08:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 14:08:18 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: glymur: Tie up the CX power
 domain to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1sn78LttMrRMUezN4gisx8QGKM/WL0hmkjnpTYU7Iwg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprrg8fc4+sPoKdDY2Eb5taRX5DOH6v3Zl4lLW2
 ijciGbLme6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa64PAAKCRAbX0TJAJUV
 Vj18EACf4Ia23JH8NmLv3m0caYlOVVU21xeaPcgsVvA+sOFbskmtYAYOHma4yty7t5LYug0Rm67
 2F87KyGnUiFGTDr/NPM5NwvytfFTX6dngnhMVDSaFo8Gwfnmynar0Q2OnehYz0GevkqoWnLpoTX
 cZIAP8+yN5/GagaTDlNflw13g2qHyC5YSlEOjqGHq2sYi4rI1sGq57Fb+ilgnGI6y3wgQDouXM5
 wHfDLnWq1e+JtjcsW21z19i6dPeJi3WZDUr4muhf3LXI9xnbn8dwgmxh8CWiGz0x2B515XNLeSE
 reGT4nDOcudBAP/CQP6LpvzJRuQkArdG0igqGLeczTF/w6NdbuJANuoUu9fHNy6Vuw6XcjSwLJW
 bWFkfgnA8Tb5Ja/HHzrq4qnPzAyo/V9f/b+TfmrZX33r1UNvHyLdzbbWtawB6HDCqrjnz3db7/0
 04k0Yulx8++PCpC5MIxTnIpfBnfvKVWHtEvceYCceQotEo7Cng2SoWQlUVMa2VslRXtlHGo8Q3/
 kBzRs2uTr7jOoHo5msTwIFMizoGIKQTr9Mv0kQMG6qZFMQGngug0Jd8AHONzU6E+fiTVC5FsleA
 2O98b1TKlzrYJjozpZy2NByQqaWrmgxIjdqpG3DzwreYYapFNEqgXW1z6vqBmzSw2uMTQJxugNK
 c5qq5fYi3XsDMYA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMSBTYWx0ZWRfX2HIPyQsLDbgy
 1t2sQEdzebs54b9OUJXiV/lmTQiLFs4Fwh66cqM9CwwS042AhU6ntwz35+XnFa2vyV4mziUEsH2
 A2pOpGuC7up4thQyifwEczekrmscjB08qJw6wXQ7LMlNluugLCSFb8N+r05iTI9o6nyYqNukX6q
 +UJ/IZ7NHJ8E5pabqFNT6bs2Wk5NFBVwPPUPSGVov6i44YgyITxbsFupm1L/eKCNscXmmae7Xz9
 DpHRYE8zQSxMAHR5WubQ1XG5swjXg9Q3xHBmStDmoBfusLSuzzTifnsvTKKa07reIPzHFSbVWVv
 HnJTPnr1k240wq9w7XDXrSFAJ3pB87ZYg3yPwd9TvR2Ccp3LAADUCaZX6BsFs47qI9SpQ8zCgg3
 hXW8fAxp7btQZ/rMtX9PhYmsqvNI+j73/BoWtHVqXPEpZZqhBln/uSVgxfe3fYql0zUBt59QH1x
 3BjiI5M2b9xWta7FJVA==
X-Proofpoint-ORIG-GUID: TMkfCdplYJ7u2fyCQNAvdTA1RpfvI9MS
X-Proofpoint-GUID: TMkfCdplYJ7u2fyCQNAvdTA1RpfvI9MS
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aeb84a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UtH7f_zyWO5jlmvt-A0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090111
X-Rspamd-Queue-Id: 58A5C238B4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-96250-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.12.53.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,0.1.134.160:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.934];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

It has been concluded off-list that the Global Clock Controller needs to
scale the RPMh CX power domain, otherwise some of the subsystems might
crash or be unstable. So adding the RPMh CX power domain to the clock
controller which will result in all GDSCs being parented by CX. This way,
the vote from the consumers of each GDSC will trickle all the way to CX.

So add the power domain.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c..5f8f208f6063 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -764,6 +764,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.48.1


