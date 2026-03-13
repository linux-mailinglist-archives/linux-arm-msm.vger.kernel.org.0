Return-Path: <linux-arm-msm+bounces-97554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJMlC38wtGmuigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:42:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8256F2863D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D138D3010535
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714CE3AE19B;
	Fri, 13 Mar 2026 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKoaJeyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AR8pQkiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA1138F651
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416298; cv=none; b=Iv0GkGAutro+mn0+L0+MaRFwW7sPNTyHlSdvWoLOSPrJaNQKd0bwQ1NGFVR16/Fq2ZamzLgWXg2ebt8iZ48KbyQcMOiuyCcHXe7imnRNQyVtBBtokMmyF2R+CQmwku+XfxtDUxmCRlYpR5EDSnLe8rsmc/XYoH78O17YJR90JfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416298; c=relaxed/simple;
	bh=DzV86dVTBkJFl+81gRHZySlu5Hs7Tg3y7UcFrJIGUqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Icnw7/Li24IHKqud+561rXwGtaM8MwdLUU21Gu+WxGZXUEClcELD8hjizYwnIXFfsWl4g6zOsePmMMm3lQoTjE8nW+MbUbTUt57mQjLUk/wuFG7tDclF8j2uBg9Nvy4mxbafu0xLW4a/3woL8Krc6vkQ0d9JSt2T018N4zm6Mwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKoaJeyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AR8pQkiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DC4uVq4140739
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HfoqBgtFBPOG18HFwuX3p4vU
	62ysi71nghWsY8TsAl8=; b=WKoaJeyJOc1oLoSS9CiFqw5SciMt9ESBcfV6DMfK
	32DM1n/hxoga7Zl95jydi75qyeNNcrPxb8y3Wb6ZSc4ZnOdHmPaGfk9PQvMcWRAQ
	jlbvSFNl+ffSy3Mba3tNbOB4LVktOuQ915luix6M9Lr/io2+u/VEcZ0TeZwPR68f
	eB639YikvY67ztSG1FVpx6OUoKvRg9XgAvgwo2c+eV2LXzUUDFo0QQR+nqvHyiLg
	w/v4URjzR4keJ6O8YyjzAjQlkImBrIkAjrJSC2Ilb0bLMTYnW/Ha7HQ2kEViNfAF
	qipje3K9Qan20VVki8AoxuBWhbJ34dUbXeXP9NI97MMZaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn2a71b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:38:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81be6f05so1323551885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416295; x=1774021095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfoqBgtFBPOG18HFwuX3p4vU62ysi71nghWsY8TsAl8=;
        b=AR8pQkiKAv3n3DSVSmGk+jA5B1mLUIpqBuG9VSULSdj4zKOGAADXXluwRUV3BW9u9M
         JduvdV8hpTCEw0W1idXceKYSLZbXFqWGKIBHP+c0oMfFptKjG9Ke22sscrE7wbugorKp
         vx4mte5kpFsPHUkoZDyhrIISsSbx6C/o3Ijzi7Bq2r15ZTe5NPY5fd/YxN8nF0nVX4OQ
         llKk3d0jnTTy/qFD/LeXXapN5OgGDY8AS0apgyCNUK34WKXzI2aIM3mTu09NdBF1omGy
         buGSxB7dqYrFbZw1bNWr+G3RrK5AiKwBU+rLYxc3Wvbus97l5sHMQhxuV9hNSkHg5qGq
         zR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416295; x=1774021095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfoqBgtFBPOG18HFwuX3p4vU62ysi71nghWsY8TsAl8=;
        b=Lm8qkH8M1IVKaVxkR5p7KhRLITk2kQI01pO68sQEidcxXAfUE5MV92q5LtseV+1Mhl
         Kxus9lW4wzTeVcEbKaEdL41KFLDIiCkfHWOG83oB2n//Wy7nerYGiwYigaP+I51sMrtv
         P/cc9hX3NvScVrevzhdJlOERZ9ZfPiW3DPefDy8KfIB5w7NGrXRXBIn8ECsvnOkRO418
         OKOL4Xa9eQc+mU/yqiXqQG9aE6gzxjqP59hd/85tuFjW7lr3Wmi7Nw+Zaqhd1frQE/ob
         dN41rPHG7d8PtGVLQHr5ErxYx1PQA3gt9Tw08TCjMMBvsfGH23XCelM+EHipzmhTrv3i
         eIOA==
X-Forwarded-Encrypted: i=1; AJvYcCXU+P+bYxL0qSvdSg0zmCzUBtCeu9T1m7dgxcbu5I1OiSm616PmVPIaqD6rB53TY6//ZtRzYYZP8QC6z+pn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn5rUIgU9T0T7V+eIxWe5cQGpKexwsj3Gt+6Yoaps6yeNv3m+6
	j8iPA2q25TnugMGDZ+r2fPZurEuNellUaHfRQrlJQTFY5jK3GAo3vCqrbncCiMLxbJ566YUeVMr
	EQR/McaKumyrqEYLCEEFQnrZNgk7PSQT4++y2m4PnlmqbFJr6wfBu4V/us+lCecedYrWh
X-Gm-Gg: ATEYQzzhUvHtNL0XyHoxSOuWVT2Zn+cKqV+jwdyQUQB3DQiP653pAxSLm8odYRbH13j
	e1ukaCPzYXN8cSuQTAx3jzjifl/9R78/PhGYh3U3nUFf0V6JqxX3YZSMJuUTYkGe+NqC2V2vBMK
	W9jQoTiWnNItBc3Q3qO5suHvCtnBT2X3PWeWg1gsfPttbk5MtwpxRNmWydDID7yXmMoUwCwi3+3
	y+weySe/cpUHJgLi3cgyJOU5H8oLXyfPyEki90w7ykPD93xtFrhysAJOocSb1zudLtV4IKP/nC8
	QMZUX9fSlP8YC/vtfjn8CyPKHxqzBuQP0ya5GWzgDjVeeaWSgWOahd3xhNsaBAJMu51CVn1X+X7
	KxvY4zYrwuI1Da5FN91RX1lmqei/fl7gDMMpVKo0QZExBNant6QxDWNaxeCC41HQ7ExOcAL9+Nd
	dN3Z6YXe2hOOl9w8RyJ/2AbR+exIt3D+pNUgM=
X-Received: by 2002:a05:620a:44c3:b0:8a2:234a:17be with SMTP id af79cd13be357-8cdb5a1c13amr525244685a.7.1773416295423;
        Fri, 13 Mar 2026 08:38:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44c3:b0:8a2:234a:17be with SMTP id af79cd13be357-8cdb5a1c13amr525238085a.7.1773416294908;
        Fri, 13 Mar 2026 08:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b08sm1560840e87.53.2026.03.13.08.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:38:13 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:38:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 2/7] media: iris: switch to hardware mode after
 firmware boot
Message-ID: <6hz4rxfxhllulc5o47rwltcjdif3ocqvubfvsh2qnygmnacpyk@hirsszuwi3so>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 32jrd0rUNx9nPtSBwtDHflTZK70GhUjD
X-Proofpoint-GUID: 32jrd0rUNx9nPtSBwtDHflTZK70GhUjD
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b42f68 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dE1MpONsbtOZy1RxgbwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNSBTYWx0ZWRfX2BCtDSmY71TI
 MHtLv4drN+s95LHg8igpKdfeeE0RMUlLMK04mgaGLp0FL2Shq40/XC9vyhxFL1VZvwslQc6MXPE
 w6JU8ZoHLMsLEXQ+eOvbwETiGolc3j1jRa4kThUOVPtjWRCvs8HHFt0pLuQNw1V5gfVSaQWDhjT
 v1TkadKV6txb1Ap3VF/oY7dnP49fUl/76bR7N1TYw0gdbxzloYvPRzqC5/C5EwJILRzXzIHu1j4
 akqwU1Ubio41e0Oag2sQCA16wCRitqL1nRsNV9eBCKyFYJKj+VTP+7MoZNMO12ZY00TOEGfmx1q
 oyKEKCMEOejT6Vq8G4EqRMQ2iatAdZhe1dsBCCKJGMn6l75TZ1fxMz2tRCO6DDEOgRq4g8cWxbh
 zji3tQFbeb0A5Wvsal0ij/RImuZHigLZZtVsumWCOapWYe8tEXotIDbvQSWNejjTPxst4za0PJd
 6wgYl2895Ht8K01b6mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97554-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8256F2863D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 06:49:36PM +0530, Vikash Garodia wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off, keeping
> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
> carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> For vpu4, when GDSC is switched to HW mode, there is a need to perform
> the reset operation. Without reset, there are occassional issues of
> register corruption observed. Hence the vpu GDSC switch also involves
> the reset.
> 
> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
>  drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++++++++++----------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
>  7 files changed, 38 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

