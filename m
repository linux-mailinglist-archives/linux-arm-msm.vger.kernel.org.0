Return-Path: <linux-arm-msm+bounces-112230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CZWgKEg2KGoFAQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:50:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C573661FE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:50:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=USq5plSF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dli0CuOr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112230-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112230-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3EC1F3028FEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E044949F9;
	Tue,  9 Jun 2026 15:33:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6012494A01
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:33:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019184; cv=none; b=JdcN+oQ7mPzdHvwrFrVCZlJn/CFqCecrr5pnBx3jAbhsH/dzaY/NXSeR1KbUlGBenvF2r+w0njhJJzp/mscZJgvbC5zKVKn5os1ZbhFwfuChzFLzKn5br9PSl+B5ygpo73KTOckmXA6nyhenmerj1j2H6Q1GbXPtq1i+plrCbFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019184; c=relaxed/simple;
	bh=TsASqrfqbK0Ps3uvYuUtqGTp6RdNEPy2IAP416/PQBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMeoYHINWjpdJovcLJFxfpK8rySBY8w0M1gnn9idkoAEJpsS2AmyRsi6iBhdJ6Wt+1+gcKEIVGmbSgw6EtGFwmE11cOWTSoQrWMBdOxqx1VVhmHSu9jJa9neAtK8wWUt86Y0HiPtPnp9nX9HcZ6yhDtyImgVJkpu/6+wpMxkbZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USq5plSF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dli0CuOr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmGuM2587831
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIxkjYPi5r64g4tKh8xey/X68WIJJQZ/eTl8Upurhj4=; b=USq5plSFL/AkikjM
	A+Dg3xKEjy77GqiTwyuM3icTtyNpiJfjysy3J+ZAGTv9P0bVZI9EjaSrYjf79TbN
	7e7PiNcqBL+aRzQ6q0f6iqxTkfdf4jUofs4yMv3vcTHLD9gm1202+yZKGZuwFpoM
	Kp0mAIgG03eZjJwtSFW6ZhTw5stXNn4kTZmnCduvxxYYBj7cLWcJkfdG3goHuasf
	MD/zxwjKdPP5jBanIk0n9T++H+XDVi3GLV0tA/9Qb+j0HuznRPf7EWmDQA+suK7w
	jELQZfGHv86epryj14rXwCx8PDDSoc5t48RtcEIe3+A+nUJbdk9ieu1aCrA8XDL8
	ytBQ+A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4j7c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:33:01 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6ed99b9b4so12608173a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019181; x=1781623981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIxkjYPi5r64g4tKh8xey/X68WIJJQZ/eTl8Upurhj4=;
        b=Dli0CuOr7bR4lOZxwmL8LSdjTb9aOyaGs5+YyjBRpVfF2+U3Zkd+VjTBfL8kTNKyy5
         PJebv6Jxv1yToxPlgtKUIiwbgJ3WzETJGPUWCpsOmNUouDFxoMqc2jn6SmIhatAGOdk3
         8Ycy0OVvgqoCdjlykZzVXUYzOsBgs5rQYniD/AmYWAZRcp4G2u7vz6d/vPqc80c8Dru2
         h6rMQSM7D7m0L+peLqvqoO5Z15zWoEqT/jQ4uW9csQwsDAQtGYCz+Cihmvhr6dCo8eaV
         sF4ak6OvPVr+qAfki2SHnuGyBKZmUeuMqgxboRNRFup5Nx6ZpnwpvxXdgQ0cwu8YRBP/
         f1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019181; x=1781623981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jIxkjYPi5r64g4tKh8xey/X68WIJJQZ/eTl8Upurhj4=;
        b=Yl3HcdqeEv00NrsapVth6x9PQRf6jE1n0/YhChhJtokvHZS7f0exzKe1XRMTEtIsBQ
         IXQkzIcmuMsmcIRdYSHBUPjLegir8m38fSSqSCJdUZuM6uXRyqHRkCrfRVvhngsMcGaG
         X2zTBLKLjZqK5Z/lqoPS5vrfX111wPQV9Bs1poog77zWhh64MRfFYQ55iQ2DS6Ii67O1
         dp2sjDqh7s/oinRWBedvuukaHnepa5kb4rUU9gyZ2Yg+OtFIqaEFC5npDy1orP2ZUsBK
         /ZbDJzDhrEegy3IYrUzdbE+WyCM/7/eK+ZQx6mvAt7En2v0IREg8m+xiYwVvvRP/TBGP
         z2+g==
X-Gm-Message-State: AOJu0YyyruRolqFjUBWYf99zgm/cVm6D6Y2AEhaIavaOi19rBxVvOfcW
	J0XhSeFydFEQ+uu2lIngsOQtLPXTaUHnNPCm3/pr3uaRqPrSH2UeEE4VByvnj31kZuFwurXipNV
	28qjtdoMHv4JnCkbNRyPXJSr+YbNpr5e/xBQLYAG/WjzjQz6O0DpoAwLfHUps9xvyHPI0
X-Gm-Gg: Acq92OEImv19XbYpqHd5rcHgHcEPZeIJ1lfMa/63VoWbaNQvMp74exp2Ya/Zo6eDnIY
	yc2iz1zK0sxRZQqyNalMyI8+WoZIlGKPRoP6bQfOt+dnryQoJKder53FBvtj/3bJ4kki/UQWTYk
	8AyxucZJrQkpW152yiaNXy18CKVcwQ2SwkgCsE6GkT6ELiJdW4E6YeFTGTLmkkLLzpWOuB6dFBo
	BDazVSLZFtR7mvWVmXrUHKNze6AnDMGbxWpFvCOpfFVkjmWx2glR1PrtvMjsxM9NEqQnyPPQ9q8
	ziOOmPYoOzgbtt7qSF0W9z0J3Rt6DUWACEPYudRPFNwCxEopYqEFGnlDcFdBzN6JdfS5MTt8QXX
	13TjtE/EiAZTLA82yDxh3aP8ftBE/ki5vEZqHh5eHM/7yAn4FvNdN5RZS
X-Received: by 2002:a05:6830:314e:b0:7dd:9b19:a875 with SMTP id 46e09a7af769-7e7516c9182mr2225996a34.2.1781019180956;
        Tue, 09 Jun 2026 08:33:00 -0700 (PDT)
X-Received: by 2002:a05:6830:314e:b0:7dd:9b19:a875 with SMTP id 46e09a7af769-7e7516c9182mr2225966a34.2.1781019180525;
        Tue, 09 Jun 2026 08:33:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:41 +0200
Subject: [PATCH v2 7/7] arm64: defconfig: Switch Qualcomm SDM845, SM8150
 and SM8250 drivers to modules
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-7-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TsASqrfqbK0Ps3uvYuUtqGTp6RdNEPy2IAP416/PQBM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIbxw51CymIPshnJtl+jqcnyY1YLMgo1IVsQ
 z73JtMk7rOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyGwAKCRDBN2bmhouD
 1x+RD/0bpM00k+so0N5oxtFjPrS7HNV5jtV44ex3SVyHoTMfdmLQ7+G1llSaeQc+pFydUAK1neI
 bbYUm0I2S4spbDPtWCMRQ0/+ZrsQ9vcSfpOweNwHaJLbnaXzcbQAqMD/0vZiSyMmFp1xImlUOFv
 QyenkWbloWNj3dV88vtGG09dF0+buRnrzs32ISiPnyHTaXGA0DqdvqfOjd4cOU9MTyXpK7wWSU8
 B9zDJZ4dDRLWxYyjIJB8nQAM22kkUpxprsEGf39YmbBzPVgrYWCXyEsr3FHw5T//MygKPof538t
 FeUD16G0KHGl9aiFLYXfd1YiI6+kq0Xyd2J5QuPbxzbhexI2Slor2t84rEqBkI2jRWZ04yFkMdr
 9/mrgCqWRxfdiWc9OFbc4xNPCGo8MBio14DkM7a+4TC/1U+c/29qt6ZNabB0FE4M2E8QMCvf71f
 G07oXUTq+npp8NThEpSfji0H1BOOFmqbUNudWu7SZc2Gu+sppYEmLUo0YNz8V0od2a1vx4aepDe
 ir6n0XspwYqNoc97rJdT3VPjuKMGWrpEUMklDte4BsQ11uA8zXxo3HlDLe7RL7TP/+osA5329RR
 vUifkOTrzccaTxO/E4wh+TkZmQT4WfugicEh/DXwDg0fuvXN2EHEJSnywHrm+w+QoGhgWIcn/2y
 1fTnGcK8aTeRD+Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a28322d cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Qd1XWP2DvpO_7if9oiIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: fyKBWx2wiPA-zOjamXpBNNgqTRl70S_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX7MHKwOaYz/nZ
 lpsJZZd6NydZARqynENhbL8FGcfsjDnzu1x8OFSx31s02Hr7hTfauKsy0pQo0rSZsF4FICnn3la
 YyvbDrlod13boZum/smnnjqIGTIVL7riU11x3QKXe8yt2gST5KtYopX6NhIbfnbm3dFLx4OGxJq
 +ZNCg8xyI4g/QNfsAqqDEzGenSUaEnLWFo5t1i2XqmRnr0ccSO8MfgBlNQlycAPiPbldtTvyGsY
 2jS0CB6tFhtSUIIQbCOc9lEznD5oj/acCkl3UxG2PSrL2ktn1U+FIJmKj28roQrdYO4BYCgvlI6
 N7UVcQjXGJdCQYQjaZj8h7Wxy2d7bYm9RCYoBvUKcy7/dbi09GdPJV/01KzTB9yjht8VBIy1/2o
 mchP8cGYWb4OSnN7mfplaj/mbBEKFn7UWayzi/BuYd8LfeW9XJHAAPjjYMhlzyZagp4HGdTKmxb
 TghcOSM3ozji/734LDw==
X-Proofpoint-ORIG-GUID: fyKBWx2wiPA-zOjamXpBNNgqTRl70S_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112230-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C573661FE7

Display, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
SM8250 SoCs should not be built-in because they are not necessary for
platform bring-up to shell or even mounting rootfs.  Drop their explicit
selection in defconfig, relying on defaults which makes them modules.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on previous patches.

Changes in v2:
1. Rebase
---
 arch/arm64/configs/defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 91c8e9435dd6..766915f8a050 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,13 +1458,6 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_SDM_GPUCC_845=y
-CONFIG_SDM_VIDEOCC_845=y
-CONFIG_SDM_DISPCC_845=y
-CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_GPUCC_8150=y
-CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m

-- 
2.53.0


