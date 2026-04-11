Return-Path: <linux-arm-msm+bounces-102819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLc3NtKh2mlM4ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:32:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4AB3E186A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BD9E30074F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C440E3090F5;
	Sat, 11 Apr 2026 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9amTR2h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bd7hmquY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873EB23BD1B
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775935895; cv=none; b=c+9sySBTomEP25GnHpbOIrxP7j5Km8hbNETcMVSfVqRO41TS7Qbg2XK0+J06VA0GaTlMARgWou5YyMLlJrBysFifuvR9Cs4mU1VbiLBMyke3tfv6bi7gNom/Ipp55W6CxG7NK9/CEk5GnYAPKxX2i5LvrFKPxB+67oCaeD2/260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775935895; c=relaxed/simple;
	bh=Wj8ZCdaOFf/Kr3OdybIZNDS7n+GOdWkWtIpcJXw1pfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cI6T37ahEDjH80F7/7kG8oXaNZ2I4F4LCi5iQSQ4DBbKORgUybNhpy8UkRZ8b7u6JgLRf1FQKKfs8l3SJEz92CHJbmu/naEUKcZJ1nyidqzJYHVxBjPo6rP4MkBe6aqnzkXiILqHHhYEjizgRh3E0teNyRhsspcd0a8iSLUJtvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9amTR2h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bd7hmquY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43QDp621302
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6jGq1cep9dDOqvyGq6eOZiEY
	7tjRsV3zKEwANXCL77Q=; b=J9amTR2hddKzv6jc7d0DH/YQer/bCrR2bOGJCcjv
	C19gaQP2oYatzCk3jqcTd1p+L3lBXBMhtCuJaSWgBtt4W5dec/axPfhoDApauU2e
	PkDY1w5aNoFx++4QiPjcNvG2nsltRKRgBfBspclRK+HzWrMwvGruTWqZEctvX7+j
	/sNORKkB6A+Lfratdz2YAKPMhnePeqs5XL2gQhiH8yTrAKnWeDeiWVTDieYlA28B
	9t0xj+e4QjgGInVj4TqD44Qe+cZbRqr3DiIHH0sdmgWyWhS4ct12mvCm+0xGjMVs
	wF8o/FIFP61yPyKDpXzYJHUCjn0hDqcO+vZvc9l3DCGxfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfs9rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:31:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b6f869676so59442601cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775935893; x=1776540693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6jGq1cep9dDOqvyGq6eOZiEY7tjRsV3zKEwANXCL77Q=;
        b=bd7hmquYMDfrOz+RgdKKQFRcHVjcerK6m4RDhc1fVmxrk1lQfpNvcx6UhYL5yZBTZ+
         2aKdBemXu9kgTZrCJO07ZN/QVpjAHqxtaUsupJawT/n+qa7exsg7Jq+33Y99/gfWgU24
         mmBN3o12B+K7sQ+8GunhEq2vPb9WgYtsKP8EnHFDnwOjnPjkFKrg8P4vHis28tYbnoDR
         YOI4i4HnaQ9wO7P5NvqyafrIco7iESWkFgfIkvfAJPImw5M/CW5y5Q9z3L4ngzVUIV7Y
         Fd4B/fEc+t7rurgMQ8Y9WiLnKxmNh8XIv8MFwPE+cADYdtTzeBBW5KT0XIOHchhLdhhj
         NHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775935893; x=1776540693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jGq1cep9dDOqvyGq6eOZiEY7tjRsV3zKEwANXCL77Q=;
        b=YfWLzicwpm7tv6BtmE8IIN4Gb00g0cbASiDZm9Hlh+ThV6TDZNUcWH2qvXKD8r7PGd
         XjevfpJp0kf4wvuP4kRYGwzhTD+BzYqDeuwsT9vDmZ+CK2myv6YroXdGwCaR0HqUkZHK
         kanKXTAt0zuRn0o3GZc964EyGx5kMATb2jVqSMtNKf+lKK7FbUMwtrYdgvFu8z1tfCZu
         YdB06SCmFc14oHgmQvSzKyzTZMDQvBpAuRokMLaaR1r9Tqz3QJ8XYVcdzJPqtp9cpub6
         RhSV78GL8CYSGC3+OLKxoluqQ1x64EmEKv2jrzSi2cF0zlMjWQdu8b69R1jBiWEg6v4i
         VLmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVABKEZgGLTse4JBTvKzIKmBV2JAFTAK+19F0JU+2yQ2m+Pwd5rXHiOzzkInV662HtQZpQ82NZ/e6ySAkJT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Kx/xv85Z+2eCFeUaMgRaxAZUVOn4OHLMzsh00DEGAlfrvtVk
	VM10aHUOFImMSq/QtVAHUuQq2cu9j0QNa8L4HJN/z7GvvNlOOCPo6E1cyl6CK0kpxtmNXCt1TYg
	W903ATa/3ZJuYeJmsssh0FaobosBkq6s2Fk5xtavxqGaunULKykMg9j9evgK+Z9urwrxZ
X-Gm-Gg: AeBDiesd0dTx61cMPnJfcNnK+Sus8E2znd/QkxqnghyzBNd3pftd7mFzYBcqDqUiV7t
	sgjZscO6fnRtbK3mU4KSKtKpJmjQ0LYTHzbPbO8vl0ZEZ983kYtsoh8YGPZuqHf5iw7PNcjl1GW
	1Cb5A/kSm0L01zIHGqThctUgXOObLyMf17TZ6l0x1CmOoLkHysD7WRvPQXdqTw4/lSl6dARTwBE
	y2olasz9xfV2UblfCBvjoFCgQsZM8tOIJz7AmhBL1spp6YOVzYyAmyl71spOOpbjxTLW2FPVzbZ
	D+LkOnwQ8aL+cRzhwe7yst3Ny3X4TChD1qI+zd8sVG3k4e6scN+u7p3KGhw5qWd9+Ut8Jh/59nc
	E4oIRdJF8SYCauwzd8jBpR3MpMGNo6RnM7eZxdbtoDi23slveKLh7e74dyZENoccS9ZI5elnntO
	cwI1C+f0gHGuZDmkArhTkysC7dId1e60ZKwXA=
X-Received: by 2002:ac8:5f54:0:b0:509:2858:3c63 with SMTP id d75a77b69052e-50dd5add6c7mr120692991cf.23.1775935892862;
        Sat, 11 Apr 2026 12:31:32 -0700 (PDT)
X-Received: by 2002:ac8:5f54:0:b0:509:2858:3c63 with SMTP id d75a77b69052e-50dd5add6c7mr120692591cf.23.1775935892426;
        Sat, 11 Apr 2026 12:31:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeef3620sm1572151e87.57.2026.04.11.12.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 12:31:31 -0700 (PDT)
Date: Sat, 11 Apr 2026 22:31:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 32/39] drm/msm/dpu: initialize encoders per stream for
 DP MST
Message-ID: <jkzpb7qb3uqr4f2zs3tkerxsciwtsx645zmktuhxrbni36auwn@hpeqy7jqhc4l>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-32-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-32-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-GUID: zP-fwwVn6w1oVfDepl0BvGoNldJfzVgm
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69daa195 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VXUz8XiNEC3FGRHiCkkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: zP-fwwVn6w1oVfDepl0BvGoNldJfzVgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE3NSBTYWx0ZWRfX8TkS1cfZM03e
 2YEboX6yhHxoSCuEk86dg4K1xHUVoNYYwfjWwNHZWJtPj2RjwvtPF3g8X5hFHASXvRsFPnDaOZz
 H4tmoVIt/igMZuIe9NMC3rhyXsruwINMIXbyuhqhpFxElSoOLB5LueVBnDNoXlw2UoFtZ76A3Ip
 oIajx5mn5qEst5o3WaFfnRSBMZjvVpiQiyc8ilwmi5rJDv7zls57bqnsvjRkSMw4t2PwvT8KTYP
 4nnU0nsKLlYXDyGdRZrBdl+WjESCYQfnti8gQKGE02r/n6ZzPiwJ+CBltDV/BAYY8bKfK8E0fAv
 9KVPEsunxNI3SWWWi2x+RaV9/mDXfBeTU2SbPen67YSiKsc3KDiy2Rf4GUiBWhzoM/qM9LYcnGH
 ixUbtS35P652gr8+tfHBALL/kTMGUmYpftnzXnvhlcfh1gq5JmvalHvhEeMy41dFhZZC5Qc41/h
 +WBbearyPG5cLVF1f5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110175
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102819-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA4AB3E186A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:07PM +0800, Yongxing Mou wrote:
> Simply initialize MST encoders for MST-capable DP controllers, and
> introduce msm_dp_get_mst_max_stream to query MST streams.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++++-
>  drivers/gpu/drm/msm/msm_drv.h           |  7 ++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

