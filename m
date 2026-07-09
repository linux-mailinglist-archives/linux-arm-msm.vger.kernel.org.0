Return-Path: <linux-arm-msm+bounces-118090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id woZbO5ntT2roqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:51:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DBA734842
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XrFaRUVX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PtQNxNt9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118090-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118090-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27446308E106
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CE94446F5;
	Thu,  9 Jul 2026 18:43:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0268E43B4AB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:43:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622611; cv=none; b=GF2niM8eqjhVxAnTRDS+d2m6hPYsBaxdHihlkmNiEte95xN5bSiR5ooOVvxz9ue0jQNITUgAYK6geDel16rrzf8MKZfDpyxzjmnMAi6abH+6RSjQq7HS5Gdy2db1UCP6whwkiewxJ1l05f4f47iEYgF6+ko4IxOBYCP6ZaadjBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622611; c=relaxed/simple;
	bh=I0NgFN3rF+KkU4yqBh/hyP5wG9C/1rf8uLv6/y4DOzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AywbX1SdypeuqM4UObV5F1nFMS20H1AjpjRZ/TtwW4Nua8R4dWOASGTfHxoDvn1VjXyXIBbTPzEGk6TrnGmPWs7h3biCG4aiYhanPpNmh4Cg8h7A7C+dE0dpXU83SGs+koOR6clJh4eDd7tX3BuqhAhXooCuW5k24nR7XV16LZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrFaRUVX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtQNxNt9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXSJa2330204
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=; b=XrFaRUVXvcGaBNhE
	ipDn5AT4mzKJkmmrNwgSczG9YfhH1HLN3LqbVGfzkoZ4d+ZwQCBxGoqoiFq/8qHt
	LQeFAijKeUWmlUvtdQY844OtLzkeR113+HWzn6J/DkvbdkjV4Wzt9AljQ6uoLrvS
	/z7SYXRzAGTLe71+O2jVCHnKtHXma/1qaJij/1uOa3wOtCKGkq883YeFVm0x+Whu
	HnN80yEmEA1TBY5RL1xnMvuHcoNPyKyfIeFpPwUOUH+/xEE1H74Tl6x6a2Wzv6gl
	JXLe2o9ZvPhGwnGxQ9/dwKR3udYAL7jP/LSWLSWx4hD1y565HjsEsXkKCNuql0IK
	Z6rgdg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24rq4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:43:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894391f000so299917a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622608; x=1784227408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=PtQNxNt9iRkGLSfPyu/0w6+3SNxXARJBdTcL0+7yQPNDxB3ZKcYs3vshJseggAOBVE
         kt8MrpGvOf/CIrSDeZ1bWSAxbECks089zLc4HEURLARWZkDvNbjee1EVPRDdmp52WhDa
         VjKNzeurFvReZA02EOaguc/SWOKTf+A0IfeCFUGlYRDsghs3ThWc8KE7Un4yh2koJobf
         gJeSgmRnJfwQJsUmutCn61Fm7+Q7XHafuOCqJUbdb8Gyb3fCnruZKVTBUJ4HXUspDwb6
         m2GHH/1lg1g+tivFhp7ZUrvRS6SLQ2UTakiDjI5z+/7aAAph2a7YrN6xEPT9ZOXps9b9
         aFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622608; x=1784227408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=i0ONk31pVP+1y+XZdn4naEvzTE7F5kedQrOhd+tvA9jUb4M0tT8/EbfCJw6zRCJGnd
         uwVB9wLd4PU+KICoCW1J93pG37PDDi8EDri0TbEkOExinjkZ/EhzjLkaoRpCrcUDZv4n
         wWpI1dpqHA+/PGG7lk2xyL53ZaaKxINN2ft6S5pW73DinWNvo5XK/4bFiThUpSKJd15N
         +gAPIaYfgObiR/PQJAnhvOk8sQx5xVoRBFFjG83FfTP+ybPpMoLKpxo3j3zXkCx1LvUA
         oUcQ15QvsA8d0qEqTJbC5us5saFxMApJ33bOKLC/q6EYH/WoXcD4/WT6rF5302t6ddPS
         0vcg==
X-Forwarded-Encrypted: i=1; AHgh+RpFD4AdPVMexkb3aF9fAMEnIPOxaOj7nw0uY2b/Zkp2YRJtw/JK2WZxlmEG/dRoP00dFYpmPxzT4Yjz6eMI@vger.kernel.org
X-Gm-Message-State: AOJu0YzrAyoW5tBkqgoXf0iQSUUAI+qNT+Rzop/9QnJhLAPqli5EU+rQ
	pyXPHphd5qGDKtmy4lrcmzH39Fl64rjjJmOpXZrdVwh7whBzpjPvo1rtp3yoekEDaPvBMBMtHdc
	Im2A0ntH0+UDdcwW0F5xV0c/ruyaDE3y+7sVfnoXsxCsREkpwQjk5sKXvWzvOC0r9S+49
X-Gm-Gg: AfdE7clOgVGmZmf8Y2qhrkM6y9tb4cZCHYlVUWR8Jwi5h8nY5JD2BYPkE0ve1+kM9WD
	RVMuyw8HG7HLnOBTnBTrJA8iMr/qD161tCHRGbnxynm7D3jTUOm3gMwPlgRxH7AcA58FZgOwVlZ
	zllhl8c4Hyt2AAvAoaKhVSPOfgjmcZPcyw0oQ48rVYRExf8MJXYI0JoPMPahxY2Vat2NJDdALSN
	OFhnw9ACfHMkql63tKYksOVPnfWlgzvmgFMF3xZS7u5mPl7C6l3KWcQ+AYihVCJFM+Vy5qGb8/n
	OT98ARfmhCchMxms2cRW69hD44LXx8l2DJpLJiGDVzXSYKq3EHBRIKzauKSD2Sm6wNUc/IygLbQ
	p1RQBr3wTyDCbrX6/hU0hvWyZAtc+b/q8LnI=
X-Received: by 2002:a05:6a21:4902:b0:3c0:b766:750e with SMTP id adf61e73a8af0-3c0bcfea632mr10283295637.25.1783622607981;
        Thu, 09 Jul 2026 11:43:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:4902:b0:3c0:b766:750e with SMTP id adf61e73a8af0-3c0bcfea632mr10283252637.25.1783622607576;
        Thu, 09 Jul 2026 11:43:27 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:27 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:06 +0530
Subject: [PATCH v6 7/7] arm64: dts: qcom: shikra-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-7-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=849;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TpvtLBwihWHNEKd1VwQvgAfHhzoeB2GGOqDfiPe0Xho=;
 b=ZIve4DWCl87XBF7AfPHf5g2BJeKum6itVChbN+14NX0yb+c2lSO4GLV80PWdApQDHp0lHww6y
 MmdHRS+rBCEDgn1bSRRYLQshjQmUl8u8iyr/Z7ckKek/8UGqepWFhl2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Tmy6khITh5PudidbHK1TGvYBcFoAHMBI
X-Proofpoint-ORIG-GUID: Tmy6khITh5PudidbHK1TGvYBcFoAHMBI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX0oJVn0lHShHH
 gJGZ2C+cHd5Mp7QkRtIxxMPjBfP7WmLlLmlyJhAadNWz+Oz6MeAvu2ow5pgj94Obt5uwdJny4vC
 0umGkeux6WMvt1YqH5/wKbtvd4aruG4=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a4febd0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfXzrpNeSUL4lNf
 lz19Ln/258TizpxiY+6y1WaEjGoxWpgwSVkTaWo1lwZjy2ovY5jMzd+wBHn46CfY/R7PBwcK9Am
 KbJtYPbT9NipuGsu/nRkjtyS/Yi0xMCUVQbwghqSDrFAdepoSJgDdqXlf9MTKXRVP8lQtjVimea
 PclPkLZsVGiCDI7JHq7OoYNgkIrnEEHjDUBldoYTwQ9kaEpl2KjXFiBvRCY6V4DYxe/IINgDLef
 ZGPrepP34j8N+4dry5Seh3O6ja1+JI9CBIEtAEB/Nyd6hmIslzQw0GGUQ7LMtJ4KNCSEcIcDJkV
 6e9n1N2/ZQfs1Cv+t6cQhiCTv9Z2j0RBoyHefIeTqkVlhKM0K6V0bib5zXP7XPSbQ/15edP8EZU
 ky2kttdhlMXK/HtjD7th1P8y4ERnqUXutiWdvg/YOmhNkZCPxTJItI4HwdSMBQotF5o/B9WcWjD
 V9bTvbpDzUkuhbwcGLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118090-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6DBA734842

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra EVK boards.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 4b7be09eb5a5..9febbf200f10 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -36,6 +36,14 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.54.0


