Return-Path: <linux-arm-msm+bounces-117040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h/7NKakeTGpDggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:31:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B56715B90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:31:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EM4BFVw1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aE2FbxZx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117040-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117040-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF84E3020BEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A1F302742;
	Mon,  6 Jul 2026 21:31:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AC18AE3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:31:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373480; cv=none; b=Fh+0VTBv1O7Gb5oZXJjKfx0DMUnjmqLgr8t60QRyXYYW5OBauy3XxIafdO2jPxc7MhpP5i93JZLmYpEDQzJkNtBVD0dQqEQcbiRKIunS16rKQmuh/oEebR4r3wCzWsh1xAhVNfllin7UQv6fBmbnuLl2nQJrxr/KktIrDQYxez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373480; c=relaxed/simple;
	bh=xBky2n9+WJ4//uNEPF0wJ+LgSzOYLiJKpO4h7lh9jyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpNT43RKrzUpyh+4svrNqEoBmtd/fosPnzkXmjbZiL7H+VkaaQrRKpBOKjObqQadNy3A6d6sPA/y5Uyg4tklzmb/lwnTC+bK5bsRqhHtFD+iJho16ZeAZr1BU4Tbw1q0278QEgCKaCBxum/SU5hAewGQaYPJY6FspTmRy6XqD90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EM4BFVw1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aE2FbxZx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEMsk1613914
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fzc0UyfTLrZB1zWo/aKngVCr
	9fX2cKPgrJwdh7m6pAE=; b=EM4BFVw1U6C44bzQw34O8jRKusvwreqOly1nZt1U
	oUhDEvwvB84iMe50TpYtYotIRmv6LnsjGV0QrJlnDBBMdEGm8fJuwvUR2G7hXQDw
	sh5GgBKavN6YTF4EHHthKno/Sbckz2rDTTyEtWtmYfUfuudttKmfTfXp4H2BeP+3
	QlFwddHyHWpvXpQr6bE8Jp57G4SbtS40GCN3Qy5/04f1pSHm+4PkBsUmQAjwpwW5
	j/FTha4md5OulfNuShjkXnVoz+PBxXkxtV8Fy89xQAUilimimyGvgJp1W21383Cb
	q39IfzkWdNNWJRfy8bbOZqXLtMps+PbzZhm8Q0IYgKzADQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h53c5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:31:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so32498441cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373476; x=1783978276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzc0UyfTLrZB1zWo/aKngVCr9fX2cKPgrJwdh7m6pAE=;
        b=aE2FbxZxsCtwIXElh6o1gfYO6knoMvuFMAug4e05BDyQ4PpLvpn+F/FySq7M1T9t/q
         VwAlmW+xVGiUePE/oo4uepnaNt+w1NiRWAjE48CQezYJvUVleJsnx0JhQWTyx1ZNj7NT
         RYRR5JP1WLtwTmZyoigSDrZmzlCh2HwPbYjB3ar9WIRcWHSx2eBb4z3X9eQmlpsWdR1p
         9TJkRKhinX/8aBZLI01NzZs0K/F/VIYML6SuKv97jg0odkrpTZj7wdlgdAHfEyBx44Av
         CXP1cVocw2+Sg/tJ8jN69/0F1HWH2YgWijKWXxssVQYe2qOeXPoKxHnk03J86LG5f17a
         Rrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373476; x=1783978276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzc0UyfTLrZB1zWo/aKngVCr9fX2cKPgrJwdh7m6pAE=;
        b=aszq+0BsthHBDksJkJPaOdScuhT2NHAK5etFf3PY7Wbz3hLnr/+suZWvoauLozJXxS
         yQN2SyaoyjYQvV/QP9aUzSbtHL9f9DXOebz0YfcTA9vviwA2LUqCxWymsfHK00FkUcos
         OENJywqkTnnBkj3i8jEKwu2n4iX0wGpJ9Hj8IkM1KnfoxLv5BAlA60wm1Z4tYgym/ybb
         PERN/jlFf221EYQyKFyDoDvMi2Dx005EywYLHpS9HX66byLVvZCG51CFXYVpRz5NUk5W
         2MgLTZL4ncedzU/R1RcKfm7lg7dBQR/TNaVd4O/VOFeakHGcR1hWluhi5IUkUvRAtb8U
         3qtA==
X-Forwarded-Encrypted: i=1; AHgh+Rop1R9zUKGWEKvd9ad18XDMpjEXIeUzYxU9Q1uwgQcVzgK/pay0+q4L8Ygmv6m+xHHGV/GDqQcyvII6JIbg@vger.kernel.org
X-Gm-Message-State: AOJu0YyMmQuM7c1PpWllu5DHpq65RyvZTecIPGWwZO0/xsBIvMi+FIQb
	kErvRb9eUJIkrt70qDXjB2xqLT9KDxu6YDEkJAhqrQ6t/qBMhcMZ1m016zSeHTeokpLUT3Ru6GJ
	2fbJPNcIF6skqwFey3EdY8vWFAzO5obk44m3WUZEY7jicpRMFAk0PkaHBsJA27KYng19A
X-Gm-Gg: AfdE7cl/UIybW1T5Bad4NLQXRpMQQkVUDqDeDCSJWxLd0lmLiDF28K7g6VYpPRZFDqB
	b9yx6BbgdWZtggWk48ONMO/Pct8dviUg6ulIv21cQUhompyj6szAW2Z7Lv7+VeLz+uIUCzH/YRH
	8/FbciUsGVFRB5Uyo+d8Gd5uXZq1AvXIEJXChTebgWxflMIge4pp8NdupHr8QyAWzgRduJDadgJ
	CHQa2kkYYvLQbU79ylQ1jKoxjgvzRRT/eGgTDzUeOrt8+BZzN/UwH/z/JlSxvmahMlsysGw1zLl
	kA9U1tScC/19Piruy7ZakAw4F+En+JZVFH46p7lpcXjmJcAWn6y+9S2z1O7O6nHp8ff8Y7OwVpK
	cTAvNWeAAddsBMwU2wJe77KsaZfSQV7xO2CqEpUfj9lk3PdhbNew6lfDLlgpIJ2hYCn0gATuwQN
	e/MKP4/+K5+0ExWe+fkTqnbzSF
X-Received: by 2002:a05:622a:248:b0:517:8011:3a4b with SMTP id d75a77b69052e-51c747be066mr29060201cf.21.1783373475647;
        Mon, 06 Jul 2026 14:31:15 -0700 (PDT)
X-Received: by 2002:a05:622a:248:b0:517:8011:3a4b with SMTP id d75a77b69052e-51c747be066mr29059761cf.21.1783373475081;
        Mon, 06 Jul 2026 14:31:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb417sm3124713e87.50.2026.07.06.14.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:31:13 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:31:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Message-ID: <u5jvkfixrm23gugwlnpwq3ov26gf2yqf3pjntcl3k5t5wormet@powdt4jkmqmo>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
X-Proofpoint-GUID: rNWwYLULVv_VG6EFVT14WB1LKCYCBr9u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX0UETKhNBPULc
 e0VwASH+z3ojwBw1oIs2H581hDcAgPd7eW3TIP6Tu03ijxUi/pXimxbn4lJqjtaW6BsQJxCfakn
 lmX3g1wTLr/ZBNFFyzTUfmvfLUbSOtU=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c1ea4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8h3n1EBGBd86Ebf8828A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX8zxetT+71jOq
 /nTTFQLhaS2qyZQic9zAffu2bQjxlETSuR0Xbv7+FF0IUGuj7C/I9gOduH04bSNNpVDtqfgDXZT
 bQPX1PGRQFkE4ZQqb2IQmNcZYfz3rQjqZn9eiU0P2LScnwu8c+Z19wmbcETuCc2WLfqWA4Sb7Jx
 YcxuZ4k5Ixe0vQ5eQqiK5V7XorMLqrb+l/+G6RjI66EbpA2Y91KNhWiCkGv8VePpSKdHkyjq2Cz
 90ZyFj6XO4t7WCwToTb4uVnDJENXhqtA2aXEMCa6imWaesBVgu0L/0Azm2eI+qJi/V+KQKOU8Jy
 A2+qtMeEbbg92EvS9QU7N8QBEv6nAU1bLQcDdDk77vi2E4SCmR1YGQKkPKADXjXdKZfJkzpu0WE
 gcx8m3TXGf8OudPJowbWmZHaMHF6bpbEA/l7bLrDWYhL9Efmho87hHMNHaKV55a9pBdwn6ZqP+k
 1djHDdq1KiXbvWTFIvw==
X-Proofpoint-ORIG-GUID: rNWwYLULVv_VG6EFVT14WB1LKCYCBr9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117040-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:quic_qqzhou@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,powdt4jkmqmo:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,quicinc.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47B56715B90

On Sun, Jul 05, 2026 at 01:30:07PM +0530, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for kaanapali platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 43 +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

