Return-Path: <linux-arm-msm+bounces-111074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c0bmEUe0IGq26wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:09:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D0E63BC31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:09:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ItHNQFCV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KbpPk4Iq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111074-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111074-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C238301C6DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 23:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488C44DC527;
	Wed,  3 Jun 2026 23:09:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D84D90C8
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 23:09:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528195; cv=none; b=CqYw/gKHXdJcbOkbxMU/AsGDdKPGTBgr1A7+5UMFwkUxj98A2EAcvGaeK432laBUl4dlbRcUGbWtOz0jieIOUoqXud/16NnHUCZQhG5BRFNB7ui0yltD3oY/LxRiJGnK1qSV34m/QoJJIXQH8/HGjqckSsuP/vmUvZXuLqr6IGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528195; c=relaxed/simple;
	bh=M6PaO15AL1les95fs2M50qBWvkR1+aozFPKRVFNrcew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOw+bzmhNnZSyaHLCP2GnOzJNTb5H2kczlohmDugdE8K/wIx6IQVMc0+jLj+SehCX8IxV1+mjQgeTYXdhXcg1Swt7oUAg5BvIxTFnWm6BPWOMUVSBKCQw5j0prZmSE/jgB7Acn/YI9F4TfjvQsKK5Fx+uuuXQ+bCQ6nOW196FzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItHNQFCV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KbpPk4Iq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653N2tqa1476717
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 23:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VM7re91kygzVwItS+ciTwBT7
	UhZcfvCtwxBR7/9Rl6k=; b=ItHNQFCVXlcr3sWHBPrR/Jiyl4WNsdz75NYJwNVA
	u9QYRBhxqmnTBQ6F+9QHJfy37sA8aw1eh+flWW0DcMAOSAncb0ALAbwf2oEwVI1P
	QA6KKlRW2F7birwA6SoFimt7A3uGH4cy3TNDkc2u6n8pcpl0nE5G4aFicrt82W53
	xwnuayjo+lnqnsFItT+VXwZplDO+BbvxbXdnVLYbEXLtVZxdSA4mVkzaCLFzh2Wr
	0yed7dV3ssEW8dSjmHN5h8X+Y6Hvh5/HOMMoOOt0nM+u1LXpkSwQUJOO8aqtxcTa
	3G44XaKRDxj2JxBKRuPcYPc4UVmMz6FyfZltEbPOipE0fw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nt2ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:09:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59bf1a43cd9so2383869e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 16:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528192; x=1781132992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VM7re91kygzVwItS+ciTwBT7UhZcfvCtwxBR7/9Rl6k=;
        b=KbpPk4IqRievGLHjifRzgL9oCz557MC1dga+1BySGVA7NR5I2BRpLL+ALA2QNJcDQd
         Npkj9pow+DkH6ZtJWtKXWqGvrtCDaYEhIdCFpDxiLaGOdN64Hvou5sLBTcA9XGbZZHSw
         N2R7RZmDbGoqfxTB+rS7Nf1Vz4svwX9YWj0AUsAMNqno5g/gOF1to0Ex7wUVM0j/HDTi
         q1lCluBZXCklbViiG/2yQqdma0YoHD6PQnxq4fUtxf0PyD/R55ezHTgruhoIqfK66JVn
         FLm9OQ2M60QHdBKJyQYYCDs4BiDg8oZo8mOqtxusZJcauu12KRUnEqH6Q9UMF6dkrBie
         +3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528192; x=1781132992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM7re91kygzVwItS+ciTwBT7UhZcfvCtwxBR7/9Rl6k=;
        b=OhDOkBEdkb22SL41kYMtPyyvX2Zs3+MT/28LKJm7T7QgTS2AnYaCYmaoPslM8pUZPy
         VLMj51cq5+6oq2Q/Gdd8y4eCDb957r5EbSYRdq4V6rIIEQ1tiU20MOTJv1P7ufOxqLKe
         dRh2aGixZuOqlKnqXy34I6z/lOsSAJdJtYQotUSCseC1kZJaRZrPSE0KcbVdHEGdbgte
         ZpF3jRnuy7hHTr9Vpdn1Kiv/SYfgtSmwTuitaAJE02GdpLuF9+Im13U7gNnSqgKNR0Jr
         zIVnHWyuprMGzL0vYA7M2AAszrWk7Ghb23VD6dI2wMd+wwKxrniyZpZWydVV5qkD1YNv
         pTiw==
X-Forwarded-Encrypted: i=1; AFNElJ8MbQwm6ee3OEwNwgStg78ol5ry2ehwX5IOCblNztWgcfv4qeMCIMya2DUHnrN55SmYxg3qa4QaFuM/NVH7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb2BnSl13mMF7YOulQw9GQwSpgtMGsmbg7nrHLZNS9QJPTC28Y
	HAxEyIolSmH9rs3TLLQua4NW9LR8v7u+zMVcx2N7P+K0Dyo3IY9zx/5H7/+PpE7ABsmhp5Ui/5H
	t8SVjFmtFlQo4LEAizok9waujPsJ0YfkEkC5970RVyTwHoWqKKWO6x1XTAAv3MR5NVcm6
X-Gm-Gg: Acq92OFKXLhAt4LhENPlNkixOvCp0eAJerirh4M4TqO0WG10SXVvsCU6eGgr2erM/IM
	wEUKnVRXZPW0722U7oUq4PIcaSdz3Of0wmiiBoOv7HPiXFsFrO6dS2ZfxYSutz1TwUBB04mhqwX
	NxxB5uUHl27Y9BpmQC6UpLVNG4wbYu38lP+UJo6DqZ4SmQotEAqoyIqpERa4cGRD0rf14F6CFqK
	6rR3THFPj0VyBrRuI8hma79cXvNHWKNfT3yMTlLT8eW6MEYIn9OlvVQ/hibjrqoOfnb44B3UJ2d
	LBIEsPRqRZX/Nkx4pMm3QP0+SMxyzv23GgpxqY1pwrSNtpk+4Hw+FLfGzFADdhUWlzwCVFUvL3r
	WaVejTBPAswaRCG4dFlJhyBFtOKFY3Q3naLz1RtJqbIM80Q5cv8HsnsXLtOJynpd0m3uQKkw/am
	V1QSElvptv+ctJrR2auE5UQ34NxKmuSweKUxUDroc7dgByzw==
X-Received: by 2002:a05:6102:7:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6f5512f0f18mr606536137.19.1780528192135;
        Wed, 03 Jun 2026 16:09:52 -0700 (PDT)
X-Received: by 2002:a05:6102:7:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6f5512f0f18mr606503137.19.1780528191675;
        Wed, 03 Jun 2026 16:09:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9082b7sm883863e87.36.2026.06.03.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:09:50 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:09:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <bhq7pallav6wfni7l3xtalv3ophpoa7offdzdhfoqk3a6lj46e@ke34hu2ukig7>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-3-aeac1b94faa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-shikra-display-v1-3-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-GUID: cDv4JNAlp-lHFnvFBAXGpjd3CjLCduOS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfX91x5GQO0oXqp
 Qfwj8gjDQ9tiouwLGCIVvw4Koy02DUTSsyk3WG1uxgYmMZJsEvLMpyKSvNrP5+T4jImwX4+DaPX
 Ax4dlDiD4GULn5d8wsTsR+uIVdqw4VclFx/bU6vtBQLy45zoqGeYqkUh3MNcKUwWbSai68B5Akw
 kgejMhCZ9NaQ7B78NGmNgN2dHsXxOqLCgoNlZuX0NUsL4njazRk6jVLAuaw0bInxPRranPOjjLh
 2lHcIxoY0KlyCHhkY43rByLsif4cK/dXXOy3rHAkfX+e2ozeQ9B9LxndzJv7t5WVjFOU6BZ86zF
 C63P9ViO095IDqwiDPAPuY1av1iNzNexSxB/H2hScB6f0XAseWYKPpjbzh0kwn4xGjiELwEXTUj
 29YcMlnSwdvG8XsxdtzfnXFMc+u0JaU53hFtrUPe5vII6T/oVAisMuDvy4gyMlYyS+LhqqyzFTQ
 zpe+fksL37wdwKXz47g==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a20b441 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: cDv4JNAlp-lHFnvFBAXGpjd3CjLCduOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111074-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3D0E63BC31

On Wed, Jun 03, 2026 at 08:29:28PM +0530, Nabige Aala wrote:
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

