Return-Path: <linux-arm-msm+bounces-118098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hWGhKAj5T2pjrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:39:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A784735173
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:39:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iJLET862;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XNHDb8tU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118098-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118098-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50691304C2D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B883BA241;
	Thu,  9 Jul 2026 19:37:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E70A2D47FF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 19:37:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625829; cv=none; b=JxqIeHerXPtOvQIpUK8/5ScLJxAoPrQO6GY5yUMl+47j1pRy7xvrmFC3LjrOe8tpBvAbpLvwBJMCNLeFKqM1RokkM/iu9lo0PH2VpQlpAnTfXMSHIuJKMSvZlbd1axcrVlpTnNv97Fg85FmWhx0H6qfdsPvWxBo2i8aiI1FzHHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625829; c=relaxed/simple;
	bh=FBlUkz7zqZiMYy8H5QLRl+G2OTj0JcohsR/X5AK8r28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GLIkX7G97xNwhThkOWfQtTHqO91YXYKiKADxT/4OvvQmEUKO76iaGoT7YzFV1Mj882b4nrUBfvIOylJ2qjZSmO9O7OxFVqIwT3vjvK8LrnVbKeAvn8ONEV8lVIIWQzD5uBgv79woM9S8v5NUSUOEAPkMTWFV1PGXV2hEJfXWzmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJLET862; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNHDb8tU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXq0m2423025
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 19:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSS41Vfl6j8OHYOJtx4KK8DHEBVoUxAPVVpyeklwTyE=; b=iJLET86215g0jo84
	t4j9W+aAoUrTSxJh1Xks+G7pCfp9m7G2eIA9ZepK8lqdaPwcYhB1jmEStsKYAS5U
	RBYtctmXdB9nmpY833D91rKFQqHkT0LMaBACOMHpNiy64r9GLUNa8nbr3VjrYSuh
	kEiy1G9nRUOB0/as1MkZIHmv20CzL7KRl+ZmwVYPc1xN2k3AKOJKeSSVOZTEO4E9
	qKgnbwv4GaES9e27t4TSbHtj6CqnibB+RhteaEakPIdAtgpF6d8WsOFdYaIrcpCb
	uAj5Qh8BfIEodbEQNQFBprGIQzD0O4t92xCBJiaRpqs7yPme3WaHFYfKO1sPv+3y
	4zMywQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj9bqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:37:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e80385dbso60318137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625826; x=1784230626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSS41Vfl6j8OHYOJtx4KK8DHEBVoUxAPVVpyeklwTyE=;
        b=XNHDb8tUHFHVW0ZpCeAnOIQHifzE8r8bDIeewzXVHBd2krcqoXy73iZHYuiIh9L5pO
         D1Bgj64W5g4Bpf/9m0IqE4fRJA7P7relTkd8lyQrloW7bOZVdce1RnTFvXjFD8XOsYGg
         CT3S7tcwn3W7MfZn7J06RqhDJi+DBD5/JUv3kqJB0Lhywcfswg4WC+KuVdkYSk04TIfk
         +c3nRbiKmspZ2EZYdEPoCMMZDgge70q1MN0zMW85kzpLFb/eZ055z6jOf1TVkU/Jcp9j
         3tQ4Ylc+YepVr0Q+JZe5CwL/5Jz1IK9in+qzq/m04NFoy+EGktbBNyieWN5veXEu9iDU
         DTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625826; x=1784230626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSS41Vfl6j8OHYOJtx4KK8DHEBVoUxAPVVpyeklwTyE=;
        b=WTot9JiryaFJDdkapcqFNd4rA0OJPbBZtYKi6w1OUeAu3wmetYXNmRNCn1EyAPL/to
         ZOv6nTAbLUO549pBBZDvsBihFAtlJmlaInqLJsktAbuQZPxawrLSIOuIxtzF0KgPiqRV
         uxN/JZJLsnWfMbwJH7FfMQU9o0Qc7SiAqhsL+NxcqxDc5Sx+a5zSEAbSB5RvtQUpD1A1
         MXI0y5yu9cWzItvEt2GrIEfr5C1pVsyn0Rhb4ey0fUKSaivjwMXVQE0uQbhtbQh+sQMV
         de0O+1MxLVKQpIpbZxzSebK3KdWjUq3mLcGnNQr5877xvNqHnwqZ3NnMP/ea5u0BnjzB
         rSTw==
X-Forwarded-Encrypted: i=1; AHgh+RrNPJ6lA242zurXVPuqVyNDtG3Mk38vf9RLbTlE4yq7hfD0VIfWnRF6m0kz9UZXKV4ZQlW5HtwKjQQVWvP/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuge/1DTHd2ML7c21GhVAufN8mPyztrqmc0pSXpf/rpcDFhMdY
	/hE+EnalJSHxHxGXltXk8qzhpkGnl3ISFhvE5qy658K96LigJBPy4ktW1CeGfBkk2SAnmnk+WfD
	71bbOOeyzJ6jHYaWY/8jA+0PkfHU15luMERJJ42wxCwq5Avwhfye3zOwdW2TQ64xPLcvoNAj2Ta
	UP
X-Gm-Gg: AfdE7ck8JJAYM5lp+NzQqultyFxzUf8Z0LGke5SoZS3sgNzxWIkeSCQottpQpH4YIDE
	xeIEdaNSyGB+ogDf7kv/Yh5ny1ZzHivK7fcj0UAUJXcfWtTCwumcyYwghPBvc6Gr+uvOswPBzMO
	qSExWEQrVOeeLV/Tf9FEgrhPX5BGeuQjRs1RY4+LbCQTmE3qGiFQCJ2v4awnN8pvb4Oc0gUkFTv
	PK0jSPxFBfZzURuUvgBuViAN/44xTbfLoN+WHWyVTDKqO0ZJI5LxEIPIn98lXH1t8SCdrtcU1rp
	th384vUDOMZvdXBTT2k0AtXKgbNKP0d+MOkscD3sWjNtrAHu67IdILrCzmDvIqWekGiax1I1ZWU
	ds7e7oG1ZyBh56LiXQ7Lpvc3Y+IN+JG7th8NfJ36z6n4fyVT+g+A7e07bguzZcY0sYNGXheItRv
	0Z2f5e3Id6c2MnRrSVbV6Y3TWd
X-Received: by 2002:a05:6102:5a93:b0:73f:63c5:f550 with SMTP id ada2fe7eead31-744e019ead4mr4826465137.19.1783625825761;
        Thu, 09 Jul 2026 12:37:05 -0700 (PDT)
X-Received: by 2002:a05:6102:5a93:b0:73f:63c5:f550 with SMTP id ada2fe7eead31-744e019ead4mr4826443137.19.1783625825318;
        Thu, 09 Jul 2026 12:37:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:36:58 +0300
Subject: [PATCH 1/9] media: iris: translate Gen1 profile/level to HFI
 enumerants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-1-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8766;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FBlUkz7zqZiMYy8H5QLRl+G2OTj0JcohsR/X5AK8r28=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/hcMGA2t91tOHXCt+OrJgMvhEhNDEwWXwkdn
 ZbRGrgcomeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XAAKCRCLPIo+Aiko
 1XG3B/9bBf7OyQ1dJFN+Vl+awordF6M7vO+edbFRWCdaCsLhvuLBAHGRciDJMhN69AqF5jCYZdQ
 ilepO/JFX7NL5H7yV2rejgdXoxlsY+pzCUzvK/7UB20ZICRc2kLa2HzxJCAX7jzxnaimohHN4qW
 FWdFNeketHKOrQ6lS302B9md99BUycAgdQjAz50YCrfzgseKoKSFYpeqoHiHdUBOhNSN1nqfAwc
 5KeRUW0bkowXsAZql2IKf+CMdd5nhM29U8WYsLekCaJT5jbgFTyjgkTTR0xJyGtCQKz/UMSlCXy
 QjR3+5WZDVeHL0fa/o7dgzO1eJQmZvcZGPa6yN9o+/3BjU49
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfXxwma2ajQinNX
 BdfB9PlzRS/GbtS3iicfzYsXKDsEOyKnoLM0bX9q9WI8oiYLIy1dyDI6rBK/dDrStjge/vgNeZN
 RmRqgfDRiwCjtREoLXRf5NqqLCuOdHUqxP+NKdC+LZQZSe9yVr3C1QfRo+PVgRWGZhmA37Ygy4Z
 rc9evjzAzqA4MckjhaDtRJVLmzk93fWL0V68XbmLkWwUI+ZwKxD+Nqiz4DcPV6vdOoPWByJBm6E
 G5BSdgwLaJ8sYVSpWwBRcTB2aYYiy4BgFVpWzqpjpIEEDJc+mzQ/40oLUlOkOzifM3hgC2EsSDX
 j7nlMz/gXzaKplLur+iEgYO1YguTVjt3zzxGIilaPGFiWpAk+eFZUKBb8DMUgNHwadzLilrWcHP
 vGIS90EbRHjRSgVdXw2OLu5Cy8e/5gtskcyeu0diAruXR5lCIJcVOwIV6f8lkxqeWW2+LJcmB1f
 MGgm9nu43pr3dononBA==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4ff862 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aNvB8ZwWyuXJJ2m3keoA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: EmrmERAyg8tzyGTuIqWn5ZF3JjfgF_sD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfXzsheTRk9rf8I
 vUHZnf570YjEM9GXUA1/r/YuEjYVamemRRcEX6SDjVNcPg0biFeNv7ENx5fujWU6VtCGs54ylV2
 5X+FO/KskFR1fcXgrtxxzszpnwnMLFE=
X-Proofpoint-ORIG-GUID: EmrmERAyg8tzyGTuIqWn5ZF3JjfgF_sD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118098-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A784735173

The Gen1 firmware expects the profile and level in the
HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT property as HFI-specific
enumerants (a one-hot bitmask), but the iris driver passed the raw V4L2
profile and level values straight through. Only the V4L2 H264 high
profile happened to match its HFI value (both 0x4); every other profile
and all levels were programmed with a wrong value.

Translate the V4L2 profile and level to the HFI enumerants per codec
before building the property, mirroring the mapping the venus driver
performs for the same firmware interface.

Fixes: d22037f3fd33 ("media: iris: Set platform capabilities to firmware for encoder video device")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 109 +++++++++++++++++++--
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  44 +++++++++
 2 files changed, 144 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index c4baabbacefd..ed9fef2aec08 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -479,6 +479,105 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
 	return -EINVAL;
 }
 
+struct iris_hfi_gen1_id_mapping {
+	u32 hfi_id;
+	u32 v4l2_id;
+};
+
+static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_h264_profiles[] = {
+	{ HFI_H264_PROFILE_BASELINE, V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE },
+	{ HFI_H264_PROFILE_MAIN, V4L2_MPEG_VIDEO_H264_PROFILE_MAIN },
+	{ HFI_H264_PROFILE_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH },
+	{ HFI_H264_PROFILE_STEREO_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH },
+	{ HFI_H264_PROFILE_MULTIVIEW_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH },
+	{ HFI_H264_PROFILE_CONSTRAINED_BASE, V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE },
+	{ HFI_H264_PROFILE_CONSTRAINED_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH },
+};
+
+static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_h264_levels[] = {
+	{ HFI_H264_LEVEL_1, V4L2_MPEG_VIDEO_H264_LEVEL_1_0 },
+	{ HFI_H264_LEVEL_1b, V4L2_MPEG_VIDEO_H264_LEVEL_1B },
+	{ HFI_H264_LEVEL_11, V4L2_MPEG_VIDEO_H264_LEVEL_1_1 },
+	{ HFI_H264_LEVEL_12, V4L2_MPEG_VIDEO_H264_LEVEL_1_2 },
+	{ HFI_H264_LEVEL_13, V4L2_MPEG_VIDEO_H264_LEVEL_1_3 },
+	{ HFI_H264_LEVEL_2, V4L2_MPEG_VIDEO_H264_LEVEL_2_0 },
+	{ HFI_H264_LEVEL_21, V4L2_MPEG_VIDEO_H264_LEVEL_2_1 },
+	{ HFI_H264_LEVEL_22, V4L2_MPEG_VIDEO_H264_LEVEL_2_2 },
+	{ HFI_H264_LEVEL_3, V4L2_MPEG_VIDEO_H264_LEVEL_3_0 },
+	{ HFI_H264_LEVEL_31, V4L2_MPEG_VIDEO_H264_LEVEL_3_1 },
+	{ HFI_H264_LEVEL_32, V4L2_MPEG_VIDEO_H264_LEVEL_3_2 },
+	{ HFI_H264_LEVEL_4, V4L2_MPEG_VIDEO_H264_LEVEL_4_0 },
+	{ HFI_H264_LEVEL_41, V4L2_MPEG_VIDEO_H264_LEVEL_4_1 },
+	{ HFI_H264_LEVEL_42, V4L2_MPEG_VIDEO_H264_LEVEL_4_2 },
+	{ HFI_H264_LEVEL_5, V4L2_MPEG_VIDEO_H264_LEVEL_5_0 },
+	{ HFI_H264_LEVEL_51, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
+	{ HFI_H264_LEVEL_52, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
+};
+
+static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_hevc_profiles[] = {
+	{ HFI_HEVC_PROFILE_MAIN, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN },
+	{ HFI_HEVC_PROFILE_MAIN_STILL_PIC, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE },
+	{ HFI_HEVC_PROFILE_MAIN10, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 },
+};
+
+static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_hevc_levels[] = {
+	{ HFI_HEVC_LEVEL_1, V4L2_MPEG_VIDEO_HEVC_LEVEL_1 },
+	{ HFI_HEVC_LEVEL_2, V4L2_MPEG_VIDEO_HEVC_LEVEL_2 },
+	{ HFI_HEVC_LEVEL_21, V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1 },
+	{ HFI_HEVC_LEVEL_3, V4L2_MPEG_VIDEO_HEVC_LEVEL_3 },
+	{ HFI_HEVC_LEVEL_31, V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1 },
+	{ HFI_HEVC_LEVEL_4, V4L2_MPEG_VIDEO_HEVC_LEVEL_4 },
+	{ HFI_HEVC_LEVEL_41, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1 },
+	{ HFI_HEVC_LEVEL_5, V4L2_MPEG_VIDEO_HEVC_LEVEL_5 },
+	{ HFI_HEVC_LEVEL_51, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1 },
+	{ HFI_HEVC_LEVEL_52, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2 },
+	{ HFI_HEVC_LEVEL_6, V4L2_MPEG_VIDEO_HEVC_LEVEL_6 },
+	{ HFI_HEVC_LEVEL_61, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1 },
+	{ HFI_HEVC_LEVEL_62, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2 },
+};
+
+static u32 iris_hfi_gen1_find_hfi_id(u32 v4l2_id,
+				     const struct iris_hfi_gen1_id_mapping *array,
+				     unsigned int array_sz)
+{
+	unsigned int i;
+
+	for (i = 0; i < array_sz; i++)
+		if (v4l2_id == array[i].v4l2_id)
+			return array[i].hfi_id;
+
+	return 0;
+}
+
+/*
+ * The Gen1 firmware expects profile and level as HFI enumerants, while the
+ * client provides raw V4L2 values. Translate them per codec, mirroring the
+ * mapping performed by the venus driver for the same firmware interface.
+ */
+static void
+iris_hfi_gen1_profile_level(struct iris_inst *inst, u32 v4l2_pf, u32 v4l2_lvl,
+			    struct hfi_profile_level *pl)
+{
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_H264:
+		pl->profile = iris_hfi_gen1_find_hfi_id(v4l2_pf, iris_hfi_gen1_h264_profiles,
+							ARRAY_SIZE(iris_hfi_gen1_h264_profiles));
+		pl->level = iris_hfi_gen1_find_hfi_id(v4l2_lvl, iris_hfi_gen1_h264_levels,
+						      ARRAY_SIZE(iris_hfi_gen1_h264_levels));
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		pl->profile = iris_hfi_gen1_find_hfi_id(v4l2_pf, iris_hfi_gen1_hevc_profiles,
+							ARRAY_SIZE(iris_hfi_gen1_hevc_profiles));
+		pl->level = iris_hfi_gen1_find_hfi_id(v4l2_lvl, iris_hfi_gen1_hevc_levels,
+						      ARRAY_SIZE(iris_hfi_gen1_hevc_levels));
+		break;
+	default:
+		pl->profile = 0;
+		pl->level = 0;
+		break;
+	}
+}
+
 static int
 iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *packet,
 					  struct iris_inst *inst, u32 ptype, void *pdata)
@@ -582,15 +681,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 	case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT: {
 		struct hfi_profile_level *in = pdata, *pl = prop_data;
 
-		pl->level = in->level;
-		pl->profile = in->profile;
-		if (pl->profile <= 0)
-			/* Profile not supported, falling back to high */
-			pl->profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
-
-		if (!pl->level)
-			/* Level not supported, falling back to 1 */
-			pl->level = 1;
+		iris_hfi_gen1_profile_level(inst, in->profile, in->level, pl);
 
 		packet->shdr.hdr.size += sizeof(*pl);
 		break;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index bb495a1d2623..2702f255bc04 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -17,6 +17,50 @@
 #define HFI_VIDEO_CODEC_HEVC				0x00002000
 #define HFI_VIDEO_CODEC_VP9				0x00004000
 
+#define HFI_H264_PROFILE_BASELINE			0x00000001
+#define HFI_H264_PROFILE_MAIN				0x00000002
+#define HFI_H264_PROFILE_HIGH				0x00000004
+#define HFI_H264_PROFILE_STEREO_HIGH			0x00000008
+#define HFI_H264_PROFILE_MULTIVIEW_HIGH			0x00000010
+#define HFI_H264_PROFILE_CONSTRAINED_BASE		0x00000020
+#define HFI_H264_PROFILE_CONSTRAINED_HIGH		0x00000040
+
+#define HFI_H264_LEVEL_1				0x00000001
+#define HFI_H264_LEVEL_1b				0x00000002
+#define HFI_H264_LEVEL_11				0x00000004
+#define HFI_H264_LEVEL_12				0x00000008
+#define HFI_H264_LEVEL_13				0x00000010
+#define HFI_H264_LEVEL_2				0x00000020
+#define HFI_H264_LEVEL_21				0x00000040
+#define HFI_H264_LEVEL_22				0x00000080
+#define HFI_H264_LEVEL_3				0x00000100
+#define HFI_H264_LEVEL_31				0x00000200
+#define HFI_H264_LEVEL_32				0x00000400
+#define HFI_H264_LEVEL_4				0x00000800
+#define HFI_H264_LEVEL_41				0x00001000
+#define HFI_H264_LEVEL_42				0x00002000
+#define HFI_H264_LEVEL_5				0x00004000
+#define HFI_H264_LEVEL_51				0x00008000
+#define HFI_H264_LEVEL_52				0x00010000
+
+#define HFI_HEVC_PROFILE_MAIN				0x00000001
+#define HFI_HEVC_PROFILE_MAIN10				0x00000002
+#define HFI_HEVC_PROFILE_MAIN_STILL_PIC			0x00000004
+
+#define HFI_HEVC_LEVEL_1				0x00000001
+#define HFI_HEVC_LEVEL_2				0x00000002
+#define HFI_HEVC_LEVEL_21				0x00000004
+#define HFI_HEVC_LEVEL_3				0x00000008
+#define HFI_HEVC_LEVEL_31				0x00000010
+#define HFI_HEVC_LEVEL_4				0x00000020
+#define HFI_HEVC_LEVEL_41				0x00000040
+#define HFI_HEVC_LEVEL_5				0x00000080
+#define HFI_HEVC_LEVEL_51				0x00000100
+#define HFI_HEVC_LEVEL_52				0x00000200
+#define HFI_HEVC_LEVEL_6				0x00000400
+#define HFI_HEVC_LEVEL_61				0x00000800
+#define HFI_HEVC_LEVEL_62				0x00001000
+
 #define HFI_ERR_NONE					0x0
 
 #define HFI_CMD_SYS_INIT				0x10001

-- 
2.47.3


