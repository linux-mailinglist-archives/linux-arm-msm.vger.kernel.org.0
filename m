Return-Path: <linux-arm-msm+bounces-118012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SryhBB+wT2ogmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:28:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD27323CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:28:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=paiqDtVp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Gq5x1t63;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118012-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118012-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8B88306026D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58151322B7B;
	Thu,  9 Jul 2026 13:42:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63D731E825
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:42:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604531; cv=none; b=m1/r4CCZM8YSX2J3cYRaEHbBiENaTuwCP5gzL0iQ9FXBRDVibdh3LyYhd9zl6NGqN16do6GpZfFD8K2hl9Mk9RtUeNKoDgG3A6iydD4tWkZTBvNEq9WHeLR8rB9OKbjO+kmVeYXYyQ1GPbgRoSVMhbSK4kxIrWTjPh/7JSahAhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604531; c=relaxed/simple;
	bh=T4eIYBccxXJeZW7OH2Zm0x8+WH27A+FuLPhy+n6Z5fM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KzjibcYhHnv17neapH6iDTbkiv6NofxRsyW1sBJsvyWXQZog78FecuZZ+VMXhrv6r029LmNNjjnbsSpd825fQYQDUHioCpH2NR3zLjA85/WToM6hqOzgVAuRmF1G+/f1wl6CrjD3qG9jRTKeMmC0jILcoevGBamPrAQ80L1H8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paiqDtVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gq5x1t63; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNEL21537345
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUHnGdkfUXRQwt8oe8xuo2tN8rjbIhoMZwW9C9J3BuU=; b=paiqDtVpB4W8XMia
	mkUOQiclKvrkJBkcy+rO5hkMq0oI6Cn0Xzn4u/AP0M3GJ9+tahIRGcJJEe7hpHbM
	D4oF0a6RGy6DeHU/i+bW66vbGrvathcUACM6H+8F8H10kapxcyB6ZtiHA0NSTrt/
	ZO5zNCTQhVervggey8DeCVP//zsz8Ro+9EOIUW6ZODwNzBilBoU1bbzLn0bmNzI1
	tQztUKJ4b4/LY24SELohmsZzYcWgaqFxAWtVikjoPK+KBv1PsimQsvSoxtD6xRb7
	ZToP3b1eG9BKFBMs+zUvuOti/J0hgC0mKBL7MrvPwk9jYcZxRkL4wvH4jcaHCxRn
	TBEUlw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydty9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:42:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-967973f71fcso401070241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604528; x=1784209328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUHnGdkfUXRQwt8oe8xuo2tN8rjbIhoMZwW9C9J3BuU=;
        b=Gq5x1t634YEdCM8FIGvji9D0y9N1jYI89RlnUILjGRwjK3r6UDns7cHU3wbx0aTER1
         vH1Ve8Mfl9LMChqmjgceToFdIDUg17vYMJ+KmCzy+FHEraev24zKScncfNP2DXiDDIuB
         Hz86VCXs4VucMzUIib4iu4JqOaAYznEcLHRitAP7+qS5yvgOS7c89icYGVbdr15e4v+Z
         f8PIP5lU0ScsWjTNf6ws9URIwjPdhJbwqAuhsK/a80eE/T2JrudPAtmMexHKgNchBpmz
         n+V9c2muMwxGu0f6TkTkIM+cHsYcjCyFsbCsHwVCXKlSAEZBjzYtsBE7GRZTJ5i+2bnl
         aFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604528; x=1784209328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUHnGdkfUXRQwt8oe8xuo2tN8rjbIhoMZwW9C9J3BuU=;
        b=dL2YS7Nnc5MLcdMnt8xLI5sZAhqw4JddEIQBVvxMHr/++v+F+yqZch3hhvb3fU1SSS
         k+jbFrhnf24pGQQ0EpXoeadZeO7v0qS2HUy7GqfRMMdi5rIrjBR+k845NOq9Ytv7mhQh
         IrGzrqE2oE6x0yckGYpoQUSx77S4qYZpcr0iw8xMQHfVH0r7gwAGGho41fQKoSttd7x1
         BTsteu/D20OlfH+hPfygfVBQM9U3zqcFU/1s5bkNwUo99+0otsqlxq+zfj1fAXgXs5v+
         PBNWhvSMxWquE4Z8af7/Mk/5sht2pVTmbQDCavJ6yoEQXuIzfJ889+Jl9mfmiTbSLT2Z
         50Ag==
X-Forwarded-Encrypted: i=1; AHgh+RqD/GLaFXSeQwxu/aTPI+NCtxEpMLv9DXSee2DCL+9/3ImC33aF8W8o+ZDYRFDPtovX7OYuNDJvySuselV8@vger.kernel.org
X-Gm-Message-State: AOJu0YyHiNgytLyFJXc6CsO9nGXnwPie7dwDVszKV85UO5W/NmtFsgJY
	xcfKIrPzRiUkVOy11SRiTyZWEt/XCytuNuHkpZZJ+r7hZtt/bnswLEjZanGXRlzg7Ku6e4SwcC9
	s5CV6ad/MBcPXeH+2XgOJvsy6WgCk5+hbXfyGzPi0l4qvDDgPn9CDLLqPxswzpjBJYERg
X-Gm-Gg: AfdE7cm8IjW3KBr7EmsMq3Az6YdyQ/EWhKeqPgNkXRjDHbWVNESKH9AmL7z2tLgw+TD
	rBp+TeZHwqjYbx5yx3j92HcuAOhJSS6KwIAyiVNcryum4J5O1lyMvu/hvIwr/wUkWNsS+AZFIZZ
	d+UjdCymFbAS9FnEehrv/YpXcJutgHLyKKuH2KPVMbZ3Iubx07vVIsNqgoNVYp4JSBgHD5+B/6y
	dvFMZuJ6DO+xywliOgYg6h4r74EyM8ec3xfY8Eq6C6lzZJXIr94/b1eaR+laMAiFiykzaLUwjxn
	az2XYK7FtCvJz59on+HuUAxPd7KIXzi4j3aCxh9zudBw9sRpdoWT4WYIOAky0w9OdrS66g6C3Gu
	YrupCk60Z/f/5G1ZTvnEOd6U7IWgnoMtiZOJVzKpORWDlZHTABV0TbO7AtNncg73wLQXoBC8J8G
	P8OyWhUzk6KXEcg7Z+og4T8Hpw
X-Received: by 2002:a05:6102:579a:b0:738:9c79:750c with SMTP id ada2fe7eead31-744e010f583mr4087188137.15.1783604527220;
        Thu, 09 Jul 2026 06:42:07 -0700 (PDT)
X-Received: by 2002:a05:6102:579a:b0:738:9c79:750c with SMTP id ada2fe7eead31-744e010f583mr4087164137.15.1783604526550;
        Thu, 09 Jul 2026 06:42:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:54 +0300
Subject: [PATCH v7 03/18] media: iris: drop IRIS_FMT_foo enumeration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-3-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4455;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4eIYBccxXJeZW7OH2Zm0x8+WH27A+FuLPhy+n6Z5fM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkC6y03dfoL2gL2Fcssdxok7zymtMG6w1KB
 CjuKHWyNKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1dAhB/97z4/xuC7+0LB1G/OrJulzwP3h8a/2nkFKlFqBXh1nnLB0IVS12gpa8iN0f+nTAZTm+3G
 Llt49B7giCMHZykD8OcbNgB70rg834GSxnleqLhBr+hs8u/HgTUOzk7Uglt0t26ycbuRWUlG51Y
 5QVPoh/itCTTdj2sdcFaByryM92t5A34XATi6Jvx490Q20Tz9TYnh+qPdvJp2pycQ2NNxUP9XNS
 yDzr2PVaS9Y5s5DV6d0JY3AI396PDJhbCMQJi6mIkkkd6lyWIBd5xt+4nAUn/uNTdTuqWkbXiaC
 13C4zH3qqz/UEdEymefaNr+BQqlsVsOQm5vfQoGRHO8BKiDP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX6tO7sbQe/w7S
 4RsG+eIEDZxyLqLQObgFAedaNc4fxYyNvpHc6VYaXUaJCjAy6Y6qlj6SfhwfZuwNXyuOt8H2Tq1
 6MXNjZNqOrfqLb4xvBaX4nzYw8KsNkc=
X-Proofpoint-ORIG-GUID: uxFRbt54s1f7CqNNyKy4UIB0meWTApJC
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4fa530 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Azqn4rg6zLMgtGihcfEA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: uxFRbt54s1f7CqNNyKy4UIB0meWTApJC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX96gqlhnOUSzs
 bftBJbcaIcmHbYYhVAejtOWUm2fqN+fRXy193CN9oIiiPU5rVpbs0IOXGJ3fC3iK11ZB5cD8MJX
 zeGkPG276BQSAN5VlnkfFuIfRwkRwSQnj/Lm2ZbLLFXvHCaaFMsLoN8+tjhpddKQ6TdTwJ+JLE1
 taisJ4TaiAsZSgO0IECnNTgoB1YYNqc3nI4UwLRP5uRK4Se/np2ERGxrbKsb6Do6ggBPvmtA4YB
 gpUJCGDcjOoMVh+ry1zcPPsEqJN3yYjLy047rdQPaA8La95jeaZl7dtaOiSriU64KMsCvPgILZx
 xjDx3K37jeaeL7CqFdyfph8g4a+aT3s3xZfA/ZprPhJC9dpHxN/vcqNL1Wqxs+OghBNFLS2+UXy
 UxnNVE3WC+ilIvDRGW/fB9LySZZEQlmrOatYmS/wOaO5SL3Y8B1efEIQzLPRRPuy7Thlel18yrs
 pM7VCpFYwdx9jUZaYFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118012-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02BD27323CD

The IRIS_FMT_foo defines are only used for indexing values in the format
enumeration arrays. However this kind of enumeration doesn't follow the
V4L2 logic (which expects an array with consequtive indexing rather
than a sparse array) and complicates adding support for platforms which
support different sets of formats. Drop this enumeration and use flat
lists of supported formats.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h       | 14 --------------
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c  |  6 +++---
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c |  8 ++++----
 drivers/media/platform/qcom/iris/iris_vdec.c           |  8 ++++----
 drivers/media/platform/qcom/iris/iris_venc.c           |  8 ++++----
 5 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a770331d1675..ffdbbd20901a 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -17,20 +17,6 @@
 
 struct iris_hfi_session_ops;
 
-enum iris_fmt_type_out {
-	IRIS_FMT_H264,
-	IRIS_FMT_HEVC,
-	IRIS_FMT_VP9,
-	IRIS_FMT_AV1,
-};
-
-enum iris_fmt_type_cap {
-	IRIS_FMT_NV12,
-	IRIS_FMT_QC08C,
-	IRIS_FMT_TP10,
-	IRIS_FMT_QC10C,
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..ba91672df1bb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -35,9 +35,9 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 };
 
 static const u32 iris_fmts_vpu2_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..7098b652c117 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -49,10 +49,10 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 };
 
 static const u32 iris_fmts_vpu3x_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
-	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
 };
 
 static const struct icc_info iris_icc_info_vpu3x[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9e228b70420e..4c8bc7aac135 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -63,10 +63,10 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
-	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
-	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_P010,
+	V4L2_PIX_FMT_QC10C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa..16c52ad07e2c 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -80,13 +80,13 @@ int iris_venc_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
 };
 
 static const u32 iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)

-- 
2.47.3


